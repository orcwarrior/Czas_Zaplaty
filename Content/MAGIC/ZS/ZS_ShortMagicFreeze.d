func int ZS_ShortMagicFreeze()
{
	////PrintDebugNpc		(PD_MAGIC,	"ZS_ShortMagicFreeze");
	//PRINTGlobals		(PD_MAGIC);

	Npc_PercEnable		(self, PERC_ASSESSMAGIC		,	B_Assessmagic);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_NoReact			);
	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);
	// Opfer wird in Bodystate Unconscious versetzt
	if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
	{
		AI_PlayAniBS 		(self, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);
	};
};

func int ZS_ShortMagicFreeze_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_MagicFreeze_Loop" );

	if (Npc_GetStateTime(self) == 5)
	{
		B_StopMagicFreeze();
		return			LOOP_END;
	};

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};


func void ZS_ShortMagicFreeze_End()
{
	////PrintDebugNpc		(PD_ZS_FRAME, "ZS_ShortMagicFreeze_End" );
// 	Npc_GetTarget(self);
// 	AI_Attack(self);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);

};
