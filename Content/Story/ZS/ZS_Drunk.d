/*******************************************
*              NSC wird besoffen           *
*******************************************/

func void ZS_Drunk ()
// Hier noch RemoveOverlayMds
{
	//PrintDebugNpc	(PD_ZS_FRAME,	"ZS_Drunk");
	NPC_PercEnable  (self, PERC_ASSESSTALK,B_RefuseTalk );
	MDL_APPLYOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS" );
	AI_GotoWP (self,self.wp);
};

func int ZS_Drunk_Loop ()
{
	//PrintDebugNpc	(PD_ZS_LOOP,	"ZS_Drunk_Loop");
	if (Npc_GetStateTime (self) > 200)
	{
		return 1;
	};
	AI_Wait(self,1);
	var int rnd; var string wp;
	rnd = Hlp_Random(4);
	if(rnd<2)
	{
		
		wp = Npc_GetNearestWP(self);
		AI_GotoWp(self,wp);
		B_ChooseBeer(self);
	}
	else
	{
		B_DrinkBottle(self);
	};	
	return loop_continue;
};

func void ZS_Drunk_End ()
{
	//PrintDebugNpc	(PD_ZS_FRAME,	"ZS_Drunk_End");
	MDL_REMOVEOVERLAYMDS (self, "HUMANS_DRUNKEN.MDS");	
};
	
