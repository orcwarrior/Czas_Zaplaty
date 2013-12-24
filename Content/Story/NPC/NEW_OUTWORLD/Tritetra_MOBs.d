/*************************************************************************
**	Skeleton   Mage 	Beliar		**
*************************************************************************/

instance SkeletonMage_Beliar (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Koœciec";
	npctype		= NPCTYPE_MAIN;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONMAGE);
	Set_SkeletonMage_Visuals();
	id						= 2001;
	guild					=	GIL_DEMON;	// "fliegende" Gilde nötig,damit es nicht Watet/Schwimmt/... !
	level					=	50;

	attribute	[ATR_HITPOINTS_MAX]	=	220;
	attribute	[ATR_HITPOINTS]		=	220;
		
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	80;
	protection	[PROT_POINT]		=	50;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;		

	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;
	fight_tactic =			FAI_HUMAN_MAGE;

	CreateInvItem			(self,ItArRuneWindFist);
	CreateInvItems (self,ItAt_Kosc,1);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	daily_routine 	= Rtn_Start_2001;

};

FUNC VOID Rtn_Start_2001 ()
{
	TA_MM_MonsterTalk		(07,00,12,00,"OW_COAST_SHIPWRECK_WARAN_2");	
	TA_MM_MonsterTalk		(12,00,07,00,"OW_COAST_SHIPWRECK_WARAN_2");
};

FUNC VOID Rtn_Graveyard_2001 ()
{
	TA_MM_MonsterTalk		(07,00,12,00,"OW_PATH_198_ORCGRAVEYARD5_MOVEMENT2");
	TA_MM_MonsterTalk		(12,00,07,00,"OW_PATH_198_ORCGRAVEYARD5_MOVEMENT2");
};
FUNC VOID Rtn_GraveyardAttack_2001 ()
{
	TA_Stay		(07,00,12,00,"OW_PATH_198_ORCGRAVEYARD5_MOVEMENT2");
	TA_Stay	(12,00,07,00,"OW_PATH_198_ORCGRAVEYARD5_MOVEMENT2");
};
/*************************************************************************
**	Green Gobbo Garbus													**
*************************************************************************/

instance GreenGobboGarbus (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Garbus";
	npctype		= NPCTYPE_MAIN;
	guild 		=	GIL_GOBBO;
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_GOBBOSWORD);
	level 		=  	50;
	voice 		=  	11;
	id 			=   2002;

//----------------------------------------------------------	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	70;
	
	attribute	[ATR_HITPOINTS_MAX]	=	220;
	attribute	[ATR_HITPOINTS]		=	220;

	attribute	[ATR_MANA_MAX] 		=	300;
	attribute	[ATR_MANA] 			=	300;

	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	20; //SN:besonders resistent gegen Pfeile
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	25;		
//----------------------------------------------------------
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;
//----------------------------------------------------------
	fight_tactic					=	FAI_MONSTER_COWARD;
//----------------------------------------------------------
	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 3000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 PACKHUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 2000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1500);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 1500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 5);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);		

	//-------- visuals --------
	Mdl_SetVisual			(self,"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,"Gob_Body",0,DEFAULT,"",DEFAULT,DEFAULT,-1);

	senses						= SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range				= 4000;

 Npc_SetAivar(self,AIV_MM_Behaviour,		 HUNTER);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 4000);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 4000);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 3500);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 0);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
	//-------- inventory -------

	Npc_SetToFightMode (self,ItMw_1h_Club_01); //+5
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 25;// da technisch im Faustkampf
	CreateInvItems (self,ItAt_GobKosc,1);
	B_CreateGobboInv();
 	Mdl_SetModelScale(self,1.2,1.2,1.2);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
	
	/********************************
	Ork nie dawa³em rutyn,daj mi jakiegoœ ZS - znaczy zrób jakiegoœ ;P
	********************************/
	B_SetPerception (self);    	

	daily_routine 	= Rtn_Start_2002;
};
FUNC VOID Rtn_Start_2002 ()
{
	TA_StayNeutral	(07,00,12,00,"OW_PATH_1_16_1");
	TA_StayNeutral		(12,00,07,00,"OW_PATH_1_16_1");
};

//******************** Ognik

INSTANCE Wisp_Adan (Mst_Default_Wisp)
{
	name					=	"Iskra";
	guild					=	GIL_BLOODFLY;
	level					=	40;
	npctype		= NPCTYPE_MAIN;
	id 			=   2003;
   
	B_SetPerception (self);    	
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	30;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	30;
	damagetype 						=	DAM_FLY;	
	Mdl_ApplyOverlayMds(self,"IRRLICHT_2.MDS");

	B_SetVisuals_Wisp();
	Npc_SetToFistMode(self);
	daily_routine 	= Rtn_Start_2003;
};
FUNC VOID Rtn_Start_2003 ()
{
	TA_MM_MonsterTalk		(07,00,12,00,"PATH_TO_PLATEAU04_BRIDGE2");
	TA_MM_MonsterTalk		(12,00,07,00,"PATH_TO_PLATEAU04_BRIDGE2");
};
FUNC VOID Rtn_Mine_2003 ()
{
	TA_MM_MonsterTalk		(07,00,12,00,"OW_PATH_2_08");
	TA_MM_MonsterTalk		(12,00,07,00,"OW_PATH_2_08");
};

FUNC VOID Rtn_Cave_2003 ()
{
	TA_MM_MonsterTalk		(07,00,12,00,"MOVEMENT_MOLERAT_06_CAVE_GUARD3");
	TA_MM_MonsterTalk		(12,00,07,00,"MOVEMENT_MOLERAT_06_CAVE_GUARD3");
};
