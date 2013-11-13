func void ZS_Bashed()
{
	
	if(Npc_IgnoreBash==Hlp_GetInstanceID(self))
	{ return;  };	
	
	////PrintDebugNpc		(PD_MAGIC,	"ZS_Bashed");
	//PRINTGlobals		(PD_MAGIC);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE,			B_CombatReactToDamage	);
	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);


	// Opfer wird in Bodystate Unconscious versetzt
	if(C_NpcIsHuman(self))||(self.guild==GIL_SKELETON)
	{
		if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
		{
			B_FullStop(self); var int rnd; rnd = Hlp_Random (800);
			AI_Waitms (self,rnd);
			AI_PlayAni			(self, "T_FALLB_2_FALLENB" );
			AI_PlayAni			(self, "S_FALLENB" );
			AI_PlayAni			(self, "T_FALLENB_2_STAND" );			
			B_MagicHurtNpc 		(self,	30);			
			
		};
	}
	else
	{
		if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
		{
			AI_PlayAni			(self, "T_STAND_2_LIGHTNING_VICTIM" );
		};		
	};

};


func int ZS_Bashed_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_Bashed_Loop" );

	if (Npc_GetStateTime(self) > 2)
	{

		
		return			LOOP_END;
	};

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};


func void ZS_Bashed_End()
{
	////PrintDebugNpc		(PD_ZS_FRAME, "ZS_Bashed_End" );
	Npc_ClearAIQueue(self);					// alle AI Befehle entfernen
	AI_StandUpQuick		(self);
    var c_npc attacker;
    attacker = Hlp_GetNpc(Npc_IgnoreBash);
 	if (C_NpcIsHuman(self) || C_NpcIsOrc(self))&&(Npc_GetAttitude(self,attacker)==ATT_HOSTILE)
 	{
 		AI_StartState	(self,	ZS_ReactToDamage, 0, "");
 	}
 	else if (C_NpcIsMonster(self))
 	{
 		AI_StartState	(self,	ZS_MM_Attack, 0, "");
 	};	
};
