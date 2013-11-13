const string AM_BOW_STR = "Amunicja ³uku: ";
const string AM_CBOW_STR = "Amunicja kuszy: ";
const int AM_UNEQ_FLAGS = ITEM_BOW|ITEM_MULTI;
/*
=========================================================
	A M U N I T I O N   F U N C ' S
=========================================================
*/
//-------------------------------------------------------

//*******************************************************
// Am_Unequip
//--------------
// type = Arrow(0) or Bolt(1)
//*******************************************************
//-------------------------------------------------------
//Func void Am_Unequip(var int type)
//moved to Ammunition_Func
//-------------------------------------------------------

//*******************************************************
// Am_Equip
//--------------
// itm = item
// type = Arrow(0) or Bolt(1)
// action = UnEquip(0) or Equip(1)
//*******************************************************
//-------------------------------------------------------
Func void Am_Equip(var c_item itm,var int type)
{
	var int action; var int id;
	id = Hlp_GetInstanceID(itm);
	action=1;
	var C_ITEM EqRanWeap;
	if(Npc_HasEquippedRangedWeapon(hero))
	{
    EqRanWeap = Npc_GetEquippedRangedWeapon(hero);	
	};
	if(C_ItmHasFlag(itm,1<<30))//Equiped!
	{
		action=0;	
	};
	Am_Unequip(type);
	if(action==1)
	{
	itm.flags=itm.flags | 1 << 30 ;//| 1<<30 ;//| 1<<1 ;
	if(Npc_HasEquippedRangedWeapon(hero))
	{

       	if(type==0)
       	{
			A_SetMunition(EqRanWeap,A_munition,TRUE);
		}
		else
		{
			A_SetMunition(EqRanWeap,B_munition,FALSE);

		};		
	};

	}
	else//Unequip
	{
		if(type==0)
		{
			if(Npc_HasItems(hero,ItAmArrow)>0)&&(!Hlp_IsItem(itm,ItAmArrow))	
			{
				Npc_GetInvItem(hero,ItAmArrow);
				A_munition=A_POINT;
			}
			else if(Npc_HasItems(hero,ItAmArrow_15)>0)&&(!Hlp_IsItem(itm,ItAmArrow_15))	
			{
				Npc_GetInvItem(hero,ItAmArrow_15);
				A_munition=A_POINT_15;
			}
			else if(Npc_HasItems(hero,ItAmArrow_25)>0)&&(!Hlp_IsItem(itm,ItAmArrow_25))		
			{
				Npc_GetInvItem(hero,ItAmArrow_25);
				A_munition=A_POINT_25;
			}			
			else if(Npc_HasItems(hero,ItAmBluntArrow)>0)&&(!Hlp_IsItem(itm,ItAmBluntArrow))		
			{
				Npc_GetInvItem(hero,ItAmBluntArrow);
				A_munition=A_BLUNT;
			}					
			else if(Npc_HasItems(hero,ItAmFireArrow)>0)&&(!Hlp_IsItem(itm,ItAmFireArrow))		
			{
				Npc_GetInvItem(hero,ItAmFireArrow);
				A_munition=A_FIRE;
			}
			else if(Npc_HasItems(hero,ItAmPoisonArrow)>0)&&(!Hlp_IsItem(itm,ItAmPoisonArrow))		
			{
				Npc_GetInvItem(hero,ItAmPoisonArrow);
				A_munition=A_POISON;
			}	
			else if(Npc_HasItems(hero,ItAmIceArrow)>0)&&(!Hlp_IsItem(itm,ItAmIceArrow))		
			{
				Npc_GetInvItem(hero,ItAmIceArrow);
				A_munition=A_ICE;
			}	
			else if(Npc_HasItems(hero,id)>0)
			{
				Npc_GetInvItem(hero,id);
				if(Hlp_IsItem(itm,ItAmArrow))
				{
					A_munition=A_POINT;				
				}	
				else if(Hlp_IsItem(itm,ItAmArrow_15))
				{
					A_munition=A_POINT_15;				
				}
				else if(Hlp_IsItem(itm,ItAmArrow_25))
				{
					A_munition=A_POINT_25;				
				}
				else if(Hlp_IsItem(itm,ItAmBluntArrow))
				{
					A_munition=A_BLUNT;				
				}
				else if(Hlp_IsItem(itm,ItAmFireArrow))
				{
					A_munition=A_FIRE;				
				}
				else if(Hlp_IsItem(itm,ItAmPoisonArrow))
				{
					A_munition=A_POISON;				
				}
				else if(Hlp_IsItem(itm,ItAmIceArrow))
				{
					A_munition=A_ICE;				
				};
			};	
			item.flags=item.flags | 1 << 30 ;
			if(Npc_HasEquippedRangedWeapon(hero))
			{
				A_SetMunition(EqRanWeap,A_munition,TRUE);	
			};		
		}
		else//BOLT
		{
			if(Npc_HasItems(hero,ItAmBolt)>0)&&(!Hlp_IsItem(itm,ItAmBolt))	
			{
				Npc_GetInvItem(hero,ItAmBolt);
				B_munition=B_POINT;
			}
			else if(Npc_HasItems(hero,ItAmBolt_10)>0)&&(!Hlp_IsItem(itm,ItAmBolt_10))	
			{
				Npc_GetInvItem(hero,ItAmBolt_10);
				B_munition=B_POINT_10;
			}
			else if(Npc_HasItems(hero,ItAmBolt_25)>0)&&(!Hlp_IsItem(itm,ItAmBolt_25))		
			{
				Npc_GetInvItem(hero,ItAmBolt_25);
				B_munition=B_POINT_25;
			}			
			else if(Npc_HasItems(hero,ItAmBluntBolt)>0)&&(!Hlp_IsItem(itm,ItAmBluntBolt))		
			{
				Npc_GetInvItem(hero,ItAmBluntBolt);
				B_munition=B_BLUNT;
			}					
			else if(Npc_HasItems(hero,ItAmFireBolt)>0)&&(!Hlp_IsItem(itm,ItAmFireBolt))		
			{
				Npc_GetInvItem(hero,ItAmFireBolt);
				B_munition=B_FIRE;
			}
			else if(Npc_HasItems(hero,ItAmPoisonBolt)>0)&&(!Hlp_IsItem(itm,ItAmPoisonBolt))		
			{
				Npc_GetInvItem(hero,ItAmPoisonBolt);
				B_munition=B_POISON;
			}	
			else if(Npc_HasItems(hero,ItAmIceBolt)>0)&&(!Hlp_IsItem(itm,ItAmIceBolt))		
			{
				Npc_GetInvItem(hero,ItAmIceBolt);
				B_munition=B_ICE;
			}	
			else if(Npc_HasItems(hero,id)>0)
			{
				Npc_GetInvItem(hero,id);
				if(Hlp_IsItem(itm,ItAmBolt))
				{
					B_munition=B_POINT;				
				}	
				else if(Hlp_IsItem(itm,ItAmBolt_10))
				{
					B_munition=B_POINT_10;				
				}
				else if(Hlp_IsItem(itm,ItAmBolt_25))
				{
					B_munition=B_POINT_25;				
				}
				else if(Hlp_IsItem(itm,ItAmBluntBolt))
				{
					B_munition=B_BLUNT;				
				}
				else if(Hlp_IsItem(itm,ItAmFireBolt))
				{
					B_munition=B_FIRE;				
				}
				else if(Hlp_IsItem(itm,ItAmPoisonBolt))
				{
					B_munition=B_POISON;				
				}
				else if(Hlp_IsItem(itm,ItAmIceBolt))
				{
					B_munition=B_ICE;				
				};
			};	
			item.flags=item.flags | 1 << 30 ;		
			if(Npc_HasEquippedRangedWeapon(hero))
			{		
				A_SetMunition(EqRanWeap,B_munition,TRUE);
			};
		};
	};
};

//=====================
// AmunitioOnState
//=====================
FUNC VOID ArrowOnState()
{
	A_munition=A_POINT;	
	Am_Equip(item,0);
};
FUNC VOID Arrow_15_OnState()
{
	A_munition=A_POINT_15;	
	Am_Equip(item,0);
};
FUNC VOID Arrow_25_OnState()
{
	A_munition=A_POINT_25;
	Am_Equip(item,0);
};
FUNC VOID FireArrowOnState()
{
	A_munition=A_FIRE;	
	Am_Equip(item,0);
};
FUNC VOID IceArrowOnState()
{
	A_munition=A_ICE;	
	Am_Equip(item,0);
};
FUNC VOID BluntArrowOnState()
{
	A_munition=A_BLUNT;	
	Am_Equip(item,0);
};
FUNC VOID POISONArrowOnState()
{
	A_munition=A_POISON;	
	Am_Equip(item,0);
};
////////////
// BOLTS
////////////

FUNC VOID BoltOnState()
{
	B_munition=B_POINT;			
	Am_Equip(item,1);
};
FUNC VOID Bolt_10_OnState()
{
	B_munition=B_POINT_10;		
	Am_Equip(item,1);
};
FUNC VOID Bolt_25_OnState()
{
	B_munition=B_POINT_25;				
	Am_Equip(item,1);
};
FUNC VOID FireBoltOnState()
{
	B_munition=B_FIRE;		
	Am_Equip(item,1);
};
FUNC VOID IceBoltOnState()
{
	B_munition=B_ICE;		
	Am_Equip(item,1);
};
FUNC VOID BluntBoltOnState()
{
	B_munition=B_BLUNT;		
	Am_Equip(item,1);
};
FUNC VOID POISONBoltOnState()
{
	B_munition=B_POISON;		
	Am_Equip(item,1);
};
/*
=========================================================
	A M U N I T I O N   ( C _ I T E M )
=========================================================
*/

/*
=========================================================
	A R R O W S
=========================================================
*/
//Arrow
INSTANCE ItAmArrow(C_Item)
{
	name 				=	"Strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Arrow_0.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	ArrowOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//Arrow+15%
INSTANCE ItAmArrow_15(C_Item)
{
	name 				=	"Strza³a z piór harpii";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	4;

	visual 				=	"ItAm_Arrow_015.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	Arrow_15_OnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	TEXT[1]			= "Zadaje wiêksze obra¿enia";
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//Arrow+25%
INSTANCE ItAmArrow_25(C_Item)
{
	name 				=	"Z³ota strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItAm_Arrow_025.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	Arrow_25_OnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	TEXT[1]			= "Zadaje znacznie wiêksze obra¿enia";
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//ArrowFire
INSTANCE ItAmFireArrow(C_Item)
{
	name 				=	"Ognista strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItAm_Arrow_0.3ds";//"ITAMFIREARROW.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	FireArrowOnState;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//ArrowIce
INSTANCE ItAmIceArrow(C_Item)
{
	name 				=	"Lodowa strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	50;

	visual 				=	"ITAMICEARROW.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	IceArrowOnState;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//ArrowPosion -300hp at 100s
INSTANCE ItAmPoisonArrow(C_Item)
{
	name 				=	"Zatruta strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	12;

	visual 				=	"ItAm_Arrow_0.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	PoisonArrowOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//ArrowBlunt don't kill target
INSTANCE ItAmBluntArrow(C_Item)
{
	name 				=	"Og³uszaj¹ca strza³a";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Arrow_Blunt.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	BluntArrowOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
/*
=========================================================
	B O L T S
=========================================================
*/
INSTANCE ItAmBolt(C_Item)
{
	name 				=	"Be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Bolt_0.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	BoltOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//Bolt+15%
INSTANCE ItAmBolt_10(C_Item)
{
	name 				=	"Stalowy be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	5;

	visual 				=	"ItAm_Bolt_01.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	Bolt_10_OnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	TEXT[1]			= "Zadaje wiêksze obra¿enia";
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//Bolt+25%
INSTANCE ItAmBolt_25(C_Item)
{
	name 				=	"Z³oty be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	36;

	visual 				=	"ItAm_Bolt_025.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	Bolt_25_OnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	TEXT[1]			= "Zadaje znacznie wiêksze obra¿enia";
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//BoltFire
INSTANCE ItAmFireBolt(C_Item)
{
	name 				=	"Ognisty be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	60;

	visual 				=	"ITAMFIREBolt.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	FireBoltOnState;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//BoltIce
INSTANCE ItAmIceBolt(C_Item)
{
	name 				=	"Lodowy be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	50;

	visual 				=	"ITAMICEBolt.ZEN";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	IceBoltOnState;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//BoltPosion -300hp at 100s
INSTANCE ItAmPoisonBolt(C_Item)
{
	name 				=	"Zatruty be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	12;

	visual 				=	"ItAm_Bolt_0.3ds";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	PoisonBoltOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};
//BluntBolt don't kill target
INSTANCE ItAmBluntBolt(C_Item)
{
	name 				=	"Og³uszaj¹cy be³t";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW|ITEM_MULTI;

	value 				=	1;

	visual 				=	"ItAm_Bolt_Blunt.3DS";
	material 			=	MAT_WOOD;

	description			= name;
	scemename			=	"NONE";
	on_state[0]			=	BluntBoltOnState;	
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};