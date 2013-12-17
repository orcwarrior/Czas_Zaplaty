instance KDW_600_Saturas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Saturas";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_KDW;      
	level 		=	29;
	voice 		=	14;
	id 			=	600;
	flags       =   NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//							body mesh     		bdytex	skin	head mesh     		headtex		teethtex	ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",7,0,KDW_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);

	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (	6));

	//-------- Spells --------
	CreateInvItem 		(self,ItArRuneChainLightning);
	CreateInvItem 		(self,ItArRuneIceCube);

	//-------- inventory --------                                    
	CreateInvItem 		(self,ItFo_Potion_Health_01);
	CreateInvItem 		(self,ItFo_Potion_Mana_01);
	CreateInvItem 			(self,Schutzamulett_Feuer);
	CreateInvItem 			(self,Machtring);
	CreateInvItem		(self,ItFo_Plants_Flameberry_01 );

	//------------- ai -------------
	/*B_InitNPCAddins(self);*/		daily_routine 	= Rtn_start_600;
	fight_tactic	= FAI_HUMAN_MAGE;
	senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_oldstart_600 ()
{
	TA_ReadBook		(01,00,05,00,"NC_KDW_CAVE_CENTER");	
	TA_ReadBook		(05,00,01,00,"NC_KDW_CAVE_CENTER");	
};

FUNC VOID Rtn_start_600 ()
{
	TA_ReadBook		(01,00,05,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");	
	TA_ReadBook		(05,00,01,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");	
};

FUNC VOID Rtn_rit_600 ()
{
	TA_PracticeMagic(04,00,23,00,"LOCATION_19_03_PATH_RUIN6");	
	TA_PracticeMagic(23,00,04,00,"LOCATION_19_03_PATH_RUIN6");	
};


FUNC VOID Rtn_RITUAL_600 ()
{
   TA_Stay (22,00,08,00,"PATH_NEW_AROUND_PSI28");
   TA_Stay (08,00,22,00,"PATH_NEW_AROUND_PSI28");
};

FUNC VOID Rtn_RITUAL1_600 ()
{
   TA_PracticeMagic (22,00,08,00,"PATH_NEW_AROUND_PSI28");
   TA_PracticeMagic (08,00,22,00,"PATH_NEW_AROUND_PSI28");
};
