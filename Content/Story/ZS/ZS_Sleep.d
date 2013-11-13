func void B_TryFindBed(var C_NPC slf)
{
	if (!C_BodyStateContains(slf, BS_MOBINTERACT_INTERRUPT))
	{
		if (Wld_IsMobAvailable (slf,"BED"))
		{
		    AI_UseMob		(slf,	"BED",1);
		}
		else if (Wld_IsMobAvailable (slf,"BEDHIGH"))
		{
		    AI_UseMob		(slf,	"BEDHIGH",1); //Mehrfache Mob-Benutzung okay, weil nachfolgende UseMobs ignoriert werden, wenn UseMob schon aktiv ist
    	
		}
		else if (Wld_IsMobAvailable (slf,"BEDLOW"))
		{
			AI_UseMob 		(slf,	"BEDLOW",1); // Mobs werden nur benutzt, wenn NSC sie sehen kann und wenn sie frei sind (sagt Ulf)
		}
		else if (Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{															
			AI_GotoFP (self, "FP_CAMPFIRE");
			AI_AlignToFP(self);
			if(Npc_IsOnFP(self,"FP_CAMPFIRE"))
			{
				AI_Dodge(self);
				AI_PlayAniBS (self,"T_BEDLOW_BACK_STAND_2_S0",BS_MOBINTERACT_INTERRUPT);
				AI_PlayAniBS (self,"T_BEDLOW_BACK_S0_2_S1",BS_MOBINTERACT_INTERRUPT);
			};
		};
	};
};
func void B_SleepQuietSound ()
{
	//PrintDebugNpc 		(PD_TA_DETAIL,	"B_SleepQuietSound");
	
	if (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)&&(Npc_CanSeeNpcFreeLOS(self,other))
	{
		AI_StartState	(self,	ZS_WakeUp, 0, "");
	}
	else
	{
		B_TossAndTurn	();
	};
};
	// **********
// ZS_Sleep
// **********
//21:39 2006-05-18 BuxFix Func copied from GII -orcwarrior
func void ZS_Sleep ()					//wichtig, damit Sleep-Wahrnehmungen erst aktiv werden, wenn NSC im Bett liegt
{
	B_SetPerception(self);
	
	B_FullStop (self);
	AI_GotoWP			(self,	self.wp);	
	AI_SetWalkmode 	(self, NPC_WALK);		
	
	if (Hlp_StrCmp (Npc_GetNearestWP(self), self.wp) == FALSE)
    {
		AI_GotoWP	(self, self.wp);
	};
	AI_StartState		(self, ZS_SleepBed, 0, "");
	return;
};

// *****************
// B_AssessSleepTalk
// *****************

//steht in normalen Sleep

// func void B_AssessSleepTalk()
// {
// 	//B_Say (self, other, "$YOUDISTURBEDMYSLUMBER"); //kommt sonst doppelt
// 	
// 	if (C_BodyStateContains(self, BS_LIE))
// 	{
// 		AI_UseMob (self, "BEDHIGH"	, -1);
// 		AI_UseMob (self, "BED"	, -1);
// 		AI_UseMob (self, "BEDLOW"	, -1);
// 	};
// 	
// 	AI_StartState (self, ZS_WakeUp, 0, "");
// };


// ********
// ZS_Sleep
// ********

func void ZS_SleepBed ()
{
	//Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_AssessQuietSound			); //geht in ZS_ObservePlayer
	Npc_PercEnable		(self, 	PERC_ASSESSDAMAGE 		, 	ZS_ReactToDamage				);
	Npc_PercEnable 		(self, 	PERC_ASSESSTALK 		, 	ZS_WakeUp			);
	
	AI_SetWalkmode 		(self, NPC_WALK);
	
	
};
		
func int ZS_SleepBed_Loop ()	
{
	if (!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
	B_TryFindBed(self);
	};
	return LOOP_CONTINUE;
};

func void ZS_SleepBed_End()
{
	if (!Npc_IsPlayerInMyRoom (self))
	{
		B_Say (self, self, "$AWAKE");
	};
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	AI_ContinueRoutine (self);//21:43 2006-05-18-some not bad idea :] -orcwarrior
};
