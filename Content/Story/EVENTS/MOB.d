//***************************************************************************
//	Alte Mine - Tor auf der untersten Ebene
//***************************************************************************
var int _STR_MESSAGE_WHEEL_STUCKS_AGAIN;

FUNC int MC_OLDMINE_ASGHAN ()
{	
	return true;
};

//***************************************************************************
//	Alte Mine - Eingangstor
//***************************************************************************
func int MC_OLDMINE_ENTRANCE ()
{
	return false;
};

//***************************************************************************
//	Klosterruine
//***************************************************************************
FUNC int MC_MONASTERYRUIN_GATE ()
{	
	//PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_MONASTERYRUIN_GATE");
	return true;
};

//***************************************************************************
//	Ork-Friedhof
//***************************************************************************
FUNC int MC_OGY_GATE ()
{	
	//PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OGY_GATE");
	if((Hero_GotoGYD)&&(Npc_KnowsInfo (hero,DIA_NoName_RBL3)))
	||(Npc_KnowsInfo (hero,DIA_NoName_RBL3_2))
	{
      return 1;	
	}
	else
	{
      return 0;	
	};
};

//***************************************************************************
//	Ork-Friedhof
//***************************************************************************

FUNC int MC_FM_GATE ()
{	
	//PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_FM_GATE");
	return freemine_ready_to_opened;
};

//***************************************************************************
//	Trollschlucht
//***************************************************************************
FUNC int EVT_TROLLSCHLUCHT_GATE_TRIGGER ()
{	
	//PrintDebugNpc	(PD_ITEM_MOBSI,	"EVT_TROLLSCHLUCHT_GATE_TRIGGER");
	return true;
};

//***************************************************************************
//	Ork-Stadt - groﬂes Holztor
//***************************************************************************
var int	OrcCity_GateOpen;

FUNC int MC_OrcCity_Gate ()
{	
	//PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OrcCity_Gate");
	return false;
};

//***************************************************************************
//	Ork-Stadt - ‰uﬂeres Tempeltor
//***************************************************************************
FUNC int MC_OrcCity_Sunctum_OuterGate ()	// heiﬂt absichtlich "Sunctum"
{	
	//PrintDebugNpc		(PD_ITEM_MOBSI,	"MC_OrcCity_Sanctum_OuterGate");
	return false;
};

