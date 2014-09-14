//Events in World.zen

var int Hrabia_orn3;
var int Roderic_axe_not_found;
var int Rick_wants_to_sleep;
const int NumberSecondsToDreamSleep = 60;

func void TimeEventsWorldZen()
{
	if (WORLD_CURRENT == WORLD_WORLDZEN)
	{
		if(TONY_HELP_CINEMATIC_TRIGGERED==1)&&(Npc_GetDistToWp(hero, "OW_PATH_166")<250)
		{
			TONY_HELP_CINEMATIC_TRIGGERED=2;
			Wld_SendUnTrigger("CINEMATIC_LITTLEWALK_CAM");
			B_ExchangeRoutine(tony, "TALKTOHERO");
			AI_SetWalkmode(tony, NPC_RUN);
		};
		
		if(hero_is_in_kevin_room_ontime==1)
		{
			if((npc_HasItems(hero, kevin_diary)+npc_HasItems(hero, ITKE_STORAGE_01)+npc_HasItems(hero, ITKE_GOMEZ_01))>=3)
			{
				B_Story_OldCampKevinFounded();
				hero_is_in_kevin_room_ontime=2;
			};
		};

		if (isOpenedGateOC && npc_getdisttowp(hero, "OCR_MAINGATE_SQUARE") < 700)
		{
			B_ExchangeRoutine(grd_230, "start");
			isOpenedGateOC = false;
			Wld_SendTrigger("EVT_OC_MAINGATE01_01");
		};

		if (npc_getdisttowp(hero, "HIDDEN_IN") < 500 && (Npc_KnowsInfo(hero, DIA_Urt_Kelvin)))
		{
			AI_Teleport(hero, "HIDDEOUT1");
			
			PrintScreen("Uciek³eœ z zamku!",-1,-1,"font_old_20_white.tga",3);
		};

		if (npc_getdisttowp(hero, "HIDDEN_OUT") < 500 && (Npc_KnowsInfo(hero, DIA_Urt_Kelvin)))
		{
			AI_Teleport(hero, "HIDDEOUT10");
			
			PrintScreen("Wróci³eœ do zamku!",-1,-1,"font_old_20_white.tga",3);
		};

		if ((Tondral_death > 0) && InfoManager_HasFinished())
		{
			if (Tondral_death == 1)
			{   
				AI_GotoWP(tondral, "PSI_TEMPLE_IN_1");
				B_ExchangeRoutine(tondral, "GoToDeath");
				Wld_InsertNpc(Zombie, "PSI_TEMPLE_IN_1"); 
				
				Tondral_death = 2;
			}
			else if (Tondral_death < 40)
			{
				Tondral_death+=1;
			}
			else if (Tondral_death == 40)
			{
				B_FullStop(tondral);
				AI_Teleport(tondral, "PSI_TEMPLE_IN_1");
				Tondral_death+=1;
			}
			else if ((Tondral_death == 41) && npc_getdisttowp(tondral, "PSI_TEMPLE_IN_1") < 200)
			{ 
				tondral.ATTRIBUTE[ATR_HITPOINTS] = 0;
				Tondral_death = false;
			};
		};

		if (Lester_butcher && InfoManager_HasFinished())
		{
			AI_GotoWP(lester, "PSI_TEMPLE_IN_1");
			AI_AlignToWP(lester);
			AI_PlayAni(lester, "T_PLUNDER");
			
			Lester_butcher = false;
		};

		if (Leren_teleport_after_ritual && InfoManager_HasFinished())
		{
			Leren_teleport_after_ritual = false;
			Snd_Play("MFX_Teleport_Cast");
			AI_Teleport(leren, "HC_BRIDGE_ON");
		};

		if (Necro_teleport_after_deaths_beast && InfoManager_HasFinished())
		{
			B_FullStop(necro_in_world);
			Necro_teleport_after_deaths_beast = false;
			Snd_Play("MFX_Teleport_Cast");
			AI_Teleport(necro_in_world, "INVISIBLE");
		};
		
		if (Necro_teleport_on_ritual)
		{
			Necro_teleport_on_ritual = false;
			B_ExchangeRoutine	(necro_in_world, "RITUAL");
			AI_Teleport(necro_in_world, "PATH_NEW_AROUND_PSI25");
		};

		if (Xardas_teleport_after_ritual && InfoManager_HasFinished())
		{
			var c_npc xardas;
			xardas = Hlp_GetNpc(KDF_404_Xardas);
			Xardas_teleport_after_ritual = false;
			Snd_Play("MFX_Teleport_Cast");
			AI_Teleport(xardas, "DT_E3_07");
		};

		if (Raven_teleport_to_EN && InfoManager_HasFinished())
		{
			B_teleport_Raven();
			
			Raven_teleport_to_EN = false;
		};

		if (Raven_teleport_to_hidden && InfoManager_HasFinished())
		{	
			Raven_teleport_to_hidden = false;
			
			Snd_Play("MFX_Teleport_Cast");
			AI_Teleport(raven, "WP_INTRO_WI01");
		};

		if ((Hrabia_teleport == 1) && InfoManager_HasFinished())
		{
			Npc_ClearAIQueue(hrabia);
			AI_Teleport(hrabia, "OC1");
			
			Hrabia_teleport+=1;
		}
		else if (Hrabia_teleport == 2)
		{
			AI_Teleport(grd_2514, "OC1"); 
			AI_Teleport(grd_2515, "OC1");
			AI_Teleport(grd_2516, "OC1"); 
			AI_Teleport(grd_2517, "OC1"); 
			AI_Teleport(grd_2518, "OC1"); 
			
			Hrabia_teleport+=1;
		}
		else if (Hrabia_teleport == 3)
		{
			Hrabia_teleport = false;
			B_CHANGEGUILD(Grd_2513_Kasacz, GIL_DMB);
			
			B_ExchangeRoutine(kasacz, "ATTACK");
			Npc_SetPermAttitude(kasacz, ATT_HOSTILE);	
		};

		if ((Saturas_saves_Rick == 1) && InfoManager_HasFinished())
		{
			AI_Teleport(hero, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");

			Npc_ExchangeRoutine(hrabia, "HIDE");
			Npc_ExchangeRoutine(grd_2514, "HIDE");
			Npc_ExchangeRoutine(grd_2515, "HIDE");
			Npc_ExchangeRoutine(grd_2516, "HIDE");
			Npc_ExchangeRoutine(grd_2517, "HIDE");
			Npc_ExchangeRoutine(grd_2518, "HIDE");
			Npc_ExchangeRoutine(wegorz, "HIDE");
			
			Saturas_saves_Rick = false;
		};
		
		if ((Saturas_saves_Rick == 2) && InfoManager_HasFinished())
		{
			AI_Teleport(hero, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
			
			Saturas_saves_Rick = false;
		};
		
		if (Rick_goesTo_freemine && InfoManager_HasFinished())
		{
			Rick_goesTo_freemine = false;
			
			AI_GotoWP(hero, "FM_ENTRANCE_02");
			Wld_InsertNpc(Grd_4089_Bern, "FMC_PATH18"); //Nowy stra¿nik na miejsce Carlosa przed kopalni¹
		};
		
		if (Npc_HasItems(hero, orn3) && (!Hrabia_orn3))
		{
			B_ExchangeRoutine(hrabia, "OR3");
			AI_Teleport(hrabia, "NEWPATH_4"); 
			Hrabia_orn3 = true;
		};

		if(Mis_TeleportEarl == 11)//For real it been used by diego teleport (at first it sets varible to 10
		{
			var c_npc a; a = Hlp_GetNpc(PC_THIEF);
			Npc_ClearAiQueue(a);
			AI_Teleport(a, "OCC_CHAPEL_UPSTAIRS");
			Snd_Play("MFX_TELEPORT_CAST");
			Mis_TeleportEarl = 0;
		}
		else if(Mis_TeleportEarl)
		{
			Mis_TeleportEarl = Mis_TeleportEarl + 1;
		};

		if(Story_RickSentry_MisState == 1)
		{
			B_Story_RickOnSentry();
		};

		if(Mis_Pacho_ChestOpened) && (Npc_HasItems(hero, gomez_mirror)) && (Npc_HasItems(hero, itminugget) >= 500)
		{
			//spawn_hrabia or scorpio
			Mis_PachoSplit = TRUE;
		};

		if(B_AfterDialog_Pacho_ScorpioCam_disabled == 2)
		{
			B_AfterDialog_Pacho_ScorpioCam_disabled = 3;
			Wld_SendTrigger("CAM_TREASURE_SCORPIO");      
		}   
		else if(B_AfterDialog_Pacho_ScorpioCam_disabled == 1)
		{
			B_AfterDialog_Pacho_ScorpioCam_disabled = 2;
		};

		if(B_AfterDialog_Pacho_EarlCamPrepare_disabled == 4)
		{
			B_AfterDialog_Pacho_EarlCamPrepare_disabled = 5;
			Wld_SendTrigger("CAM_TREASURE_EARL");   
		}   
		else if(B_AfterDialog_Pacho_EarlCamPrepare_disabled == 1) || (B_AfterDialog_Pacho_EarlCamPrepare_disabled == 2)
			|| (B_AfterDialog_Pacho_EarlCamPrepare_disabled == 3)
		{
			B_AfterDialog_Pacho_EarlCamPrepare_disabled+=1;
		};

		if (Npc_HasItems(hero, GhostAxe1_RICK) && (!Roderic_axe_not_found))
		{
			B_LogEntry(CH3_RBL_RodneyHelp, "Znalaz³em topór Roderika. Czas odnieœæ duchowi topór.");
			
			Roderic_axe_not_found = 1;
		};

		if ((npc_getdisttowp(hero, "OW_PATH_227_IN2") < 500) && (Know_DrunkmanSecret == true))
		{
			Know_DrunkmanSecret = 2;
			PrintScreen("Znalaz³eœ bimbrowniê Piwosza!",-1,-1,"font_old_20_white.tga",3);
			
			B_GiveXP(100);
			
			B_LogSetTopicStatus(CH2_RBL_DrunkmanSecret, LOG_SUCCESS);
			B_LogEntry(CH2_RBL_DrunkmanSecret, "Znalaz³em bimbrownie Piwosza! SprawdŸmy, co tu ukrywa...");
		};

		if (Black_mag_arrived == 1)
		{
			B_insert_necros_servants();
		};
		
		if ((Raven_fights_Rick)&&(raven.attribute[ATR_HITPOINTS] <= raven.attribute[ATR_HITPOINTS_MAX]/5))
		{
			B_FullStop(raven);
			Raven_fights_Rick = false;
		};
		
		if(MIS_Katrakanat_pieces_collected < 6)
		{    
			if(Npc_HasItems(hero, Katrakanat_piece))&&(!MIS_Katrakanat_piece1_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece1_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};
			
			if(Npc_HasItems(hero, Katrakanat_piece2))&&(!MIS_Katrakanat_piece2_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece2_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};
			
			if(Npc_HasItems(hero, Katrakanat_piece3))&&(!MIS_Katrakanat_piece3_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece3_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};
			
			if(Npc_HasItems(hero, Katrakanat_piece4))&&(!MIS_Katrakanat_piece4_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece4_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};
			
			if(Npc_HasItems(hero, Katrakanat_piece5))&&(!MIS_Katrakanat_piece5_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece5_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};
			
			if(Npc_HasItems(hero, Katrakanat_piece6))&&(!MIS_Katrakanat_piece6_collected)
			{
				MIS_Katrakanat_pieces_collected+=1;
				MIS_Katrakanat_piece6_collected=1;
				B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
			};                     
		};

		if(MIS_Tritetra_on)
		{
			if(MIS_Tritetra_innos_pieces < Npc_HasItems(hero, tri_innos_statue))
			{
				Wld_PlayEffect("spellFX_Mis_tritera_Innos_I", hero, hero, 0, 0, 0, FALSE);
			};
			
			if(MIS_Tritetra_adanos_pieces < Npc_HasItems(hero, tri_adan_statue))
			{
				Wld_PlayEffect("spellFX_Mis_tritera_Adanos_I", hero, hero, 0, 0, 0, FALSE);
			};
			
			if(MIS_Tritetra_beliar_pieces < Npc_HasItems(hero, tri_beliar_statue))
			{
				Wld_PlayEffect("spellFX_Mis_tritera_Beliar_I",  hero, hero, 0, 0, 0, FALSE);
			};
			
			MIS_Tritetra_innos_pieces = Npc_HasItems(hero, tri_innos_statue);
			MIS_Tritetra_adanos_pieces = Npc_HasItems(hero, tri_adan_statue);
			MIS_Tritetra_beliar_pieces = Npc_HasItems(hero, tri_beliar_statue);
			
			if(MIS_Tritetra_innos_pieces)
			{
				MIS_Tritetra_innos_counter = MIS_Tritetra_innos_counter + 1;
				
				if(MIS_Tritetra_innos_counter - ((MIS_Tritetra_innos_pieces * 15) + (MIS_Tritetra_beliar_pieces * 15)) >= MIS_Tritetra_innos_counter_max)
				{
					MIS_Tritetra_innos_counter = 0;
					MIS_Tritetra_innos_counter_max = Hlp_Random(60) + 11;
					Wld_SpawnNpcRange(hero, Wisp_Fire, 1, 1000);
				};
			};
			if(MIS_Tritetra_adanos_pieces)
			{
				MIS_Tritetra_adanos_counter = MIS_Tritetra_adanos_counter + 1;  
				
				if(MIS_Tritetra_adanos_pieces == 2)
				{
					MIS_Tritetra_adanos_counter = MIS_Tritetra_adanos_counter + 1;
					
					if(MIS_Tritetra_adanos_counter >= MIS_Tritetra_adanos_counter_max)
					{
						MIS_Tritetra_adanos_counter = 0;
						MIS_Tritetra_adanos_counter_max = Hlp_Random(60) + 11;
						Wld_SpawnNpcRange(hero, B_GetMonsterAbove10lvl(), 1 + Hlp_Random(3), 500);
					}   
					else if(MIS_Tritetra_adanos_counter == MIS_Tritetra_adanos_counter_max - 10)
					{
						Wld_PlayEffect("spellFX_Mis_tritera_Adanos_Curse", hero, hero, 1, 5,DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
						B_FullStop(hero);
						Npc_ClearAIQueue(hero);      
						AI_PlayAniBS(hero, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);      
						AI_Wait(hero, 5);
						AI_PlayAni(hero, "T_STUMBLE");
					};         
				}
				else if(MIS_Tritetra_adanos_counter - ((MIS_Tritetra_innos_pieces * 10) + (MIS_Tritetra_beliar_pieces * 10)) >= MIS_Tritetra_adanos_counter_max)
				{
					MIS_Tritetra_adanos_counter = 0;
					MIS_Tritetra_adanos_counter_max = Hlp_Random(40) + 11;
					Wld_PlayEffect("spellFX_Mis_tritera_Adanos_Curse", hero, hero, 1, 5, DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
					B_FullStop(hero);
					Npc_ClearAIQueue(hero);      
					AI_PlayAniBS(hero, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);      
					AI_Wait(hero, 5);
					AI_PlayAni(hero, "T_STUMBLE");
				};         
			};
			
			if(MIS_Tritetra_beliar_pieces)
			{
				MIS_Tritetra_beliar_counter = MIS_Tritetra_beliar_counter + 1;
				
				if(MIS_Tritetra_beliar_counter - (MIS_Tritetra_innos_pieces + MIS_Tritetra_adanos_pieces) >= 3)
				{
					MIS_Tritetra_beliar_counter = 0;
					B_ChangeAttribute(hero, ATR_HITPOINTS, -2);
				};         
			};
		};
		
		if(OR_PREALARM > 0)&&(OR_PREALARM < 76)
		{
			if(Npc_GetAivar(hero, AIV_INVINCIBLE) == FALSE)
			{   
				OR_PREALARM = OR_PREALARM + 1;
			};
			
			if(OR_PREALARM == 4)
			{
				OR_PREALARM = 0;
				GrdAttackNow = 1;
				GRDAttackWP = "OW_PATH_OC_NC8";
				B_Story_Alarm(GRDAttackWP);   
			};
		};

		if(OR_ATTACKED >= 2)&&(OR_ATTACKED < 76)
		{
			if(OR_ATTACKED == 2)
			{
				Wld_SendTrigger("PREATTACK_CAM");//Camera starts   
			};        
			
			OR_ATTACKED = OR_ATTACKED + 1;   
			
			if(OR_ATTACKED > 3)
			{
				if(OR_ATTACKED == 5)   
				{
					AddGrdDificult1st = 0;
					B_INITInsertGrds();   
				}
				else if(OR_ATTACKED == 7)
				{
					B_Story_Alarm(GRDAttackWP);//Refresh rbl's
				};
				
				if(OR_ATTACKED == 31)
				{
					if(kira_help == 1)
					{
						var ocnpc npc;
						a = Hlp_GetNpc(Non_4020_Tablor); 
						npc = Hlp_GetNpc(Non_4020_Tablor);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4021_Bukhart); 
						npc = Hlp_GetNpc(Non_4021_Bukhart);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4022_Postronek); 
						npc = Hlp_GetNpc(Non_4022_Postronek);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4023_Korth); 
						npc = Hlp_GetNpc(Non_4023_Korth);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4024_Snow); 
						npc = Hlp_GetNpc(Non_4024_Snow);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4025_Kron); 
						npc = Hlp_GetNpc(Non_4025_Kron);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4026_Nikolas); 
						npc = Hlp_GetNpc(Non_4026_Nikolas);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
						a = Hlp_GetNpc(Non_4027_Kira); 
						npc = Hlp_GetNpc(Non_4027_Kira);
						npc._zCVob_type = 2; 
						Npc_ExchangeRoutine(a, "EnforceOR");
					};
				}
				//       else if(OR_ATTACKED==30)
				//       {

				//       Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				//       Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				//       Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				//       Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				//       Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				//       GrdsInAttack = GrdsInAttack+5;

				//          
				//       }
				else if(OR_ATTACKED == 44)
				{
					//          a = Hlp_GetNpc(hun_818_ratford);       
					//          Npc_ExchangeRoutine(a,"Alarm2");
					//          if(Know_Gestath == TRUE)
					//          {
					//             a = Hlp_GetNpc(HUN_2609_Gestath);       
					//             Npc_ExchangeRoutine(a,"Alarm2");
					//          };   
					//          a = Hlp_GetNpc(HUN_2615_Abel);       
					//          Npc_ExchangeRoutine(a,"Alarm2");
					//          a = Hlp_GetNpc(PIR_2600_Angus);       
					//          Npc_ExchangeRoutine(a,"Alarm2");
					//          a = Hlp_GetNpc(HUN_336_Cavalorn);       
					//          Npc_ExchangeRoutine(a,"Alarm2");
					//          a = Hlp_GetNpc(PIR_2612_JackAlligator);       
					//          Npc_ExchangeRoutine(a,"Alarm2");               
				}
				else if(OR_ATTACKED == 48)
				{
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack + 3;
					
					if(kira_help)
					{
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						GrdsInAttack = GrdsInAttack + 1;   
					};   
				}
				else if(OR_ATTACKED == 60)
				{
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack + 3;
				}   
				else if(OR_ATTACKED == 64)
				{
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack + 2;
				}
				else if(OR_ATTACKED == 70)
				{
					Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack + 1;
					
					if(kira_help)
					{
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						GrdsInAttack = GrdsInAttack + 4;   
					};
				}
				else if(OR_ATTACKED == 75)
				{
					if(!kira_help)
					{
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						Wld_InsertNpc(GRD_2770_Guard, "CROSSING_PATH_2_3_4");
						GrdsInAttack = GrdsInAttack + 4;
					};
				};
			};
		};

		if (DreamID == DREAM_BLOODYSWAMP) && (Rick_wants_to_sleep < NumberSecondsToDreamSleep)
		{
			Rick_wants_to_sleep+=1;
			
			if (Rick_wants_to_sleep == NumberSecondsToDreamSleep/4)
			{
				PutMsg("Spaæ! Chcê spaæ!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
			};
			
			if (Rick_wants_to_sleep == NumberSecondsToDreamSleep/2)
			{
				PutMsg("Po³ó¿ siê spaæ!","font_default.tga",RGBAToZColor(255,128,55,255),_TIME_MESSAGE_LOGENTRY,"");
			};
			
			if (Rick_wants_to_sleep == NumberSecondsToDreamSleep - 3)
			{
				PutMsg("Œpij na ziemi!","font_default.tga",RGBAToZColor(255,55,55,255),_TIME_MESSAGE_LOGENTRY,"");
				B_FullStop(hero);
				AI_PlayAni(hero,"T_BEDLOW_FRONT_STAND_2_S0");	
				AI_PlayAni(hero,"T_BEDLOW_FRONT_S0_2_S1");				
			};
			
			if (Rick_wants_to_sleep == NumberSecondsToDreamSleep)
			{	
				Dream_StartUp(DreamID);
				SleepFX_PerFrameHandle();
			};
		};
		
		if (removeNamelessFromWorldZen)
		{
			removeNamelessFromWorldZen = false;
			var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeet);
			AI_Teleport(nameless, "INVISIBLE");
			Npc_ExchangeRoutine(nameless, "INVISIBLE");
		};
	};
};
