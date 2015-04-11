/*************************************************************************
**	Orc SCOUT Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcScout(C_Npc)			
{
	name							=	"Ork-myœliwy";
	guild							=	GIL_ORCSCOUT;
	npctype							=	NPCTYPE_GUARD;
	voice							=	17;
	level							=	22;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	65;  //+90
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	260;
	attribute	[ATR_HITPOINTS]		=	260;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	20;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------

//	fight_tactic					=	FAI_ORC;
	fight_tactic					=	FAI_HUMAN_STRONG;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2500;

	spawnDelay					= 150;
	
 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
//-------------------------------------------------------------
	start_aistate				= ZS_GuardPatrol;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
	
	};
//-------------------------------------------------------------
func void Set_OrcScout_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyScout",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Orc Scout    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE OrcScout (Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals	();
	EquipItem 				(self, ItMw2hOrcSword01);
	//EquipItem				(self, ItRw_Crossbow_01);
	//CreateInvItems			(self,	ItAmBolt,	30);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  13);	
	B_SetMonsterLevel();
	spawnDelay					= 150;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCSCOUT);	

};

/*************************************************************************
**	Orc_City - Essender Ork   														**
*************************************************************************/
INSTANCE OrcPeasantEatAndDrink (Mst_Default_OrcScout)
{
	//-------- general data --------
	guild			=	GIL_ORCSCOUT;
	name			=	"Ork";

	//-------- visuals --------
	Set_OrcScout_Visuals();

	//-------- inventory --------
	CreateInvItem	(self,	ItMw2hOrcSword01);	

	//-------- ai --------
	start_aistate	= ZS_Orc_EatAndDrink;
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  13);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORC);
	B_SetMonsterLevel();	

};

/*************************************************************************
**	Graveyard Orc Scout    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE OrcScoutGYD (Mst_Default_OrcScout)
{
	name						=	"Ork-zwiadowca";
	level						=	30;

	attribute	[ATR_STRENGTH]		=	150;  //+90

	Npc_SetAivar(self,AIV_MM_PercRange,		1500);
	Npc_SetAivar(self,AIV_MM_DrohRange,		1200);
	Npc_SetAivar(self,AIV_MM_AttackRange,	1000);
	Npc_SetAivar(self,AIV_MM_DrohTime,		0);
	Npc_SetAivar(self,AIV_MM_FollowTime,	10);

	start_aistate				=	ZS_GuardPatrol;		// Monster-AI
	Npc_SetAivar(self,AIV_MM_RoamStart,	OnlyRoutine);

	Set_OrcScout_Visuals	();
	EquipItem 				(self, ItMw2hOrcSword01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  15);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCSCOUTGYD);
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	65;
	protection	[PROT_EDGE]			=	65;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	30;
	B_SetMonsterLevel();		
	spawnDelay					= 250;

};

INSTANCE Orc2 (Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals	();
	EquipItem 				(self, ItMw2hOrcSword01);
	//EquipItem				(self, ItRw_Crossbow_01);
	//CreateInvItems			(self,	ItAmBolt,	30);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
};
INSTANCE Orc3 (Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals	();
	EquipItem 				(self, ItMw2hOrcSword01);
	//EquipItem				(self, ItRw_Crossbow_01);
	//CreateInvItems			(self,	ItAmBolt,	30);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
};
INSTANCE Orc4 (Mst_Default_OrcScout)
{
	Set_OrcScout_Visuals	();
	EquipItem 				(self, ItMw2hOrcSword01);
	//EquipItem				(self, ItRw_Crossbow_01);
	//CreateInvItems			(self,	ItAmBolt,	30);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();
};
