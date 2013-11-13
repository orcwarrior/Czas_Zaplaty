//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_Trf_Meatbug(var int manaInvested)
{
	//PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Transform");
	
	if (manaInvested >= SPL_SENDCAST_TRF_MEATBUG) 
	{	
		var c_npc trans; trans = hlp_getnpc(transformer);
		if(CmpNPC(self,trans))
		{ 
         //prin/t("I'Z A TRANSFORMER!!!");

         GL_MD_TURNHERO2MEATBUG=TRUE;
         WLD_SENDTRIGGER("MD_TRANSHERO_2_MEATBUG");
         Npc_SetActiveSpellInfo(self, Meatbug);
         return SPL_SENDCAST;
		};
		Npc_SetActiveSpellInfo(self, Meatbug);
		return SPL_SENDCAST;
	};

	return SPL_NEXTLEVEL;
};