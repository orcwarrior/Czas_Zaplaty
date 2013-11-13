instance STT_340_Lucjusz (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Lucjusz";
	npctype 		=	NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		10;
	
	voice 		=		12;
	id 			=		337;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		40;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		200;
	attribute[ATR_HITPOINTS] 		=		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,3,STT_ARMOR_H);
        
   B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
   //-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_04);
	EquipItem	(self,ItRw_Bow_Small_03);
	CreateInvItems	(self,ItAmArrow,32);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_340;
};

FUNC VOID Rtn_start_340 ()
{
	TA_Sleep		(23,30,08,00,"OCR_HUT_65");
	TA_SitAround	(08,00,13,30,"OCR_OUTSIDE_HUT_65");
	TA_RepairHut	(13,30,19,00,"OCR_OUTSIDE_HUT_65");
	TA_SitAround	(19,00,23,30,"OCR_OUTSIDE_HUT_65");
};
