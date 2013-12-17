prototype GRD_TRAP (C_NPC)
{
	//-------- abilities --------
	
	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;	
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	// Hier noch die Spells anmelden ,für ausgrauen (CreateSpell)

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	1500;		//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)
	
	Npc_SetTalentValue	(self,NPC_TALENT_1H,0);
	Npc_SetTalentValue	(self,NPC_TALENT_2H,0);
	Npc_SetTalentValue	(self,NPC_TALENT_BOW,0);
	Npc_SetTalentValue	(self,NPC_TALENT_CROSSBOW,0);
	Npc_SetTalentValue	(self,NPC_TALENT_PICKLOCK,100);
	Npc_SetTalentValue	(self,NPC_TALENT_PICKPOCKET,100);
	Npc_SetTalentValue	(self,NPC_TALENT_EVASION,0);
	Npc_SetTalentValue	(self,NPC_TALENT_REGEN_MP,0);
	Npc_SetTalentValue	(self,NPC_TALENT_REGEN_HP,0);
	Npc_SetTalentValue	(self,NPC_TALENT_SMITH,0);	
	Npc_SetTalentValue	(self,NPC_TALENT_ALCHEMY,0);	
	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,999);
		
	//-------- primary data --------
	name 		= 	NAME_Gardist;
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 
	id 			= 	2730;
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
	//Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",10,1,-1);
	B_Scale (self);
	/////////////////////////////////////////
	B_InitGrdFunc(self,70,2);
	//-------------Daily Routine-------------
	start_aistate = ZS_MIS_INFO_TRAP;	
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
    	fight_tactic	=	FAI_HUMAN_STRONG;




};

instance GRD_2730_Gardist (GRD_TRAP)
{
	id 			= 	2730;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
};
instance GRD_2731_Gardist (GRD_TRAP)
{
	id 			= 	2731;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
};
instance GRD_2732_Gardist (GRD_TRAP)
{
	id 			= 	2732;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	B_InitGrdFunc(self,90,2);
	
};
instance GRD_2733_Gardist (GRD_TRAP)
{
	id 			= 	2733;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
	
};
FUNC VOID Rtn_follow_2730 ()
{
	TA_FollowPC			(01,01,01,00,"");

};
FUNC VOID Rtn_follow_2731 ()
{
	TA_FollowPC			(01,01,01,00,"");

};
FUNC VOID Rtn_follow_2732 ()
{
	TA_FollowPC			(01,01,01,00,"");

};
FUNC VOID Rtn_follow_2733 ()
{
	TA_FollowPC			(01,01,01,00,"");

};