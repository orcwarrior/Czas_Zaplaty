//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Meteor	(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Meteor");
	
	//Handle scroll:

	Correct_ScrollMana(SPL_SENDCAST_Meteor,manaInvested);
	//Yeah, its simply and working :D
	
	if (manaInvested == 20)
	{
		return SPL_NEXTLEVEL;
	};	
	if ( manaInvested >= SPL_SENDCAST_Meteor	)		
	{
		
			Wld_PlayEffect("spellFX_Meteor_REDGLOW",self,other,2,500,DAM_FIRE,1);	
			Wld_PlayEffect("spellFX_Meteor_SMOKE",self,other,2,1,DAM_FLY,1);	
			//Wld_PlayEffect("spellFX_INVISIBLEDMG_Fireball", self, other, 2, 200, DAM_FIRE, TRUE);
			Multicast();	
			return SPL_SENDCAST;		
	};
	
	return SPL_RECEIVEINVEST;
	
};