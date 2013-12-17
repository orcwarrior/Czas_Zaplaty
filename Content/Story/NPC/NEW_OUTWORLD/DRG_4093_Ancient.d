
/********************

Ork to ma byæ jakiœ bydlacki smok,szef wszystkich smoków xD
**********************/

instance DRG_4093_Ancient (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Pradawny";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	9999;
	voice 		=	11;
	id 			=	4093;

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

	//-------- visuals --------
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_Fire_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	
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
	
	Mdl_SetModelScale(self,1.2,1.2,1.2);

	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;

//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	149;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4093;
};

FUNC VOID Rtn_Start_4093 ()
{
	TA_Stay		    (07,00,20,00,"PSI_TELEPORT");
	TA_Stay		    (20,00,07,00,"PSI_TELEPORT");
};

FUNC VOID Rtn_GO_4093 ()
{
	TA_Stay		    (07,00,20,00,"WP_INTRO_WI05");
	TA_Stay		    (20,00,07,00,"WP_INTRO_WI05");
};