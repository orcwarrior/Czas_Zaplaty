func void ZS_KillingGRDs()
{

	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_KillingGRDs");
	BattlePerception ();
	AI_SetWalkmode	(self,NPC_RUN);	
	AI_AlignToWP 	(self);	
	self.senses_range	=	2500;	

if ( self.attribute[ATR_HITPOINTS] != self.attribute[ATR_HITPOINTS_MAX])
{
CreateInvItems 				(self,ItFo_Potion_Health_04,2);
AI_UseItem		(self,	ItFo_Potion_Health_04);
};
	Npc_PerceiveAll			(self);
// if  (Wld_DetectNpc(self,-1,NOFUNC ,GIL_DMB))
// {
// Ai_TurnToNpc(self,other);	
// };	
};

func int ZS_KillingGRDs_Loop ()
{

AI_WAIT(self,1);
return LOOP_CONTINUE;



};
func void ZS_KillingGRDs_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_KillingGRDs_End" );
	AI_GotoWP		(self, 	self.wp);
	if (Npc_GetAivar(self,AIV_ITEMFREQ) != TA_IT_HAVEIMPORTANTSTATE)
	{
	AI_ContinueRoutine 		(self);
	}
	else
	{
	AI_StartState(self,ZS_KillingGRDs,1,self.wp);	
	};
	
};