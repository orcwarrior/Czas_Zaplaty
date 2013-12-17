instance RBL_1334_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype	 	=		Npctype_Ambient;
	guild 		=		GIL_RBL;
	level 		=		9;
	
	voice 		=		3;
	id 			=		1334;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	12;
	attribute[ATR_MANA] 			=	12;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_FatBald",29 ,2,NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Axe_Old_01);
	
 
	
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1334;
};

FUNC VOID Rtn_start_1334 () //Sumpfkraut-Sammler
{
	TA_MIS_NOVPANIC (07,00,19,00,"PATH_TAKE_HERB_06");
	TA_MIS_NOVPANIC (19,00,07,00,"PATH_TAKE_HERB_06");
};



