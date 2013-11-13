//----------------------------------
// PROTOTYPE
//----------------------------------
prototype OMC_Worker (C_NPC)
{
	//-------- abilities --------
	
	protection	[PROT_EDGE]		=		0;
	protection	[PROT_BLUNT]	=		0;
	protection	[PROT_POINT]	=		0;
	protection	[PROT_FIRE]		=		0;
	protection	[PROT_MAGIC]	=		0;	

	// Hier noch die Spells anmelden ,für ausgrauen (CreateSpell)

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	200;		//SN: am 30.11.00 von 15m auf 20m erhöht (WICHTIG für Profilings!)
	
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
	name	=	"Kopacz";
	npctype		= 	NPCTYPE_MAIN;
	guild 		=	GIL_GRD; 
	slot		=	"OMC_WORKERS_CAMPFIRE";
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_FatBald",10,1,-1);
	/////////////////////////////////////////
	EquipItem(self,ItMwPickAxe);
	CreateInvItem(self,ItMwPickAxe);
	CreateInvItems(self,ItMiNugget,4+Hlp_Random(10));
	CreateInvItems(self,ItFoSoup,1+Hlp_Random(3));
	
	//-------------Daily Routine-------------
 Npc_SetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
 Npc_SetAivar(self,AIV_ZSTYPE,  TA_OMC_WORKER);
	daily_routine = Rtn_autoinit;	
	B_InitNPCAddins(self);		

};
instance Vlk_3030_Worker (OMC_Worker)
{
	id 			= 	3030;	
	spawnPoint	=	"OMC_ORE_PLACE1";

};
instance Vlk_3031_Worker (OMC_Worker)
{
	id 			= 	3031;	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald",13,1,-1);	
	spawnPoint	=	"OMC_ORE_PLACE1_2";

};
instance Vlk_3032_Worker (OMC_Worker)
{
	id 			= 	3032;	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter",16,1,Vlk_Armor_l);	
	
	spawnPoint	=	"OMC_OREPLACE3";

};
instance Vlk_3033_Worker (OMC_Worker)
{
	id 			= 	3033;	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",23,1,Vlk_Armor_l);	
	
	spawnPoint	=	"OMC_OREPLACE3_2";

};
instance Vlk_3034_Worker (OMC_Worker)
{
	id 			= 	3034;	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",43,1,Vlk_Armor_l);	
	
	spawnPoint	=	"OMC_ORCEPLACE2";

};
instance Vlk_3035_Worker (OMC_Worker)
{
	id 			= 	3035;	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald",32,1,Vlk_Armor_l);	
	
	spawnPoint	=	"OMC_ORCEPLACE2_2";

};
