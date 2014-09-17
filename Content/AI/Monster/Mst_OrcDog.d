/*************************************************************************
**	OrcDog Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_OrcDog(C_Npc)			
{
	name							=	"Orkowy pies";
	guild							=	GIL_ORCDOG;
	Npc_SetAivar(self, AIV_MM_REAL_ID, ID_ORCDOG);
	level							=	20;		//SN 11.01.01.: geändert, da zu schwach
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	160;		//SN 11.01.01.: geändert, da zu schwach
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	305;	//SN 11.01.01.: geändert, da zu schwach
	attribute	[ATR_HITPOINTS]		=	305;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	65;
	protection	[PROT_EDGE]			=	65;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	10;
//---------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------
	fight_tactic					=	FAI_ORCDOG;
//---------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1800);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 15);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_OrcDog_Visuals()
{
	Mdl_SetVisual			(self,	"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dog_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	OrcDog    															**
*************************************************************************/

INSTANCE OrcDog	(Mst_Default_OrcDog)
{
	Set_OrcDog_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  5);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  20);
	B_SetMonsterLevel();	


};