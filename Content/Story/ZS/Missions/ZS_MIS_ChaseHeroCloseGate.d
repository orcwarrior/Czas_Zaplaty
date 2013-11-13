//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_ChaseHeroCloseGate
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_ChaseHeroCloseGate ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_ChaseHeroCloseGate");
	
	//-------- Wahrnehmungen --------
	GuardPerception			();
	if (Wld_GetMobState	(self, 	"VWHEEL") == 0)						// Tor offen?
	{
	AI_Wait(self,4.5);	
	AI_TurnAway 			(self,hero);	
		AI_UseMob		(self, 	"VWHEEL", 1);						// ...dann wieder zumachen!
		AI_UseMob		(self, 	"VWHEEL", -1);                      //und vom Mobsi abmelden
	};
	self.guild		= GIL_DMB;
	Npc_SetTrueGuild(self,GIL_DMB);
	Npc_SetTempAttitude			(self,ATT_HOSTILE); 		
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range = 	3500;

	//-------- Vorbereitungen --------
		AI_SetWalkmode			(self,	NPC_RUN);

	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func int ZS_MIS_ChaseHeroCloseGate_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_MIS_ChaseHeroCloseGate_Loop");
	
	AI_Wait(self,1);	
	if(!Npc_HasReadiedMeleeWeapon(self))
	{
		AI_ReadyMeleeWeapon(self);

	};
	AI_TurnToNpc(self,hero);	
			
	return				LOOP_CONTINUE;

};

func void ZS_MIS_ChaseHeroCloseGate_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_ChaseHeroCloseGate_End");
	self.senses	=			hero.senses;
	
};
