/*******************************************
*            NSC benutzt Blubber           *
*  wenn keine Blubber da, raucht er Joint  *
*******************************************/

func void ZS_PickStonesWall ()
{
	//PrintDebugNpc 			(PD_TA_FRAME,	"ZS_PickStonesWall");
	
	B_SetPerception 		(self);    
	AI_SetWalkmode		(self,	NPC_WALK);	
	AI_GotoWP			(self,	self.wp);
	

	if (Wld_IsFPAvailable(self, "FP_STONEWALLDIG"))  
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
		AI_GotoFP (self, "FP_STONEWALLDIG");
		AI_AlignToFP (self);
		AI_PlayAni(self, "T_STONE_STAND_2_S0");
	};
};

func int ZS_PickStonesWall_Loop ()
{
    //PrintDebugNpc 			(PD_TA_LOOP,	"ZS_PickStonesWall_Loop");


    if(Npc_IsOnFP(self,"FP_STONEWALLDIG"))
    {
   	var float a; a = inttofloat(hlp_random(3));
   	AI_Wait(self,a);	    
	AI_PlayAni(self, "T_STONE_S0_2_S1");
	AI_PlayAni(self, "S_STONE_S1");  
	AI_Wait(self,6);
	}
	else
	{
		if (Wld_IsFPAvailable(self, "FP_STONEWALLDIG"))  
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
			AI_GotoFP (self, "FP_STONEWALLDIG");
			AI_AlignToFP (self);
			AI_PlayAni(self, "T_STONE_STAND_2_S0");
		};		
	};
   	
    return LOOP_CONTINUE;
};

func void ZS_PickStonesWall_End ()
{
	//PrintDebugNpc 			(PD_TA_FRAME,	"ZS_PickStonesWall_End");
	
	if (Npc_IsOnFP(self, "FP_STONEWALLDIG"))  
	{
		AI_PlayAni		(self, "T_STONE_S0_2_STAND");
	};	

};

