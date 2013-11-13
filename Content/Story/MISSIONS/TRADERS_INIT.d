var int Trade_Category;// Contains category that hero "have" right now

var int Trade_ALL_Mul;//= 1065353216;//1

var int Trade_WEAPON_Mul;
var int Trade_ARMOR_Mul;
var int Trade_RUNE_Mul;
var int Trade_MAGIC_Mul;
var int Trade_FOOD_Mul;
var int Trade_POTION_Mul;
var int Trade_DOC_Mul;
var int Trade_MISC_Mul;

/* ITEM_KAT_NF | ITEM_KAT_FF | ITEM_KAT_MUN */
const int Trade_WEAPON_Default  = 1036831948;//0.10 (armormans - 0.15)
/* ITEM_KAT_ARMOR */
const int Trade_ARMOR_Default	= 1036831948;//0.10 (Stays unchanged)
/* ITEM_KAT_RUNE */
const int Trade_RUNE_Default	= 1036831948;//0.10 (mages 0.20)
/* ITEM_KAT_MAGIC */
const int Trade_MAGIC_Default	= 1036831948;//0.10 (mages 0.25)
/* ITEM_KAT_FOOD */
const int Trade_FOOD_Default	= 1048576000;//0.25 (0.30)
/*ITEM_KAT_POTIONS*/
const int Trade_POTION_Default	= 1041865113;//0.15 (mages 0.20)
/*ITEM_KAT_DOCS*/
const int Trade_DOC_Default    = 1041865113;//0.15 (mages 0.25)
/*ITEM_KAT_NONE*/
const int Trade_MISC_Default	= 1056964608;//0.5 CANT BE LOWER!!!

func void Trade_EraseValue()
{
	var int ptr;
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.ocViewDialogTrade
 	ptr = MEM_ReadInt(ptr+260);	//oCViewDialogItemContainer | NOT INVENTORY
 	MEM_WriteInt(ptr+264,0);	//value 	
	ptr = MEMINT_oCInformationManager_Address;
	ptr = MEM_ReadInt(ptr+24);//oCInformationManager.ocViewDialogTrade
 	ptr = MEM_ReadInt(ptr+252);	//oCViewDialogStealContainer | NOT INVENTORY
 	MEM_WriteInt(ptr+264,0);	//value 	 	
};

func void Trade_InitDefaultMultipilers()
{
	Trade_ALL_Mul = 1065353216;//1
	
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,Trade_WEAPON_Default);
	Trade_ARMOR_Mul	 	= mulf(Trade_ALL_Mul,Trade_ARMOR_Default);
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,Trade_RUNE_Default);
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,Trade_MAGIC_Default);
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,Trade_FOOD_Default);
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,Trade_POTION_Default);
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,Trade_DOC_Default);
	Trade_MISC_Mul	 	= Trade_MISC_Default;	
};