/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/

func void ZS_Mis_PanicJump()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_PanicJump");
    
	if (!Npc_IsOnFP(self,"JUMP"))
	{
		//PrintDebugNpc		(PD_TA_CHECK,	"...nicht auf FP!");
		AI_GotoWP			(self,	self.wp);						// Gehe zum Tagesablaufstart
	};
    //----------------------------
    AI_AlignToFP( self );				//Richte Dich aus	
	
	 	
	AI_SetWalkmode (self,NPC_RUN);			// Walkmode für den Zustand 
	
 	if(Npc_GetDistToWP(self,"PSI_PATH_12_1")>500)&&(Npc_GetDistToWP(self,"PSI_PATH_7_14")>500)
 	{
	 	B_KillNpc(self);
 	};

};
func int ZS_Mis_PanicJump_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_Mis_PanicJump_Loop");
	
 	if((Npc_GetDistToWP(hero,"PSI_PATH_10_2")<500)&&(Npc_GetDistToWP(self,"PSI_PATH_12_1")<500))||((Npc_GetDistToWP(hero,"PSI_PATH_10")<500)&&(Npc_GetDistToWP(self,"PSI_PATH_7_14")<500))
 	{ 
	 	Ai_PlayAni(self,"T_RUNL_2_JUMP");
		Wld_PlayEffect("VOB_BURN",  self, self, 0, 0, DAM_fire, TRUE); 	
	 	
		return			LOOP_END;	
	}
	else
	{
		return			LOOP_CONTINUE;	
		
	};	
};

func void ZS_Mis_PanicJump_End ()
{
	
	//PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_PanicJump_End");
};

