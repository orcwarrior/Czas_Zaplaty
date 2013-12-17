instance KDW_603_Nefarius (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Nefarius";
	npctype		=	npctype_main;
	guild 		=	GIL_KDW;      
	level 		=	25;
	voice 		=	4;
	id 			=	603;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 85;
	attribute[ATR_MANA] 		= 85;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",8,1,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	
	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- Spells --------        
	CreateInvItem (self,ItArRuneThunderball);
	//-------- inventory --------   

	CreateInvItem (self,ItFo_Potion_Health_02);
	CreateInvItem (self,ItFo_Potion_Mana_02);
	CreateInvItem     (self,Schutzring_Total1);
	CreateInvItem     (self,Ring_der_Magie);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,2 );
	//-------------Daily Routine-------------

	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_603;

	//--------------- //MISSIONs----------------

};

FUNC VOID Rtn_oldstart_603 ()
{
	TA_PracticeMagic(04,00,23,00,"NC_PLACE02");	
	TA_PracticeMagic(23,00,04,00,"NC_PLACE02");	//NC_KDW_CAVE_STAIRS
	//TA_Sleep		(23,00,04,00,"NC_KDW05_IN");
};

FUNC VOID Rtn_start_603 ()
{
	TA_PracticeMagic(04,00,23,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER");	
	TA_PracticeMagic(23,00,04,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER");	
};

FUNC VOID Rtn_rit_603 ()
{
	TA_PracticeMagic(04,00,23,00,"LOCATION_19_03_PATH_RUIN6");	
	TA_PracticeMagic(23,00,04,00,"LOCATION_19_03_PATH_RUIN6");	
};

FUNC VOID Rtn_Follow_603 ()
{
	TA_FollowPC(04,00,23,00,"MOVEMENT_ORCGRAVEYARD4");	
	TA_FollowPC(23,00,04,00,"MOVEMENT_ORCGRAVEYARD4");	
};
