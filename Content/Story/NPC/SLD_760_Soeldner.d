instance SLD_760_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLV;       
	level =					18;
	
	voice =					13;
	id =					760;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		 90;
	attribute[ATR_DEXTERITY] =		 70;
	attribute[ATR_MANA_MAX] =		  0;
	attribute[ATR_MANA] =			  0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,53	hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",104,1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1H_Mace_War_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,23);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
		
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_760;
	
	//-------------Misions-------------------

};

FUNC VOID Rtn_FMCstart_760 ()
{
	TA_GuardPassage	(01,00,13,00,"FMC_PATH25");
	TA_GuardPassage	(13,00,01,00,"FMC_PATH25");
};


FUNC VOID Rtn_NC1_760 ()
{
	TA_SmallTalk	(01,00,13,00,"NC_TAVERN_TOP02");
	TA_SmallTalk	(13,00,01,00,"NC_TAVERN_TOP02");
};



FUNC VOID Rtn_NC2_760 ()
{
	TA_GuardPassage	(01,00,13,00,"FMC_PATH25");
	TA_GuardPassage	(13,00,01,00,"FMC_PATH25");
};


FUNC VOID Rtn_NC3_760 ()
{
	TA_FollowPC		(02,00,14,00,"NC_EN1_CROSSING");	
	TA_FollowPC		(14,00,02,00,"NC_EN1_CROSSING");
};

FUNC VOID Rtn_NC4_760 ()
{
	TA_Guard		(02,00,14,00,"NC_EN1_CROSSING");	
	TA_Guard		(14,00,02,00,"NC_EN1_CROSSING");
};

FUNC VOID Rtn_NC5_760 ()
{
	TA_Guard		(02,00,14,00,"MERC_WP6");	
	TA_Guard		(14,00,02,00,"MERC_WP6");
};




