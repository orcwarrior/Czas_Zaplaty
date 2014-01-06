instance Org_838_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Organisator;
	Npctype =						Npctype_Ambient;
	guild =							GIL_SLV;       
	level =							5;
	
	voice =							13;
	id =							838;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		22;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,0,"Hum_Head_FatBald",12 ,2,ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);	
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_01);
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Claws_01);
	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_838;

};

FUNC VOID Rtn_start_838 ()
{
	TA_Sleep			(02,35,08,05,"NC_HUT31_IN");
	TA_Smalltalk		(08,05,18,05,"NC_HUT31_OUT");
	TA_Smalltalk		(18,05,02,35,"NC_TAVERN_TOP02");
};

FUNC VOID Rtn_NC1_838 ()
{
	TA_StandAround			(02,00,08,00,"NC_PATH_PEASANT5");
	TA_StandAround		(08,00,02,00,"NC_PATH_PEASANT5");

};

FUNC VOID Rtn_NC2_838 ()
{
	TA_Sleep			(02,35,08,05,"NC_HUT31_IN");
	TA_Smalltalk		(08,05,18,05,"NC_HUT31_OUT");
	TA_Smalltalk		(18,05,02,35,"NC_TAVERN_TOP02");
};







