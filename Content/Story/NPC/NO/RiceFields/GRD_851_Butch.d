instance GRD_851_Butch (Npc_Default)
{
	//Moved to Ricefields
	//-------- primary data --------
	
	name =							"Butch";
	Npctype =						Npctype_Main;
	guild =							GIL_GRD;      
	level =							20;	
	voice =							12;
	id =							851;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",36,1,GRD_ARMOR_L);

	B_Scale (self);	
	Mdl_SetModelFatness (self,1);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentValue(self,NPC_TALENT_1H,65); 	
	Npc_SetTalentValue(self,NPC_TALENT_2H,65); 	
	Npc_SetTalentValue(self,NPC_TALENT_BOW,60); 	

	//------- Inventory ---------

	CreateInvItems (self,ItKeLockpick,1);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,1);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	EquipItem(self,GRD_MW_04);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_851;
};
	
FUNC VOID Rtn_start_851 ()
{
	TA_StandAround	(19,00,06,00,"FM_111");	
	TA_StandAround	(06,00,19,00,"FM_111");	
};
	
FUNC VOID Rtn_pick_851 ()
{
//***5001
	TA_PickOre		(00,00,23,00,"FM_89");
	TA_PickOre		(23,00,24,00,"FM_89");
};

FUNC VOID Rtn_NC1_851 ()
{
    TA_HostileGuard		(06,00,21,00,"NC_PATH64");
    TA_HostileGuard		(21,00,06,00,"NC_PATH64");			
};
     