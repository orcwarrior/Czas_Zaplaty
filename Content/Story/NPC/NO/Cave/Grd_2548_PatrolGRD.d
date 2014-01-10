instance Grd_2548_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra?nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	18;
	voice 		=	5;
	id 			=	2548;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60; 
	attribute[ATR_DEXTERITY] 	= 40; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_bald",26,1,GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	//pousuwalem kusze bo zaczynal nas atakowac z kuszy
	CreateInvItems	(self,ItMinugget,13);
	
	CreateInvItems	(self,ItFoBeer,1);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,1);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_2548;
};

FUNC VOID Rtn_start_2548 ()
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
	TA_SitAround	(23,02,00,05,"NC_HUT29_IN");

	TA_Sleep	(0,05,06,00,"NC_HUT29_IN");
	
	TA_Guard	(06,00,06,09,"NC_PATH18");             
	TA_Guard	(06,09,06,17,"NC_PATH16");                        
	TA_Guard	(06,17,06,25,"NC_PATH14");                        
	TA_Guard	(06,25,06,33,"NC_PATH85");                        
	TA_Guard	(06,33,06,41,"NC_PATH_TO_PIT_02");                
	TA_Guard	(06,41,06,50,"NC_PATH_AROUND_PIT_06");            
	TA_Guard	(06,50,06,58,"NC_PATH_AROUND_PIT_02");            
	TA_Guard	(06,58,07,06,"NC_PATH_TO_PIT_02_2");              
	TA_Guard	(07,06,07,14,"NC_ENTRANCE_WP");                   
	TA_Guard	(07,14,07,22,"NC_PLACE_03");                      
	TA_Guard	(07,22,07,30,"NC_HUT02_OUT");                     
	TA_Guard	(07,30,07,38,"NC_P01_TO_P02_01");                 
	TA_Guard	(07,38,07,46,"NC_HUT09_OUT");                     
	TA_Guard	(07,46,07,54,"NC_PATH22");                        
	TA_Guard	(07,54,08,02,"NC_PLACE04");                       
	TA_Guard	(08,02,08,10,"NC_HUT13_OUT");                     
	TA_Guard	(08,10,08,18,"NC_PATH05");                                                                	  
	TA_Guard	(08,18,08,26,"NC_PATH10");                        
	TA_Guard	(08,26,08,34,"NC_PATH15");                        
	TA_Guard	(08,34,08,42,"NC_PATH17_MOVEMENT2");              
	TA_Guard	(08,42,08,51,"NC_HUT31_OUT");                     
	TA_Guard	(08,51,09,00,"NC_PLACE08");                       
	                                                      
	                                            
	TA_Guard	(09,00,09,09,"NC_PATH18");                  
	TA_Guard	(09,09,09,17,"NC_PATH16");                  
	TA_Guard	(09,17,09,25,"NC_PATH14");                  
	TA_Guard	(09,25,09,33,"NC_PATH85");                  
	TA_Guard	(09,33,09,41,"NC_PATH_TO_PIT_02");          
	TA_Guard	(09,41,09,50,"NC_PATH_AROUND_PIT_06");      
	TA_Guard	(09,50,09,58,"NC_PATH_AROUND_PIT_02");      
	TA_Guard	(09,58,10,06,"NC_PATH_TO_PIT_02_2");        
	TA_Guard	(10,06,10,14,"NC_ENTRANCE_WP");             
	TA_Guard	(10,14,10,22,"NC_PLACE_03");                
	TA_Guard	(10,22,10,30,"NC_HUT02_OUT");               
	TA_Guard	(10,30,10,38,"NC_P01_TO_P02_01");           
	TA_Guard	(10,38,10,46,"NC_HUT09_OUT");               
	TA_Guard	(10,46,10,54,"NC_PATH22");                  
	TA_Guard	(10,54,11,02,"NC_PLACE04");                 
	TA_Guard	(11,02,11,10,"NC_HUT13_OUT");               
	TA_Guard	(11,10,11,18,"NC_PATH05");                                                           	  
	TA_Guard	(11,18,11,26,"NC_PATH10");                  
	TA_Guard	(11,26,11,34,"NC_PATH15");                  
	TA_Guard	(11,34,11,42,"NC_PATH17_MOVEMENT2");        
	TA_Guard	(11,42,11,51,"NC_HUT31_OUT");               
	TA_Guard	(11,51,12,00,"NC_PLACE08");                 
	                                                               
	TA_Guard	(12,00,12,09,"NC_PATH18");                     
	TA_Guard	(12,09,12,17,"NC_PATH16");                     
	TA_Guard	(12,17,12,25,"NC_PATH14");                     
	TA_Guard	(12,25,12,33,"NC_PATH85");                     
	TA_Guard	(12,33,12,41,"NC_PATH_TO_PIT_02");             
	TA_Guard	(12,41,12,50,"NC_PATH_AROUND_PIT_06");         
	TA_Guard	(12,50,12,58,"NC_PATH_AROUND_PIT_02");         
	TA_Guard	(12,58,13,06,"NC_PATH_TO_PIT_02_2");           
	TA_Guard	(13,06,13,14,"NC_ENTRANCE_WP");                
	TA_Guard	(13,14,13,22,"NC_PLACE_03");                   
	TA_Guard	(13,22,13,30,"NC_HUT02_OUT");                  
	TA_Guard	(13,30,13,38,"NC_P01_TO_P02_01");              
	TA_Guard	(13,38,13,46,"NC_HUT09_OUT");                  
	TA_Guard	(13,46,13,54,"NC_PATH22");                     
	TA_Guard	(13,54,14,02,"NC_PLACE04");                    
	TA_Guard	(14,02,14,10,"NC_HUT13_OUT");                  
	TA_Guard	(14,10,14,18,"NC_PATH05");                                                                           	  
	TA_Guard	(14,18,14,26,"NC_PATH10");                     
	TA_Guard	(14,26,14,34,"NC_PATH15");                     
	TA_Guard	(14,34,14,42,"NC_PATH17_MOVEMENT2");           
	TA_Guard	(14,42,14,51,"NC_HUT31_OUT");                  
	TA_Guard	(14,51,15,00,"NC_PLACE08");                    
	                             
	TA_Guard	(15,00,15,09,"NC_PATH18");                               
	TA_Guard	(15,09,15,17,"NC_PATH16");                               
	TA_Guard	(15,17,15,25,"NC_PATH14");                               
	TA_Guard	(15,25,15,33,"NC_PATH85");                               
	TA_Guard	(15,33,15,41,"NC_PATH_TO_PIT_02");                       
	TA_Guard	(15,41,15,50,"NC_PATH_AROUND_PIT_06");                   
	TA_Guard	(15,50,15,58,"NC_PATH_AROUND_PIT_02");                   
	TA_Guard	(15,58,16,06,"NC_PATH_TO_PIT_02_2");                     
	TA_Guard	(16,06,16,14,"NC_ENTRANCE_WP");                          
	TA_Guard	(16,14,16,22,"NC_PLACE_03");                             
	TA_Guard	(16,22,16,30,"NC_HUT02_OUT");                            
	TA_Guard	(16,30,16,38,"NC_P01_TO_P02_01");                        
	TA_Guard	(16,38,16,46,"NC_HUT09_OUT");                            
	TA_Guard	(16,46,16,54,"NC_PATH22");                               
	TA_Guard	(16,54,17,02,"NC_PLACE04");                              
	TA_Guard	(17,02,17,10,"NC_HUT13_OUT");                            
	TA_Guard	(17,10,17,18,"NC_PATH05");                                                                                    	  
	TA_Guard	(17,18,17,26,"NC_PATH10");                               
	TA_Guard	(17,26,17,34,"NC_PATH15");                               
	TA_Guard	(17,34,17,42,"NC_PATH17_MOVEMENT2");                     
	TA_Guard	(17,42,17,51,"NC_HUT31_OUT");                            
	TA_Guard	(17,51,18,00,"NC_PLACE08");                              
	                                                               
	TA_Guard	(18,00,18,09,"NC_PATH18");                   
	TA_Guard	(18,09,18,17,"NC_PATH16");                   
	TA_Guard	(18,17,18,25,"NC_PATH14");                   
	TA_Guard	(18,25,18,33,"NC_PATH85");                   
	TA_Guard	(18,33,18,41,"NC_PATH_TO_PIT_02");           
	TA_Guard	(18,41,18,50,"NC_PATH_AROUND_PIT_06");       
	TA_Guard	(18,50,18,58,"NC_PATH_AROUND_PIT_02");       
	TA_Guard	(18,58,19,06,"NC_PATH_TO_PIT_02_2");         
	TA_Guard	(19,06,19,14,"NC_ENTRANCE_WP");              
	TA_Guard	(19,14,19,22,"NC_PLACE_03");                 
	TA_Guard	(19,22,19,30,"NC_HUT02_OUT");                
	TA_Guard	(19,30,19,38,"NC_P01_TO_P02_01");            
	TA_Guard	(19,38,19,46,"NC_HUT09_OUT");                
	TA_Guard	(19,46,19,54,"NC_PATH22");                   
	TA_Guard	(19,54,20,02,"NC_PLACE04");                  
	TA_Guard	(20,02,20,10,"NC_HUT13_OUT");                
	TA_Guard	(20,10,20,18,"NC_PATH05");                                                                      	  
	TA_Guard	(20,18,20,26,"NC_PATH10");                   
	TA_Guard	(20,26,20,34,"NC_PATH15");                   
	TA_Guard	(20,34,20,42,"NC_PATH17_MOVEMENT2");         
	TA_Guard	(20,42,20,51,"NC_HUT31_OUT");                
	TA_Guard	(20,51,21,00,"NC_PLACE08");                  
	                                                               
	TA_Guard	(21,00,21,09,"NC_PATH18");                  
	TA_Guard	(21,09,21,17,"NC_PATH16");                  
	TA_Guard	(21,17,21,25,"NC_PATH14");                  
	TA_Guard	(21,25,21,33,"NC_PATH85");                  
	TA_Guard	(21,33,21,41,"NC_PATH_TO_PIT_02");          
	TA_Guard	(21,41,21,50,"NC_PATH_AROUND_PIT_06");      
	TA_Guard	(21,50,21,58,"NC_PATH_AROUND_PIT_02");      
	TA_Guard	(21,58,22,06,"NC_PATH_TO_PIT_02_2");        
	TA_Guard	(22,06,22,14,"NC_ENTRANCE_WP");             
	TA_Guard	(22,14,22,22,"NC_PLACE_03");                
	TA_Guard	(22,22,22,30,"NC_HUT02_OUT");               
	TA_Guard	(22,30,22,38,"NC_P01_TO_P02_01");           
	TA_Guard	(22,38,22,46,"NC_HUT09_OUT");               
	TA_Guard	(22,46,22,54,"NC_PATH22");                  
	TA_Guard	(22,54,23,02,"NC_PLACE04");                 
             
	
};


FUNC VOID Rtn_NC1_2548 ()
{
    TA_HostileGuard		(06,00,21,00,"FMC_PATH24");
    TA_HostileGuard		(21,00,06,00,"FMC_PATH24");			
};
