instance Stt_339_Cooper (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Cooper";
	npctype 		=	NPCTYPE_main;
	guild 		=		GIL_GRD;
	level 		=		15;

	voice 		=		12;
	id 			=		339;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	51;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	224;
	attribute[ATR_HITPOINTS] 		=	224;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Pony",93 ,1,STT_ARMOR_H);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	EquipItem	(self,ItRw_Bow_Long_02);
	CreateInvItems	(self,ItAmArrow,20);
	CreateInvItem	(self,ITKECOOPERKEY);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_339;
};

FUNC VOID Rtn_start_339 ()	//FM
{
	TA_Sleep	    (00,30,05,30,"OCR_HUT_1");
	TA_Sleep		(05,30,07,00,"OCR_CAULDRON_1");
	TA_SitAround	(07,00,10,00,"OCR_CAULDRON_1");
	TA_Smalltalk	(10,00,12,01,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Grim
	TA_Stand(12,02,14,01,"OCR_CAULDRON_1");
	TA_Stand(14,02,16,00,"OCR_OUTSIDE_HUT_2");
	TA_Smalltalk	(16,00,18,00,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Stt_322
	TA_SitCampfire	(18,00,23,00,"OCR_CAMPFIRE_A_MOVEMENT1");	
	TA_SitCampfire	(18,00,23,01,"OCR_CAMPFIRE_A_MOVEMENT1");	
	TA_Stand(23,02,00,30,"OCR_OUTSIDE_HUT_2");
};

FUNC VOID Rtn_GoToJail_339 ()	//FM
{
	TA_Stand(12,00,24,00,"OCC_CELLAR_BACK_LEFT_CELL");
	TA_Stand(24,00,12,00,"OCC_CELLAR_BACK_LEFT_CELL");
};
