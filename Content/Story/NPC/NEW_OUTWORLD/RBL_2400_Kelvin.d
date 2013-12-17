instance RBL_2400_Kelvin (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Kelvin";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		22;
	
	
	voice 		=		11;
	id 			=		2400;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		136;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fatbald",7,2,GRD_ARMOR_H);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	CreateInvItem	(self,kevin_diary);	
	CreateInvItem	(self,ITKE_STORAGE_01);	
	CreateInvItem	(self,ITKE_GOMEZ_01);	
		EquipItem	(self,GRD_MW_03);
	CreateInvItems	(self,ItAmArrow,10);
	CreateInvItems	(self,ItMiNugget,210);
	CreateInvItem (self,ItFoWine);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2400;
};

FUNC VOID Rtn_start_2400 ()
{
    TA_STAND            (06,00,22,00,"OCC_GUARD_ROOM_BACK2");
    TA_STAND	        (22,00,06,00,"OCC_GUARD_ROOM_BACK2");
};

