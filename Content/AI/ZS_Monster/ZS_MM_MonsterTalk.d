func void ZS_MM_MonsterTalk()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MonsterTalk");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_ObserveIntruder);
//	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_ObserveIntruder);
 	Npc_PercEnable   	(self,  PERC_ASSESSTALK   	,	B_AssessTalk      	 	);
	Npc_PercEnable(Self,PERC_NPCCOMMAND,B_CHECKCOLLIDEDAMAGE_MONSTER);
	AI_TurnToNpc(self, hero);
};

func int ZS_MM_MonsterTalk_loop()
{
    //PrintDebugNpc(PD_MST_LOOP,"ZS_MM_MonsterTalk_loop");
    Ai_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_MM_MonsterTalk_end()
{
    //PrintDebugNpc(PD_MST_FRAME,"ZS_MM_MonsterTalk_end");
    
};