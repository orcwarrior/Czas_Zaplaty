// ************************************************************************************************
// Heilwirkung und Kosten von Nahrung
// ************************************************************************************************
const int	Value_Waldbeeren	=	5;		const int	hp_Waldbeeren		=	10;
const int	Value_Flammendorn	=	6;		const int	hp_Flammendorn		=	12;
const int	Value_Seraphis		=	7;		const int	hp_Seraphis			=	6;
const int	Value_Velayis		=	14;		const int	mp_Velayis			=	18;
const int	Value_Bergmoos		=	56;		const int	hp_Bergmoos			=	40; const int	mp_Bergmoos			=	40;
const int	Value_Grabmoos		=	10;		const int	mp_Grabmoos			=	9;
const int	Value_Nachtschatten	=	11;		const int	hp_Nachtschatten	=	22;
const int	Value_Mondschatten	=	11;		const int	hp_Mondschatten		=	23;
const int	Value_Orkblatt		=	13;		const int	hp_Orkblatt			=	26;
const int	Value_Eichenblatt	=	14;		const int	hp_Eichenblatt		=	28;

const int	Value_Höllenpilz	=	 3;		const int	hp_Höllenpilz		=	 6;
const int	Value_Sklavenbrot	=	 9;		const int	hp_Sklavenbrot		=	15;

const int	Value_Heilkräuter1	=	14;		const int	hp_Heilkräuter1		=	28;
const int	Value_Heilkräuter2	=	19;		const int	hp_Heilkräuter2		=	37;
const int	Value_Heilkräuter3	=	24;		const int	hp_Heilkräuter3		=	46;
const int	Value_PlantHPMAX			=	40;		const int	hp_HPMAX		=	57;
const int	Value_PlantHPPERM			=	200;		const int	hp_HPPERM		=	5;
// Fixme: Trollkirsche als Handelsware mit Wert?
const int	Value_Trollkirsche	=	30;		const int	hp_Trollkirsche		=	-20;

// Mana
const int	Value_Blutbuche		=	18;		const int	Mana_Blutbuche		=	5;
const int	Value_Turmeiche		=	46;		const int	Mana_Turmeiche		=	40;
const int	Value_Rabenkraut	=	28;		const int	Mana_Rabenkraut		=	20;
const int	Value_Dunkelkraut	=	200;	const int	Mana_Dunkelkraut	=	5;
const int	Value_Steimwurzel	=	20;		const int	Mana_Steinwurzel	=	25;
const int	Value_Drachenwurzel	=	37;		const int	Mana_Drachenwurzel	=	30;
const int	Value_Hop	=	8;				const int	Mana_Hop	=	4; const int	hp_Hop	=	3;
const int	Value_greyherb 		=	100;	const int	hp_greyherb 		=	5;
const int	Value_Permherb 		=	250;	const int	hp_Permherb 		=	5;
const int	Value_DEXPERM 		=	200;
const int	Value_STRPERM 		=	200;
const int	Value_Bloodherb 		=	9;	const int	Mana_Bloodherb 		=	7;
//**************************************************************************************/
//						PFLANZEN  PFLANZEN PFLANZEN
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Berrys_01(C_Item)
{	
	name 				=	"Jagody";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Waldbeeren;

	visual 				=	"ItFo_Plants_Berrys_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   UseBerrys;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Waldbeeren;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Waldbeeren;
};

		func void UseBerrys ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Waldbeeren);
			//Berrys_HP_Incease = 5;
			//Berrys_Needed = 32;
			//Berrys_Counter;//Inreasing Hp by ...
			if(!Npc_IsPlayer(self))
			{ return; };
			Berrys_Counter+=1;
			if(Berrys_Counter>=Berrys_Needed)&&(Berrys_Counter%Berrys_Needed==0)
			{
				B_AddAttributePoints(hero,ATR_HITPOINTS_MAX,Berrys_HP_Incease);
			}
			else if(Berrys_Counter==Berrys_Needed/2)
			{
				//Sher, zrob cos z tym :D
				PutMsg("Czujesz podnosz¹cy siê wigor...","font_default.tga",RGBAToZColor(255,155,155,255),_TIME_MESSAGE_LOGENTRY,"");
			};
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Beeren");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_Flameberry_01(C_Item)
{	
	name 				=	"Ogniocierñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Flammendorn;

	visual 				=	"ItFo_Plants_Flameberry_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Useflame;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_mana;				COUNT[1]	= 5;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Flammendorn;
};

		func void Useflame ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	5);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Flammendorn");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_Seraphis_01(C_Item)
{	
	name 				=	"Serafis";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Seraphis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useseraphis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Seraphis;
	TEXT[2]				= NAME_Bonus_mana;				COUNT[2]	= hp_Seraphis/2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Seraphis;
};

		func void Useseraphis ()
		{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Seraphis);
			B_ChangeAttribute	(self,	ATR_MANA,	hp_Seraphis/2);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Seraphis");
		};
/******************************************************************************************/
INSTANCE ItFo_Plants_Greyherb_01(C_Item)
{	
	name 				=	"Szare ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_greyherb;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Usegreyherb;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_greyherb;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_greyherb;
};

		func void Usegreyherb ()
		{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_greyherb);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse geyherbX_X");
		};		
/******************************************************************************************/
INSTANCE ItFo_Plants_Permherb_02(C_Item)
{	
	name 				=	"¯arnowiec";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Permherb;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Use_Permherb;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Permherb;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Permherb;
};

		func void Use_Permherb ()
		{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Permherb);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse ...mhmmm");
		};			
/******************************************************************************************/
INSTANCE ItFo_Plants_Hop_01(C_Item)
{	
	name 				=	"Chmiel";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Hop;

	visual 				=	"ItFo_Plants_Herb_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= UseHop;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Hop;
	TEXT[2]				= NAME_Bonus_mana;				COUNT[2]	= Mana_Hop/2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Hop;
};

		func void UseHop ()
		{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Hop);
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Hop);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Seraphis");
		};		
/******************************************************************************************/
// Steigerung von Seraphis

INSTANCE ItFo_Plants_Velayis_01(C_Item)
{	
	name 				=	"Velais";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Velayis;

	visual 				=	"ItFo_Plants_Seraphis_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= UseVelayis;	
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= mp_Velayis;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Velayis;
};

		func void UseVelayis ()
		{			
			B_ChangeAttribute	(self,	ATR_MANA,	mp_Velayis);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Velayis");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_mountainmoos_01(C_Item)
{	
	name 				=	"Górski mech";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Bergmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Bergmoos;
	TEXT[2]				= NAME_Bonus_mana;				COUNT[2]	= mp_Bergmoos;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bergmoos;
};

		func void Usemoos ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Bergmoos);
			B_ChangeAttribute	(self,	ATR_MANA,	mp_Bergmoos);
			
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Moos");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_mountainmoos_02(C_Item)
{	
	name 				=	"Mech nagrobny";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Grabmoos;

	visual 				=	"ItFo_Plants_mountainmoos_01.3ds";
	material 			=	MAT_WOOD;
	on_state [0]		=   Usemoos2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_mana;				COUNT[1]	= mp_Grabmoos;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Grabmoos;
};

		func void Usemoos2 ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	mp_Grabmoos);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse GrabMoos");
		};

/******************************************************************************************/
INSTANCE ItFo_Plants_Nightshadow_01(C_Item)
{	
	name 				=	"Psianka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Nachtschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usenight;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Nachtschatten;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Nachtschatten;
};

		func void Usenight ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Nachtschatten);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Nachtschatten");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_Nightshadow_02(C_Item)
{	
	name 				=	"Kocianka";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mondschatten;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usemoon;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Mondschatten;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Mondschatten;
};

		func void Usemoon ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Mondschatten);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Mondschatten");
		};
/******************************************************************************************/
INSTANCE ItFo_Plants_DEXPERM_01(C_Item)
{	
	name 				=	"Gadzie ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_DEXPERM;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usedexperm;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Dex;				COUNT[1]	= 1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_DEXPERM;
};

		func void Usedexperm ()
		{
			B_ChangeAttribute	(self,	ATR_DEXTERITY,	1);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Mondschatten");
		};	
/******************************************************************************************/
INSTANCE ItFo_Plants_strPERM_01(C_Item)
{	
	name 				=	"Ogrzyliœæ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_strPERM;

	visual 				=	"ItFo_Plants_Nightshadow_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]         = Usestrperm;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_str;				COUNT[1]	= 1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_strPERM;
};

		func void Usestrperm ()
		{
			B_ChangeAttribute	(self,	ATR_STRENGTH,	1);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Mondschatten");
		};				
/******************************************************************************************/
INSTANCE ItFo_Plants_OrcHerb_01(C_Item)
{	
	name 				=	"Orkowe ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Orkblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Useorc;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Orkblatt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Orkblatt;
};

		func void Useorc ()
		{	
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Orkblatt);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse orkblatt");
		};
		
/******************************************************************************************/
INSTANCE ItFo_Plants_OrcHerb_02(C_Item)
{	
	name 				=	"Liœæ dêbu";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Eichenblatt;

	visual 				=	"ItFo_Plants_OrcHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useorc2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Eichenblatt;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Eichenblatt;
};

		func void Useorc2 ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Eichenblatt);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Eichenblatt");
		};
		
/*****************************************************************************************/
//								PILZE
/*****************************************************************************************/
INSTANCE ItFo_Plants_mushroom_01(C_Item)
{	
	name 				=	"Piekielnik";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Höllenpilz;

	visual 				=	"ItFo_Plants_mushroom_01CZ.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Usemush;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Höllenpilz;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Höllenpilz;
};

		func void Usemush ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Höllenpilz);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Höllenpilz");
		};

/*****************************************************************************************/
INSTANCE ItFo_Plants_mushroom_02(C_Item)
{	
	name 				=	"Gorzki chleb";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Sklavenbrot;

	visual 				=	"ItFo_Plants_mushroom_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= 	Usemush2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Sklavenbrot;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Sklavenbrot;
};

		func void Usemush2 ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Sklavenbrot);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Sklavenbrot");
		};


/*****************************************************************************************/
//								HEILKRÄUTER
/*****************************************************************************************/
INSTANCE ItFo_Plants_Herb_01(C_Item)
{	
	name 				=	"Roœlina uzdrawiaj¹ca";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter1;

	visual 				=	"ItFo_Plants_Herb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants1;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Heilkräuter1;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter1;
};

	func void UsePlants1 ()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Heilkräuter1);
		//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilkräuter");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_02(C_Item)
{	
	name 				=	"Melisa lekarska";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter2;

	visual 				=	"ItFo_Plants_Herb_02.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Heilkräuter2;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter2;
};

		func void UsePlants2 ()
		{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Heilkräuter2);
		//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};

/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_03(C_Item)
{	
	name 				=	"Korzeñ leczniczy";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Heilkräuter3;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants3;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Heilkräuter3;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Heilkräuter3;
};

	func void UsePlants3 ()
	{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Heilkräuter3);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};
	
/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_HpMax(C_Item)
{	
	name 				=	"Ziele druidzkie";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_PlantHPMAX;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlants4;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_HPMAX;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_PlantHPMAX;
};

	func void UsePlants4 ()
	{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_HPMAX);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};
/******************************************************************************************/
INSTANCE ItFo_Plants_Herb_HpPerm(C_Item)
{	
	name 				=	"Ziele ¿ycia";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_PlantHPPERM;

	visual 				=	"ItFo_Plants_Herb_03.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=	UsePlantsHpPerm;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_HPPERM;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_PlantHPPERM;
};

	func void UsePlantsHpPerm ()
	{			
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_HPPERM);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Heilpflanzen");
	};	
/*****************************************************************************************/
//							MANAREG. PFLANZEN
/*****************************************************************************************/
instance ItFo_Plants_Bloodwood_01 (C_ITEM)
{	
	name 					=	"Nasienie czerwonego buka";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Blutbuche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Blutbuche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Blutbuche;                          	
};
                                       
		func void Useblood ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Blutbuche);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Blutbuchensamen");
		};   
		                                  
/******************************************************************************************/
instance ItFo_Plants_Towerwood_01 (C_ITEM)
{	
	name 					=	"Nasienie wysokiego dêbu";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Turmeiche;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;
	on_state[0]				=  Useblood2;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Turmeiche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Turmeiche;                    	
};                                        

		func void Useblood2 ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Turmeiche);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Turmeichensamen");
		};
		                 
/******************************************************************************************/
INSTANCE ItFo_Plants_RavenHerb_01 (C_Item)
{	
	name 				=	"Krucze ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Rabenkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			= Useraven;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Rabenkraut;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Rabenkraut;
};

		func void Useraven ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Rabenkraut);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Rabenkraut");
		}; 
		  
/******************************************************************************************/
INSTANCE ItFo_Plants_RavenHerb_02 (C_Item)
{	
	name 				=	"Czarne ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Dunkelkraut;

	visual 				=	"ItFo_Plants_RavenHerb_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useraven2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Dunkelkraut;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Dunkelkraut;
};

		func void Useraven2 ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Dunkelkraut);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Dunkelkraut");
		}; 
		 
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Stoneroot_01(C_Item)
{	
	name 				=	"Twardzieñ";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Steimwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Steinwurzel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Steimwurzel;
};

		func void Useroot ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Steinwurzel);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Steinwurzel");
		}; 
		
/******************************************************************************************/  
INSTANCE ItFo_Plants_Stoneroot_02(C_Item)
{	
	name 				=	"Dragrot";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Drachenwurzel;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   Useroot2;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Drachenwurzel;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Drachenwurzel;
};

		func void Useroot2 ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Drachenwurzel);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Drachenwurzel");
		}; 
		  
/******************************************************************************************/
//								GIFTPFLANZEN
/******************************************************************************************/
INSTANCE ItFo_Plants_Trollberrys_01(C_Item)
{	
	name 					=	"Trolest";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI;	

	value 					=	Value_Trollkirsche;

	visual 					=	"ItFo_Plants_Trollberrys_01.3ds";
	material 				=	MAT_WOOD;
	on_state [0]			=   UseTrollberrys;
	scemeName				=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= hp_Trollkirsche;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Trollkirsche;
};

		func void UseTrollberrys ()
		{
			B_ChangeAttribute	(self,	ATR_HITPOINTS,	hp_Trollkirsche);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Trollkirschen");
		};
/******************************************************************************************/ 
INSTANCE ItFo_Plants_Bloodherb_01(C_Item)
{	
	name 				=	"Krwawe ziele";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Bloodherb;

	visual 				=	"ItFo_Plants_Stoneroot_01.3ds";
	material 			=	MAT_WOOD;
	on_state[0]			=   UseBloodherb;
	scemeName			=	"FOOD";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;				COUNT[1]	= Mana_Bloodherb;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Bloodherb;
};

		func void UseBloodherb ()
		{
			B_ChangeAttribute	(self,	ATR_MANA,	Mana_Bloodherb);
			//PrintDebugNpc 		(PD_ITEM_MOBSI, "Ich esse Steinwurzel");
		}; 		
/******************************************************************************************/
INSTANCE ItFoScavengerEgg(C_Item)
{	
	name 				=	"Jajo œcierwojada";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	8;

	visual 				=	"ItFo_ScavengerEgg.3ds";
	scemeName			=	"MEAT";
	on_state[0]			=	UseScavengerEgg;

	description			= name;
	TEXT[1]				= NAME_Bonus_hp;				COUNT[1]	= 6;
	TEXT[5]				= NAME_Value;					COUNT[5]	= Value_Fleisch;
};

	FUNC VOID UseScavengerEgg()
	{
		B_ChangeAttribute	(self,	ATR_HITPOINTS,	6);
	};