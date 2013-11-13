func int ZS_FIREBOUNCE1()
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FIREBOUNCE1");
	//PRINTGlobals		(PD_MAGIC);

	Npc_PercEnable		(self, PERC_ASSESSMAGIC		,	B_NoReact);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_NoReact			);


};


func int ZS_FIREBOUNCE1_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_FIREBOUNCE1" );
	if (Npc_GetStateTime(self) > 5)
	{
		B_PrintDebug("bouncetodaounce");	
	return LOOP_END;
		
	};	
	AI_Wait					(self,	3);
	AI_PlayAni			(self, "S_FIRE_VICTIM" );	
	
	return LOOP_CONTINUE;
};


func void ZS_FIREBOUNCE1_End()
{
	////PrintDebugNpc		( PD_ZS_FRAME, "ZS_FIREBOUNCE1_End" );
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	
};






func int ZS_FIREBOUNCE2()
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FIREBOUNCE2");
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "S_FIRE_VICTIM" );
	};
};


func int ZS_FIREBOUNCE2_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_FIREBOUNCE2" );
	
	AI_Wait					(self,	1);
	return LOOP_END;
};


func void ZS_FIREBOUNCE2_End()
{
	////PrintDebugNpc		( PD_ZS_FRAME, "ZS_FIREBOUNCE2_End" );
};



func int ZS_FIREBOUNCE3()
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FIREBOUNCE3");
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "S_FIRE_VICTIM" );
	};
};


func int ZS_FIREBOUNCE3_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_FIREBOUNCE3" );
	
	AI_Wait					(self,	1);
	return LOOP_END;
};


func void ZS_FIREBOUNCE3_End()
{
	////PrintDebugNpc		( PD_ZS_FRAME, "ZS_FIREBOUNCE3_End" );
};



func int ZS_FIREBOUNCE4()
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FIREBOUNCE4");
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "S_FIRE_VICTIM" );
	};
};


func int ZS_FIREBOUNCE4_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_FIREBOUNCE4" );
	
	AI_Wait					(self,	1);
	return LOOP_END;
};


func void ZS_FIREBOUNCE4_End()
{
	////PrintDebugNpc		( PD_ZS_FRAME, "ZS_FIREBOUNCE4_End" );
};





func int ZS_FIREBOUNCE5()
{
	////PrintDebugNpc		(PD_ZS_FRAME,	"ZS_FIREBOUNCE5");
	
	if ( !Npc_HasBodyFlag	( self, BS_FLAG_INTERRUPTABLE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"bodystate not interuptable, standing up...");
		AI_StandUp (self);
	};
	
	if ( !Npc_IsDead(self) && !Npc_IsInState(self, ZS_Unconscious) && !C_BodystateContains(self,BS_SWIM) &&  !C_BodystateContains(self,BS_DIVE) )
	{
		////PrintDebugNpc		(PD_MAGIC,	"...NSC ist nicht bewuﬂtlos / tot / schwimmend / tauchend");
		AI_PlayAni			(self, "S_FIRE_VICTIM" );
	};
};


func int ZS_FIREBOUNCE5_Loop ()
{	
	////PrintDebugNpc			(PD_ZS_LOOP, "ZS_FIREBOUNCE5" );
	
	AI_Wait					(self,	1);
	return LOOP_END;
};


func void ZS_FIREBOUNCE5_End()
{
	////PrintDebugNpc		( PD_ZS_FRAME, "ZS_FIREBOUNCE5_End" );
};