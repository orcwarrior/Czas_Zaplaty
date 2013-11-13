func void Pupil_SetPerception()
{

	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_Pupil_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_Pupil_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_Pupil_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_Pupil_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_Pupil_AssessBody);
	Perc_SetRange(PERC_ASSESSENEMY,500);
	Perc_SetRange(PERC_ASSESSWARN,2500);
//	Npc_PercEnable  	(self,	PERC_ASSESSPLAYER,		B_Pupil_AssessItem);
	
};
func void Pupil_SetPerceptionWait()
{

	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_Pupil_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_Pupil_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_Pupil_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_Pupil_AssessBody);
	Perc_SetRange(PERC_ASSESSWARN,2500);
//	Npc_PercEnable  	(self,	PERC_ASSESSPLAYER,		B_Pupil_AssessItem);
	
};
func void B_Pupil_AssessItem ()
{
	Npc_PerceiveAll (self);
	if(Wld_DetectItem (self, ITEM_KAT_FOOD))
	{
		if(Hlp_IsValidItem(item))&&/*(Hlp_StrCmp(item.scemeName,"FOOD"))&&*/((Npc_GetDistToPlayer(self)+Npc_GetDistToItem(self,item) < 1500)&&((self.attribute[ATR_HITPOINTS]<self.attribute[ATR_HITPOINTS_MAX])||(Pupil_Hungry!=0)))
		{
			AI_GotoItem(self,item);
			Wld_RemoveItem(item);
			AI_StartState	(self, ZS_Pupil_EatItem, 0, "");				
		};
	};
	
};
func void B_Pupil_ReactToDamage ()
{
	if (Npc_GetAivar(self,AIV_MM_SPECREACTTODAMAGE) != FALSE)
	{
		B_SpecialCombatDamageReaction(self,other);
	};
	//////PrintDebugNpc	(PD_MST_FRAME,"B_MM_ReactToDamage");
	//PRINTGlobals	(PD_MST_CHECK);   

	Npc_SetAivar(self,AIV_MM_TEMP_PRIO,  PRIO_ATTACKER);
	
	//////PrintDebugNpc	(PD_MST_FRAME,"...Monster ist Jäger");
	Npc_SetTarget	(self, other);
	Npc_ClearAIQueue(self);
	Npc_PercDisable	(self,	PERC_ASSESSENEMY);		// SN:da diese Wahrnehmung sonst die Ausführung des folgenden AI_StartState verhindert!
	if(!Npc_IsPlayer(other))&&(!Npc_GetAivar(other,AIV_MM_PARTYMEMBER))
	{
	AI_StartState	(self, ZS_Pupil_Attack, 0, "");
	};
};

func void B_Pupil_ReactToOthersDamage ()
{
    //////PrintDebugNpc(PD_MST_FRAME,"B_Pupil_ReactToOthersDamage");

    	
 	if (Npc_IsPlayer(victim))&&(!Npc_IsInState(self,ZS_Pupil_Attack))&&(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
 	{
 		Npc_SetTarget	(self, other);
 		Npc_ClearAIQueue(self);
 		AI_StartState	(self, ZS_Pupil_Attack, 0, "");
 	};
	
	if (Npc_IsPlayer(other))&&(!Npc_IsInState(self,ZS_Pupil_Attack))
	{
		Npc_SetTarget	(self, victim);
		Npc_ClearAIQueue(self);
		AI_StartState	(self, ZS_Pupil_Attack, 0, "");
	};
};

func void B_Pupil_AssessEnemy()
{
    //////PrintDebugNpc(PD_MST_FRAME,"B_Pupil_AssessEnemy");

		if (	(Npc_GetDistToNpc(self,other)+Npc_GetDistToPlayer(self) > 1200)
		&&		Npc_CanSeeNpcFreeLOS(self,other)&&(!Npc_IsPlayer(other))			)&&((Npc_IsInState(other,ZS_Attack))||(Npc_IsInState(other,ZS_MM_Attack))||(Npc_IsInState(other,ZS_MM_AttackMage)))	//SN 08.01.01: Vermeidung von Entdeckung des Spieler durch Wände hindurch
		{
			Npc_SetTarget 	(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_Pupil_Attack, 0, "");
		}
		else if (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)	
		{
			//SN: wenn Spieler in Monster verwandelt, sind die Monster immer noch hostile, nicht aber nach Gildentabelle!
			//	-> vermeidet z.B. daß ein SC-Snapper von anderen Snappern attackiert wird
			//	-> wird später durch Aufruf von B_InitMonsterAttitudes() nach der Verwandlung dauerhaft und sauber gelöst! 
			return;	
		};
};

func void B_Pupil_AssessBody ()
{
	var int othgld;
	othgld=Npc_GetTrueGuild(other);

	if(othgld!=GIL_DEMON)&&(othgld!=GIL_ZOMBIE)&&(othgld!=GIL_UNDEADORC)&&(othgld!=GIL_SKELETON)&&(othgld!=GIL_GOLEM)
	{
		Npc_ClearAIQueue(self);
		if((Npc_GetDistToNpc(self,other)+Npc_GetDistToPlayer(self) < 2500)&&((self.attribute[ATR_HITPOINTS]<self.attribute[ATR_HITPOINTS_MAX])||(Pupil_Hungry!=0)))
		{
		AI_StartState 	(self, ZS_Pupil_EatBody, 0, "");
		};
	};		
	
};


func void ZS_Pupil_Attack ()
{
	//////PrintDebugNpc		(PD_MST_FRAME, "ZS_Pupil_Attack");

	//-------- Monster-Mages --------
	//PRINTGlobals	(PD_MST_DETAIL);

	//-------- SC/NSC im Dialog ignorieren --------
	if (Npc_GetAivar(other,AIV_INVINCIBLE))
	{
		AI_ContinueRoutine(self); 
	};

	//-------- Wahrnehmungen --------
	Npc_PercEnable	(self, PERC_ASSESSDAMAGE,	B_Pupil_ReactToDamage); 	//global
	Npc_PercEnable	(self, PERC_ASSESSMAGIC,  	B_AssessMagic); 				//selbe Rkt wie Humans
	Npc_PercEnable	(self, PERC_ASSESSBODY, 	B_Pupil_AssessBody);
	
	AI_StandUp		(self);
	AI_SetWalkmode 	(self, NPC_RUN);
	
	Npc_GetTarget	(self);
	
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN,	other, self); //Opfer,Täter
};
func int ZS_Pupil_Attack_Loop ()
{
	//////PrintDebugNpc		(PD_MST_LOOP, "ZS_Pupil_Attack_Loop");

			if (Npc_GetDistToPlayer(self) > 2500)
			{
				Npc_ClearAIQueue(self);
				AI_StandUp		(self);			
				AI_GotoNpc		(self,	hero);
				AI_StartState	(self, ZS_Pupil_FollowPlayer, 0, "");				
			};	

	
	Npc_GetTarget(self);	//other = target
	if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other))  &&	(!Npc_IsPlayer(other))
	{
		//////PrintDebugNpc		(PD_MST_LOOP, "...Ziel vorhanden!");
		if	C_BodyStateContains(other,BS_RUN)
		||	C_BodyStateContains(other,BS_JUMP)
		{
			//////PrintDebugNpc	(PD_MST_LOOP, "...Ziel läuft oder springt!");

		};
		
		if (Npc_GetAivar(other,AIV_INVINCIBLE)==FALSE) // Nur NSCs angreifen, die NICHT im Talk sind
		{
			AI_Attack		(self); 
		};
	}
	else // GetTarget = FALSE
	{

		//////PrintDebugNpc	(PD_ZS_CHECK,	"...Ziel ist ungültig oder kampf-unfähig!");

			Npc_PerceiveAll		(self);		// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht
			Npc_GetNextTarget	(self);
			//PRINTGlobals		(PD_ZS_DETAIL);
			if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other)) && (!Npc_IsPlayer(other))&&((Npc_IsInState(other,ZS_Attack))||(Npc_IsInState(other,ZS_MM_Attack))||(Npc_IsInState(other,ZS_MM_AttackMage)))
			{
				B_PrintDebug(concatstrings("nxtTRGT-",other.name));			
				//PrintDebugString	(PD_MST_CHECK, "...neues Ziel gefunden: ", other.name);
			}
			else
			{
				return LOOP_END;					
				//B_Pupil_AssessBody();
			};
		};
	return LOOP_CONTINUE;		
};


func void ZS_Pupil_Attack_End ()
{
	//////PrintDebugNpc	(PD_MST_FRAME, "ZS_Pupil_Attack_End");

	Npc_SetAivar(self,AIV_MM_TEMP_PRIO,  PRIO_PREY);
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);
	AI_PlayAni		(self,	"T_WARN"); //nochmal zum Abschied Drohen
	
};


func void ZS_Pupil_EatBody()
{
    //////PrintDebugNpc(PD_MST_FRAME,"ZS_Pupil_EatBody");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_Pupil_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_Pupil_ReactToOthersDamage); 		
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_Pupil_AssessEnemy);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_Pupil_AssessEnemy);
	
	AI_GotoNpc 	(self, other);
	AI_TurnToNpc(self, other);
	AI_PlayAni	(self, "T_STAND_2_EAT");
};

func int ZS_Pupil_EatBody_loop()
{
    //////PrintDebugNpc(PD_MST_LOOP,"ZS_Pupil_EatBody_loop");
    
    if(Npc_GetStateTime(self)>10)
    {
	    Smooth_ScaleWolfFatness(Pupil_Hungry,Pupil_Hungry-10);
	  	Pupil_Hungry-=10;
	  	self.attribute[ATR_HITPOINTS]+=10+Hlp_Random(30)+(4*self.level);
	  	if(self.attribute[ATR_HITPOINTS]>self.attribute[ATR_HITPOINTS_MAX]){ self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX]; };
	    if(Pupil_hungry<0){Pupil_hungry=0; };
	  	Npc_SetStateTime(self,5); 
    };
    
	if	!Npc_IsInState(other,ZS_Unconscious)&&!Hlp_IsValidNpc(other)/*Body weg*/||(Npc_GetDistToPlayer(self) > 2500)||((self.attribute[ATR_HITPOINTS]==self.attribute[ATR_HITPOINTS_MAX])&&(Pupil_Hungry==0))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_Pupil_EatBody_end()
{
    //////PrintDebugNpc(PD_MST_FRAME,"ZS_Pupil_EatBody_end");
    
	AI_PlayAni			(self,	"T_EAT_2_STAND");
};


func void ZS_Pupil_EatItem()
{
    //////PrintDebugNpc(PD_MST_FRAME,"ZS_Pupil_EatItem");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_Pupil_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_Pupil_ReactToOthersDamage); 		
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_Pupil_AssessEnemy);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_Pupil_AssessEnemy);
	
	AI_PlayAni	(self, "T_STAND_2_EAT");
};

func int ZS_Pupil_EatItem_loop()
{
    //////PrintDebugNpc(PD_MST_LOOP,"ZS_Pupil_EatItem_loop");
    
    if(Npc_GetStateTime(self)>3)
    {
	    Smooth_ScaleWolfFatness(Pupil_Hungry,Pupil_Hungry-5);
	  	Pupil_Hungry-=5;
	  	self.attribute[ATR_HITPOINTS]+=Hlp_Random(10)+self.level;
	  	if(self.attribute[ATR_HITPOINTS]>self.attribute[ATR_HITPOINTS_MAX]){ self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX]; };
	    if(Pupil_hungry<0){Pupil_hungry=0; };
	  	Npc_SetStateTime(self,1); 
    };
    
	if	(Npc_GetDistToPlayer(self) > 2500)||((self.attribute[ATR_HITPOINTS]==self.attribute[ATR_HITPOINTS_MAX])&&(Pupil_Hungry==0))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_Pupil_EatItem_end()
{
    //////PrintDebugNpc(PD_MST_FRAME,"ZS_Pupil_EatItem_end");
    
	AI_PlayAni			(self,	"T_EAT_2_STAND");
};


func void B_Pupil_AssessWarn ()
{	
	//////PrintDebugNpc		(PD_ZS_FRAME, "B_Pupil_AssessWarn" );	

	Npc_PercDisable	(self,	PERC_ASSESSWARN);
	if (Npc_GetDistToPlayer(self) > 2500)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);			
		AI_GotoNpc		(self,	hero);
		AI_StartState	(self, ZS_Pupil_FollowPlayer, 0, "");				
	};		
	if (!C_NpcIsHuman(victim))
	{
		//////PrintDebugNpc	(PD_ZS_CHECK, "B_Pupil_AssessWarn Monster" );
		Npc_SetTarget	(self, victim);
		
		Npc_GetTarget	(self);
		AI_StartState	(self, ZS_Pupil_Attack, 0, "");
	};
};

