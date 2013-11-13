/*************************************************************************
**	Scavenger Prototype													**
*************************************************************************/

PROTOTYPE Mst_Default_Scavenger(C_Npc)			
{
	name							=	"Œcierwojad";
	guild							=	GIL_SCAVENGER;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_SCAVENGER);
	level							=	5;
//---------------------------------------------------------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
//---------------------------------------------------------
	protection	[PROT_BLUNT]		=	26;
	protection	[PROT_EDGE]			=	26;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	26;
	protection	[PROT_FLY]			=	26;
	protection	[PROT_MAGIC]		=	0;
//---------------------------------------------------------
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	//STR wird genommen, wenn Summe aller dam = 0
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
	fight_tactic						=	FAI_SCAVENGER;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;		// 30m

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1200);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 700);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
//---------------------------------------------------------	
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
 Npc_SetAivar(self,AIV_MM_SleepStart, 	 22);	
 Npc_SetAivar(self,AIV_MM_SleepEnd,		 6);
 Npc_SetAivar(self,AIV_MM_EatGroundStart, 6);
 Npc_SetAivar(self,AIV_MM_EatGroundEnd,	 22);
};
//---------------------------------------------------------	
func void Set_Scavenger_Visuals()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


/*************************************************************************
**	Scavenger    														**
*************************************************************************/

// in den Instanz-Scripten bitte NUR die Werte eintragen, die vom Prototyp abweichen sollen!

INSTANCE Scavenger	(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	if(Hlp_Random(2))
	{
		CreateInvItems (self, ItFoScavengerEgg, 1+Hlp_Random(2));	
	};
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);	
	B_SetMonsterLevel();	
	
};


/*************************************************************************
**	junger Scavenger (für Spielstart)  									**
*************************************************************************/

INSTANCE YScavenger	(Mst_Default_Scavenger)
{
	name							=	"M³ody œcierwojad";
	level							=	5;

	attribute	[ATR_STRENGTH]		=	7;
	attribute	[ATR_DEXTERITY]		=	7;

	attribute	[ATR_HITPOINTS_MAX]	=	25;
	attribute	[ATR_HITPOINTS]		=	25;




	fight_tactic					=	FAI_MONSTER_COWARD;

	Set_Scavenger_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  2);	
	B_SetMonsterLevel();	
};




//MISSIONS


instance RickOnSentry_FirstWave_Scavenger_1(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	CreateInvItems (self, ItFoScavengerEgg, 1);	
	
};
instance RickOnSentry_FirstWave_Scavenger_2(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	
};
instance RickOnSentry_FirstWave_Scavenger_3(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	
};