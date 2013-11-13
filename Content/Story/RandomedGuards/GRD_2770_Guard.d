
instance GRD_2770_Guard (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 
	id 			= 	2770;
	voice 		=	12;
	flags		= NPC_FLAG_INSTANTDEATH;

	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 170;
	attribute[ATR_HITPOINTS] 	= 170;
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Pony", 100,  2, -1);
	/////////////////////////////////////////
 	B_InitGrdFunc(self, 10, GrdRnd);
	//-------------Daily Routine-------------
	start_aistate = ZS_ChallengeTragets;
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
};

instance ForTrailer_GRD_27700_Guard (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 
	id 			= 	27700;
	voice 		=	12;

	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 170;
	attribute[ATR_HITPOINTS] 	= 170;
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 3,  2,-1);
	/////////////////////////////////////////
	B_InitGrdFunc(self,70,25);
	//-------------Daily Routine-------------
	start_aistate = ZS_ChallengeTragets;
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);

	daily_routine = Rtn_start_27700;
};

FUNC VOID Rtn_start_27700 ()
{
	TA_ChallengeTragets	(22,00,08,00,"OC_ROUND_20");
	TA_ChallengeTragets	(08,00,22,00,"OC_ROUND_20");
};

