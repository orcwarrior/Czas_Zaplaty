instance RBL_4011_Leaf (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Leaf";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		15;

	voice 		=		11;
	id 			=		4011;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",106,2,RBL_ARMOR_L);

        B_Scale (self);
	Mdl_SetModelFatness(self,1);

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);

	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentValue(self,NPC_TALENT_2H,85);

	//-------- inventory --------
	EquipItem 	(self,RBL_MW_04);
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4011;
};

FUNC VOID Rtn_start_4011 ()
{
   TA_Sleep(04,00,11,00,"HC_HUTIN_XX");
   TA_Stand(11,00,00,00,"HELPPOINT8");
   TA_Smoke(00,00,04,00,"SIT_IDDYLLUS");
};

FUNC VOID Rtn_PREPARATION_4011 ()
{
   TA_Sleep(04,00,11,00,"HC_HUTIN_XX");
   TA_Smoke(11,00,12,00,"SIT_IDDYLLUS");
   TA_PRACTICESWORD(12,00,20,05,"HC_PRACTICE7");
	TA_Stand(20,05,21,05,"HELPPOINT8");
   TA_PRACTICESWORD(21,05,01,00,"HC_PRACTICE7");
};

FUNC VOID Rtn_Challenge_4011 ()
{
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};

Func Void Rtn_Fan_4011 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_3");
};

Func Void Rtn_Alarm_4011 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR19");
};

FUNC void Rtn_DRAINED_4011 ()
{
   TA_Drained_YBerion(04,00,11,00,"HC_HUTIN_XX");
   TA_Drained_YBerion(11,00,00,00,"HELPPOINT8");
   TA_Drained_YBerion(00,00,04,00,"SIT_IDDYLLUS");
};
