
func VOID STARTUP_SUB_PSICAMP ()
{
	//----------------GURUS---------------------------------------------------
	//Wld_InsertNpc(PSI_GuruZombie, "PSI_PATH_1_1");			
	Wld_InsertNpc(PSI_GuruZombie, "PSI_TEACH_TRAIN_GUR");		//Drogenlabor
	Wld_InsertNpc(PSI_GuruZombie, "PSI_HANGAROUND_GUR");		//Hut 17, Trainingsplatz
	Wld_InsertNpc(PSI_GuruZombie, "PSI_22_EX_GUARD");		//Hut 28, Teacher 3
	Wld_InsertNpc(PSI_GuruZombieFireStorm, "PSI_SPEECH");		//Hauptorplatz, Smalltalk mit Lester
	Wld_InsertNpc(PSI_GuruZombie, "PSI_PLATFORM_TEACHER");			

	//-----------Novizen-------------(auch für Große Beschwörung)------------------
	Wld_InsertNpc(PSI_NovHZombie, "PSI_PATH_1_1"); //wichtiger Trigger, Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_BRIDGE_1"); //wichtiger Trigger, Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_TEMPLE_3"); //  Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_TEMPLE_2"); //H Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_TEMPLE_3"); //H Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TEMPLE_COURT_1"); //H Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TEMPLE_COURT_2_MOVEMENT"); //H Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TEMPLE_COURT_3_MOVEMENT"); //H Beter
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TEMPLE_COURT_3_MOVEMENT"); //L Beter
	Wld_InsertNpc(PSI_NovHZombie, "PSI_TEMPLE_COURT_3"); //  Beter
	Wld_InsertNpc(PSI_NovHZombie, "PSI_TEMPLE_COURT_4"); //L Beter
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SWAMP_0"); //  Beter
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SWAMP_0"); //H Beter
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SWAMP_1"); //H Beter

	
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SWAMP_3");	//hängt auf Tempelplatz rum (goobo-cave-heini)
	Wld_InsertNpc(PSI_NovLZombie, "PSI_SWAMP_3");	//Hut 21, bei Labor oben / Im Labor
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_9_16");	//Lehrer-Anwärter. Lehrplatz 1
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TRAINING_1");	//Hut 1
	Wld_InsertNpc(PSI_NovMZombie, "PSI_TRAINING_2");	//Hut 2
	Wld_InsertNpc(PSI_NovHZombie, "PSI_PATH_9_10");	//Krautstampfer, Hut6 Bed1
	Wld_InsertNpc(PSI_NovHZombie, "PSI_PATH_3_3");	//Krautstampfer, Hut6 Bed2
	Wld_InsertNpc(PSI_NovMZombie, "PSI_MEETING_BRIDGE");	//Krautstampfer, Hut6 Bed3
	Wld_InsertNpc(PSI_NovMZombie, "PSI_PATH_11");	//Hut 10 Smalltalk
	Wld_InsertNpc(PSI_NovMZombie, "PSI_PATH_11_1"); //Ober-Schmied, 24h
	Wld_InsertNpc(PSI_NovMZombie, "PSI_12_HUT_IN_BED");	//Schüler, Joru-Platz, Hut 12
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_104"); 	//Hut 13
	Wld_InsertNpc(PSI_NovMZombie, "PSI_PATH_103"); 	//Schüler, Joru-Platz, Hut 12
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_3_3");	//Schmiede 24h
	Wld_InsertNpc(PSI_NovHZombie, "PSI_SMITH_IN");	//Smalltalker m.1303 vor Stampfplatz, Hut 4
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SMITH_IN");  //Hut 10 Smalltalk
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SMITH_TALK");	//Hut 9
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SMITH_TALK"); 	//Hut 7
	Wld_InsertNpc(PSI_NovMZombie, "PSI_SMITH_03");	//Hut 29
	Wld_InsertNpc(PSI_NovLZombie, "PSI_SMITH_02");	//Hut 30
	Wld_InsertNpc(PSI_NovLZombie, "PSI_SMITH_01");	//Hut 8
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_9_12");	//Schüler Baal Tondral (Platz 2)
	Wld_InsertNpc(PSI_NovMZombie, "PSI_PATH_4_5"); //Hut 31, Fortuno-Platz
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_2_2_GUARD"); //Schüler 2, Baal Cadar
	Wld_InsertNpc(PSI_NovLZombie, "PSI_PATH_5"); //Schüler 2, Baal Cadar
	Wld_InsertNpc(PSI_NovLZombie, "PSI_TEMPLE_COURT_1_MOVE"); //Schüler Baal Tondral (Platz 2)
	Wld_InsertNpc(PSI_NovMZombie, "PSI_PATH_TEMPLE"); //Schüler 2, Baal Cadar

	//---------------Templer-------------------------------------------------
	Wld_InsertNpc(PSI_TplLZombie, "PSI_TEMPLE_COURT_GUARD");	//Hut 33, hinter Trainingsplatz
	Wld_InsertNpc(PSI_TplLZombie, "PSI_TEMPLE_COURT_1");		//Stegwache 2 Baumstamm
	Wld_InsertNpc(PSI_TplMZombie, "PSI_TEMPLE_GUARD_03");		//Stegwache 1
	Wld_InsertNpc(PSI_TplHZombie, "PSI_TEMPLE_GUARD_04");	//Stegwache 3, wahnsinner Sumpfhai-Jäger, 
	Wld_InsertNpc(PSI_TplHZombie, "PSI_TEMPLE_GUARD_03");	//Kaloms Wache (Labor)
	Wld_InsertNpc(PSI_TplHZombie, "PSI_TEMPLE_GUARD_02"); //24h auf Klotz bei Tempelplatz
	Wld_InsertNpc(PSI_TplHZombie, "PSI_TEMPLE_GUARD_01");	//Schmiede-Smalltalker, 24h
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_9"); //Schmiede-Smalltalker, 24h
	Wld_InsertNpc(PSI_TplMZombie, "PSI_PATH_10");	//**TRAINEE, Hut 16
	Wld_InsertNpc(PSI_TplLZombie, "PSI_SWAMP_0"); //**TRAINEE, Hut 15
	Wld_InsertNpc(PSI_TplMZombie, "PSI_PATH_9_16"); //TEMPELTOR unten
	Wld_InsertNpc(PSI_TplLZombie, "PSI_TRAINNING_1");	//**TRAINEE, Hut 18
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_3_3");		//Haupttorwache
	Wld_InsertNpc(PSI_TplMZombie, "PSI_MEETING_BRIDGE");		//Haupttorwache
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_11");	//**TRAINEE, Hut 33
	Wld_InsertNpc(PSI_TplMZombie, "PSI_PATH_11_1");	//**TRAINEE, Hut 34
	Wld_InsertNpc(PSI_TplLZombie, "PSI_LADDER_1");	//Hut (Trainee-Area) ** Wache zu Angar
	Wld_InsertNpc(PSI_TplHZombie, "PSI_LADDER_1");		//TEMPELTOR unten
	Wld_InsertNpc(PSI_TplLZombie, "PSI_PATH_TEMPLE_3");		//TEMPELTOR unten
	Wld_InsertNpc(PSI_TplMZombie, "PSI_PATH_TEMPLE_2");		//TEMPELTOR unten
	Wld_InsertNpc(PSI_TplLZombie, "PSI_PATH_TEMPLE_4");	//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_TEMPLE_1");		//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_TEMPLE_3_MOVEMENT");		//TEMPELTOR
	Wld_InsertNpc(PSI_TplMZombie, "PSI_PATH_TEMPLE_4_MOVEMENT");		//TEMPELTOR
	//---------------Skeletons----------------------------------------------------------------
	Wld_InsertNpc(SKELETON, "PSI_SWAMP_2"); //L Beter
	Wld_InsertNpc(SKELETON, "PSI_SWAMP_2"); //  Beter
	Wld_InsertNpc(SKELETON, "PSI_SWAMP_0"); //L Beter
	Wld_InsertNpc(SKELETON, "PSI_SWAMP_0"); //  Beter	
	Wld_InsertNpc(SKELETON, "PSI_SWAMP_3");	//Smalltalker m.1320 vor Stampfplatz, Hut 3/	
	Wld_InsertNpc(SKELETON, "PSI_PATH_TEMPLE"); //L Beter
	Wld_InsertNpc(SKELETON, "PSI_PATH_9"); //  Beter	
	Wld_InsertNpc(SKELETON, "PSI_MEETING_BRIDGE"); //Hut (Trainee-Area) ** Wache zu Angar
	Wld_InsertNpc(SKELETON, "PSI_PATH_TEMPLE_4");	//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(SKELETON, "PSI_PATH_TEMPLE_1");		//MC-Jäger, Fortuno-Platz	
	Wld_InsertNpc(SKELETON, "PSI_PATH_102");	//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(SKELETON, "PSI_PATH_103");		//MC-Jäger, Fortuno-Platz	
	Wld_InsertNpc(SKELETON, "PSI_PATH_104");	//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(SKELETON, "PSI_PATH_105");		//MC-Jäger, Fortuno-Platz	
	Wld_InsertNpc(SKELETON, "PSI_PATH_102");	//MC-Jäger, Fortuno-Platz
	Wld_InsertNpc(SKELETON, "PSI_PATH_103");		//MC-Jäger, Fortuno-Platz			
};

func VOID INIT_SUB_PSICAMP ()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN PSICAMP                  **
	**************************************************************/
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_01",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_01",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_02",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_02",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_03",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_03",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_04",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_04",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_05",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_05",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_06",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_06",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_07",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_07",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_08",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_08",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_09",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_09",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_10",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_10",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_11",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_11",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_12",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_12",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_13",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_13",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_14",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_14",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_15",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_15",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_16",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_16",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_17",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_17",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_18",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_18",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_19",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_19",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_20",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_20",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_21",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_21",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_22",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_22",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_23",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_23",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_24",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_24",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_25",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_25",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_26",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_26",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_27",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_27",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_28",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_28",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_29",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_29",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_30",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_30",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_31",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_31",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_32",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_32",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_33",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_33",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_34",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_34",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_35",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_35",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_36",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_36",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_37",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_37",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_38",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_38",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_39",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_39",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_40",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_40",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_41",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_41",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_42",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_42",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_43",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_43",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_44",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_44",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_45",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_45",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_46",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_46",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_47",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_47",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_48",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_48",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_49",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_49",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_50",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_50",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_51",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_51",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_52",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_52",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_53",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_53",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_54",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_54",0);
	
	Wld_SetObjectRoutine (00,00, "PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (20,00, "PC_CRYSTALLIGHT_55",1);
	Wld_SetObjectRoutine (05,00, "PC_CRYSTALLIGHT_55",0);
	
	/**************************************************************
	**        PORTALRAUMZUWEISUNG IM PSICAMP			         **
	**************************************************************/

};

func VOID STARTUP_SUB_NEWCAMP ()
{
	//----------Rice Fields---------------------------
	// 21 Slaves + 16 GRDs = 37 NPC's
	//---------------------------------------------------------		
	//Patrol GRDs
	Wld_InsertNpc(Grd_2504_PatrolGRD, "NC_DAM"); //RiceField Patrol
	Wld_InsertNpc(Grd_2505_PatrolGRD, "NC_DAM"); //RiceField Patrol
	Wld_InsertNpc(Grd_2506_PatrolGRD, "NC_DAM"); //RiceField Patrol
	Wld_InsertNpc(Grd_2507_PatrolGRD, "NC_DAM"); //RiceField Patrol		
	Wld_InsertNpc(Grd_2508_PatrolGRD, "NC_DAM"); //RiceField Patrol		
	Wld_InsertNpc(Grd_2509_PatrolGRD, "NC_DAM"); //RiceField Patrol		
	Wld_InsertNpc(Grd_2511_PatrolGRD, "NC_DAM"); //RiceField Patrol	
	//GRDS	
	Wld_InsertNpc(GRD_900_Scatty, "NC_DAM"); //RiceField Chief
	Wld_InsertNpc(GRD_851_Butch, "OW_PATH_02");//Ricelords Schläger, CF
	//STTs	
	Wld_InsertNpc(STT_844_Shadow, "NC_DAM");	//Ricelords Schläger, CF  	
	Wld_InsertNpc(STT_845_Shadow, "NC_DAM"); 	//Ricelords Schläger, CF	
	Wld_InsertNpc(STT_846_Shadow, "NC_DAM"); 	//Ricelords Schläger, CF	
	Wld_InsertNpc(Stt_335_Santino, "NC_DAM");
	//RiceFields Slaves
	Wld_InsertNpc(SLV_904_Mordrag, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_907_Lares, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_917_Roscoe, "NC_DAM");  //Slave

	//Thugs
	Wld_InsertNpc(GRD_2512_Kam, "NC_DAM");  //Thug Boss
	Wld_InsertNpc(GRD_2520_Thug, "NC_DAM");  //Thug 
	Wld_InsertNpc(GRD_2521_Thug, "NC_DAM");  //Thug
	//Barrels Transport
	Wld_InsertNpc(SLV_2522_Slave, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_2523_Slave, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_2524_Slave, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_2525_Slave, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_2526_Slave, "NC_DAM");  //Slave
	Wld_InsertNpc(SLV_2527_Slave, "NC_DAM");  //Slave
	
	//----------Vorplatz (Surface)---------------------------			*******************ToDo!!!!!!!*****************************+
	// 	Wld_InsertNpc(ORG_829_Organisator, "NC_DAM"); //Vortor
	// 	Wld_InsertNpc(ORG_830_Organisator, "NC_DAM"); //Vortor
	// 	Wld_InsertNpc(ORG_831_Organisator, "NC_DAM"); //Vortor
	// 	Wld_InsertNpc(ORG_832_Organisator, "NC_DAM"); //Vortor
	// 	Wld_InsertNpc(ORG_834_Organisator, "NC_DAM"); //Wheel-Wache
	// 	//Wld_InsertNpc(BAU_925_Bauer, "NC_DAM"); 		//Nach Vortor
	// 	//Wld_InsertNpc(BAU_926_Bauer, "NC_DAM"); 		//Nach Vortor
	// 
	
	//Patrol GRDs
	Wld_InsertNpc(Grd_2530_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2531_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2532_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2533_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2534_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2535_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2536_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2537_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	
	
	Wld_InsertNpc(GRD_251_Kirgo, "NC_DAM");	 //Hut 21,Arena

	//CAVE
	Wld_InsertNpc(Grd_2539_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2540_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2541_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2542_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2543_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2544_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2545_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2546_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2547_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2548_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2549_PatrolGRD, "NC_DAM"); 	//Surface Patrol	
	Wld_InsertNpc(Grd_2550_PatrolGRD, "NC_DAM"); 	//Surface Patrol	

	Wld_InsertNpc(SLV_824_Slave, "NC_DAM"); //Brooming 
	Wld_InsertNpc(SLV_823_Slave, "NC_DAM"); //Brooming 	
	Wld_InsertNpc(SLV_850_Wedge, "NC_DAM"); //Brooming 	
	Wld_InsertNpc(SLV_901_Horatio, "NC_DAM"); //CF3
	//----------------Bauern---------------------------------
	Wld_InsertNpc(BAU_902_Pock, "NC_DAM");  //CF2
	Wld_InsertNpc(BAU_903_Rufus, "NC_DAM"); //CF1
	Wld_InsertNpc(BAU_905_Bauer, "NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc(BAU_908_Bauer, "NC_DAM"); //Hut, Peasant3
	Wld_InsertNpc(BAU_912_Jeremiah, "NC_DAM"); //GEHILFE von Silas, pennt in Kneipe
	Wld_InsertNpc(BAU_914_Bauer, "NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc(BAU_915_Bauer, "NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc(BAU_916_Bauer, "NC_DAM"); //Hut, Peasant2
	Wld_InsertNpc(BAU_919_Bauer, "NC_DAM"); //Hut, Peasant 
	Wld_InsertNpc(BAU_920_Bauer, "NC_DAM"); //Hut, Peasant 
	Wld_InsertNpc(BAU_921_Bauer, "NC_DAM"); //Hut, Peasant4 
	Wld_InsertNpc(BAU_922_Bauer, "NC_DAM"); //CF1 bei Rufus
	Wld_InsertNpc(BAU_923_Bauer, "NC_DAM"); //CF1 bei Rufus
	Wld_InsertNpc(BAU_927_Bauer, "NC_DAM"); //CF2 bei Pock
	Wld_InsertNpc(BAU_928_Bauer, "NC_DAM"); //CF2 bei Pock
	Wld_InsertNpc(BAU_929_Bauer, "NC_DAM"); //CF3 bei Horatio
	Wld_InsertNpc(BAU_930_Bauer, "NC_DAM"); //CF3 bei Horatio
	
	
	
	//GATE GRD
	Wld_InsertNpc(Grd_2538_Kil, "NC_DAM");
	
	Wld_InsertNpc(ORG_855_Wolf, "NC_DAM");		//Hut 11
	Wld_InsertNpc(Grd_4086_Pluskwa, "NC_DAM");		//Hut 11
	
	//sprawdziæ wp dla Carlosa po gadce z Kilem	 NC_PATH49
	
	
	Wld_InsertNpc(Grd_255_Fletcher, "NC_DAM");		 //NC_Small_Cave_Center
	Wld_InsertNpc(GRD_20300_Gardist, "NC_DAM");	 //Hut 05
	
	Wld_InsertNpc(SLD_702_Soeldner, "NC_DAM");	 //24h Wache vor Fletcher

	//Wld_InsertNpc(PC_Fighter, "NC_PATH87"); //Gorn
	Wld_InsertNpc(Grd_4087_Carlos, "OW_PATH_07_21_GUARD_MIDDLE"); //Stra¿nik NO
	
	
	//----------------Magier---------------------------------

	//------------Organisatoren---------------------------------
	// 	Wld_InsertNpc(ORG_800_Organisator, "NC_DAM"); //Hut 26
	// 	Wld_InsertNpc(ORG_804_Organisator, "NC_DAM"); //Durchgangs-Wache zu Lares, 24h
	// 	Wld_InsertNpc(ORG_806_Organisator, "NC_DAM"); //Hut 20
	// 	Wld_InsertNpc(ORG_807_Organisator, "NC_DAM"); //Hut 14
	// 	Wld_InsertNpc(ORG_810_Organisator, "NC_DAM"); //Hut 12
	// 	Wld_InsertNpc(ORG_811_Organisator, "NC_DAM"); //Hut 17
	// 	Wld_InsertNpc(ORG_816_Organisator, "NC_DAM"); //Hut 28
	// 	Wld_InsertNpc(ORG_817_Organisator, "NC_DAM"); //Hut 13
	// 	Wld_InsertNpc(ORG_821_Organisator, "NC_DAM"); //Hut 25, Tavern Top
	// 	Wld_InsertNpc(ORG_822_Organisator, "NC_DAM"); //Hut 16

	// 	Wld_InsertNpc(ORG_833_Buster, "NC_DAM");		//Hut 30
	// 	Wld_InsertNpc(ORG_836_Organisator, "NC_DAM"); //Hut 26
	// 	Wld_InsertNpc(ORG_837_Organisator, "NC_DAM"); //Hut 31, Kneipe
	// 	Wld_InsertNpc(ORG_838_Organisator, "NC_DAM"); //Hut 31, Kneipe
	// 	Wld_InsertNpc(ORG_841_Silas, "NC_DAM");		//Wirt, 24h in Kneipe
	// 	Wld_InsertNpc(ORG_842_Shrike, "NC_DAM");		//Hut 01, dann Hut 18
	// 	Wld_InsertNpc(ORG_843_Sharky, "NC_DAM");		//Hut 25


	/*****************
Lee/Saturas camps
*****************/

	//mobs:

	Wld_InsertNpc(Bloodhound,	"LOCATION_19_03");

	//soldiers:

	Wld_InsertNpc(SLD_700_Lee, "LOCATION_19_03_ROOM3");		
	Wld_InsertNpc(SLD_701_Orik, "LOCATION_19_03_PEMTAGRAM_MOVEMENT");	
	Wld_InsertNpc(SLD_709_Cord, "LOCATION_19_03_ENTRANCE_HARPYE2");	 
	Wld_InsertNpc(SLD_704_Blade, "LOCATION_19_03_ROOM4");	 //dodaæ dialogi      

	Wld_InsertNpc(SLD_703_Soeldner, "LOCATION_19_03_ENTRANCE_HARPYE3"); 
	Wld_InsertNpc(SLD_705_Soeldner, "LOCATION_19_03_ENTRANCE_HARPYE");  


	Wld_InsertNpc(SLD_706_Soeldner, "LOCATION_19_03_PEMTAGRAM_ENTRANCE"); 
	Wld_InsertNpc(SLD_726_Soeldner, "LOCATION_19_03_ROOM2");  
	Wld_InsertNpc(SLD_708_Soeldner, "LOCATION_19_03_SECOND_HARPYE5"); 

	Wld_InsertNpc(SLD_710_Soeldner, "LOCATION_19_03_SECOND_HARPYE2"); 
	Wld_InsertNpc(SLD_720_Soeldner, "LOCATION_19_03_SECOND_ETAGE5"); 
	Wld_InsertNpc(SLD_723_Soeldner, "LOCATION_19_03_SECOND_HARPYE3"); 
	Wld_InsertNpc(SLD_725_Soeldner, "LOCATION_19_03_SECOND_ETAGE_BALCON3"); 
	
	// 	Wld_InsertNpc(SLD_730_Soeldner, "NC_DAM"); //dodaæ wp na szczyt wie¿y

	//magowie:


	Wld_InsertNpc(KDW_600_Saturas, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");	//dodaæ book shelf i fp
	Wld_InsertNpc(KDW_601_Myxir, "LOCATION_19_03_SECOND_HARPYE1");	 
	Wld_InsertNpc(KDW_602_Merdarion, "LOCATION_19_03_SECOND_HARPYE5"); 
	Wld_InsertNpc(KDW_603_Nefarius, "LOCATION_19_03_SECOND_HARPYE4");	
	Wld_InsertNpc(KDW_604_Cronos, "LOCATION_19_03_ROOM6");		
	Wld_InsertNpc(KDW_605_Riordian, "LOCATION_19_03_ROOM6_BARRELCHAMBER");	


	//Brücke
	
	//Platz vor Fokusplattform & Eingang
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PATH_RUIN7");
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PATH_RUIN8");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PATH_RUIN9");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PATH_RUIN10");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PATH_RUIN11");    

	//EG: Leiterraum
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PEMTAGRAM_MOVEMENT");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PEMTAGRAM2");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PEMTAGRAM_MOVEMENT");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_PENTAGRAMM");    

	//EG: Biblothek
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_ROOM6");    
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_ROOM6_BARRELCHAMBER");    

	//EG: Geheimkammer
	//Wld_InsertNpc(SkeletonSH, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	//Wld_InsertNpc(SkeletonSH, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	//Wld_InsertNpc(SkeletonSH, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	
	//EG: Linker Raum
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_ROOM3");

	//1.OG: Raum links vorne
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_HARPYE1");
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_HARPYE2");
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_ETAGE6");
	
	//1.OG: Raum links hinten
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_HARPYE3");
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_HARPYE4");
	//Wld_InsertNpc(Harpie, "LOCATION_19_03_SECOND_ETAGE7");


	// 	Wld_InsertNpc(SLD_731_Soeldner, "NC_DAM"); //24h Wache vor Lee
	// 	Wld_InsertNpc(SLD_732_Soeldner, "NC_DAM"); //Durchgangs-Wache Magier
	// 	Wld_InsertNpc(SLD_733_Soeldner, "NC_DAM"); //Haupttor, Ausguck auf Reisfelder
	// 	Wld_InsertNpc(SLD_735_Soeldner, "NC_DAM"); //Trainee (Cord)
	// 	Wld_InsertNpc(SLD_736_Soeldner, "NC_DAM"); //Trainee (Cord)
	// //	Wld_InsertNpc(SLD_738_Soeldner, "NC_DAM"); //Drehradwache Haupttor 


	//*******************************************


	//Hut 15

	//-----------Schürfer in Bar--------------------------------

	//-------------Lagerfremde---------------------------------
	//	Wld_InsertNpc(NOV_1332_BaalKagan, "NC_DAM");  //vor Hut 21, Abends bei Bauern am CF3
	//	Wld_InsertNpc(NOV_1333_BaalIsidro, "NC_DAM"); //24 in Kneipe an Ecktisch
	// Mordrag: Hut 19

	//	Wld_InsertNpc(DamLurker, "NC_SPAWN_DAM_LURKER2");


	Wld_InsertNpc(SFB_1000_Senyan, "NC_DAM");	
	Wld_InsertNpc(SFB_1001_Schuerfer, "NC_DAM");	
	
	//-------------Earl House----------------------------------
	// 23 Slaves + 29 GRDs = 52 NPC's
	//---------------------------------------------------------	
	//Guards	
	Wld_InsertNpc(GRD_4010_Hrabia, "NC_EN_1");	
	Wld_InsertNpc(Grd_610_Gardist, "NC_EN_MAINPATH_02");	
	Wld_InsertNpc(Grd_611_Gardist, "NC_EN_1");	
	Wld_InsertNpc(Grd_612_Gardist, "NC_EN_PATH1_01");	
	Wld_InsertNpc(Grd_613_Gardist, "NC_EN_MAINHALL1_09");	
	Wld_InsertNpc(Grd_614_Gardist, "NC_EN_MAINHALL1_09");	
	Wld_InsertNpc(Grd_615_Gardist, "NC_EN_1");	
	Wld_InsertNpc(Grd_616_Gardist, "NC_EN_PATH3_05");	
	Wld_InsertNpc(Grd_617_Gardist, "NC_EN_PATH3_05");	
	Wld_InsertNpc(Grd_618_Gardist, "NC_EN_MAINHALL_GATE_GUARD_L");	
	Wld_InsertNpc(Grd_619_Gardist, "NC_EN_MAINHALL_GATE_GUARD_L");	
	Wld_InsertNpc(Grd_620_Gardist, "NC_EN_BARACK_SMALLTALK");	
	Wld_InsertNpc(Grd_621_Gardist, "NC_EN_BARACK_SMALLTALK");	
	Wld_InsertNpc(Grd_622_Gardist, "NC_EN_PATH2_03");	
	Wld_InsertNpc(Grd_623_Gardist, "NC_EN_PATH2_03");	
	Wld_InsertNpc(Grd_624_Gardist, "NC_EN_PATH2_03");	
	Wld_InsertNpc(Grd_625_Gardist, "NC_EN_PATH2_03");	
	Wld_InsertNpc(Grd_626_Gardist, "NC_EN_PATH2_03");	
	Wld_InsertNpc(Grd_627_Gardist, "NC_EN_MAINHALL1_09");	
	Wld_InsertNpc(Grd_628_Gardist, "NC_EN_MAINHALL2_01");	
	Wld_InsertNpc(Grd_629_Gardist, "NC_EN_MAINHALL3_01");	
	Wld_InsertNpc(Grd_630_Gardist, "NC_EN_MAINHALL3_01");		
	Wld_InsertNpc(Grd_631_Smith, "NC_EN_SMITH_03");		
	Wld_InsertNpc(Grd_632_Gardist, "NC_EN_MAINHALL2_11");			
	Wld_InsertNpc(Grd_633_Gardist, "NC_EN_1");		

	Wld_InsertNpc(Grd_657_Gardist, "NC_EN_1");		
	Wld_InsertNpc(Grd_658_Gardist, "NC_EN_1");		
	Wld_InsertNpc(Grd_659_Gardist, "NC_EN_1");		
	Wld_InsertNpc(Non_660_Nia, "NC_EN_1");		
	
	//Slaves
	Wld_InsertNpc(SLV_634_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_635_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_636_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_637_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_638_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_639_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_640_Slave, "NC_EN_MAINPATH_05");		
	Wld_InsertNpc(SLV_641_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_642_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_643_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_644_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_645_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_646_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_647_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_648_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_649_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_650_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_651_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_652_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_653_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_654_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_655_Slave, "NC_EN_1");		
	Wld_InsertNpc(SLV_656_Slave, "NC_EN_1");		
	
	//--------------------------------------
	//   S T O N E   Q U A R R Y
	//--------------------------------------
	// 14 Slaves + 7 GRDs = 21 NPC's
	//--------------------------------------
	Wld_InsertNpc(SLV_661_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_662_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_663_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_664_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_665_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_666_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_667_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_668_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_669_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_670_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_671_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_672_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_673_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_674_Slave, "OW_QUARRY_TOP_03");		
	Wld_InsertNpc(SLV_675_Slave, "OW_QUARRY_TOP_03");		

	Wld_InsertNpc(Grd_676_PatrolGRD, "OW_QUARRY_TOP_03");			
	Wld_InsertNpc(Grd_677_PatrolGRD, "OW_QUARRY_TOP_03");				
	Wld_InsertNpc(Grd_678_PatrolGRD, "OW_QUARRY_TOP_03");				
	Wld_InsertNpc(Grd_679_PatrolGRD, "OW_QUARRY_TOP_03");				
	Wld_InsertNpc(Grd_680_PatrolGRD, "OW_QUARRY_TOP_03");				
	Wld_InsertNpc(Grd_681_PatrolGRD, "OW_QUARRY_TOP_03");				
	Wld_InsertNpc(Grd_682_PatrolGRD, "OW_QUARRY_TOP_03");				
};

func VOID INIT_SUB_NEWCAMP ()
{
	//**************************************************************
	
	// Objekt-TAs
	//Wld_SetObjectRoutine (20,00, "EVT_NC_MAINGATE01_TRIGGER",1);		// SN 09.01.01: auskommentiert, damit Tore rund um die Uhr offen sind
	//Wld_SetObjectRoutine (08,00, "EVT_NC_MAINGATE01_TRIGGER",0);

	//Earl House candles - attached to mover
	Wld_SetObjectRoutine (00,00, "EN_NIGHT",1);
	Wld_SetObjectRoutine (20,00, "EN_NIGHT",1);
	Wld_SetObjectRoutine (04,59, "EN_NIGHT",0);		
	Wld_SetObjectRoutine (05,00, "EN_NIGHT",0);		
};

FUNC VOID STARTUP_SUB_OLDCAMP ()
{
	Wld_InsertNpc(VLK_501_Buddler, "OC1"); //Hut 79, oben neben Südtor
	Wld_InsertNpc(VLK_502_Buddler, "OC1"); //Hut 10, MarusPlatz (Ex-Marus)
	Wld_InsertNpc(VLK_503_Buddler, "OC1"); //Hut 53, oberer Platz am Markt
	Wld_InsertNpc(VLK_504_Buddler, "OC1");	 //Hut 12 (Burgtor unten) (Ex-Ryan)
	Wld_InsertNpc(VLK_505_Buddler, "OC1"); //Hut 7, zu Marus
	Wld_InsertNpc(VLK_506_Buddler, "OC1"); //Hut 15, SnafPlatz
	Wld_InsertNpc(VLK_507_Buddler, "OC1"); //Hut 54, oberer Platz am Markt
	Wld_InsertNpc(VLK_508_Buddler, "OC1"); //Hut 37, Fox Platz
	Wld_InsertNpc(VLK_509_Buddler, "OC1"); //Hut 56. MPlatz OBEN
	Wld_InsertNpc(VLK_510_Buddler, "OC1"); //Hut 28, Huno Platz
	Wld_InsertNpc(VLK_511_Herek, "OC1");	 //Hut 62, Bloodwyn-Platz
	Wld_InsertNpc(VLK_512_Buddler, "OC1"); //Hut 64, Durchgangshütte Bloodwyn/Markt 
	Wld_InsertNpc(VLK_513_Buddler, "OC1"); //Hut 24, Arenaplatz
	Wld_InsertNpc(VLK_514_Buddler, "OC1"); //Hut 25, Arenaplatz
	Wld_InsertNpc(VLK_515_Buddler, "OC1"); //Hut 23, ArenaPlatz
	Wld_InsertNpc(VLK_516_Buddler, "OC1"); //Hut 48, Marktplatz
	Wld_InsertNpc(VLK_517_Buddler, "OC1"); //Hut 46, Marktplatz (Ex-Canthar)
	Wld_InsertNpc(VLK_519_Buddler, "OC1"); //Hut 43, Südturm-Tor
	Wld_InsertNpc(VLK_521_Buddler, "OC1"); //Hut 45, Marktplatz
	Wld_InsertNpc(VLK_522_Buddler, "OC1"); //Hut 55, Roaster Marktplatz
	Wld_InsertNpc(VLK_523_Buddler, "OC1"); //Hut 57, MPlatz OBEN
	Wld_InsertNpc(VLK_524_Dusty, "OC1");	 //Hut 58, MPlatz OBEN
	Wld_InsertNpc(VLK_526_Buddler, "OC1"); //Hut 67, Bloodwyn-Platz
	Wld_InsertNpc(VLK_527_Buddler, "OC1"); //Hut 77, GrahamPlatz
	Wld_InsertNpc(VLK_528_Buddler, "OC1"); //Neben Sly, Hut 74
	Wld_InsertNpc(VLK_529_Buddler, "OC1"); //Kyle-Platz, Hut 69
	Wld_InsertNpc(VLK_530_Guy, "OC1");	 //Hut 17
	Wld_InsertNpc(VLK_531_Buddler, "OC1"); //Hut 42, Neben SüdTurm-Ausgang
	Wld_InsertNpc(VLK_532_Buddler, "OC1"); //Hut 39, Fox Platz
	Wld_InsertNpc(VLK_533_Buddler, "OC1"); //Hut 61, Marktplatz oben (zu Bloodwyn)
	Wld_InsertNpc(VLK_535_Buddler, "OC1"); //Kyle UNTEN, Hut 71
	Wld_InsertNpc(VLK_536_Kyle, "OC1");	 //Hut 70. Kyle-Platz
	Wld_InsertNpc(VLK_538_Huno, "OC1");	 //Hut 35
	Wld_InsertNpc(VLK_553_Buddler, "OC1"); //Hut 51, Neben SüdTurm-Ausgang
	Wld_InsertNpc(VLK_554_Buddler, "OC1"); //Kyle UNTEN, Hut 72
	Wld_InsertNpc(VLK_555_Buddler, "OC1"); //Hut 29, Huno Platz
	Wld_InsertNpc(VLK_556_Buddler, "OC1"); //Hut 78, oben neben Südtor
	Wld_InsertNpc(VLK_557_Buddler, "OC1"); //Hut 75, Graham Platz
	Wld_InsertNpc(VLK_560_Buddler, "OC1"); //Hut 16, SnafPlatz
	Wld_InsertNpc(VLK_561_Buddler, "OC1"); //Hut 33, Huno Platz
	Wld_InsertNpc(VLK_564_Jesse, "OC1");	 //Hut ??, Bloodwyn-Platz
	Wld_InsertNpc(VLK_565_Buddler, "OC1"); //Hut 52, oberer Platz am Markt
	Wld_InsertNpc(VLK_572_Gravo, "OC1");	 //Hut 4, Wasc//hplatz
	Wld_InsertNpc(VLK_573_Graham, "OC1");  //Hut 76, Graham Platz
	Wld_InsertNpc(VLK_574_Mud, "OC1");	 //Hut 13, Snaf Platz
	Wld_InsertNpc(VLK_575_Buddler, "OC1"); //Bloodwyn-Platz, Hut 66
	Wld_InsertNpc(VLK_576_Buddler, "OC1"); //Hunos Gehilfe, Hut 30
	Wld_InsertNpc(VLK_577_Buddler, "OC1"); //Hut 11, MarusPlatz
	Wld_InsertNpc(VLK_578_Buddler, "OC1"); //Kyle-Platz, Hut 68 (2 Türen)
	Wld_InsertNpc(VLK_580_Grim, "OC1");	 //Torplatz bei Diego, Hut2
	
	Wld_InsertNpc(VLK_586_Grimes, "OC1");	 //Torplatz bei Diego, Hut2
	
	
	//--------------Erzbarone-------------------------
	Wld_InsertNpc(Ebr_100_Gomez, "OC1");		//
	Wld_InsertNpc(Ebr_101_Scar, "OC1");		
	Wld_InsertNpc(Ebr_102_Arto, "OC1");
	Wld_InsertNpc(Ebr_105_Raven, "OC1");		
	Wld_InsertNpc(Ebr_106_Bartholo, "OC1");	
	Wld_InsertNpc(Ebr_108_Velaya, "OC1"); 	//Gomez Zimmer 24h
	Wld_InsertNpc(Ebr_109_Syra, "OC1");		
	Wld_InsertNpc(Ebr_110_Seraphia, "OC1");	
	//------------Freie Betten-------------------------
	//OCC_MERCS_LEFT_ROOM_BED5
	//OCC_MERCS_LEFT_ROOM_BED6
	//---------------Garde-------------------------
	Wld_InsertNpc(Grd_200_Thorus, "OC1");	 //OCC_BARONS_UPPER_RIGHT_ROOM_BED1
	Wld_InsertNpc(Grd_201_Jackal, "OC1");	 //MarktplatzPatrouille , 24h
	Wld_InsertNpc(Grd_203_Bullit, "OC1");  //24h sitzt in Gardistenhaus

	Wld_InsertNpc(Grd_204_Gardist, "OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED1
	Wld_InsertNpc(Grd_206_Gardist, "OC1"); //vorm Grd-Haus, OCC_MERCS_UPPER_RIGHT_ROOM_BED5
	Wld_InsertNpc(Grd_208_Cutter, "OC1");	 //vorm Grd-Haus, OCC_MERCS_UPPER_RIGHT_ROOM_BED6
	Wld_InsertNpc(Grd_209_Gardist, "OC1"); //OCC_MERCS_UPPER_LEFT_ROOM_BED1, Smalltalk vorne
	Wld_InsertNpc(GRD_210_Nesto, "OC1");	 //Hut 19, Arena
	Wld_InsertNpc(Grd_211_Skip, "OC1");    //Händler, Scheune, OCC_MERCS_UPPER_LEFT_ROOM_BED4
	Wld_InsertNpc(Grd_212_Torwache, "OC1");//Burgtor			
	Wld_InsertNpc(Grd_213_Torwache, "OC1");//Burgtor			
	// 	Wld_InsertNpc(Grd_214_Torwache, "OC1");//Nordtor			
	// 	Wld_InsertNpc(Grd_215_Torwache, "OC1");//Nordtor			
	// 	Wld_InsertNpc(Grd_216_Torwache, "OC1");//Südtor			
	// 	Wld_InsertNpc(Grd_217_Torwache, "OC1");//Südtor
	Wld_InsertNpc(Grd_1245_Cad, "OC1");//Z mieczem dwurêcznym
	Wld_InsertNpc(Grd_1246_Jeff, "OC1");//Z mieczem dwurêcznym
	

	Wld_InsertNpc(Grd_218_Gardist, "OC1"); //EBR-Haustür, 24h
	Wld_InsertNpc(Grd_219_Stone, "OC1");	 //Burg Schmied, OCC_MERCS_LEFT_ROOM_BED3
	Wld_InsertNpc(Grd_220_Gardist, "OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED2
	Wld_InsertNpc(Grd_221_Gardist, "OC1"); //Trainee, OCC_MERCS_UPPER_RIGHT_ROOM_BED3
	Wld_InsertNpc(Grd_222_Gardist, "OC1"); //Ebr oben
	Wld_InsertNpc(Grd_223_Gardist, "OC1"); //Ebr oben
	Wld_InsertNpc(Grd_225_Gardist, "OC1"); //BurgWehrgang L 
	Wld_InsertNpc(Grd_226_Gardist, "OC1"); //OCC_MERCS_UPPER_LEFT_ROOM_BED2, Smalltalk vorne
	Wld_InsertNpc(Grd_227_Gardist, "OC1"); //Smalltalk ganz hinten, OCC_MERCS_UPPER_LEFT_ROOM_BED5
	Wld_InsertNpc(Grd_228_Gardist, "OC1"); //Südtor DrehKreuz  
	Wld_InsertNpc(Grd_229_Gardist, "OC1"); //Ballustradenwache 
	Wld_InsertNpc(Grd_230_Gardist, "OC1"); //Nordtor Drehkreuz 
	Wld_InsertNpc(Grd_231_Gardist, "OC1"); //Smalltalk ganz hinten, OCC_MERCS_UPPER_LEFT_ROOM_BED7
	Wld_InsertNpc(Grd_232_Gardist, "OC1"); //Torplatz, OCC_MERCS_LEFT_ROOM_BED1
	Wld_InsertNpc(Grd_233_Bloodwyn, "OC1");//Wasc//hplatzPatrouille
	Wld_InsertNpc(GRD_239_Gardist, "OC1");	 //Kerker (Ex-Mort)
	Wld_InsertNpc(Grd_241_Gardist, "OC1"); //Ballustradenwache 
	Wld_InsertNpc(Grd_242_Gardist, "OC1"); //Ballustradenwache 
	Wld_InsertNpc(Grd_243_Gardist, "OC1"); //Ballustradenwache 
	Wld_InsertNpc(Grd_244_Gardist, "OC1"); //Ballustradenwache 
	Wld_InsertNpc(Grd_245_Gardist, "OC1"); //EBR-Haustür, 24h
	Wld_InsertNpc(GRD_12461_Gardist, "OC1");	 //NADACHU?!
	Wld_InsertNpc(Grd_3101_Mathis, "OC1");	 //Hut 21,Arena

	Wld_InsertNpc(Grd_252_Gardist, "OC1"); //Torplatz, OCC_MERCS_LEFT_ROOM_BED2
	//TO NewCamp
	Wld_InsertNpc(Grd_253_Gardist, "OC1"); //Torplatz, Wachhaus OCC_MERCS_TO_GANGWAY
	//Wld_InsertNpc(Grd_255_Fletcher, "OC1");//ArenaplatzPatrouille
	Wld_InsertNpc(GRD_279_Gardist, "OC1"); //ItemWache im EBr-Haus
	Wld_InsertNpc(GRD_280_Gardist, "OC1"); //Drehkreuz Burgtor

	Wld_InsertNpc(Stt_339_Cooper, "OC1");  //Hut ??. bei Arena
	Wld_InsertNpc(Stt_329_Dexter, "OC1");  //Hut ??. bei Arena
	Wld_InsertNpc(Stt_340_Lucjusz, "OC1");  //Hut ??. bei Arena
	Wld_InsertNpc(Stt_341_Ronald, "OC1");  //Hut ??. bei Arena	
	Wld_InsertNpc(Stt_342_Harford, "OC1");  //Hut ??. bei Arena	
	Wld_InsertNpc(STT_330_Schatten, "OC1"); //Hut 44, Südturm-Tor
	Wld_InsertNpc(Stt_328_Schatten, "OC1"); //Hut 22, Arenaplatz
	Wld_InsertNpc(Stt_324_Balam, "OC1");	  //Burg Koch
	Wld_InsertNpc(Stt_325_Omid, "OC1");	  //Burg Koch
	Wld_InsertNpc(Stt_316_Schatten, "OC1"); //hut 18, neben Guy (Arena)
	Wld_InsertNpc(Stt_318_Schatten, "OC1"); //Hut 60 
	Wld_InsertNpc(Stt_319_Schatten, "OC1"); //Hut 9, MarusPlatz
	Wld_InsertNpc(Stt_322_Schatten, "OC1"); //Torplatz, Hut3, bei Diego
	Wld_InsertNpc(Stt_313_Schatten, "OC1"); //Hut 36
	Wld_InsertNpc(Stt_314_Schatten, "OC1"); //Hut 38, Fox Platz
	Wld_InsertNpc(Stt_310_Schatten, "OC1"); //Hut 8
	Wld_InsertNpc(Stt_304_Schatten, "OC1"); //Hut 6, Torplatz
	Wld_InsertNpc(Stt_306_Schatten, "OC1"); //Hut 27, Arenaplatz
	Wld_InsertNpc(STT_346_Virat, "OC1"); //Hut 27, Arenaplatz
	
	Wld_InsertNpc(STT_343_Felos, "OC1"); //  Arena Fighter
	Wld_InsertNpc(STT_344_Warrior, "OC1"); //Arena Fighter
	Wld_InsertNpc(STT_345_Warrior, "OC1"); //Arena Fighter
	
	
	//Wld_InsertNpc(KDF_400_Rodriguez, "OC1");
	//Wld_InsertNpc(KDF_401_Damarok, "OC1");
	//Wld_InsertNpc(KdF_402_Corristo, "OC1");
	//Wld_InsertNpc(KDF_403_Drago, "OC1");
	//Wld_InsertNpc(KdF_405_Torrez, "OC1");


	Wld_InsertNpc(Grd_265_Gardist, "OC1");//OC Südtor (Ex-Fox)
	// 	Wld_InsertNpc(RBL_2400_Kelvin, "OC1");//OC Südtor (Ex-Fox)
	// 	var c_npc kevin; kevin = Hlp_GetNpc(RBL_2400_Kelvin);
	// 	kevin.attribute[ATR_HITPOINTS]-=kevin.attribute[ATR_HITPOINTS];
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_1");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_1");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_1");
};

FUNC VOID INIT_SUB_OLDCAMP ()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN OLDCAMP                  **
	**************************************************************/
	//---- SN 09.01.01: auskommentiert, damit Tore rund um die Uhr offen sind ----
	// 	Wld_SetObjectRoutine (20,00, "EVT_OC_MAINGATE01_SWITCH",1);
	// 	Wld_SetObjectRoutine (08,00, "EVT_OC_MAINGATE01_SWITCH",1);
	// 	Wld_SetObjectRoutine (20,00, "EVT_OC_MAINGATE02_SWITCH",1);
	// 	Wld_SetObjectRoutine (08,00, "EVT_OC_MAINGATE02_SWITCH",1);
	//Wld_SetObjectRoutine (23,15, "EVT_OC_INNERMAINGATE_SWITCH",1); //Grd_280_Gardist
	//Wld_SetObjectRoutine (06,30, "EVT_OC_INNERMAINGATE_SWITCH",0);
	//Wld_SetObjectRoutine (00,00, "OCR__MAINGATE_TRIGGER",1);
	Wld_SetObjectRoutine (20,00, "OCR_ARENA_MAINGATE_TRIGGER",1);
	Wld_SetObjectRoutine (08,00, "OCR_ARENA_MAINGATE_TRIGGER",0);
	
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	//------------------------------------------
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_04",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_05",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_06",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_07",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_08",0);

	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_18",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH_09",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_MIDDLE_01",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_MIDDLE_01",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_MIDDLE_02",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_MIDDLE_02",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_MIDDLE_03",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_MIDDLE_03",0);
	
	Wld_SetObjectRoutine (00,00, "OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (20,00, "OC_FIREPLACE_MIDDLE_04",1);
	Wld_SetObjectRoutine (05,00, "OC_FIREPLACE_MIDDLE_04",0);
	
	
	
	/**************************************************************
	**        PORTALRAUMZUWEISUNG IN OLDCAMP-AUSSENRING          **
	**   CS: Bei den Buddlerhütten Kleinbuchstaben lassen,       **
	**                  sonst gehts nicht                        **
	**************************************************************/

	Wld_AssignRoomToGuild("KI1",GIL_GRD); 	// Portalraum KDF
	Wld_AssignRoomToGuild("HH8",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH5",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH4",GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH7",GIL_GRD);	// Portalraum EBR-Bedroom
	
	Wld_AssignRoomToGuild("ocgateb",GIL_GRD);	//Wachraum am Haupteingang
	Wld_AssignRoomToGuild("hütte1",GIL_VLK); //Diegos Hütte
	Wld_AssignRoomToGuild("hütte2",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte3",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte4",GIL_VLK);
	Wld_AssignRoomToGuild("hütte5",GIL_VLK);
	Wld_AssignRoomToGuild("hütte6",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte7",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte8",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte9",GIL_VLK); 
	Wld_AssignRoomToGuild("hütte10",GIL_VLK);
	Wld_AssignRoomToGuild("hütte11",GIL_VLK);
	Wld_AssignRoomToGuild("hütte12",GIL_VLK);
	Wld_AssignRoomToGuild("hütte13",GIL_VLK);
	Wld_AssignRoomToGuild("hütte14",GIL_VLK);
	Wld_AssignRoomToGuild("hütte15",GIL_VLK);
	Wld_AssignRoomToGuild("hütte16",GIL_VLK);
	//Wld_AssignRoomToGuild("hütte17",GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht
	Wld_AssignRoomToGuild("hütte18",GIL_VLK);
	Wld_AssignRoomToGuild("hütte19",GIL_VLK);
	Wld_AssignRoomToGuild("hütte20",GIL_VLK);
	Wld_AssignRoomToGuild("hütte21",GIL_VLK);
	Wld_AssignRoomToGuild("hütte22",GIL_VLK);
	Wld_AssignRoomToGuild("hütte23",GIL_VLK);
	Wld_AssignRoomToGuild("hütte24",GIL_VLK);
	Wld_AssignRoomToGuild("hütte25",GIL_VLK);
	//Wld_AssignRoomToGuild("hütte26",GIL_VLK); //PLAYER Hütte
	Wld_AssignRoomToGuild("hütte27",GIL_VLK);
	Wld_AssignRoomToGuild("hütte28",GIL_VLK);
	Wld_AssignRoomToGuild("hütte29",GIL_VLK);
	Wld_AssignRoomToGuild("hütte30",GIL_VLK);
	Wld_AssignRoomToGuild("hütte31",GIL_VLK);
	Wld_AssignRoomToGuild("hütte32",GIL_VLK);
	Wld_AssignRoomToGuild("hütte33",GIL_VLK);
	Wld_AssignRoomToGuild("hütte34",GIL_VLK);
	Wld_AssignRoomToGuild("hütte35",GIL_VLK);
	Wld_AssignRoomToGuild("hütte36",GIL_VLK);
	Wld_AssignRoomToGuild("hütte37",GIL_VLK);
	Wld_AssignRoomToGuild("hütte38",GIL_VLK);
	Wld_AssignRoomToGuild("hütte39",GIL_VLK);
	Wld_AssignRoomToGuild("hütte40",GIL_VLK);
	Wld_AssignRoomToGuild("hütte41",GIL_VLK);
	Wld_AssignRoomToGuild("hütte42",GIL_VLK);
	Wld_AssignRoomToGuild("hütte43",GIL_VLK);
	Wld_AssignRoomToGuild("hütte44",GIL_VLK);
	Wld_AssignRoomToGuild("hütte45",GIL_VLK);
	Wld_AssignRoomToGuild("hütte46",GIL_VLK);
	Wld_AssignRoomToGuild("hütte47",GIL_VLK);
	Wld_AssignRoomToGuild("hütte48",GIL_VLK);
	Wld_AssignRoomToGuild("hütte49",GIL_VLK);
	Wld_AssignRoomToGuild("hütte50",GIL_VLK);
	Wld_AssignRoomToGuild("hütte51",GIL_VLK);
	Wld_AssignRoomToGuild("hütte52",GIL_VLK);
	Wld_AssignRoomToGuild("hütte53",GIL_VLK);
	Wld_AssignRoomToGuild("hütte54",GIL_VLK);
	Wld_AssignRoomToGuild("hütte55",GIL_VLK);
	Wld_AssignRoomToGuild("hütte56",GIL_VLK);
	Wld_AssignRoomToGuild("hütte57",GIL_VLK);
	Wld_AssignRoomToGuild("hütte58",GIL_VLK);
	Wld_AssignRoomToGuild("hütte59",GIL_VLK);
	Wld_AssignRoomToGuild("hütte60",GIL_VLK);
	Wld_AssignRoomToGuild("hütte61",GIL_VLK);
	Wld_AssignRoomToGuild("hütte62",GIL_VLK);
	Wld_AssignRoomToGuild("hütte63",GIL_VLK);
	//Wld_AssignRoomToGuild("hütte64",GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht
	Wld_AssignRoomToGuild("hütte65",GIL_VLK);
	Wld_AssignRoomToGuild("hütte66",GIL_VLK);
	Wld_AssignRoomToGuild("hütte67",GIL_VLK);
	//Wld_AssignRoomToGuild("hütte68",GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht
	Wld_AssignRoomToGuild("hütte69",GIL_VLK);
	Wld_AssignRoomToGuild("hütte70",GIL_VLK);
	Wld_AssignRoomToGuild("hütte71",GIL_VLK);
	Wld_AssignRoomToGuild("hütte72",GIL_VLK);
	Wld_AssignRoomToGuild("hütte73",GIL_VLK);
	Wld_AssignRoomToGuild("hütte74",GIL_VLK);
	Wld_AssignRoomToGuild("hütte75",GIL_VLK);
	Wld_AssignRoomToGuild("hütte76",GIL_VLK);//	Grahams Hütte, abgesprochen mit Mike
	Wld_AssignRoomToGuild("hütte77",GIL_VLK);
};

func VOID STARTUP_SUB_DEMONTOWER ()
{
	//**************************************************************************************
	//*                               Dämonenbeschwörer                                    *
	//**************************************************************************************
	
	Wld_InsertNpc(KdF_404_Xardas, "LOCATION_03_IN");
};

func VOID INIT_SUB_DEMONTOWER ()
{
};

//**************************************************************************************
//*								FreemineCamp										   *
//**************************************************************************************																		

FUNC VOID STARTUP_SUB_FREEMINECAMP ()
{
	// 	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	// 	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	// 	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);

	//----------------------Soeldner-------------------------------
	Wld_InsertNpc(SLD_750_Soeldner, "FMC_ENTRANCE"); //FMC-Palisadenwache
	Wld_InsertNpc(SLD_751_Soeldner, "FMC_ENTRANCE"); //FMC-Guard (am Eingang)	
	Wld_InsertNpc(SLD_752_Okyl, "FMC_ENTRANCE"); //FMC-PalisadenWache
	Wld_InsertNpc(SLD_753_Baloro, "FMC_ENTRANCE"); //FMC-PalisadenWache
	
	Wld_InsertNpc(SLD_755_Soeldner, "FMC_ENTRANCE"); //FMC-GuardPalisade
	Wld_InsertNpc(SLD_756_Soeldner, "FMC_ENTRANCE"); //FMC-Guard
	Wld_InsertNpc(SLD_757_Soeldner, "FMC_ENTRANCE"); //FMC-GuardPalisade
	Wld_InsertNpc(SLD_758_Soeldner, "FMC_ENTRANCE"); //FMC-GuardPalisade
	Wld_InsertNpc(SLD_759_Soeldner, "FMC_ENTRANCE"); //FMC-Guard(Tür zum Drehradhaus)		
	
	Wld_InsertNpc(SLD_760_Soeldner, "FMC_ENTRANCE"); //FMC-Guard(Tür zum Drehradhaus)		
	Wld_InsertNpc(SLD_761_Soeldner, "FMC_ENTRANCE"); //FMC-Guard(Mineneingang)			
	Wld_InsertNpc(SLD_762_Soeldner, "FMC_ENTRANCE"); //FMC-Guard(Mineneingang				
	Wld_InsertNpc(SLD_763_Soeldner, "FMC_ENTRANCE"); //FMC-Guard
	Wld_InsertNpc(SLD_764_Soeldner, "FMC_ENTRANCE"); //FMC-Guard
	
	Wld_InsertNpc(SLD_765_Soeldner, "FMC_ENTRANCE"); //FMC-Guard
	
	//-----------------------Schuerfer-------------------------------
	Wld_InsertNpc(SFB_1030_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	Wld_InsertNpc(SFB_1031_Schuerfer, "FMC_ENTRANCE"); //FMC-PickOre
	Wld_InsertNpc(SFB_1032_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	Wld_InsertNpc(SFB_1033_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	Wld_InsertNpc(SFB_1034_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	
	Wld_InsertNpc(SFB_1035_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	Wld_InsertNpc(SFB_1036_Schuerfer, "FMC_ENTRANCE"); //FMC-Pickore
	Wld_InsertNpc(SFB_1037_Swiney,	  "FMC_ENTRANCE"); //				OBER_SCHÜRFER
	Wld_InsertNpc(SFB_1038_Schuerfer, "FMC_ENTRANCE"); //FMC-PickOre
	Wld_InsertNpc(SFB_1039_Schuerfer, "FMC_ENTRANCE"); //FMC-PickOre
	
	Wld_InsertNpc(SFB_1040_Schuerfer, "FMC_ENTRANCE"); //FMC-SitAround
	Wld_InsertNpc(SFB_1041_Schuerfer, "FMC_ENTRANCE"); //FMC-SitAround
	Wld_InsertNpc(SFB_1042_Schuerfer, "FMC_ENTRANCE"); //FMC-StandAround
	Wld_InsertNpc(SFB_1043_Schuerfer, "FMC_ENTRANCE"); //FMC-StandAround
	Wld_InsertNpc(SFB_1044_Schuerfer, "FMC_ENTRANCE"); //StandAround
	
	//--------------------------Organisatoren--------------------------
	
	Wld_InsertNpc( ORG_890_Organisator, "FMC_ENTRANCE"); //FMC-SitAround
	Wld_InsertNpc( ORG_891_Organisator, "FMC_ENTRANCE"); //FMC-SitAround
	Wld_InsertNpc( ORG_892_Organisator, "FMC_ENTRANCE"); //FMC-StandAround
};

FUNC VOID INIT_SUB_FREEMINECAMP ()
{
	Wld_AssignRoomToGuild("FMC01",GIL_grd);     
	Wld_AssignRoomToGuild("FMC03",GIL_grd); 
	Wld_AssignRoomToGuild("FMC04",GIL_grd);
	Wld_AssignRoomToGuild("FMC05",GIL_grd);
	Wld_AssignRoomToGuild("FMC06",GIL_grd); 
	Wld_AssignRoomToGuild("FMC07",GIL_grd);
	Wld_AssignRoomToGuild("FMC08",GIL_grd);
	Wld_AssignRoomToGuild("FMC09",GIL_grd);
	Wld_AssignRoomToGuild("FMC10",GIL_grd);
	Wld_AssignRoomToGuild("FMC11",GIL_grd);
	Wld_AssignRoomToGuild("FMC12",GIL_grd);
	Wld_AssignRoomToGuild("FMC13",GIL_grd);
	Wld_AssignRoomToGuild("FMC14",GIL_grd);
	Wld_AssignRoomToGuild("FMC15",GIL_grd);
};

//*******************************************************************************
//*								Surface											*
//*******************************************************************************
FUNC VOID STARTUP_SUB_SURFACE ()
{
	// 	Wld_InsertNpc(GRD_254_Orry, "OC1");
	// 	Wld_InsertNpc(GRD_281_Gardist, "OC1");//Orry-Wache
	//Wld_InsertNpc(GRD_22299_Gardist, "OC1");
	//Wld_InsertNpc(GRD_25411_Gardist, "OC1");
	//Wld_InsertNpc(Tpl_11432_Templer, "OC1"); 
	//--------Brückenwachen vorm OC--------------------------------------
	Wld_InsertNpc(GRD_276_Brueckenwache, "OC1");

	Wld_InsertNpc(GRD_275_Brueckenwache, "OC1");

	//--------Zugangswachen zum Orkgebiet--------------------------------------
	
	Wld_InsertNpc(STT_315_Sly, "OC1");
	Wld_InsertNpc(GRD_4054_Guard, "OC1");
	Wld_InsertNpc(GRD_4055_Guard, "OC1");

	//--------Troll Hunters 7 NPC's------------------------------------------
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_TH_0",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_TH_0",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_TH_0",0);	

	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_TH_1",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_TH_1",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_TH_1",0);	

	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_TH_2",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_TH_2",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_TH_2",0);	

	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT0",1); 
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT0",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT0",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY0",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY0",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY0",1);			
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT1",1);
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT1",1);
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT1",0);
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY1",0);
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY1",0);
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY1",1);	

	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT2",1);
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT2",1);
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT2",0);
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY2",0);
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY2",0);
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY2",1);	
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT3",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT3",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT3",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY3",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY3",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY3",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT4",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT4",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT4",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY4",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY4",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY4",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT5",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT5",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT5",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY5",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY5",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY5",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT6",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT6",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT6",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY6",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY6",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY6",1);	
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT7",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT7",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT7",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY7",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY7",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY7",1);	
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT8",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT8",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT8",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY8",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY8",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY8",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT9",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT9",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT9",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY9",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY9",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY9",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT10",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT10",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT10",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY10",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY10",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY10",1);
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT11",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT11",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT11",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY11",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY11",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY11",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT12",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT12",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT12",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY12",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY12",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY12",1);		
	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT13",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT13",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT13",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY13",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY13",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY13",1);		

	Wld_SetObjectRoutine (00,00, "WOODRAYS_NGT14",1); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_NGT14",1); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_NGT14",0); 	
	Wld_SetObjectRoutine (00,00, "WOODRAYS_DAY14",0); 	
	Wld_SetObjectRoutine (19,00, "WOODRAYS_DAY14",0); 	
	Wld_SetObjectRoutine (05,30, "WOODRAYS_DAY14",1);			
	
	
	Wld_InsertNpc(Non_4020_Tablor, "OW_PATH_02");
	Wld_InsertNpc(Non_4021_Bukhart, "OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc(Non_4022_Postronek, "OW_PATH_02");
	Wld_InsertNpc(Non_4023_Korth, "OW_PATH_02");	
	Wld_InsertNpc(Non_4024_Snow, "OW_PATH_02");		
	Wld_InsertNpc(Non_4025_Kron, "OW_PATH_02");	
	Wld_InsertNpc(Non_4026_Nikolas, "OW_PATH_02");	
	Wld_InsertNpc(Non_4027_Kira, "OW_PATH_02");	

	//--------Jäger zum Austausc//hplatz------------------------------------------

	//----------Jäger auf Weg zu NC---------------------------------------------

	//------------Toter Gardist---------------------------------------------

	//-----------Buddler vorm OC---------------------------------------------
	Wld_InsertNpc(Grd_520_Camper, "OC_ROUND_22");
	Wld_InsertNpc(Grd_534_Camper, "OC_ROUND_22");

	
	Wld_InsertNpc(Wolf, "OC_ROUND_15");	//OC Round Wolf-pack
	Wld_InsertNpc(YWolf, "OC_ROUND_15");	//OC Round Wolf-pack
	Wld_InsertNpc(YWolf, "OC_ROUND_15");	//OC Round Wolf-pack		
	Wld_InsertNpc(YWolf, "LOCATION_01_01");	//OC Round Wolf-pack		
	Wld_InsertNpc(YWolf, "OC_ROUND_17");	//OC Round Wolf-pack		
	
	//---------geheimes Drogenlabor-------------------------------
	Wld_InsertNpc(BlackGobboMace, "LOCATION_11_08");
	Wld_InsertNpc(BlackGobboMace, "LOCATION_11_08");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_11_08");

	//--------------NC-Jäger---------------------------------------

	//------------Banditenlager-----------------------------------
	Wld_InsertNpc(King_Troll, "LOCATION_11_08");

	Wld_InsertNpc(Troll, "LOCATION_11_04");
	Wld_InsertNpc(YoungTroll, "LOCATION_11_13");
	Wld_InsertNpc(YoungTroll, "LOCATION_11_07");
	
	//-------------Einsiedler--------------------------------------
	Wld_InsertNpc(Non_1500_Gilbert, "LOCATION_01_07");	//SN: hat eh keinen Dialog
	//B_KillNpc					(Non_1500_Gilbert);
	
	//-------------vor alter Mine--------------------------------------
	//Wld_InsertNpc(Grd_250_Gardist, "OW_OM_ENTRANCE02_WHEEL_USE");
	//Wld_SetObjectRoutine		(0,00, "EVT_AM_LOB_GATE_BIG",1);
	
	// --------ITEMS in den vergessenen Höhlen/Locations -----------------
	Wld_InsertItem			(ItFo_Potion_Health_02, "FP_SLEEP_OW_SNAPPER_HERD1_02");
	
	Wld_InsertItem			(ItFo_Potion_Mana_02, "FP_ROAM_OW_SNAPPER_WOOD05_02");// Snapper Höhle im Wald
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02, "FP_SLEEP_OW_MOLERAT_CAVE4");// Nähe bei Cavalorn
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_01, "FP_ROAM_OW_MOLERAT_06_CAVE_GUARD2");//NÄHE OC 
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_01, "LOCATION_24_IN");//NÄHE NC
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02, "LOCATION_23_CAVE_1_02");// DRUGMONOPOL
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_03, "OW_PATH_07_15_CAVE3"); // BLOODHOUNDLOCATIOn NÄHE NC
	Wld_InsertItem			(Ring_des_Lebens, "FP_ROAM_OW_BLOODHOUND_CANYONCAVE3");
	
	Wld_InsertItem			(ItFo_POTION_HEALTH_02, "FP_ROAM_OW_LURKER_BEACH_01");//LURKERLOCATION RICHTUNG ORKS
	Wld_InsertItem			(ItFo_POTION_HEALTH_03, "FP_ROAM_OW_LURKER_BEACH_04");
	
	//----------------------- MH: Monster werden neu verteilt ----------------------
	Wld_InsertNpc(Orcbiter, "OW_PATH_012"); //Carslon Mis, shouldn't be too strong
	Wld_InsertNpc(Orcbiter, "PATH_CASTLE_TO_WATERFALL");
	
	Wld_InsertNpc(Meatbug, "OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc(Meatbug, "OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc(Wolf, "OW_PATH_02_SPAWN_HOGEWOLF");
	Wld_InsertNpc(WARAN, "OW_WARAN_G_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");


	Wld_InsertNpc(OrcBiter, "OW_WOODRUIN_WOLF_SPAWN");
	Wld_InsertNpc(OrcBiter, "OW_PATH_02");
	Wld_InsertNpc(OrcBiter, "OW_PATH_02");
	// 	Wld_InsertNpc(OrcBiter, "OW_CAVE2_SNAPPER_SPAWN"); //molerats
	// 	Wld_InsertNpc(Snapper, "OW_CAVE2_SNAPPER_SPAWN"); //molerats
	// 	Wld_InsertNpc(Snapper, "OW_CAVE2_SNAPPER_SPAWN"); //molerats
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_SPAWN_TREE");
	//--------------------------------------------------------
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_CAVE1_OC");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCA_05_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCA_05_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Skeleton, "TRUP1");
	Wld_InsertNpc(SkeletonWarrior, "TRUP2");
	Wld_InsertNpc(Skeleton, "TRUP4");
	Wld_InsertNpc(SkeletonWarrior, "TRUP");
	Wld_InsertNpc(SkeletonScout, "SZKIELET");
	//Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_12");
	//Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_12");

	Wld_InsertNpc(Molerat, "OW_GROBOWIEC_02");
	Wld_InsertNpc(Molerat, "OW_GROBOWIEC_02");
	Wld_InsertNpc(Molerat, "OW_GROBOWIEC_02");
	Wld_InsertNpc(Molerat, "OW_GROBOWIEC_02");
	Wld_InsertNpc(Molerat, "OW_GROBOWIEC_02");

	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_OC_PSI");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	
	Wld_InsertNpc(Young_Aligator, "SPAWN_OW_NEARBGOBBO_LURKER_A1");
	Wld_InsertNpc(Aligator, "SPAWN_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc(Young_Aligator, "OW_LAKE_NC_LURKER_SPAWN01");
	Wld_InsertNpc(Young_Aligator, "OW_MOVEMENT_LURKER_NEARBGOBBO01");
	Wld_InsertNpc(Aligator, "OW_MOVEMENT_LURKER_NEARBGOBBO01");	
	Wld_InsertNpc(Young_Aligator, "OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc(Aligator, "OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc(Aligator, "OW_PATH_WARAN05_SPAWN02");
	Wld_InsertNpc(Aligator, "OW_MOVEMENT_LURKER_NEARBGOBBO01");
	Wld_InsertNpc(Aligator, "OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(Aligator, "OW_MOVEMENT_LURKER_NEARBGOBBO03");
	Wld_InsertNpc(Aligator, "OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(Young_Aligator, "SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc(Aligator, "SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc(Aligator, "SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc(Aligator, "SPAWN_OW_BLACKGOBBO_A2");
	Wld_InsertNpc(Aligator, "SPAWN_OW_BLACKGOBBO_A3");	
	Wld_InsertNpc(Aligator, "SPAWN_OW_WARAN_CAVE1_1");	
	Wld_InsertNpc(Aligator, "MOVEMENT_OW_MINICOAST_LURKER_A1");
	Wld_InsertNpc(Aligator, "MOVEMENT_OW_MINICOAST_LURKER_A1");	
	
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGERPATH_OC_PSI_14");

	Wld_InsertNpc(OrcDog, "OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_WOLF04_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_WOLF04_SPAWN01");
	
	//----------------------Mission Bloodflies im Sumpf----------------------
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");
	
	//----------------------------------SHIPWRECK----------------------------------//
	Wld_InsertNpc(Young_Aligator, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(Young_Aligator, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(waran, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(Young_Aligator, "OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc(waran, "OW_COAST_SHIPWRECK_WARAN");
	//-------------------------------------------------------------------------------//
	
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	//--------Rausgenommen--------HORST-----FINGER WEG-----------//
	//Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_PSI");
	//Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_PSI");
	//Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_PSI");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Molerat, "PATH_WALD_OC_MOLERATSPAWN");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_WOODOLDMINE2");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SNAPPER_WOOD05_05");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SNAPPER_WOOD05_05");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SNAPPER_WOOD05_05");	
	
	Wld_InsertNpc(Razor, "SPAWN_OW_SNAPPER_CAVE_DM");
	Wld_InsertNpc(Razor, "SPAWN_OW_SNAPPER_CAVE_DM");
	Wld_InsertNpc(Razor, "SPAWN_OW_SNAPPER_CAVE_DM");
	
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_INWALD_OC2");
	
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Lurker, "SPAWN_OW_LURKER_RIVER2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOODEND2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(Molerat, "FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc(Molerat, "FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHADOW_PSIWOOD_01");
	//Wld_InsertNpc       (Shadowbeast, "SPAWN_OW_SHADOWBEAST1_PSIWOOD_02");		//wird erst später in B_Story_LeftFM() gespawnt (Ulu-Mulu-Jagd)
	Wld_InsertNpc       (Shadowbeast, "SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");
	//Wld_InsertNpc       (Shadowbeast, "OW_PATH_033_TO_CAVE5");					//wird erst später in B_Story_LeftFM() gespawnt (Ulu-Mulu-Jagd)
	Wld_InsertNpc       (Shadowbeast, "SPAWN_OW_SHADOWBEAST_10_03");
	Wld_InsertNpc(Razor, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc(Razor, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc(Razor, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc(Razor, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	Wld_InsertNpc(Aligator, "SPAWN_OW_BLACKGOBBO_A1");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_LONE_WALD_OC3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_ENTRANCE_SCAVENGER_OC1_02");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");

	////////////////////////////////////////////////////////////////////////////
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	//Wld_InsertNpc(OrcBiter, "SPAWN_OW_SNAPPER_OCWOOD1_05_02");

	//######################################################################
	//	Gobbohöhle
	//######################################################################
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");

	// hinter der Brücke
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_GOBBO_LOCATION_29_03");

	// in den Höhlen
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE5");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE5");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE7");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE7");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE10");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE10");
	Wld_InsertNpc(BlackGobboMace, "GOBBO_MASTERCAVE10");
	////////////////////////////////////////////////////////////////////////////


	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OC_PSI_RUIN1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");

	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_BANDIT_02");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc(Aligator, "SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc(Aligator, "SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc(FireWaran, "SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc(FireWaran, "SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE2_02_05");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE_02_05");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_EBENE_02_05");
	
	Wld_InsertNpc(GreenGobboClub, "SPAWN_OW_WARAN_01_BADITS6"); // WEG ZUR TROLLSCHLUCHT,DA MÜSSEN STÄRKERE MONSTER HIN
	Wld_InsertNpc(GreenGobboClub, "SPAWN_OW_WARAN_01_BADITS6");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_WARAN_01_BADITS6");
	
	Wld_InsertNpc(Lurker, "SPAWN_OW_LURKER_RIVER2_BEACH3");
	Wld_InsertNpc(Lurker, "SPAWN_OW_LURKER_RIVER2_BEACH3_2");
	Wld_InsertNpc(Lurker, "SPAWN_OW_LURKER_BEACH_02");
	
	Wld_InsertNpc(GreenGobboClub, "SPAWN_OW_SCA_01_BADITS7");// WEG ZUR TROLLSCHLUCHT,DA MÜSSEN STÄRKERE MONSTER HIN
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_SCA_01_BADITS7");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_SCA_01_BADITS2");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_SCA_01_BADITS2");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_SCA_01_BADITS2");
	
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGEROW_PATH_280");
	
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLYPATH_OC_PSI_14");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLYPATH_OC_PSI_14");

	////////////////////////////////////////////////////////////////////////////
	//-----------------------Spielstart---------------------------------------//
	////////////////////////////////////////////////////////////////////////////

	Wld_InsertNpc       (Meatbug, "SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc       (BlackGobboMace, "SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_OW_MEATBUG_01_01");
	Wld_InsertNpc(BlackGobboMace, "OW_PATH_1_17");
	// hinter der Brücke gegenüber der verlassenen Mine
	Wld_InsertNpc(OrcElite1, "SPAWN_MOLERAT02_SPAWN01");	

	// Plateau über der verlassenen Mine
	Wld_InsertNpc(Dirk, "SPAWN_SCAVENGER_TOTU_LEFT_PLAT");

	Wld_InsertNpc(Snapper, "SPAWN_MOLELRAT_TOTU_LEFT_PLAT4");
	Wld_InsertNpc(Snapper, "SPAWN_MOLELRAT_TOTU_LEFT_PLAT4");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_GOBBO_01_01");

	// Pfad zum OC
	Wld_InsertNpc(RazorNK, "SPAWN_TOTURIAL_CHICKEN_2_2");
	Wld_InsertNpc(RazorNK, "OW_PATH_1_5_4");

	// Sandbank im Fluß
	Wld_InsertNpc(Snapper, "SPAWN_OW_BLOODFLY_E_3");
	Wld_InsertNpc(Snapper, "SPAWN_OW_BLOODFLY_E_3");

	// bei Ratford und Drax am Zaun
	Wld_InsertNpc(RazorNK, "SPAWN_GOBBO_OW_PATH_1_6");
	Wld_InsertNpc(Razor, "SPAWN_GOBBO_OW_PATH_1_6");
	Wld_InsertNpc(RazorNK, "SPAWN_GOBBO_OW_PATH_1_6");

	// zwischen Jägern und Brücke zum OC
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_STARTSCAVNGERBO_01_02");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_STARTSCAVENGER_02_01");


	//------------Mordrags Weg vom Al ins NL-------------------------------//
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_AL_ORC");
	//Wld_InsertNpc(Scavenger, "HELPPOINT");

	// ...

	//------------vom NL zum FMC-------------------------------//
	// 	Wld_InsertNpc(Scavenger, "OW_PATH_075_GUARD2");
	// 	Wld_InsertNpc(Scavenger, "OW_PATH_075_GUARD3");
	// 	Wld_InsertNpc(Scavenger, "OW_PATH_075_GUARD4");
	// 	Wld_InsertNpc(Molerat, "OW_PATH_084");
	// 	Wld_InsertNpc(Molerat, "OW_PATH_086");
	// 	Wld_InsertNpc(Molerat, "OW_PATH_3001");
	// 	Wld_InsertNpc(Wolf, "OW_PATH_3001_MOVE");
	// 	Wld_InsertNpc(Molerat, "OW_PATH_3001_MOVE5");


	//-------------Camp im Lager über Cavalorns Hütte---------------------------
	// Alex: NSCs sollten Hostile sein und bei Sichtung angreifen. Das funzt aber nicht, deshalb wieder rausgenommen
	//	Wld_InsertNpc(NON_1501_WEGELAGERER, "SPAWN_TALL_PATH_BANDITOS2_03");
	//	Wld_InsertNpc(NON_1502_WEGELAGERER, "SPAWN_TALL_PATH_BANDITOS2_03");
	//Wld_InsertNpc(Wolf, "SPAWN_TALL_PATH_BANDITOS2_03");

	//-------------Camp zw. AL und NL ---------------------------
	//Wld_InsertNpc(NON_1503_WEGELAGERER, "OW_PATH_BANDITOS01");
	//Wld_InsertNpc(NON_1504_WEGELAGERER, "OW_PATH_BANDITOS01");
	Wld_InsertNpc(Waran, "OW_PATH_BANDITOS01");

	//-----------------------KLOSTERRUINE---------------------------------//
	// Am Strand
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");

	// vor Baumstamm 
	Wld_InsertNpc(Snapper, "OW_PATH_ABYSS_4");
	Wld_InsertNpc(Snapper, "OW_PATH_ABYSS_4");

	// hinter Baumstamm 
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE_02");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE_02");
	Wld_InsertNpc(Snapper, "OW_PATH_179");
	Wld_InsertNpc(Snapper, "OW_PATH_179");

	// in der Grabenhöhle unter dem Baumstamm
	Wld_InsertNpc(Snapper, "OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc(Snapper, "OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc(Snapper, "SPAWN_ABYSS_TO_CAVE_MOVE");
	Wld_InsertNpc(Snapper, "SPAWN_ABYSS_TO_CAVE_MOVE");

	// Vor der Mauer
	Wld_InsertNpc       (Meatbug, "OW_PATH_175_MEATBUG");
	Wld_InsertNpc       (Meatbug, "OW_PATH_175_MEATBUG");
	Wld_InsertNpc       (Meatbug, "OW_PATH_175_MEATBUG");
	
	// im Hof
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	
	// Höhle vor dem Bonusraum
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");

	Wld_InsertNpc(Shadowbeast, "OW_PATH_TEMPELRUIN06");

	// Auf hinterer Plattform
	//Wld_InsertNpc(Troll, "OW_RUIN_TROLL");	//wird erst später in B_Story_LeftFM() gespawnt!
	

	//-----------------------STEINKREIS---------------------------------//
	// Höhle auf Bergweg vor Milten
	Wld_InsertNpc(Bloodhound, "OW_PATH_07_15_CAVE3");
	Wld_InsertNpc(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc(Snapper,	"OW_PATH_07_15");
	Wld_InsertNpc(Snapper,	"OW_PATH_07_15");

	// Bloodhound bei Milten 
	Wld_InsertNpc(Bloodhound, "OW_PATH_274");

	// Untote in der Gruft unter dem Steinkreis 
	//	Wld_InsertNpc(ZombieTheKeeper, "LOCATION_05_02_STONEHENGE4");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE2");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE2");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE3");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE3");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE5");
	Wld_InsertNpc(SkeletonSH,			"LOCATION_05_02_STONEHENGE5");


	//------------------TROLLSCHLUCHT-------------------------------
	// 1. Gruppe
	Wld_InsertNpc(GreenGobboClub, "LOCATION_12_01");
	Wld_InsertNpc(GreenGobboClub, "LOCATION_12_01");
	Wld_InsertNpc(GreenGobboClub, "LOCATION_12_01");
	Wld_InsertNpc(GreenGobboSword, "LOCATION_12_01");
	
	// 2. Gruppe
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	
	// 3. Gruppe
	Wld_InsertNpc(GreenGobboSword, "LOCATION_12_14");
	Wld_InsertNpc(GreenGobboSword, "LOCATION_12_14");
	Wld_InsertNpc(GreenGobboSword, "LOCATION_12_14");
	Wld_InsertNpc(GreenGobboSword, "LOCATION_12_14");
	// NEW: 4. Group: Phylosophy stone guardians
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE");
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE");
	Wld_InsertNpc(BlackGobboMace, "SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE");
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE");	
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE");	
	// bei der Winde
	Wld_InsertNpc(Troll, "LOCATION_12_14");
	
	// Fokusplatform
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	

	//-------------------------FELSENFESTUNG------------------------
	// Berggebiet vor Brücke
	//Wld_InsertNpc(Bloodhound, "PLATEAU_ROUND01");
	//Wld_InsertNpc(Bloodhound, "PLATEAU_ROUND02");
	Wld_InsertNpc(Bloodhound, "PLATEAU_ROUND02_CAVE");
	Wld_InsertNpc(Bloodhound, "PLATEAU_ROUND02_CAVE_MOVE");
	Wld_InsertNpc(Bloodhound, "LOCATION_18_OUT");
	//    Wld_InsertNpc(Bloodhound, "PLATEAU_ROUND02");
	Wld_InsertNpc(Harp5, "PATH_TO_PLATEAU04");
	Wld_InsertNpc(Harp4, "PATH_TO_PLATEAU04");
	Wld_InsertNpc(Harp3, "PATH_TO_PLATEAU04");
	Wld_InsertNpc(Harp2, "PATH_TO_PLATEAU04");
	Wld_InsertNpc(Harp1, "PATH_TO_PLATEAU04");

	

	//Brücke
	

	
	//----------------------------SUMPF-------------------------------------
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI29");
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI28");
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI23");
	Wld_InsertNpc(DraconianScout, "PATH_NEW_AROUND_PSI25");
	Wld_InsertNpc(DraconianScout, "PATH_NEW_AROUND_PSI27");		
	Wld_InsertNpc(DraconianOfficer, "PATH_NEW_AROUND_PSI26");	
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI22");
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI22");					
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI22");		
	Wld_InsertNpc(PSI_NovLZombie, "PATH_NEW_AROUND_PSI30");
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI21");  					
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI21");					
	Wld_InsertNpc(Bloodfly, "PATH_NEW_AROUND_PSI21");	
	Wld_InsertNpc(DraconianScout, "PATH_NEW_AROUND_PSI17");  		
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI17");			
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI20");  		
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI20C");	
	Wld_InsertNpc(DraconianSoldier, "PATH_NEW_AROUND_PSI18");
	Wld_InsertNpc(SwampGolem, "PATH_NEW_AROUND_PSI18_2");
	Wld_InsertNpc(Skeleton2HAxeWarrior, "PATH_NEW_AROUND_PSI16");
	Wld_InsertNpc(Skeleton2HAxeWarrior, "PATH_NEW_AROUND_PSI16");
	Wld_InsertNpc(Dirk, "PATH_NEW_AROUND_PSI10");
	Wld_InsertNpc(Dirk, "PATH_NEW_AROUND_PSI7");
	Wld_InsertNpc(Lurker, "PATH_NEW_AROUND_PSI5");
	Wld_InsertNpc(Lurker, "PATH_NEW_AROUND_PSI4");
	Wld_InsertNpc(Aligator, "PATH_NEW_AROUND_PSI6");
	Wld_InsertNpc(Aligator, "PATH_NEW_AROUND_PSI2");
	Wld_InsertNpc(SwampShark, "PATH_NEW_AROUND_PSI3");	
	Wld_InsertNpc(SwampShark, "PATH_AROUND_PSI19");	
	Wld_InsertNpc(SwampShark, "PATH_AROUND_PSI21");	
	Wld_InsertNpc(Aligator, "PATH_NEW_AROUND_PSI1");	
	Wld_InsertNpc(SwampShark, "PATH_AROUND_PSI18");	
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");  					
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");					
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");					
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");		
	Wld_InsertNpc(SwampShark, "PATH_AROUND_PSI17");	
	Wld_InsertNpc(SwampGolem, "PATH_AROUND_PSI12");	
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKEHERB_2_2");	
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKEHERB_2_2");	
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_2_1");		
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_2_1_MOVEMENT");		
	Wld_InsertNpc(DraconianOfficer, "PATH_TAKE_HERB_MOVEMENT2");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");	
	Wld_InsertNpc(DraconianScout, "PATH_AROUND_PSI09");		
	Wld_InsertNpc(SwampGolem, "PATH_AROUND_PSI08");		
	Wld_InsertNpc(SwampGolem, "PATH_AROUND_PSI06");		
	Wld_InsertNpc(SwampShark, "PATH_TAKE_HERB_024");		
	Wld_InsertNpc(Aligator, "PATH_AROUND_PSI10");		
	Wld_InsertNpc(Aligator, "PATH_AROUND_PSI10");		
	Wld_InsertNpc(Aligator, "PATH_TAKE_HERB_023");		
	Wld_InsertNpc(Aligator, "PATH_TAKE_HERB_023");			
	Wld_InsertNpc(Young_Aligator, "PATH_TAKE_HERB_023");			
	Wld_InsertNpc(Lurker, "PATH_TAKE_HERB_022");		
	Wld_InsertNpc(Lurker, "PATH_TAKE_HERB_021");
	Wld_InsertNpc(SwampGolem, "PATH_TAKE_HERB_020");
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKE_HERB_03");	
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKE_HERB_03");		
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_04");		
	Wld_InsertNpc(DraconianOfficer, "PATH_TAKE_HERB_02");		
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKE_HERB_03_MOVEMENT");		
	Wld_InsertNpc(DraconianSoldier, "PATH_TAKE_HERB_03_MOVEMENT2");		
	Wld_InsertNpc(Aligator, "PATH_TAKE_HERB_05");		
	Wld_InsertNpc(Aligator, "PATH_TAKE_HERB_05");		
	Wld_InsertNpc(Waran, "PATH_TAKE_HERB_06_MOVEMENT2");		
	Wld_InsertNpc(Waran, "PATH_TAKE_HERB_05");		
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_06");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_06_MOVEMENT");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_06_MOVEMENT");		
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_06_MOVEMENT");			
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_07");			
	Wld_InsertNpc(DraconianScout, "PATH_TAKE_HERB_07");			
	Wld_InsertNpc(SwampGolem, "PATH_TAKE_HERB_08");		
	
	
	
	//-----------------------ORK-GEBIET---------------------------------//
	
	Wld_InsertNpc(Razor, "OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc(Razor, "OW_PATH_SNAPPER02_SPAWN01");
	Wld_InsertNpc(Razor, "OW_PATH_SNAPPER02_SPAWN01");
	
	Wld_InsertNpc(Razor, "SPAWN_OW_SNAPPER_INCAVE_DM2");
	Wld_InsertNpc(Razor, "SPAWN_OW_SNAPPER_INCAVE_DM2");
	
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SCAVENGER_01_DEMONT5");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SCAVENGER_01_DEMONT5");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SCAVENGER_01_DEMONT5");
	
	Wld_InsertNpc(FireWaran, "OW_PATH_SCAVENGER15_SPAWN01");

	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SCAVENGER_ORC_03");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_SCAVENGER_ORC_03");
	
	
	Wld_InsertNpc(OrcScoutGYD, "OW_PATH_RUIN_7");
	Wld_InsertNpc(OrcScoutGYD, "OW_PATH_RUIN_7");
	
	
	
	// östlicher Zugang vom AL
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_SNAPPER_OW_ORC");

	Wld_InsertNpc(OrcWarrior1, "OW_PATH_104");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_104");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_104");
	Wld_InsertNpc(OrcWarrior2, "OW_PATH_104");
	
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");
	Wld_InsertNpc(OrcDog, "OW_PATH_BLACKWOLF07_SPAWN01");

	Wld_InsertNpc(OrcScout, "CASTLE_2");

	Wld_InsertNpc(OrcWarrior1, "CASTLE_3");
	Wld_InsertNpc(OrcWarrior1, "CASTLE_3");
	Wld_InsertNpc(OrcWarrior1, "CASTLE_4");
	Wld_InsertNpc(OrcWarrior2, "OW_PATH_109");

	// westlicher Zugang vom AL

	// ALEX: zu dicht am Ausgang. Kommt rausgerannt und killt alles... 
	//	Wld_InsertNpc(OrcScout, "OW_ORC_ORCDOG_MOVEMENT_02");

	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");
	Wld_InsertNpc(OrcDog, "SPAWN_OW_BLACKWOLF_02_01");

	Wld_InsertNpc(OrcWarrior1, "OW_PATH_195");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_195");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_195");
	Wld_InsertNpc(OrcWarrior2, "OW_PATH_195");

	Wld_InsertNpc(Orcdog, "OW_ORC_ORCDOG_SPAWN01");
	Wld_InsertNpc(Orcdog, "OW_ORC_ORCDOG_SPAWN01");
	Wld_InsertNpc(Orcdog, "OW_ORC_ORCDOG_SPAWN01");

	Wld_InsertNpc(OrcWarrior1, "OW_ORC_ORCDOG_SPAWN01_MOVEMENT");
	Wld_InsertNpc(OrcWarrior1, "OW_ORC_ORCDOG_SPAWN01_MOVEMENT");

	Wld_InsertNpc(OrcBiter, "SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_MOLERAT_ORC_04");
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_MOLERAT_ORC_04");

	Wld_InsertNpc(OrcBiter, "OW_PATH_103");
	Wld_InsertNpc(OrcBiter, "OW_PATH_103");

	// Zugang von NL
	Wld_InsertNpc(OrcBiter, "SPAWN_OW_WOLF_NEAR_SHADOW3");

	Wld_InsertNpc(OrcBiter, "OW_PATH_3_07");
	Wld_InsertNpc(OrcBiter, "OW_PATH_3_07");
	Wld_InsertNpc(OrcBiter, "OW_PATH_3_07");
	Wld_InsertNpc(OrcBiter, "OW_PATH_3_07");

	Wld_InsertNpc(OrcScout, "OW_PATH_3_06");

	Wld_InsertNpc(OrcWarrior1, "OW_PATH_3_05");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_3_05");
	Wld_InsertNpc(OrcWarrior1, "OW_PATH_3_05");
	Wld_InsertNpc(OrcWarrior2, "OW_PATH_3_05");

	// Ork-Stadt: Brücke
	Wld_InsertNpc(OrcWarrior2, "OW_ORCBRIDGE_END");
	Wld_InsertNpc(OrcWarrior2, "OW_ORCBRIDGE_END");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_BRIDGE_GUARD");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_BRIDGE_GUARD");

	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_02_MOVEMENT");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_02_MOVEMENT");

	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_02_MOVE");
	Wld_InsertNpc(OrcWarrior3, "OW_ORC_PATH_02_MOVE");

	// Ork-Stadt: vorderes Lagerfeuer
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_PLACE_01_MOVEMENT");
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_PLACE_01_MOVEMENT2");
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_PLACE_01_MOVEMENT3");
	Wld_InsertNpc(OrcPeasantDrum, "OW_ORC_HUT_01");
	Wld_InsertNpc(OrcPeasantDrum, "OW_ORC_HUT_02");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_HUT_01");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_PLACE_01_MOVEMENT");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_HUT_02");
	
	// Ork-Stadt: inneres Tor
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_02_GUARD_SPAWN");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_02_GUARD_SPAWN");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_04");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_04_MOVEMENT");
	Wld_InsertNpc(OrcWarrior2, "OW_ORC_PATH_04_MOVEMENT");
	Wld_InsertNpc(OrcWarrior3, "OW_ORC_PATH_WALL");

	// Ork-Stadt: inneres Lagerfeuer
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_HUT_03");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_HUT_03");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_HUT_04");
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_HUT_03_MOVEMENT");
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_HUT_03_MOVEMENT");
	Wld_InsertNpc(OrcPeasantDance, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(OrcPeasantDrum, "OW_ORC_HUT_03");
	Wld_InsertNpc(OrcPeasantDrum, "OW_ORC_HUT_04");

	// Ork-Stadt: Durchgang zum Grubenplatz
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_PATH_06_2");
	Wld_InsertNpc(OrcPeasantEatAndDrink,	"OW_ORC_PATH_06_2");
	Wld_InsertNpc(OrcWarrior2,			"OW_ORC_PATH_06_4");
	Wld_InsertNpc(OrcWarrior2,			"OW_ORC_PATH_06_4");

	// Ork-Stadt: Schamanenhöhle
	Wld_InsertNpc(OrcWarrior4, "OW_ORC_SHAMAN_PATH1");
	Wld_InsertNpc(OrcWarrior4, "OW_ORC_SHAMAN_PATH1");
	
	// Ork-Stadt: Zugang zum Säulenplatz
	Wld_InsertNpc(OrcWarrior3, "OW_PATH_06_13_GUARD");
	Wld_InsertNpc(OrcWarrior4, "OW_PATH_06_13_GUARD1");
	Wld_InsertNpc(OrcWarrior4, "OW_PATH_06_13_GUARD1");
	Wld_InsertNpc(OrcWarrior4, "OW_PATH_06_13_GUARD2");

	// Ork-Stadt: Zugang zum Säulenplatz
	Wld_InsertNpc(OrcShaman, "OW_PATH_06_14_HEILIGTUM");
	Wld_InsertNpc(OrcShaman, "OW_PATH_06_14_HEILIGTUM2");
	Wld_InsertNpc(OrcShaman, "OW_PATH_06_14_HEILIGTUM3");
	Wld_InsertNpc(OrcShaman, "OW_PATH_06_14_HEILIGTUM4");

	//-----------------------Dämonenbeschwörer---------------------------------//
	Wld_InsertNpc(StoneGolem,	"OW_PATH_123");
	Wld_InsertNpc(IceGolem, "OW_PATH_125");
	Wld_InsertNpc(FireGolem, "OW_PATH_127");

	//-----------------------Kastell---------------------------------//
	Wld_InsertNpc(OrcScout,	"BRIDGE_CASTLE_TO_PLATEAU");
	Wld_InsertNpc(OrcScout,	"CASTLE_16");
	
	//--------------NEBELTURM---------------------------------------//
	//1. Raum
	Wld_InsertNpc(Skeleton, 			"OW_FOGDUNGEON_06"); 

	//2. Raum	
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_SKELETT_SPAWN");
	Wld_InsertNpc(Skeleton, 			"OW_FOGDUNGEON_09"); 

	//3. Raum (mit 2. Wendeltreppe nach unten)
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_SKELETT_SPAWN");

	//Stollensystem nach 2. Wendeltreppe
	Wld_InsertNpc(Skeleton,			"OW_FOGDUNGEON_16");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_28");
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_28");
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_23");
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_24");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_19");
	Wld_InsertNpc(Skeleton,			"OW_FOGDUNGEON_20");

	//Große Höhle nach Stollensystem
	Wld_InsertNpc(Skeleton,			"OW_FOGDUNGEON_36"); 
	Wld_InsertNpc(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT"); 
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_36_MOVEMENT"); 
	Wld_InsertNpc(Skeleton,			"OW_FOGDUNGEON_36_MOVEMENT2"); 
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_36_MOVEMENT2");
	Wld_InsertNpc(SkeletonWarrior,	"OW_FOGDUNGEON_37"); 
	Wld_InsertNpc(SkeletonMage_fogtower, "OW_FOGDUNGEON_37");

	//2. Stollensystem hinter großer Höhle
	Wld_InsertNpc(Skeleton, 			"OW_FOGDUNGEON_40"); 
	Wld_InsertNpc(SkeletonScout, 	"OW_FOGDUNGEON_40");
	Wld_InsertNpc(Skeleton, 			"OW_FOGDUNGEON_43"); 
	Wld_InsertNpc(SkeletonWarrior, 	"OW_FOGDUNGEON_43"); 
	
	//---------------------ALTERMAGIERTURM----------------------------//
	
	Wld_InsertNpc(SkeletonWarrior, "MAGICTOWER_01"); 
	Wld_InsertNpc(SkeletonScout, "MAGICTOWER_01"); 
	
	Wld_InsertNpc(SkeletonWarrior, "MAGICTOWER_STAIRS"); 
	Wld_InsertNpc(SkeletonScout, "MAGICTOWER_STAIRS"); 

	Wld_InsertNpc(SkeletonMage, "MAGICTOWER_02"); 

	Wld_InsertNpc(Zombie, "MAGICTOWER_COR"); 
	Wld_InsertNpc(Zombie2, "MAGICTOWER_COR"); 

	Wld_InsertNpc(Zombie3, "MAGICTOWER_SAT"); 
	Wld_InsertNpc(Zombie4, "MAGICTOWER_SAT"); 

	Wld_InsertNpc(Zombie, "MAGICTOWER_03_MOVEMENT"); 
	Wld_InsertNpc(Zombie2, "MAGICTOWER_03_MOVEMENT"); 
	
	Wld_InsertNpc(Zombie3, "MAGICTOWER_03_MOVEMENT_2"); 
	Wld_InsertNpc(Zombie4, "MAGICTOWER_03_MOVEMENT_2"); 
	
	Wld_InsertNpc(Zombie, "MAGICTOWER_04"); 
	Wld_InsertNpc(Zombie2, "MAGICTOWER_04"); 
	Wld_InsertNpc(Zombie3, "MAGICTOWER_04"); 
	Wld_InsertNpc(Zombie4, "MAGICTOWER_04"); 

	Wld_InsertNpc(Zombie, "MAGICTOWER_06"); 
	Wld_InsertNpc(Zombie2, "MAGICTOWER_06"); 
	Wld_InsertNpc(Zombie3, "MAGICTOWER_06"); 
	Wld_InsertNpc(Zombie4, "MAGICTOWER_06"); 
	//////////////////////////////////////////////////////////////////////////////////////////////////
};

FUNC VOID INIT_SUB_SURFACE ()
{
	/*----------------------------------------------------------*/
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_GROUND2_01",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_GROUND2_01",0);
	
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(22,00, "FIREPLACE", 1);
	Wld_SetMobRoutine			(05,00, "FIREPLACE", 0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_01",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_02",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH_03",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_01",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_02",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_03",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_04",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_05",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_06",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_06",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_07",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_07",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_08",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_08",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_09",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_09",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_10",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_10",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_11",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_11",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_12",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_12",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_13",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_13",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_14",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_14",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_15",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_15",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_16",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_16",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_17",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_17",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_18",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_18",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_19",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_19",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_20",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_20",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_21",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_21",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_22",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_22",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_23",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_23",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_24",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_24",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_25",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_25",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_26",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_26",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_27",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_27",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_28",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_28",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_29",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_29",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_HIGH2_30",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_HIGH2_30",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_01",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_01",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_02",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_02",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_03",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_03",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_04",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_04",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_05",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_05",0);
	
	Wld_SetObjectRoutine (00,00, "OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (20,00, "OW_FIREPLACE_PCHIGH2_06",1);
	Wld_SetObjectRoutine (05,00, "OW_FIREPLACE_PCHIGH2_06",0);
	// aus Orc-City
	Wld_SetMobRoutine	(00,00, "FIREPLACE", 1);
	
	/*************************************************************/
	// PlayVideo		("intro25fr.bik");
};

func VOID STARTUP_DEMONTOWER()
{
	STARTUP_SUB_DEMONTOWER();
};

func VOID INIT_DEMONTOWER()
{
	INIT_SUB_DEMONTOWER();
};

func VOID STARTUP_FREEMINCAMP()
{
	STARTUP_SUB_FREEMINECAMP();
};

func VOID INIT_FREEMINCAMP()
{
	INIT_SUB_FREEMINECAMP();
};

func VOID STARTUP_PSICAMP()
{
	STARTUP_SUB_PSICAMP();
};

func VOID INIT_PSICAMP()
{
	INIT_SUB_PSICAMP();
};

func VOID STARTUP_NEWCAMP()
{
	STARTUP_SUB_NEWCAMP();
};

func VOID INIT_NEWCAMP()
{
	INIT_SUB_NEWCAMP();
};

func VOID STARTUP_OLDCAMP()
{
	STARTUP_SUB_OLDCAMP();
};

func VOID INIT_OLDCAMP()
{
	INIT_SUB_OLDCAMP();
};

func VOID STARTUP_SURFACE()
{
	STARTUP_SUB_SURFACE();
};

func VOID INIT_SURFACE()
{
	INIT_SUB_SURFACE();
};

func VOID STARTUP_SUB_PIRATEBAY()
{
	/////////////////////////
	//Pirates
	/////////////////////////
	Wld_InsertNpc(PIR_2600_Angus, "OW_PIR_CAMPFIRE");
	Wld_InsertNpc(PIR_2601_Hank, "OW_PIR_CAMPFIRE");
	//	Wld_InsertNpc(My_Wolf, "OW_PIR_CAMPFIRE");	
	Wld_InsertNpc(PIR_2602_Rodney, "OW_PIR_CAMPFIRE");
	//Dead Pirates
	Wld_InsertNpc(PIR_2611_Skip, "PL_DEAD");
	Wld_InsertNpc(PIR_2606_Dustin, "LOCATION_26_01_2");
	
	//Tony + Guards now are added to world when Pirats are guiding hero
	//	Wld_InsertNpc			 	(RBL_2604_Tony, "OW_HUN_SMALLCAMP");
	//	Wld_InsertNpc			 	(GRD_2599_Guard, "OW_HUN_SMALLCAMP");
	//	Wld_InsertNpc			 	(GRD_4063_Guard, "OW_HUN_SMALLCAMP");
	var C_NPC skip; skip = Hlp_GetNpc(PIR_2611_Skip);
	B_ChangeAttribute	(skip, ATR_HITPOINTS, -skip.attribute[ATR_HITPOINTS_MAX]);	
	var C_NPC dustin; dustin = Hlp_GetNpc(PIR_2606_Dustin);
	B_ChangeAttribute	(dustin, ATR_HITPOINTS, -dustin.attribute[ATR_HITPOINTS_MAX]);
	//GRD - Anti Escape	
	Wld_InsertNpc(GRD_2711_Gardist, "OW_PATH_199");
	//end	
};

func VOID STARTUP_SUB_REBELCAMP ()
{
	///////////////////////////////////////////////////
	//Rebel Camp
	///////////////////////////////////////////////////
	//Fireplaces
	Wld_AssignRoomToGuild("OR1",GIL_HUN);
	Wld_AssignRoomToGuild("OR2",GIL_HUN);		
	//Hunters
	
	/***************************************
	Added by Sher
	****************************************/	
	Wld_InsertNpc(HUN_20254_Grd, "DEEP_WP"); // Deep grd


	
	//****************************************
	Wld_InsertNpc(HUN_336_Cavalorn, "OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc(HUN_818_Ratford, "OW_PATH_02");	
	Wld_InsertNpc(HUN_858_Quentin, "OW_PATH_02");
	Wld_InsertNpc(HUN_819_Drax, "OW_PATH_02");
	Wld_InsertNpc(HUN_859_Aidan, "OW_PATH_02");	
	//	Wld_InsertNpc(HUN_828_Bruce, "OW_PATH_02"); //AT CHAPTER 3 NC ARRIVED
	Wld_InsertNpc(HUN_729_Kharim, "OW_PATH_02"); 
	Wld_InsertNpc(HUN_1422_GorHanis, "OW_PATH_02"); 
	//	Wld_InsertNpc(PC_Thief, "OW_PATH_02");
	Wld_InsertNpc(HUN_309_Whistler, "OW_PATH_02");	
	Wld_InsertNpc(HUN_2615_Abel, "OW_PATH_02");	
	
	//Finding new people
	Wld_InsertNpc(HUN_2609_Gestath, "OW_PATH_02");	
	Wld_InsertNpc(PIR_2612_JackAlligator, "OW_PATH_02");
	Wld_InsertNpc(Grd_205_Scorpio, "OC1"); //WitPacho
	Wld_InsertNpc(GRD_224_Pacho, "OC1");
	Wld_InsertNpc(RBL_2617_Carlson, "OW_PATH_02");//witScorpio
	
	//Magicans
	Wld_InsertNpc(mag_1604_Leren, "OW_PATH_02");
	Wld_InsertNpc(MAG_1330_BaalParvez, "OW_PATH_02");
	Wld_InsertNpc(PC_Mage, "OC1");

	//Rebeliants
	Wld_InsertNpc(RBL_311_Fisk, "OW_PATH_02");	 
	//	Wld_InsertNpc(RBL_826_Mordrag, "OW_PATH_02");	
	Wld_InsertNpc(RBL_2605_Garry, "OW_PATH_02");	

	Wld_InsertNpc(RBL_1331_BaalTaran, "OW_PATH_02");
	Wld_InsertNpc(RBL_331_Fingers, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2613_Vam, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2614_Fox, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2608_BeerDrinker, "OW_PATH_02"); 		
	Wld_InsertNpc(RBL_581_Snaf, "OW_PATH_02");
	Wld_InsertNpc(RBL_4011_Leaf, "OW_PATH_02");
	
	//Snaf Molerats
	Wld_InsertNpc(Snf_Molerat1, "OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc(Snf_Molerat2, "OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc(Snf_Molerat3, "OW_CAVE2_SNAPPER_MOVEMENT2");
	Wld_InsertNpc(Snf_Molerat4, "OW_CAVE2_SNAPPER_MOVEMENT2");
	
	Wld_InsertNpc(RBL_2616_Mark, "OW_PATH_02");
	Wld_InsertNpc(RBL_2618_Hark, "OW_PATH_02");
	Wld_InsertNpc(RBL_2619_CUP, "OW_PATH_02");
	/* NC_ARRIVED	
//	Wld_InsertNpc(RBL_8730_Dylan, "OW_PATH_02");	//ADD in 3 Chapter NC_ARRIVED
//	Wld_InsertNpc(RBL_826_Mordrag, "OW_PATH_02");  //ADD in 3 Chapter NC_ARRIVED	
//	
/* PSI_ARRIVED
	Wld_InsertNpc		   	 	(RBL_1333_BaalIsidro, "OW_HUN_SMALLCAMP");*/
	Wld_InsertNpc(RBL_1332_BaalKagan, "OW_PATH_02");
	//	Wld_InsertNpc(PC_Psionic, "OW_PATH_02");
	
	/*	Wld_InsertNpc(RBL_2331_Zex, "OW_PATH_02");
	Wld_InsertNpc(RBL_2402_Terry, "OW_PATH_02");	
*/
	/* BANDITS */
	Wld_InsertNpc(org_4050_camper1, "OW_PATH_02");	 //Hut 14,SnafPlatz
	Wld_InsertNpc(org_4051_camper2, "OW_PATH_02");
	Wld_InsertNpc(org_4052_camper3, "OW_PATH_02");
	Wld_InsertNpc(org_4053_camper4, "OW_PATH_02");
};

func void INIT_SUB_REBELCAMP ()
{
	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_0",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_0",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_0",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_01",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_01",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_02",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_02",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_03",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_03",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_04",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_04",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_05",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_05",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_06",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_06",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_07",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_07",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_08",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_08",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_08",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_09",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_09",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_10",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_10",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_10",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_11",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_11",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_11",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_12",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_12",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_12",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_13",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_13",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_13",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_14",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_14",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_14",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_15",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_15",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_15",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_16",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_16",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_16",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_17",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_17",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_17",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_18",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_18",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_18",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_19",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_19",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_19",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_20",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_20",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_20",0);

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_21",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_21",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_21",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_22",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_22",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_22",0);	

	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_23",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_23",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_23",0);	
	
	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_24",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_24",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_24",0);	
	
	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_25",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_25",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_25",0);
	
	Wld_SetObjectRoutine (00,00, "OR_FIREPLACE_HIGH_26",1);
	Wld_SetObjectRoutine (20,00, "OR_FIREPLACE_HIGH_26",1);
	Wld_SetObjectRoutine (05,00, "OR_FIREPLACE_HIGH_26",0);		
};

FUNC VOID STARTUP_SUB_OLDMINECAMP ()
{
	Wld_InsertNpc(Grd_3000_William, "OMC_ENT");			
	Wld_InsertNpc(GRD_3001_GateGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3036_GateGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3003_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3004_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3005_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3006_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3007_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3008_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3009_GateGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3010_GateGuard, "OMC_ENT");	
	Wld_InsertNpc(GRD_3011_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3012_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3013_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3014_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3015_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3016_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3017_Guard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3018_VlkGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3019_VlkGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3020_VlkGuard, "OMC_ENT");		
	Wld_InsertNpc(GRD_3021_GateGuard, "OMC_ENT");	
	Wld_InsertNpc(GRD_3022_GateGuard, "OMC_ENT");	
	
	Wld_InsertNpc(Vlk_3030_Worker, "OMC_ENT");		
	Wld_InsertNpc(Vlk_3031_Worker, "OMC_ENT");		
	Wld_InsertNpc(Vlk_3032_Worker, "OMC_ENT");		
	Wld_InsertNpc(Vlk_3033_Worker, "OMC_ENT");		
	Wld_InsertNpc(Vlk_3034_Worker, "OMC_ENT");	
	Wld_InsertNpc(Vlk_3035_Worker, "OMC_ENT");				
};	


//-------- eigentliche Startup des Spiels --------
func void STARTUP_TriggerScripts()
{
	printdebug("INIT/STARTUP: STARTUP_TriggerScripts Called!");
	// Questtest normal framerate: 256 constantly
	Wld_SendTrigger("TIMETRIGGER7");	//EVT_TRIGGER7 delay: 1
	Wld_SendTrigger("POISON_TRIGGER");	//-(~40f) ;-( //EVT_POISON delay: 0.100000121
	Wld_SendTrigger("COMPASS_TRIGGER");	//COMPASS_TRIGGER delay: 0.00999999978 
	// 	
	//Wld_SendTrigger("TIMETRIGGER3"); //runesword trigger  (effect) //EVT_TRIGGER3 delay: 1
	// 	//day change
	Wld_SetObjectRoutine (23, 58, "TIMETRIGGER1", 1);	//EVT_TRIGGER1 delay: 1
	Wld_SetObjectRoutine (23, 59, "TIMETRIGGER1", 0);		
	// 	
	Wld_SendTrigger("PERFRAMETRIGGER"); // -0 frames idle;   //F_PERFRAMETRIGGER delay: 9.99999975e-005
	Wld_SendTrigger("DAMAGE_TRIGGER"); // -0 frames idle;		//DAMAGE_TRIGGER_FUNC delay: 0.0500000007
};
func void STARTUP_Runes()
{
	// Musz¹ byc w invisible:
	RuneCharge = RuneChargeMax;	
	Wld_InsertNpc(RuneSword_Now, "INVISIBLE1");
	//1
	Wld_InsertNpc(RuneSword_Light, "INVISIBLE1");	
	Wld_InsertNpc(RuneSword_FireBolt, "INVISIBLE1");	
	Wld_InsertNpc(RuneSword_ThunderBolt, "INVISIBLE1");	
	//2
	Wld_InsertNpc(RuneSword_Sleep, "INVISIBLE2");	
	Wld_InsertNpc(RuneSword_WindFist, "INVISIBLE2");	
	Wld_InsertNpc(RuneSword_Heal, "INVISIBLE2");
	Wld_InsertNpc(RuneSword_StuningBall, "INVISIBLE2");
	
	//3
	Wld_InsertNpc(RuneSword_IceCube, "INVISIBLE3");	
	Wld_InsertNpc(RuneSword_ThunderBall, "INVISIBLE3");	
	Wld_InsertNpc(RuneSword_Charm, "INVISIBLE3");	
	Wld_InsertNpc(RuneSword_Pyrokinesis, "INVISIBLE3");		
	Wld_InsertNpc(RuneSword_FireBall, "INVISIBLE4");		
	Wld_InsertNpc(RuneSword_LifeDrain, "INVISIBLE4");		
	Wld_InsertNpc(RuneSword_Curse, "INVISIBLE4");		

	//4
	Wld_InsertNpc(RuneSword_ChainLightning, "INVISIBLE4");	
	Wld_InsertNpc(RuneSword_FireStorm, "INVISIBLE5");	
	Wld_InsertNpc(RuneSword_stormfist, "INVISIBLE5");	
	Wld_InsertNpc(RuneSword_destroyundead, "INVISIBLE5");	
	Wld_InsertNpc(RuneSword_HolyFire, "INVISIBLE5");		
	Wld_InsertNpc(RuneSword_FireWall, "INVISIBLE6");		
	//5
	Wld_InsertNpc(RuneSword_IceWave, "INVISIBLE6");	
	Wld_InsertNpc(RuneSword_FireRain, "INVISIBLE6");
	Wld_InsertNpc(RuneSword_Thunder, "INVISIBLE6");
	
	//6	
	Wld_InsertNpc(RuneSword_BreathofDead, "INVISIBLE7");		
	Wld_InsertNpc(RuneSword_Meteor, "INVISIBLE7");			
	//new
};

func void STARTUP_HandlerContainers()
{
	//Ork: TODO sprecyzuj swiaty,te containery wystarczy zeby byly w WORLD.ZEN
	//Handlers Containers(R)
	
	Wld_InsertNpc(Rodney_Container, "INVISIBLE7");		
	Wld_InsertNpc(Drax_Container,	"INVISIBLE7");		
	Wld_InsertNpc(Fisk_Container,	"INVISIBLE8");		
	Wld_InsertNpc(Fox_Container, "INVISIBLE8");		
	Wld_InsertNpc(Taran_Container, "INVISIBLE8");		
	Wld_InsertNpc(Leren_Container, "INVISIBLE8");		
	Wld_InsertNpc(Jeff_Container,	"INVISIBLE8");	
	Wld_InsertNpc(Vam_Container,	"INVISIBLE9");
	Wld_InsertNpc(Riordian_Container, "INVISIBLE9"); //dodane 2012-11-14
	Wld_InsertNpc(Wolf_Container,	"INVISIBLE9"); //dodane 2012-11-14
	Wld_InsertNpc(Bartender_Container, "INVISIBLE9");
	
	printdebug("INIT/STARTUP: STARTUP_HandlerContainers called!");
};	

func void STARTUP_NewsNPC()
{
	Wld_InsertNpc(Mob_Spawner, "INVISIBLE9");
};

FUNC VOID INIT_Variables()
{
	A_munition=0;
	Last_A_munition=0;
	B_munition=0;
	Last_B_munition=0;
	
	//if blanks, init run/walk keys
	if(!Key_tStatus1)
	{
		Key_tStatus1 = KEY_S;	
		Key_tStatus2 = KEY_B;	
	};
	if(!Key_tAction1)
	{
		Key_tAction1 = KEY_LCONTROL;	
	};

	// 	TALENT_DUALUSING = TRUE;
	RuneSwdCriticalChance=20;
	DailyHello_HeroAttackersCnt = 1;
	Day = 1;
	GRDChallenge = FALSE;	
	CasTeleportActive = FALSE;
	DelaySayTimerActived = FALSE;	
	ICESWDUsed = FALSE;
	Know_JackAlligator = TRUE;	
	LastNpcWithSpecWeapon = -1;
	DailyHello_HeroAttackersCnt = 1;
	Day = 1;
	GRDChallenge = FALSE;	
	//TALENT_QUICK_LERNING=FALSE;
	B_InitHelpME();	
	SprintTime=MaxSprintTime;
	SprintEnabled=FALSE;
	Ritual_Katrakanat_demon_counter=0;
	Global_Cinematic_i = -256;
	
	HeroHasPupil=0;	
	Ritual_Katrakanat_counter=0;
	//ORE DAILY 10 = 1 UNIT
	DAILYMAGICORE               = 100;
	DAILYGOLDORE                = 20;
	DAILYCARBONORE              = 35;
	DAILYIRONORE                = 55;
	DAILYSILVERORE              = 25;
	DAILYMAGICORE_NOW   = DAILYMAGICORE; 
	DAILYGOLDORE_NOW    = DAILYGOLDORE;  
	DAILYCARBONORE_NOW  = DAILYCARBONORE;
	DAILYIRONORE_NOW    = DAILYIRONORE;  
	DAILYSILVERORE_NOW	= DAILYSILVERORE;

	
	LastDayIn_WORLDZEN          = 1; 
};

func void INIT_Sub_QuestTest()
{
	
};

func void Startup_Sub_Questtest()
{
	///////////////////////////////////////////////////
	//Rebel Camp
	///////////////////////////////////////////////////

	//Hunters
	Wld_InsertNpc(HUN_336_Cavalorn, "OW_SAWHUT_GREENGOBBO_SPAWN");
	Wld_InsertNpc(HUN_818_Ratford, "OW_PATH_02");	
	Wld_InsertNpc(HUN_858_Quentin, "OW_PATH_02");
	Wld_InsertNpc(HUN_819_Drax, "OW_PATH_02");
	Wld_InsertNpc(HUN_859_Aidan, "OW_PATH_02");	
	//	Wld_InsertNpc(HUN_828_Bruce, "OW_PATH_02"); //AT CHAPTER 3 NC ARRIVED
	Wld_InsertNpc(HUN_729_Kharim, "OW_PATH_02"); 
	Wld_InsertNpc(HUN_1422_GorHanis, "OW_PATH_02"); 
	Wld_InsertNpc(PC_Thief, "OW_PATH_02");
	Wld_InsertNpc(HUN_309_Whistler, "OW_PATH_02");	
	Wld_InsertNpc(HUN_2615_Abel, "OW_PATH_02");	
	
	//	Wld_InsertNpc(PC_Fighter, "OW_PATH_02");//AT CHAPTER 3 NC ARRIVED
	
	//Finding new people
	Wld_InsertNpc(HUN_2609_Gestath, "OW_PATH_02");	
	Wld_InsertNpc(PIR_2612_JackAlligator, "OW_PATH_02");
	Wld_InsertNpc(Grd_205_Scorpio, "OC1"); //WitPacho
	Wld_InsertNpc(GRD_224_Pacho, "OC1");
	Wld_InsertNpc(RBL_2617_Carlson, "OW_PATH_02");//witScorpio
	
	//Magicans
	Wld_InsertNpc(mag_1604_Leren, "OW_PATH_02");
	Wld_InsertNpc(MAG_1330_BaalParvez, "OW_PATH_02");
	Wld_InsertNpc(PC_Mage, "OC1");

	//Rebeliants
	Wld_InsertNpc(RBL_311_Fisk, "OW_PATH_02");	 
	Wld_InsertNpc(RBL_2605_Garry, "OW_PATH_02");	

	Wld_InsertNpc(RBL_1331_BaalTaran, "OW_PATH_02");
	Wld_InsertNpc(RBL_331_Fingers, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2613_Vam, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2614_Fox, "OW_PATH_02"); 	
	Wld_InsertNpc(RBL_2608_BeerDrinker, "OW_PATH_02"); 		
	Wld_InsertNpc(RBL_581_Snaf, "OW_PATH_02");	 //Hut 14,SnafPlatz
	Wld_InsertNpc(RBL_2616_Mark, "OW_PATH_02");
	Wld_InsertNpc(RBL_2618_Hark, "OW_PATH_02");
	Wld_InsertNpc(RBL_2619_CUP, "OW_PATH_02");
	Wld_InsertNpc(RBL_1332_BaalKagan, "OW_PATH_02");
	
	Wld_InsertNpc(PIR_2600_Angus, "OW_PIR_CAMPFIRE");
	Wld_InsertNpc(PIR_2601_Hank, "OW_PIR_CAMPFIRE");
	Wld_InsertNpc(My_Wolf, "OW_PIR_CAMPFIRE");	
	Wld_InsertNpc(PIR_2602_Rodney, "OW_PIR_CAMPFIRE");
};

Func void Events_OnGameStart()
{
	INIT_Variables();	
};

FUNC VOID INIT_ALLWORLDS()
{
	// Ork: Dobra to chyba tutaj musi sie pojawiæ inicjacja zmiennych odwo³uj¹cych siê do offsetów w pamieci
	// Przyda³oby siê jakieœ "Exctract Method" tutaj bo wygl¹da to jak zwykle gorzej niz obrzydliwie :P
	// S³owa kluczowe: Reinicjacja Zmiennych, Reinit 
	MEM_SetShowDebug(1);
	printdebug("INIT/STARTUP: INIT_ALLWORLDS Called!");
	Appr_Init();
	Appr_RefreshHeroAppearance();
	Arr_ReInitStartAndHigh();
	Respawn_Init();
	Controls_Update();
	LoadGameCounter += 1;	
	//Trigger Scripts Optimization
	PerFrameCallTrigger_Init = TRUE;
	COMPASS_INIT = 1;
	InitTexts();
	
	WORLDS_INITS	+= 1;
	HeroDamage_ComboCounter = 0;//reset
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();	
	Init_GlobalNpc();
	
	MEM_InitGlobalInst();//ikarus
	
	Wld_InsertNpc(MOD_ITEMMASTER, "INVISIBLE9");		
	
	// issue #104 (it will call VolumeUpdate function by 0.125 trigger)
	MusicSys_VolumeReinited = false;
	
	SkyPreset_ReInit = true;
	SkyController_Ptr = 0;// This is critical! Without it Function FX_TransitionDoFrameStep could cause a crash
	// (function can be called before skycontroller_ptr has valid value pointing to skycontroller_outdoor class
	// Pointer is updating by Posion trigger (per 0.125) so many frames could go before it has proper value.
	// -orcwarrior March 27, 2011 
	
	FX_LastActiveFog = 0; //See comment over, but this time function could crash at FX_TransitionDoStep			
	FX_Reinit(); // Nówka funkiel, powinna pomóc z Cinemabarsami, fov-morphem i innymi funkcjami z AI_Intern/FX_Func.d
	MusicSys_ReInit();
	MsgManager_ReInit();
	Extract_NeededKeys();
	Apply_Menu_Options_CZ();

	//Engine Hook's:
	if(!Hlp_StrCmp(HooksReinited, "Yes"))
	{
		HooksReinited="Yes";
		//HookEngine_Hook_PreUnconscious_JmpAdress = HookEngine(7630776,6, "HOOK_PREUNCONSCIOUS",COPY_INSTR);
		//10328188
		MemoryProtectionOverride (10328188,4);
		HookEngine(6924707,5, "HOOK_AFTEROPENSTATUSSCREEN",COPY_INSTR);	
		HookEngine(4349120,5, "APPLY_MENU_OPTIONS_CZ",COPY_INSTR);	
		//HookEngine(7540706,5, "OCNPC_ONDAMAGE_BEGIN",COPY_INSTR);
		//HookEngine(7541743,7, "OCNPC_ONDAMAGE_POSTEVENTCALL",COPY_INSTR);
		//HookEngine_Hook_LeftWeaponTrail_JmpAdress = HookEngine(6452024,5, "HOOK_WEAPONTRAIL",COPY_INSTR);	
		//HookEngine_Hook_PreRenderVobList_JmpAdress = HookEngine(5365779,5, "HOOK_PREVOBLIGHTRENDER",COPY_INSTR);	
		//HookTesting = HookEngine(5467923,5, "HOOKTESTINGFUNC",COPY_INSTR);			
		//HookEngine_Hook_PreDropVob_JmpAdress = HookEngine(7023277,5, "HOOK_PREDROPVOB",COPY_INSTR);
	};
	//OptimizationVobLights_CollectLights();
	//OptimizationVobLights_UnTriggerAllLights();
};

FUNC VOID STARTUP_ALLWORDLS()
{
	Arr_Init();
	INIT_Variables();		
	STARTUP_NewsNPC();
	STARTUP_Runes();
	STARTUP_TriggerScripts();
	printdebug("INIT/STARTUP: STARTUP_ALLWORDLS Called!");
};	

FUNC VOID INIT_QUESTTEST()
{
	INIT_ALLWORLDS();	
	//Wld_SendTrigger ("TIMEGUARD");
	INIT_Sub_QuestTest();

	Wld_SetObjectRoutine (03,10, "CAS_TELEPORT_TRIG",0);	
	Wld_SetObjectRoutine (03,10, "CAS_TELEPORT",0);		
	Wld_SetObjectRoutine (03,10, "CAS_TELEPORT2",0);			
	Wld_SetObjectRoutine (20,28, "GLOWWORMS1",1);	
	Wld_SetObjectRoutine (04,59, "GLOWWORMS1",0);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	Init_GlobalNpc();
	Init_GlobalNpc_World();
	//WORLD_CURRENT = WORLD_WORLDZEN;
};

FUNC VOID INIT_WORLD()
{
	WORLD_CURRENT = WORLD_WORLDZEN;
	
	INIT_Sub_Newcamp();
	INIT_Sub_Oldcamp();
	INIT_Sub_Psicamp();
	INIT_Sub_Demontower();
	INIT_Sub_Freeminecamp();
	INIT_Sub_Surface();
	INIT_SUB_REBELCAMP();

	respawn_dur_minus = 10000;
	Wld_SetObjectRoutine(03,10, "CAS_TELEPORT_TRIG", 0);	
	Wld_SetObjectRoutine(03,10, "CAS_TELEPORT", 0);		
	Wld_SetObjectRoutine(03,10, "CAS_TELEPORT2", 0);			
	Wld_SetObjectRoutine(20,28, "GLOWWORMS1", 1);	
	Wld_SetObjectRoutine(04,59, "GLOWWORMS1", 0);
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	Init_GlobalNpc();
	Init_GlobalNpc_World();
	INIT_ALLWORLDS();	
};

FUNC VOID STARTUP_QUESTTEST()
{
	INIT_QUESTTEST();	
	Startup_Sub_Questtest();
	Wld_InsertNpc(Perception_Testmodell, "A2");
	//die folgende Zeile gilt nur, bis die INIT_...-Funktionen von Ulf unterstützt werden.

	STARTUP_ALLWORDLS();
	
	// Wld_InsertNpc(SLV_011_BarrelSlave, "B4"); 
	//	Wld_InsertNpc(SLV_012_BarrelSlave, "B4"); 
	
	//Wld_InsertNpc(SLV_22_AppearTest, "B4"); 
};

FUNC VOID STARTUP_WORLD ()
{
	MEM_SetShowDebug(1);
		
	Startup_Sub_Newcamp();
	Startup_Sub_Oldcamp();
	Startup_Sub_Psicamp();
	Startup_Sub_Demontower();
	Startup_Sub_Freeminecamp();
	Startup_Sub_Surface();
	Startup_Sub_PirateBay();
	Startup_Sub_Rebelcamp();
	Startup_Sub_Oldminecamp();
	
	STARTUP_ALLWORDLS();
	STARTUP_HandlerContainers();

	//die folgende Zeile gilt nur, bis die INIT_...-Funktionen von Ulf unterstützt werden.
	//Ork: Panowie wyzej co wy odpierdalacie, potem mi sie init 2x odpala XD
	// A tak serio, to to chyba zbedne, gdyby coœ sie kopa³o: PRZYWROCIC!
	//INIT_WORLD();	
	PlayVideo ("INTRO.BIK");
	PlayVideo ("CZ_INTRO.BIK");
	//AI_StartState			(hero,	ZS_Unconscious,	1,	"");
	//B_FullStop			(hero);
	//B_ProcessInfos (her);
	Wld_SendTrigger("EVT_OC_MAINGATE01_01");
	SetSkyPreset(SKYPRESET_START,TRANS_STEP);//Init first day sky: see Skypresets_Func
}; // STARTUP_WORLD

/********************************************************
*                                                       *
*												        *
*					ENDE STARTUP WORLD					*
*												        *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*                                                       *
********************************************************/

func void INIT_DUNGEON()
{
	WORLD_CURRENT = WORLD_MONASTERYDUNGEONZEN;
	Respawn_SkippedDays(DAY-LastDayIn_MONASTERYDUNGEONZEN);
	LastDayIn_MONASTERYDUNGEONZEN= DAY;//Set Last Day in psi dream to today's day		
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();	
	INIT_ALLWORLDS();		

	Party_RemoveNpc(Roderic);
};

FUNC VOID STARTUP_DUNGEON()
{	
	var c_npc poormeatbug;
	Wld_InsertNpc(DeadMeatbug, "MD_MEATBUG_05"); 
	poormeatbug = Hlp_GetNpc(DeadMeatbug);
	poormeatbug.attribute[ATR_HITPOINTS]-=poormeatbug.attribute[ATR_HITPOINTS];	
	Wld_InsertNpc(DeadMeatbug, "MD_MEATBUG_04"); 
	poormeatbug = Hlp_GetNpc(DeadMeatbug);
	poormeatbug.attribute[ATR_HITPOINTS]-=poormeatbug.attribute[ATR_HITPOINTS];		
	Wld_InsertNpc(DeadMeatbug, "MD_MEATBUG_03"); 
	poormeatbug = Hlp_GetNpc(DeadMeatbug);
	poormeatbug.attribute[ATR_HITPOINTS]-=poormeatbug.attribute[ATR_HITPOINTS];		
	Wld_InsertNpc(DeadMeatbug, "MD_MEATBUG_02"); 
	poormeatbug = Hlp_GetNpc(DeadMeatbug);
	poormeatbug.attribute[ATR_HITPOINTS]-=poormeatbug.attribute[ATR_HITPOINTS];		
	Wld_InsertNpc(DeadMeatbug, "MD_MEATBUG_01"); 
	poormeatbug = Hlp_GetNpc(DeadMeatbug);
	poormeatbug.attribute[ATR_HITPOINTS]-=poormeatbug.attribute[ATR_HITPOINTS];					

	Wld_InsertNpc(Zombie_BonesChamber6, "KOMNATA_KOSCI_01"); 
	Wld_InsertNpc(Zombie_BonesChamber1, "KOMNATA_KOSCI_02"); 
	Wld_InsertNpc(Zombie_BonesChamber2, "KOMNATA_KOSCI_03"); 
	//	Wld_InsertNpc(Zombie_BonesChamber3, "KOMNATA_KOSCI_04"); 
	Wld_InsertNpc(Zombie_BonesChamber4, "KOMNATA_KOSCI_05"); 
	Wld_InsertNpc(Zombie_BonesChamber5, "KOMNATA_KOSCI_06"); 
	
	//	Wld_InsertNpc(Skeleton2HSwdWarrior, "KOMNATA_MOST_07");
	//	Wld_InsertNpc(Skeleton2HSwdWarrior, "KOMNATA_MOST_08");
	//Wld_InsertNpc(SkeletonMage, "KOMNATA_MOST_02");
	//Wld_InsertNpc(SkeletonPoisonRanger, "KOMNATA_MOST_05");
	//Wld_InsertNpc(SkeletonPoisonRanger, "KOMNATA_MOST_06");

	Wld_InsertNpc(Cave_UndeadOrcShaman, "KOMNATA_ZBROJOWNIA_06");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "KOMNATA_ZBROJOWNIA_01");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "KOMNATA_ZBROJOWNIA_03");
	
	Wld_InsertNpc(SkeletonWarrior, "KOMNATA_PRZEMIANY_TP");
	Wld_InsertNpc(SkeletonRanger, "KOMNATA_PRZEMIANY_01");
	Wld_InsertNpc(SkeletonRanger, "KOMNATA_PRZEMIANY_02");

	Wld_InsertNpc(Wisp_Fire, "KOMNATA_SWIATLA_01");
	Wld_InsertNpc(Wisp_Fire, "KOMNATA_SWIATLA_02");
	Wld_InsertNpc(Wisp_Fire, "KOMNATA_SWIATLA_03");
	Wld_InsertNpc(Wisp_Fire, "KOMNATA_SWIATLA_04");

	Wld_InsertNpc(SkeletonDual1, "JASKINIA_01");
	Wld_InsertNpc(SkeletonDual1, "JASKINIA_02");

	Wld_InsertNpc(SkeletonMage, "KOMNATA_WIEDZY_01");
	
	Wld_InsertNpc(SkeletonDual1, "KOMNATA_SYPIALNA_03");
	//	Wld_InsertNpc(Skeleton2HAxeWarrior, "KOMNATA_SYPIALNA_01");
	Wld_InsertNpc(SkeletonDual1, "KOMNATA_SYPIALNA_02");
	Wld_InsertNpc(SkeletonRanger, "KOMNATA_SYPIALNA_04");
	Wld_InsertNpc(SkeletonRanger, "KOMNATA_SYPIALNA_05");
	
	STARTUP_ALLWORDLS();		
}; // STARTUP_DUNGEON


FUNC VOID INIT_CAVE ()
{
	EvtCave_HelperTimer=1;
	
	WORLD_CURRENT = WORLD_CATACOMBS;
	Respawn_SkippedDays(DAY-LastDayIn_CATACOMBS);
	LastDayIn_CATACOMBS= DAY;//Set Last Day in cave to today's day				
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();
};
FUNC VOID STARTUP_CAVE ()
{
	//monsters spawn
	//statues
	Wld_InsertNpc(Cave_Statue, "STATUE_L1"); 	
	Wld_InsertNpc(Cave_Statue, "STATUE_L2"); 	
	Wld_InsertNpc(Cave_Statue, "STATUE_R1"); 	
	Wld_InsertNpc(Cave_Statue, "STATUE_R2"); 
	//zombie at start	
	Wld_InsertNpc(Zombie_PickAxe, "START_ZOMBIE"); 
	//undead orc group
	Wld_InsertNpc(Skeleton2HAxeWarrior, "ROOM01_UDSH"); 	
	Wld_InsertNpc(Skeleton, "ROOM01_UDWR1"); 	
	Wld_InsertNpc(SkeletonIceRanger, "ROOM01_UDWR2"); 	
	Wld_InsertNpc(Skeleton, "ROOM01_UDWR3");	
	//skeletons at corridors	
	Wld_InsertNpc(SkeletonScout, "SKE_CORRIDOR_1"); 	
	Wld_InsertNpc(SkeletonScout, "SKE_CORRIDOR_1"); 	
	Wld_InsertNpc(SkeletonScout, "SKE_CORRIDOR_2"); 	
	Wld_InsertNpc(SkeletonRanger, "SKE_CORRIDOR_2");

	STARTUP_ALLWORDLS();		
	//die folgende Zeile gilt nur, bis die INIT_...-Funktionen von Ulf unterstützt werden.
	INIT_CAVE();
}; // STARTUP_CAVE

FUNC VOID INIT_ORCGRAVEYARD()
{
	Wld_SetMobRoutine 	(00,00, "FIREPLACE", 1);
	
	WORLD_CURRENT = WORLD_OGY;
	Respawn_SkippedDays(DAY-LastDayIn_OGY);
	LastDayIn_OGY= DAY;//Set Last Day in graveyard to today's day				
	//-------- Attitüden initialisieren --------
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();
};

FUNC VOID STARTUP_ORCGRAVEYARD ()
{
	INIT_ORCGRAVEYARD();

	if(nameless_enterGYD)
	{
		Wld_InsertNpc(Nameless_ThirdMeetGYD, "GRYD_002");
		Wld_InsertNpc(OrcScoutGYD, "GRYD_015");
		Wld_InsertNpc(Skeleton, "GRYD_019B");
		Wld_InsertNpc(Skeleton2HSwdWarrior, "GRYD_032");
		Wld_InsertNpc(SkeletonPoisonRanger, "GRYD_039");
		Wld_InsertNpc(SkeletonMage, "GRYD_023");
		Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_061");
		Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_062");
		Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_047");
	};
	//-------- 1. Höhle --------
	Wld_InsertNpc(OrcScoutGYD, "GRYD_006");
	Wld_InsertNpc(OrcScoutGYD, "GRYD_010");
	
	//-------- 2. Höhle --------
	Wld_InsertNpc(Skeleton, "GRYD_019D");
	Wld_InsertNpc(Skeleton2HSwdWarrior, "GRYD_020B");
	
	//-------- 3. Höhle --------
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_048");

	//-------- 1. Nebenstollen --------
	Wld_InsertNpc(Skeleton, "GRYD_031");
	Wld_InsertNpc(Skeleton2HSwdWarrior, "GRYD_037");
	Wld_InsertNpc(SkeletonPoisonRanger, "GRYD_040");
	Wld_InsertNpc(SkeletonMage, "GRYD_042");

	//========== Somewhere, where area are blank ;p =========
	Wld_InsertNpc(SkeletonPoisonRanger, "GRYD_024A");
	Wld_InsertNpc(SkeletonPoisonRanger, "GRYD_024B");
	//-------- Near Green Glowworms -----------
	Wld_InsertNpc(OTMinecrawler, "GRYD_051");

	//-------- 2. Nebenstollen --------
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_047");

	//-------- Große Halle --------
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_058");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_055");
	
	//-------- Große Halle, Floor--------
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_2_05");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_2_06");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_2_03");
	Wld_InsertNpc(Cave_UndeadOrcWarrior, "GRYD_2_09");	
	Wld_InsertNpc(ORC_GHOST, "ORCGHOST");	
	TurnToGhost(ORC_GHOST,16);	
	STARTUP_ALLWORDLS();			
}; // STARTUP_ORCGRAVEYARD


FUNC VOID STARTUP_ORCTEMPEL ()
{
	//-------- Dick and others --------
	Wld_InsertNpc(Non_4116_NekromanD, "TPL_016"); 	
	Wld_InsertNpc(KDF_406_OTXardas, "TPL_015"); 		
	Wld_InsertNpc(Nameless_Temple, "TPL_012"); 		

	// ------------------- Skeleton -------------------------------------
	Wld_InsertNpc(Skeleton, "TPL_017"); 
	Wld_InsertNpc(SkeletonScout, "TPL_020"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_022"); 
	Wld_InsertNpc(Skeleton, "TPL_022"); 
	Wld_InsertNpc(Skeleton, "TPL_027"); 
	Wld_InsertNpc(SkeletonScout, "TPL_030"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_030"); 
	Wld_InsertNpc(Skeleton, "TPL_034"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_035");  
	Wld_InsertNpc(SkeletonScout, "TPL_045"); 
	Wld_InsertNpc(Skeleton, "TPL_045"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_045"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_047"); 
	Wld_InsertNpc(Skeleton, "TPL_047"); 
	Wld_InsertNpc(SkeletonScout, "TPL_051"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_051"); 
	Wld_InsertNpc(Skeleton, "TPL_051"); 	
	Wld_InsertNpc(SkeletonWarrior, "TPL_411"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_412"); 
	Wld_InsertNpc(SkeletonWarrior, "TPL_414"); 
	Wld_InsertNpc(SkeletonScout, "TPL_412"); 
	Wld_InsertNpc(SkeletonScout, "TPL_413"); 
	Wld_InsertNpc(Skeleton, "TPL_411"); 	
	
	Wld_InsertNpc(SkeletonMage, "TPL_031"); 	
	Wld_InsertNpc(SkeletonMage, "TPL_046"); 	

	// ------------------ UnDeathOrc ----------------------------------
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_044"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_090"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_092"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_114"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_117"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_121"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_132"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_140"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_142"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_145"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_148"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_151"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_161"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_258"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_263"); 
	Wld_InsertNpc(UndeadOrcWarrior, "TPL_294"); 

	// ------------------  Minecrawler ----------------------------------
	Wld_InsertNpc(OTMinecrawler, "TPL_066"); 
	Wld_InsertNpc(OTMinecrawler, "TPL_069");  
	Wld_InsertNpc(OTMinecrawler, "TPL_076");  
	Wld_InsertNpc(OTMinecrawler, "TPL_106"); 
	Wld_InsertNpc(OTMinecrawler, "TPL_106");	
	Wld_InsertNpc(OTMinecrawler, "TPL_229");  
	Wld_InsertNpc(OTMinecrawler, "TPL_235");  
	Wld_InsertNpc(OTMinecrawler, "TPL_405");  
	Wld_InsertNpc(OTMinecrawler, "TPL_407");  
	
	
	// ------------------ Damon -----------------------------------------
	Wld_InsertNpc(OTDemon, "TPL_216"); 
	Wld_InsertNpc(OTDemon, "TPL_218"); 
	Wld_InsertNpc(OTDemon, "TPL_186"); 
	Wld_InsertNpc(OTDemon, "TPL_175"); 
	Wld_InsertNpc(OTDemon, "TPL_174"); 

	// ---------------------------------------------------------------
	// ------------------ PSI ----------------------------------------
	// ---------------------------------------------------------------
	
	// -------------------------------------------------------------------
	// ------------------ Priests ---------------------------------------
	// -------------------------------------------------------------------
	
	Wld_InsertNpc(ORC_Priest_1, "TPL_058"); 
	Wld_InsertNpc(ORC_Priest_4, "TPL_112"); 
	Wld_InsertNpc(ORC_Priest_5, "TPL_300"); 
	
	// ----------------- Sleeper ---------------------------------------
	Wld_InsertNpc(SLEEPER, "TPL_395"); // Schläft die ganze Zeit :)

	STARTUP_ALLWORDLS();				
}; // STARTUP_ORCTEMPEL

FUNC VOID INIT_ORCTEMPEL ()
{
	//-------- Objekt-TAs --------
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);
	
	WORLD_CURRENT = WORLD_OTEMPLE;

	//-------- Attitüden initialisieren --------
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();
};

FUNC VOID INIT_OLDMINE ()
{
	Wld_SetMobRoutine (00,00, "FIREPLACE", 1);

	//-------- Attitüden initialisieren --------
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();
};

FUNC VOID STARTUP_OLDMINE ()
{
	INIT_OLDMINE();

	Wld_InsertNpc(Stt_300_Alberto, "OM_122");
	Wld_InsertNpc(Stt_301_Ian, "OM_122");
	Wld_InsertNpc(Stt_302_Viper, "OM_122");
	Wld_InsertNpc(Grd_234_Gardist, "OM_122");
	Wld_InsertNpc(Grd_235_Gardist, "OM_122");
	Wld_InsertNpc(Grd_236_Gardist, "OM_122");
	Wld_InsertNpc(Grd_260_Drake, "OM_122");
	Wld_InsertNpc(Grd_261_Brandick, "OM_122");
	Wld_InsertNpc(Grd_262_Aaron, "OM_122");
	Wld_InsertNpc(Grd_263_Asghan, "OM_122");
	Wld_InsertNpc(Grd_264_Gardist, "OM_122");
	
	Wld_InsertNpc(Grd_266_Gardist, "OM_122");
	Wld_InsertNpc(Grd_267_Gardist, "OM_122");
	Wld_InsertNpc(Grd_268_Gardist, "OM_122");
	Wld_InsertNpc(Grd_269_Gardist, "OM_122");
	
	Wld_InsertNpc(Grd_271_Ulbert, "OM_122");
	Wld_InsertNpc(Grd_272_Gardist, "OM_122");
	Wld_InsertNpc(Grd_273_Gardist, "OM_122");
	
	Wld_InsertNpc(Grd_277_Gardist, "OM_122");
	Wld_InsertNpc(Grd_278_Gardist, "OM_122");
	
	Wld_InsertNpc(VLK_518_Buddler, "OM_122");
	Wld_InsertNpc(VLK_525_Buddler, "OM_122");
	Wld_InsertNpc(VLK_539_Buddler, "OM_122");
	Wld_InsertNpc(VLK_540_Buddler, "OM_122");
	Wld_InsertNpc(VLK_541_Buddler, "OM_122");
	Wld_InsertNpc(VLK_542_Buddler, "OM_122");
	Wld_InsertNpc(VLK_543_Buddler, "OM_122");
	Wld_InsertNpc(VLK_544_Buddler, "OM_122");
	Wld_InsertNpc(VLK_545_Buddler, "OM_122");
	Wld_InsertNpc(VLK_546_Buddler, "OM_122");
	Wld_InsertNpc(VLK_547_Buddler, "OM_122");
	Wld_InsertNpc(VLK_548_Buddler, "OM_122");
	Wld_InsertNpc(VLK_549_Buddler, "OM_122");
	Wld_InsertNpc(VLK_550_Buddler, "OM_122");
	Wld_InsertNpc(VLK_551_Buddler, "OM_122");
	Wld_InsertNpc(VLK_579_Buddler, "OM_122");
	Wld_InsertNpc(VLK_583_Glen, "OM_122");
	Wld_InsertNpc(VLK_584_Snipes, "OM_122");
	Wld_InsertNpc(VLK_585_Aleph, "OM_122");
	//	Wld_InsertNpc(VLK_586_Grimes, "OM_122");
	Wld_InsertNpc(VLK_587_Garp, "OM_122");
	Wld_InsertNpc(VLK_588_Buddler, "OM_122");
	Wld_InsertNpc(VLK_589_Buddler, "OM_122");
	Wld_InsertNpc(VLK_590_Buddler, "OM_122");
	Wld_InsertNpc(VLK_591_Buddler, "OM_122");
	Wld_InsertNpc(VLK_592_Buddler, "OM_122");
	Wld_InsertNpc(VLK_593_Buddler, "OM_122");
	
	Wld_InsertNpc(VLK_558_Buddler, "OM_122");
	Wld_InsertNpc(VLK_559_Buddler, "OM_122");
	Wld_InsertNpc(VLK_562_Buddler, "OM_122");
	Wld_InsertNpc(VLK_563_Buddler, "OM_122");
	Wld_InsertNpc(VLK_566_Buddler, "OM_122");
	Wld_InsertNpc(VLK_567_Buddler, "OM_122");
	Wld_InsertNpc(VLK_571_Buddler, "OM_122");
	
	//Wld_InsertNpc(Org_857_Calash, "OM_122");
	
	Wld_InsertNpc(Orc_2001_Sklave, "OM_122");
	Wld_InsertNpc(Orc_2002_Sklave, "OM_122");
	
	Wld_InsertNpc(Minecrawler, "OM_033"); //
	Wld_InsertNpc(Minecrawler, "OM_035"); //
	Wld_InsertNpc(Minecrawler, "OM_038"); //
	Wld_InsertNpc(Minecrawler, "OM_039"); //
	Wld_InsertNpc(Minecrawler, "OM_047"); //
	
	Wld_InsertNpc(Minecrawler, "OM_024"); //
	Wld_InsertNpc(Minecrawler, "OM_027"); //
	Wld_InsertNpc(Minecrawler, "OM_030"); //
	Wld_InsertNpc(Minecrawler, "OM_031"); //
	Wld_InsertNpc(Minecrawler, "OM_133"); //
	Wld_InsertNpc(Minecrawler, "OM_CAVE1_89"); //
	Wld_InsertNpc(Minecrawler, "OM_CAVE1_90"); //
	Wld_InsertNpc(Minecrawler, "OM_CAVE1_94"); //
	Wld_InsertNpc(Minecrawler, "OM_CAVE1_95"); //
	Wld_InsertNpc(Minecrawler, "OM_062"); 
	Wld_InsertNpc(Minecrawler, "OM_062"); 
	Wld_InsertNpc(Minecrawler, "OM_063"); 
	Wld_InsertNpc(Minecrawler, "OM_073"); 
	Wld_InsertNpc(Minecrawler, "OM_073"); 
	Wld_InsertNpc(Minecrawler, "OM_065"); 
	Wld_InsertNpc(Minecrawler, "OM_076"); 
	Wld_InsertNpc(Minecrawler, "OM_079"); 
	Wld_InsertNpc(Minecrawler, "OM_080"); 
	Wld_InsertNpc(Minecrawler, "OM_084_QUEEN");
	Wld_InsertNpc(Minecrawler, "OM_084_QUEEN");
	
	//-------- Nebenstollen mit kaputtem Stampfer (Zahnrad) --------
	Wld_InsertNpc(Minecrawler, "OM_188"); 
	Wld_InsertNpc(Minecrawler, "OM_189"); 
	Wld_InsertNpc(Minecrawler, "OM_190"); 
	
	//-------- Höhle der Köngin --------
	Wld_InsertNpc(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc(Minecrawler, "OM_084_QUEEN_04");
	Wld_InsertNpc(MinecrawlerQueen, "OM_084_QUEEN_05"); 

	//-------- globale Variable --------
	EnteredOldMine = TRUE;
	
	STARTUP_ALLWORDLS();			
}; // STARTUP_OLDMINE

FUNC VOID INIT_FREEMINE ()	
{
	//-------------------Fackeln-----------------------------
	Wld_SetMobRoutine			(00,00, "FIREPLACE", 1);

	WORLD_CURRENT = WORLD_FREEMINE;
	Respawn_SkippedDays(DAY-LastDayIn_FREEMINE);
	LastDayIn_FREEMINE = DAY;//Set Last Day in freemine to today's day
	//-------- Attitüden initialisieren --------
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();	
};

FUNC VOID STARTUP_FREEMINE ()	
{
	INIT_FREEMINE();
	//-------- globale Story-Variable --------
	EnteredFreeMine = TRUE;

	//*******added by sher**********************
	
	Wld_InsertNpc(SLD_737_Torlof, "FM_03");	 //
	Wld_InsertNpc(GRD_851_Butch, "FM_03");  //
	Wld_InsertNpc(SLV_935_Homer, "FM_03");  //
	Wld_InsertNpc(Non_4088_Sher, "FM_03");  //
	Wld_InsertNpc(ORG_873_Cipher, "FM_03");		
	
	Wld_InsertNpc(Grd_4090_Jurgen, "FM_03");		
	Wld_InsertNpc(Grd_20271_GRD, "FM_08");	
	Wld_InsertNpc(Grd_20272_GRD, "FM_12");	
	Wld_InsertNpc(Grd_20273_GRD, "FM_14");		
	
	/************	
	FM_02 wypad z FM
	sher FM_03 start  FM_06 after
	Thorlof FM_18 V
	homer FM_148
	Butch FM_111
	cipher FM_138 V
	
	FM_07 grd Jurgen
	FM_08 grd1
	FM_12 grd2
	FM_14 grd
	
*******************/
	//-------------------Schatten----------------------------
	
	Wld_InsertNpc(Stt_336_Schatten, "FM_03");//RoastScavenger
	Wld_InsertNpc(Stt_337_Schatten, "FM_03");//SitAround
	Wld_InsertNpc(Stt_338_Schatten, "FM_03");//SitAround

	//------------------Gardisten----------------------------
	Wld_InsertNpc(Grd_246_Gardist, "FM03");//
	Wld_InsertNpc(Grd_284_Gardist, "FM03");//
	Wld_InsertNpc(Grd_286_Gardist, "FM03");//
	Wld_InsertNpc(Grd_287_Gardist, "FM03");//
	Wld_InsertNpc(Grd_288_Gardist, "FM03");//
	Wld_InsertNpc(Grd_289_Gardist, "FM03");//
	Wld_InsertNpc(Grd_290_Gardist, "FM03");//
	Wld_InsertNpc(Grd_291_Gardist, "FM03");//
	Wld_InsertNpc(Grd_292_Gardist, "FM03");//
	Wld_InsertNpc(Grd_293_Gardist, "FM03");//
	Wld_InsertNpc(Grd_294_Gardist, "FM03");//
	Wld_InsertNpc(Grd_295_Gardist, "FM03");//
	Wld_InsertNpc(Grd_296_Gardist, "FM03");//
	Wld_InsertNpc(Grd_297_Gardist, "FM03");//
	Wld_InsertNpc(Grd_298_Gardist, "FM03");//
	Wld_InsertNpc(Grd_299_Gardist, "FM03");//
	
	//-------------------Buddler------------------------------
	
	Wld_InsertNpc(Vlk_5001_Buddler, "FM_03");//PickOre
	Wld_InsertNpc(Vlk_5002_Buddler, "FM_105");//PickOre
	Wld_InsertNpc(Vlk_5003_Buddler, "FM_103");//PickOre
	Wld_InsertNpc(Vlk_5004_Buddler, "FM_102");//PickOre
	Wld_InsertNpc(Vlk_5005_Buddler, "FM_159");//MineBellows
	Wld_InsertNpc(Vlk_5006_Buddler, "FM_89");//PickOre
	Wld_InsertNpc(Vlk_5007_Buddler, "FM_88");//PickOre

	//--------------------Zielperson--------------------------
	
	//--------------------Minecrawler-------------------------
	
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_01");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_04");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_05");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_06");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_09");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_14");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_17");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_29");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_28");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_32");//
	Wld_InsertNpc(MinecrawlerWarrior, "FP_ROAM_CRAWLER_34");//
	
	//-----------------------Meatbug-------------------------------------------
	
	Wld_InsertNpc(FreemineOrc, "FM_03");//WaitforRescue
	STARTUP_ALLWORDLS();		
}; // STARTUP_FREEMINE

/**********************************************************
*                                                         *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE	 					      *
*												          *
*												          *
**********************************************************/

FUNC VOID STARTUP_DREAM01 ()
{
	Wld_InsertNpc(RBL_1412_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1413_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1414_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1415_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1416_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1417_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1418_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1419_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1420_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1423_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1424_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1425_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1430_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1431_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1432_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1433_GorNaVid, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1434_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_414_BaalParvez, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_413_BaalTaran, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_408_Nowicjusz, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_416_GorHanis, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_410_BaalParvez, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_409_BaalTaran, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_411_BaalIsidro, "PSI_PATH_1_1");

	//Wld_InsertNpc(RBL_1327_Novize, "PSI_PATH_10_2");
	Wld_InsertNpc(RBL_1328_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1329_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1332_BaalKagan, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1334_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1335_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1336_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1337_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1338_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1339_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1340_Novize, "PSI_PATH_1_1");

   Wld_InsertNpc(RBL_1327_Novize, "PSI_PATH_10_2");
	Wld_InsertNpc(RBL_1328_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1329_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1332_BaalKagan, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1334_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1335_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1336_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1337_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1338_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1339_Novize, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1340_Novize, "PSI_PATH_1_1");

	Wld_InsertNpc(RBL_1409_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1410_Templer, "PSI_PATH_1_1");
	Wld_InsertNpc(RBL_1411_Templer, "PSI_PATH_1_1");

	Wld_InsertNpc(RBL_1411_Templer, "PSI_PATH_1_1");

	Wld_InsertNpc(RBL_1435_DeadMen, "PSI_TEMPLE_NOVIZE_PR4");
	Wld_InsertNpc(RBL_1435_DeadMen, "PSI_TEMPLE_NOVIZE_PR7");
	Wld_InsertNpc(RBL_1435_DeadMen, "PSI_TEMPLE_NOVIZE_PR6");
	Wld_InsertNpc(RBL_1435_DeadMen, "PSI_TEMPLE_GUARD_04");

	Wld_InsertNpc(DemonPsi, "PSI_TEMPLE_GUARD_03");
	Wld_InsertNpc(DemonPsi, "PSI_TEMPLE_GUARD_02");
	Wld_InsertNpc(DemonPsi, "PSI_TEMPLE_STAIRS_3");
	Wld_InsertNpc(DemonPsi, "PSI_TEMPLE_STAIRS_1");

	Wld_InsertNpc(PSI_NovHZombie, "PSI_TEMPLE_COURT_2");
	Wld_InsertNpc(PSI_TplHZombie, "PSI_TEMPLE_COURT_3");
	Wld_InsertNpc(PSI_GuruZombieFireStorm, "PSI_TEMPLE_COURT_GURU");
	Wld_InsertNpc(PSI_NovMZombie, "PSI_TEMPLE_STAIRS_1");
	Wld_InsertNpc(PSI_TplHZombie, "PSI_PATH_TEMPLE_8");

	Wld_InsertNpc(RBL_1436_ImOnFire, "PSI_PATH_10_2");
	Wld_InsertNpc(RBL_415_ImOnFire, "PSI_PATH_10_2");
	Wld_InsertNpc(RBL_1438_ImOnFire, "PSI_PATH_10_2");

	Wld_InsertNpc(PC_Hero_Dream01, "PSI_31_HUT_IN");//VisionPlayer
	STARTUP_ALLWORDLS();			
}; // STARTUP_DREAM01

FUNC VOID INIT_DREAM01 ()
{
	WORLD_CURRENT = WORLD_DREAM01;
	//-------- Attitüden initialisieren --------
	B_InitMonsterAttitudes ();
	B_InitGuildAttitudes();
	INIT_ALLWORLDS();
};	

FUNC VOID INIT_NECROLOC()
{
	INIT_ALLWORLDS();	

	WORLD_CURRENT = WORLD_NECROLOCATION;
	respawn_dur_minus = 10000;
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	Init_GlobalNpc();
};

FUNC VOID STARTUP_NECROLOC()
{
	Wld_InsertNpc(hero_mirror, "INVISIBLE");
	Wld_InsertNpc(DMB_1701_NecroInNecroloc, "NECRO_CENTER");
	Wld_InsertNpc(DMB_1701_NecroInNecroloc_mirror, "INVISIBLE");
	
	Wld_InsertNpc(NON_4084_NecroServant1, "NL_OUTTER_CIRCLE_01");
	Wld_InsertNpc(NON_4084_NecroServant1_mirror, "INVISIBLE");
	
	Wld_InsertNpc(NON_4084_NecroServant2, "NL_OUTTER_CIRCLE_06");
	Wld_InsertNpc(NON_4084_NecroServant2_Mirror, "INVISIBLE");
	
	INIT_NECROLOC();	
	STARTUP_ALLWORDLS();	 
};

/*********************
G³êbia
*********************/

FUNC VOID INIT_OR_DEEP ()
{
	INIT_ALLWORLDS();	

	WORLD_CURRENT = WORLD_OR_DEEP;
	respawn_dur_minus = 10000;
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	Init_GlobalNpc();
};

FUNC VOID STARTUP_OR_DEEP ()
{
	Wld_InsertNpc(Grd_4080_Pomroka, "MINE_PATH1");			
	Wld_InsertNpc(Grd_4081_Edwin, "MINE_PATH6");		
	Wld_InsertNpc(VLK_4083_Krzywy, "MINE_PATH10");		
	Wld_InsertNpc(VLK_4082_Spider, "MINE_PATH28");	

	//Wld_InsertNpc(Demon, "WP_DEMON");
	
	// Ork: Chocia¿ tymczasowo, zamieniam na pe³zacze
	Wld_InsertNpc(Minecrawler, "MINE_PATH25");	
	Wld_InsertNpc(Minecrawler, "MINE_PATH25");	
	Wld_InsertNpc(Minecrawler, "MINE_PATH25");		
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_12");		
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_12");	
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_11");	
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_10");	
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_10");
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_9");	
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_7");	
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_8");	
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_8");	
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_8");	
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_6");		
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_6");		
	Wld_InsertNpc(MinecrawlerWarrior, "MINE_QUEEN_PATH_5");		
	Wld_InsertNpc(Minecrawler, "MINE_QUEEN_PATH_4");		
	Wld_InsertNpc(MinecrawlerQueen, "MINE_QUEEN");		
	
	INIT_OR_DEEP();	
	STARTUP_ALLWORDLS();	
}; // STARTUP_OR_DEEP


/*********************
Labyrinth
*********************/

FUNC VOID INIT_LABIRYNT ()
{
	INIT_ALLWORLDS();	

	WORLD_CURRENT = WORLD_LABYRINTH;
	respawn_dur_minus = 10000;
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	Init_GlobalNpc();
};

FUNC VOID STARTUP_LABIRYNT ()
{
	Wld_InsertNpc(dead_guard, "DUNG5");			
	Wld_InsertNpc(dead_guard, "DUNG7");		
	Wld_InsertNpc(dead_guard, "DUNG20");	
	Wld_InsertNpc(dead_guard, "DUNG29");	
	
	Wld_InsertNpc(HUN_5555_Cav, "DUNG1");
	Wld_InsertNpc(dead_guard, "DUNG5");		

	Wld_InsertNpc(DemonLord, "DUNG25");
	Wld_InsertNpc(Skeleton2HSwdWarrior, "DUNG9");
	
	Wld_InsertNpc(Skeleton2HAxeWarrior,"DUNG49");
	Wld_InsertNpc(SkeletonWarrior,"DUNG54");
	Wld_InsertNpc(SkeletonIceRanger,"DUNG52");
	Wld_InsertNpc(SkeletonFireRanger,"DUNG53");
	Wld_InsertNpc(Skeleton2HSwdWarrior, "DUNG19");
	
	INIT_LABIRYNT();	
	STARTUP_ALLWORDLS();	
}; // STARTUP_LABIRYNT
