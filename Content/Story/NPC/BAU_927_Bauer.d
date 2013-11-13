instance BAU_927_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	9;
	id 			=	927;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 164;
	attribute[ATR_HITPOINTS] 	= 164;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",4,1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	CreateInvItems (self,ItFoRice,4);
	CreateInvItem (self,ItFoBooze);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_927;
};

FUNC VOID Rtn_start_927 ()
{
	TA_Sleep	(20,25,07,25,"NC_PATH_PEASANT2");
	TA_PickRice		(7,25,20,25,"NC_PATH81");
};

FUNC VOID Rtn_NC1_927 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE");
};



FUNC VOID Rtn_NC2_927 ()
{
	TA_Sleep	(20,25,07,25,"NC_PATH_PEASANT2");
	TA_PickRice		(7,25,20,25,"NC_PATH81");
};









