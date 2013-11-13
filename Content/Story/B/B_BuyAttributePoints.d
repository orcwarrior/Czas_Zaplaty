func void B_BuyAttributePoints (var C_NPC typ,var C_NPC teacher, var int ATR, var int AtrPlus, var int TEACHER_MAX)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;
	if (ATR == ATR_STRENGTH)	{Typ_Atr = typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus);}
	else if (ATR == ATR_DEXTERITY)	{Typ_Atr = typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus);}
	else if (ATR == ATR_MANA_MAX)	{Typ_Atr = typ.attribute[ATR_MANA_MAX]-(mp_tp_bonus+mp_bonus);};
	
	// --------- Steigern oder verbieten	
	var string AtrPlusSTRING; AtrPlusSTRING = IntToString(AtrPlus);
	var string PrintSTRING; 
   
	if (!(typ.lp < AtrPlus))
	{
		if ((Typ_Atr + AtrPlus <= 300)&&(ATR == ATR_MANA_MAX))||((Typ_Atr + AtrPlus <= 200))
		{	
			if(!C_NpcTypeIsFriend(teacher,typ))
			{
				if(Npc_HasItems(typ,itminugget)>=ORECOST_LP*AtrPlus)
				{
				   var string msg;

				   MSG=CONCATSTRINGS("Odda³eœ bry³ek: ",IntToString(ORECOST_LP*AtrPlus));
				   PutMsg(MSG,"font_default.tga",RGBAToZColor(255,160,100,255),_TIME_MESSAGE_GIVEN,"");
				   Npc_RemoveInvItems(typ,itminugget,ORECOST_LP*AtrPlus);
				}
				else
				{
				   PutMsg("Nie masz wystarczaj¹cej iloœci rudy!","font_default.tga",RGBAToZColor(255,100,100,255),_TIME_MESSAGE_GIVEN,"");
               return;
				};
			};
         
			typ.lp = typ.lp - AtrPlus;
						
			if (ATR == ATR_STRENGTH)
			{
				typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
				PrintString = ConcatStrings(PrintString, " = ");
				PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_STRENGTH]));
				PutMsg(PrintString,"font_default.tga",RGBAToZColor(255,255,100,255),8*2,"");				
			}
			else if (ATR == ATR_DEXTERITY)
			{
				typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
				PrintString = ConcatStrings(PrintString, " = ");
				PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_DEXTERITY]));
				PutMsg(PrintString,"font_default.tga",RGBAToZColor(100,255,100,255),8*2,"");				
			}
			else if (ATR == ATR_MANA_MAX)
			{
				typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
				typ.attribute[ATR_MANA] = typ.attribute[ATR_MANA] + AtrPlus;
				PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
				PrintString = ConcatStrings(PrintString, " = ");
				PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_MANA_MAX]));
				PutMsg(PrintString,"font_default.tga",RGBAToZColor(100,100,255,255),8*2,"");				
			};
			//Skills upadte
			B_SetSkillValuesBasedOnAttribute(typ,ATR);
		}
		else if((Typ_Atr + AtrPlus > 300)&&(ATR == ATR_MANA_MAX))||((Typ_Atr + AtrPlus > 200))
		{
			if (ATR == ATR_MANA_MAX)
			{
				PutMsg("300 punktów to wartoœæ maksymalna!","font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");	
			}
			else
			{
				PutMsg("200 punktów to wartoœæ maksymalna!","font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");	
			};
			B_Say (teacher, typ, "$NOLEARNOVERMAX");
		}
		else if(Typ_Atr + AtrPlus > TEACHER_MAX)
		{
			PutMsg(ConcatStrings (PRINT_NoLearnOverPersonalMAX, IntToString(TEACHER_MAX)),"font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");				
			B_Say (teacher, typ, "$NOLEARNYOUREBETTER");
		};
	}
	else 
	{
		PutMsg("Za ma³o punktów nauki!","font_default.tga",RGBAToZColor(255,50,50,255),8*2,"");			
		B_Say (teacher, typ, "$NOLEARNNOPOINTS");
	};
};

//Perm mixtures, mass berys etc.
func void B_AddAttributePoints (var C_NPC typ, var int ATR, var int AtrPlus)
{
	// --------- Umwandeln von var in const
	var int Typ_Atr;
	if (ATR == ATR_STRENGTH)	{	Typ_Atr = typ.attribute[ATR_STRENGTH]-(str_tp_bonus+str_bonus);	}
	else if (ATR == ATR_DEXTERITY)	{	Typ_Atr = typ.attribute[ATR_DEXTERITY]-(dex_tp_bonus+dex_bonus);	}
	else if (ATR == ATR_MANA_MAX)	{	Typ_Atr = typ.attribute[ATR_MANA_MAX]-(mp_tp_bonus+mp_bonus);	}
	else if (ATR == ATR_HITPOINTS_MAX){	Typ_Atr = typ.attribute[ATR_HITPOINTS_MAX]-(hp_tp_bonus+hp_bonus);	};
	
	// --------- Steigern oder verbieten	
	var string AtrPlusSTRING; AtrPlusSTRING	= IntToString(AtrPlus);
	var string PrintSTRING; 
	
	if (ATR == ATR_STRENGTH)
	{
	   typ.attribute[ATR_STRENGTH] = typ.attribute[ATR_STRENGTH] + AtrPlus;
		PrintString = ConcatStrings(NAME_BuyAttributeSTR, AtrPlusSTRING);
		PrintString = ConcatStrings(PrintString, " = ");
		PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_STRENGTH]));
		PutMsg(PrintString,"font_default.tga",RGBAToZColor(255,255,100,255),8*2,"");				
	}
	else if (ATR == ATR_DEXTERITY)
	{
		typ.attribute[ATR_DEXTERITY] = typ.attribute[ATR_DEXTERITY] + AtrPlus;
		PrintString = ConcatStrings(NAME_BuyAttributeDEX, AtrPlusSTRING);
		PrintString = ConcatStrings(PrintString, " = ");
		PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_DEXTERITY]));
		PutMsg(PrintString,"font_default.tga",RGBAToZColor(100,255,100,255),8*2,"");				
	}
	else if (ATR == ATR_MANA_MAX)
	{
		typ.attribute[ATR_MANA_MAX] = typ.attribute[ATR_MANA_MAX] + AtrPlus;
		typ.attribute[ATR_MANA] = typ.attribute[ATR_MANA] + AtrPlus;
		PrintString = ConcatStrings(NAME_BuyAttributeMAN, AtrPlusSTRING);
		PrintString = ConcatStrings(PrintString, " = ");
		PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_MANA_MAX]));
		PutMsg(PrintString,"font_default.tga",RGBAToZColor(100,100,255,255),8*2,"");				
	}
	else if (ATR == ATR_HITPOINTS_MAX)
	{
		typ.attribute[ATR_HITPOINTS_MAX] = typ.attribute[ATR_HITPOINTS_MAX] + AtrPlus;
		typ.attribute[ATR_HITPOINTS] = typ.attribute[ATR_HITPOINTS] + AtrPlus;
		PrintString = ConcatStrings(NAME_BuyAttributeHP, AtrPlusSTRING);
		PrintString = ConcatStrings(PrintString, " = ");
		PrintString = ConcatStrings(PrintString, IntToString(typ.attribute[ATR_HITPOINTS_MAX]));
		PutMsg(PrintString,"font_default.tga",RGBAToZColor(255,100,100,255),8*2,"");	
	};
	//Skills upadte
	B_SetSkillValuesBasedOnAttribute(typ,ATR);
};

