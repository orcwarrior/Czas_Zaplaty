instance HUN_1422_GorHanis (Npc_Default)
{
	//-------- primary data --------
	name =							"Hanis";
	npctype =						npctype_main;
	guild =							GIL_HUN;
	level =							22;
	voice =							8;
	id =							1422;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	424;
	attribute[ATR_HITPOINTS] =		424;
    protection[PROT_EDGE]	=		20;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",10,1,"Hum_Head_Bald",66,1,HUN_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	
	//-------- inventory --------
	EquipItem (self,HUN_MW_03);	
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_banned_1422;
};

FUNC VOID Rtn_banned_1422 ()
{
	TA_PracticeSword(06,35,15,35,"GUARD");
    TA_Stand    	(15,35,06,35,"GUARD");
};

FUNC VOID Rtn_start_1422 ()
{
	TA_Stand		(06,35,08,35,"HC_BRIDGE_ON");
	TA_PracticeSword (08,35,20,30,"HC_PRACTICE3");
//    TA_Stand    (16,59,20,30,"SIT_HAMIS");
   TA_SitAround    (20,30,22,00,"SIT_MORDRAG");
   TA_Smoke     	(22,00,00,00,"PATCH_OR");
   TA_Sleep        (00,00,06,35,"SLEEP");
};
FUNC VOID Rtn_Alarm_1422 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR1"); 
};
	
FUNC VOID Rtn_PreGuideMine_1422()
{	
	TA_STAND(18,00,19,00,"HC_RICKHOUSE_STAIRS");
	TA_STAND(19,00,18,00,"HC_RICKHOUSE_STAIRS");
};

FUNC VOID Rtn_GuideMine_1422()
{	
	TA_FollowCavalorn (18,00,19,00,"OW_OM_ENTRANCE02");
	TA_FollowCavalorn (19,00,18,00,"OW_OM_ENTRANCE02");
};