/*************************************************************************
**	Waran Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Aligator(C_Npc)			
{
	name							=	"Aligator";
	guild							=	GIL_WARAN;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_ALIGATOR);
	level							=	12;
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	140;
	attribute	[ATR_HITPOINTS]		=	140;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	55;
	protection	[PROT_EDGE]			=	55;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	5;
//---------------------------------------------------
	damagetype 						=	DAM_EDGE;
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

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1700);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1400);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1100);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 21);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);
	
//---------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RoamStart, 	 OnlyRoutine);
};
//---------------------------------------------------
func void Set_Alligator_Visuals()
{
	Mdl_SetVisual			(self,	"Alligator.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"KRO_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Waran    															**
*************************************************************************/

INSTANCE Aligator	(Mst_Default_Aligator)
{
	Set_Alligator_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  3);		
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  25);
	B_SetMonsterLevel();

};
INSTANCE Young_Aligator	(Mst_Default_Aligator)
{
	name							= "M³ody aligator"; 
	level							=	6;
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	25;
	
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	27;
	protection	[PROT_FIRE]			=	27;
	protection	[PROT_FLY]			=	8;
	protection	[PROT_MAGIC]		=	0;
	Set_Alligator_Visuals();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 0.6, 0.7, 0.6);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  20);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_YOUNGALIGATOR);
	B_SetMonsterLevel();
};
/*************************************************************************
**	Boss JAck Alligator mission    															**
*************************************************************************/

INSTANCE Aligator_Boss	(Mst_Default_Aligator)
{
	name						=	"Matka aligatorów";
	level						=	22;
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_ALIGATORBOSS);
//---------------------------------------------------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	440;
	attribute	[ATR_HITPOINTS]		=	440;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	95;
	protection	[PROT_POINT]		=	80;
	protection	[PROT_FIRE]			=	65;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	15;
//---------------------------------------------------
	Set_Alligator_Visuals();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self, 1.4, 1.4, 1.4);	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
	B_SetMonsterLevel();

//************Items
   CreateInvItem (self, ItAt_BossAlgSkin);
   CreateInvItem (self, ItAt_BossAlgClaws);
//CreateInvItem (self, ItAt_BossAlgTeeth);
 
};

