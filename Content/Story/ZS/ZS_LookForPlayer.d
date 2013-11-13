/*********************************
*    4 Important Infos			 *
*  zieht Armbrust, wechselt FP   *
*********************************/

func void ZS_LookForPlayer()
{
	GuardPerception	();	
	//PrintDebugNpc	(PD_TA_FRAME,	"ZS_LookForPlayer");		
	AI_StandUp		(self);				
	AI_SetWalkmode	(self,	NPC_RUN);	// Walkmode für den Zustand
	AI_GotoWP		(self,	self.wp);	// Gehe zum Tagesablaufstart
	
	B_InitArmor 	();//CS: nur bei nichtgezogener Waffe
};

func int ZS_LookForPlayer_Loop()
{
	//PrintDebugNpc	(PD_TA_LOOP,"ZS_LookForPlayer_Loop");
	
	if	(Npc_GetDistToNpc(self, hero) < 1000)
	&&	!C_BodyStateContains(hero, BS_SNEAK)
	{
		AI_TurnToNpc	(self, hero);
	}
	else
	{
		B_PlayArmor		();
		//AI_AlignToWP	(self);
	};
	
	AI_Wait			(self,	3);
	return LOOP_CONTINUE;
};

func void ZS_LookForPlayer_End ()
{
	//PrintDebugNpc	(PD_TA_FRAME,"ZS_LookForPlayer_End");
	
	B_ExitArmor		();
};