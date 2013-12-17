instance SLD_703_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLV;       
	level =					18;
	
	voice =					11;
	id =					703;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		 120;
	attribute[ATR_DEXTERITY] =		 70;
	attribute[ATR_MANA_MAX] =		  0;
	attribute[ATR_MANA] =			  0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",53,1,SLD_ARMOR_H);
	
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
	CreateInvItems(self,ItMiNugget,23);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,8);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
		
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_703;
};

FUNC VOID Rtn_NC2_703 ()
{
	TA_SitAround	(07,45,23,45,"NC_PLACE01");
	TA_Sleep		(23,45,07,45,"NC_HUT02_IN");
};



FUNC VOID Rtn_start_703 ()
{
	TA_Guard	(07,45,23,45,"LOCATION_19_03_ENTRANCE_HARPYE3");
	TA_Guard		(23,45,07,45,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

FUNC VOID Rtn_NC1_703 ()
{
	TA_Guard	(07,45,23,45,"NC_PATH86_MOVEMENT");
	TA_Guard		(23,45,07,45,"NC_PATH86_MOVEMENT");
};

FUNC VOID Rtn_NC3_703 ()
{
	TA_Smalltalk		(07,45,23,45,"OW_PATH_1_5_A ");
	TA_Smalltalk			(23,45,07,45,"OW_PATH_1_5_A ");
};


