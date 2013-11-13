//----------------------------------
// PROTOTYPE
//----------------------------------
prototype OMC_GateGuard (C_NPC)
{
	//-------- abilities --------
	
	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;	
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH;

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
	
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);
		
	//-------- primary data --------
	name	=	"Stra¿nik";
	slot	=	"OMC_ENT";//Guard
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_DMB; 

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",10,1,-1);
	/////////////////////////////////////////
	B_InitGrdFunc(self,1,30);
	//-------------Daily Routine-------------
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	Npc_SetAivar(self,AIV_ZSTYPE,  TA_OMC_GATEGUARD);
	daily_routine = Rtn_autoinit;	
	B_InitNPCAddins(self);		

};
instance GRD_3001_GateGuard (OMC_GateGuard)
{
	id 			= 	3001;	
	////////////////////////don't use!//name		=	"";
	//slot		=	"OMC_ENT1";//SLEEP
	//spawnPoint		=	"";//WORK
	//wp		=	"";//REST
	slot		=	"OMC_ENT1";

};
instance GRD_3036_GateGuard (OMC_GateGuard)
{
	id 			= 	3036;	
	slot		=	"OMC_ENT2";	
};
instance GRD_3009_GateGuard (OMC_GateGuard)
{
	id 			= 	3009;	
	slot		=	"OMC_LETTER02_1";	
};
instance GRD_3010_GateGuard (OMC_GateGuard)
{
	id 			= 	3010;	
	slot		=	"OMC_LETTER01_1";	
};

instance GRD_3018_VlkGuard (OMC_GateGuard)
{
	id 			= 	3018;	
	slot		=	"OMC_ORE_PLACE1_GRD";	
};
instance GRD_3019_VlkGuard (OMC_GateGuard)
{
	id 			= 	3019;	
	slot		=	"OMC_OREPLACE3_GRD";	
};
instance GRD_3020_VlkGuard (OMC_GateGuard)
{
	id 			= 	3020;	
	slot		=	"OMC_ORCEPLACE2_GRD";	
};

instance GRD_3021_GateGuard (OMC_GateGuard)
{
	id 			= 	3021;	
	slot		=	"OW_OM_ENTRANCE02_L";	
};
instance GRD_3022_GateGuard (OMC_GateGuard)
{
	id 			= 	3022;	
	slot		=	"OW_OM_ENTRANCE02_R";	
};