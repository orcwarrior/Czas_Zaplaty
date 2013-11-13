instance GRD_2514_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_NONE;
	level 		=	15;
	voice 		=	13;
	id 			=	2514;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",13,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2514;
};

FUNC VOID Rtn_start_2514 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_223");
	TA_Guard	(06,00,24,00,"OW_PATH_223");
};


FUNC VOID Rtn_HIDE_2514 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_2514 ()
{
	TA_Guard	(00,00,06,00,"PATH_CASTLE_TO_WATERFALL");
	TA_Guard	(06,00,24,00,"PATH_CASTLE_TO_WATERFALL");
};

FUNC VOID Rtn_OR4_2514 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_175_GATE1");
	TA_Guard	(06,00,24,00,"OW_PATH_175_GATE1");
};


FUNC VOID Rtn_RIT_2514 ()
{
	TA_HostileGuard		    (07,00,20,00,"RIT2");
	TA_HostileGuard		    (20,00,07,00,"RIT2");
};



instance GRD_2515_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_NONE;
	level 		=	18;
	voice		=	7;
	id 			=	2515;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",3,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2515;
};

FUNC VOID Rtn_start_2515 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_222");
	TA_Guard	(06,00,24,00,"OW_PATH_222");
};

FUNC VOID Rtn_HIDE_2515 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_2515 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_108");
	TA_Guard	(06,00,24,00,"OW_PATH_108");
};

FUNC VOID Rtn_OR4_2515 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_175_GATE2");
	TA_Guard	(06,00,24,00,"OW_PATH_175_GATE2");
};


FUNC VOID Rtn_RIT_2515 ()
{
	TA_HostileGuard		    (07,00,20,00,"RIT3");
	TA_HostileGuard		    (20,00,07,00,"RIT3");
};



instance GRD_2516_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_NONE;
	level 		=	18;
	voice		=	7;
	id 			=	2516;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",12,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2516;
};

FUNC VOID Rtn_start_2516 ()
{
	TA_Guard	(00,00,06,00,"OW_PSIWOOD_MOVEMENT8");
	TA_Guard	(06,00,24,00,"OW_PSIWOOD_MOVEMENT8");
};

FUNC VOID Rtn_HIDE_2516 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};


FUNC VOID Rtn_OR3_2516 ()
{
	TA_Guard	(00,00,06,00,"CASTLE_7");
	TA_Guard	(06,00,24,00,"CASTLE_7");
};

FUNC VOID Rtn_OR4_2516 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_175_MEATBUG_GATE2");
	TA_Guard	(06,00,24,00,"OW_PATH_175_MEATBUG_GATE2");
};


FUNC VOID Rtn_RIT_2516 ()
{
	TA_HostileGuard		    (07,00,20,00,"RIT4");
	TA_HostileGuard		    (20,00,07,00,"RIT4");
};


instance GRD_2517_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_NONE;
	level 		=	15;
	voice 		=	13;
	id 			=	2517;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",15,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01_short);
	EquipItem	(self,GRD_RW_01);

	CreateInvItems	(self,ItAmBolt,70);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2517;
};

FUNC VOID Rtn_start_2517 ()
{
	TA_Guard	(00,00,06,00,"OW_PSIWOOD_MOVEMENT7");
	TA_Guard	(06,00,24,00,"OW_PSIWOOD_MOVEMENT7");
};

FUNC VOID Rtn_HIDE_2517 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_2517 ()
{
	TA_Guard	(00,00,06,00,"CASTLE_8");
	TA_Guard	(06,00,24,00,"CASTLE_8");
};

FUNC VOID Rtn_OR4_2517 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_176");
	TA_Guard	(06,00,24,00,"OW_PATH_176");
};


FUNC VOID Rtn_RIT_2517 ()
{
	TA_HostileGuard		    (07,00,20,00,"RIT5");
	TA_HostileGuard		    (20,00,07,00,"RIT5");
};


instance GRD_2518_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_NONE;
	level 		=	15;
	voice		=	7;
	id 			=	2518;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",3,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01_short);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2518;
};

FUNC VOID Rtn_start_2518 ()
{
	TA_Guard	(00,00,06,00,"OW_PATH_222");
	TA_Guard	(06,00,24,00,"OW_PATH_222");
};

FUNC VOID Rtn_HIDE_2518 ()
{
	TA_Guard	(00,00,06,00,"WP_INTRO_WI05");
	TA_Guard	(06,00,24,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_2518 ()
{
	TA_Guard	(00,00,06,00,"CASTLE_9");
	TA_Guard	(06,00,24,00,"CASTLE_9");
};
FUNC VOID Rtn_OR4_2518 ()
{
	TA_Guard	(00,00,06,00,"LOCATION_28_01");
	TA_Guard	(06,00,24,00,"LOCATION_28_01");
};
FUNC VOID Rtn_RIT_2518 ()
{
	TA_HostileGuard		    (07,00,20,00,"RIT6");
	TA_HostileGuard		    (20,00,07,00,"RIT6");
};
