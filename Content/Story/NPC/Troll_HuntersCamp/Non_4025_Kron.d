instance Non_4025_Kron (Npc_Default)//ORC
{
	//-------- primary data --------
	
	name 		=	"Kron";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_NONE;
	level 		=  	27;
	voice 		=  	17;
	id 			=   4025;
	spawnDelay	=	NPC_FLAG_BRAVE;

		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 240;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;
	//-------- prot ------------
	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	70;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	30;	

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual			(self,"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,"ORC_BODYELITE",DEFAULT,DEFAULT,"Orc_HeadSlave",DEFAULT,DEFAULT,-1);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;


	//-------- inventory --------
	
	EquipItem	(self,ItMw2hOrcSword01);
	EquipItem	(self,HUN_RW_03);
	CreateInvItem (self,ItFo_Potion_Health_02);
	CreateInvItem (self,ItLsTorch);
	CreateInvItem (self,ItFoSoup);
	CreateInvItems (self,ItAmBolt,40);
	CreateInvItems (self,ItAmPoisonBolt,10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_4025;
};

FUNC VOID Rtn_Start_4025 ()
{	
	TA_Stay (06,00,08,00,"TH_CAMPFIRE");
	TA_Stay (08,00,06,00,"TH_CAMPFIRE");

};

FUNC VOID Rtn_HUNT_4025 ()
{	
	TA_FollowKira	(06,00,16,00,"TH_PATH_01");
	TA_FollowKira	(16,00,06,00,"TH_PATH_01");
};
FUNC VOID Rtn_EnforceOR_4025 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};

FUNC VOID Rtn_NC3_4025 ()
{	
	TA_Guard	(06,00,16,00,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	TA_Guard	(16,00,06,00,"SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
};