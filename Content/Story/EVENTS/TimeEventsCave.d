//Events in Cave

func void TimeEventsCave()
{
	if ((WORLD_CURRENT == WORLD_CATACOMBS) || (WORLD_CURRENT == WORLD_NECROLOCATION))
	{
		if (Rick_death && InfoManager_HasFinished())
		{
			AI_PlayAni(hero, "T_PSI_VICTIM");
			Npc_ChangeAttribute(hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
			
			Rick_death = false;
		};
	};
};