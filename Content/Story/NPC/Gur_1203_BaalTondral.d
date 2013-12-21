instance GUR_1203_BaalTondral (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tondral";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_PIR;
	level 		=		28;
	flags 		=		NPC_FLAG_FRIEND;
	
	voice 		=		13;
	id 			=		1203;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;
    protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",24,2,GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- inventory --------
	CreateInvItem(self,ItArRuneWindfist);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1203;
};

FUNC VOID Rtn_start_1203 ()
{
    TA_Stand(23,00,07,45,"GO");
    TA_Teaching(07,45,23,00,"GO");	
};

FUNC VOID Rtn_Guide_1203 () 
{ 
   Ta_GuidePC (0,00,12,00,"PATH_OC_PSI_19"); 
   Ta_GuidePC (12,00,0,00,"PATH_OC_PSI_19"); 
}; 

FUNC VOID Rtn_GuideToTemple_1203 () 
{ 
   Ta_GuidePC (0,00,12,00,"PSI_TEMPLE_COURT_GURU"); 
   Ta_GuidePC (12,00,0,00,"PSI_TEMPLE_COURT_GURU"); 
}; 

FUNC VOID Rtn_Dead_1203 () 
{ 
   Ta_GuidePC (0,00,12,00,"PSI_TEMPLE_IN_1"); 
   Ta_GuidePC (12,00,0,00,"PSI_TEMPLE_IN_1"); 
}; 

FUNC VOID Rtn_GoToDeath_1203 () 
{ 
   TA_Stand(0,00,12,00,"PSI_TEMPLE_IN_1"); 
   TA_Stand(12,00,0,00,"PSI_TEMPLE_IN_1"); 
}; 

instance GUR_12030_BaalTondral_Dream (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tondral";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_GUR;
	level 		=		28;
	flags 		=		0;
	
	voice 		=		13;
	id 			=		12030;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",24,2,GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- inventory --------
	CreateInvItem(self,ItArRuneWindfist);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_12030;
};

FUNC VOID Rtn_start_12030 ()
{
	TA_FollowPC(02,00,14,00, hero.wp);	
	TA_FollowPC(14,00,02,00, hero.wp);
};