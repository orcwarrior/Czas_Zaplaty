func void ZS_Brooming ()
{
	//PrintDebugNpc	(PD_ZS_FRAME,"ZS_Brooming");
	B_SetPerception (self);    
	AI_SetWalkmode	(self,NPC_WALK);	
	AI_GotoWP		(self, 	self.wp);
	AI_AlignToWP 	(self);	
	AI_RemoveWeapon	(self);
};

func int ZS_Brooming_Loop ()
{
	//PrintDebugNpc				(PD_ZS_LOOP,	"ZS_Brooming_Loop");
 		B_GotoFP			(self, "BROOM");
	if (Npc_HasItems (self,ItMi_Broom) <=1)
	{
		CreateInvItem ( self, ItMi_Broom);
	};	

	var int spitreaktion;
    spitreaktion = Hlp_Random (100);
    
    if 		(spitreaktion >= 50)
    {
    	AI_UseItemToState		(self, ItMi_Broom,	1);
    	var int time; var float fl; time = 25+Hlp_Random(17); fl = inttofloat(time);
    	AI_Wait(self,fl);
    	AI_UseItemToState		(self, ItMi_Broom,	-1);
//		AI_AlignToWP 			(self);
    };
    return LOOP_CONTINUE;
};

func void ZS_Brooming_End ()
{	
	//PrintDebugNpc			(PD_ZS_FRAME, "ZS_Brooming_End" );
    AI_UseItemToState		(self, ItMi_Broom,	-1);
	AI_ContinueRoutine 		(self);
};