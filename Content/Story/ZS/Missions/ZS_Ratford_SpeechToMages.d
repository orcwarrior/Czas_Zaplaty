/*****************************************************
*      NSC sucht SPEECH-FP und stelt sich hin        *
*****************************************************/

//### Gesten fehlen noch

func void ZS_Ratford_SpeechToMages()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Ratford_SpeechToMages");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_RUN);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"SPEECH"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "SPEECH"))
	{
		AI_GotoFP (self,"SPEECH"); 
		        
	};
	AI_AlignToFP( self );				//Richte Dich aus
	
	Npc_ClearAiQueue(leren);
	AI_GotoWP(leren, self.wp);
	AI_Dodge(leren);
	AI_TurnToNpc(leren,self);
	AI_TurnToNpc(self,leren);
	

};

func void ZS_Ratford_SpeechToMages_Loop()
{
    //PrintDebugNpc(PD_TA_LOOP,"ZS_Ratford_SpeechToMages_Loop");   
	var int guardreaktion;
	guardreaktion = 	Hlp_Random (1000);
	
	if (guardreaktion >= 900)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_11");
	}
	else if (guardreaktion >= 800)
	{
		AI_PlayAni		(self,"T_DIALOGGESTURE_15");
	}
	else if (guardreaktion >= 700)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_16");
	}
	else if (guardreaktion >= 600)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_18");
		
	}
	else if (guardreaktion >= 500)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_21");
	}
	else if (guardreaktion >= 400)
	{
		AI_PlayAni 		(self,"T_DIALOGGESTURE_20");
	};    
    AI_Wait(self,1);
	AI_Wait(leren,1);
    

};

func void ZS_Ratford_SpeechToMages_End ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Ratford_SpeechToMages_End");
	AI_PlayAni 		(leren,"T_DIALOGGESTURE_18");
    
};
	
