func void ZS_GRDAttacking()
{
	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_GRDAttacking");
	AI_SetWalkmode	(self,NPC_RUN);
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP	(self);
	self.senses_range = 2000;
	BattlePerception ();

	
		if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
		CreateInvItem(self,ItFo_Potion_Health_04);
		AI_UseItem		(self,ItFo_Potion_Health_04);
		CreateInvItem(self,ItFo_Potion_Health_04);
		AI_UseItem		(self,ItFo_Potion_Health_04);		
		};
	if (GRDChallenge == TRUE)
	{
		var string FreePoint;
		FreePoint = ConcatStrings("FP_CHALLENGE_",IntToString(GetTeam(self)));		
		if (Wld_IsFPAvailable(self,FreePoint))
		{																	
			AI_GotoFP (self, FreePoint);
		};
			AI_LookAt				(self,"OW_OM_ENTRANCE04");
	}
	else
	{
		if(	self.fight_tactic	==	FAI_HUMAN_RANGED)
		{	
			B_EquipAndDrawBestRangedWeapon(self,other);	
			AI_AlignToWP	(self);		
		}	
		else if(self.fight_tactic	!=	FAI_HUMAN_MAGE )
		{
			B_EquipAndDrawBestMeleeWeapon(self,other);					
		};
		 if(!Npc_IsOnFP(self,FreePoint))
		 {
			if (Wld_IsFPAvailable(self,FreePoint))
			{																	
				AI_GotoFP (self, FreePoint);
				AI_AlignToFP(self);
			};	
		};
		
	};
};

func int ZS_GRDAttacking_Loop ()
{

	//PrintDebugNpc				(PD_ZS_LOOP,	"ZS_GRDAttacking_Loop");
	AI_Wait(self,1);
	return LOOP_CONTINUE;	
};

func void ZS_GRDAttacking_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_GRDAttacking_End" );
	//if(Npc_HasReadiedWeapon(self))
	//{
	//	AI_RemoveWeapon(self);	
	//};	
	//AI_ContinueRoutine 		(self);
};