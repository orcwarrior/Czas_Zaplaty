
/***************************************************

CHAPTER 6 ITEMS

***************************************************/

//Items by Sher

INSTANCE ItFo_Potion_Poison(C_Item)
{
	name 			=	"Czarna wdowa";

	mainflag 		=	ITEM_KAT_POTIONS;
	flags 			=	ITEM_MULTI;

	value 			=	400;	

	visual 			=	"ItFo_Potion_Master_02.3ds";
	material 		=	MAT_GLAS;
	on_state[0]		=	UseBlackWidow;
	scemeName		=	"POTIONFAST";

	description			= "Czarna wdowa to niezwykle skuteczna trucizna";

};

	FUNC VOID UseBlackWidow()
	{
	//TODO: Ani/leave like that	
	//AI_PlayAni		(self,	"T_PSI_VICTIM");
	B_KillNpc			(self);
	Npc_ChangeAttribute	(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	};


/**********************
Klucz do celi Diego, tylko nim mo¿na otworzyæ drzwi!

**********************/

INSTANCE DUNGEONKEY (C_Item)
{
	name 				=	"Klucz do celi Diego.";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};	

/************************
Ork nie mam gothica ani spacera wiêc nie mogê sprawdziæ jak siê nazywa klucz do magazynu przy kuŸni do SO
Ten klucz jest tylko po to, ¿eby w ogóle jakiœ by³, zamieñ go w skryptach na ten przypisany w spacerze

*************************/


INSTANCE ITKEY_OB_SMITH_01 (C_Item)
{
	name 				=	"Klucz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_02.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};

/*********************
To ten miecz x3 trzeba dodaæ do magazynu przy kuŸni w SO
Najlepiej, ¿eby jakiœ egzemplarz gdzieœ zabunkrowaæ. 
A 2 pozosta³e miecze ju¿ ktoœ ukrad³ xD
**********************/


INSTANCE ItMw_1H_Sword_Bastard_05 (WeaponsMelee) 
{	
	name 				=	"Piewca zag³ady";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4956;

	damageTotal			= 	74;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	  visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ITKE_DUNG_KEY (C_Item)
{
	name 				=	"Klucz do magazynu Gomeza";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Schlüssel;

	visual 				=	"ItKe_Key_01.3ds";
	material 			=	MAT_METAL;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Schlüssel;
};	
