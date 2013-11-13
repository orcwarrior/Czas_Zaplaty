//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_TryToCloseSthGate
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_TryToCloseSthGate ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_TryToCloseSthGate");
	
	//-------- Wahrnehmungen --------
	GuardPerception			();
	AI_SetWalkmode			(self,	NPC_RUN);
	AI_GotoWP				(self,	"OCR_NORTHGATE_VWHEEL");						// Gehe zum Tagesablaufstart	

// 	if (Wld_GetMobState	(self, 	"VWHEEL") == 0)						// Tor offen?
// 	{
		AI_UseMob		(self, 	"VWHEEL", 1);						// ...dann wieder zumachen!
		AI_UseMob		(self, 	"VWHEEL", -1);                      //und vom Mobsi abmelden
//	};

	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range = 	3500;

	//-------- Vorbereitungen --------

	
	//-------- Grobpositionierung --------

};

func int ZS_MIS_TryToCloseSthGate_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_MIS_TryToCloseSthGate_Loop");
	
	if(!Npc_HasReadiedRangedWeapon(self))
	{
	AI_ReadyRangedWeapon(self);

	};
	if(NPC_GetDistToPlayer(self)<800)
	{
// 	self.guild		= GIL_DMB;
// 	Npc_SetTrueGuild(self,GIL_DMB);
	Npc_SetTempAttitude			(self,ATT_HOSTILE); 	
		Npc_SetTarget(self,hero); 
		AI_StartState(self,ZS_ATTACK,1,"");		
	return				LOOP_END;
	}
	else
	{
	AI_TurnToNpc(self,hero);	
	AI_WAIT(self,1);
	return				LOOP_CONTINUE;
	};

};

func void ZS_MIS_TryToCloseSthGate_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_TryToCloseSthGate_End");
	self.senses	=			hero.senses;
	
};
