/////////////////////
var C_Item readyweap;
var C_Item equipweap;
/////////////////////
var int TRIG_LOOPS;
/////////////////////
var int DualWasEquiped;
var int DualWasReadied; 
var int Hrabia_orn3;
//var int teleport_to_temple;

func void Am_EquipAnyAmunition(var int type)
{
	//p/rint("Am_EquipAnyAmunition");
	if(type==0)
	{
		if(Npc_HasItems(hero,ItAmArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmArrow);
			A_munition=A_POINT;
		}
		else if(Npc_HasItems(hero,ItAmArrow_15)>0)
		{
			Npc_GetInvItem(hero,ItAmArrow_15);
			A_munition=A_POINT_15;
		}
		else if(Npc_HasItems(hero,ItAmArrow_25)>0)   
		{
			Npc_GetInvItem(hero,ItAmArrow_25);
			A_munition=A_POINT_25;
		}         
		else if(Npc_HasItems(hero,ItAmBluntArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmBluntArrow);
			A_munition=A_BLUNT;
		}               
		else if(Npc_HasItems(hero,ItAmFireArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmFireArrow);
			A_munition=A_FIRE;
		}
		else if(Npc_HasItems(hero,ItAmPoisonArrow)>0)   
		{
			Npc_GetInvItem(hero,ItAmPoisonArrow);
			A_munition=A_POISON;
		}   
		else if(Npc_HasItems(hero,ItAmIceArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmIceArrow);
			A_munition=A_ICE;
		};      
	}
	else
	{
		if(Npc_HasItems(hero,ItAmBolt)>0)
		{
			Npc_GetInvItem(hero,ItAmBolt);
			B_munition=B_POINT;
		}
		else if(Npc_HasItems(hero,ItAmBolt_10)>0)   
		{
			Npc_GetInvItem(hero,ItAmBolt_10);
			B_munition=B_POINT_10;
		}
		else if(Npc_HasItems(hero,ItAmBolt_25)>0)      
		{
			Npc_GetInvItem(hero,ItAmBolt_25);
			B_munition=B_POINT_25;
		}         
		else if(Npc_HasItems(hero,ItAmBluntBolt)>0)   
		{
			Npc_GetInvItem(hero,ItAmBluntBolt);
			B_munition=B_BLUNT;
		}               
		else if(Npc_HasItems(hero,ItAmFireBolt)>0)   
		{
			Npc_GetInvItem(hero,ItAmFireBolt);
			B_munition=B_FIRE;
		}
		else if(Npc_HasItems(hero,ItAmPoisonBolt)>0)      
		{
			Npc_GetInvItem(hero,ItAmPoisonBolt);
			B_munition=B_POISON;
		}   
		else if(Npc_HasItems(hero,ItAmIceBolt)>0)
		{
			Npc_GetInvItem(hero,ItAmIceBolt);
			B_munition=B_ICE;
		};
	};

	item.flags=item.flags | 1 << 30;
};

func int Check_Amunition(var int item_instance)
{
	if(Npc_HasItems(hero, item_instance))
	{
		Npc_GetInvItem(hero, item_instance);
		
		if (!C_ItmHasFlag(item,ITEM_EQUIPED))
		{
			item.flags=item.flags | 1 << 30;
			
			return 1;
		};
	};

	return 0;
};

Func void Am_CheckequipedAmmunition(var int type)
{
	var int a; var int amunition_inhand; var c_item readyweap; var int itm_id;
	//BUGFIX
	//       P/rint(concatstrings("A_Munition == ",inttostring(A_Munition)));
	//       P/rint(concatstrings("item.Munition == ",inttostring(readyweap.munition)));
	//Item munition changes in second cycle, A_Munition in first
	//Seting of item.munition/damage etc by direct call from amunition use
	if(Npc_HasReadiedRangedWeapon(hero))
	{
		readyweap = Npc_GetReadiedWeapon(hero);
		
		if(readyweap.makingmob==type+1)
		{
			if(B_HasReadiedRangedWeaponWithAmmo(hero))
			//maybe problem is item.munition differ from A_Munition etc.
			{
				amunition_inhand = TRUE;
			};  
		};
	};

	if(type==0)
	{
		if (A_munition==A_POINT)
		{
			a = Check_Amunition(ItAmArrow);
		}
		else if (A_munition==A_POINT_15)
		{
			a = Check_Amunition(ItAmArrow_15);
		}
		else if (A_munition==A_POINT_25)
		{
			a = Check_Amunition(ItAmArrow_25);
		} 
		else if (A_munition==A_BLUNT)
		{
			a = Check_Amunition(ItAmBluntArrow);
		}  
		else if (A_munition==A_FIRE)
		{
			a = Check_Amunition(ItAmFireArrow);
		} 
		else if (A_munition==A_POISON)
		{
			a = Check_Amunition(ItAmPoisonArrow);
		} 
		else if (A_munition==A_ICE)
		{
			a = Check_Amunition(ItAmIceArrow);
		};                                                                                                                     
	}
	else
	{
		if (B_munition==B_POINT)
		{
			a = Check_Amunition(ItAmBolt);
		}
		else if (B_munition==B_POINT_10)
		{
			a = Check_Amunition(ItAmBolt_10);
		}
		else if (B_munition==B_POINT_25)
		{
			a = Check_Amunition(ItAmBolt_25);
		} 
		else if (B_munition==B_BLUNT)
		{
			a = Check_Amunition(ItAmBluntBolt);
		}  
		else if (B_munition==B_FIRE)
		{
			a = Check_Amunition(ItAmFireBolt);
		} 
		else if (B_munition==B_POISON)
		{
			a = Check_Amunition(ItAmPoisonBolt);
		} 
		else if (B_munition==A_ICE)
		{
			a = Check_Amunition(ItAmIceBolt);
		};
	};
};

func void Am_EventCheck()
{   
	//AMUNITION TRIGGER
	var C_ITEM EqRanWeap;
	var C_ITEM ReadyRanWeap;
	//AMU CHANGED BY KEY stop handling amunition till it be changed
	if(KeyAmunitionChange)
	{
		return;
	};

	Am_CheckequipedAmmunition(0);
	Am_CheckequipedAmmunition(1);

	if(Npc_HasEquippedRangedWeapon(hero))
	{   
		EqRanWeap = Npc_GetEquippedRangedWeapon(hero);
		A_CheckMunition(EqRanWeap,EqRanWeap.makingmob%2);
	};

	if(Npc_HasReadiedRangedWeapon(hero))
	{
		ReadyRanWeap = Npc_GetReadiedWeapon(hero);
		A_CheckMunition(ReadyRanWeap,EqRanWeap.makingmob%2);
	};

	//       else if(Last_A_munition==A_munition)//No amunition
	//       {   
	//          //      p/rint("no-amunition");
	//          if(Npc_HasReadiedRangedWeapon(hero))
	//          {
	//          };
	//       };

	//       if(Last_B_munition==B_munition)
	//       {
	//       };   
	Last_A_munition=A_munition;
	Last_B_munition=B_munition;   
};

func void Dual_BugFix()
{
	if((RSWD_ID!=0)&&(LSWD_ID!=0))&&(Npc_HasReadiedMeleeWeapon(hero))
	{
		DualBugfix=TRUE;
	};
	//---------------------
	// SWIM/DIVE BUGFIX
	//---------------------
	//   p/rint(IntToString(Npc_GetBodyState(hero)));
	if((Npc_GetBodyState(hero)==5)||(Npc_GetBodyState(hero)==6)||(Npc_GetBodyState(hero)==7))&&(DualWasEquiped)&&(DualWasReadied)&&(!Npc_HasReadiedMeleeWeapon(hero))
	{
		B_PrintDebug("FIX");
		AI_PlayAni(hero, "S_DUALBUGFIX_SWIM");
	};

	DualWasEquiped = DualEquiped; DualWasReadied = Npc_HasReadiedMeleeWeapon(hero);
	// P/RINT(ConcatStrings("LastEquipedWeaponIsDual=",IntToString(LastEquipedWeaponIsDual)));
};

func void ReceptReadBugfix()
{
	if(PRINTNEEDITEMS)
	{
		R_GetItem(recept_inuse);            
		EVT_RECIPEREAD();
	};
};

func void Tal_Regeneration()
{
	//mp
	if(hero.attribute[ATR_MANA]+Npc_GetTalentValue(hero,NPC_TALENT_REGEN_MP)>hero.attribute[ATR_MANA_MAX])
	{
		hero.attribute[ATR_MANA]=hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		hero.attribute[ATR_MANA]+=Npc_GetTalentValue(hero,NPC_TALENT_REGEN_MP);
	};   
	//hp
	if(hero.attribute[ATR_HITPOINTS]<2)||(!Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP))//dead or unconscious
	{ 
		return; 
	};

	if(hero.attribute[ATR_HITPOINTS]+Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP)>hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS]=hero.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		hero.attribute[ATR_HITPOINTS]+=Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP);
	};
};

func void B_CheckGuider()
{
	/*    if (!Npc_IsInState(guider,ZS_WoodWalking))
{
	if (Npc_GetAivar(hero,AIV_ASKINGABOUTHUNTING) == 3)
	{
		Npc_SetAivar(hero,AIV_ASKINGABOUTHUNTING,  0);
		Npc_SetAivar(hero,AIV_HUNTINGINPACK,  0);
	};
	Npc_SetAivar(guider,AIV_HUNTING,  0);
	Npc_SetAivar(hunter1,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter2,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter3,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter4,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter5,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter6,AIV_HUNTINGINPACK,  0);
	GuiderIsVaild = FALSE;
	Npc_SetAivar(guider,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter1,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter2,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter3,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter4,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter5,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter6,AIV_PARTYMEMBER,  0);   
	PrintScreen           ("Guider nie poluje",76,65,"FONT_OLD_10_WHITE.TGA",1);
}
else
{
	Wld_SendTrigger ("EVT_TRIGGER2");
}; */
};
//////////////////////////////////////////////////////////////////////
FUNC VOID EVT_TIMEGRD_START ()
{
	B_TimeChallenge();//Challengefunc
};

FUNC VOID EVT_HELLOSAY ()
{   
	PrintDebug         ("B_CheckHello");   
	var int TRGT;
	TRGT = Npc_GetTarget(hero);
	B_CheckHello(other);
	//   PrintScreen      ("Czas Zap³aty 0.4b", -1,85,"font_old_10_white.tga",2);
	//   PrintScreen      ("(c) The Modders", -1,90,"font_old_10_white.tga",2);
};

FUNC VOID EVT_TRIGGER1 ()
{   
	B_StoryChangeDay();
};

FUNC VOID EVT_TRIGGER4 ()
{
	var int waittime;
	CONST INT LAB_USE_TIME = 25/2;
	if(CreationMethod == R_MOB_CAULDRON){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_BS){waittime=(R_CreateColdown*2)/7;}
	else if(CreationMethod == R_BS_ANVIL){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_BS_FIRE){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_HERB_PSI){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_MOB_PAN){waittime=R_CreateColdown*itemtocreate;}   
	else if(CreationMethod == R_LAB_PSI){waittime=LAB_USE_TIME*itemtocreate;};         
	if(TRIG_FIRST_SEND){TRIG_LOOPS=1;TRIG_FIRST_SEND=FALSE;}
	else{TRIG_LOOPS=TRIG_LOOPS+1;};

	if(TRIG_LOOPS >= waittime)
	{
		Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
		R_GetItem(recept_inuse);R_CreateProduct(item);   
		if(CreationMethod == R_BS)
		{   
			if(R_ItemsProduced < itemtocreate)
			{
				R_VisualCreateItems();
			}
			else
			{
				MOBSIDIALOG = NONE;   
				Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
				Ai_StopProcessInfos (hero);   
			};         
		}
		else
		{
			//P/RINT("DD");
			AI_UseMob      (hero,   MOBNAME,   -1);         
			MOBSIDIALOG = NONE;   
			Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
			Ai_StopProcessInfos (hero);   
		};   
	}
	else
	{
		Wld_SendTrigger("TIMETRIGGER4");
	};
};

var int nameless_light_timer;
var int Roderic_axe_not_found;
var int Rick_wants_to_sleep;
const int NumberSecondsToDreamSleep = 60;


// Ork: [TODO] Jakieœ wyciagniecie fragmentów zwiazanych
// z odpowiednimi worldami byloby mile widziane + przeniesienie do innego
// pliku...
FUNC VOID B_Trigger_CheckMissions()
{   
	if(TONY_HELP_CINEMATIC_TRIGGERED==1)&&(Npc_GetDistToWp(hero,"OW_PATH_166")<250)
	{
		TONY_HELP_CINEMATIC_TRIGGERED=2;
		Wld_SendUnTrigger("CINEMATIC_LITTLEWALK_CAM");
		B_ExchangeRoutine(tony,"TALKTOHERO");
		AI_SetWalkmode(tony,NPC_RUN);
	};

	if(MD_FinalBattle)//Chapter 3: battle between Roderic & Truan (Ghosts)
	{
		var c_npc tru; tru = hlp_getnpc(Truan);
		
		if(tru.attribute[ATR_HITPOINTS]<=(5999-(MD_FinalBattle_Wave*500)))
		{
			//pr/int(concatstrings("Wave == ",inttostring(MD_FinalBattle_Wave)));
			MD_FinalBattle_Wave = MD_FinalBattle_Wave + 1;
			Wld_InsertNpc(MD_WaveSpawn_R,"MD_PATH_SPAWNA_01");
			Wld_InsertNpc(MD_WaveSpawn_L,"MD_PATH_SPAWNB_01");
		};
	};

	if(MD_TurnOffLighters)
	{
		MD_TurnOffLighters=FALSE;
		var int hh; var int mm;
		hh=wld_getHour();
		mm=wld_getMin();
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_1",-1);
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_2",-1);
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_3",-1);
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_4",-1);
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_5",-1);
		Wld_SetObjectRoutine (hh+1,mm+1,"FIRECHAMBER_FIREPL_6",-1);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_1",0);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_2",0);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_3",0);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_4",0);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_5",0);
		Wld_SetObjectRoutine (0,00,"FIRECHAMBER_FIREPL_6",0);   
		Wld_SetTime(0,00);
		Wld_SetTime(hh,mm);   
	};

	if(MD_InsertMR==1)
	{
		tru = Hlp_GetNpc(truan);
		if(!Npc_IsDead(tru))
		{ 
			return; 
		};//break dat bullshit, func MD_InsertMR is setted to 1 when MD_Wave Spawns was dead, athrough it ZS_DEAD check c_npc.id and AIV_MM_REAL_ID
		MD_InsertMR+=1;
		var c_npc a; a = Hlp_GetNpc(RodericMD);
		Npc_ClearAiQueue(a);
		AI_Teleport      (a, "KOMNATA_OGNIA_01");
		Npc_ChangeAttribute(a,ATR_HITPOINTS,-9999);   
		a.attribute[ATR_HITPOINTS]=a.attribute[ATR_HITPOINTS]-a.attribute[ATR_HITPOINTS_MAX];   
		Snd_Play                ("MFX_TELEPORT_CAST");
		Wld_InsertItem         (ALL_MW_03,"FP_RUNESWORD");

		introducechapter ("","","","RUNESWORD_APPEARS.wav", 0);
	}
	else if(MD_InsertMR>1)
	{
		if(MD_InsertMR==2)   
		{
			//    hh=wld_getHour();
			//    mm=wld_getMin();   
			Wld_PlayEffect("V_MR_INSERT_PRE", ALL_MW_03, ALL_MW_03, 0, 0, DAM_INVALID, FALSE);         
		};
		
		if(MD_InsertMR==3)   
		{//remove runesword_npc
			Wld_RemoveItem         (ALL_MW_03);
		};
		
		MD_InsertMR+=1;  
		
		if(MD_InsertMR==24)
		{
			Wld_SendTrigger("MR_MOVER");   
		};
		
		if(MD_InsertMR==25)
		{
			Wld_PlayEffect("V_MR_INSERT_BOOM", ItMw_2H_RuneSWD_01, ItMw_2H_RuneSWD_01, 0, 0, DAM_INVALID, FALSE);
			Wld_PlayEffect("V_MR_INSERT_LOOP", ItMw_2H_RuneSWD_01, ItMw_2H_RuneSWD_01, 0, 0, DAM_INVALID, FALSE);
			
			MD_InsertMR=0;		 
			//Stop bossfight theme:
			BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
		};
	};

	if(hero_is_in_kevin_room_ontime==1)
	{
		if((npc_HasItems(hero,kevin_diary)+npc_HasItems(hero,ITKE_STORAGE_01)+npc_HasItems(hero,ITKE_GOMEZ_01))>=3)
		{
			B_PrintDebug("B_StoryKevinDead");
			B_Story_OldCampKevinFounded();
			hero_is_in_kevin_room_ontime=2;
		};
	};

	if (npc_getdisttowp(hero, "OCR_MAINGATE_SQUARE") < 300)
	{
		B_ExchangeRoutine(grd_230, "start");
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
		Necro_teleport_after_deaths_beast = false;
		Snd_Play("MFX_Teleport_Cast");
		AI_Teleport(necro_in_world, "INVISIBLE");
	};

	if (Necro_teleport_on_ritual && (WORLD_CURRENT == WORLD_WORLDZEN))
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
		var c_npc raven; raven = Hlp_GetNpc(Ebr_105_Raven);
		
		Raven_teleport_to_hidden = false;
		
		Snd_Play("MFX_Teleport_Cast");
		AI_Teleport(raven, "WP_INTRO_WI01");
	};

	if ((Hrabia_teleport == 1) && InfoManager_HasFinished())
	{
		Npc_ClearAIQueue(hrabia);
		AI_Teleport(hrabia,"OC1");
		
		Hrabia_teleport+=1;
	}
	else if (Hrabia_teleport == 2)
	{
		AI_Teleport(grd_2514,"OC1"); 
		AI_Teleport(grd_2515,"OC1");
		AI_Teleport(grd_2516,"OC1"); 
		AI_Teleport(grd_2517,"OC1"); 
		AI_Teleport(grd_2518,"OC1"); 
		
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
		AI_Teleport  (hero, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");

		Npc_ExchangeRoutine(hrabia, "HIDE");
		Npc_ExchangeRoutine(grd_2514, "HIDE");
		Npc_ExchangeRoutine(grd_2515, "HIDE");
		Npc_ExchangeRoutine(grd_2516, "HIDE");
		Npc_ExchangeRoutine(grd_2517, "HIDE");
		Npc_ExchangeRoutine(grd_2518, "HIDE");
		Npc_ExchangeRoutine(wegorz, "HIDE");
		
		Saturas_saves_Rick = false;
	};

	if (Npc_HasItems(hero,orn3) && (!Hrabia_orn3))
	{
		B_ExchangeRoutine(hrabia,"OR3");
		AI_Teleport(hrabia,"NEWPATH_4"); 
		Hrabia_orn3 = true;
	};

	if(Mis_TeleportEarl==11)//For real it been used by diego teleport (at first it sets varible to 10
	{
		a = Hlp_GetNpc(PC_THIEF);
		Npc_ClearAiQueue(a);
		AI_Teleport(a, "OCC_CHAPEL_UPSTAIRS");
		Snd_Play("MFX_TELEPORT_CAST");
		Mis_TeleportEarl=0;
	}
	else if(Mis_TeleportEarl)
	{
		Mis_TeleportEarl=Mis_TeleportEarl+1;
	};

	if(Story_RickSentry_MisState==1)
	{
		B_Story_RickOnSentry();
	};

	if(Mis_Pacho_ChestOpened)&&(Npc_HasItems(hero,gomez_mirror))&&(Npc_HasItems(hero,itminugget)>=500)
	{
		//spawn_hrabia or scorpio
		Mis_PachoSplit=TRUE;
	};

	if(B_AfterDialog_Pacho_ScorpioCam_disabled==2)
	{
		B_AfterDialog_Pacho_ScorpioCam_disabled=3;
		Wld_SendTrigger("CAM_TREASURE_SCORPIO");      
	}   
	else if(B_AfterDialog_Pacho_ScorpioCam_disabled==1)
	{
		B_AfterDialog_Pacho_ScorpioCam_disabled=2;
	};

	if(B_AfterDialog_Pacho_EarlCamPrepare_disabled==4)
	{
		B_AfterDialog_Pacho_EarlCamPrepare_disabled=5;
		Wld_SendTrigger("CAM_TREASURE_EARL");   
	}   
	else if(B_AfterDialog_Pacho_EarlCamPrepare_disabled==1)||(B_AfterDialog_Pacho_EarlCamPrepare_disabled==2)||(B_AfterDialog_Pacho_EarlCamPrepare_disabled==3)
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

	if ((necro_appear == 2)&&(hero.attribute[ATR_HITPOINTS] <= hero.attribute[ATR_HITPOINTS_MAX]/10) && (WORLD_CURRENT == WORLD_LABIRYNT))
	{
		var c_npc corristo; corristo = hlp_getNpc(KDF_4115_Corristo);
		
		B_FullStop(corristo);
		necro_appear = 3;
		
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	if ((necro_appear == 2)&&(Npc_IsDead(KDF_4115_Corristo)) && (WORLD_CURRENT == WORLD_LABIRYNT))
	{
		necro_appear = 3;
	};

	if (Npc_IsDead(Non_4116_NekromanD) && (WORLD_CURRENT == WORLD_OTEMPLE) && (!necro_dead))
	{
		PrintScreen("Nekromanta nie ¿yje!",-1,-1,"font_old_20_white.tga",3);
		
		Snd_Play ("FoundRiddler");	
		
		wld_insertNpc(NecromancerDemon, Npc_GetNearestWP(hero));
		
		necro_dead = 1;
	};

	if (!Npc_IsDead(NecromancerDemon) && (necro_demon.attribute[ATR_HITPOINTS] <= necro_demon.attribute[ATR_HITPOINTS_MAX]/2) && (necro_dead == 1))
	{
		wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
		wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
		wld_insertNpc(DemonPSI, Npc_GetNearestWP(hero));
		
		Wld_PlayEffect("spellFX_Thunderstorm", necro_demon, necro_demon, 1, 0, DAM_MAGIC, FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED", necro_demon, necro_demon, 1, 0, DAM_MAGIC, FALSE);
		
		necro_dead = 2;
	};

	if (Npc_IsDead(NecromancerDemon) && (WORLD_CURRENT == WORLD_OTEMPLE) && (necro_dead == 2))
	{
		PrintScreen("Demon nie ¿yje!",-1,-1,"font_old_20_white.tga",3);
		
		AI_PlayAni(hero,	"T_PSI_VICTIM");
		
		necro_dead = 3;
		
		B_hero_poisoned();
		
		Snd_Play ("FoundRiddler");
		Wld_PlayEffect("spellFX_Thunderstorm", hero, hero, 1, 0, DAM_MAGIC, FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_RED", hero, hero, 1, 0, DAM_MAGIC, FALSE);
	};

	if (!Npc_IsDead(hero) && (WORLD_CURRENT == WORLD_OTEMPLE) && (necro_dead == 3))
	{
		B_hero_poisoned();
	};

	if (Npc_IsDead(hero) && (WORLD_CURRENT == WORLD_OTEMPLE) && (necro_dead == 3))
	{
		necro_dead = 3;
		
		B_end_game();
	};

	if(MIS_Katrakanat_pieces_collected<6)
	{    
		if(Npc_HasItems(hero,Katrakanat_piece))&&(!MIS_Katrakanat_piece1_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece1_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};
		
		if(Npc_HasItems(hero,Katrakanat_piece2))&&(!MIS_Katrakanat_piece2_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece2_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};
		
		if(Npc_HasItems(hero,Katrakanat_piece3))&&(!MIS_Katrakanat_piece3_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece3_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};
		
		if(Npc_HasItems(hero,Katrakanat_piece4))&&(!MIS_Katrakanat_piece4_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece4_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};
		
		if(Npc_HasItems(hero,Katrakanat_piece5))&&(!MIS_Katrakanat_piece5_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece5_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};
		
		if(Npc_HasItems(hero,Katrakanat_piece6))&&(!MIS_Katrakanat_piece6_collected)
		{
			MIS_Katrakanat_pieces_collected+=1;
			MIS_Katrakanat_piece6_collected=1;
			B_Katrakanat_piece_collected(MIS_Katrakanat_pieces_collected);         
		};                     
	};

	if(MIS_Tritetra_on)
	{
		if(MIS_Tritetra_innos_pieces<Npc_HasItems(hero,tri_innos_statue))
		{
			Wld_PlayEffect("spellFX_Mis_tritera_Innos_I",  hero  , hero   , 0, 0, 0, FALSE );
		};
		
		if(MIS_Tritetra_adanos_pieces<Npc_HasItems(hero,tri_adan_statue))
		{
			Wld_PlayEffect("spellFX_Mis_tritera_Adanos_I",  hero  , hero   , 0, 0, 0, FALSE );
		};
		
		if(MIS_Tritetra_beliar_pieces<Npc_HasItems(hero,tri_beliar_statue))
		{
			Wld_PlayEffect("spellFX_Mis_tritera_Beliar_I",  hero  , hero   , 0, 0, 0, FALSE );
		};
		
		MIS_Tritetra_innos_pieces   = Npc_HasItems(hero,tri_innos_statue);
		MIS_Tritetra_adanos_pieces   = Npc_HasItems(hero,tri_adan_statue);
		MIS_Tritetra_beliar_pieces   = Npc_HasItems(hero,tri_beliar_statue);
		
		if(MIS_Tritetra_innos_pieces)
		{
			MIS_Tritetra_innos_counter=MIS_Tritetra_innos_counter+1;
			
			if(MIS_Tritetra_innos_counter-((MIS_Tritetra_innos_pieces*15)+(MIS_Tritetra_beliar_pieces*15))>=MIS_Tritetra_innos_counter_max)
			{
				MIS_Tritetra_innos_counter=0;
				MIS_Tritetra_innos_counter_max=Hlp_Random(60)+11;
				Wld_SpawnNpcRange   (hero,Wisp_Fire,1,1000);
			};
		};
		if(MIS_Tritetra_adanos_pieces)
		{
			MIS_Tritetra_adanos_counter=MIS_Tritetra_adanos_counter+1;  
			
			if(MIS_Tritetra_adanos_pieces==2)
			{
				MIS_Tritetra_adanos_counter=MIS_Tritetra_adanos_counter+1;
				
				if(MIS_Tritetra_adanos_counter>=MIS_Tritetra_adanos_counter_max)
				{
					MIS_Tritetra_adanos_counter=0;
					MIS_Tritetra_adanos_counter_max=Hlp_Random(60)+11;
					Wld_SpawnNpcRange   (hero,B_GetMonsterAbove10lvl(),1+Hlp_Random(3),500);
				}   
				else if(MIS_Tritetra_adanos_counter==MIS_Tritetra_adanos_counter_max-10)
				{
					Wld_PlayEffect("spellFX_Mis_tritera_Adanos_Curse", hero, hero, 1,5 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
					B_FullStop(hero);
					Npc_ClearAIQueue(hero);      
					AI_PlayAniBS       (hero, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);      
					AI_Wait            (hero,5);
					AI_PlayAni       (hero, "T_STUMBLE");
				};         
			}
			else if(MIS_Tritetra_adanos_counter-((MIS_Tritetra_innos_pieces*10)+(MIS_Tritetra_beliar_pieces*10))>=MIS_Tritetra_adanos_counter_max)
			{
				MIS_Tritetra_adanos_counter=0;
				MIS_Tritetra_adanos_counter_max=Hlp_Random(40)+11;
				Wld_PlayEffect("spellFX_Mis_tritera_Adanos_Curse", hero, hero, 1,5 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
				B_FullStop(hero);
				Npc_ClearAIQueue(hero);      
				AI_PlayAniBS       (hero, "T_STAND_2_FREEZE_VICTIM", BS_UNCONSCIOUS);      
				AI_Wait            (hero,5);
				AI_PlayAni       (hero, "T_STUMBLE");
			};         
		};
		
		if(MIS_Tritetra_beliar_pieces)
		{
			MIS_Tritetra_beliar_counter=MIS_Tritetra_beliar_counter+1;
			
			if(MIS_Tritetra_beliar_counter-(MIS_Tritetra_innos_pieces+MIS_Tritetra_adanos_pieces)>=3)
			{
				MIS_Tritetra_beliar_counter=0;
				B_ChangeAttribute (hero,   ATR_HITPOINTS, -2);
			};         
		};
	};

	if(Hero_GotoGYD)//&&
	{
		var c_npc nameless; nameless = Hlp_GetNpc(Nameless_ThirdMeetGYD);
		
		if(Hlp_IsValidNpc(nameless))
		{
			nameless_light_timer=nameless_light_timer+1;
			
			if(nameless_light_timer>=5*60)&&(!Npc_HasReadiedWeapon(nameless))
			{
				nameless_light_timer=0;
				Npc_ClearAiQueue(nameless);
				Npc_SetTarget(nameless,nameless);
				AI_ReadySpell         (nameless,   SPL_LIGHT,   5);
				AI_PlayAni(nameless,"T_MAGRUN_2_SLESHOOT");
				Wld_PlayEffect("SPELLFX_LIGHT_ACTIVE", nameless, nameless, 1,0 , DAM_MAGIC, 0);
				AI_PlayAni(nameless,"T_SLESHOOT_2_STAND");
				AI_UnReadySpell         (nameless);
			};
		};
		
		if(npc_getdisttowp(hero,"OGY_SHAMAN_5")<300)
		{
			var c_npc ghost; ghost = hlp_getnpc(ORC_GHOST);
			
			if(Hlp_IsValidNpc(ghost))
			{
				B_CheckForImportantInfo (ghost,hero);
			};
		};
	};

	if(OR_PREALARM>0)&&(OR_PREALARM<76)
	{
		if(Npc_GetAivar(hero,AIV_INVINCIBLE)==FALSE)
		{   
			OR_PREALARM=OR_PREALARM+1;
		};
		
		if(OR_PREALARM==4)
		{
			OR_PREALARM=0;
			GrdAttackNow = 1;
			GRDAttackWP = "OW_PATH_OC_NC8";
			B_Story_Alarm(GRDAttackWP);   
		};
	};

	if(OR_ATTACKED>=2)&&(OR_ATTACKED<76)
	{
		if(OR_ATTACKED==2)
		{
			Wld_SendTrigger("PREATTACK_CAM");//Camera starts   
		};        
		
		OR_ATTACKED=OR_ATTACKED+1;   
		
		if(OR_ATTACKED>3)
		{
			if(OR_ATTACKED==5)   
			{
				AddGrdDificult1st = 0;
				B_INITInsertGrds();   
			}
			else if(OR_ATTACKED==7)
			{
				B_Story_Alarm(GRDAttackWP);//Refresh rbl's
			};
			
			if(OR_ATTACKED==31)
			{
				if(kira_help==1)
				{
					var ocnpc npc;
					a = Hlp_GetNpc(Non_4020_Tablor); 
					npc=Hlp_GetNpc(Non_4020_Tablor);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4021_Bukhart); 
					npc=Hlp_GetNpc(Non_4021_Bukhart);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4022_Postronek); 
					npc=Hlp_GetNpc(Non_4022_Postronek);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4023_Korth); 
					npc=Hlp_GetNpc(Non_4023_Korth);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4024_Snow); 
					npc=Hlp_GetNpc(Non_4024_Snow);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4025_Kron); 
					npc=Hlp_GetNpc(Non_4025_Kron);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4026_Nikolas); 
					npc=Hlp_GetNpc(Non_4026_Nikolas);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
					a = Hlp_GetNpc(Non_4027_Kira); 
					npc=Hlp_GetNpc(Non_4027_Kira);
					npc._zCVob_type = 2; 
					Npc_ExchangeRoutine(a,"EnforceOR");
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
			else if(OR_ATTACKED==44)
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
			else if(OR_ATTACKED==48)
			{
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				GrdsInAttack = GrdsInAttack+3;
				
				if(kira_help)
				{
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack+1;   
				};   
			}
			else if(OR_ATTACKED==60)
			{
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				GrdsInAttack = GrdsInAttack+3;
			}   
			else if(OR_ATTACKED==64)
			{
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				GrdsInAttack = GrdsInAttack+2;
			}
			else if(OR_ATTACKED==70)
			{
				Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
				GrdsInAttack = GrdsInAttack+1;
				
				if(kira_help)
				{
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack+4;   
				};
			}
			else if(OR_ATTACKED==75)
			{
				if(!kira_help)
				{
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					Wld_InsertNpc      (GRD_2770_Guard,      "CROSSING_PATH_2_3_4");
					GrdsInAttack = GrdsInAttack+4;
				};
			};
		};
	};

	if (DreamID == DREAM_BLOODYSWAMP) && (Rick_wants_to_sleep < NumberSecondsToDreamSleep) && (WORLD_CURRENT == WORLD_WORLDZEN)
	{
		Rick_wants_to_sleep+=1;
		
		if (Rick_wants_to_sleep == NumberSecondsToDreamSleep/4)
		{
			PutMsg("Spaæ! Chcê spaæ!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
		};
		
		if (Rick_wants_to_sleep == NumberSecondsToDreamSleep/2)
		{
			PutMsg("Po³ó¿ siê spaæ!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
		};
		
		if (Rick_wants_to_sleep == NumberSecondsToDreamSleep)
		{
			PutMsg("Œpij na ziemi!","font_default.tga",RGBAToZColor(255,255,255,255),_TIME_MESSAGE_LOGENTRY,"");
			
			Dream_StartUp(DreamID);
			SleepFX_PerFrameHandle();
		};
	};
};

var int mob;
var int storeheropos_cycles;
var int hero_cache0_pos[3];
var int hero_cache1_pos[3];
var int hero_cache2_pos[3];
var int hero_cache3_pos[3];
var int pupil_last_pos[4]; //[3]-DISTTOHERO
var int PupilStucked;//incrementation evry time pupil doesn't make big steep to hero
//0-Nothing
//1,2,3-Coll Dynamic disabled

Func void TP_PupilOnHeroTrail()
{
	var oCNPC rbtr; var oCNPC hiro;
	hiro = hlp_Getnpc(pc_hero);
	rbtr = hlp_Getnpc(my_wolf);

	if   (3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache3_pos[0],hero_cache3_pos[2]) > 2000)
	&&(hero_cache3_pos[0]+hero_cache3_pos[1]+hero_cache3_pos[2]!=0)
	{//chache3 pos i okay!
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache3_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache3_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache3_pos[2];   
		//       PrintScreen (concatstrings("3.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
	}
	else if(3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache2_pos[0],hero_cache2_pos[2]) > 2000)
	&&(hero_cache2_pos[0]+hero_cache2_pos[1]+hero_cache2_pos[2]!=0)
	{//chache2 pos i okay!
		//       PrintScreen (concatstrings("2.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache2_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache2_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache2_pos[2];       
	}
	else if(3000 >  Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache1_pos[0],hero_cache1_pos[2]) > 2000)
	&&(hero_cache1_pos[0]+hero_cache1_pos[1]+hero_cache1_pos[2]!=0)
	{//chache1 pos i okay!
		//       PrintScreen (concatstrings("1.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache1_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache1_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache1_pos[2];       
	}
	else if(3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache0_pos[0],hero_cache0_pos[2]) > 2000)
	&&(hero_cache0_pos[0]+hero_cache0_pos[1]+hero_cache0_pos[2]==0)
	{//chache0 pos i okay!
		//       PrintScreen (concatstrings("0.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache0_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache0_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache0_pos[2];       
	}
	else if(hero_cache0_pos[0]+hero_cache0_pos[1]+hero_cache0_pos[2]==0) 
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("0.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache0_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache0_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache0_pos[2];       
	}
	else if(hero_cache1_pos[0]+hero_cache1_pos[1]+hero_cache1_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("1.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache1_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache1_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache1_pos[2];       
	}
	else if(hero_cache2_pos[0]+hero_cache2_pos[1]+hero_cache2_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("2.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache2_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache2_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache2_pos[2];       
	}
	else if(hero_cache3_pos[0]+hero_cache3_pos[1]+hero_cache3_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("3.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache3_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache3_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache3_pos[2];       
	};

	//    PupilBugfix2=4;
	//    rbtr._zCVob_vob_bitfield[0] =  rbtr._zCVob_vob_bitfield[0] | zCVob_bitfield0_visualAlphaEnabled;
	//    rbtr._zCVob_visualAlpha = 0.1;  
};

func void PupilCheck()
{
	if(HeroHasPupil)
	{
		var oCNPC hiro; var oCNPC rbtr;
		var int possibility_multipiler;
		storeheropos_cycles+=1;
		hiro = hlp_Getnpc(pc_hero);
		rbtr = hlp_Getnpc(my_wolf);    
		
		if(PupilBugfix2>=1)&&(PupilBugfix2<=3)
		{
			PupilBugfix2=PupilBugfix2+1;
			if(PupilBugfix2==3)
			{   
				PupilBugfix2=0;
				rbtr._zCVob_vob_bitfield[0] =  rbtr._zCVob_vob_bitfield[0] | zCVob_bitfield0_collDetectionDynamic;
			};   
		};
		
		if(Npc_GetDistToPlayer(MyWolf) - pupil_last_pos[3] - 150 > 0)&&(Pupil_State==FOLLOW)&&(pupil_last_pos[3])
		{
			possibility_multipiler = Npc_GetDistToPlayer(MyWolf) - pupil_last_pos[3];
			possibility_multipiler = possibility_multipiler/150;
			possibility_multipiler = possibility_multipiler-(possibility_multipiler%1);
			PupilStucked=PupilStucked+1*possibility_multipiler;
		}
		else if(PupilStucked)
		{
			possibility_multipiler = pupil_last_pos[3] - Npc_GetDistToPlayer(MyWolf);
			possibility_multipiler = possibility_multipiler/100;
			possibility_multipiler = possibility_multipiler-(possibility_multipiler%1);      
			if(!possibility_multipiler){possibility_multipiler=1;};
			PupilStucked = PupilStucked-1*possibility_multipiler;
			if(pupilstucked<0){pupilstucked=0;};
		};
		//         p/rint(concatstrings("PupilBugfix2 [STATE]: ",inttostring(PupilBugfix2)));  
		//           PrintScreen (concatstrings("WOLF DIST: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 25, _STR_FONT_ONSCREEN,2);//slotow ponizej widzialnych normalnie         
		
		if(Npc_GetDistToPlayer(MyWolf)<5001)&&(Pupil_State!=WAIT)&&(PupilBugfix2==0)
		{
			if(Pupil_State==FOLLOW)&&((Npc_GetDistToPlayer(MyWolf)>4000)//Fuck if wolf was stuck or not
			||((Npc_GetDistToPlayer(MyWolf)>3500)&&(PupilStucked>=5))//Getting Dangerous, better TP'em
			||((Npc_GetDistToPlayer(MyWolf)>3000)&&(PupilStucked>=10)))//If he stuck he gonna be TP'ed now or later
			{
				//              PrintScreen ("WOLF TELEPORTATION",-1, -1, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie         
				TP_PupilOnHeroTrail();
			};
			//             else if(Pupil_State==FOLLOW)&&((Npc_GetDistToPlayer(MyWolf)>2500)//if he haven't been still TP'ed maybe it helps...
			//             ||((Npc_GetDistToPlayer(MyWolf)>2000)&&(PupilStucked>=5))//Let try to move it
			//             ||((Npc_GetDistToPlayer(MyWolf)>1500)&&(PupilStucked>=10)))//Yea, he stuck'd
			//             {
			//               rbtr.vob_bitfield[0] =  rbtr.vob_bitfield[0] & ~zCVob_bitfield0_collDetectionDynamic;
			//               PrintScreen ("WOLF COLLDYN_DISABLE",65, 75, _STR_FONT_ONSCREEN,2);//slotow ponizej widzialnych normalnie         
			//              PupilStucked=1;
			//             }
		};
		
		pupil_last_pos[3] = Npc_GetDistToPlayer(MyWolf); 
		
		pupil_last_pos[0] = rbtr._zCVob_trafoObjToWorld[3];
		pupil_last_pos[1] = rbtr._zCVob_trafoObjToWorld[7];
		pupil_last_pos[2] = rbtr._zCVob_trafoObjToWorld[11];
		
		if(storeheropos_cycles==3)
		{
			//Time to store hero position vector
			storeheropos_cycles=0;
			//move values on next arrays
			hero_cache3_pos[0] = hero_cache2_pos[0];
			hero_cache3_pos[1] = hero_cache2_pos[1];
			hero_cache3_pos[2] = hero_cache2_pos[2];
			
			hero_cache2_pos[0] = hero_cache1_pos[0];
			hero_cache2_pos[1] = hero_cache1_pos[1];
			hero_cache2_pos[2] = hero_cache1_pos[2];
			
			hero_cache1_pos[0] = hero_cache0_pos[0];
			hero_cache1_pos[1] = hero_cache0_pos[1];
			hero_cache1_pos[2] = hero_cache0_pos[2];
			
			hero_cache0_pos[0] = hiro._zCVob_trafoObjToWorld[3];
			hero_cache0_pos[1] = hiro._zCVob_trafoObjToWorld[7];
			hero_cache0_pos[2] = hiro._zCVob_trafoObjToWorld[11];
			
			//       PrintScreen (concatstrings("X-",inttostring(hiro._zCVob_trafoObjToWorld[3])) ,15,15, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("Y-",inttostring(hiro._zCVob_trafoObjToWorld[7])) ,15,20, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("Z-",inttostring(hiro._zCVob_trafoObjToWorld[11])),15,25, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie

			//       PrintScreen (concatstrings("hero_cache1_posX-",inttostring(hero_cache1_pos[0])),65, 60, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache2_posX-",inttostring(hero_cache2_pos[0])),65, 65, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache3_posX-",inttostring(hero_cache3_pos[0])),65, 70, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       
			//       PrintScreen (concatstrings("hero_cache1_posZ-",inttostring(hero_cache1_pos[2])),65, 80, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache2_posZ-",inttostring(hero_cache2_pos[2])),65, 85, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache3_posZ-",inttostring(hero_cache3_pos[2])),65, 90, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//          
			//Storepos   
		};
	};      
};

var int lastx;var int lasty;
var int Trigger7Phase;
var int rune_sword_phase;

// orc: Ok ten trigger jest wywo³ywany co sekunde
// bêdzie idealny dla sprawdzenia monologu stylisty i checkHello.
FUNC VOID EVT_TRIGGER7 ()
{ 
	//Appr_Wait4Monolouge
	EVT_TRIGGER3(); // ??? co to

	if (Appr_Wait4Monolouge)
	{
		if(Npc_GetAivar(hero,AIV_INVINCIBLE)==FALSE)
		{
			Appr_StartMonologue();
			Appr_Wait4Monolouge = false;
		};
	};
	if (rune_sword_phase == 9)
	{
		EVT_RUNESWD_CHARGING();
		
		rune_sword_phase = 0;
	}
	else
	{
		rune_sword_phase+=1;
	};
	//TMP trigger off
	printdebug("TRIGGER7>>START");

	//   PrintScreen (concatstrings("Wld_GetPlayerPortalRoom=",Wld_GetPlayerPortalRoom()),1, 90, _STR_FONT_ONSCREEN,2);
	//       Npc_Getinvitem(hero,itmid);

	//Should be first for corrections   
	printdebug("TRIGGER7>>LoadGame_BugFixList");      
	LoadGame_BugFixList();      
	printdebug("TRIGGER7>>Show_BarTempPot");      
	Show_BarTempPot();
	//AI_SetNpcsToState         (hero,ZS_Stuned,500);
	if(Global_Cinematic_i>(-20))
	{
		printdebug("TRIGGER7>>CinematicEvent(IF PASSED)");      
		CinematicEvent();
	};

	printdebug("TRIGGER7>>ReceptReadBugfix");      
	ReceptReadBugfix();   

	printdebug("TRIGGER7>>temp_potion_trigger");      
	temp_potion_trigger();

	printdebug("TRIGGER7>>Am_EventCheck");      
	Am_EventCheck();
	
	printdebug("TRIGGER7>>PupilBugFix");      
	PupilBugFix();   

	Trigger7Phase = 1;//Rest part of this func will be done called by PerFrameTrigger

	//6 calls in this phase
};
// Ork: A wiec te fazy bêda siê wywo³ywaæ w kolejnych
// klatkach (Wywo³ane z perFrameTrigger) co ma wspomóc optymalizacje
FUNC VOID EVT_TRIGGER7_PHASE1 ()
{   
	Trigger7Phase+=1;

	printdebug("TRIGGER7>>GUI_RENDERICONS");      
	GUI_RENDERICONS();

	printdebug("TRIGGER7>>Dual_BugFix");      
	Dual_BugFix();
	printdebug("TRIGGER7>>Tal_Regeneration");      
	Tal_Regeneration();
	//Missions
	printdebug("TRIGGER7>>B_Trigger_CheckMissions");      
	B_Trigger_CheckMissions();

	//4 calls in this phase (but checkMissions is bigone
};   
FUNC VOID EVT_TRIGGER7_PHASE2 ()
{   
	Trigger7Phase+=1;

	printdebug("TRIGGER7>>WeatherForecast_TryApply");      
	WeatherForecast_TryApply();

	if(!GAME_STARTED)
	{
		printdebug("TRIGGER7>>Events_OnGameStart(IF PASSED)");      
		GAME_STARTED=TRUE;
		Events_OnGameStart();
	};
	//    

	printdebug("TRIGGER7>>PlayGhostsFx");      
	PlayGhostsFx();
	printdebug("TRIGGER7>>PupilCheck");      
	PupilCheck();

	printdebug("TRIGGER7>>FX_ScreenBlendTimer");      
	FX_ScreenBlendTimer();

	printdebug("TRIGGER7>>DayShift");   
	DayShift(Wld_GetDay());

	//6 calls in this phase
};
FUNC VOID EVT_TRIGGER7_PHASE3 ()
{   
	Trigger7Phase=-1;//last phase   
	// OK, so after setting phase to -1 part of triggering trigger7 phases
	// in PerFrameCallback_Trigger.d (in _Intern) should be skipped and none phase will be fired
	// until TIMETRIGGER7 will be triggered again.

	//TODO: Put in some elegant func
	//TODO: Other inventory statement, this one don't even work
	var oCnpc hiro;
	hiro = Hlp_GetNpc(pc_hero);

	if((hiro.npc_bitfield[0] & oCNpc_bitfield0_openinventory) == oCNpc_bitfield0_openinventory)
	{
		printdebug("TRIGGER7>>SheatsPerc");   
		Npc_SendPassivePerc       (hero,PERC_NPCCOMMAND,hero,hero);
	};

	if(HeroDamage_TimeHeroAttackedNeutralFocus)
	{
		HeroDamage_TimeHeroAttackedNeutralFocus+=1;
		
		if(HeroDamage_TimeHeroAttackedNeutralFocus==6)
		{   //No other neutral npc was focused, reset counter and disable neutral attacking (if hostile not present)
			HeroDamage_TimeHeroAttackedNeutralFocus=0;
		};
	};

	printdebug("TRIGGER7<<END");
};

FUNC VOID EVT_CASTLE_TELEPORT ()
{
	if (CasTeleportActive == TRUE)
	{
		Day = Day-1;
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self   , 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(self);
		var int teleportizer;

		//      Wld_PlayEffect("ItemFX_LegL         teleportizer = Hlp_Random(5);
		if (teleportizer == 1)
		{
			Ai_Teleport(self,"HC_TOWER_OVER");
		}
		else if (teleportizer == 2)
		{
			Ai_Teleport(self,"OW_WARAN_G_SPAWN");
		}
		else if (teleportizer == 3)
		{
			Ai_Teleport(self,"OW_PATH_BANDITOS01");
		}
		else if (teleportizer == 4)
		{
			Ai_Teleport(self,"LOCATION_02_12");
		}
		else//5
		{
			Ai_Teleport(self,"HC_BRIDGE2_ON");
		};
	};

	//var int Rodney;
	//Rodney = Hlp_GetNPC(NON_2602_Rodney);
	//Ai_Teleport(Rodney,"CAS_TELEPORT_WP");
};

FUNC VOID EVT_CAS_TRAP ()
{
	if (Npc_GetDistToWP(hero,"CAS_TRAP_WP") < 300)
	{   
		B_KillNpc(PC_Hero);
	};
};

func void EVT_TRIGGER2DELAY ()
{//Hello Hero Say
	PrintDebug         ("B_DelaySayTimer");

	B_DelaySayTimer();
};

func void CRYSTAL_ZONE_SCRIPT()
{
	var int a;
	a = hero.attribute[ATR_MANA_MAX]-(hero.attribute[ATR_MANA]*2);
	a = a/10;
	hero.attribute[ATR_MANA]+=a;
};