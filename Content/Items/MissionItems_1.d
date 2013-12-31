//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################
/**************************
Itemy by Sher
****************************/

INSTANCE whistlerlist (C_Item)
{	
	name 					=	"Lista sk³adnikow od Œwistaka";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseWhistlerLetter;
	description				=	"Lista sk³adników od Œwistaka";

	TEXT[0]					=	"Œwistak potrzebuje WSZYSTKICH";
	TEXT[1]					=	"przedmiotów z tej listy.";
};

func void UseWhistlerLetter ()
{   
	whistler_list = TRUE;
	var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "PAWIE PIÓRO"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Sztabka stali"					);
					Doc_PrintLine	( nDocID,  0, "2x sztabka ¿elaza"	);
					Doc_PrintLine	( nDocID,  0, "2x wêgiel"					);
					Doc_PrintLine	( nDocID,  0, "Drewno cisowe na rêkojeœæ"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "(widaæ, ¿e niedawno ktoœ dopisa³ resztê)"					);
					Doc_PrintLines	( nDocID,  0, "6x piwo"					);
					Doc_PrintLine	( nDocID,  0, "2x grog"					);
					Doc_PrintLine	( nDocID,  0, "6x sma¿one miêso"					);
					Doc_PrintLine	( nDocID,  0, "2x ser (ma³o œmierdz¹cy)"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};

/*********
ItMa_Iron sztabka ¿elaza
ItMa_Steel sztabka stali
ItMa_carbon wêgiel
ItMa_Goodlumber drewno cisowe
****************/

INSTANCE package1 (C_Item)
{
	name 				=	"Paczka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Packet.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Ta zniszczona paczka";
	text[3] = "pe³na jest ró¿nych";
	text[4] = "przedmiotów.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE package2 (C_Item)
{
	name 				=	"Paczka z orê¿em";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	25;

	visual 				=	"NW_CITY_WEAPON_BAG_01.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Ta paczka jest dobrze";
	text[3] = "naoliwiona i pe³na";
	text[4] = "orê¿a.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE sly_head (C_Item)
{
	name 				=	"G³owa Z³ego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"Sly_Head.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "Nie wyglada";
	text[3] = "zbyt estetycznie.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE whistler_pack (C_Item)
{
	name 				=	"Paczka ze sk³adnikami";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	50;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	text[2] = "To paczka ze sk³adnikami";
	text[3] = "od Œwistaka niezbêdnymi";
	text[4] = "do wykucia pawiego pióra.";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE whistler_toy (WeaponsMelee)
{	
	name 				=	"Pawie pióro";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	100;

	damageTotal			= 	25;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	  visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= "Pawie pióro - nowa zabawka Œwistaka";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//Poziomka

INSTANCE poziomka (C_Item)
{	
	name 				=	"Poziomka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Waldbeeren;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UsePoziomBerrys;
	scemeName			=	"FOOD";

	description			= "Poziomka";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= HP_Waldbeeren;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Waldbeeren;
};

func void UsePoziomBerrys ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Waldbeeren);
};

INSTANCE konfitury (C_Item)
{
	name 				=	"Konfitury";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Alchemy_Moleratlubric_01.3DS";

	material 			=	MAT_WOOD;
	on_state [0]		=   UseKonfitury;
	scemeName			=	"FOOD";

	description			= "Pyszne konfitury";
	TEXT[1]				= NAME_Bonus_HP;				COUNT[1]	= 12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 25;
};

func void UseKonfitury ()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	12);
};

INSTANCE aloes (C_Item)
{	
	name 				=	"Aloes";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	70;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= UseAloes;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= 7;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 70;
};

func void UseAloes ()
{			
	B_ChangeAttribute	(self,	ATR_HITPOINTS,	7);
};

INSTANCE aloes_mixture (C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;	

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseVoiceMixture;
	scemeName		=	"POTIONFAST";

	description			= "Mikstura z ³odygi aloesu";
	TEXT[1]				= "Specjalna mikstura dla Pacho, dziêki";				
	TEXT[5]				= "której mo¿e odzyska g³os.";
};

FUNC VOID UseVoiceMixture()
{ 
	if(Hlp_GetInstanceID(self)==grd_224_Pacho)
	{
		Snd_Play3D(self,"pachoscream");   
	};
};

INSTANCE gomez_mirror(C_Item)
{
	name 			=	"Lusterko";

	mainflag 		=	ITEM_KAT_NONE;
	flags 			=	ITEM_MULTI;

	value 			=	500;	

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;

	description			= "Piêknie zdobione lusterko.";
	TEXT[1]				= "Na odwrocie lusterka znajduje siê";				
	TEXT[2]				= "wizerunek pulchnej kobiety z podpisem:";
	TEXT[3]				= "Kochana mamusia...";
	TEXT[4]				= "A skoro to lusterko nale¿a³o do Gomeza to";
	TEXT[5]				= "oznacza, ¿e to jego mamusia!";
};

INSTANCE Aidan_Hammer (C_Item)
{
	name 				=	"M³otek Aidana";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal			=Math_Round(   20*5/2);
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=Math_Round( 	9*16/5);
	visual 				=	"ItMw_1H_Warhammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE RBL_AIDAN_SWORD (WeaponsMelee)
{	
	name 				=	"Miecz wykuty przez Aidana";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	300; 	//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

	damageTotal			= 	48;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	damageTotal			=Math_Round( 	30*5/2);
	damagetype 			= 	DAM_EDGE;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=Math_Round( 	14*16/5);
	visual 				=	"ItMw_1H_Sword_Long_03.3DS";

	description			= name;
	TEXT[0]				= "Specjalnie zaostrzony";	
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE RBL_AIDAN_SWORD2 (WeaponsMelee)
{	
	name 				=	"Miecz wykuty przez Aidana";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	250; 	//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

	damageTotal			=Math_Round( 	27*5/2);
	damagetype 			= 	DAM_EDGE;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=Math_Round( 	14*16/5);
	visual 				=	"ItMw_1H_Sword_Long_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSTANCE ItWrOMMap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	30;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOMmap;

	description				= "Mapa do Starej Kopalni";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]				= ;
	//TEXT[3] 				= "";
	//COUNT[3]				= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseOMmap()
{
	var int nDocID;
		
	nDocID = Doc_CreateMap	()			  ;							// DocManager 
				Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
				Doc_SetPages	( nDocID, 1 );                         
				Doc_SetPage 	( nDocID, 0, "Map_OldMine.tga", 1	);  //  1 -> DO NOT SCALE 
				Doc_Show		( nDocID 	);
};

/************************************************
**  Missionsitems für Introparcours in der VM  **
************************************************/

INSTANCE AltesSchwertVM (C_Item)
{	
	name 				=	"Stary miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	10 ;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

INSTANCE AltesSchwert (C_Item)
{	
	name 				=	"Stary miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	12;
	cond_atr[2]   		= ATR_STRENGTH;
	cond_value[2]  		= 10;
	damageTotal			= 	12;
	damagetype 			=	DAM_EDGE;		
	visual 				=	"ItMw_1H_Sword_Old_01.3DS";
	//description			= "";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	TEXT[2]				= NAME_Damage;
	COUNT[2]			= damageTotal;
	TEXT[3] 			= NAME_Str_needed;
	COUNT[3]			= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/****************************************************
**  			KdW-Botenamulett				   **
****************************************************/

instance  KdW_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	100;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	//on_equip		=	Equip_Schutzamulett_Nek;
	//on_unequip	=	UnEquip_Schutzamulett_Nek;

	description		= "Amulet kuriera Magów Wody";
	//TEXT[0]			= "";
	//TEXT[2]			= NAME_Prot_Edge;
	//COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

/****************************************************
**  	 SLY: LOST NEK (Neks Amulett)			   **
****************************************************/

instance  Neks_Amulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET|ITEM_MISSION;

	value 			=	50;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Nek;
	on_unequip		=	UnEquip_Schutzamulett_Nek;

	description		= "Amulet martwego stra¿nika"; //Nek's Amulett
	TEXT[1]			= "Wyryto na nim litery NEK.";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzamulett_Nek()
{
	self.protection [PROT_EDGE] += 5;
	self.protection [PROT_BLUNT] += 5;
};

FUNC VOID UnEquip_Schutzamulett_Nek()
{
	self.protection [PROT_EDGE] -= 5;
	self.protection [PROT_BLUNT] -= 5;
};

/*************************************************
**	Missionsitems für Mis_1_Psi_RecruitBuddler  **
*************************************************/
INSTANCE RecruitJoint(C_Item)
{	
	name 					=	"Bagienne ziele dla kopaczy";
	
	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MULTI;	

	//hp 				 		=	10;
	////hp_max 					=	10;
//	weight 					=	1;
	value 					=	1;

	visual 					=	"ItMiJoint.3ds";
	material 				=	MAT_WOOD;

	scemeName				=	"JOINT";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/**************************************************
**    Missionsitems für Mis_3_Psi_BringMedicine  **
**************************************************/

INSTANCE HealthWater(C_Item)
{
	name 					=	"Napój uzdrawiaj¹cy dla Y'Beriona";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	////hp 					=	1;
	////hp_max 				=	1;
	//weight 				=	1;
	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseAlcohol;
	//scemeName				=	"POTION";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/************************************************
**    Missionsitems für Mis_1_OC_BringList     **
************************************************/
INSTANCE TheList(C_Item)
{	
	name 					=	"Lista";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	//hp 						=	5;
	//hp_max 					=	5;
//	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheList;
	description				=	name;

	TEXT[0]					=	"Ian, szef Starej Kopalni spisa³";
	TEXT[1]					=	"tutaj swoje zamówienia.";
};
func void UseTheList ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Lista zamówieñ"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "20 bochnów chleba - tylko bez pleœni, jeœli ³aska!"					);
					Doc_PrintLine	( nDocID,  0, "25-30 jab³ek"	);
					Doc_PrintLine	( nDocID,  0, "10 kawa³ków sera"					);
					Doc_PrintLine	( nDocID,  0, "1 chochla"					);
					Doc_PrintLine	( nDocID,  0, "1 szczotka"					);
					Doc_PrintLine	( nDocID,  0, "5 kilofów + 3 m³otki"					);
					Doc_PrintLines	( nDocID,  0, "I uczciw¹ porcjê ziela - no wiecie, pierwsza dostawa w tym miesi¹cu! "					);
					Doc_PrintLine	( nDocID,  0, "Spodziewamy siê dostawy najpóŸniej pojutrze."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "IAN"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
};

INSTANCE TheListNC(C_Item)
{	
	name 					=	"Lista (poszerzona)";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;	

	//hp 						=	5;
	//hp_max 					=	5;
//	weight 					=	1;

	visual 					=	"ItWr_Scroll_01.3ds";
	material 				=	MAT_LEATHER;
	
	scemeName				=	"MAP";	
	on_state[0]				=	UseTheListNC;
	description				=	name;

	TEXT[0]					=	"Ian, szef Starej Kopalni spisa³";
	TEXT[1]					=	"tutaj swoje zamówienia.";
	TEXT[2]					=	"(Lares doda³ kilka rzeczy. Trzeba przyznaæ,";
	TEXT[3]					=	"¿e fa³szerstwo jest nie do wykrycia!)";
};
func void UseTheListNC ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					
					Doc_PrintLine	( nDocID,  0, "Lista zamówieñ"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "20 bochnów chleba - tylko bez pleœni, jeœli ³aska!"					);
					Doc_PrintLine	( nDocID,  0, "25-30 jab³ek"	);
					Doc_PrintLine	( nDocID,  0, "10 kawa³ków sera"					);
					Doc_PrintLine	( nDocID,  0, "1 chochla"					);
					Doc_PrintLine	( nDocID,  0, "1 szczotka"					);
					Doc_PrintLine	( nDocID,  0, "5 kilofów + 3 m³otki"					);
					Doc_PrintLines	( nDocID,  0, "I uczciw¹ porcjê ziela - no wiecie, pierwsza dostawa w tym miesi¹cu! "					);
					Doc_PrintLine	( nDocID,  0, "Spodziewamy siê dostawy najpóŸniej pojutrze."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "IAN"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "W³aœnie mi siê przypomnia³o:"					);
					Doc_PrintLine	( nDocID,  0, "30 butelek piwa"					);
					Doc_PrintLine	( nDocID,  0, "5 butelek wina"					);
					Doc_PrintLine	( nDocID,  0, "25 sma¿onych udŸców œcierwojadów"					);
					Doc_PrintLine	( nDocID,  0, "z pó³ tuzina sztuk orê¿a"					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/*********************************************
**   Missionsitems für Lares Find Ring    **
*********************************************/

INSTANCE Lares_Ring(C_Item)
{	
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING || ITEM_MISSION ;	

	value 					=	50;
	
	visual 					=	"ItMi_Ring_01.3ds";
	
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Lares_Ring;
	on_unequip				=	UnEquip_Lares_Ring;
	description		= "Pierœcieñ Laresa";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= ""; 
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Lares_Ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH,3 );
};

FUNC VOID UnEquip_Lares_Ring()
{
	B_ChangeAttribute(self,ATR_STRENGTH,-3 );
};
/*********************************************
**   Missionsitems für Lares Get Potion   **
*********************************************/
INSTANCE  Heiltrank(C_Item)
{
	name 			        =	NAME_Trank;

	mainflag 				=	ITEM_KAT_POTIONS;
	flags 					=	ITEM_MULTI||ITEM_MISSION;

	value 					=	100;	

	visual 					=	"ItFo_Potion_Health_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseHeiltrank;
	scemeName				=	"POTION";
	description				= "Napój b³yskawicznego uzdrowienia";
	//TEXT[0]				= "";
	TEXT[2]					= NAME_Bonus_hp;
	COUNT[2]				= 30;
	//TEXT[3] 				= "";
	////COUNT[3]			= ;
	TEXT[5]					= NAME_Value; 
	COUNT[5]		= value;
};

FUNC VOID UseHeiltrank()
{
	B_ChangeAttribute	(self,ATR_HITPOINTS,30);
};

/*********************************************
**   Missionsitems für Mordrag    **
*********************************************/

INSTANCE SpecialWater(C_Item)
{
	name 					=	"Magiczna woda";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MISSION;

	value 					=	10;	

	//change_atr[0]				=	ATR_HITPOINTS;
	//change_value[0] 			=	5;

	visual 					=	"ItFoFlaskHealth.3ds";
	material 				=	MAT_GLAS;
	//on_state[0]				=	UseSpecialWater;
	scemeName				=	"POTION";

	description				= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/*********************************************
**   Missionsitems für Dexter / Kalom	    **
*********************************************/
INSTANCE KalomsRecipe(C_Item)
{
	name 					=	"Receptura Cor Kaloma";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= name;
	TEXT[0]					= "Przepis na napój uzdrawiaj¹cy.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	on_state[0]			= Use_KalomsRecipe;
};
// ----------------------------------
func VOID Use_KalomsRecipe()
{   
	var int nDocID;
	
	nDocID = 	Doc_Create		()			  ;								// DocManager 
				Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

				Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 		); 
				Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0		);
				
				//1.Seite

				Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
				Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
				Doc_PrintLine	( nDocID,  0, ""									);
				Doc_PrintLine	( nDocID,  0, "Lifrun ak Gharak."					); 		
				Doc_PrintLine	( nDocID,  0, ""									); 			
				Doc_PrintLines	( nDocID,  0, "Gharak Or Nach bin thu. Lifrun mar Orag chtah. Shrunk esp Horinth.");
				
				//2.Seite

				Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, ""					);					
				Doc_PrintLines	( nDocID,  1, "To zdaje siê mieæ sens, kiedy czytaæ to od koñca.");
				Doc_PrintLine	( nDocID,  1, ""					);	
				Doc_PrintLine	( nDocID,  1, "          - Kalom"	);	
				
				Doc_Show		( nDocID );
};


/*********************************************
** Missionsitems für Mis_1_PSI_DrugMonopol  **
*********************************************/
/*
INSTANCE SalmAmulett (C_Item)
{	
	name 					=	"Salms Amulett";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;	

	//hp 				 		=	1;
	//hp_max 					=	1;
	weight 					=	1;
	value 					=	1;
	
	visual 					=	"ItKeKey1.3ds"; //Dummie Objekt
	material 				=	MAT_METAL;

	//scemeName				=	"HORN";
};
*/


/*********************************************
**   Karte der Kolonie (ohne Orc-Gebiet)	**
*********************************************/

INSTANCE ItWrWorldmap(C_Item)
{	
	name 					=	"Mapa kolonii";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	50;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseWorldmap;

	description				= name;
	TEXT[0]					= "Niestety, brakuje sporego";
	TEXT[1]					= "obszaru na po³udniowym";
	TEXT[2]					= "zachodzie.";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseWorldmap()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
					Doc_SetLevel	( nDocID,	"WORLD.ZEN" );
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_World.tga", 	1	);  //  1 -> DO NOT SCALE 

/*  				Doc_SetFont 	( nDocID, 0, "font_15_book.TGA"		); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, 0, 120, 80, 10, 10, 	1	);  //  0 -> Textrahmen (von den Ränder des TGAs aus, links-oben,rechts-unten)
					Doc_PrintLine	( nDocID, 0, "Karte der"	);
					Doc_PrintLine	( nDocID, 0, "Kolonie"	);

// FIXME: mehrere Texte an verschiedenen Stellen für Location-Beschriftung funzen nicht.
 					Doc_SetFont 	( nDocID, 0, "font_10_book.TGA"			); 
					Doc_SetMargins	( nDocID, 0, 110, 300, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Neues Lager");

					Doc_SetMargins	( nDocID, 0, 350, 200, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Altes Lager");

					Doc_SetMargins	( nDocID, 0, 200, 420, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Dämonenbeschwörer");
					
					Doc_SetMargins	( nDocID, 0, 510, 340, 10, 10, 1	);
					Doc_PrintLine	( nDocID, 0, "Sekten-Lager");
*/
					Doc_Show		( nDocID 	);
};

/*********************************************
**   Karte Altes Lager						**
*********************************************/

INSTANCE ItWrOCmap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseOCmap;

	description				= "Plan Starego Obozu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

FUNC VOID UseOCmap()
{
	var int nDocID;
		
	nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_OldCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
};

/*********************************************
**   Karte Neues Lager						**
*********************************************/

INSTANCE ItWrNCmap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UseNCmap;

	description				= "Plan Nowego Obozu";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UseNCmap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_NewCamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   Karte PSI-Lager						**
*********************************************/

INSTANCE ItWrPSImap(C_Item)
{	
	name 					=	"Mapa";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	40;

	visual 					=	"ItWr_Map_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePSImap;

	description				= "Plan obozu na bagnie";
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePSImap()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PSICamp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/*********************************************
**   PinUp Zeichnung						**
*********************************************/

INSTANCE ItWrPinup(C_Item)
{	
	name 					=	"Szkic";
	
	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	ITEM_MISSION;

	value 					=	60;

	visual 					=	"ItWr_Scroll_01.3DS";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";	
	on_state[0]				=	UsePinUp;

	description				= name;
	TEXT[5]					= NAME_Value;
	COUNT[5]				= value;
};

	FUNC VOID UsePinUp()
	{
		var int nDocID;
		
		nDocID = 	Doc_CreateMap	()			  ;							// DocManager 
//					Doc_SetLevel	( nDocID,	"WORLD.ZEN" ); Kein Positionsanzeiger möglich!
					Doc_SetPages	( nDocID, 1 );                         
					Doc_SetPage 	( nDocID, 0, "Map_PinUp.tga", 	1	);  //  1 -> DO NOT SCALE 
					Doc_Show		( nDocID 	);
	};

/********************************************************************************/
INSTANCE ItWrDieVerurteilten (C_Item)
{	
	name 					=	"Skazañcy";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_MISSION;

	value 					=	100;

	visual 					=	"ItWrBook.3ds";
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description			= name;
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/********************************************************************************/
//				BRIEF AN FEUERMAGIER
/*********************************************************************************/
INSTANCE ItWr_Fire_Letter_01 (C_Item)
{	
	name 				=	"Zapieczêtowane pismo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_02.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter;
	scemeName			=	"MAPSEALED";
	description			= "List do Magów Ognia";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	TEXT[1]				= "Nie wolno z³amaæ pieczêci!";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
func void Usefireletter ()
{   
		
		CreateInvItem     (hero,ItWr_Fire_Letter_02);
		Snd_Play ("MAP_UNFOLD");
		
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Czcigodny Mistrzu,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list nape³ni³ nas wielkim smutkiem. Po rozwa¿eniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo sta³o siê powa¿nym zagro¿eniem dla ca³ej kolonii. Jego dzia³ania nara¿aj¹ na niebezpieczeñstwo nasze delikatne pertraktacje handlowe z Jego Wysokoœci¹, a tym samym - przysz³e losy ca³ego królestwa. Dlatego zalecamy wys³anie do obozu na bagnie grupy zwiadowców, którzy ustal¹ z jakiego¿ piekielnego Ÿród³a cz³onkowie Bractwa czerpi¹ sw¹ moc. Posiadaj¹c te informacje moglibyœmy po³¹czyæ nasze wysi³ki w celu rych³ego za¿egnania niebezpieczeñstwa. Nasi Bracia przeszukuj¹ obecnie prastare ksiêgi w poszukiwaniu choæby najmniejszego znaku, który móg³by naprowadziæ nas na w³aœciwy trop. O wynikach tych poszukiwañ poinformujemy zwyk³¹ drog¹."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niech Innos ma w opiece nas wszystkich."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
					//Doc_PrintLine	( nDocID,  0, "Rigaldo Marschall des Königs"					);
					Doc_Show		( nDocID );
		
		
	};
/********************************************************************************/
INSTANCE ItWr_Fire_Letter_02 (C_Item)
{	
	name 				=	"Otwarty list";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseFireletter2;
	scemeName			=	"MAP";
	description			= "List do Magów Ognia";
	//TEXT[0]				= "";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
	
};
func void Usefireletter2 ()
{   
		var int nDocID;
		
		nDocID = 	Doc_Create		()			  ;								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
					Doc_SetFont 	( nDocID, -1, "font_10_book.tga"	   			); 	// -1 -> all pages 
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, " "					);
					Doc_PrintLine	( nDocID,  0, "Czcigodny Mistrzu Xardasie,"					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetFont 	( nDocID, -1, "font_10_book.TGA"	   			); 	// -1 -> all pages 
					Doc_PrintLines	( nDocID,  0, "Twój ostatni list nape³ni³ nas wielkim smutkiem. Po rozwa¿eniu sprawy, niniejszym przedstawiamy nasze stanowisko w tej sprawie: Bractwo sta³o siê powa¿nym zagro¿eniem dla ca³ej kolonii. Jego dzia³ania nara¿aj¹ na niebezpieczeñstwo nasze delikatne pertraktacje handlowe z Jego Wysokoœci¹, a tym samym - przysz³e losy ca³ego królestwa. Dlatego zalecamy wys³anie do obozu na bagnie grupy zwiadowców, którzy ustal¹ z jakiego¿ piekielnego Ÿród³a cz³onkowie Bractwa czerpi¹ sw¹ moc. Powstrzymanie Sekty Œni¹cego ma znaczenie priorytetowe! Natychmiast po otrzymaniu twojej odpowiedzi, poinformujemy kap³anów Innosa o twoich odkryciach. Nasi uczeni przeszukuj¹ obecnie prastare ksiêgi w poszukiwaniu choæby najmniejszego znaku, który móg³by naprowadziæ nas na w³aœciwy trop. O wynikach tych poszukiwañ poinformujemy zwyk³¹ drog¹."	);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Niech Innos ma w opiece nas wszystkich."					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLine	( nDocID,  0, "            Rigaldo, Marschall des Königs");
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_SetMargins	( nDocID, -1, 200, 50, 50, 50, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus
				
					Doc_Show		( nDocID );
		
};

/********************************************************************************/
//SCHLÜSSEL 
/*********************************************************************************/
//GOMEZ SCHLÜSSEL
INSTANCE ItKe_Gomez_01(C_Item)
{	
	name 					=	"Klucz Gomeza";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_04.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie Gomeza.";
	////COUNT[0]			= ;
	TEXT[1]				= "Otwiera sk³adowisko w piwnicy magnatów.";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/*********************************************************************************/
//RICELORDS SCHLÜSSEL
INSTANCE ItKey_RB_01(C_Item)
{	
	name 				=	"Klucz Ry¿owego Ksiêcia";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			=	name;
	TEXT[0]				=	"Otwiera skrzynie Ry¿owego Ksiêcia.";
};
/*********************************************************************************/
//SCHMIEDESCHLÜSSEL ERZBARONE
INSTANCE ItKe_OB_Smith_01(C_Item)
{	
	name 					=	"¯elazny klucz";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_02.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera drzwi w kuŸni.";
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};
/*********************************************************************************/
// 
INSTANCE ItKe_Storage_01(C_Item)
{	
	name 					=	"Klucz do sk³adowiska";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	0;	

	value 					=	0;

	visual 					=	"ItKe_Key_03.3ds";
	material 				=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera g³ówne drzwi do sk³adowiska ";
	////COUNT[0]			= ;
	TEXT[1]				= "w piwnicy magnatów.";
	////COUNT[1]			= ;
	//TEXT[2]				= "";
	//COUNT[2]			= ;
	//TEXT[3] 			= "";
	//COUNT[3]			= ;
	//TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

/********************************************************/
//			SCHLÜSSEL IN DER ALTEN MINE
/********************************************************/

/********************************************************/
INSTANCE ItKe_OM_01(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Santino.";
	TEXT[1]				= "Wy¿sze miejsce wymiany.";
	TEXT[2]				= "Stara Kopalnia";
};
/********************************************************/
INSTANCE ItKe_OM_02(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "otwiera skrzyniê Aarona ";
	TEXT[1]				= "w Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_03(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_03.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Otwiera skrzynie w sk³adowisku";
	TEXT[1]             = "Starej Kopalni.";
};

/********************************************************/
INSTANCE ItKe_OM_04(C_Item)
{	
	name 				=	"Klucz do skrzyni";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;	

	value 				=	0;

	visual 				=	"ItKe_Key_04.3ds";
	material 			=	MAT_METAL;
	description			= name;
	TEXT[0]				= "Magazyn Alberto.";
	TEXT[1]				= "Ni¿sze miejsce wymiany.";
};

/********************************GESCHENK VON IAN *********************************************/
INSTANCE ItFo_OM_Beer_01(C_Item)
{
	name 					=	"Mocne piwo";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;
	
	value 					=	30;	

	visual 					=	"ItFo_Beer_01.3ds";
	material 				=	MAT_GLAS;
	on_state[0]				=	UseStarkBeer;
	scemeName				=	"POTION";
	description			= name;
	TEXT[0]				= NAME_Bonus_hp;
	////COUNT[0]			= ;
	//TEXT[1]				= "";
	////COUNT[1]			= ;
	//TEXT[2]				= "Bonus";
	COUNT[0]			= 6;
	TEXT[3] 			= "";
	//COUNT[3]			= ;
	TEXT[4]				= ""; 
	////COUNT[4]			= ;
	TEXT[5]				= NAME_Value;
	COUNT[5]			= value;
};

FUNC VOID UseStarkBeer()
{
	B_ChangeAttribute	(self,ATR_HITPOINTS,6);
};

INSTANCE Snaf_Scoop (C_Item)
{
	name 				=	"Warzecha Snafa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_MobsiItem;

	visual 				=	"ItMi_Scoop_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_MobsiItem;
};
															