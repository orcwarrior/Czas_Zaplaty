instance Grd_681_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra¿nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	14;
	voice 		=	11;
	id 			=	681;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60; 
	attribute[ATR_DEXTERITY] 	= 70; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",17,1,GRD_ARMOR_L);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,1);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	
	EquipItem	(self,GRD_RW_01);

	CreateInvItems	(self,ItMinugget,10);
	CreateInvItems	(self,ItAMBOLT,30);
	
	CreateInvItems	(self,ItFoBeer,2);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,1);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_681;
};

FUNC VOID Rtn_start_681 ()
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


	//like 676
	TA_Guard	(00,00,00,09,"OW_QUARRY_TOP2_07");            
	TA_Guard	(00,09,00,18,"OW_QUARRY_TOP2_05");            
	TA_Guard	(00,18,00,27,"OW_QUARRY_TOP2_04");            
	TA_Guard	(00,27,00,36,"OW_QUARRY_TOP2_01");            
	TA_Guard	(00,36,00,45,"OW_QUARRY_TOP_04");             
	TA_Guard	(00,45,00,54,"OW_QUARRY_TOP_06");             
	TA_Guard	(00,54,01,03,"OW_QUARRY_BOTTOM_01");          
	TA_Guard	(01,03,01,12,"OW_QUARRY_BOTTOM_04");          
	TA_Guard	(01,12,01,21,"OW_QUARRY_TOP_01");             
	TA_Guard	(01,21,01,30,"OW_QUARRY_TOP_02");             
                                                                      
	TA_Guard	(01,30,01,39,"OW_QUARRY_TOP2_07");            
	TA_Guard	(01,39,01,48,"OW_QUARRY_TOP2_05");            
	TA_Guard	(01,48,01,57,"OW_QUARRY_TOP2_04");            
	TA_Guard	(01,57,02,06,"OW_QUARRY_TOP2_01");            
	TA_Guard	(02,06,02,15,"OW_QUARRY_TOP_04");             
	TA_Guard	(02,15,02,24,"OW_QUARRY_TOP_06");             
	TA_Guard	(02,24,02,33,"OW_QUARRY_BOTTOM_01");          
	TA_Guard	(02,33,02,42,"OW_QUARRY_BOTTOM_04");          
	TA_Guard	(02,42,02,51,"OW_QUARRY_TOP_01");             
	TA_Guard	(02,51,03,00,"OW_QUARRY_TOP_02");             
                                                              
	TA_Guard	(03,00,03,09,"OW_QUARRY_TOP2_07");            
	TA_Guard	(03,09,03,18,"OW_QUARRY_TOP2_05");            
	TA_Guard	(03,18,03,27,"OW_QUARRY_TOP2_04");            
	TA_Guard	(03,27,03,36,"OW_QUARRY_TOP2_01");            
	TA_Guard	(03,36,03,45,"OW_QUARRY_TOP_04");             
	TA_Guard	(03,45,03,54,"OW_QUARRY_TOP_06");             
	TA_Guard	(03,54,04,03,"OW_QUARRY_BOTTOM_01");          
	TA_Guard	(04,03,04,12,"OW_QUARRY_BOTTOM_04");          
	TA_Guard	(04,12,04,21,"OW_QUARRY_TOP_01");             
	TA_Guard	(04,21,04,30,"OW_QUARRY_TOP_02");             
                                                              
	TA_Guard	(04,30,04,39,"OW_QUARRY_TOP2_07");            
	TA_Guard	(04,39,04,48,"OW_QUARRY_TOP2_05");            
	TA_Guard	(04,48,04,57,"OW_QUARRY_TOP2_04");            
	TA_Guard	(04,57,05,06,"OW_QUARRY_TOP2_01");            
	TA_Guard	(05,06,05,15,"OW_QUARRY_TOP_04");             
	TA_Guard	(05,15,05,24,"OW_QUARRY_TOP_06");             
	TA_Guard	(05,24,05,33,"OW_QUARRY_BOTTOM_01");          
	TA_Guard	(05,33,05,42,"OW_QUARRY_BOTTOM_04");          
	TA_Guard	(05,42,05,51,"OW_QUARRY_TOP_01");             
	TA_Guard	(05,51,06,00,"OW_QUARRY_TOP_02");   	         
           
	
	//like 678                  
	TA_Guard	(06,00,06,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(06,09,06,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(06,18,06,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(06,27,06,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(06,36,06,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(06,45,06,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(06,54,07,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(07,03,07,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(07,12,07,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(07,21,07,30,"OW_QUARRY_TOP_06");        
                                                         
	TA_Guard	(07,30,07,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(07,39,07,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(07,48,07,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(07,57,08,06,"OW_QUARRY_TOP_02");        
	TA_Guard	(08,06,08,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(08,15,08,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(08,24,08,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(08,33,08,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(08,42,08,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(08,51,09,00,"OW_QUARRY_TOP_06");                      
                                                         
	TA_Guard	(09,00,09,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(09,09,09,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(09,18,09,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(09,27,09,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(09,36,09,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(09,45,09,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(09,54,10,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(10,03,10,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(10,12,10,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(10,21,10,30,"OW_QUARRY_TOP_06");        
                                                         
	TA_Guard	(10,30,10,39,"OW_QUARRY_BOTTOM_01");                               
	TA_Guard	(10,39,10,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(10,48,10,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(10,57,11,06,"OW_QUARRY_TOP_02");        
	TA_Guard	(11,06,11,15,"OW_QUARRY_TOP2_07");     	    
	TA_Guard	(11,15,11,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(11,24,11,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(11,33,11,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(11,42,11,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(11,51,12,00,"OW_QUARRY_TOP_06");        
                               
	//like 680					                     
	TA_Guard	(12,00,12,09,"OW_QUARRY_TOP2_04");       
	TA_Guard	(12,09,12,18,"OW_QUARRY_TOP2_01");       
	TA_Guard	(12,18,12,27,"OW_QUARRY_TOP_04");        
	TA_Guard	(12,27,12,36,"OW_QUARRY_TOP_06");        
	TA_Guard	(12,36,12,45,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(12,45,12,54,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(12,54,13,03,"OW_QUARRY_TOP_01");        
	TA_Guard	(13,03,13,12,"OW_QUARRY_TOP_02");        
	TA_Guard	(13,12,13,21,"OW_QUARRY_TOP2_07");       
	TA_Guard	(13,21,13,30,"OW_QUARRY_TOP2_05");       
                                                         
	TA_Guard	(13,30,13,39,"OW_QUARRY_TOP2_04");       
	TA_Guard	(13,39,13,48,"OW_QUARRY_TOP2_01");       
	TA_Guard	(13,48,13,57,"OW_QUARRY_TOP_04");        
	TA_Guard	(13,57,14,06,"OW_QUARRY_TOP_06");        
	TA_Guard	(14,06,14,15,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(14,15,14,24,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(14,24,14,33,"OW_QUARRY_TOP_01");        
	TA_Guard	(14,33,14,42,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(14,42,14,51,"OW_QUARRY_TOP2_07");       
	TA_Guard	(14,51,15,00,"OW_QUARRY_TOP2_05");       
                                                                                 
	TA_Guard	(15,00,15,09,"OW_QUARRY_TOP2_04");       
	TA_Guard	(15,09,15,18,"OW_QUARRY_TOP2_01");       
	TA_Guard	(15,18,15,27,"OW_QUARRY_TOP_04");        
	TA_Guard	(15,27,15,36,"OW_QUARRY_TOP_06");        
	TA_Guard	(15,36,15,45,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(15,45,15,54,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(15,54,16,03,"OW_QUARRY_TOP_01");        
	TA_Guard	(16,03,16,12,"OW_QUARRY_TOP_02");        
	TA_Guard	(16,12,16,21,"OW_QUARRY_TOP2_07");       
	TA_Guard	(16,21,16,30,"OW_QUARRY_TOP2_05");       
                                                         
	TA_Guard	(16,30,16,39,"OW_QUARRY_TOP2_04");       
	TA_Guard	(16,39,16,48,"OW_QUARRY_TOP2_01");       
	TA_Guard	(16,48,16,57,"OW_QUARRY_TOP_04");        
	TA_Guard	(16,57,17,06,"OW_QUARRY_TOP_06");        
	TA_Guard	(17,06,17,15,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(17,15,17,24,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(17,24,17,33,"OW_QUARRY_TOP_01");        
	TA_Guard	(17,33,17,42,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(17,42,17,51,"OW_QUARRY_TOP2_07");       
	TA_Guard	(17,51,18,00,"OW_QUARRY_TOP2_05");       

	TA_SitAround	(18,00,00,00,"OW_QUARRY_TOP_GUARD_03");	                        				                   				                     
	                             
};                  


FUNC VOID Rtn_NC1_681 ()
{
    TA_HostileGuard		(06,00,21,00,"FMC_PATH03");
    TA_HostileGuard		(21,00,06,00,"FMC_PATH03");			
};
           