func void ZS_SitCampfireR()
{
	GuardPerception ();
	Npc_PercEnable  (self,	PERC_ASSESSPLAYER, 	B_AssessSC);
	
	if (!C_BodyStateContains(self, BS_SIT))
	{
		AI_StandUp		(self);				
		AI_SetWalkmode 	(self,NPC_WALK);
		AI_GotoWP		(self, self.wp);
		
		if (Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{																	
			AI_GotoFP (self, "FP_CAMPFIRE");
		}
		else
		{
			AI_StartState(self, ZS_Stand, 0, "");
		};
		
		Npc_SetAivar(self,AIV_HANGAROUNDSTATUS,  1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.MDS");
		Npc_SetAivar(self,AIV_HANGAROUNDSTATUS,  1);
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	};
	AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_SitCampfireR_loop()
{
};

func void ZS_SitCampfireR_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");	
};