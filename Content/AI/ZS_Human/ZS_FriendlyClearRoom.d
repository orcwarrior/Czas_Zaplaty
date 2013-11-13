func void ZS_FriendlyClearRoom ()
// June 23, 2009 added by orc
{
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_FriendlyClearRoom" );				
	C_ZSInit();
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE  		,	ZS_ReactToDamage	);		
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);			
	Npc_PercEnable  	(self, 	PERC_ASSESSENTERROOM	,	B_ClearRoomEnterRoom);			
	Npc_PercEnable  	(self, 	PERC_ASSESSUSEMOB		,	B_ClearRoomUseMob	);			
	Npc_PercEnable  	(self,	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self,	PERC_MOVENPC			,	B_StopGotoHero		);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_AssessTheft 				);
	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);

	
	C_ZSInit();
	
    Npc_PercDisable	(self,	PERC_MOVENPC);
    AI_SetWalkmode	(self,	NPC_RUN);
    var string nearestwphero;
    nearestwphero = Npc_GetNearestWP(other);
    Ai_GotoWp(self,nearestwphero);
    //AI_GotoNpc		(self,	other); 		
	B_WhirlAround		(self,	other);
    AI_PointAtNpc		(self,	other);
    B_Say				(self,	other,	"$WHATDOYOUWANT");
    AI_StopPointAt		(self);		
    AI_SetWalkmode		(self,	NPC_RUN);
	Npc_SetTarget		(self,	other);		
};

func int ZS_FriendlyClearRoom_Loop ()
{
	PrintDebugNpc( PD_ZS_LOOP, "ZS_FriendlyClearRoom_Loop" );				
	var int portalguild;	portalguild = Wld_GetPlayerPortalGuild();
		
	if (Wld_GetPlayerPortalGuild () == GIL_NONE)
	{
		return LOOP_END;
	}
	else
	{
		PrintDebugNpc( PD_ZS_CHECK, "...Hero still in room!" );	
		if (Npc_GetStateTime(self) > 12)&&(Npc_GetStateTime(self) < 13)
		{
		B_Say			(self,	other,	"$ISAIDWHATDOYOUWANT");	
		}
		else if (Npc_GetStateTime(self) > 20)
		{
			Npc_SetAttitude				(self,ATT_NEUTRAL);
			Npc_SetTempAttitude			(self,ATT_NEUTRAL);
			
			B_FullStop		(self);
    		AI_StartState		(self,	ZS_ClearRoom, 0, "");			
		};
		return LOOP_CONTINUE;
	};
	B_WhirlAround		(self,	other);	
	AI_Wait				(self,	1);
	return LOOP_CONTINUE;	
};

func void ZS_FriendlyClearRoom_End ()
{
	PrintDebugNpc( PD_ZS_FRAME, "ZS_FriendlyClearRoom_End" );					
};	