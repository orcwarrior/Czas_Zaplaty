/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_TEST_TRANSFORM	()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_TEST_TRANSFORM");
    
 	Createinvitem(self,ItArScrollTrfMeatbug);
//  	Npc_CreateSpell				(self,SPL_TRF_MEATBUG);
//  	Npc_LearnSpell				(self,SPL_TRF_MEATBUG);
  	Npc_SetTarget(self,hero);	
 	AI_ReadySpell	(self,SPL_TRF_MEATBUG,SPL_SENDCAST_TRF_MEATBUG);	
 	Npc_SetTempAttitude			(self,ATT_HOSTILE);
	AI_StopLookAt(self);




};
 
func int ZS_TEST_TRANSFORM_Loop()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_TEST_TRANSFORM_Loop");
    var int rnd; 
 	AI_Attack		(self);			
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
// 	AI_StartState(self,ZS_ATTACK,1,"");	
//	AI_ATTACK(self);
	return LOOP_CONTINUE;
};

func void ZS_TEST_TRANSFORM_End()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_TEST_TRANSFORM_End");
    
};
