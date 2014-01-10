instance SLD_705_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLV;       
	level =					16;
	
	voice =					8;
	id =					705;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =	    55;
	attribute[ATR_MANA_MAX] =		 0;
	attribute[ATR_MANA] =			 0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",50,2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_02);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_705;

};

FUNC VOID Rtn_NC2_705()
{
	TA_Smith_Sharp 	(08,00,00,00,"NC_HUT03_OUT_MOVEMENT");
	TA_Sleep		(00,00,08,00,"NC_HUT03_IN");
};
	
FUNC VOID Rtn_start_705()
{
	TA_Guard 	(08,00,00,00,"LOCATION_19_03_ENTRANCE_HARPYE");
	TA_Guard		(00,00,08,00,"LOCATION_19_03_ENTRANCE_HARPYE");
};
	
FUNC VOID Rtn_NC1_705()
{
	TA_Guard 	(08,00,00,00,"PATH_OC_NC_27A");
	TA_Guard		(00,00,08,00,"PATH_OC_NC_27A");
};


FUNC VOID Rtn_NC3_705()
{
	TA_Guard 	(08,00,00,00,"OW_PATH_1_5");
	TA_Guard		(00,00,08,00,"OW_PATH_1_5");
};


