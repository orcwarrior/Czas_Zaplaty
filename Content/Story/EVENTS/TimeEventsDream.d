//Events in Dream
var int timeToTalkWithBaal;

func void TimeEventsDream()
{
	if (WORLD_CURRENT == WORLD_DREAM01)
	{
		if (isFirstTalkingInDream && InfoManager_HasFinished())
		{
			timeToTalkWithBaal = 41; //40 s
			
			isFirstTalkingInDream = false;
		};
		
		if (timeToTalkWithBaal > 1)
		{
			timeToTalkWithBaal -= 1;
		}
		else if (timeToTalkWithBaal == 1)
		{
			Wld_insertNPC(GUR_12030_BaalTondral_Dream, "PSI_31_HUT_IN");
			timeToTalkWithBaal -= 1;
		};
		
		if (Npc_isDead(hero) && drankPoisonInDream)
		{
			Dream_finished = true;
			drankPoisonInDream = false;
			purge_poison(hero, 0);
		};
	};
};