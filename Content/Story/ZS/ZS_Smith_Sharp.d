/*******************************************
*      Schmied benutzt Schleifstein        *
*******************************************/

func void ZS_Smith_Sharp ()
{	
    //PrintDebugNpc 	(PD_TA_FRAME,	"ZS_Smith_Sharp");
    
	B_SetPerception (self);    
	B_StartUseMob	(self, "BSSHARP");	
};

func void ZS_Smith_Sharp_Loop ()
{
	//PrintDebugNpc 	(PD_TA_LOOP,	"ZS_Smith_Sharp_Loop");

	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("BSSHARP");
    };
	AI_Wait(self,1);
	B_RemoveMobItems(self); //Ork: Troche perfidne ale to może pomoże garremu
};

func void ZS_Smith_Sharp_End ()
{
	//PrintDebugNpc	(PD_TA_FRAME,	"ZS_Smith_Sharp_End");

	B_StopUseMob	(self,	"BSSHARP");

	var int amount;
};
