// wird pro investiertem Mana aufgerufen // wieviele Mana bisher investiert wurden kann über Parameter manaInvested abgefragt werden
// diese Methode wird immer vom Caster aufgerufen
// SELF 	= Der Caster
// OTHER 	= Das Opfer // kann auch leer sein
func INT Spell_ProcessMana(VAR INT manaInvested)
{
	//PrintDebugInt(PD_MAGIC,"Spell_ProcessMana called");
	//PrintDebugInt(PD_MAGIC, "### MAGIC ###-> invested Mana: ", 	manaInvested);
	//PrintDebugInt(PD_MAGIC, "### MAGIC ###-> Spell-Level: ", 	Npc_GetActiveSpellLevel(self));
	
	GlobalManaInvested = manaInvested;//Used by multicast function
		
	if (Npc_GetActiveSpell(self) == SPL_LIGHT			)	{	return  Spell_Logic_Light			(manaInvested); };
	if (Npc_GetActiveSpell(self) == SPL_FIREBOLT		)	{	return	Spell_Logic_Firebolt		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_FIREBALL		)	{	return	Spell_Logic_Fireball		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_MFIREBALL		)	{	return	Spell_Logic_MFireball		(manaInvested);	};		
	if (Npc_GetActiveSpell(self) == SPL_FIRESTORM		)	{	return	Spell_Logic_FireStorm		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_FIRERAIN		)	{	return	Spell_Logic_FireRain		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_LIGHTNING_BIG		)	{	return	Spell_Logic_Lightning_Big		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport1		)	{	return	Spell_Logic_Teleport1		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport2		)	{	return	Spell_Logic_Teleport2		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport3		)	{	return	Spell_Logic_Teleport3		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport4		)	{	return	Spell_Logic_Teleport4		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport5		)	{	return	Spell_Logic_Teleport5		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Teleport6		)	{	return	Spell_Logic_Teleport6		(manaInvested);	};

	if (Npc_GetActiveSpell(self) == SPL_CreatePortal	)	{	return	Spell_Logic_CreatePortal	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_GotoPortal		)	{	return	Spell_Logic_GotoPortal		(manaInvested);	};

	if (Npc_GetActiveSpell(self) == SPL_HEAL			)	{	return	Spell_Logic_Heal			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_BLOODFLY	) 	{	return	Spell_Logic_Trf_Bloodfly	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_CRAWLER	    ) 	{	return	Spell_Logic_Trf_Crawler		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_LURKER	    ) 	{	return	Spell_Logic_Trf_Lurker		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_MEATBUG	    ) 	{	return	Spell_Logic_Trf_Meatbug		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_MOLERAT	    ) 	{	return	Spell_Logic_Trf_Molerat		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_ORCDOG	    ) 	{	return	Spell_Logic_Trf_Orcdog		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SCAVENGER   ) 	{	return	Spell_Logic_Trf_Scavenger	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SHADOWBEAST )	{	return	Spell_Logic_Trf_Shadowbeast	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SNAPPER	    ) 	{	return	Spell_Logic_Trf_Snapper		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_WARAN       ) 	{	return	Spell_Logic_Trf_Waran		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_WOLF        ) 	{	return	Spell_Logic_Trf_Wolf		(manaInvested);	};	
	if (Npc_GetActiveSpell(self) == SPL_CHAINLIGHTNING	)	{	return	Spell_Logic_ChainLightning	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_THUNDERBOLT		)	{	return	Spell_Logic_Thunderbolt		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_THUNDERBALL		)	{	return	Spell_Logic_Thunderball		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_ICECUBE			)	{	return	Spell_Logic_IceCube			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_ICEWAVE			)	{	return	Spell_Logic_IceWave			(manaInvested);	};

	if (Npc_GetActiveSpell(self) == SPL_Summong³upek	)	{	return	Spell_Logic_Summong³upek	(manaInvested);	};	
	if (Npc_GetActiveSpell(self) == SPL_SUMMONDEMON		)	{	return	Spell_Logic_SummonDemon		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_SUMMONSKELETON	)	{	return	Spell_Logic_SummonSkeleton	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_SUMMONGOLEM	    )	{	return	Spell_Logic_SummonGolem 	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_ARMYOFDARKNESS	)	{	return	Spell_Logic_ArmyOfDarkness 	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_MASSDEATH		)	{	return	Spell_Logic_Massdeath		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_DESTROYUNDEAD	)	{	return	Spell_Logic_DestroyUndead	(manaInvested);	};

	if (Npc_GetActiveSpell(self) == SPL_WINDFIST		)	{	return	Spell_Logic_Windfist		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_STORMFIST		)	{	return	Spell_Logic_Stormfist		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_TELEKINESIS		)	{	return	Spell_Logic_Telekinesis		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_CHARM			)	{	return	Spell_Logic_Charm			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_SLEEP			)	{	return	Spell_Logic_Sleep			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_PYROKINESIS		)	{	return	Spell_Logic_Pyrokinesis		(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_CONTROL			)	{	return	Spell_Logic_Control			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_FEAR			)	{	return	Spell_Logic_Fear			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_BERZERK			)	{	return	Spell_Logic_Berzerk			(manaInvested);	};

	if (Npc_GetActiveSpell(self) == SPL_BREATHOFDEATH	)	{	return	Spell_Logic_BreathOfDeath	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_NEW1			)	{	return	Spell_Logic_New1			(manaInvested);	};	// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
	if (Npc_GetActiveSpell(self) == SPL_SHRINK			)	{	return	Spell_Logic_Shrink			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_LifeDrain			)	{	return	Spell_Logic_LifeDrain			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_StuningBall			)	{	return	Spell_Logic_StuningBall			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_Meteor				)	{	return	Spell_Logic_Meteor			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_HolyFire				)	{	return	Spell_Logic_HolyFire			(manaInvested);	};
	
	if (Npc_GetActiveSpell(self) == SPL_THUNDER	)	{	return	Spell_Logic_THUNDER	(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_VAMPIRICAURA			)	{	return	Spell_Logic_VAMPIRICAURA			(manaInvested);	};	// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
	if (Npc_GetActiveSpell(self) == SPL_MAGICSHIELD			)	{	return	Spell_Logic_MAGICSHIELD				(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_WEAKNESS			)	{	return	Spell_Logic_WEAKNESS			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_MIRROR		)	{	return	Spell_Logic_MIRROR				(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_HEALOTHER				)	{	return	Spell_Logic_HEALOTHER			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_UNDRESS				)	{	return	Spell_Logic_ICEARMOR			(manaInvested);	};
	if (Npc_GetActiveSpell(self) == SPL_FIREWALL				)	{	return	Spell_Logic_FIREWALL			(manaInvested);	};
	
	//CZ - teleport's runes
   if (Npc_GetActiveSpell(self) == SPL_TeleportToHuntersCamp		)	{	return	Spell_Logic_TeleportToHuntersCamp		(manaInvested);	};
   if (Npc_GetActiveSpell(self) == SPL_TeleportToNecroloc)	{	return	Spell_Logic_TeleportToNecroloc(manaInvested);	};
   if (Npc_GetActiveSpell(self) == SPL_TeleportFromDungeonToWorldzen)	{	return	Spell_Logic_TeleportFromDungeonToWorldzen(manaInvested);	};
   if (Npc_GetActiveSpell(self) == SPL_TELEPORTTOTHEROCK)	{	return	Spell_Logic_TELEPORTTOTHEROCK(manaInvested);	};
   
};