instance RBL_1418_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_RBL;
	level =							12;
	
	
	voice =							13;
	id =							1418;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184*PSI_DREAM_FGT_TIME;
	attribute[ATR_HITPOINTS] =		184*PSI_DREAM_FGT_TIME;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_FatBald",61,0,TPL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self,ItMw_2H_Sword_Light_01);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	
	
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1418;
};

FUNC VOID Rtn_start_1418 ()
{
    TA_Stand			(23,10,06,00,"PSI_TEMPLE_STAIRS_4");
    TA_Stand			(06,00,23,10,"PSI_TEMPLE_STAIRS_4");	
};
