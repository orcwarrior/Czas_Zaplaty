//////////////////////////////////////////////////////////////////////////
//	ZS_FollowPC
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Katrakanat_Chase()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Katrakanat_Chase");
	AI_SetWalkmode  	(self, 	NPC_RUN);	
	B_ClearPerceptions ();
	
	
	AI_RemoveWeapon(self);		
	AI_ReadyMeleeWeapon(self);	
};

func int ZS_Katrakanat_Chase_Loop()
{
		var C_NPC dem; dem = Hlp_GetNpc(Demon_Katrakanat);
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Katrakanat_Chase_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	AI_GotoWP (self, "LOCATION_23_01");

	
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};

func void ZS_Katrakanat_Chase_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Katrakanat_Chase_End");
	AI_RemoveWeapon(self);	

	self.senses =		hero.senses;

};

