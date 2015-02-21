// ************************************************************************************************
// Wert von Tiertrophäen
// ************************************************************************************************

// FIXME: welche Trophäe wann freigeschaltet? Wert tunen!
const int	Value_Zähne				=	10;
const int	Value_Krallen			=	15;

const int	Value_Wolfsfell			=	10;
const int	Value_Orkhundfell		=	15;

const int	Value_Panzerplatte		=	50;
const int	Value_Crawlerzangen		=	10;

const int	Value_Shadowbeastfell	=	100;

const int	Value_Lurkerklaue		=	15;
const int	Value_Lurkerhaut		=	25;

const int	Value_Sumpfhaihaut		=	200;

const int	Value_Trollfell			=	300;

// Bloodfly
const int	Value_Flügel			=	15;
const int	Value_Stachel			=	25;

// Durch Ulu-Mulu freigeschaltet
// bei Auftragsvergabe werden je 3 neue Monster gespawnt
const int	Value_Feuerzunge		=	500;
const int	Value_Sumpfhaizähne		=	500;
const int	Value_Shadowbeasthorn	=	500;
const int	Value_Trollhauer		=	500;

// Golems beim Dämonenbeschwörer
const int	Value_Steinherz			=	1000;
const int	Value_Feuerherz			=	1000;
const int	Value_Eisherz			=	1000;
const int	Value_Eistueck			=	100;


/*
So in der Tasche
----------------
ItAt_Meatbug_01 	//Meatbug			Körper (Essen)		(Item-Instanz in Food.d)
ItFoMuttonRaw		//Scavenger			2 Bollen			OK
					//Molerats			2 Bollen			OK
					//Shadowbeast		4 Bollen			OK
ItAt_WatMRat		//Molerats			1 Bollen			OK
ItAt_ScaFeather		//Scavenger			10 Flügel			OK
ItAt_HarFeather		//Harpie			20 Flügel			OK
ItAt_OrcSha_Plume	//OrcShaman			1 Flügel			OK
ItAt_Bloodfly_01 	//Bloodfly			2 Flügel			OK

Durch Jäger freigeschaltet (noch nicht verteilt)
--------------------------
ItAt_WolfTeeth 		//Wolf				2 Zähne				OK
ItAt_WolfTeeth		//Schwarzer Wolf	2 Zähne				OK
ItAt_SnapperTeeth	//Snapper			5 Zähne				OK
ItAt_BiterTeeth		//Orcbiter			2 Zähne				OK
ItAt_ShadTeeth		//Shadowbeast		4 Zähne				OK
ItAt_BloodHoTeeth	//Bloodhound		4 Zähne				OK
ItAt_RazorTeeth		//Razor				5 Zähne				OK
ItAt_WaranTeeth		//Waran				3 Zähne				OK
ItAt_FireWaranTeeth	//FireWaran			5 Zähne				OK
ItAt_OrcTeeth		//OrcScout			2 Zähne				OK
ItAt_OrcTeeth		//OrcShaman			2 Zähne				OK
ItAt_OrcTeeth		//OrcSlave			2 Zähne				OK
ItAt_OrcTeeth		//OrcWarrior		2 Zähne				OK
--------------------------------------------------------------
ItAt_WaranClaws		//Waran				4 Klauen			OK
ItAt_SnapperClaws	//Snapper			3 Klauen			OK
ItAt_RazorClaws		//Razor				3 Klauen			OK
ItAt_LurkerClaws 	//Lurker 			2 Klauen			OK
//--------------------------------------------------------------
ItAt_WolfSkin 		//Wolf	 			Wolfsfell			OK
ItAt_WolfSkin2 		//Orkhund	 		Orkhundfell			OK
ItAt_ShadowSkin 	//Shadowbeast		Shadowbeast-Fell	OK
ItAt_TrollSkin 		//Troll				Trollfell			OK
ItAt_YoTroSkin		//Youngtroll		Trollfell			OK
//--------------------------------------------------------------
ItAt_SwampsharkSkin	//Sumpfhai			Haut des Sumpfhais	OK
ItAt_LurkerSkin 	//Lurker			Haut des Lurkers	OK
ItAt_SnapperSkin	//Snapper			Haut des Snappers	OK
ItAt_RazorSkin		//Razor				Haut des Razors		OK
ItAt_WaranSkin		//Waran				Haut des Warans		OK
ItAt_FireWSkin		//Feuerechse		Haut des Feuerechse	OK
ItAt_BiterSkin		//Orcbiter			Haut des Orcbiters	OK
ItAt_RazorSkin		//Razor				Haut des Razors		OK
ItAt_DirkSkin		//Razor				Haut des Razors		OK
Durch Templer / Kalom freigeschaltet (noch nicht verteilt)
------------------------------------
ItAt_Crawler_01 	//Crawler		 	Zangen				OK
ItAt_Bloodfly_02 	//Bloodfly			Stachel				OK

Durch ORG_855_Wolf freigeschaltet
------------------------
ItAt_Crawler_02 	//Crawler			Panzerplatten		OK

Durch Ulu-Mulu freigeschaltet
-----------------------------
ItAt_WaranTongue 	//Feuerechse		Flammenzunge		OK
ItAt_SwampshTeeth	//Sumpfhai			Zähne des Sumpfhais	OK
ItAt_Shadow_02 		//Shadowbeast		Horn				OK
ItAt_TrollTeeth 	//Troll				Hauer				OK
ItAt_YoTroTeeth		//Youngtroll		Hauer				OK
*/



//*******************************/
//                               /
//     MONSTER TEETH             /
//                               /
//*******************************/



/******************************************************************************************/
PROTOTYPE	ItAt_Teeth_01	(C_Item)
{
	name 				=	"K³y";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Zähne;

	visual 				=	"ItAt_Teeth.3DS";
	material 			=	MAT_LEATHER;

	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value_Zähne;
};

INSTANCE	ItAt_WolfTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y wilka";
	
	value				=	14;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_SnapperTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y zêbacza";
	
	value				=	27;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_RazorTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y brzytwy";
	
	value				=	33;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_BloodHoTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y ogara";
	
	value				=	27;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_WaranTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y jaszczura";
	
	value				=	13;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_FireWaranTeeth		(ItAt_Teeth_01)
{
	name				=	"K³y ognistego jaszczura";
	
	value				=	55;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_LurkerTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y topielca";
	
	value				=	22;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_ShadTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y cieniostwora";
	
	value				=	45;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_OrcDogTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y orkowego psa";
	
	value				=	17;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_BiterTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y k¹sacza";
	
	value				=	17;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

INSTANCE	ItAt_DirkTeeth	(ItAt_Teeth_01)
{
	name				=	"K³y sztyletnika";
	
	value				=	55;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};
INSTANCE	ItAt_AligatTeeth (ItAt_Teeth_01)
{
	name				=	"K³y aligatora";
	
	value				=	30;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};

/******************************************************************************************/
PROTOTYPE	ItAt_Troll_02	(C_Item)
{
	name 				=	"Kie³ trolla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollhauer;

	visual 				=	"ItAt_Troll_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollhauer;
};

INSTANCE	ItAt_TrollTeeth	(ItAt_Troll_02)
{
	name				=	"Kie³ trolla";
	
	value				=	205;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_KingTroTeeth	(ItAt_Troll_02)
{
	name				=	"Kie³ królewskiego trolla";
	
	value				=	505;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_BlackTroTeeth	(ItAt_Troll_02)
{
	name				=	"Kie³ czarnego trolla";
	
	value				=	325;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_YoTroTeeth	(ItAt_Troll_02)
{
	name				=	"Kie³ m³odego trolla";
	
	value				=	105;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_OrcTeeth (ItAt_Troll_02)
{
	name				=	"Orkowy kie³";
	
	value				=	40;
	visual 				=	"ItAt_OrcTeeth.3ds";	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE	ItAt_SwampshTeeth	(C_Item)
{
	name 				=	"K³y b³otnego wê¿a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	55;

	visual 				=	"ItAt_Swampshark_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER BONE's            /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE	ItAt_Kosc	(C_Item)
{
	name				=	"Koœæ szkieletu";
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value				=	40;
	
	visual 				=	"ITAT_SKELETONBONE.3DS";
	material 			=	MAT_WOOD;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE	ItAt_GobKosc	(C_Item)
{
	name				=	"Koœæ goblina";
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value				=	30;
	
	visual 				=	"ITAT_GOBLINBONE.3DS";
	material 			=	MAT_WOOD;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     LIVER FUR	             /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE	ItAt_WatMRat (C_Item)
{
	name				=	"W¹troba kretoszczura";
	
	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;
	
	value				=	10;
	
	visual 				=	"ItAt_Molerat_01.3DS";
	material 			=	MAT_LEATHER;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER CLAWS             /
//                               /
//*******************************/

/******************************************************************************************/
PROTOTYPE	ItAt_Claws_01	(C_Item)
{
	name 				=	"Pazury";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Krallen;

	visual 				=	"ItAt_Claws_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Krallen;
};

INSTANCE	ItAt_WolfClaws	(ItAt_Claws_01)
{
	name				=	"Pazury wilka";
	
	value				=	19;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_SnapperClaws	(ItAt_Claws_01)
{
	name				=	"Pazury zêbacza";
	
	value				=	32;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_RazorClaws	(ItAt_Claws_01)
{
	name				=	"Pazury brzytwy";
	
	value				=	38;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_BloodHoundClaws	(ItAt_Claws_01)
{
	name				=	"Pazury ogara";
	
	value				=	32;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_WaranClaws	(ItAt_Claws_01)
{
	name				=	"Pazury jaszczura";
	
	value				=	18;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_FireWaranClaws	(ItAt_Claws_01)
{
	name				=	"Pazury ognistego jaszczura";
	
	value				=	60;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_DirkClaws	(ItAt_Claws_01)
{
	name				=	"Pazury sztyletnika";
	
	value				=	60;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_ShadClaws	(ItAt_Claws_01)
{
	name				=	"Pazury cieniostwora";
	
	value				=	50;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_OrcDogClaws	(ItAt_Claws_01)
{
	name				=	"Pazury orkowego psa";
	
	value				=	22;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_BiterClaws	(ItAt_Claws_01)
{
	name				=	"Pazury k¹sacza";
	
	value				=	22;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_AligatClaws (ItAt_Claws_01)
{
	name				=	"Pazury aligatora";
	
	value				=	25;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
	
/******************************************************************************************/
INSTANCE ItAt_LurkerClaws (C_Item)
{
	name 				=	"Pazury topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	27;

	visual 				=	"ItAt_Lurker_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER FUR	             /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_WolfSkin (C_Item)
{
	name 				=	"Futro wilka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItAt_Wolf_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAt_BlackWolfSkin (C_Item)
{
	name 				=	"Futro czarnego wilka";
	
	value 				=	62; // nie znam balansu a wiec cene dostosujcie
	
	visual 				=	"ItAt_Wolf_01.3DS";
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WolfSkin2 (C_Item)
{
	name 				=	"Futro orkowego psa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	64;

	visual 				=	"ItAt_Wolf_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_ShadowSkin (C_Item)
{
	name 				=	"Futro cieniostwora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual 				=	"ItAt_Shadowbeast_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_BloodhoundSkin (C_Item)
{
	name 				=	"Futro ogara";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual 				=	"ItAt_Shadowbeast_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
PROTOTYPE	ItAt_Troll_01	(C_Item)
{
	name 				=	"Futro trolla";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Trollfell;

	visual 				=	"ItAt_Troll_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Trollfell;
};

INSTANCE	ItAt_TrollSkin	(ItAt_Troll_01)
{
	name				=	"Futro trolla";
	
	value				=	440;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_KingTroSkin	(ItAt_Troll_01)
{
	name				=	"Futro królewskiego trolla";
	
	value				=	1040;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
 INSTANCE	ItAt_BlackTroSkin	(ItAt_Troll_01)
 {
 	name				=	"Futro czarnego trolla";
	
	value				=	650;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_YoTroSkin	(ItAt_Troll_01)
{
	name				=	"Futro m³odego trolla";
	
	value				=	210;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER SKINS             /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_LurkerSkin (C_Item)
{
	name 				=	"Skóra topielca";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	74;

	visual 				=	"ItAt_Lurker_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
PROTOTYPE	ItAt_SSH_Skin_01	(C_Item)
{
	name 				=	"Skóra b³otnego wê¿a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sumpfhaizähne;

	visual 				=	"ItAt_Swampshark_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Sumpfhaizähne;
};

INSTANCE ItAt_SwampsharkSkin (ItAt_SSH_Skin_01)
{
	name 				=	"Skóra b³otnego wê¿a";

	value 				=	140;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_SnapperSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra zêbacza";
	
	value				=	84;
	visual 				=	"ItAt_Snapper.3DS";	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_RazorSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra brzytwy";
	
	value				=	96;
	visual 				=	"ItAt_Razor.3DS";	
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_DirkSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra sztyletnika";
	
	value				=	140;
	visual 				=	"ItAt_Dirk.3DS";	
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_WaranSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra jaszczura";
	
	value				=	56;
	visual 				=	"ItAt_WaranSkin.3DS";		
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_FireWSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra ognistego jaszczura";
	visual 				=	"ItAt_FireWaranSkin.3DS";		
	
	value				=	140;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_BiterSkin (ItAt_SSH_Skin_01)
{
	name				=	"Skóra k¹sacza";
	
	value				=	64;
	visual 				=	"ItAt_Bitter.3DS";		
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_AligatSkin (ItAt_SSH_Skin_01)
{
	name				= 	"Skóra aligatora";
	
	value				=	90;
	visual 				=	"ItAt_Aligator.3DS";		
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER TOUNGE            /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_WaranTongue (C_Item)
{
	name 				=	"Jêzyk jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	15;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_FWaranTongue (C_Item)
{
	name 				=	"Jêzyk ognistego jaszczura";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAt_DraconianTongue (C_Item)
{
	name 				=	"Jêzyk jaszczurocz³eka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAt_DemonTongue (C_Item)
{
	name 				=	"Jêzyk demona";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE ItAt_DemonLordTongue (C_Item)
{
	name 				=	"Jêzyk ksiêcia demonów";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	300;

	visual 				=	"ItAt_Waran_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
//*******************************/
//                               /
//     MONSTER ARMOR PLATE       /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_CrawlerPlate(C_Item)
{
	name 				=	"P³ytka pancerza pe³zacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	42;

	visual 				=	"ItAt_Crawler_02.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER MANDIBLES         /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_Crawler_01 (C_Item)
{
	name 				=	"Wnêtrznoœci pe³zacza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItAt_Crawler_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Crawlerzangen;
};

//*******************************/
//                               /
//     MONSTER HORN	             /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_Shadow_02 (C_Item)
{
	name 				=	"Róg cieniostwora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_Shadowbeast_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_DS_Horn (C_Item)
{
	name 				=	"Róg sztyletnika";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	125;

	visual 				=	"ItAt_Shadowbeast_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER WINGS             /
//                               /
//*******************************/

/******************************************************************************************/
PROTOTYPE	ItAt_Bloodfly_01 (C_Item)
{
	name 				=	"Skrzyd³a";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Flügel;

	visual 				=	"ItAt_Bloodfly_01.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Flügel;
};

INSTANCE	ItAt_BloodflyWings	(ItAt_Bloodfly_01)
{
	name				=	"Skrzyd³a krwiopijcy";
	
	value				=	17;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER FEATHERS          /
//                               /
//*******************************/

INSTANCE	ItAt_ScaFeather	(ItAt_Bloodfly_01)
{
	name				=	"Pióro œcierwojada";
	
	value				=	1;
	visual 				=	"ItAt_Scavenger.3DS";	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_HarFeather	(ItAt_Bloodfly_01)
{
	name				=	"Pióro harpii";
	
	value				=	2;
	visual 				=	"ItAt_Harpie.3DS";		
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_OrcSha_Plume	(ItAt_Bloodfly_01)
{
	name				=	"Pióropusz szamana";
	
	value				=	50;
	visual 				=	"ItAt_Shaman.3DS";		
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

//*******************************/
//                               /
//     MONSTER STING             /
//                               /
//*******************************/

INSTANCE ItAt_Bloodfly_02 (C_Item)
{
	name 				=	"¯¹d³o krwiopijcy";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Stachel;

	visual 				=	"ItAt_Bloodfly_02.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Stachel;
};

//*******************************/
//                               /
//     MONSTER WTFLOL            /
//                               /
//*******************************/

INSTANCE ItAt_WTF (C_Item)
{
	name 				=	"Jelita cieniostwora";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ITRM_WTF.3DS";
	material 			=	MAT_LEATHER;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Stachel;
};

//*******************************/
//                               /
//     MONSTER HEART	         /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_StoneGolem_01 (C_Item)
{
	name 				=	"Serce kamiennego golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_WINDFIST;

	value 				=	Value_Steinherz;

	visual 				=	"ItAt_StoneGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz¹tków";
	TEXT[1]				= "pokonanego kamiennego golema.";
	TEXT[2]				= "Jego magiczna moc pozwala"; 
	TEXT[3]				= "wyrzuciæ przeciwnika w powietrze.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steinherz;
};

/******************************************************************************************/
INSTANCE ItAt_FireGolem_01 (C_Item)
{
	name 				=	"Serce ognistego golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	Value_Feuerherz;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz¹tków";
	TEXT[1]				= "pokonanego ognistego golema.";
	TEXT[2]				= "Jego magiczna moc pozwala";
	TEXT[3]				= "podpaliæ przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolem_01 (C_Item)
{
	name 				=	"Serce lodowego golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_ICECUBE;

	value 				=	Value_Eisherz;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "To serce pochodzi ze szcz¹tków";
	TEXT[1]				= "pokonanego lodowego golema.";
	TEXT[2]				= "Jego magiczna moc pozwala";
	TEXT[3]				= "zamroziæ przeciwnika.";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eisherz;
};

/******************************************************************************************/
INSTANCE ItAt_DemonHeart (C_Item)
{
	name 				=	"Serce demona";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	500;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;

	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};
/******************************************************************************************/
INSTANCE ItAt_DemonLordHeart (C_Item)
{
	name 				=	"Serce ksiêcia demonów";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;
	spell				= 	SPL_FIREBALL;

	value 				=	1000;

	visual 				=	"ItAt_FireGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;

	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Feuerherz;
};

//*******************************/
//                               /
//     MONSTER FRAGMENT          /
//                               /
//*******************************/

/******************************************************************************************/
INSTANCE ItAt_IceGolem_02 (C_Item)
{
	name 				=	"Fragment lodowego golema";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_THUNDERBOLT;

	value 				=	Value_Eistueck;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	500;

	visual 				=	"ItAt_IceGolem_01.3DS";
	material 			=	MAT_STONE;

	description			= name;
	TEXT[0]				= "Ten fragment pochodzi ze szcz¹tków";
	TEXT[1]				= "pokonanego lodowego golema.";
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Eistueck;
};
//---Missions---
INSTANCE	ItAt_BossAlgSkin (ItAt_SSH_Skin_01)
{
	name				= 	"Skóra matki aligatorów";
	
	value				=	200;
	visual 				=	"ItAt_Aligator.3DS";		
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

INSTANCE	ItAt_BossAlgClaws (ItAt_Claws_01)
{
	name				=	"Pazury matki aligatorów";
	flags               =   ITEM_MULTI|ITEM_MISSION;//dodane zeby przedmiot lub zabita matka(jezeli bedzie mia³a przedmiot)nie znika³ budzis
	value				=	60;
	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE	ItAt_BossAlgTeeth (ItAt_Teeth_01)
{
	name				=	"K³y matki aligatorów";
	
	value				=	50;
	
	description			=	name;
	TEXT[4]				=	NAME_Value;					COUNT[4]	= Value;
};