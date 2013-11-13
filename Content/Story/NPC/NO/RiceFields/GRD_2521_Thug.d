instance GRD_2521_Thug (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Bandzior";
	Npctype =						Npctype_Main;
	guild =							GIL_GRD;      
	level =							9;
	
	voice =							10;
	id =							2521;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Thief",8,1,STT_ARMOR_H);

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
	EquipItem 		(self,STT_MW_02);
	EquipItem 		(self,STT_RW_02);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2521;
	};
FUNC VOID Rtn_start_2521 ()
{
	TA_SitCampfire	(10,15,15,00,"PATH_OC_NC_27B");	
	TA_SitCampfire	(15,00,10,15,"PATH_OC_NC_27B");	
};