// --------------- Czarny WIlk----------------

/*******************
Trzeba mu tylko teksturê dorobiæ

********************/

instance BlackWolf (Mst_Default_Wolf)
{
	name 				= 	"Czarny wilk";
	level				=	14;

	attribute	[ATR_STRENGTH]		=	80;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	10;
	
	Mdl_SetVisual			(self,"Wolf.mds");
	//					Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		2,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_BLACKWOLF);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  4);	
};

instance BlackWolfBoss (Mst_Default_Wolf)
{
	name 				= 	"Przywódca stada";
	level				=	20;

	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	50;
	
	attribute	[ATR_HITPOINTS_MAX]	=	300;
	attribute	[ATR_HITPOINTS]		=	300;
	
	protection	[PROT_BLUNT]		=	70;
	protection	[PROT_EDGE]			=	70;
	protection	[PROT_POINT]		=	30;
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	10;

	Mdl_SetModelScale(self, 1.2, 1.2, 1.2);
	Npc_SetToFistMode(self);
	Npc_SetAivar(self,AIV_MM_REAL_ID,	ID_BLACKWOLFBOSS);
	Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);	
};
