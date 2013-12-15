//----------------
// NOTE:
//----------------
// Whole system need some small bugfixes
// but rite now they arent needed
// (fade out, etc)

const int FX_BLEND_NORMAL = 2;
const int FX_BLEND_ADD = 3;
const int FX_BLEND_MUL = 5;
const int FX_BLEND_SCREEN = 6;

var int FX_BlendFrame_LastFrame;//fe: 20 ..X_A0,X_A1..,X_A20
var int FX_BlendFrame_Now;//fe.10, when == lastframe; set to 0
var int FX_Blend_FramesPerImage;//fe. 3 at 30fps = 10 image changes per second
var int FX_Blend_FramesToNextImage;//fe. 3,2,1,0-> next image 3,2...
var int FX_Blend_BlendInAlphaPerFrame;
var int FX_Blend_AlphaEnd;
var int FX_Blend_State;//0-off;1-on;2-off->on; 3-on->off

var int FX_Blend_TexturesArray;//ID, array(int)
const int FX_BLEND_MAXANIFRAMES = 120;

var int FX_Blend_BGColor;//ID, array(int)
var int FX_Blend_CameraPTR;//MEM_Camera.cinemascopeEnable*
var int FX_Blend_ViewPTR;//View.screenblend*
var int FX_Blend_Timer;//Seconds to fire FX_StopBlend


func void FX_InitScreenBlend(var string name,var int lastframe)
{
	if (!MEM_World.skyControlerOutdoor)//Globals don't inited
	{
		MEM_InitGlobalInst();
	};

	//Create Array with pointer to zCTextures
	FX_Blend_TexturesArray = Arr_Create();
	printdebug(concatstrings("FX_Blend_ArrID: ",inttostring(FX_Blend_TexturesArray)));
	Arr_SetLength (FX_Blend_TexturesArray,FX_BLEND_MAXANIFRAMES);			
	

	var int ptr; var string tga;
	//loop
	var int i; var int label;
	i=0;
	MEM_InitLabels (); 
	label = MEM_StackPos.position; 
	tga = concatstrings(name,inttostring(i));
	tga = concatstrings(tga,".TGA");
	ptr = zCTexture_GetPointer(tga);
	Arr_SetValue	(FX_Blend_TexturesArray,i,ptr);
	i+=1;
	if (i <=  lastframe) {      
		MEM_StackPos.position = label; 
		printdebug("LAST I:");
		printdebug(inttostring(i));
		
	};	
	//end loop
};

func void FX_StartBlend(var string name,var int lastframe, var int alpha, var int alphablend,var int BlendInAlphaPerFrame,var int FramesPerImage,var int duration,var int bgcol)
{
	FX_InitScreenBlend(name,lastframe);
	
	FX_Blend_FramesPerImage =  FramesPerImage;
	FX_Blend_FramesToNextImage=FX_Blend_FramesPerImage;
	FX_BlendFrame_Now=0;//always start with A0
	FX_Blend_State = 2;
	FX_Blend_BlendInAlphaPerFrame = BlendInAlphaPerFrame;
	FX_Blend_AlphaEnd = alpha;
	FX_BlendFrame_LastFrame  = lastframe;
	FX_Blend_Timer = duration;//if zero, it need to be stopped manualy
	
	
	MEM_GAME.array_view_visible[0]=1;
	MEM_GAME.array_view_enabled[0]=1;

	FX_Blend_CameraPTR = MEM_InstGetOffset(MEM_CAMERA);
	FX_Blend_CameraPTR = FX_Blend_CameraPTR+2240;
	MEM_WriteInt(FX_Blend_CameraPTR,1);//enable	
	MEM_WriteInt(FX_Blend_CameraPTR+4,bgcol);//color to bgcol	
	FX_Blend_BGColor=bgcol;	
	FX_Blend_ViewPTR = MEM_GAME.array_view[0];

	//TERE IS 2 LAYERS: CAMERA screen BG -> THIS SCREEN
	MEM_WriteInt(FX_Blend_ViewPTR+28,alphablend);//blendfunc
	//MEM_WriteInt(ptr+32,RGBAToZColor (254,254,254,255));
	MEM_WriteInt(FX_Blend_ViewPTR+36,0+BlendInAlphaPerFrame);//ALPHA
	
	MEM_WriteInt(FX_Blend_ViewPTR+60,Arr_GetValue	(FX_Blend_TexturesArray,FX_BlendFrame_Now));
	FX_Blend_FramesToNextImage-=1;
	if(FX_Blend_FramesToNextImage==0)
	{
		if(FX_BlendFrame_Now+1>FX_BlendFrame_LastFrame)
		{
			FX_BlendFrame_Now=0;	
		}
		else
		{
			FX_BlendFrame_Now+=1;
		};
		FX_Blend_FramesToNextImage=FX_Blend_FramesPerImage;	
	};
	// CU i the trigger ;-)
};


func void FX_StopScreenBlend()
{
	FX_Blend_State = 3;

	// CU i the trigger ;-)
};

func void I_TriggerScreenBlend()
{
	// TIDY UP THAT SHIT!!!
	
	
	var int v_alpha;
	if(FX_Blend_State==2)//fade to this screenblend
	{
		//camera fix
		MEM_WriteInt(FX_Blend_CameraPTR,1);//enable	
		MEM_WriteInt(FX_Blend_CameraPTR+4,FX_Blend_BGColor);	
		
		printdebug("FX_Blend_FramesToNextImage");
		printdebug(inttostring(FX_Blend_FramesToNextImage));
		printdebug(concatstrings("A",inttostring(FX_BlendFrame_Now))); 
		v_alpha = MEM_ReadInt(FX_Blend_ViewPTR+36);		
		
		//Change Image?
		FX_Blend_FramesToNextImage-=1;
		if(FX_Blend_FramesToNextImage<0)//YES
		{
			if(FX_BlendFrame_Now+1>FX_BlendFrame_LastFrame)
			{
				FX_BlendFrame_Now=0;	
			}
			else
			{
				FX_BlendFrame_Now+=1;
			};
			FX_Blend_FramesToNextImage=FX_Blend_FramesPerImage;	
			MEM_WriteInt(FX_Blend_ViewPTR+60,Arr_GetValue	(FX_Blend_TexturesArray,FX_BlendFrame_Now));	
		};	
		
		//Increase Alpha:
		if(v_alpha+FX_Blend_BlendInAlphaPerFrame >= 255)
		{
			printdebug("fade in, end ON!");
			MEM_WriteInt(FX_Blend_ViewPTR+36,255);//ALPHA
			FX_Blend_State=1;
		}
		else
		{
			MEM_WriteInt(FX_Blend_ViewPTR+36,v_alpha+FX_Blend_BlendInAlphaPerFrame);//ALPHA			
		};			
	}
	else if(FX_Blend_State==3)//fade to opanque
	{
		//camera fix
		MEM_WriteInt(FX_Blend_CameraPTR,1);//enable	
		MEM_WriteInt(FX_Blend_CameraPTR+4,FX_Blend_BGColor);
		
		//Change Image?
		FX_Blend_FramesToNextImage-=1;
		if(FX_Blend_FramesToNextImage<0)//YES
		{
			if(FX_BlendFrame_Now+1>FX_BlendFrame_LastFrame)
			{
				FX_BlendFrame_Now=0;	
			}
			else
			{
				FX_BlendFrame_Now+=1;
			};
			FX_Blend_FramesToNextImage=FX_Blend_FramesPerImage;	
			MEM_WriteInt(FX_Blend_ViewPTR+60,Arr_GetValue	(FX_Blend_TexturesArray,FX_BlendFrame_Now));	
		};	
		
		//Decrease Alpha:
		v_alpha = MEM_ReadInt(FX_Blend_ViewPTR+36);
		if(v_alpha-FX_Blend_BlendInAlphaPerFrame <= 0 )
		{
			MEM_WriteInt(FX_Blend_ViewPTR+36,0);//ALPHA
			FX_Blend_State=0;
		}
		else
		{
			MEM_WriteInt(FX_Blend_ViewPTR+36,v_alpha-FX_Blend_BlendInAlphaPerFrame);//ALPHA			
		};			
		
	}
	else if(FX_Blend_State==1)
	{
		//camera fix
		MEM_WriteInt(FX_Blend_CameraPTR,1);//enable	
		MEM_WriteInt(FX_Blend_CameraPTR+4,FX_Blend_BGColor);
		
		printdebug("FX_Blend_FramesToNextImage");
		printdebug(inttostring(FX_Blend_FramesToNextImage));
		printdebug(concatstrings("A",inttostring(FX_BlendFrame_Now)));
		printdebug(inttostring(Arr_GetValue	(FX_Blend_TexturesArray,FX_BlendFrame_Now)));
		
		//Change Image?
		FX_Blend_FramesToNextImage-=1;
		if(FX_Blend_FramesToNextImage<0)//YES
		{
			if(FX_BlendFrame_Now+1>FX_BlendFrame_LastFrame)
			{
				FX_BlendFrame_Now=0;	
			}
			else
			{
				FX_BlendFrame_Now+=1;
			};
			FX_Blend_FramesToNextImage=FX_Blend_FramesPerImage;	
			MEM_WriteInt(FX_Blend_ViewPTR+60,Arr_GetValue	(FX_Blend_TexturesArray,FX_BlendFrame_Now));
		};			
	};
	
};

func void FX_ScreenBlendTimer()//Add to trigger per second
{
	if(FX_Blend_Timer)&&(FX_Blend_State==1)
	{
		FX_Blend_Timer-=1;
		//p//rint(inttostring(FX_Blend_Timer));
		if(FX_Blend_Timer==0)
		{
			FX_StopScreenBlend();	
		};
	};
};

var int FX_Fov_FramesLeft;
var int FX_Fov_FramesStart;
var int FX_Fov_H_Ptr;
var int FX_Fov_HStep;//zfloat
var int FX_Fov_VStep;//zfloat
var int FX_Fov_HBegin;//zfloat
var int FX_Fov_VBegin;//zfloat
var int FX_Fov_DontbackToDefault;
var int FX_Fov_BackToDefaultDone;
var int FX_Fov_LastH;//H to keep
var int FX_Fov_LastV;//V to keep
const int FX_Fov_HDefault = 1070141403;//+2300
const int FX_Fov_VDefault = 1066847204;//+2304

var int FX_FovDreamFX_Enabled;//if true start next Morph after one end


func void FX_FovMorph(var int H,var int V,var int frames,var int dontbackToDefault)
{
	var int tmp;
	// Ork: Potrzebna jest jakaś globalna inicjalizacja tego
	// inaczej po save-load to nie może działać ;/. Tylko gdze to inicjalizować? hmm...
	//FX_InitFov();
	if(dontbackToDefault==2)//backing 2 def. now
	{
		FX_Fov_BackToDefaultDone=TRUE;	
	}
	else
	{
		FX_Fov_BackToDefaultDone=FALSE;	
	};
	
	//Horonizontal
	tmp = MEM_ReadInt(FX_FOV_H_Ptr);
	if(FX_Fov_DontbackToDefault)&&(FX_Fov_LastH){ tmp = FX_Fov_LastH; };//IF IT'S DREAM FX - DO IT SMOOTH!
	FX_Fov_HBegin = tmp;
	printdebug("--ended at--:");
	printdebug(FLOAT32TOSTRING(tmp));
	FX_Fov_HStep = subf(H,tmp);
	FX_Fov_HStep = divf(FX_Fov_HStep,mkf(frames));
	
	//Veritical
	tmp = MEM_ReadInt(FX_FOV_H_Ptr+4);	
	if(FX_Fov_DontbackToDefault)&&(FX_Fov_LastV){ tmp = FX_Fov_LastV; };
	FX_Fov_VBegin = tmp;
	printdebug(FLOAT32TOSTRING(tmp));
	printdebug("--new should be--:");		
	printdebug(FLOAT32TOSTRING(H));	
	printdebug(FLOAT32TOSTRING(V));	
	FX_Fov_VStep = subf(V,tmp);
	FX_Fov_VStep = divf(FX_Fov_VStep,mkf(frames));
	
	FX_Fov_FramesLeft = frames;
	FX_Fov_FramesStart = frames;
	FX_Fov_LastH = H;
	FX_Fov_LastV = V;
	FX_Fov_DontbackToDefault = dontbackToDefault;
	
};
func void FX_FovDreamFX()
{
	FX_FovDreamFX_Enabled=true;
	
};
func void I_TriggerFovMorph()
{
	var int tmp; var int tmp2; var int tmp3;
	if(FX_Fov_FramesLeft)
	{	// Ork: Piekne sa te magic numbers :D jakbym chociaz jakis ofsetów nie mógł doklepać, no cóz...
		tmp2 = FX_Fov_FramesStart-FX_Fov_FramesLeft;
		tmp2 = mulf(FX_Fov_HStep,mkf(tmp2));
		MEM_WriteInt(FX_Fov_H_Ptr,addf(FX_Fov_HBegin,tmp2));
		tmp3 = addf(tmp,tmp2);
		tmp = MEM_ReadInt(FX_FOV_h_Ptr+4);
		tmp2 = FX_Fov_FramesStart-FX_Fov_FramesLeft;
		tmp2 = mulf(FX_Fov_VStep,mkf(tmp2));	
		MEM_WriteInt(FX_Fov_H_Ptr+4,addf(FX_Fov_VBegin,tmp2));
		
		FX_Fov_FramesLeft-=1;
		if(FX_Fov_FramesLeft%100==0)
		{		
		};
		// Ork: Odkomentowanie tego pomoże przywrocic kamere do defaultowego stanu:
		// Pytanie: Dlaczego było zakomentowane?
		if(FX_Fov_FramesLeft==0)&&(!FX_Fov_BackToDefaultDone)//gently back to default, but check if it wasnt done last time!
		{
		 	FX_FovMorph(FX_Fov_HDefault,FX_Fov_VDefault,30,2);		
		};

	}
	else if(FX_FovDreamFX_Enabled)
	{
		//start another one	
		var int add; var int fovH;
		add = hlp_Random(2);
		tmp = Hlp_Random(50);
		tmp = mkf(tmp);
		tmp2 = divf(tmp,mkf(100));//var (70)/100
		tmp3 = divf(mkf(3),mkf(2));//base 3/2
		if(add==1)
		{//add
			tmp = addf(tmp3,tmp2);//1 + (3/2)	
		}
		else
		{///sub
			tmp = subf(tmp3,tmp2);//1 - (3/2)
		};
		fovH = tmp;
		
		tmp = Hlp_Random(50);
		tmp = mkf(tmp);
		tmp2 = divf(tmp,mkf(120));//var (100)/120
		tmp3 = divf(mkf(7),mkf(6));//base 7/6
		if(add==1)
		{//add
			tmp = addf(tmp3,tmp2);//7/6 + (5/6)	
		}
		else
		{///sub
			tmp = subf(tmp3,tmp2);//7/6 - (5/6)
		};
		if(FX_Fov_H_Ptr)
		{
			MEM_WriteInt(FX_Fov_H_Ptr,FX_Fov_LastH);
			MEM_WriteInt(FX_Fov_H_Ptr+4,FX_Fov_LastV); 	
		};				
		FX_FovMorph(fovH,tmp,200+Hlp_Random(60),1);		
	}
	else if(FX_Fov_DontbackToDefault)
	{
		// Ork: To powoduje crash przy ładowaniu save'a #3 od mrdragogothic FX_Fov_H_Ptr
		// pewnie nie jest reinicjowany w odpowiedniej kolejności lub podobnie...
		MEM_WriteInt(FX_Fov_H_Ptr,FX_Fov_LastH);
		MEM_WriteInt(FX_Fov_H_Ptr+4,FX_Fov_LastV); 						
	};
	
};

const int OR_Mine_FogRange = 6500;
func void FX_RebelMine()
{
	if(WORLD_CURRENT == world_or_deep)
	{
		var int sky_indoor;
		sky_indoor = MEM_World.skyControlerIndoor;
		MEM_WriteInt(sky_indoor+44,RGBAToZColor (30,23,21,155)); 
		MEM_WriteInt(sky_indoor+100,mkf(0)); 
		MEM_WriteInt(sky_indoor+104,mkf(OR_Mine_FogRange)); 
		MEM_WriteInt(sky_indoor+108,mkf(1)); 
		
		//   		var int this; this = MEM_ReadInt(zCRenderClass);		
		//  		CALL_IntParam(2);
		// 		CALL__thiscall (this,zCRnd_D3D__SetFog_offset);
		//  		
		//  		CALL_IntParam(3);
		//  		CALL_IntParam(100);
		//   		CALL_IntParam(100);
		// 		CALL__thiscall (this,zCRnd_D3D__SetFogRange_offset);
		
	};
	
};
func void FX_Cave()
{
	if(WORLD_CURRENT == WORLD_CATACOMBS)
	{
		var int sky_indoor;
		sky_indoor = MEM_World.skyControlerIndoor;
		MEM_WriteInt(sky_indoor+44,RGBAToZColor (60,40,2,155)); 
		MEM_WriteInt(sky_indoor+100,mkf(0)); 
		//MEM_WriteInt(sky_indoor+104,mkf(OR_Mine_FogRange)); 
		MEM_WriteInt(sky_indoor+108,mkf(1)); 
	};	
};

func void FX_NecroLocation()
{
	if(WORLD_CURRENT == WORLD_NECROLOCATION)
	{
		MirrorNpc(pc_hero, hero_mirror);
		//MirrorNpc(DMB_1701_NecroInNecroloc, DMB_1701_NecroInNecroloc_mirror);
		MirrorNpc(NON_4084_NecroServant1, NON_4084_NecroServant1_Mirror);
		MirrorNpc(NON_4084_NecroServant2, NON_4084_NecroServant2_Mirror);
	};
};

// Ork: Elementy stąd potrzebują pożadnego reinita, może przestaną
// wtedy crashować gre:
func void FX_Reinit()
{
	// Pre-init, zainicjuj globalne Instancje które są tu wymagane:
	if (!MEM_World.skyControlerOutdoor)//Globals don't inited
	{
		MEM_InitGlobalInst();
	};
	var int camOff; camOff = MEM_InstGetOffset(MEM_CAMERA);
	FX_Fov_LastH = FX_Fov_HDefault;
	FX_Fov_LastV = FX_Fov_VDefault;
	// Init FOV:
	FX_Fov_H_Ptr = camOff+2300;
	
	// Init Screen Blend:
	// [TODO] No tutaj nie wiem naprawde co z tym zrobić i jak to zrobić :|
	// ...to może pomóc:
	FX_Blend_CameraPTR = camOff+2240;
	FX_Blend_ViewPTR = MEM_GAME.array_view[0];	
	
	// Init Cinema-Scope:
	FX_CinemaScopeEnabled_Adr = camOff+2248;
	FX_CinemaScopeColor_Adr = camOff+2252;
};

// Ork: Dodatkowy bugfix przy startupie nowej gry,
// paski i inne nie działają, aż do momentu wczytania gry. To powinno pomóc
var int FX_Startup_Bugfix_Done;
func void FX_Startup_Bugfix()
{
	if(!FX_Startup_Bugfix_Done)
	{
	FX_Startup_Bugfix_Done = TRUE;
	FX_Reinit();
	};
};


//Function by Sektenspinner:
func void ScaleWorldTime (var int factor) {
	//worldTime += frameTime * (factor - 1);

	//Global instances have to be intialised!
	if(MEM_WorldTimer)
	{
		var int deltaT; deltaT = MEM_Timer.frameTimeFloat;
		deltaT = mkf(2065);
		deltaT = mulf (deltaT, subf (factor, mkf (1)));
		MEM_WorldTimer.worldTime = addf (MEM_WorldTimer.worldTime, deltaT);
	};
	
};