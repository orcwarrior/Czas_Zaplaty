instance SLD_704_Blade (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Kosa";
	Npctype =				NPCTYPE_AMBIENT;
	guild =					GIL_SLV;       
	level =					18;
	
	voice =					11;
	id =					704;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",47,2,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_03);
	EquipItem (self,ItRw_Bow_Long_02);
	CreateInvItems(self,ItAmArrow,22);
	CreateInvItems (self,ItFoRice,9);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoBooze,7);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFo_Potion_Health_02,11);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Mug_01);
	CreateInvItem (self,ItMi_Stuff_Amphore_01);
	
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_704;

};

FUNC VOID Rtn_start_704 ()
{
	TA_Guard	   (23,00,07,30,"LOCATION_19_03_ROOM4");
	TA_Guard	(07,30,23,00,"LOCATION_19_03_ROOM4");
};

FUNC VOID Rtn_NC1_704 ()
{
	TA_Guard	   (23,00,07,30,"OW_PATH_07_21_GUARD_MIDDLE");
	TA_Guard	(07,30,23,00,"OW_PATH_07_21_GUARD_MIDDLE");
};

FUNC VOID Rtn_NC2_704 ()
{
	TA_Sleep	    (23,00,07,30,"NC_HUT10_IN");
	TA_Smalltalk	(07,30,23,00,"NC_HUT09_OUT");
};

FUNC VOID Rtn_NC3_704 ()
{
	TA_Guard	   (23,00,07,30,"OW_LEFT_RIGHT_CAMP");
	TA_Guard	(07,30,23,00,"OW_LEFT_RIGHT_CAMP");
};