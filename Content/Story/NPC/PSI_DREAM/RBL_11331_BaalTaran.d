instance RBL_409_BaalTaran (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		9;
		
	voice 		=		5;
	id 			=		409;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_FatBald",29 ,2,NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Axe_Old_01);
	CreateInvItems	(self,ItMiNugget,15);
	CreateInvItems	(self,ItFoRice,5);
	CreateInvItems	(self,ItFoBooze,3);
	CreateInvItems	(self,ItMiJoint_1,13);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
 
	
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_409;
};

FUNC VOID Rtn_start_409 ()
{
	TA_MIS_NOVPANIC	(00,00,08,00,"PANIC_3");
	TA_MIS_NOVPANIC	(08,00,00,00,"PANIC_3");
};
