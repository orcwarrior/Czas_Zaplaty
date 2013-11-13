/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/
func void B_NovPanicFirePerc()
{
var string pipe;
			pipe = "SVM_";
			pipe = concatstrings(pipe,inttostring(Hlp_Random(14)+1));
			pipe = concatstrings(pipe,"_BERZERK");
			Snd_Play3D(self, pipe );

};
func void ZS_Mis_PanicFire()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_PanicFire");
    

	Npc_PercEnable  	(self,	PERC_ASSESSOTHERSDAMAGE	,	B_NovPanicFirePerc 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_NovPanicFirePerc			);

	

	
	
	 	
	AI_SetWalkmode (self,NPC_RUN);			// Walkmode für den Zustand 
	Wld_PlayEffect("VOB_BURN",  self, self, 1, 1, DAM_fire, TRUE); 				
	
};
func int ZS_Mis_PanicFire_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_Mis_PanicFire_Loop");
	
	var int praytime;
	praytime = Hlp_Random (100);

		Wld_PlayEffect("VOB_BURN",  self, self, 1, 1, DAM_fire, TRUE); 	
	add_poison(self, self, self.attribute[ATR_HITPOINTS]);
					
		var string pipe;
		pipe = "SVM_";
		pipe = concatstrings(pipe,inttostring(Hlp_Random(14)+1));
		pipe = concatstrings(pipe,"_BERZERK");
		praytime = Hlp_Random (100);
		Snd_Play3D(self, pipe );

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
 	if(Npc_GetStateTime(self)>2+Hlp_Random(9))
 	{ 
	 	B_KillNpc(self);	 	
		return			LOOP_END;	
	}
	else
	{
	
		return			LOOP_CONTINUE;
		
	};	
};

func void ZS_Mis_PanicFire_End ()
{
	
	//PrintDebugNpc(PD_TA_FRAME,"ZS_Mis_PanicFire_End");
};

