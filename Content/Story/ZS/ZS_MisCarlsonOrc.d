//////////////////////////////////////////////////////////////////////////
//	ZS_MisCarlsonOrc
//	========
//	Dieser Tagesablauf wird allen NSCs gegeben, die einfach nur
//	imposant herumstehen und Wache halten sollen.
//
//	Es passiert folgendes:
//	1.	Wie in allen Wachzuständen werden nette Posen und Zufalls-
//		Animationen abgespielt.
//////////////////////////////////////////////////////////////////////////
var int PIRs_Spawned;
func void ZS_MisCarlsonOrc ()
{
	//PrintDebugNpc (PD_TA_FRAME,"ZS_MisCarlsonOrc");
	if (self.guild == GIL_GRD)
	{
	GuardPerception ();
	}
	else
	{
	Npc_SetAivar(self,AIV_ITEMSCHWEIN,true);
	HunGuardPerc();
	};
	
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);			// Walkmode für den Zustand
	AI_GotoWP		(self, self.wp);			// Gehe zum Tagesablaufstart
	B_InitArmor();    
};

func void ZS_MisCarlsonOrc_Loop ()
{
	//PrintDebugNpc	(PD_TA_LOOP,"ZS_MisCarlsonOrc_Loop");

	B_GotoFP		(self, "GUARD");
		
	if (Npc_GetDistToNpc(self,hero)<1600)
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP	(self);
	};
	
	B_PlayArmor		();
 	
	AI_Wait			(self,	3.5);
};

func void ZS_MisCarlsonOrc_End ()
{
	//PrintDebugNpc (PD_TA_FRAME,"ZS_MisCarlsonOrc_End");
	Npc_SetAivar(self,AIV_ITEMSCHWEIN,0);
	B_ExitArmor();  
};




