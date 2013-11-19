func void ZS_Attack ()
{
	if(GrdsInAttack)
	{return;};

	if ( Npc_IsPlayer( other ) )
	{
		add_CollPool(self);	
		DailyHello_HeroAttackersCnt += 1;
		Npc_PercEnable   	(other, 	PERC_ASSESSDAMAGE 	,	B_HeroReactToDamage   	  	);	
	};
	if (C_NpcIsMonsterMage(self)||self.id == 2001)
	{	
		B_FullStop		(self);
		AI_StartState	(self,	ZS_MM_AttackMage, 0, "");
		return;
	};
	////////////////////////////////////////////////////////////////////////////
	//////PrintDebugNpc		(PD_ZS_FRAME, "ZS_Attack" );		
	C_ZSInit			();

	//PRINTGlobals		(PD_ZS_FRAME);
	Npc_PercEnable  	(self,	PERC_ASSESSMURDER,			B_CombatAssessMurder	);	
	Npc_PercEnable  	(self,	PERC_ASSESSDEFEAT,			B_CombatAssessDefeat	);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,			B_CombatReactToDamage	);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE	,		ZS_AssessSurprise		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC,			B_AssessMagic			);			
	Npc_PercEnable		(self,	PERC_ASSESSREMOVEWEAPON	,	B_CombatRemoveWeapon	);
	Npc_PercEnable		(self,	PERC_ASSESSENTERROOM	,	B_CombatAssessEnterRoom	);
	Npc_PercEnable		(self,	PERC_CATCHTHIEF			,	B_CombatCatchThief		);
	if(Hlp_GetInstanceID(self)==RBL_2604_Tony)&&(self.flags == NPC_FLAG_IMMORTAL)
	{
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);	
	};    
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKSHEATH);
	
	B_WhirlAround		(self,	other);
	B_SelectWeapon		(self,	other);
    AI_SetWalkmode 		(self,	NPC_RUN);				// Walkmode für den Zustand
};

func int ZS_Attack_Loop()
{
	//////PrintDebugNpc		(PD_ZS_LOOP,	"ZS_Attack_Loop");		

	Npc_GetTarget		(self);
	if(MD_FinalBattle)
	{
      var c_npc tru; tru = Hlp_GetNpc(truan);		
      var c_npc rod; rod = Hlp_GetNpc(rodericmd);
         
      if(CmpNPC(self,tru))&&(Npc_IsPlayer(other))&&(!Npc_IsDead(Rod))
      {
         Npc_settarget(self,rod);	
      }
      else if(CmpNPC(self,rod))&&(Npc_IsPlayer(other))
      {
         Npc_settarget(self,rod);	
      };
	};
	//PRINTGlobals		(PD_ZS_DETAIL);
	//Change weapon depend on distance to target
 	if(self.fight_Tactic == FAI_HUMAN_MULTI)&&
 	(((Npc_IsInFightMode(self, 	FMODE_FAR)	||	Npc_IsInFightMode(self,	FMODE_MAGIC))&&(Npc_GetDistToNpc(self,other)<HAI_DIST_MELEE+200))
 	||((Npc_IsInFightMode(self, 	FMODE_MELEE)&&(Npc_GetDistToNpc(self,other)>HAI_DIST_MELEE))))
 	{

 	B_SelectWeapon(self,other);	
 	};	
	//If i'm nearly dead print gui icon
	if(self.attribute[ATR_HITPOINTS]*3 < self.attribute[ATR_HITPOINTS_MAX])&&(!Npc_IsPlayer(self))&&(Npc_GetAivar(self,AIV_PARTYMEMBER))
	{
		if(!B_NPCIsOnHelpList(self))
		{	
			B_AddNpc2List(Hlp_GetInstanceID(self));
		};
	};

	//-------- Wenn Gegner Bewußtlos oder Tod... --------
	if (C_NpcIsDown(other) || !Hlp_IsValidNpc(other))&&(!GL_MD_TURNHERO2MEATBUG)
	{
		//////PrintDebugNpc				(PD_ZS_CHECK,	"...Ziel ist kampf-unfähig oder ungültig!");

		Npc_PerceiveAll				(self);		// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht
		Npc_SetAivar(self,AIV_LASTTARGET,  Hlp_GetInstanceID(other));
		if (Npc_GetNextTarget(self))			// Vorsicht: löscht 'other', wenn kein neues Ziel gefunden
		{
			if	(Hlp_IsValidNpc(other)
			&&	!C_NpcIsDown(other)
			&&	Npc_CanSeeNpcFreeLOS(self,other)
			&&	!C_OtherIsToleratedEnemy(self,other))	// sonst ignorierte Feinde nicht in die Auswahl mit aufnehmen
			{
				//PrintDebugString	(PD_ZS_CHECK, "...neues Ziel gefunden: ", other.name);
			}
			else
			{
				//////PrintDebugNpc		(PD_ZS_CHECK, "...kein Neues Ziel vorhanden!");
				return 				LOOP_END;
			};
		}
		else
		{
			//////PrintDebugNpc			(PD_ZS_CHECK, "...KEIN neues Ziel gefunden!");
			return 					LOOP_END;
		};
	};

	if (Npc_GetStateTime(self) > 2)
	{
		//-------- Nahkampfdistanz zu groß ? --------
 		if((Npc_IsInFightMode(self, 	FMODE_FAR)	||	Npc_IsInFightMode(self,	FMODE_MAGIC))
 		&& (Npc_GetDistToNpc(self, other)<HAI_DIST_ABORT_MELEE))
 		{
 		if(Npc_IsInFightMode(self, 	FMODE_MAGIC))
 		{
 			B_FULLSTOP(self);			
 			if (C_NpcHasSpell		(self,SPL_ICECUBE) && !Npc_IsInState(other,ZS_MagicFreeze) )
 			{
 				B_PrintDebug("SeTIceCube");
 				B_DrawSpell			(self,	SPL_ICECUBE,	SPL_SENDCAST_ICECUBE);
 			}
 			else if (B_EquipAndDrawBestMeleeWeapon(self,other))//RANGED -if HAS MELEE - equip
 			{
 				B_PrintDebug("SeTMELEE");
 			};						
 		}
 		else 
 		{
 			B_FULLSTOP(self);
 			if (B_EquipAndDrawBestMeleeWeapon(self,other))//RANGED -if HAS MELEE - equip
 			{
 				B_PrintDebug("SeTMELEE");
 			};
 		};
 			
 		};
		
		
		if ((!Npc_IsInFightMode(self, 	FMODE_FAR)	&&	!Npc_IsInFightMode(self,	FMODE_MAGIC))
		&&	(!Npc_IsInFightMode(other,	FMODE_FAR)	&&	!Npc_IsInFightMode(other,	FMODE_MAGIC))	)
		{
			//////PrintDebugNpc		(PD_ZS_CHECK,	"...WEDER NSC noch Gegner führen Fernkampfwaffen!" );
			
			if ( (Npc_GetDistToNpc(self, other)>HAI_DIST_ABORT_MELEE) && (Npc_GetAivar(self,AIV_LASTHITBYRANGEDWEAPON) == FALSE) )
			{
				//////PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner außerhalb Nahkampfreichweite & letzter Treffer nicht durch Fernkampfwaffe!");
					
				B_FullStop 				(self);
				//PRINTGlobals			(PD_ZS_CHECK);
				if (C_NpcIsHuman(other))
				{
					B_AssessAndMemorize (NEWS_DEFEAT,NEWS_SOURCE_WITNESS, self, self, other);
					
					if (Npc_GetPermAttitude (self, other) != ATT_HOSTILE) //MH: sonst kommt SVM püntig!
					{
						AI_PointAtNpc		(self,	other);
						B_Say				(self,	other,	"$RUNCOWARD");	
						AI_StopPointAt		(self);
					};
				};
				return 					LOOP_END;
			};
		}
	
		//-------- Fernkampfdistanz zu groß ? --------
		else
		{	
			//////PrintDebugNpc				(PD_ZS_CHECK,	"...entweder NSC oder Gegner FÜHREN Fernkampfwaffen!" );
		
			if (Npc_GetDistToNpc(self, other) > HAI_DIST_ABORT_RANGED)
			{
				//////PrintDebugNpc			(PD_ZS_CHECK,	"...Gegner außerhalb Fernkampfreichweite!" );
				B_FullStop 				(self);
				return 					LOOP_END;
			};
		};	
		
		//-------- SC-Gegner rennt schon zu lange (davon) ? --------
		var int countPursuitCycles;									// 2. Zähler neben StateTime für Verfolgungsabbruch nach  Zeit
		countPursuitCycles = countPursuitCycles + 1;	
		if (Npc_IsPlayer(other)
		&&	(C_BodyStateContains(other,BS_RUN) || C_BodyStateContains(other,BS_JUMP) || ((CmpNpc(other,hero))&&(C_BodyStateContains(hero,BS_WALK))&&(SprintEnabled)))
		&&	!Npc_IsInFightMode(self,FMODE_FAR)
		&&	!Npc_IsInFightMode(self,FMODE_MAGIC)
		&&	(C_GetAttackReason(self)!=AIV_AR_INTRUDER) )
		
		{
			if (countPursuitCycles > HAI_TIME_FOLLOW) 				// einige ZS_Attack_Loop's lang verfolgen
			{
				//////PrintDebugNpc			(PD_ZS_CHECK, "...Gegner rennt schon zu lange weg!" );
				B_FullStop 				(self);
				if (C_NpcIsHuman(other))
				{
					// Here add react on flee in missions if needed
					if(quentin_fight!=0)&&(self.id = 858)
					{
						quentin_fight = 2;	
					};
					
					// end
					B_AssessAndMemorize (NEWS_DEFEAT,NEWS_SOURCE_WITNESS, self, self, other);
					
					if (Npc_GetPermAttitude (self, other) != ATT_HOSTILE) //MH: sonst kommt SVM püntig!
					{
						AI_PointAtNpc		(self,	other);
						B_Say				(self,	other,	"$RUNCOWARD");	
						AI_StopPointAt		(self);
					};
					
					AI_Wait				(self,	5);
				};
				return					LOOP_END;
			};
		}
		else
		{
			countPursuitCycles = 0;
		};
	
		//-------- Auswahl/Wechsel der richtigen Waffe --------
		//PRINTGlobals					(PD_ZS_DETAIL);
		Npc_ClearAIQueue				(self);						// falls sich FAI-Moves schneller ansammeln, als sie abgearbeitet werden können.
		B_SelectWeapon					(self,	other);	
		AI_SetWalkmode 					(self,	NPC_RUN);			// falls durch den Waffenwechsel ein AI_Standup() passiert!
		Npc_SetStateTime				(self, 	0);
	};

	/* -------- eigentliches Anwerfen der FAI -------- */
	if (Npc_GetAivar(other,AIV_INVINCIBLE)==FALSE) 					//MH: wird z.B. im Dialog auf True gesetzt, d.h. verfolgter SC kann sich unterhalten, ohne von aNSC angegriffen zu werden
	{
		AI_Attack			(self);
	}
	else
	{
//		B_PrintDebug("TRUE");
		AI_Wait				(self,	0.5);
	};
			
	//-------- Flucht antreten? --------
	if	((self.npctype==NPCTYPE_AMBIENT)
	||	(self.npctype==NPCTYPE_OW_AMBIENT)
	||	(self.npctype==NPCTYPE_MINE_AMBIENT)
	||	(self.fight_Tactic == FAI_HUMAN_COWARD))&&(C_SlfIsCoward(self))
	{
		if ( (self.fight_Tactic == FAI_HUMAN_COWARD) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2) ) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...coward flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );			
		};
		if ( (self.fight_Tactic == FAI_HUMAN_STRONG) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 4 * 3) ) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...strong flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};	  
		if ( (self.fight_Tactic == FAI_HUMAN_MAGE) && (self.attribute[ATR_MANA] < (self.attribute[ATR_MANA_MAX] / 5)) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...mage flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};
		if ( (self.fight_Tactic == FAI_HUMAN_RANGED) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 3)) )&&(self.guild!=GIL_TPL)
		{
			//////PrintDebugNpc(PD_ZS_CHECK, "...ranged fighter flees!" );
			AI_StartState( self, ZS_Flee, 0, "" );
		};
	};
	return				LOOP_CONTINUE;
};

func void ZS_Attack_End()
{	
	//////PrintDebugNpc			(PD_ZS_FRAME, "ZS_Attack_End" );		
	other = Hlp_GetNpc(Npc_GetAivar(self,AIV_LASTTARGET));			//SN: 'other' wird durch ein erfolgloses Npc_GetNextTarget() manchmal gelöscht!

	//PRINTGlobals			(PD_ZS_CHECK);

	
	/* ---- Ist der Gegner "nur" bewußtlos...  ---- */
	if ( Npc_IsInState(other, ZS_Unconscious) && (!Npc_HasReadiedRangedWeapon(self)))// && ((other.spawnDelay & NPC_FLAG_INSTANTDEATH) ! NPC_FLAG_INSTANTDEATH))
	{

		//////PrintDebugNpc		(PD_ZS_CHECK, "...Ziel bewußtlos/magisch schlafend und NSC kein purer Fernkämpfer!" ));

		if (Npc_GetAttitude (self,	other) == ATT_FRIENDLY)
		{
			B_RemoveWeapon	(self);
			B_Say			(self, 	other,	"$LETSFORGETOURLITTLEFIGHT");
			C_StopLookAt	(self);
			AI_StartState	(self,	ZS_HealSelf,	1,	"");
		};
		//todo-aiv'ar!=mission_fight
		if (self.guild==GIL_GRD) || (((Npc_GetPermAttitude(self, other) == ATT_HOSTILE)||(Npc_GetGuildAttitude(self,other) == ATT_HOSTILE))
		||	((C_GetAttackReason(self) == AIV_AR_INTRUDER) && Npc_HasNews(self, NEWS_DEFEAT,self, other)))||((Npc_IsPlayer(other))&&(Global_FinishHero))
		
		{
		    // ---- ... wird er "gefinished" wenn er ein Feind oder Eindringling ist... ---- 
			//////PrintDebugNpc	(PD_ZS_CHECK, "...Hostile/Intruder wird gefinished" );
			B_FullStop		(self);
			//PRINTGlobals	(PD_ZS_CHECK);
			AI_FinishingMove(self,	other);						
			AI_Wait			(self,	1);
		} 
		else
		{
			// ---- ... oder ihm geraten es nicht wieder zu versuchen ---- 
			//////PrintDebugNpc	(PD_ZS_CHECK, "...Nicht hostile" );
			B_Say			(self, other, "$NEVERTRYTHATAGAIN" );		
		};		
	};
			
	
	//-------- Nachbereitungen --------
	B_RemoveWeapon			(self);
	C_StopLookAt			(self);
	B_ResetTempAttitude		(self);
	B_SetAttackReason		(self,	AIV_AR_NONE);
	if (Npc_GetAivar(other,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_PUNISH)
	{
		Npc_SetAivar(other,AIV_GUARDPASSAGE_STATUS,  AIV_GPS_FIRSTWARN);
	};
	
	//-------- Plündern ! --------
	if (!C_NpcIsBoss(self) && C_NpcIsHuman(other) && (Npc_IsInState(other, ZS_Unconscious) || Npc_IsDead(other) || Npc_IsInState(other, ZS_MagicSleep)) ) 
	{
		if (self.fight_tactic != FAI_HUMAN_RANGED)
		{
			//////PrintDebugNpc	(PD_ZS_CHECK,	"...Plünderbedingungen erüllt!");
			AI_StartState	(self, ZS_AssessBody, 1, "");
			return;
		};
	};

	//-------- Heilen ! --------
	AI_StartState			(self,	ZS_HealSelf,	1,	"");
	DailyHello_HeroAttackersCnt -= 1;	
};

//------------------------------------------------------------------------------------------------------
// Die letzt Chance für einen Abbruch des Kampfes
//
// Bedingung:
//	- Angriffsgrund: Nichtbefolgen der Aufforderung "Waffe weg!"
//	- NSC nocht nicht verletzt
//------------------------------------------------------------------------------------------------------
func void B_CombatRemoveWeapon ()
{
	//////PrintDebugNpc				(PD_ZS_FRAME, "B_CombatRemoveWeapon");
	
	if (Npc_WasInState(self,ZS_AssessFighter) || Npc_WasInState(self,ZS_AssessFighterWait))	// Angriffs-Grund das Nichtbefolgen des "Waffe weg"?...
	{
		//////PrintDebugNpc			(PD_ZS_CHECK,	"...Angriffsgrund: Waffe nicht weggesteckt!");
		if (self.attribute[ATR_HITPOINTS]==self.attribute[ATR_HITPOINTS_MAX])				// ...und wurde der NSC noch nicht getroffen...
		{
			//////PrintDebugNpc		(PD_ZS_CHECK,	"...NSC unverletzt!");
			B_FullStop			(self);
			B_ResetTempAttitude	(self);	
			B_AssessRemoveWeapon();															// ...dann bricht der NSC den Kampf gerade noch ab!
		};
	};
};	

//------------------------------------------------------------------------------------------------------
// Die letzt Chance für einen Abbruch des Kampfes
//
// Bedingung:
//	- Angriffsgrund: nicht schnell genug nach einer Warnung den Raum verlassen
//	- NSC noch nicht verletzt
//	- SC darf noch nichts geklaut haben
//------------------------------------------------------------------------------------------------------
func void B_CombatAssessEnterRoom ()
{
	//////PrintDebugNpc				(PD_ZS_FRAME, "B_CombatAssessEnterRoom");
	if (Wld_GetPlayerPortalGuild() == GIL_NONE
	&&	!Npc_HasNews(self, NEWS_THEFT, other, self))
	{
		//////PrintDebugNpc			(PD_ZS_CHECK,	"...SC hat Raum des NSCs verlassen und noch nichts geklaut!");

		if (self.attribute[ATR_HITPOINTS]==self.attribute[ATR_HITPOINTS_MAX])				// ...und wurde der NSC noch nicht getroffen...
		{
			//////PrintDebugNpc		(PD_ZS_CHECK,	"...NSC unverletzt!");
			B_FullStop			(self);
			B_ResetTempAttitude	(self);	
			B_AssessRemoveWeapon();															// ...dann bricht der NSC den Kampf gerade noch ab!
		};
	};
};

//------------------------------------------------------------------------------------------------------
// Der Spieler klaut während der Nsc Kämpft
//
// Bedingung:
//	- Speieler beklaut mich
//	- dadurch wird alles andere unwichtig
//	
//------------------------------------------------------------------------------------------------------
func void B_CombatCatchThief ()
{
	//////PrintDebugNpc				(PD_ZS_FRAME, "B_CombatAssessTheft");
	
	B_AssessAndMemorize	( NEWS_THEFT, NEWS_SOURCE_WITNESS, self, other, self);
	B_FullStop 			( self);
	B_WhirlAround 		( self, other);
	B_SayOverlay 	( self, other, "$DIRTYTHIEF");
	Npc_SetTarget	( self, other);
	AI_StartState	( self, ZS_Attack, 0, "");
};