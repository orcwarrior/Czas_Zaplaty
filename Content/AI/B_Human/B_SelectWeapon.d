//////////////////////////////////////////////////////////////////////////
//	B_FillQuiver
//	============
//	Füllt den Köcher des NSCs 'slf' auf 20 auf. Diese Funktion geht davon
//	aus, daß der NSC die entsprechende Fernkampfwaffe in der Hand hält.
//////////////////////////////////////////////////////////////////////////
func void B_FillQuiver(var C_NPC slf)
{
	//PrintDebugInt		(PD_ZS_DETAIL,	"B_FillQuiver");
	
	var int		addedAmmo; var int curAmmo;
	var C_ITEM	readiedWeapon;	

	readiedWeapon = Npc_GetReadiedWeapon(slf);
	if(Hlp_IsValidItem(readiedWeapon))
	{
		// Ork: Szkielety ze specjalna amunicja nie potrafia tworzyc odp. amu :( FIX
		curAmmo = Npc_HasItems(slf,readiedWeapon.munition);
		addedAmmo = 20 - curAmmo;
		if(addedAmmo>0) {
		CreateInvItems(slf,readiedWeapon.munition,addedAmmo);
		};
	};
	// Stara funckja:
	//if (readiedWeapon.munition == ItAmArrow)
	//{
	//	//PrintDebugInt	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Pfeile!");
	//	addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmArrow);
	//	CreateInvItems(slf, ItAmArrow, addedAmmo);
	//	//PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugefügte Pfeile: ", addedAmmo);
	//}
	//else if (readiedWeapon.munition == ItAmBolt)
	//{
	//	//PrintDebugInt	(PD_ZS_DETAIL,	"...aktive Waffe benutzt Bolzen!");
	//	addedAmmo = 20 - C_NpcHasAmmo(slf, ItAmBolt);
	//	CreateInvItems(slf, ItAmBolt, addedAmmo);
	//	//PrintDebugInt	(PD_ZS_DETAIL,	"...hinzugefügte Bolzen: ", addedAmmo);
	//}
	//else
	//{
	//	//PrintDebugInt	(PD_ZS_DETAIL,	"...ERROR: aktive Waffe hat KEINE gültige Munitionsart!!!");
	//};
};


func int B_EquipAndDrawBestRangedWeapon_Copy(var C_NPC slf,var C_NPC oth)
{
	
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestRangedWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Fernkampfwaffe dabei ? ---- 
	if (Npc_HasRangedWeaponWithAmmo(slf))
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...Fernkampfwaffe mit Ammo vorhanden!");
		if (!Npc_HasReadiedRangedWeapon(slf))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Fernkampfwaffe gezogen!");
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestRangedWeapon(slf);	
			AI_ReadyRangedWeapon	(slf);
		}
		else
		{
			if (slf.fight_tactic == FAI_HUMAN_RANGED)
			{
				B_FillQuiver(slf);
			};
		};
		return TRUE;
	}
	else
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};

};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestMeleeWeapon
//	=============================
//	Legt die beste Nahkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zurück, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestMeleeWeapon(var C_NPC slf,var C_NPC oth)
{
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestMeleeWeapon");
	
	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Nahkampfwaffe dabei ? ---- 
	//	if (C_NpcHasWeapon(slf, ITEM_KAT_NF))
	//	{
	if (!Npc_HasReadiedMeleeWeapon(slf))
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Nahkampfwaffe gezogen!");
		B_FullStop 				(slf);
		AI_StopAim				(slf);
		AI_RemoveWeapon			(slf);
		AI_EquipBestMeleeWeapon	(slf);	
		//Ork: Drobny fix, jeœli nie ma zadnej broni, to niech chwyta za kija (lage)
		if(!Npc_HasEquippedMeleeWeapon(slf)){
			printdebug("Attack: Create DEF-Weapon");
			B_CreateDefaultWeapon	(slf);
			AI_EquipBestMeleeWeapon	(slf);	
		};
		AI_ReadyMeleeWeapon		(slf);
	};

	return TRUE;
	//	};
	
	return FALSE;
};

//////////////////////////////////////////////////////////////////////////
//	B_EquipAndDrawBestRangedWeapon
//	==============================
//	Legt die beste Fernkampfwaffe an, die sich im Inventory befindet
//	und zieht sie auch gleich.
//	-> gibt TRUE zurück, wenn Waffe angelegt werden konnte, sonst FALSE
//////////////////////////////////////////////////////////////////////////
func int B_EquipAndDrawBestRangedWeapon(var C_NPC slf,var C_NPC oth)
{
	
	//PrintDebugInt		(PD_ZS_FRAME,	"B_EquipAndDrawBestRangedWeapon");

	// ---- Zauber noch aktiv ? ---- 
	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt	(PD_ZS_CHECK,	"...vorher Zauber wegstecken!");
		AI_UnreadySpell	(slf);										// ... dann weg damit
	};

	// ---- Fernkampfwaffe dabei ? ---- 
	if (Npc_HasRangedWeaponWithAmmo(slf))
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...Fernkampfwaffe mit Ammo vorhanden!");
		if (!Npc_HasReadiedRangedWeapon(slf))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...noch keine Fernkampfwaffe gezogen!");
			B_FullStop 				(slf);
			AI_RemoveWeapon			(slf);
			AI_EquipBestRangedWeapon(slf);	
			AI_ReadyRangedWeapon	(slf);
		}
		else
		{
			if (slf.fight_tactic == FAI_HUMAN_RANGED)
			{
				B_FillQuiver(slf);
			};
		};
		return TRUE;
	}
	else
	{
		//PrintDebugInt				(PD_ZS_CHECK,	"...KEINE Fernkampfwaffe mit Ammo vorhanden!");
	};
	return FALSE;

};

//////////////////////////////////////////////////////////////////////////
//	B_DrawSpell
//	===========
//	Zieht den angegebenen Spruch unter Berücksichtigung, daß eventuell
//	vorher ein AI_UnreadySpell durchgeführt werden muß.
//////////////////////////////////////////////////////////////////////////
func void B_DrawSpell(var C_NPC slf, var int spell, var int mana)
{
	//PrintDebugInt				(PD_ZS_FRAME,	"B_DrawSpell");

	if (Npc_IsInFightMode(slf, FMODE_MAGIC))
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...bereits im Magiemodus!");
		if (Npc_GetActiveSpell(slf) != spell)
		{
			//PrintDebugInt		(PD_ZS_CHECK,	"...dieser Zauber liegt noch nicht auf der Hand!");
			AI_UnreadySpell		(slf);
			// Das folgende AI_ReadySpell() verursacht den Kollisionsbug
			// "only one moving vob without collision..." wenn die Funktion
			// zweimal hintereinander aufgerufen wird, ohne ein
			// AI_UnreadySpell dawzischen. Genau das ist aber nötig
			// wenn der NSC die Stärke des Zaubers ändern will ohne
			// den Zauber wegzustecken und wieder hervorzuholen!
		};
		AI_ReadySpell			(slf, spell, mana);
	}
	else
	{
		if (Npc_IsInFightMode(slf, FMODE_MELEE)||Npc_IsInFightMode(slf, FMODE_FIST))
		{
			AI_RemoveWeapon		(slf);
		};
		if (Npc_IsInFightMode(slf, FMODE_FAR))
		{
			AI_StopAim			(slf);
			AI_RemoveWeapon		(slf);
		};
		
		//PrintDebugInt			(PD_ZS_CHECK,	"...noch nicht im Magiemodus!");
		AI_ReadySpell			(slf, spell, mana);
	};

	//-------- "echte" Magier bekommen Mana dazugeschummelt --------
	if (slf.fight_tactic == FAI_HUMAN_MAGE)
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...Magier-Kampftaktik!");

		var int manaLeft;	manaLeft = slf.attribute[ATR_MANA];
		var int manaMax;	manaMax	 = slf.attribute[ATR_MANA_MAX];
		var int manaRefill;
		if ( manaLeft < (manaMax/2) )
		{
			//PrintDebugInt		(PD_ZS_CHECK,	"...Mana übrig: ", manaLeft);
			manaRefill =		(manaMax/2) - manaLeft;		
			B_ChangeAttribute	(slf,	ATR_MANA,	manaRefill);
			//PrintDebugInt		(PD_ZS_CHECK,	"...Mana hinzugefügt: ", manaRefill);
		};
	};
	
	return;
};

CONST INT B_SelectWeapon_Choosen_None = 0;
CONST INT B_SelectWeapon_Choosen_Melee = 1;
CONST INT B_SelectWeapon_Choosen_Ranged = 2;
CONST INT B_SelectWeapon_Choosen_Magic = 3;
// B_SelectWeapon Private funcs:

// Get count of spells that npc can use
func int B_SelectWeapon_GetNpcSpells(var C_NPC slf)
{
	return ///C-C-CCCOMBOO
	 C_NpcHasSpell(slf,SPL_SUMMONDEMON)
	+C_NpcHasSpell(slf,SPL_SUMMONGOLEM)
	+C_NpcHasSpell(slf,SPL_SUMMONSKELETON)
	+C_NpcHasSpell		(slf,SPL_ICECUBE)
	+C_NpcHasSpell(slf,SPL_METEOR)
	+C_NpcHasSpell(slf,SPL_WEAKNESS)
	+C_NpcHasSpell(slf,SPL_STUNINGBALL)
	+C_NpcHasSpell(slf,SPL_THUNDER)
	+C_NpcHasSpell(slf,SPL_FireWall)
	+C_NpcHasSpell(slf,SPL_CHAINLIGHTNING)
	+C_NpcHasSpell(slf,SPL_SLEEP)
	+C_NpcHasSpell(slf,SPL_WINDFIST)
	+C_NpcHasSpell	(slf,SPL_BREATHOFDEATH)
	+C_NpcHasSpell(slf,SPL_FIRESTORM)
	+C_NpcHasSpell(slf,SPL_THUNDERBALL)
	+C_NpcHasSpell(slf,SPL_FIREBALL)
	+C_NpcHasSpell	(slf,SPL_PYROKINESIS)
	+C_NpcHasSpell	(slf,SPL_FIREBOLT)
	+C_NpcHasSpell	(slf,SPL_THUNDERBOLT) 
	+C_NpcHasSpell	(slf,SPL_FEAR);
};
func int B_SelectWeapon_SelectMagic(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("Attack: Npc choose magic!");
	if(Npc_GetAivar(self,AIV_TPMULT)<6)&&(Npc_HasItems(self,ItFo_Potion_Spec_MultiCast))
	{
		AI_UseItem(self,ItFo_Potion_Spec_MultiCast);
	};
	//PrintDebugInt			(PD_ZS_CHECK,	"...NSC ist ein Magier!");
	//-------- Summon Demon --------
	if ((C_NpcHasSpell(slf,SPL_SUMMONDEMON)) && (Npc_GetDistToNpc(slf, oth)>1200))
	{
		Npc_PerceiveAll		(slf);
		if (!Wld_DetectNpc	(slf, SummonedByNPC_Demon, ZS_MM_Attack, GIL_DEMON))		
		{
			B_DrawSpell		(slf,	SPL_SUMMONDEMON,	SPL_SENDCAST_SUMMONDEMON);
			return B_SelectWeapon_Choosen_Magic;
		};
	};
	//-------- Summon Golem --------
	if ((C_NpcHasSpell(slf,SPL_SUMMONGOLEM)) && (Npc_GetDistToNpc(slf, oth)>1000))
	{
		Npc_PerceiveAll		(slf);
		if (!Wld_DetectNpc	(slf, SummonedByNPC_StoneGolem, ZS_MM_Attack, GIL_GOLEM))		
		{
			B_DrawSpell		(slf,	SPL_SUMMONGOLEM,	SPL_SENDCAST_SUMMONGOLEM);
			return B_SelectWeapon_Choosen_Magic;
		};
	};
	//-------- Summon Skeleton --------
	if	((C_NpcHasSpell(slf,SPL_SUMMONSKELETON)) && (Npc_GetDistToNpc(slf, oth)>800))
	{
		Npc_PerceiveAll		(slf);
		if (!Wld_DetectNpc	(slf, SummonedByNPC_Skeleton, ZS_MM_Attack, GIL_SKELETON))		
		{
			B_DrawSpell		(slf,	SPL_SUMMONSKELETON,	SPL_SENDCAST_SUMMONSKELETON);
			return B_SelectWeapon_Choosen_Magic;
		};
	};

	//-------- Icecube --------
	if (C_NpcHasSpell		(slf,SPL_ICECUBE) && !Npc_IsInState(oth,ZS_MagicFreeze) )
	{
		B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Icecube-Attack (Monster) --------
	//else if (C_NpcHasSpell	(slf,SPL_ICECUBE) && C_NpcIsMonsterMage(slf) && (Npc_GetDistToNpc(slf,oth) < SPL_RANGE_ICEATTACK) && !Npc_IsInState(oth,ZS_MagicFreeze) )
	//{
	//	B_DrawSpell			(slf,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
	//	return B_SelectWeapon_Choosen_Magic;
	//}
	//-------- Meteor ---------------
	else if	(C_NpcHasSpell(slf,SPL_METEOR))&&(Npc_GetDistToNpc(slf,oth) > 1800)
	{
		B_DrawSpell			(slf,	SPL_METEOR,	SPL_SENDCAST_METEOR);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Curse ---------------
	else if	(C_NpcHasSpell(slf,SPL_WEAKNESS))
	{
		B_DrawSpell			(slf,	SPL_WEAKNESS,	SPL_SENDCAST_WEAKNESS);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- stuningBall ---------------
	else if	(C_NpcHasSpell(slf,SPL_STUNINGBALL))&&(Npc_GetDistToNpc(slf,oth)<2000) 
	&&(!Npc_IsInState(oth,ZS_Stuned))
	{
		B_DrawSpell			(slf,	SPL_STUNINGBALL,	SPL_SENDCAST_STUNINGBALL);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Thunder ---------------
	
	else if	(C_NpcHasSpell(slf,SPL_THUNDER) && (Npc_GetDistToNpc(slf,oth)>1000) )
	{
		B_DrawSpell			(slf,	SPL_THUNDER,	SPL_SENDCAST_THUNDER);
		return B_SelectWeapon_Choosen_Magic;
	}
	else if	(C_NpcHasSpell(slf,SPL_FireWall) && (Npc_GetDistToNpc(slf,oth)<1500) )
	{	B_DrawSpell			(slf,	SPL_FireWall,	SPL_SENDCAST_THUNDER);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Chainlightning --------
	else if	(C_NpcHasSpell(slf,SPL_CHAINLIGHTNING) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_CHAINLIGHTNING) )
	{
		B_DrawSpell			(slf,	SPL_CHAINLIGHTNING,	1);
		return B_SelectWeapon_Choosen_Magic;
	}
	//--------Sleep --------
	else if ((C_NpcHasSpell(slf,SPL_SLEEP)) && (!Npc_IsInState(oth, ZS_MagicSleep)) && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_SLEEP) )
	{
		B_DrawSpell			(slf,	SPL_SLEEP,	SPL_SENDCAST_SLEEP);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Windfist --------
	else if (C_NpcHasSpell(slf,SPL_WINDFIST)  && (Npc_GetDistToNpc(slf,oth)<SPL_RANGE_WINDFIST) )
	{
		if 	( (Npc_GetDistToNpc(slf,oth)>SPL_RANGE_WINDFIST) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST) )
		{
			B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST);
		}
		else if ( (Npc_GetDistToNpc(slf,oth)>(SPL_RANGE_WINDFIST/2)) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_WINDFIST/2) )
		{
			B_DrawSpell		(slf,	SPL_WINDFIST,	SPL_SENDCAST_WINDFIST/2);
		}
		else
		{
			B_DrawSpell		(slf,	SPL_WINDFIST,	1);
		};
		return B_SelectWeapon_Choosen_Magic;
	}		
	//-------- Breath of Death --------
	else if (C_NpcHasSpell	(slf,SPL_BREATHOFDEATH))
	{
		B_DrawSpell			(slf,	SPL_BREATHOFDEATH,	SPL_SENDCAST_BREATHOFDEATH);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Firestorm --------
	else if ( C_NpcHasSpell(slf,SPL_FIRESTORM) )
	{
		if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM) )
		{	
			B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIREBALL);
		}
		else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIRESTORM/2) )
		{
			B_DrawSpell		(slf,	SPL_FIRESTORM,	SPL_SENDCAST_FIRESTORM/2);
		}
		else
		{
			B_DrawSpell		(slf,	SPL_FIRESTORM,	1);
		};
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Thunderball --------
	else if ( C_NpcHasSpell(slf,SPL_THUNDERBALL) )
	{
		if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL) )
		{
			B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL);
		}
		else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_THUNDERBALL/2) )
		{
			B_DrawSpell		(slf,	SPL_THUNDERBALL,	SPL_SENDCAST_THUNDERBALL/2);
		}
		else
		{
			B_DrawSpell		(slf,	SPL_THUNDERBALL,	1);
		};
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Fireball --------
	else if ( C_NpcHasSpell(slf,SPL_FIREBALL) )
	{
		if 		( (Npc_GetDistToNpc(slf,oth)>1500) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL) )
		{
			B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL);
		}
		else if ( (Npc_GetDistToNpc(slf,oth)>800) && (slf.attribute[ATR_MANA]>=SPL_SENDCAST_FIREBALL/2) )
		{
			B_DrawSpell		(slf,	SPL_FIREBALL,	SPL_SENDCAST_FIREBALL/2);
		}
		else
		{
			B_DrawSpell		(slf,	SPL_FIREBALL,	1);
		};
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Pyrokinesis --------
	else if (C_NpcHasSpell	(slf,SPL_PYROKINESIS))
	{
		B_DrawSpell			(slf,	SPL_PYROKINESIS,	10);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Firebolt --------
	else if (C_NpcHasSpell	(slf,SPL_FIREBOLT))
	{
		B_DrawSpell			(slf,	SPL_FIREBOLT,	SPL_SENDCAST_FIREBOLT);
		return B_SelectWeapon_Choosen_Magic;
	}
	//-------- Thunderbolt --------
	else if (C_NpcHasSpell	(slf,SPL_THUNDERBOLT))
	{
		B_DrawSpell			(slf,	SPL_THUNDERBOLT,	SPL_SENDCAST_THUNDERBOLT);
		return B_SelectWeapon_Choosen_Magic;
	}
	else if (C_NpcHasSpell		(slf,SPL_FEAR))
	{
		B_DrawSpell			(slf,	SPL_FEAR,	SPL_SENDCAST_FEAR);
		return B_SelectWeapon_Choosen_Magic;
	};
	return B_SelectWeapon_Choosen_None;
};
//////////////////////////////////////////////////////////////////////////
//	B_SelectWeapon
//	==============
//	Wählt für den NSC 'slf' unter Berücksichtigung der Kampfsitution
//	die jeweils passende Waffe aus.
//	Diese Funktion wird während der ZS_Attack alle 3 Sekunden
//	aufgerufen und interpretiert den NSC 'oth' als das anzugreifende
//	Ziel. 
//////////////////////////////////////////////////////////////////////////
func int B_SelectWeapon(var C_NPC slf, var C_NPC oth)
{
	var int proMelee; var int proRanged; var int proMagic;
	var int predictedDMG; var int npcSpellsCnt;
	var c_item myWeapon;	
	// wow I'm shocked, vars need to be reseted
	// cuz them value are stored
	proMelee  = 0;
	proRanged = 0;
	proMagic  = 0;	
	
	// 1. Do I have weapon?
	if(Npc_HasEquippedMeleeWeapon(slf) || Npc_HasReadiedMeleeWeapon(slf))  { proMelee  += 10; };
	if(Npc_HasEquippedRangedWeapon(slf) || Npc_HasReadiedRangedWeapon(slf)) { proRanged += 10; };
	npcSpellsCnt = B_SelectWeapon_GetNpcSpells(slf);
	if(npcSpellsCnt>0) 					 { proMagic  += 10; };
	
	// 2. My weapons damage:
	//    ->Melee:
	myWeapon = Npc_GetEquippedMeleeWeapon(slf);
	if(!Hlp_IsValidItem(myWeapon))
	{ myWeapon = Npc_GetReadiedWeapon(slf);	};	
	if(Hlp_IsValidItem(myWeapon))
	{
		var int critChance;
		if(C_VarHasFlag(myWeapon.flags,ITEM_2HD_AXE)||C_VarHasFlag(myWeapon.flags,ITEM_2HD_SWD))
		{ critChance = Npc_GetTalentValue(slf, NPC_TALENT_2H); }
		else
		{ critChance = Npc_GetTalentValue(slf, NPC_TALENT_1H); };
		// Math_Div: Dzielenie z obcieciem wart po przecinku
		predictedDMG = myWeapon.damage +  Math_Div(slf.attribute[ATR_STRENGTH]*critChance,100);
			 if(myWeapon.damagetype==DAM_EDGE ){ proMelee += predictedDMG - oth.protection[PROT_EDGE]; }
		else if(myWeapon.damagetype==DAM_BLUNT){ proMelee += predictedDMG - oth.protection[PROT_BLUNT];};
		if (proMelee<0) {proMelee = 0;};
	};
	//   ->Ranged:
	myWeapon = Npc_GetEquippedRangedWeapon(slf);
	if(!Hlp_IsValidItem(myWeapon))
	{ myWeapon = Npc_GetReadiedWeapon(slf);	};	
	if(Hlp_IsValidItem(myWeapon))
	{
			 if(myWeapon.damagetype==DAM_POINT) { proRanged += myWeapon.damage - oth.protection[PROT_POINT];}
		else if(myWeapon.damagetype==DAM_MAGIC) { proRanged += myWeapon.damage - oth.protection[PROT_MAGIC];}
		else if(myWeapon.damagetype==DAM_FIRE ) { proRanged += myWeapon.damage - oth.protection[PROT_FIRE ];}
		else if(myWeapon.damagetype==DAM_BLUNT) { proRanged += myWeapon.damage - oth.protection[PROT_BLUNT];};
		if (proRanged<0) {proRanged = 0;};
	};
	//    ->Magic: (keep balance)
	if (proMagic>0) { proMagic+=50+npcSpellsCnt*20; };
	
	// 3. Other weapon is melee? Better if I use melee too!
	if(Npc_HasReadiedMeleeWeapon(oth))
	{ proMelee += 5; }
	else
	{ proMelee -= 5; };	
	
	// 4. Other is Close? Better if I use Melee then...
	if(Npc_GetDistToNpc(slf, oth) < HAI_DIST_MELEE)
	{ 
		
		proMelee += 10; 
	};	
	
	// 5. Do I have mana (or I can regenerate it)?		
	if(slf.attribute[ATR_MANA] < 5)&&(!Npc_HasManaPotions(slf))
	{ proMagic = 0; };	
	
	// 6. Consider Fight tactic:
	if(slf.fight_tactic!=FAI_HUMAN_MAGE)&&(slf.fight_tactic!=FAI_HUMAN_RANGED)||(self.fight_Tactic == FAI_HUMAN_MULTI)
	{
		proMelee+=15;
	};
	if(slf.fight_tactic==FAI_HUMAN_RANGED)||(self.fight_Tactic == FAI_HUMAN_MULTI)
	{
		proRanged+=15;	
		if(slf.fight_tactic==FAI_HUMAN_RANGED) {proRanged+=10;};
	};
	if((slf.fight_tactic==FAI_HUMAN_MAGE)||(self.fight_Tactic == FAI_HUMAN_MULTI)||C_NpcIsMonsterMage(slf))
	&&(proMagic>0)
	{
		proMagic+=10;
		if(slf.fight_tactic==FAI_HUMAN_MAGE || C_NpcIsMonsterMage(slf)) {proMagic+=20;}; // mages are mostly shity at other stuff
	};
	
	PrintDebug_ss("Attack: NPC: ",self.name);
	PrintDebug_s_i("Attack: proMelee: ",proMelee);
	PrintDebug_s_i("Attack: proRanged: ",proRanged);
	PrintDebug_s_i("Attack: proMagic: ",proMagic);
	
	if (proMagic>proRanged)&&(proMagic>proMelee)
	{	
		if(B_SelectWeapon_SelectMagic(slf,oth) == B_SelectWeapon_Choosen_Magic)
		{ return B_SelectWeapon_Choosen_Magic; };
	};   

	//######## Waffenbasierte Kampftaktik ?  ########
	//PrintDebugInt		(PD_ZS_CHECK,	"...Waffenbasierte Kampftaktik!");
	//-------- Gegner in Nahkampfdistanz ? --------
	if (proMelee>proRanged)&&(proMelee>proMagic)
	{
		PrintDebug("Attack: Npc choose melee!");
		//PrintDebugInt			(PD_ZS_CHECK,	"...Gegner in Nahkampfreichweite & kein purer Fernkämpfer!");
		if(Npc_GetAivar(self,AIV_TPBASH)<6)&&(Npc_HasItems(self,ItFo_Potion_Spec_Bash))
		{
			AI_UseItem(self,ItFo_Potion_Spec_Bash);
		};
		// ---- Erst Nahkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Melee;
		};

		// ---- ...sonst mit den Fäusten kämpfen ---- 								
		//PrintDebugInt			(PD_ZS_CHECK, "...keine Nahkampfwaffe im Inv -> Faustkampf!");
		AI_ReadyMeleeWeapon		(slf);	// VORSICHT: in v0.96c werden hier nicht die Fäuste, sondern die letzte Waffe gezogen !!! -> wird in v0.97 behoben sein (Kommentar dann löschen)
		return B_SelectWeapon_Choosen_Melee;//Fist		
	}
	else if (proRanged>proMelee)&&(proRanged>proMagic)
	{
		PrintDebug("Attack: Npc choose ranged!");
		// ---- Erst Fernkampfwaffe probieren... ---- 
		if (B_EquipAndDrawBestRangedWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Ranged;
		};		
		// ---- ...sonst Nahkampfwaffe versuchen... ---- 
		if (B_EquipAndDrawBestMeleeWeapon(slf,oth))
		{
			return B_SelectWeapon_Choosen_Melee;
		};

		// ---- ...herumliegende Waffe suchen, sonst mit den Fäusten kämpfen ---- 								
		if (!B_FetchWeapon())
		{
			//PrintDebugInt		(PD_ZS_CHECK, "...keine Waffe gefunden -> Faustkampf!");
			AI_ReadyMeleeWeapon	(slf);
			return B_SelectWeapon_Choosen_Melee;		
		};
	};			

	return B_SelectWeapon_Choosen_Melee;			
};
//--------------------------------------------------------------------------

