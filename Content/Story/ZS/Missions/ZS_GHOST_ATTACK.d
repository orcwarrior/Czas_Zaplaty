/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_GHOSTATTACK()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_GHOSTATTACK");
 	B_SetPerception (self);  
   
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSc	);
	Npc_SetPercTime		(self,	1);
	self.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage	);
	Npc_PercEnable  	(self,	PERC_ASSESSCASTER		,	B_AssessCaster	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder		);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat		);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
 //	Npc_SetTempAttitude			(self,ATT_HOSTILE);
 var c_npc trgt;
 if(hlp_getinstanceid(self)==RodericMD)
 {
	trgt = hlp_getnpc(truan);
	Npc_SetTarget(self,trgt);
 }
 else
 {
	trgt = hlp_getnpc(RodericMD);
	if(Npc_IsDead(trgt))
	{
	trgt = hlp_getnpc(pc_hero);		
	};
	Npc_SetTarget(self,trgt);	 		 
 };
	B_FullStop			(self);
 
};
 
func int ZS_GHOSTATTACK_LOOP()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_GHOSTATTACK_Loop");
    var int rnd; 
    var c_npc trgt;
    
 if(hlp_getinstanceid(self)==RodericMD)
 {
	trgt = hlp_getnpc(truan);
	Npc_SetTarget(self,trgt);
 }
 else
 {
	trgt = hlp_getnpc(RodericMD);
	if(Npc_IsDead(trgt))
	{
	trgt = hlp_getnpc(pc_hero);		
	};
	Npc_SetTarget(self,trgt);	 		 
 };
 	if(!Npc_IsDead(trgt)){
	AI_StartState(self,ZS_ATTACK,1,"");	
	}
	else
	{
	AI_StartState(self,ZS_STAY,1,"");	
		
	};
//	AI_ATTACK(self);
	return LOOP_END;
};

func void ZS_GHOSTATTACK_End()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_GHOSTATTACK_End");
    
};
