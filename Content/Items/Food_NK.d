const int	Value_Fish		=	15;		const int	HP_Fish			=	5;
const int	Value_Stew		=	9;		const int	HP_Stew			=	20;
const int	Value_FishSoup	=	19;		const int	HP_FishSoup		=	10;
const int	Value_Sausage	=	31;		const int	HP_Sausage		=	12;
const int	Value_Honey		=	32;		const int	HP_Honey		=	12;

const int	Value_BeerMug	=	10;		const int	HP_BeerMug		=	3;	const int	Mana_BeerMug		=	1;
const int	Value_Gin		=	14;		const int	HP_Gin			=	4;	const int	Mana_Gin	=	1;
const int	Value_Milk		=	15; 	const int	HP_Milk			=	5;	const int	Mana_Milk		=	3;	// Joly: Wenn diese Werte geändert werden passt Lobarts Auftrag holMilch nicht mehr!!!!!!

CONST int Value_Rum = 50;
CONST int Mana_Rum  = 15;

const int Value_Grog = 10;
const int HP_Grog	 = 3;

INSTANCE ItFo_Stew (C_Item)
{	
	name 				=	"Gulasz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Stew;
	
	visual 				=	"ItFo_Stew.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"RICE";
	on_state[0]			=	Use_Stew;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Stew;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Stew;

};

	FUNC VOID Use_Stew()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Stew);
	};
	
INSTANCE ItFo_Fish (C_Item)
{	
	name 				=	"Ryba";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Fish;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Fish;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Fish;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Fish;

};

	FUNC VOID Use_Fish()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Fish);
	};
	
INSTANCE ItFo_BeerMug (C_Item)
{	
	name 				=	"Kufel piwa";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_BeerMug;
	
	visual 				=	"ItFo_MugBeer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_BeerMug;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_BeerMug;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_BeerMug;
	
	TEXT[4]				= 	"Mroczny paladyn";		
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_BeerMug;

};

	FUNC VOID Use_BeerMug()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_BeerMug);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_BeerMug);	 
	};
	
INSTANCE ItFo_Gin (C_Item)
{	
	name 				=	"Gin";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Gin;
	
	visual 				=	"ItFo_Gin.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Gin;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Gin;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Gin;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Gin;

};

	FUNC VOID Use_Gin()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Gin);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Gin);	 
	};

INSTANCE ItFo_Milk (C_Item)
{	
	name 				=	"Mleko";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Milk;
	
	visual 				=	"ItFo_Milk.3ds";
	material 			=	MAT_GLAS;
	scemeName			=	"POTION";
	on_state[0]			=	Use_Milk;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Milk;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Milk;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Milk;

};

	FUNC VOID Use_Milk()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Milk);
		Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Milk);	 
	};		
	
//-----------------------------
INSTANCE ItFo_Addon_Rum(C_Item)
{
	name 			=	"Rum";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Rum;	

	visual 			=	"ItMi_Rum_02.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseRum;
	scemeName		=	"POTIONFAST";

	description		= 	"Bia³y rum";
	
	TEXT[1]			= 	NAME_Bonus_Mana;				
	COUNT[1]		= 	Mana_Rum;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Rum;

};

	FUNC VOID UseRum()
	{
		Npc_ChangeAttribute	(self,	ATR_MANA, Mana_Rum);
	};

//#############################################
//			Grog
//#############################################
	
INSTANCE ItFo_Addon_Grog(C_Item)
{
	name 			=	"Grog";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseGrog;
	scemeName		=	"POTIONFAST";

	description		= 	"Grog prawdziwego marynarza";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;

};

	FUNC VOID UseGrog()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
	};		