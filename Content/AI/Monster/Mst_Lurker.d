/*************************************************************************
**	Lurker Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Lurker(C_Npc)			
{
	name							=	"Topielec";
	guild							=	GIL_LURKER;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_LURKER);
	level							=	15;
//-------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	160;
	attribute	[ATR_HITPOINTS]		=	160;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//-------------------------------------------------------------
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	55;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	5;
//-------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//-------------------------------------------------------------
	fight_tactic							=	FAI_LURKER;
//-------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1400);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//---------------------------------------------------
func void Set_Lurker_Visuals()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Lurker    														**
*************************************************************************/

INSTANCE Lurker	(Mst_Default_Lurker)
{
	Set_Lurker_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  3);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  28);
	B_SetMonsterLevel();	
};


/*************************************************************************
**	DamLurker															**
*************************************************************************/

// INSTANCE DamLurker(Mst_Default_Lurker)										
// {
// 	name	=	"Topielec spod tamy";
// 	ID 		=	MID_DAMLURKER;
// 	level	=	20;

// 	Set_Lurker_Visuals	();
// 	Npc_SetToFistMode	(self);

// 	CreateInvItem		(self,ItAt_DamLurker_01);
//  Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
//  Npc_SetAivar(self,AIV_MM_MAXLEVEL,  30);
// 	B_SetMonsterLevel();
// };
