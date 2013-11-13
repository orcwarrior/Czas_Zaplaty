//////////////////////////////////////////////////////////////////////////
//	ZS_PracticeSword
//	================
//	Der NSC vollführt eine Schwert-Kata auf der Stelle
//	(FP "FIGHTTRAINING")
//////////////////////////////////////////////////////////////////////////
func void ZS_PracticeSword ()
{
    //PrintDebugNpc		(PD_TA_FRAME,"ZS_PracticeSword");
    
	B_SetPerception		(self);    
	AI_SetWalkmode		(self,	NPC_WALK);	

	if !(Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP		(self, self.wp);               // Gehe zum Tagesablaufstart
	};

	AI_DrawWeapon		(self);
};

func int ZS_PracticeSword_Loop()
{	
    //PrintDebugNpc		(PD_TA_LOOP,	"ZS_PracticeSword_Loop");
	B_PrintDebug(inttostring(Npc_GetStateTime(self)));
	
	AI_PlayAni			(self,"T_1HSFREE");
	AI_GotoWP			(self, self.wp); 
	AI_AlignToWP    	(self);
	return LOOP_CONTINUE;
	//BUGFIX: Practicing tru' Talk
};

func void ZS_PracticeSword_End ()
{
    //PrintDebugNpc		(PD_TA_FRAME,	"ZS_PracticeSword_End");
	
	Npc_ClearAIQueue(self);	
	AI_StandUp (self);
	AI_RemoveWeapon (self);
};
