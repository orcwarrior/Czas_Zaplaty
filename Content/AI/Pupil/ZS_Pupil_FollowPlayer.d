//////////////////////////////////////////////////////////////////////////
//	ZS_Pupil_FollowPlayer
//	===========
//	
//	Now func use only 4 testing!
//////////////////////////////////////////////////////////////////////////       
var int Pupil_StateRnd;
var int Pupil_Bark_CheckingGuild;
func void ZS_Pupil_FollowPlayer()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Pupil_FollowPlayer");
	Pupil_State=FOLLOW;
	Pupil_SetPerception();
	//AI_GotoWP		(self, self.wp);
	//AI_AlignToWP	(self);
	Pupil_StateRnd = Hlp_Random(120);
	Pupil_Bark_CheckingGuild=0;
};

func int ZS_Pupil_FollowPlayer_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Pupil_FollowPlayer_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);
	if(Npc_HasBodyFlag	(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);		
	}; 	
	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) > 400)
	{

		AI_GotoNpc		(self,	hero);
	}
	else
	{
		B_SmartTurnToNpc(self,hero);
	};
	//Check if hero is near OR he hasn't change his distance too much
	var oCNPC hiro;
	hiro = hlp_Getnpc(pc_hero);	
	if(Npc_GetDistToNpc(self,hero)<800)||
	((Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache0_pos[0],hero_cache0_pos[2]) < 500)&&(Npc_GetDistToNpc(self,hero)<1800))
	{

		//BARK
		if(Wld_DetectNpcEx (self,-1,NOFUNC,Pupil_Bark_CheckingGuild,0))&&((120+Pupil_StateRnd)%2==1)
		{
			if(Npc_GetDistToNpc(self,other)<1100)&&(Npc_GetPermAttitude(self,other) <=ATT_ANGRY)&&(Npc_GetStateTime(self)>60+Pupil_StateRnd)
			{
					if(Npc_HasBodyFlag	(self,BS_SIT))
					{
						AI_PlayAni(self,"T_SIT_2_STAND");		
					}; 		
				Npc_SetStateTime(self,0);
				AI_TurnToNpc(self,other);
				AI_PlayAni(self,"R_BARK");		
				Pupil_StateRnd = Hlp_Random(60);
			};
		};
		//HOWL
		if(Wld_IsTime(22,00,05,00))&&(Npc_GetStateTime(self)>60+Pupil_StateRnd)&&((60+Pupil_StateRnd)%2==0)
		{
			Npc_SetStateTime(self,0);
			if(Npc_HasBodyFlag	(self,BS_STAND))
			{
				AI_PlayAni(self,"T_STAND_2_SIT");		
			}; 		
			AI_PlayAniBS(self,"R_HOWL",BS_SIT);		
			Pupil_StateRnd = Hlp_Random(60);
		};
					if(Npc_HasBodyFlag	(self,BS_SIT))
					{
						AI_PlayAni(self,"T_SIT_2_STAND");		
					};		
	};
	Pupil_StateRnd=Pupil_StateRnd+1;
	Pupil_Bark_CheckingGuild=Pupil_Bark_CheckingGuild+1;
	if(Pupil_Bark_CheckingGuild==16){Pupil_Bark_CheckingGuild=0;};
	Ai_WaitMS(self,225);
	
	B_Pupil_AssessItem();
	return				LOOP_CONTINUE;
};
func void ZS_Pupil_FollowPlayer_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Pupil_FollowPlayer_End");

};