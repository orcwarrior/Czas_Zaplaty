instance RBL_416_GorHanis (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						npctype_main;
	guild =							GIL_RBL;
	level =							12;
	
	
	voice =							8;
	id =							416;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184*PSI_DREAM_FGT_TIME;
	attribute[ATR_HITPOINTS] =		184*PSI_DREAM_FGT_TIME;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Bald",66,1,TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	
	//-------- inventory --------
	
	EquipItem (self,ALL_MW_05);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	

	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_416;
};

FUNC VOID Rtn_start_416 ()
{
	TA_Stand		(08,00,22,00,"PSI_TEMPLE_COURT_3");
	TA_Stand  (22,00,08,00,"PSI_TEMPLE_COURT_3");
};

