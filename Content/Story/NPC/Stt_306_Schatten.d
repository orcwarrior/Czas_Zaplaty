instance STT_306_Schatten (Npc_Default)
{
	//-------- primary data --------
	name 		=		NAME_Schatten;
	npctype 		=		NPCTYPE_AMBIENT;
	guild 		=		GIL_GRD;
	level 		=		11;
	
	
	voice 		=		12;
	id 			=		306;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	35;
	attribute[ATR_DEXTERITY] 		=	58;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	144;
	attribute[ATR_HITPOINTS] 		=	144;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",12,1,STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Short_03);
	EquipItem	(self,ItRw_Bow_Small_02);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_306;
};

FUNC VOID Rtn_start_306 () //Arenaplatz
{
	TA_Sleep	    (23,00,08,05,"OCR_HUT_27");
	TA_Stand	(08,05,12,00,"OCR_OUTSIDE_HUT_27_MOVEMENT"); 
	TA_SitAround	(12,00,19,05,"OCC_CENTER_4");
	TA_ArenaSpectator(19,05,23,00,"OCR_ARENA_07");
};
