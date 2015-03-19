instance HUN_729_Kharim (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Kharim";
	Npctype =				Npctype_Main;
	guild =					GIL_HUN;       
	level =					20;
	voice =					9;
	id =					729;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	472;
	attribute[ATR_HITPOINTS] =		472;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",9,1,HUN_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
		
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
	
	//-------- inventory --------                                    

	EquipItem (self,HUN_MW_05);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,19);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_01,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_729;
};

FUNC VOID Rtn_start_729 ()
{
	TA_SitCampfireT		(00,00,07,30,"HC_CAMPFIRE_NO1");
	TA_Boss				(07,30,08,00,"HC_NO_END1");
	TA_Smith_Sharp	(08,00,09,00,"HC_NO_SHARP");
	TA_PracticeSword(09,00,19,00,"HC_PRACTICE2");
	TA_Smith_Sharp	(19,00,20,00,"HC_NO_SHARP");
	TA_SitAround	(20,00,00,00,"KTOS_GO");
};

FUNC VOID Rtn_NC1_729 ()
{
	TA_StandAround(08,00,21,00,"NC_TAVERN_BAR");
   TA_StandAround(21,00,08,00,"NC_TAVERN_BAR");
};

FUNC VOID Rtn_banned_729 ()
{
	TA_Stand(06,35,22,35,"OW_WOODRUIN_WOLF_SPAWN");
   TA_SitCampfire(22,35,06,35,"OW_WOODRUIN_WOLF_SPAWN");
};

func VOID Rtn_Alarm_729 ()
{
   TA_KillingGRDs(08,00,07,59,"HC_WARRIOR3"); 
};

FUNC VOID Rtn_PreGuideMine_729()
{	
	TA_STAND(18,00,19,00,"HC_RICKHOUSE_STAIRS");
	TA_STAND(19,00,18,00,"HC_RICKHOUSE_STAIRS");
};

FUNC VOID Rtn_GuideMine_729()
{	
	TA_FollowCavalorn (18,00,19,00,"OW_OM_ENTRANCE02");
	TA_FollowCavalorn (19,00,18,00,"OW_OM_ENTRANCE02");
};

FUNC VOID Rtn_WaitInCave_729()
{	
	TA_STAND(18,00,19,00,"LOCATION_15_IN_2");
	TA_STAND(19,00,18,00,"LOCATION_15_IN_2");
};

FUNC VOID Rtn_GO_729()
{	
	TA_STAND(18,00,19,00,"OW_PATH_07_21_GUARD_MIDDLE");
	TA_STAND(19,00,18,00,"OW_PATH_07_21_GUARD_MIDDLE");
};
