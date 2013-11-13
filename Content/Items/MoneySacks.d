FUNC VOID NuggetSack_01()
{
	PutMsg("Otrzymano 25 bry³ek rudy.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
	Snd_Play ("GoldSack");
	CreateInvItems(hero,ItMiNugget,25);	
};
FUNC VOID GoldSack_01()
{
	PutMsg("Otrzymano 25 monet.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
	Snd_Play ("GoldSack");
	CreateInvItems(hero,ItMi_Stuff_OldCoin_01,25);	
};
FUNC VOID NuggetSack_02()
{
	PutMsg("Otrzymano 50 bry³ek rudy.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
	Snd_Play ("GoldSack");
	CreateInvItems(hero,ItMiNugget,50);	
};
FUNC VOID NuggetSack_03()
{
	PutMsg("Otrzymano 100 bry³ek rudy.","font_default.tga",RGBAToZColor(255,255,255,255),8,"");
	Snd_Play ("GoldSack");
	CreateInvItems(hero,ItMiNugget,100);	
};
/******************************************************************************************/
INSTANCE ItMi_NuggetSack_01 (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= "W sakwie znajduje siê kilka bry³ek.";
	scemeName				=	"MAPSEALED";	
	on_state[0]			=	NuggetSack_01;
};
INSTANCE ItMi_NuggetSack_02 (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Pocket.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= "W sakwa jest ciê¿ka od bry³ek.";
	scemeName				=	"MAPSEALED";	
	on_state[0]			=	NuggetSack_02;
};
INSTANCE ItMi_NuggetSack_03 (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= "W sakwa jest wype³niona po brzegi rud¹!";
	scemeName				=	"MAPSEALED";	
	on_state[0]			=	NuggetSack_03;
};


INSTANCE ItMi_GoldtSack_01 (C_Item)
{
	name 				=	"Sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItMi_Pocket.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= "W sakwie znajduje siê kilka monet.";
	scemeName				=	"MAPSEALED";	
	on_state[0]			=	GoldSack_01;
};