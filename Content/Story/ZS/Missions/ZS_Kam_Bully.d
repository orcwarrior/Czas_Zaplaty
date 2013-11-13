func void ZS_Kam_Bully()
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
		AI_PlayAniBS (self,"T_STAND_2_SIT",BS_SIT);
	};
	AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_Kam_Bully_loop()
{
	if(!Npc_KnowsInfo (hero, DIA_Kam_First))
	{
		
		if(Npc_GetDistToWP(self,"PATH_OC_NC_27A")<Npc_GetDistToWP(self,"PATH_OC_NC_27"))&&(NPc_GetDistToPlayer(self)<1900)
		{
			AI_SetWalkmode 	(self,NPC_WALK);
			//AI_GotoWp(self,"PATH_OC_NC_27");
			AI_StartState(self,ZS_BOSS,0,"PATH_OC_NC_27");
			AI_TurnToNpc(self,hero);
		}
		else IF(NPc_GetDistToPlayer(self)>1600)&&(Npc_GetDistToWP(self,"PATH_OC_NC_27A") > Npc_GetDistToWP(self,"PATH_OC_NC_27"))
		{
			AI_SetWalkmode 	(self,NPC_RUN);
			Ai_GotoNpc(self,hero);
		};
	};
};

func void ZS_Kam_Bully_end()
{
	AI_PlayAni(self,"T_SIT_2_STAND");	
};