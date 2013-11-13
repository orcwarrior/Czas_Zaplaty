instance Non_4024_Snow (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Snow";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	25;
	voice 		=  	2;
	id 			=   4024;
	spawnDelay	=	NPC_FLAG_BRAVE;

		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 160;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds (self,"Humans_Mage.mds");   
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",51,1,TH_ARMOR_L);
	     
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- inventory --------
	
	EquipItem	(self,HUN_MW_02);
	CreateInvItems(self,ItMiNugget,12);
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,ItFo_Potion_Health_02);
	CreateInvItem (self,ItLsTorch);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_3);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4024;
};

FUNC VOID Rtn_Start_4024 ()
{	
	TA_Stand (06,00,12,30,"TH_SNOW");
	TA_SmallTalk	(12,00,16,00,"TH_PATH_02");
	TA_Stand (16,00,20,30,"TH_SNOW");
	
	TA_SitCampfire (20,30,06,00,"TH_CAMPFIRE");
	
};

FUNC VOID Rtn_HUNT_4024 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4024 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4024 ()
{	
	TA_Guard	(06,00,16,00,"MIS_GRDPATROL1_3");
	TA_Guard	(16,00,06,00,"MIS_GRDPATROL1_3");
};