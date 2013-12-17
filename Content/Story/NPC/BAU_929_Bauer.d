instance BAU_929_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	2;
	id 			=	929;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald",2,1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	                            	
	//-------- Talente -------- 	                                  

	
	//-------- inventory --------                                    

		

	CreateInvItems (self,ItFoRice,3);
	
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_929;
};

FUNC VOID Rtn_start_929 ()
{
	TA_SLEEP  (20,30,08,30,"NC_PATH_PEASANT2"); //CF3
	TA_PickRice		(08,30,20,30,"NC_PATH80");
};



FUNC VOID Rtn_NC1_929 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE9");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE9");
};

FUNC VOID Rtn_NC2_929 ()
{
	TA_SLEEP  (20,30,08,30,"NC_PATH_PEASANT2"); //CF3
	TA_PickRice		(08,30,20,30,"NC_PATH80");
};






