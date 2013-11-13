/*****************************************************
*      NSC sucht SPEECH-FP und stelt sich hin        *
*****************************************************/

//### Gesten fehlen noch

func void ZS_ORCGHOST_PRETALK()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_ORCGHOST_PRETALK");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP		(self,self.wp);
	AI_AlignToWP( self );				//Richte Dich aus

};

func int ZS_ORCGHOST_PRETALK_Loop()
{
    //PrintDebugNpc(PD_TA_LOOP,"ZS_ORCGHOST_PRETALK_Loop");   
	B_CheckForImportantInfo (self,hero);
	return LOOP_CONTINUE;
};

func void ZS_ORCGHOST_PRETALK_End ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_ORCGHOST_PRETALK_End");
};
	
