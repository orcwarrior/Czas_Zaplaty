/*************************************************************************
**	Razor Prototype		(new anims RAZOR.MDS [NotR])								**
*************************************************************************/

PROTOTYPE Mst_Default_Razor(C_Npc)			
{
	name							=	"Brzytwa";
	guild							=	GIL_SNAPPER;
	level							=	25;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	190;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	410;
	attribute	[ATR_HITPOINTS]		=	410;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	110;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	15;
//--------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//--------------------------------------------------------------
	fight_tactic					=	FAI_SNAPPER;
//--------------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1400);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_Razor_Visuals()
{
	Mdl_SetVisual			(self,	"Razor.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Raz_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
func void Set_RazorNK_Visuals()
{
	Mdl_SetVisual			(self,	"Razor.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RazNK_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Razor    															**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE Razor (Mst_Default_Razor)
{
	Set_Razor_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  45);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_RAZOR);
};
INSTANCE RazorNK (Mst_Default_Razor)
{
	Set_RazorNK_Visuals();
	Npc_SetToFistMode(self);
	name							=	"Brzytwiak";
	level							=	22;
//--------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	155;
	attribute	[ATR_DEXTERITY]		=	110;
	
	attribute	[ATR_HITPOINTS_MAX]	=	170;
	attribute	[ATR_HITPOINTS]		=	170;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//--------------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	35;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	15;
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  5);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_RAZORNK);
};