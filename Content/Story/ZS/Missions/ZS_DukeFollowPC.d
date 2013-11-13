//////////////////////////////////////////////////////////////////////////
//	ZS_DukeFollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_DukeFollowPC()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_DukeFollowPC");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSc	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob			);			
};

func int ZS_DukeFollowPC_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_DukeFollowPC_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (patrol_trial == 4)&&(Npc_GetDistToWP (self,"LOCATION_15_IN_2") < 500 )
	{
		patrol_trial = 3;
		var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
		var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
		var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);		
		Party_AddNpc(angus);
		Party_AddNpc(hank);
		Party_AddNpc(rodney);
		AI_DrawWeapon(angus);
		AI_DrawWeapon(rodney);
		AI_DrawWeapon(hank);
		AI_Output (self, NULL, "DIA_Duke_Trap_11_01"); //To pu³apka! Zabiæ tego skurwiela!
    	
		B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy wpadli w zasadzkê - czas skoñczyæ tê farsê.");

 		AI_Wait		(CH2_Patrol_g1,2);
		AI_Wait		(CH2_Patrol_g2,2);
		AI_Wait		(CH2_Patrol_g3,2);
		AI_Wait		(CH2_Patrol_g4,2);
		AI_Wait		(CH2_Patrol_g5,2);	   	
			/***********
		Atak w miejscu zasadzki
		***********/		
		B_ExchangeRoutine(hank,"InHC");
		B_ExchangeRoutine(rodney,"InHC");
		B_ExchangeRoutine(angus,"InHC");
		B_MisSetPatrolGRDToHostile();			
	};
	if (Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC/2)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_DukeFollowPC_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;

};
