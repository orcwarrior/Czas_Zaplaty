func int ZS_Stuned()
{
	////PrintDebugNpc		(PD_MAGIC,	"ZS_Stuned");
	//PRINTGlobals		(PD_MAGIC);


	Npc_PercEnable		(self,	PERC_NPCCOMMAND			,	B_CheckSheath);

	// Opfer wird in Bodystate Unconscious versetzt
	if(C_NpcIsHuman(self))
	{
		if (!C_BodyStateContains(self, BS_UNCONSCIOUS))
		{
			AI_PlayAni			(self, "T_PSI_VICTIM" );
			
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


func int ZS_Stuned_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_Stuned_Loop" );

	if (Npc_GetStateTime(self) > 5)
	{
		B_StopMagicFreeze();
		return			LOOP_END;
	};

	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};


func void ZS_Stuned_End()
{
	////PrintDebugNpc		(PD_ZS_FRAME, "ZS_Stuned_End" );
};


