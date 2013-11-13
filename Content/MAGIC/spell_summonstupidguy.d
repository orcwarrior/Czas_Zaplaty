//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level


func int Spell_Logic_Summong³upek(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Summong³upek");
	
	//Handle scroll:

	Correct_ScrollMana(SPL_SENDCAST_SUMMONSKELETON,manaInvested);
		
	if (manaInvested >= SPL_SENDCAST_SUMMONSKELETON) 	
	{ 
		if (Npc_IsPlayer(self))
	    {
		//	Wld_SpawnNpcRange	(self,	VLK_9999_Cz³owiek,	1,	300);
		}
		else
		{
	//		Wld_SpawnNpcRange	(self,	VLK_9999_Cz³owiek,	1,	600);
		};
		
		return SPL_SENDCAST; 
	}
	else
	{
		return SPL_NEXTLEVEL;	
	};
};