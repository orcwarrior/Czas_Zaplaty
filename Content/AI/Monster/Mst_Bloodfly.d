/*************************************************************************
**	Bloodfly Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Bloodfly(C_Npc)			
{
	name							=	"Krwiopijca";
	guild							=	GIL_BLOODFLY;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_BLOODFLY);
	level							=	7;
//---------------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------------	
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------------	
	fight_tactic				= FAI_BLOODFLY;
//---------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 1500;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
 Npc_SetAivar(self,AIV_MM_WuselStart, 	 OnlyRoutine);	
};
//---------------------------------------------------------------
func void Set_Bloodfly_Visuals()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Bloodfly    														**
*************************************************************************/

INSTANCE Bloodfly	(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  12);
	B_SetMonsterLevel();
};


/*************************************************************************
**	Bloodfly für Mission: Mis_1_Psi_HelpBrothers						**
*************************************************************************/

INSTANCE HelpBrothers_Bloodfly (Mst_Default_Bloodfly)			
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItAt_Bloodfly_01, 2);	// 2 Flügel
		
	name							=	"Agresywny krwiopijca";
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  12);
	B_SetMonsterLevel();
};
