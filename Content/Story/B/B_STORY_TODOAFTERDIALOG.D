//CH1
var int B_AfterDialog_Hank_GameStart_disabled;

var int B_AfterDialog_Abel_GotoCavalorn_disabled;

var int B_AfterDialog_Tony_Sentry_disabled;

var int	B_AfterDialog_Pacho_ScorpioCam_disabled;	
var int	B_AfterDialog_Pacho_EarlCamPrepare_disabled;	 	 	
var int	B_AfterDialog_Pacho_MonsterCam_disabled;

//CH2
var int B_AfterDialog_Duke_Patrol_disabled;

var int B_AfterDialog_Ratford_GotoMages_disabled;

var int B_AfterDialog_Iskra_Hello_disabled;

var int B_AfterDialog_hun_4035_jahr_Hello_disabled;
//CH3
var int B_AfterDialog_Info_Diego_Entrence_disabled;

var int B_AfterDialog_Info_Nameless_HiAgain_disabled;

var int B_AfterDialog_Info_Nameless_RBL4_disabled;

var int B_AfterDialog_Info_OrcGhost_Kill_disabled;

var int B_AfterDialog_Info_Roderic_Gate_disabled;

var int B_AfterDialog_Stigma_Death_disabled;

// Ork: Dodaje "Generici" bo mog¹ sie przydaæ (choæby nekro nas czêsto usmierca
// i wyglada to obecnie kiepsko. Tutaj w przeciwienstwie do innych AfterDialog'ów ustawiamy zmienna
// na true w dialogu, a w funkcji po-dialogu zmeni siê na false.
var int B_AfterDialog_Generic_KillHero_enabled; 
var int B_AfterDialog_Generic_KillHeroWithLightning_enabled; 
var int B_AfterDialog_Generic_KillHeroWithPoison_enabled; //Nie-gwarantowane


// FUNCTIONS BODY's:
// ---
func void B_AfterDialog_Generic_KillHero()
{
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,-hero.attribute[ATR_HITPOINTS_MAX]);
	B_AfterDialog_Generic_KillHero_enabled = false;
};
func void B_AfterDialog_Generic_KillHeroWithLightning()
{
	Wld_PlayEffect("spellFX_Thunder_TARGET",hero, hero, 0, 0, DAM_MAGIC, TRUE); 
	B_AfterDialog_Generic_KillHero();
	B_AfterDialog_Generic_KillHeroWithLightning_enabled = false;
};
func void B_AfterDialog_Generic_KillHeroWithPoison()
{
	add_poison(other,hero,19999);
	B_AfterDialog_Generic_KillHeroWithPoison_enabled = false;
};

func void	B_AfterDialog_Sly(var c_npc talker)
{
	var C_NPC sly_guard1; sly_guard1 = Hlp_GetNpc(GRD_4054_Guard);
	var C_NPC sly_guard2; sly_guard2 = Hlp_GetNpc(GRD_4055_Guard);
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);	
	
	Npc_SetTrueGuild (talker,GIL_DMB);
	self.guild = GIL_DMB;
	Npc_SetTrueGuild (sly_guard1,GIL_DMB);
	sly_guard1.guild = GIL_DMB;
	Npc_SetTrueGuild (sly_guard2,GIL_DMB);
	sly_guard2.guild = GIL_DMB;

	Npc_SetTempAttitude(talker,  ATT_HOSTILE); 
	Npc_SetAttitude(talker,  ATT_HOSTILE);
	Npc_SetTempAttitude(sly_guard1,  ATT_HOSTILE); 
	Npc_SetAttitude(sly_guard1,  ATT_HOSTILE);
	Npc_SetTempAttitude(sly_guard2,  ATT_HOSTILE); 
	Npc_SetAttitude(sly_guard2,  ATT_HOSTILE);	
	
	Npc_SetTarget(sly_guard1,rodney); 
	AI_StartState(sly_guard1,ZS_ATTACK,1,"");	
	Npc_SetTarget(rodney,sly_guard1); 
	AI_StartState(rodney,ZS_ATTACK,1,"");	
	
	Npc_SetTarget(sly_guard2,hank); 
	AI_StartState(sly_guard2,ZS_ATTACK,1,"");
	Npc_SetTarget(hank,sly_guard2); 
	AI_StartState(hank,ZS_ATTACK,1,"");	
	
	Npc_SetTarget(talker,angus); 
	AI_StartState(talker,ZS_ATTACK,1,"");
	Npc_SetTarget(angus,talker); 
	AI_StartState(angus,ZS_ATTACK,1,"");	
};

func void	B_AfterDialog_Hank_GameStart(var c_npc talker)
{
	B_AfterDialog_Hank_GameStart_disabled=TRUE;

};
func void	B_AfterDialog_Abel_GotoCavalorn(var c_npc talker)
{
	AI_SetWalkmode(talker,NPC_RUN);	
	B_AfterDialog_Abel_GotoCavalorn_disabled=TRUE;
	Ai_Wait(hero,1);	
	AI_GotoWP(talker,"OW_PATH_OC_NC8");
	AI_GotoWP(hero,"OW_PATH_OC_NC8");
	AI_GotoWP(hero,"PATH_OC_NC_3");
	AI_GotoWP(talker,"PATH_OC_NC_3");
	Ai_TurnToNpc(talker,hero);
	
};
func void	B_AfterDialog_Tony_Sentry(var c_npc talker)
{
	AI_SetWalkmode(hero,NPC_RUN);	
	B_AfterDialog_Tony_Sentry_disabled=TRUE;
	AI_GotoWP(hero,"WITAMYWHC");
	
};

func void	B_AfterDialog_Pacho_ScorpioCam(var c_npc talker)
{
	B_AfterDialog_Pacho_ScorpioCam_disabled=TRUE;

	AI_Teleport (Skorpio, "OW_PATH_BLOODFLY01_MOVEMENT");
	B_ExchangeRoutine	(GRD_205_SCORPIO, "pachotreasure");		
	AI_TurnToNpc(self, Skorpio);
};
func void	B_AfterDialog_Pacho_EarlCamPrepare(var c_npc talker)
{
	B_AfterDialog_Pacho_EarlCamPrepare_disabled=TRUE;
	B_ExchangeRoutine	(GRD_4010_Hrabia, "pachotreasure");		
	//EARL ADDED AT STARTUP
	// 	Wld_InsertNpc		(GRD_4010_Hrabia,"OW_PATH_WARAN05_SPAWN02"); //L Beter
	// 	B_ExchangeRoutine	(GRD_4010_Hrabia, "pachotreasure");			

};
func void B_AfterDialog_Pacho_MonsterCam(var c_npc talker)
{
	B_AfterDialog_Pacho_MonsterCam_disabled=TRUE;
	
	Wld_InsertNpc(Pacho_Monster,"OW_PATH_MIS_PACHO_MONSTER");
	var c_npc monster; monster = hlp_getnpc(Pacho_Monster);	
	//ai_wait(hrabia,1);
	AI_SetWalkmode(hrabia,NPC_RUN);	
	// 	B_NpcDisablePerc(hrabia);
	Npc_ExchangeRoutine(grd_4010_hrabia,"start");
	//Mis_TeleportEarl=TRUE;
	// 	
	Wld_SendTrigger("CAM_TREASURE_MONSTER");
   
   AI_Teleport(hrabia, "OC1");
};

func void	B_AfterDialog_Duke_Patrol(var c_npc talker)
{
	B_AfterDialog_Duke_Patrol_disabled=TRUE;
	
	if (dick_patrol_choice == 1)//rozwi¹zanie si³owe
	{
		B_MisPatrolGRDChoiceAttack();		
	}
	// 	else if (dick_patrol_choice == 2)//pu³apka
	// 	{
	// 		B_MisPatrolGRDChoiceTrap();	
	// 	}	
	else if (dick_patrol_choice == 3)&&(patrol_trial==8)//negocjacje nieudane
	{
		B_MisPatrolGRDChoiceNegotiatie_Failure();	
	}	
	else if (dick_patrol_choice == 3)&&(patrol_trial==10)//negocjacje udane
	{
		B_MisPatrolGRDChoiceNegotiatie_Sucess();	
	}	
	else//inne
	{
		B_MisSetPatrolGRDToHostile();			
	};		
};
// Ork: Won mi st¹d z tym XD [TODO]
var int HH_Ratford_back_from_mages;
var int DAY_Ratford_back_from_mages;
FUNC VOID Rtn_MISGotoMages_818 ()
{
	
	var int mm; var int hh;
	hh = wld_getHour();
	mm = wld_getMin();
	HH_Ratford_back_from_mages=hh+4;
	DAY_Ratford_back_from_mages=Wld_GetDay();
	TA_Min		(self,	0,00, hh, 00,ZS_Ratford_AfterTalkToMages	 ,			"RATFORD_OR_1");
	TA_Min		(self,	hh,01, hh+4, mm,ZS_Ratford_SpeechToMages	 ,			"HC_TOWER_INDOOR");
	TA_Min		(self,	hh+4,mm+1, 23,59,ZS_Ratford_AfterTalkToMages	 ,			"RATFORD_OR_1");
	
};
func void	B_AfterDialog_Ratford_GotoMages(var c_npc talker)
{
	B_AfterDialog_Ratford_GotoMages_disabled=TRUE;
	
	var string slfwp; slfwp=talker.wp;
	AI_SetWalkmode 			(talker,NPC_RUN);

	B_ExchangeRoutine(talker,"MISGotoMages");

	// 	AI_GotoWP		(talker, "");//idzie do magów
	// 	AI_GotoWP		(talker, slfwp);//wraca od nich
	// 	AI_Wait		(hero, 10);//wraca od nich
};
func void B_AfterDialog_Iskra_Hello(var c_npc talker)
{	
	B_AfterDialog_Iskra_Hello_disabled = TRUE;
	Wld_SendTrigger("CAM_ADANRING_SHOW");	
};

func void B_AfterDialog_hun_4035_jahr_Hello(var c_npc talker)
{
	Wld_InsertNpc				(jahr_demon,"OC_ROUND_13");
	var c_npc dmn; dmn = Hlp_GetNpc(jahr_demon);

	B_ChangeAttribute	(talker, ATR_HITPOINTS, -(talker.attribute[ATR_HITPOINTS_MAX]));		
	B_ExchangeRoutine(talker,"INVISIBLE");			
	Npc_ClearAiQueue(talker);	
	AI_Teleport(talker,"INVISIBLE");	
	Wld_PlayEffect("spellFX_MassDeath_GROUND", dmn, dmn, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)	
	AI_StandUp 		(dmn);
	AI_TurnToNpc	(dmn, hero);
	AI_PlayAni		(dmn, "T_WARN"); 	
	B_AfterDialog_hun_4035_jahr_Hello_disabled=true;
};
//
// CHAPTER 3
//------------------------

func void B_AfterDialog_Info_Diego_Entrence(var c_npc talker)
{
	var c_npc a; a = Hlp_GetNpc(PC_THIEF);
	Mis_TeleportEarl=9;//clear old var
	Npc_ExchangeRoutine(a,"OC");	
	Npc_PerceiveAll		(a);
	Npc_SetTarget(a,a);
	B_DrawSpell		(a,	SPL_TELEPORT1,	SPL_SENDCAST_TELEPORT);
	AI_PlayAni		(a, "T_MAGRUN_2_HEASHOOT" );	
	a = Hlp_GetNpc(Stt_342_Harford);	
	B_ExchangeRoutine(a,"diegocome");	
	a = Hlp_GetNpc(STT_324_Balam);	
	B_ExchangeRoutine(a,"diegocome");	
	
	// 	Npc_ClearAiQueue(diego);	
	// 	AI_Teleport(diego,"INVISIBLE");	
	// 	Wld_PlayEffect("spellFX_MassDeath_GROUND", dmn, dmn, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)	
	// 	AI_StandUp 		(dmn);
	// 	AI_TurnToNpc	(dmn, hero);
	// 	AI_PlayAni		(dmn, "T_WARN"); 	
	B_AfterDialog_Info_Diego_Entrence_disabled=true;
};

func void B_AfterDialog_Info_Nameless_HiAgain(var c_npc talker)
{
	var c_npc a; a = Hlp_GetNpc(Nameless_SecondMeet);
	Hero_Meets_Informator=TRUE;
	Npc_ExchangeRoutine(a,"DEAD");	
	Npc_PerceiveAll		(a);
	Npc_SetTarget(a,a);
	B_DrawSpell		(a,	SPL_TELEPORT1,	SPL_SENDCAST_TELEPORT);
	Npc_ClearAiQueue(a);		
	Wld_PlayEffect("spellFX_Teleport", a, a, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)		
	AI_PlayAni		(a, "T_MAGRUN_2_HEASHOOT" );
	AI_Teleport(a,"INVISIBLE2");	
	Npc_ChangeAttribute(a,ATR_HITPOINTS,-9999);		
	a.attribute[ATR_HITPOINTS]=a.attribute[ATR_HITPOINTS]-a.attribute[ATR_HITPOINTS_MAX];
	
	B_AfterDialog_Info_Nameless_HiAgain_disabled=true;
};

func void B_AfterDialog_Info_Nameless_RBL4(var c_npc talker)
{
	var c_npc a; a = Hlp_GetNpc(Nameless_ThirdMeetGYD);
	Npc_ExchangeRoutine(a,"INVISIBLEGRYD");	
	Npc_PerceiveAll		(a);
	Npc_SetTarget(a,a);
	B_DrawSpell		(a,	SPL_TELEPORT1,	SPL_SENDCAST_TELEPORT);
	Npc_ClearAiQueue(a);		
	Wld_PlayEffect("spellFX_Teleport", a, a, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)		
	AI_PlayAni		(a, "T_MAGRUN_2_HEASHOOT" );
	AI_Teleport(a,"GRYD_073");
	Npc_ChangeAttribute(a,ATR_HITPOINTS,-9999);		
	a.attribute[ATR_HITPOINTS]=a.attribute[ATR_HITPOINTS]-a.attribute[ATR_HITPOINTS_MAX];
	
	B_AfterDialog_Info_Nameless_RBL4_disabled=true;
};
func void B_AfterDialog_Info_OrcGhost_Kill(var c_npc talker)
{
	talker.guild = GIL_UNDEADORC;
	Npc_SetPermAttitude	(talker, ATT_HOSTILE);
	AI_StopProcessInfos	(talker); 
	Npc_SetTarget(talker,hero); 
	AI_StartState(talker,ZS_ATTACK,0,""); 
	
	var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeetGYD);
	if(Hlp_IsValidNpc(nameless))
	{
		Npc_SetTarget(nameless,talker); 
		AI_StartState(nameless,ZS_ATTACK,1,"");   		
	};	
	B_AfterDialog_Info_OrcGhost_Kill_disabled=true;
};

// in 3rd chapter Roderic will go through gate and open it for us.
func void B_AfterDialog_Info_Roderic_Gate(var c_npc talker)
{
	//Npc_ExchangeRoutine(talker, "OpenGate");
	AI_teleport(talker, "OW_PATH_175_GATE2");
	
	AI_ALIGNTOWP(talker);
	AI_WAIT(talker, 1);
	//AI_UseMob		(talker, 	"VWHEEL", 0);						// ...dann wieder aufmachen!
	//AI_UseMob		(talker, 	"VWHEEL", -1);                      //und vom Mobsi abmelden
	// NOTE: Tymczasowo jest to zrobione tak, ale pozniej przydalby sie WP blizej kolowrotka zeby Roderic
	// faktycznie i fizycznie to otwiera³
	Wld_SendTrigger("EVT_OW_FOKUS_GATE_MOVER_01");
	AI_WAIT(talker, 1);
	Npc_ExchangeRoutine(talker, "Guide2");
	B_AfterDialog_Info_Roderic_Gate_disabled = true;
};

func void B_AfterDialog_Stigma_Death(var c_npc talker)
{
	var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
	var C_NPC nia; nia = Hlp_GetNpc(Non_660_Nia);
	sti.attribute[ATR_HITPOINTS] = sti.attribute[ATR_HITPOINTS_MAX]/10;

	Npc_SetPermAttitude	(sti, ATT_HOSTILE);
	Npc_SetTarget (talker,sti);
	Npc_SetTarget (sti,nia);
	AI_StartState (sti,ZS_ATTACK,1,"");
	B_StartAfterDialogFight(talker,sti,true);
	B_StartAfterDialogFight(sti,nia,true);
	
	B_AfterDialog_Stigma_Death_disabled = true;
};

func void B_ThingsToDoAfterDialog(var c_npc talker)
{
	// Fight after a dialog?
	if(AfterDialogFight_slf)
	{
		if(Hlp_GetInstanceID(talker)==AfterDialogFight_slf)
		{
			B_DoDialogFight();	
		};
	};
	// Generics:
	if(B_AfterDialog_Generic_KillHero_enabled)
	{
		B_AfterDialog_Generic_KillHero();
	};
	if(B_AfterDialog_Generic_KillHeroWithLightning_enabled)
	{
		B_AfterDialog_Generic_KillHeroWithLightning();
	};
	if(B_AfterDialog_Generic_KillHeroWithPoison_enabled)
	{
		B_AfterDialog_Generic_KillHeroWithPoison();
	};
	
	
	if(Hlp_GetInstanceID(talker)==STT_315_Sly)
	{
		B_AfterDialog_Sly(talker);
	};	
	if(Hlp_GetInstanceID(talker)==PIR_2601_Hank)&&(Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_Hello))&&(!B_AfterDialog_Hank_GameStart_disabled)
	{
		B_AfterDialog_Hank_GameStart(talker);
	};	
	if(Hlp_GetInstanceID(talker)==HUN_2615_Abel)&&(head_yes)&&(!B_AfterDialog_Abel_GotoCavalorn_disabled)
	{
		B_AfterDialog_Abel_GotoCavalorn(talker);
	};		
	if(Hlp_GetInstanceID(talker)== RBL_2604_Tony)&&(Story_RickSentry_MisState>=1)&&(!B_AfterDialog_Tony_Sentry_disabled)
	{
		B_AfterDialog_Tony_Sentry(talker);
	};
	if(Hlp_GetInstanceID(talker)==GRD_224_PACHO)&&(Npc_KnowsInfo (hero, DIA_Pacho_OreDig))
	{
		if(scorpio_traitor)&&(!B_AfterDialog_Pacho_ScorpioCam_disabled)
		{
			B_AfterDialog_Pacho_ScorpioCam(talker);	
		}
		else if(!B_AfterDialog_Pacho_EarlCamPrepare_disabled)
		{
			B_AfterDialog_Pacho_EarlCamPrepare(talker); 	 	
		};
	};
	if(Hlp_GetInstanceID(talker)==GRD_205_SCORPIO)&&(Npc_KnowsInfo (hero, DIA_Scorpio_AfterDig))&&(!B_AfterDialog_Pacho_EarlCamPrepare_disabled)
	{
		B_AfterDialog_Pacho_EarlCamPrepare(talker); 	 	
	};
	if(Hlp_GetInstanceID(talker)==GRD_4010_Hrabia)&&(Npc_KnowsInfo (hero, DIA_Hrabia_Ore))&&(!B_AfterDialog_Pacho_MonsterCam_disabled)
	{
		B_AfterDialog_Pacho_MonsterCam(talker); 	 	
	};


	//CH2
	if 
	(Hlp_GetInstanceID(talker)==GRD_4061_Guard)&&
	(
	(Npc_KnowsInfo (hero, DIA_Duke_Hello))
	)&&(!B_AfterDialog_Duke_Patrol_disabled)&&(dick_patrol_choice != 2)
	{
		B_AfterDialog_Duke_Patrol(talker); 	 	
	};
	if(Hlp_GetInstanceID(talker)==HUN_818_RATFORD)&&(DIA_RATFORD_SearchEnd.permanent == 0)&&(!B_AfterDialog_Ratford_GotoMages_disabled)
	{
		B_AfterDialog_Ratford_GotoMages(talker); 	 	
	};
	if(Hlp_GetInstanceID(talker)==Wisp_Adan)&&(Npc_KnowsInfo(hero,DIA_Iskra_Hello))&&(!B_AfterDialog_Iskra_Hello_disabled)
	{
		B_AfterDialog_Iskra_Hello(talker); 	 	
	};
	if(Hlp_GetInstanceID(talker)==hun_4035_jahr)&&(Npc_KnowsInfo(hero,DIA_hun_4035_jahr_Hello))&&(!B_AfterDialog_hun_4035_jahr_Hello_disabled)
	{
		B_AfterDialog_hun_4035_jahr_Hello(talker); 	 	
	};

	//CH3
	if(Hlp_GetInstanceID(talker)==PC_Thief)&&(Npc_KnowsInfo(hero,Info_Diego_Entrence))&&(!B_AfterDialog_Info_Diego_Entrence_disabled)
	{
		B_AfterDialog_Info_Diego_Entrence(talker); 	 	
	};
	if(Hlp_GetInstanceID(talker)==Nameless_SecondMeet)&&(Npc_KnowsInfo(hero,DIA_NoName_HiAgain))&&(!B_AfterDialog_Info_Nameless_HiAgain_disabled)
	{
		B_AfterDialog_Info_Nameless_HiAgain(talker); 	 	
	};

	if(Hlp_GetInstanceID(talker)==Nameless_ThirdMeetGYD)&&(Npc_KnowsInfo(hero,DIA_NoName_RBL4))&&(!B_AfterDialog_Info_Nameless_RBL4_disabled)
	{
		B_AfterDialog_Info_Nameless_RBL4(talker); 	 	
	};   

	if(Hlp_GetInstanceID(talker)==ORC_GHOST)&&(Npc_KnowsInfo(hero,Info_OrcGhost_Kill))&&(!B_AfterDialog_Info_OrcGhost_Kill_disabled)
	{
		B_AfterDialog_Info_OrcGhost_Kill(talker); 	 	
	}; 

	// DIA_Roderic_Wheel - nazwa Dialogu który to wypowiadany jest przed uruchomieniem B_AfterDialog_Info_Roderic_Gate
	if(Hlp_GetInstanceID(talker)==Roderic)&&(Npc_KnowsInfo(hero,DIA_Roderic_Wheel))&&(!B_AfterDialog_Info_Roderic_Gate_disabled)
	{
		B_AfterDialog_Info_Roderic_Gate(talker); 	 	
	}; 
	
	if(Hlp_GetInstanceID(talker)==Grd_611_Gardist)&&(Npc_KnowsInfo(hero, Info_Georg_Again1))&&(!B_AfterDialog_Stigma_Death_disabled)
	{
		B_AfterDialog_Stigma_Death(talker); 	 	
	}; 
};
