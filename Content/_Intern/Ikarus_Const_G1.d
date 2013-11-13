const int GOTHIC_BASE_VERSION = 1;

//--------------------------------------
// Adressen
//--------------------------------------

//Parser
const int ContentParserAddress      =  9293320;//0x8DCE08
const int vfxParserPointerAddress   =  8822380;//0x869E6C
const int menuParserPointerAddress  =  8836056;//0x86D3D8
const int pfxParserPointerAddress   =  8864640;//0x874380

//ShowDebug-Einstellung
const int showDebugAddress = 9298376;//0x8DE1C8

//Array mit alle erzeugten (und nicht wieder zerstörten) Menüs
const int MEMINT_MenuArrayOffset = 8836020;//0x86D3B4

//Ein paar nützliche statische Objekte
const int MEMINT_oGame_Pointer_Address = 9283260; //0x8DA6BC
const int MEMINT_zTimer_Address = 9236972;//0x8CF1EC
const int MEMINT_oCInformationManager_Address = 10328072;//0x9D9808
const int MEMINT_oCRtnManager_Address = 9290272;//0x8DC220

//Zufallszahlenarray der Engine (für Hashwerte):
const int crc_table_address = 8211704;//0x7D4CF8

//Arrays mit Informationen zu gedrückten Tasten
const int MEMINT_KeyEvent_Offset = 8834248;//0x86CCC8
const int MEMINT_KeyToggle_Offset = 8834768;//0x86CED0
const int MEMINT_KeyBuffer_offset = 8835804;//0x86D2DC

//Statisches Zeug vom Spawnmanager
const int SPAWN_INSERTTIME_MAX_Address = 8720304; //0x850FB0 //zREAL*
const int SPAWN_INSERTRANGE_Address    = 8720308; //0x850FB4 //zREAL*
const int SPAWN_REMOVERANGE_Address    = 8720312; //0x850FB8 //zREAL*

const int MUSIC_HeroStatus_Address    = 9299208; //0x8DE508 //enum
const int MUSIC_Zone_Address  		  = 9299212; //0x8DE50C //*oCZoneMusic?

/* In Gothic 1 nicht vorhanden: 
	const int game_holdTime_Address; //zBOOL*
*/

//Statische Eigenschaften betreffend der Untertitelanzeige:
const int oCNpc_isEnabledTalkBox_Address        =  8707644; //84DE3C //zBOOL*
/* In Gothic 1 nicht vorhanden:
	const int oCNpc_isEnabledTalkBoxPlayer_Address;		 //zBOOL*
	const int oCNpc_isEnabledTalkBoxAmbient_Address;	 //zBOOL*
	const int oCNpc_isEnabledTalkBoxNoise_Address;		 //zBOOL*
*/

//globaler Screen (vom Typ zCView), da liegt z.B HP-Bar etc drin.
const int screen_offset = 9298364;	//0x8DE1BC

		
const int zCView_zCView_offset = 7322464;	//0x6FBB60 (void)
const int zCView_InsertItem_offset = 7347872;	//0x701EA0 (zcview*,int)
const int zCView_RemoveItem_offset = 7348448;	//0x7020E0 (zcview*)
const int zCView_Init_offset = 7324512;	//0x6FC360 stdcall(void) /returns zCView*?
const int zCView_Create_offset = 7324512;	//0x6FCC90 thiscall(string&,enum,enum,float,int)
const int zCView_SetPos_offset = 7330320;	//0x6FDA10 thiscall(int,int)
const int zCView_SetSize_offset = 7330816;	//0x6FDC00 thiscall(int,int)
const int zCView_Open_offset = 7327856;	//0x6FD070 thiscall(void)
const int zCView_Close_offset = 7328400;	//0x6FD290 thiscall(void)
const int zCView_Render_offset = 7349744;	//0x7025F0 thiscall(void)
const int zCView_SetAlphaBlendFunc_offset = 7325056;	//0x6FC580 thiscall(enum)
const int zCView_SetTransparency_offset = 7325040;	//thiscall(int)
const int zCView_InsertBack_offset = 7325248;	//thiscall(&string)
const int zCView_CreateText_offset = 7341792;	//0x7006E0 thiscall(int, int, class zSTRING const &) 
const int zCView_CalcPixelPos_offset = 7330528;	//0x6FDAE0 thiscall(px,py) 
const int zCView_GetPixelPos_offset = 7330592;	//6FDB20 thiscall(px,py) 
const int zCView_SetFontColor_offset = 7339392;	//6FFD80 thiscall(zCColor) 
const int zCView_SetFont_offset = 7339408;	//6FFD90 thiscall(string font) 
 
const int zCViewStatusBar_SetValue_offset = 4629600;	// (float)
const int zCViewStatusBar_Init_offset = 4629200;	// 0x46A2D0 (void)
const int oCViewStatusBar_SetMaxRange_offset = 4432176;	// (float,float)
const int oCViewStatusBar_SetRange_offset = 4432448;	//0x46A3C0 (float,float))
const int oCViewStatusBar_SetValue_offset = 4432640;	//43A300 (char)

const int zCMenuItem__SetText_offset = 5063504;	//0x4D4350 (*ZStr,line,now?) /Crashing on updatesize???
const int zCMenuItem__DrawFront_offset = 5065040;//0x4D4950 ()


const int zCInput_SetState_offset = 4991120;	//43A300 (char,char)

const int oCAniCtrl_Human_SetAlwaysWalk_offset = 6436576;	//6236E0 (state)
const int oCAniCtrl_Human_ToggleWalkMode_offset = 6442544;	//(char?)
const int oCAniCtrl_Human_PC_SlowMove_offset = 6373952;	//0x614240(int?)
const int oCAniCtrl_Human_IsStanding_offset = 6444512;//0x6255E0   (void)
const int oCAniCtrl_Human_IsWalking_offset = 6445024;//0x6255E0   (void)                                  
const int oCAniCtrl_Human_IsStateAniActive_offset = 6444304;//0x6255E0   (void)            
const int oCAniCtrl_Human_GetWalkModeString_offset = 6432560;//			 (void) ret string     
const int oCAniCtrl_Human_StopTurnAnis_offset = 6445600;	//0x625A20 (void)       
const int zCAniCtrl_StartAni_offset = 6404000;//0x61B7A0 (oCModelAni*,oCModelAniNxt)
const int JUMPUP_AniID = 4180;

const int zCModel_StartAni_offset = 5640944;//0x5612F0 (oCModelAni*,layer?)
const int zCModel_RemoveChildVobFromNode_offset = 5662496;//0x566721 (oCVob*)
const int zCModel_AttachChildVobToNode_offset = 5662128;//0x5665B0 (oCVob*,*Node)


const int zCVob_RotateWorldY_offset = 6218528;//0x5EE320 (float)

const int  zCRnd_D3D__SetBilerpFilterEnable_offset = 7445792;//(int)
const int  zCRnd_D3D__GetBilerpFilterEnable_offset = 7445920;//(void)
const int  zCRnd_D3D__SetFog_offset = 7445360;//719B70 (int foggy?)
const int  zCRnd_D3D__SetFogRange_offset = 7445600;//0719C60 (float nearz,float farz, int falloff/fogmode?)

const int  oCNpc__CloseDeadNpc_offset = 7060128;//(void) 
const int  oCNpc__CloseInventory_offset = 7058160;//(void)
const int  oCNpc__RenderNpc_offset = 6940528;//0x69E770 (zcView*)
const int  oCNpc__RemoveFromSlot_offset = 6971216;//0x6A5F50 (*TNpcSlot,drop_bool)
const int  oCNpc__StringRemoveFromSlot_offset = 6971008;//0x6A5E80 (*TNpcSlot,drop_bool)
const int  oCNpc__DropFromSlot_offset = 6972016;//0x6A6270 (*TNpcSlot)
const int  oCNpc__DoDropVob_offset = 6951152;//0x6A10F0 (*zCVob)
const int  oCNpc__DoSwapMesh_offset = 6947120;//0x6A0130 (ZString node1, zString node2)
const int  oCNpc__SetTorchAni_offset = 6914064;//0x0698010 (int f, int now)
const int  oCNpc__DoExchangeTorch_offset = 6952576;//0x06A1680 (void)
const int  oCNpc__PutInSlot_offset = 6969872;//0x6A5A10 (*TNpcSlot,oCVob)
const int  oCNpc__PutInRightHand_offset = 6913472;//0x697DC0 (*oCVob)
const int  oCNpc__Equip_offset = 6908144;//0x6968F0 (*oCItem)
const int  oCNpc__Disable_offset = 6954272;//0x6A1D20 ()
const int  oCNpc__ai_disabled_adress = 9288604;//bool? 
const int  oCNpc__ai_messagesSkip_adress = 9288608;//zfloat 
const int  oCNpc__ai_ScriptStatesSkip_adress = 9288616;//zfloat 
const int  oCNpc__game_aicon_baseAIenabled_adress = 9283196;//int 
const int  oCNpc__game_aicon_messagesSkip_adress = 9283200;//int 
const int  oCNpc__SetAsPlayer_offset = 6941408;//0x69EAE0 ()
const int  oCNpc__GetScriptInstance_offset = 6953920;//06A1BC0 (zString instance,int id)
const int  oCNpc__CreateVobList_offset = 7041296;//6B7110 (float distance)
const int  oCNpc__ClearVobList_offset = 7040688;//6B6EB0 ()
const int  oCNpc__DoDie_offset = 6894752;//6934A0 (ocNpc attacker)
const int  oCNpc__StartFadingAway_offset = 6895984;//0x693970 (void)
const int  oCNpc__ClearEM_offset = 6956560;//0x6A2610 (void)
const int  oCNpc__EV_Parade_offset = 6998192;//0x6AC8B0 (csg)

const int  oCNpc__DropUnconscious_offset = 6892560;//692C10 (float azi,ocNpc attacker)
                    

const int  oCGame__SetAsPlayer_offset = 6542288;//0x63D3D0 (InstanceID string)
const int  oCGame__TriggerChangeLevel_offset = 6542464;//0x63D480 (zen_name,wpname)    


const int  oCTriggerChangeLevel__oCTriggerChangeLevel_offset = 4424256;// (void)    
const int  oCTriggerChangeLevel__SetLevelName_offset = 4425392;// (zen_name,wpname)    
const int  oCTriggerChangeLevel__TriggerTarget_offset = 4424560;//0x438370 (vob caller)    

const int  oCWorld__SearchVobByName_adress = 7173120;// (zString,?,?) 

const int  zMDL_MAX_FPS = 8208616;//int 

const int  oCItem__oCitem_offset = 6754208;//0x0670FA0 (zString,int)
            

const int  zCZone__GetCamPosWeight_offset = 6339472;//0x060BB90 (void) ret zFloat
const int  zCZoneZFog__GetActiveRange_offset = 6340656;//0x060C030 (void) ret zFloat

const int  TNpcSlot__SetVob_offset = 6857884;//0x68A49C (*oCVob)
const int  TNpcSlot__ClearVob_offset = 6876768;//0x68EE60 (void)

const int  zCTexture__SearchName_offset =  6064544;//_cdecl (zString*)
const int  zCTexture__LoadSingle_offset =  6064544;//_cdecl (zString*,int flags)//Needed if tex is still unused (SearchName won't be working)
const int  zCPolygon_TexScale_offset =  5868192;//598AA0 thiscall (float,float)
const int  zCPolygon_Flip_offset =  5867872;//598960 thiscall (void)
const int  zCMesh_Load_offset =  5570976;//5501A0 cdecl (*zString)

const int  zCMaterial__SetTexScale_offset = 5562336;// (float,float)
const int  zCMaterial__SetTex_offset = 5561024;//0x54DAC0 (zString)

const int  oCSkyController_SkyVari_int = 9235392;//0=poly/1=dome (???)
const int  oCSkyController_SkyDomeTex_adr = 9235264;//??
const int  oCSkyController_SkyMesh_adr = 9235380;//??ptr?
const int  oCSkyController_SkyOffset_adr = 9235024;//?
const int  oCSkyController_SkyRainCloudsStr_adr = 8660092;//"SKYRAINCLOUDS.TGA"

const int  Apply_Options_Control = 4371792;   //42B550  cdecl
const int  zCInput_Class_ptr	 = 8834208;//86CCA0;
const int  zCInput__BindKeys	 = 5003568;//(void)

//Gekapselte Gothic.ini (zum Zugriff stehen Funktionen bereit)
const int zoptions_Pointer_Address = 8820372; //0x869694
//[modname].ini (zum Zugriff stehen Funktionen bereit)
const int zgameoptions_Pointer_Address = 8820376; //0x869698

//--------------------------------------
// Sonstige Konstanten
//--------------------------------------
const int MEMINT_zCPolyStrip_zCClassDef_Address = 9127264; //0x8B4560
const int MEMINT_zCSkyController_outdoor_zCClassDef_Address = 9235040; //0x8CEA60
const int MEMINT_oCVisualFX_zCClassDef_Address = 8822272; //0x869E00
const int MEMINT_zCMesh_zCClassDef_Address = 8862168; //0x8739D8
const int MEMINT_zCVisual_zCClassDef_Address = 9270536; //
const int MEMINT_zCVisualAnimate_zCClassDef_Address = 9270648; //
const int MEMINT_zCObject_zCClassDef_Address = 8863344; //
const int MEMINT_zCObjectFactory_zCClassDef_Address = 8863456; //
const int MEMINT_zCParticleFx_ZCClassDef_class = 8864496;//0x8742F0

const int MEMINT_zCMesh_ARRAY_Address = 8195396;//4286032; //0x416650 | 0x78AB50


//Object sizes:
const int oCItem_size     = 764;



//Adresse der Methodentabellen zur Unterscheidung von Objekten
const int oCMobFire_vtbl        = 8247780;
const int zCMover_vtbl          = 8241068;
const int oCMob_vtbl            = 8248572;
const int oCMobInter_vtbl       = 8248756;
const int oCMobContainer_vtbl   = 8246268;
const int oCMobDoor_vtbl        = 8247468;
const int oCItem_vtbl           = 8245452;
const int oCNpc_vtbl            = 8249140;

//orcwarriors constants:

const int zCEventMenager_vtbl            = 8251772;
const int poCollisionObject_vtbl     	 = 8256180;
const int poCollisionObjectClass_vtbl    = 7711376;
const int oCView_vtbl           		 = 8251936;
const int oCViewStatusBar_vtbl           = 8197216;
const int zCSkyController_Outdoor_vtbl   = 8243908;
const int oWorld_vtbl   				 = 8251596;
const int oCGame_vtbl   				 = 8244204;
const int zCAIBase_vtbl					 = 8200912;
const int oCAIHuman_vtbl   				 = 8243220;
const int zCVisualFX_vtbl				 = 8200452;

//const int zCVisual_vtbl   			 = ?
const int zCModel_vtbl   				 = 8208364;
const int oCNpcTalent_vtbl   			 = 8249116;
const int zCRoute_vtbl   				 = 8252184;
const int oCMobLadder_vtbl    			 = 8247188;	
const int oCInfoMenager_vtbl   			 = 6705872;	
const int zString_vtbl   				 = 8193768;	
const int zCZoneSound_vtbl 				 = 8243052;	
const int zCZoneMusicDefault_vtbl		 = 8252620;	
const int zCZoneMusic_vtbl				 = 8252476;	
const int zCCSManager_vtbl				 = 8194068;	
const int zCAICamera_vtbl				 = 8201664;	
const int zCVob_vtbl				 	 = 8238156;
const int oCGameInfo_vtbl			 	 = 8196140;	
const int zCMenuItem_vtbl		 	 	 = 8251988;
const int zCTexture_vtbl			 	 = 8254100;
const int zCMaterial_vtbl			 	 = 8208076;
const int zCMesh_vtbl			 	 	 = 8208236;
const int oCFreepoint_vtbl			  	 = 8252220;
const int oCLensFlare_vtbl			  	 = 8240412;
const int zCVobSound_vtbl			  	 = 8243052;
//const int oCWaypoint_vtbl			  	 = ?
const int zCVobLight_vtbl			  	 = 8238388;
const int oCTriggerScript_vtbl		  	 = 8196940;
const int oCMobWheel_vtbl            	 = 8246908;
const int zCZoneSoundDaytime_vtbl 		 = 8242900;	
const int oCTriggerChangeLevel_vtbl		 = 8196812;
const int zCDecal_vtbl					 = 8241804;
const int oCMeshSoftSkin_vtbl			 = 8209812;
const int oCModelAni_vtbl				 = 8208660;

const int zCVisual_vtbl   				 = 8208364;//or zCmodel

const int oCMsgManipulate_vtbl			 = 8250724;                
const int oCMsgMovement_vtbl             = 8250308;
const int oCMsgAttack_vtbl               = 8250412;
const int oCMsgWeapon_vtbl               = 8250204;
const int zCMusicSystem_vtbl		 	 = 8252292;
const int zCZoneVobFarPlane_vtbl		 = 8242356;
const int zCZoneZFog_vtbl				 = 8242764;
const int zCRnd_D3D_vtbl				 = 8253268;
const int zCRender_vtbl					 = 8253636;



const int zCRenderClass					 = 9199312;//*zCRender Note: most of values edited manualy makes game crash :(

//--------------------------------------
// Tasten
//--------------------------------------

//Diese Liste kommt von hier:
//http://community.bistudio.com/wiki/DIK_KeyCodes

const int KEY_ESCAPE          = 01;
const int KEY_1               = 02;
const int KEY_2               = 03;
const int KEY_3               = 04;
const int KEY_4               = 05;
const int KEY_5               = 06;
const int KEY_6               = 07;
const int KEY_7               = 08;
const int KEY_8               = 09;
const int KEY_9               = 10;
const int KEY_0               = 11;
const int KEY_MINUS           = 12; 
const int KEY_EQUALS          = 13;
const int KEY_BACK            = 14; 
const int KEY_TAB             = 15;
const int KEY_Q               = 16;
const int KEY_W               = 17;
const int KEY_E               = 18;
const int KEY_R               = 19;
const int KEY_T               = 20;
const int KEY_Y               = 21;
const int KEY_U               = 22;
const int KEY_I               = 23;
const int KEY_O               = 24;
const int KEY_P               = 25;
const int KEY_LBRACKET        = 26;
const int KEY_RBRACKET        = 27;
const int KEY_RETURN          = 28; 
const int KEY_LCONTROL        = 29;
const int KEY_A               = 30;
const int KEY_S               = 31;
const int KEY_D               = 32;
const int KEY_F               = 33;
const int KEY_G               = 34;
const int KEY_H               = 35;
const int KEY_J               = 36;
const int KEY_K               = 37;
const int KEY_L               = 38;
const int KEY_SEMICOLON       = 39;
const int KEY_APOSTROPHE      = 40;
const int KEY_GRAVE           = 41; 
const int KEY_LSHIFT          = 42;
const int KEY_BACKSLASH       = 43;
const int KEY_Z               = 44;
const int KEY_X               = 45;
const int KEY_C               = 46;
const int KEY_V               = 47;
const int KEY_B               = 48;
const int KEY_N               = 49;
const int KEY_M               = 50;
const int KEY_COMMA           = 51;
const int KEY_PERIOD          = 52; 
const int KEY_SLASH           = 53; 
const int KEY_RSHIFT          = 54;
const int KEY_MULTIPLY        = 55; 
const int KEY_LMENU           = 56; 
const int KEY_SPACE           = 57;
const int KEY_CAPITAL         = 58;
const int KEY_F1              = 59;
const int KEY_F2              = 60;
const int KEY_F3              = 61;
const int KEY_F4              = 62;
const int KEY_F5              = 63;
const int KEY_F6              = 64;
const int KEY_F7              = 65;
const int KEY_F8              = 66;
const int KEY_F9              = 67;
const int KEY_F10             = 68;
const int KEY_NUMLOCK         = 69;
const int KEY_SCROLL          = 70; 
const int KEY_NUMPAD7         = 71;
const int KEY_NUMPAD8         = 72;
const int KEY_NUMPAD9         = 73;
const int KEY_SUBTRACT        = 74; 
const int KEY_NUMPAD4         = 75;
const int KEY_NUMPAD5         = 76;
const int KEY_NUMPAD6         = 77;
const int KEY_ADD             = 78; 
const int KEY_NUMPAD1         = 79;
const int KEY_NUMPAD2         = 80;
const int KEY_NUMPAD3         = 81;
const int KEY_NUMPAD0         = 82;
const int KEY_DECIMAL         = 83; 
const int KEY_OEM_102         = 86; 
const int KEY_F11             = 87; 
const int KEY_F12             = 88; 
const int KEY_F13             = 100;
const int KEY_F14             = 101;
const int KEY_F15             = 102;
const int KEY_KANA            = 112;
const int KEY_ABNT_C1         = 115;
const int KEY_CONVERT         = 121;
const int KEY_NOCONVERT       = 123;
const int KEY_YEN             = 124;
const int KEY_ABNT_C2         = 125;
const int KEY_NUMPADEQUALS    = 141;
const int KEY_PREVTRACK       = 144;
const int KEY_AT              = 145;
const int KEY_COLON           = 146;
const int KEY_UNDERLINE       = 147;
const int KEY_KANJI           = 148;
const int KEY_STOP            = 149;
const int KEY_AX              = 150;
const int KEY_UNLABELED       = 151;
const int KEY_NEXTTRACK       = 153;
const int KEY_NUMPADENTER     = 156;
const int KEY_RCONTROL        = 157;
const int KEY_MUTE            = 160;
const int KEY_CALCULATOR      = 161;
const int KEY_PLAYPAUSE       = 162;
const int KEY_MEDIASTOP       = 164;
const int KEY_VOLUMEDOWN      = 174;
const int KEY_VOLUMEUP        = 176;
const int KEY_WEBHOME         = 178;
const int KEY_NUMPADCOMMA     = 179;
const int KEY_DIVIDE          = 181;
const int KEY_SYSRQ           = 183;
const int KEY_RMENU           = 184;
const int KEY_PAUSE           = 197;
const int KEY_HOME            = 199;
const int KEY_UPARROW         = 200;
const int KEY_PRIOR           = 201;
const int KEY_LEFTARROW       = 203;
const int KEY_RIGHTARROW      = 205;
const int KEY_END             = 207;
const int KEY_DOWNARROW       = 208;
const int KEY_NEXT            = 209;
const int KEY_INSERT          = 210;
const int KEY_DELETE          = 211;
const int KEY_LWIN            = 219;
const int KEY_RWIN            = 220;
const int KEY_APPS            = 221;
const int KEY_POWER           = 222;
const int KEY_SLEEP           = 223;
const int KEY_WAKE            = 227;
const int KEY_WEBSEARCH       = 229;
const int KEY_WEBFAVORITES    = 230;
const int KEY_WEBREFRESH      = 231;
const int KEY_WEBSTOP         = 232;
const int KEY_WEBFORWARD      = 233;
const int KEY_WEBBACK         = 234;
const int KEY_MYCOMPUTER      = 235;
const int KEY_MAIL            = 236;
const int KEY_MEDIASELECT     = 237;

const int MOUSE_BUTTONLEFT	= 524; //linke Maustaste
const int MOUSE_BUTTONRIGHT	= 525; //rechte Maustaste
const int MOUSE_BUTTONMID	= 526; //mittlere Maustaste
const int MOUSE_XBUTTON1	= 527; //Sonderbuttons...
const int MOUSE_XBUTTON2	= 528;
const int MOUSE_XBUTTON3	= 529;
const int MOUSE_XBUTTON4	= 530;
const int MOUSE_XBUTTON5	= 531;

//--------------------------------------
// INTERNAL / TUNING
//--------------------------------------
const int MEM_NpcID_Offset = 256; //0x100
const int MEM_NpcName_Offset = 260; //0x104

const string MEM_FARFARAWAY = "GAME_START";		//dort wird der Mem-Helper gespawnt
const string MEM_HELPER_NAME = "MEMHLP";    //so heißt er

//MEM_ArrayInsert alloziert schon beim ersten Element für soviele Elemente Speicher
const int zARRAY_START_ALLOC = 16; //macht die Engine auch so. Ziel: Seltener reallozieren.

const int sizeof_zCArray = 12;


//Infos / Warnungen / Errors auf dem Bildschirm / per PrintDebug anzeigen?
//MEM_Info
const int MEM_PrintInfoOnDebug  = 1;
//MEM_Warn
const int MEM_PrintWarnOnScreen = 0; //aktivieren, wenn man sich zu besonders sauberem Skripting erziehen will
const int MEM_PrintWarnOnDebug  = 1; //empfohlen
//MEM_Error
const int MEM_PrintErrOnScreen = 0; //budzis tu by³ //empfohlen, allenfalls beim Release rausnehmen.
const int MEM_PrintErrOnDebug  = 1; //empfohlen

const int zCParSymbol_content_offset                = 24; //0x18
const int zCParSymbol_offset_offset                 = 28; //0x1C

const int zCParser_symtab_table_array_offset        = 24; //0x18
const int zCParser_sorted_symtab_table_array_offset = 36; //0x24
const int zCParser_stack_offset                     = 72; //0x48
const int zCParser_stack_stackPtr_offset            = 76; 