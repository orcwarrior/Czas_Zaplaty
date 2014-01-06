instance Org_832_Organisator (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Organisator;
	Npctype =				NPCTYPE_AMBIENT;
	guild =					GIL_SLV;       
	level =					5;

	
	voice =					7;
	id =					832;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",11,1,ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);	
	
	//-------- inventory --------                                    

	EquipItem (self,ALL_MW_02);
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,4);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Teeth_01);
	
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_832;

};

FUNC VOID Rtn_start_832 ()
{
	TA_Smalltalk	(20,00,08,00,"OW_PATH_067");
	TA_Smalltalk	(08,00,20,00,"OW_PATH_067");
};


FUNC VOID Rtn_NC1_832 ()
{
	TA_StandAround	(20,00,08,00,"NC_TAVERN_ROOM02");
	TA_StandAround	(08,00,20,00,"NC_TAVERN_ROOM02");
};
FUNC VOID Rtn_NC2_832 ()
{
	TA_Smalltalk	(20,00,08,00,"OW_PATH_067");
	TA_Smalltalk	(08,00,20,00,"OW_PATH_067");
};
