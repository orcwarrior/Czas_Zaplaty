
instance Non_4021_Bukhart (Npc_Default)
{
	//-------- primary data --------
	name 		=	"Bukhart";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	28;
	voice 		=  	11;
	id 			=   4021;
	spawnDelay	=	NPC_FLAG_BRAVE;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 150;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 480;
	attribute[ATR_HITPOINTS] 	= 480;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");

	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",79,1,TH_ARMOR_H);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
   fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- inventory --------
	
	EquipItem			(self,GRD_MW_04);
	CreateInvItems (self,ItKeLockpick,3);		
	CreateInvItems (self,ItFoRice,8);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,3);
	CreateInvItem (self,ItMi_Stuff_Plate_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItems (self,ItFoMutton,2);
	CreateInvItems (self,ItFoLoaf,4);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItems (self,ItMiNugget,23);
	CreateInvItems (self,ItFo_Potion_Health_02,6);
	CreateInvItems (self,ItLsTorch,6);
	CreateInvItems (self,ItMiSwordBlade,10);
	CreateInvItem (self,ItFoSoup);
	CreateInvItems (self,ItMiJoint_1,1);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4021;
};

FUNC VOID Rtn_Start_4021 ()
{	
	TA_SitAround (10,00,20,00,"TH_BENCH_02");
	TA_SitAround (22,00,10,00,"TH_BENCH_02");
	TA_SmallTalk	(20,00,22,00,"TH_ENTRANCE");
};

FUNC VOID Rtn_Thief_4021()
{	
	TA_SitAround(03,00,20,00,"TH_BENCH_02");
	TA_BOSS(20,00,0,19,"TH_PATH_02");
   TA_Bukhart_Steal(0,19,03,00,"TH_MAGAZINE_CHESTS");//rutyna z grzebaniem w paczkach;	
};

FUNC VOID Rtn_HUNT_4021 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};

FUNC VOID Rtn_EnforceOR_4021 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
};

FUNC VOID Rtn_NC3_4021 ()
{	
	TA_Guard	(06,00,16,00,"MIS_GRDPATROL1_4");
	TA_Guard	(16,00,06,00,"MIS_GRDPATROL1_4");
};
