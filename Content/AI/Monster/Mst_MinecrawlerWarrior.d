/*************************************************************************
**	Minecrawler WARRIOR Prototype										**
*************************************************************************/

PROTOTYPE Mst_Default_MinecrawlerWarrior(C_Npc)			
{
	name							=	"Pe³zacz wojownik";
	guild							=	GIL_MINECRAWLER;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MINECRAWLERWARRIOR);
	level							=	22;
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	180;
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	30;
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------
	fight_tactic					=	FAI_MINECRAWLER;
//------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 2);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_WuselStart, 	 OnlyRoutine);
};
//---------------------------------------------------
func void Set_MinecrawlerWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Cr2_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	MinecrawlerWarrior    												**
*************************************************************************/

INSTANCE MinecrawlerWarrior	(Mst_Default_MinecrawlerWarrior)
{
	Set_MinecrawlerWarrior_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	B_SetMonsterLevel();	
};


/*************************************************************************
**	OTMinecrawler 														**
*************************************************************************/
instance OTMinecrawler(Mst_Default_MinecrawlerWarrior)			
{
	name							=	"Œwi¹tynny pe³zacz";
	level							=	25;

	Set_MinecrawlerWarrior_Visuals();
	Npc_SetToFistMode(self);
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	190;
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	30;
//------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  45);
	B_SetMonsterLevel();
};




