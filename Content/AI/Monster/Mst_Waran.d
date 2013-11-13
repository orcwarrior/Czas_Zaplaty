/*************************************************************************
**	Waran Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Waran(C_Npc)			
{
	name							=	"Jaszczur";
	guild							=	GIL_WARAN;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_WARAN);
	level							=	9;
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	65;
	attribute	[ATR_DEXTERITY]		=	40;
	
	attribute	[ATR_HITPOINTS_MAX]	=	110;
	attribute	[ATR_HITPOINTS]		=	110;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	// Changed and don't updated on list
	// May 25, 2011 
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	25;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	2;
//---------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------
	fight_tactic					=	FAI_WARAN;
//---------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1400);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1100);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 2);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//---------------------------------------------------
func void Set_Waran_Visuals()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Waran    															**
*************************************************************************/

INSTANCE Waran	(Mst_Default_Waran)
{
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  15);
	B_SetMonsterLevel();		

};


