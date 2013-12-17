instance RBL_1332_BaalKagan (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kagan";
	Npctype	 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		13;
	
	voice 		=		13;
	id 			=		1332;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	50;
	attribute[ATR_DEXTERITY] 		=	20;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	248;
	attribute[ATR_HITPOINTS] 		=	248;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",29,1,RBL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------
	EquipItem (self,RBL_MW_01);
	EquipItem	(self,RBL_RW_01);	
	CreateInvItems (self,ItMiJoint_1,4);
	CreateInvItems (self,ItMiJoint_2,3);
 	CreateInvItems (self,ItMiJoint_3,6);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1332;
};

FUNC VOID Rtn_start_1332 ()
{
	TA_SitcampfireG	(00,00,07,30,"HC_PAGOREK");
	TA_SitcampfireEat	(07,30,14,00,"HC_PAGOREK");
	TA_Boss		(14,00,20,00,"WARTA2");	
	TA_Smoke		(20,00,00,00,"SIT_CAMPFIRE_KTOS");		
};

FUNC VOID Rtn_PREPARATION_1332 ()
{
	
	TA_SitcampfireG	(01,00,07,30,"HC_PAGOREK");           
	TA_Boss		(07,30,08,00,"WARTA2");
    TA_PRACTICESWORD	(08,00,18,05,"HC_PRACTICE5"); 
	TA_STAND			(18,05,19,00,"SIT_CAMPFIRE_KTOS");
    TA_PRACTICESWORD	(19,00,01,00,"HC_PRACTICE5"); 
     		  
};
FUNC VOID Rtn_Alarm_1332 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR9"); 
	 
};