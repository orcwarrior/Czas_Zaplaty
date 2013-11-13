//////////////////////////////////////////////////////////////////////////
//	ZS_PracticeSword
//	================
//	Der NSC vollführt eine Schwert-Kata auf der Stelle
//	(FP "FIGHTTRAINING")
//////////////////////////////////////////////////////////////////////////
func void ZS_PracticeSwordBB ()
{
    //PrintDebugNpc		(PD_TA_FRAME,"ZS_PracticeSwordBB");
    
	B_SetPerception		(self);    
	AI_SetWalkmode		(self,	NPC_WALK);	
	
	if !(Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP		(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	AI_DrawWeapon		(self);
};

func void ZS_PracticeSwordBB_Loop()
{
	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	if (guardreaktion >= 900)
	{
		AI_DrawWeapon		(self);
	B_RemoveWeapon		(self);
	AI_PlayAni 		(self,"T_DIALOGGESTURE_18");
		AI_DrawWeapon		(self);
	B_RemoveWeapon		(self);
	}
	else if (guardreaktion >= 800)
	{
		AI_PlayAni (self, "T_SIT_2_STAND");
	}
	else if (guardreaktion >= 700)
	{
		AI_DrawWeapon		(self);
		AI_PlayAni 		(self,"T_DIALOGGESTURE_16");
	B_RemoveWeapon		(self);	
	}
	else if (guardreaktion >= 600)
	{


	}
	else if (guardreaktion >= 500)
	{
	AI_DrawWeapon		(self);
	AI_PlayAni			(self,"T_1HSFREE");
	}
	else if (guardreaktion >= 400)
	{
	
	AI_DrawWeapon		(self);
	};
	
	AI_Wait				(self,	1);
};

func void ZS_PracticeSwordBB_End ()
{
    //PrintDebugNpc		(PD_TA_FRAME,	"ZS_PracticeSwordBB_End");
	
	B_FullStop			(self);
	B_RemoveWeapon		(self);
};
