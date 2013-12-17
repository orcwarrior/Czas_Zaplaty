instance RBL_1327_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Wiarus";
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_RBL;
	level 		=		3;

	voice 		=		5;
	id 			=		1327;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_Bald",29,1,NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Hatchet_01);
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1327;
};

FUNC VOID Rtn_start_1327 ()
{
   TA_FollowPC(0,00,12,00,"PSI_PATH_10_2"); 
   TA_FollowPC(12,00,0,00,"PSI_PATH_10_2"); 
};

FUNC VOID Rtn_Panic_1327 ()
{
   TA_MIS_NOVPANIC(00,00,07,00,"PSI_PATH_10_2");
   TA_MIS_NOVPANIC(07,00,00,00,"PSI_PATH_10_2");
};


