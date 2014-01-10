instance RBL_311_Fisk (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fisk";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		15;
		
	voice 		=		12;
	id 			=		311;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	58;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	224;
	attribute[ATR_HITPOINTS] 		=	224;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Bald",10,2,RBL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	EquipItem	(self,RBL_MW_02);		
	CreateInvItems (self,ItKeLockpick,10);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_311;
};

FUNC VOID Rtn_start_311 () //H?ndler
{
	TA_Boss			(18,30,07,00,"FISKBARMAN");
    TA_SitAround    (07,00,08,30,"SIT_FOX");
    TA_Stand		(08,30,18,30,"FISKBARMAN");

};
FUNC VOID Rtn_Alarm_311 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR18"); 
	 
};

