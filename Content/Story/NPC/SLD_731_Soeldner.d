instance SLD_731_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLV;
	level =					18;
	
	voice =					11;
	id =					731;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",8,0,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_03);
	EquipItem (self,ItRw_Bow_Long_04);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_731;

};

FUNC VOID Rtn_start_731 ()
{
	TA_Guard	(06,00,23,00,"NC_SMALL_CAVE_ENTRANCE_GUARD2");
	TA_Guard	(23,00,06,00,"NC_SMALL_CAVE_ENTRANCE_GUARD2");	
};


FUNC VOID Rtn_NC1_731 ()
{
	TA_Guard	(06,00,23,00,"NC_PATH52");
	TA_Guard	(23,00,06,00,"NC_PATH52");	
};



FUNC VOID Rtn_NC2_731 ()
{
	TA_Guard	(06,00,23,00,"NC_SMALL_CAVE_ENTRANCE_GUARD2");
	TA_Guard	(23,00,06,00,"NC_SMALL_CAVE_ENTRANCE_GUARD2");	
};


FUNC VOID Rtn_NC3_731 ()
{
	TA_Guard	(06,00,23,00,"OW_PATH_1_5_13");
	TA_Guard	(23,00,06,00,"OW_PATH_1_5_13");	
};



