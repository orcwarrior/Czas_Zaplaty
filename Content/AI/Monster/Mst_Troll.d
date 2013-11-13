/*************************************************************************
**	Troll Prototype														**
*************************************************************************/

PROTOTYPE Mst_Default_Troll(C_Npc)			
{
	name							=	"Troll";
	guild							=	GIL_TROLL;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_TROLL);
	level							=	200;
//------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	2500;
	attribute	[ATR_HITPOINTS]		=	2500;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	110;	// immun
	protection	[PROT_MAGIC]		=	9999;
//------------------------------------------------------	
	damagetype 						=	DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------	
	fight_tactic					=	FAI_TROLL;
//------------------------------------------------------	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------

func void Set_Troll_Visuals()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Tro_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Troll    															**
*************************************************************************/
INSTANCE Troll	(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  6);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  350);
	B_SetMonsterLevel();	
};

/*************************************************************************
**	junger Troll    													**
*************************************************************************/

INSTANCE YoungTroll	(Mst_Default_Troll)
{
	//-------- general data --------
	name							=	"M³ody troll";
	guild							=	GIL_TROLL;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_TROLL);
	level							=	100;
	ID								=	MID_YOUNGTROLL;
	
	//-------- visuals --------
	Set_Troll_Visuals();
	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	1100;
	attribute	[ATR_HITPOINTS]		=	1100;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	120;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	90;	
	protection	[PROT_MAGIC]		=	9999;	// immun

	//-------- combat --------
	Npc_SetToFistMode(self);

	fight_tactic					=	FAI_TROLL;

	damagetype 						=	DAM_FLY;

	//-------- ai --------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	4000;

 Npc_SetAivar(self,AIV_MM_Behaviour,			 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,			 3000);
 Npc_SetAivar(self,AIV_MM_DrohRange,			 2500);
 Npc_SetAivar(self,AIV_MM_AttackRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohTime,			 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,		 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,		 FALSE);

	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  180);
	B_SetMonsterLevel();	
};




//MISSIONS



INSTANCE SurpriseTroll	(Mst_Default_Troll)
{
	Set_Troll_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MISTROLL1);
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;
};

INSTANCE MIS_PACHOTROLL	(Mst_Default_Troll)
{
	//-------- general data --------
	name							=	"M³ody troll";
	guild							=	GIL_TROLL;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_TROLL);
	level							=	100;
//	ID								=	MID_YOUNGTROLL;
	
	//-------- visuals --------
	Set_Troll_Visuals();
	Mdl_SetModelScale(self, 0.7, 0.7, 0.7);

	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	120;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	600;
	attribute	[ATR_HITPOINTS]		=	600;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	9999;	// immun
	protection	[PROT_FLY]			=	9999;	// immun
	protection	[PROT_MAGIC]		=	9999;	// immun

	//-------- combat --------
	Npc_SetToFistMode(self);

	fight_tactic					=	FAI_TROLL;

	damagetype 						=	DAM_FLY;

	//-------- ai --------
	senses							=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range					=	4000;

 Npc_SetAivar(self,AIV_MM_Behaviour,			 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,			 3000);
 Npc_SetAivar(self,AIV_MM_DrohRange,			 2500);
 Npc_SetAivar(self,AIV_MM_AttackRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohTime,			 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,		 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,		 FALSE);

	start_aistate				= ZS_MM_AllScheduler;

 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  180);
	B_SetMonsterLevel();	
};