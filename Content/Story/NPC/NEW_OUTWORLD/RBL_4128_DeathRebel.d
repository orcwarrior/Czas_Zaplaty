instance RBL_4128_DeathRebel (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Martwy rebeliant";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		15;
	
	voice 		=		10;
	id 			=		4128;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		80;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",26,2,RBL_ARMOR_L);
        
   B_Scale (self);
	Mdl_SetModelFatness(self,1);
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
   Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	EquipItem 	(self,RBL_MW_04); 
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,26);
	CreateInvItem (self, ItMi_Stuff_OldCoin_02);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4128;
};

FUNC VOID Rtn_start_4128 ()
{
   TA_Stand      	(06,00,22,00,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY1");    //
   TA_Stand             (22,00,06,00,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY1");    //
};
