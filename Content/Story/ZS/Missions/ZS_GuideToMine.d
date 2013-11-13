//////////////////////////////////////////////////////////////////////////
//	ZS_GuideToMine
//	==========
//	Ein TA-Zustand, der zum angegebenen Waypoint geht, aber auf den SC
//	wartet, falls dieser zu weit zurückfällt.
//////////////////////////////////////////////////////////////////////////
func void ZS_GuideToMine ()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_GuideToMine");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_GuidePC_AssessPlayer		);
	Npc_SetPercTime		(self,	1);
	self.senses_range	 = HAI_DIST_ASSESS_MONSTER;
	self.senses			 = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	
	// Wahrnehmungen passiv
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 					);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_GuidePC_AssessCall		);
};

func int ZS_GuideToMine_Loop ()
{	
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_GuideToMine_Loop");
	//PRINTGlobals		(PD_TA_CHECK);
	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		B_GuidePC_AssessPlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,"OW_OM_ENTRANCE02") > PERC_DIST_DIALOG)
	{
		////PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_StopLookAt	(self);
		AI_GotoWP		(self,"OW_OM_ENTRANCE02");
	}
	
	//-------- Ziel erreicht ! --------
	else
	{

		B_SmartTurnToNpc(self,	hero);
	};

	AI_Wait				(self,	1);		
	return				LOOP_CONTINUE;
};
	
func int ZS_GuideToMine_End ()
{	
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_GuideToMine_End");

	//-------- aktive Wahrnehmungen wieder auf Default zurückstellen -------
	self.senses_range	 = hero.senses_range;
	self.senses			 = hero.senses;
};

























