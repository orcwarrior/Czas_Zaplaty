instance GRD_2700_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 
	id 			= 	2700;
	voice 		=	12;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 170;
	attribute[ATR_HITPOINTS] 	= 170;
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	//Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 10,  1, -1);
	B_Scale (self);
	/////////////////////////////////////////
	B_InitGrdFunc(self,10,20);
	//-------------Daily Routine-------------
	start_aistate = ZS_ChallengeTragets;	
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);


};

