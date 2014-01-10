instance SLD_750_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NpcType_MINE_Guard;
	guild =							GIL_SLV;       
	level =							16;
	
	voice =							11;
	id =							750;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",49,1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	
	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_750;

};

FUNC VOID Rtn_FMCstart_750 ()
{
	TA_GuardPalisade	(01,00,13,00,"FMC_PATH19");
	TA_GuardPalisade	(13,00,01,00,"FMC_Path19");
};

FUNC VOID Rtn_NC1_750 ()
{
	TA_Guard	(01,00,13,00,"NC_PATH87");
	TA_Guard	(13,00,01,00,"NC_PATH87");
};


FUNC VOID Rtn_NC2_750 ()
{
	TA_GuardPalisade	(01,00,13,00,"FMC_PATH19");
	TA_GuardPalisade	(13,00,01,00,"FMC_Path19");
};


FUNC VOID Rtn_NC3_750 ()
{
	TA_Guard	(01,00,13,00,"MOVEMENT_OW_BLOODFLY_E_3");
	TA_Guard	(13,00,01,00,"MOVEMENT_OW_BLOODFLY_E_3");
};



