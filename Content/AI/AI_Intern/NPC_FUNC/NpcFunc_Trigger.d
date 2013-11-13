var int WAS_BS_HIT;
var int pp;
func void ChestRename() {
	var oCMob Mob;
	var oCMobContainer Skrzynia;
	var oCNpc her; her = Hlp_GetNpc(pc_hero);
	printdebug(">># Chest rename...");
	if(her.focus_vob)
	{
		if(MEM_ReadInt(her.focus_vob)==oCMobContainer_vtbl)
		{
			printdebug(">># Chest rename: Hero has chest in focus...");
			MEM_AssignContentInst (Mob,her.focus_vob);
			MEM_AssignContentInst (Skrzynia,her.focus_vob);
			CheckAdress(MEM_InstToPtr(Skrzynia)+604,40,1,1);
			if (MEM_ReadInt(MEM_InstToPtr(Skrzynia)+604) == 0) {
				MEM_ReinitParser();
				printdebug_s_i(">># Chest rename: chest has no items in, renaming to(name idx):",NameSymbIndex);	        
				var string newName; newName = "Pusta Skrzynia";
				var int NameSymbIndex; NameSymbIndex = MEM_FindParserSymbol("CHESTRENAME.NEWNAME"); // NAME OF THE VARIABLE!
				Mob.focusNameIndex = NameSymbIndex;
			};
		};
	};
};

var int PoisonTriggerPhase;
var int bbb;
func void EVT_POISON()
{
	PoisonTriggerPhase = 1;
	//NOTE:
	// Misterious Lag Is Generater somehow by this function, but with delay so it's no ability
	// to detect it in straight way.
	// -fixed

	//ChestRename();
	printdebug("PoisonTrigger>>START");
	MsgManager_DoTick();
	
	printdebug("PoisonTrigger>>PupilBugfix2Handle"); 				
	PupilBugfix2Handle();
	printdebug("PoisonTrigger>>B_Sprinter"); 

   B_Sprinter();	
	//if(C_BodyStateContains(hero,BS_HIT))&&(WAS_BS_HIT==0)&&(DualEquiped==TRUE)&&(Npc_HasReadiedMeleeWeapon(hero))	
	//{
	//	Wld_PlayEffect("LH_TRAIL",hero,hero,0,0,0,FALSE);	
	//	WAS_BS_HIT=1;
	//}
	//if(WAS_BS_HIT>0)
	//{
	//	WAS_BS_HIT=WAS_BS_HIT+1;
	//	
	//	if(WAS_BS_HIT==21)
	//	{
	//		WAS_BS_HIT=0;	
	//	};
	//	
	//};


	printdebug("PoisonTrigger>>Trade_UpdateMul"); 				
	Trade_UpdateMul();
	printdebug("PoisonTrigger>>MusicSystem_Callback"); 				
	MusicSystem_Callback();//MusicSystem.d
	
	//I give it up ;-(
	//ControlsG2_CheckMode();	//Control_Func.d
	//I_TurnOffWarnMessages();
	
	printdebug("PoisonTrigger>>PreSkyThings");
	if(HeroInOutWorld())
	{
		//All of bottom function need proper ptr to SkyController_Outdoor
		SkyController_UpdatePointer();
		//IF hero is in fog zone there is ability to change fog color etc.
		printdebug("PoisonTrigger>>FX_FogZoneProcessingTrigger"); 				
		FX_FogZoneProcessingTrigger();//FX_Func.d
		//SkyPresetChecker
		printdebug("PoisonTrigger>>SkyPresetChecker"); 				
		SkyPresetChecker();
		//CustomRainFx
		printdebug("PoisonTrigger>>CustomRainFX_Checker"); 		
		CustomRainFX_Checker();
		
		//Without that bugfix, f.e. scale of moon wasn't setted at startup
		if(SkyPreset_ReInit) {
			printdebug("PoisonTrigger>>SkyPreset_ReInit"); 
			SkyPreset_ReInit=false;
			SetSkyPreset(GetSkyPreset(),TRANS_STEP);
		};

	};	
	printdebug("PoisonTrigger>>SleepFX_WaitTillDestinationTimeCome");    
	SleepFX_WaitTillDestinationTimeCome();
	//Take all steal inventory thing
	if(LCtrl_Doubleclick){LCtrl_Doubleclick=LCtrl_Doubleclick-1;};
	
	printdebug("PoisonTrigger<<ObserveConsole");
	ObserveConsole();
   printdebug("PoisonTrigger<<MirrorDamage");
	mirror_damage();	
   printdebug("PoisonTrigger<<Icearmor_minus");
	icearmor_minus();
   printdebug("PoisonTrigger<<Magicshield_minus");
	magicshield_minus();
   printdebug("PoisonTrigger<<Curse_damage");
	Curse_damage();
   printdebug("PoisonTrigger<<poison_damage");
	poison_damage();
   printdebug("PoisonTrigger<<party_check");
	party_check();	
	B_SetTimedATT_minus_rec(max_bonuses);	
	
	Wld_SendTrigger("POISON_TRIGGER");
};