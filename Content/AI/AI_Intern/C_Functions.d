/*************************************************************************
**																		**
**		C_Functions.D													**
**		=============													**
**																		**
**		Enthält eine Reihe von Checks für die Master-AI					**
**																		**
*************************************************************************/
// Ork: Mhmm naprawde nie wiedzialem gdzie to dopisaæ, dla czystosci siê przyda:
func int  C_VarHasFlag(var int variable, var int flag)
{
	return (variable & flag) == flag;
};

// FUNC INT CmpNpc(VAR C_NPC P1,VAR C_NPC P2)
//MOVED TO CompareNpcs.d

FUNC INT C_ITMHASFLAG(VAR C_ITEM ITM,VAR INT FLG)
{
	IF(HLP_ISVALIDITEM(ITM))
	{
		IF((ITM.FLAGS & FLG)==FLG)
		{
			RETURN TRUE;
 };
	};
	RETURN FALSE;
};
//////////////////////////////////////////////////////////////////////////
//C_AmIStronger
//=============
//Check npc 'slf' is coward or no
//Func used at C_AmIWeaker() & C_AmIStronger().
//////////////////////////////////////////////////////////////////////////
FUNC INT C_SLFISCOWARD(VAR C_NPC SLF)
{

IF((SLF.SPAWNDELAY & NPC_FLAG_BRAVE)==NPC_FLAG_BRAVE)||(((SLF.GUILD==GIL_DMB)||(SLF.GUILD==GIL_GRD)||(SLF.GUILD==GIL_PIR)||(SLF.GUILD==GIL_RBL)||(SLF.GUILD==GIL_MAG)||(SLF.GUILD==GIL_HUN))&&(GRDNUMSPAWNED>0))||(SLF.GUILD==GIL_DMB)
{
	RETURN FALSE;
}
ELSE
{
 RETURN TRUE;
};

};
//////////////////////////////////////////////////////////////////////////
//C_AmIStronger
//=============
//Überfrüft, ob der NSC 'slf' stärker als der NSC 'oth' ist. Diese
//Funktion ist genau das gegenteil von C_AmIWeaker().
//////////////////////////////////////////////////////////////////////////
FUNC INT C_AMISTRONGER(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_AmIStronger");

	//exceptions

		IF(5*SLF.LEVEL >=2*OTH.LEVEL)||(!C_SLFISCOWARD(SLF))

	{
		//PrintDebugInt(PD_ZS_DETAIL,"...yes");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...no");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_AmIWeaker
//===========
//Überfrüft, ob der NSC 'slf' schwächer als der NSC 'oth' ist. Diese
//Funktion ist genau das gegenteil von C_AmIStronger().
//////////////////////////////////////////////////////////////////////////
FUNC INT C_AMIWEAKER(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_AmIWeaker");

	//exceptions
	IF(5*SLF.LEVEL < 2*OTH.LEVEL)&&(C_SLFISCOWARD(SLF))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...yes");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...no");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsInFightMode
//==================
//Überfrüft, ob der SC/NSC eine Waffe bzw. einen aggresiven Zauber
//in der Hand hält. (Durchgangswachen interpretieren auch die sonst
//neutralen Zauber CHARME und SLEEP als feindlich)
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCISINFIGHTMODE(VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_CHECK,"C_NpcIsInFightMode");
	IF(NPC_ISINFIGHTMODE(OTH,FMODE_FAR)||NPC_ISINFIGHTMODE(OTH,FMODE_MELEE)|| NPC_ISINFIGHTMODE(OTH,FMODE_FIST))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...true");
		RETURN TRUE;
	}
	ELSE IF	NPC_ISINFIGHTMODE(OTH,FMODE_MAGIC)
	{
		IF(NPC_GETACTIVESPELLCAT(OTH)==SPELL_BAD)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...true");
			RETURN TRUE;
		}
		ELSE IF(NPC_ISINSTATE(self,ZS_GUARDPASSAGE)|| NPC_WASINSTATE(self,ZS_GUARDPASSAGE))
		&&((NPC_GETACTIVESPELL(OTH)==SPL_SLEEP)||(NPC_GETACTIVESPELL(OTH)==SPL_CHARM))
		{
			//PrintDebugInt(PD_ZS_CHECK,"...true");
			RETURN TRUE;
		};
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_CHECK,"...false");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsInNeutralSpellMode
//=========================
//Überfrüft, ob der SC/NSC einen neutralen oder benevolenten Zauber
//in der Hand hält.
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCISINNEUTRALSPELLMODE(VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_CHECK,"C_NpcIsInNeutralSpellMode");
	IF(NPC_ISINFIGHTMODE(OTH,FMODE_MAGIC)&&(NPC_GETACTIVESPELLCAT(OTH)==SPELL_GOOD || NPC_GETACTIVESPELLCAT(OTH)==SPELL_NEUTRAL))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_CHECK,"...false");
		RETURN FALSE;
	};
};


//////////////////////////////////////////////////////////////////////////
//Npc_Get/Set...Attitude
//======================
//Funktionen, die direkt die Npc_...-Funktionen der Skriptsprache
//aufrufen, um dem Begriffschaos zu entgehen.
//////////////////////////////////////////////////////////////////////////
FUNC VOID NPC_SETPERMATTITUDE(VAR C_NPC SLF,VAR INT ATT)
{
	//PrintDebugInt(PD_ZS_DETAIL,"Npc_SetPermAttitude()");
	NPC_SETATTITUDE(SLF,ATT);
	NPC_SETTEMPATTITUDE(SLF,ATT);
};

FUNC INT NPC_GETTEMPATTITUDE(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"Npc_GetTempAttitude()");
	RETURN	NPC_GETATTITUDE(SLF,OTH);
};



//////////////////////////////////////////////////////////////////////////
//C_npcTypeIsFriend
//=================
//Ermittelt, ob der NSC vom Typ FRIEND und 'other' der Spieler ist
//Ist 'other' nicht der Spieler, so ist es auch unwichtig ob der
//NSC einen npcType_FRIEND hat und es wird FALSE zurückgegeben.
//////////////////////////////////////////////////////////////////////////
FUNC INT C_npcTypeISFRIEND(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_npcTypeIsFriend()");

	IF(NPC_ISPLAYER(OTH)&&((SLF.FLAGS & NPC_FLAG_FRIEND)==NPC_FLAG_FRIEND))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...false");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsGuard
//=============
//Ermittelt, ob der NSC eine Wache ist. Kriterium:
//->	npcType_GUARD -> TRUE
//->	eine der typischen "Wach-Gilden" -> TRUE
//->	ABER: wenn NSC eine Fernkampfwache ist -> FALSE!!!
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NpcIsGuard(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsGuard");

	IF((SLF.npcType==npcType_GUARD)
	||(SLF.npcType==npcType_OW_GUARD)
	||(SLF.npcType==npcType_MINE_GUARD)
	||(((SLF.npcType==npcType_MAIN)||(SLF.npcType==npcType_FRIEND))&&((SLF.GUILD==GIL_GRD)||(SLF.GUILD==GIL_DMB)||(SLF.GUILD==GIL_TPL))))
	{
		IF(SLF.FIGHT_TACTIC !=FAI_HUMAN_RANGED)
		{
			//PrintDebugInt(PD_ZS_DETAIL,"...true!");
			RETURN TRUE;
		};
	};

	//PrintDebugInt(PD_ZS_DETAIL,"...false!");
	RETURN FALSE;
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsGuardArcher
//==================
//Ermittelt, ob der NSC eine Wache ist, die nur im Fernkampf-Modus
//kämpfen und dabei den eigenen Posten nicht verlassen soll
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NpcIsGuardArcher(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsGuardArcher");

	IF((SLF.npcType==npcType_GUARD)
	||(SLF.npcType==npcType_OW_GUARD)
	||(SLF.npcType==npcType_MINE_GUARD)
	||(((SLF.npcType==npcType_MAIN)||(SLF.npcType==npcType_FRIEND))&&((SLF.GUILD==GIL_GRD)||(SLF.GUILD==GIL_MTR)||(SLF.GUILD==GIL_TPL))))
	{
		IF(SLF.FIGHT_TACTIC==FAI_HUMAN_RANGED)
		{
			//PrintDebugInt(PD_ZS_DETAIL,"...true!");
			RETURN TRUE;
		};
	};

	//PrintDebugInt(PD_ZS_DETAIL,"...false!");
	RETURN FALSE;
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsBoss
//===========
//Ermittelt, ob der NSC zu einer der BOSS-Gilden gehört:
//- Erzbarone
//- Feuermagier
//- Wassermagier
//- Gurus
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCISBOSS(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsBoss");

	IF((SLF.GUILD==GIL_HUN)||
(SLF.GUILD==GIL_MAG)||
(SLF.GUILD==GIL_KDW)||
(SLF.GUILD==GIL_GRD)||
(SLF.GUILD==GIL_GUR))

	{
		//PrintDebugInt(PD_ZS_DETAIL,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...false");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsWorker
//=============
//Ermittelt, ob der NSC zu einer der Arbeiter-Gilden gehört:
//- Altes Lager: Buddler, Schatten
//- Neues Lager: Schürfer, Bauern, Banditen
//- Sektentempel: Novizen
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCISWORKER(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsWorker");

	IF((SLF.GUILD==GIL_VLK)||
(SLF.GUILD==GIL_SLV)||
(SLF.GUILD==GIL_SFB)
)
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...false");
		RETURN FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcIsMage
//===========
//Ermittelt, ob der NSC über Magie verfügt
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCISMAGE(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsMage");

	IF(SLF.ATTRIBUTE[ATR_MANA_MAX ] >0)
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...false");
		RETURN FALSE;
	};
};
//////////////////////////////////////////////////////////////////////////
//C_NpcBelongsToRebelCamp
//=====================
//Ermittelt, ob der NSC einer Gilde des Sektenlagers angehört!
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCBELONGSTOREBELCAMP(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcBelongsToRebelCamp");

	IF((SLF.GUILD==GIL_RBL)
	||(SLF.GUILD==GIL_MAG)
	//||(SLF.GUILD==GIL_PIR)
	//||(SLF.GUILD==GIL_NONE)
	||(SLF.GUILD==GIL_HUN))
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...TRUE");
		RETURN			TRUE;
	}
	ELSE
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...FALSE");
		RETURN			FALSE;
	};
};
//////////////////////////////////////////////////////////////////////////
//C_NpcBelongsToOldCamp
//=====================
//Ermittelt, ob der NSC einer Gilde des Alten Lagers angehört!
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCBELONGSTOOLDCAMP(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcBelongsToOldCamp");

	IF((SLF.GUILD==GIL_VLK)
	||(SLF.GUILD==GIL_DMB)
	||(SLF.GUILD==GIL_GRD))
//||	(slf.guild==GIL_MAG)
//||	(slf.guild==GIL_HUN))
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...TRUE");
		RETURN			TRUE;
	}
	ELSE
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...FALSE");
		RETURN			FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcBelongsToNewCamp
//=====================
//Ermittelt, ob der NSC einer Gilde des Neuen Lagers angehört!
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCBELONGSTONEWCAMP(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcBelongsToNewCamp");

	IF((SLF.GUILD==GIL_SLV)
	||(SLF.GUILD==GIL_SFB))
//||	(slf.guild==GIL_PIR)
//||	(slf.guild==GIL_MTR)
//||	(slf.guild==GIL_KDW))
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...TRUE");
		RETURN			TRUE;
	}
	ELSE
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...FALSE");
		RETURN			FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_NpcBelongsToPsiCamp
//=====================
//Ermittelt, ob der NSC einer Gilde des Sektenlagers angehört!
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCBELONGSTOPSICAMP(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcBelongsToPsiCamp");

	IF((SLF.GUILD==GIL_TPL)
	||(SLF.GUILD==GIL_GUR))
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...TRUE");
		RETURN			TRUE;
	}
	ELSE
	{
 //PrintDebugInt(PD_ZS_DETAIL,"...FALSE");
		RETURN			FALSE;
	};
};

//////////////////////////////////////////////////////////////////////////
//C_ChargeWasAttacked
//===================
//Ermittelt, ob ein Schützling der NSC-Wache attackiert wurde.
//////////////////////////////////////////////////////////////////////////
FUNC INT C_ChargeWasAttacked(VAR C_NPC GUARD,VAR C_NPC CHARGE,VAR C_NPC ATTACKER)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_ChargeWasAttacked");

	IF	C_NpcIsGuard(GUARD)
	||	C_NpcIsGuardArcher(GUARD)
	||(GUARD.npcType==npcType_GUARD)
	||(GUARD.npcType==npcType_MINE_GUARD)
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...NSC ist Wache oder FK-Wache!");

		IF(NPC_GETATTITUDE(GUARD,CHARGE)==ATT_FRIENDLY)
		&&(NPC_GETATTITUDE(GUARD,ATTACKER)!=ATT_FRIENDLY)
		{
			//PrintDebugInt(PD_ZS_DETAIL,"...true");
			RETURN TRUE;
		};
	};

	//PrintDebugInt(PD_ZS_DETAIL,"...false");
	RETURN				FALSE;
};

//////////////////////////////////////////////////////////////////////////
//C_NpcHasSpell
//=============
//Überfrüft, ob der angegebene NSC den Zauberspruch 'spell'
//im Inventory hat.
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCHASSPELL(VAR C_NPC SLF,VAR INT SPELL)
{
	RETURN NPC_HASSPELL(SLF,SPELL);
};

//////////////////////////////////////////////////////////////////////////
//C_NpcHasAmmo
//============
//Überfrüft, ob der angegebene NSC Munition der angegebenen Kategorie
//im Inventory hat.
//->	'category' kann sein : ITAMARROW oder ITAMBOLT
//->	return: Anzahl der gefundenen Geschosse (0, wenn keine gefunden)
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCHASAMMO(VAR C_NPC SLF,VAR INT CATEGORY)
{
	printdebug("C_NPCHASAMMO");
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcHasAmmo");

	VAR INT COUNT;

	//-------- Sicherheitsabfrage --------
	IF(CATEGORY!=ITAMARROW && CATEGORY!=ITAMBOLT)
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...ungültige Kategorie !!!");
		RETURN 0;
	};

	//-------- die 6 Waffenslots durchsuchen --------
	//Slot 1
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,1);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	//Slot 2
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,2);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	//Slot 3
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,3);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	//Slot 4
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,4);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	//Slot 5
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,5);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	//Slot 6
	COUNT=NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,6);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==ITEM_KAT_MUN))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",COUNT);
		IF(HLP_GETINSTANCEID(ITEM)==CATEGORY)
		{
			//PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",ITEM.NAME);
			RETURN COUNT;
		};
	};

	RETURN 0;	//Keine passende Munition gefunden!
};

//////////////////////////////////////////////////////////////////////////
//C_NpcHasWeapon
//==============
//Überfrüft, ob der angegebene NSC eine Waffe der angegebenen Kategorie
//im Inventory hat. Wird nach einer Fernkampfwaffe gefragt, so wird
//nur "ja" zurückgegeben, wenn auch passende Munition vorhanden ist
//- category kann sein : ITEM_KAT_NF oder ITEM_KAT_FF
//////////////////////////////////////////////////////////////////////////
FUNC INT C_NPCHASWEAPON(VAR C_NPC SLF,VAR INT CATEGORY)
{
	//PrintDebugInt(PD_ZS_FRAME,"C_NpcHasWeapon");

	//-------- Sicherheitsabfrage --------
	IF(CATEGORY!=ITEM_KAT_NF && CATEGORY!=ITEM_KAT_FF)
	{
		//PrintDebugInt(PD_ZS_CHECK,"...ungültige Kategorie !!!");
		RETURN FALSE;
	};

	//-------- die 6 Waffenslots durchsuchen --------
	//Slot 1
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,1);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 1 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	//Slot 2
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,2);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 2 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	//Slot 3
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,3);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 3 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	//Slot 4
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,4);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 4 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	//Slot 5
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,5);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 5 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	//Slot 6
	NPC_GETINVITEMBYSLOT(SLF,INV_WEAPON,6);
	IF(HLP_ISVALIDITEM(ITEM)&&(ITEM.MAINFLAG==CATEGORY))
	{
		//PrintDebugInt(PD_ZS_CHECK,"...Waffe in Slot 6 !!!");
		IF(CATEGORY==ITEM_KAT_NF)
		{
			//PrintDebugInt(PD_ZS_CHECK,"...Nahkampfwaffe gefunden!");
			RETURN TRUE;
		}
		ELSE
		{
			IF(C_NPCHASAMMO(SLF,ITEM.MUNITION))
			{
				//PrintDebugInt(PD_ZS_CHECK,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
				RETURN TRUE;
			};
		};
	};

	RETURN FALSE;	//Keine Waffe der Kategorie 'category' (oder nur eine Fernkampfwaffe ohne Munition) gefunden!
};

//////////////////////////////////////////////////////////////////////////
//C_GetAttackReason
//=================
//Erfragt den Grund des Angriffs eines NSCs, damit später darauf
//abgefragt werden kann.
//Konstanten sind in AI_CONSTANTS.D zu finden
//////////////////////////////////////////////////////////////////////////
FUNC INT C_GetAttackReason(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_GetAttackReason");
	RETURN Npc_GetAivar(SLF,AIV_ATTACKREASON);
};

//////////////////////////////////////////////////////////////////////////
//C_otherIsToleratedEnemy
//=======================
//Stellt fest, ob der feindliche NSC aus irgendwelchen Gründen
//zwar nicht angegriffen, wird.
//////////////////////////////////////////////////////////////////////////
FUNC INT C_otherISTOLERATEDENEMY(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_otherIsToleratedEnemy");
	//-------- Orkverfolger --------
//if (C_NpcIsOrc(slf))
//{
//PrintDebugInt		(PD_ZS_DETAIL,	"...'self' ist Ork!");

////---- Ulu-Mulu in der Hand ? ----
//var C_ITEM			weapon;
//var int				weaponInstance;
//weapon = 			Npc_GetReadiedWeapon(oth);
//if (Hlp_IsValidItem(weapon))
//{
//weaponInstance =Hlp_GetInstanceID(weapon);
////PrintDebugString(PD_ZS_DETAIL, "...gezogene Waffe von 'other': ", weapon.name);
//if (weaponInstance == UluMulu)
//{
//PrintDebugInt(PD_ZS_DETAIL, "...true!");
//return		TRUE;
//};
//};
//
////---- Ulu-Mulu equipped ? ----
//weapon = 			Npc_GetEquippedMeleeWeapon	(oth);
//if (Hlp_IsValidItem(weapon))
//{
//weaponInstance =Hlp_GetInstanceID(weapon);
////PrintDebugString(PD_ZS_DETAIL, "...equippte Waffe von 'other': ", weapon.name);
//if (weaponInstance == UluMulu)
//{
//PrintDebugInt(PD_ZS_DETAIL, "...true!");
//return		TRUE;
//};
//};
//};

	//PrintDebugInt(PD_ZS_DETAIL,"...false!");
	RETURN FALSE;
};

FUNC VOID B_TOLERATEENEMY(VAR C_NPC SLF,VAR C_NPC OTH)
{
	//PrintDebugInt(PD_ZS_DETAIL,"B_TolerateEnemy");

	//-------- Orkverfolger --------
	IF(C_NPCISORC(SLF))
	&&(NPC_GETDISTTONPC(SLF,OTH)> HAI_DIST_ASSESSTOLERATEDENEMY)
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...'self' ist Ork und nah genug dran!");

		VAR INT NPCINSTANCE;
		NPCINSTANCE=HLP_GETINSTANCEID(SLF);

		//-------- Aufreger --------
		IF(NPCINSTANCE==ORCSCOUT)
		||(NPCINSTANCE==ORCWARRIOR1)
		||(NPCINSTANCE==ORCWARRIOR2)
		{
			//PrintDebugInt(PD_ZS_DETAIL,"...'self' ist anderer Ork!");
			IF	!NPC_ISINSTATE(SLF,ZS_UPSET)
			{
				//PrintDebugInt(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				NPC_CLEARAIQUEUE(SLF);
				AI_STANDUP(SLF);
				AI_STARTSTATE(SLF,ZS_UPSET,1,"");
			};
		}

		//-------- Verfolger --------
		ELSE IF(NPCINSTANCE==ORCWARRIOR3)
		{
			//PrintDebugInt(PD_ZS_DETAIL,"...'self' ist Ork Tempelkrieger!");
			IF	!NPC_ISINSTATE(SLF,ZS_FOLLOWPC)
			{
				//PrintDebugInt(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				NPC_CLEARAIQUEUE(SLF);
				AI_STANDUP(SLF);
				AI_STARTSTATE(SLF,ZS_FOLLOWPC,1,"");
			};
		};
	};
};

FUNC INT C_NPCISINVAILD(VAR C_NPC SLF)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_NpcIsInvaild");

	IF(HLP_ISVALIDNPC(SLF))
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...no");
		RETURN FALSE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...yes");
		RETURN TRUE;
	};
};