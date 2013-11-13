instance HUN_309_Whistler (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Œwistak";
	npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_HUN;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		309;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	80;
	attribute[ATR_DEXTERITY] 		=	60;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	300;
	attribute[ATR_HITPOINTS] 		=	300;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     57,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",97 ,1,HUN_ARMOR_M);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);			
	//-------- inventory --------
	
	EquipItem	(self,Whistlers_Schwert);
	EquipItem	(self,HUN_RW_03);
	CreateInvItems	(self,ItAmBolt,20);
	CreateInvItems	(self,ItKeLockpick,1);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_309;

	// //MISSION[0] = Mis_1_OC_Whistler_StealAxe;
};

FUNC VOID Rtn_start_309 ()
{
	TA_SitCampfire		(02,00,08,00,"SIT_JIRHO");
	TA_SitAround		(08,00,11,30,"PATHER");
	TA_SitCampfireEat 	(11,30,15,00,"SIT_JIRHO");
	TA_SitAround		(15,00,00,05,"MORDRAG");
	TA_SitCampfireEat	(00,05,02,00,"SIT_JIRHO");
};
FUNC VOID Rtn_preparation_309 ()
{
	TA_SitCampfire		(04,00,07,00,"SIT_JIRHO");
	TA_SitAround		(07,00,7,30,"PATHER");
	TA_RepairHut 			(11,30,15,00,"HC_PALISADE_REPAIR_1");
	TA_SitAround		(15,00,16,05,"PATHER");
	TA_RepairHut	(16,05,02,00,"HC_PALISADE_REPAIR_1");
};
FUNC VOID Rtn_OR_309 ()
{
	TA_SitCampfire		(02,00,08,00,"SIT_JIRHO");
	TA_SitAround		(08,00,11,30,"PATHER");
	TA_SitCampfireEat 	(11,30,15,00,"SIT_JIRHO");
	TA_Smoke			(15,00,00,00,"SIT_CAMPFIRE_KTOS");	
	TA_Smith_Sharp		(00,00,02,00,"OM_SMITH_02");
};
func VOID Rtn_Alarm_309 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR6"); 
	 
};

FUNC VOID Rtn_mourder_309 ()
{
Ta_Stand (0,00,12,00,"SWISTAK_M"); 
Ta_Stand (12,00,0,00,"SWISTAK_M"); 
};
