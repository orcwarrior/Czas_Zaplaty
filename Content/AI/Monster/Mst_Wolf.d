/*************************************************************************
**	Wolf    															**
*************************************************************************/

INSTANCE Wolf(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  3);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  16);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	CreateInvItems (self, ItFoMuttonRaw, 4);
};

/*************************************************************************
**	Wolf    															**
*************************************************************************/

INSTANCE YWolf(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);	
	Npc_SetAivar(self,AIV_MM_MAXLEVEL,  16);
	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	Mdl_SetModelScale(self, 0.8, 0.8, 0.8);
	level							 = 6;
	//-------- attributes --------
	attribute	[ATR_STRENGTH]		=	32;
	attribute	[ATR_DEXTERITY]		=	30;
	
	attribute	[ATR_HITPOINTS_MAX]	=	60;
	attribute	[ATR_HITPOINTS]		=	60;

	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	7;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	2;
	protection	[PROT_MAGIC]		=	2;
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE Snf_MolKiller_Wolf	(Mst_Default_Wolf)
{
	name= "G³odny wilk";
	Npc_SetAivar(self,AIV_MM_REAL_ID,ID_MIS_SNAFWOLF);
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  3);	
	level=6;
	attribute	[ATR_STRENGTH]		=	30;
	attribute	[ATR_DEXTERITY]		=	20;
	
	attribute	[ATR_HITPOINTS_MAX]	=	127;
	attribute	[ATR_HITPOINTS]		=	127;
	protection	[PROT_BLUNT]		=	1;
	protection	[PROT_EDGE]			=	1;
	protection	[PROT_POINT]		=	1;
	protection	[PROT_FIRE]			=	1;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	B_SetMonsterLevel();	
	Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
	daily_routine = Rtn_MolKillerWolf_1050010;
	CreateInvItems (self, ItFoMuttonRaw, 4);
};