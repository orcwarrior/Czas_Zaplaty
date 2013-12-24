/*************************************************************************
**	Swampshark Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Swampshark(C_Npc)			
{
	name							=	"W¹¿ b³otny";
	guild							=	GIL_SWAMPSHARK;
	level							=	35;
//---------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	170;
	attribute	[ATR_DEXTERITY]		=	170;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------
	protection	[PROT_BLUNT]		=	180;
	protection	[PROT_EDGE]			=	180;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	9999;
	protection	[PROT_MAGIC]		=	40;
//---------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------
	fight_tactic							=	FAI_SWAMPSHARK;
//---------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1000);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_Swampshark_Visuals()
{
	Mdl_SetVisual			(self,	"Swampshark.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Swa_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Swampshark    														**
*************************************************************************/

INSTANCE Swampshark	(Mst_Default_Swampshark)
{
	Set_Swampshark_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  70);
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SWAMPSHARK);
	B_SetMonsterLevel();	
};


/*************************************************************************
**	hurt Swampshark: Mission: Sit_1_PSI_GorNaRan_KillSwampshark			**
*************************************************************************/

INSTANCE HurtSwampshark(Mst_Default_Swampshark)
{
	name							=	"Ranny w¹¿ b³otny";
	attribute	[ATR_HITPOINTS]		=	20;

	Set_Swampshark_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  70);
	B_SetMonsterLevel();	
};
