//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_MFireball	(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_MFireball");

	Correct_ScrollMana(SPL_SENDCAST_MFIREBALL,manaInvested);	
	if 	(manaInvested ==(SPL_SENDCAST_MFIREBALL*3)/10)
	||	(manaInvested ==(SPL_SENDCAST_MFIREBALL*5)/10)
	||	(manaInvested ==(SPL_SENDCAST_MFIREBALL*7)/10)
	{	return SPL_NEXTLEVEL;		};
	
	if (manaInvested >= SPL_SENDCAST_MFIREBALL) 
	{ Multicast();	return SPL_SENDCAST;		};

	return SPL_RECEIVEINVEST;	
};