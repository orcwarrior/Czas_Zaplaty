
instance Non_660_Nia (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Nia";
	npctype		= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	32;
	voice 		=	16;
	id 			=	660;
	flags      	=   NPC_FLAG_IMMORTAL; // wichtig,weil man sie nicht finishen kann!
	spawnDelay	=	NPC_FLAG_BRAVE;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
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
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);	
	//-------- inventory --------                                    
	EquipItem	(self,GRD_MW_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_660;
};

FUNC VOID Rtn_start_660 () 
{
	TA_SitAround	(00,02,08,00,"NC_EN_TAVERN_07"); 	
	TA_Stand		(08,00,12,02,"NC_EN_TAVERN_02");
	TA_SitAround	(12,02,19,02,"NC_EN_TAVERN_07");
	TA_Stand		(19,02,00,02,"NC_EN_TAVERN_02");
	
};

FUNC VOID Rtn_prestart_660 () 
{
	TA_Stand		(08,00,22,00,"NIA_INSPECT");
	TA_Stand		(22,02,08,00,"NIA_INSPECT");
};


FUNC VOID Rtn_wait_660 () 
{
	TA_Stand	(22,00,04,00,"STI_STAY"); 	
	TA_SitAround	(04,00,08,00,"NC_EN_TAVERN_07"); 	
	TA_Stand		(08,00,12,02,"NC_EN_TAVERN_02");
	TA_SitAround	(12,02,19,02,"NC_EN_TAVERN_07");
	TA_Stand		(19,02,22,00,"NC_EN_TAVERN_02");
};


