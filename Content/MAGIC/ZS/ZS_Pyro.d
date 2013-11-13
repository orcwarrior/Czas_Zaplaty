func void B_StopPyro()
{	
	//PrintDebugNpc	(PD_ZS_FRAME,	"B_StopPyro");

 	Npc_PercDisable	(self,	PERC_ASSESSSTOPMAGIC);
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);
	Npc_ClearAIQueue(self);					// alle AI Befehle entfernen
	AI_StandUp		(self);

	if (C_NpcIsHuman(self) || C_NpcIsOrc(self))
	{
		AI_StartState	(self,	ZS_ReactToDamage, 0, "");
	}
	else if (C_NpcIsMonster(self))
	{
		AI_StartState	(self,	ZS_MM_Attack, 0, "");
	};

	return;
};	



func int ZS_Pyro()
{
	//PrintDebugNpc		(PD_ZS_FRAME,	"ZS_Pyro");

	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopPyro);
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		//PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		//PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
	};
};


func int ZS_Pyro_Loop ()
{	
	//PrintDebugNpc		(PD_ZS_LOOP, "ZS_Pyro_Loop" );
	
	B_MagicHurtNpc 		(other,	SPL_PYRO_DAMAGE_PER_SEC);

	if	(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);		// alle AI Befehle entfernen
		AI_StandUp		(self);
	
		return			LOOP_END;
	};

	AI_Wait				(self,	0.5);
	
	return				LOOP_CONTINUE;
};


func void ZS_Pyro_End()
{
	//PrintDebugNpc		( PD_ZS_FRAME, "ZS_Pyro_End" );
};


// *******
// ZS_PyroRS
// *******

func int ZS_PyroRS()
{
	Npc_PercEnable		(self, PERC_ASSESSSTOPMAGIC, B_StopPyro);
	
	// ------ Non_interruptable Bodystates stehen sauber auf bzw. beenden sauber
	if (!Npc_HasBodyFlag(self, BS_FLAG_INTERRUPTABLE))
	{
		AI_StandUp (self);
	}
	else
	{
		AI_StandUpQuick (self);
	};
	if (self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni (self, "T_STAND_2_LIGHTNING_VICTIM");
	};	
};

func int ZS_PyroRS_Loop ()
{	
	
	if (Npc_GetStateTime(self)>=1)&&(Npc_GetStateTime(self)<=9)
	{
		Npc_SetStateTime(self,10);
		B_MagicHurtNpc 		(other,	SPL_PYRO_DAMAGE_PER_SEC);
	}
	else if(Npc_GetStateTime(self)>=11)
	{
		B_MagicHurtNpc 		(other,	SPL_PYRO_DAMAGE_PER_SEC);
		Npc_ClearAIQueue(self);		
		AI_StandUp		(self);
		
		return			LOOP_END;
	};
	
	return				LOOP_CONTINUE;
};


func void ZS_PyroRS_End()
{

};


	
	


	
