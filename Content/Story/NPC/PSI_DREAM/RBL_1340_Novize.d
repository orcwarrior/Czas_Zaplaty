instance RBL_1340_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 	=		Npctype_Ambient;
	guild 		=		GIL_RBL;
	level 		=		9;
	flags 		=		0;
	
	voice 		=		8;
	id 			=		1340;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",75,1,NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	
	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self,ItMw_1H_Axe_Old_01);
	//CreateInvItem (self,ItFoSoup);
	//CreateInvItem (self,ItMiJoint);
 
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_1340;
};

FUNC VOID Rtn_start_1340 ()
{
	TA_MIS_NOVPANIC	(02,00,08,05,"PSI_TEMPLE_GUARD_03");
    TA_MIS_NOVPANIC	(08,05,02,00,"PSI_TEMPLE_GUARD_03"); 
};

