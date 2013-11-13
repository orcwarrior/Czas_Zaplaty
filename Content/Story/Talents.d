//#####################################################################
//##
//##
//##					Lernkosten
//##
//##
//#####################################################################
const int	ORECOST_LP					=	10;
const int	LPCOST_ATTRIBUTE_STRENGTH	=	1;	
const int	LPCOST_ATTRIBUTE_DEXTERITY	=	1;	
const int	LPCOST_ATTRIBUTE_MANA		=	1;	

const int	LPCOST_TALENT_MAGE_1		=	5;	
const int	LPCOST_TALENT_MAGE_2		=	10;	
const int	LPCOST_TALENT_MAGE_3		=	15;	
const int	LPCOST_TALENT_MAGE_4		=	20;	
const int	LPCOST_TALENT_MAGE_5		=	25;	
const int	LPCOST_TALENT_MAGE_6		=	30;	

	


const int	LPCOST_TALENT_1H_1			=	1;	
const int	LPCOST_TALENT_1H_5			=	5;	
const int	LPCOST_TALENT_2H_1			=	1;	
const int	LPCOST_TALENT_2H_5			=	5;	

const int	LPCOST_TALENT_BOW_1			=	1;	
const int	LPCOST_TALENT_BOW_5			=	5;	
const int	LPCOST_TALENT_CROSSBOW_1	=	1;	
const int	LPCOST_TALENT_CROSSBOW_5	=	5;	

const int	LPCOST_TALENT_ACROBAT		=	10;	
const int	LPCOST_TALENT_SNEAK			=	10;	
const int	LPCOST_TALENT_PICKLOCK_1	=	10;	
const int	LPCOST_TALENT_PICKLOCK_2	=	20;	
const int	LPCOST_TALENT_PICKPOCKET_1	=	10;	
const int	LPCOST_TALENT_PICKPOCKET_2	=	20;	

const int	LPCOST_TALENT_QLERNING_1	=	10;	
const int	LPCOST_TALENT_QLERNING_2	=	20;	

const int 	LPCOST_TALENT_MINING	=	10;	//TALENT_MINING
//#####################################################################
//##
//##
//##					Maxiumum Att/Talent
//##
//##
//#####################################################################
CONST INT ATT_MANA_MAX = 300;
CONST INT ATT_STR_MAX = 200;
CONST INT ATT_DEX_MAX = 200;

CONST INT TALENT_1H_MAX = 100;//(NPC_GETTALENTVALUE(HERO,TALENT_PICKPOCKET)>TALENT_1H_MAX)
CONST INT TALENT_2H_MAX = 100;
CONST INT TALENT_BOW_MAX = 100;
CONST INT TALENT_ALCHEMY_MAX = 100;
CONST INT TALENT_CROSSBOW_MAX = 100;
CONST INT TALENT_SMITH_MAX = 100;

CONST INT TALENT_PICKLOCK_MAX = 2;//(NPC_GETTALENTSKILL(HERO,TALENT_PICKPOCKET)>TALENT_PICKLOCK_MAX)
CONST INT TALENT_PICKPOCKET_MAX = 2;
CONST INT TALENT_EVASION_MAX = 2;
CONST INT TALENT_REGENHP_MAX = 2;
CONST INT TALENT_REGENMP_MAX = 2;
CONST INT TALENT_MAGE_MAX = 6;
CONST INT TALENT_SNEAK_MAX = 1;
CONST INT TALENT_ACROBAT_MAX = 1;
CONST INT TALENT_QUICKLERNING_MAX = 2;
CONST INT TALENT_DUALUSING_MAX = 1;
CONST INT TALENT_ITEMCHARMING_MAX = 1;
CONST INT TALENT_RUNESWORDUSING_MAX = 1;

//var string TXT_TALENTS_SKILLS [NPC_TALENT_MAX];  moved > LoadGame_BugFixes
								
// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************
var string TXT_TALENTS [NPC_TALENT_MAX];
var string TXT_TALENTS_SKILLS [NPC_TALENT_MAX]; //moved from talents.d
func void InitTexts()
{			  /*PosInMenu*/
TXT_TALENTS [0] =	   "";	
TXT_TALENTS [1]	=	   "Broñ jednorêczna";
TXT_TALENTS [2]	=	   "Broñ dwurêczna";
TXT_TALENTS [3]	=	   "£uk";
TXT_TALENTS [4]	=	   "Kusza";
TXT_TALENTS [5]	=/*10*/"Otwieranie zamków";
TXT_TALENTS [6]	=/*11*/"Kradzie¿";
TXT_TALENTS [7]	=	   "Uniki";//magic circles
TXT_TALENTS [8]	=	   "Kowalstwo";//sneak (bugfix set to 1)
TXT_TALENTS [9]=/*5*/  "Regeneracja ¿ycia";//regeneration
TXT_TALENTS [10]=/*6*/ "Regeneracja many";//fire master
TXT_TALENTS [11]=/*9*/ "Alchemia";//acrobat (bugfix set to 1)
//----------------------
// S K I L L S
//----------------------

TXT_TALENTS_SKILLS [0] =	     	"";	
TXT_TALENTS_SKILLS [1]	=	     	" brak| brak| brak";								//NPC_TALENT_1H          
TXT_TALENTS_SKILLS [2]	=	     	" brak| brak| brak";								//NPC_TALENT_2H           
TXT_TALENTS_SKILLS [3]	=	     	" brak| brak| brak";								//NPC_TALENT_BOW         
TXT_TALENTS_SKILLS [4]	=	     	" brak| brak| brak";								//NPC_TALENT_CROSSBOW    
TXT_TALENTS_SKILLS [5]	=/*10*/	" brak| adept| mistrz";								//NPC_TALENT_PICKLOCK   
TXT_TALENTS_SKILLS [6]	=/*11*/	" brak| adept| mistrz";								//NPC_TALENT_PICKPOCKET
TXT_TALENTS_SKILLS [7]	=	     	" brak| brak| brak| brak| brak| brak| brak";				//HACK_NPC_TALENT_MAGE HACK        
TXT_TALENTS_SKILLS [8]	=	     	" nie| nie";                                         //HACK_NPC_TALENT_SNEAK       
TXT_TALENTS_SKILLS [9]=/*5*/  	" brak| adept| mistrz";                                    		    //NPC_TALENT_REGENERATE 
TXT_TALENTS_SKILLS [10]=/*6*/ 	" brak| adept| mistrz";                                        		//NPC_TALENT_FIREMASTER   
TXT_TALENTS_SKILLS [11]=/*9*/ 	" nie| tak";                                           //HACK_NPC_TALENT_ACROBAT      

};
/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_TALENTS_DESC [NPC_TALENT_MAX] = 
// FIXME: wo werden die benutzt?
{
	"",	
	"NPC_TALENT_1H",
	"NPC_TALENT_2H",
	"NPC_TALENT_BOW",
	"NPC_TALENT_CROSSBOW",
	"NPC_TALENT_PICKLOCK",
	"NPC_TALENT_PICKPOCKET",
	"HACK_NPC_TALENT_MAGE",
	"HACK_NPC_TALENT_SNEAK",
	"NPC_TALENT_REGENERATE",
	"NPC_TALENT_FIREMASTER",
	"HACK_NPC_TALENT_ACROBAT"
};
*/



// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************
const string NAME_DUALSLERN			=	"Dwa ostrza (30 PN [Broñ jedno-dwurêczna 60%])";
const string NAME_BuyArmorPrefix	=	" (";	
const string NAME_BuyArmorPostfix	=	" bry³ek rudy)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" bry³ek rudy, ";
const string NAME_LearnPostfixS		=	" PN";	
const string NAME_LearnPostfixP		=	" PN";	
const string NAME_LearnPreNeededAtr	=	", wym. ";	
const string NAME_LearnStrength_1	=	"Si³a +1";
const string NAME_LearnStrength_5	=	"Si³a +5";
const string NAME_LearnStrength_10	=	"Si³a +10";
const string NAME_LearnStrength_20	=	"Si³a +20";

const string NAME_LearnDexterity_1	=	"Zrêcznoœæ +1";
const string NAME_LearnDexterity_5	=	"Zrêcznoœæ +5";
const string NAME_LearnDexterity_10	=	"Zrêcznoœæ +10";
const string NAME_LearnDexterity_20	=	"Zrêcznoœæ +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Broñ jednorêczna, +1";
const string NAME_Learn1h_5			=	"Broñ jednorêczna, +5";
const string NAME_Learn2h_1			=	"Broñ dwurêczna, +1";
const string NAME_Learn2h_5			=	"Broñ dwurêczna, +5";

const string NAME_LearnBow_1		=	"£uk, +1";
const string NAME_LearnBow_5		=	"£uk, +5";
const string NAME_LearnCrossbow_1	=	"Kusza, +1";
const string NAME_LearnCrossbow_5	=	"Kusza, +5";

const string NAME_LearnMage_1		=	"Pierwszy kr¹g magii";
const string NAME_LearnMage_2		=	"Drugi kr¹g magii";
const string NAME_LearnMage_3		=	"Trzeci kr¹g magii";
const string NAME_LearnMage_4		=	"Czwarty kr¹g magii";
const string NAME_LearnMage_5		=	"Pi¹ty kr¹g magii";
const string NAME_LearnMage_6		=	"Szósty kr¹g magii";

const string NAME_LearnPickpocket_1	=	"Kradzie¿, poziom 1";
const string NAME_LearnPickpocket_2	=	"Kradzie¿, poziom 2";
const string NAME_LearnPicklock_1	=	"Otwieranie zamków, poziom 1";
const string NAME_LearnPicklock_2	=	"Otwieranie zamków, poziom 2";

const string NAME_LearnRegenHP_1	=	"Regeneracja ¿ycia, poziom 1";
const string NAME_LearnRegenHP_2	=	"Regeneracja ¿ycia, poziom 2";
const string NAME_LearnRegenMP_1	=	"Regeneracja many, poziom 1";
const string NAME_LearnRegenMP_2	=	"Regeneracja many, poziom 2";

const string NAME_LearnEvasion_1	=	"Uniki, poziom 1";
const string NAME_LearnEvasion_2	=	"Uniki, poziom 2";

const string NAME_LearnQuickLerning_1	=	"Szybka nauka, poziom 1";
const string NAME_LearnQuickLerning_2	=	"Szybka nauka, poziom 2";

const string NAME_LearnRuneSwordUse	=	"Miecz runiczny";
const string NAME_LearnDuals	=	"Miecze oburêczne";
const string NAME_LearnItemCharmer	=	"Zaklinacz";

const string NAME_LearnAcrobat		=	"Akrobatyka";
const string NAME_LearnSneak		=	"Skradanie siê";

const string NAME_LearnSmith_1			=	"Kowalstwo, +1";
const string NAME_LearnSmith_5			=	"Kowalstwo, +5";
const string NAME_LearnAlchemy_1		=	"Alchemia, +1";
const string NAME_LearnAlchemy_5		=	"Alchemia, +5";
