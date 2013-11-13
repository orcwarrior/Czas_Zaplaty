const int NO_RuneSword = 128;
INSTANCE ItArArifact_01 (C_Item)
{
	name 				=	"Ornament";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	10;

	visual				=	"ItAr_Artifact_03.3ds";
	material			=	MAT_STONE;


	TEXT	[0]			= 	"Dziwnie wygl¹daj¹cy przedmiot,";
   TEXT	[1]			= 	"napewno gdzieœ jest coœ,";
   TEXT	[2]			= 	"co mo¿na tym otworzyæ...";
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
INSTANCE ItArArifact_02 (C_Item)
{
	name 				=	"Artefakt";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Artifact_02.3ds";
	material			=	MAT_STONE;


	//description			= 	"Wygl¹da jakby by³ pozbawiony mocy...";
	TEXT	[0]			=	"Wygl¹da jakby by³ pozbawiony mocy...";
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************
**  	Feuermagier  (Runensteine  und Scrolls)											  **
*******************************************************************************************/
INSTANCE ItArRuneMFireball (C_Item)
{
	name 				=	"Runa Miltena";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1900;

	visual				=	"ItAr_Rune_26.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MFIREBALL;
	mag_circle 			=	1;
	range				= NO_RuneSword; //Means can't be used in RuneSword

	description			= 	"Kula ognia";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIREBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIREBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************/
// Light (Scrolls und Runen)
/*******************************************************************************************/

INSTANCE ItArRuneLight (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	300;

	visual				=	"ItAr_Rune_42.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;
	mag_circle 			= 	1;

	description			=	"Œwiat³o";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_LIGHT;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};
/*******************************************************************************************/

INSTANCE ItArScrollLight (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	25;//light special threatment

	visual				=	"ItAr_Scroll_32.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;

	description			=	"Œwiat³o";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	1;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};
/*******************************************************************************************/
// Light (Scrolls und Runen)
/*******************************************************************************************/

INSTANCE ItArRuneHolyFire (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;//4*300

	visual				=	"ItAr_Rune_49.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_HolyFire;
	mag_circle 			= 	4;

	description			=	"Œwiêty ogieñ";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_HOLYFIRE;
	TEXT	[2]			=	NAME_Dam_Magic;			COUNT	[2]		=	SPL_DAMAGE_HOLYFIRE;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};
/*******************************************************************************************/

INSTANCE ItArScrollHolyFire(C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;//4*40

	visual				=	"ItAr_Scroll_43.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_HolyFire;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Œwiêty ogieñ";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Magic;			COUNT	[2]		=	SPL_DAMAGE_HOLYFIRE;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Stuning Ball (Scrolls und Runen)
/*******************************************************************************************/

INSTANCE ItArRuneStuningBall (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;//2*300

	visual				=	"ItAr_Rune_53.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_StuningBall;
	mag_circle 			= 	2;

	description			=	"Og³uszaj¹ca kula";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_STUNINGBALL;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollStuningBall (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual				=	"ItAr_Scroll_46.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_StuningBall;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Og³uszaj¹ca kula";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};
/*******************************************************************************************/
// Curse (Scrolls und Runen)
/*******************************************************************************************/

INSTANCE ItArRuneCurse (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_52.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_WEAKNESS;
	mag_circle 			= 	3;

	description			=	"Kl¹twa";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_WEAKNESS;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollCurse (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;//30*mag_circle

	visual				=	"ItAr_Scroll_49.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_WEAKNESS;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Kl¹twa";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	//TEXT	[2]			=	"";						COUNT	[2]		=	;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};
/*******************************************************************************************/
// 

INSTANCE ItArRuneLifeDrain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_54.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LifeDrain;
	mag_circle 			=	3;

	description			=	"Wyssanie ¿ycia";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
 	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	5;
 	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	cond_value[2];
// 	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
 	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollLifeDrain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_23.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_LifeDrain;

	description			=	"Wyssanie ¿ycia";
 	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	5;
 	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_SENDCAST_SCROLL;
// 	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
 	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};


/*******************************************************************************************/
// Firebolt alias MagicMissile (Scrolls und Runen)

INSTANCE ItArRuneFirebolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	300;

	visual				=	"ItAr_Rune_23.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	mag_circle 			=	1;

	description			=	"Ognisty pocisk";
	TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_FIREBOLT;
	TEXT	[2]			=	NAME_Dam_Fire;			COUNT	[2]		=	SPL_DAMAGE_FIREBOLT;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

INSTANCE ItArScrollFirebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual				=	"ItAr_Scroll_35.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Ognisty pocisk";
	//TEXT	[0]			=	NAME_Mag_Circle;		COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Fire;			COUNT	[2]		=	SPL_DAMAGE_FIREBOLT;
	//TEXT	[3] 		=	"";						COUNT	[3]		=	;
	//TEXT	[4]			=	"";						COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;				COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Fireball (Scrolls und Runen)

INSTANCE ItArRuneFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_26.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBALL;
	mag_circle 			=	3;
		
	description			= 	"Kula ognia";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIREBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIREBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_27.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBALL;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Kula ognia";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIREBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************/
// FireWall (Scrolls und Runen)

INSTANCE ItArRuneFireWall (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;

	visual				=	"ItAr_Rune_51.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FireWall;
	mag_circle 			=	4;
		
	description			= 	"Chaotyczny pocisk";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FireWall;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FireWall;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollFireWall (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_48.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FireWall;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Chaotyczny pocisk";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FireWall;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************/
// Firestorm (Scrolls und Runen)

INSTANCE ItArRuneFirestorm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;

	visual				=	"ItAr_Rune_24.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	mag_circle 			=	4;

	description			= 	"Ognista burza";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_FIRESTORM;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIRESTORM;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollFirestorm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_28.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Ognista burza";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fire,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_FIRESTORM;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************/
// Meteor (Scrolls und Runen)

INSTANCE ItArRuneMeteor (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1800;

	visual				=	"ItAr_Rune_50.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_Meteor;
	mag_circle 			= 	6;

	description			=	"Meteor";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_Meteor;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_METEOR*2;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollMeteor (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	180;

	visual				=	"ItAr_Scroll_42.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Meteor;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Meteor";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_METEOR*2;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
/*******************************************************************************************/
// FireRain (Scrolls und Runen)

INSTANCE ItArRuneFireRain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1300;

	visual				=	"ItAr_Rune_25.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	mag_circle 			= 	6;

	description			=	"Deszcz ognia";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FIRERAIN;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_FIRERAIN;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollFireRain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	130;

	visual				=	"ItAr_Scroll_36.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Deszcz ognia";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_FIRERAIN;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Teleport1 (Scrolls und Runen)

INSTANCE ItArRuneTeleport1 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_38.3ds";	//rote Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT1;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			= 	"Teleportacja do Magów Ognia";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport1 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_37.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT1;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Teleportacja do Magów Ognia";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
};

/*******************************************************************************************/
// Teleport2 (Scrolls und Runen)

INSTANCE ItArRuneTeleport2 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_40.3ds"; //blaue Rune
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORT2;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			= 	"Teleportacja do Magów Wody";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport2 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_37.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT2;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Teleportacja do Magów Wody";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
};

/*******************************************************************************************/
// Teleport3 (Scrolls und Runen)

INSTANCE ItArRuneTeleport3 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_41.3ds"; //lila Rune
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORT3;
	//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportacja do nekromanty";	//blaue Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport3 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_37.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT3;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Teleportacja do nekromanty";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
};


/*******************************************************************************************/
// Teleport4 (nur Scrolls)

INSTANCE ItArScrollTeleport4 (C_Item)
{
	name 				= NAME_Spruchrolle;

	mainflag 			= ITEM_KAT_RUNE;
	flags 				= ITEM_MULTI;

	visual				= "ItAr_Scroll_37.3DS";	//lila Punkt + gelber Punkt
	material			= MAT_STONE;

	spell				=	SPL_TELEPORT4;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			= 	"Orkowe zaklêcie teleportacji";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	0;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
};


/*******************************************************************************************/
// Teleport5 (Scrolls und Runen)

INSTANCE ItArRuneTeleport5 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_39.3ds";	//grüne Rune
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORT5;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportacja do obozu na bagnie";	//lila Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArScrollTeleport5 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	visual				=	"ItAr_Scroll_37.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORT5;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Teleportacja do obozu na bagnie";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
};

INSTANCE ItArRuneTeleport6 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_27.3ds";
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORT6;
	//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Runa teleportacji.";	//blaue Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};
//CZ - runes
INSTANCE ItArRuneTeleportToHuntersCamp (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_38.3ds";	//rote Rune
	material			=	MAT_STONE;

	spell				= 	SPL_TELEPORTTOHUNTERSCAMP;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			= 	"Teleportacja do obozu myœliwych";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArRuneTeleportToNecroloc (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_41.3ds"; //lila Rune
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORTTONECROLOC;
	//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportacja do siedziby nekromanty";	//blaue Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArRuneTeleportFromDungeonToWorldzen (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_37.3ds"; //lila Rune
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_TELEPORTFROMDUNGEONTOWORLDZEN;
	//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!

	description			=	"Teleportacja z podziemi klasztoru";	//blaue Rune
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TELEPORT;
};
/*******************************************************************************************
**  Wassermagier	 (Runensteine  und Scrolls)											  **
*******************************************************************************************/

// Heal (Scrolls und Runen)

INSTANCE ItArRuneHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_47.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_HEAL;
	mag_circle 			= 	2;

	description			=	"Uzdrowienie";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALING_hp_PER_MP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


INSTANCE ItArScrollHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual				=	"ItAr_Scroll_45.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_HEAL;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_HEALING_hp_PER_MP;

	description			=	"Uzdrowienie";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALING_hp_PER_MP;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_HEALING_hp_PER_MP;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

// Heal (Scrolls und Runen)

INSTANCE ItArRuneHealOther (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_48.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_HealOther;
	mag_circle 			= 	2;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			=	"Uzdrowienie innych";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALINGOTHER_HP_PER_MP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


INSTANCE ItArScrollHealOther (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual				=	"ItAr_Scroll_44.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_HealOther;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_HEALINGOTHER_HP_PER_MP;

	description			=	"Uzdrowienie innych";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_HealingPerMana;		COUNT	[1]		=	SPL_HEALINGOTHER_HP_PER_MP;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	SPL_HEALINGOTHER_HP_PER_MP;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

// Mirror (Scrolls und Runen)

INSTANCE ItArRuneMirror (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_43.3ds";
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword
	
	spell				= 	SPL_Mirror;
	mag_circle 			= 	2;

	description			=	"Lustro";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_MIRROR;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


// INSTANCE ItArScrollMirror (C_Item)
// {
// 	name 				=	NAME_Spruchrolle;

// 	mainflag 			=	ITEM_KAT_RUNE;
// 	flags 				=	ITEM_MULTI;

// 	value 				=	60;

// 	visual				=	"ItAr_Scroll_01.3DS";
// 	material			=	MAT_STONE;

// 	spell				= 	SPL_Mirror;
// 	cond_atr[2]   		= 	ATR_MANA_MAX;
// 	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;
// 	range				=	NO_RuneSword; //Means can't be used in RuneSword

// 	description			=	"Lustro";
// 	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
// 	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
// 	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
// 	TEXT	[4]			=	NAME_Spell_Invest;
// 	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
// };


// MagicShield (Scrolls und Runen)

INSTANCE ItArRuneMagicShield (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_46.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MagicShield;
	mag_circle 			= 	2;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			=	"Magiczna tarcza";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_MAGICSHIELD;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

// INSTANCE ItArScrollMagicShield (C_Item)
// {
// 	name 				=	NAME_Spruchrolle;

// 	mainflag 			=	ITEM_KAT_RUNE;
// 	flags 				=	ITEM_MULTI;

// 	value 				=	60;

// 	visual				=	"ItAr_Scroll_01.3DS";
// 	material			=	MAT_STONE;

// 	spell				= 	SPL_MagicShield;
// 	cond_atr[2]   		= 	ATR_MANA_MAX;
// 	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

// 	description			=	"Magiczna Tarcza";
// 	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
// 	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
// 	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
// 	TEXT	[4]			=	NAME_Spell_Invest;
// 	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
// };
// IceArmor (Scrolls und Runen)

INSTANCE ItArRuneIceArmor (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_45.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_UNDRESS;
	mag_circle 			= 	2;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			=	"Lodowa zbroja";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_IceArmor;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollIceArmor (C_Item)
{
 	name 				=	NAME_Spruchrolle;

 	mainflag 			=	ITEM_KAT_RUNE;
 	flags 				=	ITEM_MULTI;

 	value 				=	60;

 	visual				=	"ItAr_Scroll_01.3DS";
 	material			=	MAT_STONE;

 	spell				= 	SPL_UNDRESS;
 	cond_atr[2]   		= 	ATR_MANA_MAX;
 	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

 	description			=	"Lodowa zbroja";
 	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
 	TEXT	[1]			=	NAME_Manakosten;		COUNT	[1]		=	SPL_SENDCAST_SCROLL;
 	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
 	TEXT	[4]			=	NAME_Spell_Invest;
 	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
/*******************************************************************************************/

// Verwandlung (nur Scrolls)

INSTANCE ItArScrollTrfBloodfly (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell			    = 	SPL_TRF_BLOODFLY;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Przemiana w krwiopijcê";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_BLOODFLY;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfCrawler (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_04.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_CRAWLER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_CRAWLER;

	description			=	"Przemiana w pe³zacza";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_CRAWLER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfLurker (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_02.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_LURKER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_LURKER;

	description			=	"Przemiana w topielca";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_LURKER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfMeatbug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_03.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_MEATBUG;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_MEATBUG;

	description			=	"Przemiana w chrz¹szcza";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_MEATBUG;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfMolerat (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_05.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_MOLERAT;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_MOLERAT;

	description			= "Przemiana w kretoszczura";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_MOLERAT;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfOrcdog (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual				=	"ItAr_Scroll_11.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_ORCDOG;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_ORCDOG;

	description			=	"Przemiana w orkowego psa";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_ORCDOG;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfScavenger (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_07.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SCAVENGER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SCAVENGER;

	description			=	"Przemiana w œcierwojada";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SCAVENGER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfShadowbeast (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	200;

	visual				=	"ItAr_Scroll_06.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SHADOWBEAST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SHADOWBEAST;

	description			=	"Przemiana w cieniostwora";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SHADOWBEAST;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfSnapper (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_SNAPPER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_SNAPPER;

	description			=	"Przemiana w zêbacza";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_SNAPPER;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfWaran (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_10.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_WARAN;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_WARAN;

	description			= "Przemiana w jaszczura";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_WARAN;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTrfWolf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItAr_Scroll_09.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRF_WOLF;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_TRF_WOLF;

	description			= "Przemiana w wilka";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_TRF_WOLF;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Chain-Lightning (Scrolls und Runen)

INSTANCE ItArRuneChainLightning (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_18.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CHAINLIGHTNING;
	mag_circle 			=	3;

	description			=	"Grom";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_ZAPPED_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollChainLightning (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_20.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CHAINLIGHTNING;
	//mag_circle 			=	3;

	description			=	"Grom";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_ZAPPED_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Thunderbolt (Scrolls und Runen)

INSTANCE ItArRuneThunderbolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	300;

	visual				=	"ItAr_Rune_19.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBOLT;
	mag_circle 			=	1;

// FIXME: kann man die DAMAGE_PER_LEVEL-Werte der Spells aus der Spells_Params hier für Manakosten einsetzen??
	description			=	"Sopel lodu";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_THUNDERBOLT;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_THUNDERBOLT;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollThunderbolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	30;

	visual				=	"ItAr_Scroll_41.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBOLT;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Sopel lodu";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_THUNDERBOLT;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Thunderball (Scrolls und Runen)

INSTANCE ItArRuneThunderball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_20.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBALL;
	mag_circle 			=	3;		//SN: von 4 auf 3 geändert!

	description			=	"Piorun kulisty";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_THUNDERBALL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDERBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollThunderball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_01.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDERBALL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Piorun kulisty";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDERBALL;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Thunderball (Scrolls und Runen)

INSTANCE ItArRuneThunder (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1500;

	visual				=	"ItAr_Rune_44.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDER;
	mag_circle 			=	5;		//SN: von 4 auf 3 geändert!

	description			=	"Piorun";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_THUNDER;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDER;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollThunder (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	150;

	visual				=	"ItAr_Scroll_47.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_THUNDER;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Piorun";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Magic,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_THUNDER;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};
/*******************************************************************************************/
// IceCube (Scrolls und Runen)

INSTANCE ItArRuneIceCube (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_21.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	mag_circle 			=	3;

	description			=	"Bry³a lodu";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICECUBE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollIceCube (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_25.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Bry³a lodu";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// IceWave (Scrolls und Runen)

INSTANCE ItArRuneIceWave (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1800;

	visual				=	"ItAr_Rune_22.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	mag_circle 			=	6;

	description			=	"Lodowa fala";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ICEWAVE;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollIceWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	180;

	visual				=	"ItAr_Scroll_30.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Lodowa fala";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Damage;				COUNT	[2]		=	SPL_FREEZE_DAMAGE;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************
**  Dämonenbeschwörer	 (Runensteine  und Scrolls)										  **
*******************************************************************************************/

// Summon Demon (Scrolls)

INSTANCE ItArScrollSummonDemon (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	550;

	visual				=	"ItAr_Scroll_18.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONDEMON;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Przyzwanie demona";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONDEMON;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Summon Skeletons (Scrolls)

INSTANCE ItArScrollSummonSkeletons (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	350;

	visual				=	"ItAr_Scroll_23.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONSKELETON;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Przyzwanie szkieleta";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONSKELETON;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Summon Golem (Scrolls)

INSTANCE ItArScrollSummonGolem (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	450;

	visual				=	"ItAr_Scroll_23.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONGOLEM;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Przyzwanie golema";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SUMMONGOLEM;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Army of Darkness (Scrolls)

INSTANCE ItArScrollArmyOfDarkness (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	666;

	visual				=	"ItAr_Scroll_29.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ARMYOFDARKNESS;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_SENDCAST_SCROLL;

	description			=	"Armia ciemnoœci";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_ARMYOFDARKNESS;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Destroy Undead (Scrolls und Runen)

INSTANCE ItArRuneDestroyUndead (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;

	visual				=	"ItAr_Rune_15.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	mag_circle 			=	5;

	description			=	"Œmieræ o¿ywieñcom";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_DESTROYUNDEAD;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_DESTROYUNDEAD;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollDestroyUndead (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_26.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Œmieræ o¿ywieñcom";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_DESTROYUNDEAD;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************
**  PSI-Sprüche		(Runen und Scrolls)													  **
*******************************************************************************************/

// Windfist (Scrolls und Runen)

INSTANCE ItArRuneWindfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_06.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	mag_circle 			=	2;

	description			=	"Uderzenie wiatru";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_WINDFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_WINDFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollWindfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual				=	"ItAr_Scroll_12.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Uderzenie wiatru";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_WINDFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Stormfist (Scrolls und Runen)

INSTANCE ItArRuneStormfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;

	visual				=	"ItAr_Rune_07.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_STORMFIST;
	mag_circle 			=	4;

	description			=	"Uderzenie burzy";
	TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_STORMFIST;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_STORMFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

INSTANCE ItArScrollStormfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_17.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_STORMFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Uderzenie burzy";
	//TEXT	[0]			=	NAME_Mag_Circle;							COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManakostenMax;							COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	TEXT	[2]			=	ConcatStrings(NAME_Dam_Fly,NAME_PerMana);	COUNT	[2]		=	SPL_DAMAGE_STORMFIST;
	//TEXT	[3] 		=	"";											COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Load;
	TEXT	[5]			=	NAME_Value;									COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Telekinesis (Scrolls und Runen)

INSTANCE ItArRuneTelekinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_05.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEKINESIS;
	mag_circle 			=	3;

	description			=	"Telekineza";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	1;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollTelekinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_13.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TELEKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			=	"Telekineza";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_ManaPerSec;			COUNT	[1]		=	1;
	TEXT	[2]			=	NAME_Mana_needed;			COUNT	[2]		=	cond_value[2];
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Charm (Scrolls und Runen)

INSTANCE ItArRuneCharm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_10.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CHARM;
	mag_circle 			=	3;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	description			=	"Urok";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_CHARM;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollCharm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_19.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CHARM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Urok";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Sleep (Scrolls)

INSTANCE ItArRuneSleep (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	600;

	visual				=	"ItAr_Rune_09.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	mag_circle 			=	2;

	description			=	"Sen";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollSleep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual				=	"ItAr_Scroll_16.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Sen";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SCROLL;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Pyrokinesis (Scrolls und Runen)

INSTANCE ItArRunePyrokinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	900;

	visual				=	"ItAr_Rune_04.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	mag_circle 			=	3;

	description			=	"Pirokineza";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_PYRO_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollPyrokinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_33.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Pirokineza";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_DamagePerSec;			COUNT	[1]		=	SPL_PYRO_DAMAGE_PER_SEC;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	TEXT	[4]			=	NAME_Spell_Invest;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Control (Scrolls und Runen)

INSTANCE ItArRuneControl (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1200;

	visual				=	"ItAr_Rune_02.3ds";
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_CONTROL;
	mag_circle 			=	4;

	description			=	"Kontrola";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SLEEP;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

INSTANCE ItArScrollControl (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_08.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SCROLL;

	description			=	"Kontrola";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Fear (nur Scrolls )

INSTANCE ItArScrollFear (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_34.3DS";
	material			=	MAT_STONE;
	range				=	NO_RuneSword; //Means can't be used in RuneSword

	spell				= 	SPL_FEAR;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_FEAR;

	description			=	"Strach";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FEAR;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/******************************************************************************************/
// Berzerk (nur Scrolls )

INSTANCE ItArScrollBerzerk (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	120;

	visual				=	"ItAr_Scroll_22.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_BERZERK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_BERZERK;

	description			=	"Gniew";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_BERZERK;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Breath of Death (nur Rune )

INSTANCE ItArRuneBreathOfDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1800;

	visual				=	"ItAr_Rune_21.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BREATHOFDEATH;
	mag_circle 			=	6;

	description			=	"Tchnienie œmierci";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_BREATHOFDEATH;
	TEXT	[2]			=	NAME_Dam_Magic;				COUNT	[2]		=	SPL_DAMAGE_BREATHOFDEATH;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/
// Shrink (nur Scrolls )

INSTANCE ItArScrollShrink (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual				=	"ItAr_Scroll_15.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SHRINK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_SENDCAST_SHRINK;

	description			=	"Zmniejszenie potwora";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_SHRINK;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};

/*******************************************************************************************/


/*******************************************************************************************/
// Portal

INSTANCE ItArRuneCreatePortal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_56.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_CREATEPORTAL;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!
	range				=	NO_RuneSword; //Means can't be used in RuneSword
	value				= 	100;
	description			= 	"Portal";
	TEXT	[0]			=	"Czar tworzy specjalny portal, do";
	TEXT	[1]			=	"którego mo¿na przenieœæ siê przy pomocy";
	TEXT	[2]			=	"innego czaru.";
	TEXT	[3]			=	NAME_Mag_Circle;			COUNT	[3]		=	mag_circle;
	TEXT	[4]			=	NAME_Manakosten;			COUNT	[4]		=	SPL_SENDCAST_TELEPORT;
};

INSTANCE ItArRuneGotoPortal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	visual				=	"ItAr_Rune_56.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_GOTOPORTAL;
//mag_circle 			= 	4;   //SN: Teleport-Spells müssen auch ohne Circle sprechbar sein!
	range				=	NO_RuneSword; //Means can't be used in RuneSword
	value				= 	100;
	description			= 	"Przenieœ do portalu";
	TEXT	[0]			=	"Czar przenosi maga do portalu";
	TEXT	[3]			=	NAME_Mag_Circle;			COUNT	[3]		=	mag_circle;
	TEXT	[4]			=	NAME_Manakosten;			COUNT	[4]		=	SPL_SENDCAST_TELEPORT;
};