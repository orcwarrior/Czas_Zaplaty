INSTANCE PC_Psionic(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name			= "Lester";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_PIR;
	level			= 40;
	voice			= 5;
	id			    = 4;
   flags=NPC_FLAG_FRIEND;

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	140;
	attribute[ATR_DEXTERITY] 	=	55;
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]=	1520;
	attribute[ATR_HITPOINTS] 	=	1520;
   protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 250;
	
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh,Body-Tex,Skin-Color	,Head-MMS		,Head-Tex	,Teeth-Tex ,Armor
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,0,"Hum_Head_Bald",17,2,HUN_ARMOR_L);

	MDL_APPLYOVERLAYMDS (self,"Humans_Mage.mds");

   fight_tactic	=	FAI_HUMAN_STRONG;
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);

	//-------- talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);			
	
	//-------- inventory --------
	EquipItem     (self,Streitschlichter);
	CreateInvItem (self,ItFoSoup);
	
	//-------- ai --------
	daily_routine	=	Rtn_start_4;
	senses			=	SENSE_HEAR | SENSE_SEE |SENSE_SMELL;
	senses_range	=	1500;
};

// SN: Wichtig für Kapitel 2,daß Lester dort steht und auf den Spieler wartet !!!
// MH: Hab ihn nen Tick nach hinten versetzt
FUNC VOID Rtn_start_4 ()
{	
	TA_Smoke	(08,00,23,00,"PATCHH");    
	TA_Stand	(23,00,08,00,"HELPPOINT10");
};

FUNC VOID Rtn_GoToTondral_4 ()
{	
	TA_Smoke	(08,00,23,00,"GO");    
	TA_Stand	(23,00,08,00,"GO");
};

FUNC VOID Rtn_Follow_4 () 
{ 
   Ta_FollowPC (0,00,12,00,"PATH_OC_PSI_19"); 
   Ta_FollowPC (12,00,0,00,"PATH_OC_PSI_19"); 
}; 

FUNC VOID Rtn_FollowToTemple_4 () 
{ 
   Ta_FollowPC (0,00,12,00,"PSI_TEMPLE_COURT_GURU"); 
   Ta_FollowPC (12,00,0,00,"PSI_TEMPLE_COURT_GURU"); 
}; 

FUNC VOID Rtn_Stay_4 ()
{	
   TA_ReadBook(01,00,13,00,"PSI_TEMPLE_ROOMS_IN_02");
	TA_ReadBook(13,00,01,00,"PSI_TEMPLE_ROOMS_IN_02");
};

FUNC VOID Rtn_GoToBeast_4 ()
{	
   Ta_GuidePC (0,00,12,00,"PSI_TEMPLE_IN"); 
   Ta_GuidePC (12,00,0,00,"PSI_TEMPLE_IN");
};

func void Rtn_FightWithBeast_4 ()
{
   TA_FollowPC(02,00,14,00, hero.wp);	
   TA_FollowPC(14,00,02,00, hero.wp);
};