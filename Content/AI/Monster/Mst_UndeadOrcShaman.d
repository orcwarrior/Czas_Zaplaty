/*************************************************************************
**	Undead Orc Shaman Prototype											**
*************************************************************************/

PROTOTYPE Mst_Default_UndeadOrcShaman (C_Npc)			
{
	name							=	"Arcykap³an";
	guild							=	GIL_UNDEADORC;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_UNDEADORCSHAMAN);
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;

	attribute	[ATR_MANA_MAX] 		=	75;
	attribute	[ATR_MANA] 			=	75;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	65;	
	protection	[PROT_FIRE]			=	90;	
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	50;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_MAGE;
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
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_UndeadOrcShaman_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOS_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Undead Orc Shaman 		 											**
*************************************************************************/

INSTANCE UndeadOrcShaman	(Mst_Default_UndeadOrcShaman)
{
	Set_UndeadOrcShaman_Visuals();
	EquipItem		(self,	ItRwUdOrcstaff);		// für Magiemodus
	CreateInvItem	(self,	ItArRuneBreathOfDeath);
	CreateInvItem	(self,	ItArRuneIceWave);
	CreateInvItems	(self,	ItArScrollSummonGolem,	2);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  50);
	B_SetMonsterLevel();	

};
INSTANCE Cave_UndeadOrcShaman	(Mst_Default_UndeadOrcShaman)
{
	Set_UndeadOrcShaman_Visuals();
	protection	[PROT_BLUNT]		=	110;	
	protection	[PROT_EDGE]			=	110;	
	protection	[PROT_POINT]		=	95;	
	protection	[PROT_FIRE]			=	150;	
	protection	[PROT_FLY]			=	80;	
	protection	[PROT_MAGIC]		=	100;	
	EquipItem		(self,	ItRwUdOrcstaff);		// für Magiemodus
	CreateInvItems	(self,	ItArScrollFireBall, 3);
	CreateInvItems	(self,	ItArScrollSummonDemon,	1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  50);
	attribute	[ATR_HITPOINTS]		=	350;	
	attribute	[ATR_HITPOINTS_MAX]		=	350;	
	name							=	"Nieumar³y kap³an";	
	level							=	60;	

};

