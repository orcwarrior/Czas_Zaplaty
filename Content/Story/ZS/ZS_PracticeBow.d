/**************************************
*  NSC soll auf Zielscheibe schiessen *
***************************************/


//### Skriptmethode noch einbauen, wenn sie für VoBs geht
func void ZS_PracticeBow ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow");
    
	B_SetPerception (self);    	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand 
	if !(Hlp_StrCmp(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "FP_BOWPRACTICE"))
	{
		AI_GotoFP (self,"FP_BOWPRACTICE");	
		AI_AlignToFP( self );				//Richte Dich aus
	};
	if(!Npc_HasEquippedRangedWeapon(self))
	{
	 	AI_EquipBestRangedWeapon(self);
	};
	AI_ReadyRangedWeapon(self);
	if(!Npc_HasReadiedRangedWeapon(self))
	{
	
	AI_StartState	(self, ZS_Stand, 1, "");
	};		
};

func int ZS_PracticeBow_Loop ()
{
    //PrintDebugNpc(PD_TA_LOOP,"ZS_PracticeBow_Loop");
 	var float time; 
 	if(Npc_GetStateTime(self)<=1)
 	{
 		time = IntToFloat(1+Hlp_Random(3)); 
		AI_AimAt(self,self);
		 time = IntToFloat(1+Hlp_Random(6));
		AI_WAIT(self,time);
		Npc_SetTarget(self,self);
		return LOOP_CONTINUE;
	}
	else
	{
		if(!Npc_CanSeeNpc	(self,hero))&&(Npc_GetDistToNpc	(self,hero) > 450)
		{
			AI_ShootAt					(self,self);
			time = IntToFloat(1+Hlp_Random(3));
			AI_WAIT(self,time);
			AI_StopAim(self);
			Npc_SetStateTime(self,0);
			return LOOP_END;
		}
		else
		{
			AI_Wait(self,1);
			return LOOP_CONTINUE;		
		};	
	};
};

func void ZS_PracticeBow_End ()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_PracticeBow_End");   
	AI_StopAim(self);     
    AI_RemoveWeapon(self);
};


