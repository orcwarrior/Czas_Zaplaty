/******************************************************************************************** 
*	B_AssessSc()																			*
*	============																			*
*																							* 
********************************************************************************************/ 

// C_Cantalk to kann evtl. raus, wurde ursprünglich nur wegen B_AssessSC-Aufruf aus ZS_Talk implementiert.
// ZS_Talk ruft aber B_AssessSC NICHT mehr auf

// ***********************
// Geklaute Waffen checken
// ***********************

FUNC VOID B_CheckStolenEquipment ()
{
	var C_Item 	melee;
	var C_Item 	ranged;
	var C_ITEM	armor;
	
	melee 	= 	Npc_GetEquippedMeleeWeapon 		(other);
	ranged 	= 	Npc_GetEquippedRangedWeapon 	(other);
	armor	=	Npc_GetEquippedArmor		 	(other);
	
	if (Npc_OwnedByNpc (melee, self))
	{
		//PrintDebugInt (PD_ZS_CHECK,	"...SC trägt Nahkampf-Waffe des NSCs offen!");
		Npc_SetAivar(self,AIV_WANTEDITEM,  Hlp_GetInstanceId (melee));
		if (!Npc_HasNews (self, NEWS_DEFEAT, other, self) ) && (Npc_GetAivar(self,AIV_PCISSTRONGER) == 0)
		{
			//PrintDebugInt 	(PD_ZS_CHECK,	"...NSC ist nicht vom SC besiegt worden & hat noch nicht danach gefragt!");
			Npc_ClearAIQueue( self);
			C_LookAtNpc 	( self, other);
			AI_TurnToNpc 	( self, other);
			AI_PointAtNpc 	( self, other);
			B_Say 			( self, other,"$THATSMYWEAPON");
			AI_StartState 	( self, ZS_GetBackBelongings, 1, "");
			return;
		};
	}
	else if (Npc_OwnedByNpc ( ranged, self))
	{
		//PrintDebugInt (PD_ZS_CHECK,	"...SC trägt Fernkampf-Waffe des NSCs offen!");
		Npc_SetAivar(self,AIV_WANTEDITEM,  Hlp_GetInstanceId (ranged));
		if (!Npc_HasNews (self, NEWS_DEFEAT, other, self)) &&(Npc_GetAivar(self,AIV_PCISSTRONGER) == 0)
		{
			Npc_ClearAIQueue( self);
			C_LookAtNpc 	( self, other);
			AI_TurnToNpc 	( self, other);
			AI_PointAtNpc 	( self, other);
			B_Say 			( self, other,"$THATSMYWEAPON");
			AI_StartState 	( self, ZS_GetBackBelongings, 1, "");
			return;
		};
	};
};

// ***********************
// B_AssessSC
// ***********************
func void B_AssessSc ()
{
	//PrintDebugInt (PD_ZS_FRAME,	"B_AssessSc");
	
	var int a;
	//Should i be in hero CollPool
	add_CollPool(self);	
	
	//*********** Extra für Raeuberlager ************
	if (self.npctype == NPCTYPE_ROGUE)
	{
		B_SetRoguesToHostile();
	};
	//***********************************************
	
	if (Npc_CanSeeNpcFreeLOS(self, other)
	&&	(Npc_GetDistToNpc	(self, other) < PERC_DIST_DIALOG) ) 		
	{
		//PrintDebugInt			(PD_ZS_CHECK,	"...SC sichtbar und in Dialogreichweite!");

		//----------- Übernommene NSCs werden von GateGuards geplättet!------------------
		var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
		
		if 	( 
			( (Hlp_GetInstanceID(her)!=Hlp_GetInstanceID(Hero))&&(Hlp_GetInstanceID(rock)!=Hlp_GetInstanceID(Hero)) )
		&&	( Npc_IsInState(self,ZS_GuardPassage) ) 
			)
		//Npc_IsInState(other, ZS_Controlled) funzt nicht! 
		{
			if (Wld_GetGuildAttitude(self.guild,other.guild)!=ATT_FRIENDLY)
			{
				B_FullStop			(self);	
				B_Say		 		(self,other,"$NOWWAIT");
				B_IntruderAlert		(self,	other);
				B_SetAttackReason	(self,	AIV_AR_INTRUDER);
				Npc_SetTarget		(self,	other);
				AI_StartState		(self,	ZS_Attack,	1,	"");
			};
		};
				
		//-------- Auf Vergabe von Infos & Missionen checken --------
		B_CheckForImportantInfo(self,other);
		
		//-------- SC im Kampfmodus ? --------
		if (C_NpcIsInFightMode(other))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...SC im Kampfmodus!");
			B_AssessFighter			();
			return;
		};

		//-------- Zum Spieler drehen --------
		if (!C_BodyStateContains(other, BS_SNEAK))
		{
			//PrintDebugInt			(PD_ZS_CHECK,	"...SC schleicht NICHT!");
			if (Npc_GetDistToNpc(self,other)<HAI_DIST_OBSERVEINTRUDER)
			{
				//PrintDebugInt		(PD_ZS_CHECK,	"...SC in ObserveIntruder-Reichweite!");
				B_ObserveIntruder	();
				return;
			}
			else
			{
				//PrintDebugInt		(PD_ZS_CHECK,	"...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};

		//-------- Auf Verkleidung checken --------
		B_CheckStolenEquipment	();

	};

	//-------- Durchgangswachen resetten ! --------
	if ((Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_FIRSTWARN)
	||	(Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS) == AIV_GPS_LASTWARN ))
	{
		//PrintDebugInt		(PD_ZS_CHECK,	"...SC wurde von Durchgangswachen verwarnt!");
		//PrintDebugInt		(PD_ZS_CHECK, "Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS) = ", Npc_GetAivar(hero,AIV_GUARDPASSAGE_STATUS));

		if (Npc_IsInState(self,ZS_GuardPassage) && (Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_RESET) )
		{
			//PrintDebugInt	(PD_ZS_CHECK,	"...Status für Durchgangswachen zurücksetzen!");
			Npc_SetAivar(hero,AIV_GUARDPASSAGE_STATUS,  AIV_GPS_BEGIN);
		};
	};	
};
			

				