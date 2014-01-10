instance Grd_2509_PatrolGRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra?nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	18;
	voice 		=	11;
	id 			=	2509;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",4,1,GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	//pousuwalem kusze bo zaczynal nas atakowac z kuszy
	EquipItem	(self,GRD_RW_01);
	
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMinugget,10);
	
	CreateInvItems	(self,ItMiJoint_1,2);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,2);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_2509;
};

FUNC VOID Rtn_start_2509 ()
{
//Sleep	
/*	
	TA_Guard	(00,00,00,12,"OW_PATH_067");
	TA_Guard	(00,12,00,24,"OW_PATH_068");
	TA_Guard	(00,24,00,36,"NC_PATH55");
	TA_Guard	(00,36,00,48,"NC_PATH068");
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
	TA_Guard	(03,36,03,48,"NC_PATH068");
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
	
	TA_Guard	(00,00,00,12,"NC_PATH79"); 
	TA_Guard	(00,12,00,24,"NC_PATH81"); 
	TA_Guard	(00,24,00,36,"NC_PATH52");     
	TA_Guard	(00,36,00,48,"NC_PATH53");     
	TA_Guard	(00,48,01,00,"NC_PATH68");     
	TA_Guard	(01,00,01,12,"NC_PATH78_A");    
	TA_Guard	(01,12,01,24,"NC_PATH098");     
	TA_Guard	(01,24,01,36,"NC_PATH82");     
	TA_Guard	(01,36,01,48,"NC_PATH84");     
	TA_Guard	(01,48,02,00,"NC_PATH54");     
	TA_Guard	(02,00,02,12,"PATH_OC_NC_27"); 
	TA_Guard	(02,12,02,24,"OW_PATH_067");   
	TA_Guard	(02,24,02,36,"OW_PATH_068");   
	TA_Guard	(02,36,02,48,"NC_PATH55");     
	TA_Guard	(02,48,03,00,"NC_PATH068");   
	
	TA_Guard	(03,00,03,12,"NC_PATH79"); 
	TA_Guard	(03,12,03,24,"NC_PATH81"); 
	TA_Guard	(03,24,03,36,"NC_PATH52");     
	TA_Guard	(03,36,03,48,"NC_PATH53");     
	TA_Guard	(03,48,04,00,"NC_PATH68");     
	TA_Guard	(04,00,04,12,"NC_PATH78_A");    
	TA_Guard	(04,12,04,24,"NC_PATH098");     
	TA_Guard	(04,24,04,36,"NC_PATH82");     
	TA_Guard	(04,36,04,48,"NC_PATH84");     
	TA_Guard	(04,48,05,00,"NC_PATH54");     
	TA_Guard	(05,00,05,12,"PATH_OC_NC_27"); 
	TA_Guard	(05,12,05,24,"OW_PATH_067");   
	TA_Guard	(05,24,05,36,"OW_PATH_068");   
	TA_Guard	(05,36,05,48,"NC_PATH55");     
	TA_Guard	(05,48,06,00,"NC_PATH068");   
		  	
	TA_Guard	(06,00,06,12,"NC_PATH79"); 
	TA_Guard	(06,12,06,24,"NC_PATH81"); 
	TA_Guard	(06,24,06,36,"NC_PATH52");     
	TA_Guard	(06,36,06,48,"NC_PATH53");     
	TA_Guard	(06,48,07,00,"NC_PATH68");     
	TA_Guard	(07,00,07,12,"NC_PATH78_A");    
	TA_Guard	(07,12,07,24,"NC_PATH098");     
	TA_Guard	(07,24,07,36,"NC_PATH82");     
	TA_Guard	(07,36,07,48,"NC_PATH84");     
	TA_Guard	(07,48,08,00,"NC_PATH54");     
	TA_Guard	(08,00,08,12,"PATH_OC_NC_27"); 
	TA_Guard	(08,12,08,24,"OW_PATH_067");   
	TA_Guard	(08,24,08,36,"OW_PATH_068");   
	TA_Guard	(08,36,08,48,"NC_PATH55");     
	TA_Guard	(08,48,09,00,"NC_PATH068");     
                                   
	                             	  
	TA_Guard	(09,00,09,12,"NC_PATH79");     
	TA_Guard	(09,12,09,24,"NC_PATH81");     
	TA_Guard	(09,24,09,36,"NC_PATH52");     
	TA_Guard	(09,36,09,48,"NC_PATH53");     
	TA_Guard	(09,48,10,00,"NC_PATH68");     
	TA_Guard	(10,00,10,12,"NC_PATH78_A");    
	TA_Guard	(10,12,10,24,"NC_PATH098");     
	TA_Guard	(10,24,10,36,"NC_PATH82");     
	TA_Guard	(10,36,10,48,"NC_PATH84");     
	TA_Guard	(10,48,11,00,"NC_PATH54");     
	TA_Guard	(11,00,11,12,"PATH_OC_NC_27"); 
	TA_Guard	(11,12,11,24,"OW_PATH_067");   
	TA_Guard	(11,24,11,36,"OW_PATH_068");   
	TA_Guard	(11,36,11,48,"NC_PATH55");     
	TA_Guard	(11,48,12,00,"NC_PATH068");     
	

	
	TA_Guard	(12,00,12,12,"NC_PATH79");     
	TA_Guard	(12,12,12,24,"NC_PATH81");     
	TA_Guard	(12,24,12,36,"NC_PATH52");     
	TA_Guard	(12,36,12,48,"NC_PATH53");     
	TA_Guard	(12,48,13,00,"NC_PATH68");     
	TA_Guard	(13,00,13,12,"NC_PATH78_A");    
	TA_Guard	(13,12,13,24,"NC_PATH098");     
	TA_Guard	(13,24,13,36,"NC_PATH82");     
	TA_Guard	(13,36,13,48,"NC_PATH84");     
	TA_Guard	(13,48,14,00,"NC_PATH54");     
	TA_Guard	(14,00,14,12,"PATH_OC_NC_27"); 
	TA_Guard	(14,12,14,24,"OW_PATH_067");   
	TA_Guard	(14,24,14,36,"OW_PATH_068");   
	TA_Guard	(14,36,14,48,"NC_PATH55");     
	TA_Guard	(14,48,15,00,"NC_PATH068");     
	
	TA_Guard	(15,00,15,12,"NC_PATH79");     
	TA_Guard	(15,12,15,24,"NC_PATH81");     
	TA_Guard	(15,24,15,36,"NC_PATH52");     
	TA_Guard	(15,36,15,48,"NC_PATH53");     
	TA_Guard	(15,48,16,00,"NC_PATH68");     
	TA_Guard	(16,00,16,12,"NC_PATH78_A");    
	TA_Guard	(16,12,16,24,"NC_PATH098");     
	TA_Guard	(16,24,16,36,"NC_PATH82");     
	TA_Guard	(16,36,16,48,"NC_PATH84");     
	TA_Guard	(16,48,17,00,"NC_PATH54");     
	TA_Guard	(17,00,17,12,"PATH_OC_NC_27"); 
	TA_Guard	(17,12,17,24,"OW_PATH_067");   
	TA_Guard	(17,24,17,36,"OW_PATH_068");   
	TA_Guard	(17,36,17,48,"NC_PATH55");     
	TA_Guard	(17,48,18,00,"NC_PATH068");     
	
	TA_Guard	(18,00,18,12,"NC_PATH79");     
	TA_Guard	(18,12,18,24,"NC_PATH81");     
	TA_Guard	(18,24,18,36,"NC_PATH52");     
	TA_Guard	(18,36,18,48,"NC_PATH53");     
	TA_Guard	(18,48,18,00,"NC_PATH68");     
	TA_Guard	(19,00,19,12,"NC_PATH78_A");    
	TA_Guard	(19,12,19,24,"NC_PATH098");     
	TA_Guard	(19,24,19,36,"NC_PATH82");     
	TA_Guard	(19,36,19,48,"NC_PATH84");     
	TA_Guard	(19,48,19,00,"NC_PATH54");     
	TA_Guard	(20,00,20,12,"PATH_OC_NC_27"); 
	TA_Guard	(20,12,20,24,"OW_PATH_067");   
	TA_Guard	(20,24,20,36,"OW_PATH_068");   
	TA_Guard	(20,36,20,48,"NC_PATH55");     
	TA_Guard	(20,48,21,00,"NC_PATH068");     	
	
	TA_Guard	(21,00,21,12,"NC_PATH79");      
	TA_Guard	(21,12,21,24,"NC_PATH81");      
	TA_Guard	(21,24,21,36,"NC_PATH52");      
	TA_Guard	(21,36,21,48,"NC_PATH53");      
	TA_Guard	(21,48,21,00,"NC_PATH68");      
	TA_Guard	(21,00,22,12,"NC_PATH78_A");     
	TA_Guard	(22,12,22,24,"NC_PATH098");      
	TA_Guard	(22,24,22,36,"NC_PATH82");      
	TA_Guard	(22,36,22,48,"NC_PATH84");      
	TA_Guard	(22,48,22,00,"NC_PATH54");      
	TA_Guard	(23,00,23,12,"PATH_OC_NC_27");  
	TA_Guard	(23,12,23,24,"OW_PATH_067");    
	TA_Guard	(23,24,23,36,"OW_PATH_068");    
	TA_Guard	(23,36,23,48,"NC_PATH55");      
	TA_Guard	(23,48,00,00,"NC_PATH068");      
	
};

FUNC VOID Rtn_NC1_2509 ()
{
	TA_HostileGuard	(00,00,00,12,"NC_HUT04_OUT");
	TA_HostileGuard	(00,12,00,24,"NC_HUT04_OUT");
	
};
