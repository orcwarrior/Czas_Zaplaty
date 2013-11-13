
func void B_MisSetPatrolGRDToHostile()
{
   var C_NPC CH2_Patrol_g1; CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
   var C_NPC CH2_Patrol_g2; CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
   var C_NPC CH2_Patrol_g3; CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
   var C_NPC CH2_Patrol_g4; CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
   var C_NPC CH2_Patrol_g5; CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);
   
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetPermAttitude	(CH2_Patrol_g1, ATT_HOSTILE);
	Npc_SetPermAttitude	(CH2_Patrol_g2, ATT_HOSTILE);
	Npc_SetPermAttitude	(CH2_Patrol_g3, ATT_HOSTILE);
	Npc_SetPermAttitude	(CH2_Patrol_g4, ATT_HOSTILE);
	Npc_SetPermAttitude	(CH2_Patrol_g5, ATT_HOSTILE);
	Npc_SetTrueGuild  (self, GIL_DMB);         
	Npc_SetTrueGuild  (CH2_Patrol_g1, GIL_DMB);
	Npc_SetTrueGuild  (CH2_Patrol_g2, GIL_DMB);
	Npc_SetTrueGuild  (CH2_Patrol_g3, GIL_DMB);
	Npc_SetTrueGuild  (CH2_Patrol_g4, GIL_DMB);
	Npc_SetTrueGuild  (CH2_Patrol_g5, GIL_DMB);	
	self.guild			= GIL_DMB;        
	CH2_Patrol_g1.guild = GIL_DMB;
	CH2_Patrol_g2.guild = GIL_DMB;
	CH2_Patrol_g3.guild = GIL_DMB;
	CH2_Patrol_g4.guild = GIL_DMB;
	CH2_Patrol_g5.guild = GIL_DMB;		
};

func void B_MisPatrolGRDChoiceAttack()
{  
	B_MisSetPatrolGRDToHostile();	
	Party_AddNpc(angus);
	Party_AddNpc(hank);
	Party_AddNpc(rodney);

	Npc_ClearAIQueue(rodney);
	Npc_ClearAIQueue(angus);
	Npc_ClearAIQueue(hank);
//	Npc_ExchangeRoutine(rodney,"PATROLATTACK"); 
//	Npc_ExchangeRoutine(angus,"PATROLATTACK"); 
//	Npc_ExchangeRoutine(hank,"PATROLATTACK"); 
	
//	AI_Teleport		(rodney, "MIS_GRDPATROL1_2");
//	AI_Teleport		(angus, "MIS_GRDPATROL1_2");
//	AI_Teleport		(hank, "MIS_GRDPATROL1_2");

	AI_DrawWeapon(angus);
	AI_DrawWeapon(rodney);
	AI_DrawWeapon(hank);		
};

func void B_MisPatrolGRDChoiceTrap()
{
	var C_NPC CH2_Patrol_g1; CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
	var C_NPC CH2_Patrol_g2; CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
	var C_NPC CH2_Patrol_g3; CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
	var C_NPC CH2_Patrol_g4; CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
	var C_NPC CH2_Patrol_g5; CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);	
   
	Npc_ExchangeRoutine(self,"FALOW");
	B_ExchangeRoutine(CH2_Patrol_g1,"FALOW");
	B_ExchangeRoutine(CH2_Patrol_g2,"FALOW");
	B_ExchangeRoutine(CH2_Patrol_g3,"FALOW");
	B_ExchangeRoutine(CH2_Patrol_g4,"FALOW");
	B_ExchangeRoutine(CH2_Patrol_g5,"FALOW");
};

func void B_MisPatrolGRDChoiceNegotiatie_Failure()
{
	B_MisSetPatrolGRDToHostile();	

	Party_AddNpc(angus);
	Party_AddNpc(hank);
	Party_AddNpc(rodney);
	
	Npc_ClearAIQueue(rodney);
	Npc_ClearAIQueue(angus);
	Npc_ClearAIQueue(hank);
	Npc_ExchangeRoutine(rodney,"PATROLATTACK"); 
	Npc_ExchangeRoutine(angus,"PATROLATTACK"); 
	Npc_ExchangeRoutine(hank,"PATROLATTACK"); 
	
	AI_Teleport(rodney, "OW_PATH_001");
	AI_Teleport(angus, "OW_PATH_001");
	AI_Teleport(hank, "OW_PATH_001");
	
	AI_DrawWeapon(angus);
	AI_DrawWeapon(rodney);
	AI_DrawWeapon(hank);	
};
func void B_MisPatrolGRDChoiceNegotiatie_Sucess()
{
   var C_NPC CH2_Patrol_g1; CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
   var C_NPC CH2_Patrol_g2; CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
   var C_NPC CH2_Patrol_g3; CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
   var C_NPC CH2_Patrol_g4; CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
   var C_NPC CH2_Patrol_g5; CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);	
   
   Npc_ExchangeRoutine(self,"back");
   B_ExchangeRoutine(CH2_Patrol_g1,"back");
   B_ExchangeRoutine(CH2_Patrol_g2,"back");
   B_ExchangeRoutine(CH2_Patrol_g3,"back");
   B_ExchangeRoutine(CH2_Patrol_g4,"back");
   B_ExchangeRoutine(CH2_Patrol_g5,"back");

   B_ExchangeRoutine(hank,"InHC");
   B_ExchangeRoutine(rodney,"InHC");
   B_ExchangeRoutine(angus,"InHC");	
};