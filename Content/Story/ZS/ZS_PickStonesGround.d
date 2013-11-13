/*******************************************
*            NSC benutzt Blubber           *
*  wenn keine Blubber da, raucht er Joint  *
*******************************************/

func void ZS_PickStonesGround ()
{
	//PrintDebugNpc 			(PD_TA_FRAME,	"ZS_PickStonesGround");
	
	B_SetPerception 		(self);    
	AI_SetWalkmode		(self,	NPC_WALK);	
	AI_GotoWP			(self,	self.wp);
	

	if (Wld_IsFPAvailable(self, "FP_STONEGROUNDDIG"))  
	{
		var c_item itm;
		itm = Npc_GetEquippedMeleeWeapon(self);
		if(!Hlp_IsItem(itm,ItMwPickAxe))
		{
			if(!Npc_HasItems(self,ItmwPickaxe))
			{
				CreateInvItems	(self, ItMwPickAxe,1);
				
			};
			AI_EquipBestMeleeWeapon(self);
			
		};
		AI_GotoFP (self, "FP_STONEGROUNDDIG");
		AI_AlignToFP (self);
		AI_PlayAni(self, "T_STONEGROUND_STAND_2_S0");
	};
};

func int ZS_PickStonesGround_Loop ()
{
    //PrintDebugNpc 			(PD_TA_LOOP,	"ZS_PickStonesGround_Loop");
    if(Npc_IsOnFP(self,"FP_STONEGROUNDDIG"))
    {
	AI_PlayAni(self, "T_STONEGROUND_S1");
	AI_Wait(self, 3);
	}
	else
	{
		if (Wld_IsFPAvailable(self, "FP_STONEGROUNDDIG"))  
		{
			var c_item itm;
			itm = Npc_GetEquippedMeleeWeapon(self);
			if(!Hlp_IsItem(itm,ItMwPickAxe))
			{
				if(!Npc_HasItems(self,ItmwPickaxe))
				{
					CreateInvItems	(self, ItMwPickAxe,1);
					
				};
				AI_EquipBestMeleeWeapon(self);
				
			};
			AI_GotoFP (self, "FP_STONEGROUNDDIG");
			AI_AlignToFP (self);
			AI_PlayAni(self, "T_STONEGROUND_STAND_2_S0");
		};		
	};
//    	var float a; a = inttofloat(hlp_random(3));
//    	AI_Wait(self,a);

   	
    return LOOP_CONTINUE;
};

func void ZS_PickStonesGround_End ()
{
	//PrintDebugNpc 			(PD_TA_FRAME,	"ZS_PickStonesGround_End");
	
	if (Npc_IsOnFP(self, "FP_STONEWALLDIG"))  
	{
		AI_PlayAni		(self, "T_STONEGROUND_S0_2_STAND");
	};	

};

