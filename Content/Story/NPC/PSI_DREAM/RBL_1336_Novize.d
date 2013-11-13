instance RBL_1336_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_RBL;
	level 		=		3;
	 	
	voice 		=		7;
	id 			=		1336;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	7;
	attribute[ATR_MANA] 			=	7;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1,"Hum_Head_FatBald",28,1,NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Hatchet_01);
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
	        
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1336;

	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_start_1336 ()
{
	TA_MIS_NOVPANIC	(02,00,08,00,"PSI_TEMPLE_COURT_GURU");
    TA_MIS_NOVPANIC	(08,00,02,00,"PSI_TEMPLE_COURT_GURU"); 
};



