//Events in Labyrinth

func void TimeEventsLabyrinth()
{
	if (WORLD_CURRENT == WORLD_LABYRINTH)
	{
		if ((necro_appear == 2)&&(hero.attribute[ATR_HITPOINTS] <= hero.attribute[ATR_HITPOINTS_MAX]/10))
		{
			var c_npc corristo; corristo = hlp_getNpc(KDF_4115_Corristo);
			
			B_FullStop(corristo);
			necro_appear = 3;
			
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

		if ((necro_appear == 2)&&(Npc_IsDead(KDF_4115_Corristo)))
		{
			necro_appear = 3;
		};
	};
};