/*************************************************************************
**	Shadowbeast Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Tiger(C_Npc)			
{
	name							=	"Tygrys";
	guild							=	GIL_SHADOWBEAST;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_TIGER);
	level							=	30;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	140;
	attribute	[ATR_DEXTERITY]		=	140;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	50;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_SHADOWBEAST;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;
	spawnPoint					= self.wp;
	spawnDelay					= 	10000;
 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------
func void Set_Tiger_Visuals()
{
	Mdl_SetVisual			(self,"STONEPUMA.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"STONEPUMA_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

func void Set_WTiger_Visuals()
{
	Mdl_SetVisual			(self,"STONEPUMA.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"STONEPUMA_BODY",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};
/*************************************************************************
**	Shadowbeast    														**
*************************************************************************/

INSTANCE Tiger	(Mst_Default_Tiger)
{
	Set_Tiger_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  5);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  75);
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_TIGER);
	B_SetMonsterLevel();	
	Mdl_SetModelScale(self, 0.8, 0.7, 0.8);	
		
};

INSTANCE WhiteTiger	(Mst_Default_Tiger)
{
	name							=	"Bia³y tygrys";
	guild							=	GIL_SHADOWBEAST;
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SHADOWBEAST);
	level							=	40;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	190;
	attribute	[ATR_DEXTERITY]		=	190;
	
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------	
	Set_WTiger_Visuals();
	Npc_SetToFistMode(self);
	CreateInvItems (self,ItFoMuttonRaw,4);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  5);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  75);
	B_SetMonsterLevel();	
	Mdl_SetModelScale(self, 0.8, 0.7, 0.8);	
	
		
};