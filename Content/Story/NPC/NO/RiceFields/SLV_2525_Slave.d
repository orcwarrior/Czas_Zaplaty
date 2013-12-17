instance SLV_2525_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					5;
	
	voice =					3;
	id =					2525;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	192;
	attribute[ATR_HITPOINTS] =		192;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",71,1,-1);
	
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

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2525;
};

FUNC VOID Rtn_start_2525 () //vor Lares Hütte
{                              
	TA_TakeBarrel 		(12,15,12,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,20,12,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,50,13,14,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,15,13,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,20,13,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,50,14,14,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,15,14,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,20,14,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,50,15,14,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,15,15,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,20,15,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,50,16,14,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,15,16,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,20,16,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,50,17,14,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,15,17,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,20,17,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,50,18,14,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,15,18,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,20,18,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,50,19,14,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,15,19,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,20,19,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,50,20,14,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,15,20,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,20,20,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,50,21,14,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,15,21,19,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,20,21,49,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,50,23,19,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,15,23,49,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,20,23,14,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,50,23,19,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,15,23,49,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,20,23,14,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,50,00,19,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,19,14,14,"NC_TAVERN_BARREL");    
};                            
                              
                              
                              
                              
                              
                              




