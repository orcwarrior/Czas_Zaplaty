/*****************************************************
*      NSC sucht SPEECH-FP und stelt sich hin        *
*****************************************************/

//### Gesten fehlen noch

func void ZS_Tony_GuideToSentry()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Tony_GuideToSentry");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_AlignToFP( self );				//Richte Dich aus
	AI_GotoWP		(self,	"OM_WATCHTOWER01_UNDER_1");

};

func void ZS_Tony_GuideToSentry_Loop()
{
    //PrintDebugNpc(PD_TA_LOOP,"ZS_Tony_GuideToSentry_Loop");   
	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		B_GuidePC_AssessPlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,"OM_WATCHTOWER01_UNDER_1") < 300)
	{
		//PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_SetWalkmode	(self,	NPC_RUN);
		AI_StopLookAt	(self);
		AI_GotoWP		(self,	self.wp);
	}	
	else if (Npc_GetDistToWP(self,"OM_WATCHTOWER01_UNDER_1") > PERC_DIST_DIALOG)
	{
		//PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_StopLookAt	(self);
		AI_GotoWP		(self,	self.wp);
	}
	
	//-------- Ziel erreicht ! --------
	else
	{
		B_SmartTurnToNpc(self,	hero);
	};
	
		AI_SetWalkmode (self,NPC_RUN);		// Walkmode für den Zustand


};

func void ZS_Tony_GuideToSentry_End ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Tony_GuideToSentry_End");
};
	
