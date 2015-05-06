var int SleepFX_Enabled;
var int SleepFX_Time;
var int SleepFX_StartHH;
var int SleepFX_StartMM;
//torches bugfix:
var int torches_enabled;
var int torches_disabled;
var int SleepFX_State;
//0 - none
//1 - init
//2 - SetCameraSpeedUpTime
//3 - Fade from black
//4 - waiting till time achieved
//5 - fade to black
//6 - disable cameras, reinit skypreset, default time multipiler
//7 - fade from black

//SkyStates SpeedUp:
var int last_state0;
var int last_state1;
const int sleepfx_cloudsSpeedMultipiler = 1120403456;//100

func void SleepFX_HeroSleep(var int Time)
{
	if(DreamID)
	{
		Dream_StartUp(DreamID);
		return;	
	};
	SleepFX_Enabled = true;
	SleepFX_Time = time;
	SleepFX_StartHH = Wld_GetHour();
	SleepFX_StartMM = Wld_GetMin();
	SleepFX_State = 1;
	torches_enabled = false;
	torches_disabled = false;	
	last_state0 = 0;
	last_state1 = 0;
};

func void SleepFX_SpeedUpLayersOffset()
{
		var int state;
		var int speed;
		speed = mkf(160);//regular speed will be multipiled by 160
		state = MEM_ReadInt(SkyController_Ptr+308);//state0
		if(state!=last_state0)&&(state!=last_state1)
		{
			//break if already multipiled
			if(gef(MEM_ReadInt(state+184),mkf(2)))
			{ return; };			
			if(!Hlp_StrCmp(STR_Prefix (MEM_ReadString(state+92),8),"SKYNIGHT"))
			{
				speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+120));
				MEM_WriteInt(state+120,speed);//layer1 speedx				
				speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+124));
				MEM_WriteInt(state+124,speed);//layer1 speedy			
			};	
			speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+184));
			MEM_WriteInt(state+184,speed);//layer1 speedx
			speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+188));
			MEM_WriteInt(state+188,speed);//layer1 speedy
		};
		last_state0 = state;
		state = MEM_ReadInt(SkyController_Ptr+312);//state1
		if(state!=last_state1)
		{
			//break if already multipiled
			if(gef(MEM_ReadInt(state+184),mkf(2)))
			{ return; };
			if(!Hlp_StrCmp(STR_Prefix (MEM_ReadString(state+92),8),"SKYNIGHT"))
			{
				speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+120));
				MEM_WriteInt(state+120,speed);//layer1 speedx				
				speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+124));
				MEM_WriteInt(state+124,speed);//layer1 speedy			
			};	

			speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+184));
			MEM_WriteInt(state+184,speed);//layer1 speedx
			speed = mulf(sleepfx_cloudsSpeedMultipiler , MEM_ReadInt(state+188));
			MEM_WriteInt(state+188,speed);//layer1 speedy
		};
		last_state1 = state;		
};
func void SleepFX_ResetSkyAfterSleep()
{//reset speed of layers:
		var int speed;var int i;var int label;
		var int statearray;var int state;
		statearray = MEM_ReadInt(SkyController_Ptr+316);//stateArray
		i = 0;
		MEM_InitLabels (); 
		label = MEM_StackPos.position; 		
		
		//loop		
		state = MEM_ReadInt(statearray+4*i);
		
		if(!Hlp_StrCmp(STR_Prefix (MEM_ReadString(state+92),8),"SKYNIGHT"))
		{
			speed = divf(MEM_ReadInt(state+120),sleepfx_cloudsSpeedMultipiler);
			MEM_WriteInt(state+120,speed);//layer1 speedx				
			speed = divf(MEM_ReadInt(state+124),sleepfx_cloudsSpeedMultipiler);
			MEM_WriteInt(state+124,speed);//layer1 speedy			
		};	
		speed = divf(MEM_ReadInt(state+184),sleepfx_cloudsSpeedMultipiler);
		MEM_WriteInt(state+184,speed);//layer1 speedx
		speed = divf(MEM_ReadInt(state+184),sleepfx_cloudsSpeedMultipiler);
		MEM_WriteInt(state+188,speed);//layer1 speedy
		
		i+=1;
		//loop contiune if:
		if(i<=TIME_MORNING)//moring - last state in array(element nr. 7)
		{ MEM_StackPos.position = label;};				
		//end loop


};
const int Fade_VPF = 10;
const int DreamFade_VPF = 5;
func void SleepFX_PerFrameHandle()
{
	//Hero Will Have a Dream:
	if(VisionPlayer)
	{
		printdebug_s_i("Dream_State:",Dream_State);
		//printdebug_s_i("Dream_State:",Dream_State);
		//Has to fade to 100% white screen
		if(Dream_State==1)
		{
			if(!FadeScreenState)//Screen is not fading
			{
 				FadeScreenOverlayColorR = 255;//fade to white
 				FadeScreenOverlayColorG = 255;//fade to white
 				FadeScreenOverlayColorB = 255;//fade to white		
 				FadeScreenOverlayBlend = FX_BLEND_ADD; //ADD = 3	
 				I_FadeScreenToBlack(DreamFade_VPF);
				
				//turn off GUI
 				MEM_Game.game_drawall = false;
 			}
 			else if(FadeScreenState==1)//faded, stop cutscene
 			{
				Dream_StopCutscene();
				Dream_State = -2;				
			};
		}
		else if(Dream_state == -2)//wait till cutscene is stopped
		{
			if(InfoManager_HasFinished())
			{
				Dream_SwitchWorld();
				Dream_State = 2;		
			};
		}
		//Wait Till world loaded
		else if(Dream_State==2)
		{
			if(MEM_WORLD.activeSkyControler)
			{
			//insertnpc, switch to player
			Dream_Afterload();	
			Dream_State = 3;
			};
		}
		//fade from white
		else if(Dream_State==3)
		{
  			if(FadeScreenState==1)
  			{
  				FadeScreenOverlayColorR = 255;//fade from white
  				FadeScreenOverlayColorG = 255;//fade from white
  				FadeScreenOverlayColorB = 255;//fade from white		
  				FadeScreenOverlayBlend = FX_BLEND_ADD; //ADD = 3	
  				I_FadeScreenFromBlack(DreamFade_VPF);
  			}	
  			else if(FadeScreenState==0)//done
  			{
				Dream_State = 4;//->start playing
			};			
		}
		else if(Dream_State==5)
		{
			if(FX_Blend_State==1) //enabled..
			{
				Dream_DisableFX();
			};
			if(FX_Blend_State==0)//fx blend off so can fade to white...
			{
 				if(!FadeScreenState)//Screen is not fading
 				{
 					FadeScreenOverlayColorR = 255;//fade to white
 					FadeScreenOverlayColorG = 255;//fade to white
 					FadeScreenOverlayColorB = 255;//fade to white		
 					FadeScreenOverlayBlend = FX_BLEND_ADD; //ADD = 3	
 					I_FadeScreenToBlack(DreamFade_VPF);
 					
 					//turn off GUI
 					MEM_Game.game_drawall = false;
 				}
 				else if(FadeScreenState==1)//faded
 				{
					Dream_SwitchToOldHero();
					Dream_State = 10;
				};		
			};	
		}
		else if (Dream_State>9)
		{
			Dream_State=Dream_State+1;
			if(Dream_State==30)
			{
            Dream_State = 6;	
			};	
		}
		else if(Dream_State==6)
		{
			if(Hlp_GetInstanceID (hero) == pc_hero)
			{
				Dream_BackToBedWorld();		
				Dream_State = 7;
			}; 
		}
		else if(Dream_State==7)
		{
			if(MEM_WORLD.activeSkyControler)//world changed
			{
            //insertnpc, switch to player
            Dream_AfterBackToBedWorld();	
            Dream_State = 8;
			};	
		}
		else if(Dream_State==8)//fade to normal screen & enjoy game :)
		{
 			if(FadeScreenState==1)
 			{
 				FadeScreenOverlayColorR = 255;//fade from white
 				FadeScreenOverlayColorG = 255;//fade from white
 				FadeScreenOverlayColorB = 255;//fade from white		
 				FadeScreenOverlayBlend = FX_BLEND_ADD; //ADD = 3	
 				I_FadeScreenFromBlack(DreamFade_VPF);
 			}	
 			else if(FadeScreenState==0)//done
 			{
	 			Dream_ResetVaribles(); //->start playing
			};			
		};
	};	
	// ***********************************
	// Hero sleeps normally:
	// ***********************************
	if(SleepFX_Enabled)
	{
		var string cameraName;
		if(SleepFX_State==1)
		{
			if(!FadeScreenState)//Screen is not fading
			{
				I_FadeScreenToBlack(Fade_VPF);
			}
			else if(FadeScreenState==1)//faded
			{
				SleepFX_State = 2;//set cameras etc
			};
		}
		else if(SleepFX_State==2)
		{	//Doing major preparements...
		
			//start camera
			cameraName = GetHeroLocation();
			cameraName = ConcatStrings(cameraName,"_SLEEP_CAM");
			var int id;
			id = Hlp_Random(2);//all locations have atleast 2 different cams
			cameraName = ConcatStrings(cameraName,intToString(id));
			Wld_SendTrigger(cameraName);
			//toggle desktop:
			MEM_Game.game_drawall = false;
			
					
			//Jump to Next State...
			SleepFX_State = 3;
		}
		else if(SleepFX_State==3)
		{
			if(FadeScreenState==1)
			{
				I_FadeScreenFromBlack(Fade_VPF);
			}	
			else if(FadeScreenState==0)//done
			{
				SleepFX_State = 4;//next state
			};		
		}
		//State4 handled by 1s trigger...
		//And it will change state to 5 after it done
		else if(SleepFX_State==5)
		{
			if(!FadeScreenState)//Screen is not fading
			{
				I_FadeScreenToBlack(Fade_VPF);
			}
			else if(FadeScreenState==1)//faded
			{
				SleepFX_State = 6;//disable cameras etc.
			};
			
		}
		else if(SleepFX_State==6)
		{	//Back to normal settings:
		
			//stop camera
			//cameraName = GetHeroLocation();
			//cameraName = ConcatStrings(cameraName,"_SLEEP_CAM");
			Wld_SendUnTrigger(cameraName);
			
			//ToggleDesktop:
			MEM_Game.game_drawall = TRUE;
			
			//"Repair" SkyPreset:
			SleepFX_ResetSkyAfterSleep();
			
			//Jump to Next State...
			SleepFX_State = 7;	
		
		}	
		else if(SleepFX_State==7)
		{
			if(FadeScreenState==1)
			{
				I_FadeScreenFromBlack(Fade_VPF);
			}	
			else if(FadeScreenState==0)//done
			{
				PutMsg("Sen dobrze Ci zrobi³.","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");
				//PrintScreen	(, -1,-1,"font_old_20_white.tga",3);
				hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
				hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];	
				RuneCharge = RuneChargeMax;	
    			
				//-------- AssessEnterRoom-Wahrnehmung versenden --------
				//PRINTGlobals		(PD_ITEM_MOBSI);
				Npc_SendPassivePerc	(hero,	PERC_ASSESSENTERROOM, NULL, hero);
							
				SleepFX_State = 0;//FINISH!
				SleepFX_Enabled = false;
				B_StopProcessInfos(hero);
			};		
		};
		
		//handle torches & skylayers & npcs movement speed
		if(1<SleepFX_State)&&(SleepFX_State<6)
		{
			SleepFX_SpeedUpLayersOffset();
			
			MEM_Timer.factorMotion = fracf(1,4);
			
			ScaleWorldTime(fracf(575,100));	//475	
			if(Wld_IsTime(19,55,20,10))&&(!torches_enabled)
			{
				torches_enabled = true;
				Wld_SetTime(20,01);	
			}
			else if(Wld_IsTime(4,55,5,10))&&(!torches_disabled)
			{
				torches_disabled = true;
				Wld_SetTime(5,01);	
			}; 
		};		
	};
};

func void SleepFX_WaitTillDestinationTimeCome()
{
	if(SleepFX_State==4)
	{
		if(Wld_IsTime(SleepFX_Time-1,00,SleepFX_StartHH,SleepFX_StartMM))
		||((SleepFX_Time==0)&&(Wld_IsTime(23,00,0,00)))//bugfix: sleeping till midnight
		{
			SleepFX_State = 5;	
		};	
	};	
	
};