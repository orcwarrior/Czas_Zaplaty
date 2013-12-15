/*************************************************************************
**	Skeleton Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Skeleton(C_Npc)			
{
	name							=	"Szkielet";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	23;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	135;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	65;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	120; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	45;
	protection	[PROT_MAGIC]		=	50;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_SKELETON;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

};


/*************************************************************************
**	Skeleton Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_SkeletonWarrior(C_Npc)			
{
	name							=	"Szkielet wojownik";
	guild							=	GIL_SKELETON;
	//REAL ID IN INSTANZEN!
	level							=	25;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	180;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	protection	[PROT_BLUNT]		=	65;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	150; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	55;
	protection	[PROT_MAGIC]		=	60;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_SKELETON;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

	//Npc_SetAivar(Npc_SetAivar,AIV_MM_RestStart, 	 OnlyRoutine);
};

PROTOTYPE Mst_Default_SkeletonRanger(C_Npc)			
{
	name							=	"Szkielet ³ucznik";
	guild							=	GIL_TPL;
	level							=	25;
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_SKELETONRANGER);
	flags		= NPC_FLAG_INSTANTDEATH;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	85;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;
	
	protection	[PROT_BLUNT]		=	65;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	150; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	55;
	protection	[PROT_MAGIC]		=	60;	
	
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_RANGED;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
//-------------------------------------------------------------
	start_aistate				= ZS_MM_Ranger;
	CreateInvItems (self, ItAt_Kosc, 1);	
	//Npc_SetAivar(Npc_SetAivar,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_Skeleton_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body3",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonScout_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Body2",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SkeletonMage_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton_fly.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Ske_Fly_Body",	01,			DEFAULT,	"",			01,  		DEFAULT,	-1);
};


/*************************************************************************
**	Skeleton    														**
*************************************************************************/

INSTANCE Skeleton			(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETON);
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};

/*************************************************************************
**	SkeletonSH - für die Gruft unter den Stonehenge (SH) 														**
*************************************************************************/

INSTANCE SkeletonSH			(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETON);
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);

	attribute[ATR_STRENGTH] = 85; //SN: da Waffe nicht zum Schaden addiert wird!

	senses_range				= 1000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1000);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};


/*************************************************************************
**	Skeleton   Scout													**
*************************************************************************/

INSTANCE SkeletonScout		(Mst_Default_Skeleton)
{
	name							=	"Szkielet zwiadowca";
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETONSCOUT);
	Set_SkeletonScout_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);

	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};


/*************************************************************************
**	Skeleton  Warrior													**
*************************************************************************/

INSTANCE SkeletonWarrior	(Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonWarrior_Visuals();
	level							=	30;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);

	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};

/*************************************************************************
**	Skeleton  Warrior 2H Axe													**
*************************************************************************/

INSTANCE Skeleton2HAxeWarrior	(Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonScout_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	200;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	EquipItem		(self, ItMw_2H_Axe_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 

	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};
/*************************************************************************
**	Skeleton  Warrior 2H Swd													**
*************************************************************************/

INSTANCE Skeleton2HSwdWarrior	(Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonWarrior_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	200;
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	EquipItem		(self, ItMw_2H_Sword_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 

	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};
INSTANCE  SkeletonMDIntroduceDuals	(Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonScout_Visuals();
	level							=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	550;
	attribute	[ATR_HITPOINTS]		=	550;
	attribute	[ATR_STRENGTH]		=	150;//Balance-Fix(200)
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	EquipItem		(self, ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,	"humans_2hst3.mds");
	start_aistate	=	ZS_MM_MDOpenDoor;

	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 70; //SN: da Waffe nicht zum Schaden addiert wird!
	CreateInvItems (self, ItAt_Kosc, 1);
	CreateInvItem     (self, ItMw_Dual_01_Left );
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};

INSTANCE SkeletonDual1(Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	Set_SkeletonScout_Visuals();
	level							=	40;
	attribute	[ATR_STRENGTH]		=	150;//Balance-Fix(200)
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);

	EquipItem		(self, ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,	"humans_2hst3.mds");
	start_aistate	=	ZS_MM_DualEquip;

	CreateInvItems (self, ItAt_Kosc, 1);
	CreateInvItem     (self, ItMw_Dual_01_Left );
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};

/*************************************************************************
**	Skeleton   Mage 													**
*************************************************************************/

INSTANCE SkeletonMage		(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONMAGE);
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet mag";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	100;		

	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;	

	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};


/*************************************************************************
**	Skeleton   Mage 	im Nebelturm									**
*************************************************************************/

INSTANCE SkeletonMage_fogtower		(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONMAGE);
	Set_SkeletonMage_Visuals();
	name					=	"Szkielet maga z Wie¿y Mgie³";
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
	level					=	50;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	80;
	protection	[PROT_MAGIC]		=	100;		

	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;		


	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,	ItArRuneThunderbolt);
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	5);
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};


/*************************************************************************
**	Summoned Skeleton    												**
*************************************************************************/

INSTANCE SummonedByPC_Skeleton	(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETON);
//-----------------------------------------
	Set_Skeleton_Visuals();

//-----------------------------------------
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	senses						= SENSE_HEAR | SENSE_SEE;
	start_aistate	=	ZS_MM_SummonedByPC;
	Npc_SetAivar(self,AIV_MM_DistToMaster,  300);
	Npc_SetAivar(self,AIV_MM_TimeLooseHP, 	 5);
	Party_AddNpc(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	level = 0;
};

INSTANCE SummonedByNPC_Skeleton	(Mst_Default_Skeleton)
{
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETON);
//-----------------------------------------
	Set_Skeleton_Visuals();
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 10; //SN: da Waffe nicht zum Schaden addiert wird!
	CreateInvItems (self, ItAt_Kosc, 1);
//-----------------------------------------
	start_aistate	=	ZS_MM_Summoned;
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};


/*************************************************************************
**	Summoned Skeleton Warrior											**
*************************************************************************/

INSTANCE SummonedByPC_SkeletonWarrior (Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	level							= 0;
	attribute	[ATR_STRENGTH]		=	120;
	senses						= SENSE_HEAR | SENSE_SEE;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETONWARRIOR);
//------------------------------------------
	Set_SkeletonWarrior_Visuals();

//------------------------------------------
	EquipItem		(self, ItMw_2H_Axe_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	start_aistate	=	ZS_MM_SummonedByPC;
	Npc_SetAivar(self,AIV_MM_DistToMaster,  300);
	Npc_SetAivar(self,AIV_MM_TimeLooseHP, 	 5);
	Party_AddNpc(self);
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};

INSTANCE SummonedByNPC_SkeletonWarrior (Mst_Default_SkeletonWarrior)
{
	name							=	"Szkielet wojownik";
	level							=	35;
	attribute	[ATR_STRENGTH]		=	120;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETONWARRIOR);
//------------------------------------------
	Set_SkeletonWarrior_Visuals();
	EquipItem		(self, ItMw_2H_Axe_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	CreateInvItems (self, ItAt_Kosc, 1);
//------------------------------------------
	start_aistate	=	ZS_MM_Summoned;
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();		
};

func void Set_DarkWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//Mdl_SetVisualBody		(self,	"Ske_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	PAL_ARMOR_OLD_H);
	Mdl_SetVisualBody		(self,	"Ske_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	PAL_ARMOR_A_H);
// 	CreateInvItem				(self,PAL_ARMOR_OLD_H);	
// 	AI_EquipArmor				(self,);
	
};
INSTANCE ArtifactGuardian (Mst_Default_SkeletonWarrior)
{
	name							=	"Stra¿nik artefaktu";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	100;
	npctype		=	npctype_main;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SKELETONLORD);
//------------------------------------------
	Set_DarkWarrior_Visuals();
	EquipItem(self,ItMw_2H_Sword_Light_Rusty_05);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	20;
//------------------------------------------
	start_aistate	=	ZS_MM_GotoHeroAndTalk;
 Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  0);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	CreateInvItems (self, ItAt_Kosc, 1);		
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
};

INSTANCE Cave_Statue (Mst_Default_Skeleton)
{
	name							=	"";
	level							=	30;
	attribute	[ATR_STRENGTH]		=	70;
	npctype		=	npctype_main;
	Npc_SetAivar(self,AIV_MM_REAL_ID,ID_CAVESTATUE);
//------------------------------------------
	Set_DarkWarrior_Visuals();
	EquipItem(self,ItMw_2H_Sword_Light_Rusty_05);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	20;
//------------------------------------------
	start_aistate	=	ZS_MM_Statue;
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  0);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	CreateInvItems (self, ItAt_Kosc, 1);	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};

// ************************************
//
//  S k e l e t o n   R a n g e r s
//
// ************************************


Instance MIS_CRYSTAL_SkeletonFireRanger(Mst_Default_SkeletonRanger)
{
	Set_SkeletonScout_Visuals();
	name = "Stra¿nik";
	CreateInvItems (self, ItRw_Bow_Ske_02, 1);	
	CreateInvItems (self, ItAmFireArrow, 15);	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	attribute	[ATR_HITPOINTS_MAX]	=	360;
	attribute	[ATR_HITPOINTS]		=	360;

	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;	
	level							=	30;
	
};



Instance SkeletonRanger(Mst_Default_SkeletonRanger)
{
	Set_SkeletonScout_Visuals();
	CreateInvItems (self, ItRw_Bow_Ske_01, 1);	
	CreateInvItems (self, ItAmArrow, 15);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	
};

Instance SkeletonFireRanger(Mst_Default_SkeletonRanger)
{
	level					=	50;
	Set_SkeletonScout_Visuals();
	CreateInvItems (self, ItRw_Bow_Ske_02, 1);	
	CreateInvItems (self, ItAmFireArrow, 15);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};
Instance SkeletonIceRanger(Mst_Default_SkeletonRanger)
{
	level					=	50;
	Set_SkeletonScout_Visuals();
	CreateInvItems (self, ItRw_Bow_Ske_03, 1);	
	CreateInvItems (self, ItAmIceArrow, 15);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};
Instance SkeletonPoisonRanger(Mst_Default_SkeletonRanger)
{
	level					=	40;
	Set_SkeletonScout_Visuals();
	CreateInvItems (self, ItRw_Bow_Ske_04, 1);	
	CreateInvItems (self, ItAmPoisonArrow, 15);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();		
};


INSTANCE MD_WaveSpawn_R			(Mst_Default_Skeleton)
{
	name					=	"Poddany Truan'a";
	
	start_aistate				= ZS_MM_MDWAVE;		
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETON_MDWAVE);
	var int rnd;
	damagetype 						=	0;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
	damage		[DAM_INDEX_POINT]	=	1;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
	damage		[DAM_INDEX_MAGIC]	=	5+(2*MD_FinalBattle_Wave);		
	
	// Fix tak na odmulenie ;)
	// 8:50 PM 10/15/2012 orc
 Npc_SetAivar(self,AIV_MM_PercRange,		 4000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 3500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 2500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 20);
	
	if(MD_FinalBattle_Wave<=3)
	{
	Set_Skeleton_Visuals();
	rnd=hlp_random(3);
	if(!rnd)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	}
	else if(rnd==1)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	}
	else
	{
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);
	};
	}
	else if(MD_FinalBattle_Wave<=6)
	{
	Set_SkeletonScout_Visuals();
	rnd=hlp_random(3);
	if(!rnd)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	}
	else if(rnd==1)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	}
	else
	{
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);
	};
	}
	else if(MD_FinalBattle_Wave<=10)
	{
	Set_SkeletonWarrior_Visuals();
	rnd=hlp_random(2);
	if(!rnd)
	{
	EquipItem		(self, ItMw_2H_Axe_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	}
	else
	{
	EquipItem		(self, ItMw_2H_Sword_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	};
	}
	else if(MD_FinalBattle_Wave<=11)//mage
	{
		Set_SkeletonMage_Visuals();
		guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
		
		protection	[PROT_BLUNT]		=	50;
		protection	[PROT_EDGE]			=	80;
		protection	[PROT_POINT]		=	50;
		protection	[PROT_FIRE]			=	50;
		protection	[PROT_FLY]			=	0;
		protection	[PROT_MAGIC]		=	50;		
		
    	
    	
		fight_tactic =			FAI_HUMAN_MAGE;
    	
		CreateInvItem			(self,	ItArRuneThunderbolt);
		CreateInvItems			(self,	ItArScrollSummonSkeletons,	1);
	}
	else
	{
		Set_DarkWarrior_Visuals();
	EquipItem		(self, ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,	"humans_2hst3.mds");
	start_aistate	=	ZS_MM_MDWAVE;

	CreateInvItem     (self, ItMw_Dual_01_Left );		
	};
	//ATT's
	attribute[ATR_STRENGTH] = 20 + (3*MD_FinalBattle_Wave); //SN: da Waffe nicht zum Schaden addiert wird!
	
	attribute[ATR_HITPOINTS_MAX] = attribute[ATR_HITPOINTS_MAX] + 12*MD_FinalBattle_Wave; //SN: da Waffe nicht zum Schaden addiert wird!
	attribute[ATR_HITPOINTS] = attribute[ATR_HITPOINTS] + 12*MD_FinalBattle_Wave; //SN: da Waffe nicht zum Schaden addiert wird!
	if(MD_FinalBattle_Wave<=10)&&(MD_FinalBattle_Wave>6)
	{
	attribute[ATR_STRENGTH] = 2*MD_FinalBattle_Wave;

	};	
		level					=	10+(5*MD_FinalBattle_Wave);
	
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
	
};

INSTANCE MD_WaveSpawn_L			(Mst_Default_Skeleton)
{
	name					=	"Poddany Truan'a";
	
	start_aistate				= ZS_MM_MDWAVE;		
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETON_MDWAVE);
	var int rnd;
	damagetype 						=	0;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
	damage		[DAM_INDEX_POINT]	=	1;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
	damage		[DAM_INDEX_MAGIC]	=	5+(2*MD_FinalBattle_Wave);	
	
	// Fix tak na odmulenie ;)
	// 8:50 PM 10/15/2012 orc
 Npc_SetAivar(self,AIV_MM_PercRange,		 4000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 3500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 2500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 20);
	
	if(MD_FinalBattle_Wave<=3)
	{
	Set_Skeleton_Visuals();
	rnd=hlp_random(3);
	if(!rnd)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	}
	else if(rnd==1)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	}
	else
	{
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);
	};
	}
	else if(MD_FinalBattle_Wave<=6)
	{
	Set_SkeletonScout_Visuals();
	rnd=hlp_random(3);
	if(!rnd)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);
	}
	else if(rnd==1)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);
	}
	else
	{
	Npc_SetToFightMode		(self, ItMw_1H_Scythe_01);
	};
	}
	else if(MD_FinalBattle_Wave<=10)
	{
	Set_SkeletonWarrior_Visuals();
	rnd=hlp_random(2);
	if(!rnd)
	{
	EquipItem		(self, ItMw_2H_Axe_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	}
	else
	{
	EquipItem		(self, ItMw_2H_Sword_Old_01);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,2); 	
	};
	}
	else if(MD_FinalBattle_Wave<=11)//mage
	{
		Set_SkeletonMage_Visuals();
		guild					=	GIL_DEMON;	// "fliegende" Gilde nötig, damit es nicht Watet/Schwimmt/... !
		
		protection	[PROT_BLUNT]		=	50;
		protection	[PROT_EDGE]			=	80;
		protection	[PROT_POINT]		=	50;
		protection	[PROT_FIRE]			=	50;
		protection	[PROT_FLY]			=	0;
		protection	[PROT_MAGIC]		=	50;		
    	
    	
		fight_tactic =			FAI_HUMAN_MAGE;
    	
		CreateInvItem			(self,	ItArRuneThunderbolt);
		CreateInvItems			(self,	ItArScrollSummonSkeletons,	1);
	}
	else
	{
		Set_DarkWarrior_Visuals();
	EquipItem		(self, ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,	"humans_2hst3.mds");
	start_aistate	=	ZS_MM_MDWAVE;

	CreateInvItem     (self, ItMw_Dual_01_Left );		
	};
	//ATT's
	attribute[ATR_STRENGTH] = 20 + (3*MD_FinalBattle_Wave); //SN: da Waffe nicht zum Schaden addiert wird!
	
	attribute[ATR_HITPOINTS_MAX] = attribute[ATR_HITPOINTS_MAX] + 12*MD_FinalBattle_Wave; //SN: da Waffe nicht zum Schaden addiert wird!
	attribute[ATR_HITPOINTS] = attribute[ATR_HITPOINTS] + 12*MD_FinalBattle_Wave; //SN: da Waffe nicht zum Schaden addiert wird!
	if(MD_FinalBattle_Wave<=10)&&(MD_FinalBattle_Wave>6)
	{
	attribute[ATR_STRENGTH] = 2*MD_FinalBattle_Wave;

	};	
		level					=	10+(5*MD_FinalBattle_Wave);
	
	CreateInvItems (self, ItAt_Kosc, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
};




func void ZS_MM_MDOpenDoor()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDOpenDoor");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self);
	AI_EquipArmor     (self, ItMw_Dual_01_Left );
	CreateInvItem     (self, ItMw_Dual_01_Left );			
	
};

func int ZS_MM_MDOpenDoor_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_MDOpenDoor_loop");
    AI_UseMob				(self,"DOOR",1);
 //   AI_UseMob				(self,"DOOR",-1);
    return loop_end;

};

func void ZS_MM_MDOpenDoor_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDOpenDoor_end");
   AI_GotoWp(SELF,"KOMNATA_PRZEMIANY_SKEL2");
    AI_StartState				(self,ZS_MM_AllScheduler,1,"");
   self.start_aistate				= ZS_MM_AllScheduler;
    
};


func void ZS_MM_Ranger()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Ranger");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self);
	AI_EquipArmor     (self, ItMw_Dual_01_Left );
	CreateInvItem     (self, ItMw_Dual_01_Left );			
	
};

func int ZS_MM_Ranger_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Ranger_loop");
    if(npc_getdisttoplayer(self)>1800)
    {
	AI_TUrnToNpc(self,hero);
	AI_Wait(self,1);
    return loop_continue;
	    
    }
    else
    {
    return loop_end;
	};

};

func void ZS_MM_Ranger_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Ranger_end");
    Npc_SetTarget(self,hero);
    AI_StartState				(self,ZS_Attack,1,"");
   self.start_aistate				= ZS_Attack;
    
};

func void ZS_MM_DualEquip()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDOpenDoor");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self);
	AI_EquipArmor     (self, ItMw_Dual_01_Left );
	CreateInvItem     (self, ItMw_Dual_01_Left );			
	
};

func int ZS_MM_DualEquip_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_MDOpenDoor_loop");
    return loop_end;

};

func void ZS_MM_DualEquip_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDOpenDoor_end");
    AI_StartState				(self,ZS_MM_AllScheduler,1,"");
   self.start_aistate				= ZS_MM_AllScheduler;
    
};
func void ZS_MM_Statue()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Statue");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self);
};

func int ZS_MM_Statue_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Statue_loop");
    
	if	(RAISESTATUES)
	{
		//Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
		return LOOP_END;
	};
	Ai_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_MM_Statue_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Statue_end");
    Wld_PlayEffect("RED_FACE", self, self, 0,0 , DAM_MAGIC, TRUE);
    Wld_PlayEffect("RED_EYE_R", self, self, 0,0 , DAM_MAGIC, TRUE);
    Wld_PlayEffect("RED_EYE_L", self, self, 0,0 , DAM_MAGIC, TRUE); 
	Ai_Wait(self, 0.3);    
    AI_StartState				(self,ZS_MM_AllScheduler,1,"");
   self.start_aistate				= ZS_MM_AllScheduler;
    
};

func void ZS_MM_MDWAVE()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDWAVE");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_NoReact);//B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_MM_NoReact);//B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self);
    Wld_PlayEffect("spellFX_KATRAKANAT_DEMON_SPAWN", self, self, 0,0 , DAM_MAGIC, TRUE);	
    if(MD_FinalBattle_Wave==12)
    {
		AI_EquipArmor     (self, ItMw_Dual_01_Left );
		CreateInvItem     (self, ItMw_Dual_01_Left );
	};	
	if(Hlp_StrCmp(self.wp,"MD_PATH_SPAWNA_01"))		
	{
   		AI_GotoWp(SELF,"MD_PATH_SPAWNA_03");
   		var c_npc rod; rod = hlp_getnpc(roderic);
   		Npc_SetTarget(self,rod);
    	AI_StartState				(self,ZS_Attack,1,"");   		
	}
	else
	{
		AI_GotoWp(SELF,"MD_PATH_SPAWNB_03");	
   		Npc_SetTarget(self,hero);	
   		AI_StartState				(self,ZS_Attack,1,"");   			
	};
	
};

func int ZS_MM_MDWAVE_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_MDWAVE_loop");

    return loop_end;

};

func void ZS_MM_MDWAVE_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MDWAVE_end");


    
};

