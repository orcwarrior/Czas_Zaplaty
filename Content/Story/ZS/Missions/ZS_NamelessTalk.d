/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_NamelessTalk	()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_NamelessTalk");
    

	// * Wahrnehmungen passiv *

	
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_NoReact					);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_NoReact				);
	
	// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_NoReact	 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_NoReact				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_NoReact				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_NoReact 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	B_NoReact 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_NoReact 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_NoReact 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_NoReact				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_NoReact 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_NoReact				    );			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_NoReact				    );	


		
		

};
 
func int ZS_NamelessTalk_Loop()
{
	var int rnd; var float f_rnd; var int arnd; var string i_ani;
	
	arnd=Hlp_Random(16);	
	if(arnd==1){i_ani="01";}
	else if(arnd==2){i_ani="02";}
	else if(arnd==3){i_ani="03";}
	else if(arnd==4){i_ani="04";}
	else if(arnd==5){i_ani="05";}
	else if(arnd==6){i_ani="06";}
	else if(arnd==7){i_ani="07";}
	else if(arnd==8){i_ani="08";}
	else if(arnd==9){i_ani="09";}
	else if(arnd==10){i_ani="10";}
	else if(arnd==11){i_ani="11";}
	else if(arnd==12){i_ani="12";}
	else if(arnd==13){i_ani="13";}
	else if(arnd==14){i_ani="14";}
	else {i_ani="15";};
	
	if(GLOBAL_NAMELESS_TALK)
	{
		rnd=Hlp_Random(4); rnd=rnd+2;
		f_rnd = IntToFloat(rnd);		
		AI_Wait(self,f_rnd);
		//rnd ani
    	
		AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
			
			
		return LOOP_CONTINUE;
	}
	else
	{
		AI_ContinueRoutine(self);	
		return LOOP_END;
	};
};

func void ZS_NamelessTalk_End()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_NamelessTalk_End");

    
};
