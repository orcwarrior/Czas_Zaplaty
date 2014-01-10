instance Stt_342_Harford (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Harford";
	npctype 		=		NPCTYPE_main;
	guild 		=		GIL_GRD;
	level 		=		11;

	
	voice 		=		11;
	id 			=		342;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",81 ,1,STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_03);
	EquipItem	(self,STT_RW_01);
	CreateInvItems	(self,ItAmArrow,20);
	CreateInvItem	(self,ItKeLockpick);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_342;
};

FUNC VOID Rtn_start_342 ()
{
	TA_Sleep	(23,00,07,00,"OCR_HUT_20");             
	TA_Stand	(07,00,23,00,"OCR_OUTSIDE_HUT_20");
};


FUNC VOID Rtn_diegocome_342 ()
{
	TA_Sleep	(23,00,07,00,"OCR_HUT_20");             
	TA_Stand	(07,00,19,30,"OCR_OUTSIDE_HUT_20");
    TA_Smalltalk	(19,30,21,30,"OCR_HUT_Z5");//Diego    
	TA_Stand	(21,30,23,00,"OCR_OUTSIDE_HUT_20");
	
	
};
