instance STT_324_Balam (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Balam";
	npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_GRD;
	level 		=		15;
	
	voice 		=		4;
	id 			=		324;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	65;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	400;
	attribute[ATR_HITPOINTS] 		=	400;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							body mesh,bdytex,skin,head mesh,headtex,teethtex,ruestung
	Mdl_SetVisualBody 	(self,"Hum_Body_CookSmith",0,1,"Hum_Head_Fighter",15,1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	EquipItem	(self,ALL_MW_05);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_324;
};

FUNC VOID Rtn_start_324 ()
{
	TA_Cook		(10,00,12,01,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(12,01,16,00,"OCR_CAULDRON_2");
	TA_Cook		(16,00,18,00,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(18,00,20,00,"OCC_KITCHEN");
	TA_Smoke	(20,00,24,00,"OCR_LAKE_3");
	TA_Cook		(24,00,10,00,"OCR_CAULDRON_2");
};

FUNC VOID Rtn_diegocome_324 ()
{
	TA_Cook		(10,00,12,01,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(12,01,16,00,"OCR_CAULDRON_2");
   TA_Smalltalk (15,30,18,30,"OCR_HUT_Z5");//Diego	
	TA_Cook		(18,00,20,00,"OCC_KITCHEN");
	TA_Smoke	(20,00,24,00,"OCR_LAKE_3");
	TA_Cook		(24,00,10,00,"OCR_CAULDRON_2");
};
