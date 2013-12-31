instance RBL_2605_Garry (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Garry";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		16;
	
	
	voice 		=		10;
	id 			=		2605;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		80;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12+90;
	attribute[ATR_HITPOINTS] 		=		self.level*12+90;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",94,2,RBL_ARMOR_L);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	CreateInvItem	(self,ItKeCavalorn01);	
	CreateInvItem	(self,Garry_Sword);
//	EquipItem	(self,RBL_RW_01);
//	EquipItem	(self,RBL_MW_01);
	//CreateInvItems	(self,ItAmArrow,16);
	CreateInvItems	(self,ItKeLockpick,2);
		CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2605;
};

FUNC VOID Rtn_start_2605 ()
{
    TA_SitCampfire	(00,00,09,00,"HC_UNDERTREE");	
    TA_Smith_Sharp	(09,00,14,00,"OM_SMITH_02");
    TA_Stand	(14,00,15,00,"OM_SMITH_02");
    TA_Smith_Sharp	(15,00,18,05,"OM_SMITH_03");
    TA_Smith_Sharp	(18,05,21,05,"OM_SMITH_03");
    TA_Smith_Sharp	(21,05,22,05,"OM_SMITH_02");
    TA_Smoke	(22,05,22,35,"DDD");
    TA_Stand	(22,35,23,00,"GARRY");    
    TA_Smalltalk	(23,00,00,00,"GARRY");  

};
Func Void Rtn_GarryTavern_2605 ()
{
	 TA_SitAround(08,00,07,59,"GARRY"); 
};
Func Void Rtn_Follow_2605 ()
{
	 TA_FollowPC(08,00,07,59,"OM_LUMBERMILL_01"); 
};
FUNC VOID Rtn_PREPARATION_2605 ()
{
	
    TA_SitCampfire	(00,05,06,20,"HC_UNDERTREE");	          
	TA_Boss		(06,20,07,00,"GARRY");
    TA_PRACTICESWORD	(08,00,12,05,"HC_PRACTICE3"); 
    TA_Stand	(12,05,13,00,"FISKSMALLTALK");
    TA_PRACTICESWORD	(13,00,00,05,"HC_PRACTICE3"); 
     		  
};
Func Void Rtn_LumberMill_2605 ()
{
    TA_SitCampfire	(00,00,09,20,"HC_UNDERTREE");	
    TA_Saw	                (09,20,10,00,"OM_LUMBERMILL_01");
    TA_Stand	(10,00,11,00,"OM_LUMBERMILL_01");
    TA_Saw	                (12,00,14,00,"OM_LUMBERMILL_01");
    TA_Stand	(14,00,16,00,"FISKSMALLTALK");
    TA_Saw	                (16,00,21,20,"OM_LUMBERMILL_01");
    TA_Smoke	(21,20,22,00,"DDD");
    TA_Stand	(22,00,23,00,"GARRY");    
    TA_Smalltalk	(23,00,00,00,"GARRY"); 
};
FUNC VOID Rtn_Challenge_2605 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2605 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2605 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR10"); 
	 
};