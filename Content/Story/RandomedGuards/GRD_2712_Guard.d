instance GRD_2712_Gardist (Npc_Default)
{
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 
	id 			= 	2712;
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
	//Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 10,  1, -1);
	B_Scale (self);
	/////////////////////////////////////////
	B_InitGrdFunc(self,10,15);
	//-------------Daily Routine-------------
	start_aistate = ZS_ChallengeTragets;

};

