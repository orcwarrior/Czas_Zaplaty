instance HUN_858_Quentin (Npc_Default)
{
	//-------- primary data --------

	name =					"Quentin";
	Npctype =				Npctype_Main;
	guild =					GIL_HUN;
	level =					23;

	voice =					7;
	id =					858;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		95;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	90+self.level*12;
	attribute[ATR_HITPOINTS] =		90+self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,head mesh,hairmesh,face-tex,hair-tex,skin
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Pony",8,1,HUN_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness (self,0);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);

	//-------- inventory --------
	EquipItem (self,HUN_MW_03AXE);
	EquipItem (self,HUN_RW_03);
	CreateInvItems (self,ItKeLockpick,1);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	CreateInvItems (self,ItAmArrow,20);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_858;
};

FUNC VOID Rtn_start_858 ()
{
   TA_PracticeSword	(03,00,08,15,"WP_QUENTIN_PRACTICE");
   TA_Boss           	(08,15,10,15,"WP_QUENTIN_PRACTICE");
   TA_Stand           	(10,15,12,00,"WP_QUENTIN_PRACTICE");
   TA_Boss           	(12,00,13,00,"WP_QUENTIN_PRACTICE");
   TA_SitAround     	(13,00,17,00,"HC_SAWHUT_SIT1");
   TA_Boss           	(17,00,21,00,"WP_QUENTIN_PRACTICE");
   TA_RepairHut		(21,00,22,50,"QUENTIN_REPAIR");
   TA_Stand			(22,50,00,00,"TAVERNE12");
   TA_Smoke    		(00,00,03,00,"PATCHH");
};

FUNC VOID Rtn_OMFull_858 ()
{
	TA_StandAround		(13,00,14,00,"LOCATION_11_13");
   TA_StandAround		(14,00,13,00,"LOCATION_11_13");
};

Func Void Rtn_Alarm_858 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR5");
};

FUNC VOID Rtn_Challenge_858 ()
{
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};

Func Void Rtn_Fan_858 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_4");
};

FUNC VOID Rtn_mourder_858 ()
{
   Ta_Stand(0,00,12,00,"QIN_M");
   Ta_Stand(12,00,0,00,"QIN_M");
};

FUNC VOID Rtn_FOLLOW_858 ()
{
   TA_FollowPC(04,00,11,00,"HC_HUTIN_XX");
   TA_FollowPC(11,00,00,00,"HELPPOINT8");
   TA_FollowPC(00,00,04,00,"SIT_IDDYLLUS");
};

