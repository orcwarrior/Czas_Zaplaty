

func void B_LookAtOther ()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_NoReact" );
	if(!Npc_CanSeeNpc(self,other))
	{
		AI_TurnToNpc(self,other);
	};
		AI_LookAtNpc(self,other);
};