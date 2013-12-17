//#############################################################################################
//
//AI-Custom-Konstanten
//-----------------------------
//Allerlei selbst definierte Konstanten, um Zahlen in den Skripten weitgehend zu vermeiden
//
//#############################################################################################
//#############################################################################################



const int aiv_bitfield0_collDetectionDynamic      = ((1 << 1) - 1) <<  7;
//-------- Kennungen der AI-Variablen --------

//----------- A I V A R S ---------------------
 /*00*/	CONST INT AIV_RESERVED1					= 0;//
 /*01*/	CONST INT AIV_RESERVED2					= 1;//
 /*02*/	CONST INT AIV_RESERVED3					= 2;//
 /*03*/	CONST INT AIV_RESERVED4					= 3;//
 /*04*/	CONST INT AIV_TIMEDATTBOOST				= 4;//For boosted attribs int B_SetTimedATT_rec
 /*05*/	CONST INT AIV_TPMULT					= 5;//COLLISION!!!
 /*06*/	CONST INT AIV_OBSERVEINTRUDER			= 6;//NoNBOOL//ORC
 /*07*/	CONST INT AIV_WANTEDITEM				= 7;//Hlp_GetInstanceId (item)
 /*08*/	CONST INT AIV_PLUNDERED					= 8;//NoNBOOL//wird gesetzt sobald der Körper geplündert wurde und gelöscht, wenn der NSC ohnmächtig/tot wird
 /*09*/	CONST INT AIV_TPBASH					= 9;//
 /*10*/	CONST INT AIV_MIRROR_DURATION			= 10;//
 /*11*/	CONST INT AIV_ITEMSTATUS				= 11;//ZS_STAND->B_ZS many values
 /*12*/	CONST INT AIV_HANGAROUNDSTATUS			= 12;//0,1,2,3,4
 /*13*/	CONST INT AIV_TRIGGER3					= 13;//MAY have some connections with engine, so DON'T TOUCH!
 /*14*/	CONST INT AIV_ITEMFREQ					= 14;//Used to random in ZS
 /*15*/	CONST INT AIV_GUARDITERATOR				= 15;//THAT REALLY CAN DO STH? I don't think so, but better leave it alone.
 /*16*/	CONST INT AIV_LASTROBBED				= 16;//if LastStealed<Chapter = Give some inventory
 /*17*/	CONST INT AIV_TPCRIT					= 17;//COLLSION!!!
 /*18*/	CONST INT AIV_TPIMMU					= 18;
 /*19*/	//MOVED:  AIV_SHEATH					= 19;
 /*20*/ CONST INT AIV_POISON					= 20;//
 /*21*/ CONST INT AIV_DEALDAY					= 21;//I dont understand what ive done b4 ;P	//SN: wird für Ambient NSCs benutzt, um sich den Tag des letzten Deals zu merken (z.B.:Sumpfkraut für ORG oder Wasser für BAU)
 /*22*/ CONST INT AIV_ICEARMOR_DURATION			= 22;//
 /*23*/ CONST INT AIV_LASTHP					= 23;//
 /*24*/ CONST INT AIV_ZSTYPE					= 24;
 /*24...*/		CONST INT TA_OMC_GUARD					=0;
 /*24...*/		CONST INT TA_OMC_GATEGUARD				=1;
 /*24...*/		CONST INT TA_OMC_WORKER					=2;
 /*24...*/		CONST INT TA_ONEPOSITION				=3;
 /*24...*/		//TODO:
 /*24...*/		CONST INT TA_NO_RICEWORKER				=4;
 /*24...*/		CONST INT TA_NO_MINEWORKER				=5;
 /*24...*/		CONST INT TA_NO_CAMPWORKER				=6;
 /*24...*/		CONST INT TA_NO_CASTLEWORKER			=7;
 /*24...*/		CONST INT TA_NO_GUARDHOLDPOSITION		=8;
 /*24...*/		CONST INT TA_NO_GUARDPATROL1			=9;
 /*24...*/		CONST INT TA_NO_GUARDPATROL2			=10;
 /*24...*/		CONST INT TA_NO_GUARDPATROL3			=11;
 /*25*/ CONST INT AIV_HELLOSAYED				= 25;//=Wld_GetDay//For say Greet to hero today FRIENDLY HELLO,NEUTRAL HELLO,ANGRY HELLO,HOSTILE HELLO===>ZS_ATTACK	
 /*26*/ CONST INT AIV_MISSION1					= 26;
 /*27*/ CONST INT AIV_GUARDPASSAGE_STATUS		= 27;	//Enthält den Status einer Durchgangswache
 /*27...*/		CONST INT AIV_GPS_BEGIN					= 0;		//...Anfang; SC noch nicht in der Nähe
 /*27...*/		CONST INT AIV_GPS_FIRSTWARN				= 1;		//...nach der ersten Warnung an den SC
 /*27...*/		CONST INT AIV_GPS_LASTWARN				= 2;		//...nach der zweiten Warnung an den SC
 /*27...*/		CONST INT AIV_GPS_PUNISH				= 3;		//...SC kam zum dritten Mal zu nahe -> Wache greift an!
 /*28*/ CONST INT AIV_LASTDISTTOWP				= 28;	//enthält die Distanz zu einem Referenzpunkt hinter der Wache, die bei der letzten Verwarnung ermittelt wurde //3 in hunscript waypoint not checked
 /*29*/ CONST INT AIV_PASSGATE					= 29;
 /*30*/ CONST INT AIV_MAGICSHIELD_DURATION		= 30;
 /*31*/ CONST INT AIV_CURSE_DURATION			= 31;
 /*32*/ CONST INT AIV_LOCATION					= 32;
 /*33*/ //MOVED:  AIV_DAMAGEID					= 33; //moved to Funcs_Globals.d
 /*34*/ CONST INT AIV_PARTYMEMBER				= 34;
 /*35*/ CONST INT AIV_ATTACKREASON				= 35;
 /*35...*/		CONST INT AIV_AR_NONE					= 0;	// Inni siê nie mieszaj¹, ale kasê bohater jak coœ p³aci + dobicie hero
 /*35...*/		CONST INT AIV_AR_INTRUDER				= 1; // Inni siê mieszaj¹, kasê bohater placi + dobicie hero
 /*35...*/		CONST INT AIV_AR_PERSONALAFFAIRS		= 2; // Inni sie nie mieszaj¹, bohater nie p³aci, tylko pobicie
 /*36*/ CONST INT AIV_LASTTARGET				= 36;//SN: wird in ZS_Attack benötigt um das letzte Ziel zu merken
 /*37*/ CONST INT AIV_INVINCIBLE				= 37;//BOOL USED SO FCKING MUCH; MH: ist TRUE für beide Teilnehmer eines Dialogs (s. ZS_Talk)
 /*38*/ CONST INT AIV_ISLOOKING					= 38;
 /*39*/ CONST INT AIV_IMPORTANT					= 39;//BOOL ->MakeFlg 12;//But so fuckin' much used
 /*40*/ CONST INT AIV_WASDEFEATEDBYSC			= 40;//
 /*41*/ CONST INT AIV_HASDEFEATEDSC				= 41;//
 /*42*/ CONST INT AIV_FINDABLE					= 42;//For npc find dialogs
 /*43*/ CONST INT AIV_BEENATTACKED				= 43;
 /*44*/ CONST INT AIV_WARNTARGET				= 44;
 /*45*/ CONST INT AIV_RESPAWN					= 45;//MH: im NSC-Script angegeben: Soll der Typ respawnt werden (immer DIREKT)
 /*46*/ CONST INT AIV_LASTHITBYRANGEDWEAPON		= 46;
 /*47*/ CONST INT AIV_SPECIALCOMBATDAMAGEREACTION=47;//BOOL ->MakeFlg 21;	//SN: verzweigt bei erlittenen Treffern in ein spezielles Reaktionsmodul
 /*48*/ CONST INT AIV_TALKBEFOREATTACK			= 48;//BOOL ->MakeFlg 23;	//SN: ist dieses Flag gesetzt, so wird beim B_AssessEnemy auf eine Importantinfo abgefragt!
 /*49*/ CONST INT AIV_GUARDMEMORY				= 49;

// Bitflags 100 - 228
// NOTE: Use this range aivars only when there is no ability
// to give aivar different value than 0/1 (they're boolean)

CONST INT AIV_PCISSTRONGER				= 100;//rarely used ->flags
CONST INT AIV_XPGIVEN					= 103;//unused <- wut? used 4sure! 12:40 AM 10/16/2012
CONST INT AIV_HASBEENDEFEATEDINPORTALROOM=107;

CONST INT AIV_FIGHTSPEACHFLAG			= 109;//Put that weapon down, etc.
CONST INT AIV_MOVINGMOB					= 114;
CONST INT AIV_DIDWAITTOCLEARROOM		= 115;
CONST INT AIV_FOUNDPERSON				= 116;
CONST INT AIV_DONTUSEMOB				= 118;
CONST INT AIV_ITEMSCHWEIN				= 121;//BOOL ->MakeFlg 24;   //MH: NSCs, die dieses Flag auf TRUE haben, gehen IMMER, wenn im FreeLos der HERO ein Item nimmt (assessTheft-Wn) von DIEBSTAHL aus (--> ZS_CatchThief)

//unused:
//CONST INT AIV_HIGHWAYMEN	=3;
VAR INT NPC_AIV_CHECK0;
VAR INT NPC_AIV_CHECK1;
VAR INT NPC_AIV_CHECK2;
VAR INT NPC_AIV_CHECK3;
VAR INT NPC_AIV_CHECK4;
VAR INT NPC_AIV_CHECK5;
VAR INT NPC_AIV_CHECK6;
VAR INT NPC_AIV_CHECK7;
VAR INT NPC_AIV_CHECK8;
VAR INT NPC_AIV_CHECK9;
VAR INT NPC_AIV_CHECK10;
VAR INT NPC_AIV_CHECK11;
//FREE 24 bools + 5 FREE -1FLG = 28 FREE
/********************************************************************
**					NPC-Typ											*
********************************************************************/
//!!!! die folgenden 3 Konstanten stehen zur Zeit (v0.93) noch in der
//!!!! CONSTANTS.D, müssen aber im nächsten Release (v0.94) hier
//!!!! aktiviert werden.
//---------------------------------------
CONST INT NPCTYPE_AMBIENT	=0;	//Amient-Nscs In Den Lagern
CONST INT NPCTYPE_MAIN	=1;
CONST INT NPCTYPE_GUARD	=2;
CONST INT NPCTYPE_FRIEND	=3;
CONST INT NPCTYPE_MINE_AMBIENT=4;
CONST INT NPCTYPE_MINE_GUARD	=5;
CONST INT NPCTYPE_OW_AMBIENT	=6;
CONST INT NPCTYPE_OW_GUARD	=7;
CONST INT NPCTYPE_ROGUE	=8;	//Npcs im Banditenlager

/********************************************************************
**					Fight AI-Constanten								*
********************************************************************/

CONST INT FAI_MONSTER_MASTER=1;
CONST INT FAI_HUMAN_COWARD	=2;
CONST INT FAI_HUMAN_STRONG	=3;
CONST INT FAI_HUMAN_MASTER	=4;
CONST INT FAI_MINECRAWLER	=5;
CONST INT FAI_DEMON	=6;
CONST INT FAI_GOBBO	=7;
CONST INT FAI_GOLEM	=8;
CONST INT FAI_LURKER	=9;
CONST INT FAI_MONSTER_COWARD	=10;	//Monster, die man auch als Newbie kleinkriegt
CONST INT FAI_MOLERAT	=11;
CONST INT FAI_ORC	=12;
CONST INT FAI_ORCDOG	=13;
CONST INT FAI_ORCUNDEAD=14;
CONST INT FAI_SCAVENGER=15;
CONST INT FAI_SHADOWBEAST=16;
CONST INT FAI_SKELETON	=17;
CONST INT FAI_SNAPPER	=18;
CONST INT FAI_SWAMPSHARK	=19;
CONST INT FAI_TROLL	=20;
CONST INT FAI_WARAN	=21;
CONST INT FAI_WOLF	=22;
CONST INT FAI_ZOMBIE	=23;
CONST INT FAI_BLOODFLY	=24;
CONST INT FAI_HUMAN_MAGE	=25;
CONST INT FAI_MONSTER_STRONG	=26;
CONST INT FAI_MINECRAWLERQUEEN=27;
CONST INT FAI_SLEEPER	=28;
CONST INT FAI_HUMAN_RANGED	=29;
CONST INT FAI_HUMAN_MULTI	=30;
CONST INT FAI_HUMAN_BATTLE	=31;

/********************************************************************
**					Gesichts-Texturen								*
********************************************************************/
CONST INT DEFAULT=0;

CONST INT FACE_NORMAL=0;
CONST INT FACE_MAGE=1;
CONST INT FACE_FIGHTER=2;
CONST INT FACE_THIEF=3;
CONST INT FACE_GURU=4;
CONST INT FACE_NOVICE=5;

/********************************************************************
**					Zeit-Konstanten									*
********************************************************************/
CONST INT NPC_ANGRY_TIME=120;	//Spielsekunden
//CONST INT NEWS_SPAWN_TIME = ?;


/********************************************************************
**					ZS_RÜCKABEWERTE 							   **
********************************************************************/

CONST INT START_LOOP=1;
CONST INT START_NOLOOP=0;
CONST INT LOOP_CONTINUE=0;
CONST INT LOOP_END	=1;

/********************************************************************
**					Allgemeine Konstanten						   **
********************************************************************/
CONST INT TRUE	=1;
CONST INT FALSE	=0;

/********************************************************************
**					Konstanten für Distanzen					   **
**					    der Menschen-AI							   **
********************************************************************/
CONST INT HAI_DIST_MELEE	= 700;	//1. Drunter wählen menschliche NSCs Nahkampf, drüber Fernkampf (B_SelectWeapon)
																			//2. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Waffen bedroht (B_AssessFighter)
CONST INT HAI_DIST_RANGED	=3000;	//1. Innerhalb dieser Distanz fühlen sich NSCs von gezogenen Fernkampfwaffen/Kampfzaubern bedroht (B_AssessFighter)

CONST INT HAI_DIST_ABORT_MELEE=HAI_DIST_MELEE+400;	//NSC bricht einen Nahkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet
CONST INT HAI_DIST_ABORT_RANGED=HAI_DIST_RANGED+500;	//NSC bricht einen Fernkampf ab, wenn die Distanz zum Ziel diesen Wert erreicht. '+X00' fungiert als Hysterese, damit nicht ständig der Kampf beginnt und wieder endet
CONST INT HAI_DIST_ABORT_FLEE	=3000;

CONST INT HAI_DIST_ASSESSCASTER	=2000;	//Ab dieser Entfernung reagieren NSCs auf das Zaubern eines SCs
CONST INT HAI_DIST_HELPATTACKEDCHARGES	=2000;//B4:2000							// Wach-NSCs reagieren auf Angriffe auf beschützte NSCs innerhalb dieser Reichweite (gemessen am Opfer!)

CONST INT HAI_DIST_ASSESS_MONSTER	=1000;	//Ab dieser Distanz zu einem herannahenden Monster reagiert der NSC darauf !
CONST INT HAI_DIST_ABORT_ASSESS_MONSTER	=HAI_DIST_ASSESS_MONSTER+200;	//Ab dieser Distanz beendet ein NSC die Abwartende Haltung gegenüber einem sich entfernenden Monster!
CONST INT HAI_DIST_ATTACK_MONSTER	=1000;	//Ab dieser Distanz greift ein abwartender NSC ein herannahendes Monster an!

CONST INT HAI_DIST_CATCHTHIEF	=450;//B4:150							// Ab dieser Distanz ist es möglich dem Nsc in die Tasche zu greifen
CONST INT HAI_DIST_ASSESSTHEFT	=800;	//Auf diese Distanz stellen Nsc´s einen Diebstahl fest
CONST INT HAI_DIST_ABORTPURSUIT	=1000;	//Auf diese Distanz brechen Durchgangswachen die Verfolgung ab

CONST INT HAI_DIST_ACTIONRANGE	=1500;	//technische Reichweite von PERC_ASSESSENTERROOM
CONST INT HAI_DIST_CLEARROOM	=1200;	//700						// innerhalb dieser Distanz reagieren nicht-Wachen auf das Betreten von unerlaubten Räumen (PERC_ASSESSENTERROOM)
CONST INT HAI_DIST_HEARROOMINTRUDER	=1200;	//700						// innerhalb dieser Distanz wird der SC beim Betreten von unerlaubten Räumen auch entdeckt (gehört), wenn die Beobachter ihm den Rücken zudrehen (aber schleichen hilft wieder!)

CONST INT HAI_DIST_SMALLTALK	=500;
CONST INT HAI_DIST_OBSERVEINTRUDER	=50;
CONST INT HAI_DIST_GUARDPASSAGE_RESET	=1500;	//Durchgangswachen beruhigen sich wieder, wenn der SC diese Entfernung erreicht hat
CONST INT HAI_DIST_GUARDPASSAGE_ATTENTION	=1200;	//innerhalb dieser Distanz drehen sich Durchgangswachen immer zum Spieler

CONST INT HAI_DIST_FOLLOWPC	=400;	//NSC im TA-Zustand ZS_FollowPC entfernt sich höchstens bis zu dieser Distanz. Bei Überschreiten schließt er wieder auf
CONST INT HAI_DIST_ASSESSTOLERATEDENEMY	=1000;	//Distanz innerhalb der auf einen geduldeten Feind reagiert wird (Fall 1)

CONST INT HAI_DIST_WATCH	=1500;	//Innerhalb dieser Reichweite drehen sich Palisadenwachen zum SC (falls er nicht schleicht)
CONST INT HAI_DIST_DETECTUSEMOB	=1500;	//Innerhalb dieser Reichweite wird die Benutzung von Objekten durch den SC entdeckt

/********************************************************************
**					Konstanten für Zeiten						   **
**					    der Menschen-AI							   **
********************************************************************/
CONST INT HAI_TIME_PURSUIT	=20;	//Zeit in Sekunden, nach der eine Verfolgung abgebrochen wird (ZS_ProclaimAndPunish)
CONST INT HAI_TIME_FOLLOW	=10;	//Anzahl der 3s-Abschnitte die sich das Opfer des NSCs maximal in BS_RUN befinden darf, um noch weiter verfolgt zu werden
CONST INT HAI_TIME_UNCONSCIOUS	=20;	//Zeit in Sekunden, die der SC und NSCs bewußtlos bleiben
CONST INT HAI_TIME_TURNAWAY	=20;	//Zeit in Sekunden, die sich der feige Wach-NSC vor dem siegreichen SC (der gerade was anstellt) abdreht und ihn ignoriert


