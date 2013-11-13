
//////////////////////////////////////////////////////////////////////////
//	ZS_RodericGuide
//	==========
//	Ein TA-Zustand, der zum angegebenen Waypoint geht, aber auf den SC
//	wartet, falls dieser zu weit zurückfällt.
//////////////////////////////////////////////////////////////////////////
func void ZS_RodericGuide ()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_RodericGuide");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_GuidePC_AssessPlayer		);
	Npc_SetPercTime		(self,	1);
	self.senses_range	 = HAI_DIST_ASSESS_MONSTER;
	self.senses			 = SENSE_SMELL|SENSE_SEE|SENSE_HEAR;
	
	// Wahrnehmungen passiv
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	ZS_AssessMurder				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	ZS_AssessDefeat				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_AssessFightSound			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 					);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_GuidePC_AssessCall		);
};
var int Roderic_achievedtp;
func int ZS_RodericGuide_Loop ()
{	
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_RodericGuide_Loop");
	//PrintGlobals		(PD_TA_CHECK);

	//-------- Spieler zu weit entfernt ! --------
	if (Npc_GetDistToNpc(self, hero) > PERC_DIST_DIALOG)
	{
		B_GuidePC_AssessPlayer();
	}
	
	//-------- Ziel zu weit entfernt ! --------
	else if (Npc_GetDistToWP(self,self.wp) > PERC_DIST_DIALOG)
	{
		////PrintDebugNpc	(PD_TA_CHECK,	"...Ziel noch zu weit entfernt!");
		if	!C_BodyStateContains(self, BS_SWIM)
		{
			AI_SetWalkmode	(self,	NPC_RUN);
		};
		AI_StopLookAt	(self);
		AI_GotoWP		(self,	self.wp);
	}
	
	//-------- Goal achieved ! --------
	else
	{

		if(Roderic_achievedtp==1)&&(Npc_GetStateTime(self)>20)
		{		
			B_Fullstop(self);
			Ai_PlayAni(self,"T_RUN_2_RUNL");//Bugfix
			Ai_PlayAni(self,"T_RUN_2_RUNL");//Bugfix
			Ai_PlayAni(self,"T_RUN_2_RUNL");//Bugfix
			//Ai_GotoWp(self,"OW_PATH_176_TEMPELFOCUS4_WP");
			Npc_SetStateTime(self,31);
			Roderic_achievedtp=2;		
			
		}			
		else if(Roderic_achievedtp==2)&&(Npc_GetStateTime(self)>31)
		{
			
			Npc_ExchangeRoutine(self,"DEAD");	
			Npc_PerceiveAll		(self);
			Npc_ClearAiQueue(self);		
			AI_Teleport(self,"INVISIBLE2");	
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-9999);		
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS]-self.attribute[ATR_HITPOINTS_MAX];	
			introducechapter ("","","","MFX_Teleport_Cast.wav", 0);	
		}		
		else if(Roderic_achievedtp==0 && Npc_GetDistToWp(self,"OW_PATH_176_TEMPELFOCUS4_WP")<500)
		{
		
			B_GotoFP		(self, "RODERIC");
			AI_AlignToFP	(self);
			AI_PlayAni (self,"T_PRACTICEMAGIC3");
			Wld_SendTrigger("MD_TP_MOVER");
			//Ai_GotoWp(self,"OW_PATH_176_TEMPELFOCUS4_WP");
			
			Roderic_achievedtp=1;
			Npc_SetStateTime(self,11);
			
		};
	};
	AI_Wait				(self,	1);		
	return				LOOP_CONTINUE;
};
	
func int ZS_RodericGuide_End ()
{	
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_RodericGuide_End");

	//-------- aktive Wahrnehmungen wieder auf Default zurückstellen -------
	self.senses_range	 = hero.senses_range;
	self.senses			 = hero.senses;
};

























