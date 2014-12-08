instance STT_337_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=	NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		25;
	
	
	voice 		=		12;
	id 			=		337;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		120;
	attribute[ATR_DEXTERITY] 		=		120;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		900;
	attribute[ATR_HITPOINTS] 		=		900;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",58,3,STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
    	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_HSword_Short_11); // 'Unique'
	EquipItem	(self,STT_RW_01);
	CreateInvItems	(self,ItAmArrow,12);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_FMstart_337;
};

FUNC VOID Rtn_FMstart_337 ()
{
	TA_RoastScavenger (0,00,13,00,"FM_157");
	TA_RoastScavenger (13,00,00,00,"FM_157");
};
