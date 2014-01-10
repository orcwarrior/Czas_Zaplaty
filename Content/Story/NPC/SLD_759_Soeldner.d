instance SLD_759_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_MINE_GUARD;
	guild =					GIL_SLV;       
	level =					16;
	
	voice =					8;
	id =					759;

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

	EquipItem (self,MTR_MW_01);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,9);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,5);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,7);
	CreateInvItems (self,ItFo_Potion_Health_02,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMCstart_759;
};

FUNC VOID Rtn_FMCstart_759 ()
{
	TA_GuardPassage	(01,00,13,00,"FMC_PATH26");
	TA_GuardPassage	(13,00,01,00,"FMC_PATH26");
};


FUNC VOID Rtn_NC1_759 ()
{
	TA_Guard	(01,00,13,00,"NC_TAVERN_BACKROOM05");
	TA_Guard	(13,00,01,00,"NC_TAVERN_BACKROOM05");
};

FUNC VOID Rtn_NC2_759 ()
{
	TA_GuardPassage	(01,00,13,00,"FMC_PATH26");
	TA_GuardPassage	(13,00,01,00,"FMC_PATH26");
};

FUNC VOID Rtn_NC3_759 ()
{
	TA_Guard	(01,00,13,00,"LOCATION_15_IN_2");
	TA_Guard	(13,00,01,00,"LOCATION_15_IN_2");
};
