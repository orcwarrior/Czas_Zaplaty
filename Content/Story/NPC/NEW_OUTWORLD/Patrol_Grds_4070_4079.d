instance GRD_4070_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_DMB;
	level 		=	15;
	voice 		=	13;
	id 			=	4070;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 120;
	attribute[ATR_HITPOINTS] 	= 120;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",13,1,GRD_ARMOR_M);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,0);
    	
   fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,30);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4070;
};


instance GRD_4071_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	18;
	voice		=	7;
	id 			=	4071;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 180;
	attribute[ATR_HITPOINTS] 	= 180;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",8,1,GRD_ARMOR_L);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,1);
    	
   fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4071;
};

instance GRD_4072_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	18;
	voice		=	7;
	id 			=	4072;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,3,"Hum_Head_Fighter",6,1,GRD_ARMOR_L);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,1);
    	
   fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4072;
};

instance GRD_4073_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	21;
	voice		=	7;
	id 			=	4073;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 228;
	attribute[ATR_HITPOINTS] 	= 228;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,2,"Hum_Head_Fighter",2,1,GRD_ARMOR_M);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,1);
    	
   fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 	

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4073;
};

instance GRD_4074_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	22;
	voice		=	7;
	id 			=	4074;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Thief",9,1,GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMiNugget,60);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4074;
};

instance GRD_4075_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_DMB;
	level 		=	15;
	voice 		=	13;
	id 			=	4075;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 60;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 140;
	attribute[ATR_HITPOINTS] 	= 140;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Fatbald",5,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);	
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,30);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4075;
};


instance GRD_4076_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	18;
	voice		=	7;
	id 			=	4076;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 120;
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
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoBeer);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_02);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4076;
};



instance GRD_4077_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	18;
	voice		=	7;
	id 			=	4077;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,3,"Hum_Head_Fatbald",1,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4077;
};

instance GRD_4078_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	21;
	voice		=	7;
	id 			=	4078;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 248;
	attribute[ATR_HITPOINTS] 	= 248;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,1,"Hum_Head_Bald",18,1,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	CreateInvItems	(self,ItMiNugget,100);
	CreateInvItem	(self,ItFo_Potion_Health_03);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4078;
};


instance GRD_4079_Guard (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_DMB;
	level 		=	22;
	voice		=	7;
	id 			=	4079;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 238;
	attribute[ATR_HITPOINTS] 	= 238;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,1,"Hum_Head_Bald",29,1,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				

    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_Prl_Swd);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMiNugget,60);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4079;
};


FUNC VOID Rtn_start_4070 ()
{
	TA_SitCampfire	(00,00,00,15,"MIS_GRDPATROL1_1");
	TA_Stand	(00,15,00,30,"OC_ROUND_9");
	TA_SitCampfire	(00,30,00,45,"OC_ROUND_22");
	TA_Stand	(00,45,00,59,"OC_ROUND_17");

	TA_SitCampfire	(01,00,01,15,"MIS_GRDPATROL1_1");
	TA_Stand	(01,15,01,30,"OC_ROUND_9");
	TA_SitCampfire	(01,30,01,45,"OC_ROUND_22");
	TA_Stand	(01,45,01,59,"OC_ROUND_17");	

	TA_SitCampfire	(02,00,02,15,"MIS_GRDPATROL1_1");
	TA_Stand	(02,15,02,30,"OC_ROUND_9");
	TA_SitCampfire	(02,30,02,45,"OC_ROUND_22");
	TA_Stand	(02,45,02,59,"OC_ROUND_17");	
	
	TA_SitCampfire	(03,00,03,15,"MIS_GRDPATROL1_1");
	TA_Stand	(03,15,03,30,"OC_ROUND_9");
	TA_SitCampfire	(03,30,03,45,"OC_ROUND_22");
	TA_Stand	(03,45,03,59,"OC_ROUND_17");		
	
	TA_SitCampfire	(04,00,04,15,"MIS_GRDPATROL1_1");
	TA_Stand	(04,15,04,30,"OC_ROUND_9");
	TA_SitCampfire	(04,30,04,45,"OC_ROUND_22");
	TA_Stand	(04,45,04,59,"OC_ROUND_17");			
	
	TA_SitCampfire	(05,00,05,15,"MIS_GRDPATROL1_1");
	TA_Stand	(05,15,05,30,"OC_ROUND_9");
	TA_SitCampfire	(05,30,05,45,"OC_ROUND_22");
	TA_Stand	(05,45,05,59,"OC_ROUND_17");	

	TA_SitCampfire	(06,00,06,15,"MIS_GRDPATROL1_1");
	TA_Stand	(06,15,06,30,"OC_ROUND_9");
	TA_SitCampfire	(06,30,06,45,"OC_ROUND_22");
	TA_Stand	(06,45,06,59,"OC_ROUND_17");	

	TA_SitCampfire	(07,00,07,15,"MIS_GRDPATROL1_1");
	TA_Stand	(07,15,07,30,"OC_ROUND_9");
	TA_SitCampfire	(07,30,07,45,"OC_ROUND_22");
	TA_Stand	(07,45,07,59,"OC_ROUND_17");	

	TA_SitCampfire	(08,00,08,15,"MIS_GRDPATROL1_1");
	TA_Stand	(08,15,08,30,"OC_ROUND_9");
	TA_SitCampfire	(08,30,08,45,"OC_ROUND_22");
	TA_Stand	(08,45,08,59,"OC_ROUND_17");	

	TA_SitCampfire	(09,00,09,15,"MIS_GRDPATROL1_1");
	TA_Stand	(09,15,09,30,"OC_ROUND_9");
	TA_SitCampfire	(09,30,09,45,"OC_ROUND_22");
	TA_Stand	(09,45,09,59,"OC_ROUND_17");	

	TA_SitCampfire	(10,00,10,15,"MIS_GRDPATROL1_1");
	TA_Stand	(10,15,10,30,"OC_ROUND_9");
	TA_SitCampfire	(10,30,10,45,"OC_ROUND_22");
	TA_Stand	(10,45,10,59,"OC_ROUND_17");	

	TA_SitCampfire	(11,00,11,15,"MIS_GRDPATROL1_1");
	TA_Stand	(11,15,11,30,"OC_ROUND_9");
	TA_SitCampfire	(11,30,11,45,"OC_ROUND_22");
	TA_Stand	(11,45,11,59,"OC_ROUND_17");	

	TA_SitCampfire	(12,00,12,15,"MIS_GRDPATROL1_1");
	TA_Stand	(12,15,12,30,"OC_ROUND_9");
	TA_SitCampfire	(12,30,12,45,"OC_ROUND_22");
	TA_Stand	(12,45,12,59,"OC_ROUND_17");		

	TA_SitCampfire	(13,00,13,15,"MIS_GRDPATROL1_1");
	TA_Stand	(13,15,13,30,"OC_ROUND_9");
	TA_SitCampfire	(13,30,13,45,"OC_ROUND_22");
	TA_Stand	(13,45,13,59,"OC_ROUND_17");	

	TA_SitCampfire	(14,00,14,15,"MIS_GRDPATROL1_1");
	TA_Stand	(14,15,14,30,"OC_ROUND_9");
	TA_SitCampfire	(14,30,14,45,"OC_ROUND_22");
	TA_Stand	(14,45,14,59,"OC_ROUND_17");	

	TA_SitCampfire	(15,00,15,15,"MIS_GRDPATROL1_1");
	TA_Stand	(15,15,15,30,"OC_ROUND_9");
	TA_SitCampfire	(15,30,15,45,"OC_ROUND_22");
	TA_Stand	(15,45,15,59,"OC_ROUND_17");	

	TA_SitCampfire	(16,00,16,15,"MIS_GRDPATROL1_1");
	TA_Stand	(16,15,16,30,"OC_ROUND_9");
	TA_SitCampfire	(16,30,16,45,"OC_ROUND_22");
	TA_Stand	(16,45,16,59,"OC_ROUND_17");	

	TA_SitCampfire	(17,00,17,15,"MIS_GRDPATROL1_1");
	TA_Stand	(17,15,17,30,"OC_ROUND_9");
	TA_SitCampfire	(17,30,17,45,"OC_ROUND_22");
	TA_Stand	(17,45,17,59,"OC_ROUND_17");		

	TA_SitCampfire	(18,00,18,15,"MIS_GRDPATROL1_1");
	TA_Stand	(18,15,18,30,"OC_ROUND_9");
	TA_SitCampfire	(18,30,18,45,"OC_ROUND_22");
	TA_Stand	(18,45,18,59,"OC_ROUND_17");	

	TA_SitCampfire	(19,00,19,15,"MIS_GRDPATROL1_1");
	TA_Stand	(19,15,19,30,"OC_ROUND_9");
	TA_SitCampfire	(19,30,19,45,"OC_ROUND_22");
	TA_Stand	(19,45,19,59,"OC_ROUND_17");

	TA_SitCampfire	(20,00,20,15,"MIS_GRDPATROL1_1");
	TA_Stand	(20,15,20,30,"OC_ROUND_9");
	TA_SitCampfire	(20,30,20,45,"OC_ROUND_22");
	TA_Stand	(20,45,20,59,"OC_ROUND_17");

	TA_SitCampfire	(21,00,21,15,"MIS_GRDPATROL1_1");
	TA_Stand	(21,15,21,30,"OC_ROUND_9");
	TA_SitCampfire	(21,30,21,45,"OC_ROUND_22");
	TA_Stand	(21,45,21,59,"OC_ROUND_17");

	TA_SitCampfire	(22,00,22,15,"MIS_GRDPATROL1_1");
	TA_Stand	(22,15,22,30,"OC_ROUND_9");
	TA_SitCampfire	(22,30,22,45,"OC_ROUND_22");
	TA_Stand	(22,45,22,59,"OC_ROUND_17");

	TA_SitCampfire	(23,00,23,15,"MIS_GRDPATROL1_1");
	TA_Stand	(23,15,23,30,"OC_ROUND_9");
	TA_SitCampfire	(23,30,23,45,"OC_ROUND_22");
	TA_Stand	(23,45,23,59,"OC_ROUND_17");
};


FUNC VOID Rtn_start_4071 ()
{
	TA_SitCampfire	(00,00,00,15,"MIS_GRDPATROL1_1");
	TA_Stand	(00,15,00,30,"OC_ROUND_9");
	TA_SitCampfire	(00,30,00,45,"OC_ROUND_22");
	TA_Stand	(00,45,00,59,"OC_ROUND_17");

	TA_SitCampfire	(01,00,01,15,"MIS_GRDPATROL1_1");
	TA_Stand	(01,15,01,30,"OC_ROUND_9");
	TA_SitCampfire	(01,30,01,45,"OC_ROUND_22");
	TA_Stand	(01,45,01,59,"OC_ROUND_17");	

	TA_SitCampfire	(02,00,02,15,"MIS_GRDPATROL1_1");
	TA_Stand	(02,15,02,30,"OC_ROUND_9");
	TA_SitCampfire	(02,30,02,45,"OC_ROUND_22");
	TA_Stand	(02,45,02,59,"OC_ROUND_17");	
	
	TA_SitCampfire	(03,00,03,15,"MIS_GRDPATROL1_1");
	TA_Stand	(03,15,03,30,"OC_ROUND_9");
	TA_SitCampfire	(03,30,03,45,"OC_ROUND_22");
	TA_Stand	(03,45,03,59,"OC_ROUND_17");		
	
	TA_SitCampfire	(04,00,04,15,"MIS_GRDPATROL1_1");
	TA_Stand	(04,15,04,30,"OC_ROUND_9");
	TA_SitCampfire	(04,30,04,45,"OC_ROUND_22");
	TA_Stand	(04,45,04,59,"OC_ROUND_17");			
	
	TA_SitCampfire	(05,00,05,15,"MIS_GRDPATROL1_1");
	TA_Stand	(05,15,05,30,"OC_ROUND_9");
	TA_SitCampfire	(05,30,05,45,"OC_ROUND_22");
	TA_Stand	(05,45,05,59,"OC_ROUND_17");	

	TA_SitCampfire	(06,00,06,15,"MIS_GRDPATROL1_1");
	TA_Stand	(06,15,06,30,"OC_ROUND_9");
	TA_SitCampfire	(06,30,06,45,"OC_ROUND_22");
	TA_Stand	(06,45,06,59,"OC_ROUND_17");	

	TA_SitCampfire	(07,00,07,15,"MIS_GRDPATROL1_1");
	TA_Stand	(07,15,07,30,"OC_ROUND_9");
	TA_SitCampfire	(07,30,07,45,"OC_ROUND_22");
	TA_Stand	(07,45,07,59,"OC_ROUND_17");	

	TA_SitCampfire	(08,00,08,15,"MIS_GRDPATROL1_1");
	TA_Stand	(08,15,08,30,"OC_ROUND_9");
	TA_SitCampfire	(08,30,08,45,"OC_ROUND_22");
	TA_Stand	(08,45,08,59,"OC_ROUND_17");	

	TA_SitCampfire	(09,00,09,15,"MIS_GRDPATROL1_1");
	TA_Stand	(09,15,09,30,"OC_ROUND_9");
	TA_SitCampfire	(09,30,09,45,"OC_ROUND_22");
	TA_Stand	(09,45,09,59,"OC_ROUND_17");	

	TA_SitCampfire	(10,00,10,15,"MIS_GRDPATROL1_1");
	TA_Stand	(10,15,10,30,"OC_ROUND_9");
	TA_SitCampfire	(10,30,10,45,"OC_ROUND_22");
	TA_Stand	(10,45,10,59,"OC_ROUND_17");	

	TA_SitCampfire	(11,00,11,15,"MIS_GRDPATROL1_1");
	TA_Stand	(11,15,11,30,"OC_ROUND_9");
	TA_SitCampfire	(11,30,11,45,"OC_ROUND_22");
	TA_Stand	(11,45,11,59,"OC_ROUND_17");	

	TA_SitCampfire	(12,00,12,15,"MIS_GRDPATROL1_1");
	TA_Stand	(12,15,12,30,"OC_ROUND_9");
	TA_SitCampfire	(12,30,12,45,"OC_ROUND_22");
	TA_Stand	(12,45,12,59,"OC_ROUND_17");		

	TA_SitCampfire	(13,00,13,15,"MIS_GRDPATROL1_1");
	TA_Stand	(13,15,13,30,"OC_ROUND_9");
	TA_SitCampfire	(13,30,13,45,"OC_ROUND_22");
	TA_Stand	(13,45,13,59,"OC_ROUND_17");	

	TA_SitCampfire	(14,00,14,15,"MIS_GRDPATROL1_1");
	TA_Stand	(14,15,14,30,"OC_ROUND_9");
	TA_SitCampfire	(14,30,14,45,"OC_ROUND_22");
	TA_Stand	(14,45,14,59,"OC_ROUND_17");	

	TA_SitCampfire	(15,00,15,15,"MIS_GRDPATROL1_1");
	TA_Stand	(15,15,15,30,"OC_ROUND_9");
	TA_SitCampfire	(15,30,15,45,"OC_ROUND_22");
	TA_Stand	(15,45,15,59,"OC_ROUND_17");	

	TA_SitCampfire	(16,00,16,15,"MIS_GRDPATROL1_1");
	TA_Stand	(16,15,16,30,"OC_ROUND_9");
	TA_SitCampfire	(16,30,16,45,"OC_ROUND_22");
	TA_Stand	(16,45,16,59,"OC_ROUND_17");	

	TA_SitCampfire	(17,00,17,15,"MIS_GRDPATROL1_1");
	TA_Stand	(17,15,17,30,"OC_ROUND_9");
	TA_SitCampfire	(17,30,17,45,"OC_ROUND_22");
	TA_Stand	(17,45,17,59,"OC_ROUND_17");		

	TA_SitCampfire	(18,00,18,15,"MIS_GRDPATROL1_1");
	TA_Stand	(18,15,18,30,"OC_ROUND_9");
	TA_SitCampfire	(18,30,18,45,"OC_ROUND_22");
	TA_Stand	(18,45,18,59,"OC_ROUND_17");	

	TA_SitCampfire	(19,00,19,15,"MIS_GRDPATROL1_1");
	TA_Stand	(19,15,19,30,"OC_ROUND_9");
	TA_SitCampfire	(19,30,19,45,"OC_ROUND_22");
	TA_Stand	(19,45,19,59,"OC_ROUND_17");

	TA_SitCampfire	(20,00,20,15,"MIS_GRDPATROL1_1");
	TA_Stand	(20,15,20,30,"OC_ROUND_9");
	TA_SitCampfire	(20,30,20,45,"OC_ROUND_22");
	TA_Stand	(20,45,20,59,"OC_ROUND_17");

	TA_SitCampfire	(21,00,21,15,"MIS_GRDPATROL1_1");
	TA_Stand	(21,15,21,30,"OC_ROUND_9");
	TA_SitCampfire	(21,30,21,45,"OC_ROUND_22");
	TA_Stand	(21,45,21,59,"OC_ROUND_17");

	TA_SitCampfire	(22,00,22,15,"MIS_GRDPATROL1_1");
	TA_Stand	(22,15,22,30,"OC_ROUND_9");
	TA_SitCampfire	(22,30,22,45,"OC_ROUND_22");
	TA_Stand	(22,45,22,59,"OC_ROUND_17");

	TA_SitCampfire	(23,00,23,15,"MIS_GRDPATROL1_1");
	TA_Stand	(23,15,23,30,"OC_ROUND_9");
	TA_SitCampfire	(23,30,23,45,"OC_ROUND_22");
	TA_Stand	(23,45,23,59,"OC_ROUND_17");
};


FUNC VOID Rtn_start_4072 ()
{
	TA_SitCampfire	(00,00,00,15,"MIS_GRDPATROL1_1");
	TA_Stand	(00,15,00,30,"OC_ROUND_9");
	TA_SitCampfire	(00,30,00,45,"OC_ROUND_22");
	TA_Stand	(00,45,00,59,"OC_ROUND_17");

	TA_SitCampfire	(01,00,01,15,"MIS_GRDPATROL1_1");
	TA_Stand	(01,15,01,30,"OC_ROUND_9");
	TA_SitCampfire	(01,30,01,45,"OC_ROUND_22");
	TA_Stand	(01,45,01,59,"OC_ROUND_17");	

	TA_SitCampfire	(02,00,02,15,"MIS_GRDPATROL1_1");
	TA_Stand	(02,15,02,30,"OC_ROUND_9");
	TA_SitCampfire	(02,30,02,45,"OC_ROUND_22");
	TA_Stand	(02,45,02,59,"OC_ROUND_17");	
	
	TA_SitCampfire	(03,00,03,15,"MIS_GRDPATROL1_1");
	TA_Stand	(03,15,03,30,"OC_ROUND_9");
	TA_SitCampfire	(03,30,03,45,"OC_ROUND_22");
	TA_Stand	(03,45,03,59,"OC_ROUND_17");		
	
	TA_SitCampfire	(04,00,04,15,"MIS_GRDPATROL1_1");
	TA_Stand	(04,15,04,30,"OC_ROUND_9");
	TA_SitCampfire	(04,30,04,45,"OC_ROUND_22");
	TA_Stand	(04,45,04,59,"OC_ROUND_17");			
	
	TA_SitCampfire	(05,00,05,15,"MIS_GRDPATROL1_1");
	TA_Stand	(05,15,05,30,"OC_ROUND_9");
	TA_SitCampfire	(05,30,05,45,"OC_ROUND_22");
	TA_Stand	(05,45,05,59,"OC_ROUND_17");	

	TA_SitCampfire	(06,00,06,15,"MIS_GRDPATROL1_1");
	TA_Stand	(06,15,06,30,"OC_ROUND_9");
	TA_SitCampfire	(06,30,06,45,"OC_ROUND_22");
	TA_Stand	(06,45,06,59,"OC_ROUND_17");	

	TA_SitCampfire	(07,00,07,15,"MIS_GRDPATROL1_1");
	TA_Stand	(07,15,07,30,"OC_ROUND_9");
	TA_SitCampfire	(07,30,07,45,"OC_ROUND_22");
	TA_Stand	(07,45,07,59,"OC_ROUND_17");	

	TA_SitCampfire	(08,00,08,15,"MIS_GRDPATROL1_1");
	TA_Stand	(08,15,08,30,"OC_ROUND_9");
	TA_SitCampfire	(08,30,08,45,"OC_ROUND_22");
	TA_Stand	(08,45,08,59,"OC_ROUND_17");	

	TA_SitCampfire	(09,00,09,15,"MIS_GRDPATROL1_1");
	TA_Stand	(09,15,09,30,"OC_ROUND_9");
	TA_SitCampfire	(09,30,09,45,"OC_ROUND_22");
	TA_Stand	(09,45,09,59,"OC_ROUND_17");	

	TA_SitCampfire	(10,00,10,15,"MIS_GRDPATROL1_1");
	TA_Stand	(10,15,10,30,"OC_ROUND_9");
	TA_SitCampfire	(10,30,10,45,"OC_ROUND_22");
	TA_Stand	(10,45,10,59,"OC_ROUND_17");	

	TA_SitCampfire	(11,00,11,15,"MIS_GRDPATROL1_1");
	TA_Stand	(11,15,11,30,"OC_ROUND_9");
	TA_SitCampfire	(11,30,11,45,"OC_ROUND_22");
	TA_Stand	(11,45,11,59,"OC_ROUND_17");	

	TA_SitCampfire	(12,00,12,15,"MIS_GRDPATROL1_1");
	TA_Stand	(12,15,12,30,"OC_ROUND_9");
	TA_SitCampfire	(12,30,12,45,"OC_ROUND_22");
	TA_Stand	(12,45,12,59,"OC_ROUND_17");		

	TA_SitCampfire	(13,00,13,15,"MIS_GRDPATROL1_1");
	TA_Stand	(13,15,13,30,"OC_ROUND_9");
	TA_SitCampfire	(13,30,13,45,"OC_ROUND_22");
	TA_Stand	(13,45,13,59,"OC_ROUND_17");	

	TA_SitCampfire	(14,00,14,15,"MIS_GRDPATROL1_1");
	TA_Stand	(14,15,14,30,"OC_ROUND_9");
	TA_SitCampfire	(14,30,14,45,"OC_ROUND_22");
	TA_Stand	(14,45,14,59,"OC_ROUND_17");	

	TA_SitCampfire	(15,00,15,15,"MIS_GRDPATROL1_1");
	TA_Stand	(15,15,15,30,"OC_ROUND_9");
	TA_SitCampfire	(15,30,15,45,"OC_ROUND_22");
	TA_Stand	(15,45,15,59,"OC_ROUND_17");	

	TA_SitCampfire	(16,00,16,15,"MIS_GRDPATROL1_1");
	TA_Stand	(16,15,16,30,"OC_ROUND_9");
	TA_SitCampfire	(16,30,16,45,"OC_ROUND_22");
	TA_Stand	(16,45,16,59,"OC_ROUND_17");	

	TA_SitCampfire	(17,00,17,15,"MIS_GRDPATROL1_1");
	TA_Stand	(17,15,17,30,"OC_ROUND_9");
	TA_SitCampfire	(17,30,17,45,"OC_ROUND_22");
	TA_Stand	(17,45,17,59,"OC_ROUND_17");		

	TA_SitCampfire	(18,00,18,15,"MIS_GRDPATROL1_1");
	TA_Stand	(18,15,18,30,"OC_ROUND_9");
	TA_SitCampfire	(18,30,18,45,"OC_ROUND_22");
	TA_Stand	(18,45,18,59,"OC_ROUND_17");	

	TA_SitCampfire	(19,00,19,15,"MIS_GRDPATROL1_1");
	TA_Stand	(19,15,19,30,"OC_ROUND_9");
	TA_SitCampfire	(19,30,19,45,"OC_ROUND_22");
	TA_Stand	(19,45,19,59,"OC_ROUND_17");

	TA_SitCampfire	(20,00,20,15,"MIS_GRDPATROL1_1");
	TA_Stand	(20,15,20,30,"OC_ROUND_9");
	TA_SitCampfire	(20,30,20,45,"OC_ROUND_22");
	TA_Stand	(20,45,20,59,"OC_ROUND_17");

	TA_SitCampfire	(21,00,21,15,"MIS_GRDPATROL1_1");
	TA_Stand	(21,15,21,30,"OC_ROUND_9");
	TA_SitCampfire	(21,30,21,45,"OC_ROUND_22");
	TA_Stand	(21,45,21,59,"OC_ROUND_17");

	TA_SitCampfire	(22,00,22,15,"MIS_GRDPATROL1_1");
	TA_Stand	(22,15,22,30,"OC_ROUND_9");
	TA_SitCampfire	(22,30,22,45,"OC_ROUND_22");
	TA_Stand	(22,45,22,59,"OC_ROUND_17");

	TA_SitCampfire	(23,00,23,15,"MIS_GRDPATROL1_1");
	TA_Stand	(23,15,23,30,"OC_ROUND_9");
	TA_SitCampfire	(23,30,23,45,"OC_ROUND_22");
	TA_Stand	(23,45,23,59,"OC_ROUND_17");
};


FUNC VOID Rtn_start_4073 ()
{
	TA_Stand	(00,00,00,15,"OC_ROUND_9");
	TA_SitCampfire	(00,15,00,30,"OC_ROUND_22");
	TA_Stand	(00,30,00,45,"OC_ROUND_17");
	TA_SitCampfire	(00,45,00,59,"MIS_GRDPATROL1_1");

	TA_Stand	(01,00,01,15,"OC_ROUND_9");
	TA_SitCampfire	(01,15,01,30,"OC_ROUND_22");
	TA_Stand	(01,30,01,45,"OC_ROUND_17");	
	TA_SitCampfire	(01,45,01,59,"MIS_GRDPATROL1_1");

	TA_Stand	(02,00,02,15,"OC_ROUND_9");
	TA_SitCampfire	(02,15,02,30,"OC_ROUND_22");
	TA_Stand	(02,30,02,45,"OC_ROUND_17");	
	TA_SitCampfire	(02,45,02,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(03,00,03,15,"OC_ROUND_9");
	TA_SitCampfire	(03,15,03,30,"OC_ROUND_22");
	TA_Stand	(03,30,03,45,"OC_ROUND_17");		
	TA_SitCampfire	(03,45,03,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(04,00,04,15,"OC_ROUND_9");
	TA_SitCampfire	(04,15,04,30,"OC_ROUND_22");
	TA_Stand	(04,30,04,45,"OC_ROUND_17");			
	TA_SitCampfire	(04,45,04,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(05,00,05,15,"OC_ROUND_9");
	TA_SitCampfire	(05,15,05,30,"OC_ROUND_22");
	TA_Stand	(05,30,05,45,"OC_ROUND_17");	
	TA_SitCampfire	(05,45,05,59,"MIS_GRDPATROL1_1");

	TA_Stand	(06,00,06,15,"OC_ROUND_9");
	TA_SitCampfire	(06,15,06,30,"OC_ROUND_22");
	TA_Stand	(06,30,06,45,"OC_ROUND_17");	
	TA_SitCampfire	(06,45,06,59,"MIS_GRDPATROL1_1");

	TA_Stand	(07,00,07,15,"OC_ROUND_9");
	TA_SitCampfire	(07,15,07,30,"OC_ROUND_22");
	TA_Stand	(07,30,07,45,"OC_ROUND_17");	
	TA_SitCampfire	(07,45,07,59,"MIS_GRDPATROL1_1");

	TA_Stand	(08,00,08,15,"OC_ROUND_9");
	TA_SitCampfire	(08,15,08,30,"OC_ROUND_22");
	TA_Stand	(08,30,08,45,"OC_ROUND_17");	
	TA_SitCampfire	(08,45,08,59,"MIS_GRDPATROL1_1");

	TA_Stand	(09,00,09,15,"OC_ROUND_9");
	TA_SitCampfire	(09,15,09,30,"OC_ROUND_22");
	TA_Stand	(09,30,09,45,"OC_ROUND_17");	
	TA_SitCampfire	(09,45,09,59,"MIS_GRDPATROL1_1");

	TA_Stand	(10,00,10,15,"OC_ROUND_9");
	TA_SitCampfire	(10,15,10,30,"OC_ROUND_22");
	TA_Stand	(10,30,10,45,"OC_ROUND_17");	
	TA_SitCampfire	(10,45,10,59,"MIS_GRDPATROL1_1");

	TA_Stand	(11,00,11,15,"OC_ROUND_9");
	TA_SitCampfire	(11,15,11,30,"OC_ROUND_22");
	TA_Stand	(11,30,11,45,"OC_ROUND_17");	
	TA_SitCampfire	(11,45,11,59,"MIS_GRDPATROL1_1");

	TA_Stand	(12,00,12,15,"OC_ROUND_9");
	TA_SitCampfire	(12,15,12,30,"OC_ROUND_22");
	TA_Stand	(12,30,12,45,"OC_ROUND_17");		
	TA_SitCampfire	(12,45,12,59,"MIS_GRDPATROL1_1");

	TA_Stand	(13,00,13,15,"OC_ROUND_9");
	TA_SitCampfire	(13,15,13,30,"OC_ROUND_22");
	TA_Stand	(13,30,13,45,"OC_ROUND_17");	
	TA_SitCampfire	(13,45,13,59,"MIS_GRDPATROL1_1");

	TA_Stand	(14,00,14,15,"OC_ROUND_9");
	TA_SitCampfire	(14,15,14,30,"OC_ROUND_22");
	TA_Stand	(14,30,14,45,"OC_ROUND_17");	
	TA_SitCampfire	(14,45,14,59,"MIS_GRDPATROL1_1");

	TA_Stand	(00,15,15,15,"OC_ROUND_9");
	TA_SitCampfire	(15,15,15,30,"OC_ROUND_22");
	TA_Stand	(15,30,15,45,"OC_ROUND_17");	
	TA_SitCampfire	(15,45,15,59,"MIS_GRDPATROL1_1");

	TA_Stand	(16,00,16,15,"OC_ROUND_9");
	TA_SitCampfire	(16,15,16,30,"OC_ROUND_22");
	TA_Stand	(16,30,16,45,"OC_ROUND_17");	
	TA_SitCampfire	(16,45,16,59,"MIS_GRDPATROL1_1");

	TA_Stand	(17,00,17,15,"OC_ROUND_9");
	TA_SitCampfire	(17,15,17,30,"OC_ROUND_22");
	TA_Stand	(17,30,17,45,"OC_ROUND_17");		
	TA_SitCampfire	(17,45,17,59,"MIS_GRDPATROL1_1");

	TA_Stand	(18,00,18,15,"OC_ROUND_9");
	TA_SitCampfire	(18,15,18,30,"OC_ROUND_22");
	TA_Stand	(18,30,18,45,"OC_ROUND_17");	
	TA_SitCampfire	(18,45,18,59,"MIS_GRDPATROL1_1");

	TA_Stand	(19,00,19,15,"OC_ROUND_9");
	TA_SitCampfire	(19,15,19,30,"OC_ROUND_22");
	TA_Stand	(19,30,19,45,"OC_ROUND_17");
	TA_SitCampfire	(19,45,19,59,"MIS_GRDPATROL1_1");

	TA_Stand	(20,00,20,15,"OC_ROUND_9");
	TA_SitCampfire	(20,15,20,30,"OC_ROUND_22");
	TA_Stand	(20,30,20,45,"OC_ROUND_17");
	TA_SitCampfire	(20,45,20,59,"MIS_GRDPATROL1_1");

	TA_Stand	(21,00,21,15,"OC_ROUND_9");
	TA_SitCampfire	(21,15,21,30,"OC_ROUND_22");
	TA_Stand	(21,30,21,45,"OC_ROUND_17");
	TA_SitCampfire	(21,45,21,59,"MIS_GRDPATROL1_1");

	TA_Stand	(22,00,22,15,"OC_ROUND_9");
	TA_SitCampfire	(22,15,22,30,"OC_ROUND_22");
	TA_Stand	(22,30,22,45,"OC_ROUND_17");
	TA_SitCampfire	(22,45,22,59,"MIS_GRDPATROL1_1");

	TA_Stand	(23,00,23,15,"OC_ROUND_9");
	TA_SitCampfire	(23,15,23,30,"OC_ROUND_22");
	TA_Stand	(23,30,23,45,"OC_ROUND_17");
	TA_SitCampfire	(23,45,23,59,"MIS_GRDPATROL1_1");
};

FUNC VOID Rtn_start_4074 ()
{
	TA_Stand	(00,00,00,15,"OC_ROUND_9");
	TA_SitCampfire	(00,15,00,30,"OC_ROUND_22");
	TA_Stand	(00,30,00,45,"OC_ROUND_17");
	TA_SitCampfire	(00,45,00,59,"MIS_GRDPATROL1_1");

	TA_Stand	(01,00,01,15,"OC_ROUND_9");
	TA_SitCampfire	(01,15,01,30,"OC_ROUND_22");
	TA_Stand	(01,30,01,45,"OC_ROUND_17");	
	TA_SitCampfire	(01,45,01,59,"MIS_GRDPATROL1_1");

	TA_Stand	(02,00,02,15,"OC_ROUND_9");
	TA_SitCampfire	(02,15,02,30,"OC_ROUND_22");
	TA_Stand	(02,30,02,45,"OC_ROUND_17");	
	TA_SitCampfire	(02,45,02,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(03,00,03,15,"OC_ROUND_9");
	TA_SitCampfire	(03,15,03,30,"OC_ROUND_22");
	TA_Stand	(03,30,03,45,"OC_ROUND_17");		
	TA_SitCampfire	(03,45,03,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(04,00,04,15,"OC_ROUND_9");
	TA_SitCampfire	(04,15,04,30,"OC_ROUND_22");
	TA_Stand	(04,30,04,45,"OC_ROUND_17");			
	TA_SitCampfire	(04,45,04,59,"MIS_GRDPATROL1_1");
	
	TA_Stand	(05,00,05,15,"OC_ROUND_9");
	TA_SitCampfire	(05,15,05,30,"OC_ROUND_22");
	TA_Stand	(05,30,05,45,"OC_ROUND_17");	
	TA_SitCampfire	(05,45,05,59,"MIS_GRDPATROL1_1");

	TA_Stand	(06,00,06,15,"OC_ROUND_9");
	TA_SitCampfire	(06,15,06,30,"OC_ROUND_22");
	TA_Stand	(06,30,06,45,"OC_ROUND_17");	
	TA_SitCampfire	(06,45,06,59,"MIS_GRDPATROL1_1");

	TA_Stand	(07,00,07,15,"OC_ROUND_9");
	TA_SitCampfire	(07,15,07,30,"OC_ROUND_22");
	TA_Stand	(07,30,07,45,"OC_ROUND_17");	
	TA_SitCampfire	(07,45,07,59,"MIS_GRDPATROL1_1");

	TA_Stand	(08,00,08,15,"OC_ROUND_9");
	TA_SitCampfire	(08,15,08,30,"OC_ROUND_22");
	TA_Stand	(08,30,08,45,"OC_ROUND_17");	
	TA_SitCampfire	(08,45,08,59,"MIS_GRDPATROL1_1");

	TA_Stand	(09,00,09,15,"OC_ROUND_9");
	TA_SitCampfire	(09,15,09,30,"OC_ROUND_22");
	TA_Stand	(09,30,09,45,"OC_ROUND_17");	
	TA_SitCampfire	(09,45,09,59,"MIS_GRDPATROL1_1");

	TA_Stand	(10,00,10,15,"OC_ROUND_9");
	TA_SitCampfire	(10,15,10,30,"OC_ROUND_22");
	TA_Stand	(10,30,10,45,"OC_ROUND_17");	
	TA_SitCampfire	(10,45,10,59,"MIS_GRDPATROL1_1");

	TA_Stand	(11,00,11,15,"OC_ROUND_9");
	TA_SitCampfire	(11,15,11,30,"OC_ROUND_22");
	TA_Stand	(11,30,11,45,"OC_ROUND_17");	
	TA_SitCampfire	(11,45,11,59,"MIS_GRDPATROL1_1");

	TA_Stand	(12,00,12,15,"OC_ROUND_9");
	TA_SitCampfire	(12,15,12,30,"OC_ROUND_22");
	TA_Stand	(12,30,12,45,"OC_ROUND_17");		
	TA_SitCampfire	(12,45,12,59,"MIS_GRDPATROL1_1");

	TA_Stand	(13,00,13,15,"OC_ROUND_9");
	TA_SitCampfire	(13,15,13,30,"OC_ROUND_22");
	TA_Stand	(13,30,13,45,"OC_ROUND_17");	
	TA_SitCampfire	(13,45,13,59,"MIS_GRDPATROL1_1");

	TA_Stand	(14,00,14,15,"OC_ROUND_9");
	TA_SitCampfire	(14,15,14,30,"OC_ROUND_22");
	TA_Stand	(14,30,14,45,"OC_ROUND_17");	
	TA_SitCampfire	(14,45,14,59,"MIS_GRDPATROL1_1");

	TA_Stand	(00,15,15,15,"OC_ROUND_9");
	TA_SitCampfire	(15,15,15,30,"OC_ROUND_22");
	TA_Stand	(15,30,15,45,"OC_ROUND_17");	
	TA_SitCampfire	(15,45,15,59,"MIS_GRDPATROL1_1");

	TA_Stand	(16,00,16,15,"OC_ROUND_9");
	TA_SitCampfire	(16,15,16,30,"OC_ROUND_22");
	TA_Stand	(16,30,16,45,"OC_ROUND_17");	
	TA_SitCampfire	(16,45,16,59,"MIS_GRDPATROL1_1");

	TA_Stand	(17,00,17,15,"OC_ROUND_9");
	TA_SitCampfire	(17,15,17,30,"OC_ROUND_22");
	TA_Stand	(17,30,17,45,"OC_ROUND_17");		
	TA_SitCampfire	(17,45,17,59,"MIS_GRDPATROL1_1");

	TA_Stand	(18,00,18,15,"OC_ROUND_9");
	TA_SitCampfire	(18,15,18,30,"OC_ROUND_22");
	TA_Stand	(18,30,18,45,"OC_ROUND_17");	
	TA_SitCampfire	(18,45,18,59,"MIS_GRDPATROL1_1");

	TA_Stand	(19,00,19,15,"OC_ROUND_9");
	TA_SitCampfire	(19,15,19,30,"OC_ROUND_22");
	TA_Stand	(19,30,19,45,"OC_ROUND_17");
	TA_SitCampfire	(19,45,19,59,"MIS_GRDPATROL1_1");

	TA_Stand	(20,00,20,15,"OC_ROUND_9");
	TA_SitCampfire	(20,15,20,30,"OC_ROUND_22");
	TA_Stand	(20,30,20,45,"OC_ROUND_17");
	TA_SitCampfire	(20,45,20,59,"MIS_GRDPATROL1_1");

	TA_Stand	(21,00,21,15,"OC_ROUND_9");
	TA_SitCampfire	(21,15,21,30,"OC_ROUND_22");
	TA_Stand	(21,30,21,45,"OC_ROUND_17");
	TA_SitCampfire	(21,45,21,59,"MIS_GRDPATROL1_1");

	TA_Stand	(22,00,22,15,"OC_ROUND_9");
	TA_SitCampfire	(22,15,22,30,"OC_ROUND_22");
	TA_Stand	(22,30,22,45,"OC_ROUND_17");
	TA_SitCampfire	(22,45,22,59,"MIS_GRDPATROL1_1");

	TA_Stand	(23,00,23,15,"OC_ROUND_9");
	TA_SitCampfire	(23,15,23,30,"OC_ROUND_22");
	TA_Stand	(23,30,23,45,"OC_ROUND_17");
	TA_SitCampfire	(23,45,23,59,"MIS_GRDPATROL1_1");
};


FUNC VOID Rtn_start_4075 ()
{
	TA_SitCampfire	(00,00,00,15,"OC_ROUND_22");
	TA_Stand	(00,15,00,30,"OC_ROUND_17");
	TA_SitCampfire	(00,30,00,45,"MIS_GRDPATROL1_1");
	TA_Stand	(00,45,00,59,"OC_ROUND_9");

	TA_SitCampfire	(01,00,01,15,"OC_ROUND_22");
	TA_Stand	(01,15,01,30,"OC_ROUND_17");	
	TA_SitCampfire	(01,30,01,45,"MIS_GRDPATROL1_1");
	TA_Stand	(01,45,01,59,"OC_ROUND_9");

	TA_SitCampfire	(02,00,02,15,"OC_ROUND_22");
	TA_Stand	(02,15,02,30,"OC_ROUND_17");	
	TA_SitCampfire	(02,30,02,45,"MIS_GRDPATROL1_1");
	TA_Stand	(02,45,02,59,"OC_ROUND_9");
	
	TA_SitCampfire	(03,00,03,15,"OC_ROUND_22");
	TA_Stand	(03,15,03,30,"OC_ROUND_17");		
	TA_SitCampfire	(03,30,03,45,"MIS_GRDPATROL1_1");
	TA_Stand	(03,45,03,59,"OC_ROUND_9");
	
	TA_SitCampfire	(04,00,04,15,"OC_ROUND_22");
	TA_Stand	(04,15,04,30,"OC_ROUND_17");			
	TA_SitCampfire	(04,30,04,45,"MIS_GRDPATROL1_1");
	TA_Stand	(04,45,04,59,"OC_ROUND_9");
	
	TA_SitCampfire	(05,00,05,15,"OC_ROUND_22");
	TA_Stand	(05,15,05,30,"OC_ROUND_17");	
	TA_SitCampfire	(05,30,05,45,"MIS_GRDPATROL1_1");
	TA_Stand	(05,45,05,59,"OC_ROUND_9");

	TA_SitCampfire	(06,00,06,15,"OC_ROUND_22");
	TA_Stand	(06,15,06,30,"OC_ROUND_17");	
	TA_SitCampfire	(06,30,06,45,"MIS_GRDPATROL1_1");
	TA_Stand	(06,45,06,59,"OC_ROUND_9");

	TA_SitCampfire	(07,00,07,15,"OC_ROUND_22");
	TA_Stand	(07,15,07,30,"OC_ROUND_17");	
	TA_SitCampfire	(07,30,07,45,"MIS_GRDPATROL1_1");
	TA_Stand	(07,45,07,59,"OC_ROUND_9");

	TA_SitCampfire	(08,00,08,15,"OC_ROUND_22");
	TA_Stand	(08,15,08,30,"OC_ROUND_17");	
	TA_SitCampfire	(08,30,08,45,"MIS_GRDPATROL1_1");
	TA_Stand	(08,45,08,59,"OC_ROUND_9");

	TA_SitCampfire	(09,00,09,15,"OC_ROUND_22");
	TA_Stand	(09,15,09,30,"OC_ROUND_17");	
	TA_SitCampfire	(09,30,09,45,"MIS_GRDPATROL1_1");
	TA_Stand	(09,45,09,59,"OC_ROUND_9");

	TA_SitCampfire	(10,00,10,15,"OC_ROUND_22");
	TA_Stand	(10,15,10,30,"OC_ROUND_17");	
	TA_SitCampfire	(10,30,10,45,"MIS_GRDPATROL1_1");
	TA_Stand	(10,45,10,59,"OC_ROUND_9");

	TA_SitCampfire	(11,00,11,15,"OC_ROUND_22");
	TA_Stand	(11,15,11,30,"OC_ROUND_17");	
	TA_SitCampfire	(11,30,11,45,"MIS_GRDPATROL1_1");
	TA_Stand	(11,45,11,59,"OC_ROUND_9");

	TA_SitCampfire	(12,00,12,15,"OC_ROUND_22");
	TA_Stand	(12,15,12,30,"OC_ROUND_17");		
	TA_SitCampfire	(12,30,12,45,"MIS_GRDPATROL1_1");
	TA_Stand	(12,45,12,59,"OC_ROUND_9");

	TA_SitCampfire	(13,00,13,15,"OC_ROUND_22");
	TA_Stand	(13,15,13,30,"OC_ROUND_17");	
	TA_SitCampfire	(13,30,13,45,"MIS_GRDPATROL1_1");
	TA_Stand	(13,45,13,59,"OC_ROUND_9");

	TA_SitCampfire	(14,00,14,15,"OC_ROUND_22");
	TA_Stand	(14,15,14,30,"OC_ROUND_17");	
	TA_SitCampfire	(14,30,14,45,"MIS_GRDPATROL1_1");
	TA_Stand	(14,45,14,59,"OC_ROUND_9");

	TA_SitCampfire	(00,15,15,15,"OC_ROUND_22");
	TA_Stand	(15,15,15,30,"OC_ROUND_17");	
	TA_SitCampfire	(15,30,15,45,"MIS_GRDPATROL1_1");
	TA_Stand(15,45,15,59,"OC_ROUND_9");

	TA_SitCampfire	(16,00,16,15,"OC_ROUND_22");
	TA_Stand	(16,15,16,30,"OC_ROUND_17");	
	TA_SitCampfire	(16,30,16,45,"MIS_GRDPATROL1_1");
	TA_Stand	(16,45,16,59,"OC_ROUND_9");

	TA_SitCampfire	(17,00,17,15,"OC_ROUND_22");
	TA_Stand	(17,15,17,30,"OC_ROUND_17");		
	TA_SitCampfire	(17,30,17,45,"MIS_GRDPATROL1_1");
	TA_Stand	(17,45,17,59,"OC_ROUND_9");

	TA_SitCampfire	(18,00,18,15,"OC_ROUND_22");
	TA_Stand	(18,15,18,30,"OC_ROUND_17");	
	TA_SitCampfire	(18,30,18,45,"MIS_GRDPATROL1_1");
	TA_Stand	(18,45,18,59,"OC_ROUND_9");

	TA_SitCampfire	(19,00,19,15,"OC_ROUND_22");
	TA_Stand	(19,15,19,30,"OC_ROUND_17");
	TA_SitCampfire	(19,30,19,45,"MIS_GRDPATROL1_1");
	TA_Stand	(19,45,19,59,"OC_ROUND_9");

	TA_SitCampfire	(20,00,20,15,"OC_ROUND_22");
	TA_Stand	(20,15,20,30,"OC_ROUND_17");
	TA_SitCampfire	(20,30,20,45,"MIS_GRDPATROL1_1");
	TA_Stand	(20,45,20,59,"OC_ROUND_9");

	TA_SitCampfire	(21,00,21,15,"OC_ROUND_22");
	TA_Stand	(21,15,21,30,"OC_ROUND_17");
	TA_SitCampfire	(21,30,21,45,"MIS_GRDPATROL1_1");
	TA_Stand	(21,45,21,59,"OC_ROUND_9");

	TA_SitCampfire	(22,00,22,15,"OC_ROUND_22");
	TA_Stand	(22,15,22,30,"OC_ROUND_17");
	TA_SitCampfire	(22,30,22,45,"MIS_GRDPATROL1_1");
	TA_Stand	(22,45,22,59,"OC_ROUND_9");

	TA_SitCampfire	(23,00,23,15,"OC_ROUND_22");
	TA_Stand	(23,15,23,30,"OC_ROUND_17");
	TA_SitCampfire	(23,30,23,45,"MIS_GRDPATROL1_1");
	TA_Stand	(23,45,23,59,"OC_ROUND_9");
};

FUNC VOID Rtn_start_4076 ()
{
	TA_SitCampfire	(00,00,00,15,"OC_ROUND_22");
	TA_Stand	(00,15,00,30,"OC_ROUND_17");
	TA_SitCampfire	(00,30,00,45,"MIS_GRDPATROL1_1");
	TA_Stand	(00,45,00,59,"OC_ROUND_9");

	TA_SitCampfire	(01,00,01,15,"OC_ROUND_22");
	TA_Stand	(01,15,01,30,"OC_ROUND_17");	
	TA_SitCampfire	(01,30,01,45,"MIS_GRDPATROL1_1");
	TA_Stand	(01,45,01,59,"OC_ROUND_9");

	TA_SitCampfire	(02,00,02,15,"OC_ROUND_22");
	TA_Stand	(02,15,02,30,"OC_ROUND_17");	
	TA_SitCampfire	(02,30,02,45,"MIS_GRDPATROL1_1");
	TA_Stand	(02,45,02,59,"OC_ROUND_9");
	
	TA_SitCampfire	(03,00,03,15,"OC_ROUND_22");
	TA_Stand	(03,15,03,30,"OC_ROUND_17");		
	TA_SitCampfire	(03,30,03,45,"MIS_GRDPATROL1_1");
	TA_Stand	(03,45,03,59,"OC_ROUND_9");
	
	TA_SitCampfire	(04,00,04,15,"OC_ROUND_22");
	TA_Stand	(04,15,04,30,"OC_ROUND_17");			
	TA_SitCampfire	(04,30,04,45,"MIS_GRDPATROL1_1");
	TA_Stand	(04,45,04,59,"OC_ROUND_9");
	
	TA_SitCampfire	(05,00,05,15,"OC_ROUND_22");
	TA_Stand	(05,15,05,30,"OC_ROUND_17");	
	TA_SitCampfire	(05,30,05,45,"MIS_GRDPATROL1_1");
	TA_Stand	(05,45,05,59,"OC_ROUND_9");

	TA_SitCampfire	(06,00,06,15,"OC_ROUND_22");
	TA_Stand	(06,15,06,30,"OC_ROUND_17");	
	TA_SitCampfire	(06,30,06,45,"MIS_GRDPATROL1_1");
	TA_Stand	(06,45,06,59,"OC_ROUND_9");

	TA_SitCampfire	(07,00,07,15,"OC_ROUND_22");
	TA_Stand	(07,15,07,30,"OC_ROUND_17");	
	TA_SitCampfire	(07,30,07,45,"MIS_GRDPATROL1_1");
	TA_Stand	(07,45,07,59,"OC_ROUND_9");

	TA_SitCampfire	(08,00,08,15,"OC_ROUND_22");
	TA_Stand	(08,15,08,30,"OC_ROUND_17");	
	TA_SitCampfire	(08,30,08,45,"MIS_GRDPATROL1_1");
	TA_Stand	(08,45,08,59,"OC_ROUND_9");

	TA_SitCampfire	(09,00,09,15,"OC_ROUND_22");
	TA_Stand	(09,15,09,30,"OC_ROUND_17");	
	TA_SitCampfire	(09,30,09,45,"MIS_GRDPATROL1_1");
	TA_Stand	(09,45,09,59,"OC_ROUND_9");

	TA_SitCampfire	(10,00,10,15,"OC_ROUND_22");
	TA_Stand	(10,15,10,30,"OC_ROUND_17");	
	TA_SitCampfire	(10,30,10,45,"MIS_GRDPATROL1_1");
	TA_Stand	(10,45,10,59,"OC_ROUND_9");

	TA_SitCampfire	(11,00,11,15,"OC_ROUND_22");
	TA_Stand	(11,15,11,30,"OC_ROUND_17");	
	TA_SitCampfire	(11,30,11,45,"MIS_GRDPATROL1_1");
	TA_Stand	(11,45,11,59,"OC_ROUND_9");

	TA_SitCampfire	(12,00,12,15,"OC_ROUND_22");
	TA_Stand	(12,15,12,30,"OC_ROUND_17");		
	TA_SitCampfire	(12,30,12,45,"MIS_GRDPATROL1_1");
	TA_Stand	(12,45,12,59,"OC_ROUND_9");

	TA_SitCampfire	(13,00,13,15,"OC_ROUND_22");
	TA_Stand	(13,15,13,30,"OC_ROUND_17");	
	TA_SitCampfire	(13,30,13,45,"MIS_GRDPATROL1_1");
	TA_Stand	(13,45,13,59,"OC_ROUND_9");

	TA_SitCampfire	(14,00,14,15,"OC_ROUND_22");
	TA_Stand	(14,15,14,30,"OC_ROUND_17");	
	TA_SitCampfire	(14,30,14,45,"MIS_GRDPATROL1_1");
	TA_Stand	(14,45,14,59,"OC_ROUND_9");

	TA_SitCampfire	(00,15,15,15,"OC_ROUND_22");
	TA_Stand	(15,15,15,30,"OC_ROUND_17");	
	TA_SitCampfire	(15,30,15,45,"MIS_GRDPATROL1_1");
	TA_Stand(15,45,15,59,"OC_ROUND_9");

	TA_SitCampfire	(16,00,16,15,"OC_ROUND_22");
	TA_Stand	(16,15,16,30,"OC_ROUND_17");	
	TA_SitCampfire	(16,30,16,45,"MIS_GRDPATROL1_1");
	TA_Stand	(16,45,16,59,"OC_ROUND_9");

	TA_SitCampfire	(17,00,17,15,"OC_ROUND_22");
	TA_Stand	(17,15,17,30,"OC_ROUND_17");		
	TA_SitCampfire	(17,30,17,45,"MIS_GRDPATROL1_1");
	TA_Stand	(17,45,17,59,"OC_ROUND_9");

	TA_SitCampfire	(18,00,18,15,"OC_ROUND_22");
	TA_Stand	(18,15,18,30,"OC_ROUND_17");	
	TA_SitCampfire	(18,30,18,45,"MIS_GRDPATROL1_1");
	TA_Stand	(18,45,18,59,"OC_ROUND_9");

	TA_SitCampfire	(19,00,19,15,"OC_ROUND_22");
	TA_Stand	(19,15,19,30,"OC_ROUND_17");
	TA_SitCampfire	(19,30,19,45,"MIS_GRDPATROL1_1");
	TA_Stand	(19,45,19,59,"OC_ROUND_9");

	TA_SitCampfire	(20,00,20,15,"OC_ROUND_22");
	TA_Stand	(20,15,20,30,"OC_ROUND_17");
	TA_SitCampfire	(20,30,20,45,"MIS_GRDPATROL1_1");
	TA_Stand	(20,45,20,59,"OC_ROUND_9");

	TA_SitCampfire	(21,00,21,15,"OC_ROUND_22");
	TA_Stand	(21,15,21,30,"OC_ROUND_17");
	TA_SitCampfire	(21,30,21,45,"MIS_GRDPATROL1_1");
	TA_Stand	(21,45,21,59,"OC_ROUND_9");

	TA_SitCampfire	(22,00,22,15,"OC_ROUND_22");
	TA_Stand	(22,15,22,30,"OC_ROUND_17");
	TA_SitCampfire	(22,30,22,45,"MIS_GRDPATROL1_1");
	TA_Stand	(22,45,22,59,"OC_ROUND_9");

	TA_SitCampfire	(23,00,23,15,"OC_ROUND_22");
	TA_Stand	(23,15,23,30,"OC_ROUND_17");
	TA_SitCampfire	(23,30,23,45,"MIS_GRDPATROL1_1");
	TA_Stand	(23,45,23,59,"OC_ROUND_9");
};

FUNC VOID Rtn_start_4077 ()
{
	TA_SitCampfire	(00,00,00,15,"OC_ROUND_22");
	TA_Stand	(00,15,00,30,"OC_ROUND_17");
	TA_SitCampfire	(00,30,00,45,"MIS_GRDPATROL1_1");
	TA_Stand	(00,45,00,59,"OC_ROUND_9");

	TA_SitCampfire	(01,00,01,15,"OC_ROUND_22");
	TA_Stand	(01,15,01,30,"OC_ROUND_17");	
	TA_SitCampfire	(01,30,01,45,"MIS_GRDPATROL1_1");
	TA_Stand	(01,45,01,59,"OC_ROUND_9");

	TA_SitCampfire	(02,00,02,15,"OC_ROUND_22");
	TA_Stand	(02,15,02,30,"OC_ROUND_17");	
	TA_SitCampfire	(02,30,02,45,"MIS_GRDPATROL1_1");
	TA_Stand	(02,45,02,59,"OC_ROUND_9");
	
	TA_SitCampfire	(03,00,03,15,"OC_ROUND_22");
	TA_Stand	(03,15,03,30,"OC_ROUND_17");		
	TA_SitCampfire	(03,30,03,45,"MIS_GRDPATROL1_1");
	TA_Stand	(03,45,03,59,"OC_ROUND_9");
	
	TA_SitCampfire	(04,00,04,15,"OC_ROUND_22");
	TA_Stand	(04,15,04,30,"OC_ROUND_17");			
	TA_SitCampfire	(04,30,04,45,"MIS_GRDPATROL1_1");
	TA_Stand	(04,45,04,59,"OC_ROUND_9");
	
	TA_SitCampfire	(05,00,05,15,"OC_ROUND_22");
	TA_Stand	(05,15,05,30,"OC_ROUND_17");	
	TA_SitCampfire	(05,30,05,45,"MIS_GRDPATROL1_1");
	TA_Stand	(05,45,05,59,"OC_ROUND_9");

	TA_SitCampfire	(06,00,06,15,"OC_ROUND_22");
	TA_Stand	(06,15,06,30,"OC_ROUND_17");	
	TA_SitCampfire	(06,30,06,45,"MIS_GRDPATROL1_1");
	TA_Stand	(06,45,06,59,"OC_ROUND_9");

	TA_SitCampfire	(07,00,07,15,"OC_ROUND_22");
	TA_Stand	(07,15,07,30,"OC_ROUND_17");	
	TA_SitCampfire	(07,30,07,45,"MIS_GRDPATROL1_1");
	TA_Stand	(07,45,07,59,"OC_ROUND_9");

	TA_SitCampfire	(08,00,08,15,"OC_ROUND_22");
	TA_Stand	(08,15,08,30,"OC_ROUND_17");	
	TA_SitCampfire	(08,30,08,45,"MIS_GRDPATROL1_1");
	TA_Stand	(08,45,08,59,"OC_ROUND_9");

	TA_SitCampfire	(09,00,09,15,"OC_ROUND_22");
	TA_Stand	(09,15,09,30,"OC_ROUND_17");	
	TA_SitCampfire	(09,30,09,45,"MIS_GRDPATROL1_1");
	TA_Stand	(09,45,09,59,"OC_ROUND_9");

	TA_SitCampfire	(10,00,10,15,"OC_ROUND_22");
	TA_Stand	(10,15,10,30,"OC_ROUND_17");	
	TA_SitCampfire	(10,30,10,45,"MIS_GRDPATROL1_1");
	TA_Stand	(10,45,10,59,"OC_ROUND_9");

	TA_SitCampfire	(11,00,11,15,"OC_ROUND_22");
	TA_Stand	(11,15,11,30,"OC_ROUND_17");	
	TA_SitCampfire	(11,30,11,45,"MIS_GRDPATROL1_1");
	TA_Stand	(11,45,11,59,"OC_ROUND_9");

	TA_SitCampfire	(12,00,12,15,"OC_ROUND_22");
	TA_Stand	(12,15,12,30,"OC_ROUND_17");		
	TA_SitCampfire	(12,30,12,45,"MIS_GRDPATROL1_1");
	TA_Stand	(12,45,12,59,"OC_ROUND_9");

	TA_SitCampfire	(13,00,13,15,"OC_ROUND_22");
	TA_Stand	(13,15,13,30,"OC_ROUND_17");	
	TA_SitCampfire	(13,30,13,45,"MIS_GRDPATROL1_1");
	TA_Stand	(13,45,13,59,"OC_ROUND_9");

	TA_SitCampfire	(14,00,14,15,"OC_ROUND_22");
	TA_Stand	(14,15,14,30,"OC_ROUND_17");	
	TA_SitCampfire	(14,30,14,45,"MIS_GRDPATROL1_1");
	TA_Stand	(14,45,14,59,"OC_ROUND_9");

	TA_SitCampfire	(00,15,15,15,"OC_ROUND_22");
	TA_Stand	(15,15,15,30,"OC_ROUND_17");	
	TA_SitCampfire	(15,30,15,45,"MIS_GRDPATROL1_1");
	TA_Stand(15,45,15,59,"OC_ROUND_9");

	TA_SitCampfire	(16,00,16,15,"OC_ROUND_22");
	TA_Stand	(16,15,16,30,"OC_ROUND_17");	
	TA_SitCampfire	(16,30,16,45,"MIS_GRDPATROL1_1");
	TA_Stand	(16,45,16,59,"OC_ROUND_9");

	TA_SitCampfire	(17,00,17,15,"OC_ROUND_22");
	TA_Stand	(17,15,17,30,"OC_ROUND_17");		
	TA_SitCampfire	(17,30,17,45,"MIS_GRDPATROL1_1");
	TA_Stand	(17,45,17,59,"OC_ROUND_9");

	TA_SitCampfire	(18,00,18,15,"OC_ROUND_22");
	TA_Stand	(18,15,18,30,"OC_ROUND_17");	
	TA_SitCampfire	(18,30,18,45,"MIS_GRDPATROL1_1");
	TA_Stand	(18,45,18,59,"OC_ROUND_9");

	TA_SitCampfire	(19,00,19,15,"OC_ROUND_22");
	TA_Stand	(19,15,19,30,"OC_ROUND_17");
	TA_SitCampfire	(19,30,19,45,"MIS_GRDPATROL1_1");
	TA_Stand	(19,45,19,59,"OC_ROUND_9");

	TA_SitCampfire	(20,00,20,15,"OC_ROUND_22");
	TA_Stand	(20,15,20,30,"OC_ROUND_17");
	TA_SitCampfire	(20,30,20,45,"MIS_GRDPATROL1_1");
	TA_Stand	(20,45,20,59,"OC_ROUND_9");

	TA_SitCampfire	(21,00,21,15,"OC_ROUND_22");
	TA_Stand	(21,15,21,30,"OC_ROUND_17");
	TA_SitCampfire	(21,30,21,45,"MIS_GRDPATROL1_1");
	TA_Stand	(21,45,21,59,"OC_ROUND_9");

	TA_SitCampfire	(22,00,22,15,"OC_ROUND_22");
	TA_Stand	(22,15,22,30,"OC_ROUND_17");
	TA_SitCampfire	(22,30,22,45,"MIS_GRDPATROL1_1");
	TA_Stand	(22,45,22,59,"OC_ROUND_9");

	TA_SitCampfire	(23,00,23,15,"OC_ROUND_22");
	TA_Stand	(23,15,23,30,"OC_ROUND_17");
	TA_SitCampfire	(23,30,23,45,"MIS_GRDPATROL1_1");
	TA_Stand	(23,45,23,59,"OC_ROUND_9");
};


FUNC VOID Rtn_start_4078 ()
{
	TA_Stand	(00,00,00,15,"OC_ROUND_17");
	TA_SitCampfire	(00,15,00,30,"MIS_GRDPATROL1_1");
	TA_Stand	(00,30,00,45,"OC_ROUND_9");
	TA_SitCampfire	(00,45,00,59,"OC_ROUND_22");

	TA_Stand	(01,00,01,15,"OC_ROUND_17");	
	TA_SitCampfire	(01,15,01,30,"MIS_GRDPATROL1_1");
	TA_Stand	(01,30,01,45,"OC_ROUND_9");
	TA_SitCampfire	(01,45,01,59,"OC_ROUND_22");

	TA_Stand	(02,00,02,15,"OC_ROUND_17");	
	TA_SitCampfire	(02,15,02,30,"MIS_GRDPATROL1_1");
	TA_Stand	(02,30,02,45,"OC_ROUND_9");
	TA_SitCampfire	(02,45,02,59,"OC_ROUND_22");
	
	TA_Stand	(03,00,03,15,"OC_ROUND_17");		
	TA_SitCampfire	(03,15,03,30,"MIS_GRDPATROL1_1");
	TA_Stand	(03,30,03,45,"OC_ROUND_9");
	TA_SitCampfire	(03,45,03,59,"OC_ROUND_22");
	
	TA_Stand	(04,00,04,15,"OC_ROUND_17");			
	TA_SitCampfire	(04,15,04,30,"MIS_GRDPATROL1_1");
	TA_Stand	(04,30,04,45,"OC_ROUND_9");
	TA_SitCampfire	(04,45,04,59,"OC_ROUND_22");
	
	TA_Stand	(05,00,05,15,"OC_ROUND_17");	
	TA_SitCampfire	(05,15,05,30,"MIS_GRDPATROL1_1");
	TA_Stand	(05,30,05,45,"OC_ROUND_9");
	TA_SitCampfire	(05,45,05,59,"OC_ROUND_22");

	TA_Stand	(06,00,06,15,"OC_ROUND_17");	
	TA_SitCampfire	(06,15,06,30,"MIS_GRDPATROL1_1");
	TA_Stand	(06,30,06,45,"OC_ROUND_9");
	TA_SitCampfire	(06,45,06,59,"OC_ROUND_22");

	TA_Stand	(07,00,07,15,"OC_ROUND_17");	
	TA_SitCampfire	(07,15,07,30,"MIS_GRDPATROL1_1");
	TA_Stand	(07,30,07,45,"OC_ROUND_9");
	TA_SitCampfire	(07,45,07,59,"OC_ROUND_22");

	TA_Stand	(08,00,08,15,"OC_ROUND_17");	
	TA_SitCampfire	(08,15,08,30,"MIS_GRDPATROL1_1");
	TA_Stand	(08,30,08,45,"OC_ROUND_9");
	TA_SitCampfire	(08,45,08,59,"OC_ROUND_22");

	TA_Stand	(09,00,09,15,"OC_ROUND_17");	
	TA_SitCampfire	(09,15,09,30,"MIS_GRDPATROL1_1");
	TA_Stand	(09,30,09,45,"OC_ROUND_9");
	TA_SitCampfire	(09,45,09,59,"OC_ROUND_22");

	TA_Stand	(10,00,10,15,"OC_ROUND_17");	
	TA_SitCampfire	(10,15,10,30,"MIS_GRDPATROL1_1");
	TA_Stand	(10,30,10,45,"OC_ROUND_9");
	TA_SitCampfire	(10,45,10,59,"OC_ROUND_22");

	TA_Stand	(11,00,11,15,"OC_ROUND_17");	
	TA_SitCampfire	(11,15,11,30,"MIS_GRDPATROL1_1");
	TA_Stand	(11,30,11,45,"OC_ROUND_9");
	TA_SitCampfire	(11,45,11,59,"OC_ROUND_22");

	TA_Stand	(12,00,12,15,"OC_ROUND_17");		
	TA_SitCampfire	(12,15,12,30,"MIS_GRDPATROL1_1");
	TA_Stand	(12,30,12,45,"OC_ROUND_9");
	TA_SitCampfire	(12,45,12,59,"OC_ROUND_22");

	TA_Stand	(13,00,13,15,"OC_ROUND_17");	
	TA_SitCampfire	(13,15,13,30,"MIS_GRDPATROL1_1");
	TA_Stand	(13,30,13,45,"OC_ROUND_9");
	TA_SitCampfire	(13,45,13,59,"OC_ROUND_22");

	TA_Stand	(14,00,14,15,"OC_ROUND_17");	
	TA_SitCampfire	(14,15,14,30,"MIS_GRDPATROL1_1");
	TA_Stand	(14,30,14,45,"OC_ROUND_9");
	TA_SitCampfire	(14,45,14,59,"OC_ROUND_22");

	TA_Stand	(15,00,15,15,"OC_ROUND_17");	
	TA_SitCampfire	(15,15,15,30,"MIS_GRDPATROL1_1");
	TA_Stand (15,30,15,45,"OC_ROUND_9");
	TA_SitCampfire	(15,59,15,15,"OC_ROUND_22");

	TA_SitCampfire	(16,00,16,15,"MIS_GRDPATROL1_1");
	TA_Stand	(16,15,16,30,"OC_ROUND_9");
	TA_SitCampfire	(16,30,16,45,"OC_ROUND_22");
	TA_Stand	(16,45,16,59,"OC_ROUND_17");	

	TA_Stand	(17,00,17,15,"OC_ROUND_17");		
	TA_SitCampfire	(17,15,17,30,"MIS_GRDPATROL1_1");
	TA_Stand	(17,30,17,45,"OC_ROUND_9");
	TA_SitCampfire	(17,45,17,59,"OC_ROUND_22");

	TA_Stand	(18,00,18,15,"OC_ROUND_17");	
	TA_SitCampfire	(18,15,18,30,"MIS_GRDPATROL1_1");
	TA_Stand	(18,30,18,45,"OC_ROUND_9");
	TA_SitCampfire	(18,45,18,59,"OC_ROUND_22");

	TA_Stand	(19,00,19,15,"OC_ROUND_17");
	TA_SitCampfire	(19,15,19,30,"MIS_GRDPATROL1_1");
	TA_Stand	(19,30,19,45,"OC_ROUND_9");
	TA_SitCampfire	(19,45,19,59,"OC_ROUND_22");

	TA_Stand	(20,00,20,15,"OC_ROUND_17");
	TA_SitCampfire	(20,15,20,30,"MIS_GRDPATROL1_1");
	TA_Stand	(20,30,20,45,"OC_ROUND_9");
	TA_SitCampfire	(20,45,20,59,"OC_ROUND_22");

	TA_Stand	(21,00,21,15,"OC_ROUND_17");
	TA_SitCampfire	(21,15,21,30,"MIS_GRDPATROL1_1");
	TA_Stand	(21,30,21,45,"OC_ROUND_9");
	TA_SitCampfire	(21,45,21,59,"OC_ROUND_22");

	TA_Stand	(22,00,22,15,"OC_ROUND_17");
	TA_SitCampfire	(22,15,22,30,"MIS_GRDPATROL1_1");
	TA_Stand	(22,30,22,45,"OC_ROUND_9");
	TA_SitCampfire	(22,45,22,59,"OC_ROUND_22");

	TA_Stand	(23,00,23,15,"OC_ROUND_17");
	TA_SitCampfire	(23,15,23,30,"MIS_GRDPATROL1_1");
	TA_Stand	(23,30,23,45,"OC_ROUND_9");
	TA_SitCampfire	(23,45,23,59,"OC_ROUND_22");
};
FUNC VOID Rtn_start_4079 ()
{
	TA_Stand	(00,00,00,15,"OC_ROUND_17");
	TA_SitCampfire	(00,15,00,30,"MIS_GRDPATROL1_1");
	TA_Stand	(00,30,00,45,"OC_ROUND_9");
	TA_SitCampfire	(00,45,00,59,"OC_ROUND_22");

	TA_Stand	(01,00,01,15,"OC_ROUND_17");	
	TA_SitCampfire	(01,15,01,30,"MIS_GRDPATROL1_1");
	TA_Stand	(01,30,01,45,"OC_ROUND_9");
	TA_SitCampfire	(01,45,01,59,"OC_ROUND_22");

	TA_Stand	(02,00,02,15,"OC_ROUND_17");	
	TA_SitCampfire	(02,15,02,30,"MIS_GRDPATROL1_1");
	TA_Stand	(02,30,02,45,"OC_ROUND_9");
	TA_SitCampfire	(02,45,02,59,"OC_ROUND_22");
	
	TA_Stand	(03,00,03,15,"OC_ROUND_17");		
	TA_SitCampfire	(03,15,03,30,"MIS_GRDPATROL1_1");
	TA_Stand	(03,30,03,45,"OC_ROUND_9");
	TA_SitCampfire	(03,45,03,59,"OC_ROUND_22");
	
	TA_Stand	(04,00,04,15,"OC_ROUND_17");			
	TA_SitCampfire	(04,15,04,30,"MIS_GRDPATROL1_1");
	TA_Stand	(04,30,04,45,"OC_ROUND_9");
	TA_SitCampfire	(04,45,04,59,"OC_ROUND_22");
	
	TA_Stand	(05,00,05,15,"OC_ROUND_17");	
	TA_SitCampfire	(05,15,05,30,"MIS_GRDPATROL1_1");
	TA_Stand	(05,30,05,45,"OC_ROUND_9");
	TA_SitCampfire	(05,45,05,59,"OC_ROUND_22");

	TA_Stand	(06,00,06,15,"OC_ROUND_17");	
	TA_SitCampfire	(06,15,06,30,"MIS_GRDPATROL1_1");
	TA_Stand	(06,30,06,45,"OC_ROUND_9");
	TA_SitCampfire	(06,45,06,59,"OC_ROUND_22");

	TA_Stand	(07,00,07,15,"OC_ROUND_17");	
	TA_SitCampfire	(07,15,07,30,"MIS_GRDPATROL1_1");
	TA_Stand	(07,30,07,45,"OC_ROUND_9");
	TA_SitCampfire	(07,45,07,59,"OC_ROUND_22");

	TA_Stand	(08,00,08,15,"OC_ROUND_17");	
	TA_SitCampfire	(08,15,08,30,"MIS_GRDPATROL1_1");
	TA_Stand	(08,30,08,45,"OC_ROUND_9");
	TA_SitCampfire	(08,45,08,59,"OC_ROUND_22");

	TA_Stand	(09,00,09,15,"OC_ROUND_17");	
	TA_SitCampfire	(09,15,09,30,"MIS_GRDPATROL1_1");
	TA_Stand	(09,30,09,45,"OC_ROUND_9");
	TA_SitCampfire	(09,45,09,59,"OC_ROUND_22");

	TA_Stand	(10,00,10,15,"OC_ROUND_17");	
	TA_SitCampfire	(10,15,10,30,"MIS_GRDPATROL1_1");
	TA_Stand	(10,30,10,45,"OC_ROUND_9");
	TA_SitCampfire	(10,45,10,59,"OC_ROUND_22");

	TA_Stand	(11,00,11,15,"OC_ROUND_17");	
	TA_SitCampfire	(11,15,11,30,"MIS_GRDPATROL1_1");
	TA_Stand	(11,30,11,45,"OC_ROUND_9");
	TA_SitCampfire	(11,45,11,59,"OC_ROUND_22");

	TA_Stand	(12,00,12,15,"OC_ROUND_17");		
	TA_SitCampfire	(12,15,12,30,"MIS_GRDPATROL1_1");
	TA_Stand	(12,30,12,45,"OC_ROUND_9");
	TA_SitCampfire	(12,45,12,59,"OC_ROUND_22");

	TA_Stand	(13,00,13,15,"OC_ROUND_17");	
	TA_SitCampfire	(13,15,13,30,"MIS_GRDPATROL1_1");
	TA_Stand	(13,30,13,45,"OC_ROUND_9");
	TA_SitCampfire	(13,45,13,59,"OC_ROUND_22");

	TA_Stand	(14,00,14,15,"OC_ROUND_17");	
	TA_SitCampfire	(14,15,14,30,"MIS_GRDPATROL1_1");
	TA_Stand	(14,30,14,45,"OC_ROUND_9");
	TA_SitCampfire	(14,45,14,59,"OC_ROUND_22");

	TA_Stand	(15,00,15,15,"OC_ROUND_17");	
	TA_SitCampfire	(15,15,15,30,"MIS_GRDPATROL1_1");
	TA_Stand (15,30,15,45,"OC_ROUND_9");
	TA_SitCampfire	(15,59,15,15,"OC_ROUND_22");

	TA_SitCampfire	(16,00,16,15,"MIS_GRDPATROL1_1");
	TA_Stand	(16,15,16,30,"OC_ROUND_9");
	TA_SitCampfire	(16,30,16,45,"OC_ROUND_22");
	TA_Stand	(16,45,16,59,"OC_ROUND_17");	

	TA_Stand	(17,00,17,15,"OC_ROUND_17");		
	TA_SitCampfire	(17,15,17,30,"MIS_GRDPATROL1_1");
	TA_Stand	(17,30,17,45,"OC_ROUND_9");
	TA_SitCampfire	(17,45,17,59,"OC_ROUND_22");

	TA_Stand	(18,00,18,15,"OC_ROUND_17");	
	TA_SitCampfire	(18,15,18,30,"MIS_GRDPATROL1_1");
	TA_Stand	(18,30,18,45,"OC_ROUND_9");
	TA_SitCampfire	(18,45,18,59,"OC_ROUND_22");

	TA_Stand	(19,00,19,15,"OC_ROUND_17");
	TA_SitCampfire	(19,15,19,30,"MIS_GRDPATROL1_1");
	TA_Stand	(19,30,19,45,"OC_ROUND_9");
	TA_SitCampfire	(19,45,19,59,"OC_ROUND_22");

	TA_Stand	(20,00,20,15,"OC_ROUND_17");
	TA_SitCampfire	(20,15,20,30,"MIS_GRDPATROL1_1");
	TA_Stand	(20,30,20,45,"OC_ROUND_9");
	TA_SitCampfire	(20,45,20,59,"OC_ROUND_22");

	TA_Stand	(21,00,21,15,"OC_ROUND_17");
	TA_SitCampfire	(21,15,21,30,"MIS_GRDPATROL1_1");
	TA_Stand	(21,30,21,45,"OC_ROUND_9");
	TA_SitCampfire	(21,45,21,59,"OC_ROUND_22");

	TA_Stand	(22,00,22,15,"OC_ROUND_17");
	TA_SitCampfire	(22,15,22,30,"MIS_GRDPATROL1_1");
	TA_Stand	(22,30,22,45,"OC_ROUND_9");
	TA_SitCampfire	(22,45,22,59,"OC_ROUND_22");

	TA_Stand	(23,00,23,15,"OC_ROUND_17");
	TA_SitCampfire	(23,15,23,30,"MIS_GRDPATROL1_1");
	TA_Stand	(23,30,23,45,"OC_ROUND_9");
	TA_SitCampfire	(23,45,23,59,"OC_ROUND_22");
};
