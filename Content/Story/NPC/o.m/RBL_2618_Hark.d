instance RBL_2618_Hark (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Hark";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		15;
	
	
	voice 		=		1;
	id 			=		2618;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",38,2,RBL_ARMOR_L);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,65); 		
		
	//-------- inventory --------
	EquipItem 	(self,RBL_MW_04); 
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_2618;
};

FUNC VOID Rtn_prestart_2618 ()//all day in tavern
{
    TA_SitAround      	(03,00,12,05,"SIT_CHAIR_TAVERN");    
    TA_SitAround           	(12,05,03,00,"SIT_CHAIR_TAVERN");    	

};
FUNC VOID Rtn_start_2618 ()
{
    TA_SitCampfire      	(03,00,12,05,"HC_CAMPFIRE_NO2");    
    TA_SitAround           	(12,05,03,00,"SIT_CHAIR_TAVERN");    	

};

FUNC VOID Rtn_PREPARATION_2618 ()
{
	
    TA_SitCampfire      	(03,00,11,00,"HC_CAMPFIRE_NO2");    
    TA_PRACTICESWORD	(11,00,22,05,"HC_PRACTICE6"); 
	TA_Smith_Sharp	(22,05,03,00,"HC_NO_SHARP");
     		  
};
FUNC VOID Rtn_Challenge_2618 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2618 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2618 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR19"); 
	 
};

FUNC VOID Rtn_WOLF_2618 ()
{
    TA_BOSS      		(03,00,12,05,"MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01");    
    TA_BOSS           	(12,05,03,00,"MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01");    	

};