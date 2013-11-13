//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_ChaseHero
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_ChaseHero ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_ChaseHero");
	
	//-------- Wahrnehmungen --------
	GuardPerception			();
	
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range = 	3500;

	//-------- Vorbereitungen --------
		AI_SetWalkmode			(self,	NPC_RUN);

	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func int ZS_MIS_ChaseHero_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_MIS_ChaseHero_Loop");
	
	AI_Wait(self,1);	
	if(!Npc_HasReadiedMeleeWeapon(self))
	{
		AI_ReadyMeleeWeapon(self);

	};
	AI_TurnToNpc(self,hero);	
	if(Npc_GetDistToPlayer(self)<3500)
	{

	Npc_SetTarget(self,hero);
	Npc_SetTempAttitude			(self,ATT_HOSTILE); 
	AI_StartState(self,ZS_ATTACK,1,"");		
	
	};	
	return				LOOP_CONTINUE;

};

func void ZS_MIS_ChaseHero_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_ChaseHero_End");
	self.senses	=			hero.senses;
	
};
