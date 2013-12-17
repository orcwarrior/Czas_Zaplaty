instance HUN_5555_Cav (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Cavalorn";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_HUN;
	level 		=		50;
	Npctype			= NPCTYPE_FRIEND;
	flags       =   NPC_FLAG_IMMORTAL;
	voice 		=		12;
	id 			=		5555;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	150;
	attribute[ATR_DEXTERITY] 		=	140;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	self.level*12+200;
	attribute[ATR_HITPOINTS] 		=	self.level*12+200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,HUN_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);
	//Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  ( 6));
		
	//-------- inventory --------
	EquipItem	(self,HUN_MW_03);
	EquipItem	(self,HUN_RW_02);
	CreateInvItems	(self,ItAmArrow,31);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_5555;
};

 FUNC VOID Rtn_START_5555 () 
{ 
   Ta_Boss (0,00,12,00,"DUNG1"); 
   Ta_Boss (12,00,0,00,"DUNG1"); 
};

FUNC VOID Rtn_GUIDE_5555 () //podzieliæ drogê
{ 
   Ta_GuidePC (0,00,12,00,"DUNG5"); 
   Ta_GuidePC (12,00,0,00,"DUNG5"); 
};

FUNC VOID Rtn_GUIDE2_5555 ()
{ 
   Ta_GuidePC (0,00,12,00,"DUNG22"); 
   Ta_GuidePC (12,00,0,00,"DUNG22"); 
};

FUNC VOID Rtn_GUIDE3_5555 ()
{ 
   Ta_GuidePC (0,00,12,00,"DUNG32"); 
   Ta_GuidePC (12,00,0,00,"DUNG32"); 
};

FUNC VOID Rtn_GUIDE4_5555 ()
{ 
   Ta_GuidePC (0,00,12,00,"DUNG36"); 
   Ta_GuidePC (12,00,0,00,"DUNG36"); 
};

FUNC VOID Rtn_GUIDE5_5555 ()
{ 
   Ta_GuidePC (0,00,12,00,"DUNG46"); 
   Ta_GuidePC (12,00,0,00,"DUNG46"); 
};
 
 FUNC VOID Rtn_DEAD_5555 () 
{
	TA_Drained_YBerion	(23,00,07,00,"DUNG46");
   TA_Drained_YBerion	(07,00,23,00,"DUNG46");	
};
