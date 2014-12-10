//Events in Freemine
var int removing_guards;
var C_NPC sher;

func void TimeEventsFreemine()
{
	if (WORLD_CURRENT == WORLD_FREEMINE)
	{
		sher = Hlp_GetNpc(Non_4088_Sher);
		
		if (!Npc_IsDead(sher)) && (sher.attribute[ATR_HITPOINTS] < 10) 
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