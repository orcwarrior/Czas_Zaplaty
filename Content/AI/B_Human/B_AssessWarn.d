func void B_AssessWarn ()
{	
	////PrintDebugInt		(PD_ZS_FRAME, "B_AssessWarn" );	
	//PRINTGlobals		(PD_ZS_CHECK);	
	//PRINTAttitudes 		(PD_ZS_CHECK);
	//JP: Warns reiﬂen Leute aus dem Zustand, in dem der Warnende ist	
 	//GateGuard-break;
	if	(Npc_IsInState(self, ZS_GuardPassage) || Npc_WasInState(self, ZS_GuardPassage))
	{
		return;	
	};
	if (C_GetAttackReason(victim) == AIV_AR_PERSONALAFFAIRS)||(C_GetAttackReason(other) == AIV_AR_PERSONALAFFAIRS)  
	{
			//B_WhirlAround 		(self,	victim);
			return;
	};	
	//JP: das ist very experimental, aber die Warn reiﬂen immer wieder aus dem Vorgang ( sprich warn warnt vor der sowieso grade bewerteten Situation)
	//JP: Das scheint auch so nicht zu klappen, zumindest beim ersten Warn gibt es da immer noch Probleme
	Npc_PercDisable	(self,	PERC_ASSESSWARN);
	if (! C_NpcIsHuman(other))
	{
		////PrintDebugInt	(PD_ZS_CHECK, "B_AssessWarn Monster" );
		// JP:an dieser Stelle haben sich die Nsc¥s immer weggeh‰ngt und nicht mehr plausibel reagiert, weil jeder an jeden Monster Warns gesendet hat,
		// die dann aber als uninteressant wieder verworfen worden sind, deshalb werde ich hier mal versuchsweise den ZS_AssessMonster aufrufen
		//return;
		AI_StandUp		(self);			// eventuelle Item-Interacts abbrechen
		Npc_SetTarget	(self, other);
		
		Npc_GetTarget	(self);
		AI_StartState	(self, ZS_AssessMonster, 0, "");
	}
	
	else if (!C_NpcIsHuman(victim))
	{
		////PrintDebugInt	(PD_ZS_CHECK, "B_AssessWarn Monster" );
		AI_StandUp		(self);			// eventuelle Item-Interacts abbrechen
		Npc_SetTarget	(self, victim);
		
		Npc_GetTarget	(self);
		AI_StartState	(self, ZS_AssessMonster, 0, "");
	} 
	else 
	{
		////PrintDebugInt	(PD_ZS_CHECK, "B_AssessWarn Human");		
		B_FullStop		(self);
		AI_StartState	(self, ZS_AssessWarn, 0, "");
	};

};
