
prototype Mst_Default_Troll_Black(C_Npc)
{
	name[0] = "Czarny troll";
	guild = GIL_TROLL;
	level = 300;
//----------------------------------------------------------		
 Npc_SetAivar(self,AIV_MM_REAL_ID,  ID_BLACKTROLL);

	attribute[ATR_STRENGTH] = 350;
	attribute[ATR_DEXTERITY] = 450;
	attribute[ATR_HITPOINTS_MAX] = 3500;
	attribute[ATR_HITPOINTS] = 3500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	200;
	protection	[PROT_EDGE]			=	200;
	protection	[PROT_POINT]		=	9999;	// immun
	protection	[PROT_FIRE]			=	170;
	protection	[PROT_FLY]			=	150;	// immun
	protection	[PROT_MAGIC]		=	9999;
	damagetype = DAM_FLY;
	fight_tactic = FAI_TROLL;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
 Npc_SetAivar(self,AIV_MM_Behaviour,		 PASSIVE);
	
 Npc_SetAivar(self,AIV_MM_PercRange,		 1500);
 Npc_SetAivar(self,AIV_MM_DrohRange,		 1300);
 Npc_SetAivar(self,AIV_MM_AttackRange,	 600);
 Npc_SetAivar(self,AIV_MM_DrohTime,		 5);
 Npc_SetAivar(self,AIV_MM_FollowTime,	 10);
 Npc_SetAivar(self,AIV_MM_FollowInWater,  FALSE);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	start_aistate				= ZS_MM_AllScheduler;
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
};

func void B_SetVisuals_Troll_Black()
{
	Mdl_SetVisual (self, "Troll.mds");
	Mdl_SetVisualBody (self, "Troll_Black_Body", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
};

func void B_SetVisuals_King_Troll()
{
	Mdl_SetVisual (self, "Troll.mds");
	Mdl_SetVisualBody (self, "Troll_Black_Body", 1, DEFAULT, "", DEFAULT, DEFAULT, -1);
};
instance Black_Troll(Mst_Default_Troll_Black)
{
	B_SetVisuals_Troll_Black ();
	Npc_SetToFistMode (self);
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  7);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  600);
	B_SetMonsterLevel();		
};
instance King_Troll(Mst_Default_Troll_Black)
{
	name[0] = "Królewski troll";
	guild = GIL_TROLL;
	level = 500;
 Npc_SetAivar(self,AIV_MM_REAL_ID,  ID_KINGTROLL);	
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 350;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
//------------------------------------------------------	
	protection	[PROT_BLUNT]		=	290;
	protection	[PROT_EDGE]			=	290;
	protection	[PROT_POINT]		=	9999;
	protection	[PROT_FIRE]			=	270;
	protection	[PROT_FLY]			=	265;
	protection	[PROT_MAGIC]		=	9999;
	B_SetVisuals_King_Troll ();
	Npc_SetToFistMode (self);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  10);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  750);
	B_SetMonsterLevel();		
};

instance Kira_BTroll(Mst_Default_Troll_Black)
{
	B_SetVisuals_Troll_Black ();
	Npc_SetToFistMode (self);
 Npc_SetAivar(self,AIV_MM_RestStart, 	 OnlyRoutine);
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  600);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_REAL_ID,  MIS_KIRABLACKTROLL);	//no trophies
};