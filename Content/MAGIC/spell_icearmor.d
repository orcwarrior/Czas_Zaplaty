//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_ICEARMOR(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_IceArmor");

	Correct_ScrollMana(SPL_SENDCAST_IceArmor,manaInvested);		
	if (manaInvested>= SPL_SENDCAST_IceArmor)
	{
    add_icearmor(self,self);
	Wld_PlayEffect("spellFX_Undress_SMOKE", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXRUpperArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXLUpperArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXLForeArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXRForeArm", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXLCalf", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXRCalf", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXRThigh", self, self, 1, 0, DAM_MAGIC, FALSE);		
	Wld_PlayEffect("IceArmorFXLThigh", self, self, 1, 0, DAM_MAGIC, FALSE);			
	Wld_PlayEffect("IceArmorFXSpine2", self, self, 1, 0, DAM_MAGIC, FALSE);
	Wld_PlayEffect("IceArmorFXBip01", self, self, 1, 0, DAM_MAGIC, FALSE);

		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};