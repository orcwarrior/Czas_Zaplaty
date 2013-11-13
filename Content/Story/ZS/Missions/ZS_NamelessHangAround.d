/****************************************************
*    NSC sucht MEDITATE-FP und beginnt anzubeten    *
****************************************************/
var int Nameless_Action;
var int GLOBAL_NAMELESS_TALK;
func void ZS_NamelessHangAround()
{
	//PrintDebugNpc(PD_TA_FRAME,"ZS_NamelessHangAround");
	



	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_NoReact					);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_NoReact				);
	
	// SN 24.09.00: auskommentiert, da die Wachen sonst ihren Posten verlassen !!!
	//Npc_PercEnable  	(self,	PERC_ASSESSITEM			,	B_AssessItem 				);
	
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_NoReact	 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHREAT		,	B_NoReact				);
	Npc_PercEnable  	(self,	PERC_DRAWWEAPON			, 	B_NoReact				);		
	Npc_PercEnable  	(self, 	PERC_ASSESSWARN			, 	B_NoReact 		 	 	);
	Npc_PercEnable  	(self, 	PERC_ASSESSMURDER		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSDEFEAT		,	B_NoReact				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTSOUND	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_ASSESSQUIETSOUND	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_CATCHTHIEF			,	B_NoReact 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSTHEFT		,	B_NoReact 				);
	Npc_PercEnable  	(self, 	PERC_ASSESSSURPRISE		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_OBSERVESUSPECT		,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_OBSERVEINTRUDER	,	B_NoReact 			);
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_NamelessAssessTalk	);
	Npc_PercEnable  	(self, 	PERC_ASSESSCALL			,	B_NoReact				);
	Npc_PercEnable  	(self,	PERC_ASSESSUSEMOB		,	B_NoReact 				);
	Npc_PercEnable  	(self,	PERC_ASSESSENTERROOM	,	B_NoReact			);
	Npc_PercEnable  	(self, 	PERC_MOVEMOB			,	B_NoReact				    );			
	Npc_PercEnable  	(self, 	PERC_MOVENPC			,	B_NoReact				    );	
	
	AI_SetWalkmode (self,NPC_RUN);			// Walkmode für den Zustand 
	B_FullStop (self);
	if(GLOBAL_NAMELESS_ACTION_DISTURBED!=TRUE)
	{
		Nameless_Action = Hlp_Random (10);
	}
	else
	{
		GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
	};
};
func int ZS_NamelessHangAround_Loop()
{
	//PrintDebugNpc(PD_TA_LOOP,"ZS_NamelessHangAround_Loop");
	var int randomizer; var int amount; var string NL_WP; var int when_nl_arrived_to_wp;
	var int rnd; var float f_rnd; var int arnd; var string i_ani; var int rand;
	
	randomizer = hlp_random(20);
	AI_SetWalkmode (self,NPC_RUN);			// Walkmode für den Zustand 	
	if(Nameless_Action==0)//Sharp
	{
		if !(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
		{	
			
			if(Npc_GetDistToWP(self,"OM_SMITH_02")<700)
			{
				if(!when_nl_arrived_to_wp)
				{
					when_nl_arrived_to_wp=Npc_GetStateTime(self);
				};
				
				AI_UseMob 		(self, "BSSHARP",1);	
			}
			else
			{
				AI_GotoWp(self,"OM_SMITH_02");	
			};
			// 		if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+randomizer)
			//     	{
			//     	B_InterruptMob ("BSSHARP");
			//    		};
			return LOOP_CONTINUE;   		
			if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+20+randomizer)
			{
				amount = Npc_HasItems(self, ItMw_1H_Sword_01);
				if (amount > 1)
				{
					Npc_RemoveInvItems(self,ItMw_1H_Sword_01, amount-1);
				};
				when_nl_arrived_to_wp=0;
				AI_UseMob 		(self, "BSSHARP",-1);
				GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;				
				return LOOP_END;
			};
		};
	}
	else if(Nameless_Action==1)//PracticeSwd
	{

		
		if(Npc_GetDistToWP(self,"HC_PRACTICE7")<700)
		{
			if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+30+randomizer)
			{

				if (Npc_HasReadiedMeleeWeapon(self))
				{
					AI_RemoveWeapon(self);
				};
				when_nl_arrived_to_wp=0;
				GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;					
				return LOOP_END;
			};		
			if(!when_nl_arrived_to_wp)
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};
			if(!Npc_HasReadiedMeleeWeapon(self))
			{
				AI_ReadyMeleeWeapon(self);	
			};
			rand = Hlp_Random(10);
			if(rand > 8)
			{
				AI_PlayAni(self,"T_1HRUNSTRAFELTRAIN");
			}		
			else if(rand > 7)
			{
				AI_PlayAni(self,"T_1HRUNSTRAFERTRAIN");
			}		
			else if(rand > 6)
			{
				AI_PlayAni(self,"S_1HATTACKTRAIN");


			}		
			else if(rand > 5)
			{
				AI_PlayAni(self,"T_1HPARADE_O");

			}		
			else if(rand > 4)
			{
				AI_PlayAni(self,"T_1HPARADEJUMPB");

			}	
			else if(rand > 2)
			{
				AI_PlayAni(self,"T_1HATTACKL");
			}		
			else if(rand > 0)
			{
				AI_PlayAni(self,"T_1HATTACKR");
			}
			else
			{
				AI_PlayAni(self,"T_1HPARADEJUMPB");
			};	
		}
		else
		{
			AI_GotoWp(self,"HC_PRACTICE7");	
		};

		return LOOP_CONTINUE;   
		

	}	
	else if(Nameless_Action==2)//Stand(eat,drink)
	{

		
		if(Npc_GetDistToWP(self,"SIT_JIRHO")<400)
		{
			if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+10+randomizer)
			{

				when_nl_arrived_to_wp=0;
				GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;		
				
				return LOOP_END;
			};		
			if(!when_nl_arrived_to_wp)
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};

			
			rand = Hlp_Random(10);
			if(Npc_GetAivar(self,AIV_ITEMSTATUS))
			{
				B_ClearItem (self);	
				
			}
			else
			{
				if(rand > 8)
				{
					B_ChooseApple(self);
					AI_PlayAni (self,"T_FOOD_RANDOM_2");
					AI_PlayAni (self,"T_FOOD_RANDOM_1"); 
				}		
				else if(rand > 8)
				{
					B_ChooseLoaf(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
					AI_PlayAni (self,"T_POTION_RANDOM_2");
				}		
				else if(rand > 7)
				{
					B_ChooseCheese(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
				}		
				else if(rand > 6)
				{
					B_ChooseBeer(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}		
				else if(rand > 5)
				{
					B_ChooseJoint(self);
					AI_PlayAni (self,"T_JOINT_RANDOM_1");
				}		
				else if(rand > 4)
				{
					B_ChooseBooze(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}
				else
				{
					AI_Wait(self,2);
				};
			};	
		}
		else
		{
			AI_GotoWp(self,"SIT_JIRHO");	
			AI_AlignToWp(self);	
		};

		return LOOP_CONTINUE;   
		

	}	
	else if(Nameless_Action==3)//Stand(eat,drink)
	{

		
		if(Npc_GetDistToWP(self,"WARRIOR_BUTH")<400)
		{
			if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+10+randomizer)
			{

				when_nl_arrived_to_wp=0;
				GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;		
				
				return LOOP_END;
			};		
			if(!when_nl_arrived_to_wp)
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};

			
			rand = Hlp_Random(10);
			if(Npc_GetAivar(self,AIV_ITEMSTATUS))
			{
				B_ClearItem (self);	
				
			}
			else
			{
				if(rand > 8)
				{
					B_ChooseApple(self);
					AI_PlayAni (self,"T_FOOD_RANDOM_2");
					AI_PlayAni (self,"T_FOOD_RANDOM_1"); 
				}		
				else if(rand > 8)
				{
					B_ChooseLoaf(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
					AI_PlayAni (self,"T_POTION_RANDOM_2");
				}		
				else if(rand > 7)
				{
					B_ChooseCheese(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
				}		
				else if(rand > 6)
				{
					B_ChooseBeer(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}		
				else if(rand > 5)
				{
					B_ChooseJoint(self);
					AI_PlayAni (self,"T_JOINT_RANDOM_1");
				}		
				else if(rand > 4)
				{
					B_ChooseBooze(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}
				else
				{
					AI_Wait(self,2);
				};
			};	
		}
		else
		{
			AI_GotoWp(self,"WARRIOR_BUTH");	
			AI_AlignToWp(self);	
		};

		return LOOP_CONTINUE;   
		

	}	
	else if(Nameless_Action==4)//Stand(eat,drink)
	{

		
		if(Npc_GetDistToWP(self,"OW_CAVE2_SNAPPER_MOVEMENT")<400)
		{
			if (Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+10+randomizer)
			{

				when_nl_arrived_to_wp=0;
				GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;		
				
				return LOOP_END;
			};		
			if(!when_nl_arrived_to_wp)
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};

			
			rand = Hlp_Random(10);
			if(Npc_GetAivar(self,AIV_ITEMSTATUS))
			{
				B_ClearItem (self);	
				
			}
			else
			{
				if(rand > 8)
				{
					B_ChooseApple(self);
					AI_PlayAni (self,"T_FOOD_RANDOM_2");
					AI_PlayAni (self,"T_FOOD_RANDOM_1"); 
				}		
				else if(rand > 8)
				{
					B_ChooseLoaf(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
					AI_PlayAni (self,"T_POTION_RANDOM_2");
				}		
				else if(rand > 7)
				{
					B_ChooseCheese(self);
					AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
				}		
				else if(rand > 6)
				{
					B_ChooseBeer(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}		
				else if(rand > 5)
				{
					B_ChooseJoint(self);
					AI_PlayAni (self,"T_JOINT_RANDOM_1");
				}		
				else if(rand > 4)
				{
					B_ChooseBooze(self);
					AI_PlayAni (self,"T_POTION_RANDOM_3");
					AI_PlayAni (self,"T_POTION_RANDOM_1");
				}
				else
				{
					AI_Wait(self,2);
				};
			};	
		}
		else
		{
			AI_GotoWp(self,"OW_CAVE2_SNAPPER_MOVEMENT");	
			AI_AlignToWp(self);	
		};

		return LOOP_CONTINUE;   
		

	}	
	else if(Nameless_Action==5)//Explore(go&back)
	{
		AI_GotoWP(self,"HC_ARENA");
		GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
		return LOOP_END;
	}
	else if(Nameless_Action==6)//Talk with Quentin
	{


		if(Npc_GetDistToWP(self,"WP_QUENTIN_PRACTICE")<300)//HERO on WP
		{
			if(!when_nl_arrived_to_wp)//STORE STATE TIME
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};
			//Call Talker: QUENTIN
			if(Npc_GetDistToNPC(Quentin,self)>400)//||(!NPC_CanSeeNpc(Quentin,self))  
			{
				B_FullStop(Quentin);
				AI_GotoWp(Quentin,"WP_QUENTIN_PRACTICE");		
				AI_Dodge(Quentin);
				AI_TurnToNpc(self,Quentin);					
				AI_TurnToNpc(Quentin,self);	
				AI_Wait(Quentin,3);		
				AI_Wait(self,3);
				//ADD: AISTATE for talker
				AI_StartState(Quentin,ZS_NamelessTalk,1,"");	
				GLOBAL_NAMELESS_TALK=TRUE;	
			}
			else if(GLOBAL_NAMELESS_TALK)
			{
				//Start Talking	
				if(!NPC_CanSeeNpc(self,Quentin))  
				{
					AI_TurnToNpc(self,Quentin);									
				};
				
				
				arnd=Hlp_Random(16);	
				if(arnd==1){i_ani="01";}
				else if(arnd==2){i_ani="02";}
				else if(arnd==3){i_ani="03";}
				else if(arnd==4){i_ani="04";}
				else if(arnd==5){i_ani="05";}
				else if(arnd==6){i_ani="06";}
				else if(arnd==7){i_ani="07";}
				else if(arnd==8){i_ani="08";}
				else if(arnd==9){i_ani="09";}
				else if(arnd==10){i_ani="10";}
				else if(arnd==11){i_ani="11";}
				else if(arnd==12){i_ani="12";}
				else if(arnd==13){i_ani="13";}
				else if(arnd==14){i_ani="14";}
				else {i_ani="15";};
				
				rnd=Hlp_Random(4); rnd=rnd+2; f_rnd = IntToFloat(rnd);
				AI_Wait(self,f_rnd);
				//rnd ani
				
				AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
				
				
				
				//If Rick is near hero, stop talking
				if((Npc_GetDistToNPC(hero,self) < 400)&&(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+15))
				||(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+25+randomizer)
				{
					//END Talking
					GLOBAL_NAMELESS_TALK=FALSE;
					if(Npc_GetDistToNPC(hero,self) < 400)
					{
						AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));	
						if(randomizer>14)
						{
							introducechapter ("","","","INFO_JACKAL_HELLO_LATER_15_00.WAV", 0);	
						}
						else if(randomizer>9)
						{					
							introducechapter ("","","","DIA_SKIP_FIRST_BACK_15_00.WAV", 0);							
						}
						else if(randomizer>4)
						{					
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);							
						}
						else
						{
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);													
						};
						
						
					};
					GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
					return LOOP_END;
				}
				else
				{
					return LOOP_CONTINUE;   		
				};
			};
			
		}
		else //Hero isn't on wp - gotowp
		{
			AI_GotoWp(self,"WP_QUENTIN_PRACTICE");			
		};
		return LOOP_CONTINUE;   		
	}
	else if(Nameless_Action==7)//Talk with Drax
	{


		if(Npc_GetDistToWP(self,"HC_PRACTICE4")<300)//HERO on WP
		{
			if(!when_nl_arrived_to_wp)//STORE STATE TIME
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};
			//Call Talker: drax
			if(Npc_GetDistToNPC(drax,self)>400)||(!NPC_CanSeeNpc(drax,self))  
			{
				B_FullStop(drax);
				AI_GotoWp(drax,"HC_PRACTICE4");		
				AI_Dodge(drax);
				AI_TurnToNpc(self,drax);					
				AI_TurnToNpc(drax,self);	
				AI_Wait(drax,3);		
				AI_Wait(self,3);
				//ADD: AISTATE for talker
				AI_StartState(drax,ZS_NamelessTalk,1,"");	
				GLOBAL_NAMELESS_TALK=TRUE;	
			}
			else if(GLOBAL_NAMELESS_TALK)
			{
				//Start Talking	
				if(!NPC_CanSeeNpc(self,drax))  
				{
					AI_TurnToNpc(self,drax);									
				};
				
				
				arnd=Hlp_Random(16);	
				if(arnd==1){i_ani="01";}
				else if(arnd==2){i_ani="02";}
				else if(arnd==3){i_ani="03";}
				else if(arnd==4){i_ani="04";}
				else if(arnd==5){i_ani="05";}
				else if(arnd==6){i_ani="06";}
				else if(arnd==7){i_ani="07";}
				else if(arnd==8){i_ani="08";}
				else if(arnd==9){i_ani="09";}
				else if(arnd==10){i_ani="10";}
				else if(arnd==11){i_ani="11";}
				else if(arnd==12){i_ani="12";}
				else if(arnd==13){i_ani="13";}
				else if(arnd==14){i_ani="14";}
				else {i_ani="15";};
				
				rnd=Hlp_Random(4); rnd=rnd+2; f_rnd = IntToFloat(rnd);
				AI_Wait(self,f_rnd);
				//rnd ani
				
				AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
				
				
				
				//If Rick is near hero, stop talking
				if((Npc_GetDistToNPC(hero,self) < 400)&&(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+15))
				||(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+25+randomizer)
				{
					//END Talking
					GLOBAL_NAMELESS_TALK=FALSE;
					if(Npc_GetDistToNPC(hero,self) < 400)
					{
						AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));	
						if(randomizer>14)
						{
							introducechapter ("","","","INFO_JACKAL_HELLO_LATER_15_00.WAV", 0);	
						}
						else if(randomizer>9)
						{					
							introducechapter ("","","","DIA_SKIP_FIRST_BACK_15_00.WAV", 0);							
						}
						else if(randomizer>4)
						{					
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);							
						}
						else
						{
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);													
						};
						
						
					};
					GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
					return LOOP_END;
				}
				else
				{
					return LOOP_CONTINUE;   		
				};
			};
			
		}
		else //Hero isn't on wp - gotowp
		{
			AI_GotoWp(self,"HC_PRACTICE4");			
		};
		return LOOP_CONTINUE;   		
	}
	else if(Nameless_Action==8)//Talk with Milten
	{


		if(Npc_GetDistToWP(self,"HC_TOWER")<300)//HERO on WP
		{
			if(!when_nl_arrived_to_wp)//STORE STATE TIME
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
				//p/rint(concatstrings("Store Arrive Time= ",IntToString(when_nl_arrived_to_wp)));
			};
			//Call Talker: Milten
			if(Npc_GetDistToNPC(Milten,self)>400)||(!NPC_CanSeeNpc(Milten,self))  
			{
				B_FullStop(Milten);
				AI_GotoWp(Milten,"HC_TOWER");		
				AI_Dodge(Milten);
				AI_TurnToNpc(self,Milten);					
				AI_TurnToNpc(Milten,self);	
				AI_Wait(Milten,3);		
				AI_Wait(self,3);
				//ADD: AISTATE for talker
				AI_StartState(Milten,ZS_NamelessTalk,1,"");	
				GLOBAL_NAMELESS_TALK=TRUE;	
			}
			else if(GLOBAL_NAMELESS_TALK)
			{
				//Start Talking	
				if(!NPC_CanSeeNpc(self,Milten))  
				{
					AI_TurnToNpc(self,Milten);									
				};
				
				
				arnd=Hlp_Random(16);	
				if(arnd==1){i_ani="01";}
				else if(arnd==2){i_ani="02";}
				else if(arnd==3){i_ani="03";}
				else if(arnd==4){i_ani="04";}
				else if(arnd==5){i_ani="05";}
				else if(arnd==6){i_ani="06";}
				else if(arnd==7){i_ani="07";}
				else if(arnd==8){i_ani="08";}
				else if(arnd==9){i_ani="09";}
				else if(arnd==10){i_ani="10";}
				else if(arnd==11){i_ani="11";}
				else if(arnd==12){i_ani="12";}
				else if(arnd==13){i_ani="13";}
				else if(arnd==14){i_ani="14";}
				else {i_ani="15";};
				
				rnd=Hlp_Random(4); rnd=rnd+2; f_rnd = IntToFloat(rnd);
				AI_Wait(self,f_rnd);
				//rnd ani
				
				AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
				
				
				
				//If Rick is near hero, stop talking
				if((Npc_GetDistToNPC(hero,self) < 400)&&(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+15))
				||(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+25+randomizer)
				{
					//END Talking
					GLOBAL_NAMELESS_TALK=FALSE;
					if(Npc_GetDistToNPC(hero,self) < 400)
					{
						AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));	
						if(randomizer>14)
						{
							introducechapter ("","","","INFO_JACKAL_HELLO_LATER_15_00.WAV", 0);	
						}
						else if(randomizer>9)
						{					
							introducechapter ("","","","DIA_SKIP_FIRST_BACK_15_00.WAV", 0);							
						}
						else if(randomizer>4)
						{					
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);							
						}
						else
						{
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);													
						};
						
						
					};
					GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
					return LOOP_END;
				}
				else
				{
					return LOOP_CONTINUE;   		
				};
			};
			
		}
		else //Hero isn't on wp - gotowp
		{
			AI_GotoWp(self,"HC_TOWER");			
		};
		return LOOP_CONTINUE;   		
	}	
	else//Talk with FOX
	{


		if(Npc_GetDistToWP(self,"OW_SAWHUT_MOLERAT_SPAWN01_PATH2")<300)//HERO on WP
		{
			if(!when_nl_arrived_to_wp)//STORE STATE TIME
			{
				when_nl_arrived_to_wp=Npc_GetStateTime(self);
			};
			//Call Talker: Fox
			if(Npc_GetDistToNPC(fox,self)>400)||(!NPC_CanSeeNpc(fox,self))  
			{
				B_FullStop(fox);
				AI_GotoWp(fox,"OW_SAWHUT_MOLERAT_SPAWN01_PATH2");		
				AI_Dodge(fox);
				AI_TurnToNpc(self,fox);					
				AI_TurnToNpc(fox,self);	
				AI_Wait(fox,3);		
				AI_Wait(self,3);
				//ADD: AISTATE for talker
				AI_StartState(fox,ZS_NamelessTalk,1,"");	
				GLOBAL_NAMELESS_TALK=TRUE;	
			}
			else if(GLOBAL_NAMELESS_TALK)
			{
				//Start Talking	
				if(!NPC_CanSeeNpc(self,fox))  
				{
					AI_TurnToNpc(self,fox);									
				};
				
				
				arnd=Hlp_Random(16);	
				if(arnd==1){i_ani="01";}
				else if(arnd==2){i_ani="02";}
				else if(arnd==3){i_ani="03";}
				else if(arnd==4){i_ani="04";}
				else if(arnd==5){i_ani="05";}
				else if(arnd==6){i_ani="06";}
				else if(arnd==7){i_ani="07";}
				else if(arnd==8){i_ani="08";}
				else if(arnd==9){i_ani="09";}
				else if(arnd==10){i_ani="10";}
				else if(arnd==11){i_ani="11";}
				else if(arnd==12){i_ani="12";}
				else if(arnd==13){i_ani="13";}
				else if(arnd==14){i_ani="14";}
				else {i_ani="15";};
				
				rnd=Hlp_Random(4); rnd=rnd+2; f_rnd = IntToFloat(rnd);
				AI_Wait(self,f_rnd);
				//rnd ani
				
				AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));
				
				
				
				//If Rick is near hero, stop talking
				if((Npc_GetDistToNPC(hero,self) < 400)&&(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+15))
				||(Npc_GetStateTime ( self ) >= when_nl_arrived_to_wp+25+randomizer)
				{
					//END Talking
					GLOBAL_NAMELESS_TALK=FALSE;
					if(Npc_GetDistToNPC(hero,self) < 400)
					{
						AI_PlayAni(self,concatstrings("T_DIALOGGESTURE_",i_ani/*,inttostring(rnd2))*/));	
						if(randomizer>14)
						{
							introducechapter ("","","","INFO_JACKAL_HELLO_LATER_15_00.WAV", 0);	
						}
						else if(randomizer>9)
						{					
							introducechapter ("","","","DIA_SKIP_FIRST_BACK_15_00.WAV", 0);							
						}
						else if(randomizer>4)
						{					
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);							
						}
						else
						{
							introducechapter ("","","","INFO_EXIT_INFO_15_001.WAV", 0);													
						};
						
						
					};
					GLOBAL_NAMELESS_ACTION_DISTURBED=FALSE;	
					return LOOP_END;
				}
				else
				{
					return LOOP_CONTINUE;   		
				};
			};
			
		}
		else //Hero isn't on wp - gotowp
		{
			AI_GotoWp(self,"OW_SAWHUT_MOLERAT_SPAWN01_PATH2");			
		};
		return LOOP_CONTINUE;   		
	};		


};

func void ZS_NamelessHangAround_End ()
{
	
	//PrintDebugNpc(PD_TA_FRAME,"ZS_NamelessHangAround_End");
};

