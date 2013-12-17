instance SLD_730_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	npctype = 						Npctype_ambient;
	guild =					GIL_SLV;       
	level =					18;
	
	voice =					11;
	id =					730;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",36,2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);

	
	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1H_Mace_War_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
		
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_730;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_start_730 ()
{
	TA_Sleep		(23,00,08,00,"NC_HUT10_IN");
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
};

FUNC VOID Rtn_NC2_730 ()
{
	TA_Sleep		(23,00,08,00,"NC_HUT10_IN");
	TA_Smalltalk	(08,00,23,00,"NC_HUT04_OUT");
};

FUNC VOID Rtn_KILL_730 ()
{
	TA_Smoke	(00,00,10,00,"OCR_TOWERRUIN_TOP");	// FP "SIT"
	TA_SitAround	(10,00,12,00,"OCR_OUTSIDE_HUT_54");	// FP "SIT"
	TA_SitAround	(12,00,13,00,"OCC_MAINGATE_TALK");
	TA_SitAround	(13,00,15,00,"OCR_HUT_63");
	TA_Smoke	(15,00,17,00,"OCR_OUTSIDE_HUT_31");	// FP "SIT"
	TA_Smoke	(17,00,21,00,"OCC_MAINGATE_TALK");
	TA_SLEEP	(21,00,00,00,"OCR_OUTSIDE_HUT_14");

};

FUNC VOID Rtn_NC1_730 ()
{
	TA_Guard		(23,00,08,00,"NC_PATH54");
	TA_Guard	 	(08,00,23,00,"NC_PATH54");
};

FUNC VOID Rtn_NC3_730 ()
{
	TA_Guard		(23,00,08,00,"OW_PATH_1_5_13");
	TA_Guard	 	(08,00,23,00,"OW_PATH_1_5_13");
};



