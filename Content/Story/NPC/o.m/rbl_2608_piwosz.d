instance RBL_2608_BeerDrinker (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Piwosz";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		7;
		
	voice 		=		1;
	id 			=		2608;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	40;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",4,2,RBL_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,0.5);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	EquipItem	(self,RBL_MW_02);		
	CreateInvItems (self,ItFoBeer,10);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_2608;
};

FUNC VOID Rtn_start_2608 () //Händler
{
    TA_SitAround    (19,30,16,30,"SIT_CIPHER");
    TA_Stand		(16,30,19,30,"TAVERNE1");

};
FUNC VOID Rtn_alarm_2608 () //Händler
{
    TA_SitAround    (19,30,16,30,"SIT_CIPHER");
    TA_Stand		(16,30,19,30,"TAVERNE1");

};

