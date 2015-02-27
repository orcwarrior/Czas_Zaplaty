/***************************************************

CHAPTER 3 ITEMS

***************************************************/

//Ramon Chests (Quest ID: 553)
const int	Value_RamonChests		= 200;
//#############################################
//			Grog
//#############################################
//---------------------------------------------------------------------
// Kertsel Quests Valuables
//---------------------------------------------------------------------
INSTANCE  RamonAmulet(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	400;

	visual 			=	"ItAm_Hp_01.3DS";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_RamonAmulet;
	on_unequip		=	UnEquip_RamonAmulet;

	description		= "Amulet Ramona";

	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_RamonAmulet()
{
 	self.protection [PROT_FIRE] += 3;
};

FUNC VOID UnEquip_RamonAmulet()
{
	self.protection [PROT_FIRE] -= 3;
};

instance WittenRing(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	//trzeba ustaliæ jak¹œ wartoœæ dla pierœcienia
	value 					=	200;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_WittenRing;
	on_unequip				=	UnEquip_WittenRing;

	description		= "Pierœcieñ Wittena";

	//Nie wiem czy mogê sobie pozwoliæ na nie u¿ywanie zmiennych z text.d tylko wpisac po prostu stringa?:) Wychodzi na to samo.. chociaz wiem ze takie rozwiazanie nie jest moze jakos specjalnie uniwersalne :P
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

//oraz optymalne parametry dla niego

FUNC VOID Equip_WittenRing()
{
	self.protection [PROT_EDGE] 		+=  5;
};

FUNC VOID UnEquip_WittenRing()
{
	self.protection [PROT_EDGE] 		-=  5;
};

/******************************************************************************************/
INSTANCE RamonChests (C_Item)
{
	name 				=	"Jedna ze skrzynek Ramona";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldChest;

	visual 				=	"ItMi_GoldChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	Value_RamonChests;
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Drogie talerze
// QUESTID 554
// **************************************************

//orc nadaj jakas wartosc talerzowi
instance KeretselIleums (C_Item)
{
	name 				=	"B³yszcz¹cy talerz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	

INSTANCE ItFo_Special_Booz(C_Item)
{
	name 			=	"Spirytusowa nalewka";

	mainflag 		=	ITEM_KAT_FOOD;
	flags 			=	ITEM_MULTI;

	value 			=	2*Value_Grog;	

	visual 			=	"ItMi_Rum_01.3ds"; 
	material 		=	MAT_GLAS;
	on_state[0]		=	UseSpecial_Booz;
	scemeName		=	"POTIONFAST";

	description		= 	"Spirytusowa nalewka od Piwosza";
	
	TEXT[1]			= 	NAME_Bonus_HP;				
	COUNT[1]		= 	HP_Grog;
	
	TEXT[5]			= 	NAME_Value;					
	COUNT[5]		= 	Value_Grog;
};

FUNC VOID UseSpecial_Booz()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS, HP_Grog);
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",180000);
	PrintScreen	("Ale ten samogon ma kopa...", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
};		

INSTANCE packageOC (C_Item)
{
	name 				=	"Paczka z broni¹";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	100;

	visual 				=	"NW_CITY_WEAPON_BAG_01.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Ta paczka jest dobrze";
	text[3] = "naoliwiona i pe³na";
	text[4] = "broni.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE Fingers_Lockpick (C_Item)
{
	name 				=	"Solidny wytrych";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	2*Value_Dietrich;

	visual 				=	"ItKe_Lockpick_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
};

INSTANCE AKT(C_Item)
{	
	name 					=	"Szkic";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	60;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseAKT;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseAKT()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PinUp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};
	
instance Royal_Ring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description		= "Bogato zdobiony pierœcieñ";

	//Nie wiem czy mogê sobie pozwoliæ na nie u¿ywanie zmiennych z text.d tylko wpisac po prostu stringa?:) Wychodzi na to samo.. chociaz wiem ze takie rozwiazanie nie jest moze jakos specjalnie uniwersalne :P

	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

/********************************************************************************/
//				BRIEF AN FEUERMAGIER
/*********************************************************************************/
INSTANCE ItWr_FletcherFake_Letter_01 (C_Item)
{	
	name 				=	"Zapieczêtowane pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Usefletcherfakeletter;
	scemeName			=	"MAPSEALED";
	description			= "Spreparowany list Fletchera";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	TEXT[1]				= "Z³amanie pieczêci by³oby g³upot¹!";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

func void Usefletcherfakeletter ()
{   
	CreateInvItem     (hero, ItWr_FletcherFake_Letter_02);
		
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Gomezie,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					//TODO: Jakaœ treœæ
					Doc_PrintLine	( nDocID,  0, "Loremipsum."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_PrintLine	( nDocID,  0, "Fletcher."					);
					Doc_Show		( nDocID );
};
   
/********************************************************************************/
INSTANCE ItWr_FletcherFake_Letter_02 (C_Item)
{	
	name 				=	"Otwarty list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Usefletcherfakeletter2;
	scemeName			=	"MAP";
	description			= "Spreparowany list Fletchera";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

func void Usefletcherfakeletter2 ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Gomezie,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					//TODO: Jakaœ treœæ
					Doc_PrintLine	( nDocID,  0, "Loremipsum."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					Doc_PrintLine	( nDocID,  0, "Fletcher."					);
					Doc_Show		( nDocID );
		
};

INSTANCE ITKE_GOMEZ_01_2 (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MISSION;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Klucz otwieraj¹cy jedn¹ ze skrzyñ Gomeza.";	
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	

INSTANCE ITKECOOPERKEY (C_Item)
{
	name 				=	"Klucz Coopera.";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MISSION;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Klucz Coopera";	
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};

INSTANCE kevin_diary (C_Item)
{	
	name 					=	"Dziennik";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Book_02_02.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= "Dziennik";

	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]				=	Usekevin_diary;
};

FUNC VOID Usekevin_diary()
{   
	var int nDocID;
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga" 	, 0 		); 
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga"	, 0		);
					
					//1.Seite
  					
					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1);  //  0 -> margins are in pixels				
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");									
					Doc_PrintLine	( nDocID,  0, "Dzieñ 27");					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Odkry³em podziemne przejscie prowadz¹ce poza oboz.");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLine	( nDocID,  0, "");					
					Doc_PrintLine	( nDocID,  0, "Dzieñ 31");					
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Zdoby³em klucz do drzwi prowadz¹cych przez piwnicê magnatów starym korytarzem na terytoria orków, daleko poza obóz.");					
			///		Doc_PrintLines	( nDocID,  0, "Die Fähigkeiten die göttliche Macht zu kanalisieren wächst in dem Magier. Anfangs keimt sie nur wie ein kleiner Schössling auf dem Feld und man muss ihn pflegen, damit er nicht verkümmert. Doch wenn dieser Schössling erst einmal herangewachsen ist, entfaltet er seine volle Pracht");
					
					
					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)// -1 -> all pages 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga");								
					Doc_PrintLine	( nDocID,  1, "Dzieñ 36");			
					Doc_PrintLine	( nDocID,  1, "");
					Doc_PrintLines	( nDocID,  1, "Gomez coœ szykuje, muszê dowiedzieæ siê co siê œwiêci...");
					Doc_Show		( nDocID );
};	
	

/******************************************************************************************/
INSTANCE BlowPerl (Bow)
{
	name 				=	"Perlisty podmuch";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal			=	35;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	65;
	visual 				=	"ItRw_Bow_War_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//***************************************

INSTANCE Urgal_Arth (WeaponsMelee)
{	
	name 				=	"Urgal'Arth";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1200;

	damageTotal			= 	125;
	damagetype			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   110;
	visual 				=	"ItMw_2H_OrcMace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/*******************
Mapy z ornamentami - Ork trzeba je zrobiæ graficznie i wrzuciæ miejsca z zaznaczon¹ lokacj¹ ornamentów
*******************/

//***********2 mapa*****************

INSTANCE JarvisMap(C_Item)
{	
	name 					=	"Zniszczona mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseJarMap;

	description				= "Zniszczona mapa od Jarvisa";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseJarMap()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_ORNAMENT_2.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};

var int map3_read;
var int map4_read;

//*************3 mapa***********

INSTANCE OrnMap3(C_Item)
{	
	name 					=	"Mapa od Nefariusa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNefarMap;

	description				= "Wskazuje miejsce ukrycia ornamentu";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseNefarMap()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_ORNAMENT_3.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	
	if (map3_read == FALSE)
	{
      map3_read = TRUE;
      map3_readbydick = TRUE;//¿eby by³a pewnoœæ, ¿e dick j¹ przeczyta³ i wtedy zainicjuje siê ten pods³uch stra¿nikó w miejscu ukrycia 3 kawa³ka
	};
};

/***************************

Ork trzebaby ornamenty zrobi 4, mog¹ byæ jak te z NK i niech siê nazywaj¹
orn1
orn2
orn3
orn4

Te nazwy bêdê wykorzystywa³ w skryptach

*****************************/
PROTOTYPE Proto_ornament (C_Item)
{
	name 				=	"Kawa³ek ornamentu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Münze;

	visual 				=	"ItMi_Focus_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

instance orn1 (Proto_ornament)
{
};	

instance orn2 (Proto_ornament)
{
};	

instance orn3 (Proto_ornament)
{
};	

instance orn4 (Proto_ornament)
{
};	

//*************4 mapa***********

INSTANCE OrnMap4(C_Item)
{	
	name 					=	"Mapa od Nefariusa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNefarMap4;

	description				= "Miejsce ukrycia ostatniego ornamentu";

	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseNefarMap4()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "MAP_ORNAMENT_4.tga", 1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	
   if (map4_read == FALSE)
	{
      map4_read = TRUE;
      map4_readbydick = TRUE;//gracz mo¿e otworzyæ mapê, sprawdziæ gdzie jest lokacja z ornamentem i j¹ wywaliæ, nie trzeba dawaæ wtedy sprawdzania itema tylko stan zmiennej, tak bêdzie bezpieczniej dla graczy
	};
};

INSTANCE ItKe_Mis_SO_Warehouse1 (C_Item)
{
	name 				=	"Klucz do magazynu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Klucz do magazynu obok areny.";	
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	

INSTANCE ItKe_Mis_SO_Warehouse2 (C_Item)
{
	name 				=	"Klucz do magazynu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[1]				= "Klucz do magazynu na targowisku,";	
	TEXT[1]				= "magazynier by³ tak g³upi ¿e sam mi go sprzeda³!";	
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	
INSTANCE ItKe_Mis_SO_Warehouse2U (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= 1;
};	
//Todo" Some nice visuals
INSTANCE ork_oldnote (C_Item)
{	
	name 				=	"Pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Useork_oldnote;
	scemeName			=	"MAP";
	description			= "Pismo w dziwnym jêzyku.";
};

func void Useork_oldnote ()
{   
	var int nDocID;
		
	nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "LETTERS_FOREIGNLANGUAGE_V1.TGA"  , 0 		); 
				
					Doc_Show		( nDocID );
};

INSTANCE dream_mixture(C_Item)
{
	name 			=	"Podejrzana mikstura";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MISSION;

	value 			=	1;	
	visual 			=	"ItFo_Temp_STRDEX_02.3DS";
	material 		=	MAT_GLAS;

	
	description			= "Podejrzana mikstura";
	TEXT[1]				= "Powinienem pokazaæ j¹";
	TEXT[2]				= "komuœ kto zna siê.";
	TEXT[3]				= "na alchemii.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
