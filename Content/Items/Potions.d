// ************************************************************************************************
// Wirkung und Kosten von Tränken
// ************************************************************************************************

// Heilung
const int	Value_hpEssenz			=	50;		const int	hp_Essenz			=	50;
const int	Value_hpExtrakt			=	75;		const int	hp_Extrakt			=	70;
const int	Value_hpElixier			=	100;	const int	hp_Elixier			=	100;
const int	Value_hpMAX				=	200;
// Mana (Magier)
const int	Value_ManaEssenz		=	25;		const int	Mana_Essenz			=	30;
const int	Value_ManaExtrakt		=	45;		const int	Mana_Extrakt		=	50;
const int	Value_ManaElixier		=	65;		const int	Mana_Elixier		=	70;

// Mana (Bruderschaft)
const int	Value_Elixier1			=	95;		const int	Mana_Elixier1		=	100;

// Permanente Attribut-Steigerungen
// FIXME: sind die zu kaufen (müüsen dann teuer sein) oder zu fnden (dann evtl. billiger)
// FIXME: Textanzeige der Attribut-Änderung bei Benutzung möglich?
const int	Value_ElixierEgg		=	1;		const int	ManaMax_ElixierEgg	=	10;	// FIXME: was wenn der SC das selbst benutzt??

const int	Value_StrExtrakt		=	700;	const int	STR_Extrakt			=	5;
const int	Value_StrElixier		=	1000;	const int	STR_Elixier			=	8;

const int	Value_DexExtrakt		=	700;	const int	DEX_Extrakt			=	5;
const int	Value_DexElixier		=	1000;	const int	DEX_Elixier			=	8;

// Trank der Macht
const int	Value_StrDex_Macht		=	1300;	const int	StrDex_Macht		=	3;
// Trank der Herrschaft
const int	Value_StrDex_Herrschaft	=	2000;	const int	StrDex_Herrschaft	=	5;

const int	Value_hpMaxExtrakt		=	700;	const int	hpMax_Extrakt		=	5;
const int	Value_hpMaxElixier		=	1000;	const int	hpMax_Elixier		=	10;

const int	Value_ManaMaxExtrakt	=	700;	const int	ManaMax_Extrakt		=	5;
const int	Value_ManaMaxElixier	=	1000;	const int	ManaMax_Elixier		=	10;

// Speed-Potions
const int	Value_Haste2			=	150;	const int	Time_Haste2			=	120000;	// 2 min.
const int	Value_Haste3			=	200;	const int	Time_Haste3			=	300000;	// 5 min.


/******************************************************************************************/
//	MANATRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaEssenz;	

	visual 			=	"ItFo_Potion_Mana_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseManaPotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja magicznej energii";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaEssenz;
};

	FUNC VOID UseManaPotion()
	{
		//PrintDebugNpc		(PD_ITEM_MOBSI, "UseManaPotion");
		B_ChangeAttribute	(self,	ATR_MANA,	Mana_Essenz);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaExtrakt;	

	visual 			=	"ItFo_Potion_Mana_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci¹g magicznej energii";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaExtrakt;
};

	FUNC VOID UseMana2Potion()
	{
		//PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana2Potion");
		B_ChangeAttribute	(self,	ATR_MANA,	Mana_Extrakt);
	};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir magicznej energii";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaElixier;
};

	FUNC VOID UseMana3Potion()
	{
		//PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana3Potion");
		B_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier);
	};
/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaElixier;	

	visual 			=	"ItFo_Potion_Mana_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMana3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Pe³nia magicznej energii";
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaElixier;
};

FUNC VOID UseMana4Potion()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseMana4Potion");
   self.attribute[ATR_MANA]=self.attribute[ATR_MANA_MAX];
};

/******************************************************************************************/	
// MANA ELIXIERE BRUDERSCHAFT//

INSTANCE ItFo_Potion_Elixier(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Elixier1;	

	visual 			=	"ItFo_Potion_Elixier.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseElixier;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir";
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Elixier1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Elixier1;
};

func void  UseElixier ()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseElixier");
   B_ChangeAttribute	(self,	ATR_MANA,	Mana_Elixier1);	 
};

/******************************************************************************************/
//	HEILTRÄNKE																			//
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpEssenz;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealthpotion;
	scemeName		=	"POTIONFAST";

	description			= "Esencja uzdrawiaj¹ca ";
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Essenz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpEssenz;
};

FUNC VOID UseHealthpotion()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthpotion");
   B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Essenz);
};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpExtrakt;	

	visual 			=	"ItFo_Potion_Health_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci¹g uzdrawiaj¹cy ";
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpExtrakt;
};

FUNC VOID UseHealth2Potion()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthpotion");
   B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Extrakt);
};

/******************************************************************************************/	
INSTANCE ItFo_Potion_Health_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpElixier;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir uzdrawiaj¹cy ";
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpElixier;
};

FUNC VOID UseHealth3Potion()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthpotion");
   B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Elixier);
};
////////////////////////////////////////////////////////////////
//MEGA ELIXIR
//////////////////////////////////////////////////////////////
INSTANCE ItFo_Potion_Health_04(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpMAX;	

	visual 			=	"ItFo_Potion_Health_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHealth4Potion;
	scemeName		=	"POTIONFAST";

	description			= "Pe³nia ¿ycia ";
//	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpElixier;
};

FUNC VOID UseHealth4Potion()
{
   //PrintDebugNpc		(PD_ITEM_MOBSI, "UseHealthpotion");
   self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
};

/******************************************************************************************/
// TRÄNKE FÜR PERMANENTE ATTRIBUT-ÄNDERUNGEN!
/******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Elixier_Egg(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ElixierEgg;	

	visual 			=	"ItFo_Potion_Elixier_Egg.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseEggElixier;
	scemeName		=	"POTIONFAST";

	description			= "Napój z pe³zaczy";
	TEXT[0]				= "Pozwala nawi¹zaæ kontakt ze Œni¹cym.";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_ElixierEgg;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ElixierEgg;
};

func void  UseEggElixier ()
{
   B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_ElixierEgg);
};
	
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrExtrakt;	

	visual 			=	"ItFo_Potion_Strength_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci¹g si³y";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrExtrakt;
};

FUNC VOID UseStrength2Potion()
{ 
   B_RaiseAttribute	(ATR_STRENGTH,	STR_Extrakt);
};
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Strength_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrElixier;	

	visual 			=	"ItFo_Potion_Strength_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseStrength3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir si³y";
	TEXT[1]				= NAME_Bonus_Str;				COUNT[1]	= STR_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrElixier;
};

FUNC VOID UseStrength3Potion()
{ 
   B_RaiseAttribute	(ATR_STRENGTH,	STR_Elixier);
};

/******************************************************************************************/
//	DEXTERITY
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexExtrakt;	

	visual 			=	"ItFo_Potion_Dex_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci¹g zwinnoœci";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexExtrakt;
};

FUNC VOID UseDex2Potion()
{ 
   B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Extrakt);
};
		
/******************************************************************************************/		
INSTANCE ItFo_Potion_Dex_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_DexElixier;	

	visual 			=	"ItFo_Potion_Dex_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseDex3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir zwinnoœci";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= DEX_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DexElixier;
};

FUNC VOID UseDex3Potion()
{ 
   B_RaiseAttribute	(ATR_DEXTERITY,	DEX_Elixier);
};

/******************************************************************************************/
// STRENGTH & DEX

INSTANCE ItFo_Potion_Master_01(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Macht;	

	visual 			=	"ItFo_Potion_Master_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMasterPotion;
	scemeName		=	"POTIONFAST";

	description			= "Napój potêgi";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Macht;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Macht;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Macht;
};

FUNC VOID UseMasterPotion()
{
   B_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Macht);
   B_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Macht);
};

/******************************************************************************************/
INSTANCE ItFo_Potion_Master_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_StrDex_Herrschaft;	

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseMaster2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Napój w³adzy";
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= StrDex_Herrschaft;
	TEXT[2]				= NAME_Bonus_Str;				COUNT[2]	= StrDex_Herrschaft;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_StrDex_Herrschaft;
};

FUNC VOID UseMaster2Potion()
{
   B_ChangeAttribute	(self,	ATR_STRENGTH,	StrDex_Herrschaft);
   B_ChangeAttribute	(self,	ATR_DEXTERITY,	StrDex_Herrschaft);
};
/******************************************************************************************/		
// Hitpoints
		
/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpMaxExtrakt;	

	visual 			=	"ItFo_Potion_Health_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife2Potion;
	scemeName		=	"POTIONFAST";

	description		= "Wyci¹g ¿ycia";
	TEXT[1]				= NAME_Bonus_hpMax;				COUNT[1]	= hpMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpMaxExtrakt;
};

FUNC VOID UseLife2Potion()
{
   B_RaiseAttribute	(ATR_HITPOINTS_MAX,	hpMax_Extrakt);
};

/******************************************************************************************/
INSTANCE ItFo_Potion_Health_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_hpMaxElixier;	

	visual 			=	"ItFo_Potion_Health_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseLife3Potion;
	scemeName		=	"POTIONFAST";

	description		= "Eliksir ¿ycia";
	TEXT[1]				= NAME_Bonus_hpMax;				COUNT[1]	= hpMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_hpMaxElixier;
};

FUNC VOID UseLife3Potion()
{
   B_RaiseAttribute	(ATR_HITPOINTS_MAX,	hpMax_Elixier);	
};

/******************************************************************************************/
// MANA

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxExtrakt;	

	visual 			=	"ItFo_Potion_Mana_Perma_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar2Potion;
	scemeName		=	"POTIONFAST";

	description			= "Wyci¹g ducha";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Extrakt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxExtrakt;
};

FUNC VOID UseNectar2Potion()
{
   B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Extrakt);
   //PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
};

/******************************************************************************************/
INSTANCE ItFo_Potion_Mana_Perma_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_ManaMaxElixier;	

	visual 			=	"ItFo_Potion_Mana_Perma_03.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseNectar3Potion;
	scemeName		=	"POTIONFAST";

	description			= "Eliksir ducha";
	TEXT[1]				= NAME_Bonus_ManaMax;			COUNT[1]	= ManaMax_Elixier;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_ManaMaxElixier;
};

FUNC VOID UseNectar3Potion()
{
   B_RaiseAttribute	(ATR_MANA_MAX,	ManaMax_Elixier);
   //PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich trinke Magie");
};

/******************************************************************************************/
//	SPEED-POTIONS																	      //
/******************************************************************************************/

/******************************************************************************************/
INSTANCE ItFo_Potion_Haste_02(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste2;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion2;
	scemeName		=	"POTIONFAST";

	description		= "Napój szybkoœci";
	TEXT[1]			= "Pozwala szybciej biegaæ. ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste2/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID UseHastePotion2()
{
   Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste2);
   //PrintDebugNpc 		(PD_ITEM_MOBSI, "jetzt bin ich schnell");	
};
   
INSTANCE ItFo_Potion_Haste_03(C_Item)
{
	name 			=	NAME_Trank;

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	Value_Haste3;	

	visual 			=	"ItFo_Potion_Haste_01.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseHastePotion3;
	scemeName		=	"POTIONFAST";

	description		= "Napój przyspieszenia";
	TEXT[1]			= "Pozwala na d³u¿sze sprinty. ";
	TEXT[3]			= NAME_Duration;				COUNT[3]	= Time_Haste3/60000;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID UseHastePotion3()
{
   Mdl_ApplyOverlayMDSTimed	(self, "HUMANS_SPRINT.MDS", Time_Haste3);
};