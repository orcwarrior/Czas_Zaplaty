/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_Explore	()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_Explore");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_RUN);	// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);		// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);			//Richte Dich aus
	

};
 
func int ZS_Explore_Loop()
{
    //PrintDebugNpc (PD_TA_LOOP,"ZS_Explore_Loop");
       
	var string hlpwp1;
	var string hlpwp2;
		var int hlprand;
//	AI_GotoWP (self,Npc_GetNearestWP (self));
		hlprand = Hlp_Random (100);
		if(Npc_GetStateTime(self) >= 990)||(Npc_GetStateTime(self) == 0)	
		{
		hlpwp1 = Npc_GetNearestWP (self);
		hlpwp2 = Npc_GetNextWP (self);
		AI_GotoWP (self,hlpwp1);
		AI_GotoWP (self,hlpwp2);
		if (!(Hlp_StrCmp (Npc_GetNearestWP (self) ,hlpwp1)) )
		{
		
			AI_GotoWP (self,Npc_GetNearestWP (self));
			AI_AlignToWP (self);			//Richte Dich aus
			
			Npc_SetStateTime(self,1);				
			if (hlprand >= 66)
			{
				AI_PlayAni (self,"T_SEARCH");
			
			};
			AI_PlayAni (self,"T_STAND_2_LGUARD");
		}
		else
		{
			AI_GotoWP (self,Npc_GetNextWP (other));
			AI_AlignToWP (self);			//Richte Dich aus			
			AI_PlayAni (self,"T_STAND_2_LGUARD");
			
			Npc_SetStateTime(self,1);				
		};
		}
		else//ONPOS - Do sth
		{
			var float bleh; bleh = inttofloat(Hlp_Random(4)+1);
			AI_Wait (self,bleh);
			if(hlprand >= 66)
			{
				AI_PlayAni (self,"T_LGUARD_SCRATCH");				
			}
			else if(hlprand >= 33)
			{
				AI_PlayAni (self,"T_LGUARD_STRETCH");				
			}		
			else
			{
				AI_PlayAni (self,"T_LGUARD_CHANGELEG");				
			};			
		};
	if(Npc_GetStateTime(self)>=15+Hlp_Random(17))
	{
	AI_PlayAni (self,"T_LGUARD_2_STAND");	
	B_UseFakeScroll(self);
	Npc_SetStateTime(self,990);	
	
	};
	return LOOP_CONTINUE;
};

func void ZS_Explore_End()
{
    //PrintDebugNpc (PD_TA_FRAME,"ZS_Explore_End");
	AI_PlayAni (self,"T_LGUARD_2_STAND");	    
	Npc_RemoveInvItems	(self, Fakescroll, Npc_HasItems (other,Fakescroll));

};
