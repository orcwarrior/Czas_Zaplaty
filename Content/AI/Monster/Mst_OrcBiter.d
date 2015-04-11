/*************************************************************************
**	OrcBiter Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcBiter(C_Npc)			
{
	name							=	"K¹sacz";
	guild							=	GIL_ORCDOG;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCBITER);
	level							=	13;
//----------------------------------------------------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	5;
//----------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------
	fight_tactic					=	FAI_SCAVENGER;
//----------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_OrcBiter_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orcbiter.mds"); // eigener Run-Loop
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sc2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	OrcBiter    														**
*************************************************************************/

INSTANCE OrcBiter (Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  9);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  20);
	B_SetMonsterLevel();	
	
};