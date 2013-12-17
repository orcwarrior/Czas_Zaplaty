instance RBL_1333_BaalIsidro (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Isidro";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		12;
	
	voice 		=		3;
	id 			=		1333;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	45;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	178;
	attribute[ATR_HITPOINTS] 		=	178;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody	(self,"hum_body_Naked0",1,1 ,"Hum_Head_FatBald",29 ,2,RBL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------
	EquipItem 		(self,RBL_MW_02);
	CreateInvItems (self,ItMiJoint_1,4);
	CreateInvItems (self,ItMiJoint_2,3);
 	CreateInvItems (self,ItMiJoint_3,1);
		
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1333;
};

FUNC VOID Rtn_start_1333 ()
{
	TA_Stand (08,00,12,00,"SPRZEDAWCA_ZIELA");
        TA_Smoke (12,00,15,00,"SPRZEDAWCA_ZIELA"); 
        TA_SitAround (15,00,00,00,"SIT_SWIR");	
 	TA_Sleep (00,00,04,35,"SLEEP");
        TA_Guard  (04,35,08,00,"GUARD");
};
FUNC VOID Rtn_Alarm_1333 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR13"); 
	 
};