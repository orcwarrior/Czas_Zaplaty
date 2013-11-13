instance RBL_1416_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							name_Templer;
	npctype =						NPCTYPE_MAIN;
	guild =							GIL_RBL;
	level =							17;
	
	
	voice =							8;
	id =							1416;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244*PSI_DREAM_FGT_TIME;
	attribute[ATR_HITPOINTS] =		244*PSI_DREAM_FGT_TIME;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",59 ,2,TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	
	//-------- inventory --------
	
	EquipItem (self,ItMw_2H_Sword_Light_02);
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	

	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1416;
};

FUNC VOID Rtn_start_1416 ()
{
	TA_Stand	(08,00,20,00,"PSI_GUARD_TEMPLE_5_2"); 
	TA_Stand	(20,00,08,00,"PSI_GUARD_TEMPLE_5_2");
};
