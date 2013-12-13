var int VisionPlayer;
var int VisionHH;//more than 24 - time stays unchanged
var int VisionRewardEXP;
var string VisionWorld;
var string VisionWP;
var string VisionRealHeroWP;
var int Dream_State;//SleepFX_State like

var string PreVisionWorld;
var string PreVisionWp;//nearestWp
var int PreVisionX;
var int PreVisionY;
var int PreVisionZ;
var int DreamID;
const int DREAM_NONE = 0;
const int DREAM_BLOODYSWAMP = 1;//swamp attack

var int OldRemoveRange;
func void Dream_StartUp(var int id)
{
	if(DreamID==DREAM_BLOODYSWAMP)
	{
		VisionPlayer = 	PC_Hero_Dream01;
		VisionHH = 1;
		VisionRewardEXP = 1500;
		VisionWP = "PSI_31_HUT_IN";
		VisionRealHeroWP = "PSI_LABOR_BASEMENT_1";
		VisionWorld = "DREAM01.ZEN";
		Dream_State = 1;
		
		//Store this WORLD needed Info:
		PreVisionWorld = MEM_ReadString(MEM_InstToPtr(MEM_WORLD)+25184); //WorldFileName;
		
		var oCNpc Hiro;
		hiro = hlp_GetNpc(pc_hero);
		
		PreVisionX = Hiro._zCVob_trafoObjToWorld[3];
		PreVisionY = Hiro._zCVob_trafoObjToWorld[7];
		PreVisionZ = Hiro._zCVob_trafoObjToWorld[11];
		PreVisionWp = Npc_GetNearestWp(hero);
		//startpos[3];            //zVEC3   
	};
	
	
};

func void Dream_StopCutscene()
{
	AI_StopProcessInfos(hero);
	Npc_ClearAiQueue(hero);	
	AI_StandUP(hero);	
};

func void Dream_SwitchWorld()
{
	//
	//Load Word with proper WP
// 		MEM_Game.loadNextLevel 	=	true;      		  //zBOOL                               
// 		MEM_Game.LoadNextLevelName = 	VisionWorld;  	  //zSTRING                               
// 		MEM_Game.LoadNextLevelStart= 	VisionRealHeroWP; //zSTRING    
		//MEM_Game.progressBar = 0;	
		
		//Do it elegant by calling a function:
		var int chlvltrigger;
		chlvltrigger = MEM_Alloc(368);
 		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__oCTriggerChangeLevel_offset);
 		
		CALL_zStringPtrParam(VisionRealHeroWP);
		CALL_zStringPtrParam(VisionWorld);
 		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__SetLevelName_offset);
 		
 		
 		CALL_IntParam(oCNpc_GetPointer(hero));
  		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__TriggerTarget_offset);	
};


func void Dream_BackToBedWorld()
{
	//Load World with proper WP
	 	printdebug("Dream_BackToBedWorld"); 
	 	printdebug(hero.name); 
	 	PreVisionWorld = "WORLD.ZEN";
	 	
		var int chlvltrigger;
		chlvltrigger = MEM_Alloc(368);
 		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__oCTriggerChangeLevel_offset);
 		
		CALL_zStringPtrParam(PreVisionWp);
		CALL_zStringPtrParam("WORLD.ZEN");
 		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__SetLevelName_offset);
 		
 		
 		CALL_IntParam(oCNpc_GetPointer(hero));
  		CALL__thiscall(chlvltrigger,oCTriggerChangeLevel__TriggerTarget_offset);	
  		
//		MEM_Game.startpos[0]= 	PreVisionX; //zfloat    
//		MEM_Game.startpos[1]= 	PreVisionY; //zfloat    
//		MEM_Game.startpos[2]= 	PreVisionZ; //zfloat    
		//MEM_Game.progressBar = 0;	

};
		
//CHange NPC must be added to startup!!!
func void Dream_AfterLoad()
{
	var C_Npc playa;
	var int npcptr;
	playa = Hlp_GetNpc(VisionPlayer);
	//hero.wp = VisionRealHeroWP;//So old hero won't banish
	npcptr = oCNpc_GetPointer(playa);
 	if(Hlp_IsValidNpc(playa))
 	{
 		CALL__thiscall(npcptr,oCNpc__SetAsPlayer_offset);
 	};
	MEM_Game.game_drawall = true;
	
 	if(VisionHH<24)
 	{
 		Wld_SetTime(VisionHH,Hlp_Random(10));	
 	};
 	
	if(DreamID==DREAM_BLOODYSWAMP)
	{
		FX_FovDreamFX_Enabled = true;
		FX_StartBlend("DREAMFX_A",47,255,FX_BLEND_ADD,255,3,-1,0);
		//FX_StopScreenBlend
	};
	OldRemoveRange = MEM_ReadInt(SPAWN_REMOVERANGE_Address);
   MEM_WriteInt(SPAWN_REMOVERANGE_Address,mkf(50000));
    
   GUI_DontRenderIcons = true;
};

func void Dream_Quit()
{
	Dream_State = 5;//Rest Will be handled in SleepFX
};		

func void Dream_ResetVaribles()
{
	Dream_State = 0;
	VisionPlayer = 	0;
	DreamID = 0;
	
	GUI_DontRenderIcons = false;
   MEM_WriteInt(SPAWN_REMOVERANGE_Address,OldRemoveRange);
};		

func void Dream_SwitchToOldHero()
{
	var C_Npc olplaya;
	var int npcptr;
	printdebug("Dream_SwitchToOldHero:checkpoint1");
	olplaya = Hlp_GetNpc(pc_hero);
	npcptr = oCNpc_GetPointer(olplaya);
		if(Hlp_IsValidNpc(olplaya))
 	{
	 	printdebug("Dream_SwitchToOldHero:checkpoint2"); 
 		CALL__thiscall(npcptr,oCNpc__SetAsPlayer_offset);
 		printdebug("Dream_SwitchToOldHero:checkpoint3"); 
 	};
	MEM_Game.game_drawall = true;
	Dream_StopCutscene();
};

func void Dream_DisableFX()
{
	if(DreamID==DREAM_BLOODYSWAMP)
	{
		FX_FovDreamFX_Enabled = false;
		FX_StopScreenBlend();
	};	
};
func void Dream_AfterBackToBedWorld()
{
	DreamID = 0;
	
 	var oCNpc Hiro;
 	hiro = hlp_GetNpc(pc_hero);
 	Hiro._zCVob_trafoObjToWorld[3] =  	PreVisionX; 
 	Hiro._zCVob_trafoObjToWorld[7] =  	PreVisionY; 
 	Hiro._zCVob_trafoObjToWorld[11]=	PreVisionZ; 
	Npc_ClearAiQueue(hero);	
	AI_PlayAni(hero,"T_BED_FRONT_S0_2_STAND");	
};

func void Dream_HeroDead()
{
 	if(Npc_IsPlayer(self))&&(DreamID)
 	{
 		//start quiting from dream world procedere	
 		Dream_Quit();
 	};
};