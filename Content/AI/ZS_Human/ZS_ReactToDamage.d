//////////////////////////////////////////////////////////////////////////
//
//	ZS_ReactToDamage
//	================
//	Wird durch:
//
//	- PERC_ASSESSDAMAGE
//	- einige Magiezustände	(nachtragen, welche)
//
//	aufgerufen. Vorraussetzungen:
//
//	- keine
//
//	Es passiert folgendes:
//
//	1.	Angreifer ist ein MENSCH
//		->	FRIENDLY zu SC-Angreifer		-> "Was soll das?"	-> dann ANGRY
//		-> 	NEUTRAL/ANGRY zu SC-Angreifer	-> dann HOSTILE		-> ZS_AssessEnemy
//		->	NSC-Angreifer					-> ZS_AssessEnemy
//	2.	Angreifer ist ein MONSTER
//		-> ZS_AssessMonster	  
//
//////////////////////////////////////////////////////////////////////////
func void ZS_ReactToDamage ()
{
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic			);
	Npc_PercEnable  	(self,	PERC_ASSESSMURDER,			B_CombatAssessMurder	);	
	Npc_PercEnable  	(self,	PERC_ASSESSDEFEAT,			B_CombatAssessDefeat	);
	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);
	
			
	if ( Npc_IsPlayer( self ) )
	{
		B_SpecialCombatDamageReaction(self,other);	
	};
	if (Npc_GetAivar(self,AIV_SPECIALCOMBATDAMAGEREACTION) != FALSE)
	{
		B_SpecialCombatDamageReaction(self,other);
	};
// //Rick Team (3+hero)
// //hero
// var C_NPC Rodney;
// var C_NPC Hank;
// var C_NPC Angus;
// Rodney = Hlp_GetNpc(PIR_2602_Rodney);
// Hank = Hlp_GetNpc(PIR_2601_Hank);
// Angus = Hlp_GetNpc(PIR_2600_Angus);
// /////////Butch Team (4)
// var C_NPC Butch;
// butch = Hlp_GetNpc(RBL_851_Butch);
// var C_NPC Bruce;
// Bruce = Hlp_GetNpc(HUN_828_Bruce);
// var C_NPC Aidan;
// Aidan = Hlp_GetNpc(HUN_859_Aidan);
// var C_NPC Quentin;
// Quentin = Hlp_GetNpc(HUN_858_Quentin);
	//////////////////////////////////////////////////////////////////////////
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_ReactToDamage" );			
	//PRINTGlobals		(PD_ZS_CHECK);
	C_ZSInit();	
// 	if(GRDChallenge)
// 	{
// 	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (butch) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero))||(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Bruce) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero))||(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Aidan) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero))||(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Quentin) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero)))
// 	{
// 	 PrintScreen("Nie oszukuj!", -1,85,"FONT_OLD_10_WHITE.TGA",2); 
// 	 self.attribute[ATR_HITPOINTS] =	self.attribute[ATR_HITPOINTS_MAX];
// 	 hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]/2+hero.attribute[ATR_HITPOINTS]/5;
// 	};
// 	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Rodney) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero))||(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Hank) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero))||(Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Angus) && Hlp_GetInstanceID (other) == Hlp_GetInstanceID (hero)))
// 	{
// 	 PrintScreen("Uwa¿aj!", -1,80,"FONT_OLD_10_WHITE.TGA",2); 
// 	 self.attribute[ATR_HITPOINTS] =	self.attribute[ATR_HITPOINTS_MAX];
// 	 //hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]/2+hero.attribute[ATR_HITPOINTS]/5;
// 	};
// 	};



	if	(Npc_IsInState(self, ZS_GuardPassage) || Npc_WasInState(self, ZS_GuardPassage))&&(self.flags == NPC_FLAG_IMMORTAL)
	{
		return;	
	};
	B_WhirlAround 		(self, other);

	//-------- spezielle Reaktionen im Kampf --------
	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		Npc_SetAivar(self,AIV_LASTHITBYRANGEDWEAPON,  1);
	}
	else
	{
		Npc_SetAivar(self,AIV_LASTHITBYRANGEDWEAPON,  false);
	};

	//-------- Angreifer ist Mensch/Ork ! --------
	if (!C_NpcIsMonster(other))		
	{
		if (Npc_IsPlayer(other))
		{
			Npc_SetAivar(self,AIV_BEENATTACKED,  1);
	
			if ((Npc_GetTempAttitude(self,other)==ATT_FRIENDLY) || (C_NpcTypeIsFriend(self,other)))
			{
				////PrintDebugNpc			(PD_ZS_CHECK,	"...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc 			(self,	other);
				B_Say 					(self,	other,	"WHATAREYOUDOING");
				Npc_SetTempAttitude		(self,	ATT_ANGRY);
				AI_ContinueRoutine		(self);
				return;
			}
			else
			{
				////PrintDebugNpc			(PD_ZS_CHECK, "...NSC nicht FRIENDLY zum Angreifer!");
	
				if (Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					Npc_SetPermAttitude	(self,	ATT_ANGRY);
				};
				Npc_SetTempAttitude		(self,	ATT_HOSTILE);
			};
		};

			AI_StartState 				(self,	ZS_AssessEnemy,	0, "" );
			if(C_NpcBelongsToOldCamp(self))
			{
				B_CallComrades();	
			};
	}
	
	//-------- Angreifer ist Monster ! --------
	else		
	{	
		AI_StartState 				(self,	ZS_AssessMonster,	0, "" );
	};
};
func int ZS_ReactToDamage_loop()
{
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC	,	B_AssessMagic			);
	return LOOP_END;	
};

func void ZS_ReactToDamage_end()
{
	
};


