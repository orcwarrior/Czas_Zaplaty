instance SLV_2526_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					5;
	
	voice =					3;
	id =					2526;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		56;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	212;
	attribute[ATR_HITPOINTS] =		212;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",81,1,-1);
	
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

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2526;
};

FUNC VOID Rtn_start_2526 () 
{                              
	TA_TakeBarrel 		(12,21,12,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,26,12,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,56,13,20,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,21,13,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,26,13,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,56,14,20,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,21,14,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,26,14,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,56,15,20,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,21,15,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,26,15,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,56,16,20,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,21,16,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,26,16,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,56,17,20,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,21,17,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,26,17,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,56,18,20,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,21,18,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,26,18,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,56,19,20,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,21,19,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,26,19,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,56,20,20,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,21,20,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,26,20,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,56,21,20,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,21,21,25,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,26,21,55,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,56,23,25,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,21,23,55,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,26,23,20,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,56,23,25,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,21,23,55,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,26,23,20,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,56,00,25,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,25,12,20,"NC_TAVERN_BARREL");    
};                            
                              
                              
                              
                              
                              
                              




