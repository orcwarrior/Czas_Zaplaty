
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
	var int label;
   
	Mem_Initlabels (); 
	Label = Mem_Stackpos.Position; 	
	If(Npc_GetInvItembyslot(Slf,Cat,0)> 0)
	{
		Itemid=Hlp_Getinstanceid(Item);
		//Weapon Bugfix - Amount==1
		If(Cat==1)&&(Item.Mainflag !=Item_KAT_MUN)||(Item.flags&Item_Multi!=Item_Multi)
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
		Else
		{
			amount = Npc_HasItems(Slf,Itemid);
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
			Npc_RemoveInvItems(Slf,Itemid,amount);
			CreateInvItems(Oth,Itemid,amount);
			Mem_Stackpos.Position = Label; 	
		};
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
FUNC VOID B_ClearTRADERInv(VAR C_NPC SLF,VAR C_NPC OTH)//, var int Category)
{
	VAR C_Item MELEEWEAP;VAR C_Item RANGEDWEAP;VAR INT AMUNITION_AMOUNT;VAR INT ID;
	VAR INT HASMW;VAR INT HASRW;

	HASMW=0;
	IF(NPC_HASREADIEDMELEEWEAPON(SLF))
	{
		MELEEWEAP=NPC_GETREADIEDWEAPON(SLF);
		HASMW=1;
		NPC_REMOVEInvItem(SLF,HLP_GETINSTANCEID(MELEEWEAP));
	}
	ELSE IF(NPC_HASEQUIPPEDMELEEWEAPON(SLF))
	{
		MELEEWEAP=NPC_GETEQUIPPEDMELEEWEAPON(SLF);
		HASMW=1;
		NPC_REMOVEInvItem(SLF,HLP_GETINSTANCEID(MELEEWEAP));
	};

	HASRW=0;
   
	IF(NPC_HASREADIEDRANGEDWEAPON(SLF))
	{
		RANGEDWEAP=NPC_GETREADIEDWEAPON(SLF);
		HASRW=1;
		NPC_REMOVEInvItem(SLF,HLP_GETINSTANCEID(RANGEDWEAP));
	}
	ELSE IF(NPC_HASEQUIPPEDRANGEDWEAPON(SLF))
	{
		RANGEDWEAP=NPC_GETEQUIPPEDRANGEDWEAPON(SLF);
		HASRW=1;
		NPC_REMOVEInvItem(SLF,HLP_GETINSTANCEID(RANGEDWEAP));
	};
   
	B_TransferCategory(SLF,1,OTH);
	//Dont Clear armors
	//B_ClearCategory(slf,2);
	IF(SELF.ID==2602)&&(RODNEYMAGE_DAY==1024)
	{
	};
	B_TransferCategory(SLF,3,OTH);//rings runes
	//TODO: Add others Mages Exceptions
 
   IF(SELF.ID==2602)&&(RODNEYMAGE_DAY==1024)&&(Npc_GetAivar(SELF,AIV_WASDEFEATEDBYSC)==FALSE)
   {
      CREATEInvItem(SELF,ITARRUNETHUNDERBOLT);
      CREATEInvItem(SELF,ITARRUNEWINDFIST);
   };
	
   IF(HASMW)//Incorrect ID bugfix
	{
		ID=HLP_GETINSTANCEID(MELEEWEAP);
		CREATEInvItem(SLF,ID);
		AI_EQUIPBESTMELEEWEAPON(SLF);
	};
	IF(HASRW)//Incorrect ID bugfix
	{
		ID=HLP_GETINSTANCEID(RANGEDWEAP);
		CREATEInvItem(SLF,ID);
		ID=RANGEDWEAP.MUNITION;
		CREATEInvItemS(SLF,ID,20);
		AI_EQUIPBESTRANGEDWEAPON(SLF);
	};

	B_TransferCategory(SLF,4,OTH);
	B_TransferCategory(SLF,5,OTH);
	B_TransferCategory(SLF,6,OTH);
	B_TransferCategory(SLF,7,OTH);
	B_TransferCategory(SLF,8,OTH);
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

         NPC_REMOVEInvItemS(SLF,ItemID,NPC_HASItemS(SLF,ItemID));
		}
		ELSE
		{
         MOB_CREATEItemS(TARGET,ItemID,1);

         NPC_REMOVEInvItem(SLF,ItemID);
		};
      
		B_TRANSFERItem(SLF,TARGET);
	}
	else if ((NPC_GETInvItemBYSLOT(SLF,2,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,3,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,4,0)> 0)
      || (NPC_GETInvItemBYSLOT(SLF,5,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,6,0)> 0) || (NPC_GETInvItemBYSLOT(SLF,7,0)> 0)
      || (NPC_GETInvItemBYSLOT(SLF,8,0)> 0))
	{
		ItemID=HLP_GETINSTANCEID(Item);

		MOB_CREATEItemS(TARGET,ItemID,NPC_HASItemS(SLF,ItemID));

		NPC_REMOVEInvItemS(SLF,ItemID,NPC_HASItemS(SLF,ItemID));

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
	B_TransferCategory(SLF,1,OTH);
	B_TransferExceptEquiped(SLF,2,OTH);
	B_TransferCategory(SLF,3,OTH);
	B_TransferCategory(SLF,4,OTH);
	B_TransferCategory(SLF,5,OTH);
	B_TransferCategory(SLF,6,OTH);
	B_TransferCategory(SLF,7,OTH);
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