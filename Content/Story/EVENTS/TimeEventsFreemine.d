//Events in Freemine
var int removing_guards;

func void TimeEventsFreemine()
{
	if (WORLD_CURRENT == WORLD_FREEMINE)
	{
		if (!Npc_IsDead(sher)) && (Npc_GetAivar(sher, AIV_WASDEFEATEDBYSC) == TRUE) 
		&& Npc_KnowsInfo(hero, DIA_Jurgen_Third) && InfoManager_HasFinished()
		{
			B_ChangeAttribute(sher, ATR_HITPOINTS, -sher.attribute[ATR_HITPOINTS_MAX]);
		};
		
		if (Kapitel == 5 && !removing_guards)
		{
			B_kill_guards_in_Freemine();
			B_insert_soeldners_to_Freemine();
			removing_guards = TRUE;
		};
	};
};