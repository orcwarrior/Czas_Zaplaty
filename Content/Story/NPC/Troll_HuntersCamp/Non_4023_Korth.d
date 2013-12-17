instance Non_4023_Korth (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Korth";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	25;
	voice 		=  	11;
	id 			=   4023;
	spawnDelay	=	NPC_FLAG_BRAVE;

		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 130;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",51,4,TH_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	//-------- inventory --------
	
	EquipItem	(self,HUN_MW_03);
	EquipItem	(self,HUN_RW_02);

	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems(self,ItMiNugget,1);
	CreateInvItems (self,ItFoRice,2);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItems (self,ItAmArrow,30);
	CreateInvItems (self,ItMiNugget,41);
	CreateInvItems (self,ItFo_Potion_Health_02,2);
	CreateInvItems (self,ItLsTorch,4);
	CreateInvItems (self,ItFoSoup,4);


	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_4023;
};

FUNC VOID Rtn_PreStart_4023 ()
{	
	TA_Boss	(22,00,16,00,"TH_ENTRANCE");
	TA_Boss	(16,00,20,00,"TH_ENTRANCE");
	TA_SmallTalk	(20,00,22,00,"TH_ENTRANCE");
	
};

FUNC VOID Rtn_Start_4023 ()
{	
	TA_Guard	(06,00,12,00,"SPAWN_KORTH");
	TA_StandAround (12,00,14,00,"KORTH_EAT");
	TA_Guard (14,00,22,00,"SPAWN_KORTH");
	TA_PracticeSword (22,00,24,00,"KORTH_SWORD");
	TA_Guard (24,00,04,00,"SPAWN_KORTH");
	TA_PracticeSword (04,00,05,00,"KORTH_SWORD");
	TA_StandAround (05,00,06,00,"KORTH_EAT");
};

FUNC VOID Rtn_HUNT_4023 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4023 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4023 ()
{	
	TA_Guard	(06,00,16,00,"SPAWN_OW_WARAN_OC_PSI3");
	TA_Guard	(16,00,06,00,"SPAWN_OW_WARAN_OC_PSI3");
};