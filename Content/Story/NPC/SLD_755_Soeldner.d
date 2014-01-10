instance SLD_755_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_MINE_GUARD;
	guild =							GIL_SLV;       
	level =							16;
	
	voice =							8;
	id =							755;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,3,"Hum_Head_FatBald",9 ,2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
		
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_02);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoBooze,6);
	CreateInvItems (self,ItLsTorch,6);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_755;
	
};

FUNC VOID Rtn_FMCstart_755 ()
{
	TA_GuardPalisade (01,00,13,00,"FMC_HUT12_OUT");
	TA_GuardPalisade (13,00,01,00,"FMC_HUT12_OUT");
};

FUNC VOID Rtn_NC1_755 ()
{
	TA_Guard (01,00,13,00,"NC_LO_05");
	TA_Guard (13,00,01,00,"NC_LO_05");
};


FUNC VOID Rtn_NC2_755 ()
{
	TA_GuardPalisade (01,00,13,00,"FMC_HUT12_OUT");
	TA_GuardPalisade (13,00,01,00,"FMC_HUT12_OUT");
};

FUNC VOID Rtn_NC3_755 ()
{
	TA_FollowPC		(02,00,14,00,"NC_WATERFALL_TOP02");	
	TA_FollowPC		(14,00,02,00,"NC_WATERFALL_TOP02");
};

FUNC VOID Rtn_NC4_755 ()
{
	TA_Guard		(02,00,14,00,"NC_WATERFALL_TOP02");	
	TA_Guard		(14,00,02,00,"NC_WATERFALL_TOP02");
};

FUNC VOID Rtn_NC5_755 ()
{
	TA_Guard		(02,00,14,00,"SPAWN_OW_SMALLCAVE01_MOLERAT");	
	TA_Guard		(14,00,02,00,"SPAWN_OW_SMALLCAVE01_MOLERAT");
};
