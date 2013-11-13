func void B_Add2RespawnMem (var C_Npc slf,var string slfwaypoint)
{
// var int	slfinstance;
// slfinstance = Hlp_GetInstanceID(slf);

// 	if((!Npc_IsPlayer(self))&&(!C_NpcIsHuman(self))&&(Npc_GetAivar(slf,AIV_MM_PARTYMEMBER) != TRUE)||(Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN) != 999))//no summon skeletons,golems,demons...
// 	{
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R100)||Npc_IsPlayer(R100))){R100 = Hlp_GetNpc(slfinstance); WP_R100 = slfwaypoint; Day2_Respw_R100 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1;};
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R99)||Npc_IsPlayer(R99))){R99 = Hlp_GetNpc(slfinstance); WP_R99 = slfwaypoint; Day2_Respw_R99 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R98)||Npc_IsPlayer(R98))){R98 = Hlp_GetNpc(slfinstance); WP_R98 = slfwaypoint; Day2_Respw_R98 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R97)||Npc_IsPlayer(R97))){R97 = Hlp_GetNpc(slfinstance); WP_R97 = slfwaypoint; Day2_Respw_R97 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R96)||Npc_IsPlayer(R96))){R96 = Hlp_GetNpc(slfinstance); WP_R96 = slfwaypoint; Day2_Respw_R96 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R95)||Npc_IsPlayer(R95))){R95 = Hlp_GetNpc(slfinstance); WP_R95 = slfwaypoint; Day2_Respw_R95 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R94)||Npc_IsPlayer(R94))){R94 = Hlp_GetNpc(slfinstance); WP_R94 = slfwaypoint; Day2_Respw_R94 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R93)||Npc_IsPlayer(R93))){R93 = Hlp_GetNpc(slfinstance); WP_R93 = slfwaypoint; Day2_Respw_R93 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R92)||Npc_IsPlayer(R92))){R92 = Hlp_GetNpc(slfinstance); WP_R92 = slfwaypoint; Day2_Respw_R92 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R91)||Npc_IsPlayer(R91))){R91 = Hlp_GetNpc(slfinstance); WP_R91 = slfwaypoint; Day2_Respw_R91 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R90)||Npc_IsPlayer(R90))){R90 = Hlp_GetNpc(slfinstance); WP_R90 = slfwaypoint; Day2_Respw_R90 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R89)||Npc_IsPlayer(R89))){R99 = Hlp_GetNpc(slfinstance); WP_R89 = slfwaypoint; Day2_Respw_R89 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R88)||Npc_IsPlayer(R88))){R98 = Hlp_GetNpc(slfinstance); WP_R88 = slfwaypoint; Day2_Respw_R88 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R87)||Npc_IsPlayer(R87))){R97 = Hlp_GetNpc(slfinstance); WP_R87 = slfwaypoint; Day2_Respw_R87 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R86)||Npc_IsPlayer(R86))){R96 = Hlp_GetNpc(slfinstance); WP_R86 = slfwaypoint; Day2_Respw_R86 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R85)||Npc_IsPlayer(R85))){R95 = Hlp_GetNpc(slfinstance); WP_R85 = slfwaypoint; Day2_Respw_R85 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R84)||Npc_IsPlayer(R84))){R94 = Hlp_GetNpc(slfinstance); WP_R84 = slfwaypoint; Day2_Respw_R84 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R83)||Npc_IsPlayer(R83))){R93 = Hlp_GetNpc(slfinstance); WP_R83 = slfwaypoint; Day2_Respw_R83 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R82)||Npc_IsPlayer(R82))){R92 = Hlp_GetNpc(slfinstance); WP_R82 = slfwaypoint; Day2_Respw_R82 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R81)||Npc_IsPlayer(R81))){R91 = Hlp_GetNpc(slfinstance); WP_R81 = slfwaypoint; Day2_Respw_R81 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R80)||Npc_IsPlayer(R80))){R90 = Hlp_GetNpc(slfinstance); WP_R80 = slfwaypoint; Day2_Respw_R80 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
//     	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R79)||Npc_IsPlayer(R79))){R79 = Hlp_GetNpc(slfinstance); WP_R79 = slfwaypoint; Day2_Respw_R79 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R78)||Npc_IsPlayer(R78))){R78 = Hlp_GetNpc(slfinstance); WP_R78 = slfwaypoint; Day2_Respw_R78 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R77)||Npc_IsPlayer(R77))){R77 = Hlp_GetNpc(slfinstance); WP_R77 = slfwaypoint; Day2_Respw_R77 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R76)||Npc_IsPlayer(R76))){R76 = Hlp_GetNpc(slfinstance); WP_R76 = slfwaypoint; Day2_Respw_R76 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R75)||Npc_IsPlayer(R75))){R75 = Hlp_GetNpc(slfinstance); WP_R75 = slfwaypoint; Day2_Respw_R75 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R74)||Npc_IsPlayer(R74))){R74 = Hlp_GetNpc(slfinstance); WP_R74 = slfwaypoint; Day2_Respw_R74 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R73)||Npc_IsPlayer(R73))){R73 = Hlp_GetNpc(slfinstance); WP_R73 = slfwaypoint; Day2_Respw_R73 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R72)||Npc_IsPlayer(R72))){R72 = Hlp_GetNpc(slfinstance); WP_R72 = slfwaypoint; Day2_Respw_R72 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R71)||Npc_IsPlayer(R71))){R71 = Hlp_GetNpc(slfinstance); WP_R71 = slfwaypoint; Day2_Respw_R71 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R70)||Npc_IsPlayer(R70))){R70 = Hlp_GetNpc(slfinstance); WP_R70 = slfwaypoint; Day2_Respw_R70 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 												
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R69)||Npc_IsPlayer(R69))){R69 = Hlp_GetNpc(slfinstance); WP_R69 = slfwaypoint; Day2_Respw_R69 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R68)||Npc_IsPlayer(R68))){R68 = Hlp_GetNpc(slfinstance); WP_R68 = slfwaypoint; Day2_Respw_R68 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R67)||Npc_IsPlayer(R67))){R67 = Hlp_GetNpc(slfinstance); WP_R67 = slfwaypoint; Day2_Respw_R67 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R66)||Npc_IsPlayer(R66))){R66 = Hlp_GetNpc(slfinstance); WP_R66 = slfwaypoint; Day2_Respw_R66 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R65)||Npc_IsPlayer(R65))){R65 = Hlp_GetNpc(slfinstance); WP_R65 = slfwaypoint; Day2_Respw_R65 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R64)||Npc_IsPlayer(R64))){R64 = Hlp_GetNpc(slfinstance); WP_R64 = slfwaypoint; Day2_Respw_R64 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R63)||Npc_IsPlayer(R63))){R63 = Hlp_GetNpc(slfinstance); WP_R63 = slfwaypoint; Day2_Respw_R63 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R62)||Npc_IsPlayer(R62))){R62 = Hlp_GetNpc(slfinstance); WP_R62 = slfwaypoint; Day2_Respw_R62 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R61)||Npc_IsPlayer(R61))){R61 = Hlp_GetNpc(slfinstance); WP_R61 = slfwaypoint; Day2_Respw_R61 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R60)||Npc_IsPlayer(R60))){R60 = Hlp_GetNpc(slfinstance); WP_R60 = slfwaypoint; Day2_Respw_R60 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };
// 												
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R59)||Npc_IsPlayer(R59))){R59 = Hlp_GetNpc(slfinstance); WP_R59 = slfwaypoint; Day2_Respw_R59 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R58)||Npc_IsPlayer(R58))){R58 = Hlp_GetNpc(slfinstance); WP_R58 = slfwaypoint; Day2_Respw_R58 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R57)||Npc_IsPlayer(R57))){R57 = Hlp_GetNpc(slfinstance); WP_R57 = slfwaypoint; Day2_Respw_R57 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R56)||Npc_IsPlayer(R56))){R56 = Hlp_GetNpc(slfinstance); WP_R56 = slfwaypoint; Day2_Respw_R56 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R55)||Npc_IsPlayer(R55))){R55 = Hlp_GetNpc(slfinstance); WP_R55 = slfwaypoint; Day2_Respw_R55 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R54)||Npc_IsPlayer(R54))){R54 = Hlp_GetNpc(slfinstance); WP_R54 = slfwaypoint; Day2_Respw_R54 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R53)||Npc_IsPlayer(R53))){R53 = Hlp_GetNpc(slfinstance); WP_R53 = slfwaypoint; Day2_Respw_R53 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R52)||Npc_IsPlayer(R52))){R52 = Hlp_GetNpc(slfinstance); WP_R52 = slfwaypoint; Day2_Respw_R52 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R51)||Npc_IsPlayer(R51))){R51 = Hlp_GetNpc(slfinstance); WP_R51 = slfwaypoint; Day2_Respw_R51 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R50)||Npc_IsPlayer(R50))){R50 = Hlp_GetNpc(slfinstance); WP_R50 = slfwaypoint; Day2_Respw_R50 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
//     	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R49)||Npc_IsPlayer(R49))){R49 = Hlp_GetNpc(slfinstance); WP_R49 = slfwaypoint; Day2_Respw_R49 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R48)||Npc_IsPlayer(R48))){R48 = Hlp_GetNpc(slfinstance); WP_R48 = slfwaypoint; Day2_Respw_R48 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R47)||Npc_IsPlayer(R47))){R47 = Hlp_GetNpc(slfinstance); WP_R47 = slfwaypoint; Day2_Respw_R47 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R46)||Npc_IsPlayer(R46))){R46 = Hlp_GetNpc(slfinstance); WP_R46 = slfwaypoint; Day2_Respw_R46 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R45)||Npc_IsPlayer(R45))){R45 = Hlp_GetNpc(slfinstance); WP_R45 = slfwaypoint; Day2_Respw_R45 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R44)||Npc_IsPlayer(R44))){R44 = Hlp_GetNpc(slfinstance); WP_R44 = slfwaypoint; Day2_Respw_R44 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R43)||Npc_IsPlayer(R43))){R43 = Hlp_GetNpc(slfinstance); WP_R43 = slfwaypoint; Day2_Respw_R43 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R42)||Npc_IsPlayer(R42))){R42 = Hlp_GetNpc(slfinstance); WP_R42 = slfwaypoint; Day2_Respw_R42 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R41)||Npc_IsPlayer(R41))){R41 = Hlp_GetNpc(slfinstance); WP_R41 = slfwaypoint; Day2_Respw_R41 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R40)||Npc_IsPlayer(R40))){R40 = Hlp_GetNpc(slfinstance); WP_R40 = slfwaypoint; Day2_Respw_R40 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
// 		
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R39)||Npc_IsPlayer(R39))){R39 = Hlp_GetNpc(slfinstance); WP_R39 = slfwaypoint; Day2_Respw_R39 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R38)||Npc_IsPlayer(R38))){R38 = Hlp_GetNpc(slfinstance); WP_R38 = slfwaypoint; Day2_Respw_R38 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R37)||Npc_IsPlayer(R37))){R37 = Hlp_GetNpc(slfinstance); WP_R37 = slfwaypoint; Day2_Respw_R37 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R36)||Npc_IsPlayer(R36))){R36 = Hlp_GetNpc(slfinstance); WP_R36 = slfwaypoint; Day2_Respw_R36 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R35)||Npc_IsPlayer(R35))){R35 = Hlp_GetNpc(slfinstance); WP_R35 = slfwaypoint; Day2_Respw_R35 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R34)||Npc_IsPlayer(R34))){R34 = Hlp_GetNpc(slfinstance); WP_R34 = slfwaypoint; Day2_Respw_R34 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R33)||Npc_IsPlayer(R33))){R33 = Hlp_GetNpc(slfinstance); WP_R33 = slfwaypoint; Day2_Respw_R33 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R32)||Npc_IsPlayer(R32))){R32 = Hlp_GetNpc(slfinstance); WP_R32 = slfwaypoint; Day2_Respw_R32 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R31)||Npc_IsPlayer(R31))){R31 = Hlp_GetNpc(slfinstance); WP_R31 = slfwaypoint; Day2_Respw_R31 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R30)||Npc_IsPlayer(R30))){R30 = Hlp_GetNpc(slfinstance); WP_R30 = slfwaypoint; Day2_Respw_R30 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
// 			
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R29)||Npc_IsPlayer(R29))){R29 = Hlp_GetNpc(slfinstance); WP_R29 = slfwaypoint; Day2_Respw_R29 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R28)||Npc_IsPlayer(R28))){R28 = Hlp_GetNpc(slfinstance); WP_R28 = slfwaypoint; Day2_Respw_R28 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R27)||Npc_IsPlayer(R27))){R27 = Hlp_GetNpc(slfinstance); WP_R27 = slfwaypoint; Day2_Respw_R27 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R26)||Npc_IsPlayer(R26))){R26 = Hlp_GetNpc(slfinstance); WP_R26 = slfwaypoint; Day2_Respw_R26 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R25)||Npc_IsPlayer(R25))){R25 = Hlp_GetNpc(slfinstance); WP_R25 = slfwaypoint; Day2_Respw_R25 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R24)||Npc_IsPlayer(R24))){R24 = Hlp_GetNpc(slfinstance); WP_R24 = slfwaypoint; Day2_Respw_R24 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R23)||Npc_IsPlayer(R23))){R23 = Hlp_GetNpc(slfinstance); WP_R23 = slfwaypoint; Day2_Respw_R23 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R22)||Npc_IsPlayer(R22))){R22 = Hlp_GetNpc(slfinstance); WP_R22 = slfwaypoint; Day2_Respw_R22 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R21)||Npc_IsPlayer(R21))){R21 = Hlp_GetNpc(slfinstance); WP_R21 = slfwaypoint; Day2_Respw_R21 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R20)||Npc_IsPlayer(R20))){R20 = Hlp_GetNpc(slfinstance); WP_R20 = slfwaypoint; Day2_Respw_R20 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
// 			
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R19)||Npc_IsPlayer(R19))){R19 = Hlp_GetNpc(slfinstance); WP_R19 = slfwaypoint; Day2_Respw_R19 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R18)||Npc_IsPlayer(R18))){R18 = Hlp_GetNpc(slfinstance); WP_R18 = slfwaypoint; Day2_Respw_R18 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R17)||Npc_IsPlayer(R17))){R17 = Hlp_GetNpc(slfinstance); WP_R17 = slfwaypoint; Day2_Respw_R17 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R16)||Npc_IsPlayer(R16))){R16 = Hlp_GetNpc(slfinstance); WP_R16 = slfwaypoint; Day2_Respw_R16 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R15)||Npc_IsPlayer(R15))){R15 = Hlp_GetNpc(slfinstance); WP_R15 = slfwaypoint; Day2_Respw_R15 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R14)||Npc_IsPlayer(R14))){R14 = Hlp_GetNpc(slfinstance); WP_R14 = slfwaypoint; Day2_Respw_R14 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R13)||Npc_IsPlayer(R13))){R13 = Hlp_GetNpc(slfinstance); WP_R13 = slfwaypoint; Day2_Respw_R13 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R12)||Npc_IsPlayer(R12))){R12 = Hlp_GetNpc(slfinstance); WP_R12 = slfwaypoint; Day2_Respw_R12 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R11)||Npc_IsPlayer(R11))){R11 = Hlp_GetNpc(slfinstance); WP_R11 = slfwaypoint; Day2_Respw_R11 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R10)||Npc_IsPlayer(R10))){R10 = Hlp_GetNpc(slfinstance); WP_R10 = slfwaypoint; Day2_Respw_R10 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
// 			
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R9)||Npc_IsPlayer(R9))){R9 = Hlp_GetNpc(slfinstance); WP_R9 = slfwaypoint; Day2_Respw_R9 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R8)||Npc_IsPlayer(R8))){R8 = Hlp_GetNpc(slfinstance); WP_R8 = slfwaypoint; Day2_Respw_R8 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R7)||Npc_IsPlayer(R7))){R7 = Hlp_GetNpc(slfinstance); WP_R7 = slfwaypoint; Day2_Respw_R7 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R6)||Npc_IsPlayer(R6))){R6 = Hlp_GetNpc(slfinstance); WP_R6 = slfwaypoint; Day2_Respw_R6 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R5)||Npc_IsPlayer(R5))){R5 = Hlp_GetNpc(slfinstance); WP_R5 = slfwaypoint; Day2_Respw_R5 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R4)||Npc_IsPlayer(R4))){R4 = Hlp_GetNpc(slfinstance); WP_R4 = slfwaypoint; Day2_Respw_R4 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R3)||Npc_IsPlayer(R3))){R3 = Hlp_GetNpc(slfinstance); WP_R3 = slfwaypoint; Day2_Respw_R3 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R2)||Npc_IsPlayer(R2))){R2 = Hlp_GetNpc(slfinstance); WP_R2 = slfwaypoint; Day2_Respw_R2 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
// 		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R1)||Npc_IsPlayer(R1))){R1 = Hlp_GetNpc(slfinstance); WP_R1 = slfwaypoint; Day2_Respw_R1 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };	
//		if(Npc_GetAivar(slf,AIV_MM_DEAD) != 1&&(!Hlp_IsValidNpc(R0)||Npc_IsPlayer(R0))){R0 = Hlp_GetNpc(slfinstance); WP_R0 = slfwaypoint; Day2_Respw_R0 = Npc_GetAivar(slf,AIV_MM_DAYTORESPAWN); Npc_GetAivar(slf,AIV_MM_DEAD) = 1; };					
//};	
			/*
	if (Npc_GetAivar(slf,AIV_RESPAWN) == TRUE)
	{
		if (Npc_GetTrueGuild(slf)==GIL_GRD)
		{
			Wld_InsertNpc (slfinstance,"OCC_MERCS_RIGHT_ROOM_BACK");
		}
		else if (Npc_GetTrueGuild(slf)==GIL_VLK)
		{
			Wld_InsertNpc (slfinstance,"OW_PATH_1_2");
		};
	};
	*/
	
};
