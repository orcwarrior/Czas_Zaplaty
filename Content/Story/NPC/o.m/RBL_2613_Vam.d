instance RBL_2613_Vam (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Vam";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		15;
	
	voice 		=		4;
	id 			=		2613;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",56,2,RBL_ARMOR_L);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	EquipItem 	(self,RBL_MW_04); 
	CreateInvItems	(self,ItMi_Saw,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2613;
};

FUNC VOID Rtn_start_2613 ()
{
    TA_SitCampfire      	(03,00,08,00,"PATH_OC_NC_4");    
    TA_Stand             	(08,00,09,00,"FISKCOOK");    	
    TA_Saw	                (09,00,22,00,"OM_LUMBERMILL_01");
    TA_Stand             	(22,00,23,00,"FISKCOOK");    
    TA_Smalltalk     	    (23,00,03,00,"ZEX_STAND");//Fox

};
FUNC VOID Rtn_Challenge_2613 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2613 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2613 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR19"); 
	 
};
