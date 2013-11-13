/*************************************************************************
**	Molerat Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Molerat(C_Npc)			
{
	name							=	"Kretoszczur";
	guild							=	GIL_MOLERAT;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MOLERAT);
	level							=	5;

//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	45;
	attribute	[ATR_HITPOINTS]		=	45;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	7;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1;
	protection	[PROT_MAGIC]		=	1;
//------------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//------------------------------------------------------------
	fight_tactic					= FAI_MOLERAT;
//------------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
//------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_RoamStart,		 OnlyRoutine);
};
//------------------------------------------------------------
func void Set_Molerat_Visuals()
{
	Mdl_SetVisual			(self,"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Molerat    															**
*************************************************************************/

INSTANCE Molerat	(Mst_Default_Molerat)
{
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	B_SetMonsterLevel();	
};



/*************************************************************************
**	junge Molerat   (für Spielstart) 									**
*************************************************************************/

INSTANCE YMolerat	(Mst_Default_Molerat)
{
	name							=	"M³ody kretoszczur";
	level							=	4;

//------------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	7;
	attribute	[ATR_DEXTERITY]		=	8;
	
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	7;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	1;
	protection	[PROT_MAGIC]		=	1;
//------------------------------------------------------------

	fight_tactic					= FAI_MONSTER_COWARD;

	Set_Molerat_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);
	B_SetMonsterLevel();	
};


/*************************************************************************
**	Missions    															**
*************************************************************************/

INSTANCE Snf_Molerat1	(Mst_Default_Molerat)
{

	name							=	"Kretoszczur Snafa";
	protection	[PROT_BLUNT]		=	30;
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	guild							=	GIL_MEATBUG;
	CreateInvItems (self, ItFoMuttonRaw, 2);
	B_SetMonsterLevel();	   
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);	
	flags = NPC_FLAG_FRIEND;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SNAF_MOLERAT);
	
};


INSTANCE Snf_Molerat2	(Mst_Default_Molerat)
{

	name							=	"Kretoszczur Snafa";
	protection	[PROT_BLUNT]		=	30;

	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	guild							=	GIL_MEATBUG;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	B_SetMonsterLevel();
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);	
	flags = NPC_FLAG_FRIEND;		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SNAF_MOLERAT);
};


INSTANCE Snf_Molerat3	(Mst_Default_Molerat)
{

	name							=	"Kretoszczur Snafa";
	protection	[PROT_BLUNT]		=	30;

	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	guild							=	GIL_MEATBUG;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);		
	flags = NPC_FLAG_FRIEND;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SNAF_MOLERAT);
};


INSTANCE Snf_Molerat4	(Mst_Default_Molerat)
{

	name							=	"Kretoszczur Snafa";
	protection	[PROT_BLUNT]		=	30;

	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	guild							=	GIL_MEATBUG;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);		
	flags = NPC_FLAG_FRIEND;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SNAF_MOLERAT);	
};

INSTANCE Fat_Snf_Molerat1	(Mst_Default_Molerat)
{
	name							=	"Spasiony kretoszczur Snafa";
   Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SNAF_MOLERAT);
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	protection	[PROT_BLUNT]		=	50;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();	
   Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
   Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
   Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
   Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
   Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
   Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
   Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
   Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
   Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
   Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);	
};

INSTANCE Fat_Snf_Molerat2	(Mst_Default_Molerat)
{
	name							=	"Spasiony kretoszczur Snafa";
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_SNAF_MOLERAT);
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	protection	[PROT_BLUNT]		=	50;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();
	
	level							=	8;

	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);		
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);	
};

INSTANCE Fat_Snf_Molerat3	(Mst_Default_Molerat)
{
	name							=	"Spasiony kretoszczur Snafa";
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_SNAF_MOLERAT);
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	protection	[PROT_BLUNT]		=	50;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();	
	level							=	8;

	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);	
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);			
};

INSTANCE Fat_Snf_Molerat4	(Mst_Default_Molerat)
{
	name							=	"Spasiony kretoszczur Snafa";
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_SNAF_MOLERAT);
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	protection	[PROT_BLUNT]		=	50;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();	
	level							=	8;

	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);				
};



INSTANCE Fat_Snf_Molerat5	(Mst_Default_Molerat)
{
	name							=	"Spasiony kretoszczur Snafa";
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_SNAF_MOLERAT);
	Set_Molerat_Visuals();
	Npc_SetToFistMode(self);
	protection	[PROT_BLUNT]		=	50;
	
	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();	
	level							=	8;

	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);	
 Npc_SetAivar(self,AIV_MM_SleepStart ,	18);	
 Npc_SetAivar(self,AIV_MM_SleepEnd 	,	10);
 Npc_SetAivar(self,AIV_MM_RestStart 	,	15);
 Npc_SetAivar(self,AIV_MM_RestEnd 	,	17);	
 Npc_SetAivar(self,AIV_MM_RoamStart 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_RoamEnd 	,	3);//noroam!
 Npc_SetAivar(self,AIV_MM_EatGroundStart,10);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd ,15);	
 Npc_SetAivar(self,AIV_MM_WuselStart ,17);	
 Npc_SetAivar(self,AIV_MM_WuselEnd 	,18);			
};
