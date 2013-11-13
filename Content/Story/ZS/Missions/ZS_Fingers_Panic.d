//////////////////////////////////////////////////////////////////////////
//	ZS_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Fingers_Panic()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Fingers_Panic");
	AI_SetWalkmode  	(self, 	NPC_RUN);	
	Mdl_ApplyOverlayMds	(self,	"HUMANS_FLEE.MDS");//mds uciekania w panice budzis
	B_ClearPerceptions ();
	
};

func int ZS_Fingers_Panic_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Fingers_Panic_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

 	//AI_GotoWP (fingers,"PATH_OR22");

AI_GotoNpc (self,hero); // niech biegnie w panice do nas

	AI_TurnToNpc (fingers, hero);	
//	B_CheckForImportantInfo (self,hero);
	return LOOP_END;
	
};

func void ZS_Fingers_Panic_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Fingers_Panic_End");

	self.senses =		hero.senses;
	Mdl_RemoveOverlayMDS(self,"HUMANS_FLEE.MDS");// usuniecie mds`a budzis
	B_ExchangeRoutine(self,"AFTERPANIC");

};

