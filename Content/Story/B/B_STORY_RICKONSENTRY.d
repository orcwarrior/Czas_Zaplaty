var int Story_RickSentry_Timer;
//var int Story_RickSentry_MisState;// Moved to Mission Per Frame events
var int Story_RickSentry_AlertShowed;
var int Story_RickSentry_EndHour;
var int Story_RickSentry_supriseherocanattack;
var int Story_RickSentry_namelessdispeared;
var int Story_RickSentry_suprisetrolldead;
INSTANCE GRD_2779_3RDWAVEGARDIST (NPC_DEFAULT)
{
	//-------- primary data --------
	name 		= 	"Wystraszony stra¿nik";
	npctype		= 	NPCTYPE_GUARD;
	guild 		=	GIL_DMB; 
	id 			= 	2729;
	voice 		=	6;
	level		= 	18;
	flags		=	NPC_FLAG_INSTANTDEATH;
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 50;
	attribute[ATR_HITPOINTS] 	= 50;
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 12,  1, GRD_ARMOR_L);
	/////////////////////////////////////////
	
	//-------------Daily Routine-------------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 25);
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	fight_tactic	=	FAI_HUMAN_COWARD;

	daily_routine = Rtn_start_2779;
};

FUNC VOID Rtn_start_2779 ()
{
	TA_Min		(self,  0,00, 23,59, ZS_3rdWaveGRD,				"MIS_SENTRY_THIRDSPAWN");
};

//////////////////////////////////////////////////////////////////////////
//	ZS_Stay
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_3rdWaveGRD ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_3rdWaveGRD");
	
	//-------- Wahrnehmungen --------
	B_SetPerception			(self);
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Vorbereitungen --------
	if (Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkmode			(self,	NPC_RUN);
	}
	else
	{
		AI_SetWalkmode			(self,	NPC_WALK);
	};
	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	"OW_PATH_3_01");						// Gehe zum Tagesablaufstart
};

func void ZS_3rdWaveGRD_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_3rdWaveGRD_Loop");
	
	AI_Wait					(self,	1);
	
	Npc_SetTarget(self,hero);	
	AI_Attack(self);	
};

func void ZS_3rdWaveGRD_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_3rdWaveGRD_End");
	self.senses	=			hero.senses;
};

//*************
//	WAVE's
//*************
 var C_NPC FUCKINGBIGTROLL;
func void B_Story_RickOnSentry_FirstWave()
{
	Wld_InsertNpc(RickOnSentry_FirstWave_Scavenger_1,"MIS_SENTRY_FIRSTSPAWN");
	Wld_InsertNpc(RickOnSentry_FirstWave_Scavenger_2,"MIS_SENTRY_FIRSTSPAWN");
	Wld_InsertNpc(RickOnSentry_FirstWave_Scavenger_3,"MIS_SENTRY_FIRSTSPAWN");
};

func void B_Story_RickOnSentry_FirstWave2()
{
	var C_NPC S1; var C_NPC S2; var C_NPC S3;    	
	S1=Hlp_GetNpc(RickOnSentry_FirstWave_Scavenger_1);
	S2=Hlp_GetNpc(RickOnSentry_FirstWave_Scavenger_2);
	S3=Hlp_GetNpc(RickOnSentry_FirstWave_Scavenger_3);		
	
	AI_GotoWP(S1,"OW_PATH_268");
	AI_GotoWP(S2,"OW_PATH_268");	
	AI_GotoWP(S3,"OW_PATH_268");	
	
	Npc_SetTarget(S1,hero);
	Npc_SetTarget(S2,hero);	
	Npc_SetTarget(S3,hero);	
		
	AI_Attack(S1);
	AI_Attack(S2);	
	AI_Attack(S3);	
};
func void B_Story_RickOnSentry_SecondWave()
{
	Wld_InsertNpc(OrcWarrior_2ndWave,"MIS_SENTRY_SECONDSPAWN");

};
func void B_Story_RickOnSentry_SecondWave2()
{
    var C_NPC ORCWARRIOR;	
	ORCWARRIOR=Hlp_GetNpc(OrcWarrior_2ndWave);
	
	AI_GotoWP(ORCWARRIOR,"OW_PATH_268");
	
	Npc_SetTarget(ORCWARRIOR,hero);	
	AI_Attack(ORCWARRIOR);
};
func void B_Story_RickOnSentry_ThirdWave()
{
	Wld_InsertNpc(GRD_2779_3rdWaveGardist,"MIS_SENTRY_THIRDSPAWN");
};
func void B_Story_RickOnSentry_ThirdWave2()
{
    var C_NPC GRD;	
	GRD=Hlp_GetNpc(GRD_2779_3rdWaveGardist);
	
	AI_GotoWP(GRD,"OW_PATH_3_01");

};
func void B_Story_RickOnSentry_Surprise()
{
	Story_RickSentry_supriseherocanattack=TRUE;			
	Wld_InsertNpc(SurpriseTroll,"MIS_SENTRY_TROLLSPAWN");

	FUCKINGBIGTROLL=Hlp_GetNpc(SurpriseTroll);
	Wld_SendTrigger("OR_TROLLSPAWN");

};
func void B_Story_RickOnSentry_Surprise2()
{
	Story_RickSentry_supriseherocanattack=2;
	FUCKINGBIGTROLL=Hlp_GetNpc(SurpriseTroll);	
	
	Wld_InsertNpc(Nameless_FirstMeet,"MIS_SENTRY_SECONDSPAWN");
	Npc_ClearAIQUeue(FUCKINGBIGTROLL);	
	AI_PlayAni(FUCKINGBIGTROLL,"T_WARN");		

	Log_CreateTopic	(CH1_Rbl_NoName, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_NoName, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_NoName, "Pierwszy raz spotka³em siê w Kolonii z ludzkim odruchem. Jakiœ Bezimienny skazaniec uratowa³ mi ty³ek, kiedy pojawi³o siê ogromne i w³ochate bydle - to musia³ byæ troll. Szkoda, ¿e nie zd¹¿y³em mu chocia¿ postawiæ piwa. Kto wie mo¿e jeszcze nasze drogi siê skrzy¿uj¹?");	
};

func void B_Story_RickOnSentry_Surprise3()
{
	FUCKINGBIGTROLL=Hlp_GetNpc(SurpriseTroll);	
   	var c_npc namelesshero;
	namelesshero=Hlp_GetNpc(Nameless_FirstMeet);
	
	//AI_GotoWP(namelesshero,"SPAWN_OW_SCAVENGER_AL_ORC");
	AI_ReadyMeleeWeapon(namelesshero);
	
	Npc_SetTarget(namelesshero,FUCKINGBIGTROLL);	
	AI_Attack(namelesshero);
	AI_Defend(FUCKINGBIGTROLL);
};

func void B_Story_RickOnSentry_NamelessDispear()
{
	//TODO:COrrect
   	var c_npc namelesshero;
	namelesshero=Hlp_GetNpc(Nameless_FirstMeet);
	Mdl_ApplyOverlayMds(namelesshero,"HUMANS_SPRINT.MDS");
	AI_RemoveWeapon(namelesshero);
	AI_GotoWP(namelesshero,"SPAWN_OW_BLOODFLY_OC_PSI");
};

//Main function

func void B_Story_RickOnSentry()
{
   var c_npc namelesshero;
	namelesshero=Hlp_GetNpc(Nameless_FirstMeet);	
	FUCKINGBIGTROLL=Hlp_GetNpc(SurpriseTroll);	
	
	if(Npc_GetDistToWP(hero,"WITAMYWHC")<1000)
	{
		Story_RickSentry_Timer+=1;
	}
	else if(Story_RickSentry_Timer==40)||(Story_RickSentry_Timer==41)||(Story_RickSentry_Timer==80)||(Story_RickSentry_Timer==81)||(Story_RickSentry_Timer==105)||(Story_RickSentry_Timer==106)
	{
		Story_RickSentry_Timer+=1;	
	}
	else if(!Story_RickSentry_supriseherocanattack)
	{
		PutMsg("Wróæ na miejsce warty!","font_default.tga",RGBAToZColor(255,100,100,255),2,"");			
	};
	if(Story_RickSentry_Timer==40)
	{
		B_Story_RickOnSentry_FirstWave();	
	}
	else if(Story_RickSentry_Timer==41)
	{
		B_Story_RickOnSentry_FirstWave2();
			
	}	
	else if(Story_RickSentry_Timer==80)
	{
		B_Story_RickOnSentry_SecondWave();
			
	}		
	else if(Story_RickSentry_Timer==81)
	{
		B_Story_RickOnSentry_SecondWave2();			
	}	
	else if(Story_RickSentry_Timer==105)
	{
		B_Story_RickOnSentry_ThirdWave();	
	}	
	else if(Story_RickSentry_Timer==106)
	{
		B_Story_RickOnSentry_ThirdWave2();	
	};		
	var C_NPC ThirdWaveGrd;	ThirdWaveGrd = Hlp_GetNPC(GRD_2779_3rdWaveGardist);	
	if(Story_RickSentry_supriseherocanattack==TRUE)
	{
		B_Story_RickOnSentry_Surprise2();
	};	
   
	if(Npc_GetDistToWP(Nameless_FirstMeet,"SPAWN_OW_SCAVENGER_AL_ORC")<6000)	//Hero Attack
	{
		B_Story_RickOnSentry_Surprise3();		
	};
			
	if(Npc_IsDead(ThirdWaveGrd))&&(Hlp_IsValidNpc(ThirdWaveGrd))&&(Story_RickSentry_supriseherocanattack==FALSE)
	{
		B_Story_RickOnSentry_Surprise();
	};				

	if(Story_RickSentry_namelessdispeared)&&((Npc_GetDistToWP(namelesshero,"SPAWN_OW_BLOODFLY_OC_PSI")<1000)||(Npc_GetDistToPlayer(namelesshero)>3800))	//RemoveHero
	{
		Npc_ExchangeRoutine			(namelesshero,"INVISIBLE");		
		Npc_ClearAIQueue(namelesshero);
		AI_Teleport(namelesshero,"OC1");
		namelesshero.flags = 0;
		Npc_ChangeAttribute	(namelesshero, ATR_HITPOINTS, -namelesshero.attribute[ATR_HITPOINTS_MAX]);
		Story_RickSentry_MisState=2;		
	};
   
	if(Npc_IsDead(FUCKINGBIGTROLL))&&(Hlp_IsValidNpc(FUCKINGBIGTROLL))&&(Story_RickSentry_namelessdispeared==0)
	{
		Story_RickSentry_namelessdispeared=1;
		B_Story_RickOnSentry_NamelessDispear();
	};		
   
	if(Wld_IsTime(Story_RickSentry_EndHour,00,Story_RickSentry_EndHour,02))
	{
		Story_RickSentry_MisState=3;		
	};
};