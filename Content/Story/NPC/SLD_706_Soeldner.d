instance SLD_706_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NpcType_Guard;
	guild =							GIL_SLV;       
	level =							18;
	
	voice =							11;
	id =							706;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",49,1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self,ItMw_1H_Mace_War_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,6);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoBooze,4);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,9);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
		

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_706;

};

FUNC VOID Rtn_NC2_706 ()
{
	TA_StandAround	(07,30,00,00,"NC_HUT02_OUT");
	TA_Sleep		(00,00,07,30,"NC_HUT02_IN");
};

FUNC VOID Rtn_start_706 ()
{
	TA_Guard	(07,30,00,00,"LOCATION_19_03_PEMTAGRAM_ENTRANCE");
	TA_Guard		(00,00,07,30,"LOCATION_19_03_PEMTAGRAM_ENTRANCE");
};


FUNC VOID Rtn_NC1_706 ()
{
	TA_Guard	(07,30,00,00,"PATH_OC_NC_27B");
	TA_Guard		(00,00,07,30,"PATH_OC_NC_27B");
};


FUNC VOID Rtn_NC3_706 ()
{
	TA_Guard	(07,30,00,00,"OW_LEFT_RIGHT_CAMP");
	TA_Guard		(00,00,07,30,"OW_LEFT_RIGHT_CAMP");
};




