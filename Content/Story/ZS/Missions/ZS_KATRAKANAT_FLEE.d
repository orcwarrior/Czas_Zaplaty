func void ZS_KATRAKANAT_FLEE()
{
	//PrintDebugNpc 		(PD_ZS_CHECK,	"ZS_KATRAKANAT_FLEE");
	NoreactPerc ();

// 	AI_GotoWP (self, "OW_PATH_057");
	Ai_PlayAni(Demon_Katrakanat,"T_WARN");																

	
};

func int ZS_KATRAKANAT_FLEE_loop()
{


	AI_GotoWP (self, "LOCATION_23_01");	
	if (Npc_GetStateTime(self) >= 8)||(Npc_GetDistToNpc(self,hero)>2500)
	{
		
	return				LOOP_END;			
	};
	
	AI_Wait		(self, 1);
	return				LOOP_CONTINUE;	
};

func void ZS_KATRAKANAT_FLEE_end()
{
	B_PrintDebug("TP");
	AI_Teleport(self,"INVISIBLE");	
	B_ChangeAttribute	(self, ATR_HITPOINTS, -(self.attribute[ATR_HITPOINTS_MAX]));		
	AI_StartState		(self, ZS_Stay, 0, "");

	
	B_ExchangeRoutine(Cavalorn,"KATWAIT4HERO");			
	Npc_ClearAiQueue(cavalorn);	
	AI_Teleport(cavalorn,"LOCATION_23_01");	
		
	B_ExchangeRoutine(leren,"rytual");			
};
