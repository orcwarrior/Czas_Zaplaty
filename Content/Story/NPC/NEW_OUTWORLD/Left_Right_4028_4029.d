instance NON_4028_Left (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Lewy";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	8;
	voice 		=	13;
	id 			=	4028;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 100;
	attribute[ATR_HITPOINTS] 	= 100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",13,1,STT_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,ALL_MW_03);
	EquipItem	(self,ALL_RW_01);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItKeLeftChest);
	CreateInvItem	(self,ItLsTorch);

	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4028;
};

FUNC VOID Rtn_start_4028 ()
{
	TA_SitCampfire	(00,00,06,00,"OW_LEFT_RIGHT_CAMP");
	TA_SitCampfire	(06,00,24,00,"OW_LEFT_RIGHT_CAMP");
};

instance NON_4029_Right (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Prawy";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=	10;
	voice		=	7;
	id 			=	4029;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 120;
	attribute[ATR_HITPOINTS] 	= 120;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",3,1,STT_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,ALL_MW_03);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,14);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4029;
};

FUNC VOID Rtn_start_4029 ()
{
	TA_SitCampfire	(00,00,06,00,"OW_LEFT_RIGHT_CAMP");
	TA_SitCampfire	(06,00,24,00,"OW_LEFT_RIGHT_CAMP");
};


