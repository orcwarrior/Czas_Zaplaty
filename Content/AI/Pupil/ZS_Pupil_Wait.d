//////////////////////////////////////////////////////////////////////////
//	ZS_Pupil_Wait
//	===========
//	
//	Now func use only 4 testing!
//////////////////////////////////////////////////////////////////////////


func void ZS_Pupil_Wait()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Pupil_Wait");
	Pupil_State=WAIT;
	Pupil_SetPerceptionWait();
	AI_SetWalkmode 			(self,NPC_RUN);
	AI_GotoWP		(self,self.wp);
	if (Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
	{																	
		AI_GotoFP (self, "FP_CAMPFIRE");
	};	
	Pupil_Bark_CheckingGuild = 0;
	Npc_ClearAiQueue(self);
	AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	Pupil_StateRnd = Hlp_Random(4*60);
};

func int ZS_Pupil_Wait_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Pupil_Wait_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);
	if(!Npc_HasBodyFlag	(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);		
	}; 	
	if(Npc_GetDistToPlayer(self)<300)
	{
	AI_LookAtNpc			(self,other);	
	}
	else if(Npc_GetDistToPlayer(self)<1000)
	{
		AI_StopLookAt(self);
	};

		//PEE
	if(Wld_IsFPAvailable(self,"PEE"))&&(Npc_GetStateTime(self)>4*60+Pupil_StateRnd)&&((60+Pupil_StateRnd)%3==0)
	{
				if(Npc_HasBodyFlag	(self,BS_SIT))
				{
					AI_PlayAni(self,"T_SIT_2_STAND");		
				}; 	
		Npc_SetStateTime(self,0);
		AI_GotoFP		(self,	"PEE");
		AI_PlayAni		(self,	"R_PEE");
		AI_GotoWP(self,self.wp);
		Pupil_StateRnd = Hlp_Random(60);
	};	
	//BARK
	if(Wld_DetectNpcEx (self,-1,NOFUNC,Pupil_Bark_CheckingGuild,0))&&((60+Pupil_StateRnd)%3==1)
	{
		if(Npc_GetDistToNpc(self,other)<1100)&&(Npc_GetPermAttitude(self,other) <=ATT_ANGRY)&&(Npc_GetStateTime(self)>4*60+Pupil_StateRnd)
		{
				if(Npc_HasBodyFlag	(self,BS_SIT))
				{
					AI_PlayAni(self,"T_SIT_2_STAND");		
				}; 		
			Npc_SetStateTime(self,0);
			AI_TurnToNpc(self,other);
			AI_PlayAni(self,"R_BARK");		
			Pupil_StateRnd = Hlp_Random(4*60);
		};
	};
	//HOWL
	if(Wld_IsTime(22,00,05,00))&&(Npc_GetStateTime(self)>4*60+Pupil_StateRnd)&&((60+Pupil_StateRnd)%3==2)
	{
		Npc_SetStateTime(self,0);
		AI_PlayAniBS(self,"R_HOWL",BS_SIT);		
		Pupil_StateRnd = Hlp_Random(4*60);
	};
	Ai_WaitMS(self,225);
	B_Pupil_AssessItem();	
	Pupil_Bark_CheckingGuild=Pupil_Bark_CheckingGuild+1;
	if(Pupil_Bark_CheckingGuild==16){Pupil_Bark_CheckingGuild=0;};
	
	return LOOP_CONTINUE;
};
func void ZS_Pupil_Wait_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);

};