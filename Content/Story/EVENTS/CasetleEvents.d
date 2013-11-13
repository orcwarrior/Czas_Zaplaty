/////////////////////////////////
// CASETLE EVENTS                     ////
/////////////////////////////////
//All Time Events,Normal Events  ////
//Using To Frozen SWD                ////
/////////////////////////////////
FUNC VOID EVT_ICESWD_FUNC ()
{

};

FUNC int EVT_ICESWD_COND ()
{
	//casteleEvT	
	if (ICESWDUsed == FALSE)
	{
		Snd_Play ("MFX_Spawn_Cast");
		Wld_SetObjectRoutine (03,01,"USE_1",1);		
		Wld_SetObjectRoutine (03,01,"USE_1",1);		
		Wld_SetObjectRoutine (03,01,"USE_2",1);	
		Wld_SetObjectRoutine (03,02,"USE_1",0);		
		Wld_SetObjectRoutine (03,02,"USE_2",0);	
		Wld_SetObjectRoutine (03,03,"DESTROY",1);		
		Wld_SetObjectRoutine (03,02,"ICECUBE",0);
		Wld_SetObjectRoutine (03,04,"USE_2",1);	
		Wld_SetObjectRoutine (03,05,"USE_2",1);		
		Wld_SetObjectRoutine (03,06,"CAS_TELEPORT",1);		
		Wld_SetObjectRoutine (03,06,"CAS_TELEPORT2",1);	
		Wld_SetObjectRoutine (03,06,"CAS_TELEPORT_3",1);		
		Wld_SendTrigger("SEC22DELAY_CAS");	
		CasTeleportActive = TRUE;
		Wld_SetTime	(03,00);
		ICESWDUsed = TRUE;
	}
	else
	{
		return 0;
	};	
};

func void EVT_CAS_22DELAY ()
{//CasteleSWD
	Wld_InsertItem (ItMw_2H_IceSword_0,"CAS_SWD");
//	P/rint("swd insert");
	Npc_ClearAIQueue(hero);	
	AI_LookForItem(hero,ItMw_2H_IceSword_0);
   
	if (Wld_DetectItem(hero,ITEM_KAT_NF))
	{
		if(Hlp_IsItem (item, ItMw_2H_IceSword_0))
		{
			AI_TakeItem(hero,item);
			Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
			CreateInvItem(hero,ItMw_2H_IceSword_1);	
		};
	}
	else
	{
		AI_TakeItem(self,item);
		if (Wld_DetectItem(hero,ITEM_KAT_NF))
		{
			if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
			{
				AI_TakeItem(hero,item);
				Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
				CreateInvItem(hero,ItMw_2H_IceSword_1);	
			};
		}
		else
		{
			AI_TakeItem(self,item);
			if (Wld_DetectItem(hero,ITEM_KAT_NF))
			{
				if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
				{
					AI_TakeItem(hero,item);
					Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
					CreateInvItem(hero,ItMw_2H_IceSword_1);	
				};
			}
			else
			{
				AI_TakeItem(self,item);
				if (Wld_DetectItem(hero,ITEM_KAT_NF))
				{
					if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
					{
						AI_TakeItem(hero,item);
						Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
						CreateInvItem(hero,ItMw_2H_IceSword_1);	
					};
				}
				else
				{
					AI_TakeItem(self,item);
					if (Wld_DetectItem(hero,ITEM_KAT_NF))
					{
						if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
						{
							AI_TakeItem(hero,item);
							Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
							CreateInvItem(hero,ItMw_2H_IceSword_1);	
						};
					}
					else
					{
						AI_TakeItem(self,item);
						if (Wld_DetectItem(hero,ITEM_KAT_NF))
						{
							if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
							{
								AI_TakeItem(hero,item);
								Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
								CreateInvItem(hero,ItMw_2H_IceSword_1);	
							};
						}
						else
						{
							AI_TakeItem(self,item);
							if (Wld_DetectItem(hero,ITEM_KAT_NF))
							{
								if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
								{
									AI_TakeItem(hero,item);
									Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
									CreateInvItem(hero,ItMw_2H_IceSword_1);	
								};
							}
							else
							{
								AI_TakeItem(self,item);
								if (Wld_DetectItem(hero,ITEM_KAT_NF))
								{
									if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
									{
										AI_TakeItem(hero,item);
										Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
										CreateInvItem(hero,ItMw_2H_IceSword_1);	
									};
								}
								else
								{
									AI_TakeItem(self,item);
									if (Wld_DetectItem(hero,ITEM_KAT_NF))
									{
										if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
										{
											AI_TakeItem(hero,item);
											Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
											CreateInvItem(hero,ItMw_2H_IceSword_1);	
										};
									}
									else
									{
										AI_TakeItem(self,item);
										if (Wld_DetectItem(hero,ITEM_KAT_NF))
										{
											if(Hlp_IsItem 				(item, ItMw_2H_IceSword_0))
											{
												AI_TakeItem(hero,item);
												Npc_RemoveInvItem(hero,ItMw_2H_IceSword_0);
												CreateInvItem(hero,ItMw_2H_IceSword_1);	
											};
										}
										else
										{
											AI_TakeItem(self,item);
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};		

var int CAS_SWITCH;
FUNC void CASTLESWITCH_S1()//For 2 Stones
{
	CAS_SWITCH = true;
};
	
FUNC int EVT_CAS_SWITCH2_COND()//For 2 Stones
{
	if(CAS_SWITCH == TRUE)
	{
      return true;
	}
	else
	{
		PutMsg("Nie dzia³a!","font_default.tga",RGBAToZColor(255,155,155,255),2*8,"");	
		AI_PlayAni (hero,"T_DONTKNOW");
		return false;
	};
};
	