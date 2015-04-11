/*************************************************************************
**	Snapper Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Snapper(C_Npc)			
{
	name							=	"Zêbacz";
	guild							=	GIL_SNAPPER;
	level							=	20;
//---------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	170;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	295;
	attribute	[ATR_HITPOINTS]		=	295;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	50;		
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	10;
//---------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------	
	fight_tactic					=	FAI_SNAPPER;
//---------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1800);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 3);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
 Npc_SetAivar(self,AIV_MM_RestStart,		 OnlyRoutine);
};
//---------------------------------------------------------	
func void Set_Snapper_Visuals()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Snapper    															**
*************************************************************************/

INSTANCE Snapper	(Mst_Default_Snapper)
{
	Set_Snapper_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  12);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_SNAPPER);
	B_SetMonsterLevel();
};