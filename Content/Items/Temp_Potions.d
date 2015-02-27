//-----------------------
// A T T R I B U T E
//-----------------------
const int	Value_Str1Temp	=	55; const int	Value_Str2Temp	=	120;const int	Value_Str3Temp	=	180;
const int	Value_Dex1Temp	=	55; const int	Value_Dex2Temp	=	120;const int	Value_Dex3Temp	=	180;
const int	STR1_Temp	=	15; 	const int	STR2_Temp	=	40; 	const int	STR3_Temp	=	60;
const int	DEX1_Temp	=	15; 	const int	DEX2_Temp	=	40; 	const int	DEX3_Temp	=	60;

const int	Value_HP1Temp	=	60; const int	Value_HP2Temp	=	100;const int	Value_HP3Temp	=	155;
const int	Value_MP1Temp	=	70; const int	Value_MP2Temp	=	120;const int	Value_MP3Temp	=	180;
const int	HP1_Temp	=	30; 	const int	HP2_Temp	=	70; 	const int	HP3_Temp	=	150;
const int	MP1_Temp	=	15; 	const int	MP2_Temp	=	40; 	const int	MP3_Temp	=	60;
//-----------------------
// P R O T E C T I O N
//-----------------------
const int	Value_Edg1Temp	=	30; const int	Value_Edg2Temp	=	70; const int	Value_Edg3Temp	=	150;
const int	Value_Pnt1Temp	=	30; const int	Value_Pnt2Temp	=	70; const int	Value_Pnt3Temp	=	150;
const int	Edg1_Temp	=	10; 	const int	Edg2_Temp	=	20; 	const int	Edg3_Temp	=	40;
const int	Pnt1_Temp	=	10; 	const int	Pnt2_Temp	=	15; 	const int	Pnt3_Temp	=	30;

const int	Value_fir1Temp	=	40; const int	Value_fir2Temp	=	90; const int	Value_fir3Temp	=	200;
const int	Value_mag1Temp	=	50; const int	Value_mag2Temp	=	115;const int	Value_mag3Temp	=	250;
const int	fir1_Temp	=	7; 		const int	fir2_Temp	=	15; 	const int	fir3_Temp	=	25;
const int	mag1_Temp	=	5; 		const int	mag2_Temp	=	10; 	const int	mag3_Temp	=	20;

const int	TP_TIME_SHORT = 2;
const int	TP_TIME_LONG = 3;

//**********************************8
// ATR TempPotions
//**********************************8
//**********************************8
// Hitpoints
//**********************************8
INSTANCE ItFo_Potion_HP_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HP1Temp;	
	visual 			=	"ItFo_Temp_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Eliksir poœwiêcenia";
	TEXT[2]				= NAME_Bonus_HP;				COUNT[2]	= HP1_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_HP_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HP2Temp;	
	visual 			=	"ItFo_Temp_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Dar ¿ycia";
	TEXT[2]				= NAME_Bonus_HP;				COUNT[2]	= HP2_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_HP_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HP3Temp;	
	visual 			=	"ItFo_Temp_Health_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Nektar paladyna";
	TEXT[2]				= NAME_Bonus_HP;				COUNT[2]	= HP3_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};


//**********************************8
// Manapoints
//**********************************8
INSTANCE ItFo_Potion_MP_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_MP1Temp;	
	visual 			=	"ItFo_Temp_Mana_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Eliksir mocy";
	TEXT[3]				= NAME_Bonus_Mana;				COUNT[3]	= MP1_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_MP_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_MP2Temp;	
	visual 			=	"ItFo_Temp_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Œwiat³o Adanosa";
	TEXT[3]				= NAME_Bonus_Mana;				COUNT[3]	= MP2_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_MP_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_MP3Temp;	
	visual 			=	"ItFo_Temp_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Nektar bogów";
	TEXT[3]				= NAME_Bonus_Mana;				COUNT[3]	= MP3_Temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};


//**********************************8
// Dexterity
//**********************************8
INSTANCE ItFo_Potion_DEX_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DEX1temp;	
	visual 			=	"ItFo_temp_Dex_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Z³odziejska gorza³a";
	TEXT[1]				= NAME_Bonus_DEX;				COUNT[1]	= DEX1_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_DEX_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DEX2temp;	
	visual 			=	"ItFo_temp_Dex_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Napój myœliwego";
	TEXT[1]				= NAME_Bonus_DEX;				COUNT[1]	= DEX2_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_DEX_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DEX3temp;	
	visual 			=	"ItFo_temp_Dex_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Nektar ³owcy";
	TEXT[1]				= NAME_Bonus_DEX;				COUNT[1]	= DEX3_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

//**********************************8
// Strength
//**********************************8
INSTANCE ItFo_Potion_Str_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Str1temp;	
	visual 			=	"ItFo_temp_Str_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Gniew golema";
	TEXT[0]				= NAME_Bonus_Str;				COUNT[0]	= Str1_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_Str_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Str2temp;	
	visual 			=	"ItFo_temp_Str_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Krew trolla";
	TEXT[0]				= NAME_Bonus_Str;				COUNT[0]	= Str2_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
INSTANCE ItFo_Potion_Str_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Str3temp;	
	visual 			=	"ItFo_temp_Str_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UsetempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Furia berserkera";
	TEXT[0]				= NAME_Bonus_Str;				COUNT[0]	= Str3_temp;
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};




//**********************************8
// Total
//**********************************8
//**********************************8
// Strength and Dexterity
//**********************************8
INSTANCE ItFo_Potion_Str_Dex_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Str1Temp+Value_Dex1Temp;	
	visual 			=	"ItFo_Temp_STRDEX_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Wywar wojownika";
	TEXT[0]				= NAME_Bonus_Str;				COUNT[0]	= STR1_Temp;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

INSTANCE ItFo_Potion_Str_Dex_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Str2Temp+Value_Dex2Temp;	
	visual 			=	"ItFo_Temp_STRDEX_02.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Dusza Varantczyka";
	TEXT[0]				= NAME_Bonus_Str;				COUNT[0]	= STR2_Temp;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX2_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

//**********************************8
// Hitpoints and Manapoints
//**********************************8


INSTANCE ItFo_Potion_HP_MP_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HP1Temp+Value_MP1Temp;	
	visual 			=	"ItFo_Temp_HPMP_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "Wywar oœwiecenia";
	TEXT[2]				= NAME_Bonus_HP;				COUNT[2]	= HP1_Temp;
	TEXT[3]				= NAME_Bonus_Mana;				COUNT[3]	= MP1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

INSTANCE ItFo_Potion_HP_MP_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_HP2Temp+Value_MP2Temp;	
	visual 			=	"ItFo_Temp_HPMP_02.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_ATR;	
	
	description			= "£aska bogów";
	TEXT[2]				= NAME_Bonus_HP;				COUNT[2]	= HP2_Temp;
	TEXT[3]				= NAME_Bonus_Mana;				COUNT[3]	= MP2_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

//**********************************8
// PROTECTION TempPotions
//**********************************8
//**********************************8
// EDGE
//**********************************8
INSTANCE ItFo_Potion_Edg_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Edg1Temp;	
	visual 			=	"ItFo_Temp_PWeap_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Dêbowy wyci¹g";
	TEXT[0]				= NAME_Prot_Edge;				COUNT[0]	= EDG1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
//DISABLED - TO MUCH MIXTURES!
// INSTANCE ItFo_Potion_Edg_2_temp(C_Item)
// {
// 	name 			=	NAME_Trank;

// 	mainflag 		=	ITEM_KAT_POTIONS;
// 	flags 			=	ITEM_MULTI;

// 	value 			=	Value_Edg2Temp;	
// 	visual 			=	"ItFo_Temp_PWeap_02.3DS";
// 	material 		=	MAT_GLAS;
// 	on_state[0]		=	UseTempPot;
// 	scemeName		=	"POTIONFAST";

// 	weight			=	TP_TYPE_PROT;	
// 	
// 	description			= "Wywar ochrony przed broni¹";
// 	TEXT[0]				= NAME_Prot_Edge;				COUNT[0]	= EDG2_Temp;	
// 	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
// 	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
// };	

INSTANCE ItFo_Potion_Edg_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Edg2Temp;	
	visual 			=	"ItFo_Temp_PWeap_03.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Skalna woda";
	TEXT[0]				= NAME_Prot_Edge;				COUNT[0]	= EDG3_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
//**********************************8
// Point
//**********************************8
INSTANCE ItFo_Potion_pnt_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_pnt1Temp;	
	visual 			=	"ItFo_Temp_PPoint_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Wywar halucynogenny";
	TEXT[1]				= NAME_Prot_POINT;				COUNT[1]	= pnt1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
//DISABLED - TO MUCH MIXTURES!
// INSTANCE ItFo_Potion_pnt_2_temp(C_Item)
// {
// 	name 			=	NAME_Trank;

// 	mainflag 		=	ITEM_KAT_POTIONS;
// 	flags 			=	ITEM_MULTI;

// 	value 			=	Value_pnt2Temp;	
// 	visual 			=	"ItFo_Temp_PPoint_02.3DS";
// 	material 		=	MAT_GLAS;
// 	on_state[0]		=	UseTempPot;
// 	scemeName		=	"POTIONFAST";

// 	weight			=	TP_TYPE_PROT;	
// 	
// 	description			= "Wywar ochrony przed pociskami";
// 	TEXT[1]				= NAME_Prot_POINT;				COUNT[1]	= pnt2_Temp;	
// 	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
// 	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
// };	

INSTANCE ItFo_Potion_pnt_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_pnt2Temp;	
	visual 			=	"ItFo_Temp_PPoint_03.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Eliksir asasyna";
	TEXT[1]				= NAME_Prot_POINT;				COUNT[1]	= pnt3_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
//**********************************8
// Fire
//**********************************8
INSTANCE ItFo_Potion_fir_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_fir1Temp;	
	visual 			=	"ItFo_Temp_PFire_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Lód Nordmaru";
	TEXT[2]				= NAME_Prot_FIRE;				COUNT[2]	= fir1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
//DISABLED - TO MUCH MIXTURES!

// INSTANCE ItFo_Potion_fir_2_temp(C_Item)
// {
// 	name 			=	NAME_Trank;

// 	mainflag 		=	ITEM_KAT_POTIONS;
// 	flags 			=	ITEM_MULTI;

// 	value 			=	Value_fir2Temp;	
// 	visual 			=	"ItFo_Temp_PFire_02.3DS";
// 	material 		=	MAT_GLAS;
// 	on_state[0]		=	UseTempPot;
// 	scemeName		=	"POTIONFAST";

// 	weight			=	TP_TYPE_PROT;	
// 	
// 	description			= "Wywar ochrony przed ogniem";
// 	TEXT[2]				= NAME_Prot_FIRE;				COUNT[2]	= fir2_Temp;	
// 	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
// 	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
// };	

INSTANCE ItFo_Potion_fir_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_fir2Temp;	
	visual 			=	"ItFo_Temp_PFire_03.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Wola Adanosa";
	TEXT[2]				= NAME_Prot_FIRE;				COUNT[2]	= fir3_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};
//**********************************8
// Magic
//**********************************8
INSTANCE ItFo_Potion_mag_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_mag1Temp;	
	visual 			=	"ItFo_Temp_Pmag_01.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "P³omyk ognika";
	TEXT[3]				= NAME_Prot_MAGIC;				COUNT[3]	= mag1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
//DISABLED - TO MUCH MIXTURES!
// INSTANCE ItFo_Potion_mag_2_temp(C_Item)
// {
// 	name 			=	NAME_Trank;

// 	mainflag 		=	ITEM_KAT_POTIONS;
// 	flags 			=	ITEM_MULTI;

// 	value 			=	Value_mag2Temp;	
// 	visual 			=	"ItFo_Temp_Pmag_02.3DS";
// 	material 		=	MAT_GLAS;
// 	on_state[0]		=	UseTempPot;
// 	scemeName		=	"POTIONFAST";

// 	weight			=	TP_TYPE_PROT;	
// 	
// 	description			= "Wywar ochrony przed magi¹";
// 	TEXT[3]				= NAME_Prot_MAGIC;				COUNT[3]	= mag2_Temp;	
// 	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
// 	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
// };	

INSTANCE ItFo_Potion_mag_3_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_mag2Temp;	
	visual 			=	"ItFo_Temp_Pmag_03.3DS";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Smocza ¿ó³æ";
	TEXT[3]				= NAME_Prot_MAGIC;				COUNT[3]	= mag3_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};


//**********************************8
// Total
//**********************************8

INSTANCE ItFo_Potion_Prot_Total_1_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Pnt1Temp+Value_Edg1Temp+Value_Fir1Temp+Value_Mag1Temp;	
	visual 			=	"ItFo_Temp_ProtALL_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Wola przetrwania";
	TEXT[0]				= NAME_Prot_Edge;				COUNT[0]	= EDG1_Temp;		
	TEXT[1]				= NAME_Prot_Point;				COUNT[1]	= PNT1_Temp;	
	TEXT[2]				= NAME_Prot_FIRE;				COUNT[2]	= fir1_Temp;	
	TEXT[3]				= NAME_Prot_MAGIC;				COUNT[3]	= mag1_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_SHORT;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};

INSTANCE ItFo_Potion_Prot_Total_2_temp(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Pnt2Temp+Value_Edg2Temp+Value_Fir2Temp+Value_Mag2Temp;	
	visual 			=	"ItFo_Temp_ProtALL_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";

	weight			=	TP_TYPE_PROT;	
	
	description			= "Krew tytanów";
	TEXT[0]				= NAME_Prot_Edge;				COUNT[0]	= EDG2_Temp;		
	TEXT[1]				= NAME_Prot_Point;				COUNT[1]	= PNT2_Temp;	
	TEXT[2]				= NAME_Prot_FIRE;				COUNT[2]	= fir2_Temp;	
	TEXT[3]				= NAME_Prot_MAGIC;				COUNT[3]	= mag2_Temp;	
	TEXT[4]			= NAME_Duration;				COUNT[4]	= TP_TIME_LONG;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	
	
INSTANCE ItFo_Potion_Spec_Immunity(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	150;	
	visual 			=	"ItFo_Temp_Special_Immu.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";
	
	weight			=	TP_TYPE_SPEC;	
	range			=	0;//immunity
	description			= "Napój niezwyciê¿onoœæi.";
	TEXT[0]				= "Postaæ nie otrzymuje obra¿eñ.";		

	TEXT[4]			= "Czas trwania (sek): ";				COUNT[4]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};			

INSTANCE ItFo_Potion_Spec_Bash(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	150;	
	visual 			=	"ItFo_Temp_Special_BASH.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";
	
	weight			=	TP_TYPE_SPEC;	
	range			=	1;//bash
	description			= "Orkowa werwa";
	TEXT[0]				= "Daje szanse na og³uszenie przeciwników";	
   TEXT[1]				= "w czasie walki wrêcz.";	

	TEXT[4]			= "Czas trwania (sek): ";				COUNT[4]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	

INSTANCE ItFo_Potion_Spec_DoubleDamage(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Pnt2Temp+Value_Edg2Temp+Value_Fir2Temp+Value_Mag2Temp;	
	visual 			=	"ItFo_Temp_Special_CRITICAL.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";
	
	weight			=	TP_TYPE_SPEC;	
	range			=	2;//cri
	description			= "Silny naci¹g.";
	TEXT[0]				= "Zwiêksza obra¿enia zadane";
   Text[1] = "z dystansu dwukrotnie.";		

	TEXT[4]			= "Czas trwania (sek): ";				COUNT[4]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	

INSTANCE ItFo_Potion_Spec_MultiCast(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Pnt2Temp+Value_Edg2Temp+Value_Fir2Temp+Value_Mag2Temp;	
	visual 			=	"ItFo_Temp_Special_MULTI.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseTempPot;
	scemeName		=	"POTIONFAST";
	
	weight			=	TP_TYPE_SPEC;	
	range			=	3;//mul
	description			= "£aska bogów.";
	TEXT[0]				= "Daje szanse na rzucenie";		
   TEXT[1]				= "dodatkowych zaklêæ.";

	TEXT[4]			= "Czas trwania (sek): ";				COUNT[4]	= 30;
	TEXT[5]				= NAME_Value;					COUNT[5]	= item.value;
};	