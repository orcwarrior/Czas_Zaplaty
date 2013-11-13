instance GRD_2520_Thug (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bandzior";
	Npctype =						Npctype_Main;
	guild =							GIL_GRD;      
	level =							11;
	voice =							13;
	id =							2520;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",98,1,GRD_ARMOR_L);

	B_Scale (self);	
	Mdl_SetModelFatness (self,1);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentValue(self,NPC_TALENT_1H,65); 	
	Npc_SetTalentValue(self,NPC_TALENT_2H,35); 	
	Npc_SetTalentValue(self,NPC_TALENT_BOW,60); 	

	//------- Inventory ---------

	CreateInvItems (self,ItFoRice,3);
	CreateInvItems (self,ItFoBeer,1);
	CreateInvItem (self,ItFoMutton);
	EquipItem 		(self,GRD_MW_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2520;
};

FUNC VOID Rtn_start_2520 ()
{
	TA_SitCampfire	(10,15,15,00,"PATH_OC_NC_27A");	
	TA_SitCampfire	(15,00,10,15,"PATH_OC_NC_27A");	
};