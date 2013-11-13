instance BAU_930_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;        
	level 		=	5;
	voice 		=	4;
	id 			=	930;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 53;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 164;
	attribute[ATR_HITPOINTS] 	= 164;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",75 ,1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_strong; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self,ItFoRice,4);
		CreateInvItem (self,ItMi_Stuff_Plate_01);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_930;
};

FUNC VOID Rtn_start_930 ()
{
	TA_SLEEP	(20,35,08,35,"NC_PATH_PEASANT1");	
	TA_PickRice		(08,35,20,35,"NC_PATH79");
};


FUNC VOID Rtn_NC1_930 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE3");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE3");
};


FUNC VOID Rtn_NC2_930 ()
{
	TA_SLEEP	(20,35,08,35,"NC_PATH_PEASANT1");	
	TA_PickRice		(08,35,20,35,"NC_PATH79");
};






