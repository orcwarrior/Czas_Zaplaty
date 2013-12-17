instance GUR_1204_BaalNamib (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Baal Namib";
	Npctype 	=	NPCTYPE_MAIN;
	guild 		=	GIL_GUR;
	level 		=	29;
	flags		= 	NPC_FLAG_IMMORTAL;
	voice 		=	2;
	id 			=	1204;
			
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	55;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",20,1,GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- inventory --------
	CreateInvItem(self,ItArRuneSleep);
	
	CreateInvItem (self,Namibs_Keule);
	
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_1204;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_Start_1204 ()
{
	TA_Smalltalk 	(08,00,20,00,"PSI_PATH_1");
	TA_Smalltalk 	(20,00,08,00,"PSI_PATH_1");
};
