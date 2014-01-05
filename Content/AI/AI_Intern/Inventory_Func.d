
/*************************************************************************
**																		**
**		B_ClearCategory													**
**		=============													**
**																		**
**		Clear all Items from Category									**
**																		**
*************************************************************************/
func void B_ClearCategory(Var C_Npc Slf,Var Int Cat)//, Var Int Category)
{
	var int Itemid;
	var int label;

	Mem_Initlabels (); 
	Label = Mem_Stackpos.Position; 
	If(Npc_GetInvItembyslot(Slf,Cat,0)> 0)
	{
		Itemid=Hlp_Getinstanceid(Item);
		//Weapon Bugfix - Amount==1
		If((Cat==1)&&(Item.Mainflag !=Item_KAT_MUN))||(Item.flags&Item_Multi!=Item_Multi)
		{
			Npc_RemoveInvItem(Slf,Itemid);
			MEM_StackPos.position = label; 	
		}
		Else
		{
			Npc_RemoveInvItems(Slf,Itemid,Npc_HasItems(Slf,Itemid));
			MEM_StackPos.position = label; 	
		};
	};
};

/*************************************************************************
**																		**
**		B_TransferCategory												**
**		=============													**
**																		**
**		Transfer all Items from Category								**
**		To $oth npc Inventory											**
*************************************************************************/
var int Show_HeroTransferedItem;
Func Void B_TransferCategory(Var C_Npc Slf,Var Int Cat,Var C_Npc Oth)
{
	var string msg; var string name;
	Var Int ItemID; var int amount;
	var int label; var int lastItemID; // Bugfix #67
	var int skipItems; skipItems = 0; // Bugfix #67
	Mem_Initlabels (); 
	Label = Mem_Stackpos.Position; 	
	If(Npc_GetInvItembyslot(slf,Cat,skipItems)> 0)
	{
		amount=0; // bugfix #67 	
		if(Hlp_IsValidItem(item))
		{
			printdebug_ss("INV/TRADER: Transfering: ",item.name);
			//printdebug_ssss("INV/TRADER: Transfering: ",slf.name, "=>", oth.name);
			//printdebug_s_i("INV/TRADER: Transfering.. Amount: ",Npc_HasItems(slf,ItemID));
			Itemid=Hlp_Getinstanceid(Item);		
			if(Cat==1)&&(Item.Mainflag !=Item_KAT_MUN)||(Item.flags&Item_Multi!=Item_Multi)
			{
				if(Show_HeroTransferedItem)&&(Npc_IsPlayer(oth))
				{
					name = item.description; if(Hlp_StrCmp(name,"")){name = item.name;};
					msg = ConcatStrings("Otrzymano: ",name);	
					if(Npc_HasItems(slf,ItemID)>1)
					{
						msg = ConcatStrings(msg," (");	
						msg = ConcatStrings(msg,inttostring(Npc_HasItems(slf,ItemID)));	
						msg = ConcatStrings(msg,")");	
					};
					PutMsg(msg,"font_default.tga",RGBAToZColor(255,255,255,255),2,"");
				};
				
				Npc_RemoveInvItem(Slf,Itemid);
				CreateInvItem(Oth,Itemid);
				Mem_Stackpos.Position = Label; 	
			}
			// issue #105 (niestety, jeśli handlarze beda juz lagowali grę
			// wtedy błąd pozostanie nie-naprawiony).
			//else if(lastItemID == itemID) // Bugfix #67
			//{
			//	skipItems+=1;			
			//	printdebug_ss("INV/TRADER: Bugfix: same as previous item: ",item.name);
			//	printdebug_s_i("INV/TRADER: items skipped: ",skipItems);
			//	//Npc_RemoveInvItem(Slf,Itemid);
			//}	
			else // Category != Weapon
			{
				amount = Npc_HasItems(slf,Itemid);
				if(Show_HeroTransferedItem)&&(Npc_IsPlayer(oth))
				{
					name = item.description; if(Hlp_StrCmp(name,"")){name = item.name;};
					msg = ConcatStrings("Otrzymano: ",name);	
					if(amount>1)
					{
						msg = ConcatStrings(msg," (");	
						msg = ConcatStrings(msg,inttostring(amount));	
						msg = ConcatStrings(msg,")");	
					};
					PutMsg(msg,"font_default.tga",RGBAToZColor(255,255,255,255),2,"");	
				};	
				if(item.flags&ITEM_MULTI == ITEM_MULTI)
				{
					Npc_RemoveInvItems(Slf,Itemid,amount);
					CreateInvItems(Oth,Itemid,amount);
				}
				else
				{
					Npc_RemoveInvItem(Slf,Itemid);
					CreateInvItem(Oth,Itemid);				
				};
			};
		}
		else
		{
			printdebug_ss("INV/TRADER: ITEM INVALID: ",item.name);
			skipItems+=1;
		};
		lastItemID = itemID;
		Mem_Stackpos.Position = Label; 	
	};
};

/*************************************************************************
**																		**
**		B_TransferExceptEquiped												**
**		=============													**
**																		**
**		Transfer all Items from Category								**
**		except ones with equiped flag									**
*************************************************************************/
Func Void B_TransferExceptEquiped(Var C_Npc Slf,Var Int Cat,Var C_Npc Oth)
{
	Var Int ItemID; var int amount; var int i;
	var int label;
	Mem_Initlabels (); 
	i = 0;

	Label = Mem_Stackpos.Position; 	
	If(Npc_GetInvItembyslot(Slf,Cat,i)> 0)
	{
		if(Hlp_IsValidItem(item))
		{
			printdebug_ss("INV/TRADER: Transfering: ",item.name);
			Itemid=Hlp_Getinstanceid(Item);
			//If item equiped, skip to next
			if((Item.flags&ITEM_EQUIPED) == ITEM_EQUIPED)
			{
				printdebug(Concatstrings("Don't transfer:",item.description));
				i+=1;
				Mem_Stackpos.Position = Label; 	
			};
			//Weapon Bugfix - Amount==1
			If(Cat==1)&&(Item.Mainflag !=Item_KAT_MUN)||(Item.flags&Item_Multi!=Item_Multi)
			{
				Npc_RemoveInvItem(Slf,Itemid);
				CreateInvItem(Oth,Itemid);
				Mem_Stackpos.Position = Label; 	
			}
			Else
			{
				amount = Npc_HasItems(Slf,Itemid);
				Npc_RemoveInvItems(Slf,Itemid,amount);
				CreateInvItems(Oth,Itemid,amount);
				Mem_Stackpos.Position = Label; 	
			};
		};
	};
};

/*************************************************************************
**																		**
**		B_ClearInventory												**
**		=============													**
**																		**
**		Clear all Inventory 											**
**		using b_ClearCategory											**
*************************************************************************/
FUNC VOID B_ClearInvENTORY(VAR C_NPC SLF)//, var int Category)
{
	B_ClearCategory(SLF,1);
	B_ClearCategory(SLF,2);
	B_ClearCategory(SLF,3);
	B_ClearCategory(SLF,4);
	B_ClearCategory(SLF,5);
	B_ClearCategory(SLF,6);
	B_ClearCategory(SLF,7);
	B_ClearCategory(SLF,8);
};
func void B_ClearTraderInv(var c_npc slf,var c_npc oth)//, var int category)
{
	var c_item MeleeWeap;var c_item RangedWeap;var int amunition_amount;var int id;
	var int hasmw;var int hasrw;

	hasmw=0;
	if(npc_hasreadiedMeleeWeapon(slf))
	{
		MeleeWeap=npc_getreadiedweapon(slf);
		hasmw=1;
		Npc_RemoveInvItem(slf,hlp_getinstanceid(MeleeWeap));
	}
	else if(npc_hasequippedMeleeWeapon(slf))
	{
		MeleeWeap=npc_getequippedMeleeWeapon(slf);
		hasmw=1;
		Npc_RemoveInvItem(slf,hlp_getinstanceid(MeleeWeap));
	};

	hasrw=0;

	if(npc_hasreadiedRangedWeapon(slf))
	{
		RangedWeap=npc_getreadiedweapon(slf);
		hasrw=1;
		Npc_RemoveInvItem(slf,hlp_getinstanceid(RangedWeap));
	}
	else if(npc_hasequippedRangedWeapon(slf))
	{
		RangedWeap=npc_getequippedRangedWeapon(slf);
		hasrw=1;
		Npc_RemoveInvItem(slf,hlp_getinstanceid(RangedWeap));
	};

	b_transfercategory(slf,1,oth);
	//dont clear armors
	//b_clearcategory(slf,2);
	if(self.id==2602)&&(rodneymage_day==1024)
	{
	};
	b_transfercategory(slf,3,oth);//rings runes
	//todo: add others mages exceptions

	if(self.id==2602)&&(rodneymage_day==1024)&&(npc_getaivar(self,aiv_wasdefeatedbysc)==false)
	{
		createinvitem(self,itarrunethunderbolt);
		createinvitem(self,itarrunewindfist);
	};
	
	if(hasmw)//incorrect id bugfix
	{
		id=hlp_getinstanceid(MeleeWeap);
		createinvitem(slf,id);
		ai_equipbestMeleeWeapon(slf);
	};
	if(hasrw)//incorrect id bugfix
	{
		id=hlp_getinstanceid(RangedWeap);
		createinvitem(slf,id);
		id=RangedWeap.munition;
		if(id>0) {
			createinvitems(slf,id,20);
		};
		ai_equipbestRangedWeapon(slf);
	};

	B_TransferCategory(SLF,4,OTH);
	B_TransferCategory(SLF,5,OTH);
	B_TransferCategory(SLF,6,OTH);
	B_TransferCategory(SLF,7,OTH);
	B_TransferCategory(SLF,8,OTH);
	
	// Clear inventory by engine func:
	var int oCNpcInventory_slf_adr;
	oCNpcInventory_slf_adr = MEM_InstToPtr(slf) + 1360; // 0x550 -> offset of oCNpcInv in oCNpcInv
	CALL__thiscall(oCNpcInventory_slf_adr,oCNpcInventory__ClearInventory_offset);
	//oCNpcInventory__ClearInventory_offset
};

/*************************************************************************
**																		**
**		B_transferItem													**
**		=============													**
**																		**
**		move first Item in #Category from #slf equipment				**
**		to specified mobcontainter named #target						**
*************************************************************************/
FUNC VOID B_TRANSFERItem(VAR C_NPC SLF,VAR STRING TARGET)//, var int Category)
{
	VAR INT ItemID;

	IF(NPC_GETInvItemBYSLOT(SLF,1,0)> 0)
	{
		ItemID=HLP_GETINSTANCEID(Item);
		//weapon bugfix - amount==1
		IF(Item.MAINFLAG !=Item_KAT_MUN)
		{
			MOB_CREATEItemS(TARGET,ItemID,NPC_HASItemS(SLF,ItemID));

			Npc_RemoveInvItemS(SLF,ItemID,NPC_HASItemS(SLF,ItemID));
		}
		ELSE
		{
			MOB_CREATEItemS(TARGET,ItemID,1);

			Npc_RemoveInvItem(SLF,ItemID);
		};
		
		B_TRANSFERItem(SLF,TARGET);
	}
	else if ((NPC_GETInvItemBYSLOT(SLF,2,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,3,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,4,0)> 0)
			|| (NPC_GETInvItemBYSLOT(SLF,5,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,6,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,7,0)> 0)
			|| (NPC_GETInvItemBYSLOT(SLF,8,0)> 0))
	{
		ItemID=HLP_GETINSTANCEID(Item);

		MOB_CREATEItemS(TARGET,ItemID,NPC_HASItemS(SLF,ItemID));

		Npc_RemoveInvItemS(SLF,ItemID,NPC_HASItemS(SLF,ItemID));

		B_TRANSFERItem(SLF,TARGET);
	};
};


/*************************************************************************
**																		**
**		B_GiveAllInventory												**
**		=============													**
**																		**
**		Move whole Inventory from self									**
**		to other														**
*************************************************************************/
FUNC VOID B_GiveAllInventory(VAR C_NPC SLF,var C_Npc Oth)//, var int Category)
{
	printdebug("INV/TRADER: Cat1 slf => oth..");
	B_TransferCategory(SLF,1,OTH);
	printdebug("INV/TRADER: Cat2 slf => oth..");
	B_TransferExceptEquiped(SLF,2,OTH);
	printdebug("INV/TRADER: Cat3 slf => oth..");
	B_TransferCategory(SLF,3,OTH);
	printdebug("INV/TRADER: Cat4 slf => oth..");
	B_TransferCategory(SLF,4,OTH);
	printdebug("INV/TRADER: Cat5 slf => oth..");
	B_TransferCategory(SLF,5,OTH);
	printdebug("INV/TRADER: Cat6 slf => oth..");
	B_TransferCategory(SLF,6,OTH);
	printdebug("INV/TRADER: Cat7 slf => oth..");
	B_TransferCategory(SLF,7,OTH);
	printdebug("INV/TRADER: Cat8 slf => oth..");
	B_TransferCategory(SLF,8,OTH);
};

/*************************************************************************
**																		**
**		B_InventoryIsEmpty												**
**		=============													**
**																		**
**		Check if npc has nothing in inventory							**
**																		**
*************************************************************************/
FUNC int B_InventoryIsEmpty(VAR C_NPC SLF)//, var int Category)
{
	var int ret;
	ret = 	Npc_GetInvItembyslot(Slf,1,0);
	ret += 	Npc_GetInvItembyslot(Slf,2,0);
	ret += 	Npc_GetInvItembyslot(Slf,3,0);
	ret += 	Npc_GetInvItembyslot(Slf,4,0);
	ret += 	Npc_GetInvItembyslot(Slf,5,0);
	ret += 	Npc_GetInvItembyslot(Slf,6,0);
	ret += 	Npc_GetInvItembyslot(Slf,7,0);
	ret += 	Npc_GetInvItembyslot(Slf,8,0);
	
	if(ret>1) { return false; }
	else	{ return true;};
};