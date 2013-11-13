/*******************************************
*          NSC kloppt an Erzmobsi          *
*******************************************/

func void ZS_PickOre()
{
    //PrintDebugInt (PD_TA_FRAME,"ZS_PickOre");

	B_SetPerception (self);    
	NPC_PERCENABLE(SELF,PERC_ASSESSDAMAGE,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSMAGIC,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSCASTER,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSTHREAT,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_DRAWWEAPON,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSWARN,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSMURDER,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSDEFEAT,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSFIGHTSOUND,B_NOREACT);
	NPC_PERCENABLE(SELF,PERC_ASSESSQUIETSOUND,B_NOREACT);
	
	
    if (Npc_GetAivar(self,AIV_DONTUSEMOB) == TRUE)
    {
		Npc_SetAivar(self,AIV_DONTUSEMOB,0);
    }
    else
    {
		B_StartUseMob	(self,	"ORE");
	};
};

func void ZS_PickOre_Loop ()
{
    //PrintDebugInt (PD_TA_LOOP,"ZS_PickOre_Loop");    
	//PRINTAttitudes (PD_TA_LOOP);

	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("ORE");
    };
	AI_Wait(self,1);
};

func void ZS_PickOre_End ()
{
	//PrintDebugInt	(PD_TA_FRAME,"ZS_PickOre_End");

	B_StopUseMob	(self,"ORE");
};