//////////////////////////////////////////////////////////////////////////
//	ZS_Ratford_Kat_GotoPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Ratford_Kat_GotoPC()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Ratford_Kat_GotoPC");
	B_ClearPerceptions ();	
	//  Wahrnehmungen aktiv 
 					
 	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_NoReact				);
	Npc_SetPercTime		(self,	0);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
};

func int ZS_Ratford_Kat_GotoPC_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Ratford_Kat_GotoPC_Loop");
	//PrintGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
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
func void ZS_Ratford_Kat_GotoPC_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;

};

