instance GRD_2512_Kam (Npc_Default)
{
	//Moved to Ricefields
	//-------- primary data --------
	
	name =							"Kam";
	Npctype =						Npctype_Main;
	guild =							GIL_NONE;      
	level =							14;
	voice =							13;
	id =							2512;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Bald",8,1,GRD_ARMOR_M);

	B_Scale (self);	
	Mdl_SetModelFatness (self,1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentValue(self,NPC_TALENT_1H,65); 	
	Npc_SetTalentValue(self,NPC_TALENT_2H,35); 	
	Npc_SetTalentValue(self,NPC_TALENT_BOW,60); 	

	//------- Inventory ---------

	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,63);
	CreateInvItems (self,ItFoRice,3);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItFoBeer,1);
	CreateInvItems (self,ItFo_Potion_Health_01,2);
	CreateInvItem (self,ItFoMutton);
	EquipItem 		(self,GRD_MW_03);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2512;
};

FUNC VOID Rtn_start_2512 ()
{
	TA_Kam_Bully	(10,15,15,00,"PATH_OC_NC_27A");	
	TA_Kam_Bully	(15,00,10,15,"PATH_OC_NC_27A");	
};