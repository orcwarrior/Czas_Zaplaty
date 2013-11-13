const int FLAG_INSTANT				= 1<<1;	//rain values will be set Immediately, else rain will be put in "queue"
											//If !FLAG_INSTANT - rain will be set after planned rain will end
const int FLAG_DONTRENDERRAINCLOUDS = 1<<2;//Don't render skyrainclouds (on low weight they could look strange) -> It work in lil different way
const int FLAG_DONTCHANGEFOG 		= 1<<4;//Rain don't affect fog (reason: see up);  right now don't have idea howto do it :D
const int FLAG_SKYPRESETRAIN 		= 1<<6;//Rain for hiding sky textures change...

var int SkyPreset_UnInteruptableRainActive;

const int Default_RainFog = 1161527296;//3000

const string  Default_RainTEX = "SKYRAINCLOUDS.TGA";//
const string  First_RainTex   = "SKYDAY_LAYER0_A0.TGA";//herre u can add custom rain clouds
//Planned rain (or already started)
var int CustomRainFX_Weight;//zFloat (0.0..1.0)
var int CustomRainFX_StartTime;//zFloat(SkyTime) if -1 == reseted (other time're same)
var int CustomRainFX_EndTime;//zFloat(SkyTime)
var int CustomRainFX_DiffFromBegin;//zFloat(SkyTime) (sTimeAdditional)
var int CustomRainFX_FLAGS;
//Queue rain 1
var int CustomRainFXQueue_Weight;//zFloat (0.0..1.0)
var int CustomRainFXQueue_StartTime;//zFloat(SkyTime)
var int CustomRainFXQueue_EndTime;//zFloat(SkyTime)
var int CustomRainFXQueue_DiffFromBegin;//zFloat(SkyTime) (sTimeAdditional)
var int CustomRainFXQueue_FLAGS;
var int CustomRainFXQueue_enumTEX;

var int CustomRainFX_LastState0;//UpdateClouds...
//clouds_tex = 0; nochanges
//clouds_tex = 1; default
//clouds_tex = 2; First_RainTex
//..etc..
var int CustomRainFX_RotatedAlready;

    var zString SkyRainClouds;
    var zString ModiAlpha01;




func void SkyController_UpdatePointer()
{
	 SkyController_Ptr = MEM_World.skyControlerOutdoor;
};

//Check if skycontrollerOutdoor is active   
FUNC int HeroInOutWorld()
{
//	printdebug_s_i_s_i("?? ",MEM_World.skyControlerOutdoor,"==",MEM_World.activeSkyControler);
	if(MEM_World.skyControlerOutdoor==MEM_World.activeSkyControler)&&(MEM_World.activeSkyControler>0)//skycontroller_out
	{
		if(MEM_ReadInt(MEM_World.activeSkyControler)==zCSkyController_Outdoor_vtbl)
		{
			printdebug("HeroOutworld!");
			return true; 
	 	};
	};

	return false;	
};    
 
   
    
func int TimeToSkyTime(var int h, var int m)
{
	const int minuteToSkyTime = 976544030;//0.00069
	var int skytime; var int min;
	
	//
	if(h<12)
	{
	skytime = fracf(h,24);	
	skytime = addf(skytime,fracf(1,2));//+0.5	
	}
	else
	{
	skytime = fracf(h-12,24);
	};
	//minutes:
 	min = mulf(mkf(m),minuteToSkyTime);
 	skytime = addf(skytime,min);
    return skytime;
};


//Check if some rain is in queue (good to check it before starting new rainFX, to make sure there is none in queue)
func int CustomRainFX_RainInQueue()
{
	if(CustomRainFXQueue_StartTime)
	{
		return 1;
	}
	else
	{
		return 0;	
	};
};
// *****************************************
// Handle Clouds
//
// *Apply proper texture to skyrainclouds
//  layer.
// *****************************************
func void CustomRainFX_HandleClouds(var string clouds_tex,var int flags)
{
		//Custom clouds texture:
		if(STR_Len(clouds_tex)>0)//-blank string won't change used texture
		{
			var int texptr;
 			CALL_zStringPtrParam(clouds_tex);
 			CALL__cdecl (zCTexture__LoadSingle_offset);
 			texptr = CALL_RetValAsPtr();			
			MEM_WriteInt(SkyController_Ptr+1496,texptr);

			
			var int rainpoly; var int rainmat;
			rainpoly = MEM_ReadInt(SkyController_Ptr+1476);//SkyRainClouds.Poly(*zCPolygon)
			//[zCPoly+0x18] = *zCmaterial (In G1 ofcourse)
			rainmat = MEM_ReadInt(rainpoly+24);
	 		CALL_zStringPtrParam(clouds_tex);
			CALL__thiscall(rainmat,zCMaterial__SetTex_offset);
		};
		
		if(flags&FLAG_DONTRENDERRAINCLOUDS)//&&(SkyPreset_UnInteruptableRainActive)//second statement is bugfix, To be honest idk how to hell it's needed
		{
			var string used_tex;
			
			//Set state0 or state1 clouds tex to rain clouds tex:
			texptr = MEM_ReadInt(SkyController_Ptr+308);//state0
			used_tex = MEM_ReadString(texptr+156);//layer1 texture
 			if(STR_Len(used_tex)<1){
 			texptr = MEM_ReadInt(SkyController_Ptr+312);//state1
 			used_tex = MEM_ReadString(texptr+156);	
 			};
			printdebug(concatstrings("CustomRainFX: Usedtex:",used_tex));
			var int alphapoly; var int alphamat;
			alphapoly = MEM_ReadInt(SkyController_Ptr+1476);
			//[zCPoly+0x18] = *zCmaterial (In G1 ofcourse)
			alphamat = MEM_ReadInt(alphapoly+24);
	 		CALL_zStringPtrParam(used_tex);
			CALL__thiscall(alphamat,zCMaterial__SetTex_offset);	
			
			//Synchronize offset of skyrain layer with skylayer1
			//???

		};		
	
};

// *****************************************
// Update Clouds
//
// *If new skystate have else texture
//  apply it
// *****************************************
func void CustomRainFX_UpdateClouds()
{

		if(CustomRainFX_FLAGS&FLAG_DONTRENDERRAINCLOUDS)
		{
			if(CustomRainFX_LastState0 == MEM_ReadInt(SkyController_Ptr+308))
			{ return; };
			var string used_tex; var int texptr;
			
			//Set state0 or state1 clouds tex to rain clouds tex:
			CustomRainFX_LastState0 = MEM_ReadInt(SkyController_Ptr+308);//state0
			used_tex = MEM_ReadString(CustomRainFX_LastState0+156);//layer1 texture
 			if(STR_Len(used_tex)<1){
 			texptr = MEM_ReadInt(SkyController_Ptr+312);//state1
 			used_tex = MEM_ReadString(texptr+156);	
 			};
			printdebug(concatstrings("CustomRainFX: [NEW]Usedtex:",used_tex));
			var int alphapoly; var int alphamat;
			alphapoly = MEM_ReadInt(SkyController_Ptr+1476);
			//[zCPoly+0x18] = *zCmaterial (In G1 ofcourse)
			alphamat = MEM_ReadInt(alphapoly+24);
	 		CALL_zStringPtrParam(used_tex);
			CALL__thiscall(alphamat,zCMaterial__SetTex_offset);	
			
			//Synchronize offset of skyrain layer with skylayer1
			//???

		};		
	
};

func int CustomRainFX_TexStrToEnumTex(var string str)
{
	if(Hlp_StrCmp(str,First_RainTex))
	{	return 2;	}
	else
	{	return 1;	};
};

func string CustomRainFX_EnumTEXToTEXStr(var int i)
{
	if(i==2)
	{	return First_RainTex;	}
	else
	{	return Default_RainTEX;	};
};



// ******************************
// W A R N I N G ! ! !
// ******************************
//
// starth/endh is time when 
// Rain will have deserved weight,
// effect will start ealier!!!
//
// ******************************

func void CustomRainFX_InitRainSkyTime(var int start,var int stop,var int weight,var string clouds_tex,var int flags)
{
	//If skypreset is fading into new one, don't make it
	//able to disable transistion rain!!!
	if(flags&FLAG_INSTANT)&&(SkyPreset_UnInteruptableRainActive)
	{
		return;	
	};
	if(flags&FLAG_SKYPRESETRAIN)
	{
			printdebug("CustomRainFX: Rain inited by change of sky preset.");		
		 	SkyPreset_UnInteruptableRainActive = true;
	};
	
	const int sTimeOfRaining = 1058642330;//0.6 [fadein (20%) -> rain (60%) -> fadeout(20%)
	const int sTimeOfFading = 1053609165;//0.4 [fadein (20%) -> rain (60%) -> fadeout(20%)
	var int sTimeStart; var int sTimeEnd;
	var int sTimeDur; var int sTimeToDestWeight;
	var int sTimeFadeToWeight; var int sTimeAdditional;
	
	var int sTimeStartGreaterThanEnd;//f.e. 0.69->0.42; needed for bugfix;
	
	sTimeStart = start;
	sTimeEnd = stop;
	if(flags&FLAG_SKYPRESETRAIN==0)
	{   //Rain Time when changing skypreset should be straight

		//bugfix: for correction of calculated times (see below)
		if(gf(sTimeStart,sTimeEnd)){sTimeStartGreaterThanEnd = TRUE;};
		
		sTimeDur = subf(sTimeEnd,sTimeStart);// 0.5-0.4=0.1 - duration of rain (at deserved weight of fx)
		if(lf(sTimeDur,0))//f.e.:6:00-18:00
		{ sTimeDur = addf(absf(sTimeDur),fracf(1,2));};
		
		//calculate time needed to fade from 0 to $weight
		sTimeFadeToWeight = subf(mkf(1),weight); //weight = 0.5, so 1-0.5=0.5
		sTimeFadeToWeight = mulf(weight,sTimeOfFading); //0.5*0.4=0.10
		
		// calculate additional time needed to have
		// rainFX in deserved weight:
		sTimeAdditional = sTimeOfRaining; //60% of whole time is rain
		sTimeAdditional = addf(sTimeAdditional,sTimeFadeToWeight);//0.6+0.1=0.9(if weight=0.5), weight++ <=> sTimeAdditional--
		sTimeAdditional = divf(sTimeFadeToWeight,sTimeAdditional);//0.1/0.9 = 0.(1)
		sTimeAdditional = mulf(sTimeDur,sTimeAdditional);
		
		//time start - time additional => so when starth:startm comes, effect will have desired weight
		sTimeStart = subf(sTimeStart,sTimeAdditional);
		if lf(sTimeStart,0) { addf(mkf(1),sTimeStart); }; //for proper skytime substracting
		//sTimeEnd + time additional
		sTimeEnd = addf(sTimeEnd,sTimeAdditional);	
		if gf(sTimeEnd,mkf(1)) { subf(sTimeEnd,mkf(1)); }; //for proper skytime adding
		//both have to be additionaly handled
		
		//bugfix: for correction of calculated times (see above too)
		if(lf(sTimeStart,sTimeEnd)&&(sTimeStartGreaterThanEnd))
		{//after calculations time need correction
			sTimeEnd = subf(sTimeStart,fracf(1,10));
		}
		else if	(gf(sTimeStart,sTimeEnd)&&(!sTimeStartGreaterThanEnd))
		{
			sTimeStart = subf(sTimeEnd,fracf(1,10));
		};
	
	};	

	printdebug_s_f_s_f("CustomRainFX: Start:",sTimeStart,", End:",sTimeEnd);
	
	//Set Rain Immediately
	if(flags & FLAG_INSTANT)
	{
		printdebug("CustomRainFX: Rain got INSTANT flag!");		
	    //Set Varibles:
	    CustomRainFX_Weight    = Weight;
	    CustomRainFX_StartTime = sTimeStart;
	    CustomRainFX_EndTime   = sTimeEnd;
	    CustomRainFX_FLAGS     = flags;
		CustomRainFX_DiffFromBegin = sTimeAdditional;	
		
		//Set rain in zCSkyController_Outdoor:
		MEM_WriteInt(SkyController_Ptr+1656,sTimeStart);
		MEM_WriteInt(SkyController_Ptr+1660,sTimeEnd);
		
	}
	else
	{
		printdebug("CustomRainFX: Pushing Rain In queue...");		
	    //Set Varibles:
	    CustomRainFXQueue_Weight    = Weight;
	    CustomRainFXQueue_StartTime = sTimeStart;
	    CustomRainFXQueue_EndTime   = sTimeEnd;
	    CustomRainFXQueue_FLAGS     = flags;
		CustomRainFXQueue_DiffFromBegin = sTimeAdditional;	
		CustomRainFXQueue_enumTEX = CustomRainFX_TexStrToEnumTex(clouds_tex);
		return;
		//rest have to be done when planned rain is free
	};
		CustomRainFX_HandleClouds(clouds_tex,flags);
	
};

//For "normal human" use:
func void CustomRainFX_InitRain(var int starth,var int startm,var int stoph,var int stopm,var int weight,var string clouds_tex,var int flags)
{
	var int sTimeStart; var int sTimeEnd;
	
	sTimeStart = TimeToSkyTime(starth,startm);
	sTimeEnd = TimeToSkyTime(stoph,stopm);

	CustomRainFX_InitRainSkyTime(sTimeStart,sTimeEnd,weight,clouds_tex,flags);
	
};


func void CustomRainFX_PushQueue()
{
	if(CustomRainFXQueue_Weight)//Queue 1 active!
	{
		//Push Queue on Planned Rain
	    CustomRainFX_Weight    	   = CustomRainFXQueue_Weight;   
	    CustomRainFX_StartTime 	   = CustomRainFXQueue_StartTime;
	    CustomRainFX_EndTime   	   = CustomRainFXQueue_EndTime;  
	    CustomRainFX_FLAGS     	   = CustomRainFXQueue_FLAGS;    
		CustomRainFX_DiffFromBegin = CustomRainFXQueue_DiffFromBegin;	
		//Set rain in zCSkyController_Outdoor:
		MEM_WriteInt(SkyController_Ptr+1656,CustomRainFX_StartTime);
		MEM_WriteInt(SkyController_Ptr+1660,CustomRainFX_EndTime);
			
		//Clouds: (string stored as enumeration)
		var string tex;
		tex = CustomRainFX_EnumTEXToTEXStr(CustomRainFXQueue_enumTEX);
		CustomRainFX_HandleClouds(tex,CustomRainFXQueue_FLAGS);
		
		//Clear Queue
	    CustomRainFXQueue_Weight    	   = 0;
	    CustomRainFXQueue_StartTime 	   = 0;
	    CustomRainFXQueue_EndTime   	   = 0;
	    CustomRainFXQueue_FLAGS     	   = 0;
		CustomRainFXQueue_DiffFromBegin    = 0;		
	};

};

//Prevent of changing rain times by engine
func void CustomRainFX_RainGuard(var int time)
{
	//hope engine won't be that rude to change rain
	//during it
	if(lf(time,CustomRainFX_StartTime)&&gf(time,CustomRainFX_EndTime))//Rain still not begined
	||(SkyPreset_UnInteruptableRainActive)//skypreset rain active
	{
		MEM_WriteInt(SkyController_Ptr+1656,CustomRainFX_StartTime);
		MEM_WriteInt(SkyController_Ptr+1660,CustomRainFX_EndTime  );
	};
};

func void CustomRainFX_Checker()
{
	var int skyTime; var int baseStopTime;
	var int sTimeDur;var int baseStartTime;
	if(!SkyController_Ptr){return;};//break if SkyController_Ptr isn't inited still..
	skytime = MEM_ReadInt(SkyController_Ptr+108);
	
	//SkyPreset Transistion UNITERUPTABLE RAIN ACTIVE!!
 	if(SkyPreset_UnInteruptableRainActive)
 	{
	 	if(gf(skytime,CustomRainFX_EndTime))
	 	{
 		SkyPreset_UnInteruptableRainActive = FALSE;
		};
 		return; //dont do nothing else! All needed was done in that block	
 	};

	if(gef(skytime,CustomRainFX_StartTime))//Rain beginned
	{

		baseStopTime = subf(CustomRainFX_EndTime,CustomRainFX_DiffFromBegin);
		if lf(baseStopTime,0) { addf(mkf(1),baseStopTime); }; //for proper skytime substracting
		
		// GetDuration(base)
		baseStartTime = addf(CustomRainFX_StartTime,CustomRainFX_DiffFromBegin);
		if gf(baseStartTime,mkf(1)) { subf(baseStartTime,mkf(1)); }; //for proper skytime adding
			
		sTimeDur = subf(CustomRainFX_EndTime,baseStartTime);//calc difference

		if(gf(skytime,baseStopTime))//skytime>base.endTime - so its time to ROTATE!
		&&(!CustomRainFX_RotatedAlready)&&(lf(skytime,CustomRainFX_EndTime))
		{
		printdebug("ROTATE...");	
		//Set inversed start/end time till this time weight was fade in, but now it has
		//to start fading out
		MEM_WriteInt(SkyController_Ptr+1656,baseStartTime);
		MEM_WriteInt(SkyController_Ptr+1660,addf(skytime,CustomRainFX_DiffFromBegin));		
 		printdebug_s_f_s_f("start:",MEM_ReadInt(SkyController_Ptr+1656),", end:",MEM_ReadInt(SkyController_Ptr+1660));
 		printdebug_s_f_s_f("baseStartTime:",baseStartTime,", baseStopTime:",baseStopTime);
 		printdebug_s_f_s_f("CustomRainFX_StartTime:",CustomRainFX_StartTime,", CustomRainFX_EndTime:",CustomRainFX_EndTime);
 		printdebug_s_f("timesky:",MEM_ReadInt(SkyController_Ptr+108));
		CustomRainFX_RotatedAlready = true;
		}
		else if(gef(skytime,baseStartTime))&&(lf(skytime,baseStopTime)) // It not reached base.endTime so contiune keep weight in proper value
		{
		MEM_WriteInt(SkyController_Ptr+1656,subf(skytime,CustomRainFX_DiffFromBegin));
		MEM_WriteInt(SkyController_Ptr+1660,addf(skytime,sTimeDur));					
		};
		CustomRainFX_UpdateClouds();

	};
	if(gf(skytime,CustomRainFX_EndTime))&&(CustomRainFX_RotatedAlready)//Rain ended
	{
		printdebug("ENDOFFX...");	
		MEM_WriteInt(SkyController_Ptr+1656,0);
		MEM_WriteInt(SkyController_Ptr+1660,0);	
		//MEM_WriteInt(SkyController_Ptr+1496,Stored_RainTEX);
		
		CustomRainFX_RotatedAlready = false;
		
		CustomRainFX_PushQueue();
		
	};
	
};