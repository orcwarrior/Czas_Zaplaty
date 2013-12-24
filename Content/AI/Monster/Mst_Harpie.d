	/*************************************************************************
**	Bloodfly Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Harpie(C_Npc)			
{
	name							=	"Harpia";
	guild							=	GIL_DEMON;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_HARPIE);
	level							=	15;
//---------------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	85;
	
	attribute	[ATR_HITPOINTS_MAX]	=	210;
	attribute	[ATR_HITPOINTS]		=	210;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	45;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	120;
//---------------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------	
	fight_tactic				= FAI_Demon;
//---------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 2500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 2000);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 3);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
//---------------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);	
};
//---------------------------------------------------------------
func void Set_Harpie_Visuals()
{
	Mdl_SetVisual			(self,	"Harpie.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Har_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Harpie    														**
*************************************************************************/

INSTANCE Harpie	(Mst_Default_Harpie)
{
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  9);		
};
/*************************************************************************
**	Mis    														**
*************************************************************************/
INSTANCE Harp1	(Mst_Default_Harpie)
{
	name							=	"Koœcista harpia";
	attribute	[ATR_STRENGTH]		=	35;		
	level							=	10;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
};

INSTANCE Harp2	(Mst_Default_Harpie)
{
	name							=	"Koœcista harpia";
	attribute	[ATR_STRENGTH]		=	35;		
	level							=	10;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
};

INSTANCE Harp3	(Mst_Default_Harpie)
{
	name							=	"Koœcista harpia";
	
	attribute	[ATR_STRENGTH]		=	35;		
	level							=	10;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
};

INSTANCE Harp4	(Mst_Default_Harpie)
{
	name							=	"Koœcista harpia";
	
	attribute	[ATR_STRENGTH]		=	35;		
	level							=	10;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
};

INSTANCE Harp5	(Mst_Default_Harpie)
{
	name							=	"Koœcista harpia";
	
	attribute	[ATR_STRENGTH]		=	35;		
	level							=	10;
	Set_Harpie_Visuals();
	Npc_SetToFistMode(self);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
};