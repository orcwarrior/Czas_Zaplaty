// func void B_AssessUseMob ()
// {
// 	////PrintDebugNpc					(PD_ZS_FRAME,	"B_AssessUseMob");

// 	var string detectedMob;
// 	detectedMob = Npc_GetDetectedMob(other);
// 	////PrintDebugNpc					(PD_ZS_CHECK,	detectedMob);

// 	if (Npc_CanSeeNpcFreeLOS		(self, other))
// 	{
// 		if (Npc_IsDetectedMobOwnedByNpc(other,	self)
// 		||	Npc_IsDetectedMobOwnedByGuild(other, self.guild))
// 		{	
// 			////PrintDebugNpc			(PD_ZS_CHECK,	"...MOB gehört NSC oder seiner Gilde!");
// 			if (Npc_GetPermAttitude	(self, other)==ATT_FRIENDLY || self.guild==other.guild)
// 			{
// 				////PrintDebugNpc		(PD_ZS_CHECK,	"...Manipulator ist FRIENDLY oder in gleicher Gilde!");
// 				B_Say 				(self,	other,	"$HandsOff");
// 			}
// 			else
// 			{
// 				//PRINTGlobals(PD_ZS_CHECK);
// 				
// 				//---- Täter vermöbeln ----
// 				Npc_SetTempAttitude	( self,	ATT_HOSTILE);
// 				Npc_ClearAIQueue	( self);
// 				B_WhirlAround		( self,	other);
// 				B_SayOverlay		( self,	other,	"$IWillTeachYouRespectForForeignProperty");
// 				// JP: Ist ein heikler Fall, eigentlich sollten die Nsc´s nah genug sein, evtl. aber noch auf ZS_WarnAndPunish umbauen
// 				AI_SetWalkmode		( self,	NPC_RUN);
// 				Npc_SetTarget 		( self,	other);
// 				AI_StartState		( self,	ZS_Attack,	0,	"");
// 			};
// 		}	
// 		else
// 		{
// 		    ////PrintDebugNpc					(PD_ZS_DETAIL,	"not my MoB");		
// 		};
// 	}	
// 	else
// 	{
// 	    ////PrintDebugNpc					(PD_ZS_DETAIL,	"kann SC nicht sehen");	
// 	};
// };



//from G2
func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{	
	var int portalguild;	portalguild = Wld_GetPlayerPortalGuild();
		
	if (portalguild > GIL_NONE)
	&& ( (slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild, portalguild) == ATT_FRIENDLY) )
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};

func int C_IsUsedMobMyPossession(var C_NPC slf, var C_NPC oth)
{
	// FUNC

	// ------ Persönliches Besitzflag ------
	if (Npc_IsDetectedMobOwnedByNpc(other, self)) 
	{
		return TRUE;
	};
	
	// ------ wenn MOB in meinem Portalraum (oder Raum von befreundeter Gilde) benutzt wurde ------
	if (C_NpcIsBotheredByPlayerRoomGuild(self))
	|| (Wld_GetPlayerPortalGuild() == GIL_SLV)
	{
		return TRUE;
	};	
	
	return FALSE;
};


// ****************************************************
// B_AssessUseMob
// --------------
// wird durch Wahrnehmung ASSESSUSEMOB aufgerufen
// wird von ÜBERALL her aufgerufen (auch von ZS_Attack)
// ****************************************************

func void B_AssessUseMob ()
{
	// EXIT IF...
	
	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other)) 
	{
		return;
	};
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
// 	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
// 	{
// 		if (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
// 		{
// 			return;
// 		};
// 	};
	
	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Npc_IsDetectedMobOwnedByNpc(other, self))|| C_IsUsedMobMyPossession (self, other)
		{
			//weiter (kein Abbruch bei persönlichem Besitz)
		}
		else
		{
			return;
		};		
	};

	// ------ Mob gehörte mir nicht ------
// 	if (!C_IsUsedMobMyPossession (self, other))
// 	{
// 		return;
// 	};
	
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		if  ( (Npc_IsInState(self, ZS_ObserveIntruder)) || (Npc_IsInState(self, ZS_ClearRoom)) )
		{
			//troztdem gesehen!
		}
		else
		{
			return;
		};
	};
	
	// ------ nur bestimmte Mobsis ------
	var string detMob; detMob = Npc_GetDetectedMob(other);
	
	if (Hlp_StrCmp(detMob, "CHESTBIG") == FALSE)
	&& (Hlp_StrCmp(detMob, "CHESTSMALL") == FALSE)
	{
		return;
		
		/*
		// ------ bei unwichtigen Mobs ------
		if (Hlp_StrCmp(detMob, "BEDHIGH") == TRUE)
		|| (Hlp_StrCmp(detMob, "LEVER") == TRUE)
		|| (Hlp_StrCmp(detMob, "TOUCHPLATE") == TRUE)
		|| (Hlp_StrCmp(detMob, "TURNSWITCH") == TRUE)
		|| (Hlp_StrCmp(detMob, "VWHEEL") == TRUE)
		|| (Hlp_StrCmp(detMob, "LAB") == TRUE)
		|| (Hlp_StrCmp(detMob, "RMAKER") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSANVIL") == TRUE)
		|| (Hlp_StrCmp(detMob, "BSFIRE") == TRUE)
		|| (Hlp_StrCmp(detMob, "STOVE") == TRUE)
		|| (Hlp_StrCmp(detMob, "PAN") == TRUE)
		|| (Hlp_StrCmp(detMob, "HERB") == TRUE) //BAUMSAEGE CAULDRON SMOKE BOOK BSCOOL BSSHARP SDW
		{
			B_Say (self, other, "$BLA"); //***Fixme*** Raus aus meinem Bett!
		};
		
		return;
		*/
	};
	
	// ------ ignore THEFT ------
	if (!C_WantToAttackThief(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		//todo
		//if (C_NpcIsGateGuard(self))
		//{
				B_AssessAndMemorize	(NEWS_THEFT, NEWS_SOURCE_WITNESS, self, other, victim); 
				//TODO: CallComrades
		//};
		
		return;
	};
		
	
	// FUNC
	
				Npc_ClearAIQueue 	(self);
				C_LookAtNpc 		(self, other);
				AI_StartState 		(self, ZS_CatchThief, 0, "");
				return;
};



