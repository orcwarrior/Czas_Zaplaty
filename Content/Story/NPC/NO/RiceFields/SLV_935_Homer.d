instance SLV_935_Homer (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Homer";
	npctype	 =						npctype_main;
	guild =							GIL_SLV;      
	level =							6;
	flags =							0;
	
	voice =							2;
	id =							935;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		11;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief",5,1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	//-------- inventory --------                                    

	CreateInvItems (self,ItFoRice,2);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItFoBooze);
	CreateInvItem (self,ItMi_Stuff_Pipe_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_935;
};

FUNC VOID Rtn_Start_935 ()
{
	TA_StandAround	(19,00,06,00,"FM_148");	
	TA_StandAround	(06,00,19,00,"FM_148");	
};

FUNC VOID Rtn_Pick_935 ()
{
	TA_PickOre		(00,00,23,00,"FM_103");
	TA_PickOre		(23,00,24,00,"FM_103");
};


/*
FUNC VOID Rtn_PreStart_935 ()
{
	TA_SitCampfire 	(20,20,08,20,"NC_PATH_PEASANT_OUTSIDE20");
	TA_PickRice		(08,20,20,20,"NC_PATH83");
	//TA_Sleep		(21,30,07,30,"NC_HUT13_IN");
};

FUNC VOID Rtn_Start_935 ()
{
	TA_SitCampfire 	(20,20,08,20,"NC_PATH_PEASANT_OUTSIDE20");
	TA_PickRice		(08,20,20,20,"NC_PATH83");
};

FUNC VOID Rtn_Damnpast_935 () //Lee-Szene - geht nach Hause. (wird eigentlich nicht mehr gebracht - Mike)
{
	TA_SitAround	(07,30,21,30,"NC_HUT13_OUT"); 
	TA_Sleep		(21,30,07,30,"NC_HUT13_IN");
};
*/