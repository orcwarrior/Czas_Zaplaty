// *******************************
// Abel kicking hero out of Hunter Camp
// (if hero still won't bring sly head)
// *******************************

func void ANTIWLAM_OR_FUNC()
{
// 	B_PrintDebug("or_alarm");
	if(head_yes != TRUE)&&(Kapitel==1)
	{
		Npc_ClearAiQueue(hero);
		AI_GotoWP		(hero, "OW_PATH_OC_NC4");	
		B_FullStop			(abel);
    	B_WhirlAround		(abel,	hero);
    	AI_PointAtNpc		(abel,	hero);
    	B_Say				(abel,	hero,	"$HEYYOU");
    	B_Say			(abel, 	hero, "$GETOUTOFHERE");
    	AI_StopPointAt		(abel);			
	};	
};

// *******************************
// Finger cinematic - runing out of
// his hut. Need fixes
// *******************************
var int FingersCine_Played;

func void FINGERS_CINE_FUNC()
{
	//TODO:
	// popraw calosc, zmien rutyne raczce by nie wraca³ do chaty, poprostu ogarnij ten quest...

 	if(FingersCine_Played)
 	{
		return;	
 	};

	if(Npc_KnowsInfo (hero, DIA_Fingers_Hello))&&(Npc_GetDistToWP(hero,"RACZKA_CHATA_DOOR") < 500)
 	{
		PrintScreen	("R¹czka wybiega w panice przed chatê...", -1,-1,"FONT_OLD_20_WHITE.TGA",3);	 	

 		B_ExchangeRoutine	(fingers, "AFTERPANIC");
 		Npc_ClearAiQueue(fingers);
		AI_SetWalkmode  	(fingers, 	NPC_RUN);	
		Mdl_ApplyOverlayMds	(fingers,	"HUMANS_FLEE.MDS");//mds uciekania w panice budzis
 		//AI_GotoWP (fingers,"RACZKA_CHATA_DOOR");	
 		//AI_GotoWP (fingers,"PATH_OR22");
		AI_GotoWP (fingers,"HC_RANGED0");
		AI_Wait(fingers,0.5);
		AI_GotoNpc (fingers,hero); // niech biegnie w panice do nas budzis
 		AI_TurnAway(fingers,hero);
 		AI_Wait(fingers,0.5);			
  		AI_TurnToNpc(fingers,hero);
  		B_CheckForImportantInfo (fingers,hero);
		//Wld_SendTrigger("FINGERS_DERBIS");//wywo³ywane w tigger target funkcji FINGERS_CINE_FUNC (tej) budzis
		Wld_SendTrigger("FINGERS_CAM");		
		Wld_SendTrigger("FINGERS_EQ");	
		Wld_SendTrigger("FINGERS_DUST");		
		FingersCine_Played = true;	
	}
   else
   {
		FingersCine_Played = false;
	};	
};

// *******************************
// Old OM Challenge trigger, unused
// right now.
// *******************************
func void EVT_CHALL_ZONE_1()
{
	B_PrintDebug("EVT_CHALL_ZONE_1");
   
	if(GRDChallenge != TRUE)
	{
		Wld_SendTrigger("SURFACE_2_OLDMINE");
	};	
};

func void EVT_CHALL_ZONE_2()
{
	B_PrintDebug("EVT_CHALL_ZONE_2");
   
	if(GRDChallenge == TRUE)&&(GetTeam(hero) == 0)
	{
      AI_GotoWP(hero,"OM_FAN_1");	
	};
};

func void EVT_GRDTRIG_1()
{
	if (GrdsInAttack < 1) && (!end_attack_grds)
	{
		GrdAttackNow = 1;
		GRDAttackWP = "OW_PATH_OC_NC8";
		B_Story_Alarm(GRDAttackWP);
		AddGrdDificult1st = 0;
		B_INITInsertGrds();
	};
};

func void EVT_GRDTRIG_2()
{
	if (GrdsInAttack < 1) && (!end_attack_grds)
	{
		GrdAttackNow = 2;
		GRDAttackWP = "PATH_OC_NC_4";
		B_Story_Alarm(GRDAttackWP);
		AddGrdDificult1st = 0;
		B_INITInsertGrds();
	};
};

func void EVT_GRDTRIG_3()
{
	if (GrdsInAttack < 1) && (!end_attack_grds)
	{
		GrdAttackNow = 3;
		GRDAttackWP = "PATH_OC_NC_4";
		B_Story_Alarm(GRDAttackWP);
		AddGrdDificult1st = 0;
		B_INITInsertGrds();
	};	
};

func void EVT_GRDTRIG_4()
{
	if (GrdsInAttack < 1) && (!end_attack_grds)
	{
		GrdAttackNow = 4;
		GRDAttackWP = "PATH_OC_NC_4";
		B_Story_Alarm(GRDAttackWP);
		AddGrdDificult1st = 0;
		B_INITInsertGrds();
	};
};


// *******************************
// Magtower Door use condition
// only if milten aproves
// *******************************
func int MAG_ENTRANCE_COND()
{
	if(ENTER_TO_MAGTOWER)||(!Npc_IsPlayer(self))
	{
		return 1;
	}
	else
	{
		AI_PlayAni(hero,"T_DONTKNOW");
		return 0;
	};
};

func int Black_mag_arrived_cond()
{
	if(Black_mag_arrived == 2)
	{
		return 1;
	}
	else
	{
		AI_PlayAni(hero,"T_DONTKNOW");
		return 0;
	};
};

// *******************************
// Trigger firing Tony Help
// Cinematic.
// *******************************
func void CINEMATIC_LITTLEWALK_FUNC()
{
	if(Npc_GetDistToWp(hero,"OW_PATH_167")<Npc_GetDistToWp(hero,"OW_PATH_166"))&&(!TONY_HELP_CINEMATIC_TRIGGERED) && (angus_go)
	{
		TONY_HELP_CINEMATIC_TRIGGERED=TRUE;
		Wld_SendTrigger("CINEMATIC_LITTLEWALK_CAM");
		CinematicReset(0,1);
		//Sher, ten dialog te¿ trzeba poprawiæ (wyœwietla sie przy cinematicu z tonym)
		CinematicDialog(PIR_2600_Angus, pc_hero, "Widzicie tych cwaniaków po drugiej stronie mostu przy ognisku?", "", 3);
		CinematicDialog(pc_hero, PIR_2600_Angus, "Maj¹ czerwon¹ zbrojê.", "", 4);		
		CinematicDialog(PIR_2600_Angus, pc_hero, "I bardzo dobrze. Wyprujemy im flaki za Skipa i Dustiego...", "", 2);		
	};
};