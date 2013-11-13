//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_GuardChatchHero
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_GuardChatchHero ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_GuardChatchHero");
	
	//-------- Wahrnehmungen --------
	GuardPerception			();
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob				    );			
	
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Vorbereitungen --------
		AI_SetWalkmode			(self,	NPC_RUN);

	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func int ZS_MIS_GuardChatchHero_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_MIS_GuardChatchHero_Loop");
	
	AI_Wait					(self,	1);
	if(Npc_GetStateTime(self)<14)
	{
	if(!Npc_HasReadiedMeleeWeapon(self))
	{
		AI_Wait(self,1);	
		AI_ReadyMeleeWeapon(self);

	};
	AI_TurnToNpc(self,hero);	
	return				LOOP_CONTINUE;
	}
	else
	{
	self.guild		= GIL_DMB;
	Npc_SetTrueGuild(self,GIL_DMB);
	Npc_SetTempAttitude			(self,ATT_HOSTILE); 	
		Npc_SetTarget(self,hero); 
		AI_StartState(self,ZS_ATTACK,1,"");		
	return				LOOP_END;
	};
};

func void ZS_MIS_GuardChatchHero_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_GuardChatchHero_End");
	self.senses	=			hero.senses;
	
};
