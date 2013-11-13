instance BAU_905_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	2;
	id 			=	905;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",73 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,5);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_905;
};

FUNC VOID Rtn_start_905 ()
{
	TA_Sleep		(20,05,07,05,"NC_PATH_PEASANT3");
	TA_WashSelf		(07,05,07,25,"NC_PATH_PEASANT5");
	TA_PickRice		(07,25,20,05,"NC_PATH69");
};


FUNC VOID Rtn_NC2_905 ()
{
	TA_Sleep		(20,05,07,05,"NC_PATH_PEASANT3");
	TA_WashSelf		(07,05,07,25,"NC_PATH_PEASANT5");
	TA_PickRice		(07,25,20,05,"NC_PATH69");
};












