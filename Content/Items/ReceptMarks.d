//#####################################################################
//##
//##
//##						Recept Marks
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Base Marks
//---------------------------------------------------------------------
INSTANCE ItMa_ironore (C_Item)//3x-->Iron,3x+2(carbon)=Steel
{
	name 				=	"Bry³ka ¿elaza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1;

	visual 				=	"ITMI_IRONORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMa_silverore (C_Item)
{
	name 				=	"Bry³ka srebra";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ITMI_SILVERORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_goldore (C_Item)
{
	name 				=	"Bry³ka z³ota";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual 				=	"ITMI_GOLDORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_carbon (C_Item)//3(iron)+2x=Steel
{
	name 				=	"Wêgiel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"ITMI_CARBONORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_lumber (C_Item)//Arrows/Some Poor SWD/Bows/Blunt Weapons
{
	name 				=	"Drewno leszczyny";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Goodlumber (C_Item)//Some SWD/Blunt Weapons
{
	name 				=	"Drewno cisowe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Bowlumber_01 (C_Item)// Bows
{
	name 				=	"Drewno akacjowe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Bowlumber_02 (C_Item)// Bows
{
	name 				=	"Drewno jesionowe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	125;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Bowlumber_03 (C_Item)// Bows
{
	name 				=	"Drewno wi¹zowe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Wool (C_Item)//Arrows/Some SWD/Bows/Blunt Weapons
{
	name 				=	"We³na";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ITRM_WOOL.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_ClawlerThread (C_Item)//Arrows/Some SWD/Bows/Blunt Weapons
{
	name 				=	"Niæ pe³zacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	55;

	visual 				=	"ITRM_CRWTHREAD.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
//---------------------------------------------------------------------
//	Level I Marks
//---------------------------------------------------------------------
INSTANCE ItMa_Iron (C_Item)
{
	name 				=	"Sztabka ¿elaza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ITRM_IRON.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_Steel (C_Item)
{
	name 				=	"Sztabka stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	40;

	visual 				=	"ITRM_STEEL.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	

INSTANCE ItMa_GoodSteel (C_Item)
{
	name 				=	"Sztabka utwardzanej stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ITRM_STEEL.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMa_ExclusiveSteel (C_Item)
{
	name 				=	"Sztabka hartowanej stali";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"ITRM_STEEL.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_MagicBillet (C_Item)//300 magic ore
{
	name 				=	"Sztabka magicznego kruszcu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	750;

	visual 				=	"ITRM_MAGICORFRAME.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	

INSTANCE ItMa_silverbillet (C_Item)
{
	name 				=	"Sztabka srebra";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual 				=	"ITMI_SILVERORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMa_goldbillet (C_Item)
{
	name 				=	"Sztabka z³ota";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	400;

	visual 				=	"ITMI_GOLDORE_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItFo_Poison(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	100;	

	visual 			=	"ItFo_Potion_Strength_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	Usepoison;
	scemeName		=	"POTIONFAST";

	description			= "Trucizna";
	TEXT[5]				= NAME_Value;					COUNT[5]	= 100;
};

	FUNC VOID Usepoison()
	{ 
 		add_poison(gomez,self,1000);
	};
/*
//--------------------
// Others from Animalthropies
//--------------------
ItAt_WolfTeeth - 14
ItAt_SnapperTeeth - 27
ItAt_RazorTeeth - 33
ItAt_BloodHoTeeth - 27
ItAt_WaranTeeth - 13
ItAt_FireWaranTeeth - 55
ItAt_LurkerTeeth - 22
ItAt_ShadTeeth - 45
ItAt_OrcDogTeeth - 17
ItAt_BiterTeeth - 17
ItAt_AligatTeeth - 30
ItAt_TrollTeeth - 205
ItAt_KingTroTeeth - 505
ItAt_YoTroTeeth - 105
ItAt_OrcTeeth - 40 //OrcWarrior/scout...
ItAt_SwampshTeeth - 55
ItAt_Kosc - 40
ItAt_GobKosc - 30
ItAt_WatMRat - 10//W¹troba kretoszczura
ItAt_WolfClaws - 19
ItAt_SnapperClaws - 32
ItAt_RazorClaws - 38
ItAt_BloodHoundClaws - 32
ItAt_WaranClaws - 18
ItAt_FireWaranClaws - 60
ItAt_ShadClaws - 50
ItAt_OrcDogClaws - 22
ItAt_BiterClaws - 22
ItAt_AligatClaws - 25
ItAt_LurkerClaws - 27


//-------
// SKINS
//-------
ItAt_WolfSkin - 60
ItAt_WolfSkin2 - 64//orcdog
ItAt_WaranTongue - 150
ItAt_CrawlerPlate - 42
ItAt_ShadowSkin - 120
ItAt_Shadow_02 - 103
ItAt_LurkerSkin - 74
ItAt_TrollSkin - 440
ItAt_KingTroSkin - 1040
ItAt_YoTroSkin - 210
ItAt_SwampsharkSkin - 140
ItAt_SnapperSkin - 84
ItAt_RazorSkin - 96
ItAt_WaranSkin - 56
ItAt_FireWSkin - 140
ItAt_BiterSkin - 64
ItAt_AligatSkin - 90

//MISC
ItAt_ScaFeather - 1//pioro scierwojada
ItAt_HarFeather - 2//pioro harpii
ItAt_OrcSha_Plume - 100// piuroposzu szamana
ItAt_WatMRat - 10//watroba kretosz.
ItAt_Bloodfly_02 - 25
ItAt_WTF - 100//jelita cieniostwora
ItAt_StoneGolem_01 - 1000
ItAt_FireGolem_01 - 1000
ItAt_IceGolem_01 - 1000
ItAt_IceGolem_02 - 100//fragment
*/
/*
Stabka magicznego kruszcu tylko do najlepszych mieczy reszta pokrywana ItMiNugget(m. ruda) tyle aby wyrównac cene sk³adników do ok. 3/4 po³owy ceny produktu(czyli 3/8 ca³kowitej ceny produktu) 
*/