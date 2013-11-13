/*******************************************************************************************
**	Rüstungswert-Multiplikator	                                         				  **
*******************************************************************************************/
const int ARMOR_VALUE_MULTIPLIER	= 30;	// wird mit Schutzwert gegen EDGE-Schaden multipliziert
const int ARMOR_MIN_VALUE	=	500;

const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;

const int VALUE_STT_ARMOR_M =  750;
const int VALUE_STT_ARMOR_H = 1200;

const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 2100;

const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;

const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2100;

const int VALUE_ORG_ARMOR_L =  750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;

const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2100;

const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;

const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;

const int VALUE_SFB_ARMOR_L = 250;

const int value_pir_armor_m = 1800;
const int VALUE_HUN_ARMOR_M = 7150;
const int VALUE_HUN_ARMOR_H = 8200;
const int VALUE_HUN_ARMOR_H2 = 9500;

/*******************************************************************************************
**	OldCamp	                                         	  		 						  **
*******************************************************************************************/
/******************************************************************************************/
// Volk
INSTANCE TEST_HELM(C_Item)
{
	name 					=	"helm";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection[PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_HEAD;
 
	visual 					=	"helm_final.3ds";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
INSTANCE VLK_ARMOR_L(C_Item)
{
	name 					=	"Lekkie spodnie kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	2; 
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0; 

	value 					=	ARMOR_MIN_VALUE+item.protection[PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"vlkl.3ds";
	visual_change 			=	"Hum_VLKL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	vlk;
	on_unequip			=	vlk1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE VLK_ARMOR_M(C_Item)
{
	name 					=	"Spodnie kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	5; 
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"vlkm.3ds";
	visual_change 			=	"Hum_VLKM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	vlk;
	on_unequip			=	vlk1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID vlk()
{
	//Mdl_ApplyOverlayMds	(hero,"Humans_Tired.mds");
};
	
FUNC VOID vlk1()
{
	//Mdl_RemoveOverlayMDS	(hero,"Humans_Tired.mds");
};
/******************************************************************************************/
// Schatten

INSTANCE STT_ARMOR_M(C_Item)
{
	name 					=	"Strój cienia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sttm.3ds";
	visual_change 			=	"Hum_STTM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID stt()
{
	//Mdl_ApplyOverlayMds	(hero,"Humans_Relaxed.mds");
};

FUNC VOID stt1()
{
	//Mdl_RemoveOverlayMDS	(hero,"Humans_Relaxed.mds");
};
/******************************************************************************************/
INSTANCE STT_ARMOR_H(C_Item)
{
	name 					=	"Zbroja cienia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Gardisten		                                                  					 **

INSTANCE GRD_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja stra¿nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	30;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdl.3ds";
	visual_change 			=	"Hum_GRDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE GRD_ARMOR_M(C_Item)
{
	name 					=	"Zbroja stra¿nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35;
	protection [PROT_FIRE] 	= 	65;
	protection [PROT_MAGIC] = 	40;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdm.3ds";
	visual_change 			=	"Hum_GRDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GRD_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja stra¿nika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"grdh.3ds";
	visual_change 			=	"Hum_GRDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Erz-Barone		                                                 					  **

INSTANCE EBR_ARMOR_M(C_Item)
{
	name 					=	"Ozdobna szata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	20;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
   ownerGuild 				= 	GIL_GRD;

	visual 					=	"ebrm.3ds";
	visual_change 			=	"Hum_EBRM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_state[0]			=	ebr;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
	
FUNC VOID ebr()
{
	//Mdl_ApplyOverlayMds	(hero,"Humans_Arrogance.mds");
};
	
FUNC VOID ebr1()
{
	//Mdl_RemoveOverlayMDS	(hero,"Humans_Arrogance.mds");
};
/******************************************************************************************/
INSTANCE EBR_ARMOR_H(C_Item)
{
	name 					=	"Pancerz Gomeza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	180;
	protection [PROT_BLUNT] = 	180;
	protection [PROT_POINT] = 	65; 
	protection [PROT_FIRE] 	= 	125;
	protection [PROT_MAGIC] = 	70; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
  	ownerGuild 				= 	GIL_GRD;

	owner					=   EBR_100_GOMEZ;
	visual 					=	"ebrh.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_state[0]			=	ebr;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE EBR_ARMOR_H2(C_Item)
{
	name 					=	"Ciê¿ki pancerz magnata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	170;
	protection [PROT_BLUNT] = 	170;
	protection [PROT_POINT] = 	55; 
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	60; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GRD;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	on_state[0]			=	ebr;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/*******************************************************************************************
**	NewCamp 						                                        	  		  **
*******************************************************************************************/

/******************************************************************************************/
// Schürferbund

instance SFB_ARMOR_L(C_Item)
{
	name 					=	"Strój kreta";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	2 ;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	0 ;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	vlk;
	on_unequip			=	vlk1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Organisatoren

INSTANCE ORG_ARMOR_L(C_Item)
{
	name 					=	"Lekki strój szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5 ;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgl.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ORG_ARMOR_M(C_Item)
{
	name 					=	"Strój szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgm.3ds";
	visual_change 			=	"Hum_ORGM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
/******************************************************************************************/
INSTANCE ORG_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ki strój szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	17;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	15;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE SLD_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT]	= 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	=	40;
	protection [PROT_MAGIC] = 	30;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"Hum_SLDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	//on_equip			=	stt;
	//on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
instance SLD_ARMOR_M(C_Item)
{
	name 					=	"Zbroja najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35 ;
	protection [PROT_FIRE] 	= 	65 ;
	protection [PROT_MAGIC] = 	40 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"sldm.3ds";
	visual_change 			=	"Hum_SLDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE SLD_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja najemnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	50 ;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	PsiCamp 		                                               	  					  **
*******************************************************************************************/

/******************************************************************************************/
// Novizen

INSTANCE NOV_ARMOR_L(C_Item)
{
	name 					=	"Przepaska nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   25;
	protection [PROT_BLUNT] = 	25;
	protection [PROT_POINT] = 	5 ;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	0 ;
                                    
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE NOV_ARMOR_M(C_Item)
{
	name 					=	"Lekka zbroja nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5 ;
	wear 					=	  WEAR_TORSO;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	visual 					=	"novm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
	
FUNC VOID nov()
{
	//Mdl_ApplyOverlayMds	(hero,"Humans_Mage.mds");
};
	
FUNC VOID nov1()
{
	//Mdl_RemoveOverlayMDS	(hero,"Humans_Mage.mds");
};

/******************************************************************************************/
INSTANCE NOV_ARMOR_H(C_Item)
{
	name 					=	"Zbroja nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"Hum_NOVS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Templer

INSTANCE TPL_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	30;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Hum_TPLL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_M(C_Item)
{
	name 					=	"Zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35 ;
	protection [PROT_FIRE] 	= 	65 ;
	protection [PROT_MAGIC] = 	40 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Hum_TPLM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	50 ;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Gurus

INSTANCE GUR_ARMOR_M(C_Item)
{
	name 					=	"Szata Guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	160;
	protection [PROT_BLUNT] = 	160;
	protection [PROT_POINT] = 	60 ;
	protection [PROT_FIRE] 	= 	110;
	protection [PROT_MAGIC] = 	60 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GUR;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GUR_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata Guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	170;
	protection [PROT_BLUNT] = 	170;
	protection [PROT_POINT] = 	55 ;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	60 ;
	wear 					=	   WEAR_TORSO;

 	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

   ownerGuild 				= 	GIL_GUR;
	visual 					=	"gurh.3ds";
	visual_change 			=	"Hum_GURS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/*******************************************************************************************
**	MAGIER		                                                  						**
*******************************************************************************************/

/******************************************************************************************/
// Feuermagier

INSTANCE KDF_ARMOR_L(C_Item)
{
	name 					=	"Szata ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	65;
	protection [PROT_MAGIC] = 	50;
	wear 					=	  WEAR_TORSO;

 	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_KDFL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE KDF_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata ognia";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	30 ;
	protection [PROT_FIRE] 	= 	80 ;
	protection [PROT_MAGIC] = 	75 ;
	wear 					=	WEAR_TORSO;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Wassermagier

INSTANCE KDW_ARMOR_L(C_Item)
{
	name 					=	"Szata wody";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT] = 	100;
	protection [PROT_POINT] = 	30 ;
	protection [PROT_FIRE] 	= 	70 ;
	protection [PROT_MAGIC] = 	75 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"kdwl.3ds";
	visual_change 			=	"Hum_KDWL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE KDW_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata wody";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35 ;
	protection [PROT_FIRE] 	= 	85 ;
	protection [PROT_MAGIC] = 	80 ;
	wear 					=	WEAR_TORSO;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	visual 					=	"kdwh.3ds";
	visual_change 			=	"Hum_KDWS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Dämonenbeschwörer

INSTANCE DMB_ARMOR_M(C_Item)
{
	name 					=	"Szata mrocznych sztuk";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	50;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	80;

	wear 					=	WEAR_TORSO;

 	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_DMBM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	Spezial-Rüstungen                                                                     **
*******************************************************************************************/

// FIXME: hier fehlen noch die Visuals für die Erz-Rüstungen und das INV-Item für die CRAWLERPLATTEN-RÜSTUNG 

// Crawler-Plattenrüstung
INSTANCE CRW_ARMOR_H(C_Item)
{
	name 					=	"Zbroja z pancerzy pe³zaczy";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	130;
	protection [PROT_BLUNT] = 	130;
	protection [PROT_POINT] = 	40; 
	protection [PROT_FIRE] 	= 	70; 
	protection [PROT_MAGIC] = 	40; 
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
	visual 					=	"crws.3ds";
	visual_change 			=	"Hum_CRAWLER_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;
	on_equip			=	ebr;
	on_unequip			=	ebr1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Erz-Rüstungen
INSTANCE ORE_ARMOR_M(C_Item)
{
	name 					=	"Staro¿ytna zbroja magiczna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	180;
	protection [PROT_BLUNT] = 	180;
	protection [PROT_POINT] = 	90;
	protection [PROT_FIRE] 	= 	140;
	protection [PROT_MAGIC] = 	90;
                                      
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40; // x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;
	description				=	name;
	TEXT[0]					=	"Tê staro¿ytn¹ zbrojê wykonano z magicznej rudy.";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ORE_ARMOR_H(C_Item)
{
	name 					=	"Wzmocniona zbroja magiczna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	200;
	protection [PROT_BLUNT] = 	200;
	protection [PROT_POINT] = 	100;
	protection [PROT_FIRE] 	= 	150;
	protection [PROT_MAGIC] = 	100;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;	// x2 weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_WOOD;

	description				=	name;
	TEXT[0]					=	"Kowal Stone poprawi³ jeszcze t¹ staro¿ytn¹ zbrojê!";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	Der Richter                                                                       **
*******************************************************************************************/
INSTANCE LAW_ARMOR (C_Item)
{
	name 					=	"Szata sêdziego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_DMB;

	visual 					=	"dmbm.3ds";
	visual_change 			=	"Hum_LAW_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/*******************************************************************************************
**	Wache für Intro-Cutscene                                                          **
*******************************************************************************************/
INSTANCE GRD_ARMOR_I(C_Item)
{
	name 					=	"Pancerz stra¿y królewskiej";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35;
	protection [PROT_FIRE] 	= 	65;
	protection [PROT_MAGIC] = 	40;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GRD;

	visual 					=	"grdi.3ds";
	visual_change 			=	"Hum_GRDI_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	//on_equip			=	grd;
	// on_unequip			=	grd1;
	// description				=	name; 
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};



/*******************************************************************************************
**	Nackte Babes
*******************************************************************************************/
INSTANCE BAB_ARMOR_NUDE (C_Item)
{
	name 					=	"Nacktes Babe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
};

/******************************************************************************************/
INSTANCE BAB_ARMOR_BIKINI (C_Item)
{
	name 					=	"bikini babe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
};
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
//	|\  |   |===     |   |
//	| \ |	|--	     |   |
//	|  \|	|___     \/\/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/
/******************************************************************************************/

INSTANCE HUN_ARMOR_M2 (C_Item)
{
	name 					=	"Myœliwska zbroja szkodnika";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;


	visual 					=	"orgm.3ds";
	visual_change 			=	"Hum_ORGM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE HCG_ARMOR_H(C_Item)
{
	name 					=	"Elitarna zbroja";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	30;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	5;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE HUNSTT_ARMOR_H(C_Item)
{
	name 					=	"Myœliwska zbroja cieni";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE cavalorn_ARMOR(C_Item)
{
	name 					=	"Zbroja Cavalorna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	75;
	protection [PROT_FIRE] 	= 	60;
	protection [PROT_MAGIC] = 	10;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
///////////////////////////////////////////////////////////
///  ARMOR 4 DENMAR
//////////////////////////////////////////////////////////
INSTANCE DENMAR_ARMOR(C_Item)
{
	name 					=	"Przepaska Denmar'a";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   65;
	protection [PROT_BLUNT] = 	65;
	protection [PROT_POINT] = 	60;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	70;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE PIR_ARMOR_Rick(C_Item)
{
	name 					=	"Moje ubranie";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	5;
	protection [PROT_BLUNT] = 	5;
	protection [PROT_POINT] = 	1;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_L_Addon.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE PIR_ARMOR_L(C_Item)
{
	name 					=	"Ubranie pirata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	2; 
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_L_Addon.3ds";
	visual_change 			=	"Armor_PIR_L_Addon.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE PIR_ARMOR_M(C_Item)
{
	name 					=	"Zbroja pirata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PIR_M_Addon.3ds";
	visual_change 			=	"Armor_PIR_M_Addon.asc";
	visual_skin 			=	3;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ALG_ARMOR(C_Item)
{//Jack Aligator
	name 					=	"Zbroja ze skóry aligatora";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	5; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"Hun_Short_Armor.3ds";
	visual_change 			=	"Hun_Short_Armor.asc";
	visual_skin 			=	1;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
/********R-E-B-E-L******R-E-B-E-L********R-E-B-E-L*******R-E-B-E-L********R-E-B-E-L********/
/******************************************************************************************/
INSTANCE RBL_ARMOR_L(C_Item)
{
	name 					=	"Ubranie rebelianta";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50;
	protection [PROT_BLUNT] = 	50;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5; 
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Leather_L.3ds";
	visual_change 			=	"RBL_ARMOR_L.asc";
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE RBL_ARMOR_M(C_Item)
{
	name 					=	"Strój rebelianta";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70;
	protection [PROT_BLUNT] = 	70;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"Hun_Short_Armor.3ds";
	visual_change 			=	"Hun_Short_Armor.asc";
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE RBL_ARMOR_H(C_Item)
{
	name 					=	"Zbroja rebelianta";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80;
	protection [PROT_BLUNT] = 	80;
	protection [PROT_POINT] = 	17;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	15;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgl.3ds";
	visual_change 			=	"Hum_ORGL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/

/******************************************************************************************/
INSTANCE HUN_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT]	= 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	=	40;
	protection [PROT_MAGIC] = 	30;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"HUN_ARMOR_L.asc";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE HUN_ARMOR_M(C_Item)
{
	name 					=	"Œrednia zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT]	= 	120;
	protection [PROT_POINT] = 	35; 
	protection [PROT_FIRE] 	=	65; 
	protection [PROT_MAGIC] = 	40; 
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Leather_L.3ds";
	visual_change 			=	"HUN_ARMOR_M.asc";
	//visual_skin 			=	1;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE HUN_ARMOR_H2(C_Item)
{
	name 					=	"Ulepszona ciê¿ka zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT]	= 	150;
	protection [PROT_POINT] = 	50; 
	protection [PROT_FIRE] 	=	100;
	protection [PROT_MAGIC] = 	50; 
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
//	visual_change 			=	"HUN_ARMOR_H.asc";HUM_Armor_HunH.ASC
	visual_change 			=	"HUM_HUNH_ARMOR.asc";
	visual_skin 			=	0;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE HUN_ARMOR_H3(C_Item)
{
	name 					=	"Ciê¿ka zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	140;
	protection [PROT_BLUNT]	= 	140;
	protection [PROT_POINT] = 	40; 
	protection [PROT_FIRE] 	=	90;
	protection [PROT_MAGIC] = 	35; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
//	visual_change 			=	"HUN_ARMOR_H.asc";HUM_Armor_HunH.ASC
	visual_change 			=	"HUM_HUNH_V2_ARMOR.asc";
	visual_skin 			=	0;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE HUN_ARMOR_H4(C_Item)
{
	name 					=	"Ciê¿ka zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	140;
	protection [PROT_BLUNT]	= 	140;
	protection [PROT_POINT] = 	40; 
	protection [PROT_FIRE] 	=	90; 
	protection [PROT_MAGIC] = 	35; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
//	visual_change 			=	"HUN_ARMOR_H.asc";HUM_Armor_HunH.ASC
	visual_change 			=	"HUM_HUNH_V2_ARMOR.asc";
	visual_skin 			=	1;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
INSTANCE HUN_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja myœliwego";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	140;
	protection [PROT_BLUNT]	= 	140;
	protection [PROT_POINT] = 	40; 
	protection [PROT_FIRE] 	=	90; 
	protection [PROT_MAGIC] = 	35; 

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
//	visual_change 			=	"HUN_ARMOR_H.asc";HUM_Armor_HunH.ASC
	visual_change 			=	"HUM_HUNH_V1_ARMOR.asc";
	visual_skin 			=	1;	
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

//--------------------------------
// RBL CAMP MAGES
//--------------------------------
INSTANCE MAG_ARMOR_L(C_Item)
{
	name 					=	"Szata maga";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100;
	protection [PROT_BLUNT]	= 	100;
	protection [PROT_POINT] = 	30; 
	protection [PROT_FIRE] 	=	80; 
	protection [PROT_MAGIC] = 	75; 
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"kdfl.3ds";
	visual_change 			=	"Hum_KDFL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE MAG_ARMOR_H(C_Item)
{
	name 					=	"Zdobiona szata maga";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT]	= 	120;
	protection [PROT_POINT] = 	35 ;
	protection [PROT_FIRE] 	=	85 ;
	protection [PROT_MAGIC] = 	80 ;
	wear 					=	WEAR_TORSO;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	visual 					=	"kdfh.3ds";
	visual_change 			=	"Hum_KDFS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE HUM_NEWARMOR(C_Item)
{
	name 					=	"Lekkie spodnie kopacza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"vlkl.3ds";
	visual_change 			=	"HUM_NEWARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip			=	vlk;
	on_unequip			=	vlk1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

// DrachenJager test
/******************************************************************************************/
INSTANCE NONE_ARMOR_M1(C_Item)
{
	name 					=	"Zbroja wujka D¿ona";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	170;
	protection [PROT_BLUNT]	= 	170;
	protection [PROT_POINT] = 	55 ;
	protection [PROT_FIRE] 	=	120;
	protection [PROT_MAGIC] = 	60 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_DJG_H.3ds";
	visual_change 			=	"NONE_ARMOR_M1.asc";
	visual_skin 			=	2;	
	material 				=	MAT_METAL;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE DJG_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja ³owcy smoków";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	170;
	protection [PROT_BLUNT] = 	170;
	protection [PROT_POINT] = 	55 ;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	60 ;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"ItAr_DJG_H.3ds";
	visual_change 			=	"Armor_DJG_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
//----------------------------------------
// PALADIN ARMOR - MISSION
//----------------------------------------
INSTANCE PAL_ARMOR_B_H(C_Item)
{
	name 					=	"Zbroja paladyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150;
	protection [PROT_BLUNT] = 	150;
	protection [PROT_POINT] = 	50 ;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_HUN;

	visual 					=	"ItAr_PAL_H.3ds";
	visual_change 			=	"Armor_PAL_NEW.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]					=	"Wygl¹da jak nowa";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
INSTANCE PAL_ARMOR_A_H(C_Item)
{
	name 					=	"Zbroja paladyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90;
	protection [PROT_BLUNT] = 	90;
	protection [PROT_POINT] = 	20;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	30;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_HUN;

	visual 					=	"ItAr_PAL_H_RUSTY.3ds";
	visual_change 			=	"Armor_PAL_RUSTY.asc";
	visual_skin 			=	1;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]					=	"Kowal Aidan przywróci³ jej czêœæ dawnego blasku";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
INSTANCE PAL_ARMOR_OLD_H(C_Item)
{
	name 					=	"Zniszczona zbroja paladyna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT] = 	40;
	protection [PROT_POINT] = 	10;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	5;
                                  
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_HUN;

	visual 					=	"ItAr_PAL_H_OLD.3ds";
	visual_change 			=	"Armor_PAL_OLD.asc";
	visual_skin 			=	2;
	material 				=	MAT_METAL;

	description				=	name;
	TEXT[0]				=	"Zbroja jest zniszczona";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

//----------------------------------------
//   	Z O M B I E S
//----------------------------------------
// Novizen

INSTANCE ZOM_NOV_ARMOR_L(C_Item)
{
	name 					=	"Przepaska nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   5;
	protection [PROT_BLUNT] = 	5;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	TEXT[0]				=	"Przepaska ca³a zafajdana krwi¹";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE ZOM_NOV_ARMOR_M(C_Item)
{
	name 					=	"Lekka zbroja nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	8;
	protection [PROT_BLUNT] = 	8;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;
	wear 					=	WEAR_TORSO;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

 
	visual 					=	"novm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	TEXT[0]				=	"Zbroja jest ca³a we krwi!";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};


/******************************************************************************************/
INSTANCE ZOM_NOV_ARMOR_H(C_Item)
{
	name 					=	"Zbroja nowicjusza";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	1;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"Hum_NOVS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	TEXT[0]				=	"Ta zbroja jest brudna i czerwona od krwi!";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Templer

INSTANCE ZOM_TPL_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	2;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Hum_TPLL_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	TEXT[0]				=	"Zbroja œmierdzi i jest zakrwawiona";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ZOM_TPL_ARMOR_M(C_Item)
{
	name 					=	"Zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35;
	protection [PROT_BLUNT] = 	35;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	1;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Hum_TPLM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	description				=	name;
	TEXT[0]				=	"Zbroja by³a noszona przez zombi.";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ZOM_TPL_ARMOR_H(C_Item)
{
	name 					=	"Ciê¿ka zbroja œwi¹tynna";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55;
	protection [PROT_BLUNT] = 	55;
	protection [PROT_POINT] = 	1;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]				=	"Zbroja jest zniszczona i ca³a zakrwawiona!";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
// Gurus

INSTANCE ZOM_GUR_ARMOR_M(C_Item)
{
	name 					=	"Szata Guru";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	60;
	protection [PROT_BLUNT] = 	60;
	protection [PROT_POINT] = 	1;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	2;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;
    ownerGuild 				= 	GIL_GUR;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	nov;
	on_unequip			=	nov1;
	TEXT[0]				=	"Szata przesi¹k³a zapachem krwi.";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
//--------------------
// BABE's ARMOR's
//--------------------
/******************************************************************************************/
// Vlk

INSTANCE BAB_ARMOR_VLK0(C_Item)
{
	name 					=	"Ubranie kobiety";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"ARMOR_VLKBABE_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE BAB_ARMOR_VLK1(C_Item)
{
	name 					=	"Ubranie kobiety";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"ARMOR_VLKBABE_L.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE BAB_ARMOR_VLK2(C_Item)
{
	name 					=	"Ubranie kobiety";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	15;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	5;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"ARMOR_VLKBABE_L.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;
	TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
// Bau

INSTANCE BAB_ARMOR_BAU0(C_Item)
{
	name 					=	"Ubranie kobiety";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	1;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurh.3ds";
	visual_change 			=	"ARMOR_BAUBABE_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE BAB_ARMOR_BAU1(C_Item)
{
	name 					=	"Ubranie kobiety";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	20;
	protection [PROT_BLUNT] = 	20;
	protection [PROT_POINT] = 	7;
	protection [PROT_FIRE] 	= 	1;
	protection [PROT_MAGIC] = 	0;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurh.3ds";
	visual_change 			=	"ARMOR_BAUBABE_L.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};
/******************************************************************************************/
/******************************************************************************************/
INSTANCE SMITH_ARMOR(C_Item)
{
	name 					=	"Ubranie kowala";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40;
	protection [PROT_BLUNT]	= 	40;
	protection [PROT_POINT] = 	15;
	protection [PROT_FIRE] 	=	10;
	protection [PROT_MAGIC] = 	1;

	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"Hun_Short_Armor.3ds";
	visual_change 			=	"Armor_Smith.asc";
	visual_skin 			=	1;
	material 				=	MAT_METAL;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE TH_ARMOR_L(C_Item)
{
	name 					=	"Lekka zbroja ³owcy trolli";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120;
	protection [PROT_BLUNT] = 	120;
	protection [PROT_POINT] = 	35; 
	protection [PROT_FIRE] 	= 	65; 
	protection [PROT_MAGIC] = 	40; 
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	1;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE TH_ARMOR_H(C_Item)
{
	name 					=	"Zbroja ³owcy trolli";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	170;
	protection [PROT_BLUNT] = 	170;
	protection [PROT_POINT] = 	55 ;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	60 ;
                                   
	value 					=	ARMOR_MIN_VALUE+item.protection [PROT_EDGE]*10+item.protection [PROT_BLUNT]*10+item.protection [PROT_POINT]*20+item.protection [PROT_FIRE]*30+item.protection [PROT_MAGIC]*40;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldh.3ds";
	visual_change 			=	"Hum_SLDS_ARMOR.asc";
	visual_skin 			=	2;
	material 				=	MAT_LEATHER;
	on_equip			=	stt;
	on_unequip			=	stt1;
	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE];
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT];
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};