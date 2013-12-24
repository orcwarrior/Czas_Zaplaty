/*************************************************************************
**	Orc SHAMAN Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcShaman(C_Npc)			
{
	name							=	"Ork-szaman";
	guild							=	GIL_ORCSHAMAN;
	
	npctype							=	NPCTYPE_GUARD;
	level							=	30;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	50;
	attribute	[ATR_MANA] 			=	50;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	120;
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
	fight_tactic 				=	FAI_HUMAN_MAGE;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
//-------------------------------------------------------------
	start_aistate				= ZS_Orc_Pray;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_OrcShaman_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	Mdl_ApplyOverlayMds 	(self,	"Orc_Shaman.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Orc_BodyShaman",DEFAULT,	DEFAULT,	"Orc_HeadShaman",	DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Orc Shaman    														**
*************************************************************************/

INSTANCE OrcShaman (Mst_Default_OrcShaman)
{
	Set_OrcShaman_Visuals();
	CreateInvItem			(self,	ItArRuneThunderBall);
	EquipItem				(self,	ItRwOrcstaff);		// für Magiemodus
	CreateInvItems 				(self, ItAt_OrcSha_Plume, 2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  9);	
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ORCSHAMAN);
	B_SetMonsterLevel();
};
