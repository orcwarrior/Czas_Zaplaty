instance SLV_904_Mordrag (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Mordrag";
	Npctype =				Npctype_ambient;
	guild =					GIL_SLV;      
	level =					10;
	
	voice =					11;
	id =					904;

	//-------- abilities --------

	attribute[ATR_STRENGTH] 	= 86; 
	attribute[ATR_DEXTERITY] 	= 86; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",36,2,-1);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0.3);		
	
	fight_tactic	=	FAI_HUMAN_RANGED;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------   
	CreateInvItems	(self,ItFoRice,1);
	CreateInvItem	(self,ItMi_Stuff_Cup_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_904;
};

FUNC VOID Rtn_start_904 ()
{
	TA_Sleep		(20,00,07,00,"NC_PATH_PEASANT3");
	TA_WashSelf		(07,00,07,20,"NC_PATH_PEASANT5");
	TA_PickRice		(07,20,20,00,"NC_DAM_BOTTOM");
};

/*
FUNC VOID Rtn_PreStart_826 ()
{
	TA_Smoke		(14,00,16,00,"HC_NO_END2");
	TA_SitAround		(16,00,20,00,"HC_NO_END1");
	TA_Stand			(22,00,00,00,"HC_NO_END2");
	TA_Stand			(00,00,07,00,"GO_TAVERNE");	
    TA_SitCampfireT             (07,00,14,00,"HC_CAMPFIRE_NO3");
};

FUNC VOID Rtn_Guide_826 ()
{
	TA_GuidePC (08,00,20,00,"OW_PATH_07_21");
	TA_GuidePC (20,00,08,00,"OW_PATH_07_21"); 
};

FUNC VOID Rtn_Start_826 ()
{
	TA_Stand (08,00,23,00,"HC_SHOP_01");
	TA_Stand (23,00,08,00,"HC_SHOP_01");
	//TA_Sleep (23,00,08,00,"NC_HUT21_IN"); 
};
FUNC VOID Rtn_Alarm_826 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_RANGED1"); 
	 
};
*/