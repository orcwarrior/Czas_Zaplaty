instance STT_315_Sly (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Z?y";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_GRD;
	level 		=		115;
	
	
	voice 		=		10;
	id 			=		315;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER|NPC_FLAG_TALKONLY;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		70;
	attribute[ATR_DEXTERITY] 		=		60;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		300;
	attribute[ATR_HITPOINTS] 		=		300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",55,2,GRD_ARMOR_H);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItems	(self,ItAmArrow,26);
	CreateInvItem	(self,ItKeLockpick);
	CreateInvItem (self,sly_head);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_315;
};

FUNC VOID Rtn_start_315 ()
{
	TA_Boss	(00,00,06,00,"SPAWN_PATH_GUARD1");
	TA_Boss	(06,00,24,00,"SPAWN_PATH_GUARD1");
};

