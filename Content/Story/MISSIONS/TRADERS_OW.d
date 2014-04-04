// ************************************************************
// 			  		TRADERS OUTWORLD 
// ************************************************************
//
//-Rodney
//-Riordian
//-Wilk
//

// ************************************************************
// 			  		RODNEY
// ************************************************************
// Broñ, mikstury amunicja, magia i klamoty
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Rodney_TradeInvGiven;
var int Riordian_TradeInvGiven;

// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Rodney_Container(Npc_Default)
{
	name	=	"Magazynek Rodneya";
	//trader start inventory
	CreateInvItems(self,ItMINugget,142);
	
	CreateInvItems(self,ItMw_Pir_01,1);

	CreateInvItems(self,ItAmArrow,45);
	CreateInvItems(self,ItAmBolt,30);
	CreateInvItems(self,ItAmArrow_25,5);

	CreateInvItem(self,ItAt_WolfTeeth);
	CreateInvItem(self,ItMi_ArrowPack_01);
	
	CreateInvItems(self,ItArScrollLight,2);
	CreateInvItems(self,ItArScrollFirebolt,3);
	CreateInvItems(self,ItArScrollHeal,2);

	CreateInvItems(self,ItFo_wineberrys_01,3);
	CreateInvItems(self,ItFoLoaf,1);
	CreateInvItems(self,ItFoMutton,5);
	CreateInvItems(self,ItFoCheese,2);
	CreateInvItems(self,ItFoSoup,1);
	CreateInvItems(self,ItFoWine,2);
	CreateInvItems(self,ItFo_Gin,1);
	CreateInvItems(self,ItFo_Addon_Rum,3);
	CreateInvItems(self,ItFo_Stew,4);
	CreateInvItems(self,ItFo_Fish,5);	
	CreateInvItems(self, ItKeLockpick,2);

	CreateInvItem(self,ItMwPickaxe);	
	CreateInvItem(self,ItMw_1H_Sword_Old_01);	
	CreateInvItem(self,ItMw_1H_Sword_Short_04);	
	CreateInvItem(self,ItMw_1H_Mace_01);	
	CreateInvItems(self,ItMiSwordRaw,3);

	CreateInvItems(self, ItFo_Potion_Mana_01,1);
	CreateInvItems(self, ItFo_Potion_Health_01,3);
	CreateInvItems(self, ItFo_Potion_Health_03,1);
	
	CreateInvItems(self, ItMi_GoldNecklace,1);
	CreateInvItems(self, ItMi_SilverRing,1);

	CreateInvItems(self, ItFo_Potion_HP_1_temp,1);
	CreateInvItems(self, ItFo_Potion_MP_2_temp,1);
	CreateInvItems(self, ItFo_Potion_Str_2_temp,1);
	CreateInvItems(self, ItFo_Potion_Str_Dex_1_temp,1);

	CreateInvItem(self,ItRw_Bow_Small_01);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};
//-----------------------------------------------------------------
// EXIT RODNEY
//-----------------------------------------------------------------
INSTANCE DIA_PIR_2602_Rodney_Exit (C_INFO)
{
	npc			= PIR_2602_Rodney;
	nr			= 999;
	condition	= DIA_PIR_2602_Rodney_Exit_Condition;
	information	= DIA_PIR_2602_Rodney_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PIR_2602_Rodney_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_PIR_2602_Rodney_Exit_Info()
{
	Rodney_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Rodney_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos(self);
};

//-----------------------------------------------------------------
// RODNEY TRADE
//-----------------------------------------------------------------
instance PIR_2602_Rodney_TRADE(C_INFO)
{
	npc				= PIR_2602_Rodney;
	condition		= PIR_2602_Rodney_TRADE_Condition;
	information		= PIR_2602_Rodney_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= "(handel)";
};

FUNC int  PIR_2602_Rodney_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))
	{
      return 1;
	};
};
func void  PIR_2602_Rodney_TRADE_Info()
{
	AI_Output (other, self,"PIR_2602_Rodney_TRADE_Info_15_01"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"PIR_2602_Rodney_TRADE_Info_08_02"); //Nie zosta³o tego za du¿o, ale lepsze to ni¿ nic.
	AI_Output (other, self,"PIR_2602_Rodney_TRADE_Info_15_03"); //Nie jestem wybredny.
	
   if(!Rodney_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Rodney_Container);
      B_ClearTraderInv(container,self);		
	};
	Rodney_TradeInvGiven=TRUE;
	
	//Giving "Friendly" prices
	//BEST ONE FOR ARMORS
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_ARMOR_Mul	 	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1041865113);	//0.15
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1049414861);	//0.275
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1043542835);	//0.175
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
};

instance Riordian_Container(Npc_Default)
{
	name	=	"Magazynek Riordiana";
	//trader start inventory
	B_GiveRiordianChapter1Potions(self);	
   
   if (Kapitel > 1)
   {
      B_GiveRiordianChapter2Potions(self);
   }
   else if (Kapitel > 2)
   {
      B_GiveRiordianChapter3Potions(self);	
   } 
   else if (Kapitel > 3)
   {
      B_GiveRiordianChapter4Potions(self);
   }
   else if (Kapitel > 4)
   {
      B_GiveRiordianChapter5Potions(self);	
   }
   else if (Kapitel > 5)
   {
      B_GiveRiordianChapter6Potions(self);
   };
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
};
//-----------------------------------------------------------------
// EXIT RIORDIAN
//-----------------------------------------------------------------
instance Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID Info_Riordian_EXIT_Info()
{
	Riordian_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Riordian_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos(self);
};

//-----------------------------------------------------------------
// RODNEY TRADE
//-----------------------------------------------------------------
instance KDW_605_Riordian_TRADE(C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= "Poka¿ mi, co masz do zaoferowania.";
};

FUNC int KDW_605_Riordian_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_605_Riordian_GREET))
	{
      return 1;
	};
};

func void KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Poka¿ mi, co masz do zaoferowania.
	
   if(!Riordian_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Riordian_Container);
      B_ClearTraderInv(container,self);		
	};
	Riordian_TradeInvGiven=TRUE;
	
	//Giving "Friendly" prices
	//BEST ONE FOR ARMORS
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_ARMOR_Mul	 	= mulf(Trade_ALL_Mul,1040187392);	//0.125
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1041865113);	//0.15
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1049414861);	//0.275
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1043542835);	//0.175
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,1045220557);	//0.20
};