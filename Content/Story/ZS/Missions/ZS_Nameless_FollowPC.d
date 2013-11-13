//////////////////////////////////////////////////////////////////////////
//	ZS_Nameless_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Nameless_FollowPC()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Nameless_FollowPC");
	
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

func int ZS_Nameless_FollowPC_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Nameless_FollowPC_Loop");
	//PrintGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > 300)//HAI_DIST_FOLLOWPC)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoNpc		(self,	hero);
	}
	else
	{
	B_CheckForImportantInfo (self,hero);		
		B_SmartTurnToNpc(self,	hero);
	};
	AI_Wait				(self,	0.2);
	return				LOOP_CONTINUE;
};
func void ZS_Nameless_FollowPC_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;

};

