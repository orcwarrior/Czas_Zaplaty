//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_MagicShield(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_MagicShield");

	Correct_ScrollMana(SPL_SENDCAST_MAGICSHIELD,manaInvested);		
	if (manaInvested>= SPL_SENDCAST_MAGICSHIELD)
	{
	add_magicshield(self);
	Wld_PlayEffect("MagicShieldFXHead", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXRUpperArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXLUpperArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXLForeArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXRForeArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXLCalf", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXRCalf", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXRThigh", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("MagicShieldFXLThigh", self, self, 1, 0, DAM_MAGIC, FALSE);			
	Wld_PlayEffect("MagicShieldFXSpine2", self, self, 1, 0, DAM_MAGIC, FALSE);
	Wld_PlayEffect("MagicShieldFXBip01", self, self, 1, 0, DAM_MAGIC, FALSE);


		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};