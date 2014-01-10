//19:19 2006-05-12 -Added WeaponsMelee flag ITEM_MULTI
const int	Value_1H_Sword_01	=	100;		//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!
// const int Str_1H_Multiplier = 16/5;
// const int Dam_1H_Multiplier = 5 /2;
// const int Str_2H_Multiplier = 2;
// const int Dam_2H_Multiplier = 2;
const int RuneSWD_2H_Str = 90;
const int RuneSWD_2H_Dmg = 150;
const int RuneSWD_1H_Str = 100;
const int RuneSWD_1H_Dmg = 140;
CONST INT RuneSWD_value = 8650;
	FUNC VOID MYTHUE()
	{

		B_ChangeAttribute(self,ATR_STRENGTH,-10);
	};
FUNC VOID MYTHUE1()
	{

	B_ChangeAttribute(self,ATR_STRENGTH,-10);
	};
INSTANCE WTRAIL (WeaponsMelee)
{	
	name 				=	"test";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	1<<13;

	value 				=	200;

	material 			=	MAT_WOOD;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= Value_Dietrich;
	  visual 				=	"MSH_WEAPONTRAIL.3DS";

};
//////////////////////////
// R U N E   S W O R D
//////////////////////////
/********************************************************************************/
// keine NPCs
//TODO: RECEPT,price
INSTANCE Itmw_CZ_BIG_AXE_2H_01 (WeaponsMelee)
{	
	name 				=	"Barbarzyñca";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	6624;//todo correct price
	
	damageTotal			= 	156;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	59*2;
	  visual 				=	"CZ_BIG_AXE_2H_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs

PROTOTYPE ItMw_1H_RuneSWD_Proto (C_ITEM) 
{	
	name 				=	"Miecz runiczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	RuneSWD_value;//880;//442

	damageTotal			= 	RuneSWD_1H_Dmg;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	RuneSWD_1H_Str;
  
	visual 				=	"ItMw_1h_RuneSword_NEUTRAL.3DS";
//	scemename			=	"NONE";
	on_equip			=	RuneSwd1hUse;	
	on_unequip	=	RuneSwdUnEquip;
	description			= name;
	TEXT[0]				= "Szansa na krytyczne uderzenie: 20%";
	TEXT[1]				= "U¿ywana runa: brak";
	TEXT[2]				= "Obra¿enia: ???";
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "£adunek: 40/40";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	makingmob = 1010;//trigger3 recognize item as RUNESWORD by this
};
INSTANCE ItMw_1H_RuneSWD_01 (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_NEUTRAL.3DS";

};
INSTANCE ItMw_1H_RuneSWD_DARK (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_DARK.3DS";
};
INSTANCE ItMw_1H_RuneSWD_FIRE (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_FIRE.3DS";
};
INSTANCE ItMw_1H_RuneSWD_LIGHT (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_LIGHT.3DS";
};
INSTANCE ItMw_1H_RuneSWD_WATER (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_WATER.3DS";
};
INSTANCE ItMw_1H_RuneSWD_PSI (ItMw_1H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_1H_RuneSword_PSI.3DS";
};
Prototype ItMw_2H_RuneSWD_Proto (C_ITEM) 
{	
	name 				=	"Miecz runiczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	RuneSWD_value;//880;//442

	damageTotal			= 	RuneSWD_2H_Dmg;
	damagetype 			= 	DAM_EDGE;
	range    			=  	153;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	RuneSWD_2H_Str;
  
	visual 				=	"ItMw_2h_RuneSword_NEUTRAL.3DS";
	on_equip			=	RuneSwd2hUse;	
	on_unequip	=	RuneSwdUnEquip;
	description			= name;
	TEXT[0]				= "Szansa na krytyczne uderzenie: 20%";
	TEXT[1]				= "U¿ywana runa: brak";
	TEXT[2]				= "Obra¿enia: ???";
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= "£adunek: 40/40";
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	makingmob = 1010;//trigger3 recognize item as RUNESWORD by this
};
INSTANCE ItMw_2H_RuneSWD_01 (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_NEUTRAL.3DS";

};
INSTANCE ItMw_2H_RuneSWD_DARK (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_DARK.3DS";
};
INSTANCE ItMw_2H_RuneSWD_FIRE (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_FIRE.3DS";
};
INSTANCE ItMw_2H_RuneSWD_LIGHT (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_LIGHT.3DS";
};
INSTANCE ItMw_2H_RuneSWD_WATER (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_WATER.3DS";
};
INSTANCE ItMw_2H_RuneSWD_PSI (ItMw_2H_RuneSWD_Proto) 
{	
	visual 				=	"ItMw_2h_RuneSword_PSI.3DS";
};
//END

INSTANCE ItMw_1H_HSword_Bastard_01 (WeaponsMelee) 
{	
	name 				=	"Zguba zwierzyny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1860;//880;//442

	damageTotal			= 	59;
	damagetype 			= 	DAM_EDGE;
	range    			=  	80;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	21;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	  visual 				=	"ItMw_1H_Sword_Bastard_05.3DS";

	description			= name;
	TEXT[0]				= "Wymagana zrêcznoœæ                21";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_HSword_Bastard_02 (WeaponsMelee) 
{	
	name 				=	"Inkwizytor dusz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2360;//880;//442

	damageTotal			= 	71;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	35;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;
	  visual 				=	"ItMw_1H_Sword_Bastard_06.3DS";

	description			= name;
	TEXT[0]				= "Wymagana zrêcznoœæ                                              35";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_Short_01 (WeaponsMelee)
{	
	name 				=	"Toporek najemnika"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	360;//580;//294

	damageTotal			=   44;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	30;
	  visual 				=	"ItMw_1H_Axe_short_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_Short_02 (WeaponsMelee)
{	
	name 				=	"Toporek herszta"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	440;//580;//294

	damageTotal			=   50;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	  visual 				=	"ItMw_1H_Axe_short_02.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_Short_03 (WeaponsMelee)
{	
	name 				=	"Siekierka"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	660;//580;//294

	damageTotal			=   44;
	damagetype			=	DAM_EDGE;
	range    			=  	80;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	30;
	  visual 				=	"ItMw_1H_Axe_short_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE Fox_Axe (WeaponsMelee)
{	
	name 				=	"Siekiera Foxa"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1000;//580;//294

	damageTotal			=   55;
	damagetype			=	DAM_EDGE;
	range    			=  	50;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	30;
	  visual 				=	"ItMw_1H_Axe_short_03.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Warhammer_01 (WeaponsMelee)
{	
	name 				=	"Dziadek do orzechów";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	5184;

	damageTotal			=   72;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	  visual 				=	"ItMw_2H_Warhammer_01.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Warhammer_02 (WeaponsMelee)
{	
	name 				=	"M³ot bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	5184;

	damageTotal			=   72;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60;
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	  visual 				=	"ItMw_2H_Warhammer_02.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= NAME_Str_needed;				COUNT[3]	= cond_value[1];
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// HUN NOV ORG SLD
INSTANCE ItMw_1H_Mace_05 (WeaponsMelee)
{	
	name 				=	"Kolczasty morgenstern";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	385;

	damageTotal			=   49;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	1;
	  visual 				=	"ItMw_1H_Mace_05.3DS";

	description			= name;
	TEXT[0]				= "";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
/********************************************************************************/
// HUN NOV ORG SLD
INSTANCE ItMw_1H_Mace_06 (WeaponsMelee)
{	
	name 				=	"Kolczasty bojownik";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	445;

	damageTotal			=   43;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	25;
	  visual 				=	"ItMw_1H_Mace_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
/********************************************************************************/
// HUN NOV ORG SLD
INSTANCE ItMw_1H_Mace_07 (WeaponsMelee)
{	
	name 				=	"Æwierkowany ³omot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	485;

	damageTotal			=   48;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	29;
	  visual 				=	"ItMw_1H_Mace_08.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
/********************************************************************************/
// 
INSTANCE ItMw_1H_Berkser (WeaponsMelee)
{	
	name 				=	"Kolczasty morgenstern berkersera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;
	on_equip		=	EquipBEZ;
	on_unequip		=	bezdisabled;

	value 				=	885;
	damage[DAM_INDEX_FIRE]	=	 20;
	damage[DAM_INDEX_MAGIC]	=	55;
	damagetype			=	DAM_FIRE|DAM_MAGIC;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	  visual 				=	"ItMw_1H_Mace_06.3DS";

	description			= name;
	TEXT[0]				= "Morgenstern z kolcami zabija ¿arem";
	TEXT[0]				= "Ponoæ broñ dodaje si³y";
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;

};
	FUNC VOID EquipBEZ()
	{
	AI_PlayAni				(self, "T_PSI_VICTIM");
	B_SayOverlay			(self,	NULL,	"$Berzerk");
	self.protection [PROT_EDGE]	=	20;
	self.protection [PROT_BLUNT] = 	10;
	B_ChangeAttribute(self,ATR_STRENGTH,5);
	AI_DrawWeapon		(self);
		AI_PlayAni				(self, "Hum_1hAttackMidT3");
		AI_PlayAni				(self, "Hum_WoundB2DeadB_M01");			

	};
	FUNC VOID bezdisabled()
	{
	AI_PlayAni				(self, "T_PSI_VICTIM");
	B_SayOverlay			(self,	NULL,	"$Berzerk");
	self.protection [PROT_EDGE]	=	-20;
	self.protection [PROT_BLUNT] = 	-10;
	B_ChangeAttribute(self,ATR_STRENGTH,-5);
	};

/********************************************************************************/
// STT
INSTANCE ItMw_1H_HSword_Short_03 (WeaponsMelee)
{	
	name 				=	"Kie³ Trolla";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;
	//Mdl_SetModelScale	( self, 1.0, 1.0, 2.5);
	value 				=	288;//44;

	damageTotal			= 	38;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	32;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	16;
	  visual 				=	"ItMw_1H_Sword_Short_03.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 16";
	TEXT[3] 			= "Wymagana zrêcznoœæ 20";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// STT
INSTANCE ItMw_1H_HSword_Short_04 (WeaponsMelee)
{	
	name 				=	"Krótki miecz cienia";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	320;//60;

	damageTotal			= 	36;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	26;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	14;
	  visual 				=	"ItMw_1H_Sword_Short_04.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 14";
	TEXT[3] 			= "Wymagana zrêcznoœæ 26";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_HSword_Short_05 (WeaponsMelee)
{	
	name 				=	"Ulubieniec bandziora";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	260;//80;//40

	damageTotal			= 	38;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	34;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	18;
	  visual 				=	"ItMw_1H_Sword_Short_05.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 18";
	TEXT[3] 			= "Wymagana zrêcznoœæ 34";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_HSword_Short_06 (WeaponsMelee)
{	
	name 				=	"Nó¿ myœliwego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	310;//80;//40

	damageTotal			= 	40;
	damagetype 			=	DAM_EDGE;		
	range    			=  	80;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	36;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	6;
	  visual 				=	"ItMw_1H_Sword_Short_06.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 6";
	TEXT[3] 			= "Wymagana zrêcznoœæ 36";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG,HUN,STT SOME NOV GRD AND MAGICIANS MAYBE
INSTANCE ItMw_1H_HSword_Short_07 (WeaponsMelee)
{	
	name 				=	"Z³oty kie³";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	410;//80;//40

	damageTotal			= 	44;
	damagetype 			=	DAM_EDGE;		
	range    			=  	80;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	30;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12;
	  visual 				=	"ItMw_1H_Sword_Short_07.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 12";
	TEXT[3] 			= "Wymagana zrêcznoœæ 30";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_1H_HSword_Short_08 (WeaponsMelee)
{	
	name 				=	"Doradca s¿kodnika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	400;//80;//40

	damageTotal			= 	42;
	damagetype 			=	DAM_EDGE;		
	range    			=  	80;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	25;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	  visual 				=	"ItMw_1H_Sword_Short_08.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 15";
	TEXT[3] 			= "Wymagana zrêcznoœæ 25";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_1H_HSword_Short_09 (WeaponsMelee)
{	
	name 				=	"Zdobiony miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	400;//80;//40

	damageTotal			= 	42;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	  visual 				=	"ItMw_1H_Sword_Short_09.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 15";
	TEXT[3] 			= "Wymagana zrêcznoœæ 15";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_1H_HSword_Short_10 (WeaponsMelee)
{	
	name 				=	"Autorytet cienia";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	450;//80;//40

	damageTotal			= 	49;
	damagetype 			=	DAM_EDGE;		
	range    			=  	70;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	28;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	16;
	  visual 				=	"ItMw_1H_Sword_Short_10.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 16";
	TEXT[3] 			= "Wymagana zrêcznoœæ 28";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_1H_HSword_Short_11 (WeaponsMelee)
{	
	name 				=	"Nó¿ na wilki";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	490;//80;//40

	damageTotal			= 	51;
	damagetype 			=	DAM_EDGE;		
	range    			=  	50;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	31;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	14;
	  visual 				=	"ItMw_1H_Sword_Short_11.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 14";
	TEXT[3] 			= "Wymagana zrêcznoœæ 31";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_1H_HSword_Short_12 (WeaponsMelee)
{	
	name 				=	"Sztylet";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	390;//80;//40

	damageTotal			= 	31;
	damagetype 			=	DAM_EDGE;		
	range    			=  	40;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	21;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	  visual 				=	"ItMw_1H_Sword_Short_12.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 10";
	TEXT[3] 			= "Wymagana zrêcznoœæ 21";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// ORG,HUN,STT
INSTANCE ItMw_2H_IceSword_0 (WeaponsMelee)
{	
	name 				=	"Dziwny miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1;//80;//40

/* 	damage[DAM_INDEX_FIRE]	=	 4;
	damage[DAM_INDEX_MAGIC]	=	58;
	damage[DAM_INDEX_BARRIER]	=	38;
	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	10; */

	damageTotal			= 	1;
	damagetype 			=	DAM_EDGE;	
	// damagetype			=	DAM_FIRE|DAM_MAGIC|DAM_BARRIER;	
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	1;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	1;
  
	visual 				=	"FIVEBLADES_1_start.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damage[DAM_INDEX_MAGIC];
	TEXT[1]				= "Diwny miecz powinienem pokazaæ go Rodney'owi";
	TEXT[2] 			= "Wymagana si³a"; COUNT[2]	= 0;
	TEXT[3] 			= "Wymagana zrêcznoœæ"; COUNT[3]	= 0;
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 0;
};

INSTANCE ItMw_2H_IceSword_1 (WeaponsMelee)
{	
	name 				=	"Oddech lodu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4690;//2345;//1172

/* 	damage[DAM_INDEX_FIRE]	=	 4;
	damage[DAM_INDEX_MAGIC]	=	58;
	damage[DAM_INDEX_BARRIER]	=	38;
	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	10; */

	damageTotal			= 	81;
	damagetype 			=	DAM_EDGE;	
	// damagetype			=	DAM_FIRE|DAM_MAGIC|DAM_BARRIER;	
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
  
	visual 				=	"FIVEBLADES_1.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damage[DAM_INDEX_MAGIC];
	TEXT[1]				= "Miecz, dziêki któremu mogê ponoæ dodatkowe obra¿enia";
	TEXT[2] 			= "Wymagana si³a:";  COUNT[2]	= cond_value[2];
	TEXT[3] 			= "Wymagana zrêcznoœæ:";  COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_IceSword_3 (WeaponsMelee)
{	
	name 				=	"Oddech lodu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;
	material 			=	MAT_METAL;

	value 				=	4690;//2345;//1172

/* 	damage[DAM_INDEX_FIRE]	=	 4;
	damage[DAM_INDEX_MAGIC]	=	58;
	damage[DAM_INDEX_BARRIER]	=	38;
	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	10; */

	damageTotal			= 	115;
	damagetype 			=	DAM_EDGE;	
	// damagetype			=	DAM_FIRE|DAM_MAGIC|DAM_BARRIER;	
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;
  
	visual 				=	"FIVEBLADES_3.3ds";

	description			= name;
	on_equip 			= ICE_SWD_EQ;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[1]				= "Zogniskowany kamieniem mocy, mo¿e zadaæ dodatkowe obra¿enia";
	TEXT[2] 			= "Wymagana si³a:";  COUNT[2]	= cond_value[2];
	TEXT[3] 			= "Wymagana zrêcznoœæ:";  COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_IceSword_3 (WeaponsMelee)
{	
	name 				=	"Oddech lodu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4690;//2345;//1172

/* 	damage[DAM_INDEX_FIRE]	=	 4;
	damage[DAM_INDEX_MAGIC]	=	58;
	damage[DAM_INDEX_BARRIER]	=	38;
	protection [PROT_EDGE]	=	20;
	protection [PROT_BLUNT] = 	15;
	protection [PROT_POINT] = 	10; */

	damageTotal			= 	100;
	damagetype 			=	DAM_EDGE;	
	// damagetype			=	DAM_FIRE|DAM_MAGIC|DAM_BARRIER;	
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;
  
	visual 				=	"FIVEBLADES_3.3ds";

	description			= name;
	on_equip 			= ICE_SWD_EQ;
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	TEXT[1]				= "Zogniskowany kamieniem mocy, mo¿e zadaæ dodatkowe obra¿enia";
	TEXT[2] 			= "Wymagana si³a:";  COUNT[2]	= cond_value[2];
	TEXT[3] 			= "Wymagana zrêcznoœæ:";  COUNT[3]	= cond_value[1];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


Func void ICE_SWD_EQ()
{
	MAGIC_SWD_EQUIPED = TRUE;
	Wld_SendTrigger("TIMETRIGGER3");	
};
/********************************************************************************/
// STT
INSTANCE ItMw_1H_HSword_Short_02 (WeaponsMelee)
{	
	name 				=	"Krótki zdobiony miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	190;//32;

	damageTotal			= 	31;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	15;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12;
	  visual 				=	"ItMw_1H_Sword_Short_02.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 10";
	TEXT[3] 			= "Wymagana zrêcznoœæ 12";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** KURZSCHWERTER 								**
*********************************************************************************/
// SFB
INSTANCE ItMw_1H_HSword_Short_01 (WeaponsMelee)
{	
	name 				=	"Ciê¿ki krótki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	144;//22;

	damageTotal			= 	25;
	damagetype 			=	DAM_EDGE;		
	range    			=  	100;		
	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	12;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	  visual 				=	"ItMw_1H_Sword_Short_01.3DS";

	description			= name;
	TEXT[1]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[2] 			= "Wymagana si³a 10";
	TEXT[3] 			= "Wymagana zrêcznoœæ 12";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// HUN ORG SLD TPL
INSTANCE ItMw_1H_Sword_06 (WeaponsMelee)
{	
	name 				=	"Krwawe ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	772;//236;//118

	damageTotal			= 	72;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	45;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	  visual 				=	"ItMw_1H_Sword_6.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= "Wymagana si³a         15";
	TEXT[2] 			= "Wymagana zrêcznoœæ         45";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// HUN ORG SLD TPL
INSTANCE ItMw_1H_Sword_07 (WeaponsMelee)
{	
	name 				=	"Negocjator magnata";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2600;//236;//118

	damageTotal			= 	61;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;
	  visual 				=	"ItMw_1H_Sword_07.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= "Wymagana si³a                      45";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// HUN ORG SLD TPL
INSTANCE ItMw_2H_Sword_Light_06 (WeaponsMelee)
{	
	name 				=	"Dwurêczne krwawe ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1372;//236;//118

	damageTotal			= 	74;
	damagetype 			= 	DAM_EDGE;
	range    			=  	150;		

	cond_atr[1]   		= 	ATR_DEXTERITY;
	cond_value[1]  		= 	40;
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	20;
	  visual 				=	"ItMw_2H_Sword_Light_06.3DS";

	description			= name;
	TEXT[0]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= "Wymagana si³a                       20";
	TEXT[2] 			= "Wymagana zrêcznoœæ                  40";
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//=============================================
//	O R G I N A L   W E A P O N S
//	O R G I N A L   W E A P O N S
//	O R G I N A L   W E A P O N S
//
//
//



/*********************************************************************************
** Kleiner Kram  										 						**
*********************************************************************************/
// VLK
INSTANCE ItMw_1H_Club_01 (WeaponsMelee)
{	
	name 				=	"Pa³ka";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	25;

	damageTotal  		=	12;
	damagetype 			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	22;
	visual 			  =	"ItMw_1H_Club_01.3DS";
                              
	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Poker_01 (WeaponsMelee)
{	
	name 				=	"Pogrzebacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	40; 

	damageTotal			=	11;
	damagetype 			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	15;
	  visual 				=	"ItMw_1H_Poker_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// BAU
INSTANCE ItMw_1H_Sickle_01 (WeaponsMelee)	
{	
	name 				=	"Sierp"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	49;

	damageTotal			=	17;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	15;
	  visual 				=	"ItMw_1H_Sickle_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/******************************************************************************************/
// Auch für Mobsi-Benutzung (PickOre)
// VLK, SFB
INSTANCE ItMwPickaxe (WeaponsMelee)
{
	name 				=	"Kilof";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;

	value 				=	49;

	damageTotal			=	20;
	damagetype			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	20;
	  visual 				=	"ItMw_2H_Pickaxe_01.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Auch für Mobsi-Benutzung (Schmieden)
INSTANCE ItMw_1H_Sledgehammer_01 (WeaponsMelee)
{	
	name 				=	"M³ot kowalski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal			=	22;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	25;
	  visual 				=	"ItMw_1H_Sledgehammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// VLK_573_Graham, VLK_581_Snaf
INSTANCE ItMw_1H_Mace_Light_01 (WeaponsMelee)
{	
	name 				=	"Pa³ka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	64;

	damageTotal			=	20;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	22;
	visual 			  =	"ItMw_1H_Mace_Light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// NOV
instance ItMw_1H_Hatchet_01 (WeaponsMelee) 
{	
	name 				=	"Siekiera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	81;
	
	damageTotal			=	22;
	damagetype			=	  DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	22;
	visual 			  =	"ItMw_1H_Hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Old_01 (WeaponsMelee)
{	
	name 				=	"Zardzewia³y miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	40;

	damageTotal			=	25;
	damagetype 			=	  DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	22;
	visual 			  =	"ItMw_1H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// VLK, SFB
INSTANCE ItMw_1H_Nailmace_01 (WeaponsMelee)
{	
	name 				=	"Kij z gwoŸdziem"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	121;

	damageTotal			=	27;
	damagetype 			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	19;
	visual 			  =	"ItMw_1H_Nailmace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** KURZSCHWERTER 								**
*********************************************************************************/
// SFB
INSTANCE ItMw_1H_Sword_Short_01 (WeaponsMelee)
{	
	name 				=	"Krótki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	144;

	damageTotal			=	30;
	damagetype 			=	  DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	25;
	visual 			  =	"ItMw_1H_Sword_Short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_02 (WeaponsMelee)
{	
	name 				=	"Ch³opski miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	196;

	damageTotal			=	35;
	damagetype 			=	  DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	28;
	visual 			  =	"ItMw_1H_Sword_Short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_03 (WeaponsMelee)
{	
	name 				=	"Jêzyk topielca";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	256;//44;

	damageTotal			=	40;
	damagetype 			=	  DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	35;
	visual 			  =	"ItMw_1H_Sword_Short_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// STT
INSTANCE ItMw_1H_Sword_Short_04 (WeaponsMelee)
{	
	name 				=	"K³uj¹cy cierñ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	324;//60;

	damageTotal			=	45;
	damagetype 			=	  DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	38;
	visual 			  =	"ItMw_1H_Sword_Short_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Short_05 (WeaponsMelee)
{	
	name 				=	"Z¹b kopacza";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			=	50;
	damagetype 			=	  DAM_EDGE;		
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	41;
	visual 			  =	"ItMw_1H_Sword_Short_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Staebe und Kram 								**
*********************************************************************************/
// NOV
instance ItMw_1H_Axe_Old_01 (WeaponsMelee)
{	
	name 				=	"Wyszczerbiony topór";   

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal     	=	30;
	damagetype			=	  DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	28;
	visual 			  =	"ItMw_1H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// BAU
// FIXME: zu stark?
INSTANCE ItMw_1H_Scythe_01 (WeaponsMelee)	
{	
	name 				=	"Siekacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	225;

	damageTotal			=	37;
	damagetype 			=	  DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	35;
	visual 			  =	"ItMw_1H_Scythe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs 
INSTANCE ItMw_2H_Staff_01 (WeaponsMelee)
{	
	name 				=	"Kostur";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	289;

	damageTotal			= 	17*2;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	12*2;
	  visual 				=	"ItMw_2H_Staff_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Staff_02 (WeaponsMelee)
{	
	name 				=	"Laska sêdziowska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	361;

	damageTotal			= 	19*2;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	13*2;
	  visual 				=	"ItMw_2H_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Staff_03 (WeaponsMelee)
{	
	name 				=	"Laska kap³añska";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	441;

	damageTotal			= 	21*2;
	damagetype 			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	13*2;
	  visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Leichtes Gardeschwert						 								**
*********************************************************************************/

INSTANCE ItMw_1H_LightGuardsSword_03 (WeaponsMelee)
{	
	name 				=	"Lekki miecz stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	484;

	damageTotal			=	55;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	53;
	visual 			  =	"ItMw_1H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Streitkolben 								**
*********************************************************************************/
// NOV + ORG
INSTANCE ItMw_1H_Mace_01 (WeaponsMelee)
{	
	name 				=	"Maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	529;

	damageTotal			=	57;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	41;
	visual 			  =	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// ORG
INSTANCE ItMw_1H_Mace_02 (WeaponsMelee)
{	
	name 				=	"Æwiekowana maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	625;

	damageTotal			=	62;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	44;
	visual 			  =	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// ORG
INSTANCE ItMw_1H_Mace_03 (WeaponsMelee)
{	
	name 				=	"¯¹d³o krwiopijcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	676;

	damageTotal			=	65;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	44;
	visual 			  =	"ItMw_1H_Mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// NOV_1303_NYRAS , NOV_1330_BAALPARVEZ
INSTANCE ItMw_1H_Mace_04 (WeaponsMelee)
{	
	name 				=	"Stalowy jêzyk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	784;

	damageTotal			=	70;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	44;
	visual 			  =	"ItMw_1H_Mace_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Schwerter 									**
*********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_01 (WeaponsMelee)
{	
	name 				=	"Miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	400; 	//SN: WICHTIG, da diese Instanz das Produkt des SC-Schmiedens ist!!!

	damageTotal			=	50;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	48;
	visual 				= "ITMW_1H_SWORD_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_02 (WeaponsMelee)
{	
	name 				=	"Miecz sêdziego";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			=	75;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	51;
	visual 			  =	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD
INSTANCE ItMw_1H_Sword_03 (WeaponsMelee)
{	
	name 				=	"Miecz stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1024;

	damageTotal			=	80;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	51;
	visual 			  	=	"ItMw_1H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD, STT (einer)
INSTANCE ItMw_1H_Sword_04 (WeaponsMelee)
{	
	name 				=	"Miecz bojowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1089;

	damageTotal			=	82;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	51;
	visual 			  =	"ItMw_1H_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPC
INSTANCE ItMw_1H_Sword_05 (WeaponsMelee)
{	
	name 				=	"Miecz wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1156;

	damageTotal			=	85;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	54;
	visual 			  =	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Morgensterne									**
*********************************************************************************/
// ORG

INSTANCE ItMw_1H_Mace_War_01 (WeaponsMelee)
{	
	name 				=	"Morgensztern";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1225;

	damageTotal			=	87;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	54;
	visual 			  =	"ItMw_1H_Mace_War_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// ORG, SLD
INSTANCE ItMw_1H_Mace_War_02 (WeaponsMelee)
{	
	name 				=	"¯elazna maczuga";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1296;

	damageTotal			=	90;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	64;
	visual 			  =	"ItMw_1H_Mace_War_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// SLD
INSTANCE ItMw_1H_Mace_War_03 (WeaponsMelee)
{	
	name 				=	"£omotacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1369;

	damageTotal			=	92;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	112;
	visual 			   =	"ItMw_1H_Mace_War_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GUR_1211_BaalLukor
INSTANCE ItMw_1H_Mace_War_04 (WeaponsMelee)
{	
	name 				=	"£amacz serc";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	1521;

	damageTotal			=	97;
	damagetype			=	  DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 			  =	"ItMw_1H_Mace_War_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Langschwerter								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_01 (WeaponsMelee)
{	
	name 				=	"D³ugi miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1600;

	damageTotal			=	100;
	damagetype 			=	 DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	70;
	visual 			  =	"ItMw_1H_Sword_Long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// GRD_203_BULLIT
INSTANCE ItMw_1H_Sword_Long_02 (WeaponsMelee)
{	
	name 				=	"Miecz strachu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1764;

	damageTotal			=	105;
	damagetype 			=	 DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	73;
	visual 			  =	"ItMw_1H_Sword_Long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_03 (WeaponsMelee)
{	
	name 				=	"Miecz nienawiœci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	1936;

	damageTotal			=	110;
	damagetype 			=	 DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	76;
	visual 			  =	"ItMw_1H_Sword_Long_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_04 (WeaponsMelee)
{	
	name 				=	"Miecz zwyciêstwa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2116;

	damageTotal			=	115;
	damagetype 			=	 DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	80;
	visual 			  =	"ItMw_1H_Sword_Long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Long_05 (WeaponsMelee)
{	
	name 				=	"Miecz œmierci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2304;

	damageTotal			=	120;
	damagetype 			=	 DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	86;
	visual 			  =	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_01 (WeaponsMelee)
{	
	name 				=	"M³ot Orków";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2500;

	damageTotal			=	125;
	damagetype			=	   DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	92;
	visual 			  =	"ItMw_1H_Warhammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_02 (WeaponsMelee)
{	
	name 				=	"M³ot wojenny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2601;

	damageTotal			=	127;
	damagetype			=	   DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	96;
	visual 			  =	"ItMw_1H_Warhammer_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Warhammer_03 (WeaponsMelee)
{	
	name 				=	"Boski m³ot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2704;

	damageTotal			=	130;
	damagetype			=	   DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	96;
	visual 			  =	"ItMw_1H_Warhammer_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** Äxte										**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_01 (WeaponsMelee)
{	
	name 				=	"Topór"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	841;

	damageTotal			=	72;
	damagetype			=	  DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	48;
	visual 			  =	"ItMw_1H_Axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_02 (WeaponsMelee)
{	
	name 				=	"Gruchotacz"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2809;

	damageTotal			=	132;
	damagetype			=	   DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	99;
	visual 			  =	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Axe_03 (WeaponsMelee)
{	
	name 				=	"£amacz koœci"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	2916;

	damageTotal			=	135;
	damagetype			=	   DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	102;
	visual 			   =	"ItMw_1H_Axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/*********************************************************************************
** Breitschwerter								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_01 (WeaponsMelee) 
{	
	name 				=	"Miecz szeroki";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3025;

	damageTotal			=	137;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	108;
	visual 			   =	"ItMw_1H_Sword_Broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_02 (WeaponsMelee) 
{	
	name 				=	"Wyrok wojownika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3249;

	damageTotal			=	142;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	112;
	visual 			   =	"ItMw_1H_Sword_Broad_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_03 (WeaponsMelee) 
{	
	name 				=	"Szept burzy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3364;

	damageTotal			=	145;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	115;
	visual 			   =	"ItMw_1H_Sword_Broad_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Broad_04 (WeaponsMelee) 
{	
	name 				=	"Rêka stra¿nika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	3481;

	damageTotal			=	147;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	121;
	visual 			   =	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Alte Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Old_01 (WeaponsMelee) 
{	
	name 				=	"Zardzewia³y miecz oburêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	521;

	damageTotal			= 	61*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	39*2;
	  visual 				=	"ItMw_2H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Alte Zweihänder								**
*********************************************************************************/
// 4 GRD's
INSTANCE ItMw_2H_Sword_Old_02 (WeaponsMelee) 
{	
	name 				=	"Stary miecz dwurêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	40*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	39*2;
	  visual 				=	"ItMw_2H_Sword_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Bastardschwerter								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_01 (WeaponsMelee) 
{	
	name 				=	"Zardzewia³y miecz pó³torarêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	2025;

	damageTotal			=	112;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	128;
	visual 			   =	"ItMw_1H_Sword_Bastard_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_02 (WeaponsMelee) 
{	
	name 				=	"RzeŸnik";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4096;

	damageTotal			=	160;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	131;
	visual 			   =	"ItMw_1H_Sword_Bastard_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_03 (WeaponsMelee) 
{	
	name 				=	"Kat";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4225;

	damageTotal			=	162;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	137;
	visual 			   =	"ItMw_1H_Sword_Bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_1H_Sword_Bastard_04 (WeaponsMelee) 
{	
	name 				=	"Wrzask Berserkera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4356;

	damageTotal			=	165;
	damagetype 			=	 DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=	144;
	visual 			   =	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Alte Streitäxte								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_01 (WeaponsMelee)
{	
	name 				=	"Stary topór bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	489;
	
	damageTotal			= 	50*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50*2;
	  visual 				=	"ItMw_2H_Axe_Old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_02 (WeaponsMelee)
{	
	name 				=	"Krwawy ¿niwiarz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	4624;
	
	damageTotal			= 	68*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	49*2;
	  visual 				=	"ItMw_2H_Axe_Old_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Old_03 (WeaponsMelee)
{	
	name 				=	"Stary sêdzia";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	4761;
	
	damageTotal			= 	69*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	52*2;
	  visual 				=	"ItMw_2H_Axe_Old_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Leichte Zweihänder								**
*********************************************************************************/
// TPL
INSTANCE ItMw_2H_Sword_Light_01 (WeaponsMelee) 
{	
	name 				=	"Lekki miecz dwurêczny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	4900;

	damageTotal			= 	70*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	56*2;
	  visual 				=	"ItMw_2H_Sword_Light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// TPL
INSTANCE ItMw_2H_Sword_Light_02 (WeaponsMelee) 
{	
	name 				=	"Miecz nadzorcy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5041;

	damageTotal			= 	71*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	57*2;
	  visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Light_03 (WeaponsMelee) 
{	
	name 				=	"Ostrze najemnika";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5329;

	damageTotal			= 	73*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	60*2;
	  visual 				=	"ItMw_2H_Sword_Light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// TPL_1402_GorNaToth, TPL_1439_GorNaDrak
INSTANCE ItMw_2H_Sword_Light_04 (WeaponsMelee) 
{	
	name 				=	"Miecz królewski";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5476;

	damageTotal			= 	74*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	62*2;
	  visual 				=	"ItMw_2H_Sword_Light_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCS
INSTANCE ItMw_2H_Sword_Light_05 (WeaponsMelee) 
{	
	name 				=	"Miecz demonów";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	5776;

	damageTotal			= 	76*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65*2;
	  visual 				=	"ItMw_2H_Sword_Light_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Sword_Light_Rusty_05 (WeaponsMelee) 
{	
	name 				=	"Zniszczony miecz demonów";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	636;

	damageTotal			= 	56*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	58*2;
	  visual 				=	"ItMw_2H_Sword_Light_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Leichte Streitaxt								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_01 (WeaponsMelee)
{	
	name 				=	"Lekki topór bojowy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	5929;
	
	damageTotal			= 	77*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	67*2;
	  visual 				=	"ItMw_2H_Axe_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_02 (WeaponsMelee)
{	
	name 				=	"Grzmot";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	6241;
	
	damageTotal			= 	79*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70*2;
	  visual 				=	"ItMw_2H_Axe_light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_light_03 (WeaponsMelee)
{	
	name 				=	"Chrzêst";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	6400;
	
	damageTotal			= 	80*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	73*2;
	  visual 				=	"ItMw_2H_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Zweihänder									**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_01 (WeaponsMelee) 
{	
	name 				=	"Dwurêczniak";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	6561;

	damageTotal			= 	81*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75*2;
	  visual 				=	"ItMw_2H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_02 (WeaponsMelee) 
{	
	name 				=	"Ostrze bohatera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	6889;

	damageTotal			= 	83*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		=   78*2;
	  visual 				=	"ItMw_2H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_03 (WeaponsMelee) 
{	
	name 				=	"Krwawe ostrze";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	7225;

	damageTotal			= 	85*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80*2;
	  visual 				=	"ItMw_2H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Schwere Zweihänder								**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_01 (WeaponsMelee) 
{	
	name 				=	"Ciê¿ki dwurêczniak";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	7396;

	damageTotal			= 	86*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	83*2;
	  visual 				=	"ItMw_2H_Sword_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_02 (WeaponsMelee) 
{	
	name 				=	"Gniewna stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	7744;

	damageTotal			= 	88*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	86*2;
	  visual 				=	"ItMw_2H_Sword_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_03 (WeaponsMelee) 
{	
	name 				=	"Wœciek³a stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	8100;

	damageTotal			= 	90*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	88*2;
	  visual 				=	"ItMw_2H_Sword_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_04 (WeaponsMelee) 
{	
	name 				=	"Mœciwa stal";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	8464;

	damageTotal			= 	92*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	91*2;
	  visual 				=	"ItMw_2H_Sword_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Sword_Heavy_05 (WeaponsMelee) 
{	
	name 				=	"Korsarz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_METAL;

	value 				=	9025;

	damageTotal			= 	95*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	91*2;
	  visual 				=	"ItMw_2H_Sword_Heavy_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/*********************************************************************************
** Streitäxte									**
*********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_01 (WeaponsMelee)
{	
	name 				=	"Topór wojenny";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	8836;
	
	damageTotal			= 	94*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	93*2;
	  visual 				=	"ItMw_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_02 (WeaponsMelee)
{	
	name 				=	"Krzyk wojownika";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	9216;
	
	damageTotal			= 	96*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	96*2;
	  visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_03 (WeaponsMelee)
{	
	name 				=	"Piêœæ barbarzyñcy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	9604;
	
	damageTotal			= 	98*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	99*2;
	  visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// keine NPCs
INSTANCE ItMw_2H_Axe_Heavy_04 (WeaponsMelee)
{	
	name 				=	"Piêœæ trolla";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	10000;
	
	damageTotal			= 	100*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	101*2;
	  visual 				=	"ItMw_2H_Axe_Heavy_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Draconians Weapons		(Chapt. 5 Weapons!!!							**
*********************************************************************************/
// Draco-Scout (ab Ende Kap 4!)
INSTANCE ItMw_Draco_01 (WeaponsMelee)
{	
	name 				=	"Tenaak'u"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	57;

	damageTotal			= 	154;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	170;
	  visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// Draco-Solidier (ab Ende Kap 4!)
INSTANCE ItMw_Draco_02 (WeaponsMelee)
{	
	name 				=	"Y'essack"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	40;

	damageTotal			= 	135;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	180;
	  visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// Draco-Solidier (ab Ende Kap 4!)
INSTANCE ItMw_Draco_03 (WeaponsMelee)
{	
	name 				=	"Tign'o"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	44;//90

	damageTotal			= 	228;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	250;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/*********************************************************************************
** Orkische Waffen		(entsprechen Kap. 3-4 Waffen!!!							**
*********************************************************************************/
// Orc-Scout (ab Ende Kap 3!)
INSTANCE ItMw2hOrcSword01 (WeaponsMelee)
{	
	name 				=	"Krush Varrok"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	30;//90

	damageTotal			= 	45*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	32*2;
	  visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Orc-Elite
INSTANCE ItMw2hOrcSword02 (WeaponsMelee)
{	
	name 				=	"Krush UrGach"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	51;//90

	damageTotal			= 	68*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	80*2;
	  visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe01 (WeaponsMelee)
{	
	name 				=	"Krush Pach";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	35;//100;

	damageTotal			= 	50*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   39*2;
	  visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe02 (WeaponsMelee)
{	
	name 				=	"Krush UrRok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	38;//110;

	damageTotal			= 	55*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	45*2;
	  visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe03 (WeaponsMelee)
{	
	name 				=	"Krush Agash";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	40;//120;

	damageTotal			= 	60*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   52*2;
	  visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Elite2(general)
INSTANCE ItMw2hOrcAxe03_2 (WeaponsMelee)
{	
	name 				=	"Krush Ba Agash";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	60;//120;

	damageTotal			= 	77*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   82*2;
	  visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// Orc-Warrior (Mitte Kap 4!)
INSTANCE ItMw2hOrcAxe04 (WeaponsMelee)
{	
	name 				=	"Krush BrokDar";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	43;//130;

	damageTotal			= 	65*2;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   45*2;
	  visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Undead Orc-Warrior (Kap. 5)
INSTANCE ItMw2hOrcMace01 (WeaponsMelee)
{	
	name 				=	"Krush Karrok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;	
	material 			=	MAT_WOOD;

	value 				=	50;//150;

	damageTotal			= 	75*2;
	damagetype			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   50*2;
	  visual 				=	"ItMw_2H_OrcMace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

/********************************************************************************/
// Orc-Schamane (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwOrcstaff (WeaponsMelee)
{
	name 				=	"Grachtnakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0*2;
	damagetype			=	DAM_BLUNT;
	  visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2]*2;
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


/********************************************************************************/
// Untoter Orc-Priester (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwUdOrcstaff (WeaponsMelee)
{
	name 				=	"ShaBaNakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0*2;
	damagetype			=	DAM_BLUNT;
	  visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2]*2;
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

/********************************************************************************/
// Special fukin' huge OGRE HAMMER AAAH!!! 270DMG :D
Func Void OgreHammerEQ()
{
	if(Npc_GetTalentValue(hero, NPC_TALENT_2H)>59)
	{	
	Mdl_ApplyOverlayMds 	(hero,"HUMANS_2HST1.MDS");
	Npc_SetTalentSkill(hero, NPC_TALENT_2H, 1);	
	};
};
Func Void OgreHammerUnEQ()
{
	if(Npc_GetTalentValue(hero, NPC_TALENT_2H)>59)
	{	
	Mdl_ApplyOverlayMds 	(hero,"HUMANS_2HST2.MDS");
	Npc_SetTalentSkill(hero, NPC_TALENT_2H, 2);	
	};	
};

INSTANCE ItMwOgreHammer(WeaponsMelee)
{
	name 				=	"Ogrzy m³ot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_MULTI;
	material 			=	MAT_WOOD;

	value 				=	10;

	damageTotal			=	270;
	damagetype			=	DAM_BLUNT;
	  visual 				=	"ITMW_OGREHAMMER.3DS";
	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   300;
	range    			=  	200;		
	on_equip			=	OgreHammerEQ;	
	on_unequip	=	OgreHammerUnEQ;
		
	description			= name;
	//TEXT[1]			= "";					COUNT[1]	= ;
	TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};