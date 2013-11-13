instance org_4050_camper1 (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_DMB;      
	level =					8;
	
	voice =					7;
	id =					4050;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	74;
	attribute[ATR_HITPOINTS] =		74;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",6,1,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;			
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
				
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,1);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	EquipItem (self,ALL_MW_01);

	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4050;
	};

FUNC VOID Rtn_start_4050 ()
{
    TA_SitCampfire		(13,00,14,00,"OR_BDT_CAMP_01");	
    TA_SitCampfire		(14,00,13,00,"OR_BDT_CAMP_01");	
};

instance org_4051_camper2 (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_DMB;      
	level =					10;
	
	voice =					13;
	id =					4051;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	104;
	attribute[ATR_HITPOINTS] =		104;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief",35,2,ORG_ARMOR_L);

	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems (self,ItFoRice,5);
	CreateInvItems (self,ItFoBooze,2);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
 	EquipItem (self,ALL_MW_02);		


	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4051;
};

FUNC VOID Rtn_start_4051 ()
{
    TA_SitCampfire		(13,00,14,00,"OR_BDT_CAMP_01");	
    TA_SitCampfire		(14,00,13,00,"OR_BDT_CAMP_01");	
};

instance org_4052_camper3 (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	Npctype =				NPCTYPE_ROGUE;
	guild =						GIL_DMB;      
	level =						10;
	
	voice =						6;
	id =						4052;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	104;
	attribute[ATR_HITPOINTS] =		104;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",37 ,2,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);	
	
	fight_tactic	=	FAI_HUMAN_RANGED;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,11);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,ALL_MW_02);
	

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4052;
};

FUNC VOID Rtn_start_4052 ()
{
    TA_Stand		(13,00,14,00,"OR_BDT_CAMP_01");	
    TA_Stand		(14,00,13,00,"OR_BDT_CAMP_01");	
};

instance org_4053_camper4 (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_DMB;      
	level =					6;
	
	voice =					7;
	id =					4053;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	104;
	attribute[ATR_HITPOINTS] =		104;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fighter",9,3,ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,11);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Claws_01);
	EquipItem (self,ALL_MW_03);
	EquipItem (self,ALL_RW_02);
	CreateInvItems (self,ItAmArrow,20);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4053;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_start_4053 ()
{
    TA_Stand		(13,00,14,00,"OR_BDT_CAMP_01");	
    TA_Stand		(14,00,13,00,"OR_BDT_CAMP_01");	
};
