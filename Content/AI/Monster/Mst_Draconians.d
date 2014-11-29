/*************************************************************************
**	Orc WARRIOR Prototype												**
*************************************************************************/

PROTOTYPE Mst_Default_Draconian(C_Npc)			
{
	name							=	"Jaszczurocz³ek myœliwy";
	guild							=	GIL_WARAN;//Attacks orcs, meet em on red swamp(+undeads)

	
	npctype							=	NPCTYPE_GUARD;
	level							=	50;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	240;
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	70;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	50;
//----------------------------------------------------------	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//---------------------------------------------------------
//---------------------------------------------------------
	fight_tactic					=	FAI_HUMAN_STRONG;
//---------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 2000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PACKHUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1200);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1000);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 13);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  TRUE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);	
//-------------------------------------------------------------
	start_aistate				= ZS_MM_AllScheduler;
};
//-------------------------------------------------------------
func void Set_Draconian0_Visuals()
{
	Mdl_SetVisual			(self,	"Draconian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"DRACONIAN_BODY", 0,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
};
func void Set_Draconian1_Visuals()
{
	Mdl_SetVisual			(self,	"Draconian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"DRACONIAN_SCOUT_BODY", 1,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
};
func void Set_Draconian2_Visuals()
{
	Mdl_SetVisual			(self,	"Draconian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"DRACONIAN_OFFICER_BODY", 2,	DEFAULT,	"",	DEFAULT,  	DEFAULT,	-1);
};

/*************************************************************************
**	Draconian Scout - nice dmg, but low edurance						**
*************************************************************************/
INSTANCE DraconianScout	(Mst_Default_Draconian)
{
	//-------- visual --------
	Set_Draconian1_Visuals();

   Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSCOUT);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  8);	
	B_SetMonsterLevel();	
	EquipItem (self, ItMw_Draco_01);
};

INSTANCE DraconianScoutFriendly(Mst_Default_Draconian)
{
	//-------- visual --------
	Set_Draconian1_Visuals();
	guild = GIL_NONE;

   Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSCOUT);
	B_SetMonsterLevel();	
	EquipItem (self, ItMw_Draco_01);
};

/*************************************************************************
**	Draconian Solidier - avg dmg & edurance 														**
*************************************************************************/
INSTANCE DraconianSoldier	(Mst_Default_Draconian)
{
	Set_Draconian0_Visuals();	
	//-------- general --------
	name = "Jaszczurocz³ek ¿o³nierz";
	//-------- visual --------
	
	Set_Draconian0_Visuals();	
	
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	270;//+154
	attribute	[ATR_DEXTERITY]		=	90;
	
	attribute	[ATR_HITPOINTS_MAX]	=	580;
	attribute	[ATR_HITPOINTS]		=	580;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	60;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_02);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  10);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);
    Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSOLDIER);		
	
	B_SetMonsterLevel();	
};

INSTANCE DraconianSoldierFriendly(Mst_Default_Draconian)
{
	Set_Draconian0_Visuals();	
	//-------- general --------
	name = "Jaszczurocz³ek ¿o³nierz";
	guild = GIL_NONE;
	
	//-------- visual --------
	Set_Draconian0_Visuals();	
	
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	270;//+154
	attribute	[ATR_DEXTERITY]		=	90;
	
	attribute	[ATR_HITPOINTS_MAX]	=	580;
	attribute	[ATR_HITPOINTS]		=	580;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	60;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_02);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);
   Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSOLDIER);		
	
	B_SetMonsterLevel();	
};

/*************************************************************************
**	Draconian Officer - good dmg & edurance
														**
*************************************************************************/
INSTANCE DraconianOfficer	(Mst_Default_Draconian)
{
	//-------- general --------
	name							=	"Jaszczurocz³ek-oficer";
	level							=	75;
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	Set_Draconian2_Visuals();	
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	350;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	110;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	90;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_03);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  13);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
    Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANOFFICER);
	
	B_SetMonsterLevel();	
};

INSTANCE DraconianOfficerFriendly(Mst_Default_Draconian)
{
	//-------- general --------
	name							=	"Oficer jaszczurocz³eków";
	level							=	75;
	guild = GIL_NONE;
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	Set_Draconian2_Visuals();	
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	350;
	attribute	[ATR_DEXTERITY]		=	150;
	
	attribute	[ATR_HITPOINTS_MAX]	=	700;
	attribute	[ATR_HITPOINTS]		=	700;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	120;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	110;
	protection	[PROT_FIRE]			=	120;
	protection	[PROT_FLY]			=	150;
	protection	[PROT_MAGIC]		=	90;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_03);
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
   Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANOFFICER);
	
	B_SetMonsterLevel();	
};

//********************

INSTANCE Draco1	(Mst_Default_Draconian)
{
	Set_Draconian0_Visuals();	
	//-------- general --------
	name							=	"Jaszczurocz³ek ¿o³nierz";
	//-------- visual --------
	Set_Draconian0_Visuals();	
	
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	270;//+154
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	580;
	attribute	[ATR_HITPOINTS]		=	580;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	60;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_02);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
    Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSCOUT);	
	
	B_SetMonsterLevel();	
};

INSTANCE Draco2	(Mst_Default_Draconian)
{
	Set_Draconian0_Visuals();	
	//-------- general --------
	name							=	"Jaszczurocz³ek ¿o³nierz";

	//-------- visual --------
	
	Set_Draconian0_Visuals();	
	
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	270;//+154
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	580;
	attribute	[ATR_HITPOINTS]		=	580;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	60;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_02);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
    Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSCOUT);	
	
	B_SetMonsterLevel();	
};

INSTANCE Draco3(Mst_Default_Draconian)
{
	Set_Draconian0_Visuals();	
	//-------- general --------
	name							=	"Jaszczurocz³ek ¿o³nierz";
	//-------- visual --------
	Set_Draconian0_Visuals();	
	
	level							=	60;
//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	270;//+154
	attribute	[ATR_DEXTERITY]		=	80;
	
	attribute	[ATR_HITPOINTS_MAX]	=	580;
	attribute	[ATR_HITPOINTS]		=	580;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	95;
	protection	[PROT_EDGE]			=	110;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	60;
//----------------------------------------------------------	

	//-------- inventory --------
	EquipItem (self, ItMw_Draco_02);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		
    Npc_SetAivar(self, AIV_MM_REAL_ID, ID_DRACONIANSCOUT);
	
	B_SetMonsterLevel();	
};
