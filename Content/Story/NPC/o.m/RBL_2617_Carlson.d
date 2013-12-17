instance RBL_2617_Carlson (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Carlson";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		20;
	
	
	voice 		=		13;
	id 			=		2617;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		150;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",51,2,SMITH_ARMOR);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	EquipItem 	(self,RBL_MW_04); 
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2617;
};

FUNC VOID Rtn_start_2617 ()
{
    TA_SitCampfire      	(03,00,08,00,"NEWPATH_6");    
    TA_Stand             	(08,01,02,59,"NEWPATH_6");    	

};
FUNC VOID Rtn_FOLLOW_2617 ()
{
	TA_FollowPC		(02,00,14,00,"PATH_OC_NC_3");	
	TA_FollowPC		(14,00,02,00,"PATH_OC_NC_3");
};
FUNC VOID Rtn_OR_2617 ()
{
	TA_SitAround	        (22,30,00,30,"SIT_CHAIR_TAVERN");
	TA_SITCAMPFIRE	(00,30,08,00,"GARRY_SIT");


	TA_Smith_Fire	(09,00,09,10,"OM_SMITH_01");
	TA_Smith_Anvil	(09,10,09,20,"OM_SMITH_02");
	TA_Smith_Fire	(09,20,09,30,"OM_SMITH_01");
	TA_Smith_Anvil	(09,30,09,40,"OM_SMITH_02");
	TA_Smith_Cool	(09,40,09,50,"OM_SMITH_01");
	TA_Smith_Anvil	(09,50,10,00,"OM_SMITH_02");

	TA_Smith_Fire	(10,00,10,10,"OM_SMITH_01");
	TA_Smith_Anvil	(10,10,10,20,"OM_SMITH_02");
	TA_Smith_Fire	(10,20,10,30,"OM_SMITH_01");
	TA_Smith_Anvil	(10,30,10,40,"OM_SMITH_02");
	TA_Smith_Cool	(10,40,10,50,"OM_SMITH_01");
	TA_Smith_Anvil	(10,50,11,00,"OM_SMITH_02");    
          
	TA_Smith_Fire	(11,00,11,10,"OM_SMITH_01");
	TA_Smith_Anvil	(11,10,11,20,"OM_SMITH_02");
	TA_Smith_Fire	(11,20,11,30,"OM_SMITH_01");
	TA_Smith_Anvil	(11,30,11,40,"OM_SMITH_02");
	TA_Smith_Cool	(11,40,11,50,"OM_SMITH_01");
	TA_Smith_Anvil	(11,50,12,00,"OM_SMITH_02");


	TA_Smith_Anvil	(12,00,12,10,"OM_SMITH_02");
	TA_Smith_Cool	(12,10,12,20,"OM_SMITH_01");
	TA_Smith_Fire	(12,20,12,30,"OM_SMITH_01");
	TA_Smith_Anvil	(12,30,12,40,"OM_SMITH_02");
	TA_Smith_Cool	(12,40,12,50,"OM_SMITH_01");
	TA_Smith_Anvil	(12,50,13,00,"OM_SMITH_02");
          
	TA_Smith_Fire	(13,00,13,10,"OM_SMITH_01");
	TA_Smith_Anvil	(13,10,13,20,"OM_SMITH_02");
	TA_Smith_Fire	(13,20,13,30,"OM_SMITH_01");
	TA_Smith_Anvil	(13,30,13,40,"OM_SMITH_02");
	TA_Smith_Cool	(13,40,13,50,"OM_SMITH_01");
	TA_Smith_Anvil	(13,50,14,00,"OM_SMITH_02");
           
	TA_Smith_Fire	(14,00,13,10,"OM_SMITH_01");
	TA_Smith_Anvil	(14,10,13,20,"OM_SMITH_02");
	TA_Smith_Fire	(14,20,13,30,"OM_SMITH_01");
	TA_Smith_Anvil	(14,30,13,40,"OM_SMITH_02");
	TA_Smith_Cool	(14,40,13,50,"OM_SMITH_01");
	TA_Smith_Anvil	(14,50,15,00,"OM_SMITH_02");      

	TA_Smith_Fire	(15,00,15,10,"OM_SMITH_01");
	TA_Smith_Anvil	(15,40,15,50,"OM_SMITH_02");
	TA_Smith_Fire	(15,50,16,00,"OM_SMITH_01");
	TA_Smith_Anvil	(16,00,16,10,"OM_SMITH_02");


	TA_Smith_Fire	(15,00,15,10,"OM_SMITH_01");
	TA_Smith_Anvil	(15,10,15,20,"OM_SMITH_02");
	TA_Smith_Fire	(15,20,15,30,"OM_SMITH_01");
	TA_Smith_Anvil	(15,30,15,40,"OM_SMITH_02");
	TA_Smith_Cool	(15,40,15,50,"OM_SMITH_01");
 	TA_Smith_Anvil	(15,50,16,00,"OM_SMITH_02");

	TA_Smith_Fire	(16,00,16,10,"OM_SMITH_01");
	TA_Smith_Anvil	(16,10,16,20,"OM_SMITH_02");
	TA_Smith_Fire	(16,20,16,30,"OM_SMITH_01");
	TA_Smith_Anvil	(16,30,16,40,"OM_SMITH_02");
	TA_Smith_Cool	(16,40,16,50,"OM_SMITH_01");
	TA_Smith_Anvil	(16,50,17,00,"OM_SMITH_02");
	TA_STAND		(17,00,18,00,"OM_SMITH_01");//with cavalorn 
	TA_Smith_Fire	(18,00,18,10,"OM_SMITH_01");
	TA_Smith_Anvil	(18,10,18,20,"OM_SMITH_02");
	TA_Smith_Fire	(18,20,18,30,"OM_SMITH_01");
	TA_Smith_Anvil	(18,30,18,40,"OM_SMITH_02");
	TA_Smith_Cool	(18,40,18,50,"OM_SMITH_01");
	TA_Smith_Anvil	(18,50,19,00,"OM_SMITH_02");
	TA_Smith_Fire	(19,00,19,10,"OM_SMITH_01");
	TA_Smith_Anvil	(19,10,19,20,"OM_SMITH_02");
	TA_Smith_Fire	(19,20,19,30,"OM_SMITH_01");
	TA_Smith_Anvil	(19,30,19,40,"OM_SMITH_02");
	TA_Smith_Cool	(19,40,19,50,"OM_SMITH_01");
	TA_Smith_Anvil	(19,50,20,00,"OM_SMITH_02");
	TA_Smith_Fire	(20,00,20,10,"OM_SMITH_01");
	TA_Smith_Anvil	(20,10,20,20,"OM_SMITH_02");
	TA_Smith_Fire	(20,20,20,30,"OM_SMITH_01");
	TA_Smith_Anvil	(20,30,20,40,"OM_SMITH_02");
	TA_Smith_Cool	(20,40,20,50,"OM_SMITH_01");
	TA_Smith_Anvil	(20,50,21,00,"OM_SMITH_02");
    TA_Stand        (21,00,21,30,"GARRY_SIT");
	TA_Smith_Fire	(21,30,21,40,"OM_SMITH_01");
	TA_Smith_Cool	(21,40,21,50,"OM_SMITH_01");
	TA_Smith_Anvil	(21,50,22,00,"OM_SMITH_02");
	TA_Stand		(22,00,22,30,"GARRY_SIT"); 	

};
FUNC VOID Rtn_Challenge_2617 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2617 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2617 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR19"); 
	 
};
