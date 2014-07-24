//////////////////////////////////////////////////////////////////////////
//	ZS_MIS_GuardHeadshoot
//	=======
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP 
//////////////////////////////////////////////////////////////////////////
func void ZS_MIS_GuardHeadshoot ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_GuardHeadshoot");
	
	//-------- Wahrnehmungen --------
	GuardPerception			();
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_MoveMob				    );			
	
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.attribute[ATR_STRENGTH] = 130;
	self.damagetype 						=	DAM_POINT;
	self.damage		[DAM_INDEX_POINT]	=	1001;	
	//-------- Vorbereitungen --------
		AI_SetWalkmode			(self,	NPC_RUN);

	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func int ZS_MIS_GuardHeadshoot_Loop ()
{
	//PrintDebugNpc			(PD_TA_LOOP,	"ZS_MIS_GuardHeadshoot_Loop");
	
	if(!Npc_HasReadiedRangedWeapon(self))
	{
	AI_ReadyRangedWeapon(self);

	};
	if(NPC_GetDistToPlayer(self)<3500)
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

func void ZS_MIS_GuardHeadshoot_End ()
{
	//PrintDebugNpc			(PD_TA_FRAME,	"ZS_MIS_GuardHeadshoot_End");
	self.senses	=			hero.senses;
	
};
