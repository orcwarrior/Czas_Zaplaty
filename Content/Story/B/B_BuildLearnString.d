// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Einhandkampf Stufe 2"
//	- lp: 20
//	- Rückgabestring: "Einhandkampf Stufe 2 (20 Lernpunkte)"
//
// oder
//
//	- text: "Zweihandkampf Stufe 1"
//	- lp: 30
//  - ore: 200
//  - att1: 40str
//  - att2: 20dex
//					  "Broñ Oburêczna (30 PN [Broñ jedno-dwurêczna 60%])"
//	- Rückgabestring: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
func string B_BuildLearnString (var string text, var int lp, var int ore,var int att1,var int att_amount1,var int att2,var int att_amount2)
{
	var string msg;
	var string strAttribute;
	var int nAttributeValue;
	msg	= ConcatStrings(text,	NAME_LearnPrefix);		// Bsp: "Zweihandkampf Stufe 1 ("
	if	(!C_NpcTypeIsFriend(self,hero))
	{
		if(!ore)||(ore<lp*ORECOST_LP)
		{
		ore=lp*ORECOST_LP;
		};

	};
		if(ore>=lp*ORECOST_LP)
		{
		msg = ConcatStrings(msg, IntToString(ore));		// Bsp: "Zweihandkampf Stufe 1 (200"
		msg = ConcatStrings(msg, NAME_LearnMidfix);		// Bsp: "Zweihandkampf Stufe 1 (200 Erz, "
		};

	msg = ConcatStrings(msg,	IntToString(lp));		// Bsp: "Zweihandkampf Stufe 1 (200 Erz, 20"
	if (lp == 1)
	{
		msg = ConcatStrings(msg,NAME_LearnPostfixS);	
	}
	else
	{
		msg = ConcatStrings(msg,NAME_LearnPostfixP);	// Bsp: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
	};
	if(att1>0)
	{
		if 		( att1 == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS			; nAttributeValue = hero.attribute[ ATR_HITPOINTS		 ]; }
		else if ( att1 == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX		; nAttributeValue = hero.attribute[ ATR_HITPOINTS_MAX	 ]; }
		else if ( att1 == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA				; nAttributeValue = hero.attribute[ ATR_MANA			 ]; }
		else if ( att1 == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX			; nAttributeValue = hero.attribute[ ATR_MANA_MAX		 ]; }
		else if ( att1 == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH			; nAttributeValue = hero.attribute[ ATR_STRENGTH		 ]; }
		else if ( att1 == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY			; nAttributeValue = hero.attribute[ ATR_DEXTERITY		 ]; }
		else									{	strAttribute = _STR_INVALID						; nAttributeValue = 0									  ; };
		msg = ConcatStrings(msg,", wym. ");
		msg = ConcatStrings(msg,IntToString(att_amount1));	
		msg = ConcatStrings(msg," ");	
		msg = ConcatStrings(msg,strAttribute);	
			if(att2>1)
			{
				if 		( att2 == ATR_HITPOINTS		 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS			; nAttributeValue = hero.attribute[ ATR_HITPOINTS		 ]; }
				else if ( att2 == ATR_HITPOINTS_MAX	 )	{	strAttribute = _STR_ATTRIBUTE_HITPOINTS_MAX		; nAttributeValue = hero.attribute[ ATR_HITPOINTS_MAX	 ]; }
				else if ( att2 == ATR_MANA			 )	{	strAttribute = _STR_ATTRIBUTE_MANA				; nAttributeValue = hero.attribute[ ATR_MANA			 ]; }
				else if ( att2 == ATR_MANA_MAX		 )	{	strAttribute = _STR_ATTRIBUTE_MANA_MAX			; nAttributeValue = hero.attribute[ ATR_MANA_MAX		 ]; }
				else if ( att2 == ATR_STRENGTH		 )	{	strAttribute = _STR_ATTRIBUTE_STRENGTH			; nAttributeValue = hero.attribute[ ATR_STRENGTH		 ]; }
				else if ( att2 == ATR_DEXTERITY		 )	{	strAttribute = _STR_ATTRIBUTE_DEXTERITY			; nAttributeValue = hero.attribute[ ATR_DEXTERITY		 ]; }
				else	
												{	strAttribute = _STR_INVALID						; nAttributeValue = 0									  ; };
				msg = ConcatStrings(msg,", ");
				msg = ConcatStrings(msg,IntToString(att_amount2));	
				msg = ConcatStrings(msg," ");	
				msg = ConcatStrings(msg,strAttribute);		
			};
		msg = ConcatStrings(msg,"");							
	};
	
	msg = ConcatStrings(msg,")");
	return msg;
};




