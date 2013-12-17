instance Grd_2537_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra¿nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	11;
	id 			=	2537;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60; 
	attribute[ATR_DEXTERITY] 	= 60; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",6,1,GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,1);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	//EquipItem	(self,GRD_RW_01);
	
	//CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMinugget,10);
	
	CreateInvItems	(self,ItMiJoint_1,1);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,1);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_2537;
};

FUNC VOID Rtn_start_2537 ()
{
//Sleep	
/*	
	TA_Guard	(00,00,00,12,"OW_PATH_067");
	TA_Guard	(00,12,00,24,"OW_PATH_068");
	TA_Guard	(00,24,00,36,"NC_PATH55");
	TA_Guard	(00,36,00,48,"NC_PATH68");
	TA_Guard	(00,48,01,00,"NC_PATH79");
	TA_Guard	(01,00,01,12,"NC_PATH81");
	TA_Guard	(01,12,01,24,"NC_PATH52");
	TA_Guard	(01,24,01,36,"NC_PATH53");
	TA_Guard	(01,36,01,48,"NC_PATH68");
	TA_Guard	(01,48,02,00,"NC_PATH78_A");
	TA_Guard	(02,00,02,12,"NC_PATH098");
	TA_Guard	(02,12,02,24,"NC_PATH82");
	TA_Guard	(02,24,02,36,"NC_PATH84");
	TA_Guard	(02,36,02,48,"NC_PATH54");
	TA_Guard	(02,48,03,00,"PATH_OC_NC_27");

	TA_Guard	(03,00,03,12,"OW_PATH_067");
	TA_Guard	(03,12,03,24,"OW_PATH_068");
	TA_Guard	(03,24,03,36,"NC_PATH55");
	TA_Guard	(03,36,03,48,"NC_PATH68");
	TA_Guard	(03,48,04,00,"NC_PATH79");
	TA_Guard	(04,00,04,12,"NC_PATH81");
	TA_Guard	(04,12,04,24,"NC_PATH52");
	TA_Guard	(04,24,04,36,"NC_PATH53");
	TA_Guard	(04,36,04,48,"NC_PATH68");
	TA_Guard	(04,48,05,00,"NC_PATH78_A");
	TA_Guard	(05,00,05,12,"NC_PATH098");
	TA_Guard	(05,12,05,24,"NC_PATH82");
	TA_Guard	(05,24,05,36,"NC_PATH84");
	TA_Guard	(05,36,05,48,"NC_PATH54");
	TA_Guard	(05,48,06,00,"PATH_OC_NC_27");
                    
*/	
	TA_Sleep	(00,00,06,00,"NC_HUT07_IN");
	
	TA_Guard	(06,00,06,12,"NC_LO_01");
	TA_Guard	(06,12,06,24,"NC_LO_03");
	TA_Guard	(06,24,06,36,"NC_LO_06");                  
	TA_Guard	(06,36,06,48,"NC_LO_09");                  
	TA_Guard	(06,48,07,00,"NC_LO_11");                  
	TA_Guard	(07,00,07,12,"NC_LO_05");                  
	TA_Guard	(07,12,07,24,"NC_PATH48");                 
	TA_Guard	(07,24,07,36,"NC_PATH47");                 
	TA_Guard	(07,36,07,48,"NC_PATH73");                 
	TA_Guard	(07,48,08,00,"NC_PATH71");                 
	TA_Guard	(08,00,08,10,"NC_PATH70");                 
	TA_Guard	(08,10,08,21,"NC_PATH62");                 
	TA_Guard	(08,21,08,28,"NC_DAM2");                   
	TA_Guard	(08,28,08,36,"NC_PATH58");                 
	TA_Guard	(08,36,09,48,"NC_PATH_PEASANT5");          
	TA_Guard	(08,48,09,00,"NC_PATH_PEASANT_OUTSIDE5");  
                                                                                                                                                      
	                                                                                                                                                	  
	TA_Guard	(09,00,09,12,"NC_LO_01");                  
	TA_Guard	(09,12,09,24,"NC_LO_03");                  
	TA_Guard	(09,24,09,36,"NC_LO_06");                  
	TA_Guard	(09,36,09,48,"NC_LO_09");                  
	TA_Guard	(09,48,10,00,"NC_LO_11");                  
	TA_Guard	(10,00,10,12,"NC_LO_05");                  
	TA_Guard	(10,12,10,24,"NC_PATH48");                 
	TA_Guard	(10,24,10,36,"NC_PATH47");                 
	TA_Guard	(10,36,10,48,"NC_PATH73");                 
	TA_Guard	(10,48,11,00,"NC_PATH71");                 
	TA_Guard	(11,00,11,10,"NC_PATH70");                 
	TA_Guard	(11,10,11,21,"NC_PATH62");                 
	TA_Guard	(11,21,11,28,"NC_DAM2");                   
	TA_Guard	(11,28,11,36,"NC_PATH58");                 
	TA_Guard	(11,36,11,48,"NC_PATH_PEASANT5");          
	TA_Guard	(11,48,12,00,"NC_PATH_PEASANT_OUTSIDE5");  
                                                                    
	
	TA_Guard	(12,00,12,12,"NC_LO_01");                  
	TA_Guard	(12,12,12,24,"NC_LO_03");                  
	TA_Guard	(12,24,12,36,"NC_LO_06");                  
	TA_Guard	(12,36,12,48,"NC_LO_09");                  
	TA_Guard	(12,48,13,00,"NC_LO_11");                  
	TA_Guard	(13,00,13,12,"NC_LO_05");                  
	TA_Guard	(13,12,13,24,"NC_PATH48");                 
	TA_Guard	(13,24,13,36,"NC_PATH47");                 
	TA_Guard	(13,36,13,48,"NC_PATH73");                 
	TA_Guard	(13,48,14,00,"NC_PATH71");                 
	TA_Guard	(14,00,14,10,"NC_PATH70");                 
	TA_Guard	(14,10,14,21,"NC_PATH62");                 
	TA_Guard	(14,21,14,28,"NC_DAM2");                   
	TA_Guard	(14,28,14,36,"NC_PATH58");                 
	TA_Guard	(14,36,15,48,"NC_PATH_PEASANT5");          
	TA_Guard	(11,48,12,00,"NC_PATH_PEASANT_OUTSIDE5");  
	                                                                
	TA_Guard	(15,00,15,12,"NC_LO_01");                  
	TA_Guard	(15,12,15,24,"NC_LO_03");                  
	TA_Guard	(15,24,15,36,"NC_LO_06");                  
	TA_Guard	(15,36,15,48,"NC_LO_09");                  
	TA_Guard	(15,48,16,00,"NC_LO_11");                  
	TA_Guard	(16,00,16,12,"NC_LO_05");                  
	TA_Guard	(16,12,16,24,"NC_PATH48");                 
	TA_Guard	(16,24,16,36,"NC_PATH47");                 
	TA_Guard	(16,36,16,48,"NC_PATH73");                 
	TA_Guard	(16,48,17,00,"NC_PATH71");                 
	TA_Guard	(17,00,17,10,"NC_PATH70");                 
	TA_Guard	(17,10,17,21,"NC_PATH62");                 
	TA_Guard	(17,21,17,28,"NC_DAM2");                   
	TA_Guard	(17,28,17,36,"NC_PATH58");                 
	TA_Guard	(17,36,18,48,"NC_PATH_PEASANT5");          
	TA_Guard	(17,48,18,00,"NC_PATH_PEASANT_OUTSIDE5");  
	                                                                
	TA_Guard	(18,00,18,12,"NC_LO_01");                  
	TA_Guard	(18,12,18,24,"NC_LO_03");                  
	TA_Guard	(18,24,18,36,"NC_LO_06");                  
	TA_Guard	(18,36,18,48,"NC_LO_09");                  
	TA_Guard	(18,48,18,00,"NC_LO_11");                  
	TA_Guard	(19,00,19,12,"NC_LO_05");                  
	TA_Guard	(19,12,19,24,"NC_PATH48");                 
	TA_Guard	(19,24,19,36,"NC_PATH47");                 
	TA_Guard	(19,36,19,48,"NC_PATH73");                 
	TA_Guard	(19,48,19,00,"NC_PATH71");                 
	TA_Guard	(20,00,20,10,"NC_PATH70");                 
	TA_Guard	(20,10,20,21,"NC_PATH62");                 
	TA_Guard	(20,21,20,28,"NC_DAM2");                   
	TA_Guard	(20,28,20,36,"NC_PATH58");                 
	TA_Guard	(20,36,21,48,"NC_PATH_PEASANT5");          
	TA_Guard	(20,48,21,00,"NC_PATH_PEASANT_OUTSIDE5");  
	                                                                
   	
	TA_Guard	(21,00,21,12,"NC_LO_01");                  
	TA_Guard	(21,12,21,24,"NC_LO_03");                  
	TA_Guard	(21,24,21,36,"NC_LO_06");                  
	TA_Guard	(21,36,21,48,"NC_LO_09");                  
	TA_Guard	(21,48,21,00,"NC_LO_11");                  
	TA_Guard	(21,00,22,12,"NC_LO_05");                  
	TA_Guard	(22,12,22,24,"NC_PATH48");                 
	TA_Guard	(22,24,22,36,"NC_PATH47");                 
	TA_Guard	(22,36,22,48,"NC_PATH73");                 
	TA_Guard	(22,48,22,00,"NC_PATH71");                 
	TA_Guard	(23,00,23,10,"NC_PATH70");                 
	TA_Guard	(23,10,23,21,"NC_PATH62");                 
	TA_Guard	(23,21,23,28,"NC_DAM2");                   
	TA_Guard	(23,28,23,36,"NC_PATH58");                 
	TA_Guard	(23,36,23,48,"NC_PATH_PEASANT5");          
	TA_Guard	(23,48,00,00,"NC_PATH_PEASANT_OUTSIDE5");  
};                                                                  


FUNC VOID Rtn_NC1_2537 ()
{
    TA_HostileGuard		(06,00,21,00,"NC_HUT23_OUT_GUARD2");
    TA_HostileGuard		(21,00,06,00,"NC_HUT23_OUT_GUARD2");			
};
