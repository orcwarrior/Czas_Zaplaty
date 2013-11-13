//******************************************************************
// FILE CONTAINS:
// -Functions that emulating fog color override + disabling sky
// *FX_FogZoneProcessingTrigger (called by trigger)
//******************************************************************
// Moved from FX_Funcs.d
// -but varibles stays with same prefix "FX" (too much to change for my lazy ass ;-P)


var int FX_WOOD; // (-10,0) ^ (0,10) -> TRANSISTIONS IN/OUT

var int FX_StoredFogNear_Value;
var int FX_StoredFogFar_Value;
var int FX_StoredFogColorPacked;//from master state RRRGGGBBB; 128,65,234 = 128,65,234;


var int FX_StoredFog_State0_ColorPacked;
var int FX_StoredFog_State1_ColorPacked;
var int FX_StoredFog_State2_ColorPacked;
//affecting night fog colour could make ugly things happen
// var int FX_StoredFog_State3_ColorPacked;
// var int FX_StoredFog_State4_ColorPacked;
// var int FX_StoredFog_State5_ColorPacked;
var int FX_StoredFog_State6_ColorPacked;
var int FX_StoredFog_State7_ColorPacked;
var int FX_StoredFog_Override_ColorPacked;
var int FX_StoredSun0_Alpha;
var int FX_StoredSun1_Alpha;
var int FX_StoredMoon0_Alpha;
var int FX_StoredMoon1_Alpha;
var int FX_Storedlay0Alpha_State0;
var int FX_Storedlay0Alpha_State1;
var int FX_Storedlay0Alpha_State2;
var int FX_Storedlay0Alpha_State6;
var int FX_Storedlay0Alpha_State7;

var int FX_Storedlay1Alpha_State0;
var int FX_Storedlay1Alpha_State1;
var int FX_Storedlay1Alpha_State2;
var int FX_Storedlay1Alpha_State6;
var int FX_Storedlay1Alpha_State7;


var int FX_ActiveFog_Destination_FogNear;
var int FX_ActiveFog_Destination_FogFar;
var int FX_ActiveFog_Destination_ColorPacked;
var int FX_LastActiveFog;
//per 0.125
var int FX_TransitionToFogDone;// zreal 0.0 - 1.0
var int FX_TransitionToFogDone_last;// zreal 0.0 - 1.0
//per frame
var int FX_FrameTransitionToFogDone;// zreal 0.0 - 1.0
var int FX_FrameTransitionToFogDone_last;// zreal 0.0 - 1.0


var int FX_TransitionOverrideColor;// Bool (range +1, so range % 10 == 1 or 3
var int FX_TransitionDisableSky;// Bool (range +2, so range % 10 == 2 or 3
var int FX_TransitionWoodFX;// Bool (range % 10 = 4, example 4004


// return value in range (in)0.0->0.5->0.0(out) to 0.0->1.0->0.0
func int FX_Get1DWeight(var int min,var int max,var int p)
{
	var int diff; var int ppos;
	
	//skip if p is out of range:
	if(gf(p,min) && gf(p,max)) || (lf(p,min) && lf(p,max))
	{ return 0; };
	
	diff = subf(max,min);//calc. difference of points/ length of "Line"

	ppos = subf(min,p);//calc position of "p" (have to be absolute)
	ppos = absf(ppos);
	if(gf(ppos,diff))//ppos>diff
	{ ppos = diff;};

	ppos = divf(ppos,diff);
	if(gf(ppos,1056964608))//if >0.5 its "outing" so substract 0.5 (0.5 is a max)
	{
		ppos = subf(1056964608,subf(ppos,1056964608));	
	};
	ppos = mulf(ppos,1080033280);//p * 4 so 0.5 => 2

	
	return ppos;
};
//Calculates how much percents Camera "dive" in zone.
//Returns float value range 0.0.-1.0
func int FX_CalculateCameraZoneImmersion(var int zoneptr)
{
	var int px; var int py; var int pz;
	var int hlp; var int ret;
	var int camvob; var int zoneInnerRangePerc;
	if(zoneptr==0)
	{ return 0;};
	//GetInnerRangePerc of zCZoneFog:
	zoneInnerRangePerc = MEM_ReadInt(zoneptr+264);
	
	//GetCamera
	camvob = MEM_InstToPtr(MEM_CAMERA); 
	camvob = Mem_ReadInt(camvob+2308);
	//Get X weight (0-1)
	px = FX_Get1DWeight(MEM_ReadInt(zoneptr+124),MEM_ReadInt(zoneptr+136),MEM_ReadInt(camvob+72));
	px = divf(px,zoneInnerRangePerc);

	
	//Get Y weight (0-1)	
	py = FX_Get1DWeight(MEM_ReadInt(zoneptr+128),MEM_ReadInt(zoneptr+140),MEM_ReadInt(camvob+88));
	py = divf(py,zoneInnerRangePerc);

	
	//Get Z weight (0-1)	
	pz = FX_Get1DWeight(MEM_ReadInt(zoneptr+132),MEM_ReadInt(zoneptr+144),MEM_ReadInt(camvob+104));
	pz = divf(pz,zoneInnerRangePerc);

	
	//Calculate Immersion (formula may need corections)
	hlp = mulf(px,py);
	hlp = mulf(hlp,pz);
	ret = mulf(hlp,zoneInnerRangePerc);
	ret = mulf(ret,zoneInnerRangePerc);
	//	ret = mulf(ret,zoneInnerRangePerc);
	printdebug_s_F("ret:",ret);
	
	//Clamp:
	if (gf (ret,FLOATEINS))//ret>1.0; ret = 1.0
	{
		return FLOATEINS;	
	}
	else if (lf(ret,1028443341))//ret<0.05
	{
		return 0;	
	}
	else
	{
		return ret;
	};
};

func void FX_Init()
{
	return;
	//Init not needed now it basing on SkyController_Ptr that is inited every time before this function starts	
	
	if(!HeroInOutWorld()){return;};	
	if(SkyController_Ptr==0){SkyController_Ptr=MEM_InstGetOffset(MEM_SkyController);};	
	
};

func void FX_SetWoodFX()
{
	//set all states polycolor, etc.	
	
};

func void FX_DisableWoodFX()
{
	//disable all states polycolor, etc.	
	
};
//
func int FX_GetActiveZFogZone()
{
	var int label; var int i; var int ptr; var int array_end;
	var int oCWorld_zoneActibeList;
	oCWorld_zoneActibeList = MEM_World.zoneActiveList_array;
	if(oCWorld_zoneActibeList==0){return 0;};
	MEM_InitLabels (); 
	i = 0;
	//Where array ends:
	array_end = MEM_World.zoneActiveList_numInArray;
	
	label = MEM_StackPos.position;
	//Read zCZone...
	ptr = MEM_ReadInt(oCWorld_zoneActibeList+i);
	printdebug_s_i("..iteration:",i);
	printdebug_s_i("..ptr:",ptr);
	
	if (i>=array_end*4)
	|| (ptr<100000)
	{ return 0;}

	else
	{
		i+=4;
		if(MEM_ReadInt(ptr) == zCZoneZFog_vtbl)//vtbl is ZCFogZone vtbl!
		{
			return ptr;	
		};
		MEM_StackPos.position = label; 		
	};
	
	return 0;//no active fog zone	
};


func void FX_StoreCurrentSkyPresetVaribles()
{
	var int statePTR;
	FX_StoredFogNear_Value = MEM_ReadInt(SkyController_Ptr+1388);
	FX_StoredFogFar_Value  = MEM_ReadInt(SkyController_Ptr+1392);
	FX_StoredSun0_Alpha    =  MEM_ReadInt(SkyController_Ptr+1516);
	FX_StoredSun1_Alpha    =  MEM_ReadInt(SkyController_Ptr+1532);
	FX_StoredMoon0_Alpha    =  MEM_ReadInt(SkyController_Ptr+1580);
	FX_StoredMoon1_Alpha    =  MEM_ReadInt(SkyController_Ptr+1596);

	FX_StoredFogColorPacked =  truncf(MEM_ReadInt(SkyController_Ptr+144))*1000000; //R
	FX_StoredFogColorPacked += truncf(MEM_ReadInt(SkyController_Ptr+148))*1000; //G
	FX_StoredFogColorPacked += truncf(MEM_ReadInt(SkyController_Ptr+152)); //B
	
	//Override Color
	statePTR = MEM_ReadInt(SkyController_Ptr+1364);
	FX_StoredFog_Override_ColorPacked =  truncf(MEM_ReadInt(statePTR))*1000000;//R
	FX_StoredFog_Override_ColorPacked += truncf(MEM_ReadInt(statePTR+4))*1000; //G
	FX_StoredFog_Override_ColorPacked += truncf(MEM_ReadInt(statePTR+8)); 	 //B
	
	//State[0]
	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	statePTR = MEM_ReadInt(statePTR);//ZCSkyState[0]
	FX_StoredFog_State0_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	FX_StoredFog_State0_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	FX_StoredFog_State0_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B
	
	FX_Storedlay0Alpha_State0 = MEM_ReadInt(statePTR+112); 
	FX_Storedlay1Alpha_State0 = MEM_ReadInt(statePTR+176); 
	
	//State[1]
	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	statePTR = MEM_ReadInt(statePTR+4);//ZCSkyState[1]
	FX_StoredFog_State1_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	FX_StoredFog_State1_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	FX_StoredFog_State1_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B 			
	
	FX_Storedlay0Alpha_State1 = MEM_ReadInt(statePTR+112);
	FX_Storedlay1Alpha_State1 = MEM_ReadInt(statePTR+176);
	
	//State[2]
	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	statePTR = MEM_ReadInt(statePTR+8);//ZCSkyState[2]
	FX_StoredFog_State2_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	FX_StoredFog_State2_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	FX_StoredFog_State2_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B			
	
	FX_Storedlay0Alpha_State2 = MEM_ReadInt(statePTR+112);
	FX_Storedlay1Alpha_State2 = MEM_ReadInt(statePTR+176); 
	
	//DONT CHANGE NIGHT	
	// 	//State[3]
	// 	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	// 	statePTR = MEM_ReadInt(statePTR+12);//ZCSkyState[3]
	// 	FX_StoredFog_State3_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	// 	FX_StoredFog_State3_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	// 	FX_StoredFog_State3_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B		
	// 	
	// 	//State[4]
	// 	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	// 	statePTR = MEM_ReadInt(statePTR+16);//ZCSkyState[4]
	// 	FX_StoredFog_State4_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	// 	FX_StoredFog_State4_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	// 	FX_StoredFog_State4_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B	
	// 	
	// 	//State[5]
	// 	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	// 	statePTR = MEM_ReadInt(statePTR+20);//ZCSkyState[5]
	// 	FX_StoredFog_State5_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	// 	FX_StoredFog_State5_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	// 	FX_StoredFog_State5_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B	 	
	
	//State[6]
	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	statePTR = MEM_ReadInt(statePTR+24);//ZCSkyState[6]
	FX_StoredFog_State6_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	FX_StoredFog_State6_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	FX_StoredFog_State6_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B	  	
	
	FX_Storedlay0Alpha_State6 = MEM_ReadInt(statePTR+112);
	FX_Storedlay1Alpha_State6 = MEM_ReadInt(statePTR+176);
	
	//State[7]
	statePTR = MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
	statePTR = MEM_ReadInt(statePTR+28);//ZCSkyState[7]
	FX_StoredFog_State7_ColorPacked =  truncf(MEM_ReadInt(statePTR+16))*1000000;//R
	FX_StoredFog_State7_ColorPacked += truncf(MEM_ReadInt(statePTR+20))*1000; //G
	FX_StoredFog_State7_ColorPacked += truncf(MEM_ReadInt(statePTR+24)); 	 //B	 	
	
	FX_Storedlay0Alpha_State7 = MEM_ReadInt(statePTR+112);
	FX_Storedlay1Alpha_State7 = MEM_ReadInt(statePTR+176); 
	
};

func void FX_StoreBackupPresetVaribles() //Called everytime SkyPreset changed by TRANS_STEP
{
	FX_StoreCurrentSkyPresetVaribles();
};



const int STATE_OVERRIDE = 32;
func void FX_TransitionSetStateFogColor(var int state,var int r,var int g,var int b,var int lay0a,var int lay1a)
{
	var int statePTR; var int hlp;
	//To.. values
	var int r_t; var int g_t; var int b_t;
	//smaller values
	var int r_sm; var int g_sm; var int b_sm;
	//difference in values
	var int r_d; var int g_d; var int b_d;
	//-------------------------------
	// Calculate R G B color
	if(r!=(-1)){ //if r=-1 skip transition of colors
		//color transist only every poison_trigger
		r_t = (FX_ActiveFog_Destination_ColorPacked/1000);// - (FX_ActiveFog_Destination_ColorPacked%1000);
		b_t = r_t%1000;
		g_t = FX_ActiveFog_Destination_ColorPacked%1000; 	
		r_t = r_t/1000;

		//  	printdebug_S_I("state:",state);
		//  
		//  	printdebug_S_I("BASE R:",r);
		//  	printdebug_S_I("BASE g:",g);
		//  	printdebug_S_I("BASE b:",b);
		//  	
		//  	printdebug_S_I("DEST RGB:",FX_ActiveFog_Destination_ColorPacked);
		//  	printdebug_S_I("DEST R:",r_t);
		//  	printdebug_S_I("DEST g:",g_t);
		//  	printdebug_S_I("DEST b:",b_t);
		r = mkf(r);
		g = mkf(g);
		b = mkf(b);
		
		r_t = mkf(r_t);
		g_t = mkf(g_t);
		b_t = mkf(b_t);
		
		if(gf(r_t,r))//r_t<r
		{r_sm = r_t;   }
		else{ r_sm = r;};
		if(gf(g_t,g))//g_t<g
		{g_sm = g_t;   }
		else{ g_sm = g;};
		if(gf(b_t,b))//b_t<b
		{b_sm = b_t;   }
		else{ b_sm = b;};
		r_d = subf(r_t,r); 
		g_d = subf(g_t,g); 
		b_d = subf(b_t,b);
		
		//---------
		// red 	 
		if(r==r_sm)//100->150
		{
			r = mulf(r_d,FX_TransitionToFogDone);//50*(0.4) = 20
			r = addf(r,r_sm);//20 + 100 = 120, at 40%
		}
		else//150->100
		{
			r_t = mulf(r_d,FX_TransitionToFogDone);//-50*(0.4) = -20
			r = addf(r,r_t);//150 + (-20) = 130, at 40%
		};
		//---------
		// green 	 
		if(g==g_sm)
		{
			g = mulf(g_d,FX_TransitionToFogDone);
			g = addf(g,g_sm);
		}
		else
		{
			g_t = mulf(g_d,FX_TransitionToFogDone);
			g = addf(g,g_t);
		};	
		//---------
		// blue 
		if(b==b_sm)
		{
			b = mulf(b_d,FX_TransitionToFogDone);
			b = addf(b,b_sm);
		}
		else
		{
			b_t = mulf(b_d,FX_TransitionToFogDone);
			b = addf(b,b_t);
		};
		
		r = truncf(r);
		g = truncf(g);
		b = truncf(b);
		r = mkf(r);
		g = mkf(g);	
		b = mkf(b);	
		
		if(state==STATE_OVERRIDE)
		{
			printdebug(concatstrings("set R:",Float32ToString(r)));
			printdebug(concatstrings("set g:",Float32ToString(g)));
			printdebug(concatstrings("set b:",Float32ToString(b)));
		};
		
		//-------------------------------
		// Apply Fog Color
		
		if(state != STATE_OVERRIDE)
		{
			statePTR = 	MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
			statePTR = 	MEM_ReadInt(statePTR+4*state);//ZCSkyState[1]
		}
		else
		{
			statePTR = MEM_ReadInt(SkyController_Ptr+1364);
			MEM_WriteInt(statePTR+0,r);
			MEM_WriteInt(statePTR+4,g);
			MEM_WriteInt(statePTR+8,b); 
			return;
		};	
		
		MEM_WriteInt(statePTR+16,r);
		MEM_WriteInt(statePTR+20,g);
		MEM_WriteInt(statePTR+24,b); 
	};//end of setting fog color
	
	//-------------------------------
	// Update sky-layers alpha	
	if(lay0a!=-1){//don't update layer alphas
		//layer udpate every frame
		
		//non-state dependent:
		if(!FX_TransitionDisableSky) {return;};

		statePTR = 	MEM_ReadInt(SkyController_Ptr+316);//ZCSkyState Array
		statePTR = 	MEM_ReadInt(statePTR+4*state);//ZCSkyState[state]	
		
		
		//Calculate lay0 & lay1 alpha
		// 	printdebug(concatstrings("BASE_lay0a:",Float32ToString(lay0a)));
		// 	printdebug(concatstrings("BASE_lay1a:",Float32ToString(lay1a)));
		if(lay0a)//wasnt full transparent
		{
			hlp = mulf(lay0a,FX_TransitionToFogDone);
			lay0a = subf(lay0a,hlp);
			MEM_WriteInt(statePTR+112,lay0a);
		};
		if(lay1a)//wasnt full transparent
		{
			hlp = mulf(lay1a,FX_TransitionToFogDone);
			lay1a = subf(lay1a,hlp);
			MEM_WriteInt(statePTR+176,lay1a);
		};		
		//	printdebug(concatstrings("lay0a:",Float32ToString(lay0a)));
		//	printdebug(concatstrings("lay1a:",Float32ToString(lay1a)));
		

		


	};

};
//Only Tex alpha
func void FX_TransitionDoFrameStep()
{
	if(!FX_TransitionToFogDone_Last)||(!FX_LastActiveFog) { return; };

	var int hlp;
	var int l0a; var int l1a;
	
	FX_FrameTransitionToFogDone = FX_CalculateCameraZoneImmersion(FX_LastActiveFog); 

	// 	
	// 	if(lf(1,FX_FrameTransitionToFogDone))
	// 	{FX_FrameTransitionToFogDone = FLOATEINS;};

	//	transtrunc = truncf(FX_FrameTransitionToFogDone);
	
	printdebug(concatstrings("FX_FrameTransitionToFogDone =",Float32ToString(FX_FrameTransitionToFogDone)));
	printdebug_s_i("SkyController_Ptr=",SkyController_Ptr);
	printdebug_s_i("SkyController_vtbl=",MEM_ReadInt(SkyController_Ptr));
	if(FX_FrameTransitionToFogDone_last==FX_FrameTransitionToFogDone)
	{ return; };	
	
	//state0
	l0a = FX_Storedlay0Alpha_State0; l1a = FX_Storedlay1Alpha_State0;
	FX_TransitionSetStateFogColor(0,-1,-1,-1,l0a,l1a);		
	
	//state1
	l0a = FX_Storedlay0Alpha_State1; l1a = FX_Storedlay1Alpha_State1;
	FX_TransitionSetStateFogColor(1,-1,-1,-1,l0a,l1a);	
	
	//state2
	l0a = FX_Storedlay0Alpha_State2; l1a = FX_Storedlay1Alpha_State2;
	FX_TransitionSetStateFogColor(02,-1,-1,-1,l0a,l1a);		
	
	//state6
	l0a = FX_Storedlay0Alpha_state6; l1a = FX_Storedlay1Alpha_state6;
	FX_TransitionSetStateFogColor(6,-1,-1,-1,l0a,l1a);	
	
	//state2
	l0a = FX_Storedlay0Alpha_State7; l1a = FX_Storedlay1Alpha_State7;
	FX_TransitionSetStateFogColor(7,-1,-1,-1,l0a,l1a);	
	
	
	FX_FrameTransitionToFogDone_last = FX_FrameTransitionToFogDone;
};
func void FX_TransitionDoStep()
{
	//todo: tidy varibles
	var int hlp;
	var int r; var int g; var int b; var int l0a; var int l1a;
	printdebug_s_i("FX_LastActiveFog: ",FX_LastActiveFog);
	printdebug_s_i("FX_LastActiveFog.value: ",MEM_ReadInt(FX_LastActiveFog));
	//transistion calculater per frame so it not needed
	FX_TransitionToFogDone = FX_CalculateCameraZoneImmersion(FX_LastActiveFog); 
	printdebug_s_i("FX_TransitionToFogDone(post): ",FX_TransitionToFogDone);
	
	if(FX_TransitionToFogDone_last==FX_TransitionToFogDone)
	{ return; };

	if(FX_TransitionDisableSky)
	{
		hlp = subf(floateins,FX_TransitionToFogDone);
		//hlp = roundf(hlp);
		//Upgrade SunAlpha
		//sun alpha1
		MEM_WriteInt(SkyController_Ptr+1516,mulf(hlp,FX_StoredSun0_Alpha));	
		//sun alpha2
		MEM_WriteInt(SkyController_Ptr+1532,mulf(hlp,FX_StoredSun1_Alpha));	
		//moon alpha1
		MEM_WriteInt(SkyController_Ptr+1580,mulf(hlp,FX_StoredMoon0_Alpha));	
		//moon alpha2
		MEM_WriteInt(SkyController_Ptr+1596,mulf(hlp,FX_StoredMoon1_Alpha));		
	};
	
	//-------
	//WoodFX
	if(FX_TransitionWoodFX)
	{
		if(gf(FX_TransitionToFogDone,fracf(3,4)))//FX_TransitionToFogDone<0.75
		{//set WoodFX
			FX_SetWoodFX();	
		}
		else if (lf(FX_TransitionToFogDone,fracf(1,2)))
		{//disable WoodFX
			FX_DisableWoodFX();	
		};
	};
	
	FX_TransitionToFogDone_last = FX_TransitionToFogDone;//has to be done here (SEE RETURNS BELLOW?)
	
	if(!FX_TransitionOverrideColor) { return; };
	//overridecolor
	
	//state0
	r = (FX_StoredFog_State0_ColorPacked/1000);// - (FX_StoredFog_State0_ColorPacked%1000);
	b = r%1000;
	b = FX_StoredFog_State0_ColorPacked%1000; 
	r = r/1000;
	FX_TransitionSetStateFogColor(0,r,g,b,-1,-1);
	
	//state1
	r = (FX_StoredFog_state1_ColorPacked/1000);// - (FX_StoredFog_state1_ColorPacked%1000);
	g = r%1000;
	b = FX_StoredFog_state1_ColorPacked%1000; 
	r = r/1000;
	FX_TransitionSetStateFogColor(1,r,g,b,-1,-1);
	
	//state2
	r = (FX_StoredFog_state2_ColorPacked/1000);// - (FX_StoredFog_state2_ColorPacked%1000);
	g = r%1000;
	b = FX_StoredFog_state2_ColorPacked%1000; 
	r = r/1000;
	FX_TransitionSetStateFogColor(2,r,g,b,-1,-1);
	
	// 	//state3
	// 	r = (FX_StoredFog_state3_ColorPacked/1000);// - (FX_StoredFog_state3_ColorPacked%1000);
	// 	g = r%1000;
	// 	b = FX_StoredFog_state3_ColorPacked%1000; 
	// 	r = r/1000;
	// 	FX_TransitionSetStateFogColor(3,r,g,b); 	
	// 	
	// 	//state4
	// 	r = (FX_StoredFog_state4_ColorPacked/1000);// - (FX_StoredFog_state4_ColorPacked%1000);
	// 	g = r%1000;
	// 	b = FX_StoredFog_state4_ColorPacked%1000; 
	// 	r = r/1000;
	// 	FX_TransitionSetStateFogColor(4,r,g,b); 	
	// 	
	// 	//state5
	// 	r = (FX_StoredFog_state5_ColorPacked/1000);// - (FX_StoredFog_state5_ColorPacked%1000);
	// 	g = r%1000;
	// 	b = FX_StoredFog_state5_ColorPacked%1000; 
	// 	r = r/1000;
	// 	FX_TransitionSetStateFogColor(5,r,g,b); 		
	// 	
	//state6
	r = (FX_StoredFog_state6_ColorPacked/1000);
	g = r%1000;
	b = FX_StoredFog_state6_ColorPacked%1000; 
	r = r/1000;
	FX_TransitionSetStateFogColor(6,r,g,b,-1,-1);	
	
	//state7
	r = (FX_StoredFog_state7_ColorPacked/1000);// - (FX_StoredFog_state7_ColorPacked%1000);
	g = r%1000;
	b = FX_StoredFog_state7_ColorPacked%1000; 
	r = r/1000;
	FX_TransitionSetStateFogColor(7,r,g,b,-1,-1);
	
	//override
	r = (FX_StoredFog_Override_ColorPacked/1000);// - (FX_StoredFog_Override_ColorPacked%1000);
	g = r%1000;
	b = FX_StoredFog_Override_ColorPacked%1000; 
	r = r/1000;	
	FX_TransitionSetStateFogColor(STATE_OVERRIDE,r,g,b,-1,-1); 	
	
	
	//bgcolor (for indoor fog (wood etc.)
	// 	r = (FX_StoredFog_Override_ColorPacked/1000);// - (FX_StoredFog_Override_ColorPacked%1000);
	// 	g = r%1000;
	// 	b = FX_StoredFog_Override_ColorPacked%1000; 
	// 	r = r/1000;	
	// 	
	var int sky_indoor;
	sky_indoor = MEM_World.skyControlerIndoor;
	MEM_WriteInt(sky_indoor+44,RGBAToZColor (r,g,b,155)); 

	
};


//Function Called by Poison Trigger (per 0.125s)
func void FX_FogZoneProcessingTrigger()
{
	var int activefog;
	printdebug("..FX_GetActiveZFogZone");
	activefog = FX_GetActiveZFogZone();
	printdebug("DONE ..FX_GetActiveZFogZone");
	//	print(inttostring(activefog));
	//	printdebug_s_i("HeroInOutWorld:",HeroInOutWorld());
	if(activefog)
	{
		FX_TransitionToFogDone = FX_CalculateCameraZoneImmersion(activefog); 
		
		if(FX_TransitionToFogDone)//camera is in some fog
		{
			printdebug("..activefog>0");		
			//FX_Init();	
			if(!HeroInOutWorld()){return;};//break before disaster ;-P
			if(FX_LastActiveFog==0)//fog wasn't activated last time;
			{
				printdebug("..FX_LastActiveFog==0");
				FX_ActiveFog_Destination_FogNear = MEM_ReadInt(activefog+260);//fog range center
				FX_ActiveFog_Destination_FogFar = subf(FX_StoredFogFar_Value,FX_StoredFogNear_Value);
				FX_ActiveFog_Destination_FogFar = addF(FX_ActiveFog_Destination_FogFar,FX_ActiveFog_Destination_FogNear);
				FX_ActiveFog_Destination_ColorPacked = MEM_ReadInt(activefog+268);
				FX_ActiveFog_Destination_ColorPacked = zColor_r(FX_ActiveFog_Destination_ColorPacked)*1000000 + zColor_b(FX_ActiveFog_Destination_ColorPacked)*1000 + zColor_g(FX_ActiveFog_Destination_ColorPacked)*1;
				var int flags;
				flags = truncf(FX_ActiveFog_Destination_FogNear);
				flags = flags % 10;
				//p//rint(concatstrings("FLAGS:",inttostring(flags)));
				if(flags==1)||(flags==3)||(flags==4)
				{
					FX_TransitionOverrideColor = TRUE;
				}
				else { FX_TransitionOverrideColor = FALSE; };
				if(flags==2)||(flags==3)||(flags==4)
				{
					FX_TransitionDisableSky = TRUE;
				}
				else { FX_TransitionDisableSky = FALSE; };
				if(flags==4)
				{
					//p//rint("FOG IS WOODFX");
					FX_TransitionWoodFX = TRUE;
					FX_TransitionDisableSky = TRUE;
					FX_TransitionOverrideColor = TRUE;				
				}
				else { FX_TransitionWoodFX = FALSE; };
				FX_LastActiveFog = activefog;
				
			};
			// 		if(FX_StoredFogNear_Value != MEM_ReadInt(SkyController_Ptr+1388))&&(FX_ActiveFog_Destination_FogNear != MEM_ReadInt(SkyController_Ptr+1388))//sky fog near changed, transition
			// 		{
			printdebug("..FX_TransitionDoStep");		
			FX_TransitionDoStep();
			//		};		
		};
	}
	else//activefog==0 what about transition out???
	{
		//FX_Init();
		if(!HeroInOutWorld()){return;};//break before disaster ;-P		
		if(FX_LastActiveFog)//last time some fog was active
		{
			//for disabling fx
			FX_TransitionDoStep();
			
			printdebug("..FX_LastActiveFog>0");		
			printdebug("FogProcessing>>FX_StoreCurrentSkyPresetVaribles");
			MEM_WriteInt(SkyController_Ptr+1388,FX_StoredFogNear_Value);
			MEM_WriteInt(SkyController_Ptr+1392,FX_StoredFogFar_Value);
			// reset var's
			FX_ActiveFog_Destination_FogNear = 0;
			FX_ActiveFog_Destination_FogFar  = 0;
			FX_ActiveFog_Destination_ColorPacked = 0;
			FX_LastActiveFog = 0;
			

		}
		else if(FX_LastActiveFog==0)//transition or store after transition
		{
			printdebug("FogProcessing>>FX_StoreCurrentSkyPresetVaribles");
			
			//FX_LastActiveFog = -1;//dont update again... !!! USE THIS ADD Change of theese waribles when setting SkyPreset	
		};
	};
};

