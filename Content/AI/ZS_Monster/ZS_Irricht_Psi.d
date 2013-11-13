
func void Trans_PSIZombie_Visuals(var c_npc slf,var int armor)
{

	Mdl_SetVisualBody 		(slf,	"Zom_Body",		5,			Hlp_Random(4),			"Zom_Head", 2+Hlp_random(4),  		3,			armor);
	Mdl_ApplyOverlayMds 	(slf,	"HUMANS_ZOMBIE.MDS");	
	//
	slf.attribute[ATR_STRENGTH]+=100;	
	slf.attribute[ATR_HITPOINTS_MAX]+=150;	
	slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];	
	

	slf.guild = GIL_ZOMBIE;
	Npc_SetTrueGuild			(slf,GIL_ZOMBIE);
	
// 	TA	(slf,12,11, ZS_MM_AllScheduler,"");
// 	
// 	TA_BeginOverlay			(slf);
// 	slf.start_aistate			= ZS_MM_AllScheduler;
// 	B_FullStop(slf);	
// 	AI_StartState				(slf,ZS_MM_AllScheduler,1,"");
	
};


func void ZS_MM_PSIWISP()
{
    //////PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_PSIWISP");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		ZS_PSIWISP_Attack);
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		ZS_PSIWISP_Attack);
	Npc_PercEnable		(Self,PERC_NPCCOMMAND,B_CHECKCOLLIDEDAMAGE_MONSTER);

	var int msec;
	msec = Hlp_Random (1000);
	AI_Waitms (self, msec);
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};	
};

func void ZS_MM_PSIWISP_loop()
{
    //////PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_PSIWISP_loop");
    if(Npc_GetDistToPlayer(self)<1000)
    {
	Npc_SetTarget(self,hero); 
	AI_StartState(self,ZS_PSIWISP_Attack,1,"");			 		   
    };

	if (Hlp_Random(100) <= 20)
	{
		if (Wld_IsNextFPAvailable(self,	"FP_ROAM"))	
		{											
			AI_GotoNextFP	(self,	"FP_ROAM");
		}
		else // WPs benutzen
		{														
			AI_GotoWP	(self,	Npc_GetNearestWP (self));						
			AI_GotoWP	(self,	Npc_GetNextWP (self));						
		};
	}
	else
	{
		var int randomMove;
		randomMove = Hlp_Random(2);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
};

func void ZS_MM_PSIWISP_end()
{
    //////PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_PSIWISP_end");
};	
func void ZS_PSIWISP_Attack ()
{
	//////PrintDebugNpc		(PD_MST_FRAME, "ZS_PSIWISP_Attack");

	//-------- Monster-Mages --------
	//PRINTGlobals	(PD_MST_DETAIL);

	//-------- SC/NSC im Dialog ignorieren --------
	if (Npc_GetAivar(other,AIV_INVINCIBLE))
	{
		AI_ContinueRoutine(self); 
	};

	//-------- Wahrnehmungen --------
	Npc_PercEnable	(self, PERC_ASSESSDAMAGE,	B_MM_ReactToCombatDamage); 	//global
	Npc_PercEnable	(self, PERC_ASSESSMAGIC,  	B_AssessMagic); 				//selbe Rkt wie Humans
	Npc_PercEnable	(self, PERC_ASSESSBODY, 	ZS_PSIWISP_Attack);
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKCOLLIDEDAMAGE_MONSTER);

	
	
	Npc_GetTarget	(self);
	
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN,	other, self); //Opfer,Täter
};

func int ZS_PSIWISP_Attack_Loop ()
{
	//////PrintDebugNpc		(PD_MST_LOOP, "ZS_PSIWISP_Attack_Loop");

	if (other.attribute[ATR_HITPOINTS] <= 0)
	{
		return 1;			// oder beendet Loop
	};
		
	Npc_PerceiveAll				(self);
  	
	if(Wld_DetectNpc   			(self,-1,NOFUNC,GIL_RBL))
	{
	if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other)) 
	{
		//////PrintDebugNpc		(PD_MST_LOOP, "...Ziel vorhanden!");
		if	C_BodyStateContains(other,BS_RUN)
		||	C_BodyStateContains(other,BS_JUMP)
		|| ((CmpNpc(other,hero))&&(C_BodyStateContains(hero,BS_WALK))&&(SprintEnabled))
		
		{
			//////PrintDebugNpc	(PD_MST_LOOP, "...Ziel läuft oder springt!");
			if (Npc_GetStateTime (self) > Npc_GetAivar(self,AIV_MM_FollowTime)) // x Sekunden verfolgen
			{
				//////PrintDebugNpc(PD_MST_CHECK, "...Ziel schon zu lange verfolgt!");
				return 1;
			};
		}
		else if (C_BodystateContains(other,BS_SWIM) || C_BodystateContains(other,BS_DIVE))
		{
			if (Npc_GetAivar(self,AIV_MM_FollowInWater) == FALSE)
			{
				return 1;
			};
		};
		
		if (Npc_GetAivar(other,AIV_INVINCIBLE)==FALSE) // Nur NSCs angreifen, die NICHT im Talk sind
		{
			if (Npc_GetStateTime(self) == 3)&&(Npc_GetDistToNpc(self,other)<1000)
			{
			Npc_SetStateTime(self,6);						
			Wld_PlayEffect("spellFX_Mis_TransZombie",  self, other, 1, 0, DAM_MAGIC, TRUE); 
			Npc_ClearAIQueue(other);
			var c_item itm; itm = Npc_GetEquippedArmor(other);
			
			var int id; id = Hlp_GetInstanceID(itm);
				
			Trans_PSIZombie_Visuals(other,Hlp_GetInstanceID(itm));
			
			}
			else if (Npc_GetStateTime(self) == 7)&&(Npc_GetDistToNpc(self,other)<1000)
			{
			Npc_SetStateTime(self,8);						
			Wld_PlayEffect("spellFX_Mis_TransZombie",  self, other, 1, 0, DAM_MAGIC, TRUE); 
			Npc_ClearAIQueue(other);
			itm = Npc_GetEquippedArmor(other);
			
			id = Hlp_GetInstanceID(itm);
				
			Trans_PSIZombie_Visuals(other,Hlp_GetInstanceID(itm));
			}
			else if(Npc_GetStateTime(self) == 8)
			{
				B_ChangeAttribute	(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				Npc_ClearAIQueue(self);	
				Ai_PlayAni(self,"S_DEAD");		
			}
			else if(Npc_GetStateTime(self) == 7)||(Npc_GetStateTime(self) == 3)
			{	
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_MM_PSIWISP, 0, "");

			};			

		};
	};
	}
	else // GetTarget = FALSE
	{
		//////PrintDebugNpc	(PD_ZS_CHECK,	"...Ziel ist ungültig oder kampf-unfähig!");

		if (Npc_GetAivar(self,AIV_MM_Behaviour) == HUNTER)	
		{
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_MM_PSIWISP, 0, "");
		}
		else	// Monster NICHT auf der Jagd - weitere Feinde Attacken
		{
			Npc_PerceiveAll		(self);		// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt WahrgenoWISPenen VOBs beruht
			Npc_GetNextTarget	(self);
			//PRINTGlobals		(PD_ZS_DETAIL);
			if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				//PrintDebugString	(PD_MST_CHECK, "...neues Ziel gefunden: ", other.name);
			}
			else
			{
				//////PrintDebugNpc		(PD_MST_CHECK, "...kein Neues Ziel vorhanden!");
				return 				LOOP_END;
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_PSIWISP_Attack_End ()
{
	//////PrintDebugNpc	(PD_MST_FRAME, "ZS_PSIWISP_Attack_End");

	Npc_ClearAIQueue(self);
			 //SC hat die Chance, weiter weg zu koWISPen als AttackRange
};			