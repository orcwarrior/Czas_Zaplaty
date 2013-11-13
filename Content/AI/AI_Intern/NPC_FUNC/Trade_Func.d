var string Trade_LastCategory;
var int Trade_LastTimeWasntTrade;//bool
func void Trade_UpdateMul()
{
	if(MEM_ReadInt(MEMINT_oCInformationManager_Address+84) == 3)&&(Trade_LastTimeWasntTrade)//Dlg_Mode_Trade
	{
      Trade_LastTimeWasntTrade=TRUE;
		var string cat;  var int l;
		cat = Trade_GetHeroCatString();		
		//Remove next line character(?) -  []
		if(!Hlp_StrCmp(Cat,""))
		{
         l = STR_Len (cat); l = l-1;
         cat = Str_Prefix(cat,l);
		};
		
		//skipt if category wasn't changed;	
		if(Hlp_StrCmp(Cat,Trade_LastCategory))
		{
         return;
		};		
 		
 		if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT1))//weapons
		{
			Trade_ChangeSellMultiplier(Trade_WEAPON_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT2))//armors
		{
			Trade_ChangeSellMultiplier(Trade_ARMOR_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT3))//runes
		{
			Trade_ChangeSellMultiplier(Trade_RUNE_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT4))//magic
		{
 		 		Trade_ChangeSellMultiplier(Trade_MAGIC_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT5))//food
		{
			Trade_ChangeSellMultiplier(Trade_FOOD_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT6))//Pots
		{
			Trade_ChangeSellMultiplier(Trade_POTION_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT7))//Doc
		{
			Trade_ChangeSellMultiplier(Trade_DOC_Mul);
		}
		else if(Hlp_StrCmp(Cat,NAME_TRADE_SYS_CAT8))//Misc
		{
			Trade_ChangeSellMultiplier(Trade_MISC_Mul);
		};
		
		Trade_LastCategory = Cat;
	}
	else
	{
		Trade_LastTimeWasntTrade=TRUE;	
	};	
};