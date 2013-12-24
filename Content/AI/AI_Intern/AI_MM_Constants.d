//*************************************************************************************
//				KONSTANTEN
//*************************************************************************************

 /*00*/	CONST INT AIV_MM_RESERVED1					= AIV_RESERVED1;	
 /*01*/	CONST INT AIV_MM_RESERVED2					= AIV_RESERVED2;	
 /*02*/	CONST INT AIV_MM_RESERVED3					= AIV_RESERVED3;	
 /*03*/	CONST INT AIV_MM_RESERVED4					= AIV_RESERVED4;	      
 /*04*/ CONST INT AIV_MM_TIMEDATTBOOST				= AIV_TIMEDATTBOOST;
 /*05*/ CONST INT AIV_MM_TPMULT						= AIV_TPMULT;
 /*06*/ CONST INT AIV_MM_BEHAVIOUR					= 6;
 /*07*/ CONST INT AIV_MM_TEMP_PRIO					= 7;
 /*08*/ CONST INT AIV_MM_SHRINKSTATE				= 8;
 /*09*/ CONST INT AIV_MM_TPBASH						= AIV_TPBASH;
 /*10*/ CONST INT AIV_MM_MIRROR_DURATION			= AIV_MIRROR_DURATION;
 /*11*/ CONST INT AIV_MM_PERCRANGE                  = 11;
 /*12*/ CONST INT AIV_MM_DROHRANGE                  = 12;
 /*13*/ CONST INT AIV_MM_ATTACKRANGE                = 13;
 /*14*/ CONST INT AIV_MM_DROHTIME                   = 14;
 /*15*/ CONST INT AIV_MM_FOLLOWTIME                 = 15;
 /*16*/ CONST INT AIV_MM_FOLLOWINWATER              = 16;
 /*17*/ CONST INT AIV_MM_TPCRIT						= AIV_TPCRIT;
 /*18*/ CONST INT AIV_MM_TPIMMU						= AIV_TPIMMU;
 /*19*/	//CONST INT AIV_SHEATS						= 19;
 /*20*/	CONST INT AIV_MM_POISON						= AIV_POISON;
 /*21*/	CONST INT AIV_MM_TIMELOOSEHP				= 21;				//Zeit in Sekunden, die das vom SC beschwörte Monster aushält, bevor es einen Lebenspunkt verliert
 /*22*/	CONST INT AIV_MM_ICEARMOR_DURATION			= AIV_ICEARMOR_DURATION;	
 /*23*/	CONST INT AIV_MM_LASTHP						= AIV_LASTHP;		
 /*24*/	CONST INT AIV_MM_REAL_ID					= 24;
 /*25*/ CONST INT AIV_MM_DEATHINVGIVEN				= 25;	//SN:  da ZS_Dead auch nach jedem Load Game ausgeführt wird!
 /*26*/ CONST INT AIV_MM_DEAD						= 26;
 /*27*/	CONST INT AIV_MM_DAYTORESPAWN				= 27;
 /*28*/ CONST INT AIV_MM_MAXLEVEL					= 28;
 /*29*/ CONST INT AIV_MM_FAIBUGFIX					= 30;
 /*30*/	CONST INT AIV_MM_MAGICSHIELD_DURATION		= AIV_MAGICSHIELD_DURATION;
 /*31*/	CONST INT AIV_MM_CURSE_DURATION				= AIV_CURSE_DURATION;
 /*32*/	CONST INT AIV_MM_TALKEDAFTERATTACK			= 32;
		CONST INT AIV_MM_XPGIVEN					= 33;
 /*33*/ //		  AIV_DAMAGEID						= 33;
 /*34*/	CONST INT AIV_MM_PARTYMEMBER				= AIV_PARTYMEMBER;
 /*35*/ CONST INT AIV_MM_DISTTOMASTER				= 35;
 /*36*/
 /*37*/
 /*38*/
 /*39*/	CONST INT AIV_MM_LASTTARGET					= AIV_LASTTARGET;
 /*40*/ CONST INT AIV_MM_SLEEPSTART                 = 40;
 /*41*/ CONST INT AIV_MM_SLEEPEND                   = 41;
 /*42*/ CONST INT AIV_MM_RESTSTART                  = 42;
 /*43*/ CONST INT AIV_MM_RESTEND                    = 43;
 /*44*/ CONST INT AIV_MM_ROAMSTART                  = 44;
 /*45*/ CONST INT AIV_MM_ROAMEND                    = 45;
 /*46*/ CONST INT AIV_MM_EATGROUNDSTART             = 46;
 /*47*/ CONST INT AIV_MM_EATGROUNDEND               = 47;
 /*48*/ CONST INT AIV_MM_WUSELSTART                 = 48;
 /*49*/ CONST INT AIV_MM_WUSELEND                   = 49; 

// Flags:
CONST INT AIV_MM_SPECREACTTODAMAGE			= AIV_SPECIALCOMBATDAMAGEREACTION;//119



//----------------------------------------
//CONST INT AIV_MM_BEHAVIOUR=7;
CONST INT PASSIVE=0;
CONST INT HUNTER=1;
CONST INT PACKHUNTER=2;
//----------------------------------------
//CONST INT AIV_MM_TEMP_PRIO=8;
CONST INT PRIO_PREY=0;
CONST INT PRIO_ATTACKER=1;
//----------------------------------------
CONST INT ONLYROUTINE=-1;
//----------------------------------------

//----------------------------------------
//CONST INT AIV_MM_REAL_ID = 22;
	CONST INT ID_NONE						 = 0;
	CONST INT ID_WOLF						 = 1; // Wolf | 3 | 10
	CONST INT ID_BLACKWOLF					 = 2; // BlackWolf | 4
	CONST INT ID_SNAPPER					 = 3; // Snapper | 4 | 20
	CONST INT ID_ORCBITER					 = 4; // OrcBiter | 4 | 12
	CONST INT ID_SHADOWBEAST				 = 5; // Shadowbeast | 8 | 40
	CONST INT ID_BLOODHOUND					 = 6; // Bloodhound | 6
	CONST INT ID_TROLL						 = 7; // Troll | 9 | 200
	CONST INT ID_WARAN						 = 8; // Waran | 3 | 9
	CONST INT ID_FIREWARAN					 = 9; // FireWaran | 8 | 50
	CONST INT ID_RAZOR						 = 10; // Razor | 6 | 25
	CONST INT ID_LURKER						 = 11; // Lurker | 4 | 15
	CONST INT ID_SWAMPSHARK					 = 12; // Swampshark | 6 | 35
	CONST INT ID_MINECRAWLER				 = 13; // Minecrawler | 4 | 16
	CONST INT ID_MINECRAWLERWARRIOR			 = 14; // MinecrawlerWarrior | 5 | 22
	CONST INT ID_BLOODFLY					 = 15; // Bloodfly | 2 | 5
	CONST INT ID_BLACKGOBBO					 = 16; // BlackGobboMace | 3
	CONST INT ID_GOBBOCLUB					 = 17; // GreenGobboClub | 3 | 6
	CONST INT ID_SCAVENGER					 = 18; // Scavenger | 2 | 5
	CONST INT ID_SKELETON					 = 19; // noresp
	CONST INT ID_SKELETONWARRIOR			 = 20; // noresp
	CONST INT ID_SKELETONSCOUT				 = 21; // noresp
	CONST INT ID_SKELETONMAGE				 = 22; // noresp
	CONST INT ID_DEMON						 = 23; // Demon | X | 50
	CONST INT ID_DEMONLORD					 = 24; // DemonLord | X
	CONST INT ID_MINECRAWLERQUEEN			 = 25; // noresp
	CONST INT ID_MOLERAT					 = 26; // Molerat | 4 | 5
	CONST INT ID_UNDEADORCWARRIOR			 = 27; // noresp
	CONST INT ID_UNDEADORCSHAMAN			 = 28; // noresp
	CONST INT ID_HARPIE						 = 29; // Harpie | 9 | 20
	CONST INT ID_SLEEPER					 = 30; // noresp
	CONST INT ID_STONEGOLEM					 = 31; // StoneGolem | X | 50
	CONST INT ID_FIREGOLEM					 = 32; // FireGolem | X | 50
	CONST INT ID_ICEGOLEM					 = 33; // IceGolem | X | 50
	CONST INT ID_MEATBUG					 = 34; // Meatbug | 7 | 1
	CONST INT ID_ZOMBIE						 = 35; // noresp
	CONST INT ID_SKELETONLORD				 = 36; // noresp
	CONST INT ID_CAVESTATUE					 = 37; // noresp
	CONST INT ID_SKELETONRANGER				 = 38; // noresp
	CONST INT ID_YOUNGTROLL					 = 39; // YoungTroll | 8 | 100
	CONST INT ID_ALIGATOR					 = 40; // Aligator | 3 | 12
	CONST INT ID_KINGTROLL					 = 41; // King_Troll | 16 | 500
	CONST INT ID_ORC						 = 42; // ??
	const int ID_YOUNGALIGATOR				 = 43; // Young_Aligator | 2 | 6
	CONST INT ID_DRACONIANSCOUT				 = 44; // DraconianScout | 8 | 50
	CONST INT ID_SHEEP						 = 45; // Sheep | 2 | 1
	CONST INT ID_DIRK						 = 46; // Dirk | 9 | 50
	CONST INT ID_WISP						 = 47; // Wisp | 10 | 7
	CONST INT ID_BLACKTROLL					 = 48; // Black_Troll | 12 | 300
	CONST INT ID_FIREWISP					 = 49; // Wisp_Fire | 20 | 10
	CONST INT ID_SNAF_MOLERAT				 = 50; // mission
	CONST INT ID_ZOMBIE_GURU				 = 51; // noresp
	CONST INT ID_BLACKGOBBOWARRIOR			 = 52; // BlackGobboWarrior | 4 | 15
	
	CONST INT ID_BLACKWOLFBOSS				 = 54; // BlackWolfBoss
	CONST INT ID_DRACONIANSOLIDER			 = 55; // DraconianSolidier | 9  | 60
	CONST INT ID_DRACONIANOFFICER			 = 56; // DraconianOfficer | 13 | 75
	CONST INT ID_DRAGON						 = 57; // Dragon_Fire/oth.. | X | 500
	CONST INT ID_GOBBOSWORD					 = 58; // GreenGobboSword | 3 | 8	
	CONST INT ID_SWAMPGOLEM					 = 59; // SwampGolem | 10 | 30	
	CONST INT ID_ORCDOG						 = 60; // OrcDog | 5 | 20
	CONST INT ID_ORCSCOUT					 = 61; // OrcScout | 5 | 22
	CONST INT ID_ORCSCOUTGYD				 = 62; // OrcScoutGYD | 5 | 22
	CONST INT ID_ORCSHAMAN					 = 63; // OrcShaman | 8 | 30
	CONST INT ID_ORCSLAVE					 = 64; // OrcSlave | 2 | 15
	CONST INT ID_ORCDANCE					 = 65; // OrcPeasantDance | 3 | 15
	CONST INT ID_ORCDRUM					 = 66; // OrcPeasantDrum | 3 | 15
	CONST INT ID_ORCWARRIOR1				 = 67; // OrcWarrior1	 | 5 | 30
	CONST INT ID_ORCWARRIOR2				 = 68; // OrcWarrior2	 | 6 | 35
	CONST INT ID_ORCWARRIOR3				 = 69; // OrcWarrior3	 | 6 | 37
	CONST INT ID_ORCWARRIOR4				 = 70; // OrcWarrior4	 | 7 | 40
	CONST INT ID_ORCELITE					 = 71; // OrcElite1		 | 8 | 50
	CONST INT ID_ORCGENERAL					 = 72; // OrcElite2	 | 13 | 60
	CONST INT ID_RAZORNK					 = 73; // RazorNK	 | 5 | 22
	CONST INT ID_TIGER						 = 74; // Tiger		 | 5 | 22 // Beka z tygrysaXD
	CONST INT ID_WISP2						 = 74; // Wisp2		 | 10 | 7	
	
	// Missions:
	CONST INT ID_ALIGATORBOSS				 = 1006;//mission special
	CONST INT ID_MISTROLL1					 = 1000;
	CONST INT ID_MIS_SNAFWOLF				 = 1001;
	CONST INT ID_DEMONPSI					 = 1002;
	CONST INT ID_SKELETON_MDWAVE			 = 1003;
	CONST INT MIS_KIRABLACKTROLL			 = 1004;
   CONST INT ID_MONSTER_OF_SWAMP			 = 1005;
	//IDs für Sezial-Monster
	CONST INT MID_CANYONTROLL				 = 5000;
	CONST INT MID_THEKEEPER					 = 5001;
	CONST INT MID_DAMLURKER					 = 5002;
	CONST INT MID_YOUNGTROLL				 = 5003;
	CONST INT ID_MINECRAWLERWARRIOROT 		 = 5004;
//----------------------------------------

//=26;//Respawn
CONST INT NORESPAWN=999;


