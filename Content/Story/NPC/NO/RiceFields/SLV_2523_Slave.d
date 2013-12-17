instance SLV_2523_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					5;
	
	voice =					10;
	id =					2523;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony",2,1,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,-1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBooze,1);

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2523;
};

FUNC VOID Rtn_start_2523 () //vor Lares Hütte
{
	TA_TakeBarrel 		(12,03,12,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,08,12,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,38,13,02,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,03,13,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,08,13,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,38,14,02,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,03,14,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,08,14,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,38,15,02,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,03,15,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,08,15,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,38,16,02,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,03,16,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,08,16,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,38,17,02,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,03,17,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,08,17,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,38,18,02,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,03,18,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,08,18,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,38,19,02,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,03,19,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,08,19,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,38,20,02,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,03,20,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,08,20,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,38,21,02,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,03,21,07,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,08,21,37,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,38,22,07,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,03,23,37,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,08,23,02,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,38,23,07,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,03,23,37,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,08,23,02,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,38,00,07,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,07,12,02,"NC_TAVERN_BARREL");    
};                            
                              
                              
                              
                              
                              
                              




