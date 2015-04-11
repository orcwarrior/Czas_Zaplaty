/*************************************************************************
**	Orc WARRIOR Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_OrcWarrior(C_Npc)			
{
	name							=	"Ork-¿o³nierz";
	guild							=	GIL_ORCWARRIOR;
	
	npctype							=	NPCTYPE_GUARD;
	voice							=	17;
	level							=	25;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	195;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	30;
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
	fight_tactic					=	FAI_HUMAN_MASTER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;
	SpawnDelay=30+self.level*6;
 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_Guard;
};
//-------------------------------------------------------------
func void Set_OrcWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyWarrior",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};
func void Set_OrcElite_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYELITE",DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
};
func void Set_OrcElder_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"ORC_BODYSLAVE", 1,	DEFAULT,	"Orc_HeadSlave",DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Orc Warrior 1 - Fighter    														**
*************************************************************************/
INSTANCE OrcWarrior1	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-wojownik";
	level							=	30;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	55;//+100
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  17);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCWARRIOR1);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
	
};

/*************************************************************************
**	Orc Warrior 2 - Warrior    														**
*************************************************************************/
INSTANCE OrcWarrior2	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-¿o³nierz";
	level							=	35;
	//-------- visual --------
	Set_OrcWarrior_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	70;//+110
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	45;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe02);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  17);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCWARRIOR2);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
	
	B_SetMonsterLevel();	
};

/*************************************************************************
**	Orc Warrior 3 - Clan    														**
*************************************************************************/
INSTANCE OrcWarrior3	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-wiarus";
	level							=	37;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	80;//+120
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	325;
	attribute	[ATR_HITPOINTS]		=	300;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe03);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  18);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCWARRIOR3);	
	B_SetMonsterLevel();	
};

/*************************************************************************
**	Orc Warrior 4 - Tempelkrieger										**
*************************************************************************/
INSTANCE OrcWarrior4	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-stra¿nik";
	level							=	40;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	95;//+130
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	65;
	protection	[PROT_FIRE]			=	65;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
//----------------------------------------------------------	
	EquipItem 	(self, ItMw2hOrcaxe04);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  20);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCWARRIOR4);
	B_SetMonsterLevel();	
};
/*************************************************************************
**	OrcElite1 - orc elite warrior										**
*************************************************************************/
INSTANCE OrcElite1	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-elita";
	level							=	50;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	165;//+136
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	85;
	protection	[PROT_FIRE]			=	85;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	30;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcSword02);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  25);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCELITE);
	B_SetMonsterLevel();	
};

/*************************************************************************
**	OrcElite2 - orc comander									**
*************************************************************************/
INSTANCE OrcElite2	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-genera³";
	level							=	60;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	225;//+154 = 329
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	75;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcAxe03_2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  30);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCGENERAL);
	B_SetMonsterLevel();	
};


//MISSIONS
INSTANCE OrcWarrior_2ndWave	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ranny ork-wojownik";
	level							=	15;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	45;
	attribute	[ATR_HITPOINTS_MAX]	=	210;
	attribute	[ATR_HITPOINTS]		=	60;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
};

INSTANCE Orc1	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-wojownik";
	level							=	25;

	//-------- visual --------
	Set_OrcWarrior_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	55;
	attribute	[ATR_HITPOINTS_MAX]	=	210;
	attribute	[ATR_HITPOINTS]		=	210;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	5;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};

INSTANCE MIS_CarlsonOrcElite	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-elita";
	level							=	35;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	105;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	35;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcSword02);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
	start_aistate				= ZS_MisCarlsonOrc;
	
};

INSTANCE OrcElder	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Starszy orków";
	level							=	100;

	//-------- visual --------
	Set_OrcElder_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	255;
	attribute	[ATR_HITPOINTS_MAX]	=	810;
	attribute	[ATR_HITPOINTS]		=	810;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	65;

	//-------- inventory --------
	EquipItem (self, ItMw2hOrcaxe01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};



INSTANCE OrcGen1	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-genera³";
	level							=	60;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	175;//+154 = 329
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	75;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcAxe03_2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};

INSTANCE OrcGen2	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-genera³";
	level							=	60;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	175;//+154 = 329
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	75;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcAxe03_2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	B_SetMonsterLevel();	
};


INSTANCE OrcGen3	(Mst_Default_OrcWarrior)
{
	//-------- general --------
	name							=	"Ork-genera³";
	level							=	60;

	//-------- visual --------
	Set_OrcElite_Visuals();

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	175;//+154 = 329
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	//-------- protection --------
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	75;

	//-------- inventory --------
	EquipItem 	(self, ItMw2hOrcAxe03_2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
	B_SetMonsterLevel();	
};

