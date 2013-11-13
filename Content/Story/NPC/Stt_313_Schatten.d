instance STT_313_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 	=		NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		8;
	
	
	voice 		=		12;
	id 			=		313;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		35;
	attribute[ATR_DEXTERITY] 		=		28;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		98;
	attribute[ATR_HITPOINTS] 		=		98;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",58,3,STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1.1);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
        
    	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_03);
	EquipItem	(self,ItRw_Bow_Small_03);
	CreateInvItems	(self,ItAmArrow,12);
	CreateInvItems	(self,ItFo_Potion_Water_01,6);
	CreateInvItems	(self,ItFoApple,8);
	CreateInvItem	(self,ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_313;
};

FUNC VOID Rtn_start_313 ()
{
	TA_Sleep		(23,00,07,30,"OCR_HUT_26");
	TA_SitAround	(07,30,10,00,"OCR_OUTSIDE_HUT_16");
	TA_RepairHut	(10,00,11,00,"OCR_OUTSIDE_HUT_46");
	TA_SitAround	(11,00,13,00,"OCR_OUTSIDE_HUT_66");
	TA_Sleep		(13,00,14,30,"OCR_HUT_26");
	TA_SitAround	(14,30,15,00,"OCR_OUTSIDE_HUT_16");
	TA_RepairHut	(15,00,17,00,"OCR_OUTSIDE_HUT_46");
	TA_SitAround	(17,00,20,00,"OCR_OUTSIDE_HUT_66");
	TA_PracticeSword	(20,00,23,00,"OCR_OUTSIDE_HUT_71");
};
