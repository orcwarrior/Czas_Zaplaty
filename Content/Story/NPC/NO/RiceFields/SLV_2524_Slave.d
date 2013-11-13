instance SLV_2524_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					5;
	
	voice =					6;
	id =					2524;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief",4,1,-1);
	
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

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2524;
};

FUNC VOID Rtn_start_2524 () //vor Lares Hütte
{
	TA_TakeBarrel 		(12,13,12,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,18,12,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,48,13,12,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,13,13,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,18,13,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,48,14,12,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,13,14,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,18,14,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,48,15,12,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,13,15,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,18,15,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,48,16,12,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,13,16,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,18,16,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,48,17,12,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,13,17,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,18,17,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,48,18,12,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,13,18,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,18,18,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,48,19,12,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,13,19,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,18,19,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,48,20,12,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,13,20,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,18,20,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,48,21,12,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,13,21,17,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,18,21,47,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,48,22,17,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,13,23,47,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,18,23,12,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,48,23,17,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,13,23,47,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,18,23,12,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,48,00,17,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,17,12,12,"NC_TAVERN_BARREL");    
};                            
                              
                              
                              
                              
                              
                              




