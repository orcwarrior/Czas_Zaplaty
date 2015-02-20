// **************************** 
//				EXIT 
// ****************************

instance  Info_Martin_EXIT (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	999;
	condition	=	Info_Martin_EXIT_Condition;
	information	=	Info_Martin_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Martin_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Martin_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Martin_Hallo (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	1;
	condition	=	Info_Martin_Hallo_Condition;
	information	=	Info_Martin_Hallo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co Ty tu robisz?"; 
};                       

FUNC int  Info_Martin_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Martin_Hallo_Info()
{
	AI_Output (other, self,"Info_Martin_Hallo_15_00"); //Co Ty tu robisz?
	AI_Output (self, other,"Info_Martin_Hallo_04_01"); //Daj mi spokój...
	B_StopProcessInfos	(self);
};

// ****************************

instance  Info_Martin_What (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	2;
	condition	=	Info_Martin_What_Condition;
	information	=	Info_Martin_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz jakby prze¿u³ Ciê troll i wysra³."; 
};                       

FUNC int  Info_Martin_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_FISK_MartinOk))
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_What_Info()
{
	AI_Output (other, self,"Info_Martin_What_15_00"); //Wygl¹dasz jakby prze¿u³ Ciê troll i wysra³.
	AI_Output (self, other,"Info_Martin_What_04_01"); //I tak siê czujê. Daj mi spokój.
	AI_Output (other, self,"Info_Martin_What_15_02"); //Czasami lepiej jest siê wykrzyczeæ, ni¿ t³amsiæ w sobie ból.
	AI_Output (self, other,"Info_Martin_What_04_03"); //Cholera, kaznodzieja mi siê trafi³. A co Ciê to w ogóle obchodzi?

	Info_ClearChoices (Info_Martin_What);
	Info_AddChoice (Info_Martin_What, "Czasami warto siê pochyliæ nad drugim cz³owiekiem.", Info_Martin_What_Good);
	Info_AddChoice (Info_Martin_What, "Masz racjê, to nie moja sprawa.", Info_Martin_What_Bed);
};

// ------------------------------------------------------------------

FUNC VOID Info_Martin_What_Bed()
{
	AI_Output (other, self,"Info_Martin_What_Bed_15_00"); //Masz racjê, to nie moja sprawa.
	AI_Output (self, other,"Info_Martin_What_Bed_04_01"); //Daj mi wiêc spokój.
	
   B_LogEntry		(CH2_RBL_Feelings, "Nie bêdê bawi³ siê w kaznodziejê. Niech Fisk sam siê dowie co siê dzieje z Martinem.");
	B_StopProcessInfos	(self);
	Help_Martin = 0;
};

// ------------------------------------------------------------------

FUNC VOID Info_Martin_What_Good()
{
	AI_Output (other, self,"Info_Martin_What_Good_15_00"); //Czasami warto siê pochyliæ nad drugim cz³owiekiem.
	AI_Output (self, other,"Info_Martin_What_Good_04_01"); //Hmm. Mo¿e masz i racjê...
	AI_Output (self, other,"Info_Martin_What_Good_04_02"); //Zanim trafi³em do Kolonii by³em czeladnikiem u z³otnika.
	AI_Output (self, other,"Info_Martin_What_Good_04_03"); //Sz³o mi ca³kiem nieŸle. Niestety mój mistrz by³ strasznym sk¹pirad³em.
	AI_Output (self, other,"Info_Martin_What_Good_04_04"); //Pokocha³em pewn¹ dziewczynê, nie staæ mnie jednak by³o na pierœcionek zarêczynowy.
	AI_Output (self, other,"Info_Martin_What_Good_04_05"); //Podebra³em kilka uncji z zapasów mistrza i wieczorem wykona³em piêkny pierœcieñ.
	AI_Output (self, other,"Info_Martin_What_Good_04_06"); //Da³em go mej lubej.
	AI_Output (other, self,"Info_Martin_What_Good_15_07"); //Musia³a byæ zachwycona.
	AI_Output (self, other,"Info_Martin_What_Good_04_08"); //By³a. Ca³e dwa dni, dopóki go nie sprzeda³a. Cholerna zdzira!
	AI_Output (self, other,"Info_Martin_What_Good_04_09"); //Mistrz zorientowa³ siê, ¿e brakuje z³ota. Oczywiœcie oskar¿y³ mnie.
	AI_Output (self, other,"Info_Martin_What_Good_04_10"); //Sêdzia w Khorinis nie potrzebowa³ dowodów, bo razem z moim mistrzem grywa³ co wieczór w oczko.
	AI_Output (self, other,"Info_Martin_What_Good_04_11"); //Tak w³aœnie trafi³em do Kolonii, przez g³upi¹ mi³oœæ i pierœcieñ.
	AI_Output (self, other,"Info_Martin_What_Good_04_12"); //Jednak zanim mnie oskar¿ono odzyska³em sygnet. Zdo³a³em go przemyciæ do Kolonii.
	AI_Output (other, self,"Info_Martin_What_Good_15_13"); //Nie chcê wiedzieæ gdzie go ukry³eœ.
	AI_Output (self, other,"Info_Martin_What_Good_04_14"); //Po³kn¹³em go. Na drugi dzieñ zrobi³em niezwykle cenn¹ kupê.
	AI_Output (self, other,"Info_Martin_What_Good_04_15"); //Ten pierœcieñ ma dla mnie ogromne znaczenie...
	AI_Output (self, other,"Info_Martin_What_Good_04_16"); //To przez niego siê tu znalaz³em, w³o¿y³em w jego wykonanie sporo serca. Muszê go odzyskaæ!
	AI_Output (other, self,"Info_Martin_What_Good_15_17"); //Straci³eœ pierœcieñ?
	AI_Output (self, other,"Info_Martin_What_Good_04_18"); //Ktoœ mi go ukrad³ przed kilkoma dniami. Ten sukinsyn dobrze wiedzia³ czego szuka.
	AI_Output (other, self,"Info_Martin_What_Good_15_19"); //Masz jakieœ podejrzenia?
	AI_Output (self, other,"Info_Martin_What_Good_04_20"); //Niestety ¿adnych. Ale to nie móg³ byæ amator. Prawie nie rozstawa³em siê z pierœcieniem.
	AI_Output (other, self,"Info_Martin_What_Good_15_21"); //Rozumiem. Popytam i mo¿e czegoœ siê dowiem.
	AI_Output (self, other,"Info_Martin_What_Good_04_22"); //B¹dŸ dyskretny. Wola³bym, ¿eby za du¿o ludzi nie dowiedzia³o siê o mojej pami¹tce.
	
   B_LogEntry		(CH2_RBL_Feelings, "Dowiedzia³em siê wszystkiego. Ktoœ ukrad³ Martinowi cenn¹ pami¹tkê - z³oty pierœcieñ. Czas odebraæ od Fiska nagrodê. ");
	B_StopProcessInfos	(self);
   Wld_InsertItem(ItMi_Martin_Ring, "OW_WATERFALLCAVE_1");
	Help_Martin = TRUE;
};

// ****************************

instance  Info_Martin_Fingers (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	3;
	condition	=	Info_Martin_Fingers_Condition;
	information	=	Info_Martin_Fingers_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em z³odzieja."; 
};                       

FUNC int  Info_Martin_Fingers_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Fingers_Martin))
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_Fingers_Info()
{
	AI_Output (other, self,"Info_Martin_Fingers_15_00"); //Znalaz³em z³odzieja.
	AI_Output (self, other,"Info_Martin_Fingers_04_01"); //R¹czka?
	AI_Output (other, self,"Info_Martin_Fingers_15_02"); //Tak.
	AI_Output (self, other,"Info_Martin_Fingers_04_03"); //A to sukinsyn! Jeszcze siê z nim policzê.
};

// ****************************

instance  Info_Martin_Ring (C_INFO)
{
	npc			=	RBL_4125_Martin;
	nr			=	4;
	condition	=	Info_Martin_Ring_Condition;
	information	=	Info_Martin_Ring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Odnalaz³em pierœcieñ."; 
};                       

FUNC int  Info_Martin_Ring_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_Fingers))&&(NPC_HasItems(other,ItMi_Martin_Ring)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Martin_Ring_Info()
{
	AI_Output (other, self,"Info_Martin_Ring_15_00"); //Odnalaz³em pierœcieñ.
	AI_Output (self, other,"Info_Martin_Ring_04_01"); //Poka¿ mi go!
	AI_Output (self, other,"Info_Martin_Ring_04_02"); //Piêkny jak zawsze... Piêkny i zdradziecki.
	AI_Output (self, other,"Info_Martin_Ring_04_03"); //Mo¿esz go zatrzymaæ.
	AI_Output (other, self,"Info_Martin_Ring_15_04"); //Co?! Tyle siê nabiega³em, a Ty mi go oddajesz?
	AI_Output (self, other,"Info_Martin_Ring_04_05"); //Nie mogê ju¿ ¿yæ przesz³oœci¹. Sygnet za bardzo przypomina mi to kim by³em i jak siê tu znalaz³em.
	AI_Output (self, other,"Info_Martin_Ring_04_06"); //Nie masz pojêcia do jakich przemyœleñ cz³owiek mo¿e dojœæ wpatruj¹c siê w taflê wody...
	AI_Output (other, self,"Info_Martin_Ring_15_07"); //W porz¹dku. Wezmê pierœcieñ. Uwa¿aj na siebie, Martin.
	AI_Output (self, other,"Info_Martin_Ring_04_08"); //Bêdê pamiêta³ co dla mnie zrobi³eœ. Bywaj, piracie.

	Npc_ExchangeRoutine(self,"DO");
	B_LogEntry		(CH2_RBL_Feelings, "Ten Martin to dziwny cz³owiek. Po ca³ej Kolonii ugania³em siê za jego pierœcieniem a on mi go odda³. Ale trochê go rozumiem - przesz³oœæ nie powinna nikogo przeœladowaæ. Nawet pod postaci¹ z³otego pierœcienia. Czas porozmawiaæ z Fiskiem.");
}; 
