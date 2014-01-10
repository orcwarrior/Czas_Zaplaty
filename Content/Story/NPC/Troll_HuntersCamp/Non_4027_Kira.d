
instance Non_4027_Kira (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kira";
	npctype		= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	32;
	voice 		=	16;
	id 			=	4027;
	flags      	=   NPC_FLAG_IMMORTAL; // wichtig,weil man sie nicht finishen kann!
	spawnDelay	=	NPC_FLAG_BRAVE;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 190;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 400;
	attribute[ATR_MANA] 		= 400;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;
	//-----------prot------------
	protection	[PROT_BLUNT]		=	130;
	protection	[PROT_EDGE]			=	130;
	protection	[PROT_POINT]		=	70;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	30;	

	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Babe.mds"); 	

	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"HUM_BODY_BABE0",18,2 ,"BAB_HEAD_HAIR1",0 ,2,-1);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);	
	//-------- inventory --------                                    
	EquipItem	(self,ALL_MW_05);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems (self,ItAmBolt,30);
	CreateInvItems (self,ItAmPoisonBolt,11);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4027;
};

FUNC VOID Rtn_start_4027 () 
{
	TA_Sleep		(24,00,08,00,"TH_KIRA_02"); 	
	TA_Stand		(08,00,24,00,"TH_KIRA_01");
	TA_SmallTalk	(12,00,16,00,"TH_PATH_01");
	TA_Stand		(16,00,24,00,"TH_KIRA_01");
};

FUNC VOID Rtn_EnforceOR_4027 () 
{
	TA_TH_ENFORCES		(23,01,23,00,"OW_PATH_OC_NC"); 	
	
};
FUNC VOID Rtn_HUNT_4027 ()
{	
	TA_GuidePc	(06,00,16,00,"OW_PATH_190");
	TA_GuidePc	(16,00,06,00,"OW_PATH_190");
};


FUNC VOID Rtn_HUNT2_4027 ()
{	
	TA_GuidePc	(06,00,16,00,"LOCATION_12_14");
	TA_GuidePc	(16,00,06,00,"LOCATION_12_14");
};

FUNC VOID Rtn_NC3_4027 ()
{	
	TA_Boss	(06,00,16,00,"MIS_GRDPATROL1_5");
	TA_Boss	(16,00,06,00,"MIS_GRDPATROL1_5");
};

FUNC VOID Rtn_KiraTalk_4027 () 
{
	TA_SmallTalk(24,00,12,00,"TH_PATH_01");
	TA_SmallTalk(12,00,24,00,"TH_KIRA_01");
};

