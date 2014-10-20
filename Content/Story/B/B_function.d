func void Create_and_give(var int item, var int amount)
{
	CreateInvItems(self, item, amount);
	B_GiveInvItems(self, other, item, amount);
};

func void Give_and_remove(var int item, var int amount)
{
	B_GiveInvItems(other, self, item, amount);
   Npc_RemoveInvItems(self, item, amount);
};

func void B_eqquip_check()
{
   B_GiveXP(500);
	eqquip_check = eqquip_check + 1;
   
   if (eqquip_check == 2)
	{
		Log_SetTopicStatus(CH3_RBL_Choose, LOG_SUCCESS);
      B_LogEntry(CH3_RBL_Choose, "Dosta³em od myœliwych odpowiedni ekwipunek.");
	};
};

func void B_eqquip_check_mag()
{
   B_GiveXP(500);
   eqquip_check_mag = eqquip_check_mag + 1;

	if (eqquip_check_mag == 2)
	{
		Log_SetTopicStatus(CH2_RBL_Magic, LOG_SUCCESS);
      B_LogEntry(CH2_RBL_Magic, "Dosta³em od magów odpowiedni ekwipunek.");
	};
};

func void B_fingers_proofs()
{
   fingers_proofs = fingers_proofs + 1;
   
	if (fingers_proofs == 3)
	{
		B_LogEntry(CH2_RBL_Feelings, "Wiem ju¿ wystarczaj¹co du¿o, ¿eby ostrzej porozmawiaæ z R¹czk¹.");
	};
};

func void B_teleport_Raven()
{
   var c_npc raven; raven = Hlp_GetNpc(Ebr_105_Raven);

   B_FullStop(raven);
   B_DrawSpell		(raven,	SPL_TELEPORT1,	SPL_SENDCAST_TELEPORT);
	AI_PlayAni		(raven, "T_MAGRUN_2_HEASHOOT");
   B_DrawSpell		(hero,	SPL_TELEPORT1,	SPL_SENDCAST_TELEPORT);
   AI_PlayAni		(hero, "T_MAGRUN_2_HEASHOOT");
   AI_Teleport(raven, "NC_EN_MAINPATH_05");
   AI_Teleport(hero, "NC_EN_MAINPATH_05_01");
};

func int B_guards_patrol_finished()
{
   var C_NPC g1; g1 = Hlp_GetNpc(GRD_4056_Guard);
	var C_NPC g2; g2 = Hlp_GetNpc(GRD_4057_Guard);
	var C_NPC g3; g3 = Hlp_GetNpc(GRD_4058_Guard);
	var C_NPC g4; g4 = Hlp_GetNpc(GRD_4059_Guard);
	var C_NPC g5; g5 = Hlp_GetNpc(GRD_4060_Guard);
	var C_NPC g6; g6 = Hlp_GetNpc(GRD_4061_Guard);
   
   if ((Npc_IsDead(g1) && Npc_IsDead(g2) && Npc_IsDead(g3) && Npc_IsDead(g4) && Npc_IsDead(g5) && Npc_IsDead(g6))||(patrol_trial == 10))
	{
      return 1;
   };
   
   return 0;
};

func void B_insert_necros_servants()
{
   Black_mag_arrived = 2;
   
   Wld_InsertNpc(Dead_man1, "OW_PATH_1_12");
   Wld_InsertNpc(Dead_man2, "OW_PATH_1_15");
   Wld_InsertNpc(Dead_man3, "OW_PATH_1_17");
   Wld_InsertNpc(Dead_man4, "SPAWN_MOLERAT_TOTU_LEFT_PLAT4");
   Wld_InsertNpc(Dead_man5, "SPAWN_SCAVENGER_TOTU_LEFT_PLAT");
   
   var C_NPC npc_dead_man1; npc_dead_man1 = Hlp_GetNpc(Dead_man1);
	B_ChangeAttribute	(npc_dead_man1, ATR_HITPOINTS, -npc_dead_man1.attribute[ATR_HITPOINTS_MAX]);	
   var C_NPC npc_dead_man2; npc_dead_man2 = Hlp_GetNpc(Dead_man2);
	B_ChangeAttribute	(npc_dead_man2, ATR_HITPOINTS, -npc_dead_man2.attribute[ATR_HITPOINTS_MAX]);
   var C_NPC npc_dead_man3; npc_dead_man3 = Hlp_GetNpc(Dead_man3);
	B_ChangeAttribute	(npc_dead_man3, ATR_HITPOINTS, -npc_dead_man3.attribute[ATR_HITPOINTS_MAX]);
   var C_NPC npc_dead_man4; npc_dead_man4 = Hlp_GetNpc(Dead_man4);
	B_ChangeAttribute	(npc_dead_man4, ATR_HITPOINTS, -npc_dead_man4.attribute[ATR_HITPOINTS_MAX]);
   var C_NPC npc_dead_man5; npc_dead_man5 = Hlp_GetNpc(Dead_man5);
	B_ChangeAttribute	(npc_dead_man5, ATR_HITPOINTS, -npc_dead_man5.attribute[ATR_HITPOINTS_MAX]);
   
   Wld_InsertNpc(Zombie, "OW_PATH_1_17_1");
   Wld_InsertNpc(Zombie, "OW_PATH_1_17_2");
   Wld_InsertNpc(Zombie, "OW_PATH_1_17_3");
   
   Wld_InsertNpc(Skeleton, "SPAWN_SCAVENGER2_TOTU_LEFT_PLAT2");
   Wld_InsertNpc(Skeleton, "SPAWN_SCAVENGER2_TOTU_LEFT_PLAT2");
   Wld_InsertNpc(Skeleton, "OW_PATH_1_5_3");
   Wld_InsertNpc(Skeleton, "OW_PATH_1_5_3");
   
   Wld_InsertNpc(SkeletonMage, "OW_PATH_1_5_3");
   Wld_InsertNpc(SkeletonMage, "SPAWN_SCAVENGER2_TOTU_LEFT_PLAT2");
};

func void B_hero_poisoned()
{
   if (!Npc_IsDead(hero))
   {
      hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS_MAX]/10;
   };
};

func void B_end_game()
{
   PlayVideo ("CZ_outro.bik");
   PlayVideo ("CZ_credits.bik");
   ExitGame();
};

func void B_unequip_current_mweapon_hero(var int instanceName)
{
   var c_item hero_weapon; hero_weapon = Npc_GetEquippedMeleeWeapon(hero);
   if (Hlp_IsItem(hero_weapon, instanceName))
   {
      AI_UnequipWeapons(hero);
   };
};

func void B_equipment_to_OC()
{
   equipment_to_OC += 1;

	if (equipment_to_OC == 2)
	{
		B_LogEntry(CH3_RBL_OldCampSpy, "Najwy¿szy czas pójœæ do pó³nocnej bramy i sprawdziæ czy trunek od Piwosza poskutkuje, a zbroja siê do czegoœ przyda...");
	};
};
