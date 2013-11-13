///////////////////////////////////////
// ToDo
///////////////////////////////////////
// -HerbPsi
//
///////////////////////////////////////
///////////////////////////////////////
/////////////////////VAR's/////////////
///////////////////////////////////////
///////////////////////////////////////
var string itemname;
var int recept;
var int PRINTNEEDITEMS;
var int recept_inst;
var int recept_inuse;
var int receptshow;
var int smallestamount;
var int itemscanbeproduced;
var int itm_num;
var int itemtocreate;
var int max_itemamount;
var int ITMMAKE;
var int R_CreateColdown;
var int R_ItemsProduced;
var float R_CreateColdownFloat;
var int item_to_create_start;
/////////////////////////
var int CreationMethod;
const int R_NULL = 0;
const int R_BS = 1;
const int R_BS_FIRE = 2;
const int R_BS_ANVIL = 3;
const int R_LAB_PSI = 4;
const int R_MOB_CAULDRON = 5;
const int R_MOB_PAN = 6;
const int R_HERB_PSI = 7;
//////////////////////////////////////////////////
//////////////////////////////////////////////////
// R_CreatesSucess
//func which return 
//succed creates of returns amount
//TODO:ADD OTHERS SKILLS!!!
/////////////////////////////////////////////////

func int R_CreatesSucess(var int returns,var C_ITEM recept)
{
   if(returns==0)
   {
      return 0;
   }
   else if((1+Hlp_Random(recept.range/2)+recept.range/2 <= Npc_GetTalentValue(hero,NPC_TALENT_SMITH) )&&(CreationMethod == R_BS_ANVIL)||(CreationMethod == R_BS)||(CreationMethod == R_BS_FIRE))
 		||
 		((1+Hlp_Random(recept.range/2)+recept.range/2 <= Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY) )&&(CreationMethod != R_BS_ANVIL)&&(CreationMethod != R_BS)&&(CreationMethod != R_BS_FIRE))
   {
      return 1+R_CreatesSucess(returns-1,recept);
   }
   else
   {
      return R_CreatesSucess(returns-1,recept);
   };
};

FUNC VOID R_StoreReceptID()
{
	recept_inst = Hlp_GetInstanceID(item);	
};

FUNC INT R_GetCreationMethod(var C_Item recept)
{
	CreationMethod = item.makingmob;
// 		else if(item.makingmob==9)||(item.makingmob==10)||(item.makingmob==11)
// 		{	CreationMethod = R_MOB_CAULDRON;}
// 		else if(item.makingmob==12)||(item.makingmob==13)||(item.makingmob==14)
// 		{	CreationMethod = R_LAB_PSI;}	
// 		else if(item.makingmob==15)||(item.makingmob==16)
// 		{	CreationMethod = R_MOB_PAN;};			
   return CreationMethod;
};

FUNC VOID R_ReStoreReceptItem()
{
	var c_npc itmmast;
	itmmast = Hlp_GetNPC(MOD_ITEMMASTER);	
	CreateInvItem(itmmast,recept_inst);
	Npc_GetInvItem(itmmast,recept_inst);	
};
//*****************************************
// Get_Product_Name()
//*****************************************
// Zwraca nazwe produktu
//*****************************************
FUNC string Get_Product_Name()
{   
	var string itmdescmsg;	
	R_StoreReceptID();
	R_GetItem(item.product);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();	
	return itmdescmsg;
};
//*****************************************
// Get_Product_Amount()
//*****************************************
// Zwraca iloœæ produktu
//*****************************************
FUNC string Get_Product_Amount()
{   
	if(item.product != 0)
	{
		return IntToString(item.product_amount);
	}
	else
	{
		return "0";
	};
};
//*****************************************
// Get_needitm(n)_Name/Amount()
//*****************************************
// Zwraca iloœæ/nazwe sk³adnika nr 1-11(0-10)
// u¿ywane zmienne: 
//needitm[3],protection[7] - instance
//needitm_amount[3],damage[7] - wymagane iloœci
//*****************************************
FUNC string Get_needitm0_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.needitm[0]);
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm0_Amount()
{   
	if(item.needitm_amount[0] != 0)
	{
		return IntToString(item.needitm_amount[0]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm1_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.needitm[1]);
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm1_Amount()
{   
	if(item.needitm_amount[1] != 0)
	{
		return IntToString(item.needitm_amount[1]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm2_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.needitm[2]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm2_Amount()
{   
	if(item.needitm_amount[2] != 0)
	{
		return IntToString(item.needitm_amount[2]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm3_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[0]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm3_Amount()
{  
	if(item.damage[0] != 0)
	{
		return IntToString(item.damage[0]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm4_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[1]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm4_Amount()
{  
	if(item.damage[1] != 0)
	{
		return IntToString(item.damage[1]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm5_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[2]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm5_Amount()
{  
	if(item.damage[2] != 0)
	{
		return IntToString(item.damage[2]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm6_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[3]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm6_Amount()
{  
	if(item.damage[3] != 0)
	{
		return IntToString(item.damage[3]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm7_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[4]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm7_Amount()
{  
	if(item.damage[4] != 0)
	{
		return IntToString(item.damage[4]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm8_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[5]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm8_Amount()
{  
	if(item.damage[5] != 0)
	{
		return IntToString(item.damage[5]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm9_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[6]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm9_Amount()
{  
	if(item.damage[6] != 0)
	{
		return IntToString(item.damage[6]);
	}
	else
	{
		return "0";
	};
};
FUNC string Get_needitm10_Name()
{   
	R_StoreReceptID();
	var string itmdescmsg;	
	R_GetItem(item.protection[7]);	
	itmdescmsg			=	item.description;	
	R_ReStoreReceptItem();			
	return itmdescmsg;
};
FUNC string Get_needitm10_Amount()
{   	
	if(item.damage[7] != 0)
	{
		return IntToString(item.damage[7]);
	}
	else
	{
		return "0";
	};
};

//*****************************************
// Get_needitm(n)_Name/Amount()
//*****************************************
// |----> |\    | |==
// |	  | \   | |   \\
// |----> |  \  | |   ||
// |	  |   \ | |   //
// |----> |    \| |==
///////////////////////////////////////////


//*****************************************
// R_GetCreateChance
//*****************************************
// Zwraca szanse na stworzenie przedmiotu
//*****************************************
Func int R_GetCreateChance()
{
	var int ret;
	var int a;
	var int b;
	R_GetItem(recept_inuse);
   
	if(CreationMethod == R_BS_ANVIL)||(CreationMethod == R_BS)||(CreationMethod == R_BS_FIRE)
	{
		a = item.range/2;
		a = 2*a-a; 
		b = item.range/2;
		b = Npc_GetTalentValue(hero,NPC_TALENT_SMITH)-b;		
      ret = Math_Round(Math_Percent(a,b));	
	}
	else
	{
		a = item.range/2;
		a = 2*a-a; 
		b = item.range/2;
		b = Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY)-b;		
      ret = Math_Round(Math_Percent(a,b));	
	};	
   
	if(ret > 100){ret=100;}else if(ret < 0){ret=0;};
	return ret;
};
//*****************************************
// R_CreateProduct
//*****************************************
// Funkcja tworz¹ca produkt recepty.
// niszczy z ekwipunku przedmioty potrzebne do recepty.
// Losuje tak¿e czy uda sie stworzyæ przedmiot.
//*****************************************
FUNC VOID R_CreateProduct(var C_ITEM recept)
{
	var int succesed_creations;
	var string productname;
	productname = Get_Product_Name();

	if(recept.needitm[0] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.needitm[0],recept.needitm_amount[0]);
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.needitm[0],recept.needitm_amount[0]*itemtocreate);		
		};	
	};
   
	if(recept.needitm[1] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.needitm[1],recept.needitm_amount[0]);
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.needitm[1],recept.needitm_amount[0]*itemtocreate);		
		};
	};
   
	if(recept.needitm[2] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.needitm[2],recept.needitm_amount[0]);
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.needitm[2],recept.needitm_amount[0]*itemtocreate);		
		};
	};	
   
	if(recept.needitm[2] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.needitm[0],recept.needitm_amount[0]);
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.needitm[0],recept.needitm_amount[0]*itemtocreate);		
		};
	};				
   
	if(recept.protection[0] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[0],recept.damage[0]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[0],recept.damage[0]*itemtocreate);		
		};	
	};	
   
	if(recept.protection[1] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[1],recept.damage[1]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[1],recept.damage[1]*itemtocreate);		
		};
	};	
   
	if(recept.protection[2] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[2],recept.damage[2]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[2],recept.damage[2]*itemtocreate);		
		};
	};		
   
	if(recept.protection[3] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[3],recept.damage[3]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[3],recept.damage[3]*itemtocreate);		
		};
	};	
   
	if(recept.protection[4] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[4],recept.damage[4]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[4],recept.damage[4]*itemtocreate);		
		};
	};	
   
	if(recept.protection[5] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[5],recept.damage[5]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[5],recept.damage[5]*itemtocreate);		
		};
	};
   
	if(recept.protection[6] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[6],recept.damage[6]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[6],recept.damage[6]*itemtocreate);		
		};
	};
   
	if(recept.protection[7] != 0)
	{
		if(CreationMethod == R_BS)
		{
         Npc_RemoveInvItems(hero,recept.protection[7],recept.damage[7]);	
		}
		else
		{
         Npc_RemoveInvItems(hero,recept.protection[7],recept.damage[7]*itemtocreate);		
		};
	};
   
   var string msg;
	var string prodname;
	prodname = Get_Product_Name();
   
	if(CreationMethod == R_BS)
	{//IF BS create only ne product
		succesed_creations=R_CreatesSucess(recept.product_amount,recept);
		
      if(succesed_creations)
		{
			msg = ConcatStrings("Uda³o ci siê wytworzyæ ",prodname);		
			msg = ConcatStrings(msg,".");	
			PutMsg(msg,"font_default.tga",RGBAToZColor(155,255,155,255),2*8,"");	
			CreateInvItems(hero,recept.product,1);			
		}
		else
		{
			msg = "Nie uda³o ci siê wytworzyæ przedmiotu.";
			PutMsg(msg,"font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		};
	}
	else
	{//ELSE create all at once
		succesed_creations=R_CreatesSucess(recept.product_amount*itemtocreate,recept);
      
		if(succesed_creations)
		{
			msg = ConcatStrings("Uda³o ci siê wytworzyæ ",IntToString(succesed_creations));
			msg = ConcatStrings(msg,"/");		
			msg = ConcatStrings(msg,IntToString(itemtocreate));		
			msg = ConcatStrings(msg," ");			
			msg = ConcatStrings(msg,prodname);		
			msg = ConcatStrings(msg,".");	
			PutMsg(msg,"font_default.tga",RGBAToZColor(255,205,155,255),2*8,"");	
			CreateInvItems(hero,recept.product,succesed_creations);			
		}
		else
		{
			msg = "Nie uda³o ci siê wytworzyæ ¿adnego przedmiotu.";
			PutMsg(msg,"font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		};
	};
};
//*****************************************
// R_IsSmallestAmount
//*****************************************
// Funkcja pêtluj¹ca, zwraca mozliw¹
// iloœæ przedmiotów do wykonania
//*****************************************
FUNC void R_IsSmallestAmount(var int amount,var int itm,var int pos) //zmienione przez Adanosa 2012-03-10
{
	R_GetItem(itm);	
	var int n_itm;
	var int n_amount;
   
   n_amount = 9999;
   
	if(Hlp_GetInstanceID(item) != 0)
	{	
		if(smallestamount > amount)
		{		
			smallestamount = amount;																				
		};		
	};
   
	R_GetItem(recept_inuse);	
   
	if(pos == 1)
	{
      if(item.needitm_amount[2])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.needitm[2])/item.needitm_amount[2]);	
      };
	
      n_itm = item.needitm[2];						
	}
	else if(pos == 2)
	{
      if(item.protection[0])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[0])/item.damage[0]);	
      };
	
      n_itm = item.protection[0];							
	}
	else if(pos == 3)
	{
      if(item.protection[1])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[1])/item.damage[1]);	
      };
	
      n_itm = item.protection[1];							
	}	
	else if(pos == 4)
	{
      if(item.protection[2])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[2])/item.damage[2]);	
      };
	
      n_itm = item.protection[2];							
	}	
	else if(pos == 5)
	{
      if(item.protection[3])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[3])/item.damage[3]);	
      };
	
      n_itm = item.protection[3];							
	}
	else if(pos == 6)
	{
      if(item.protection[4])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[4])/item.damage[4]);	
      };
	
      n_itm = item.protection[4];							
   }
	else if(pos == 7)
	{
      if(item.protection[5])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[5])/item.damage[5]);	
      };
	
      n_itm = item.protection[5];							
	}
	else if(pos == 8)
	{
      if(item.protection[6])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[6])/item.damage[6]);	
      };
		
      n_itm = item.protection[6];							
	}
	else if(pos == 9)
	{
      if(item.protection[7])
      {
         n_amount = Math_Round(Npc_HasItems(hero,item.protection[7])/item.damage[7]);	
      };
	
      n_itm = item.protection[7];	
      itemscanbeproduced = smallestamount;
      return;							
	};
   
	itemscanbeproduced = smallestamount;				
	R_IsSmallestAmount(Math_Round(n_amount),n_itm,pos+1);
};	
//********************************************************************
// R_GetItemsAmountCanBeProduced()
//********************************************************************
// Funkcja która zwraca iloœæ mo¿liwych do wykonania przedmiotów
//********************************************************************
FUNC int R_GetItemsAmountCanBeProduced(var C_Item recept)
{
	var int a;
   
	if(recept.needitm_amount[0])
	{
		a = Math_Round(Npc_HasItems(hero,recept.needitm[0])/recept.needitm_amount[0]);
	}
	else
	{ 
      a = 9999;	
   };
	
   smallestamount = a;	
// 	if(recept.needitm_amount[0])
// 	{
// 		a = Math_Round(Npc_HasItems(hero,recept.needitm[1])/recept.needitm_amount[1]);
// 	}
// 	else
// 	{ a = 9999;	};
	
	R_IsSmallestAmount(a,recept.needitm[1],0);
	R_GetItem(recept_inuse);			
	return itemscanbeproduced;
};
//**********************************
// UseRecept()
//**********************************
// Funkcja g³owna, u¿ywana przez
// prototyp recepty
//**********************************
func void UseRecept()
{
// 	var c_npc itmmast;                    
// 	itmmast = Hlp_GetNPC(MOD_ITEMMASTER);	
// 	B_ClearInventory(itmmast);

   var oCNpc npc; //dodane przez Adanosa 2012-03-10
   var int npcptr;
   npc = Hlp_GetNpc(pc_hero);

   npcptr = MEM_InstToPtr(npc);
   CALL__thiscall (npcptr, oCNpc__CloseInventory_offset);
	
	recept_inuse = Hlp_GetInstanceID(item);		
	R_GetItemsAmountCanBeProduced(item);
	R_GetCreationMethod(item);
	MOBSIDIALOG = RECEPTDIALOG;	
	Npc_SetAivar(hero,AIV_INVINCIBLE,TRUE);	
	B_ProcessInfos (hero);			
};

//**********************************
// R_VisualCreateItems.
//**********************************
// Funkcja odpowiadaj¹ca za wizualne tworzenie przedmiotu.
// 1MOB-2MOB-(sprawdzenie czy robic wiecej itemów)-1MOB...
//**********************************
func void R_NoneItems() //dodane przez Adanosa 2012-03-10
{
   if(!Npc_HasItems(hero,ItMw_1H_Sledgehammer_01))
	{
		PutMsg("Nie posiadasz m³ota kowalskiego!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
	};
				
   if(!Npc_HasItems(hero,ItMiTongs))
	{
		PutMsg("Nie posiadasz szczypiec!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
	};
				
   if(!Wld_IsFPAvailable(hero,"FP_BS_FIRE"))
	{
		PutMsg("W poblizu nie ma paleniska!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
	};
};

func void R_PreUseMob(var string MOBNAME, var string FPNAME)
{
   AI_GotoFP(hero,FPNAME); 
	AI_AlignToFP(hero);			
	AI_UseMob(hero, MOBNAME, 1);
};

func void R_UseMob(var string MOBNAME, var string FPNAME, var float a)
{
   R_PreUseMob(MOBNAME, FPNAME);
	AI_Wait(hero,a);		
	AI_UseMob(hero, MOBNAME, -1);
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
};

func void R_VisualCreateItems()
{
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
	AI_StopProcessInfos(hero);		
		
   if(R_CreateColdown>=999999)
	{
		PutMsg("Zbyt d³ugi czas tworzenia przedmiotu!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		return;
	};
		
   if(itemtocreate > 1)&&(CreationMethod == R_BS)
	{
		PutMsg(ConcatStrings("Pozosta³o ",ConcatStrings(IntToString(itemtocreate-R_ItemsProduced)," przedmiotów do wytworzenia.")),"font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");	
	};
		
   R_ItemsProduced=R_ItemsProduced+1;				
		
   if(CreationMethod == R_BS)
	{
		if((Wld_IsFPAvailable(hero,"FP_BS_FIRE"))||(R_ItemsProduced > 0))//&&(Wld_IsFPAvailable(hero,"FP_BS_ANVIL"))&&(Wld_IsFPAvailable(hero,"FP_BS_COOL"))&&(Wld_IsFPAvailable(hero,"FP_BS_SHARP"))
			//items
		&&(Npc_HasItems(hero,ItMw_1H_Sledgehammer_01)>0)&&(Npc_HasItems(hero,ItMiTongs)>0)
		{		
// 		var int hammerfix;
// 		hammerfix = Npc_HasItems(hero,ItMw_1H_Sledgehammer_01);
			CreateInvItems(hero,ItMw_1H_Sledgehammer_01,2);			
			//////////////////////////////
			//			BS_FIRE
			//////////////////////////////				
			AI_SetWalkmode 	(hero,NPC_WALK);	
			var float a;
			a=IntToFloat(R_CreateColdown/7);
			
			MOBNAME ="BSFIRE"; FPNAME= "FP_BS_FIRE";

         R_UseMob(MOBNAME, FPNAME, a);
			//////////////////////////////
			//			BS_ANVIL
			//////////////////////////////				
			a=IntToFloat((R_CreateColdown*3)/7);	
         
			MOBNAME ="BSANVIL"; FPNAME= "FP_BS_ANVIL";	
         
			R_UseMob(MOBNAME, FPNAME, a);		
			//////////////////////////////
			//			BS_COOL
			//////////////////////////////			
			a=IntToFloat(R_CreateColdown/7);
		
			MOBNAME ="BSCOOL"; FPNAME= "FP_BS_COOL";	
         
			R_UseMob(MOBNAME, FPNAME, a);			
			//////////////////////////////
			//			BS_SHARP
			//////////////////////////////				
			a=IntToFloat((R_CreateColdown*2)/7);

			MOBNAME ="BSSHARP"; FPNAME= "FP_BS_SHARP";
         
			R_PreUseMob(MOBNAME, FPNAME);
		}
		else
		{
			R_NoneItems();
		};
	}//R_BS end	
	else if(Wld_IsMobAvailable(hero,"BSFIRE"))
	{
		if(Wld_IsFPAvailable(hero,"FP_BS_FIRE"))
		{		
		   //////////////////////////////
			//			BS_FIRE
			//////////////////////////////							
			AI_SetWalkmode 	(hero,NPC_WALK);	
			a=IntToFloat(R_CreateColdown/7);			
			MOBNAME ="BSFIRE"; FPNAME= "FP_BS_FIRE";
			R_PreUseMob(MOBNAME, FPNAME);
			a	=	IntToFloat(R_CreateColdown/2);
//			AI_Wait(hero,a);		
//			AI_UseMob		(hero,	MOBNAME,	-1);	
		}								
		else
		{
			PutMsg("W poblizu nie ma paleniska!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
		};//R_BS_FIRE end		
	}		
	else if(CreationMethod == R_BS_ANVIL)
	{
		if(Wld_IsMobAvailable(hero,"BSANVIL"))&&(Npc_HasItems(hero,ItMw_1H_Sledgehammer_01)>0)&&(Npc_HasItems(hero,ItMiTongs)>0)
		{								
         AI_SetWalkmode(hero,NPC_WALK);			
         CreateInvItems(hero,ItMw_1H_Sledgehammer_01,2);			
			//////////////////////////////
			//			BS_ANVIL
			//////////////////////////////				
	//		a=IntToFloat((R_CreateColdown*3)/7);								
			MOBNAME ="BSANVIL"; FPNAME= "FP_BS_ANVIL";								
			R_PreUseMob(MOBNAME, FPNAME);						
		}
		else
		{
			R_NoneItems();
		};	
	}//R_BS_ANVIL end	
	else if(CreationMethod == R_MOB_CAULDRON)
	{
		if(Wld_IsMobAvailable(hero,"CAULDRON"))&&(Npc_HasItems (hero,ItMiScoop)>=1)
		{								
			AI_SetWalkmode(hero,NPC_WALK);
			//////////////////////////////
			//			CAULDRON										
			MOBNAME ="CAULDRON";// FPNAME= "FP_CAULDRON";								
			AI_UseMob(hero, MOBNAME, 1);							
		}
		else
		{
			if(Npc_HasItems(hero,ItMiScoop)==0)
			{
				PutMsg("Nie posiadasz warzechy!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
			};
			
         if(Wld_IsMobAvailable(hero,"CAULDRON"))
			{
				PutMsg("W poblizu nie ma kot³a!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
			};
		};	
	}//R_MOB_CAULDRON end	
	else if(CreationMethod == R_MOB_PAN)
	{
		if(Wld_IsMobAvailable(hero,"PAN"))
		{								
			AI_SetWalkmode (hero,NPC_WALK);			
			//////////////////////////////
			//			PAN
			//////////////////////////////				
			a=IntToFloat(R_CreateColdown);								
			MOBNAME ="PAN";						
			AI_UseMob(hero, MOBNAME, 1);					
		}
		else
		{
			PutMsg("W poblizu nie ma patelni!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
		};		
	}//R_MOB_PAN end	
	else if(CreationMethod == R_LAB_PSI)
	{
		if(!Wld_IsMobAvailable(hero,"Lab"))||(Npc_HasItems (hero,ItMiFlask)==0)
		{	
			PutMsg("W poblizu nie ma sto³u alchemicznego!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
		}
		else
		{							
         AI_SetWalkmode(hero,NPC_WALK);			
			//////////////////////////////
			//			LAB_PSI
			//////////////////////////////										
			MOBNAME ="LAB";						
			AI_UseMob(hero, MOBNAME, 0);	
			AI_UseMob(hero, MOBNAME, -1);			
			Npc_ClearAIQueue(hero);	
			AI_UseMob(hero, MOBNAME, 1);																					
		};	
	}//R_LAB_PSI end			
	else if(CreationMethod == R_HERB_PSI)
	{
		if(Wld_IsMobAvailable(hero,"HERB_PSI"))
		{								
			AI_SetWalkmode 	(hero,NPC_WALK);			
			//////////////////////////////
			//			PAN
			//////////////////////////////				
			a=IntToFloat(R_CreateColdown);								
			MOBNAME ="HERB_PSI";
			AI_UseMob(hero, MOBNAME, 1);							
		}
		else
		{
			PutMsg("W poblizu nie ma rozdrabniacza!","font_default.tga",RGBAToZColor(255,155,155,255),8,"");	
		};		
	};//R_HERB_PSI end					
};

FUNC VOID EVT_RECIPEREAD ()
{
	var string str;		
	var int firstneed;		
	var int productionamount;
	var int lastposy;
	var string productname;
	var string productamount;
	var string itm1name;
	var string itm1amount;		
	var string itm2name;
	var string itm2amount;	
	var string itm3name;
	var string itm3amount;	
	var string itm4name;
	var string itm4amount;	
	var string itm5name;
	var string itm5amount;	
	var string itm6name;
	var string itm6amount;		
	var string itm7name;
	var string itm7amount;	
	var string itm8name;
	var string itm8amount;	
	var string itm9name;
	var string itm9amount;	
	var string itm10name;
	var string itm10amount;		
	var string itm11name;
	var string itm11amount;	
	var string L1; 
	var string L2;	
	var string L3;	
	var string L4;	
	var string L5;	
	var string L6;	
	var string L7;	
	var string L8;	
	var string L9;	
	var string L10;	
	var string L11;	
	var string L12;	
	var string L13;	
	var string L14;	
	var string L15;			
	L1="";  
	L2="";	 
	L3="";	 
	L4="";	 
	L5="";	 
	L6="";	 
	L7="";	 
	L8="";	 
	L9="";	 
	L10="";	
	L11="";	
	L12="";	
	L13="";	
	L14="";	
	L15="";			
	var int L1_RED; 
	var int L2_RED;	
	var int L3_RED;	
	var int L4_RED;	
	var int L5_RED;	
	var int L6_RED;	
	var int L7_RED;	
	var int L8_RED;	
	var int L9_RED;	
	var int L10_RED;	
	var int L11_RED;	
	var int L12_RED;	
	var int L14_RED;
	var int L15_RED;						
	var int createpercent;		
	const int duration = 9;	
	var int tal;
   
	R_GetItem(recept_inuse);			
	tal = item.range;	
	createpercent = R_GetCreateChance();
	productionamount =  itemscanbeproduced;				
	productname = Get_Product_Name();
	productamount = Get_Product_Amount();
   
	itm1name	= Get_needitm0_Name();  
	itm1amount	= Get_needitm0_Amount();
	itm2name	= Get_needitm1_Name();  
	itm2amount	= Get_needitm1_Amount();
	itm3name	= Get_needitm2_Name();  
	itm3amount	= Get_needitm2_Amount();	
	itm4name	= Get_needitm3_Name();  
	itm4amount	= Get_needitm3_Amount();
	itm5name	= Get_needitm4_Name();  
	itm5amount	= Get_needitm4_Amount();
	itm6name	= Get_needitm5_Name();  
	itm6amount	= Get_needitm5_Amount();	
	itm7name	= Get_needitm6_Name();  
	itm7amount	= Get_needitm6_Amount();
	itm8name	= Get_needitm7_Name();  
	itm8amount	= Get_needitm7_Amount();
	itm9name	= Get_needitm8_Name();  
	itm9amount	= Get_needitm8_Amount();	
	itm10name	= Get_needitm9_Name();  
	itm10amount	= Get_needitm9_Amount();
	itm11name	= Get_needitm10_Name();  
	itm11amount	= Get_needitm10_Amount();	
   
   L15_RED=FALSE;

   if(CreationMethod == R_BS_ANVIL)||(CreationMethod == R_BS)||(CreationMethod == R_BS_FIRE)//Kowalstwo
   {
      if(Npc_GetTalentValue(hero,NPC_TALENT_SMITH)>0)
      {
         R_CreateColdown = Math_Round(40*tal/Npc_GetTalentValue(hero,NPC_TALENT_SMITH))+1;
         L15=B_SecondsToFullTime(R_CreateColdown);
      }
      else
      {
         R_CreateColdown = 999999;	
         L15="Wiecznoœæ!";
         L15_RED=TRUE;
      };
   }
   else
   {
      if(Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY)>0)
      {
         R_CreateColdown = Math_Round(40*tal/Npc_GetTalentValue(hero,NPC_TALENT_ALCHEMY))+1;
         L15=B_SecondsToFullTime(R_CreateColdown);
      }
      else
      {
         R_CreateColdown = 999999;	
         L15="Wiecznoœæ!";
         L15_RED=TRUE;
      };
   };	
	
   R_CreateColdownFloat = IntToFloat(R_CreateColdown);					
	
   if(PRINTNEEDITEMS)
	{	
		R_GetItem(recept_inuse);
		L1=productname;	
	
      if(item.product_amount>1)
		{
         L1=ConcatStrings(L1, ConcatStrings(" - ",productamount));		
		};	
      
		L1=ConcatStrings(L1, ConcatStrings("(",ConcatStrings(inttostring(productionamount),")")));
						
 		//ITEMS
		L2=ConcatStrings("-",itm1name);

		if(item.needitm[0]>1)
		{
         L2=ConcatStrings(L2,ConcatStrings(" - ",itm1amount));	
		};
		
      L2=ConcatStrings(L2, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.needitm[0])),")")));
		L2_RED=FALSE;			
		
      if(Npc_HasItems(hero,item.needitm[0])<item.needitm_amount[0])
		{
         L2_RED=TRUE;	
		};		
		
      if(item.needitm[1] != 0)
		{
			L3=ConcatStrings("-",itm2name);
		
         if(item.needitm[1]>1)
			{
            L3=ConcatStrings(L3,ConcatStrings(" - ",itm2amount));	
			};
			
         L3=ConcatStrings(L3, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.needitm[1])),")")));
			L3_RED=FALSE;			
			
         if(Npc_HasItems(hero,item.needitm[1])<item.needitm_amount[1])
			{
            L3_RED=TRUE;	
			};	
		};		
		
      if(item.needitm[2] != 0)
		{
			L4=ConcatStrings("-",itm3name);
			if(item.needitm[2]>1)
         {
            L4=ConcatStrings(L4,ConcatStrings(" - ",itm3amount));	
			};
         
			L4=ConcatStrings(L4, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.needitm[2])),")")));
			L4_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.needitm[2])<item.needitm_amount[2])
			{
            L4_RED=TRUE;	
			};	
		};	
		
      if(item.protection[0] != 0)
		{
			L5=ConcatStrings("-",itm4name);
		
         if(item.protection[0]>1)
			{
            L5=ConcatStrings(L5,ConcatStrings(" - ",itm4amount));	
			};
			
         L5=ConcatStrings(L5, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[0])),")")));
			L5_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[0])<item.damage[0])
			{
            L5_RED=TRUE;	
			};	
		};		
		
      if(item.protection[1] != 0)
		{
			L6=ConcatStrings("-",itm5name);
		
         if(item.protection[1]>1)
			{
            L6=ConcatStrings(L6,ConcatStrings(" - ",itm5amount));	
			};
			
         L6=ConcatStrings(L6, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[1])),")")));
			L6_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[1])<item.damage[1])
			{
            L6_RED=TRUE;	
			};	
		};	
		
      if(item.protection[2] != 0)
		{
			L7=ConcatStrings("-",itm6name);
			
         if(item.protection[2]>1)
			{
            L7=ConcatStrings(L7,ConcatStrings(" - ",itm6amount));	
			};
			
         L7=ConcatStrings(L7, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[2])),")")));
			L7_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[2])<item.damage[2])
			{
            L7_RED=TRUE;	
			};	
		};	
		
      if(item.protection[3] != 0)
		{
			L8=ConcatStrings("-",itm7name);
		
         if(item.protection[3]>1)
			{
            L8=ConcatStrings(L8,ConcatStrings(" - ",itm7amount));	
			};
			
         L8=ConcatStrings(L8, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[3])),")")));
			L8_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[3])<item.damage[3])
			{
            L8_RED=TRUE;	
			};	
		};	
		
      if(item.protection[4] != 0)
		{
			L9=ConcatStrings("-",itm8name);
		
         if(item.protection[4]>1)
			{
            L9=ConcatStrings(L9,ConcatStrings(" - ",itm8amount));	
			};
			
         L9=ConcatStrings(L9, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[4])),")")));
			L9_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[4])<item.damage[4])
			{
            L9_RED=TRUE;	
			};	
		};		
		
      if(item.protection[5] != 0)
		{
			L10=ConcatStrings("-",itm9name);
		
         if(item.protection[5]>1)
			{
            L10=ConcatStrings(L10,ConcatStrings(" - ",itm9amount));	
			};
			
         L10=ConcatStrings(L10, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[5])),")")));
			L10_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[5])<item.damage[5])
			{
            L10_RED=TRUE;	
			};	
		};				
		if(item.protection[6] != 0)
		{
			L11=ConcatStrings("-",itm10name);
			
         if(item.protection[6]>1)
			{
            L11=ConcatStrings(L11,ConcatStrings(" - ",itm10amount));	
			};
			
         L11=ConcatStrings(L11, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[6])),")")));
			L11_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[6])<item.damage[6])
			{
            L11_RED=TRUE;	
			};	
		};		
		if(item.protection[7] != 0)
		{
			L12=ConcatStrings("-",itm11name);
         
         if(item.protection[7]>1)
			{
            L12=ConcatStrings(L12,ConcatStrings(" - ",itm11amount));	
			};
			
         L12=ConcatStrings(L12, ConcatStrings("(",ConcatStrings(IntToString(Npc_HasItems(hero,item.protection[7])),")")));
			L12_RED=FALSE;	
			
         if(Npc_HasItems(hero,item.protection[7])<item.damage[7])
			{
            L12_RED=TRUE;	
			};	
		};																	
		if(CreationMethod == R_BS_ANVIL)||(CreationMethod == R_BS)||(CreationMethod == R_BS_FIRE)//Kowalstwo
		{
			L13 = ConcatStrings("Kowalstwo pojête w ",IntToString(tal));
			L13 = ConcatStrings(L13," %, aby bezproblemowo wytworzyæ przedmiot.");	
		}
		else
		{
			L13 = ConcatStrings("Alchemia pojêta w ",IntToString(tal));
			L13 = ConcatStrings(L13," %, aby bezproblemowo wytworzyæ przedmiot.");				
		};	
			
      L14_Red=FALSE;		
		
      if(createpercent==0)//Kowalstwo
		{
			L14_Red=TRUE;
			L14 = "0 % na udane wytworzenie przedmiotu";
		}
		else
		{
			L14 = ConcatStrings(IntToString(createpercent)," % na udane wytworzenie przedmiotu.");
		};				
																									
		L1_RED=FALSE;		
		if(L2_Red)||(L3_Red)||(L4_Red)||(L5_Red)||(L6_Red)||(L7_Red)||(L8_Red)||(L9_Red)||(L10_Red)||(L11_Red)||(L12_Red)||(L14_Red)
		{
			L1_Red=TRUE;
		};	
		var int nDocID;
		nDocID = 	Doc_Create		();								// DocManager 
					Doc_SetPages	( nDocID,  1 );                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		); 
				if(L1_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_15_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_15_BOOK.tga"); };					
					Doc_SetMargins	( nDocID, -1, 21, 15, 10, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, L1					);
					Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"	   			); 	// -1 -> all pages 					
					Doc_SetMargins	( nDocID, -1, 310, 15, 10, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "SK£ADNIKI"					);		
					Doc_SetMargins	( nDocID, -1, 210, 62, 10, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetMargins	( nDocID, -1, 210, 62, 10, 20, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);									
				if(L2_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };					
					Doc_PrintLine	( nDocID,  0, L2				);	
				if(L3_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); };								
					Doc_PrintLine	( nDocID,  0, L3		);		
				if(L4_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L4		);		
				if(L5_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L5		);													
				if(L6_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L6		);														
				if(L7_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L7		);														
				if(L8_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L8		);															
				if(L9_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L9		);															
				if(L10_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L10		);															
				if(L11_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L11		);															
				if(L12_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };								
					Doc_PrintLine	( nDocID,  0, L12		);														
					Doc_SetMargins	( nDocID, -1, 21, 62, 10, 20, 1   	); 		
					Doc_PrintLine	( nDocID,  0, ""		);
					Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"	   			); 									
					Doc_PrintLines	( nDocID,  0, L13		);
					Doc_SetMargins	( nDocID, 0, 21, 314, 10, 20, 1   	); 		
				if(L14_Red) 		{ Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK_RED.tga"); } else { Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"); };													
					Doc_PrintLines	( nDocID,  0, L14		);
					Doc_SetMargins	( nDocID, -1, 205, 458, 10, 20, 1   	); 			
					Doc_SetFont 	( nDocID, -1, "FONT_10_BOOK.tga"	   			);								
					Doc_PrintLine	( nDocID,  0, "Przewidywany czas tworzenia to"		);
					Doc_PrintLine	( nDocID,  0, L15		);
					Doc_Show		( nDocID );
					PRINTNEEDITEMS = FALSE;				
	}
	else if(receptshow)
	{		
// 		Recept_Text_Generator();
	}
	else if(ITMMAKE)
	{		
		R_ItemsProduced=0;
		R_VisualCreateItems();
		ITMMAKE=FALSE;
	};
};
//**********************************
// R_VisualCreateItems
//**********************************
//	END END	END	END	END	END	END	END
//	END END	END	END	END	END	END	END
//**********************************
func int R_SearchForMOBs()
{
	//R_GetItem(recept_inst);	
	MOBSIDIALOG = NONE;
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);			
	AI_StopProcessInfos(hero);		
	EVT_RECIPEREAD();
	//	AI_UseMob				(hero,"BSFIRE_OC",1);
};
func void R_CreateItmFunc()
{
	var int ptr;
	MOBSIDIALOG = NONE;
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);		
	AI_StopProcessInfos(hero);		
	Wld_SendTrigger("SEC5DELAYER");
	var oCnpc hiro; hiro = hlp_GetNpc(pc_hero);
	hiro.npc_bitfield[0] = hiro.npc_bitfield[0] & ~ oCNpc_bitfield0_openinventory;
	hiro.npc_bitfield[0] = hiro.npc_bitfield[0] & ~ oCNpc_bitfield0_movlock;
};

//**********************************
// ShowRecept()
//**********************************
// Pokazujê recepte(TRIGGER RECIPEREAD)
//**********************************
func void ShowRecept()
{
   I_DisableCinemaScope(); //dodane przez Adanosa 2012-03-10
	EVT_RECIPEREAD();
	receptshow = TRUE;
};
//**********************************
// B_ReadRecept()
//**********************************
// Przekierowanie na ShowRecept()
//**********************************
func void  B_ReadRecept()
{
	MOBSIDIALOG = NONE;
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
	AI_StopProcessInfos(hero); //dodane przez Adanosa 2012-03-10
   ShowRecept();
};
//**********************************
// B_PrintNeedItems()
//**********************************
// Zsy³a trigger odpowiadaj¹cy za 
// pokazanie informacji na temat recepty
//**********************************
func void B_PrintNeedItems()
{
	PRINTNEEDITEMS = TRUE;
	MOBSIDIALOG = NONE;
	AI_StopProcessInfos(hero);	
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);	
   I_DisableCinemaScope(); //dodane przez Adanosa 2012-03-10
};

func void R_NumAssign_1(){itemtocreate = 1;	R_CreateItmFunc();};
func void R_NumAssign_2(){itemtocreate = 2;	R_CreateItmFunc();};
func void R_NumAssign_3(){itemtocreate = 3;	R_CreateItmFunc();};
func void R_NumAssign_4(){itemtocreate = 4;	R_CreateItmFunc();};
func void R_NumAssign_5(){itemtocreate = 5;	R_CreateItmFunc();};
func void R_NumAssign_6(){itemtocreate = 6;	R_CreateItmFunc();};
func void R_NumAssign_7(){itemtocreate = 7;	R_CreateItmFunc();};
func void R_NumAssign_8(){itemtocreate = 8;	R_CreateItmFunc();};
func void R_NumAssign_9(){itemtocreate = 9;	R_CreateItmFunc();};
func void R_NumAssign_10(){itemtocreate = 10;R_CreateItmFunc();};
func void R_NumAssign_15(){itemtocreate = 15;R_CreateItmFunc();};
func void R_NumAssign_20(){itemtocreate = 20;R_CreateItmFunc();};
func void R_NumAssign_25(){itemtocreate = 25;R_CreateItmFunc();};
func void R_NumAssign_30(){itemtocreate = 30;R_CreateItmFunc();};
func void R_NumAssign_35(){itemtocreate = 35;R_CreateItmFunc();};
func void R_NumAssign_40(){itemtocreate = 40;R_CreateItmFunc();};
func void R_NumAssign_45(){itemtocreate = 45;R_CreateItmFunc();};
func void R_NumAssign_50(){itemtocreate = 50;R_CreateItmFunc();};
func void R_NumAssign_60(){itemtocreate = 60;R_CreateItmFunc();};
func void R_NumAssign_70(){itemtocreate = 70;R_CreateItmFunc();};
func void R_NumAssign_80(){itemtocreate = 80;R_CreateItmFunc();};
func void R_NumAssign_90(){itemtocreate = 90;R_CreateItmFunc();};
func void R_NumAssign_100(){itemtocreate = 100;R_CreateItmFunc();};
func void R_NumAssign_Max(){itemtocreate = max_itemamount;R_CreateItmFunc();};
func void R_NumAssign_Back()
{
   Info_ClearChoices (RECEPT_MAKEITEM); 
   I_DisableCinemaScope();	//dodane przez Adanosa 2012-03-24
};
		
func void R_get_max_itemamount()
{
	R_GetItem(recept_inuse);	
	max_itemamount = R_GetItemsAmountCanBeProduced(item);
};
/*INSTANCE RECEPT_READ (C_INFO)
{
	npc				= PC_Hero;
	nr				=	2;	
	condition		= RECEPT_READ_Condition;
	information		= RECEPT_READ_Info;
	important		= 0;
	permanent		= 1;
	description		= "Czytaj receptê."; 
};

FUNC INT RECEPT_READ_Condition()
{		
	if(MOBSIDIALOG == RECEPTDIALOG)
	{
		return 1;
	};	
};

func void RECEPT_READ_Info ()
{
	B_ReadRecept();
};*/
INSTANCE RECEPT_MAKEITEM (C_INFO)
{
	npc				= PC_Hero;
	nr				=	1;	
	condition		= RECEPT_MAKEITEM_Condition;
	information		= RECEPT_MAKEITEM_Info;
	important		= 0;
	permanent		= 1;
	description		= "Utwórz przedmiot."; 
};

FUNC INT RECEPT_MAKEITEM_Condition()
{		
	if(MOBSIDIALOG == RECEPTDIALOG)
	{
		return 1;
	};	
};

func void RECEPT_MAKEITEM_Info ()
{
	R_get_max_itemamount();
	if(max_itemamount != 0)
	{
		PutMsg("Ile przedmiotów chcesz utworzyæ?","font_default.tga",RGBAToZColor(255,255,255,255),2*8,"");	
		Info_ClearChoices (RECEPT_MAKEITEM); 
		itm_num = 100;
      
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_100);  	 		
		};
		itm_num	= itm_num-10;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_90); 
		}	;
		itm_num	= itm_num-10;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_80); 
		};
		itm_num	= itm_num-10;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_70); 
		};
		itm_num	= itm_num-10;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_60); 	
		};
		itm_num	= itm_num-10;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_50); 	
		};

		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_45); 
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_40);
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_35); 
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_30); 
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_25); 
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_20);  	
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_15); 
		};
		itm_num	= itm_num-5;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_10); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_9); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_8); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_7); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_6); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_5); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_4); 
		};
		itm_num	= itm_num-1;
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_3); 	
		};
		itm_num	= itm_num-1;	
		if(max_itemamount >= itm_num)
		{
			Info_AddChoice(RECEPT_MAKEITEM,IntToString(itm_num),R_NumAssign_2); 	
		};
		Info_AddChoice(RECEPT_MAKEITEM,"Jeden przedmiot.",R_NumAssign_1);	
		Info_AddChoice(RECEPT_MAKEITEM,ConcatStrings("Maksymaln¹ mo¿liw¹ iloœæ (",ConcatStrings(IntToString(max_itemamount),")")),R_NumAssign_Max);
		Info_AddChoice(RECEPT_MAKEITEM,"(Wróæ)",R_NumAssign_Back);	
		
		////////////////////////////////			
	}	
	else
	{
		PutMsg("Brak sk³adników!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");
		return;	
	};
};
INSTANCE RECEPT_SHOWCONDS (C_INFO)
{
	npc				= PC_Hero;
	nr				=	3;
	condition		= RECEPT_SHOWCONDS_Condition;
	information		= RECEPT_SHOWCONDS_Info;
	important		= 0;
	permanent		= 1;
	description		= "Informacje o recepcie."; 
};

FUNC INT RECEPT_SHOWCONDS_Condition()
{		
	if(MOBSIDIALOG == RECEPTDIALOG)
	{
		return 1;
	};	
};

func void RECEPT_SHOWCONDS_Info ()
{
	B_PrintNeedItems();
};
/*///////////////		////////////////////
//////////PRODUCTION DIALOG/////////////
///////////////		////////////////////
INSTANCE PRODUCTION_CANCEL (C_INFO)
{
	npc				= PC_Hero;
	nr				=	5;
	condition		= PRODUCTION_CANCEL_Condition;
	information		= PRODUCTION_CANCEL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Przerwij produkcjê."; 
};

FUNC INT PRODUCTION_CANCEL_Condition()
{		
	if(MOBSIDIALOG == PRODUCTIONDIALOG)
	{
		return 1;
	};	
};

func void PRODUCTION_CANCEL_Info ()
{
	MOBSIDIALOG = NONE;		
	Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);	
	Ai_StopProcessInfos (hero);	
	Npc_ClearAIQueue (hero);	
	MOBSIDIALOG = NONE;	
};*/