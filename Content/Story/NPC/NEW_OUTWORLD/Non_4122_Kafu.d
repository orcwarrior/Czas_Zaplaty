instance Non_4122_Kafu (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kafu";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	35;
	voice 		=	4;
	id 			=	4122;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 65;
	attribute[ATR_DEXTERITY] 	= 65;
	attribute[ATR_MANA_MAX] 	= 185;
	attribute[ATR_MANA] 		= 185;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",9,1,MAG_ARMOR_L);

/****************
jak siê komuœ chce zrobiæ texa do szaty magów ziemi to w³ala,na razie ma ciuchy sêdziego

******************/

	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	
	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));

	//-------- Spells --------        
	CreateInvItem (self,ItArRuneWindFist);
	//-------- inventory --------   
	start_aistate					=	ZS_STAY;
	CreateInvItem (self,ItFo_Potion_Health_03);
	CreateInvItem (self,ItFo_Potion_Mana_03);
	CreateInvItem     (self,Ring_der_Magie);

};



