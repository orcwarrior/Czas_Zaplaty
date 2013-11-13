/*********************************************************************
**			Testprototyp											**
*********************************************************************/
// ****************
// Neuer NSC
// ****************

Instance ItemMaster (C_NPC)
{
	//-------- primary data --------
	name =							"ItemMaster";
	guild =							GIL_NONE;
	level =							1;
	
	
	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		0;
	attribute[ATR_DEXTERITY] =		0;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		1;
	attribute[ATR_HITPOINTS] =			1;	
	protection	[PROT_EDGE]		=		-1;
	protection	[PROT_BLUNT]	=		-1;
	protection	[PROT_POINT]	=		-1;
	protection	[PROT_FIRE]		=		-1;
	protection	[PROT_MAGIC]	=		-1;



	
	Mdl_SetVisual			(self,	"Harpie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Har_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
	//-------- ai ----------
	start_aistate = ZS_SH_Hangaround;
	// talents	=						0;

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	1;
	
	////Npc_LearnTalent	(self,TAL_SNEAK);	
	////Npc_LearnTalent	(self,TAL_STEAL);	
	////Npc_LearnTalent	(self,TAL_PICKLOCK);	
	////Npc_LearnTalent	(self,TAL_ACROBAT);	
	
	////Npc_LearnTalent	(self,TAL_HEAL);	
	////Npc_LearnTalent	(self,TAL_MANA);	
	////Npc_LearnTalent	(self,TAL_IRONWILL);	

/* DISABLED!	
	//ITEMS
	
		CreateInvItem (self, BAB_ARMOR_NUDE);
	CreateInvItem (self, BAB_ARMOR_BIKINI);

	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);

	CreateInvItems(self,ItFo_mutton_01,20);		
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,20);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoSoup,5);
	CreateInvItems(self,ItFoMeatbugragout,5);
	CreateInvItems(self,ItFoCrawlersoup,5);
	CreateInvItems(self,ItFoBooze,10);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_wineberrys_01,5);
	CreateInvItems(self,ItFoBeer,5);

	CreateInvItem(self,ItMiLute);
	
	// Armor
	CreateInvItem	(self, VLK_ARMOR_L);
	CreateInvItem	(self, VLK_ARMOR_M);
	CreateInvItem	(self, SFB_ARMOR_L);
	CreateInvItem	(self, NOV_ARMOR_L);

// Weapons (Damage bis 25)
	EquipItem	(self, ItMw_1H_Sword_Short_05);
	EquipItem	(self, ItRw_Bow_Small_01);
	
// 	CreateInvItem	(self, ItMw_1H_Club_01);
// 	CreateInvItem	(self, ItMw_1H_Poker_01);
// 	CreateInvItem	(self, ItMw_1H_Sickle_01);
// 	CreateInvItem	(self, ItMw_1H_Mace_Light_01);
// 	CreateInvItem	(self, ItMw_1H_Hatchet_01);
// 	CreateInvItem	(self, ItMw_1H_Sword_Old_01);
// 	CreateInvItem	(self, ItMw_1H_Nailmace_01);

	CreateInvItem	(self, ItMw_1H_Sword_Short_01);
	CreateInvItem	(self, ItMw_1H_Sword_Short_02);
	CreateInvItem	(self, ItMw_1H_Sword_Short_03);
	CreateInvItem	(self, ItMw_1H_Sword_Short_04);
//	CreateInvItem	(self, ItMw_1H_Sword_Short_05);

	CreateInvItem	(self, ItMw_1H_Axe_Old_01);
	CreateInvItem	(self, ItMw_1H_Scythe_01);
	CreateInvItem	(self, ItMw_2H_Staff_01);
	CreateInvItem	(self, ItMw_2H_Staff_02);
	CreateInvItem	(self, ItMw_2H_Staff_03);
	CreateInvItem	(self, ItMw_1H_Mace_01);
	CreateInvItem	(self, ItMw_1H_Mace_02);

//	CreateInvItem	(self, ItRw_Bow_Small_01);
	CreateInvItem	(self, ItRw_Bow_Small_02);
	CreateInvItem	(self, ItRw_Bow_Small_03);
	CreateInvItem	(self, ItRw_Bow_Small_04);

	CreateInvItems  (self, ItAmArrow, 50);
	CreateInvItems  (self, ItMiNugget, 200);
	CreateInvItems  (self, ItKeLockpick, 10);
	CreateInvItems  (self, ItLsTorch, 20);
	
	// Armor
	CreateInvItem	(self, STT_ARMOR_M);
	CreateInvItem	(self, STT_ARMOR_H);

	CreateInvItem	(self, ORG_ARMOR_L);
	CreateInvItem	(self, ORG_ARMOR_M);

	CreateInvItem	(self, NOV_ARMOR_M);
	CreateInvItem	(self, NOV_ARMOR_H);


// Weapons (Damage 26-40)
	CreateInvItem	(self, ItMw_1H_Mace_03);
	CreateInvItem	(self, ItMw_1H_Mace_04);
	CreateInvItem	(self, ItMw_1H_Sword_01);
	CreateInvItem	(self, ItMw_1H_Sword_02);
	CreateInvItem	(self, ItMw_1H_Sword_03);
	CreateInvItem	(self, ItMw_1H_Sword_04);
	CreateInvItem	(self, ItMw_1H_Sword_05);
	CreateInvItem	(self, ItMw_1H_Mace_War_01);
	CreateInvItem	(self, ItMw_1H_Mace_War_02);
	CreateInvItem	(self, ItMw_1H_Mace_War_03);
	CreateInvItem	(self, ItMw_1H_Mace_War_04);
	CreateInvItem	(self, ItMw_1H_Sword_Long_01);	// Dam. 40, Str. 17

	CreateInvItem	(self, ItRw_Bow_Small_05);
	CreateInvItem	(self, ItRw_Bow_Long_01);
	CreateInvItem	(self, ItRw_Bow_Long_02);		// Dam. 40, Dex. 22


	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 20);
	CreateInvItems  (self, ItLsTorch, 20);
	
	// Armor
	CreateInvItem	(self, GRD_ARMOR_L );
	CreateInvItem	(self, GRD_ARMOR_M );

	CreateInvItem	(self, ORG_ARMOR_H );

	CreateInvItem	(self, TPL_ARMOR_L);
	CreateInvItem	(self, TPL_ARMOR_M);

	CreateInvItem	(self, KDF_ARMOR_L);
	CreateInvItem	(self, KDF_ARMOR_H);

// Weapons (Damage 41-55)
	CreateInvItem	(self, ItMw_1H_Sword_Long_02);
	CreateInvItem	(self, ItMw_1H_Sword_Long_03);
	CreateInvItem	(self, ItMw_1H_Sword_Long_04);
	CreateInvItem	(self, ItMw_1H_Sword_Long_05);
	CreateInvItem	(self, ItMw_1H_Warhammer_01);
	CreateInvItem	(self, ItMw_1H_Warhammer_02);
	CreateInvItem	(self, ItMw_1H_Warhammer_03);
	CreateInvItem	(self, ItMw_1H_Axe_02);
	CreateInvItem	(self, ItMw_1H_Axe_03);
	CreateInvItem	(self, ItMw_1H_Sword_Broad_01);	// Dam. 55, Str. 26

	CreateInvItem	(self, ItRw_Bow_Long_03);
	CreateInvItem	(self, ItRw_Bow_Long_04);
	CreateInvItem	(self, ItRw_Bow_Long_05);		// Dam. 55, Dex. 28

	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 20);
	CreateInvItems  (self, ItLsTorch, 20);

	// Armor
	CreateInvItem	(self, GRD_ARMOR_H );

	CreateInvItem	(self, SLD_ARMOR_M);
	CreateInvItem	(self, SLD_ARMOR_H);

	CreateInvItem	(self, TPL_ARMOR_H);

	CreateInvItem	(self, KDW_ARMOR_L);

// Weapons (Damage 56-70)
	CreateInvItem	(self, ItMw_1H_Sword_Broad_02);
	CreateInvItem	(self, ItMw_1H_Sword_Broad_03);
	CreateInvItem	(self, ItMw_1H_Sword_Broad_04);
	CreateInvItem	(self, ItMw_2H_Sword_Old_01);
	CreateInvItem	(self, ItMw_1H_Sword_Bastard_01);
	CreateInvItem	(self, ItMw_1H_Sword_Bastard_02);
	CreateInvItem	(self, ItMw_1H_Sword_Bastard_03);
	CreateInvItem	(self, ItMw_1H_Sword_Bastard_04);
	CreateInvItem	(self, ItMw_2H_Axe_Old_01);
	CreateInvItem	(self, ItMw_2H_Axe_Old_02);
	CreateInvItem	(self, ItMw_2H_Axe_Old_03);
	CreateInvItem	(self, ItMw_2H_Sword_Light_01);	// Dam. 70, Str. 42

	CreateInvItem	(self, ItRw_Bow_Long_06);
	CreateInvItem	(self, ItRw_Bow_Long_07);
	CreateInvItem	(self, ItRw_Bow_Long_08);		// Dam. 70, Dex. 34

	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 20);
	CreateInvItems  (self, ItLsTorch, 20);
	
	// Armor
	CreateInvItem	(self, CRW_ARMOR_H);
	CreateInvItem	(self, KDW_ARMOR_H);

	CreateInvItem	(self, DMB_ARMOR_M);
	CreateInvItem	(self, ORE_ARMOR_M);

// Weapons (Damage 71-85)
	CreateInvItem	(self, ItMw_2H_Sword_Light_02);
	CreateInvItem	(self, ItMw_2H_Sword_Light_03);
	CreateInvItem	(self, ItMw_2H_Sword_Light_04);
	CreateInvItem	(self, ItMw_2H_Sword_Light_05);
	CreateInvItem	(self, ItMw_2H_Axe_light_01);
	CreateInvItem	(self, ItMw_2H_Axe_light_02);
	CreateInvItem	(self, ItMw_2H_Axe_light_03);
	CreateInvItem	(self, ItMw_2H_Sword_01);
	CreateInvItem	(self, ItMw_2H_Sword_02);
	CreateInvItem	(self, ItMw_2H_Sword_03);	// Dam: 85, Str. 62

	CreateInvItem	(self, ItRw_Bow_Long_09);
	CreateInvItem	(self, ItRw_Bow_War_01);
	CreateInvItem	(self, ItRw_Bow_War_02);	// Dam: 85, Dex. 40


	CreateInvItems  (self, ItAmArrow, 100);
	CreateInvItems  (self, ItMiNugget, 400);
	CreateInvItems  (self, ItKeLockpick, 20);
	CreateInvItems  (self, ItLsTorch, 20);
	
		CreateInvItem(self,EBR_ARMOR_H2);
		
		CreateInvItem(self,ItArRuneLight);
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem(self,ItArRuneFireball);
	CreateInvItem(self,ItArRuneFirestorm);
	CreateInvItem(self,ItArRuneFireRain);
	CreateInvItem(self,ItArRuneTeleport1);
	CreateInvItem(self,ItArRuneTeleport2);
	CreateInvItem(self,ItArRuneTeleport3);
	CreateInvItems(self,ItArScrollTeleport4, 20);
	CreateInvItem(self,ItArRuneTeleport5);

	CreateInvItem(self,ItArRuneHeal);
	CreateInvItem(self,ItArRuneChainLightning);
	CreateInvItem(self,ItArRuneThunderbolt);
	CreateInvItem(self,ItArRuneThunderball);
	CreateInvItem(self,ItArRuneIceCube);
	CreateInvItem(self,ItArRuneIceWave);


	CreateInvItem(self,ItArRuneDestroyUndead);

//Magic Scrolls	
	CreateInvItems(self,ItArScrollTrfBloodfly,		20);
	CreateInvItems(self,ItArScrollTrfCrawler,		20);
	CreateInvItems(self,ItArScrollTrfLurker,		20);
	CreateInvItems(self,ItArScrollTrfMeatbug,		20);
	CreateInvItems(self,ItArScrollTrfMolerat,		20);
	CreateInvItems(self,ItArScrollTrfOrcdog,		20);
	CreateInvItems(self,ItArScrollTrfScavenger,		20);
	CreateInvItems(self,ItArScrollTrfShadowbeast,	20);
	CreateInvItems(self,ItArScrollTrfSnapper,		20);
	CreateInvItems(self,ItArScrollTrfWaran,			20);
	CreateInvItems(self,ItArScrollTrfWolf,			20);

	CreateInvItems(self,ItArScrollSummonDemon,		20);
	CreateInvItems(self,ItArScrollSummonSkeletons,	20);
	CreateInvItems(self,ItArScrollSummonGolem,		20);
	CreateInvItems(self,ItArScrollArmyOfDarkness,	20);

//Psi-Runes
	CreateInvItem(self,ItArRuneWindfist);
	CreateInvItem(self,ItArRuneStormfist);
	CreateInvItem(self,ItArRuneTelekinesis);
	CreateInvItem(self,ItArRuneCharm);
	CreateInvItem(self,ItArRuneSleep);
	CreateInvItem(self,ItArRunePyrokinesis);
	CreateInvItem(self,ItArRuneControl);
	CreateInvItem(self,ItArRuneBreathOfDeath);

//Psi-Scrolls
	CreateInvItems(self,ItArScrollFear,		20);
	CreateInvItems(self,ItArScrollBerzerk,	20);
	CreateInvItems(self,ItArScrollShrink,	20);

//----------------------------------------
//Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_mutton_01,20);		
	CreateInvItems(self,ItFoBeer,20);
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,20);
	
//----------------------------------------
//MISC.D
//----------------------------------------
	CreateInvItems(self,ItKeLockpick,20);
	CreateInvItems(self,ItLsTorch,20);
	CreateInvItems(self,ItMiNugget,1000);

//----------------------------------------
//Written.d
//----------------------------------------
	CreateInvItem	(self,ItWrWorldmap);
	
//---------------------------------------------------------------------
//Potions
//---------------------------------------------------------------------
	CreateInvItems(self,ItFo_Potion_Mana_01, 10);
	CreateInvItems(self,ItFo_Potion_Health_01, 10);	
	
	
	
	
*/	
	
	
	
	
	
	
	
	
	
	
};