instance SLD_723_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_GUARD;
	guild =							GIL_SLV;       
	level =							18;
	
	voice =							11;
	id =							723;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",48,1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_02);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoLoaf,6);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,22);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,7);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
		

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_723;

};

FUNC VOID Rtn_NC2_723 ()
{
	TA_GuardPassage	(08,00,22,00,"NC_GUARD_MAGES_LEFT");
	TA_GuardPassage	(22,00,08,00,"NC_GUARD_MAGES_LEFT");
};


FUNC VOID Rtn_start_723 ()
{
	TA_Guard	(08,00,22,00,"LOCATION_19_03_SECOND_HARPYE3");
	TA_Guard	(22,00,08,00,"LOCATION_19_03_SECOND_HARPYE3");
};


FUNC VOID Rtn_NC1_723 ()
{
	TA_Smalltalk	(08,00,22,00,"OW_PATH_069");
	TA_Smalltalk	(22,00,08,00,"OW_PATH_069");
};




