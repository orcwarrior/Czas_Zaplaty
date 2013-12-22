func int CmpNpc(VAR C_NPC P1,VAR C_NPC P2)
{
	// Ork: Aivary od 0-4 s¹ zarezerwonane i 'akcesory' dla nich nie dzia³aj¹ poprawnie
	If(!Hlp_Isvalidnpc(P1)||!Hlp_Isvalidnpc(P2))
	{
		Return 0;
	};
	Var Int Old1;
	//Var Int Old2;
	Var Int Result;
	Old1=Npc_GetAivar(P1,MIN_NORMALAIVAR);
	//Old2=Npc_GetAivar(P2,0);
	Npc_SetAivar(P1,MIN_NORMALAIVAR,Npc_GetAivar(P2,MIN_NORMALAIVAR)-9999);
	//Npc_SetAivar(P2,MIN_NORMALAIVAR,1);
	Result = (Npc_GetAivar(P1,MIN_NORMALAIVAR) == Npc_GetAivar(P2,MIN_NORMALAIVAR) );
	Npc_SetAivar(P1,MIN_NORMALAIVAR,Old1);
	//Npc_SetAivar(P2,0,Old2);
	Return Result;
};