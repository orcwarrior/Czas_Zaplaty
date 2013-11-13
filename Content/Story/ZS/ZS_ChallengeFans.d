func void ZS_ChallengeFans ()
{
	
			if (GetTeam(self) != 0)
		{
			Npc_ExchangeRoutine(self,"challenge");		
		};	
var string nearwp;
nearwp =	Npc_GetNearestWP		(self);
	self.senses_range = 400;
//////////////////////////////////////////////////////////////////////////////////////////
	// //PrintDebugNpc			(PD_ZS_FRAME,"ZS_ChallengeFans");
	// C_ZSInit				();
	
	Npc_PercEnable  		(self,	PERC_ASSESSDAMAGE	,	B_NoReact	);	
	Npc_PercEnable  		(self,	PERC_ASSESSMAGIC	,	B_NoReact	);
	Npc_PercEnable  		(self,	PERC_ASSESSSURPRISE	,	B_NoReact	);
	Npc_PercEnable  		(self,	PERC_ASSESSENEMY	,	B_NoReact		);
	Npc_PercEnable  		(self,	PERC_ASSESSMURDER	,	B_NoReact		);	
	Npc_PercEnable  		(self,	PERC_ASSESSDEFEAT	,	B_NoReact		);	
	Npc_PercEnable  		(self,	PERC_CATCHTHIEF		,	B_NoReact		);		
	Npc_PercEnable  		(self,	PERC_ASSESSTALK		,	B_NoReact 		);
	Npc_PercEnable 			(self,	PERC_ASSESSFIGHTSOUND,	B_NoReact);
	// AI_RemoveWeapon			(self);
	 AI_PlayAni				(self,	"T_STAND_2_WATCHFIGHT");
	 if(!Npc_IsOnFP(self,"FP_FAN"))
	 {
	 		if (Wld_IsFPAvailable(self,"FP_FAN"))
		{																	
			AI_GotoFP (self, "FP_FAN");
		};	
	};	
};

func int ZS_ChallengeFans_Loop ()
{
	if(Npc_GetDistToWP(self,self.wp)> 250)
	{
	AI_GotoWP		(self, 	self.wp);		
	};
// var int addguardrnd;
// addguardrnd = Hlp_Random 			(100);
// var int spawntime;
// spawntime = Hlp_Random 			(10);
	// //PrintDebugNpc				(PD_ZS_LOOP,	"ZS_WatchFight_Loop");
		// if (Npc_GetStateTime (self) > spawntime*4)
		// {

			// if (guardsadded < maxguards - addguardrnd)
			// {
				// if (addguardrnd > 92)
				// {
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
					// guardsadded = guardsadded + 6;
				// }
				// else if (addguardrnd > 78)
				// {
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// guardsadded = guardsadded + 5;
				// }
				// else if (addguardrnd > 60)
				// {
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// guardsadded = guardsadded + 4;
				// }			
				// else if (addguardrnd > 45)
				// {
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// guardsadded = guardsadded + 3;
				// }	
				// else if (addguardrnd > 25)
				// {
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// guardsadded = guardsadded + 2;
				// }		
				// else
				// {
				// Wld_InsertNpc				(GRD_2700_Gardist, "OW_OM_ENTRANCE05");
				// guardsadded = guardsadded + 1;
				// };				
				// AI_GotoWP				(self,"OW_PATH_200");	
				// AI_StartState			(self,	ZS_ChallengeButch,	1,	"");
				// return 1;		
			// }
		// else
		// {
		// return 1;
		// };
		// return 1;
	// }
	// else
	// {
		AI_Wait 			(self,5);	
	// };
	
/* 	if ((!Npc_IsDead(butch)||!Npc_IsDead(butch))&& Npc_IsDead(victim))
	{
		//PrintDebugNpc			(PD_ZS_LOOP,"...Workaraound für nicht ankommende PERC_ASSESSMURDER!");
		return 					LOOP_END;
		B_Say 			(self,	NULL,	"$YeahWellDone");		
		
	}; 
	if (Npc_IsInState(other, ZS_Unconscious) || Npc_IsInState(victim, ZS_Unconscious))
	{
		//PrintDebugNpc			(PD_ZS_LOOP,"...Workaround für nicht ankommende PERC_ASSESSDEFEAT!");
		return					LOOP_END;
	};
	*/
	if (Npc_IsInState(other,ZS_Attack) || Npc_IsInState (victim,ZS_Attack))	// ...wird noch gekämpft?
	{
		//PrintDebugNpc			(PD_ZS_CHECK,	"...es wird noch gekämpft!");

		if ( (Npc_GetDistToNpc(self,other)<PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(self,victim)<PERC_DIST_INTERMEDIAT) )
		{
			//PrintDebugNpc		(PD_ZS_CHECK,	"...Kombatanten sind noch nah genug!");
	
			//-------- Random Jubel --------
			var int jubel;
			jubel = Hlp_Random (100);
			if ( jubel < 5) && (Npc_GetStateTime (self) < 3)
			{
				//PrintDebugNpc	(PD_ZS_LOOP,	"ZS_WatchFight_Loop // Fight in 10m range // cheer");
				AI_TurnToNpc	(self,	victim);
				B_Say 			(self,	NULL,	"$HEYHEYHEY");
				return			LOOP_CONTINUE;
			};
	
			//-------- Random Anim --------
			var int anim;
			anim = Hlp_Random (100);
			if 		(anim < 5)	{	AI_TurnToNpc(self, victim);		AI_PlayAni	(self, "T_WATCHFIGHTRANDOM1");	}
			else if	(anim < 10)	{	AI_TurnToNpc(self, victim);		AI_PlayAni	(self, "T_WATCHFIGHTRANDOM2");	}
			else if	(anim < 15)	{	AI_TurnToNpc(self, victim);		AI_PlayAni	(self, "T_WATCHFIGHTRANDOM3");	}
			else if	(anim < 20)	{	AI_TurnToNpc(self, victim);		AI_PlayAni	(self, "T_WATCHFIGHTRANDOM4");	};
			
			//-------- auf Distanz gehen/bleiben --------
			if (Npc_GetDistToNpc(self, other) < PERC_DIST_WATCHFIGHT)
			{
				//PrintDebugNpc	(PD_ZS_LOOP,"... zu nahe an 'other'!");
				AI_TurnToNpc	(self, other);
				AI_Dodge		(self);
				return			LOOP_CONTINUE;
			}
			else if (Npc_GetDistToNpc(self, victim) < PERC_DIST_WATCHFIGHT)
			{
				//PrintDebugNpc	(PD_ZS_LOOP,"... zu nahe an 'other'!");
				AI_TurnToNpc	(self,	victim);
				AI_Dodge		(self);
				return			LOOP_CONTINUE;
			};
		}
		else
		{
			//PrintDebugNpc	(PD_ZS_CHECK,	"...Kombatanten sind zu weit weg!");
			AI_TurnToNpc	(self,	victim);
			AI_StartState	(self,	ZS_GotoFight, 0, "");
			return			LOOP_CONTINUE;
		};
	}
	else
	{
		//PrintDebugNpc		(PD_ZS_CHECK,	"...es wird nicht mehr gekämpft!");
		return 				LOOP_END;
	};

	AI_TurnToNpc			(self,	other);
	return					LOOP_CONTINUE; 
};

func void ZS_ChallengeFans_End ()
{	
	//PrintDebugNpc		(PD_ZS_FRAME, "ZS_WatchFight_End" );
	Npc_ClearAIQueue	(self); //MH: ggf. "Aufschaukler" killen (s. B_CheerFight)
	AI_PlayAni			(self, "T_WATCHFIGHT_2_STAND");
	self.senses_range = hero.senses_range;
	AI_ContinueRoutine 	(self);

};