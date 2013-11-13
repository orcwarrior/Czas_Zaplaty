func void ZS_TH_ENFORCES()
{
//	Npc_PercEnable  		(self,	PERC_ASSESSTALK		,B_AssessTalk);// B_RefuseTalk

	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_TH_ENFORCES");
	BattlePerception ();		
	AI_SetWalkmode	(self,NPC_RUN);	
	//AI_GotoWp(self,self.wp);
	self.senses_range	=	10;	

if ( self.attribute[ATR_HITPOINTS] != self.attribute[ATR_HITPOINTS_MAX])
{
CreateInvItems 				(self,ItFo_Potion_Health_04,2);
AI_UseItem		(self,	ItFo_Potion_Health_04);
};
};

func int ZS_TH_ENFORCES_Loop ()
{
	if(Npc_GetDistToWp(self,"OW_PATH_OC_NC4")>1000)
	{
	AI_GotoWp(self,"OW_PATH_OC_NC4");
	
	}
	else
	{
		self.senses_range	=	2000;	
	
	};
	
	AI_WAIT(self,1);
	return LOOP_CONTINUE;



};
func void ZS_TH_ENFORCES_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_TH_ENFORCES_End" );

	if (Npc_GetAivar(self,AIV_ITEMFREQ) != TA_IT_HAVEIMPORTANTSTATE)
	{
	AI_ContinueRoutine 		(self);
	}
	else
	{
	AI_StartState(self,ZS_TH_ENFORCES,1,self.wp);	
	};
	
};