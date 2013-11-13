//////////////////////////////////////////////////////////////////////////
//	ZS_Ratford_RytualKatrakanat
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Ratford_RytualKatrakanat()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Ratford_RytualKatrakanat");
	B_SetPerception (self);   
	AI_SetWalkmode (self,NPC_RUN);		// Walkmode für den Zustand	 
	if(Ritual_Katrakanat_demon_counter==11)
	{
	AI_GotoWP			(self,	self.wp);							// Gehe zum Tagesablaufstart	
	};
		if (Wld_IsFPAvailable(self,"FP_KAT_RATFORD"))
		{																	
			AI_GotoFP (self, "FP_KAT_RATFORD");
		};	
};

func int ZS_Ratford_RytualKatrakanat_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Ratford_RytualKatrakanat_Loop");
	//PrintGlobals		(PD_MST_DETAIL);

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_Ratford_RytualKatrakanat_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Ratford_RytualKatrakanat_End");

	self.senses =		hero.senses;

};
