instance RBL_4030_Skrzek (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Skrzek";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		22;
	
	voice 		=		10;
	id 			=		2614;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		80;
	attribute[ATR_DEXTERITY] 		=		80;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",53,2,RBL_ARMOR_H);
        
   B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	CreateInvItem	(self,Recept_ItMw_1H_Sword_Long_02);	
	EquipItem	(self,RBL_MW_04);
	EquipItem	(self,HUN_RW_03);
	CreateInvItems	(self,ItAmArrow,50);
	CreateInvItems	(self,ItMiNugget,200);
	CreateInvItem (self,ItFoSoup);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4030;
};

FUNC VOID Rtn_start_4030 ()
{
    TA_SitAround        (12,00,24,00,"BRIDGE_CASTLE_TO_PLATEAU");
    TA_SitAround        (00,00,12,00,"BRIDGE_CASTLE_TO_PLATEAU");
    
};

