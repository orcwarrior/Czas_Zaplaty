// ************************************************************
// 			  		TRADERS OUTWORLD 
// ************************************************************
//
//-Drax
//-Fox
//-Leren
//-Taran
//-Fisk
//-Vam
//
//

// ************************************************************
// 			  		DRAX
// ************************************************************
// Broñ, mikstury, amunicja, bizuteria i klamoty
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Drax_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Drax_Container(Npc_Default)
{
	name	=	"Magazynek Draxa";
	//trader start inventory
	CreateInvItems(self,ItMINugget,500);
	
	CreateInvItems(self,HUN_MW_01,2);
	CreateInvItem(self,HUN_MW_03);	
	CreateInvItems(self,RBL_MW_01,2);
	CreateInvItem(self,RBL_MW_02);
	
	CreateInvItems(self,HUN_RW_01,2);
	CreateInvItem(self,RBL_RW_01);	
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItAmBolt,50);
	CreateInvItems(self,ItAmArrow_25,10);
	CreateInvItems(self,ItAmArrow_15,15);
	CreateInvItems(self,ItAmFireArrow,3);
	CreateInvItems(self,ItAmIceArrow,2);
	CreateInvItems(self,ItAmPoisonArrow,5);
	CreateInvItems(self,ItAmBluntArrow,50);
	
	CreateInvItems(self,ItAmBolt_25,10);
	CreateInvItems(self,ItAmBolt_10,15);
	CreateInvItems(self,ItAmFireBolt,2);
	CreateInvItems(self,ItAmIceBolt,2);
	CreateInvItems(self,ItAmPoisonBolt,3);
	CreateInvItems(self,ItAmBluntBolt,25);
	
	CreateInvItems(self,ItMi_ArrowPack_01,2);
	
	CreateInvItems(self,ItMa_ironore,3);
	CreateInvItems(self,ItMa_carbon,3);
	CreateInvItems(self,ItMa_Iron,2);
	CreateInvItems(self,ItMa_Steel,3);
	CreateInvItems(self,ItMa_GoodSteel,2);	
	
	CreateInvItems(self,ItFo_wineberrys_01,3);
	CreateInvItems(self,ItFoLoaf,3);
	CreateInvItems(self,ItFoMutton,10);
	CreateInvItems(self,ItFoCheese,4);
	CreateInvItems(self,ItFo_Milk,3);
	CreateInvItems(self,ItFoWine,2);
	CreateInvItems(self,ItFo_Gin,1);
	CreateInvItems(self,ItFoBeer,2);
	CreateInvItems(self,ItFo_BeerMug,1);	
	CreateInvItems(self,ItFo_Stew,4);
	CreateInvItems(self, ItKeLockpick,10);
	CreateInvItems(self,ItMiSwordRaw,7);

	CreateInvItems(self,ItFoCheese,4);
	CreateInvItems(self,ItFo_Milk,3);
	CreateInvItems(self,ItFoWine,2);
	CreateInvItems(self,ItMa_Goodlumber,2);
	CreateInvItems(self,ItMa_lumber,5);
	CreateInvItems(self,ItMa_Wool,5);
		
	CreateInvItem(self,ItMwPickaxe);	
	CreateInvItem(self,ItMw_1H_Mace_Light_01);	
	CreateInvItem(self,ItMw_1H_Sword_Short_01);	
	CreateInvItem(self,ItMw_1H_Sword_Short_02);	
	CreateInvItem(self,ItMw_1H_Sword_Short_05);	
	CreateInvItem(self,ItMw_2H_Staff_01);	
	CreateInvItem(self,ItMw_1H_Mace_02);	
	CreateInvItem(self,ItMw_1H_Sword_01);	
	CreateInvItem(self,ItMw_1H_Sword_02);	
	CreateInvItem(self,ItMw_1H_Mace_War_01);	
	CreateInvItem(self,ItMw_1H_Sword_Long_01);	
	CreateInvItem(self,ItMw_1H_Axe_01);	
	CreateInvItem(self,ItMw_2H_Axe_Old_02);	
	CreateInvItem(self,ItMw_2H_Axe_light_01);	
	CreateInvItem(self,ItMw_2H_Sword_Light_01);	

	CreateInvItems(self, ItFo_Potion_Health_01,10);
	CreateInvItems(self, ItFo_Potion_Health_02,7);
	CreateInvItems(self, ItFo_Potion_Health_03,5);
	
// 	CreateInvItems(self, ItFo_Potion_HP_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_HP_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Str_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Str_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Str_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_HP_MP_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Edg_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Edg_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_pnt_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Prot_Total_1_temp,2);

	
	CreateInvItem(self,ItRw_Bow_Small_03);	
	CreateInvItem(self,ItRw_Bow_Long_02);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_01);	
	CreateInvItem(self,ItRw_Crossbow_Old_01);	
	
	flags = NPC_FLAG_IMMORTAL;
	Mdl_SetVisual			(self,	"Meatbug.mds");
					
};
//-----------------------------------------------------------------
// EXIT DRAX
//-----------------------------------------------------------------
INSTANCE DIA_HUN_819_Drax_Exit (C_INFO)
{
	npc			= HUN_819_Drax;
	nr			= 999;
	condition	= HUN_819_Drax_Exit_Condition;
	information	= HUN_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT HUN_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID HUN_819_Drax_Exit_Info()
{
	Drax_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Drax_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos	( self );
};

//-----------------------------------------------------------------
// DRAX TRADE
//-----------------------------------------------------------------
instance HUN_819_Drax_TRADE(C_INFO)
{
	npc				= HUN_819_Drax;
	condition		= HUN_819_Drax_TRADE_Condition;
	information		= HUN_819_Drax_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 990;
	description		= "(handel)";
};

FUNC int  HUN_819_Drax_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Drax_Hello))
	{

	return 1;

	};
};

func void  HUN_819_Drax_TRADE_Info()
{
	AI_Output (other, self,"HUN_819_Drax_TRADE_Info_15_01"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"HUN_819_Drax_TRADE_Info_08_02"); //Pewnie, je¿eli tylko masz rudê...
   
	if(!Drax_TradeInvGiven)
	{
	  printdebug("TRADER: Drax Inv not given");
      var c_npc container; container = HLP_GetNpc(Drax_Container);
	  if(!Hlp_IsValidNpc(container))
	  {
		printdebug("TRADER: Container not vailid Inv not given");
		Wld_InsertNpc(Drax_Container,	"INVISIBLE");	
		container = HLP_GetNpc(Drax_Container);
	  };
	  printdebug("TRADER: container => drax ..giving");
	  //Ork: To mo¿e troche pomóc z lagujacym handlem
      B_GiveAllInventory(container,self);		
	};
   
	Drax_TradeInvGiven=TRUE;
	printdebug("TRADER: Erase trade multipiler");
	Trade_EraseValue();
	Trade_WEAPON_Mul	= mulf(Trade_ALL_Mul,1041865113);//0.15*
};

// ************************************************************
// 			  		FISK
// ************************************************************
// Zarcie
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Fisk_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Fisk_Container(Npc_Default)
{
	name	=	"Magazynek Fiska";
	//trader start inventory
	CreateInvItems(self,ItMINugget,100);

	CreateInvItems(self,ItFo_wineberrys_01,10);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,10);
	CreateInvItems(self,ItFo_Fish,4);
	CreateInvItems(self,ItFo_Addon_Grog,2);
	CreateInvItems(self,ItFo_Addon_Rum,2);
	CreateInvItems(self,ItFoApple,20);
	CreateInvItems(self,ItFoMuttonRaw,3);
	CreateInvItems(self,ItFo_mutton_01,6);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoSoup,2);
	CreateInvItems(self,ItFoMeatbugragout,3);
	CreateInvItems(self,ItFoCrawlersoup,1);
	CreateInvItems(self,ItFo_Potion_Water_01,12);
	CreateInvItems(self,ItFoBooze,9);
	
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFo_Milk,3);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_Gin,7);
	CreateInvItems(self,ItFoBeer,8);
	CreateInvItems(self,ItFo_BeerMug,10);	
	CreateInvItems(self,ItFo_Stew,4);
	CreateInvItems(self, ItKeLockpick,5);

	CreateInvItems(self, ItWrWorldmap,1);				
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Fisk_Exit (C_INFO)
{
	npc			= RBL_311_FISK;
	nr			= 999;
	condition	= DIA_Fisk_Exit_Condition;
	information	= DIA_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Fisk_Exit_Info()
{
	Fisk_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Fisk_Container);
	B_ClearTraderInv(self,container);	
	B_StopProcessInfos	( self );
};

instance Dia_Fisk_Trade   (C_INFO) 
{ 
   npc     		= RBL_311_FISK; 
  	nr          		= 2; 
  	condition   		= Dia_Fisk_Trade_condition; 
  	information    	= Dia_Fisk_Trade_info; 
  	important     	= FALSE; 
  	permanent     	= 1; 
  	description    	= "Zasch³o mi w gardle."; 
   trade 		= 1;
}; 
 
func int Dia_Fisk_Trade_condition () 
{ 
   if (Npc_KnowsInfo(other,DIA_Fisk_Hello))
   { 
   	return TRUE; 
   }; 
}; 
 
func void Dia_Fisk_Trade_info () 
{ 
   AI_Output (other,self,"Dia_Fisk_Trade_15_01");  //Zasch³o mi w gardle.
   AI_Output (self, other,"Dia_Fisk_Trade_12_02");  //Jak masz czym zap³aciæ... 
 	
   if(!Fisk_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Fisk_Container);
      B_ClearTraderInv(container,self);		
	};
	
   Fisk_TradeInvGiven=TRUE; 
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1050253722);//0.30
}; 

var int Vam_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Vam_Container(Npc_Default)
{
	name	=	"Magazynek Vama";
	//trader start inventory
	CreateInvItems(self,ItMINugget,100);

	CreateInvItems(self,ItMa_lumber,10);
	CreateInvItems(self,ItMa_Goodlumber,10);
	CreateInvItems(self,ItMa_Bowlumber_01,10);
	CreateInvItems(self,ItMa_Bowlumber_02,5);
	CreateInvItems(self,ItMa_Bowlumber_03,5);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vam_Exit (C_INFO)
{
	npc			= RBL_2613_VAM;
	nr			= 999;
	condition	= DIA_Vam_Exit_Condition;
	information	= DIA_Vam_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vam_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vam_Exit_Info()
{
	Vam_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Vam_Container);
	B_ClearTraderInv(self,container);	
	B_StopProcessInfos	(self);
};

instance Dia_Vam_Trade   (C_INFO) 
{ 
   npc     		= RBL_2613_VAM; 
  	nr          		= 2; 
  	condition   		= Dia_Vam_Trade_condition; 
   information    	= Dia_Vam_Trade_info; 
  	important     	= FALSE; 
   permanent     	= 1; 
   description    	= "Chcia³bym kupiæ drewno."; 
   trade 		= 1;
}; 
 
func int Dia_Vam_Trade_condition () 
{ 
   if (Npc_KnowsInfo(other, RBL_2613_Vam_Ok))
   { 
   	return TRUE; 
   }; 
}; 
 
func void Dia_Vam_Trade_info () 
{ 
   AI_Output (other,self,"Dia_Vam_Trade_15_01");  //Chcia³bym kupiæ drewno.
   AI_Output (self, other,"Dia_Vam_Trade_12_02");  //Jak masz czym zap³aciæ... 
   
 	if(!Vam_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Vam_Container);
      B_ClearTraderInv(container,self);		
	};
   
	Vam_TradeInvGiven=TRUE; 
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
}; 
// ************************************************************
// 			  		Taran
// ************************************************************
// zielsko, mikstury
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Taran_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Taran_Container(Npc_Default)
{
	name	=	"Magazynek Tarana";
	//trader start inventory
	CreateInvItems(self,ItMINugget,125);

	CreateInvItems(self,ItFo_Plants_Berrys_01,10);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,5);
	CreateInvItems(self,ItFo_Plants_Seraphis_01,7);
	CreateInvItems(self,ItFo_Plants_Permherb_02,1);
	CreateInvItems(self,ItFo_Plants_Greyherb_01,2);
	CreateInvItems(self,ItFo_Plants_Hop_01,6);
	CreateInvItems(self,ItFoApple,15);
	CreateInvItems(self,ItFo_Plants_Velayis_01,3);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,2);
	CreateInvItems(self,ItFo_Plants_mountainmoos_02,4);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,3);
	CreateInvItems(self,ItFo_Plants_DEXPERM_01,1);
	CreateInvItems(self,ItFo_Plants_strPERM_01,1);
	CreateInvItems(self,ItFo_Plants_OrcHerb_01,2);
	
	CreateInvItems(self,ItFo_Plants_OrcHerb_02,4);
	CreateInvItems(self,ItFo_Plants_mushroom_01,9);
	CreateInvItems(self,ItFo_Plants_mushroom_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_01,7);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,4);
	CreateInvItems(self,ItFo_Plants_Herb_HpMax,2);
	CreateInvItems(self,ItFo_Plants_Herb_HpPerm,1);
	CreateInvItems(self,ItFo_Plants_Bloodwood_01,3);
	CreateInvItems(self,ItFo_Plants_Towerwood_01,2);
	CreateInvItems(self,ItFo_Plants_RavenHerb_01,4);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,1);
	CreateInvItems(self,ItFo_Plants_Stoneroot_01,6);	
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,4);	
	CreateInvItems(self,ItFo_Plants_Bloodherb_01,6);	

	CreateInvItems (self,ItArScrollFirebolt,10);
	CreateInvItems (self,ItArScrollLight,15);
	CreateInvItems (self,ItArScrollHeal,12);
	
	CreateInvItems (self,ItArScrollFireball,5);
	CreateInvItems (self,ItArScrollFirestorm,1);
	CreateInvItems (self,ItArScrollTrfWolf,1);
	CreateInvItems (self,ItArScrollTrfScavenger,2);
	CreateInvItems (self,ItArScrollTrfMolerat,1);
	CreateInvItems (self,ItArScrollTrfCrawler,1);
	CreateInvItems (self,ItArScrollTrfBloodfly,2);
	
	CreateInvItems (self,ItArScrollShrink,1);	

	CreateInvItems (self,ItArScrollThunderbolt,11);
	CreateInvItems (self,ItArScrollIcecube,4);
	CreateInvItems (self,ItArScrollThunderball,5);

	CreateInvItems (self,ItArScrollTrfMeatbug,1);
	CreateInvItems (self,ItArScrollTrfWaran,1);
	CreateInvItems (self,ItArScrollTrfOrcdog,1);	
	
	CreateInvItems (self,ItArScrollWindfist,2);
	CreateInvItems (self,ItArScrollFear,1);
	CreateInvItems (self,ItArScrollSleep,3);
	CreateInvItems (self,ItArScrollStormfist,2);
	CreateInvItems (self,ItArScrollControl,1);
	CreateInvItems (self,ItArScrollCharm,3);			
	
	CreateInvItems(self,ItMiJoint_1,16);	
	CreateInvItems(self,ItMiJoint_2,12);	
	CreateInvItems(self,ItMiJoint_3,9);	

	CreateInvItems(self,ItMi_Stuff_Pipe_01,2);
	
	CreateInvItems(self,ItFo_Potion_Edg_1_temp,2);	
// 	CreateInvItems(self,ItFo_Potion_Edg_2_temp,1);	
// 	CreateInvItems(self,ItFo_Potion_Edg_3_temp,1);		
	
	CreateInvItems(self,ItFo_Potion_Pnt_1_temp,2);	
// 	CreateInvItems(self,ItFo_Potion_Pnt_2_temp,1);	
// 	CreateInvItems(self,ItFo_Potion_Pnt_3_temp,1);
		
	CreateInvItems(self,ItFo_Potion_Fir_1_temp,2);	
// 	CreateInvItems(self,ItFo_Potion_Fir_2_temp,1);	
// 	CreateInvItems(self,ItFo_Potion_Fir_3_temp,1);
		
	CreateInvItems(self,ItFo_Potion_Mag_1_temp,2);	
// 	CreateInvItems(self,ItFo_Potion_Mag_2_temp,1);	
// 	CreateInvItems(self,ItFo_Potion_Mag_3_temp,1);
		
	CreateInvItems(self,ItFo_Potion_Prot_Total_1_temp,3);	
// 	CreateInvItems(self,ItFo_Potion_Prot_Total_2_temp,2);
	
	CreateInvItems(self,ItFo_Potion_Haste_02,3);		
 
	CreateInvItems(self,ItFo_Potion_Strength_02,1);		

	CreateInvItems(self,ItFo_Potion_Health_01,10);		
	CreateInvItems(self,ItFo_Potion_Health_02,7);		
	CreateInvItems(self,ItFo_Potion_Health_03,5);		
	CreateInvItems(self,ItFo_Potion_Health_04,3);		

	CreateInvItems(self,ItFo_Potion_Mana_01,10);		
	CreateInvItems(self,ItFo_Potion_Mana_02,7);		
	CreateInvItems(self,ItFo_Potion_Mana_03,5);		
	CreateInvItems(self,ItFo_Potion_Mana_04,3);			
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Taran_Exit (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_Taran_Exit_Condition;
	information	= DIA_Taran_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Taran_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Taran_Exit_Info()
{
	Taran_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Taran_Container);
	B_ClearTraderInv(self,container);	
	B_StopProcessInfos	( self );
};

instance Dia_Taran_Trade   (C_INFO) 
{ 
   npc     		= RBL_1331_BaalTaran; 
  	nr          	= 888; 
  	condition   	= Dia_Taran_Trade_condition; 
   information    	= Dia_Taran_Trade_info; 
  	important     	= FALSE; 
   permanent     	= 1; 
   description    	= "Chcia³em kupiæ ziele."; 
   trade 		= 1;
}; 
 
func int Dia_Taran_Trade_condition () 
{ 
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo1))
	{
		return 1;
	};
}; 
 
func void Dia_Taran_Trade_info () 
{ 
	AI_Output (other, self,"DIA_BaalTaran_WhatDo2_15_00"); //Chcia³em kupiæ ziele.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo2_05_01"); //Nie mog³eœ trafiæ lepiej...
 	
   if(!Taran_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Taran_Container);
      B_ClearTraderInv(container,self);		
	};
	
   Taran_TradeInvGiven=TRUE; 
	
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1041865113);//0.15
	Trade_MAGIC_Mul	 	= mulf(Trade_ALL_Mul,1041865113);//0.15
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1045220557);//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1050253722);//0.30
}; 

// ************************************************************
// 			  		Leren
// ************************************************************
// zielsko, mikstury, zwoje, runy?
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int Leren_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance Leren_Container(Npc_Default)
{
	name	=	"Magazynek Lerena";
	//trader start inventory
	CreateInvItems(self,ItMINugget,250);

	CreateInvItems(self,ItFo_Plants_Permherb_02,1);
	CreateInvItems(self,ItFo_Plants_Greyherb_01,1);
	CreateInvItems(self,ItFo_Plants_DEXPERM_01,1);
	CreateInvItems(self,ItFo_Plants_strPERM_01,1);
	CreateInvItems(self,ItFo_Plants_Herb_HpPerm,1);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,1);

	CreateInvItems(self,ItFo_Potion_HP_1_temp,2);	
 	CreateInvItems(self,ItFo_Potion_HP_2_temp,1);	
 	CreateInvItems(self,ItFo_Potion_HP_3_temp,1);		
	
	CreateInvItems(self,ItFo_Potion_MP_1_temp,2);	
 	CreateInvItems(self,ItFo_Potion_MP_2_temp,1);	

	CreateInvItems(self,ItFo_Potion_STR_1_temp,2);	
 	CreateInvItems(self,ItFo_Potion_STR_2_temp,1);	

	CreateInvItems(self,ItFo_Potion_DEX_1_temp,2);	
 	CreateInvItems(self,ItFo_Potion_DEX_2_temp,1);	

	CreateInvItems(self,ItFo_Potion_Str_Dex_1_temp,1);	
 	CreateInvItems(self,ItFo_Potion_HP_MP_1_temp,2);	
	
	CreateInvItems(self,ItFo_Potion_Haste_02,2);		
 
	CreateInvItems(self,ItFo_Potion_Mana_Perma_02,1);					

	CreateInvItem (self,ItArRuneLight);

	CreateInvItems (self,ItArScrollFirebolt,12);
	CreateInvItems (self,ItArScrollLight,14);
	CreateInvItems (self,ItArScrollHeal,16);
	CreateInvItems (self,ItArScrollFirerain,1); 	
	
	CreateInvItems (self,ItArScrollFireball,8);
	CreateInvItems (self,ItArScrollFirestorm,4);
	CreateInvItems (self,ItArScrollTrfWolf,1);
	CreateInvItems (self,ItArScrollTrfLurker,2);
	CreateInvItems (self,ItArScrollTrfScavenger,3);
	CreateInvItems (self,ItArScrollTrfMolerat,2);
	CreateInvItems (self,ItArScrollTrfCrawler,1);
	CreateInvItems (self,ItArScrollTrfBloodfly,2);
	
	CreateInvItems (self,ItArScrollShrink,1);	

	CreateInvItems (self,ItArScrollThunderbolt,14);
	CreateInvItems (self,ItArScrollIcecube,6);
	CreateInvItems (self,ItArScrollThunderball,8);
	CreateInvItems (self,ItArScrollIceWave,1);	

	CreateInvItems (self,ItArScrollTrfMeatbug,1);
	CreateInvItems (self,ItArScrollTrfWaran,1);
	CreateInvItems (self,ItArScrollTrfSnapper,1);
	CreateInvItems (self,ItArScrollTrfOrcdog,1);	
	
	CreateInvItems (self,ItArScrollWindfist,6);
	CreateInvItems (self,ItArScrollTelekinesis,4);
	CreateInvItems (self,ItArScrollFear,4);
	CreateInvItems (self,ItArScrollSleep,5);
	CreateInvItems (self,ItArScrollStormfist,3);
	CreateInvItems (self,ItArScrollControl,3);
	CreateInvItems (self,ItArScrollCharm,4);		
	//-------- Ringe und Amulette --------
	CreateInvItem (self,Ring_des_Lebens);
		
	//-------- Bücher --------
  	CreateInvItem (self,ItWr_Book_Circle_01);
	CreateInvItem (self,ItWr_Book_Circle_02);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Leren_Exit (C_INFO)
{
	npc			= mag_1604_Leren;
	nr			= 999;
	condition	= DIA_Leren_Exit_Condition;
	information	= DIA_Leren_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Leren_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Leren_Exit_Info()
{
	Leren_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(Leren_Container);
	B_ClearTraderInv(self,container);	
	B_StopProcessInfos	( self );
};

instance Dia_Leren_Trade   (C_INFO) 
{ 
   npc     		= mag_1604_Leren; 
  	nr          	= 990; 
  	condition   	= Dia_Leren_Trade_condition; 
  	information    	= Dia_Leren_Trade_info; 
  	important     	= FALSE; 
  	permanent     	= 1; 
  	description    	= "(handel)"; 
   trade 		= 1;
}; 
 
func int Dia_Leren_Trade_condition () 
{ 
   return TRUE; 
}; 
 
func void Dia_Leren_Trade_info () 
{  
   AI_Output (other,self,"Dia_Leren_Trade_15_01");  //Poka¿ te swoje skarby.
   AI_Output (self, other,"Dia_Leren_Trade_12_02");  //Mam nadziejê, ¿e masz rudê!
 	
   if(!Leren_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(Leren_Container);
      B_ClearTraderInv(container,self);		
	};
   
	Leren_TradeInvGiven=TRUE; 
	
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	Trade_RUNE_Mul	 	= mulf(Trade_ALL_Mul,1045220557);//0.20
	Trade_MAGIC_Mul	= mulf(Trade_ALL_Mul,1048576000);//0.25
	Trade_POTION_Mul	= mulf(Trade_ALL_Mul,1045220557);//0.20
	Trade_FOOD_Mul	 	= mulf(Trade_ALL_Mul,1050253722);//0.30	
	Trade_DOC_Mul	 	= mulf(Trade_ALL_Mul,1048576000);//0.25
}; 

// ************************************************************
// 			  		FOX
// ************************************************************
// Broñ, mikstury, amunicja, bizuteria i klamoty
// ************************************************************

// ************************************************************
// 			  		 VARIBLE
// ************************************************************
var int FOX_TradeInvGiven;
// ************************************************************
// 			  		CONTAINER
// ************************************************************
instance FOX_Container(Npc_Default)
{
	name	=	"Magazynek Foxa";
	//trader start inventory
	CreateInvItems(self,ItMINugget,100);
	
	CreateInvItems(self,HUN_MW_01,3);
	CreateInvItems(self,HUN_MW_03,2);	
	CreateInvItems(self,HUN_MW_02,2);	
	CreateInvItems(self,HUN_MW_04,2);	
	CreateInvItems(self,HUN_MW_05,2);	
	CreateInvItems(self,RBL_MW_01,3);
	CreateInvItems(self,RBL_MW_02,2);
	CreateInvItems(self,RBL_MW_03,2);	
	CreateInvItems(self,RBL_MW_04,2);	
	
	CreateInvItems(self,HUN_RW_01,3);
	CreateInvItems(self,HUN_RW_02,2);
	CreateInvItems(self,HUN_RW_03,2);
	CreateInvItems(self,RBL_RW_01,3);
	CreateInvItems(self,RBL_RW_02,2);
			  	
	CreateInvItem(self,ItMw_2H_Axe_light_01);
	CreateInvItem(self,ItMw_2H_Sword_01);	
	CreateInvItem(self,ItMw_2H_Sword_Light_04);	
	CreateInvItem(self,ItMw_2H_Axe_Old_01);	
	CreateInvItem(self,ItMw_1H_Sword_Broad_02);	
	CreateInvItem(self,ItMw_1H_Axe_02);
	CreateInvItem(self,ItMw_1H_Axe_01);
	CreateInvItem(self,ItMw_1H_Sword_Long_04);	
	CreateInvItem(self,ItMw_1H_Mace_War_02);	
	CreateInvItem(self,ItMw_1H_Sword_Short_01);	
	CreateInvItem(self,ItMw_1H_Mace_01);	
	
	CreateInvItems(self,ItAmArrow,100);
	CreateInvItems(self,ItAmBolt,100);
	CreateInvItems(self,ItMiSwordRaw,3);

	CreateInvItems(self,ItMa_ironore,10);
	CreateInvItems(self,ItMa_carbon,7);
	CreateInvItems(self,ItMiSwordRaw,6);
	CreateInvItems(self,ItMa_Iron,6);
	CreateInvItems(self,ItMa_Steel,5);
	CreateInvItems(self,ItMa_GoodSteel,1);
	CreateInvItems(self,ItMa_Goodlumber,1);
	CreateInvItems(self,ItMa_lumber,3);
	CreateInvItems(self,ItMa_Wool,7);		
		
	CreateInvItem(self,ItMwPickaxe);	
	CreateInvItem(self,ItMw_1H_Mace_Light_01);	
	CreateInvItem(self,ItMw_1H_Sword_Short_01);	
	CreateInvItem(self,ItMw_1H_Sword_Short_02);	
	CreateInvItem(self,ItMw_1H_Sword_Short_05);	
	CreateInvItem(self,ItMw_2H_Staff_01);	
	CreateInvItem(self,ItMw_1H_Mace_02);	
	CreateInvItem(self,ItMw_1H_Sword_01);	
	CreateInvItem(self,ItMw_1H_Sword_02);	
	CreateInvItem(self,ItMw_1H_Mace_War_01);	
	CreateInvItem(self,ItMw_1H_Sword_Long_01);	
	CreateInvItem(self,ItMw_1H_Axe_01);	
	CreateInvItem(self,ItMw_2H_Axe_Old_02);	
	CreateInvItem(self,ItMw_2H_Axe_light_01);	
	CreateInvItem(self,ItMw_2H_Sword_Light_01);	

// 	CreateInvItems(self, ItFo_Potion_HP_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_HP_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Str_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Str_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Str_Dex_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_HP_MP_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_Edg_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Edg_2_temp,1);
// 	CreateInvItems(self, ItFo_Potion_pnt_1_temp,2);
// 	CreateInvItems(self, ItFo_Potion_Prot_Total_1_temp,2);

	CreateInvItem(self,ItRw_Bow_Small_01);	
	CreateInvItem(self,ItRw_Bow_Long_03);	
	CreateInvItem(self,ItRw_Bow_Long_01);	
	CreateInvItem(self,ItRw_Crossbow_03);			
};
//-----------------------------------------------------------------
// EXIT FOX
//-----------------------------------------------------------------
INSTANCE DIA_RBL_2614_Fox_Exit (C_INFO)
{
	npc			= RBL_2614_Fox;
	nr			= 999;
	condition	= RBL_2614_Fox_Exit_Condition;
	information	= RBL_2614_Fox_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT RBL_2614_Fox_Exit_Condition()
{
	return 1;
};

FUNC VOID RBL_2614_Fox_Exit_Info()
{
	FOX_TradeInvGiven=FALSE;
	var c_npc container; container = HLP_GetNpc(FOX_Container);
	B_ClearTraderInv(self,container);
	B_StopProcessInfos	( self );
};

//-----------------------------------------------------------------
// FOX TRADE
//-----------------------------------------------------------------
instance RBL_2614_Fox_TRADE(C_INFO)
{
	npc				= RBL_2614_Fox;
	condition		= RBL_2614_Fox_TRADE_Condition;
	information		= RBL_2614_Fox_TRADE_Info;
	//important		= 1;
	permanent		= 1;
	trade 			= 1;
	nr				= 998;
	description		= "(handel)";
};

FUNC int  RBL_2614_Fox_TRADE_Condition()
{
	return 1;
};

func void  RBL_2614_Fox_TRADE_Info()
{
	AI_Output (other, self,"RBL_2614_Fox_TRADE_Info_15_01"); //Poka¿ mi swoje towary.
	AI_Output (self, other,"RBL_2614_Fox_TRADE_Info_08_02"); //Z przyjemnoœci¹!
	
   if(!FOX_TradeInvGiven)
	{
      var c_npc container; container = HLP_GetNpc(FOX_Container);
      B_ClearTraderInv(container,self);		
	};
	
   FOX_TradeInvGiven=TRUE;
	
	Trade_EraseValue();	//BUGFIX has to be in every trade dialog
	//All Multipilers default
};