instance Schutzring_Feuer1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItRi_Prot_Fire_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Feuer1;
	on_unequip				=	UnEquip_Schutzring_Feuer1;

	description		= " Pierœcieñ ochrony przed ogniem";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Feuer1()
{
	self.protection [PROT_FIRE] +=  3;
};

FUNC VOID UnEquip_Schutzring_Feuer1()
{
	self.protection [PROT_FIRE] -=  3;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Feuer2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Fire_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Feuer2;
	on_unequip				=	UnEquip_Schutzring_Feuer2;

	description		= "Ochrona przed ogniem";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Feuer2()
{
	self.protection [PROT_FIRE] +=  5;
};

FUNC VOID UnEquip_Schutzring_Feuer2()
{
	self.protection [PROT_FIRE] -=  5;
};

/******************************************************************************************/
INSTANCE Schutzring_Geschosse1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItRi_Prot_Point_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Geschosse1;
	on_unequip				=	UnEquip_Schutzring_Geschosse1;

	description		= "Pierœcieñ drewnianej skóry";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Geschosse1()
{
	self.protection [PROT_POINT] +=  5;
};

FUNC VOID UnEquip_Schutzring_Geschosse1()
{
	self.protection [PROT_POINT] -=  5;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Geschosse2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Point_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Geschosse2;
	on_unequip				=	UnEquip_Schutzring_Geschosse2;

	description		= "Pierœcieñ kamiennej skóry";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Geschosse2()
{
	self.protection [PROT_POINT] +=  10;
};

FUNC VOID UnEquip_Schutzring_Geschosse2()
{
	self.protection [PROT_POINT] -=  10;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Waffen1(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Waffen1;
	on_unequip				=	UnEquip_Schutzring_Waffen1;

	description		= "Pierœcieñ ¿elaznej skóry";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Waffen1()
{
	self.protection [PROT_EDGE] +=  5;
	self.protection [PROT_BLUNT] +=  5;
};

FUNC VOID UnEquip_Schutzring_Waffen1()
{
	self.protection [PROT_EDGE] -=  5;
	self.protection [PROT_BLUNT] -=  5;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Waffen2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Waffen2;
	on_unequip				=	UnEquip_Schutzring_Waffen2;

	description		= "Pierœcieñ magicznego pancerza";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Waffen2()
{
	self.protection [PROT_EDGE] +=  10;
	self.protection [PROT_BLUNT] +=  10;
};

FUNC VOID UnEquip_Schutzring_Waffen2()
{
	self.protection [PROT_EDGE] -=  10;
	self.protection [PROT_BLUNT] -=  10;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Magie1(C_ITEM)
{
	name 					=	"Pierœcieñ";

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1;
	on_unequip				=	UnEquip_Schutzring_Magie1;

	description		= "Pierœcieñ si³y duchowej";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Magie1()
{
	self.protection [PROT_MAGIC] +=  1;
};

FUNC VOID UnEquip_Schutzring_Magie1()
{
	self.protection [PROT_MAGIC] -=  1;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Magie2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2;
	on_unequip				=	UnEquip_Schutzring_Magie2;

	description		= "Pierœcieñ obrony";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 3;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Magie2()
{
	self.protection [PROT_MAGIC] +=  3;
};

FUNC VOID UnEquip_Schutzring_Magie2()
{
	self.protection [PROT_MAGIC] -=  3;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Magie1_Fire1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItRi_Prot_Mage_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie1_Fire1;
	on_unequip				=	UnEquip_Schutzring_Magie1_Fire1;

	description		= "Pierœcieñ oczyszczenia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 1;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 3;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Magie1_Fire1()
{
	self.protection [PROT_MAGIC] +=  1;
	self.protection [PROT_FIRE] +=  3;
};

FUNC VOID UnEquip_Schutzring_Magie1_Fire1()
{
	self.protection [PROT_MAGIC] -=  1;
	self.protection [PROT_FIRE] -=  3;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Magie2_Fire2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItRi_Prot_Mage_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Schutzring_Magie2_Fire2;
	on_unequip				=	UnEquip_Schutzring_Magie2_Fire2;

	description		= "Pierœcieñ niezwyciê¿onoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 3;
	TEXT[3] 		= NAME_Prot_Fire;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Magie2_Fire2()
{
	self.protection [PROT_MAGIC] +=  3;
	self.protection [PROT_FIRE] +=  5;
};

FUNC VOID UnEquip_Schutzring_Magie2_Fire2()
{
	self.protection [PROT_MAGIC] -=  3;
	self.protection [PROT_FIRE] -=  5;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Geschosse1_Waffen1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItRi_Prot_Edge_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Geschosse1_Waffen1;
	on_unequip				= 	UnEquip_Schutzring_Geschosse1_Waffen1;

	description		= "Pierœcieñ wytrwa³oœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 5;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Schutzring_Geschosse1_Waffen1()
{
	self.protection [PROT_EDGE] +=  5;
	self.protection [PROT_BLUNT] +=  5;
	self.protection [PROT_POINT] +=  5;
};

FUNC VOID UnEquip_Schutzring_Geschosse1_Waffen1()
{
	self.protection [PROT_EDGE] -=  5;
	self.protection [PROT_BLUNT] -=  5;
	self.protection [PROT_POINT] -=  5;
};
	
/******************************************************************************************/
INSTANCE Schutzring_Geschosse2_Waffen2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItRi_Prot_Edge_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Geschosse2_Waffen2;
	on_unequip				= 	UnEquip_Schutzring_Geschosse2_Waffen2;

	description		= "Pierœcieñ niewzruszonoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 10;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 10;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Geschosse2_Waffen2()
	{
	self.protection [PROT_EDGE] 		+=  10;
	self.protection [PROT_BLUNT]		+=  10;
	self.protection [PROT_POINT]		+=  10;
	};

	FUNC VOID UnEquip_Schutzring_Geschosse2_Waffen2()
	{
	self.protection [PROT_EDGE] 		-=  10;
	self.protection [PROT_BLUNT]		-=  10;
	self.protection [PROT_POINT]		-=  10;
	};
	
/******************************************************************************************/
INSTANCE Schutzring_Total1(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	800;

	visual 					=	"ItRi_Prot_Total_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total1;
	on_unequip				= 	UnEquip_Schutzring_Total1;

	description		= "Pomniejszy pierœcieñ niezwyciê¿onoœci";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= 1;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 3;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 5;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 5;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 	+=   5;
	self.protection [PROT_BLUNT]	+=   5;
	self.protection [PROT_POINT]	+=   5;
 	self.protection [PROT_FIRE]     +=   3;
	self.protection [PROT_MAGIC]    +=   1;
	};

	FUNC VOID UnEquip_Schutzring_Total1()
	{
	self.protection [PROT_EDGE] 		-=   5;
	self.protection [PROT_BLUNT]		-=   5;
	self.protection [PROT_POINT]		-=   5;
 	self.protection [PROT_FIRE]      -=   3;
	self.protection [PROT_MAGIC]     -=   1;
	};
	
/******************************************************************************************/
INSTANCE Schutzring_Total2(C_ITEM)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	1000;

	visual 					=	"ItRi_Prot_Total_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=  	Equip_Schutzring_Total2;
	on_unequip				= 	UnEquip_Schutzring_Total2;

	description		= "Wiêkszy pierœcieñ niezwyciê¿onoœci";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Magic;
	COUNT[1]		= 3;
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 5;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 10;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 10;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	+=   10;
	self.protection [PROT_BLUNT]	+=   10;
	self.protection [PROT_POINT]	+=   10;
 	self.protection [PROT_FIRE]     +=   5;
	self.protection [PROT_MAGIC]    +=   3;
	};

	FUNC VOID UnEquip_Schutzring_Total2()
	{
	self.protection [PROT_EDGE] 	-=   10;
	self.protection [PROT_BLUNT]	-=   10;
	self.protection [PROT_POINT]	-=   10;
 	self.protection [PROT_FIRE]     -=   5;
	self.protection [PROT_MAGIC]    -=   3;
	};
	
/******************************************************************************************/
INSTANCE Ring_des_Geschicks(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItRi_Dex_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks;
	on_unequip				=	UnEquip_Ring_des_Geschicks;

	description		= "Pomniejszy pierœcieñ zwinnoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Ring_des_Geschicks()
{
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY,5 );
};

FUNC VOID UnEquip_Ring_des_Geschicks()
{
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY,-5 );
};
	
/******************************************************************************************/
INSTANCE Ring_des_Geschicks2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItRi_Dex_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Geschicks2;
	on_unequip				=	UnEquip_Ring_des_Geschicks2;

	description		= "Wiêkszy pierœcieñ zwinnoœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Ring_des_Geschicks2()
{
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY,10);
};

FUNC VOID UnEquip_Ring_des_Geschicks2()
{
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY,-10);
};

/******************************************************************************************/
INSTANCE Ring_des_Lebens(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	180;

	visual 					=	"ItRi_HP_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens;
	on_unequip				=	UnEquip_Ring_des_Lebens;

	description		= "Pierœcieñ ¿ycia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_hp;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Ring_des_Lebens()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 10; 
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 10;
};

FUNC VOID UnEquip_Ring_des_Lebens()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 10;
   
	if self.attribute [ATR_HITPOINTS]> 11
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 10;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};
	
/******************************************************************************************/
INSTANCE Ring_des_Lebens2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	360;

	visual 					=	"ItRi_HP_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_des_Lebens2;
	on_unequip				=	UnEquip_Ring_des_Lebens2;
	description		= "Wiêkszy pierœcieñ ¿ycia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_hp;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20; 
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
	};

	FUNC VOID UnEquip_Ring_des_Lebens2()
	{
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 20; 
		
		if self.attribute [ATR_HITPOINTS]> 21
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 20;
		}
		else
		{
			self.attribute[ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
INSTANCE Staerkering(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	160;

	visual 					=	"ItRi_Str_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Staerkering;
	on_unequip				=	UnEquip_Staerkering;

	description		= "Pierœcieñ mocy";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 5;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Staerkering()
{
	B_Hack_ChangeAttribute(self,ATR_STRENGTH,5 );
};

FUNC VOID UnEquip_Staerkering()
{
	B_Hack_ChangeAttribute(self,ATR_STRENGTH,-5 );
};
	
/******************************************************************************************/
INSTANCE Staerkering2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	240;

	visual 					=	"ItRi_Str_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;

	on_equip				=	Equip_Staerkering2;
	on_unequip				=	UnEquip_Staerkering2;

	description		= "Pierœcieñ si³y";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkering2()
	{
		B_Hack_ChangeAttribute(self,ATR_STRENGTH,10 );
	};

	FUNC VOID UnEquip_Staerkering2()
	{
		B_Hack_ChangeAttribute(self,ATR_STRENGTH, -10 );
	};

/******************************************************************************************/
INSTANCE Ring_der_Magie(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	200;

	visual 					=	"ItRi_Mana_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Magie;
	on_unequip				=	UnEquip_Ring_der_Magie;

	description		= "Pierœcieñ magii";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	};


	FUNC VOID UnEquip_Ring_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	};
	
/******************************************************************************************/
INSTANCE Ring_der_Magie2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	400;

	visual 					=	"ItRi_Mana_02.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Magie2;
	on_unequip				=	UnEquip_Ring_der_Magie2;

	description		= "Pierœcieñ magicznego kunsztu";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Magie2()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 20;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 20;
	};


	FUNC VOID UnEquip_Ring_der_Magie2()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 20;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 20;
	};
		
/******************************************************************************************/
INSTANCE Ring_der_Erleuchtung(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	500;

	visual 					=	"ItRi_HP_Mana_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Erleuchtung;
	on_unequip				=	UnEquip_Ring_der_Erleuchtung;

	description		= "Pierœcieñ oœwiecenia";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 15;
	TEXT[3] 		= NAME_Bonus_hp;
	COUNT[3]		= 15;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Erleuchtung()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 15;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 15;
	};

	FUNC VOID UnEquip_Ring_der_Erleuchtung()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 15;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 15;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 15;
		
		if (self.attribute [ATR_HITPOINTS] > 16)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 15;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};
	
/******************************************************************************************/
INSTANCE Ring_der_Erleuchtung2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	1000;

	visual 					=	"ItRi_HP_Mana_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Ring_der_Erleuchtung2;
	on_unequip				=	UnEquip_Ring_der_Erleuchtung2;

	description		= "Pierœcieñ œwiat³oœci";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 30;
	TEXT[3] 		= NAME_Bonus_hp;
	COUNT[3]		= 30;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Ring_der_Erleuchtung2()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 30;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 30;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;
	};

	FUNC VOID UnEquip_Ring_der_Erleuchtung2()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 30;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 30;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 30;
		
		if (self.attribute [ATR_HITPOINTS] > 31)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 30;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};
/******************************************************************************************/
INSTANCE Machtring(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	300;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Machtring;
	on_unequip				=	UnEquip_Machtring;

	description		= "Pierœcieñ si³y wojownika";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 4;
	TEXT[3] 		= NAME_Bonus_Dex;
	COUNT[3]		= 4;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Machtring()
	{
		B_Hack_ChangeAttribute(self,ATR_STRENGTH, 4);
		B_Hack_ChangeAttribute(self,ATR_DEXTERITY, 4);
	};

	FUNC VOID UnEquip_Machtring()
	{
		B_Hack_ChangeAttribute(self,ATR_STRENGTH,- 4);
		B_Hack_ChangeAttribute(self,ATR_DEXTERITY, -4);
	};
/******************************************************************************************/
INSTANCE Machtring2(C_Item)
{
	name 					=	NAME_Ring;

	mainflag 				=	ITEM_KAT_MAGIC;
	flags 					=	ITEM_RING;

	value 					=	600;

	visual 					=	"ItRi_Dex_Strg_01.3ds";

	visual_skin 				=	0;
	material 				=	MAT_METAL;
	on_equip				=	Equip_Machtring2;
	on_unequip				=	UnEquip_Machtring2;

	description		= "Pierœcieñ krzepy wojownika";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 8;
	TEXT[3] 		= NAME_Bonus_Dex;
	COUNT[3]		= 8;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

FUNC VOID Equip_Machtring2()
{
	B_Hack_ChangeAttribute(self,ATR_STRENGTH, 8);
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY, 8);
};

FUNC VOID UnEquip_Machtring2()
{
	B_Hack_ChangeAttribute(self,ATR_STRENGTH,- 8);
	B_Hack_ChangeAttribute(self,ATR_DEXTERITY, -8);
};	
		