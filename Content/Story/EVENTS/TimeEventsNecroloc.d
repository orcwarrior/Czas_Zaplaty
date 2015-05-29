//Events in Necroloc

func void ChangeAttributeAppearanceAlterEgo()
{
	var c_npc alter_ego;
	alter_ego = hlp_getNpc(PC_Hero_AlterEgo);
	
	alter_ego.level = hero.level;
	alter_ego.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX];
	alter_ego.attribute[ATR_MANA] = alter_ego.attribute[ATR_MANA_MAX];
	alter_ego.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX];    
	alter_ego.attribute[ATR_HITPOINTS] = alter_ego.attribute[ATR_HITPOINTS_MAX];    
	alter_ego.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]; 
	alter_ego.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY];
	
	var c_item melee_weapon; melee_weapon = Npc_GetEquippedMeleeWeapon(hero);
	var c_item armor; armor = Npc_GetEquippedArmor(hero);
	
	CreateInvItem(alter_ego, Hlp_GetinstanceID(melee_weapon));
	CreateInvItem(alter_ego, Hlp_GetinstanceID(armor));

	AI_EquipBestMeleeWeapon(alter_ego);
	AI_EquipBestRangedWeapon(alter_ego);
	AI_EquipArmor(alter_ego, armor);
	AI_EquipBestArmor(alter_ego);
};

func void TimeEventsNecroloc()
{
	if (WORLD_CURRENT == WORLD_NECROLOCATION)
	{
		if (inserted_alter_ego && InfoManager_HasFinished())
		{
			ChangeAttributeAppearanceAlterEgo();
			B_ExchangeRoutine(PC_Hero_AlterEgo, "Follow");
			inserted_alter_ego = false;
		};
	};
};
