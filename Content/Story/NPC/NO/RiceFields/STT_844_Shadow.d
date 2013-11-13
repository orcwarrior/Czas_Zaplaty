instance STT_844_Shadow (Npc_Default)
{
	//-------- primary data --------
	
	name =						NAME_Schatten;
	Npctype =					NPCTYPE_AMBIENT;	
	guild =						GIL_GRD;      
	level =						10;
	voice =						7;
	id =						844;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief",102,2,STT_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,5);
	CreateInvItems (self,ItFoRice,3);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,STT_MW_02);
	EquipItem (self,STT_RW_02);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);	
	CreateInvItems (self,ItAmArrow,20);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_844;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_844 ()
{
	TA_SitCampfire 	(19,00,08,00,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");

};



FUNC VOID Rtn_NC1_844 ()
{
	TA_HostileGuard 	(19,00,08,00,"NC_PLACE01");
	TA_HostileGuard 	(08,00,19,00,"NC_PLACE01");

};







