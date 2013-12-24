/*************************************************************************
**	Undead Orc Warrior Prototype										**
*************************************************************************/

PROTOTYPE Mst_Default_UndeadOrcWarrior (C_Npc)			
{
	name							=	"Opiekun œwi¹tyni";
	guild							=	GIL_UNDEADORC;
	level							=	50;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	150;//+150
	attribute	[ATR_DEXTERITY]		=	100;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	100; //9999;	//immun
	protection	[PROT_EDGE]			=	100; //9999;	//immun
	protection	[PROT_POINT]		=	65; //9999;	//immun
	protection	[PROT_FIRE]			=	90; //9999;	//immun
	protection	[PROT_FLY]			=	50; //9999;	//immun
	protection	[PROT_MAGIC]		=	100; //120;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic					=	FAI_ORC;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	

	//Npc_SetAivar(Npc_SetAivar,AIV_MM_RestStart, 	 OnlyRoutine);
};
//-------------------------------------------------------------

func void Set_UndeadOrcWarrior_Visuals()
{
	Mdl_SetVisual			(self,	"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"UOW_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Orc Warrior Undead    												**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE UndeadOrcWarrior (Mst_Default_UndeadOrcWarrior)
{
	Set_UndeadOrcWarrior_Visuals();
	EquipItem 				(self, ItMw2hOrcMace01);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  40);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_UNDEADORCWARRIOR);
	B_SetMonsterLevel();		
};


INSTANCE UndeadOWH (Mst_Default_UndeadOrcWarrior)
{
	name							=	"Starszy opiekun œwi¹tyni";
	level							=	70;

	attribute	[ATR_STRENGTH]		=	160; //+150
	
	attribute	[ATR_HITPOINTS_MAX]	=	650;
	attribute	[ATR_HITPOINTS]		=	650;	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	170; //9999;	//immun
	protection	[PROT_EDGE]			=	170; //9999;	//immun
	protection	[PROT_POINT]		=	85; //9999;	//immun
	protection	[PROT_FIRE]			=	100; //9999;	//immun
	protection	[PROT_FLY]			=	150; //9999;	//immun
	protection	[PROT_MAGIC]		=	60; //120;
	
	Set_UndeadOrcWarrior_Visuals();
	EquipItem 				(self, ItMw2hOrcMace01);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  70);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_UNDEADORCWARRIOR);
	B_SetMonsterLevel();		
};
INSTANCE Cave_UndeadOrcWarrior (Mst_Default_UndeadOrcWarrior)
{
	name							=	"Nieumar³y ork";
	level							=	40;

	attribute	[ATR_STRENGTH]		=	125;

//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	110;	
	protection	[PROT_EDGE]			=	110;	
	protection	[PROT_POINT]		=	95;	
	protection	[PROT_FIRE]			=	150;	
	protection	[PROT_FLY]			=	80;	
	protection	[PROT_MAGIC]		=	100;	
	attribute	[ATR_HITPOINTS]		=	190;	
	attribute	[ATR_HITPOINTS_MAX]		=	190;	
	Set_UndeadOrcWarrior_Visuals();
	EquipItem 				(self, ItMw2hOrcSword01);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  70);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_UNDEADORCWARRIOR);
	B_SetMonsterLevel();		
};