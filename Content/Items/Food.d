// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************

const int	Value_Bugmeat		=	 2;		const int	hp_Bugmeat			=	4;
const int	Value_Apfel			=	 4;		const int	hp_Apfel			=	8;
const int	Value_Weintrauben	=	 6;		const int	hp_Weintrauben		=	8;

const int	Value_Wasser		=	 3;		const int	hp_Wasser			=	5;
const int	Value_Bier			=	10;		const int	hp_Bier				=	3;
const int	Value_Wein			=	13;		const int	hp_Wein				=	3;
const int	Value_Reisschnaps	=	15;		const int	hp_Reisschnaps		=	3;

const int	Value_Reis			=	 5;		const int	hp_Reis				=	10;
const int	Value_Wurzelsuppe	=	 3;		const int	hp_Wurzelsuppe		=	 7;
const int	Value_Ragout		=	 4;		const int	hp_Ragout			=	 9;
const int	Value_CrawlerSuppe	=	10;		const int	hp_CrawlerSuppe		=	15;

const int	Value_FleischRoh	=	 5;		const int	hp_FleischRoh		=	10;
const int	Value_Brot			=	 8;		const int	hp_Brot				=	12;
const int	Value_Käse			=	10;		const int	hp_Käse				=	15;
const int	Value_Fleisch		=	 8;		const int	hp_Fleisch			=	15; // Rohes Fleisch mit Pfanne benutzt
const int	Value_Schinken		=	12;		const int	hp_Schinken			=	18;
/*******************************************************************************************
**	Essbares				                                          					**
*******************************************************************************************/

INSTANCE ItAt_Meatbug_01 (C_Item)
{	
	name 				=	"Miêso chrz¹szcza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bugmeat;
	
	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Bugmeat;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bugmeat;

};

	FUNC VOID UseBugmeat()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Bugmeat);
	};

INSTANCE ItAt_Meatbug_01_MIS (C_Item)
{	
	name 				=	"Miêso chrz¹szcza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;
	
	value 				=	Value_Bugmeat;
	
	visual 				=	"ItAt_Meatbug_01.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseBugmeat;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Bugmeat;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bugmeat;
};


/******************************************************************************************/
INSTANCE ItFoApple(C_Item)
{	
	name 				=	"Jab³ko";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Apfel;

	visual 				=	"ItFo_Apple_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	UseApple;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Apfel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Apfel;
};

FUNC VOID UseApple()
{
	B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Apfel);
			
   if(!Npc_IsPlayer(self))
	{ 
      return;
   };
			
   Apple_Counter+=1;
			
   if(Apple_Counter>=Apple_Needed)&&(Apple_Counter%Apple_Needed==0)
	{
		B_AddAttributePoints(hero,ATR_STRENGTH,Apple_STR_Incease);
	}
	else if(Apple_Counter%Apple_Needed==Apple_Needed/2)
	{
		//Sher, zrob cos z tym :D
		PutMsg("Czujesz przyp³yw si³...","font_default.tga",RGBAToZColor(155,255,155,255),_TIME_MESSAGE_LOGENTRY,"");
	};		
};

/******************************************************************************************/
INSTANCE ItFo_wineberrys_01(C_Item)
{	
	name 				=	"Winogrona";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Weintrauben;

	visual 				=	"ItFo_wineberrys_01.3ds";
	on_state[0]         = 	Usewineberrys;  
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Weintrauben;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Weintrauben;
};

	func void Usewineberrys () 
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Weintrauben);
	};

/******************************************************************************************/
INSTANCE ItFoLoaf(C_Item)
{	
	name 				=	"Chleb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brot;

	visual 				=	"ItFo_Bread.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseLoaf;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Brot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Brot;

};

	FUNC VOID UseLoaf()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Brot);
	};

/******************************************************************************************/
INSTANCE ItFoMutton (C_Item)
{	
	name 				=	"Sma¿one miêso";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Fleisch;

	visual 				=	"ItFo_CookedMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMutton;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Fleisch;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Fleisch;
};

	FUNC VOID UseMutton()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Fleisch);
	};

/******************************************************************************************/
INSTANCE ItFoMuttonRaw (C_Item)
{	
	name 				=	"Surowe miêso";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_FleischRoh;

	visual 				=	"ItFo_RawMutton_01.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseMuttonRaw;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_FleischRoh;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_FleischRoh;
};

	FUNC VOID UseMuttonRaw()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_FleischRoh);
	};

/******************************************************************************************/
INSTANCE ItFo_mutton_01 (C_Item)
{	
	name 				=	"Szynka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Schinken;

	visual 				=	"ItFo_mutton_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseMutton1;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Schinken;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Schinken;

};

	FUNC VOID UseMutton1()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Schinken);
	};

/******************************************************************************************/
INSTANCE ItFoCheese(C_Item)
{	
	name 				=	"Ser";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Käse;

	visual 				=	"ItFo_Cheese_01.3ds";
	scemeName			=	"FOODHUGE";
	on_state[0]			=	UseCheese;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Käse;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Käse;
};

	FUNC VOID UseCheese()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Käse);
	};

/******************************************************************************************/
INSTANCE ItFoRice(C_Item)
{	
	name 				=	"Ry¿";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Reis;

	visual 				=	"ItFo_Rice_01CZ.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseRice;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Reis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reis;
};

	FUNC VOID UseRice()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Reis);
	};

/******************************************************************************************/
INSTANCE ItFoSoup(C_Item)
{	
	name 				=	"Zupa korzenna";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wurzelsuppe;

	visual 				=	"ItFo_Soup_01.3ds";
	scemeName			=	"RICE";
	on_state[0]			=	UseSoup;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Wurzelsuppe;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wurzelsuppe;
};

	FUNC VOID UseSoup()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Wurzelsuppe);
	};

/******************************************************************************************/
INSTANCE ItFoMeatbugragout(C_Item)
{	
	name 				=	"Potrawka z chrz¹szcza";
	
	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Ragout;

	visual 				=	"ItFo_Meatbugragout_01.3ds"; 
	material 			=	MAT_LEATHER;
	scemeName			=	"RICE";
	on_state[0]			=	UseMeatbugragout;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Ragout;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Ragout;
};

	FUNC VOID UseMeatbugragout()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Ragout);
	};

/******************************************************************************************/
INSTANCE ItFoCrawlersoup(C_Item)                                          
{	                                                                
	name 				=	"Zupa z pe³zacza";
	                                                            
	mainflag 			=	ITEM_KAT_FOOD;  
	flags 				=	ITEM_MULTI;
                                                                    
	value 				=	Value_CrawlerSuppe;              
                                                                    
	visual 				=	"ItFo_Crawlersoup_01.3ds";    
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseCrawlersoup;   
	scemeName			=	"RICE";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_CrawlerSuppe;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_CrawlerSuppe;                                                    
};

	FUNC VOID UseCrawlersoup()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_CrawlerSuppe);
	};


/*******************************************************************************************
**	Trinkbares				                                        					  **
*******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Water_01(C_Item)
{
	name 			=	"Woda";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Wasser;	

	visual 			=	"ItFo_WaterNK.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseWaterPotion;
	scemeName		=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Wasser;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wasser;
};

	func VOID UseWaterPotion()
	{	
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Wasser);
	};


// FIXME: zs_Drunk für SC oder nicht? 
INSTANCE ItFoBeer(C_Item)
{
	name 				=	"Piwo";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Bier;	

	visual 				=	"ItFo_Beer_01CZ.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBeer;
	scemeName			=	"POTION";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;		COUNT[1]	= hp_Bier;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_BeerMug*2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bier;
};

	FUNC VOID UseBeer()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Bier);
		B_ChangeAttribute	(self,	ATR_MANA,	Mana_BeerMug*2);
	};

/******************************************************************************************/

INSTANCE ItFoWine(C_Item)
{	
	name 				=	"Wino";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wein;

	visual	 			=	"ItFo_Wine_01.3ds";
	material 			=	MAT_LEATHER;
	on_state[0]			=	UseWine;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Wein;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Wein;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= 5;
};

	FUNC VOID UseWine()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Wein);
		B_ChangeAttribute	(self,	ATR_MANA,	5);
	};

/******************************************************************************************/

INSTANCE ItFoBooze(C_Item)
{	
	name 				=	"Ry¿ówka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Reisschnaps;

	visual 				=	"ItFo_Booze_01CZ.3ds";
	material 			=	MAT_GLAS;
	on_state[0]			=	UseBooze;
	scemeName			=	"POTION";

	description			= name;
	//TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Reisschnaps;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Reisschnaps;
};

	FUNC VOID UseBooze()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Reisschnaps);
		B_ChangeAttribute	(self,	ATR_MANA,	2);
	};

