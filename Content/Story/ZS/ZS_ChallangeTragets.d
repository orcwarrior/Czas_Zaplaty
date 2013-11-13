func void ZS_ChallengeTragets()
{
	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_ChallengeTragets");
	BattlePerception ();  
	AI_SetWalkmode	(self,NPC_RUN);	
	self.senses_range = 2000;

	if(Npc_HasEquippedRangedWeapon(self))
	{
		AI_ReadyRangedWeapon(self);
	}
	else
	{
      AI_DrawWeapon 	(self);	
	};
	if (self.id == 2770)||(self.id == 27700)
	{
      AI_GotoWP		(self, 	"OW_PATH_OC_NC4");
	};
	if (self.id == 2700)
	{
      AI_GotoWP		(self, 	"OW_OM_ENTRANCE03");
	};	
};

func int ZS_ChallengeTragets_Loop ()
{

	//PrintDebugNpc				(PD_ZS_LOOP,	"ZS_ChallengeTragets_Loop");
    //AI_Wait (self, 1);	
	//Npc_PerceiveAll			(self);

//if (AttackChallenger <50)
//{
// 	if (Wld_DetectNpc(self,-1,ZS_Unconscious,-1))
// 	{
// 			if (Npc_HasReadiedRangedWeapon(self))
// 			{
// 			AI_RemoveWeapon(self);			
// 			};
// 			AI_ReadyMeleeWeapon(self);	
// 			AI_FinishingMove(self,other);
// 	};
// 	if (Wld_DetectNpc(self,-1,ZS_GRDAttacking,-1))
// 		{
// 			Npc_SetTarget (self,other);
// 			AI_StartState (self,ZS_ATTACK,1,"");
// 		}
// 	else
// 		{ 
// 		if (otherchance <33)
// 		{
// 				if (Wld_DetectPlayer			(self))
// 			{
// 				Npc_SetTarget (self,other);
// 				AI_StartState (self,ZS_ATTACK,1,"");	
// 			}
// 			
// 			else
// 			{
// 			  randomnpc = Hlp_Random(2);
// 				if (randomnpc == 2)
// 				{
// 				B_GotoWPNextToNpc (self,other);
// 				}
// 				else
// 				{
// 				B_GotoWPNextToNpc (self,hero);
// 				};
// 			};
// 		}
// 		else
// 		{
//    
// 			  randomnpc = Hlp_Random(2);
// 				if (randomnpc == 2)
// 				{
// 				B_GotoWPNextToNpc (self,other);
// 				}
// 				else
// 				{
// 				B_GotoWPNextToNpc (self,hero);
// 				};
// 		};
// 			return 1;
// 		};
// 	}
// 	else
// {
// 	if (Wld_DetectPlayer			(self))
// 		{
// 			Npc_SetTarget (self,other);
// 			AI_StartState (self,ZS_ATTACK,1,"");
// 		}
// 	else
// 	{ 
// 		if (otherchance <33)
// 		{
// 				if (Wld_DetectNpc(self,-1,ZS_GRDAttacking,-1))
// 			{
// 				Npc_SetTarget (self,other);
// 				AI_StartState (self,ZS_ATTACK,1,"");	
// 			}
// 			else
// 			{
// 			return 1;
// 			};
// 		}
// 		else
// 		{

// 				nearwp =	Npc_GetNearestWP		(self);
// 				AI_GotoWP 				(self,nearwp);
// 				distnearwp = Npc_GetDistToNpc		(self, butch); 
// 				if (distnearwp < distoldwp)
// 				{
// 					AI_StartState			(self,	ZS_ChallengeTragets,	1,	"");	
// 				};
// 		};
			AI_WAIT(self,1);
 			return 0;
// 	};
//};

};

func void ZS_ChallengeTragets_End ()
{	
	B_ClearImmortal		(self);
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_ChallengeTragets_End" );
};