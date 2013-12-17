//----------------------------------
// PROTOTYPE
//----------------------------------
prototype OMC_Guard (C_NPC)
{
	//-------- abilities --------
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH;
	
	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;	

	// Hier noch die Spells anmelden ,für ausgrauen (CreateSpell)

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	900;		//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)
	
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
	B_InitGrdFunc(self,4,22);
	//-------------Daily Routine-------------
	Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	Npc_SetAivar(self,AIV_ZSTYPE,  TA_OMC_GUARD);
	daily_routine = Rtn_autoinit;	
	B_InitNPCAddins(self);		

};
instance GRD_3002_Guard (OMC_Guard)
{
	id 			= 	3002;	
	slot		=	"OMC_SPANKO2";
	spawnPoint	=	"OMC_FIRE2";

};
instance GRD_3003_Guard (OMC_Guard)
{
	id 			= 	3003;	
	slot		=	"OMC_SPANKO1";
	spawnPoint	=	"OMC_FIRE2";
};
instance GRD_3004_Guard (OMC_Guard)
{
	id 			= 	3004;	
	slot		=	"OMC_FIRE2";
	spawnPoint	=	"OMC_FIRE2";
};
instance GRD_3005_Guard (OMC_Guard)
{
	id 			= 	3005;	
	slot		=	"OMC_FIRE2";
	spawnPoint	=	"OMC_FIRE2";
};
instance GRD_3006_Guard (OMC_Guard)
{
	id 			= 	3006;	
	slot		=	"OMC_FIRE2";
	spawnPoint	=	"OMC_FIRE2";
};
instance GRD_3007_Guard (OMC_Guard)
{
	id 			= 	3007;	
	slot		=	"OMC_CHATA";
	spawnPoint	=	"OMC_CHATA";
};
instance GRD_3008_Guard (OMC_Guard)
{
	id 			= 	3008;	
	slot		=	"OMC_SHOP";
	spawnPoint	=	"OMC_SHOP";
};
instance GRD_3011_Guard (OMC_Guard)
{
	id 			= 	3011;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3012_Guard (OMC_Guard)
{
	id 			= 	3012;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3013_Guard (OMC_Guard)
{
	id 			= 	3013;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3014_Guard (OMC_Guard)
{
	id 			= 	3014;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3015_Guard (OMC_Guard)
{
	id 			= 	3015;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3016_Guard (OMC_Guard)
{
	id 			= 	3016;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};
instance GRD_3017_Guard (OMC_Guard)
{
	id 			= 	3017;	
	slot		=	"OMC_FIRE1";
	spawnPoint	=	"OMC_FIRE1";
};