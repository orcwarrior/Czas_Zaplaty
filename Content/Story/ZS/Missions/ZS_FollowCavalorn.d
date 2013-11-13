//////////////////////////////////////////////////////////////////////////
//	ZS_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_FollowCavalorn()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy		);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_FollowPC_AssessSC	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range = 3000;
	var c_npc a;
	a = Hlp_GetNPC(HUN_336_Cavalorn);	
	a.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	a.senses_range = 3000;	
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

func int ZS_FollowCavalorn_Loop()
{
		var C_NPC guider; guider = Hlp_GetNpc(HUN_336_Cavalorn);
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_FollowPC_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);
	
	//-------- SC-Meister folgen ! --------
	if(Npc_HasItems(self,ItFo_Potion_Health_02)<4)
	{
	CreateInvItems(self,ItFo_Potion_Health_02,2);	
	};
	if(Npc_HasItems(guider,ItFo_Potion_Health_02)<4)
	{
	CreateInvItems(guider,ItFo_Potion_Health_02,2);	
	};
	if (Npc_GetDistToWP(self,Npc_GetNearestWp(guider)) > HAI_DIST_FOLLOWPC)
	{
		if	!C_BodyStateContains(self, BS_SWIM)
		{	
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_GotoWP		(self,	Npc_GetNearestWp(guider));
	}
	else if (Npc_GetDistToWP(self,Npc_GetNearestWp(guider)) < 200)
	{
		AI_Dodge		(self);
	}
	else
	{
		B_SmartTurnToNpc(self,	guider);
	};
	
	AI_WaitMS				(self,	550);
	return				LOOP_CONTINUE;
};

func void ZS_FollowCavalorn_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPC_End");

	self.senses =		hero.senses;
	self.senses_range = hero.senses_range;
	var c_npc a;
	a = Hlp_GetNPC(HUN_336_Cavalorn);		
	a.senses =		hero.senses;     
	a.senses_range = hero.senses_range;
};

