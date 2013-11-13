instance SLV_2522_Slave (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Slave;
	Npctype =				Npctype_Ambient;
	guild =					GIL_SLV;       
	level =					5;
	
	voice =					4;
	id =					2522;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Pony",9,1,-1);
	
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

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2522;
};

FUNC VOID Rtn_start_2522 () //vor Lares Hütte
{
	TA_TakeBarrel 		(12,01,12,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (12,06,12,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(12,36,13,00,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(13,01,13,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (13,06,13,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(13,36,14,00,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(14,01,14,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (14,06,14,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(14,36,15,00,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(15,01,15,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (15,06,15,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(15,36,16,00,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(16,01,16,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (16,06,16,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(16,36,17,00,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(17,01,17,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (17,06,17,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(17,36,18,00,"NC_TAVERN_BARREL");   
	TA_TakeBarrel 		(18,01,18,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (18,06,18,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(18,36,19,00,"NC_TAVERN_BARREL");    
	TA_TakeBarrel 		(19,01,19,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (19,06,19,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(19,36,20,00,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(20,01,20,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (20,06,20,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(20,36,21,00,"NC_TAVERN_BARREL");     
	TA_TakeBarrel 		(21,01,21,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (21,06,21,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(21,36,22,00,"NC_TAVERN_BARREL");       
	TA_TakeBarrel 		(23,01,23,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,06,23,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,36,23,00,"NC_TAVERN_BARREL");      
	TA_TakeBarrel 		(23,01,23,05,"NC_TAVERN_BARREL");    
    TA_BarrelTransport  (23,06,23,35,"NC_RICEBUNKER_02");    
	TA_SitCampfire 		(23,36,00,00,"NC_TAVERN_BARREL");    
	TA_SitCampfire 		(00,00,12,00,"NC_TAVERN_BARREL");    
};










