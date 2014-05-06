instance Grd_678_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra¿nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	14;
	voice 		=	11;
	id 			=	678;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",1,1,GRD_ARMOR_L);
        
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
	
	daily_routine	=	Rtn_start_678;
};

FUNC VOID Rtn_start_678 ()
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


	
	TA_Guard	(00,00,00,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(00,09,00,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(00,18,00,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(00,27,00,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(00,36,00,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(00,45,00,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(00,54,01,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(01,03,01,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(01,12,01,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(01,21,01,30,"OW_QUARRY_TOP_06");        
                             
		                         
	TA_Guard	(01,30,01,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(01,39,01,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(01,48,01,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(01,57,02,06,"OW_QUARRY_TOP_02");        
	TA_Guard	(02,06,02,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(02,15,02,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(02,24,02,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(02,33,02,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(02,42,02,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(02,51,03,00,"OW_QUARRY_TOP_06");     
	   
	TA_Guard	(03,00,03,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(03,09,03,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(03,18,03,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(03,27,03,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(03,36,03,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(03,45,03,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(03,54,04,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(04,03,04,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(04,12,04,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(04,21,04,30,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(04,30,04,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(04,39,04,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(04,48,04,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(04,57,05,06,"OW_QUARRY_TOP_02");        
	TA_Guard	(05,06,05,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(05,15,05,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(05,24,05,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(05,33,05,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(05,42,05,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(05,51,06,00,"OW_QUARRY_TOP_06");        
	                             
	TA_SitAround	(06,00,12,00,"OW_QUARRY_TOP_GUARD_01");	

                             
			                     
	TA_Guard	(12,00,12,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(12,09,12,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(12,18,12,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(12,27,12,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(12,36,12,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(12,45,12,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(12,54,13,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(13,03,13,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(13,12,13,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(13,21,13,30,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(13,30,13,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(13,39,13,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(13,48,13,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(13,57,14,06,"OW_QUARRY_TOP_02");        
	TA_Guard	(14,06,14,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(14,15,14,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(14,24,14,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(14,33,14,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(14,42,14,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(14,51,15,00,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(15,00,15,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(15,09,15,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(15,18,15,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(15,27,15,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(15,36,15,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(15,45,15,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(15,54,16,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(16,03,16,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(16,12,16,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(16,21,16,30,"OW_QUARRY_TOP_06");        
                             
		                        
	TA_Guard	(16,30,16,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(16,39,16,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(16,48,16,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(16,57,17,06,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(17,06,17,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(17,15,17,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(17,24,17,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(17,33,17,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(17,42,17,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(17,51,18,00,"OW_QUARRY_TOP_06");        
                             
			                        
	TA_Guard	(18,00,18,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(18,09,18,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(18,18,18,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(18,27,18,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(18,36,18,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(18,45,18,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(18,54,19,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(19,03,19,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(19,12,19,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(19,21,19,30,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(19,30,19,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(19,39,19,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(19,48,19,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(19,57,20,06,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(20,06,20,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(20,15,20,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(20,24,20,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(20,33,20,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(20,42,20,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(20,51,21,00,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(21,00,21,09,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(21,09,21,18,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(21,18,21,27,"OW_QUARRY_TOP_01");        
	TA_Guard	(21,27,21,36,"OW_QUARRY_TOP_02");        
	TA_Guard	(21,36,21,45,"OW_QUARRY_TOP2_07");       
	TA_Guard	(21,45,21,54,"OW_QUARRY_TOP2_05");       
	TA_Guard	(21,54,22,03,"OW_QUARRY_TOP2_04");       
	TA_Guard	(22,03,22,12,"OW_QUARRY_TOP2_01");       
	TA_Guard	(22,12,22,21,"OW_QUARRY_TOP_04");        
	TA_Guard	(22,21,22,30,"OW_QUARRY_TOP_06");        
                             
	TA_Guard	(22,30,22,39,"OW_QUARRY_BOTTOM_01");     
	TA_Guard	(22,39,22,48,"OW_QUARRY_BOTTOM_04");     
	TA_Guard	(22,48,22,57,"OW_QUARRY_TOP_01");        
	TA_Guard	(22,57,23,06,"OW_QUARRY_TOP_02");   	    
	TA_Guard	(23,06,23,15,"OW_QUARRY_TOP2_07");       
	TA_Guard	(23,15,23,24,"OW_QUARRY_TOP2_05");       
	TA_Guard	(23,24,23,33,"OW_QUARRY_TOP2_04");       
	TA_Guard	(23,33,23,42,"OW_QUARRY_TOP2_01");       
	TA_Guard	(23,42,23,51,"OW_QUARRY_TOP_04");        
	TA_Guard	(23,51,00,00,"OW_QUARRY_TOP_06");        
                             
};                          


FUNC VOID Rtn_NC1_678 ()
{
    TA_HostileGuard		(06,00,21,00,"FMC_PATH03");
    TA_HostileGuard		(21,00,06,00,"FMC_PATH03");			
};
 
