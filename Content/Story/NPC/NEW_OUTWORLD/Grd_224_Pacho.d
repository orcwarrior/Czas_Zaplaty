instance GRD_224_Pacho (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Pacho";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_RBL;
	level 		=	15;
	voice 		=	0;//by³o minus 1 ale wywala³o 0 to pusty plik mowy budzis
	id 			=	224;
	flags			= NPC_FLAG_IMMORTAL;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 65;
	attribute[ATR_DEXTERITY] 	= 75;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",4,1,GRD_ARMOR_L);
        
   B_Scale (self);
	Mdl_SetModelFatness(self,0.1);
    	
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,130);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine	=	Rtn_start_224;
  	fight_tactic	=	FAI_HUMAN_MASTER;
};

FUNC VOID Rtn_start_224 ()
{
	TA_SitCampfire		(10,00,12,00,"LOCATION_16_OUT");	
	TA_SitCampfire		(12,00,10,00,"LOCATION_16_OUT");	
};

FUNC VOID Rtn_FOLLOW_224 ()
{
	TA_FollowPC		(02,00,14,00,"PATH_OC_NC_3");	
	TA_FollowPC		(14,00,02,00,"PATH_OC_NC_3");
};

FUNC VOID Rtn_OR_224 ()
{
	//TA_Smalltalk		(02,00,04,00,"WATCHTOWER2_TOP2"); //Pacho	
	TA_Boss				(06,00,22,00,"PATH_OC_NC_12");
	//TA_SitAround		(12,00,14,00,"WATCHTOWER2_TOP1");	
	//TA_Smalltalk			(14,00,16,00,"WATCHTOWER2_TOP2"); //Pacho
	TA_Sleep				(22,00,06,00,"PATH_OC_NC_12");
	//TA_Stand				(22,00,00,00,"WATCHTOWER2_AT1_4");	
	//TA_SitAround			(00,00,02,00,"WATCHTOWER2_AT1_4");	
};

Func Void Rtn_Alarm_224 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR16"); 
};

func void ZS_GuidePCPacho ()
{
	////PrintDebugNpc		(PD_TA_FRAME,"ZS_GuidePCPacho");
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self,PERC_ASSESSENEMY		,B_AssessEnemy				);
	Npc_PercEnable  	(self,PERC_ASSESSPLAYER		,B_GuidePC_AssessPlayer		);
	Npc_SetPercTime		(self,1);
	self.senses_range	 = HAI_DIST_ASSESS_MONSTER;
	self.senses			 = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	
	// Wahrnehmungen passiv
	Npc_PercEnable  	(self,PERC_ASSESSDAMAGE		,ZS_ReactToDamage			);
	Npc_PercEnable  	(self,PERC_ASSESSMAGIC		,B_AssessMagic				);
	Npc_PercEnable  	(self,PERC_ASSESSMURDER		,ZS_AssessMurder				);
	Npc_PercEnable  	(self,PERC_ASSESSDEFEAT		,ZS_AssessDefeat				);
	Npc_PercEnable  	(self,PERC_ASSESSFIGHTSOUND	,B_AssessFightSound			);
	Npc_PercEnable  	(self,PERC_ASSESSTALK			,B_AssessTalk 					);
	Npc_PercEnable  	(self,PERC_ASSESSCALL			,B_GuidePC_AssessCall		);
};

func int ZS_GuidePCPacho_Loop ()
{	
	////PrintDebugNpc		(PD_TA_LOOP,"ZS_GuidePCPacho_Loop");
	//PRINTGlobals		(PD_TA_CHECK);
	if (Npc_GetDistToWP(self,"WITAMYWHC") < 900)
	{
		B_ExchangeRoutine(self,"pachotreasure2");
	};
	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self,hero) > PERC_DIST_DIALOG)
	{
		B_GuidePC_AssessPlayer();
	}
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		////PrintDebugNpc	(PD_TA_CHECK,"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self,BS_SWIM)
		{
			AI_SetWalkmode	(self,NPC_RUN);
		};
      
		AI_StopLookAt	(self);
		AI_GotoWP		(self,self.wp);
	}
	//-------- Ziel erreicht ! --------
	else
	{
		B_SmartTurnToNpc(self,hero);
	};

	AI_Wait(self,1);		
	return LOOP_CONTINUE;
};
	
func int ZS_GuidePCPacho_End ()
{	
	////PrintDebugNpc		(PD_TA_FRAME,"ZS_GuidePCPacho_End");

	//-------- aktive Wahrnehmungen wieder auf Default zurückstellen -------
	self.senses_range	 = hero.senses_range;
	self.senses			 = hero.senses;
};

FUNC VOID Rtn_pachotreasure_224 ()
{
	TA_Min(self,21,10,21,09,ZS_GuidePCPacho,"WITAMYWHC");
};

FUNC VOID Rtn_pachotreasure2_224 ()
{
	TA_GUIDEPC(21,10,21,09,"OW_PATH_MIS_PACHO_TREASURE");
};

FUNC VOID Rtn_pachotressurewait4hero_224 ()
{
	TA_Stand(21,10,21,09,"SPAWN_OW_LURKER_RIVER2_BEACH3");
};

FUNC VOID Rtn_GuideToTalking_224 ()
{
   Ta_GuidePC (0,00,12,00,"WITAMYWHC"); 
   Ta_GuidePC (12,00,0,00,"WITAMYWHC"); 
};

FUNC VOID Rtn_GUIDEWOLF_224 ()
{
   Ta_GuidePC (0,00,12,00,"MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01"); 
   Ta_GuidePC (12,00,0,00,"MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01"); 
};