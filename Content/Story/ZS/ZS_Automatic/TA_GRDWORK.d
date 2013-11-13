// **********
// ZS_AutoRest
// **********
func void ZS_AutoGrdWork ()					
{
	B_SetPerception(self);
	
	B_FullStop (self);
	
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
	
	return;
};

func void ZS_AutoGrdWork_Loop ()	
{
	
	if (Wld_IsMobAvailable(self,"BENCH"))||(Wld_IsMobAvailable(self,"CHAIR"))||(Wld_IsMobAvailable(self,"SMALL THRONE"))||(Wld_IsFPAvailable (self, "SIT"))||(Wld_IsFPAvailable (self, "SIT"))
	{
	AI_StartState (self, ZS_SitAround, 0, "");	
	}
	else if(Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
	{
	AI_StartState (self, ZS_SitCampfire, 0, "");		
	}
	else if(C_NpcIsGuard(self))&&(Hlp_Random(10)==0)
	{
	AI_StartState (self, ZS_PracticeSword	, 0, "");				
	}
	else
	{
	AI_StartState (self, ZS_Stand	, 0, "");		
	};		
	return;
};