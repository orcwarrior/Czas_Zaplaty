instance Stt_338_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=	NPCTYPE_AMBIENT	;
	guild 		=		GIL_GRD;
	level 		=		7;

	
	voice 		=		12;
	id 			=		338;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	38;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	9124;
	attribute[ATR_HITPOINTS] 		=	9124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Psionic",94 ,1,STT_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
		
	//-------- inventory --------
	
	EquipItem	(self,STT_MW_01);
	EquipItem	(self,STT_RW_01);
	CreateInvItems	(self,ItAmArrow,20);
	CreateInvItem	(self,ItKeLockpick);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMstart_338;
};

FUNC VOID Rtn_FMstart_338 ()	//FM
{
	TA_SitAround (0,00,13,00,"FM_162");
	TA_SitAround (13,00,00,00,"FM_162");
};


