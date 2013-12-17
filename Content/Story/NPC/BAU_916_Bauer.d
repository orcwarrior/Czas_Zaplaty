instance BAU_916_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	2;
	voice 		=	2;
	id 			=	916;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony",3,2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		
		CreateInvItems (self,ItFoRice,3);
		CreateInvItem (self,ItMi_Stuff_Plate_01);
		CreateInvItem (self,ItFoBooze);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_916;
};

FUNC VOID Rtn_start_916 ()
{
	TA_Sleep		(20,30,07,30,"NC_PATH_PEASANT2");
	TA_PickRice		(07,30,20,30,"NC_PATH81");
};


FUNC VOID Rtn_NC1_916 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE7");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE7");
};


FUNC VOID Rtn_NC2_916 ()
{
	TA_Sleep		(20,30,07,30,"NC_PATH_PEASANT2");
	TA_PickRice		(07,30,20,30,"NC_PATH81");
};











