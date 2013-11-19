// Ork: Przeniesienie tego do wspolnego pliku było chyba w sumie chujskim pomysłem ;D
//#############################################
//Amunition Func's
//#############################################
var int A_MUNITION;
var int B_MUNITION;

//#############################################
//Appearance Func's
//#############################################
//varibles
// Ork: Poprawie troche nazwy tych zmiennych bo aż oczy bolą :((
var int Appr_Inited; // 1 - true, 2 - need reinit (called by trigger cuz it need some time delay)
var c_npc Appr_Stylist;
var int Appr_HerohasEquipedHunLArmor;
var int Appr_changesPriceAll;//hair+beard+TATTOO
var int Appr_changesPriceHair;
var int Appr_changesPriceBeard;
var int Appr_changesPriceTattoo;
var int Appr_heroFace_Current;//for dialogues with stylizers(pay or not[back to old])
var int Appr_heroFace_Previous;// Ork: Kiedy twarz w monologu była zaakceptowana ale nie mamy kasy na "zakup" wygladu
											// to korzystamy z tej zmiennej
var int Appr_Wait4Monolouge; // jeśli true, jakiś trigger (raczej rzadki, bedzie sprawdzał czy hero juz skonczył dialog, jesli tak
							 // Wywoła: Appr_StartMonolouge()
var int Appr_stylistInit;
var c_item Appr_preStylizationArmor;
// TATTOOS
var int APPR_HERO_TATTOO_CURRENT;
	const int TATTOO_MULTIPILER=1;
	const int TATTOO_NONE = 0;
	const int TATTOO_BROTHERHOOD = 1;
	const int TATTOO_WARRIOR = 2;
	const int TATTOO_LIZARDAGILITY = 3;
	const int TATTOO_RUNE = 4;
// BEARD
var int APPR_HERO_BEARD_CURRENT;
	const int BEARD_MULTIPILER=10;
	const int BEARD_NONE=2;
	const int BEARD_MOUSTACHEANDSTRIPE=3;
	const int BEARD_MOUSTACHEANDBEARD=4;
// HAIR
var int APPR_HERO_HAIR_CURRENT;
	const int HAIR_MULTIPILER=100;
	const int HAIR_BALD=1;
	const int HAIR_SHORT=2;
	const int HAIR_NORMAL=3;
	const int HAIR_RED=4;
// FACEMESH
// ork: [NEW] Przechowywanie tego w postaci stringa to słaby pomysł, bo jak wiadomo
// takie luźnie zmienne w stringu nie są archiwzowane wiec Save->Load rozpiepsza nasz niecny plan :(
var int APPR_HERO_FACEMESH_CURRENT;
var int APPR_HERO_FACEMESH_LAST;
	const int FACEMESH_FIGHTER = 0; // 0 bo defaultowy mesh Dicka
	const int FACEMESH_BALD = 1;
	const int FACEMESH_PONY = 2;	
	const int FACEMESH_THIEF = 2;	
// [NEW] Ork: Ok, kazdy stylista będzie miał pewne możliwości co do zmieniania wygladu
//  bohatera, tak aby każdy nie mógł mu zmienić wszystkiego, odpowiednia partia flag-możliwości
//  musi być nałozona wraz z rozpoczęciem dialogu z konkretnym stylistom, a zdjęta zostanie
//  automatycznie przy kończeniu zmian w Appearance_Func.d
var int Appr_CurrentStylist_Posibilities; // to na podstawie tego będa czytane wszystkie flagi
	const int Appr_PossibFlags_Tattoo_None	 		 =  1 << 0;
	const int Appr_PossibFlags_Tattoo_Brotherhood	 =  1 << 1;
	const int Appr_PossibFlags_Tattoo_Warrior 		 =  1 << 2;
	const int Appr_PossibFlags_Tattoo_LizardAgi		 =  1 << 3;
	const int Appr_PossibFlags_Tattoo_Rune			 =  1 << 4;
	
	const int Appr_PossibFlags_Beard_None	 		 =  1 << 5;
	const int Appr_PossibFlags_Beard_Mouthstache	 =  1 << 6;
	const int Appr_PossibFlags_Beard_MouthstacheBrd  =  1 << 7;
	
	const int Appr_PossibFlags_Hair_Bald	 		 =  1 << 8;
	const int Appr_PossibFlags_Hair_Short			 =  1 << 9;
	const int Appr_PossibFlags_Hair_Normal			 =  1 << 10;
	const int Appr_PossibFlags_Hair_Red				 =  1 << 11;
// Podstawą każdego stylisty powinno być przywrócenie wyglądu bohatera do startowego:
const int Appr_Posibilities_Base = Appr_PossibFlags_Tattoo_None | Appr_PossibFlags_Beard_MouthstacheBrd | Appr_PossibFlags_Hair_Normal;
const int Appr_Posibilities_Kasztan = Appr_Posibilities_Base | Appr_PossibFlags_Tattoo_Warrior | Appr_PossibFlags_Beard_None | Appr_PossibFlags_Tattoo_LizardAgi | Appr_PossibFlags_Beard_Mouthstache | Appr_PossibFlags_Beard_MouthstacheBrd | Appr_PossibFlags_Hair_Bald | Appr_PossibFlags_Hair_Short | Appr_PossibFlags_Hair_Normal;
const int Appr_Posibilities_TypowyCpun = Appr_Posibilities_Base | Appr_PossibFlags_Tattoo_Brotherhood | Appr_PossibFlags_Beard_None | Appr_PossibFlags_Hair_Bald;

var int hero_changes_visual;
const int STYLIST_1_DIALOG = 21; // ID Monologu (jakoś tak)
//#############################################
//Compass Func's
//#############################################
var int COMPASS_INIT;
var int COMPASS_PTR;
//#############################################
//Damage Func's
//#############################################
//specialCombatDamage
VAR INT HEROLASTHP;
//
const int AIV_DAMAGEID	= 33; //moved from AI_constANTS
const int RIGHTHAND_WEAPON = 0;
const int LEFTHAND_WEAPON = 1;
//R:
var int HeroDamage_DamageID;
var int HeroDamage_Damage_Blunt;
var int HeroDamage_Damage_Edge;
var int HeroDamage_Damage_Fire;
var int HeroDamage_Damage_Fly;
var int HeroDamage_Damage_Magic;
//L:
var int HeroDamage_L_DamageID;
var int HeroDamage_L_Damage_Blunt;
var int HeroDamage_L_Damage_Edge;
var int HeroDamage_L_Damage_Fire;
var int HeroDamage_L_Damage_Fly;
var int HeroDamage_L_Damage_Magic;
//..vars..
var int HeroDamage_CriticalChance;
var int HeroDamage_ComboCounter;
var int HeroDamage_ComboLSWD;//bool
//...XXXXYZ
//X=count since init
//y=combo numer
//Z=hits (right=+1 left=+2 all=3
//combonum
var int HeroDamage_lastBS;			// == Hero.bodystate 
var int HeroDamage_lastcombo;		// == HeroAniCtrl_Offset+0x432 |combonum
var int HeroDamage_LastHeroHitAniID;// == HeroAniCtrl_Offset+0x448 |hitaniid
var int HeroAniCtrl_Offset;
var int HeroDamage_NextCombo;		// Prevent double combo addition
var int HeroDamage_HostileEnemies;// +1 if enemy atack hero, inited evry check
var int HeroDamage_TimeHeroAttackedNeutralFocus;// if hero has some neutral in focus and attack him, 
												// set it to 1 then increment this var by 1 till it reach 6
												// then reset it. So if simply hero attacked some neutral npc
												// other neutral npc's will be damaged till next 5 seconds
												// (if no neutral npcs will be focused)
//if lastcombo>combo
//countsinceinit++
var int R_SWDDMG_PTR;//ptr to vfx
var int L_SWDDMG_PTR;//ptr to vfx
//right hand hitposes:
var int HeroDamage_Hitpos1_X;
var int HeroDamage_Hitpos1_Y;
var int HeroDamage_Hitpos1_Z;
var int HeroDamage_Hitpos2_X;
var int HeroDamage_Hitpos2_Y;
var int HeroDamage_Hitpos2_Z;
//left hand hitposes:
var int HeroDamage_Hitpos1L_X;
var int HeroDamage_Hitpos1L_Y;
var int HeroDamage_Hitpos1L_Z;
var int HeroDamage_Hitpos2L_X;
var int HeroDamage_Hitpos2L_Y;
var int HeroDamage_Hitpos2L_Z;

var int DebugDamage;

//#############################################
//Damage Func's
//#############################################
const int AIV_SHEATH	= 19;
var int sheath_cycles;//in this triggersend, if too much, skip
var int V_HeroSheath_Pointer;//ptr to hero sheath vfx

//#############################################
//Dual Func's
//#############################################
VAR INT KNOWN_DUALS;//Hero know how to use duals
VAR INT LSWD_DMG;//Left dual damage
VAR INT LSWD_STR;//Left dual needed strenght
//Temp RSWD&LSWD
VAR INT TEMP_RSWD_ID;
VAR INT TEMP_LSWD_ID;
VAR INT TEMP_LSWD_DMG;
VAR INT TEMP_LSWD_STR;
VAR INT RSWD_ID;
VAR INT SET_DUALS;
VAR INT LASTEQUIPEDWEAPONISDUAL;//BUGFIX
VAR INT DUALEQUIPED; //duals are equiped
VAR INT LASTREADYWEAPONISDUAL;	//BUGFIX
VAR INT DUALBUGFIX;
VAR INT UNEQUIP_RSWD;//When unequip left don't send right dual unequip
VAR INT UNEQUIP_LSWD;
VAR INT LSWD_ID;


//#############################################
//GUI (Icons) Func's	SHIT IS OLD :(
//#############################################
var int GUI_DontRenderIcons;//bool; 1-disabling rendering of icons


//#############################################
//HelpMe Func's	TODO: this func need lil' refresh
//#############################################
var c_npc NPCNeedHelp15;
var c_npc NPCNeedHelp14;
var c_npc NPCNeedHelp13;
var c_npc NPCNeedHelp12;
var c_npc NPCNeedHelp11;
var c_npc NPCNeedHelp10;
var c_npc NPCNeedHelp9;
var c_npc NPCNeedHelp8;
var c_npc NPCNeedHelp7;
var c_npc NPCNeedHelp6;
var c_npc NPCNeedHelp5;
var c_npc NPCNeedHelp4;
var c_npc NPCNeedHelp3;
var c_npc NPCNeedHelp2;
var c_npc NPCNeedHelp1;
var c_npc NPCNeedHelp0;
var int NewNpcOnList;

//---------------------------------------
// M u s i c   S y s t e m
// BOSS FIGHT's
//---------------------------------------
// So when the bossfight is on the track will
// play till the variable BOSSFIGHT_CURRENT
// will be set back to BOSSFIGHT_NONE(0);
// KEEP IT SIMPLE & PLAIN
var int BOSSFIGHT_CURRENT;
const int BOSSFIGHT_NONE = 0;
const int BOSSFIGHT_FGT1 = 1; // Roderic vs. Truan
const int BOSSFIGHT_FGT2 = 2; // The Beast
const int BOSSFIGHT_FGT3 = 3; // New Camp Rebellion
const int BOSSFIGHT_FGT4 = 4; // Old Camp Battle
const int BOSSFIGHT_FGT5 = 5; // Final Battle
const int BOSSFIGHT_LAVAESCAPE = 6; // I'm fighting with lava, yay!
//#############################################
//RuneSword Func's
//#############################################
var int RUNECHARGE;
const int RUNECHARGEMAX=40;
const int 1H = 1;
const int 2H = 2;
const int oCItem_zCVisual_offset = 184;
var int Rune_dialog;
var int RuneSwdCriticalChance;//chance to send magic effect
var int RuneSwd_User;//instance of npc using RuneWSD now (update every RS_SpecialDamage, used by B_AssessMagic
var int RuneID;
var int DontSendCritical;
var int Critical_LastHitID;
var int RuneSwdSendAssesMagic;
var int hero_Important;//BugFix:Dialogs on Dialog with RuneSWD
//---------RuneSWD Atribs--------
var string RUNESWD_NAME;//item			//information used rune: #name
var string RUNESWD_SLOT;	//vfxname		//vfx on criticalhit MUST BE COLLIDE! - played on target
var string RUNESWD_SPAWNPOint;	//sfxname 		//additional, sfx on critical hit
var string RUNESWD_WP;//insance of rune//to delete on use, and create on uneqip swd
var int RUNESWD_FLAGS;	//chargecost   	//swd_power-flags(on critical) if flags>swd_power NO CRITICAL 1pt swd_power regenerate at 9 secs(8min),max swd_power=40
var int RUNESWD_VOICE;	//damage   		//Wld_playeffect(...,damage
var int RUNESWD_NpcTYPE;	//damagetype	//					^,damagetype...);
var int RUNESWD_LP;
var int RUNESWD_EXP;
//---------RuneSWD Atribs--------
var int NAMEPOSY;
var c_npc RUNE_SLF;
var c_npc RUNE_ATTACKER;
var int	KEY_CHANGE_RUNE;//key used to change rune in runeswd (not implemented yet) - defualt 'R'
var int RUNE_SWD_EQUIPED;//0-no;1-1h;2-2h
var int RS_ExchangeSwd_bugfix;
var int RS_ExchangeSwdID_bugfix;


//----- Runes ID's -------
/* Basing on spell items ID
   Wasn't best idea, plus
   they could change dynamicaly
   betwen f.e. different versions
   of mod.							
   This IDs are saved as runeswd.exp	*/
   
const int	RuneID_Light	 	= 0;		     
const int	RuneID_FireBolt	 	= 1;	   
const int	RuneID_ThunderBolt	= 2;	

const int	RuneID_Sleep	 	= 3;		     
const int	RuneID_WindFist	 	= 4;	   
const int	RuneID_Heal	 		= 5;		      
const int	RuneID_StuningBall	= 6;	

const int	RuneID_IceCube	 	= 7;		   
const int	RuneID_ThunderBall	= 8;	
const int	RuneID_Charm		= 9;		     
const int	RuneID_Pyrokinesis	= 10;	
const int	RuneID_FireBall	 	= 11;	   
const int	RuneID_FireWall	 	= 12;	   
const int	RuneID_LifeDrain	= 13;	  
const int	RuneID_Curse	 	= 14;		     

const int	RuneID_ChainLightning	= 15;
const int	RuneID_FireStorm	= 16;	  
const int	RuneID_stormfist	= 17;	  
const int	RuneID_destroyundead= 18;
const int	RuneID_HolyFire	 	= 19;	   

const int	RuneID_IceWave	 	= 20;		   
const int	RuneID_FireRain	 	= 21;	   
const int	RuneID_Thunder	 	= 22;		   
          
const int	RuneID_BreathofDeath= 23;
const int	RuneID_Meteor	 	= 24;		
           
               
//#############################################
//TempPotions Func's
//#############################################
//ATRIBUTE
var int str_time;
var int dex_time;
var int hp_time; 
var int mp_time; 
//PROTECTION
var int edg_bonus; var int edg_time;
var int pnt_bonus; var int pnt_time;
var int fir_bonus; var int fir_time;
var int mag_bonus; var int mag_time;
//SPECIAL
var int imu_time;//Immunity
var int bsh_time;//Bash (melee)
var int cri_time;//Critical (ranged)
var int mul_time;//MultiCast (magic)
var int BTP_Activated;//Temp Potions Bar - see BarTempPot_Func.d
//constants
const int	TP_TYPE_ATR = 0;//Attrbute temppotion
const int	TP_TYPE_PROT = 1;//Protection temppotion
const int	TP_TYPE_SPEC = 2;//Special temppotion
const int 	POTION_TICKS_PER_MINUTE=1*60;


//#############################################
//Sprint Func's
//#############################################
CONST INT MAXSPRINTTIME=1189765120;//30.000//12*8*3;//12s
VAR INT Sprint_UpClicked;//For doubleclick
VAR INT SPRINTENABLED;//bool
var int SPRINTTIME;
var int Stamina_BarVisible;
var string Sprint_ReInited;

var int SprintAlwaysWalk;

//#############################################
//Other Func's
//#############################################
var int LCtrl_Doubleclick;

var int SkyController_Ptr;//Used both by CustomRainFX & SkyPreset_Func, keep updating at least before calling any funcion
// in another world :)    

//*************************
//Global hero counters
//*************************
VAR INT GLOBAL_CRIME_GOLDTOPAY;
VAR INT STR_BONUS;
VAR INT DEX_BONUS;
VAR INT HP_BONUS;
VAR INT MP_BONUS;