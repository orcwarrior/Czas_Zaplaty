instance ORC_4031_Shaman (Mst_Default_OrcShaman)
{
	//-------- primary data --------
	name 		=		"Nieumar³y szaman";
	Npctype 		=		NPCTYPE_MAIN;
	guild 		=		GIL_NONE;
	level 		=		40;
	 	
	voice 		=		17;
	id 			=		4031;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	75;
	attribute[ATR_DEXTERITY] 		=	75;
	attribute[ATR_MANA_MAX] 		=	100;
	attribute[ATR_MANA] 			=	100;
	attribute[ATR_HITPOINTS_MAX] 	=	400;
	attribute[ATR_HITPOINTS] 		=	400;

	//----------------------------------------------------------	
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	90;
	protection	[PROT_MAGIC]		=	0;
	 	
	Mdl_SetVisual			(self,"Orc.mds");
	Mdl_SetVisualBody		(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- inventory --------
	CreateInvItem			(self,ItRwOrcstaff);		// für Magiemodus
	CreateInvItem		(self,ItArRuneFireball);
  	  
	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine 	= Rtn_Start_4031;
	senses 			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_Start_4031 ()
{
	TA_Stay		(07,00,12,00,"WP");
	TA_Stay		(12,00,07,00,"WP");
};


