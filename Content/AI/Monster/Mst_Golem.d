/*************************************************************************
**	Golem Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Golem(C_Npc)			
{
	name							=	"Golem";
	guild							=	GIL_GOLEM;
	// REAL_ID in Instanzen !!!
	level							=	50;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	9999;
	protection	[PROT_EDGE]			=	9999;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	9999;	// immun
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	9999;
//--------------------------------------------------------------
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_GOLEM;
//--------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_StoneGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_FireGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Firegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_IceGolem_Visuals()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gol_Ice_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
//-------------------------------------------------------------
func void Set_SwampGolem_Visuals()
{
	Mdl_SetVisual			(self,	"SwampGolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"GOL_SUMPF_BODY",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void Set_CH4Golem_Visuals()
{
	Mdl_SetVisual			(self,	"GOLEM_MASSACRE.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"GOLEM_CH4_BODY",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Stone Golem   														**
*************************************************************************/

INSTANCE StoneGolem	(Mst_Default_Golem)
{
	name	=	"Kamienny golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_STONEGOLEM);
	protection	[PROT_BLUNT]		=	90;
	attribute	[ATR_STRENGTH]		=	300;
//--------------------------------------------
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;

	Set_StoneGolem_Visuals();
	Npc_SetToFistMode	(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  175);
	//B_SetMonsterLevel();	
};


/*************************************************************************
**	Summoned Stone Golem    											**
*************************************************************************/

INSTANCE SummonedByPC_StoneGolem (Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_STONEGOLEM);

	//-------- visual --------
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);

	level = 0;
	//-------- attributes --------
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_BLUNT]		=	90;
//--------------------------------------------
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	
	//-------- ai --------
	senses 							= SENSE_HEAR | SENSE_SEE;
	start_aistate					= ZS_MM_SummonedByPC;
	Npc_SetAivar(self,AIV_MM_DistToMaster,  400);
	Npc_SetAivar(self,AIV_MM_TimeLooseHP, 	 2);
	Party_AddNpc(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  165);
	//B_SetMonsterLevel();	
};

INSTANCE SummonedByNPC_StoneGolem (Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Kamienny golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,ID_STONEGOLEM);

	//-------- visual --------
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	protection	[PROT_BLUNT]		=	90;
//--------------------------------------------
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	
	//-------- ai --------
	start_aistate					= ZS_MM_Summoned;
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  165);
	//B_SetMonsterLevel();		
};


/*************************************************************************
**	Fire Golem   														**
*************************************************************************/
INSTANCE FireGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Ognisty golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 ID_FIREGOLEM);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);

	//-------- visual --------
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	80;	// da Feuerschaden
	protection	[PROT_MAGIC]		=	0;	// betrifft im wesentlichen die Blitz- und Eiszauber
	attribute	[ATR_HITPOINTS_MAX]	=	650;// da er nur durch Blitz- und Eiszauber verwundbar ist, muﬂ dieser Wert hier sehr viel niedriger sein 
	attribute	[ATR_HITPOINTS]		=	650;
	damagetype 						=	DAM_FIRE;

	//-------- inventory --------

	//-------- ai --------
	//B_SetMonsterLevel();	
};
/*************************************************************************
**	Fire Golem   														**
*************************************************************************/
INSTANCE MD_FireGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Ognisty golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_FIREGOLEM);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);

	//-------- visual --------
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	10;	// da Feuerschaden
	protection	[PROT_MAGIC]		=	0;	// betrifft im wesentlichen die Blitz- und Eiszauber
	attribute	[ATR_HITPOINTS_MAX]	=	150;// da er nur durch Blitz- und Eiszauber verwundbar ist, muﬂ dieser Wert hier sehr viel niedriger sein 
	attribute	[ATR_HITPOINTS]		=	150;
	damagetype 						=	DAM_FIRE;
	level=0;
	//-------- inventory --------

	//-------- ai --------
	//B_SetMonsterLevel();	
};
INSTANCE Lesser_firegolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Ognisty golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_FIREGOLEM);

	//-------- visual --------
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	30;	// da Feuerschaden
	protection	[PROT_MAGIC]		=	0;	// betrifft im wesentlichen die Blitz- und Eiszauber
	attribute	[ATR_HITPOINTS_MAX]	=	90;// da er nur durch Blitz- und Eiszauber verwundbar ist, muﬂ dieser Wert hier sehr viel niedriger sein 
	attribute	[ATR_HITPOINTS]		=	90;
	damagetype 						=	DAM_FIRE;

	//-------- inventory --------
	level = 30;
	//-------- ai --------
	//B_SetMonsterLevel();	
};

/*************************************************************************
**	Ice Golem   														**
*************************************************************************/
INSTANCE IceGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Lodowy golem";
	Npc_SetAivar(self,AIV_MM_REAL_ID,ID_ICEGOLEM);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);

	//-------- visual --------
	Set_IceGolem_Visuals();
//	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_MANA_MAX] 		=	500;
	attribute	[ATR_MANA] 			=	500;
	attribute	[ATR_HITPOINTS_MAX]	=	650;	// da er nur durch Feuerschaden verwundbar
	attribute	[ATR_HITPOINTS]		=	650;
	protection	[PROT_FIRE]			=	1;
	damagetype 						=	DAM_BLUNT;

	//-------- inventory --------

	//-------- ai --------
	fight_tactic					=	FAI_HUMAN_MAGE;		// damit der Golem eine "Icecube"-Attack einsetzen kann

	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  165);
	//B_SetMonsterLevel();	
};

/*************************************************************************
**	Bridge Golem   														**
*************************************************************************/
// bewacht die Br¸cke zur Bergfestung
// Hinweis im Spiel: sollte mit Keulenwaffen bezwungen werden!
INSTANCE BridgeGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem mostowy";
	level	=	25;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	//Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	120;
	
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;

	protection	[PROT_BLUNT]		=	60;
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  85);
	//B_SetMonsterLevel();	
};
INSTANCE Guard_Golem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	level	=	25;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	protection	[PROT_BLUNT]		=	30;
	start_aistate					= ZS_MM_SleepingGuardian;	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	//B_SetMonsterLevel();	
};

INSTANCE TheBeast	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	level	=	25;

	//-------- visuals --------
	Set_CH4Golem_Visuals();
	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	protection	[PROT_BLUNT]		=	30;
	start_aistate					= ZS_MM_SleepingGuardian;	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	//B_SetMonsterLevel();	
};

INSTANCE TheBeast2	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	level	=	25;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	Mdl_SetModelScale(self, 2.2, 2.2, 2.2);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	protection	[PROT_BLUNT]		=	30;
	start_aistate					= ZS_MM_SleepingGuardian;	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	//B_SetMonsterLevel();	
};

INSTANCE TheBeast3	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	level	=	25;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	Mdl_SetModelScale(self, 2.8, 2.8, 2.8);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	protection	[PROT_BLUNT]		=	30;
	start_aistate					= ZS_MM_SleepingGuardian;	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	//B_SetMonsterLevel();	
};
INSTANCE TheBeast4	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Golem";
	level	=	25;

	//-------- visuals --------
	Set_StoneGolem_Visuals();
	Mdl_SetModelScale(self, 2.0, 2.0, 2.0);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	200;
	attribute	[ATR_HITPOINTS]		=	200;

	protection	[PROT_BLUNT]		=	30;
	start_aistate					= ZS_MM_SleepingGuardian;	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	//B_SetMonsterLevel();	
};

INSTANCE SwampGolem	(Mst_Default_Golem)
{
	//-------- general --------
	name	=	"Bagienny golem";
	level	=	30;

	//-------- visuals --------
	Set_SwampGolem_Visuals();
	//Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	Npc_SetToFistMode(self);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	110;
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	350;
	attribute	[ATR_HITPOINTS]		=	350;

	protection	[PROT_EDGE]		=	100;
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN, 999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  85);
	Npc_SetAivar(self,AIV_MM_REAL_ID,  999);
	//B_SetMonsterLevel();	
};
