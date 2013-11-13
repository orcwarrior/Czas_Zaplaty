instance KDW_601_Myxir (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Myxir";
	npctype		=	npctype_main;
	guild 		=	GIL_KDW;     
   flags       =   NPC_FLAG_IMMORTAL;
	level 		=	24;
	voice 		=	10;
	id 			=	601;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 96;
	attribute[ATR_MANA] 		= 96;
	attribute[ATR_HITPOINTS_MAX]= 328;
	attribute[ATR_HITPOINTS] 	= 328;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Pony",7,4,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- Spells --------        
	CreateInvItem (self,ItArRuneThunderbolt);
	
	//-------- inventory --------                                    
	CreateInvItem (self,ItFo_Potion_Health_02);
	CreateInvItem (self,ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Plants_Flameberry_01 );
	CreateInvItem(self,ItFo_Plants_RavenHerb_01);
	//-------------Daily Routine-------------
	
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_601;
};

FUNC VOID Rtn_oldstart_601 ()
{
	TA_Sleep		(01,00,04,00,"NC_KDW03_IN");
	TA_ReadBook		(04,00,01,00,"NC_KDW03_IN");	
};

FUNC VOID Rtn_start_601 ()
{		
	TA_Stand		(01,00,04,00,"LOCATION_19_03_SECOND_HARPYE1");
	TA_Stand		(04,00,01,00,"LOCATION_19_03_SECOND_HARPYE1");	
};

FUNC VOID Rtn_rit_601 ()
{
	TA_PracticeMagic(04,00,23,00,"LOCATION_19_03_PATH_RUIN7");	
	TA_PracticeMagic(23,00,04,00,"LOCATION_19_03_PATH_RUIN7");	
};

FUNC VOID Rtn_RITUAL_601 ()
{
   TA_Stay (22,00,08,00,"PATH_NEW_AROUND_PSI28");
   TA_Stay (08,00,22,00,"PATH_NEW_AROUND_PSI28");
};

FUNC VOID Rtn_RITUAL1_601 ()
{
   TA_PracticeMagic (22,00,08,00,"PATH_NEW_AROUND_PSI28");
   TA_PracticeMagic (08,00,22,00,"PATH_NEW_AROUND_PSI28");
};