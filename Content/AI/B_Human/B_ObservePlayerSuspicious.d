//////////////////////////////////////////////////////////////////////////
//	B_ObservePlayerSuspicious
//	=================
//	Wird aufgerufen durch:
//
//	- PERC_OBSERVEINTRUDER
//	- ZS_WakeUp 			(wenn der SC innerhalb von HAI_DIST_OBSERVEINTRUDER)
//
//	aufgerufen. Es passiert folgendes:
//
//	1.	Ignorieren wenn SC im Dialog
//	2.	Ignoriert, wenn NSC Durchgangswache
//	3.	Ignoriert den SC wenn NPCTYPE_FRIENDLY
//	4.	Wenn Intruder ein Mensch
//		- ATT_HOSTILE			-> B_AssessEnemy
//		- ATT_ANGRY/ATT_NEUTRAL	-> B_AssessSC, danach ZS_ObserveIntruder
//		- ATT_FRIENDLY			-> B_AssessSC
//	5.	Intruder ein Monster
//		- harmloses Monster		->	Ignorieren
//		- gefährliches Monster	->	ZS_AssessMonster  
//////////////////////////////////////////////////////////////////////////
func void B_ObservePlayerSuspicious ()
{
	PrintDebugNpc			(PD_ZS_FRAME, "B_ObservePlayerSuspicious");

	//-------- SC im Dialog ? --------
	if (Npc_GetAivar(other,AIV_INVINCIBLE))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...SC im Dialog!");
		return;
	};

	//-------- NPC_TYPE_FRIENDLY ? --------
	if (self.Npctype ==	NPCTYPE_FRIEND)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...freundlich gesinnt!");
		return;
	};

	//-------- NSC ist Durchgangswache ? --------

	//-------- Eindringling ein MENSCH ? --------
	if (C_NpcIsHuman(other))
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling ist Mensch!" );
	
		if (Npc_GetAttitude(self,other) == ATT_HOSTILE)
		{
			B_FullStop		(self);
			B_AssessEnemy	();
			return;
		};

		if (Npc_GetAttitude(self,other) != ATT_FRIENDLY)
		{
			PrintDebugNpc	(PD_ZS_CHECK, "...SC ist Mensch und nicht FRIENDLY!");
			AI_StartState	(self, ZS_ObserveIntruder, 1, "");
			return;
		};
	}

	//-------- Eindringling ist ein MONSTER ! --------
	else
	{
	//-------- Eindringling im Kampfmodus ? --------
	if (C_NpcIsInFightMode	(other))
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling ist im Kampfmodus!");
		B_FullStop		(self);		
		B_AssessEnemy		();
		return;
	}

	//-------- Eindringling im Schleichmodus ? --------
	else if (C_BodyStateContains(other, BS_SNEAK))
	{	
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling schleicht!");
		B_ObserveSuspect	();
		return;
	}

	//-------- Eindringling hält weder Waffen noch schleicht er! --------
	else
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Eindringling ist NICHT im Kampfmodus und schleicht nicht!");
		AI_TurnToNpc		(self,	other);
		return;
	};
	AI_ContinueRoutine		(self);
	return;
	};
};



