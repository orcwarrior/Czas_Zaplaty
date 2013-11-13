/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/

func void ZS_NecroServant1()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_NecroServant1");
    
	B_SetPerception (self);    	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
// 	if (Npc_GetDistToNpc (self,hero) <= PERC_DIST_INTERMEDIAT)
// 	{
// 		B_SmartTurnToNpc (self,hero);
// 	};	
	
};
func int ZS_NecroServant1_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_NecroServant1_Loop");
	var string wpname; var int time;
	if (time % 30 == 0)
	{
		wpname = Concatstrings("NL_OUTTER_CIRCLE_0",IntToString((time / 30) % 6 ));
		AI_GotoWP(self,wpname);
	};
	time+=1;
	if (Npc_GetDistToNpc (self,hero) <= PERC_DIST_INTERMEDIAT)
	{
		B_SmartTurnToNpc (self,hero);
	};	
	AI_WaitMS(self,500);
	return LOOP_CONTINUE;
};

func void ZS_NecroServant1_End ()
{

	//PrintDebugNpc(PD_TA_FRAME,"ZS_NecroServant1_End");
};

/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/
//He using duals too
func void ZS_Necroservant2()
{
    //PrintDebugNpc(PD_TA_FRAME,"ZS_Necroservant2");
    
	B_SetPerception (self);    	
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
// 	if (Npc_GetDistToNpc (self,hero) <= PERC_DIST_INTERMEDIAT)
// 	{
// 		B_SmartTurnToNpc (self,hero);
// 	};	
	AI_EquipArmor     (self, ItMw_Dual_01_Left );
	CreateInvItem     (self, ItMw_Dual_01_Left );		
};
func int ZS_Necroservant2_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_Necroservant2_Loop");
	var string wpname; var int time;
	if (time % 30 == 0)
	{
		wpname = Concatstrings("NL_OUTTER_CIRCLE_0",IntToString((time / 30) % 6 + 5 ));
		AI_GotoWP(self,wpname);
	};
	time+=1;

	AI_WaitMS(self,500);
	return LOOP_CONTINUE;
};

func void ZS_Necroservant2_End ()
{

	//PrintDebugNpc(PD_TA_FRAME,"ZS_Necroservant2_End");
};

