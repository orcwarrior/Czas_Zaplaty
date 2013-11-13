//////////////////////////////////////////////////////////////////////////
//	ZS_Cavalorn_RytualKatrakanat
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Cavalorn_RytualKatrakanat()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Cavalorn_RytualKatrakanat");
	B_SetPerception (self);    
	
		if (Wld_IsFPAvailable(self,"FP_KAT_CAVALORN"))
		{																	
			AI_GotoFP (self, "FP_KAT_CAVALORN");
		};	
};

func int ZS_Cavalorn_RytualKatrakanat_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Cavalorn_RytualKatrakanat_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_Cavalorn_RytualKatrakanat_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	self.senses =		hero.senses;

};
