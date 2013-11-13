/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_GhostStay	()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_GhostStay");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	if(Npc_GetDistToWP(self,self.wp)>800)
	{
	AI_Teleport (self,self.wp);		// Gehe zum Tagesablaufstart
	AI_GotoWP (self,self.wp);		// Gehe zum Tagesablaufstart
	};
	AI_AlignToWP (self);			//Richte Dich aus

	Npc_PercDisable  	(self, 	PERC_ASSESSFIGHTER		);
	Npc_PercDisable 	(self,	PERC_ASSESSOTHERSDAMAGE);
	
	// * Wahrnehmungen passiv *

	
	Npc_PercDisable  	(self, 	PERC_ASSESSMAGIC		);
	Npc_PercDisable  	(self, 	PERC_ASSESSCASTER		);
	Npc_PercDisable  	(self, 	PERC_ASSESSTHREAT		);
	Npc_PercDisable  	(self, 	PERC_ASSESSWARN			);
	Npc_PercDisable  	(self, 	PERC_ASSESSMURDER		);
	Npc_PercDisable  	(self, 	PERC_ASSESSDEFEAT		);
	Npc_PercDisable  	(self,	PERC_DRAWWEAPON			);		
	Npc_PercDisable  	(self, 	PERC_ASSESSFIGHTSOUND	);
	Npc_PercDisable  	(self, 	PERC_ASSESSQUIETSOUND	); // erst mal raus, weil beklauen sonst unmöglich wird
	Npc_PercDisable  	(self, 	PERC_CATCHTHIEF			);
	Npc_PercDisable  	(self, 	PERC_ASSESSTHEFT		);
	Npc_PercDisable  	(self, 	PERC_ASSESSSURPRISE		);
	Npc_PercDisable  	(self, 	PERC_OBSERVESUSPECT		);
	Npc_PercDisable  	(self, 	PERC_OBSERVEINTRUDER	);

	Npc_PercDisable  	(self, 	PERC_ASSESSCALL			);
	Npc_PercDisable  	(self,	PERC_ASSESSUSEMOB		);
	Npc_PercDisable  	(self,	PERC_ASSESSENTERROOM	);
	Npc_PercDisable  	(self, 	PERC_MOVEMOB			);			
	Npc_PercDisable  	(self, 	PERC_MOVENPC			);			

};
 
func int ZS_GhostStay_Loop()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_GhostStay_Loop");
    var int rnd; 
 	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand   
	AI_GotoWP (self,"OW_PATH_311");
	rnd=Hlp_Random(3);
	if(rnd==0){ AI_PlayAni (self,"T_SEARCH");};
	var int a; var float b;
	a = (rnd+1)*2; b = IntToFloat(a);
	AI_Wait (self,b);

	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand	
	AI_GotoWP (self,"OW_FOGTOWER_TOP");
	rnd=Hlp_Random(3);	
	if(rnd==0){ AI_PlayAni (self,"T_SEARCH");};		
	a = (rnd+1)*2;	 b = IntToFloat(a);	
	AI_Wait (self,b);
	
	return LOOP_CONTINUE;
};

func void ZS_GhostStay_End()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_GhostStay_End");
   	Npc_ClearAiQueue(self); 
	AI_Teleport (self,self.wp);		// Gehe zum Tagesablaufstart
    
};
