//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

//As far as i remember, spell is removed
func int Spell_Logic_Lightning_Big(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Lightning_Big");

	Correct_ScrollMana(SPL_SENDCAST_Lightning_Big,manaInvested);	
	// KR:brauche ich, damit InvestierPFX abgespielt wird
	if (manaInvested == 0)
	{
		return SPL_NEXTLEVEL;
	};

	if (manaInvested >= SPL_SENDCAST_Lightning_Big)
	{ 	return SPL_SENDCAST; 	};
	
	return SPL_RECEIVEINVEST;
};
