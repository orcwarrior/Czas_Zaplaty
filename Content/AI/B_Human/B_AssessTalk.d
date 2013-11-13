/******************************************************************************************** 
*	B_AssessTalk																			*
*	============																			*
*	Wird dem ZS_AssessTalk vorgeschaltet, wenn ein NSC aktiv angesprochen wird				*
*	und löscht die INVINCIBLE-Flags															* 
********************************************************************************************/ 
var int TalkAssesed;

func void B_AssessTalk ()
{
		PrintDebug			("B_AssessTalk");			

	PrintDebugNpc	(PD_ZS_FRAME,	"B_AssessTalk");
	TalkAssesed=TRUE;	
	if (Npc_IsInState(self, ZS_Smoke)) //MH: Blubber Mobsi machte Probleme! 
	{
		Npc_ClearAIQueue(self);
		AI_StandUp(self);
		AI_StartState	(self, ZS_Talk, 0, "");
	}
	else if (C_BodystateContains(self,BS_MOBINTERACT)) 
	{
		return;
	};
		
	//-------- Verhindern von Ansprechen durch übernommene NSCs --------
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(her)!=Hlp_GetInstanceID(Hero))&&(Hlp_GetInstanceID(rock)!=Hlp_GetInstanceID(Hero)) ) 
   && (World_current != WORLD_DREAM01)
	{	
		B_Say (self,other,"$NOTNOW");
	}
	else
	{
		Npc_SetPercTime	( self, 3);
		Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
		Npc_SetAivar(hero,AIV_INVINCIBLE,  FALSE);
		Npc_SetAivar(hero,AIV_IMPORTANT,   FALSE);		// Dialog kommt NICHT aufgrund einer Important-Info zustande
		
		Npc_ClearAIQueue(self);
						
		Npc_SetPercTime	(self, 1);
		if ( (!C_BodystateContains(self, BS_SIT)) || (!Npc_CanSeeNpc(self, hero)) )
		{
			Npc_ClearAIQueue(self);
			AI_StandUpQuick(self);		
			AI_StartState	(self, ZS_Talk, 0, "");
		}
		else
		{
			AI_StartState	(self, ZS_Talk, 0, ""); //sitzen UND sehen --> sitzenbleiben
		};
	};
};
			

//Nameless Bugfix
var int GLOBAL_NAMELESS_ACTION_DISTURBED;
func void B_NamelessAssessTalk ()
{
	GLOBAL_NAMELESS_ACTION_DISTURBED=TRUE;
	B_AssessTalk();
};			