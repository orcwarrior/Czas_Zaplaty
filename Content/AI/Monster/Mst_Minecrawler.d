/*************************************************************************
**	Minecrawler Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Minecrawler(C_Npc)			
{
	name							=	"Pe³zacz";
	guild							=	GIL_MINECRAWLER;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_MINECRAWLER);
	level							=	16;
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	125;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	220;
	attribute	[ATR_HITPOINTS]		=	220;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	80;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	15;
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
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PACKHUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1000);
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
func void Set_Minecrawler_Visuals()
{
	Mdl_SetVisual			(self,	"Crawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Crw_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_Spider_Visuals()
{
	Mdl_SetVisual			(self,	"SPIDER.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SPIDER_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Minecrawler    														**
*************************************************************************/

INSTANCE Minecrawler	(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  25);
	B_SetMonsterLevel();	
};

INSTANCE Spider	(Mst_Default_Minecrawler)
{
	Set_Spider_Visuals();
	Npc_SetToFistMode(self);
	 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  25);
	name							=	"Pajêczak";
	B_SetMonsterLevel();	
};

INSTANCE Spider_Sword	(Mst_Default_Minecrawler)
{
	Set_Spider_Visuals();
	Npc_SetToFistMode(self);
	 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  30);
	name							=	"Miecznik";
	B_SetMonsterLevel();	
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
};

INSTANCE SpiderQueen	(Mst_Default_Minecrawler)
{
	Set_Spider_Visuals();
	Npc_SetToFistMode(self);
	level							=	40;
//------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1120;
	attribute	[ATR_HITPOINTS]		=	1120;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	55;
	protection	[PROT_FIRE]			=	55;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	35;
	name							=	"Pajêczyca";
	B_SetMonsterLevel();	
	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);
	
	//CreateInvItems(self,ItFo_Strange_Potion,1);	
};