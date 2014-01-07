instance RBL_414_BaalParvez (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_RBL;
	level 		=		18;

	voice 		=		10;
	id 			=		414;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	30;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",25 ,2,NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self,RBL_MW_02);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	CreateInvItems	(self,ItMiNugget,50);
	CreateInvItems	(self,ItFo_Potion_Health_03,1);
	CreateInvItems	(self,ItFoRice,1);
	 
	
        
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	daily_routine = Rtn_start_414;
};

FUNC VOID Rtn_start_414 ()
{
	TA_MIS_NOVPANIC		(22,35,07,45,"PANIC_2");
	TA_MIS_NOVPANIC		(07,45,22,35,"PANIC_2");
};

