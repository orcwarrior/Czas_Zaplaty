//////////////////////////////////////////////////////////////////////////
//	ZS_Leren_RytualKatrakanat
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Leren_RytualKatrakanat()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Leren_RytualKatrakanat");
	B_SetPerception (self);    
	
		if (Wld_IsFPAvailable(self,"FP_KAT_MAGE"))
		{																	
			AI_GotoFP (self, "FP_KAT_MAGE");
		};	
};

func int ZS_Leren_RytualKatrakanat_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Leren_RytualKatrakanat_Loop");
	//PrintGlobals		(PD_MST_DETAIL);

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_Leren_RytualKatrakanat_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Leren_RytualKatrakanat_End");

	self.senses =		hero.senses;

};
