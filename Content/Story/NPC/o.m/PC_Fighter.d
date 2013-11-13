INSTANCE PC_Fighter(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "Gorn";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_HUN;
	level			= 50;			// real 15,aber 999 damit er nicht flieht!
	voice			= 9;
	id				= 3;

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	220;
	attribute[ATR_DEXTERITY] 	=	75;
	attribute[ATR_MANA_MAX] 	=	20;
	attribute[ATR_MANA] 		=	20;
	attribute[ATR_HITPOINTS_MAX]=	600;
	attribute[ATR_HITPOINTS] 	=	600;
	
	protection[PROT_FIRE]		=	1000;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex	Armor
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Fighter",13,0,SLD_ARMOR_H);
	Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds"); 

	//-------- talents --------
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKPOCKET,1);		Npc_SetTalentValue(self,NPC_TALENT_PICKPOCKET,60); 
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);	
	Npc_SetTalentSkill	(self,NPC_TALENT_PICKLOCK,1);		Npc_SetTalentValue(self,NPC_TALENT_PICKLOCK,60); 

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);	
	fight_tactic = FAI_HUMAN_STRONG;
    	
	//-------- ai --------
   Npc_SetAivar(self,AIV_IMPORTANT, 	 TRUE);
	
	//-------- inventory --------

	CreateInvItem			(self,Gorns_Rache);
	CreateInvItem		    (self,MTR_RW_02);
	CreateInvItems		(self,ItAmBolt,100);
	CreateInvItems 		(self,ItFoWine,5);
	CreateInvItems		(self,ItFo_Potion_Health_03,10);
	CreateInvItems		(self,ItFo_Potion_Mana_01,5);
	
	//--------TA---------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_3;		
};

FUNC VOID Rtn_Start_3 () //NC Report
{	
	TA_Stand(08,00,11,00,"OW_PATH_064");    
	TA_Stand(11,00,12,00,"OW_PATH_07_20");
   TA_Stand(12,00,18,00,"OW_PATH_064");    
	TA_Stand(18,00,20,00,"OW_PATH_07_20");
   TA_Stand(20,00,03,00,"OW_PATH_064");    
	TA_Stand(03,00,08,00,"OW_PATH_07_20");
};

FUNC VOID Rtn_NC_3 () //NC Report
{	
	TA_Stand(08,00,01,00,"NC_PATH87");    
	TA_Stand(01,00,08,00,"NC_PATH87");
};

FUNC VOID Rtn_talking_3 () //NC Report
{	
   TA_GuidePC(08,00,07,59,"NC_DAM_BOTTOM"); 
};

FUNC VOID Rtn_OR_3 () //At OR
{	
	TA_SitCampfire(14,00,02,00,"SIT_FOX");    
	TA_Stand(02,00,14,00,"WATCHTOWER3_TOP2");//Change w Gestath     
};	

FUNC VOID Rtn_NC1_3 () //At OR
{	
	TA_Boss (14,00,02,00,"NC_PATH_JARVIS");    
	TA_Boss (02,00,14,00,"NC_PATH_JARVIS");//  
};	

FUNC VOID Rtn_NC2_3 () //NC Report
{	
	TA_Stand(08,00,11,00,"OW_PATH_064");    
	TA_Stand(11,00,12,00,"OW_PATH_07_20");
   TA_Stand(12,00,18,00,"OW_PATH_064");    
	TA_Stand(18,00,20,00,"OW_PATH_07_20");
   TA_Stand(20,00,03,00,"OW_PATH_064");    
	TA_Stand(03,00,08,00,"OW_PATH_07_20");
};
FUNC VOID Rtn_WATCH_3 () //
{	
	TA_Boss (14,00,02,00,"OW_PATH_075_GUARD4");    
	TA_Boss (02,00,14,00,"OW_PATH_075_GUARD4");//  
};	

FUNC VOID Rtn_NC3_3 () //
{	
	TA_Boss (14,00,02,00,"OC_ROUND_26");    
	TA_Boss (02,00,14,00,"OC_ROUND_26");//  
};	