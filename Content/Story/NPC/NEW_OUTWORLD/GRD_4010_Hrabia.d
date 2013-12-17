instance GRD_4010_Hrabia (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Hrabia";
	npctype 	= 	npctype_main;
   guild 		=	GIL_NONE;
	level 		=	50;
	voice 		=	11;
	id 			=	4010;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 190;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 488;
	attribute[ATR_HITPOINTS] 	= 488;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",13,1,EBR_ARMOR_H2);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------  	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Earl_Sword);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,Ring_des_Geschicks);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4010;
};

FUNC VOID Rtn_start_4010 ()
{
	TA_Boss			(02,05,07,35,"NC_EN_EARLHEADQUARTERS_EARL");
	TA_Stand		(07,35,21,10,"NC_EN_EARLHEADQUARTERS_01");
	TA_StandAround		(21,10,02,05,"NC_EN_EARLHEADQUARTERS_EARL");
};
FUNC VOID Rtn_pachotreasure_4010 ()
{
	TA_FollowPc		(21,10,21,09,"OW_PATH_WARAN05_SPAWN02");
};

FUNC VOID Rtn_TRAP1_4010 ()
{
	TA_Boss			(07,00,22,00,"OW_PATH_225");
	TA_Boss			(22,00,07,00,"OW_PATH_225");
};

FUNC VOID Rtn_HIDE_4010 ()
{
	TA_Boss			(07,00,22,00,"WP_INTRO_WI05");
	TA_Boss			(22,00,07,00,"WP_INTRO_WI05");
};

FUNC VOID Rtn_OR3_4010 ()
{
	TA_Boss			(07,00,22,00,"NEWPATH_4");
	TA_Boss			(22,00,07,00,"NEWPATH_4");
};

FUNC VOID Rtn_OR4_4010 ()
{
	TA_Boss			(07,00,22,00,"OW_PATH_TEMPELRUIN07");
	TA_Boss			(22,00,07,00,"OW_PATH_TEMPELRUIN07");
};

FUNC VOID Rtn_WaitInEN_611 ()
{
	TA_Guard		(07,00,20,00,"NC_EN_TAVERN_03");
	TA_Guard		(20,00,07,00,"NC_EN_TAVERN_03");
};

FUNC VOID Rtn_death_4010 ()
{
	TA_Boss			(07,00,22,00,"NIA_INSPECT");
	TA_Boss			(22,00,07,00,"NIA_INSPECT");
};
