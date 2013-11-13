//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

func int Spell_Logic_TeleportToHuntersCamp(var int manaInvested)
{
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self, "OW_PATH_OC_NC4");
		AI_PlayAni(self, "T_HEASHOOT_2_STAND");

		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func int Spell_Logic_TELEPORTTOTHEROCK(var int manaInvested)
{
	if (manaInvested>= SPL_SENDCAST_TELEPORT)
	{
		AI_Teleport(self, "NC_EN_EARLHEADQUARTERS_01");
		AI_PlayAni(self, "T_HEASHOOT_2_STAND");

		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func int B_PrintTeleportTooFarAway(var int level)
{
   if (WORLD_CURRENT != level)
   {
      PrintScreen	("Nie mo¿esz u¿yæ tutaj tej runy!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
      
      return 0;
   };
   
   return 1;
};

func int Spell_Logic_TeleportToNecroloc(var int manaInvested)
{
   if (B_PrintTeleportTooFarAway (WORLD_CATACOMBS))
   {
      if (manaInvested>= SPL_SENDCAST_TELEPORT)
      {
         AI_Teleport(self, "WP_TELEPORT_2_NECROLOC");
         AI_PlayAni(self, "T_HEASHOOT_2_STAND");

         return SPL_SENDCAST;
      };
   };
	
	return SPL_NEXTLEVEL;
};

func int Spell_Logic_TeleportFromDungeonToWorldzen(var int manaInvested)
{
   if (B_PrintTeleportTooFarAway (WORLD_MONSTARYDUNGEONZEN))
   {
      if (manaInvested>= SPL_SENDCAST_TELEPORT)
      {
         AI_Teleport(self, "KOMNATA_TELEPORT");
         AI_PlayAni(self, "T_HEASHOOT_2_STAND");

         return SPL_SENDCAST;
      };
   };
	
	return SPL_NEXTLEVEL;
};