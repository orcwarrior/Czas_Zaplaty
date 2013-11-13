instance  RBL_415_ImOnFire (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	npctype =						NPCTYPE_GUARD;
	guild =							GIL_RBL;
	level =							12;
	
	
	voice =							8;
	id =							415;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	84;
	attribute[ATR_HITPOINTS] =		54;

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
// 	CreateInvItem (self,ItFoSoup);
// 	CreateInvItem (self,ItMiJoint_1);
	
	daily_routine = Rtn_start_415;
	
	//-------------Daily Routine-------------
// Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);

};


FUNC VOID Rtn_start_415 ()
{
    TA_Mis_PanicFire	(21,00,08,00,"PANIC_2");
    TA_Mis_PanicFire	(08,00,21,00,"PANIC_2");  
};


