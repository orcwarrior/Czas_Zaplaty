instance RBL_1338_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_RBL;
	level 		=		14;
	
	voice 		=		5;
	id 			=		1338;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	19;
	attribute[ATR_MANA] 			=	19;
	attribute[ATR_HITPOINTS_MAX] 	=	208;
	attribute[ATR_HITPOINTS] 		=	208;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",22,1,NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Mace_01);
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
 
	
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1338;
};

FUNC VOID Rtn_start_1338 ()
{
	TA_MIS_NOVPANIC	(08,00,10,00,"PSI_TEMPLE_COURT_2");
	TA_MIS_NOVPANIC	(10,00,08,00,"PSI_TEMPLE_COURT_2");	
};

