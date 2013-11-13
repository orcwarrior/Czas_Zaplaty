/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/
func void B_NovPanicPerc()
{
	var int praytime; 
	praytime = Hlp_Random (100);
	
	if (praytime <= 10)
	{
		if(praytime<3)
		{
			B_FullStop	 			(self);		
			Mdl_ApplyOverlayMDSTimed(self,"HUMANS_DRUNKEN.MDS",5000);
			AI_PlayAni			(self, "T_STAND_2_JUMP" );		
			AI_Wait(self,3);
			AI_PlayAni			(self, "T_JUMP_2_STAND" );		
		}
		else if (praytime<6)
		{

			B_FullStop	 			(self);		
			AI_PlayAni			(self, "T_PSI_VICTIM" );
			var string pipe;
			pipe = "SVM_";
			pipe = concatstrings(pipe,inttostring(Hlp_Random(14)+1));
			pipe = concatstrings(pipe,"_BERZERK");
			Snd_Play3D(self, pipe );
		}
		else if(praytime==6)
		{
			B_FullStop	 			(self);		
			AI_PlayAni			(self, "T_PEE" );

		

		}
		else
		{

			pipe = "SVM_";
			pipe = concatstrings(pipe,inttostring(Hlp_Random(14)+1));
			pipe = concatstrings(pipe,"_BERZERK");
			Snd_Play3D(self, pipe );
		};	
	};	
};
func void ZS_Mis_NovPanic()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_NovPanic");
    
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_NovPanicPerc			);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_NovPanicPerc			);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_NovPanicPerc			);
	Npc_PercEnable  	(self,	PERC_ASSESSOTHERSDAMAGE	,	B_NovPanicPerc 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);

	
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_NovPanicPerc 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_NovPanicPerc	);		
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_NovPanicPerc	); // erst mal raus, weil beklauen sonst unmöglich wird
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_NovPanicPerc	);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_NovPanicPerc	);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_NovPanicPerc	);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_NovPanicPerc	);			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_NovPanicPerc	);		
	
	 	
	AI_SetWalkmode (self,NPC_RUN);			// Walkmode für den Zustand 
	

};
func int ZS_Mis_NovPanic_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_Mis_NovPanic_Loop");
	
	var int praytime;
	praytime = Hlp_Random (100);
	if (praytime <= 5)
	{
		B_FullStop	 			(self);		
		AI_PlayAni			(self, "T_PSI_VICTIM" );
		var string pipe;
		pipe = "SVM_";
		pipe = concatstrings(pipe,inttostring(Hlp_Random(14)+1));
		pipe = concatstrings(pipe,"_BERZERK");
		praytime = Hlp_Random (100);
		Snd_Play3D(self, pipe );

	};
	praytime = Hlp_Random (100);
	var int slf_pos;
	
	if(Npc_GetDistToWP(self,"PANIC_1") > (Npc_GetDistToWP(self,"PANIC_2")))
	{//sure isn't PANIC_2 & PANIC_3
		if(Npc_GetDistToWP(self,"PANIC_1") > (Npc_GetDistToWP(self,"PANIC_4")))
		{//PANIC_1!
			slf_pos=1;	
		}
		else
		{//PANIC_4!
			slf_pos=4;			
		};
		
		
	}
	else
	{//sure isn't PANIC_1 2 or 3, or 4
		if(Npc_GetDistToWP(self,"PANIC_2") > (Npc_GetDistToWP(self,"PANIC_3")))
		{//PANIC_2 or 4
			if(Npc_GetDistToWP(self,"PANIC_2") > (Npc_GetDistToWP(self,"PANIC_3")))
			{//PANIC_2!
				slf_pos=2;	
			}
			else
			{//PANIC_4!
				slf_pos=4;	
			};	
		}
		else
		{//PANIC_3!
			slf_pos=3;	
		};		
		
	};
	
		var string strng;	
	if (praytime >= 66)
	{
			strng=inttostring(slf_pos);
			strng=Concatstrings("PANIC_DEAD",strng);		
			AI_GotoWP (self,strng);
		return			LOOP_CONTINUE;
	}
	else
	{
		var int wayp; wayp=Hlp_Random(4)+1;

		if(wayp != slf_pos)
		{
			strng=inttostring(wayp);
			strng=Concatstrings("PANIC_",strng);
			AI_GotoWP (self,strng);
			return			LOOP_CONTINUE;
	 	};
	};
	
	AI_Wait(self,1);
 	if(Npc_GetStateTime(self)>140)
 	{ 
		return			LOOP_END;	
	};	
};

func void ZS_Mis_NovPanic_End ()
{
	
	//PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_NovPanic_End");
};

