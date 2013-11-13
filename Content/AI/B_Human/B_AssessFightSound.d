//////////////////////////////////////////////////////////////////////////
//	B_AssessFightSound
//	==================
//	Wird direkt durch die Wahrnehmung PERC_ASSESSFIGHTSOUND angesprungen,
//	die jedesmal ausgelöst wird, wenn SC/NSC attackiert werden (Nah-,
//	Fern-, Magiekampf).
//	Macht im Grunde folgende Fallunterscheidung
//	1. 	Monster kämft gegen Mensch
//		-> Monster bewerten in ZS_AssessMonster
//	2.	NSC ist Wache
//		-> greift ein, wenn ein Schützling angegriffen wird
//	3.	NSC ist eine Meister-Gilde
//		-> greift garnicht ein, ist aber wachsam
//	4.	NSC ist ein Normalbürger
//		-> beobachtet den Kampf (WatchFight)
// If jump to it directly by the perception PERC_ASSESSFIGHTSOUND, 
// be is fired each time when SC / NSC attacks (short-, 
// Remote, magic, combat). 
// Do basically the following case distinction 
// 1 Monsters were fighting bravely against man 
// -> Monster evaluate ZS_AssessMonster 
// 2 NSC Guard 
// -> Applies when a protege is attacked 
// 3 NSC is a master guild 
// -> Interferes not at all, but is wary 
// 4 NSC is a normal citizen 
// -> Watches the fight (watch fight)
//////////////////////////////////////////////////////////////////////////
func void B_AssessFightSound ()
{
	////PrintDebugInt			(PD_ZS_FRAME, "B_AssessFightSound" );
	if (C_GetAttackReason(victim) == AIV_AR_PERSONALAFFAIRS)||(C_GetAttackReason(other) == AIV_AR_PERSONALAFFAIRS)  
	{
			//B_WhirlAround 		(self,	victim);
			return;
	};	
	//-------- Kampf Mensch gegen Monster ! --------
	if (C_NpcIsMonster(other) && C_NpcIsHuman(victim) )
	{
		////PrintDebugInt		(PD_ZS_FRAME, "...Monster greift Mensch an!" );
		if ((Npc_GetAttitude	(self, victim) == ATT_FRIENDLY) || (Npc_GetAttitude(self, victim) == ATT_NEUTRAL))
		{
			if (Npc_CanSeeNpcFreeLOS(self, other) && (Npc_GetDistToNpc(self, other) < HAI_DIST_ASSESS_MONSTER))
			{
				//Npc_SetTarget	(self, other);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
			/********************************************
			// Der  B wurde nicht abgebrochen, obwohl ein Monster beteiligt war, so daß sich die AI mit dem Monster als other weiter unten vertan hat
			/*************************************************/
			return;
		}
		else
		{
			B_SmartTurnToNpc(self, victim);
			//PRINTAttitudes 	(PD_ZS_CHECK);
			B_AssessFighter ();
			return;
		};
	}
	else if (C_NpcIsMonster(victim) && C_NpcIsHuman(other))
	{
		////PrintDebugInt		(PD_ZS_CHECK, "...Mensch greift Monster an!" );
		if ((Npc_GetAttitude	(self, other) == ATT_FRIENDLY) || (Npc_GetAttitude(self, other) == ATT_NEUTRAL))
		{
			if (Npc_CanSeeNpcFreeLOS	( self, other))
			{
				Npc_SetTarget	(self, victim);
				Npc_GetTarget	( self);
				AI_StartState	(self, ZS_AssessMonster, 0, "");
				return;
			};
			/********************************************
			// Der  B wurde nicht abgebrochen, obwohl ein Monster beteiligt war, so daß sich die AI mit dem Monster als other weiter unten vertan hat
			/*************************************************/
			return;
		}
		else
		{
			B_SmartTurnToNpc(self, victim);
			//PRINTAttitudes 	(PD_ZS_CHECK);
			B_AssessFighter ();
			return;
		};
	};

	//Should i be in hero CollPool
	if(Npc_IsPlayer(other))
	{
		add_CollPool(self);	
	};
	
	//-------- Wurde ich selbst angegriffen ? --------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(victim))
	{
		////PrintDebugInt		(PD_ZS_CHECK,	"...NSC selbst wurde getroffen!" );
		B_FullStop			(self);
		AI_StartState 		(self,	ZS_ReactToDamage, 0, "");
		return;
	};	

	//-------- WACHEN checken, ob einer ihrer Schützlinge angegriffen wird --------
	if (C_ChargeWasAttacked(self, victim, other))
	{ 
		////PrintDebugInt		(PD_ZS_CHECK,	"...NSC ist Wache und ein Schützling wurde attackiert!" );
		if (Npc_GetPermAttitude(victim,other) == ATT_FRIENDLY)		// HINWEIS: Bedingung für 'friendly fire' aus ZS_ReactToDamage!!!
		{
			////PrintDebugInt	(PD_ZS_CHECK,	"...war nur 'friendly fire'!" );
			return;
		}
		else
		{
			//PRINTGlobals	(PD_ZS_CHECK);
			////PrintDebugInt	(PD_ZS_CHECK,	"...und der ist auch sauer bzw. flieht!" );
			B_FullStop		(self);
			Npc_SetTarget	(self,	other);
			B_WhirlAround	(self,	other);
			B_DrawWeapon	(self,	other);
			AI_StartState 	(self,	ZS_ProclaimAndPunish, 0, "");
			return;
		};
	}

	//-------- BOSS-Gilden --------
	else if (C_NpcIsBoss(self)||C_NpcIsGuard(self)||C_NpcIsGuardArcher(self))
	{
		////PrintDebugInt		(PD_ZS_CHECK,	"...NSC gehört zu BOSS-Gilde!");
		B_SmartTurnToNpc	(self,	victim);
		B_AssessFighter		();
		return;
	}

	//-------- WORKER (kein Monster/WACHE/BOSS) --------
	else if (Npc_GetDistToNpc(self,victim) < PERC_DIST_WATCHFIGHT) 
	{
		////PrintDebugInt		(PD_ZS_CHECK,	"...Opfer in WatchFight-Range!" );

		B_WhirlAround		(self,	victim);
		AI_StartState 		(self,	ZS_WatchFight, 0, "");
		return;
	};	
};