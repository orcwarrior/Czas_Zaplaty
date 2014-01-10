instance SLD_756_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLV;       
	level =					16;
	voice =					8;
	id =					756;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,SLD_ARMOR_M);
	
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
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoLoaf,6);
	CreateInvItems (self,ItFoMutton,6);
	CreateInvItems(self,ItMiNugget,16);
	CreateInvItems (self,ItFoBooze,6);
	CreateInvItems (self,ItLsTorch,6);
	CreateInvItems (self,ItFo_Potion_Health_02,6);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Mug_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_756;
};

FUNC VOID Rtn_FMCstart_756 ()
{
	TA_Guard	(01,00,13,00,"FMC_PATH02");
	TA_Guard	(13,00,01,00,"FMC_PATH02");
};

FUNC VOID Rtn_NC1_756 ()
{
	TA_Guard	(01,00,13,00,"NC_LO_11");
	TA_Guard	(13,00,01,00,"NC_LO_11");
};

FUNC VOID Rtn_NC2_756 ()
{
	TA_Guard	(01,00,13,00,"FMC_PATH02");
	TA_Guard	(13,00,01,00,"FMC_PATH02");
};

FUNC VOID Rtn_NC3_756 ()
{
	TA_FollowPC		(02,00,14,00,"NC_WATERFALL_TOP01_MOVEMENT");	
	TA_FollowPC		(14,00,02,00,"NC_WATERFALL_TOP01_MOVEMENT");
};

FUNC VOID Rtn_NC4_756 ()
{
	TA_Guard		(02,00,14,00,"NC_WATERFALL_TOP01_MOVEMENT");	
	TA_Guard		(14,00,02,00,"NC_WATERFALL_TOP01_MOVEMENT");
};

FUNC VOID Rtn_NC5_756 ()
{
	TA_Guard		(02,00,14,00,"SPAWN_OW_SMALLCAVE01_MOLERAT");	
	TA_Guard		(14,00,02,00,"SPAWN_OW_SMALLCAVE01_MOLERAT");
};
