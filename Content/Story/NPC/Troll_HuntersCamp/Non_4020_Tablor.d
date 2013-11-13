

instance Non_4020_Tablor (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Tablor";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	30;
	voice 		=  	9;
	id 			=   4020;
	spawnDelay	=	NPC_FLAG_BRAVE;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 190;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald",97,0,TH_ARMOR_L);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	

    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;




	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItems (self,ItKeLockpick,6);		
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItems (self,ItMi_Stuff_Plate_01,2);
	CreateInvItems (self,ItMi_Stuff_Cup_01,3);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems (self,ItFoLoaf,8);
	CreateInvItems (self,ItAt_Teeth_01,3);
	CreateInvItems (self,ItAmBolt,30);
	CreateInvItems (self,ItMiNugget,45);
	CreateInvItems (self,ItFo_Potion_Health_02,2);
	CreateInvItems (self,ItLsTorch,5);
	CreateInvItems (self,ItFoSoup,5);
	CreateInvItems (self,ItMiJoint_3,5);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4020;
};



FUNC VOID Rtn_Start_4020 ()
{	

	TA_SitCampfire (22,30,08,00,"TH_CAMPFIRE"); 
	TA_PracticeSword (08,00,12,30,"TH_TALBOR");
	TA_SmallTalk	(12,00,16,00,"TH_PATH_02");
	TA_PracticeSword (16,00,22,30,"TH_TALBOR");
	
};

FUNC VOID Rtn_HUNT_4020 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4020 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4020 ()
{	
	TA_Guard	(06,00,16,00,"MIS_GRDPATROL1_2");
	TA_Guard	(16,00,06,00,"MIS_GRDPATROL1_2");
};