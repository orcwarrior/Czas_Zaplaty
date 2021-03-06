// ****************************
// NSC benutzt S�ge Mobsi
// ****************************

FUNC VOID ZS_Saw ()
{
	B_SetPerception (self);    
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
};

FUNC int ZS_Saw_Loop ()
{
	// ------ Saegen ------
	if (!C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
	&& (Wld_IsMobAvailable(self,"BAUMSAEGE"))
	{
		CreateInvItem(self,ItMi_Saw);
		AI_UseMob (self, "BAUMSAEGE", 1);
	};
	
	// ------ Random-Ani beim H�mmern ------
	if (Npc_GetStateTime(self) > 15)
	&& (C_BodyStateContains(self, BS_MOBINTERACT_INTERRUPT))
    {
    	Npc_SetStateTime (self, 0);
    };
	
	return LOOP_CONTINUE;
};

FUNC VOID ZS_Saw_End ()
{
	AI_UseMob (self, "BAUMSAEGE", -1);
	Npc_RemoveInvItem(self,ItMi_Saw);	
};
