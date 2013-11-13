
// **************************************************
// Zaubersprüche
// Hier stehen die Definitionen der
// logischen Sprüche
// Autor: Carsten Edenfeld
// **************************************************

// SpellCat
CONST INT SPELL_GOOD		= 	0;
CONST INT SPELL_NEUTRAL		= 	1;
CONST INT SPELL_BAD			= 	2;


CONST INT SPL_DONTINVEST 	= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
CONST INT SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
CONST INT SPL_SENDCAST		= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
CONST INT SPL_SENDSTOP		= 	3;		// Beende Zauber ohne Effekt
CONST INT SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level



// ************************************************************************************************
// zum Casten benötigtes, bzw. bei aufladbaren Spells maximal investierbares Mana
// ************************************************************************************************
const int	SPL_SENDCAST_SCROLL		=	10;

//C I
const int	SPL_SENDCAST_LIGHT			=	5;
const int	SPL_SENDCAST_FIREBOLT		=	10;
const int	SPL_SENDCAST_THUNDERBOLT	=	10;

//C II
const int	SPL_SENDCAST_WINDFIST		=	20;
const int	SPL_SENDCAST_SLEEP			=	15;
const int	SPL_HEALING_HP_PER_MP		=	10;	// Heal (HP pro Mana) / No 5 mana for scroll!!
const int	SPL_HEALINGOTHER_HP_PER_MP		=	8;
const int	SPL_SENDCAST_StuningBall	=	15;
const int	SPL_SENDCAST_MIRROR			=	20; // No scroll
const int	SPL_SENDCAST_MAGICSHIELD	=	20; // No scroll 
const int	SPL_SENDCAST_ICEARMOR		=	20; // No scroll (fix them?)

//C III
const int	SPL_SENDCAST_CHARM			=	25;
const int	SPL_SENDCAST_FIREBALL		=	30;
const int	SPL_SENDCAST_THUNDERBALL	=	30;
const int	SPL_SENDCAST_WEAKNESS		=	25;
const int	SPL_SENDCAST_ICECUBE		=	30;
const int   SPL_PYRO_DAMAGE_PER_SEC		=	20;	// No 5 mana for scroll!!
const int   SPL_LIFEDRAIN_DRAIN_PER_MP	=	8;	// No 5 mana for scroll!!
const int   SPL_LIFEDRAIN_INCOME_PER_MP =	3;	

//TODO: MADE RUNES!!! + modify scroll
const int	SPL_SENDCAST_FEAR			=	25;


//C IV
const int	SPL_SENDCAST_FIRESTORM		=	50;
//const int	SPL_SENDCAST_CHAINLIGHTNING	=	3;
const int	SPL_SENDCAST_STORMFIST		=	50;
const int	SPL_SENDCAST_DESTROYUNDEAD	=	50;
const int	SPL_SENDCAST_FIREWALL		=	50;
const int	SPL_SENDCAST_HOLYFIRE		=	40;
//TODO: MADE RUNES!!! + modify scroll
const int	SPL_SENDCAST_BERZERK		=	40;

//C V
const int	SPL_SENDCAST_ICEWAVE		=	65;
const int	SPL_SENDCAST_FIRERAIN		=	65;
const int	SPL_SENDCAST_THUNDER		=	60;

//C VI
const int	SPL_SENDCAST_Meteor			=	100;
const int	SPL_SENDCAST_BREATHOFDEATH	=	20;


const int	SPL_SENDCAST_TELEPORT		=	5;
//No runes:
const int	SPL_SENDCAST_SHRINK			=	10;

const int	SPL_SENDCAST_TRF_MEATBUG	=	10;
const int	SPL_SENDCAST_TRF_MOLERAT	=	10;
const int	SPL_SENDCAST_TRF_SCAVENGER	=	10;
const int	SPL_SENDCAST_TRF_BLOODFLY	=	10;
const int	SPL_SENDCAST_TRF_WOLF		=	10;
const int	SPL_SENDCAST_TRF_LURKER		=	10;
const int	SPL_SENDCAST_TRF_WARAN		=	10;
const int	SPL_SENDCAST_TRF_ORCDOG		=	10;
const int	SPL_SENDCAST_TRF_CRAWLER	=	10;
const int	SPL_SENDCAST_TRF_SNAPPER	=	10;
const int	SPL_SENDCAST_TRF_SHADOWBEAST=	10;
const int	SPL_SENDCAST_Summong³upek	=	30;


//TODO: RUNES!!!
const int	SPL_SENDCAST_SUMMONDEMON	=	70;
const int	SPL_SENDCAST_SUMMONSKELETON	=	50;
const int	SPL_SENDCAST_SUMMONGOLEM	=	60;
const int	SPL_SENDCAST_ARMYOFDARKNESS	=	90;

const int	SPL_SENDCAST_MASSDEATH		=	10;
const int	SPL_SENDCAST_NEW1			=	5;		// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
//TODO: SPL_SENDCAST_NEW1 (uriziel) was removed, recreate!


const int	SPL_SENDCAST_VAMPIRICAURA		=	15;//Removed!



const int	SPL_SENDCAST_LIGHTNING_BIG	=	20;
const int	SPL_SENDCAST_MFIREBALL		=	10;
// ************************************************************************************************
// Schaden der direkten Kampfsprüche
// ************************************************************************************************
const int	SPL_DAMAGE_FIREBOLT			=	40;
const int	SPL_DAMAGE_FIREBALL			=	70;		//pro Level (x3) = 120
const int	SPL_DAMAGE_FIRESTORM		=	100;		//pro level (x3) = 165
const int	SPL_DAMAGE_FIRERAIN			=	140;		//pro level (x2) = 180
const int	SPL_DAMAGE_LIGHTNING_BIG	=	250;
const int	SPL_DAMAGE_METEOR			=	230; //2 levels


const int	SPL_DAMAGE_THUNDERBOLT		=	40;
const int	SPL_DAMAGE_THUNDERBALL		=	60;		///pro Level (x3) = 84

const int	SPL_DAMAGE_MASSDEATH		=	400;
const int	SPL_DAMAGE_BREATHOFDEATH	=	200;
const int	SPL_DAMAGE_DESTROYUNDEAD	=	4000;	//soll halt wirklich killen!

const int	SPL_DAMAGE_WINDFIST			=	50;//pro Level (x3) = 48
const int	SPL_DAMAGE_STORMFIST		=	77;//pro Level (x3) = 60
const int	SPL_DAMAGE_MFIREBALL		=	220;

const int	SPL_DAMAGE_HOLYFIRE		=	400;//x2

const int	SPL_DAMAGE_THUNDER		=	400;//2 levels

const int	SPL_DAMAGE_FIREWALL		=	60;


// ************************************************************************************************
// HPs, die den Opfern in den Opferzuständen abgezogen werden:
// ************************************************************************************************

const int   SPL_FREEZE_DAMAGE		 	=	50;	// IceCube, IceWave
const int   SPL_ZAPPED_DAMAGE_PER_SEC 	=	30;	// ChainLightning




// ************************************************************************************************
// Zeit, die das Oper im ZS bleibt (in sec.)
// ************************************************************************************************

// Achtung: wenn bei FREEZE (9) und SHORTZAPPED (2) die Werte geändert werden, muß auch die Lebensdauer der PFX angepasst werden
const int	SPL_TIME_SHORTZAPPED		=	2;	// Thunderball
const int	SPL_TIME_FREEZE				=	9;	// IceCube, IceWave
const int   SPL_TIME_SLEEP				=	30;	// Sleep
const int	SPL_TIME_BERZERK			=	30;	// Berzerk


// Ranges für NSC-Magie-Auswahllogik
const int	SPL_RANGE_ICEATTACK			=	350;	
const int	SPL_RANGE_WINDFIST			=	1200;	
const int	SPL_RANGE_STORMFIST			=	1200;	
const int	SPL_RANGE_SLEEP				=	1000;	
const int	SPL_RANGE_CHAINLIGHTNING	=	1000; //Opfer in ZS, dort wird schaden angegeben	




// folgendes array verweist auf den _SpezialEffekt_ Klassennamen nach dem "SPELL_",
const STRING spellFXInstanceNames[MAX_SPELL] =
{
	"Light",
	"Fireball",
	"Transform",
	"Fear",
	"Heal",
	"Lightning",
	"Demon",
	"Skeleton",
	"Forget",
	"WindFist",
	"Telekinesis",
	"Charm",
	"Sleep",
	"Pyrokinesis",
	"MassDeath",
	"Control",
	"DestroyUndead",
	"Firebolt",
	"Firestorm",
	"Firerain",
	"Speed",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Teleport",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Transform",
	"Chainlightning",
	"Thunderbolt",
	"Thunderball",
	"Icecube",
	"Icewave",
	"Golem",
	"ArmyOfDarkness",
	"Stormfist",
	"Telekinesis2",
	"BreathOfDeath",
	"Shrink",
	"Undress",
	"Dance",
	"Berzerk",
	"BreathOfDeath",
	"LifeDrain",
	"StuningBall",
	"Meteor",
	"Holyfire",
	"Wezwanie",
	"Fireball",
	"Lightning_Big",
	"Thunder",
	"FireWall",
	"VampiricAura",
	"MagicShield",
	"Weakness",
	"Mirror",
	"HealOther",
	"IceArmor",
	"IceArmor2",
	"Teleport",
	"Teleport",//TODO: Create sth new
	"Teleport",//Like up
   "Teleport",
   "Teleport",
   "Teleport",
	"Teleport"
	
};


const STRING spellFXAniLetters[MAX_SPELL] =
{
	"SLE",	//	SPL_LIGHT
	"FIB",  //  SPL_FIREBALL
	"TRF",  //  SPL_TRANSFORM
	"FEA",  //  SPL_FEAR
	"HEA",  //  SPL_HEAL
	"XXX",  //  SPL_LIGHTNING
	"SUM",  //  SPL_SUMMONDEMON
	"SUM",  //  SPL_SUMMONSKELETON
	"XXX",  //  SPL_FORGET
	"WND",  //  SPL_WINDFIST
	"TEL",  //  SPL_TELEKINESIS
	"SLE",  //  SPL_CHARM
	"SLE",  //  SPL_SLEEP
	"PYR",  //  SPL_PYROKINESIS
	"FEA",  //  SPL_MASSDEATH
	"CON",  //  SPL_CONTROL
	"FIB",  //  SPL_DESTROYUNDEAD
	"FBT",	//	SPL_FIREBOLT
	"FIB",  //  SPL_FIRESTORM
	"FEA",  //  SPL_FIRERAIN
	"XXX",  //  SPL_SPEED
	"HEA",  //  SPL_TELEPORT1
	"HEA",  //  SPL_TELEPORT2
	"HEA",  //  SPL_TELEPORT3
	"HEA",  //  SPL_TELEPORT4
	"HEA",  //  SPL_TELEPORT5
	"TRF",  //  SPL_TRF_BLOODFLY
	"TRF",  //  SPL_TRF_BLOODHOUND
	"TRF",  //  SPL_TRF_CRAWLER
	"TRF",  //  SPL_TRF_LURKER
	"TRF",  //  SPL_TRF_MEATBUG
	"TRF",  //  SPL_TRF_MOLERAT
	"TRF",  //  SPL_TRF_ORCDOG
	"TRF",  //  SPL_TRF_RAZOR
	"TRF",  //  SPL_TRF_SCAVENGER
	"TRF",  //  SPL_TRF_SCAVENGER2
	"TRF",  //  SPL_TRF_SHADOWBEAS
	"TRF",  //  SPL_TRF_SNAPPER
	"TRF",  //  SPL_TRF_WARAN
	"TRF",  //  SPL_TRF_WOLF
	"LIN",  //  SPL_CHAINLIGHTNING
	"FBT",  //  SPL_THUNDERBOLT
	"FIB",  //  SPL_THUNDERBALL
	"FRZ",  //  SPL_ICECUBE
	"FEA",  //  SPL_ICEWAVE
	"SUM",  //  SPL_SUMMONGOLEM
	"SUM",  //  SPL_ARMYOFDARKNESS
	"WND",  //  SPL_STORMFIST
	"XXX",  //  SPL_TELEKINESIS2
	"FIB",  //  SPL_BREATHOFDEATH
	"SLE",  //  SPL_SHRINK
	"SLE",  //  SPL_UNDRESS
	"XXX",  //  SPL_DANCE
	"SLE",	//	SPL_BERZERK
	"FIB",  //  SPL_NEW1
	"TEL",  //  SPL_NEW2
	"FBT",  //  SPL_NEW3//FBT
	"SLE",  //  SPL_NEW4
	"FIB",  //  SPL_Summong³upek	
	"SUM",  //  SPL_Summong³upek
	"FIB",  //  SPL_MFireBall
	"SUM",   //  SPL_LIGHTNING_BIG
	"FEA",  //  SPL_THUNDER	
	"FIB",  //  SPL_FIREWALL		   
	"FEA",  //  SPL_VAMPIRICAURA	
	"FEA",  //  SPL_MAGICSHIELD	 
	"WND",  //  SPL_WEAKNESS		   
	"SLE",	//  SPL_MIRROR		     
    "LIN", 	//	SPL_HEALOTHER	
	"SLE",	//  SPL_ICEARMOR		     	  
    "SLE",   //  SPL_ICEARMOR2
	"HEA",  //  SPL_TELEPORT6
	"HEA", //  SPL_createportal
	"HEA",  //  SPL_gotoportal
   "HEA",  //  SPL_TELEPORTToHuntersCamp
   "HEA",  //  SPL_TELEPORTToNecroloc 
   "HEA",  //  SPL_TELEPORTToTheRock 
   "HEA"  //  SPL_TELEPORTFromDungeonToWorldzen 
};  
// *****************
// Kreis des Feuers
// *****************

// bei allen Spells, in denen die "targetCollectRange" nicht angegeben ist wird der Wert aus der Focus.d benutzt!
// Dieser Wert ist auch die Obergrenze für die Reichweite der Spells und sollte sinnvollerweise so hoch sein, wie der Wert für Fernkampf

// FIXME: 	Bei allen Spells, bei denen der Schaden im Opfer-Zustand angegeben ist, kann KEIN Schadenstyp angwegeben werden!
//			Der Abzug von HPs erfolgt dann über den ChangeAttribute-Befehl! 

INSTANCE Spell_Light (C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

INSTANCE Spell_HolyFire(C_Spell_Proto)		// heißt jetzt "Magic Missile"
{
	time_per_mana			= 30;
//	damage_per_level		= SPL_DAMAGE_FIREBOLT;
	spelltype 				= SPELL_BAD;
//	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_Firebolt (C_Spell_Proto)		// heißt jetzt "Magic Missile"
{
	time_per_mana			= 40;
	damage_per_level		= SPL_DAMAGE_FIREBOLT;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_LifeDrain (C_Spell_Proto)		
{
	time_per_mana			= 200;
//	damage_per_level		= SPL_DAMAGE_BREATHOFDEATH;
	spelltype 				= SPELL_BAD;
//	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 8m
	targetCollectType		= TARGET_TYPE_NPCS;
	canTurnDuringInvest		= 0;
	canChangeTargetDuringInvest = 0;	
};
INSTANCE Spell_StuningBall (C_Spell_Proto)		// heißt jetzt "Magic Missile"
{
	time_per_mana			= 1;//1
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectType		= TARGET_TYPE_NPCS;
};
INSTANCE Spell_Meteor (C_Spell_Proto)		// heißt jetzt "Magic Missile"
{
	time_per_mana			= 60;//1
	damage_per_level		= SPL_DAMAGE_METEOR;//coment
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;//comment
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_Fireball (C_Spell_Proto)
{
	time_per_mana			= 110;
	damage_per_level		= SPL_DAMAGE_FIREBALL;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Firestorm (C_Spell_Proto)
{
	time_per_mana			= 100;
	damage_per_level		= SPL_DAMAGE_FIRESTORM;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_Thunder (C_Spell_Proto)
{
	time_per_mana			= 110;
	damage_per_level		= SPL_DAMAGE_THUNDER;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_VampiricAura (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};
INSTANCE Spell_MagicShield (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};
INSTANCE Spell_Mirror(C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};
INSTANCE Spell_Undress(C_Spell_Proto)//Its an IceARMOR!
{
	time_per_mana			= 100;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

INSTANCE Spell_Weakness (C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_BAD;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_HealOther (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_GOOD;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_FireWall (C_Spell_Proto)
{
	time_per_mana			= 80;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= SPL_DAMAGE_FIREWALL;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage in zs_Zapped
	damageType				= DAM_MAGIC;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;

	targetCollectType		= TARGET_TYPE_NPCS;
};

INSTANCE Spell_FireRain (C_Spell_Proto)
{
	time_per_mana			= 100;
	damage_per_level		= SPL_DAMAGE_FIRERAIN; // 2 Level nötig für PFX = 200 Feuerschaden!
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "angezündet"
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;

};
INSTANCE Spell_Lightning_Big (C_Spell_Proto)//removed
{
	time_per_mana			= 250;
	damage_per_level		= SPL_DAMAGE_LIGHTNING_BIG; // 2 Level nötig für PFX = 200 Feuerschaden!
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;//targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "angezündet"
	targetCollectRange		= 1100;					// 11m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;

};
INSTANCE Spell_Summong³upek (C_Spell_Proto)
{
	time_per_mana			= 500;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};
INSTANCE Spell_MFireball (C_Spell_Proto)
{
	time_per_mana			= 50;
	damage_per_level		= SPL_DAMAGE_MFIREBALL;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FIRE;
	isMultiEffect			= 0;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
	targetCollectRange		= 200;	
};

INSTANCE Spell_Teleport (C_Spell_Proto)
{
	time_per_mana			= 750;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};



INSTANCE Spell_CreatePortal (C_Spell_Proto)
{
	time_per_mana			= 300;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

INSTANCE Spell_GotoPortal (C_Spell_Proto)
{
	time_per_mana			= 140;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};

// *****************
// Kreis des Wassers
// *****************

INSTANCE Spell_Heal (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 250;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
	damage_per_level 		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage in zs_Zapped
	damageType				= DAM_MAGIC;	
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_ChainLightning (C_Spell_Proto)
{
	time_per_mana			= 750;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage in zs_Zapped
	damageType				= DAM_MAGIC;
	isMultiEffect			= 1;
	targetCollectAlgo		= TARGET_COLLECT_ALL;
	targetCollectRange		= 1500;					// 15m
//	targetCollectAzi		= 180;
//	targetCollectElev		= 60;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Thunderbolt (C_Spell_Proto)
{
	time_per_mana			= 40;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= SPL_DAMAGE_THUNDERBOLT;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Thunderball (C_Spell_Proto)
{
	time_per_mana			= 95;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= SPL_DAMAGE_THUNDERBALL;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_IceCube (C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					// Schaden wird im zs_MagicFreeze angegeben!
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= 1500;					// 15m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_IceWave (C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_BAD;
	damage_per_level 		= 0;					// Relativer Schaden je nach Opfer wird im zs_MagicFreeze angegeben!
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt "eingefroren"
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;
};



// *****************
// Dämonenbeschwörer
// *****************


INSTANCE Spell_Demon	(C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Skeleton (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Golem (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_ArmyOfDarkness (C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_MassDeath(C_Spell_Proto)
{
	time_per_mana			= 100;
	damage_per_level		= SPL_DAMAGE_MASSDEATH;	
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;	// Opfer werden aber erst durch Kollision mit dem Effekt getötet
	targetCollectRange		= 1000;					// 10m
	targetCollectAzi		= 360;
	targetCollectElev		= 60;
};


INSTANCE Spell_DestroyUndead(C_Spell_Proto)
{
	time_per_mana			= 50;
	damage_per_level 		= SPL_DAMAGE_DESTROYUNDEAD;
	spelltype				= SPELL_NEUTRAL;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= 1500;					// 15m
	targetCollectType		= TARGET_TYPE_UNDEAD;
};



// *****************
//      Psionic
// *****************

INSTANCE Spell_WindFist (C_Spell_Proto)
{
	time_per_mana			= 70;
	damage_per_level		= SPL_DAMAGE_WINDFIST;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FLY;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectRange		= SPL_RANGE_WINDFIST;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_StormFist (C_Spell_Proto)
{
	time_per_mana			= 50;
	damage_per_level		= SPL_DAMAGE_STORMFIST;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_FLY;
	//isMultiEffect			= 1;
	targetCollectAlgo		= TARGET_COLLECT_ALL_FALLBACK_NONE;
	targetCollectRange		= SPL_RANGE_STORMFIST;					// 10m
	targetCollectAzi		= 60;
	targetCollectElev		= 60;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Telekinesis (C_Spell_Proto)
{
	time_per_mana			= 5000;
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	canTurnDuringInvest		= FALSE;
	canChangeTargetDuringInvest = FALSE;
};


INSTANCE Spell_Charm (C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Sleep(C_Spell_Proto)
{
	time_per_mana			= 50;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Pyrokinesis(C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage-Angabe in zs_Pyro
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Control(C_Spell_Proto)
{
	time_per_mana			= 100;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_HUMANS;
};


INSTANCE Spell_Fear (C_Spell_Proto)
{
	time_per_mana			= 90;
	damage_per_level		= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;	// Opfer werden in der "spell_fear.d" per "AI_SetNpcsToState(self,ZS_Flee, 1000);" bestimmt
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};


INSTANCE Spell_Berzerk (C_Spell_Proto)
{
	time_per_mana			= 105;
	spelltype				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_BreathOfDeath(C_Spell_Proto)
{
	time_per_mana			= 50;
	damage_per_level		= SPL_DAMAGE_BREATHOFDEATH;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_New1(C_Spell_Proto)		// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)
{
	time_per_mana			= 100;
	damage_per_level		= 150;
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	targetCollectType		= TARGET_TYPE_NPCS;
};


INSTANCE Spell_Shrink (C_Spell_Proto)
{
	time_per_mana			= 1000;
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 800;					// 8m
	targetCollectType		= TARGET_TYPE_NPCS;
};
