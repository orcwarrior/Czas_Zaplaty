//****************************
//	Prototyp SMoka		
//****************************

PROTOTYPE Mst_Default_Dragon_Fire(C_Npc)			
{
	name							= "Smok";
	guild							=	GIL_WARAN;//Attacks orcs, meet em on red swamp(+undeads)
	Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_DRACONIAN);
	level							= 500;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	520;
	attribute	[ATR_DEXTERITY]		=	520;
	attribute	[ATR_HITPOINTS_MAX]	=	1200;
	attribute	[ATR_HITPOINTS]		=	1200;
	attribute	[ATR_MANA_MAX] 		=	1200;
	attribute	[ATR_MANA] 			=	1200;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	160;
	protection	[PROT_EDGE]			=	160;
	protection	[PROT_POINT]		=	160;	
	protection	[PROT_FIRE]			=	160;
	protection	[PROT_FLY]			=	160;	
	protection	[PROT_MAGIC]		=	160;
	
	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;

//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	149;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_MONSTER_COWARD;
	
	//----- Sense & Ranges ----	
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;
   
   Npc_SetAivar(self, AIV_MM_Behaviour,	PASSIVE);
	
   Npc_SetAivar(self,AIV_MM_PercRange, 1400);
   Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
   Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
   Npc_SetAivar(self,AIV_MM_DrohTime,		 4);
   Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
   Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
   Npc_SetAivar(self, AIV_MM_RoamStart, OnlyRoutine);	
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
};


//******************
//	Visuals
//******************

func void Set_Dragon_Fire_Visuals()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Fire_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	//CreateInvItem (self, DragonBlood);
	//CreateInvItem (self, DragonScale);
	//CreateInvItem (self, DragonHeart);
};

//*****************
//	Firedragon
//*****************

INSTANCE Dragon_Fire	(Mst_Default_Dragon_Fire)
{
	Set_Dragon_Fire_Visuals();
	Npc_SetToFistMode(self);
};

INSTANCE YDragon	(Mst_Default_Dragon_Fire)
{
   name							= "Ma³y smok";
	guild							= GIL_MEATBUG;
   Npc_SetAivar(self,AIV_MM_REAL_ID, ID_DRACONIAN);
	level							= 1;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;	
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;	
	protection	[PROT_MAGIC]		=	20;

//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	20;
//	damage		[DAM_INDEX_FLY]		=	0; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	fight_tactic					=	FAI_MONSTER_COWARD;

	Set_Dragon_Fire_Visuals();
	Mdl_SetModelScale(self, 0.1, 0.1, 0.1);
	Npc_SetToFistMode(self);

	//CreateInvItem (self, DragonBlood);
};

INSTANCE BlackDragon	(Mst_Default_Dragon_Fire)
{

	name							= "Pradawny";
	guild							=	GIL_WARAN;//Attacks orcs, meet em on red swamp(+undeads)
	Npc_SetAivar(self,AIV_MM_REAL_ID, ID_DRACONIAN);
	level							= 1000;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	1200;
	attribute	[ATR_DEXTERITY]		=	1200;
	attribute	[ATR_HITPOINTS_MAX]	=	9000;
	attribute	[ATR_HITPOINTS]		=	9000;
	attribute	[ATR_MANA_MAX] 		=	9000;
	attribute	[ATR_MANA] 			=	9000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	250;
	protection	[PROT_EDGE]			=	250;
	protection	[PROT_POINT]		=	999;	
	protection	[PROT_FIRE]			=	999;
	protection	[PROT_FLY]			=	999;	
	protection	[PROT_MAGIC]		=	999;

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
};