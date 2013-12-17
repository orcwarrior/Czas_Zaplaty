instance SLV_2527_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					6;
	
	voice =					2;
	id =					2527;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		58;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	222;
	attribute[ATR_HITPOINTS] =		222;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,0,"Hum_Head_Fighter",6,1,-1);
	
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

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2527;
};

FUNC VOID Rtn_start_2527 () 
{                              
	TA_TakeBarrel 		(12,23,12,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,28,12,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,58,13,22,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,23,13,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,28,13,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,58,14,22,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,23,14,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,28,14,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,58,15,22,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,23,15,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,28,15,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,58,16,22,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,23,16,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,28,16,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,58,17,22,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,23,17,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,28,17,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,58,18,22,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,23,18,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,28,18,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,58,19,22,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,23,19,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,28,19,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,58,20,22,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,23,20,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,28,20,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,58,21,22,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,23,21,27,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,28,21,57,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,58,23,27,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,23,23,57,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,28,23,22,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,58,23,27,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,23,23,57,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,28,23,22,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,58,00,27,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,27,12,22,"NC_TAVERN_BARREL");    
};                            
                              
                              
                              
                              
                              
                              




