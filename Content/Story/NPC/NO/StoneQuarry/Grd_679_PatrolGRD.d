instance Grd_679_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra¿nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	14;
	voice 		=	11;
	id 			=	679;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",1,1,GRD_ARMOR_L);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,1);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	

	CreateInvItems	(self,ItMinugget,10);
	
	CreateInvItems	(self,ItFoBeer,1);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,1);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_679;
};

FUNC VOID Rtn_start_679 ()
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


	
	TA_Guard	(00,00,00,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(00,09,00,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(00,18,00,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(00,27,00,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(00,36,00,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(00,45,00,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(00,54,01,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(01,03,01,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(01,12,01,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(01,21,01,30,"OW_QUARRY_TOP2_01");       
                             
			                         
	TA_Guard	(01,30,01,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(01,39,01,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(01,48,01,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(01,57,02,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(02,06,02,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(02,15,02,24,"OW_QUARRY_TOP_02");        
	TA_Guard	(02,24,02,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(02,33,02,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(02,42,02,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(02,51,03,00,"OW_QUARRY_TOP2_01");    
	   
	TA_Guard	(03,00,03,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(03,09,03,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(03,18,03,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(03,27,03,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(03,36,03,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(03,45,03,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(03,54,04,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(04,03,04,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(04,12,04,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(04,21,04,30,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(04,30,04,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(04,39,04,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(04,48,04,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(04,57,05,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(05,06,05,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(05,15,05,24,"OW_QUARRY_TOP_02");        
	TA_Guard	(05,24,05,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(05,33,05,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(05,42,05,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(05,51,06,00,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(06,00,06,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(06,09,06,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(06,18,06,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(06,27,06,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(06,36,06,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(06,45,06,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(06,54,07,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(07,03,07,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(07,12,07,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(07,21,07,30,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(07,30,07,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(07,39,07,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(07,48,07,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(07,57,08,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(08,06,08,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(08,15,08,24,"OW_QUARRY_TOP_02");        
	TA_Guard	(08,24,08,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(08,33,08,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(08,42,08,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(08,51,09,00,"OW_QUARRY_TOP2_01");     
	
	TA_Guard	(09,00,09,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(09,09,09,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(09,18,09,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(09,27,09,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(09,36,09,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(09,45,09,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(09,54,10,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(10,03,10,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(10,12,10,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(10,21,10,30,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(10,30,10,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(10,39,10,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(10,48,10,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(10,57,11,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(11,06,11,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(11,15,11,24,"OW_QUARRY_TOP_02");        
	TA_Guard	(11,24,11,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(11,33,11,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(11,42,11,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(11,51,12,00,"OW_QUARRY_TOP2_01");    
	  	
	TA_SitAround	(12,00,18,00,"OW_QUARRY_TOP_GUARD_03");	                        				                   				                     
				                        					                        
	TA_Guard	(18,00,18,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(18,09,18,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(18,18,18,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(18,27,18,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(18,36,18,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(18,45,18,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(18,54,19,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(19,03,19,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(19,12,19,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(19,21,19,30,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(19,30,19,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(19,39,19,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(19,48,19,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(19,57,20,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(20,06,20,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(20,15,20,24,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(20,24,20,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(20,33,20,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(20,42,20,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(20,51,21,00,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(21,00,21,09,"OW_QUARRY_TOP_04");        
	TA_Guard	(21,09,21,18,"OW_QUARRY_TOP_06");        
	TA_Guard	(21,18,21,27,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(21,27,21,36,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(21,36,21,45,"OW_QUARRY_TOP_01");        
	TA_Guard	(21,45,21,54,"OW_QUARRY_TOP_02");        
	TA_Guard	(21,54,22,03,"OW_QUARRY_TOP2_07");       
	TA_Guard	(22,03,22,12,"OW_QUARRY_TOP2_05");       
	TA_Guard	(22,12,22,21,"OW_QUARRY_TOP2_04");       
	TA_Guard	(22,21,22,30,"OW_QUARRY_TOP2_01");       
                             
	TA_Guard	(22,30,22,39,"OW_QUARRY_TOP_04");        
	TA_Guard	(22,39,22,48,"OW_QUARRY_TOP_06");        
	TA_Guard	(22,48,22,57,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(22,57,23,06,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(23,06,23,15,"OW_QUARRY_TOP_01");        
	TA_Guard	(23,15,23,24,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(23,24,23,33,"OW_QUARRY_TOP2_07");       
	TA_Guard	(23,33,23,42,"OW_QUARRY_TOP2_05");       
	TA_Guard	(23,42,23,51,"OW_QUARRY_TOP2_04");       
	TA_Guard	(23,51,00,00,"OW_QUARRY_TOP2_01");       
                             
};                          

FUNC VOID Rtn_NC1_679 ()
{
    TA_HostileGuard		(06,00,21,00,"FMC_PATH12");
    TA_HostileGuard		(21,00,06,00,"FMC_PATH12");			
};
 