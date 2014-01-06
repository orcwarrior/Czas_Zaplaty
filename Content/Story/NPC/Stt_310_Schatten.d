instance STT_310_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		10;
	
	voice 		=		12;
	id 			=		310;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	25;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	110;
	attribute[ATR_HITPOINTS] 		=	110;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,HUNSTT_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,STT_MW_02);
	EquipItem	(self,ItRw_Bow_Long_01);
	CreateInvItems	(self,ItAmArrow,10);
	CreateInvItemS	(self,ItFo_Potion_Water_01,5);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_310;
};

FUNC VOID Rtn_start_310 ()
{
	TA_Sleep			(22,00,07,00,"OCR_HUT_8");
	TA_Smalltalk		(07,00,11,00,"OCR_OUTSIDE_HUT_7");
	TA_StandAround		(11,00,20,05,"OCR_COOK_AT_HUT_10");
	TA_Smalltalk		(20,05,22,00,"OCR_OUTSIDE_HUT_7");
};



