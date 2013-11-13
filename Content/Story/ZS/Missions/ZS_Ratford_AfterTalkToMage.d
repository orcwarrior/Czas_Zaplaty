//////////////////////////////////////////////////////////////////////////
//	ZS_Ratford_AfterTalkToMages
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Ratford_AfterTalkToMages()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Ratford_AfterTalkToMages");
	AI_SetWalkmode  	(self, 	NPC_RUN);	


};

func int ZS_Ratford_AfterTalkToMages_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Ratford_AfterTalkToMages_Loop");
	//PrintGlobals		(PD_MST_DETAIL);
	B_ExchangeRoutine(self,"START");

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_Ratford_AfterTalkToMages_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;

};
