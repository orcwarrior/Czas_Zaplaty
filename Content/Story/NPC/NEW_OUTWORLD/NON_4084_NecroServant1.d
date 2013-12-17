instance NON_4084_NecroServant2(Npc_Default)
{
	//-------- primary data --------
	
	name =							"S³uga nekromanty";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level							=	50;
	voice =							0;
	id =							4084;

	//-------- abilities --------

	attribute	[ATR_STRENGTH] =	110;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	500;
	attribute[ATR_HITPOINTS] =		500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Set_SkeletonScout_Visuals();
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);	
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);

	//-------- inventory --------                                    
	EquipItem		(self,ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,"humans_2hst3.mds");
	CreateInvItem     (self,ItMw_Dual_01_Left );		

	//-------- protection ---------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		

	//-------------Daily Routine-------------
	B_SetMonsterLevel();
	start_aistate				= ZS_NecroServant2;
};

instance NON_4084_NecroServant2_Mirror (Npc_Default)
{
	//-------- primary data --------
	name =							"";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level							=	50;
	voice =							0;
	id =							4084;

	//-------- abilities --------

	attribute	[ATR_STRENGTH]	=	110;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	11500;
	attribute[ATR_HITPOINTS] =		11500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Set_SkeletonScout_Visuals();
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	Mdl_SetModelScale	(self,-1.0,-1.0,1.0); 
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);	
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);

	//-------- inventory --------                                    
	EquipItem		(self,ItMw_Dual_01_Right);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,3); 
	Mdl_ApplyOverlayMds 	(self,"humans_2hst3.mds");
	CreateInvItem     (self,ItMw_Dual_01_Left );			

	//-------- protection ---------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		

	//-------------Daily Routine-------------
	B_SetMonsterLevel();
	//start_aistate				= ZS_NecroServant1;
};

instance NON_4084_NecroServant1 (Npc_Default)
{
	//-------- primary data --------
	
	name =							"S³uga nekromanty";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level							=	50;
	voice =							0;
	id =							4084;

	//-------- abilities --------

	attribute	[ATR_STRENGTH]	=	110;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	500;
	attribute[ATR_HITPOINTS] =		500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Set_SkeletonScout_Visuals();
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
 Npc_SetAivar(self,AIV_MM_REAL_ID,	 	ID_SKELETONWARRIOR);	
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);

	//-------- inventory --------                                    
	EquipItem		(self,ItMw_2H_Sword_Light_Rusty_05);

	//-------- protection ---------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		

	//-------------Daily Routine-------------
	B_SetMonsterLevel();
	start_aistate				= ZS_NecroServant1;
};

instance NON_4084_NecroServant1_Mirror (Npc_Default)
{
	//-------- primary data --------
	name =							"";
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level							=	50;
	voice =							0;
	id =							4084;

	//-------- abilities --------

	attribute	[ATR_STRENGTH]	=	110;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	11500;
	attribute[ATR_HITPOINTS] =		11500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Set_SkeletonScout_Visuals();
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");

	B_Scale (self); 
	Mdl_SetModelFatness (self,0);
	Mdl_SetModelScale	(self,-1.0,-1.0,1.0); 
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	Npc_SetAivar(self,AIV_MM_REAL_ID,ID_SKELETONWARRIOR);	
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);

	//-------- inventory --------                                    
	EquipItem		(self,ItMw_2H_Sword_Light_Rusty_05);

	//-------- protection ---------
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	35;		

	//-------------Daily Routine-------------
	B_SetMonsterLevel();
	//start_aistate				= ZS_NecroServant1;
};
