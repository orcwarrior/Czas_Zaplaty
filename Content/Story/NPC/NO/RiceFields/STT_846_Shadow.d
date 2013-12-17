instance STT_846_Shadow (Npc_Default)
{
	//-------- primary data --------
	
	name =			NAME_Schatten;
	Npctype =		NPCTYPE_AMBIENT;
	guild =			GIL_GRD;       
	level =			5;
	
	voice =			7;
	id =			846;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		22;
	attribute[ATR_DEXTERITY] =		45;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,2,"Hum_Head_FatBald",11 ,2,STT_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);	
	
	//-------- inventory --------                                    

	EquipItem (self,STT_MW_01);
	EquipItem (self,STT_RW_01);
	CreateInvItems (self,ItAmArrow,20);	
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,9);
	CreateInvItems (self,ItFoRice,1);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);	

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_846;

};

FUNC VOID Rtn_start_846 ()
{
	TA_SitCampfire 	(20,15,08,15,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,15,20,15,"NC_PATH53");
	
};



FUNC VOID Rtn_NC1_846 ()
{
	TA_HostileGuard 	(19,00,08,00,"NC_HUT03_OUT_MOVEMENT");
	TA_HostileGuard 	(08,00,19,00,"NC_HUT03_OUT_MOVEMENT");

};








