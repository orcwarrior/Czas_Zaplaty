//Events in Orc Tempel

func void TimeEventsOrcTempel()
{
	if (WORLD_CURRENT == WORLD_OTEMPLE)
	{
		if (Npc_IsDead(Non_4116_NekromanD) && (!necro_dead))
		{
			PrintScreen("Nekromanta nie żyje!",-1,-1,"font_old_20_white.tga",3);
			
			Snd_Play ("FoundRiddler");	
			
			wld_insertNpc(NecromancerDemon, Npc_GetNearestWP(hero));
			
			necro_dead = 1;
		};

		if (!Npc_IsDead(NecromancerDemon) && (necro_demon.attribute[ATR_HITPOINTS] <= necro_demon.attribute[ATR_HITPOINTS_MAX]/2) && (necro_dead == 1))
		{
			wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
			wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
			wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
			
			Wld_PlayEffect("spellFX_Thunderstorm", necro_demon, necro_demon, 1, 0, DAM_MAGIC, FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED", necro_demon, necro_demon, 1, 0, DAM_MAGIC, FALSE);
			
			necro_dead = 2;
		};

		if (Npc_IsDead(NecromancerDemon) && (necro_dead == 2))
		{
			PrintScreen("Demon nie żyje!",-1,-1,"font_old_20_white.tga",3);
			
			AI_PlayAni(hero,	"T_PSI_VICTIM");
			
			necro_dead = 3;
			
			B_hero_poisoned();
			
			Snd_Play ("FoundRiddler");
			Wld_PlayEffect("spellFX_Thunderstorm", hero, hero, 1, 0, DAM_MAGIC, FALSE);
			Wld_PlayEffect("spellFX_INCOVATION_RED", hero, hero, 1, 0, DAM_MAGIC, FALSE);
		};

		if (!Npc_IsDead(hero) && (necro_dead == 3))
		{
			B_hero_poisoned();
		};

		if (Npc_IsDead(hero) && (necro_dead == 3))
		{
			necro_dead = 3;
			
			B_end_game();
		};
	};
};