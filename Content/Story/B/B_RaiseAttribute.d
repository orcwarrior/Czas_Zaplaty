func void B_RaiseAttribute (var int attribute,	var int value)
{
	//PrintDebugNpc	(PD_ZS_FRAME,	"B_RaiseAttribute");

	var int color;//color of msg
	//-------- Anhebung --------
	B_ChangeAttribute	(self,	attribute,	value);
		
	//-------- Bildschirmausgabe --------
	var string msg;
	
	if		(attribute == ATR_STRENGTH)			{color = RGBAToZColor(255,255,100,255);		msg = ConcatStrings(NAME_RaiseStrength	, IntToString(value));	}
	else if	(attribute == ATR_DEXTERITY)		{color = RGBAToZColor(100,255,100,255);		msg = ConcatStrings(NAME_RaiseDexterity , IntToString(value));	}
	else if	(attribute == ATR_MANA_MAX)			{color = RGBAToZColor(100,100,255,255);		msg = ConcatStrings(NAME_RaiseManaMax	, IntToString(value));	}
	else if	(attribute == ATR_HITPOINTS_MAX)	{color = RGBAToZColor(255,100,100,255);		msg = ConcatStrings(NAME_RaiseHealthMax , IntToString(value));	};

	PutMsg(msg,"font_default.tga",color,8*2,"");			
};


