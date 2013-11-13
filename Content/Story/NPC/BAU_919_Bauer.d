instance BAU_919_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	4;
	id 			=	919;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",78 ,1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self,ItFoRice,4);
		CreateInvItem (self,ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_919;
};

FUNC VOID Rtn_start_919 ()
{
	TA_Sleep		(20,40,07,40,"NC_PATH_PEASANT");
	TA_PickRice		(07,40,20,40,"NC_PATH54");
};



FUNC VOID Rtn_NC1_919 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE5");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE5");
};


FUNC VOID Rtn_NC2_919 ()
{
	TA_Sleep		(20,40,07,40,"NC_PATH_PEASANT");
	TA_PickRice		(07,40,20,40,"NC_PATH54");
};






