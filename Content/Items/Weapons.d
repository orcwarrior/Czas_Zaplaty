//------------------------------------------------------------------
//PERSÖNLICHE WAFFEN
/***********************************************************/
//-----------------------------------------------------------
//SCAR
//-----------------------------------------------------------
func void Bloody_Claws_E()
{
	Mdl_ApplyOverlayMds 	(hero,"HUMANS_1HST3.MDS");	
};
func void Bloody_Claws_UE()
{
	Mdl_RemoveOverlayMds 	(hero,"HUMANS_1HST3.MDS");	
};
INSTANCE Bloody_Claws (C_Item)
{
	name 				=	"Krwawe szpony";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	5000;

	damageTotal 		= 	50;
	damagetype 			= 	DAM_MAGIC;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_MANA;
	cond_value[2]  		= 	100;

	visual 				=	"CLAWS01.MMS";
	on_equip			=	Bloody_Claws_E;
	on_unequip			=	Bloody_Claws_UE;
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	COUNT[5]			= value;
};
//NEW 
/***********************************************************/
INSTANCE William_Sword (WeaponsMelee)
{	
	name 				=	"Miecz Williama";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	160;
	damagetype 			= 	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160; 
	cond_value[2]  		=	(3*cond_value[2])/2-((3*cond_value[2])/2)%1; 
	visual 				=	"ItMw_2H_Sword_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//ALTES LAGER
/***********************************************************/
//THORUS
//------------------------------------------------------------------
INSTANCE Thorus_Schwert (WeaponsMelee)
{
	name 				=	"Miecz Thorusa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	180;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	155;

	owner 				= 	GRD_200_THORUS;
	visual 				=	"ItMw_2H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//GOMEZ
//-----------------------------------------------------------
INSTANCE Innos_Zorn (WeaponsMelee)
{
	name 				=	"Gniew Innosa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	225;
	damagetype			=	DAM_EDGE;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	190;

	owner 				= 	EBR_100_GOMEZ;
	visual 				=	"ItMw_2H_Sword_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//SCAR
//-----------------------------------------------------------
INSTANCE Scars_Schwert (WeaponsMelee)
{
	name 				=	"Miecz Blizny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	460;

	damageTotal 		= 	200;//-12
	damagetype 			= 	      DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	224;

	owner 				=   EBR_101_SCAR;
	visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	COUNT[5]			= value;
};

//-----------------------------------------------------------
//ARTO
//-----------------------------------------------------------
INSTANCE Artos_Schwert (WeaponsMelee)
{
	name 				=	"Miecz Arto";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	360;

	damageTotal 		= 	162;
	damagetype 			= 	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;

	owner 				= 	EBR_102_ARTO;
	visual 				=	"ItMw_1H_Sword_Long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RAVEN
//-----------------------------------------------------------
INSTANCE Rabenrecht (WeaponsMelee)
{
	name 				=	"Prawo Kruka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	175;
	damagetype 			= 	   DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	176;
                               
	owner 				= 	EBR_105_RAVEN;
	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BARTHOLO
//-----------------------------------------------------------
INSTANCE Prankenhieb (WeaponsMelee)
{
	name 				=	"Cios ³ap¹";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	137;
	damagetype 			= 	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	128;
                               
	owner 				= 	EBR_106_BARTHOLO;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//DIEGO
//-----------------------------------------------------------
INSTANCE Diegos_Bogen (Bow)
{
	name 				= "£uk Diego";

	mainflag 			= ITEM_KAT_FF;
	flags 				= ITEM_BOW;
	material 			= MAT_WOOD;

	value 				= 390;

	damageTotal 		= 70;
	damagetype			= DAM_POINT;
	munition			= ItAmArrow;

	cond_atr[2]   		= ATR_DEXTERITY;
	cond_value[2]  		= 45;

	owner 				= PC_THIEF;
	visual 				= "ItRwLongbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//Whistler (Bei Fisk)
//-----------------------------------------------------------
INSTANCE Whistlers_Schwert (WeaponsMelee)
{
	name 				=	"Miecz Œwistaka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			= 	50;
	damagetype 			= 	  DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	48;
	//owner 				  = STT_309_Whistler;		raus wegen Mission
	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/***********************************************************/
//BRUDERSCHAFT
/***********************************************************/
//-----------------------------------------------------------
//Y'BERION
//-----------------------------------------------------------
INSTANCE Stab_des_Lichts (WeaponsMelee)
{
	name 				=	"Kostur œwiat³a";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			= 	65;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	144;
                               
	visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR KALOM
//-----------------------------------------------------------
INSTANCE Kaloms_Schwert (WeaponsMelee)
{
	name 				=	"Miecz Kaloma";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	175;
	damagetype 			= 	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	176;
                               
	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LESTER
//-----------------------------------------------------------
INSTANCE Streitschlichter (WeaponsMelee)
{
	name 				=	"Negocjator Lestera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   150;
	damagetype			=	   DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	128;
                               
	owner 				= 	PC_PSIONIC;
	visual 				=	"ItMw_1H_Mace_War_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR ANGAR
//-----------------------------------------------------------
INSTANCE Roter_Wind (WeaponsMelee)
{
	name 				=	"Czerwony wiatr";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	210;
	damagetype			=	DAM_EDGE;
	range    			=  	140;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	visual 				=	"ItMw_2H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL NAMIB
//-----------------------------------------------------------
INSTANCE Namibs_Keule (WeaponsMelee)
{
	name 				=	"Pa³ka Namiba";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			=   137;
	damagetype			=	   DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	128;
                               
	visual 				=	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL ORUN
//-----------------------------------------------------------
INSTANCE Oruns_Keule (WeaponsMelee)
{
	name 				=	"Pa³ka Oruna";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	330;

	damageTotal  		=   150;
	damagetype			=	   DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;
                               
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//FORTUNO
//-----------------------------------------------------------
INSTANCE Fortunos_Keule (WeaponsMelee)
{
	name 				=	"Pa³ka Fortuno";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			=   50;
	damagetype			=	  DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	48;
                              
	visual 				=	"ItMw_1H_Mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/***********************************************************/
//NEUES LAGER
/***********************************************************/
//-----------------------------------------------------------
//LEE
//-----------------------------------------------------------
INSTANCE Lees_Axt (WeaponsMelee)
{
	name 				=	"Topór Lee";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	560;

	damageTotal			= 	210;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	190;

	owner 				= 	SLD_700_LEE;
	visual 				=	"ItMw_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//ORIK
//-----------------------------------------------------------
INSTANCE Oriks_Axt (WeaponsMelee)
{
	name 				=	"Topór Orika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	540;

	damageTotal			= 	190;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	180;

	owner 				=   SLD_701_ORIK;
	visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//TORLOF
//-----------------------------------------------------------
INSTANCE Torlofs_Axt (WeaponsMelee)
{
	name 				=	"Topór Torlofa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	198;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	owner 				= 	SLD_737_TORLOF;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//CORD
//-----------------------------------------------------------
INSTANCE Cords_Spalter (WeaponsMelee)
{
	name 				=	"Siekacz Corda";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	310;

	damageTotal			=   150;
	damagetype			=	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;
                               
	owner 				= 	SLD_709_CORD;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//GORN
//-----------------------------------------------------------
INSTANCE Gorns_Rache (WeaponsMelee)
{
	name 				=	"Zemsta Gorna";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	560;

	damageTotal			= 	200;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	owner 				=    PC_FIGHTER;
	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LARES
//-----------------------------------------------------------
INSTANCE Lares_Axt (WeaponsMelee)
{
	name 				=	"Topór Laresa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   162;
	damagetype			=	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	144;
                               
	owner 				= 	SLV_907_Lares;
	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//WOLF
//-----------------------------------------------------------
INSTANCE Wolfs_Bogen (Bow)
{
	name 				=	"£uk Wilka";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	200;

	damageTotal			=	35;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;

	owner 				=   ORG_855_WOLF;
	visual 				=	"ItRwLongbow.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//SILAS
//-----------------------------------------------------------
INSTANCE Silas_Axt (WeaponsMelee)
{
	name 				=	"Topór Silasa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	290;

	damageTotal			=   137;
	damagetype			=	   DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	128;
                               
	owner 				=   ORG_841_SILAS;
	visual 				=	"ItMw_1H_Axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RICELORD
//-----------------------------------------------------------
INSTANCE Heerscherstab (WeaponsMelee)
{
	name 				=	"Ber³o";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	150;

	damageTotal			= 	52;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

//	owner 				=   BAU_900_RICELORD;
	visual 				=	"ItMw_2H_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//PIRAT'S & HUNTERS
//RICK
//------------------------------------------------------------------
INSTANCE Rick_Axe_1 (WeaponsMelee)
{
	name 				=	"Topór Ricka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//900;//454
	
	damageTotal			= 	27;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_1H_Axe_Old_01.3DS";

	description			= name;
	TEXT[1]				= "To mój topór, morze go nie oszczêdzi³o";	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
INSTANCE Rick_Axe_2a (WeaponsMelee)
{	
	name 				=	"Topór Ricka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	750;//1200;//595
	
	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
	visual 				=	"ItMw_1H_Axe_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2]				= "To mój topór, Aidan go naprawi³";	
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Rick_Axe_2b (WeaponsMelee)
{	
	name 				=	"Topór Ricka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	750;//1200;//595
	
	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_2H_Axe_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[1]				= "To mój topór, Aidan go naprawi³";	
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Rick_Axe_3a (WeaponsMelee)
{	
	name 				=	"Topór Ricka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1250;//1200;//595
	
	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_2H_Axe_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[1]				= "To mój topór, ulepszy³em go dziêki Fakegem";	
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Rick_Axe_3b (WeaponsMelee)
{	
	name 				=	"Topór Ricka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1250;//1200;//595
	
	damageTotal			= 	125;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;
	visual 				=	"ItMw_2H_Axe_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[1]				= "To mój topór, ulepszy³em go dziêki Fakegem";		
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Rick_Rune_3c (WeaponsMelee)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1250;

	visual				=	"ItAr_Rune_18.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHTNING_BIG;
	mag_circle 			= 	6;

	description			=	"Runa która stworzy³ Meriures z FakeGem";
	TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	SPL_SENDCAST_FIRERAIN;
	TEXT	[2]			=	NAME_Dam_Fire;				COUNT	[2]		=	SPL_DAMAGE_FIRERAIN;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};
/******************************************************************************************/
INSTANCE Hank_Crossbow(CrossBow)
{
	name 				=	"Kusza Hanka";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	value 				=	2600;//650;

	damageTotal			= 	60;
	damagetype			=	DAM_POINT;
	munition			=	ItAmBolt;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	55;
	visual 				=	"ItRwCrossbow3.mms";
	owner 				= 	PIR_2601_Hank;
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// Cipher
INSTANCE Chiper_Bow (Bow)
{
	name 				=	"D³ugi ³uk Ciphera";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	140;//120;

	damageTotal			=	60;
	damagetype			=	DAM_POINT;
	munition			=	ItAmArrow;
	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	35;
	visual 				=	"ItRw_Bow_Long_01.mms";
	owner 				= 	ORG_873_Cipher;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Garry_Sword (WeaponsMelee) 
{	
	name 				=	"Miecz Garrego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;//1100;//550

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;
	visual 				=	"ItMw_2H_Sword_Light_03.3DS";
	owner 				= 	RBL_2605_Garry;
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Hank_Sword (WeaponsMelee)
{	
	name 				=	"Kordelas Hanka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	250;

	damageTotal  		= 	150;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;		
	owner 				= 	PIR_2601_Hank;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	150;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Antus_Axe (WeaponsMelee)
{	
	name 				=	"'Toporek' Angusa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	450;//2030;//1015
	
	damageTotal			= 	180;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	185;
	visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


// keine NPCs
INSTANCE GhostSword1 (WeaponsMelee) 
{	
	name 				=	"";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	40;
	damagetype			=	DAM_MAGIC;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	88;
	  visual 				=	"";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE GhostAxe1_RICK (WeaponsMelee) 
{	
	name 				=	"Ostrze zmierzchu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	0;

// 	damageTotal			= 	40;
// 	damagetype			=	DAM_MAGIC;
// 	range    			=  	150;		

// 	cond_atr[2]   		= 	ATR_STRENGTH;
// 	cond_value[2]  		= 	88;
	visual 				=	"GhostAxe.zen";

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE GhostAxe1 (WeaponsMelee) 
{	
	name 				=	"Ostrze zmierzchu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	40;
	damagetype			=	DAM_MAGIC;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	88;
	  visual 				=	"GhostAxe.zen";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//-----------------------------------------------------------
//COR ANGAR
//-----------------------------------------------------------
INSTANCE Earl_Sword (WeaponsMelee)
{
	name 				=	"Hrabstwo Hrabiego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	205;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	180;

	owner 				= 	GRD_4010_HRABIA;
	visual 				=	"ItMw_2H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};