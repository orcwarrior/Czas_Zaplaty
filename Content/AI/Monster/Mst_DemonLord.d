/*************************************************************************
**	Demon LORD Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_DemonLord(C_Npc)			
{
	name							=	"Ksi¹¿e demonów";
	guild							=	GIL_DEMON;
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_DEMONLORD);
	level							=	100;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	120;
	protection	[PROT_FIRE]			=	200;	
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	100;
//--------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------
	fight_tactic					=	FAI_DEMON;
//--------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 4000;

   Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
      
   Npc_SetAivar(self,AIV_MM_PercRange,		 4000);
   Npc_SetAivar(self,AIV_MM_DrohRange,		 4000);
   Npc_SetAivar(self,AIV_MM_AttackRange,	 3500);
   Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
   Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
   Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
   Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
   //-------------------------------------------------------------
   start_aistate				= ZS_MM_AllScheduler;
   Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	//Npc_SetAivar(Npc_SetAivar,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_DemonLord_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Katrakanat_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void Set_DemonPSI_Visuals()
{
	Mdl_SetVisual			(self,	"Demon.mds");
	Mdl_ApplyOverlayMds 	(self,	"DEMON_PSI.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dem2_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	DemonLord    														**
*************************************************************************/

INSTANCE DemonLord	(Mst_Default_DemonLord)
{
	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  160);
	B_SetMonsterLevel();	
};

INSTANCE DemonPsi (Mst_Default_DemonLord)
{
	Set_DemonPSI_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	damagetype 						=	DAM_MAGIC;
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_DEMONPSI);
	attribute	[ATR_STRENGTH]		=	230;
	protection	[PROT_BLUNT]		=	83;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;	

	attribute	[ATR_HITPOINTS_MAX]	=	2500*PSI_DREAM_FGT_TIME;
	attribute	[ATR_HITPOINTS]		=	5000*PSI_DREAM_FGT_TIME;	

	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	fight_tactic					=	FAI_GOLEM;
			
};
INSTANCE Demon_Katrakanat	(Mst_Default_DemonLord)
{
	Set_Katrakanat_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  160);
	B_SetMonsterLevel();	
	name							=	"Katrakanat";
//	guild							=	GIL_NONE;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_DEMONLORD);
	level							=	400;
//--------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;	
	Mdl_SetModelScale(self, 1.3, 1.2, 1.3);
	
	start_aistate				= ZS_KATRAKANAT_FLEE;
};

/*************************************************************************
**	Strange Demon    															**
*************************************************************************/

/*INSTANCE StrangeDemon (Mst_Default_Demon)
{
	flags 					= NPC_FLAG_IMMORTAL;
	npctype					= NPCTYPE_FRIEND;
	guild					= GIL_DEMON;
   level                           =       100;

   Npc_SetAivar(self,AIV_MM_REAL_ID,	 ID_DEMON);

	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);

	name                            =       "Staro¿ytny demon";

   attribute       [ATR_STRENGTH]          =       280;
   attribute       [ATR_DEXTERITY]         =       250;
   attribute       [ATR_HITPOINTS_MAX]     =       2180;
   attribute       [ATR_HITPOINTS]         =       2180;

   protection      [PROT_BLUNT]            =       140;
   protection      [PROT_EDGE]                     =       140;
   protection      [PROT_POINT]            =       120;
   protection      [PROT_FIRE]                     =       120;
   protection      [PROT_FLY]                      =       80;
   protection      [PROT_MAGIC]            =       110;
     
   start_aistate	= ZS_XardasDemon;

   Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
};
*/

INSTANCE MonsterOfSwamp (Mst_Default_DemonLord)
{
   name	=	"Jo¿in z ba¿in";
   flags = NPC_FLAG_IMMORTAL;
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_MONSTER_OF_SWAMP);
   attribute	[ATR_STRENGTH]		=	350;
	
	attribute	[ATR_HITPOINTS_MAX]	=	5000;
	attribute	[ATR_HITPOINTS]		=	5000;
   
	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);
   Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  21);
   Npc_SetAivar(self,AIV_MM_MAXLEVEL,  160);
	B_SetMonsterLevel();	
   CreateInvItem(self, beast_heart);
};

INSTANCE RavenDemonLord (Mst_Default_DemonLord)
{
   name	=	"Demon Kruka";
   attribute	[ATR_STRENGTH]		=	550;
	
	attribute	[ATR_HITPOINTS_MAX]	=	10000;
	attribute	[ATR_HITPOINTS]		=	10000;
   protection	[PROT_BLUNT]		=	250;
	protection	[PROT_EDGE]			=	250;
   
	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);
   Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  21);
   Npc_SetAivar(self,AIV_MM_MAXLEVEL,  160);
	B_SetMonsterLevel();	
};

INSTANCE NecromancerDemon (Mst_Default_DemonLord)
{
   name	=	"Nekromanta demon";
   
   attribute	[ATR_STRENGTH]		=	625;
	
	attribute	[ATR_HITPOINTS_MAX]	=	30000;
	attribute	[ATR_HITPOINTS]		=	30000;
   
   attribute	[ATR_MANA_MAX] 		=	3000;
	attribute	[ATR_MANA] 			=	3000;
//--------------------------------------------------------
	protection	[PROT_BLUNT]		=	300;
	protection	[PROT_EDGE]			=	300;
	protection	[PROT_POINT]		=	120;
	protection	[PROT_FIRE]			=	200;	
	protection	[PROT_FLY]			=	1000;
	protection	[PROT_MAGIC]		=	300;
   
   damagetype 						=	DAM_MAGIC;
   
	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);
   Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  21);
   Npc_SetAivar(self,AIV_MM_MAXLEVEL,  160);
	B_SetMonsterLevel();	
};