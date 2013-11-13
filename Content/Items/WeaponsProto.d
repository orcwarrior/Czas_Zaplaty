PROTOTYPE WeaponsMelee (C_Item)
{
on_unequip	=	MeleeWeapUnEq;
on_equip	=	MeleeWeapEq;
};
PROTOTYPE CrossBow (C_Item)
{
makingmob 			=	2;	
on_unequip	=	RanWeapUnEq;
on_equip	=	RanWeapEq;
};
PROTOTYPE Bow (C_Item)
{
makingmob 			=	1;		
on_unequip	=	RanWeapUnEq;
on_equip	=	RanWeapEq;
};
Func void RanWeapEq()
{
	var C_ITEM EqRanWeap; var int id;
	id = R_GetEquipingItemID(self,INV_WEAPON);	
 	if(item.makingmob==1)
 	{
 	A_SetMunition(item,A_Munition,TRUE);
 	}	
 	else
 	{
 	A_SetMunition(item,B_Munition,FALSE);
 	};	
};
Func void RanWeapUnEq()
{
	var int id; var C_ITEM EqRanWeap;
	eqranweap = Npc_GetEquippedRangedWeapon(hero);
	A_ResetMunition(eqranweap);
};
Func void MeleeWeapEq()
{
	//sheats
	var int id; var int ptr;
	id = R_GetEquipingItemID(self,INV_WEAPON);	
	ptr = MEM_InstGetOffset(id);
	Create_Sheath(self,ptr);
		
	//dual var
	LastReadyWeaponIsDual=FALSE;	
	
 	//
	
};
Func void MeleeWeapUnEq()
{
	Destroy_Sheath(1,V_HeroSheath_Pointer);
};