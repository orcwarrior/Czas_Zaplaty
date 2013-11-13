instance BAU_914_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	9;
	id 			=	914;

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
	//		         body mesh,body tex,skin,headmms,head tex,teeth,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Bald",1,1,-1);
	
	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
	
		
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,6);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_914;
};

FUNC VOID Rtn_start_914 ()
{
	TA_Sleep		(20,20,07,20,"NC_PATH_PEASANT2");
	TA_PickRice		(07,20,20,20,"NC_PATH81");
};


FUNC VOID Rtn_NC1_914 ()
{
	Ta_SitCampfire	(20,35,08,35,"NC_PATH_PEASANT_OUTSIDE8");	
	Ta_SitCampfire		(08,35,20,35,"NC_PATH_PEASANT_OUTSIDE8");
};


FUNC VOID Rtn_NC2_914 ()
{
	TA_Sleep		(20,20,07,20,"NC_PATH_PEASANT2");
	TA_PickRice		(07,20,20,20,"NC_PATH81");
};












