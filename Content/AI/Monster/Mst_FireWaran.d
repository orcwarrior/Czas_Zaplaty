/*************************************************************************
**	Fire Waran Prototype  												**
*************************************************************************/

PROTOTYPE Mst_Default_FireWaran(C_Npc)			
{
	name							=	"Ognisty jaszczur";
	guild							=	GIL_WARAN;
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_FIREWARAN);
	level							=	25;
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	130;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	170;
	protection	[PROT_FIRE]			=	9999;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	20;
//---------------------------------------------------
	damagetype 						=	DAM_FIRE;
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
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//---------------------------------------------------
func void Set_FireWaran_Visuals()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	Mdl_ApplyOverlayMds 	(self,	"Firewaran.mds");

	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Fire_Body",DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Fire Waran    														**
*************************************************************************/

INSTANCE FireWaran	(Mst_Default_FireWaran)
{
	Set_FireWaran_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  13);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  85);
	B_SetMonsterLevel();
};