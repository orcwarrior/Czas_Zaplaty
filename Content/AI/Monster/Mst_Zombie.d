/*************************************************************************
**	Zombie Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Zombie(C_Npc)			
{
	name							=	"Zombi";
	guild							=	GIL_ZOMBIE;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_ZOMBIE);
	level							=	24;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	200;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	35;
	protection	[PROT_MAGIC]		=	130;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic							=	FAI_ZOMBIE;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 2499);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 2000);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
PROTOTYPE Mst_Default_ZombieHeavy(C_Npc)			
{
	//Tpl + Guru
	name							=	"Zombi";
	guild							=	GIL_ZOMBIE;
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_ZOMBIE);
	level							=	40;
//-----------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	220;
	protection	[PROT_FIRE]			=	180;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	150;
//-----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-----------------------------------------------------------
	fight_tactic							=	FAI_ZOMBIE;
//-----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2500;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 2500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 2500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 1);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 15);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};


//-------------------------------------------------------------
// Zwei Hautfarben mit jeweils zwei Gesichtstexturen
//-------------------------------------------------------------
func void Set_Zombie_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie2_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			0,			"Zom_Head", 1,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie3_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 0,  		3,			-1);
};
//-------------------------------------------------------------
func void Set_Zombie4_Visuals()
{
	Mdl_SetVisual			(self,	"Zombie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			-1);
	
};
func void Set_ZombieGrd_Visuals()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody 		(self,	"Zom_Body",		0,			1,			"Zom_Head", 1,  		3,			GRD_ARMOR_M);
	Mdl_ApplyOverlayMds 	(self,	"HUMANS_ZOMBIE.MDS");	
	
};
func void Set_PSIZombie_Visuals(var int armor)
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"HUMANS_ZOMBIE.MDS");	
	Mdl_SetVisualBody 		(self,	"Zom_Body",		5,			Hlp_Random(4),			"Zom_Head", 2+Hlp_random(4),  		3,			armor);
	Mdl_ApplyOverlayMds 	(self,	"HUMANS_ZOMBIE.MDS");	
};

/*************************************************************************
**	Zombie    															**
*************************************************************************/

INSTANCE Zombie		(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();		
};


/*************************************************************************
**	Zombie2   															**
*************************************************************************/

INSTANCE Zombie2	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();		
};


/*************************************************************************
**	Zombie3   															**
*************************************************************************/

INSTANCE Zombie3	(Mst_Default_Zombie)
{
	Set_Zombie3_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
};

/*************************************************************************
**	Zombie4   															**
*************************************************************************/

INSTANCE Zombie4	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
};
INSTANCE Zombie_PickAxe	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	Npc_SetToFightMode		(self, ItMwPickaxe);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
};
INSTANCE Zombie_Katrakanat	(Mst_Default_Zombie)
{
	Set_ZombieGrd_Visuals();
	Npc_SetToFightMode		(self, ItMw_1h_Sword_Long_01);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	15;	
	B_SetMonsterLevel();	
};

INSTANCE Zombie_BonesChamber1	(Mst_Default_Zombie)
{
	Set_Zombie_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};

INSTANCE Zombie_BonesChamber2	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};

INSTANCE Zombie_BonesChamber3	(Mst_Default_Zombie)
{
	Set_Zombie3_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};

INSTANCE Zombie_BonesChamber4	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};


INSTANCE Zombie_BonesChamber5	(Mst_Default_Zombie)
{
	Set_Zombie4_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};


INSTANCE Zombie_BonesChamber6	(Mst_Default_Zombie)
{
	Set_Zombie2_Visuals();
	name			=	"";
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();
	//KOMNATA_KOSCI_05
	start_aistate				= ZS_ZombieLie;
		
};
VAR INT ZOMBIE_RISE;
func void ZS_ZombieLie()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_ZombieLie");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_NoReact);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_NoReact);
	AI_AlignToWP(self); var int self_id; self_id = hlp_getinstanceid(self);
	var ocnpc zomb;
	zomb=hlp_getnpc(self_id);
	zomb._zCVob_vob_bitfield[0] = zomb._zCVob_vob_bitfield[0] &~ zCvob_bitfield0_collDetectionDynamic;
	zomb._zCVob_type = 2;   
	
// 	AI_PLAYANI(self,"T_FALLDN_2_FALL");
// 	AI_PLAYANI(self,"T_FALL_2_FALLEN");
};

func int ZS_ZombieLie_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_ZombieLie_loop");
 	AI_PLAYANI(self,"S_FALLEN");
 	var int self_id; self_id = hlp_getinstanceid(self);
	var ocnpc zomb;
	zomb=hlp_getnpc(self_id);
 
	if	(ZOMBIE_RISE)
	{
		//Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_ZombieLie_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_ZombieLie_end");
    //TO DO oCNpc_GetPointer 
 	var ocnpc zomb; var int self_id; self_id = hlp_getinstanceid(self);
	zomb=hlp_getnpc(self_id);
	zomb._zCVob_vob_bitfield[0] = zomb._zCVob_vob_bitfield[0] | zCvob_bitfield0_collDetectionDynamic;
	zomb._zCVob_type = 130;    
	AI_PLAYANI(self,"T_FALLEN_2_STAND");
	AI_StandUp		(self);
	self.name		=		"Zombi";
    AI_StartState				(self,ZS_MM_AllScheduler,0,"");
   self.start_aistate				= ZS_MM_AllScheduler;
    
};




INSTANCE PSI_GuruZombie	(Mst_Default_ZombieHeavy)
{
	Set_PSIZombie_Visuals(ZOM_GUR_ARMOR_M);
	fight_tactic							=	FAI_HUMAN_MAGE;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	400;
	attribute	[ATR_MANA] 			=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;	
	level							=	70;
	var int rnd;
	rnd = Hlp_random(4);
	if(rnd == 0)
	{		
	CreateInvItem			(self,	ItArRuneFireball);	
	CreateInvItems			(self,	ItArScrollSummonDemon,	1);
	}
	else if(rnd == 1)
	{		
	CreateInvItem			(self,	ItArRuneIceCube);
	CreateInvItems			(self,	ItArScrollThunderball,5);	
	CreateInvItems			(self,	ItArScrollSummonSkeletons,	1);
	}	
	else if(rnd == 2)
	{		
	CreateInvItem			(self,	ItArRunePyrokinesis);	
	CreateInvItems			(self,	ItArScrollArmyOfDarkness,	1);
	}
	else if(rnd == 3)
	{		
	CreateInvItems			(self,	ItArScrollThunderball,5);	
	CreateInvItems			(self,	ItArScrollWindFist,	2);
	CreateInvItem			(self,	ItArRuneThunderbolt);		
	};	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  45);
	Npc_SetAivar(self,AIV_MM_REAL_ID, ID_ZOMBIE_GURU);
	B_SetMonsterLevel();			
};

INSTANCE PSI_GuruZombieFireStorm	(Mst_Default_ZombieHeavy)
{
	Set_PSIZombie_Visuals(ZOM_GUR_ARMOR_M);
	fight_tactic							=	FAI_HUMAN_MAGE;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	401;
	attribute	[ATR_MANA] 			=	401;
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;	
	level							=	70;
	
	CreateInvItem			(self,	ItArRuneFireStorm);	

	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  45);
	Npc_SetAivar(self,AIV_MM_REAL_ID, ID_ZOMBIE_GURU);
	B_SetMonsterLevel();			
};


///////////////////////////////////////////
//	NOV
///////////////////////////////////////////
INSTANCE PSI_NovHZombie	(Mst_Default_Zombie)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	150;	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;	
	level							=	35;
	rnd = Hlp_random(3);
	Set_PSIZombie_Visuals(ZOM_NOV_ARMOR_H);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_03);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_04);	
	}	
	else if (rnd == 4)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Mace_05);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}	
	else if (rnd == 8)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Mace_War_01);	
	}	
	else if (rnd == 9)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Mace_War_02);	
	};
	};		
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
	

};

INSTANCE PSI_NovMZombie	(Mst_Default_Zombie)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	125;	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;	
	level							=	32;
	rnd = Hlp_random(3);
	Set_PSIZombie_Visuals(ZOM_NOV_ARMOR_M);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);	
		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_03);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_04);	
	}	
	else if (rnd == 4)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Mace_05);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	};	
	};		
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
	

};

INSTANCE PSI_NovLZombie	(Mst_Default_Zombie)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	110;	
	attribute	[ATR_HITPOINTS_MAX]	=	270;
	attribute	[ATR_HITPOINTS]		=	270;	
	level							=	30;
	rnd = Hlp_random(3);
	Set_PSIZombie_Visuals(ZOM_NOV_ARMOR_L);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);	
		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_03);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_04);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	};
	};		
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
	

};
//////////////////////////////////////////////////////////////////////////
//	TPL
//////////////////////////////////////////////////////////////////////////
INSTANCE PSI_TplHZombie	(Mst_Default_ZombieHeavy)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	250;	
	attribute	[ATR_HITPOINTS_MAX]	=	550;
	attribute	[ATR_HITPOINTS]		=	550;	
	level							=	60;
	rnd = Hlp_random(3);
	Set_PSIZombie_Visuals(ZOM_TPL_ARMOR_H);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);	
		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 4)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Bastard_01);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}	
	else if (rnd == 8)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 9)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	};
	};		
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
	

};

INSTANCE PSI_TplMZombie	(Mst_Default_ZombieHeavy)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	225;	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;	
	level							=	55;

	Set_PSIZombie_Visuals(ZOM_TPL_ARMOR_M);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);	
		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 4)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Bastard_01);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}	
	else if (rnd == 8)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 9)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	};
	};		
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
};

INSTANCE PSI_TplLZombie	(Mst_Default_ZombieHeavy)
{
	var int rnd;
	guild							=	GIL_ZOMBIE;	
	attribute	[ATR_MANA_MAX] 		=	71;
	attribute	[ATR_MANA] 			=	71;	
	attribute	[ATR_STRENGTH]		=	200;	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;	
	level							=	50;

	Set_PSIZombie_Visuals(ZOM_TPL_ARMOR_L);
	rnd = Hlp_random(6);	
	if(3>rnd)
	{
	//NO WEAPON	
	Npc_SetToFistMode(self);	
		
	}
	else
	{
	rnd = Hlp_random(10);
	if (rnd == 0)
	{
	Npc_SetToFightMode		(self, ItMw_1h_mace_01);	
	}
	else if (rnd == 1)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 2)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}		
	else if (rnd == 3)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Sword_Old_02);	
	}	
	else if (rnd == 4)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 5)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 6)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Axe_Old_01);	
	}		
	else if (rnd == 7)
	{
	Npc_SetToFightMode		(self, ItMw_2H_Staff_01);	
	}	
	else if (rnd == 8)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	}	
	else if (rnd == 9)
	{
	Npc_SetToFightMode		(self, ItMw_1H_Sword_Old_01);	
	};
	};	
	//	Npc_SetToFistMode(ItMw_1h_mace_03);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  35);
	B_SetMonsterLevel();	
	

};
/*************************************************************************
**	ZombieOrkHunter														**
*************************************************************************/
// SN: Endgegner vor Fokus 5 unter dem Steinkreis (Ende Kapitel 3)
INSTANCE ZombieTheKeeper	(Mst_Default_Zombie)
{
	name	= "Nadzorca";
	level	=	150;		// für XP!
	ID 		= MID_THEKEEPER;

	Set_Zombie4_Visuals();
	Npc_SetToFistMode(self);

	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_FIRE]			=	9999;	//immun

	senses_range					= 1000;

 Npc_SetAivar(self,AIV_MM_Behaviour,			 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,			 1000);
 Npc_SetAivar(self,AIV_MM_DrohRange,			 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,		 1000);
 Npc_SetAivar(self,AIV_MM_DrohTime,			 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,		 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater, 	 FALSE);



	CreateInvItem	(self,	ItMi_OrcTalisman);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  250);
	B_SetMonsterLevel();	
};