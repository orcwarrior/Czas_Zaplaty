instance GRD_4056_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	4056;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 170;
	attribute[ATR_HITPOINTS] 	= 170;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",13,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01_short);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4056;
};

FUNC VOID Rtn_start_4056 ()
{
	TA_Guard	(00,00,06,00,"MIS_GRDPATROL1_2");
	TA_Guard	(06,00,24,00,"MIS_GRDPATROL1_2");
};

FUNC VOID Rtn_falow_4056 ()
{
	TA_FollowPC	(00,00,06,00,"MIS_GRDPATROL1_2");
	TA_FollowPC	(06,00,24,00,"MIS_GRDPATROL1_2");
};
FUNC VOID Rtn_back_4056 ()
{
	TA_Stand	(00,00,06,00,"OCR_PALISADE_WALK_45");
	TA_Stand	(06,00,24,00,"OCR_PALISADE_WALK_45");
};

instance GRD_4057_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	18;
	voice		=	6;
	id 			=	4057;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 180;
	attribute[ATR_HITPOINTS] 	= 180;

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
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4057;
};

FUNC VOID Rtn_start_4057 ()
{
	TA_SitCampfire	(00,00,06,00,"MIS_GRDPATROL1_3");
	TA_SitCampfire	(06,00,24,00,"MIS_GRDPATROL1_3");
};

FUNC VOID Rtn_falow_4057 ()
{
	TA_FollowPC	(00,00,06,00,"MIS_GRDPATROL1_1");
	TA_FollowPC	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_back_4057 ()
{
	TA_Stand	(00,00,06,00,"OCR_ARENA_BARONS_HUT_STAIRS_UP");
	TA_Stand	(06,00,24,00,"OCR_ARENA_BARONS_HUT_STAIRS_UP");
};

instance GRD_4058_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	18;
	voice		=	7;
	id 			=	4058;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 208;
	attribute[ATR_HITPOINTS] 	= 208;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,3,"Hum_Head_Thief",1,1,GRD_ARMOR_L);
        
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
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4058;
};

FUNC VOID Rtn_start_4058 ()
{
	TA_SitCampfire	(00,00,06,00,"MIS_GRDPATROL1_3");
	TA_SitCampfire	(06,00,24,00,"MIS_GRDPATROL1_3");
};


FUNC VOID Rtn_falow_4058 ()
{
	TA_FollowPC	(00,00,06,00,"MIS_GRDPATROL1_1");
	TA_FollowPC	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_back_4058 ()
{
	TA_Stand	(00,00,06,00,"OCR_PALISADES_PLATFORM_02");
	TA_Stand	(06,00,24,00,"OCR_PALISADES_PLATFORM_02");
};
instance GRD_4059_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	4059;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",1,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01_short);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4059;
};

FUNC VOID Rtn_start_4059 ()
{
	TA_SitCampfire	(00,00,06,00,"MIS_GRDPATROL1_5");
	TA_SitCampfire	(06,00,24,00,"MIS_GRDPATROL1_5");
};


FUNC VOID Rtn_falow_4059 ()
{
	TA_FollowPC	(00,00,06,00,"MIS_GRDPATROL1_1");
	TA_FollowPC	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_back_4059 ()
{
	TA_Stand	(00,00,06,00,"OCR_PALISADES_PLATFORM_03");
	TA_Stand	(06,00,24,00,"OCR_PALISADES_PLATFORM_03");
};
instance GRD_4060_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	17;
	voice		=	6;
	id 			=	4060;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 210;
	attribute[ATR_HITPOINTS] 	= 210;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",2,1,GRD_ARMOR_L);
        
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
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4060;
};

FUNC VOID Rtn_start_4060 ()
{
	TA_SitCampfire	(00,00,06,00,"MIS_GRDPATROL1_5");
	TA_SitCampfire	(06,00,24,00,"MIS_GRDPATROL1_5");
};


FUNC VOID Rtn_falow_4060 ()
{
	TA_FollowPC	(00,00,06,00,"MIS_GRDPATROL1_1");
	TA_FollowPC	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_back_4060 ()
{
	TA_Stand	(00,00,06,00,"OCR_PALISADES_PLATFORM_05");
	TA_Stand	(06,00,24,00,"OCR_PALISADES_PLATFORM_05");
};
instance GRD_4061_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Duke";
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice		=	7;
	id 			=	4061;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Fighter",4,1,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItems	(self,ItFo_Potion_Health_01,2);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4061;
};

FUNC VOID Rtn_start_4061 ()
{
	//TODO: Add WP 4Him
	TA_Guard (00,00,06,00,"MIS_GRDPATROL1_1");
	TA_Guard	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_falow_4061 ()
{
	TA_DukeFollowPC	(00,00,06,00,"MIS_GRDPATROL1_1");
	TA_DukeFollowPC	(06,00,24,00,"MIS_GRDPATROL1_1");
};
FUNC VOID Rtn_back_4061 ()
{
	TA_Stand	(00,00,06,00,"OCR_PALISADES_PLATFORM_04");
	TA_Stand	(06,00,24,00,"OCR_PALISADES_PLATFORM_04");
};