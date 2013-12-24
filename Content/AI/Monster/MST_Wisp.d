//********************
//	Wisp Prototype
//********************

PROTOTYPE Mst_Default_Wisp(C_Npc)
{
	//----- Monster -----
	name							=	"Dziki ognik";
	guild							=	GIL_BLOODFLY;
	level							=	7;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	80; 
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	60;
	
	//----- Damage Types ----	
	damagetype 						=	DAM_MAGIC;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	2000;

 Npc_SetAivar(self,AIV_MM_FollowTime,	 4);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};
//******************
//		Visuals
//******************

func void B_SetVisuals_Wisp()
{
	Mdl_SetVisual			(self,	"Irrlicht.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Irrlicht_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Irrlicht   
//*************

INSTANCE Wisp (Mst_Default_Wisp)
{
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_WISP);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  10);	
};
INSTANCE Wisp2 (Mst_Default_Wisp)
{
	damagetype 						=	DAM_FLY;	
	Mdl_ApplyOverlayMds(self,"IRRLICHT_3.MDS");	
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_WISP2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  10);	
};

INSTANCE WispPSI (Mst_Default_Wisp)
{
	damagetype 						=	DAM_FLY;	
	name							=	"Ognik degradacji";		
	B_SetVisuals_Wisp();
	Mdl_ApplyOverlayMds(self,"IRRLICHT_PSI.MDS");	
	
 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	level						= 10;
 Npc_SetAivar(self,AIV_MM_PercRange,		 2200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 2000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1300);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
	start_aistate				= ZS_MM_PSIWISP;	
	guild							=	GIL_DEMON;
	attribute	[ATR_HITPOINTS_MAX]	=	400; 
	attribute	[ATR_HITPOINTS]		=	400;	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
};
//*************
//	IrrlichtMIS
//*************
INSTANCE Wisp_Fire (Mst_Default_Wisp)
{
	name							=	"Ognisty ognik";	
 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	level						= 10;
 Npc_SetAivar(self,AIV_MM_PercRange,		 2200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 2000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1300);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
	start_aistate				= ZS_MM_FIREWISP;
	

 Npc_SetAivar(self,AIV_MM_FollowTime,	 999);			
	damagetype 						=	DAM_EDGE;	
	Mdl_ApplyOverlayMds(self,"IRRLICHT_FIRE.MDS");	
	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_REAL_ID, 	ID_FIREWISP);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  20);	
};

INSTANCE Wisp_Adanos (Mst_Default_Wisp)
{
	level				=	0;
	npctype		= NPCTYPE_MAIN;
	B_SetVisuals_Wisp();
	senses_range	=	3000;
	Party_AddNpc(self);
	Npc_SetAttitude	 	(self, ATT_FRIENDLY); 
	Npc_SetTempAttitude (self, ATT_FRIENDLY); 
	Npc_SetToFistMode(self);
	Mdl_ApplyOverlayMds(self,"IRRLICHT_2.MDS");
};

