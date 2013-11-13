/*************************************************************************
**																		**
**		B_NPCIsOnHelpList													**
**		=============													**
**		Check NPC using CmpNpc											**
**																		**
**																		**
*************************************************************************/
func int B_NPCIsOnHelpList(var c_npc slf)
{
	return CmpNPC(slf,NPCNeedHelp0)+CmpNPC(slf,NPCNeedHelp1)+CmpNPC(slf,NPCNeedHelp2)+CmpNPC(slf,NPCNeedHelp3)+CmpNPC(slf,NPCNeedHelp4)+CmpNPC(slf,NPCNeedHelp5)+CmpNPC(slf,NPCNeedHelp6)+CmpNPC(slf,NPCNeedHelp7)+CmpNPC(slf,NPCNeedHelp8)+CmpNPC(slf,NPCNeedHelp9)+CmpNPC(slf,NPCNeedHelp10)+CmpNPC(slf,NPCNeedHelp11)+CmpNPC(slf,NPCNeedHelp12)+CmpNPC(slf,NPCNeedHelp13)+CmpNPC(slf,NPCNeedHelp14)+CmpNPC(slf,NPCNeedHelp15);
};
/*************************************************************************
**																		**
**		B_AddNpc2List													**
**		=============													**
**		Add npc to list													**
**																		**
**																		**
*************************************************************************/
func void B_AddNpc2List(var int slfid)
{
	
	if(Npc_IsPlayer(NPCNeedHelp0)){ NPCNeedHelp0=Hlp_GetNpc(slfid); NewNpcOnList=1;}
	else if(Npc_IsPlayer(NPCNeedHelp1)){ NPCNeedHelp1=Hlp_GetNpc(slfid); NewNpcOnList=2;}
	else if(Npc_IsPlayer(NPCNeedHelp2)){ NPCNeedHelp2=Hlp_GetNpc(slfid); NewNpcOnList=3;}	
	else if(Npc_IsPlayer(NPCNeedHelp3)){ NPCNeedHelp3=Hlp_GetNpc(slfid); NewNpcOnList=4;}
	else if(Npc_IsPlayer(NPCNeedHelp4)){ NPCNeedHelp4=Hlp_GetNpc(slfid); NewNpcOnList=5;}
	else if(Npc_IsPlayer(NPCNeedHelp5)){ NPCNeedHelp5=Hlp_GetNpc(slfid); NewNpcOnList=6;}
	else if(Npc_IsPlayer(NPCNeedHelp6)){ NPCNeedHelp6=Hlp_GetNpc(slfid); NewNpcOnList=7;}
	else if(Npc_IsPlayer(NPCNeedHelp7)){ NPCNeedHelp7=Hlp_GetNpc(slfid); NewNpcOnList=8;}
	else if(Npc_IsPlayer(NPCNeedHelp8)){ NPCNeedHelp8=Hlp_GetNpc(slfid); NewNpcOnList=9;}
	else if(Npc_IsPlayer(NPCNeedHelp9)){ NPCNeedHelp9=Hlp_GetNpc(slfid); NewNpcOnList=10;}
	else if(Npc_IsPlayer(NPCNeedHelp10)){ NPCNeedHelp10=Hlp_GetNpc(slfid); NewNpcOnList=11;}
	else if(Npc_IsPlayer(NPCNeedHelp11)){ NPCNeedHelp11=Hlp_GetNpc(slfid); NewNpcOnList=12;}
	else if(Npc_IsPlayer(NPCNeedHelp12)){ NPCNeedHelp12=Hlp_GetNpc(slfid); NewNpcOnList=13;}
	else if(Npc_IsPlayer(NPCNeedHelp13)){ NPCNeedHelp13=Hlp_GetNpc(slfid); NewNpcOnList=14;}
	else if(Npc_IsPlayer(NPCNeedHelp14)){ NPCNeedHelp14=Hlp_GetNpc(slfid); NewNpcOnList=15;}
	else if(Npc_IsPlayer(NPCNeedHelp15)){ NPCNeedHelp15=Hlp_GetNpc(slfid); NewNpcOnList=16;};					
};
/*************************************************************************
**																		**
**		B_DeleteNpcFromList													**
**		=============													**
**		Delete Npc from list											**
**																		**
**																		**
*************************************************************************/
func void B_DeleteNpcFromList(var c_npc slf)
{
	
	if(CmpNPC(NPCNeedHelp0,slf)){ NPCNeedHelp0=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp1,slf)){ NPCNeedHelp1=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp2,slf)){ NPCNeedHelp2=Hlp_GetNpc(PC_Hero); }	
	else if(CmpNPC(NPCNeedHelp3,slf)){ NPCNeedHelp3=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp4,slf)){ NPCNeedHelp4=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp5,slf)){ NPCNeedHelp5=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp6,slf)){ NPCNeedHelp6=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp7,slf)){ NPCNeedHelp7=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp8,slf)){ NPCNeedHelp8=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp9,slf)){ NPCNeedHelp9=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp10,slf)){ NPCNeedHelp10=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp11,slf)){ NPCNeedHelp11=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp12,slf)){ NPCNeedHelp12=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp13,slf)){ NPCNeedHelp13=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp14,slf)){ NPCNeedHelp14=Hlp_GetNpc(PC_Hero); }
	else if(CmpNPC(NPCNeedHelp15,slf)){ NPCNeedHelp15=Hlp_GetNpc(PC_Hero); };					
};
/*************************************************************************
**																		**
**		B_CleanUpList													**
**		=============													**
**		Delete Npc from list											**
**																		**
**																		**
*************************************************************************/
func void B_CleanUpList()
{
	
	if(NPCNeedHelp0.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp0.attribute[ATR_HITPOINTS]*2>NPCNeedHelp0.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp0=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp1.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp1.attribute[ATR_HITPOINTS]*2>NPCNeedHelp1.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp1=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp2.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp2.attribute[ATR_HITPOINTS]*2>NPCNeedHelp2.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp2=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp3.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp3.attribute[ATR_HITPOINTS]*2>NPCNeedHelp3.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp3=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp4.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp4.attribute[ATR_HITPOINTS]*2>NPCNeedHelp4.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp4=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp5.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp5.attribute[ATR_HITPOINTS]*2>NPCNeedHelp5.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp5=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp6.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp6.attribute[ATR_HITPOINTS]*2>NPCNeedHelp6.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp6=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp7.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp7.attribute[ATR_HITPOINTS]*2>NPCNeedHelp7.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp7=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp8.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp8.attribute[ATR_HITPOINTS]*2>NPCNeedHelp8.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp8=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp9.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp9.attribute[ATR_HITPOINTS]*2>NPCNeedHelp9.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp9=Hlp_GetNpc(PC_Hero);};
	if(NPCNeedHelp10.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp10.attribute[ATR_HITPOINTS]*2>NPCNeedHelp10.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp10=Hlp_GetNpc(PC_Hero); };
	if(NPCNeedHelp11.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp11.attribute[ATR_HITPOINTS]*2>NPCNeedHelp11.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp11=Hlp_GetNpc(PC_Hero); };
	if(NPCNeedHelp12.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp12.attribute[ATR_HITPOINTS]*2>NPCNeedHelp12.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp12=Hlp_GetNpc(PC_Hero); };
	if(NPCNeedHelp13.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp13.attribute[ATR_HITPOINTS]*2>NPCNeedHelp13.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp13=Hlp_GetNpc(PC_Hero); };
	if(NPCNeedHelp14.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp14.attribute[ATR_HITPOINTS]*2>NPCNeedHelp14.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp14=Hlp_GetNpc(PC_Hero); };
	if(NPCNeedHelp15.attribute[ATR_HITPOINTS]<2)||(NPCNeedHelp15.attribute[ATR_HITPOINTS]*2>NPCNeedHelp15.attribute[ATR_HITPOINTS_MAX]){ NPCNeedHelp15=Hlp_GetNpc(PC_Hero); };
	
	if(C_NpcIsInvaild(NPCNeedHelp0)) {};
	if(C_NpcIsInvaild(NPCNeedHelp0)) {};
	if(C_NpcIsInvaild(NpcNeedHelp1)) {};
	if(C_NpcIsInvaild(NpcNeedHelp2)) {};
	if(C_NpcIsInvaild(NpcNeedHelp3)) {};
	if(C_NpcIsInvaild(NpcNeedHelp4)) {};
	if(C_NpcIsInvaild(NpcNeedHelp5)) {};
	if(C_NpcIsInvaild(NpcNeedHelp6)) {};
	if(C_NpcIsInvaild(NpcNeedHelp7)) {};
	if(C_NpcIsInvaild(NpcNeedHelp8)) {};
	if(C_NpcIsInvaild(NpcNeedHelp9)) {};
	if(C_NpcIsInvaild(NpcNeedHelp10)){};
	if(C_NpcIsInvaild(NpcNeedHelp11)){};
	if(C_NpcIsInvaild(NpcNeedHelp12)){};
	if(C_NpcIsInvaild(NpcNeedHelp13)){};
	if(C_NpcIsInvaild(NpcNeedHelp14)){};
	if(C_NpcIsInvaild(NpcNeedHelp15)){};
		
		
};
/*************************************************************************
**																		**
**		B_GetNpcName													**
**		=============													**
**		By integer on list											**
**																		**
**																		**
*************************************************************************/
func string B_GetNpcName(var int num)
{
	
	if(num==1){ return NpcNeedHelp0.name;}
	else if(num==2){ return NpcNeedHelp1.name;}
	else if(num==3){ return NpcNeedHelp2.name;}
	else if(num==4){ return NpcNeedHelp3.name;}
	else if(num==5){ return NpcNeedHelp4.name;}
	else if(num==6){ return NpcNeedHelp5.name;}
	else if(num==7){ return NpcNeedHelp6.name;}
	else if(num==8){ return NpcNeedHelp7.name;}
	else if(num==9){ return NpcNeedHelp8.name;}
	else if(num==10){ return NpcNeedHelp9.name;}
	else if(num==11){ return NpcNeedHelp10.name;}
	else if(num==12){ return NpcNeedHelp11.name;}
	else if(num==13){ return NpcNeedHelp12.name;}
	else if(num==14){ return NpcNeedHelp13.name;}
	else if(num==15){ return NpcNeedHelp14.name;}
	else if(num==16){ return NpcNeedHelp15.name;};			
};         

func void B_InitHelpME()
{
	NPCNeedHelp15	=	Hlp_GetNpc(PC_Hero);	
	NPCNeedHelp14	=	Hlp_GetNpc(PC_Hero);	                             
	NPCNeedHelp13	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp12	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp11	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp10	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp9	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp8	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp7	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp6	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp5	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp4	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp3	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp2	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp1	=	Hlp_GetNpc(PC_Hero);
	NPCNeedHelp0	=	Hlp_GetNpc(PC_Hero);
};           
             