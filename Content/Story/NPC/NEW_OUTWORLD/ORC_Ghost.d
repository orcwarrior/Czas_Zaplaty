instance ORC_Ghost (Mst_Default_OrcShaman)
{
	//-------- primary data --------
	name 		=		"Urkh-Ashad";
	Npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_NONE;
	level 		=		25;
	 	
	voice 		=		17;
	id 			=		2510;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	75;
	attribute[ATR_DEXTERITY] 		=	75;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	1900;
	attribute[ATR_HITPOINTS] 		=	1900;

	//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	0;
	 	
	Mdl_SetVisual			(self,"Orc.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,"UOS_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- inventory --------
	CreateInvItem			(self,ItRwOrcstaff);		// für Magiemodus
	CreateInvItem		(self,ItArRuneFireball);
  	  
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine 	= Rtn_Start_2510;
	senses 			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	senses_range 			= 800;
};

FUNC VOID Rtn_Start_2510 ()
{
	TA_Stay(07,00,12,00,"ORCGHOST");
	TA_Stay(12,00,07,00,"ORCGHOST");
};
