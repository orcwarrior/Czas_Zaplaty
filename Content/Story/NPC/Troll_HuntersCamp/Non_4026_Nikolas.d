instance Non_4026_Nikolas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Nikolas";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	22;
	voice 		=  	9;
	id 			=   4026;
	spawnDelay	=	NPC_FLAG_BRAVE;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 150;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]  = 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Pony",1,1,TH_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
	//-------- inventory --------
	
	EquipItem	(self,HUN_MW_05);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItems (self,ItAmBolt,50);
	CreateInvItems (self,ItMiNugget,100);
	CreateInvItem (self,ItFo_Potion_Health_02);
	CreateInvItem (self,ItLsTorch);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_3);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4026;
};

FUNC VOID Rtn_Start_4026 ()
{	
	TA_SitAround (06,00,12,00,"TH_BENCH_NIKOLAS");
	TA_SitAround (16,00,06,00,"TH_BENCH_NIKOLAS");
	TA_SmallTalk	(12,00,16,00,"TH_PATH_01");
	

};
FUNC VOID Rtn_HUNT_4026 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4026 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4026 ()
{	
	TA_Guard	(06,00,16,00,"LOCATION_14_04");
	TA_Guard	(16,00,06,00,"LOCATION_14_04");
};