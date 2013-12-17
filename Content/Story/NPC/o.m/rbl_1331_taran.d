instance RBL_1331_BaalTaran (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Taran";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		18;
		
	voice 		=		5;
	id 			=		1331;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	55;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	248;
	attribute[ATR_HITPOINTS] 		=	248;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_FatBald",29 ,2,RBL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------
	EquipItem 		(self,RBL_MW_02);
	CreateInvItems	(self,ItMiNugget,15);
	CreateInvItems	(self,ItFoRice,5);
	CreateInvItems	(self,ItFoBooze,3);
	CreateInvItems	(self,ItMiJoint_1,13);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
 
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1331;
};

FUNC VOID Rtn_start_1331 ()
{
	TA_Smoke	(00,00,08,00,"PATCHH");
	TA_Boss	(08,00,00,00,"SPRZEDAWCA_ZIELA");
};
FUNC VOID Rtn_Alarm_1331 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR11"); 
	 
};
