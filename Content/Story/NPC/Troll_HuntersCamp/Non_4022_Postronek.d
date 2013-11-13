instance Non_4022_Postronek (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Postronek";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	26;
	voice 		=  	6;
	id 			=   4022;
	spawnDelay	=	NPC_FLAG_BRAVE;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 140;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Thief",6,2,TH_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	//-------- inventory --------
	
	EquipItem	(self,ItMw_2h_Post);
	CreateInvItems(self,ItMiNugget,18);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItems (self,ItAmArrow,350);
	CreateInvItems (self,ItMiNugget,32);
	CreateInvItems (self,ItFo_Potion_Health_02,5);
	CreateInvItem (self,ItLsTorch);
	CreateInvItems (self,ItMiJoint_2,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4022;
};

FUNC VOID Rtn_Start_4022 ()
{	

	TA_Stand (06,00,09,00,"TH_EXIT");
	TA_Smith_Sharp (09,00,12,00,"TH_SHARP");
	TA_Stand (12,00,14,00,"TH_EXIT");
	TA_Smith_Sharp (14,00,18,00,"TH_SHARP");
	TA_Stand (18,00,23,00,"TH_EXIT");
	TA_SitCampfire (23,00,06,00,"TH_CAMPFIRE");
};

FUNC VOID Rtn_HUNT_4022 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4022 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4022 ()
{	
	TA_Guard	(06,00,16,00,"MIS_GRDPATROL1_1");
	TA_Guard	(16,00,06,00,"MIS_GRDPATROL1_1");
};