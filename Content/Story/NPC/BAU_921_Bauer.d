instance BAU_921_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	4;
	id 			=	921;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 176;
	attribute[ATR_HITPOINTS] 	= 176;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex4,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",56 ,1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	CreateInvItems (self,ItFoRice,6);
	CreateInvItem (self,ItFoBooze);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_921;
};

FUNC VOID Rtn_start_921 ()
{
	TA_Sleep		(20,50,07,50,"NC_PATH_PEASANT");
	TA_PickRice		(07,50,20,50,"NC_PATH82");
};



FUNC VOID Rtn_NC1_921 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE6");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE6");
};


FUNC VOID Rtn_NC2_921 ()
{
	TA_Sleep		(20,50,07,50,"NC_PATH_PEASANT");
	TA_PickRice		(07,50,20,50,"NC_PATH82");
};










