instance RBL_2619_Cup (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kufel";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		3;
	
	
	voice 		=		10;
	id 			=		2619;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		40;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",2,2,RBL_ARMOR_L);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,65); 		
		
	//-------- inventory --------
	EquipItem 	(self,RBL_MW_01); 
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_2619;
};

FUNC VOID Rtn_prestart_2619 ()
{
    TA_SitCampfire      	(03,00,13,00,"SIT_TABLE");    
    TA_SitAround           	(13,00,03,00,"SIT_TABLE");  

};
FUNC VOID Rtn_start_2619 ()
{
    TA_SitCampfire      	(03,00,12,05,"HC_CAMPFIRE_NO3");    
    TA_SitAround           	(12,05,03,00,"SIT_TABLE");  

};
FUNC VOID Rtn_PREPARATION_2619 ()
{
    TA_SitCampfire      (04,00,07,00,"HC_CAMPFIRE_NO3");    
    TA_RepairHut       	(07,00,12,10,"HC_PALISADE_REPAIR_3");  
    TA_Stand     	 	(12,10,13,00,"HC_CAMPFIRE_NO3");    
    TA_RepairHut        (13,00,04,00,"HC_PALISADE_REPAIR_3");  

};
FUNC VOID Rtn_Challenge_2619 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2619 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2619 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR19"); 
	 
};
