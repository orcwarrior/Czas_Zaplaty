// ***************************
// Food growing per attitudes
const int Berrys_HP_Incease = 5;
const int Berrys_Needed = 32;
var int Berrys_Counter;//Inreasing Hp by ...

const int Apple_STR_Incease = 1;
const int Apple_Needed = 18;
var int Apple_Counter;//Inreasing Str by ...

const int Joint_MANA_Incease = 2;
const int Joint_Needed = 70;//Joint1+1/Joint2+2/...
var int Joint_Counter;//Inreasing Mana by ...

//DEX, what it shoud be?
//const int Joint_DEX_Incease = 2;
//const int Joint_Needed = 70;//Joint1+1/Joint2+2/...
//var int Joint_Counter;//Inreasing Mana by ...


VAR INT RESPAWN_DUR_MINUS;

//Temporary (hero?) attitudes: (using f.e. when adding attitudes)
VAR INT STR_TP_BONUS;
VAR INT DEX_TP_BONUS;
VAR INT HP_TP_BONUS;
VAR INT MP_TP_BONUS;

VAR INT SEARCH_4_JACKTREASURE;

VAR INT GAME_STARTED;

VAR INT R_USES;
//EQUIP WEAPON BUGFIX
VAR INT EQWEAPFIX;
//Art Events
VAR INT QUESTSTART;
VAR INT USEONEOFSWITCH;
VAR INT BETTERSWITCH;//if hero use better switch next switch open secret room ;)
VAR INT GL_MD_TURNHERO2MEATBUG;
VAR INT MD_TURNOFFLIGHTERS;
VAR INT MD_FINALBATTLE;
VAR INT MD_FINALBATTLE_WAVE;
VAR INT MD_INSERTMR;
//end
//time
//AMUNITION
//A/B_MUNITION MOVED TO I_FUNCTIONS
VAR INT LAST_A_MUNITION;
CONST INT A_POINT=0;
CONST INT A_POINT_15=1;
CONST INT A_POINT_25=2;
CONST INT A_FIRE=3;
CONST INT A_ICE=4;
CONST INT A_POISON=5;
CONST INT A_BLUNT=6;

VAR INT LAST_B_MUNITION;
CONST INT B_POINT=0;
CONST INT B_POINT_10=1;
CONST INT B_POINT_25=2;
CONST INT B_FIRE=3;
CONST INT B_ICE=4;
CONST INT B_POISON=5;
CONST INT B_BLUNT=6;
//END AMUNITION
VAR INT HOUR;
VAR INT MINUTE;
//all
//Challenge

/////////////////////
//SPECIAL WEAPONS
/////////////////////
CONST INT MAX_NPCWITHSPECWEAP=10;
CONST INT NPC1=0;
CONST INT NPC2=1;
CONST INT NPC3=2;
CONST INT NPC4=3;
CONST INT NPC5=4;
CONST INT NPC6=5;
CONST INT NPC7=6;
CONST INT NPC8=7;
CONST INT NPC9=8;
CONST INT NPC10=9;
VAR INT READYWEAPNPC[MAX_NPCWITHSPECWEAP];//Instance
VAR INT EQUIPWEAPNPC[MAX_NPCWITHSPECWEAP];//Instance
VAR INT LASTNPCWITHSPECWEAPON;//for checking next NPC is free and can create SWD effect on him
VAR INT NPCWITHSPECWEAPON[MAX_NPCWITHSPECWEAP];//NPCs Instance
VAR INT NPCHAVESPECWEAPON[MAX_NPCWITHSPECWEAP];//BOOL//4 checking and adding new NPCWITHSPECWEAPON
/////////////////////////
VAR INT ICESWDUSED;
VAR INT TIMEACTIVED;
//
//
VAR INT BLOOPS;
//
VAR INT GLOBAL_FINISHHERO;
////////////////////////////////DAY/////////////////
VAR INT LAST_DAY;
VAR INT DAY;
VAR INT WEEKDAY;
CONST INT PON=0;
CONST INT WT=1;
CONST INT SR=2;
CONST INT CZW=3;
CONST INT PT=4;
CONST INT SOB=5;
CONST INT ND=6;
VAR INT WEEK;
VAR INT WEEKTYPE;
CONST INT REST=0;
CONST INT ATTACK=1;
CONST INT CHALLENGE=2;
////
VAR INT GRDCHALLENGE;
VAR INT SENDCASTLETRIGGERON;
VAR INT CASTELEPORTACTIVE;
//CHallenge
VAR INT TODAY_ARE_CHALLENGE;//bool
VAR INT HERO_IN_CHALLENGE;//bool
//INSTANCES
VAR INT I_TM1LD;
VAR INT I_TM1M1;
VAR INT I_TM1M2;
VAR INT I_TM1M3;
VAR INT I_TM2LD;
VAR INT I_TM2M1;
VAR INT I_TM2M2;
VAR INT I_TM2M3;
//C_NPC
VAR C_NPC NPC_TM1LD;
VAR C_NPC NPC_TM1M1;
VAR C_NPC NPC_TM1M2;
VAR C_NPC NPC_TM1M3;
VAR C_NPC NPC_TM2LD;
VAR C_NPC NPC_TM2M1;
VAR C_NPC NPC_TM2M2;
VAR C_NPC NPC_TM2M3;
//null
VAR C_NPC GOMEZ;


////////////////////////////////////////
//...::....G R D   A T T A C K   V A R ' S...::....
////////////////////////////////////////
//Now GRD Attack
VAR INT GRDATTACKNOW;//0=none,1=nr.1,2=nr.2.....
VAR INT GRDSINATTACK;
//
VAR INT GRDRND;
VAR INT GRDNUMSPAWNED;
VAR INT GRDATTACKSAMOUNT;
VAR INT GRDDIFICULTALL;
VAR INT GRDDIFICULT1ST;//Always
//Added Grds Dificult
VAR INT ADDGRDDIFICULT1ST;
VAR STRING GRDATTACKWP;
VAR INT GRDATTACKWPINT;

VAR INT HC_WP_WARRIOR;
VAR INT HC_WP_RANGED;
VAR INT HC_WP_MAGE;

///////////////////////////////////
CONST INT DURSTIGEBAUERN=10;
//////////////
VAR INT SLF_FIRE;

/******************
Zmienne globalne
******************/
var int jack_yes;
var int jack_no;

var int lee_offer;
var int lee_offer_condition;


VAR INT GEORG_GUARD;//georg na wpusci
VAR INT REBEL_CAMP_TRUST;//zaufanie w obozie rebeliantów.
VAR INT WHISTLER_LIST;//potrzebne do zadañ ze œwistakiem
VAR INT GARRY_OUT;//potrzebne do sprawdzania czy Garry jest ju¿ po zmianie profesji
VAR INT WHISTLER_LAST_APPROVE;//cd zadañ ze œwistakiem
VAR INT DRAX_GETLOST;//drax
VAR INT Q_N_AGAIN;//zmienna jak na true to znaczy, ¿e podpadliœmy cavalornowi i mamy przewalone u wszystkich rebeliantów.
VAR INT Q_Y;//zmienna odp za to czy gracz zgodzi³ siê pomóc cavalornowi w poszukiwaniu rekrutów.
VAR INT PACHO_ORE;//ruda gomeza i pacho
VAR INT SCORPIO_TRAITOR;//czy powiedzieliœmy skorpio o planie pacho
VAR INT HRABIA_LOG;//sprawdza czy ju¿ wiemy o hrabim
VAR INT DRAX_WARN;//ostrze¿enie draxa
VAR INT ORC_APPEAR;//ostrze¿enie draxa
VAR INT HARK_TRIAL;
VAR INT MIS_PACHO_CHESTOPENED;
VAR INT MIS_PACHOSPLIT;
VAR INT MIS_PACHOEARLCAMCANBEENABLED;
VAR INT MIS_TELEPORTEARL;
VAR INT Hrabia_teleport;
var int Saturas_saves_Rick;
var int Leren_teleport_after_ritual;
var int Xardas_teleport_after_ritual;
var int Tondral_death;
var int Lester_butcher;
var int Necro_teleport_after_deaths_beast;
var int Necro_teleport_on_ritual;
var int Raven_teleport_to_EN;
var int Raven_teleport_to_hidden;
var int repaired_axe_Rick;

var int Scorpio_teacher;
//MIS_Katrakanat_pieces
VAR INT MIS_KATRAKANAT_PIECES_COLLECTED;
VAR INT MIS_KATRAKANAT_PIECE1_COLLECTED,MIS_KATRAKANAT_PIECE2_COLLECTED,MIS_KATRAKANAT_PIECE3_COLLECTED,MIS_KATRAKANAT_PIECE4_COLLECTED,MIS_KATRAKANAT_PIECE5_COLLECTED,MIS_KATRAKANAT_PIECE6_COLLECTED;
//MIS_Tritetra
VAR INT MIS_TRITETRA_ON;
VAR INT MIS_TRITETRA_INNOS_PIECES,MIS_TRITETRA_ADANOS_PIECES,MIS_TRITETRA_BELIAR_PIECES;
VAR INT MIS_TRITETRA_INNOS_COUNTER,MIS_TRITETRA_ADANOS_COUNTER,MIS_TRITETRA_BELIAR_COUNTER;
VAR INT MIS_TRITETRA_INNOS_COUNTER_MAX;
VAR INT MIS_TRITETRA_ADANOS_COUNTER_MAX;
/**************
zmienne okreœlaj¹ce którego npca zaufanie zdobyliœmy. Bêda potrzebne do koñcowego dialogu u cavalorna.
**************/

VAR INT WHISTLER_TRUST;
VAR INT CAVALORN_TRUST;
VAR INT RATFORD_TRUST;
VAR INT DRAX_TRUST;
VAR INT QUENTIN_TRUST;
VAR INT AIDAN_TRUST;
VAR INT FINGERS_TRUST;
VAR INT TONY_TRUST;
VAR INT VAM_TRUST;
VAR INT FOX_TRUST;
VAR INT GESTATH_TRUST;
VAR INT CARLSON_TRUST;
VAR INT ALIGATOR_TRUST;
VAR INT SCORPION_TRUST;
VAR INT PACHO_TRUST;
VAR INT SNAF_TRUST;
VAR INT SNAF_WOLFS_KILLED;
VAR INT HANIS_TRUST;
VAR INT FISK_TRUST;

var int quentin_fight;//1= walka z quetinem;2=ucieczka bohatera;-1=boh nie chcial walczyc

VAR INT KNOW_JACKALLIGATOR;//bool
VAR INT KNOW_PACHOANDSCORPIO;//bool
VAR INT KNOW_GESTATH;//bool
VAR INT KNOW_CARLSON;//bool
var int Day_PachoJoinsORCamp;//Zmienna opóŸniaj¹ca quest który daje swistak (+2 dni), przechowuje dzien w ktorym Pacho pojawil sie w OR(wraz z Skorpionem) -orc
//*Chapter 2**********
VAR INT SPY_OK;//zmienna potrzebna do zadania z wykryciem szpiega w obozie
VAR INT SPY_COUNT;//zlicza to ile wie dick

VAR INT TH_HERO_KNOWPWD;
VAR INT TH_TRUST;//When talk with Kira init num been set to 1


VAR INT FOX_STEW;
VAR INT TONY_SPY;
VAR INT CAV_TROL;
VAR INT TROL_CMP_TRUST;
VAR INT SNOW_KNOW;
VAR INT TABLOR_BEAST;
VAR INT TABLOR_TROL;
VAR INT TABLOR_SHADOW;
VAR INT BUKHART_TRAIT;
VAR INT DEBT_READ;
VAR INT DEBT_COUNTER;
VAR INT KIRA_TRIAL;
VAR INT DICK_PATROL_CHOICE;
VAR INT PATROL_TRIAL;
VAR INT KATAR_RYTUAL;
VAR INT OPEN_KART;
VAR INT MILTEN_INGED;
VAR INT MAG_PROVE;
VAR INT MAG_KNOWS;

VAR INT GRD_ATTACK_FINISH;
VAR INT PACHO_HEROSERVEDHARK;
VAR INT BURHART_DOING_BAD;

//*****************************
//*Chapter 3**********

VAR INT DICK_CHOOSE;
VAR INT EQQUIP_CHECK;
VAR INT EQQUIP_CHECK_MAG;
VAR INT BUDDLER_JOIN;
VAR INT KIRA_HELP;
VAR INT RATFORD_HELP;
VAR INT CAV_TAKE;
VAR INT RODNEY_MAG;

VAR INT OTHERS_HELP;
VAR INT OLDCAMPGRDS;

VAR INT HERO_MEETS_INFORMATOR;

VAR INT MAP3_READBYDICK;
VAR INT MAP4_READBYDICK;

VAR INT ORNAMENT_WAIT;
VAR INT RITUAL_TIME_OK;
VAR INT LEE_FREE;
VAR INT RYTUAL_BREAK;
VAR INT SWORD_STOLEN;
VAR INT OR_PREALARM;
var int Leaf_OCSpy_notpermanent;
var int talking_with_Truan;
//*Chapter 4**********

VAR INT LEE_BACK;
VAR INT GRD_NC_PASS;
VAR INT LARES_DONE;
VAR INT LARES_COOPERATE;
VAR INT PLUSK_ANGRY;
VAR INT PLUSK_FEAR;
VAR INT PLUSK_DRINK;
VAR INT WOLF_COOPERATE;
VAR INT MINERS_WORK;
VAR INT XARDAS_AGREE;
VAR INT MYXIR_RITUAL;
VAR INT PLACE_CHANGE;
VAR INT DICK_TRIAL;
VAR INT ALMAN_READ;
VAR INT ALM_LOG_READ;
VAR INT LESTER_JOINT;
var int Dream_finished;
VAR INT FOCUS_GET;
VAR INT NECROMANT_AGREE;
VAR INT RITUAL_END;
var int freemine_ready_to_opened;

//*Chapter 5**********

VAR INT TASK_CHOICE;
VAR INT PASSAGE_KNOW;
VAR INT MERC_DONE;
VAR INT CONVOY_LIST_READ;
VAR INT ORKAN_WAIT;
VAR INT MERC_TRAP;

//*Chapter 6**********

VAR INT CHEST_KNOW;
VAR INT MOBUSE;
CONST INT CHEST_USED=1;
VAR INT CHEST_CONF;
VAR INT DIEGO_DEAD;
VAR INT NECRO_APPEAR;

//****SIde quests****************
var int STRANGE_DEMON_KNOW;

//************Orle gniazdo*****

var int nia_rest;
var int investigation;//w sumie niepotrzebne, zrezygnowa³em bo wczeœniej zmienne siê resetowa³y przecie¿.

//**********************

VAR INT DRAX_SELL;
VAR INT STONE_NOTE_READ;
VAR INT FINGERS_PROOFS;
VAR INT RAVEN_LIST;
VAR INT HELP_MARTIN;
VAR INT KUVA_HELP;

VAR INT KAPITEL;
VAR INT PLAY_LUTE;
VAR INT FIRSTJOINT;
VAR INT SECONDJOINT;
VAR INT THIRDJOINT;
VAR INT WISSEN_ALMANACH;
//Aidan
VAR INT KNOW_AIDAN_IS_NOVICE;//Novice in BlackSmith not from B.H.
VAR INT KNOW_AIDAN_AFTER;
VAR INT HEAR_ABOUT_AIDAN_SPECIALS;
VAR INT AIDAN_TRADING;
VAR INT KNOW_AIDAN_DONT_LIKE_WORK;
//Tony
VAR INT TONY_MEMBERS;
VAR INT TONY_JOBS;
VAR INT TONY_CHIEF;
VAR INT TONY_GUARDS;
VAR INT TONY_SHADOWS;
VAR INT TONY_DIGGERS;
VAR INT TONY_OREBARON;
//Teams [Z czasów turnieju na to kto zabije wiecej straznikow :D ]
VAR INT TEAM_A;//1,2,3,4
VAR INT TEAM_B;//1,2,3,4
VAR STRING TEAM_A_NAME;//1,2
VAR STRING TEAM_B_NAME;//1,2
VAR INT TEAMAKILLS;
VAR INT TEAMBKILLS;
//------------
//Magic SWD
VAR INT MAGIC_SWD_EQUIPED;//bool
//
//..........................................
VAR INT POINTS_OC;
VAR INT POINTS_NC;
VAR INT POINTS_ST;

VAR INT LOADGAMECOUNTER;
VAR INT LAST_LOADGAMECOUNTER;
VAR INT WORLDS_INITS;
//*****************
//Animals variants
//*****************
VAR INT SHEEPORHAMMEL;
//
//********************
///Trophies
//********************
VAR INT KNOWS_GETTEETH;	//1  | 5+LVL	| 5 LP  //Z¹b/Kie³:
VAR INT KNOWS_GETCLAWS;	//2  | 10+LVL   | 5 LP  //Pazury:
VAR INT KNOWS_GETFUR;//3  | 3xLVL+30 | 5 LP  //Futro:
VAR INT KNOWS_GETHIDE;//4  | 3xLVL+30 | 5 LP  //Skóra: Topielec, waran, ognisty waran
VAR INT KNOWS_GETTONGUE;//5  | 10xLVL   | 5 LP  //Jêzyk: ognisty waran, waran, jaszczurocz³ek, aligator
VAR INT KNOWS_GETMCMANDIBLES;//6  |			| 1 LP  //Wnêtrznosci pe³zacza
VAR INT KNOWS_GETMCTHREAD;	//7  |			| 1 LP  //Niæ pe³zacza
VAR INT KNOWS_GETMCPLATES;//8  |			| 1 LP  //P³ytki pancerza pe³zacza
VAR INT KNOWS_GETBFSTING;//9  |			| 1 LP  //Z¹d³o: Krwiopijca
VAR INT KNOWS_GETWINGS;	//10 |			| 1 LP  //Skrzyd³a: Krwiopijca
VAR INT KNOWS_GETHORN;	//11 |			| 3 LP  //Róg: Cieniostwór, smoczy zêbacz
VAR INT KNOWS_GETLIVER;	//12 |			| 1 LP  //W¹troba: kretoszczur
VAR INT KNOWS_GETFEATHER;//13 |			| 1 LP  //Pióro: Scierwojad, harpie
VAR INT KNOWS_GETWTF;//14 |			| 1 LP  //Jelita: cieniostwór
VAR INT KNOWS_GETWOOL;//15 |			| 1 LP  //We³na
VAR INT KNOWS_GETHEART;	//16 |			| 3 LP  //Serce: Golemy

CONST INT LPCOST_GETTEETH=5;
CONST INT LPCOST_GETCLAWS=5;
CONST INT LPCOST_GETFUR	=5;
CONST INT LPCOST_GETHIDE	=5;
CONST INT LPCOST_GETTONGUE=5;
CONST INT LPCOST_GETMCMANDIBLES=1;
CONST INT LPCOST_GETMCTHREAD	=1;
CONST INT LPCOST_GETMCPLATES	=1;
CONST INT LPCOST_GETBFSTING	=1;
CONST INT LPCOST_GETWINGS=1;
CONST INT LPCOST_GETHORN=3;
CONST INT LPCOST_GETLIVER=1;
CONST INT LPCOST_GETFEATHER	=1;
CONST INT LPCOST_GETWTF	=1;
CONST INT LPCOST_GETWOOL	=1;
CONST INT LPCOST_GETHEART=3;

CONST STRING TEXT_LERN_GETTEETH="Usuwanie k³ów (koszt: 5 punktów umiejêtnoœci, 250 bry³ek rudy)";
CONST STRING TEXT_LERN_GETCLAWS="Usuwanie pazurów (koszt: 5 punktów umiejêtnoœci, 250 bry³ek rudy)";
CONST STRING TEXT_LERN_GETFUR	="Œci¹ganie futer (koszt: 5 punktów umiejêtnoœci, 250 bry³ek rudy)";
CONST STRING TEXT_LERN_GETHIDE	="Skórowanie gadów (koszt: 5 punktów umiejêtnoœci, 250 bry³ek rudy)";
CONST STRING TEXT_LERN_GETTONGUE="Usuwanie jêzyka (koszt: 5 punktów umiejêtnoœci, 250 bry³ek rudy)";
CONST STRING TEXT_LERN_GETMCMANDIBLES="Usuwanie ¿uwaczek (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETMCTHREAD	="Pozyskiwanie sieci pe³zacza (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETMCPLATES	="Usuwanie pancerza pe³zaczy (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETBFSTING	="Usuwanie ¿¹d³a (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETWINGS="Usuwanie skrzyde³ (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETHORN="Usuwanie rogów (koszt: 3 punkty umiejêtnoœci, 150 bry³ek rudy)";
CONST STRING TEXT_LERN_GETLIVER="Usuwanie w¹troby (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETFEATHER	="Usuwanie piór (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETWTF	="Usuwanie jelita cieniostwora (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETWOOL	="Pozyskiwanie we³ny (koszt: 1 punkt umiejêtnoœci, 50 bry³ek rudy)";
CONST STRING TEXT_LERN_GETHEART="Usuwanie serc (koszt: 3 punkty umiejêtnoœci, 150 bry³ek rudy)";
const int ANIMALTROPHY_ORECOST_PER_LP = 50;

const string name_learning_strength = "Nauka: si³a";
const string name_learning_dexterity = "Nauka: zrêcznoœæ";
const string name_learning_sneak = "Nauka: skradanie siê (10 PN)";
const string name_learning_bow = "Naucz mnie pos³ugiwaæ siê ³ukiem.";
const string name_learning_smith = "Nauka kowalstwa.";
const string name_learning_picklock = "Nauka: otwieranie zamków";
const string name_learning_pickpocket = "Nauka: kradzie¿";
const string name_learning_combat_1h = "Naucz mnie walczyæ broni¹ jednorêczn¹.";
const string name_learning_combat_2h = "Naucz mnie walczyæ broni¹ dwurêczn¹.";
const string name_learning_regeneration_HP = "Naucz mnie regeneracji ¿ycia.";
const string name_learning_regeneration_mana = "Naucz mnie regeneracji many.";
const string name_learning_mana = "Nauka: mana";
const string name_learning_quick_learning = "Szybka nauka.";
const string name_learning_alchemy = "Nauka alchemii.";
const string name_learning_magic = "Nauka: magia";
const string name_learning_animaltrophy = "Nauka: oprawianie zwierzyny.";
const string name_learning_crossbow = "Naucz mnie pos³ugiwaæ siê kusz¹.";
const string name_learning_evasion = "Naucz mnie unikania ciosów.";
const string name_learning_runesword = "Naucz mnie pos³ugiwaæ siê mieczem runicznym (30 PN)";
var int PupilBugfix2;


var int INEXTREMOPLAYING;
var int MCPLATESDELIVERED;
var int Enter_To_Magtower;
var int GetTheWittenRing;
var int GetTheRamonAmulet;
var int EnteredOldMine;
var int EnteredFreeMine;
var int FreeMineOrc_LookingUluMulu;
var int Black_mag_arrived;
var int necro_dead;

const int BecomeRBL_Level = 10;
//const int BecomeHUN_Level = 15;
//const int BecomeMAG_Level = 15;
//#####################################################################
//##
//##
//##					Erfahrungspunkte
//##
//##
//#####################################################################
const int XP_GilbertFound = 200;

//*************************
//Czas Zap³aty varibles/constants
//*************************
//guardsadded = 0;
VAR INT GUARDSADDED;
CONST INT MAXGUARDS=5;//Czyli 4
VAR INT GUARDSKILLED;
CONST INT GUARDSINCHALLENGE=40;
VAR INT SPAWNTIME;
VAR INT CHALLENGESTATE;
VAR INT GRDTALENTS;
VAR INT GRDDIFICULT;
VAR INT LAVA_CAMERASTART;
VAR INT CAVESTATUEDESTROYED;


/*-------------------------------------------------------------------------

						LOG EINTRAGS VARIABLEN
( da die Logeinträge nicht einfach so in permanenten Infos stehen dürfen!) 

--------------------------------------------------------------------------*/
VAR INT LOG_GORNATOTHFIGHT;
VAR INT LOG_GORNATOTHTRAIN;
VAR INT LOG_WOLFTRAIN;
VAR INT LOG_BAALCADARSELL;
VAR INT LOG_BAALCADARTRAIN;
VAR INT LOG_DIEGOTRAIN;
VAR INT LOG_SCORPIOCROSSBOW;
VAR INT LOG_THORUSTRAIN;
VAR INT LOG_THORUSFIGHT;
VAR INT LOG_WEDGELEARN;
VAR INT LOG_SCATTYTRAIN;
VAR INT LOG_CAVALORNTRAIN;

VAR INT DEXTER_TRADED;
VAR INT SCORPIO_EXILE;

//------------------------------------------------------------------------
//Allgemeine Hilfsvariablen
//------------------------------------------------------------------------

VAR INT LEFTYDEAD;
//test

//*********MISC***************
	VAR INT TRIG_FIRST_SEND;//bool
	VAR STRING MOBNAME;
	VAR STRING FPNAME;

VAR INT WORLD_CURRENT;
CONST INT WORLD_WORLDZEN=0;
CONST INT WORLD_FREEMINE = 1;
CONST INT WORLD_OGY = 2;
CONST INT WORLD_MONSTARYDUNGEONZEN=3;
CONST INT WORLD_CATACOMBS	=4;
CONST INT WORLD_OTEMPLE=5;
CONST INT WORLD_DREAM01	=6;//psi dream
CONST INT world_or_deep	= 7;
CONST INT WORLD_NECROLOCATION	= 8;
CONST INT world_labirynt = 9;
	
	//Respawn system bugfix
	var int LastDayIn_WORLDZEN          ;
	var int LastDayIn_FREEMINE          ;
	var int LastDayIn_OGY	             ;
	var int LastDayIn_MONSTARYDUNGEONZEN;
	var int LastDayIn_CATACOMBS         ;
	var int LastDayIn_OTEMPLE           ;
	var int LastDayIn_PSIDREAM	         ;
	var int LastDayIn_ORMINE	         ;
	
	

CONST INT PSI_DREAM_FGT_TIME=2;
//#####################################################################
//##
//##					Storyline Var's
//##
//#####################################################################
VAR INT NC_ARRIVED;
VAR INT PSI_ARRIVED;

//#####################################################################
//##
//##					Mission Var's
//##
//#####################################################################
VAR INT RECRUITS_ARRIVED;
