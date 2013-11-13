instance RBL_2331_Zex (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Zex";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		22;

	voice 		=		10;
	id 			=		2331;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	70;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	self.level*12+90;
	attribute[ATR_HITPOINTS] 		=	self.level*12+90;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",26 ,1,RBL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------
	EquipItem (self,HUN_MW_03);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);		
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItems	(self,ItFo_Potion_Health_03,6);
	CreateInvItems	(self,ItFoRice,4);
	CreateInvItems(self,itmijoint_3,4);
	 
	
        
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2331;
};

FUNC VOID Rtn_start_2331 ()
{

	TA_SitCampfireEat		(16,35,20,50,"TALKZEX");	
	TA_Sleep		(20,50,02,20,"FISKSLEEP");	
	TA_SitCampfireSmalltalk	(02,20,03,35,"TALKZEX");//with Jahein
	TA_Stand (03,35,07,45,"ZEX_STAND");
	TA_Smoke		(07,45,08,00,"ZEX_STAND");
	TA_SitCampfireEat	(08,00,10,00,"TALKZEX");
	Ta_Guard	(10,01,16,00,"OW_SAWHUT_MOLERAT_SPAWN01");
};
Func Void Rtn_Alarm_2331 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR7"); 
	 
};
FUNC VOID Rtn_Challenge_2331 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_A");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_A");
};
Func Void Rtn_Fan_2331 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};