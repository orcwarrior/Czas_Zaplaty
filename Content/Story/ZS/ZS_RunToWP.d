func void ZS_RunToWP ()
{
	Npc_PercEnable (self, PERC_ASSESSENEMY , B_AssessEnemy );
	Npc_SetPercTime (self, 1);
	self.senses_range = HAI_DIST_ASSESS_MONSTER;
	self.senses = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;

	Npc_PercEnable (self, PERC_ASSESSDAMAGE , ZS_ReactToDamage );
	Npc_PercEnable (self, PERC_ASSESSMAGIC , B_AssessMagic );
	Npc_PercEnable (self, PERC_ASSESSMURDER , ZS_AssessMurder );
	Npc_PercEnable (self, PERC_ASSESSDEFEAT , ZS_AssessDefeat );
	Npc_PercEnable (self, PERC_ASSESSFIGHTSOUND , B_AssessFightSound );
	Npc_PercEnable (self, PERC_ASSESSTALK , B_AssessTalk );
};

func int ZS_RunToWP_Loop ()
{
	PrintGlobals (PD_TA_CHECK);

	if (Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		if !C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode (self, NPC_RUN);
		};
		
		AI_StopLookAt (self);
		AI_GotoWP (self, self.wp);
	};

	AI_Wait (self, 1);
	return LOOP_CONTINUE;
};

func int ZS_RunToWP_End ()
{
	self.senses_range = hero.senses_range;
	self.senses = hero.senses;
};