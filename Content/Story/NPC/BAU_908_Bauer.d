instance BAU_908_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Slave;
	npctype		=	npctype_ambient;
	guild 		=	GIL_SLV;      
	level 		=	4;
	voice 		=	4;
	id 			=	908;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 188;
	attribute[ATR_HITPOINTS] 	= 188;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony", 1,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	//-------- Talente --------                                    
		     
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,5);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItFoBooze);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_908;
};

FUNC VOID Rtn_start_908 ()
{
	TA_Sleep		(20,15,07,15,"NC_PATH_PEASANT_SLEEP");
	TA_PickRice		(07,15,20,15,"item1");
};



FUNC VOID Rtn_NC2_908 ()
{
	TA_Sleep		(20,15,07,15,"NC_PATH_PEASANT_SLEEP");
	TA_PickRice		(07,15,20,15,"item1");
};












