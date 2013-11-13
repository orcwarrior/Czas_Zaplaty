instance RBL_1420_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_RBL;
	level =							12;
	
	
	voice =							8;
	id =							1420;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",62,1,TPL_ARMOR_L);

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
	daily_routine = Rtn_start_1420;
};

FUNC VOID Rtn_start_1420 ()
{
	TA_Stand (08,00,20,00,"PSI_PATH_TEMPLE_9_MOVEMENT");
	TA_Stand (20,00,08,00,"PSI_PATH_TEMPLE_9_MOVEMENT");
};

