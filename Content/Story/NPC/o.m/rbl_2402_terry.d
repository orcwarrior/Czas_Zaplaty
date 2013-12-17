instance RBL_2402_Terry (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Terry";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		24;
	
	voice 		=		13;
	id 			=		2402;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	85;
	attribute[ATR_DEXTERITY] 		=	100;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	self.level*12+90;
	attribute[ATR_HITPOINTS] 		=	self.level*12+90;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",22,1,RBL_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
	
	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	EquipItem 		(self,HUN_RW_03);
	EquipItem (self,HUN_MW_02);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItems	(self,ItFo_Potion_Health_03,1);
	CreateInvItems	(self,ItFoRice,1);
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2402;
};

FUNC VOID Rtn_start_2402 ()
{
	TA_Sleep	(01,00,06,00,"DRAX_SLEEP1");	
	TA_Stand	(06,00,08,00,"DRAX_SHOP_PATCH");
    TA_Boss	(08,00,10,00,"OM_WATCHTOWER01_ON2_1");
    TA_Position	(10,00,13,10,"OM_WATCHTOWER01_ON2_1");
    TA_SmallTalk	(13,00,14,00,"DRAX_SHOP_PATCH");//DRAX//HANDLER
    TA_SitCampfireEat	(14,00,16,00,"OW_SAWHUT_GREENGOBBO_SPAWN");
    TA_Position	(16,00,19,30,"TERRY_STAND");
    TA_Stand	(19,30,23,40,"TERRY_STAND");       
    TA_Smoke	(23,40,01,00,"SMOKE_TERRY");
   

};

FUNC VOID Rtn_Guide_2402 ()
{
	TA_GuidePC (08,00,20,00,"PATH_OC_NC_3"); 
	TA_GuidePC (20,00,08,00,"PATH_OC_NC_3"); 
};

FUNC VOID Rtn_Guide1_2402 ()
{
	TA_GuidePC (08,00,13,50,"OW_PATH_1_5_13"); 
	TA_GuidePC (13,50,08,00,"OW_PATH_1_5_13"); 
};
FUNC VOID Rtn_Guid2_2402 ()
{
	TA_Stand (08,01,13,51,"OW_PATH_1_5"); 
	TA_Stand (13,51,08,01,"OW_PATH_1_5"); 
};
FUNC VOID Rtn_walk3_2402 ()
{
	TA_Walk (08,01,13,51,"OW_PATH_1_3"); 
	TA_Walk (13,51,08,01,"OW_PATH_1_3"); 
};

FUNC VOID Rtn_Guide2_2402 ()
{
	TA_GuidePC (08,00,13,50,"OW_PATH_1_5"); 
	TA_GuidePC (13,50,08,00,"OW_PATH_1_5"); 
};
Func Void Rtn_Alarm_2402 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_RANGED0"); 
	 
};
FUNC VOID Rtn_Challenge_2402 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_A");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_A");
};
Func Void Rtn_Fan_2402 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};