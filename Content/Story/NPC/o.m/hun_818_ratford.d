instance HUN_818_Ratford (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Ratford";
	Npctype =				Npctype_Main;	
	guild =					GIL_HUN;      
	level =					18;
	
	voice =					7;
	id =					818;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		125;
	attribute[ATR_DEXTERITY] =		95;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12+90;
	attribute[ATR_HITPOINTS] =		self.level*12+90;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,HUN_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------   
	EquipItem	(self,MTR_MW_02);
	//EquipItem	(self,HUN_MW_05);	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,17);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItem	(self,ItKeCavalorn01);	
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,3);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	CreateInvItems (self,ItAmBolt,10);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_818;
};

Func Void Rtn_rytualguide_818 ()
{
	TA_GuidePC(08,00,07,59,"LOCATION_23_01"); 	 
};
Func Void Rtn_rytual_818 ()
{
	
	TA_Sleep			(05,00,10,00,"RATFORD_SLEEP");
   TA_SitAround 		(10,00,13,00,"RATFORD_HOUSE_PATH");
   TA_SitAround 		(13,00,17,00,"OW_SAWHUT_SLEEP_01");
	TA_Smalltalk		(17,00,18,00,"HC_SHOP_BUY");
   TA_Stand			(18,00,20,00,"RATFORD_OR_1");
	TA_SitAround		(20,00,23,10,"SIT_TABLE");
	TA_Ratford_RytualKatrakanat(23,10,04,59,"OW_PATH_02"); 	 
};
Func Void Rtn_rytualAfter_818 ()
{
	TA_Stay(23,10,23,09,"OW_PATH_02"); 	 
};
Func Void Rtn_rytualgotopc_818 ()
{
	TA_Ratford_Kat_GotoPC(08,00,07,59,"OW_PATH_02"); 	 
};
FUNC VOID Rtn_Start_818 ()
{
	TA_Sleep			(06,00,10,00,"RATFORD_SLEEP");
   TA_SitAround 		(10,00,13,00,"RATFORD_HOUSE_PATH");
   TA_SitAround 		(13,00,17,00,"OW_SAWHUT_SLEEP_01");
	TA_Smalltalk		(17,00,18,00,"HC_SHOP_BUY");
   TA_Stand			(18,00,20,00,"RATFORD_OR_1");
	TA_SitAround		(20,00,02,50,"SIT_TABLE");
	TA_PracticeSword	(02,50,06,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
};
FUNC VOID Rtn_PREATTACK_818 ()
{
	TA_PracticeSword	(02,50,02,49,"OW_SAWHUT_MOLERAT_MOVEMENT4");
};

Func Void Rtn_AfterFight_818 ()
{
	TA_Boss(08,00,07,59,"OW_PATH_OC_NC4"); 
};

Func Void Rtn_Alarm_818 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_RANGED4"); 
};
Func Void Rtn_Alarm2_818 ()
{
	TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
};
FUNC VOID Rtn_Challenge_818 ()
{	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_818 ()
{
   TA_ChallengeFans(08,00,07,59,"OM_FAN_4"); 
};

FUNC VOID Rtn_TEST_818 ()
{
	TA_Stay			(06,00,08,00,"SPAWN_OW_SCAVENGER_06_04");	
	TA_Stay			(08,00,06,00,"SPAWN_OW_SCAVENGER_06_04");	
};

func void Rtn_Meeting_818()
{
   TA_Stand(00,00,12,00,"OW_SAWHUT_SLEEP_01");
	TA_Stand(12,00,00,00,"OW_SAWHUT_SLEEP_01");
};

FUNC VOID Rtn_Follow_818 () 
{ 
   Ta_FollowPC (0,00,12,00,hero.wp); 
   Ta_FollowPC (12,00,0,00,hero.wp); 
};

FUNC VOID Rtn_DEFEND_818 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_LADDER_TOP"); 
   Ta_Guard (12,00,0,00,"OCC_LADDER_TOP"); 
};

