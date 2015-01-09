instance SLD_7507_SoeldnerCordTrap (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_GUARD;
	guild =							GIL_SLV;       
	level =							16;
	voice =							11;
	id =							7507;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		120;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,0,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_RANGED; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	
	//-------- inventory --------                                    

	EquipItem (self,MTR_MW_03);
	EquipItem (self,ItRw_Bow_Long_01);
	CreateInvItems(self,ItAmArrow,20);
	CreateInvItems (self,ItFoRice,6);
	CreateInvItems (self,ItFoLoaf,5);
	CreateInvItems (self,ItFoMutton,4);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItems (self,ItFoBooze,5);
	CreateInvItems (self,ItLsTorch,5);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_Trap_7507;
};

FUNC VOID Rtn_Trap_7507 ()
{
	TA_Gestath_SuspectHero(08,00,22,00,"WP_CONVOY_05");     
	TA_Gestath_SuspectHero(22,00,08,00,"WP_CONVOY_05");
};

FUNC VOID Rtn_HIDE_7507 ()
{
	TA_Guard(07,00,22,00,"WP_INTRO_WI05");
	TA_Guard(22,00,07,00,"WP_INTRO_WI05");
};

