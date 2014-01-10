instance STT_316_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		55;
	
	
	voice 		=		10;
	id 			=		316;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	48;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;	
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",56,1,STT_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0.7);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	EquipItem	(self,STT_RW_01);
	CreateInvItems	(self,ItAmArrow,115);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItems	(self,ItFoBeer,12);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_316;
};

FUNC VOID Rtn_start_316 ()
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_18");
	TA_Smalltalk	(08,00,19,00,"OCR_OUTSIDE_HUT_78");
	TA_ArenaSpectator(19,00,23,00,"OCR_ARENA_09");
};


