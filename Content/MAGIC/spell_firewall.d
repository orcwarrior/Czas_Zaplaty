//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Firewall (var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Fireball");
	
	//Handle scroll:

	Correct_ScrollMana(SPL_SENDCAST_FIREWALL,manaInvested);
	//Yeah, its simply and working :D
	
	if 	(manaInvested ==(SPL_SENDCAST_FIREWALL-30))
	||	(manaInvested ==(SPL_SENDCAST_FIREWALL-20))
	||	(manaInvested ==(SPL_SENDCAST_FIREWALL-10))
	{	return SPL_NEXTLEVEL;		};
	
	if (manaInvested >= SPL_SENDCAST_FIREWALL) 
	{
			npc_firewall_orgin=Hlp_GetInstanceID(self);
			glob_firewall_bounces=0;//anti bug - when last bouncing was canceled
			return SPL_SENDCAST;	
			Multicast();
			};

	return SPL_RECEIVEINVEST;	
};