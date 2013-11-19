// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_336_CAVALORN_Exit (C_INFO)
{
	npc			= HUN_336_CAVALORN;
	nr			= 999;
	condition	= DIA_HUN_336_CAVALORN_Exit_Condition;
	information	= DIA_HUN_336_CAVALORN_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_336_CAVALORN_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_336_CAVALORN_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_336_CAVALORN_Hello (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 2;
	condition		= DIA_HUN_336_CAVALORN_Hello_Condition;
	information		= DIA_HUN_336_CAVALORN_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_336_CAVALORN_Hello_Condition()
{
	return C_IsChapter(1);
};

FUNC VOID DIA_HUN_336_CAVALORN_Hello_Info()
{
	B_LogEntry(CH1_Pir_RebelCamp, "W ko?cu dotar?em do Cavalorna. Ob?z Rebeliant?w wzbudza respekt. Teraz musz? 'tylko' przekona? Cavalorna, ?e warto mi zaufa?.");
	B_LogSetTopicStatus(CH1_Pir_RebelCamp, LOG_SUCCESS);
	Log_CreateTopic(CH1_Rbl_RebelCampTrust, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Rbl_RebelCampTrust, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_RebelCampTrust, "No to trafi?em do Obozu Rebeliant?w. Cavalorn wygl?da na konkretn? osob?. Uk?ad jest prosty. ?eby sta? si? cz?onkiem obozu, musz? udowodni? swoj? warto??. Cavalorn powiedzia? mi, ?ebym rozejrza? si? po obozie i przekona? ludzi, ?e warto mi zaufa?.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Cavalorn doda?, ?e je?eli mam jakie? pytania, to powinienem poszuka? Marka. Zwykle kr?ci si? w centrum obozu.");
	
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_01"); //No prosz?, kolejny skazaniec.
	
	if (Npc_KnowsInfo (hero, DIA_HUN_2615_Abel_SlyKill1))
	{
		AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_02"); //Skoro przyprowadzi? Ci? Abel, to pewnie odcinanie g??w masz ju? za sob?.
		B_GiveXP(100);
	}
	else
	{
		AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_03"); //Nie wiem, jak omin??e? stra?e, ale jestem pod wra?eniem. Ma?o komu udaje si? ta sztuka.
		B_GiveXP(250);
	};
	
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_04"); //Potrzeba nam wi?cej zaradnych ludzi, kt?rzy nie dadz? si? zabi?.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_05"); //Nie przyszed?em tu ?eby strz?pi? j?zyk po pr??nicy. A sk?ry tanio nie sprzedam, tego mo?esz by? pewien.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_06"); //Mocne s?owa. Czemu wi?c zawdzi?czam ten 'zaszczyt'?
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_07"); //Ja i moi towarzysze trafili?my na paskudny sztorm.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_08"); //Czyli nie jeste?cie skaza?cami? Ciekawe, m?w dalej.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_09"); //Jeste?my... Byli?my piratami. Pech chcia?, ?e trafili?my do Kolonii.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_10"); //C??, raczej nikt nie trafia tu z w?asnej woli lub z nadmiaru szcz??cia.
	
	if (Npc_KnowsInfo (hero, RBL_2604_Tony_FallowEnd))
	{	
		AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_11"); //Po drodze napatoczyli?my si? na Toniego. Wyratowali?my twojego cz?owieka z opresji, a on w zamian pokaza? nam drog? do obozu.
	};
	
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_12"); //Ale nie planujemy na d?ugo zarzuca? tu kotwicy.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_13"); //To tak samo jak ja i moi ch?opcy.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_14"); //Sam widzisz, ?e sporo nas ??czy. Mo?e powinni?my po??czy? si?y.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_15"); //To si? jeszcze oka?e. Nie znam was. Mo?e i jeste?cie piratami, a mo?e nas?a? was Gomez. Kto wie?
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_16"); //Je?eli chcecie tu zosta?, to musicie udowodni?, ?e na co? si? przydacie.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_17"); //Sk?d ja to znam...
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_18"); //W porz?dku. Im szybciej b?dziemy to mie? za sob?, tym szybciej zostawimy Koloni? za ruf?.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_19"); //Spokojnie, to nie wy?cig szczur?w. Pogadaj najpierw z ch?opakami.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_20"); //Poka? na co Ci? sta? i wr?? do mnie. Je?li uznam, ?e? wart mego zaufania, to wtedy porozmawiamy o Twojej przysz?o?ci.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_21"); //Wszystko w Twoich r?kach, piracie.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_22"); //Nazywam si? Rick.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_23"); //A wi?c witamy w Obozie Rebeliant?w, Rick.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_24"); //Rozejrzyj si?, poznaj ch?opak?w i przekonaj ich do siebie.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_25"); //Mamy tu napi?t? sytuacj?, wi?c ka?dy miecz jest na wag? rudy.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_26"); //A teraz odejd?, mam jeszcze sporo do zrobienia.
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_27"); //Wr?c? szybciej, ni? my?lisz.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_28"); //To si? jeszcze oka?e. Bywaj, ch?opcze.
	AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_29"); //Aha. Jak chcesz si? dowiedzie? czego? wi?cej, to poszukaj Marka. Zna tu ka?dego i lubi strz?pi? j?zyk. Zwykle kr?ci si? w centrum obozu.
	rebel_camp_trust = 0;
	// 	
	Npc_ExchangeRoutine	(self,"start");
   //Wld_InsertNpc(Org_2500_Kasztan, "OC1");
};

var int q_n;
var int Cavalorn_ORRecruitCount;

INSTANCE DIA_Cavalorn_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_336_CAVALORN;
	nr				= 4;
	condition		= DIA_Cavalorn_CanYouTeachMe_Condition;
	information		= DIA_Cavalorn_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo?esz mnie czego? nauczy??"; 
};

FUNC INT DIA_Cavalorn_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Cavalorn_CanYouTeachMe_15_01"); //Mo?esz mnie czego? nauczy??
	AI_Output (self, other, "DIA_Cavalorn_CanYouTeachMe_12_02"); //Mog? pokaza? ci jak podej?? niezauwa?onym do nieprzyjaciela i wygarn?? mu z ?uku.
	AI_Output (self, other, "DIA_Cavalorn_CanYouTeachMe_12_03"); //Poka?? ci te? kilka ?wicze?, dzi?ki kt?rym b?dziesz zr?czniejszy.
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   
	B_LogEntry(GE_TeacherOR, "Cavalorn poka?e mi jak si? skrada?, szy? z ?uku i co zrobi? ?eby by? zr?czniejszym.");
};

INSTANCE DIA_Cavalorn_Recruits (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 3;
	condition		= DIA_Cavalorn_Recruits_Condition;
	information		= DIA_Cavalorn_Recruits_Info;
	permanent		= 0;
	important		= 0;
	description		= "Opowiedz mi co? wi?cej o waszym obozie."; 
};

FUNC INT DIA_Cavalorn_Recruits_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_Recruits_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_01"); //Opowiedz mi co? wi?cej o waszym obozie.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_02"); //Wybacz, ale jestem bardzo zaj?tym cz?owiekiem.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_03"); //Mam na g?owie ca?y ob?z, a stra?nicy mog? uderzy? w ka?dej chwili.
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_04"); //Szykuje si? jaki? atak?
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_05"); //No dobra, skoro i tak chcesz zosta? jednym z nas, to po?wi?c? Ci chwil?.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_06"); //Mamy w Starym Obozie swojego cz?owieka, kt?ry informuje nas o planach tych ?cierwojad?w.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_07"); //Tylko dlatego jeszcze ?yjemy.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_08"); //Stra?nicy znowu szykuj? si? do ataku. B?dzie to ostatnia pr?ba ognia dla wszystkich rebeliant?w.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_09"); //Dlatego rekrutujemy ka?dego, kto chce do nas do??czy?. 
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_10"); //Niestety, niesie to ze sob? pewne ryzyko, o kt?rym powiem Ci, jak stwierdz?, ?e? godzien zaufania.
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_11"); //Rozumiem. Te? bym nie ufa? komu? tylko dlatego, ?e mu z oczu ?adnie patrzy.
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_12"); //My?l?, ?e m?g?bym pom?c w rekrutacji nowych cz?onk?w obozu.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_13"); //Czemu nie. Nikt Ci? tu nie zna. Stra?nicy nie b?d? na Ciebie polowa?, bo nie wiedz?, ?e jeste? jednym z nas.
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_14"); //Ilu rekrut?w wystarczy?
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_15"); //Im wi?cej, tym lepiej. Dobrze, ?eby to nie by?y ???todzioby, co na widok orka robi? pod siebie.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_16"); //Je?eli uda Ci si? sprowadzi?, powiedzmy, pi?ciu nowych, to znacznie przyczynisz si? naszej sprawie.
	AI_Output (other, self, "DIA_Cavalorn_Recruits_15_17"); //Ale nic za darmo. Przys?uga za przys?ug?.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_18"); //Rozumiem. Niestety nie ?pi? na rudzie jak Gomez albo magowie wody.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_19"); //Zap?ac? ci 200 bry?ek za ka?dego rekruta.
	AI_Output (self, other,"DIA_Cavalorn_Recruits_12_20"); //Co Ty na to?

	Info_ClearChoices (DIA_Cavalorn_Recruits);
	Info_AddChoice (DIA_Cavalorn_Recruits, "Brzmi uczciwie.", DIA_Cavalorn_Recruits_Yes);
	Info_AddChoice (DIA_Cavalorn_Recruits, "200 bry?ek to za ma?o.", DIA_Cavalorn_Recruits_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_Recruits_Yes()
{
	q_y = TRUE;
	Cavalorn_ORRecruitCount = 0;
	
	AI_Output (other, self, "DIA_Cavalorn_Recruits_Yes_15_21"); //Brzmi uczciwie.
	AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_22"); //W takim razie umowa stoi.
	AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_23"); //200 bry?ek za 'g?ow?'.
	AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_24"); //Tylko pospiesz si?, Gomez nie b?dzie wiecznie czeka? z atakiem. 
	
	Log_CreateTopic(CH1_Rbl_NewMembers, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn powiedzia? mi, ?e stra?nicy ze Starego Obozu przygotowuj? si? do ataku na rebeliant?w. Cavalorn ma swojego cz?owieka w?r?d ludzi Gomeza. Jednak tym razem atak mo?e ostatecznie rozstrzygn?? o losach rebeliant?w. Zaproponowa?em Cavalornowi pomoc w znalezieniu co najmniej pi?ciu rekrut?w, ch?tnych aby do??czy? do rebeliant?w. Najwy?sza pora rozejrze? si? za kandydatami na rebelianta.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_Recruits_No()
{
	q_n = TRUE;
	
	AI_Output (other, self, "DIA_Cavalorn_Recruits_No_15_25"); //200 bry?ek to za ma?o.
	AI_Output (self, other, "DIA_Cavalorn_Recruits_No_12_26"); //Ale z Ciebie pijawka!
	B_StopProcessInfos(self);
};

var int Cavalorn_GiveRingToHero;

INSTANCE DIA_Cavalorn_RecruitsAgain (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 4;
	condition		= DIA_Cavalorn_RecruitsAgain_Condition;
	information		= DIA_Cavalorn_RecruitsAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_RecruitsAgain_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Recruits))&& (q_n == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_RecruitsAgain_Info()
{
	AI_Output (self, other,"DIA_Cavalorn_RecruitsAgain_12_00"); //Zaczekaj do cholery!
	AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_15_01"); //Zmieni?e? zdanie?
	AI_Output (self, other,"DIA_Cavalorn_RecruitsAgain_12_02"); //Niech ci? szlag. Dobra, jak sprowadzisz pi?ciu rekrut?w, to dorzuc? magiczny pier?cie?.
	AI_Output (self, other,"DIA_Cavalorn_RecruitsAgain_12_03"); //Ale to moja ostateczna oferta. To jak b?dzie?

	Info_ClearChoices (DIA_Cavalorn_RecruitsAgain);
	Info_AddChoice (DIA_Cavalorn_RecruitsAgain, "W porz?dku.", DIA_Cavalorn_RecruitsAgain_Yes);
	Info_AddChoice (DIA_Cavalorn_RecruitsAgain, "To nadal za ma?o...", DIA_Cavalorn_RecruitsAgain_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_RecruitsAgain_Yes()
{
	Cavalorn_GiveRingToHero = TRUE;
	q_y = TRUE;
	Cavalorn_ORRecruitCount = 0;
	
	AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_Yes_15_04"); //W porz?dku.
	AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_05"); //W takim razie umowa stoi.
	AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_06"); //200 bry?ek za 'g?ow?' i pier?cie?, jak przyprowadzisz co najmniej pi?tk? rekrut?w.
	AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_07"); //Tylko pospiesz si?, Gomez nie b?dzie wiecznie czeka? z atakiem. 
	
	Log_CreateTopic(CH1_Rbl_NewMembers, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn powiedzia? mi, ?e stra?nicy ze Starego Obozu przygotowuj? si? do ataku na rebeliant?w. Cavalorn ma swojego cz?owieka w?r?d ludzi Gomeza. Jednak tym razem atak mo?e ostatecznie rozstrzygn?? o losach rebeliant?w. Zaproponowa?em Cavalornowi pomoc w znalezieniu co najmniej pi?ciu rekrut?w, ch?tnych aby do??czy? do rebeliant?w. Cavalorn zap?aci mi za ka?dego 200 bry?ek i doda magiczny pier?cie?, jak znajd? ochotnik?w. Najwy?sza pora rozejrze? si? za kandydatami na rebelianta.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_RecruitsAgain_No()
{
	//TODO: Sher, Troche zbyt drastyczne podejscie jak do gimnazialist?w ;P
	q_n_again = TRUE;
	AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_No_15_08"); //To nadal za ma?o. A pier?cie? mo?esz sobie wsadzi?.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_12_09"); //Za ma?o powiadasz?
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_12_10"); //W takim razie to Ci powinno wystarczy? cholerny krwiopilco!
	
	Log_SetTopicStatus(CH1_Rbl_RebelCampTrust, LOG_FAILED);
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Chyba przesadzi?em z t? pazerno?ci?. U rebeliant?w nie mam ju? czego szuka?. Mo?e powinienem p?j?? do Starego Obozu?");
	Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn chcia? mi zap?aci? za ka?dego rekruta 200 bry?ek i dorzuci? jeszcze jaki? pier?cionek. Chyba jest ?mieszny skoro my?li, ?e w zamian za takie ?mieci b?d? biega? po kolonii i szuka? idiot?w ch?tnych do wst?pienia w szeregi rebeliant?w. Mo?e powinienem p?j?? do obozu Gomeza?");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

var int recruit_finish;
var int Cavalorn_PachoIn;
var int Cavalorn_ScorpionIn;
var int Cavalorn_AligatorIn;
var int Cavalorn_CarlsonIn;
var int Cavalorn_GestathIn;

INSTANCE DIA_Cavalorn_RecruitsFinish (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 5;
	condition		= DIA_Cavalorn_RecruitsFinish_Condition;
	information		= DIA_Cavalorn_RecruitsFinish_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przyprowadzi?em nowych rekrut?w."; 
};

FUNC INT DIA_Cavalorn_RecruitsFinish_Condition()
{
	if (q_y == TRUE)&&(recruit_finish == FALSE)
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_RecruitsFinish_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_01"); //Przyprowadzi?em nowych rekrut?w.
	AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_02"); //Zobaczmy...

	if (pacho_trust == TRUE) && (Cavalorn_PachoIn == FALSE)
	{
		Cavalorn_PachoIn = TRUE;
		Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_03"); //Widzia?em w obozie zwiadowc? Gomeza, Pacho.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_04"); //Nie?le, s?dzi?em, ?e nie starczy mu odwagi, ?eby przeciwstawi? si? Gomezowi.
	}
	else if (Cavalorn_PachoIn == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_05"); //Pacho ju? mamy z g?owy.
	};

	if (scorpion_trust == TRUE) && (Cavalorn_ScorpionIn == FALSE)
	{
		Cavalorn_ScorpionIn = TRUE;
		Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_06"); //Skorpion! 
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_07"); //?wietna robota. Uczy? stra?nik?w jak walczy?, dobrze jest mie? go w swoich szeregach.
	}
	else if (Cavalorn_ScorpionIn == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_08"); //O Skorpionie ju? wiem. Ten dra? ca?kiem spustoszy nam spi?arni?...
	};

	if (aligator_trust == TRUE) && (Cavalorn_AligatorIn == FALSE)
	{
		Cavalorn_AligatorIn = TRUE;
		Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
		
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_09"); //Kolejny pirat w obozie.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_11"); //Wygl?da, jakby niejedno mia? na sumieniu. Mo?e si? przyda?.
		AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_11"); //Nigdy nie s?ysza?e? o Jacku Aligatorze?
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_12"); //A powinienem?
		AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_13"); //Nie, ale mu o tym nie m?w.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_14"); //He, he, rozumiem.
	}
	else if (Cavalorn_AligatorIn == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_15"); //Tak, wiem, legendarny Jack Aligator te? jest z nami.
	};

	if (carlson_trust == TRUE) && (Cavalorn_CarlsonIn == FALSE)
	{
		Cavalorn_CarlsonIn = TRUE;
		Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_16"); //Carlson? Masz na my?li tego kowala?
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_17"); //Wygl?da na to ?e to ?wietny rzemie?lnik, Aidan b?dzie m?g? troch? odetchn??.
	}
	else if (Cavalorn_CarlsonIn == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_18"); //Carlsona i jego m?ot s?ycha? nawet tutaj. 
	};

	if (gestath_trust == TRUE) && (Cavalorn_GestathIn == FALSE)
	{
		B_GiveXP(250);
		Cavalorn_GestathIn = TRUE;
		Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
		
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_19"); //Nie wiem, jak tego dokona?e?!
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_20"); //M?j w?asny brat w Kolonii! A? mi szkoda Gomeza...
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_21"); //?wietna robota. Zas?u?y?e? na co? specjalnego.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_22"); //We? te strza?y.
		
		CreateInvItems		(self, ItAmFireArrow, 10);
		B_GiveInvItems		(self, other,ItAmFireArrow, 10);
		
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_23"); //Znalaz?em je kiedy? w starej cytadeli. Tylko rozwa?nie ich u?ywaj, bo nie ma ich wiele.
	}
	else if (Cavalorn_GestathIn == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_24"); //Mojego braciszka ju? przyprowadzi?e?.
	};

	if (Cavalorn_ORRecruitCount>=5)
	{
		B_GiveXP(1000);
		recruit_finish = TRUE;
		
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_25"); //?wietna robota. Przyprowadzi?e? pi?ciu rekrut?w.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_26"); //Naprawd? jestem pod wra?eniem.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_27"); //?le Ci? oceni?em za pierwszym razem.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_28"); //Mam dla Ciebie co?, co powinno cho? po cz??ci zrekompensowa? trudy.
		
		CreateInvItems(self, ItWr_Bloodfly_01, 1);//ma by? ksi??ka Prawdziwy wojownik, tatoo znami? wojownika
		B_GiveInvItems(self, other, ItWr_Bloodfly_01, 1);
		
		AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_29"); //Przyda si?. A co z rud??
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_30"); //Bez obaw. Nie zwyk?em robi? z twarzy dupy, nie zapomnia?em o Twojej doli piracie.
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_31"); //1000 bry?ek rudy, tak jak obieca?em.
		
		CreateInvItems (self,ItMiNugget,1000);//ruda
		B_GiveInvItems (self, other, ItMiNugget, 1000);

		if (Cavalorn_GiveRingToHero == TRUE)
		{
			AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_32"); //Pier?cie? te? jest Tw?j.
			CreateInvItems (self,Schutzring_Total1,1);
			B_GiveInvItems (self, other, Schutzring_Total1, 1);
		};
		
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_33"); //Teraz jeste?my kwita.
		Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_NewMembers, "Przyprowadzi?em Cavalornowi pi?ciu rekrut?w. Przyw?dca rebeliant?w dotrzyma? s?owa - dosta?em swoj? rud?. W interesach nie ma sentyment?w...");
	}
	else if (Cavalorn_ORRecruitCount>0)&&(Cavalorn_ORRecruitCount<5)
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_34"); //Nie?le, ale nadal za ma?o ch?tnych. Gomez uderzy ju? wkr?tce. 
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_35"); //Przyprowad? wi?cej rekrut?w.
	}
	else
	{
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_36"); //Nie r?b ze mnie idioty, jeszcze nikogo nie przyprowadzi?e?!
		AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_37"); //Szkoda mojego czasu...
		B_StopProcessInfos(self); 
	};
};

var int rbl_camp_trust;
var int rbl_count_trust;

var int Cavalorn_whistler_know;
var int Cavalorn_ratford_know;
var int Cavalorn_drax_know;
var int Cavalorn_quentin_know;
var int Cavalorn_aidan_know;
var int Cavalorn_fingers_know;
var int Cavalorn_tony_know;
var int Cavalorn_vam_know;
var int Cavalorn_fox_know;
var int Cavalorn_cavalorn_know;
var int Cavalorn_snaf_know;
var int Cavalorn_fisk_know;
//new:
var int Cavalorn_hanis_know;

// Troche tutaj namiesza?em ;-) -orc
INSTANCE DIA_Cavalorn_RebelCampTrust (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 6;
	condition		= DIA_Cavalorn_RebelCampTrust_Condition;
	information		= DIA_Cavalorn_RebelCampTrust_Info;
	permanent		= 1;
	important		= 0;
	description		= "Co z moim zaufaniem w obozie?"; 
};

FUNC INT DIA_Cavalorn_RebelCampTrust_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))&&(rbl_camp_trust == FALSE)
	{
		return 1;
	};
};
/*-----------------------------
 Dwa mozliwe wybory:
 (umieszczone na poczatku inaczej
 niestety by sie nie skompilowalo :)
 Ostatni ID kwesti = 60
-----------------------------*/

func void DIA_Cavalorn_RebelCampTrust_ItCanWait()
{
	AI_Output (other, self,"DIA_Cavalorn_RebelCampTrust_12_56"); //To mo?e poczeka?.
	AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_57"); //Dobrze, gdyby co? si? zmieni?o, wiesz, gdzie mnie szuka?.
	Info_ClearChoices (DIA_Cavalorn_RebelCampTrust);
};

func void DIA_Cavalorn_RebelCampTrust_BecomeRebelNow()
{
		if(rbl_count_trust<126)
		{
			B_GiveXP (1000);
		}
		else//Calkiem fajny bonus za wykonanie wszystkich zada?
		{
			B_GiveXP (1500);
			//TODO: Sher, ewentualnie to popraw
			AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_52"); //W obozie m?wi? Tylko o Tobie, no i przyprowadzi?e? pi?ciu rekrut?w.
			AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_53"); //Mam co? specjalnego, we? t? ksi?g?, przyda Ci si? nie tylko w wychodku.
         
			CreateInvItems(self, Kampfkunst, 1);//ma by? ksi??ka Prawdziwy wojownik, tatoo znami? wojownika
         B_GiveInvItems(self, other, Kampfkunst, 1);
		};
		
		rbl_camp_trust = TRUE;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_44"); //Nie pozostaje mi nic innego jak wypi? za Twoje zdrowie.
		CreateInvItems (self,ItFoBeer,2);
		B_GiveInvItems (self, other,ItFoBeer, 1);	
		AI_UseItem (other,ItFobeer);
		AI_UseItem (self,ItFobeer);
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_45"); //Witaj w?r?d nas, Rick.
		AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_46"); //Nie b?dziesz tego ?a?owa?.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_47"); //To si? dopiero oka?e, przyjacielu.

		Npc_SetTrueGuild (other,GIL_RBL);
		other.guild = GIL_RBL;
		
		B_LogSetTopicStatus	(CH1_Rbl_RebelCampTrust, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_RebelCampTrust, "Zosta?em jednym z rebeliant?w! Przekona?em do siebie wi?kszo?? spo?r?d ludzi Cavalorna. Ustawi?em si? ca?kiem dobrze jak na pocz?tek. Teraz musz? tylko nie da? si? zabi? tym popychad?om Gomeza...");
		Info_ClearChoices(DIA_Cavalorn_RebelCampTrust);
};

FUNC VOID DIA_Cavalorn_RebelCampTrust_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_01"); //Co z moim zaufaniem w obozie?
	AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_02"); //Rozmawia?em z ch?opakami.
	AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_03"); //I co powiedzieli?
	rbl_count_trust = 0;
	
	// ************************
	// ?wistak
	// (Sk?adniki broni) - z wykonaniem broni.
	// ************************	
	if (whistler_trust == TRUE) && (Cavalorn_whistler_know == FALSE)
	{
		Cavalorn_whistler_know = TRUE;
		rbl_count_trust = rbl_count_trust + 10;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_04"); //?wistak tak Ci? zachwala?, ?e przez chwil? zapomnia? g?adzi? sw?j nowy miecz.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_05"); //Mo?e i jest ekscentryczny, ale jego zdanie ma znaczenie, a Ty zdoby?e? jego wdzi?czno?? i zaufanie.
	}
	else if (Cavalorn_whistler_know == TRUE)&&(whistler_trust == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_06"); //Wszyscy ju? widzieli nowy i bezu?yteczny miecz ?wistaka. Dobra robota.
		rbl_count_trust = rbl_count_trust + 10;	
	};

	// ************************
	// ?wistak
	// (Sk?adniki broni) - bez biegania do Aidana
	// ************************
	if (whistler_trust == 2) && (Cavalorn_whistler_know == FALSE)//Jezeli przyniesli?my sk?adniki, ale nie zgodzilismy sie na zaniesienie ich Aidanowi
	{
		Cavalorn_whistler_know = TRUE;
		rbl_count_trust = rbl_count_trust + 7;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_07"); //?wistak burcza? co?, ?e nie zako?czy?e? zlecenia. Z tego co wiem, sporo nabiega?e? si? za sk?adnikami na miecz.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_08"); //Znam go, wi?c nie dziwi? si?, ?e nie chcia?e? robi? za ch?opca na posy?ki. To mi wystarczy...
	}
	else if (Cavalorn_whistler_know == TRUE)&&(whistler_trust == 2)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_09"); //Powiedzmy, ?e ?wistak te? si? za tob? wstawi?...
		rbl_count_trust = rbl_count_trust + 5;	
	};	

	// ************************
	// Ratford
	// (4x Wilcze K?y)
	// ************************	
	if (ratford_trust == TRUE) && (Cavalorn_ratford_know == FALSE)
	{
		Cavalorn_ratford_know = TRUE;
		rbl_count_trust = rbl_count_trust + 8;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_10"); //Ratford by? z Ciebie zadowolony. Oczywi?cie nie da? tego po sobie pozna?.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_11"); //Dobrze, ?e przypad?e? mu do gustu, bo on zna si? na ludziach.
	}
	else if (Cavalorn_ratford_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_12"); //Ratford jest za.
		rbl_count_trust = rbl_count_trust + 8;	
	};

	// ************************
	// Drax
	// (Likwidacja bandytow)
	// ************************	
	if (drax_trust == TRUE) && (Cavalorn_drax_know == FALSE)
	{
		Cavalorn_drax_know = TRUE;
		rbl_count_trust = rbl_count_trust + 15;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_13"); //Drax opowiedzia? mi, jak pozby?e? si? tych bandyt?w ze wzg?rza. Dobra robota.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_14"); //Bezpiecze?stwo obozu jest najwa?niejsze.	
	}
	else if (Cavalorn_drax_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_15"); //Tak, Drax uwa?a, ?e porz?dny z Ciebie ch?op.
		rbl_count_trust = rbl_count_trust + 15;		
	}
	else if (drax_warn == 3)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_16"); //Drax powiedzia?, ?e pr?bowa?e? go ok?ama?. Nie potrzebujemy tu oszust?w.
	};
	
	// ************************
	// Quentin
	// (30%/30% 1h/2h)
	// ************************	
	if (quentin_trust == TRUE) && (Cavalorn_quentin_know == FALSE)
	{
		Cavalorn_quentin_know = TRUE;
		rbl_count_trust = rbl_count_trust + 10;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_17"); //Ten stary wilk Quentin rzadko m?wi o kim? bez pikantnych epitet?w. Nie wiem jak, ale zdoby?e? jego przychylno??.
	}
	else if (Cavalorn_quentin_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_18"); //Quentin ju? si? za Tob? wstawi?.
		rbl_count_trust = rbl_count_trust + 10;	
	};

	// ************************
	// Aidan
	// (Wywal Garrego)
	// ************************	
	if (aidan_trust == TRUE) && (Cavalorn_aidan_know == FALSE)
	{
		Cavalorn_aidan_know = TRUE;
		rbl_count_trust = rbl_count_trust + 8;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_19"); //Aidan nigdy nie lubi? partactwa Garrego. Dobrze zrobi?e?.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_20"); //Nasz kowal chyba Ci? polubi?.
	}
	else if (Cavalorn_aidan_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_21"); //Aidana te? przekona?e?.
		rbl_count_trust = rbl_count_trust + 8;	
	};

	// ************************
	// R?czka
	// (P?ot grozy)
	// ************************		
	if (fingers_trust == TRUE) && (Cavalorn_fingers_know == FALSE)
	{
		Cavalorn_fingers_know = TRUE;
		rbl_count_trust = rbl_count_trust + 5;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_22"); //Dzi?ki tobie R?czka zn?w jest sob?. No i p?ot te? naprawi?e?.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_23"); //Ca?kiem nie?le.
	}
	else if (Cavalorn_fingers_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_24"); //R?czka nic nie pami?ta, ale to w?a?nie ?wiadczy na Twoj? korzy??.
		rbl_count_trust = rbl_count_trust + 5;	
	};

	// ************************
	// Tony
	// (Nocna Warta)
	// ************************		
	if (tony_trust == TRUE) && (Cavalorn_tony_know == FALSE)
	{
		Cavalorn_tony_know = TRUE;
		rbl_count_trust = rbl_count_trust + 12;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_25"); //Tony od pocz?tku w Ciebie wierzy?. Dobrze, ?e pomog?e? mu na warcie, ch?opak by? ju? wyko?czony.
	}
	else if (Cavalorn_tony_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_26"); //?mia?o mo?esz powiedzie?, ?e Tony jest Twoim przyjacielem.
		rbl_count_trust = rbl_count_trust + 12;		
	}
	else if (Story_RickSentry_MisState==3)&& (Cavalorn_tony_know == FALSE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_27"); //Tony nie ma nic przeciwko, ale wpadka na warcie wychodzi mu ju? bokiem.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_28"); //B?dzie tam sta?, dop?ki nie uznam, ?e ma do??. Czyli nie tak pr?dko...	
	};

	// ************************
	// Vam
	// (Pomocnik)
	// ************************		
	if (vam_trust == TRUE) && (Cavalorn_vam_know == FALSE)
	{
		Cavalorn_vam_know = TRUE;
		rbl_count_trust = rbl_count_trust + 5;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_29"); //Ma?o kto lubi harowa? w pocie czo?a, ale to nie oznacza, ?e praca Vama jest mniej wa?na.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_30"); //Dobrze, ?e nam?wi?e? Garrego do zmiany profesji.
	}
	else if (Cavalorn_vam_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_31"); //Vam jest Ci bardzo wdzi?czny.
		rbl_count_trust = rbl_count_trust + 5;	
	};

	// ************************
	// Fox
	// (Konfitury)
	// ************************	
	if (fox_trust)&&(Cavalorn_fox_know != TRUE)
	{
		Cavalorn_fox_know = TRUE;
		rbl_count_trust = rbl_count_trust + 5;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_32"); //Fox znowu ob?era si? konfiturami. Mam nadziej?, ?e nie b?dzie nimi rzuca? w stra?nik?w, jak nas odwiedz?...
	}
	else if (Cavalorn_fox_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_33"); //Foxa ju? kupi?e?.
		rbl_count_trust = rbl_count_trust + 5;	
	};

	// ************************
	// Snaf
	// (Wypas kretoszorow)
	// ************************	
	if (snaf_trust == TRUE) && (Cavalorn_snaf_know == FALSE)
	{
		Cavalorn_snaf_know = TRUE;
		rbl_count_trust = rbl_count_trust + 10;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_34"); //Snaf powiedzia? mi, jak si? sprawi?e? w roli pastucha. Dobra robota.
	}
	else if (Cavalorn_snaf_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_35"); //Snaf bardzo Ci? polubi?.
		rbl_count_trust = rbl_count_trust + 10;	
	};

	// ************************
	// Fisk
	// (B?jka w karczmie)
	// ************************	
	if (fisk_trust == TRUE) && (Cavalorn_fisk_know == FALSE)
	{
		Cavalorn_fisk_know = TRUE;
		rbl_count_trust = rbl_count_trust + 5;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_36"); //Fisk powiedzia?, ?e jeste? ?wietnym lekarstwem na nud?.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_37"); //Nie wiem, co mia? na my?li, ale masz jego g?os.
	}
	else if (Cavalorn_fisk_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_38"); //Tak, Fisk jest za.
		rbl_count_trust = rbl_count_trust + 5;	
	};

	// ************************
	// Hanis
	// TODO: Sher, EWIDENTNIE to popraw
	// ************************
	
	if (hanis_trust == TRUE) && (Cavalorn_hanis_know != TRUE)
	{
		Cavalorn_hanis_know = TRUE;
		rbl_count_trust = rbl_count_trust + 10;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_58"); //Gor Hanis i jego miecz znowu s? z nami. 
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_59"); //Powoli zaczynam odzyskiwa? wiar? w ludzi.
	}
	else if (hanis_trust == TRUE)&&(Cavalorn_hanis_know == TRUE)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_60"); //Hanis jest z nami.
		rbl_count_trust = rbl_count_trust + 10;	
	};
	
	// ************************
	// Rekruci
	// (Scorpio,Pacho,Gestath,Carlson,Jack)
	// ************************
	
	if (recruit_finish == TRUE) && (Cavalorn_Cavalorn_know == FALSE)
	{
		Cavalorn_Cavalorn_know = TRUE;
		rbl_count_trust = rbl_count_trust + 25;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_39"); //Przyprowadzaj?c rekrut?w, udowodni?e?, ?e zale?y Ci na naszej sprawie.
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_40"); //Takich ludzi nam w?a?nie potrzeba. Mnie przekona?e?.
	}
	else if (Cavalorn_Cavalorn_know == TRUE)&&(recruit_finish == TRUE)
	{
		rbl_count_trust = rbl_count_trust + 25;		
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_41"); //Zas?u?y?e? na nasze zaufanie. Odt?d jeste? jednym z nas.

	}
	else if (Cavalorn_ORRecruitCount>0)&&(Cavalorn_ORRecruitCount<5)
	{
		rbl_count_trust = rbl_count_trust + (Cavalorn_ORRecruitCount*5);	
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_42"); //Przyprowad? wi?cej rekrut?w, to zdob?dziesz moje poparcie.
	};

	// ************************
	// Podsumowanie
	// ************************
	
	if (rbl_count_trust>=110)
	{
		if(rbl_count_trust>=126)
		{
			DIA_Cavalorn_RebelCampTrust_BecomeRebelNow();
		}
		else//give player choice:
		{
			AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_43"); //Przekona?e? do siebie wi?kszo?? z rebeliant?w.
			//TODO: Sher, ewentualnie to popraw
			AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_54"); //Je?eli dasz rad? zdoby? zaufanie wszystkich, to b?d? mia? dla ciebie co? specjalnego.
			AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_55"); //Ale zrobisz jak uwa?asz.
			
			Info_ClearChoices (DIA_Cavalorn_RebelCampTrust);
			Info_AddChoice (DIA_Cavalorn_RebelCampTrust, "(Nie przerywaj)", DIA_Cavalorn_RebelCampTrust_BecomeRebelNow);
			Info_AddChoice (DIA_Cavalorn_RebelCampTrust, "To mo?e poczeka?.", DIA_Cavalorn_RebelCampTrust_ItCanWait);			
		};
	}
	else if (rbl_count_trust>80)&&(rbl_count_trust<110)
	{
		//TODO: Sher, ewentualnie to popraw
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_51"); //Jeste? ju? bardzo blisko celu.
	}
	else if (rbl_count_trust>50)&&(rbl_count_trust<80)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_48"); //Radzisz sobie ca?kiem nie?le, ale to jeszcze nie koniec.
	}
	else if (rbl_count_trust>0)&&(rbl_count_trust<=50)
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_49"); //Nie ustawaj w trudach, przed Tob? jeszcze sporo pracy.
	}
	else 
	{
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_50"); //Nie zgrywaj si?. Jeszcze nic nie zrobi?e?...
		//B_StopProcessInfos	(self);
	};
};

INSTANCE DIA_Cavalorn_RebelCamp (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 7;
	condition		= DIA_Cavalorn_RebelCamp_Condition;
	information		= DIA_Cavalorn_RebelCamp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czyli jestem ju? jednym z Was?"; 
};

FUNC INT DIA_Cavalorn_RebelCamp_Condition()
{
	return rbl_camp_trust;
};
FUNC VOID DIA_Cavalorn_RebelCamp_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_01"); //Czyli jestem ju? jednym z Was?
	//TODO: Skorygowa? badaj?c sredni lvl gracza po wykonaniu zada?
	if(hero.level<BecomeRBL_Level)
	{
		//TODO: Sher, ewentualnie to popraw
		AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_10"); //Prawie, jednak Twoje umiej?tno?ci pozostawiaj? jeszcze wiele do ?yczenia.
		B_PrintGuildCondition(BecomeRBL_Level);
	};
   
	AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_02"); //Tak, przyjacielu.
	AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_03"); //I co teraz?
	AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_04"); //Jak to co? Rozejrzyj si? po obozie i pogadaj z ch?opakami.
	AI_Output (self, other, "DIA_Cavalorn_RebelCamp_15_05"); //Zacznij od Foxa. Jest naszym kwatermistrzem i zdaje si?, ?e ma jaki? problem.
	AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_06"); //W porz?dku. Przyda?by mi si? lepszy pancerz. Masz co? dla mnie?
	AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_07"); //Nie zajmuj? si? ekwipunkiem. Pogadaj z Foxem, on trzyma piecz? nad magazynem.
	AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_08"); //Rozejrzyj si? te? po okolicy. Tylko nie daj si? zabi?!
	AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_09"); //Bez obaw, zamierzam doczeka? staro?ci.
	
	B_Kapitelwechsel(2);	

	Log_CreateTopic(CH2_Rbl_RebelCampLife, LOG_MISSION);
	B_LogSetTopicStatus(CH2_Rbl_RebelCampLife, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_RebelCampLife, "Zosta?em jednym z rebeliant?w. Cavalorn poradzi? mi, abym porozmawia? z ch?opakami w obozie. Zasugerowa?, abym rozpocz?? od Foxa, kwatermistrz ma podobno jaki? problem.");

	B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_RebelCampAgain (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 8;
	condition		= DIA_Cavalorn_RebelCampAgain_Condition;
	information		= DIA_Cavalorn_RebelCampAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_RebelCampAgain_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_RebelCamp))&&(!spy_ok)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_RebelCampAgain_Info()
{
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_01"); //Aha i jeszcze co?.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_15_02"); //Tak?
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_03"); //Udowodni?e?, ?e potrafisz poradzi? sobie w najr??niejszych sytuacjach.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_04"); //Mam pewn? delikatn? spraw?, niestety nie mog? zleci? jej nikomu z obozu.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_05"); //Ale musisz mi zaufa?. Powiem Ci wi?cej tylko wtedy, gdy zgodzisz si? pom?c.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_06"); //Co Ty na to?

	Info_ClearChoices (DIA_Cavalorn_RebelCampAgain);
	Info_AddChoice (DIA_Cavalorn_RebelCampAgain, "Dobra, m?w.", DIA_Cavalorn_RebelCampAgain_Yes);
	Info_AddChoice (DIA_Cavalorn_RebelCampAgain, "Wol? nie wiedzie? za du?o.", DIA_Cavalorn_RebelCampAgain_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_RebelCampAgain_Yes()
{
	spy_ok = 2;
   
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_01"); //Dobra, m?w.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_02"); //Wiedzia?em, ?e jednak ciekawo?? we?mie g?r? nad zdrowym rozs?dkiem. I dobrze!
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_03"); //Sprawa jest bardzo delikatna i zaraz dowiesz si?, dlaczego nie mog? zleci? jej nikomu z obozu.
	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_04"); //S?uchaj uwa?nie i nie przerywaj.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_05"); //Mamy w obozie zgni?e jab?ko...
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_06"); //Chcia?e? powiedzie? szpiega, tak?
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_07"); //W rzeczy samej.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_08"); //Mamy tu szpiega Gomeza.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_09"); //Dlatego zbadanie tej sprawy musz? powierzy? komu? 'z zewn?trz', komu? spoza uk?ad?w.
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_10"); //Rozumiem. Co dalej?
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_11"); //Dowiesz si?, jak przestaniesz mi przerywa?!
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_12"); //Wybacz, kontynuuj.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_13"); //Najgorsze jest to, ?e nie mam ?adnych podejrze?. Wiem tylko, ?e Gomez na pewno ma tu swojego cz?owieka.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_14"); //Tak to ju? jest, my szpiegujemy jego, a on nas.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_15"); //Nasz cz?owiek z obozu Gomeza ju? kilkakrotnie donosi?, ?e magnaci wiedz? o sprawach, o kt?rych rozmawiali?my pod moim dachem.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_16"); //Nie mam wyboru. Przed ostateczn? konfrontacj? musimy wyci?? ten wrz?d na ty?ku. Nawet je?eli b?dzie bola?o jak cholera!
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_17"); //Musisz odkry? i zdemaskowa? tego sukinsyna!
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_18"); //Od tego zale?y nie tylko przysz?o?? obozu, ale i Twoja.
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_19"); //Od czego powinienem zacz???
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_20"); //Sam nie wiem... Pogadaj z ch?opakami. Mo?e kto? co? zauwa?y?.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_21"); //Tylko nikogo nie pytaj wprost!
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_22"); //To ma by?... ?ledztwo.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_23"); //Musisz wykaza? si? subtelno?ci? i sprytem, ale tego akurat Ci nie brakuje.
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_24"); //Zrobi? co w mojej mocy.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_25"); //Powodzenia ch?opcze. Przyda Ci si? ono r?wnie mocno co i nam.
	
   Log_CreateTopic(CH2_Rbl_Spy, LOG_MISSION);
	B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_Spy, "Gdy sta?em si? jednym z rebeliant?w, Cavalorn poprosi? mnie o rozwik?anie trudnego problemu. W obozie jest szpieg Gomeza, a ja mam dowiedzie? si?, kto nim jest. Cavalorn powiedzia?, ?e nie mog? pyta? wprost, ?e musz? wykaza? si? sprytem. ?atwo mu m?wi?... No nic, zobacz?, co da si? zrobi?.");
	
   B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_RebelCampAgain_No()
{
	spy_ok = 1;
	AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_No_15_01"); //Wol? nie wiedzie? za du?o.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_No_12_02"); //Fakt, ?yje sie wtedy d?u?ej. Ale chyba nie chcesz ?y? wiecznie, he, he.
	AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_No_12_03"); //Wr??, jak zmienisz zdanie.
	B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_RebelCampAgain_change (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 8;
	condition		= DIA_Cavalorn_RebelCampAgain_change_Condition;
	information		= DIA_Cavalorn_RebelCampAgain_change_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zmieni?em zdanie"; 
};

FUNC INT DIA_Cavalorn_RebelCampAgain_change_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_RebelCamp))&&(spy_ok == 1)
	{
		return 1;
	};
};

func void DIA_Cavalorn_RebelCampAgain_change_Info()
{
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_15_07"); //Zmieni?em zdanie.
	AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_08"); //Czyli chcesz us?ysze? wi?cej?
   
   DIA_Cavalorn_RebelCampAgain_Yes();
};

INSTANCE DIA_Cavalorn_BlackTroll (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 9;
	condition		= DIA_Cavalorn_BlackTroll_Condition;
	information		= DIA_Cavalorn_BlackTroll_Info;
	permanent		= 0;
	important		= 0;
	description		= "Aidan powiedzia?, ?e mnie szuka?e?."; 
};

FUNC INT DIA_Cavalorn_BlackTroll_Condition()
{
	//todo:remove
	if (Npc_KnowsInfo (hero, DIA_AIDAN_SteelOk2))
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_BlackTroll_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_01"); //Aidan powiedzia?, ?e mnie szuka?e?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_02"); //Tak, mam dla Ciebie pewne zadanie.
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_03"); //Co tym razem?
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_04"); //Jeste?my zadr? w ty?ku Gomeza...
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_05"); //To ju? wiem.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_06"); //Ale nadal jeste?my za s?abi, ?eby otwarcie rzuci? wyzwanie magnatom i stra?nikom.
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_07"); //Widz?, ?e masz jaki? pomys? na to jak wyr?wna? nasze szanse w tej walce. 
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_08"); //Musimy spr?bowa? wszystkiego, w ko?cu stawk? w grze jest nasze ?ycie.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_09"); //W Kolonii znajduje si? ob?z ?owc?w trolli. Gdyby uda?o si? ich przekona? do naszej sprawy. Nad??asz?
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_10"); //Rozumiem i stwierdzi?e?, ?e ja si? do tego najlepiej nadaj?. 
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_11"); //Pomijaj?c wyb?r emisariusza, reszta planu wydaje si? do?? rozs?dna.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_12"); //Wprost przeciwnie. Jeste? idealnym kandydatem.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_13"); //Nikt ci? tu nie zna, nikomu jeszcze nie zalaz?e? za sk?r?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_14"); //?owcy to banda twardych drani. ?yj? tylko po to by zabija? bestie i chyba to lubi?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_15"); //Oczywi?cie nie robi? tego bezinteresownie. 
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_16"); //Je?eli kto? ma wystarczaj?co du?o odwagi, to jest to ca?kiem niez?y spos?b na zdobycie maj?tku.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_17"); //W ko?cu bariera nie b?dzie trwa? wiecznie. Kiedy szlag j? trafi, ?owcy b?d? mogli sprzeda? trofea i nie?le si? na tym ob?owi?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_18"); //Wi?c jak b?dzie? Porozmawiasz z ?owcami w moim imieniu?
	
   Log_CreateTopic(CH2_Rbl_TrollHunters, LOG_NOTE);
	B_LogEntry(CH2_Rbl_TrollHunters, "Cavalorn opowiedzia? mi o obozie ?owc?w trolli. Pozosta?e obozy staraj? si? od nich stroni?, co oznacza, ?e ci ?owcy to banda niez?ych sukinsyn?w.");

	Info_ClearChoices(DIA_Cavalorn_BlackTroll);
	Info_AddChoice	 (DIA_Cavalorn_BlackTroll, "To trudna decyzja..." ,DIA_Cavalorn_BlackTroll_No);	
	Info_AddChoice	 (DIA_Cavalorn_BlackTroll, "Wyrusz? do obozu ?owc?w." ,DIA_Cavalorn_BlackTroll_Yes);
};

func void DIA_Cavalorn_BlackTroll_Yes()
{
	cav_trol = 2;
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_00"); //Wyrusz? do obozu ?owc?w.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_01"); //Wiedzia?em, ?e mog? na Ciebie liczy?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_03"); //Nie pozostaje mi nic innego jak ?yczy? Ci powodzenia, przyjacielu.
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_04"); //Gdzie znajd? ten ob?z?
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_05"); //?owcy obozuj? gdzie? pomi?dzy Placem Wymian, a kopalni? nale??c? do Gomeza.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_06"); //Niestety nie znam dok?adnej lokalizacji obozu.
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_07"); //Jako? sobie poradz?. Bywaj. 

	Log_CreateTopic(CH2_Rbl_BlackTroll, LOG_MISSION);
	B_LogSetTopicStatus(CH2_Rbl_BlackTroll, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_BlackTroll, "Zgodzi?em si? pom?c Cavalornowi w pozyskaniu sojusznik?w do naszej sprawy. Musz? odnale?? ob?z ?owc?w trolli i sprawi?, ?eby stan?li po naszej stronie w sporze z Gomezem. Ich ob?z znajduje si? gdzie? pomi?dzy Star? Kopalni? a Placem Wymian.");
	Info_ClearChoices(DIA_Cavalorn_BlackTroll);
};

func void DIA_Cavalorn_BlackTroll_No()
{
	cav_trol = 1;
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll_No_15_00"); //To trudna decyzja...
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll_No_12_01"); //Rozumiem. Wr??, kiedy nabierzesz pewno?ci, jak powiniene? post?pi?.
	Info_ClearChoices(DIA_Cavalorn_BlackTroll);	
};

INSTANCE DIA_Cavalorn_BlackTroll1 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 10;
	condition		= DIA_Cavalorn_BlackTroll1_Condition;
	information		= DIA_Cavalorn_BlackTroll1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem ju? got?w. Poszukam ?owc?w."; 
};

FUNC INT DIA_Cavalorn_BlackTroll1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_BlackTroll))&&(cav_trol == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_BlackTroll1_Info()
{
	cav_trol = 2;
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_00"); //Jestem ju? got?w. Poszukam ?owc?w.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_01"); //Wiedzia?em, ?e mog? na Ciebie liczy?.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_02"); //Nie pozostaje mi nic innego jak ?yczy? Ci powodzenia, przyjacielu.
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_03"); //Gdzie znajd? ten ob?z?
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_04"); //?owcy obozuj? gdzie? pomi?dzy Placem Wymian a kopalni? nale??c? do Gomeza.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_05"); //Niestety nie znam dok?adnej lokalizacji ich obozu.
	AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_06"); //Jako? sobie poradz?. Bywaj. 

	Log_CreateTopic(CH2_Rbl_BlackTroll, LOG_MISSION);
	B_LogSetTopicStatus(CH2_Rbl_BlackTroll, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_BlackTroll, "Zgodzi?em si? pom?c Cavalornowi w pozyskaniu sojusznik?w do naszej sprawy. Musz? odnale?? ob?z ?owc?w trolli i sprawi?, ?eby stan?li po naszej stronie w sporze z Gomezem. Ich ob?z znajduje si? gdzie? pomi?dzy Star? Kopalni? a Placem Wymian.");
};

INSTANCE DIA_Cavalorn_BlackTroll2 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 1;
	condition		= DIA_Cavalorn_BlackTroll2_Condition;
	information		= DIA_Cavalorn_BlackTroll2_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_BlackTroll2_Condition()
{
	if (cav_trol == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_BlackTroll2_Info()
{
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_01"); //Zaczekaj chwil?!
	AI_Output (other, self, "DIA_Cavalorn_BlackTroll2_15_02"); //Co si? sta?o?
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_03"); //Pogadaj z Leafem. On by? kiedy? w obozie ?owc?w, mo?e na co? si? w ko?cu przyda.
	AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_04"); //We? te? te mikstury. Mo?esz ich potrzebowa?.
   
	CreateInvItems (self, ItFo_Potion_Health_02,5); 
	B_GiveInvItems (self, other,ItFo_Potion_Health_02, 5);
	CreateInvItems (self, ItFo_Potion_Mana_02,2); 
	B_GiveInvItems (self, other,ItFo_Potion_Mana_02, 2);
	CreateInvItems (self, ItFo_Potion_Haste_02,1); 
	B_GiveInvItems (self, other,ItFo_Potion_Haste_02, 1);

	AI_Output (other, self, "DIA_Cavalorn_BlackTroll2_15_05"); //Bywaj.
	B_LogEntry(CH2_Rbl_BlackTroll, "Cavalorn powiedzia?, ?e Leaf zna ?owc?w trolli, powinienem z nim pogada?. Da? mi te? kilka mikstur 'na drog?'.");
	B_StopProcessInfos(self);
};

VAR INT CAVALORN_ASK_TRAIL;

INSTANCE DIA_Cavalorn_BlackTrollBack (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 11;
	condition		= DIA_Cavalorn_BlackTrollBack_Condition;
	information		= DIA_Cavalorn_BlackTrollBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "?owcy trolli stan? po naszej stronie!"; 
};

FUNC INT DIA_Cavalorn_BlackTrollBack_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_HuntFinalEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_BlackTrollBack_Info()
{
	//crappy dialog, modified by orc.
	B_GiveXP (2000);
   
	AI_Output (other, self, "DIA_Cavalorn_BlackTrollBack_15_01"); //?owcy trolli stan? po naszej stronie!
	AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_02"); //?wietna robota, dzi?ki Tobie zdobyli?my kolejnych sojusznik?w.
	AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_03"); //Gomez ud?awi si? z w?ciek?o?ci, jak si? o tym dowie.
	AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_04"); //Dobra robota, my?l?, ?e jeste? ju? got?w by wybra? swoj? ?cie?k? w obozie.
	AI_Output (other, self, "DIA_Cavalorn_BlackTrollBack_15_05"); //M?wisz o specjalizacji?
	AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_06"); //Tak, staramy si?, aby ka?dy robi? to, co lubi i w czym jest najlepszy.
	AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_07"); //Musisz sam okre?li?, co chcia?by? robi?.	

	/***************************************
	Ork gadali?my o tych rangach, tutaj mo?na da? kolejn?
	I dick zasili? w?a?nie poczet my?liwych ;P
	****************************************/

	/********************************

	Jaka? fajna recepta w nagrod?

	*********************************/
	Info_ClearChoices (DIA_Cavalorn_BlackTrollBack);
	Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Musz? si? zastanowi?...", DIA_Cavalorn_BlackTrollBack_Think);
	Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Chc? zg??bia? tajniki magii.",DIA_Cavalorn_BlackTrollBack_Mag);
	Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Wybieram drog? ?owcy.", DIA_Cavalorn_BlackTrollBack_Hunter);
};

// ---------------------------mag----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Mag()
{
	CAVALORN_ASK_TRAIL=2;//mage

	AI_Output (other, self, "DIA_Cavalorn_MineEnd_Mag_15_01"); //Chc? zg??bia? tajniki magii.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_02"); //To Tw?j wyb?r. B?dzie, jak zechcesz.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_03"); //Jak ju? b?dziesz got?w, to pogadaj z Miltenem.	
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_04"); //Naprawd? ciesz? si?, ?e jeste? po naszej stronie, Rick.
	
   B_LogEntry(CH3_RBL_Choose, "Wybra?em ?cie?k? magii. Jak ju? b?d? gotowy, to mam si? zg?osi? do Miltena.");	
	B_StopProcessInfos(self);	
};

// ---------------------------hunter----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Hunter()
{
	CAVALORN_ASK_TRAIL=1;//hunter

	AI_Output (other, self, "DIA_Cavalorn_MineEnd_Hunter_15_01"); //Wybieram drog? ?owcy.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_02"); //Pod??asz t? sam? ?cie?k? co ja, to ?wietny wyb?r.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_04"); //Jak ju? b?dziesz got?w, to pogadaj z Ratfordem.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_05"); //Naprawd? ciesz? si?, ?e jeste? po naszej stronie, Rick.
	
   Log_CreateTopic(CH2_RBL_Hunter, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Hunter, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Hunter, "Wkroczy?em na drog? ?owcy, czeka mnie szereg pr?b dzi?ki, kt?rym dowiod?, ?e jestem godzien nosi? to miano. Najpierw musz? porozmawia? z Ratfordem.");
   B_LogEntry(CH3_RBL_Choose, "Wybra?em ?cie?k? ?owcy. Musz? porozmawia? z Ratfordem, dostan? nowe zadanie.");
	B_StopProcessInfos(self);	
};

// ---------------------------think----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Think()
{
	CAVALORN_ASK_TRAIL=0;//still unknown
	
	AI_Output (other, self, "DIA_Cavalorn_MineEnd_Think_15_01"); //Musz? si? zastanowi?...
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_Think_12_02"); //Rozumiem. Wr??, kiedy b?dziesz pewien, co chcia?by? robi?.
	
	B_LogEntry(CH3_RBL_Choose, "Musz? to przemy?le?...");
	
	B_StopProcessInfos(self);	
};

INSTANCE DIA_Cavalorn_Decision (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 11;
	condition		= DIA_Cavalorn_Decision_Condition;
	information		= DIA_Cavalorn_Decision_Info;
	permanent		= 1;
	important		= 0;
	description		= "Podj??em ju? decyzj?."; 
};

FUNC INT DIA_Cavalorn_Decision_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_BlackTrollBack) && (CAVALORN_ASK_TRAIL == 0))
	{
		return 1;
	};
};

func void DIA_Cavalorn_Decision_Info()
{
   AI_Output (other, self, "DIA_Cavalorn_Decision_15_01"); //Podj??em ju? decyzj?.
	AI_Output (self, other, "DIA_Cavalorn_Decision_12_02"); //Tak? Jaki jest wi?c tw?j wyb?r?
   
   Info_ClearChoices (DIA_Cavalorn_Decision);
	Info_AddChoice (DIA_Cavalorn_Decision, "Musz? si? zastanowi?...", DIA_Cavalorn_BlackTrollBack_Think);
	Info_AddChoice (DIA_Cavalorn_Decision, "Chc? zg??bia? tajniki magii.",DIA_Cavalorn_BlackTrollBack_Mag);
	Info_AddChoice (DIA_Cavalorn_Decision, "Wybieram drog? ?owcy.", DIA_Cavalorn_BlackTrollBack_Hunter);
};

INSTANCE DIA_Cavalorn_Demon (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 33;
	condition		= DIA_Cavalorn_Demon_Condition;
	information		= DIA_Cavalorn_Demon_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Demon_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_DemonGo))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Demon_Info()
{
	B_GiveXP (1000);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_01"); //Ma?o brakowa?o...
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_02"); //B?dziesz ?y?. A gdzie demon?
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_03"); //Waln?? mnie i znikn??. Teleportowa?o si? ?cierwo, zanim zd??y?em doj?? do siebie.
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_04"); //Ciesz si?, ?e to zrobi?, bo inaczej musieliby?my wybra? nowego szefa.
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_05"); //Masz racj?, przeliczy?em si?. To by?o ponad moje si?y...
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_06"); //Racja, zachowa?e? si? jak idiota. Goni? demona w pojedynk?...
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_07"); //Chyba mamy ze sob? wi?cej wsp?lnego, ni?bym chcia? przyzna?.
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_08"); //Co teraz?
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_09"); //Porozmawiam z magami. Musimy dowiedzie? si?, gdzie demon m?g? si? ukry?.
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_10"); //A co potem?
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_11"); //B?dziemy si? o to martwi?, jak go znajdziemy. Ale du?ego wyboru nie ma, demon musi zgin??.
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_12"); //M?wi?em, ?e to zbyt du?e ryzyko...
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_13"); //Kto mieczem wojuje, ten od miecza ginie. Czasami trzeba zaryzykowa?.
	AI_Output (other, self, "DIA_Cavalorn_Demon_15_14"); //Dobra, nie ma co strz?pi? j?zyka po pr??nicy. Daj mi zna?, jak dowiesz si? czego? nowego o naszej zgubie.
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_15"); //Mo?esz by? tego pewien. Nie zamierzam wi?cej bawi? si? w bohatera.
	AI_Output (self, other,"DIA_Cavalorn_Demon_12_16"); //Chyba p?jd? na g??bszego.
	
   Log_SetTopicStatus(CH2_RBL_Hunter, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_MysteryBook, "Demon uciek?. Cavalorn porozmawia z magami i mo?e uda si? znale?? zgub?. Nie ma to jak uwolni? pradawnego demona, ?eby sobie pohasa? po Kolonii...");

	//Log_CreateTopic(CH2_RBL_Katrakanat, LOG_MISSION);
	//Log_SetTopicStatus(CH2_RBL_Katrakanat, LOG_RUNNING);
	//B_LogEntry(CH2_RBL_Katrakanat, "Wi?zie? Katrakanat zn?w jest na wolno?ci. Musimy znale?? demona, zanim zaczniemy ?a?owa? na w?asnej sk?rze tego, ?e to dzi?ki nam jest na wolno?ci.");

	/*************************
	Ork wymy?l jak?? fajn? nagrod?
	************************/
   
	B_StopProcessInfos(self);

	var C_NPC leren; leren = Hlp_GetNpc(mag_1604_Leren);
	Npc_ExchangeRoutine(self,"start");
};

/**************************************
Magowie pass
**************************************/

INSTANCE DIA_Cavalorn_Pass (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 44;
	condition		= DIA_Cavalorn_Pass_Condition;
	information		= DIA_Cavalorn_Pass_Info;
	permanent		= 0;
	important		= 0;
	description		= "Opowiedz mi co? wi?cej o magach z waszego obozu."; 
};

FUNC INT DIA_Cavalorn_Pass_Condition()
{
	//TODO: Relase //when hero is RBL? Check
	if (Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Pass_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Pass_15_01"); //Opowiedz mi co? wi?cej o magach z waszego obozu.
	//	AI_Output (self, other,"DIA_Cavalorn_Pass_12_02"); //Z waszego? Raczej z naszego obozu.
	//	AI_Output (other, self, "DIA_Cavalorn_Pass_15_03"); //Jeszcze z nimi nie rozmawia?em, jako? nigdy nie przepada?em za kap?anami.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_04"); //Magowie to do?? skryte persony.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_05"); //Nie wy?ciubiaj? nosa sponad ksi?g, ka?d? woln? chwil? sp?dzaj? na nieko?cz?cych si? debatach i k??tniach.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_06"); //Poza tym s? tacy jak my, musz? je??, pi?, wypr??ni? si? no i chc? prze?y? w Kolonii jak d?ugo si? da.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_07"); //Mamy wsp?lne cele, a to mocno spaja.
	AI_Output (other, self, "DIA_Cavalorn_Pass_15_08"); //Jak mo?na si? do nich dosta??
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_09"); //Z magami mog? si? spotka? tylko najbardziej zaufani spo?r?d nas.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_10"); //I nie chodzi tu o hierarchi? spo?eczn? tylko o zwyczajny pragmatyzm. Magowie to arogancka banda, a ja nie chcia?bym, ?eby kt?ry? z nich sko?czy? z no?em w oku.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_11"); //Za bardzo s? nam potrzebni.
	AI_Output (other, self, "DIA_Cavalorn_Pass_15_12"); //Czyli w pewnym sensie to z?o konieczne, tak?
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_13"); //Niezupe?nie. My pomagamy im, oni nam. Uzupe?niamy si?, to raczej symbioza, chocia? to g??wnie my pomagamy im.
	AI_Output (other, self, "DIA_Cavalorn_Pass_15_14"); //Rozumiem, ?e nie rozmawiaj? z pierwszy lepszym skaza?cem.
	AI_Output (self, other,"DIA_Cavalorn_Pass_12_15"); //To zale?y. Udowodnij co? wart, wtedy pogadamy.

	Log_CreateTopic(CH2_RBL_Mags, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Mags, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Mags, "Aby przekona? do siebie mag?w, musz? tradycyjnie udowodni?, co jestem wart. Ciekawe, co dok?adnie Cavalorn mia? na my?li?");
};

//TEMPORARY DISABLED - MAYBE LETER SOME QUEST FOR WARRIOR?

INSTANCE DIA_Cavalorn_MagProve (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 45;
	condition		= DIA_Cavalorn_MagProve_Condition;
	information		= DIA_Cavalorn_MagProve_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam spraw? do mag?w."; 
};

FUNC INT DIA_Cavalorn_MagProve_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_BlackTrollBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_MagProve_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_MagProve_15_01"); //Mam spraw? do mag?w.
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_02"); //Dzi?ki tobie ch?opcy Kiry s? po naszej stronie. Gdybym mia? wi?cej takich chojrak?w, to Gomez ju? by pakowa? manatki.
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_03"); //Je?eli o mnie chodzi, to ?mia?o mo?esz im poprzeszkadza?. To jest przepustka...
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_04"); //Poka? to Miltenowi i nie zwracaj uwagi na jego docinki. Zachowuje si? tak, odk?d Gomez rozkaza? za?atwi? mag?w ognia.
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_05"); //Jeszcze tylko sprawdz?, czy z papierem wszystko w porz?dku.
	B_UseFakeScroll(self);
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_06"); //Lak nie odpada. Dobra, we? pergamin.
   
	CreateInvItems (self, magpass, 1);
	B_GiveInvItems (self, other, magpass, 1);
   
	AI_Output (other, self, "DIA_Cavalorn_MagProve_15_07"); //Sk?d wzi??e? papier z kr?lewsk? piecz?ci??
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_08"); //Wypad? z jakiego? transportu, mam tego ca?y rulon.
	AI_Output (self, other,"DIA_Cavalorn_MagProve_12_09"); //Wszystkie in blanco. Planuj? zrobi? z nich lepszy u?ytek, jak ju? si? st?d wyrwiemy.

	Log_SetTopicStatus(CH2_RBL_Mags, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Mags, "Cavalorn da? mi przepustk? do mag?w, kiedy doprowadzi?em do sojuszu z ?owcami trolli. Teraz powinni lepiej mnie potraktowa?.");
};

INSTANCE DIA_Cavalorn_Raport (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 46;
	condition		= DIA_Cavalorn_Raport_Condition;
	information		= DIA_Cavalorn_Raport_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam z?e wie?ci."; 
};

FUNC INT DIA_Cavalorn_Raport_Condition()
{
	if (Kapitel==3)&&(Npc_KnowsInfo (hero, DIA_RATFORD_RaportDone))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Raport_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Raport_15_01"); //Mam z?e wie?ci.
	AI_Output (self, other,"DIA_Cavalorn_Raport_12_02"); //Co si? sta?o?
	AI_Output (other, self, "DIA_Cavalorn_Raport_15_03"); //Nowy Ob?z upad?.
	AI_Output (self, other,"DIA_Cavalorn_Raport_12_04"); //Niech to szlag trafi!
	AI_Output (self, other,"DIA_Cavalorn_Raport_12_05"); //Musimy natychmiast odpowiedzie? magnatom. Nie mog? w to uwierzy?...
	AI_Output (self, other,"DIA_Cavalorn_Raport_12_06"); //Gomez ma nas teraz jak na sztychu miecza.
	AI_Output (self, other,"DIA_Cavalorn_Raport_12_07"); //B?d? czeka? przy str???wce Toniego. Przyjd? tam jak najszybciej, czeka nas sporo pracy.
   
	Log_CreateTopic(CH3_RBL_NCFall, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_NCFall, LOG_RUNNING);
	B_LogEntry(CH3_RBL_NCFall, "Nowy Ob?z upad?. To radykalnie zmienia plany rebeliant?w. Mam jak najszybciej porozmawia? z Cavalornem przy str???wce Toniego.");
	AI_SetWalkmode (self,NPC_RUN); 
   Npc_ExchangeRoutine(self, "ORHAVETROUBLES");//rutyna ze staniem ko?o str???wki
   
   B_ExchangeRoutine(angus, "PreGuideMine");
   
   if (hanis_trust)
   {
      B_ExchangeRoutine(GorHanis, "PreGuideMine");
   }
   else
   {
      B_ExchangeRoutine(Kharim, "PreGuideMine");
   };

	B_StopProcessInfos(self);
   
   Wld_InsertNpc(SLD_728_Jarvis, "WP_CIRCLE_01"); 
};

// **************************************************

INSTANCE DIA_HUN_336_CAVALORN_Stew (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 12;
	condition		= DIA_HUN_336_CAVALORN_Stew_Condition;
	information		= DIA_HUN_336_CAVALORN_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios?em troch? specja?u Snafa, pyszny gulasz..."; 
};

FUNC INT DIA_HUN_336_CAVALORN_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_336_CAVALORN_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Stew_15_01"); //Przynios?em troch? specja?u Snafa, pyszny gulasz...
	AI_Output (self, other, "DIA_HUN_336_CAVALORN_Stew_11_02"); //To ?wietnie!
	AI_Output (other, self, "DIA_HUN_336_CAVALORN_Stew_15_03"); //M?wisz powa?nie?
	AI_Output (self, other, "DIA_HUN_336_CAVALORN_Stew_11_04"); //Pewnie. Zal?g?y mi si? szczury w chacie, a gulasz Snafa odstrasza szkodniki lepiej ni? stare onuce.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Gulasz Snafa wspomo?e Cavalorna w walce ze szczurami."); 
};

/************************************************

Chapter 3

************************************************/
func void B_add_npc_to_enforcement(var int instance_npc)
{
   var c_npc npc;
	npc = Hlp_GetNPC(instance_npc);
	Party_AddNpc(npc);
	npc.attribute[ATR_HITPOINTS_MAX]=npc.attribute[ATR_HITPOINTS_MAX]*2;
	npc.attribute[ATR_HITPOINTS]=npc.attribute[ATR_HITPOINTS_MAX];  
   npc.protection[PROT_BLUNT] += 250;
	npc.protection[PROT_EDGE] += 250;
   npc.flags = NPC_FLAG_IMMORTAL;
	B_ExchangeRoutine	(npc, "GuideMine");
	Npc_SetAttitude(npc, ATT_FRIENDLY);
	Npc_SetTempAttitude(npc, ATT_FRIENDLY);	
};

INSTANCE DIA_Cavalorn_Mine (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 47;
	condition		= DIA_Cavalorn_Mine_Condition;
	information		= DIA_Cavalorn_Mine_Info;
	permanent		= 0;
	important		= 1;
	//	description		= "."; 
};

FUNC INT DIA_Cavalorn_Mine_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Raport))&&(Npc_GetDistToWP(self,"OW_PATH_OC_NC7") < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Mine_Info()
{
	AI_Output (self, other,"DIA_Cavalorn_Mine_12_01"); //Dobrze, ?e jeste?, najwy?szy czas odp?aci? Gomezowi t? sam? monet?.
	AI_Output (other, self, "DIA_Cavalorn_Mine_15_02"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Cavalorn_Mine_12_03"); //Wyr?niemy wszystkich s?ugus?w Gomeza w Starej Kopalnii!
	AI_Output (other, self, "DIA_Cavalorn_Mine_15_04"); //Je?eli spodziewaj? si? ataku to ju? po nas.
	AI_Output (self, other,"DIA_Cavalorn_Mine_12_05"); //Musimy zaryzykowa?. Je?eli Gomez b?dzie mia? w r?ku dwie kopalnie to i tak przegramy. 
	AI_Output (self, other,"DIA_Cavalorn_Mine_12_06"); //Nic go tak nie ugodzi, jak utrata ukochanej rudy. A nam da to chwilow? przewag? i wystarczaj?c? ilo?? bry?ek by przygotowa? si? do ostatecznej konfrontacji.
	AI_Output (self, other,"DIA_Cavalorn_Mine_12_07"); //Wystarczy ju? gadania, czas nakarmi? miecze krwi? tych skurwieli!
	
	/*************************************
	ENFORECMENT
	*************************************/
   if (hanis_trust)
   {
      B_add_npc_to_enforcement(HUN_1422_GorHanis);
   }
   else
   {
      B_add_npc_to_enforcement(HUN_729_Kharim);
   };
   
   B_add_npc_to_enforcement(HUN_2615_Abel);
   B_add_npc_to_enforcement(PIR_2600_Angus);
	
   Log_SetTopicStatus(CH3_RBL_NCFall, LOG_SUCCESS);
   B_LogEntry(CH3_RBL_NCFall, "W odwecie zaatakujemy Star? Kopalni?!");
	Log_CreateTopic(CH3_RBL_MineAttack, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_MineAttack, LOG_RUNNING);
	B_LogEntry(CH3_RBL_MineAttack, "Ale wdepn??em. W?a?nie sta?em si? cz??ci? oddzia?u, kt?ry ma wyr?n?? stra?nik?w i cienie w Starej Kopalni. Grunt to nie da? si? zabi?.");
	Party_AddNpc(self);
   self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self, "GUIDEMINE");
	B_StopProcessInfos(self);	
	self.senses =	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	self.senses_range = 3000;
   self.protection[PROT_BLUNT] += 250;
	self.protection[PROT_EDGE] += 250;
	Npc_SetAttitude(self, ATT_FRIENDLY);
	Npc_SetTempAttitude(self, ATT_FRIENDLY);	
};

var int dickon_choose;

func void B_remove_npc_to_enforcement(var int instance_npc)
{
   var c_npc npc;
	npc = Hlp_GetNPC(instance_npc);
	Party_RemoveNpc(npc);
	npc.attribute[ATR_HITPOINTS]=npc.attribute[ATR_HITPOINTS_MAX];  
   npc.protection[PROT_BLUNT] -= 250;
	npc.protection[PROT_EDGE] -= 250;

	B_ExchangeRoutine	(npc, "start");	
};

INSTANCE DIA_Cavalorn_MineEnd (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 48;
	condition		= DIA_Cavalorn_MineEnd_Condition;
	information		= DIA_Cavalorn_MineEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_MineEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Mine))&&(OldCampGrds>=19)&&(Npc_GetDistToWP(hero,"OW_OM_ENTRANCE02") < 400) //jaka? zmienna okreslaj?ca zabitych straznik?w i ciebie w kopalni
	//&&(hero.guild == GIL_RBL)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_MineEnd_Info()
{
   if (hanis_trust)
   {
      B_remove_npc_to_enforcement(HUN_1422_GorHanis);
   }
   else
   {
      B_remove_npc_to_enforcement(HUN_729_Kharim);
   };
  
	B_remove_npc_to_enforcement(PIR_2600_Angus);
   B_remove_npc_to_enforcement(HUN_2615_Abel);

	NPC_ExchangeRoutine	(self, "start");	

	self.attribute[ATR_HITPOINTS_MAX]=self.attribute[ATR_HITPOINTS_MAX];	
   Party_RemoveNpc(self);
	self.protection[PROT_BLUNT] -= 250;
	self.protection[PROT_EDGE] -= 250;
   
	B_FullStop (hero);
	AI_GotoNpc(hero,self);
	
	B_GiveXP (1000);
	AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_01"); //No to koniec zabawy. Stara Kopalnia jest teraz Woln? Kopalni?!
	AI_Output (other, self, "DIA_Cavalorn_MineEnd_15_02"); //Nie?le si? namacha?em mieczem...
	Log_SetTopicStatus(CH3_RBL_MineAttack, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_MineAttack, "Atak na Star? Kopalni? zako?czy? si? rzezi? i naszym zwyci?stwem.");

	if	(CAVALORN_ASK_TRAIL==2)
	{
		Npc_SetTrueGuild (other,GIL_MAG);
		other.guild = GIL_MAG;	
		AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_03"); //Racja. Dowiod?e?, ?e? wart by sta? si? magiem.
		
		AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_04"); //Porozmawiaj z Miltenem on da Ci run? i kostur. Od Lerena otrzymasz szat? maga.
		AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_05"); //Jak ju? b?dziesz got?w, to pogadaj z Ratfordem.	
		B_LogEntry(CH3_RBL_Choose, "B?d? pod??a? ?cie?k? magii. Musz? porozmawia? z Miltenem i Lerenem w sprawie lepszego wyposa?enia i nauki. Jak ju? b?d? gotowy, to mam si? zg?osi? do Ratforda po nowe zadanie.");	
	}
	else
	{
		Npc_SetTrueGuild (other,GIL_HUN);
		other.guild = GIL_HUN;

		AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_06"); //Racja. Dowiod?e?, ?e? wart by sta? si? ?owc?.
		AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_07"); //Porozmawiaj z Aidanem i Foxem, dadz? Ci porz?dne wyposa?enie.
		B_LogEntry(CH3_RBL_Choose, "Zosta?em ?owc?. Musz? porozmawia? z Aidanem i Foxem w sprawie lepszego wyposa?enia. Jak ju? b?d? gotowy, to mam si? zg?osi? do Ratforda po nowe zadanie.");
	};
   
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_08"); //Jak ju? b?dziesz got?w to pogadaj z Ratfordem.
	AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_09"); //Do zobaczenia w obozie.
	B_StopProcessInfos(self);	
};

INSTANCE DIA_Cavalorn_Meeting (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	nr				= 50;
	condition		= DIA_Cavalorn_Meeting_Condition;
	information		= DIA_Cavalorn_Meeting_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Meeting_Condition()
{
	//TODO 4 test	
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Meeting_Info()
{
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_Cavalorn_Meeting_12_01"); //Przede wszystkim nie mo?na dopu?ci? do paniki. Ludzie musz? uwierzy? w zwyci?stwo.
	AI_TurnToNpc(self, ratford);
	AI_Output (self, other,"DIA_Cavalorn_Meeting_12_02"); //Przygotowaniami umocnie? zajmie si? Ratford. Trzeba naprawi? ka?d? dziur?, wzmocni? palisad?, wyda? ludziom bro? i zaplanowa? strategi? obrony.
	
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Meeting2 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	nr				= 50;
	condition		= DIA_Cavalorn_Meeting2_Condition;
	information		= DIA_Cavalorn_Meeting2_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Meeting2_Condition()
{
	//TODO 4 test	
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING_talking))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Meeting2_Info()
{	
   AI_TurnToNpc(self, milten);
	AI_Output (self, other,"DIA_Cavalorn_Meeting_12_04"); //Magowie niech przygotuj? tyle mikstur, ile si? da. Kiedy nadejdzie w?a?ciwa pora, wesprzecie nas zakl?ciami.
	AI_PlayAni(milten,"T_YES");
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Meeting3 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	nr				= 50;
	condition		= DIA_Cavalorn_Meeting3_Condition;
	information		= DIA_Cavalorn_Meeting3_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Meeting3_Condition()
{
	//TODO 4 test	
	if (Npc_KnowsInfo (hero, Dia_Milten_meeting))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Meeting3_Info()
{	
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Cavalorn_Meeting_12_06"); //Ty wyruszysz do ?owc?w troli. Niech b?d? gotowi. Powiesz Kirze, ?e zaatakuj? ty?y stra?nik?w, kiedy ci rzuc? si? na palisad?.
	AI_Output (other, self, "DIA_Cavalorn_Meeting_15_07"); //Postaram si? j? przekona? do naszej sprawy.
	AI_Output (self, other,"DIA_Cavalorn_Meeting_12_08"); //Skoro ka?dy zna swoje obowi?zki, to ruszcie dupska! Czeka nas sporo pracy.
	
   B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn rozdzieli? zadania. Ja mam wyruszy? do obozu ?owc?w trolli i powiedzie? im, ?eby nas wsparli. Maj? uderzy? na ty?y atakuj?cych stra?nik?w.");
	Log_CreateTopic(CH3_RBL_TrolHelp, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_TrolHelp, LOG_RUNNING);
	B_LogEntry(CH3_RBL_TrolHelp, "Musz? zawiadomi? ?owc?w trolli, ?e Gomez ju? wkr?tce na nas uderzy. Kira ze swoimi lud?mi ma zaatakowa? ty?y stra?nik?w.");

	B_StopProcessInfos(self);
	B_ExchangeRoutine(milten, "START");
   Npc_ExchangeRoutine(self, "GestathIn");

	VAR C_NPC NSC;
	
	NSC = Hlp_GetNpc(HUN_309_Whistler  );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(HUN_819_Drax      );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_331_Fingers   );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_1332_BaalKagan);
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_2614_Fox      );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_2618_Hark     );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_2619_Cup      );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_4011_Leaf      );
	B_ExchangeRoutine(NSC,"PREPARATION");
	NSC = Hlp_GetNpc(RBL_2605_Garry     );
	B_ExchangeRoutine(NSC,"PREPARATION");		
   var c_npc gorn; gorn = hlp_getnpc(PC_Fighter);
   Npc_ExchangeRoutine(gorn, "NC");
};

//*********************************

INSTANCE DIA_Cavalorn_NewSword (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 51;
	condition		= DIA_Cavalorn_NewSword_Condition;
	information		= DIA_Cavalorn_NewSword_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie nowe ostrze."; 
};

FUNC INT DIA_Cavalorn_NewSword_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(other,HUN_MW_03)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_NewSword_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_NewSword_15_01"); //Mam dla ciebie nowe ostrze.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_12_02"); //Fox Ci? nas?a??
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"DIA_Cavalorn_NewSword_12_03"); //Nie potrzebuj? ?wiec?cego ?elastwa. Mam stary, sprawdzony miecz.
	Info_ClearChoices (DIA_Cavalorn_NewSword);
	Info_AddChoice (DIA_Cavalorn_NewSword, "Tw?j miecz to z?om.", DIA_Cavalorn_NewSword_Scrab);
	Info_AddChoice (DIA_Cavalorn_NewSword, "We? go ze wzgl?du na swoje ?ycie.", DIA_Cavalorn_NewSword_Care);
	Info_AddChoice (DIA_Cavalorn_NewSword, "Zr?b to dla mnie.", DIA_Cavalorn_NewSword_Me);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Me()
{
	B_GiveXP(200);
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Me_15_01"); //Zr?b to dla mnie.
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Me_15_02"); //Jak nie we?miesz ostrza, to Fox nie da mi ?y?.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Me_12_03"); //W porz?dku. Ale robi? to tylko ze wzgl?du na Ciebie.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Me_12_04"); //Stary miecz schowam do kufra. Co? mi si? wydaje, ?e to nowe ?wiecide?ko szybko gdzie? si? zawieruszy...
	cav_take = true;
	B_GiveInvItems (other, self, HUN_MW_03, 1);
	B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn przyj?? ostrze, co nie by?o takie proste.");
	B_StopProcessInfos(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Scrab()
{
<<<<<<< Updated upstream
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Scrab_15_01"); //Twój miecz to z³om.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_02"); //Ten z³om zabi³ wiêcej stra¿ników ni¿ potrawki Snafa.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_03"); //Nie zamieniê tego ostrza na ¿aden inny. Powiedz Foxowi, ¿eby siê ju¿ wiêcej nie trudzi³.
	B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj¹³ ostrza. Nie uda³o mi siê go przekonaæ by wzi¹³ miecz. No có¿, lepiej na razie nie wracaæ do Foxa...");
=======
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Scrab_15_01"); //Tw?j miecz to z?om.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_02"); //Ten z?om zabi? wi?cej stra?nik?w ni? potrawki Snafa.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_03"); //Nie zamieni? tego ostrza na ?aden inny. Powiedz Foxowi, ?eby si? ju? wi?cej nie trudzi?.
	B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj?? ostrza. Nie uda?o mi si? go przekona? by wzi?? miecz. No c??, lepiej na razie nie wraca? do Foxa...");
>>>>>>> Stashed changes
	B_StopProcessInfos(self);
   
   Log_SetTopicStatus	(CH3_RBL_DelivWeapon, LOG_FAILED);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Care()
{
<<<<<<< Updated upstream
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Care_15_01"); //WeŸ go ze wzglêdu na swoje ¿ycie.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_02"); //Nigdy siê z sob¹ nie cacka³em. Je¿eli zginê, to na pewno nie przez ten miecz.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_03"); //Nie zamieniê orê¿a na ¿aden inny. Powiedz Foxowi, ¿eby siê ju¿ wiêcej nie trudzi³.
	B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj¹³ ostrza. Nie uda³o mi siê go przekonaæ by wzi¹³ miecz. No có¿, lepiej na razie nie wracaæ do Foxa...");
=======
	AI_Output (other, self, "DIA_Cavalorn_NewSword_Care_15_01"); //We? go ze wzgl?du na swoje ?ycie.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_02"); //Nigdy si? z sob? nie cacka?em. Je?eli zgin?, to na pewno nie przez ten miecz.
	AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_03"); //Nie zamieni? or??a na ?aden inny. Powiedz Foxowi, ?eby si? ju? wi?cej nie trudzi?.
	B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj?? ostrza. Nie uda?o mi si? go przekona? by wzi?? miecz. No c??, lepiej na razie nie wraca? do Foxa...");
>>>>>>> Stashed changes
	B_StopProcessInfos(self);
   
   Log_SetTopicStatus	(CH3_RBL_DelivWeapon, LOG_FAILED);
};

//*********************************

INSTANCE DIA_Cavalorn_KiraAfter (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 53;
	condition		= DIA_Cavalorn_KiraAfter_Condition;
	information		= DIA_Cavalorn_KiraAfter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia?em z Kir?."; 
};

FUNC INT DIA_Cavalorn_KiraAfter_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_Help))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_KiraAfter_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_01"); //Rozmawia?em z Kir?.
	AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_02"); //Pomo?e nam?
   
	if (kira_help == 1)
	{
		B_GiveXP(500);
		AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_03"); //Tak, ?owcy troli uderz? na ty?y stra?nik?w. 
		AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_04"); //?wietna robota!
		AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_05"); //Zrobili?my ju? prawie wszystko, aby przygotowa? si? do odparcia ataku.

		B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn prawie podskakiwa? z rado?ci, kiedy dowiedzia? si?, ?e Kira i ?owcy uderz? na stra?nik?w.");
	}
	else
	{
		AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_08"); //Kira nie da?a si? przekona?...
		AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_09"); //Niech to szlag trafi! Bardzo liczy?em na pomoc ?owc?w.
		AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_10"); //No nic, musimy przetrzyma? atak bez ich wsparcia.
		
		B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn by? bardzo zawiedziony, kiedy dowiedzia? si?, ?e Kira i ?owcy nam nie pomog?.");
	};
   
   AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_11"); //Wracaj do swoich obowi?zk?w i... uwa?aj na siebie.
	AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_12"); //'Uwa?aj na siebie' to moje drugie imi?. Bywaj.
      
	B_ExchangeRoutine(ratford,"PREATTACK");
	B_StopProcessInfos(self);
};

/************************************

SPY STORY

*************************************/

INSTANCE DIA_Cavalorn_Spy (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 32;
	condition		= DIA_Cavalorn_Spy_Condition;
	information		= DIA_Cavalorn_Spy_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_Spy_Condition()
{
	if (spy_count == 13)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Spy_Info()
{
	spy_count = spy_count + 1;//14
   
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_01"); //S?ysza?em, ?e sporo wypytywa?e? w obozie. 
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_02"); //Obawiam si? jednak, ?e za bardzo rzucasz si? w oczy.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_03"); //Czego si? dowiedzia?e??
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_04"); //Prawie ka?dy z twoich ludzi ma co? do ukrycia. Ci??ko b?dzie znale?? tego w?a?ciwego.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_05"); //Mo?e ja Ci pomog?, znam ich do?? dobrze. M?w.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_06"); //?wistak co? ukrywa. Zdradzi? tylko, ?e wszed? w jaki? uk?ad z kim? ze Starego Obozu i teraz p?aci za to z nawi?zk?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_07"); //Jego mo?esz skre?li?. ?wistak nadal ma w Starym Obozie dobrych znajomych.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_08"); //To dzi?ki niemu informacje od naszego cz?owieka trafiaj? tam, gdzie trzeba.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_09"); //M?wi?c o tym uk?adzie, mia? na my?li mnie i naszego informatora. M?w dalej.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_10"); //Ratford twierdzi, ?e nie ka?dy staje si? tym, kim chcia?by by?. Jednak w jego spojrzeniu jest co?... smutnego.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_11"); //Wygl?da, jakby co? go z?ama?o.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_12"); //To co teraz powiem, musi zosta? mi?dzy nami. Rozumiesz?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_13"); //Ratford nie zawsze by? my?liwym. 
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_14"); //Nie trafi? te? do Kolonii sam. Po jakim? czasie stan?? przed wyborem.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_15"); //Jego towarzysz wybra? inn? drog?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_16"); //Kiedy ponownie si? spotkali, by?a mi?dzy nimi tylko stal.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_17"); //Ratford chcia? umrze?, niestety bogowie lubi? z nas drwi?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_18"); //Po tym incydencie trafi? tutaj. My?l?, ?e szuka? spokoju, zapomnienia i... zrozumienia.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_19"); //Mam nadziej?, ?e to znalaz?...
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_20"); //Z tego co powiedzia?e? wynika, ?e Ratford i jego towarzysz do??czyli do r??nych oboz?w.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_21"); //Id? o zak?ad, ?e by? to Stary i Nowy Ob?z, najzacieklejsi wrogowie.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_22"); //I tak przyja?? sko?czy?a si? na ostrzu miecza... Teraz rozumiem, sk?d w jego spojrzeniu ta smuga cienia.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_23"); //Wystarczy ju? o tym. Kto jest nast?pny?
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_24"); //Drax. Jest jaki? nieobecny, roztargniony. M?wi? co? o krwi i ogniu.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_25"); //Drax to prosty cz?owiek, ca?e ?ycie walczy?. Widzisz, stal hartuje si? w ogniu.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_26"); //Ka?dy z nas przeczuwa kres swych dni. My?l?, ?e to w?a?nie m?ci mu my?li.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_27"); //Ale mog? si? myli?. M?w dalej.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_28"); //Quentin. On ci?gle walczy, nawet z w?asnym cieniem. Na co? si? szykuje.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_29"); //Nie znam go dobrze. To wojownik, podobny do Ratforda czy Draxa. Mimo to, wyczuwam w nim niepok?j.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_30"); //Kiedy? by? bandyt?, kt?ry nie przebiera? w ?rodkach. Teraz pr?buje zag?uszy? wyrzuty sumienia za pomoc? miecza.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_31"); //My?l?, ?e do??czy? do nas, ?eby w jaki? spos?b odkupi? dawne winy.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_32"); //A co my?lisz o Aidanie? Troch? przypomina cieniostwora, chadza w?asnymi ?cie?kami i woli samotno??.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_33"); //W ko?cu to my?liwy. Nie wiem, za co trafi? do Kolonii, ale ciesz? si?, ?e jest po naszej stronie.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_34"); //Co do tych ?cie?ek... Mo?e natkn?? si? na co?, czego wola?by nie ogl?da?. 
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_35"); //W ko?cu jeste?my w Kolonii Karnej, tutaj nawet zatwardziali mordercy si? ?ami?.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_36"); //Mo?liwe.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_37"); //Nic nie wydoby?em od Abla.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_38"); //To mnie akurat nie dziwi. Abel jest prosty jak jego miecz.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_39"); //Nie ufa nikomu, ale nie oczekuje te? niczego od innych.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_40"); //Nie nadaje si? na szpiega, poza tym ci?gle pilnuje bramy.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_41"); //Zauwa?y?bym, gdyby co? kombinowa?.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_42"); //Zastanawia mnie Fisk. By? w Starym Obozie kim?, zna? magnat?w. Dlaczego trafi? tutaj?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_43"); //Fisk popad? w nie?aski Gomeza i nie mia? wyboru.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_44"); //Jak to si? sta?o?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_45"); //Fisk sprzedawa? bro? w Starym Obozie. Handlowa? te? z pewnym skaza?cem, kt?ry niewiele przed Wami trafi? do Kolonii.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_46"); //Po jakim? czasie ten skazaniec sta? si? wrzodem na dupie Gomeza i zarazem persona non grata w Starym Obozie.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_47"); //O kim m?wisz?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_48"); //O kim?, kto sporo namiesza? w uk?adzie si? w Kolonii. Mo?e kiedy? go spotkasz.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_49"); //Ale co ma do tego Fisk?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_50"); //Gomez w swoich urojeniach ubzdura? sobie, ?e ten skazaniec dzia?a? w porozumieniu z Fiskiem.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_51"); //Gomez zniszczy? prawie wszystkich ludzi ze Starego Obozu, kt?rzy zadawali si? z tym skaza?cem.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_52"); //Fisk nie jest idiot?, powiedzmy, ?e wybra? mniejsze z?o i tak znalaz? si? tutaj.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_53"); //Kogo masz jeszcze na li?cie?
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_54"); //R?czka to zarozumia?y gnojek. Nie ufam mu.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_55"); //Ja te?, w ko?cu to z?odziej. I do tego dobry.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_56"); //Ale mia? pecha. Jako jeden z kilku innych wp?ywowych cieni popar? skaza?ca, o kt?rym ju? wspomnia?em.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_57"); //Niech zgadn?, musia? znikn?? ze Starego Obozu?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_58"); //W rzeczy samej.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_59"); //Hmm, ta spirala nienawi?ci Gomeza okr?ca si? wok?? jednego skaza?ca. Ciekawe.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_60"); //Tu chodzi te? o ura?on? dum?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_61"); //Ten skazaniec splun?? Gomezowi w twarz, a takich obelg si? nie zapomina.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_62"); //Kontynuuj.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_63"); //Co powiesz o Snafie? Dobry kucharz w Kolonii jest na wag? rudy.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_64"); //Trafnie to uj??e? - dobry.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_65"); //A co Snaf ?le gotuje?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_66"); //Nie powiedzia?em, ?e ?le, po prostu inaczej.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_67"); //A do tego ma do?? specyficzne poczucie humoru. Szczeg?lnie dobrze przekonali si? o tym stra?nicy, kiedy zjedli zup? ze szczur?w my?l?c, ?e to myrta?ski gulasz, he, he.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_68"); //Niestety, danie trafi?o te? na st?? magnat?w i Snaf wola? nie czeka? na reakcj? Gomeza, Kruka czy Bartholo.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_69"); //Rozumiem. 
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_70"); //Tony mnie tu przyprowadzi?, widzia?em, jak walczy? ze stra?nikami.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_71"); //Mimo to nie powiedzia? mi ca?ej prawdy. Wed?ug niego Stary Ob?z to banda socjopat?w.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_72"); //Hmm. Tony jest tu od niedawna. Nie mam co do niego zastrze?e?, ale niepokoj?ce sygna?y od mojego cz?owieka zacz??y si? w tym samy okresie, kiedy do??czy? do nas Tony.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_73"); //Co chcesz przez to powiedzie??
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_74"); //Zupe?nie nic, to tylko przypuszczenia. Nie musisz dawa? im wiary.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_75"); //A Vam? Co o nim powiesz?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_76"); //Jest pracowity, nie lubi, jak kto? m?wi mu, co ma robi?. Do tego nigdy nie oddala si? z obozu.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_77"); //W?tpi?, ?e m?g?by nas zdradzi?.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_78"); //Czasami najciemniej jest pod latarni?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_79"); //Mo?e i masz racj?. Zosta? kto? jeszcze?
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_80"); //A co z Foxem? M?wi?, ?e trafi? tu, bo nie mia? wyboru.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_81"); //Fox by? kurierem mag?w. Kiedy Corristo i reszta mag?w ognia sko?czy?a z poder?ni?tymi gard?ami, straci? zaj?cie i oczywi?cie nie mia? ju? czego szuka? w Starym Obozie.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_82"); //W Nowym te? nie mia? zbyt wielu przyjaci??, wybra? wi?c nas.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_83"); //Nie jest mo?e zbyt towarzyski, ale na sw?j spos?b jest uczciwy i sprawiedliwy.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_84"); //Dlatego zosta? kwatermistrzem.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_85"); //To ju? wszyscy?
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_86"); //Chyba tak. I co teraz?
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_87"); //Teraz musisz si? zastanowi? nad tym, co powiedzia?em. Kto? z tych, kt?rych wymieni?e? jest zdrajc?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_88"); //Jeszcze raz pogadaj z ch?opakami, wiesz ju? o nich du?o wi?cej. Wykorzystaj t? wiedz?.
	AI_Output (self, other,"DIA_Cavalorn_Spy_12_89"); //Mo?e kto? si? zdradzi, wygada, sk?amie. Musisz spr?bowa?.
	AI_Output (other, self,"DIA_Cavalorn_Spy_15_90"); //W porz?dku. Zobaczymy, czego dowiem si? tym razem.

	B_LogEntry(CH2_Rbl_Spy, "To by?a cholernie d?uga rozmowa. Dowiedzia?em si? sporo o najwa?niejszych osobach w obozie, teraz musz? porozmawia? z nimi jeszcze raz. Mo?e dowiem si? w ko?cu czego? konkretnego.");
};

var int cav_spy;

INSTANCE DIA_Cavalorn_Spy1 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 31;
	condition		= DIA_Cavalorn_Spy1_Condition;
	information		= DIA_Cavalorn_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pewne poszlaki."; 
};

FUNC INT DIA_Cavalorn_Spy1_Condition()
{
	if (tony_spy == 13)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Spy1_Info()
{
	tony_spy = tony_spy + 1;//14
	AI_Output (other, self, "DIA_Cavalorn_Spy1_15_01"); //Mam pewne poszlaki.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_12_02"); //M?w.
	Info_ClearChoices (DIA_Cavalorn_Spy1);
	Info_AddChoice (DIA_Cavalorn_Spy1, "Moim zdaniem to R?czka.", DIA_Cavalorn_Spy1_Fingers);
	Info_AddChoice (DIA_Cavalorn_Spy1, "Postawi?bym ca?? rud? na Toniego.", DIA_Cavalorn_Spy1_Tony);
	Info_AddChoice (DIA_Cavalorn_Spy1, "To Aidan ?mierdzi zdrad?.", DIA_Cavalorn_Spy1_Aidan);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Fingers()
{
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Fingers_15_01"); //Moim zdaniem to R?czka.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_02"); //R?czka? 
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_03"); //Jakie masz dowody?
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Fingers_15_04"); //R?czka to ?wir. Wiem, ?e podpad? Gomezowi, ale to tak?e ?wiadczy przeciwko niemu.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_05"); //Nie wydaje mi si?.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_06"); //Znam R?czk? i wiem na co go sta?.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_07"); //Niewa?ne. Zapomnij o ca?ej sprawie. Sam to jako? rozwi???.

	B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_FAILED);
	B_LogEntry(CH2_Rbl_Spy, "Powiedzia?em Cavalornowi, ?e zdrajc? jest R?czka, ale co? mi nie uwierzy?. W ka?dym razie problem szukania zdrajcy mam ju? z g?owy.");
	Info_ClearChoices (DIA_Cavalorn_Spy1);	
	B_StopProcessInfos( self );
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Aidan()
{
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Aidan_15_01"); //To Aidan ?mierdzi zdrad?.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_02"); //Aidan? Niby dlaczego?
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Aidan_15_03"); //Wa??sa si? nocami, wraca nad ranem. Nie wiadomo, co naprawd? robi...
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_04"); //Przecie? ju? o tym rozmawiali?my... Aidan udowodni?, ?e zale?y mu na obozie.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_05"); //Niewa?ne. Zapomnij o ca?ej sprawie. Sam jako? to rozwi???.

	B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_FAILED);
	B_LogEntry(CH2_Rbl_Spy, "Powiedzia?em Cavalornowi, ?e zdrajc? jest Aidan, ale co? mi nie uwierzy?. W ka?dym razie problem szukania zdrajcy mam ju? z g?owy.");
	Info_ClearChoices (DIA_Cavalorn_Spy1);	
	B_StopProcessInfos( self );
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Tony()
{
	tony_spy = tony_spy + 1;//15
   
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_01"); //Postawi?bym ca?? rud? na Toniego.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_02"); //Dlaczego akurat on?
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_03"); //Jego historyjki nie trzymaj? si? kupy.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_04"); //Do tego jako jedyny wzbudza tak?e nieufno?? innych. Kilka razy opu?ci? ob?z, my?l?c, ?e nikt go nie widzi.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_05"); //To wszystko?
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_06"); //Nie. Przeb?kiwa? co? o tym, ?e Szakal to jego przyjaciel. Odszed? ze Starego obozu bez konkretnych powod?w.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_07"); //No i to nasze spotkanie...
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_08"); //Tak?
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_09"); //Kiedy zobaczy?em go po raz pierwszy, sta? w otoczeniu stra?nik?w.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_10"); //Dopiero teraz u?wiadomi?em sobie, ?e ?aden stra?nik nie trzyma? wyci?gni?tego miecza.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_11"); //Da?bym sobie uci?? wszystkie cz?onki, ?e oni tam rozmawiali.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_12"); //Dopiero na nasz widok Tony podni?s? larum. Wybili?my stra?nik?w, a on powiedzia?, ?e by? ich wi??niem.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_13"); //To nam w zupe?no?ci wystarczy?o. Potem przyprowadzi? nas do obozu.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_14"); //Brzmi przekonywuj?co...
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_15"); //Co teraz zrobimy?
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_16"); //Zdob?d? zaufanie Toniego. Niech doprowadzi Ci? do tego, komu sk?ada meldunki.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_17"); //Musimy zlikwidowa? ca?? siatk?. Tony to tylko informator, ciekaw jestem z kim i gdzie si? spotyka.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_18"); //Daj? Ci na to trzy dni. Do tego czasu musisz ustali?, z kim i gdzie spotyka si? Tony.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_19"); //Zrobi? co w mojej mocy.
	AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_20"); //I pami?taj, ?e mo?esz polega? tylko na sobie. Nikt z obozu nie wie o Twoim zadaniu. B?d? ostro?ny.
	AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_21"); //B?d?, bywaj.
	
   cav_spy = B_SetDayTolerance()+3;
	B_LogEntry(CH2_Rbl_Spy, "Przekona?em Cavalorna, ?e zdrajc? jest Tony. Musz? zdoby? jego zaufanie i dowiedzie? si?, komu przekazuje informacje. Musz? jak najszybciej porozmawia? z Tonym. Cavalorn da? mi 3 dni na rozwi?zanie tej zagadki.");
	Info_ClearChoices (DIA_Cavalorn_Spy1);	
	B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Spy11 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 34;
	condition		= DIA_Cavalorn_Spy11_Condition;
	information		= DIA_Cavalorn_Spy11_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam Toniego!"; 
};

FUNC INT DIA_Cavalorn_Spy11_Condition()
{
	if (tony_spy == 16)&&(cav_spy >= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cavalorn_Spy11_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Spy11_15_01"); //Mam Toniego!
	AI_Output (self, other,"DIA_Cavalorn_Spy11_12_02"); //Przyzna? si??
	AI_Output (other, self, "DIA_Cavalorn_Spy11_15_03"); //Poniek?d, tak. Spotkam si? z nim po zmierzchu. Wtedy dowiem si? wi?cej.
	AI_Output (self, other,"DIA_Cavalorn_Spy11_12_04"); //?mierdzi mi to pu?apk?.
	AI_Output (other, self, "DIA_Cavalorn_Spy11_15_05"); //Wiem, ale b?d? ostro?ny. Poza tym nie mam wyboru. To mo?e by? jedyna szansa, ?eby dowiedzie? si? czego? wi?cej.
	AI_Output (self, other,"DIA_Cavalorn_Spy11_12_06"); //Masz racj?, ale miej oczy szeroko otwarte. Nie nara?aj si? niepotrzebnie.
	AI_Output (other, self, "DIA_Cavalorn_Spy11_15_07"); //Poradz? sobie, bywaj.
	B_LogEntry(CH2_Rbl_Spy, "Powiedzia?em Cavalornowi o spotkaniu z Tonim. Cavalorn przestrzeg? mnie, ?e to mo?e by? pu?apka. Musz? zaryzykowa?, w ko?cu wychodzi?em ca?o z gorszych opresji.");
};

INSTANCE DIA_Cavalorn_SpyEnd (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 57;
	condition		= DIA_Cavalorn_SpyEnd_Condition;
	information		= DIA_Cavalorn_SpyEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_SpyEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd6))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cavalorn_SpyEnd_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_01"); //?yjesz! S?ysza?em, co si? sta?o.
	AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_02"); //Ch?opaki troch? si? zap?dzili. Na szcz??cie jako? wygrzeba?em si? z G??bi.
	
   if (Npc_KnowsInfo (hero, DIA_Spider_Escape))
	{
		AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_03"); //Czasami i w s?owach szale?ca mo?na odnale?? ziarno prawdy...
	};
   
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_04"); //Krew mnie zala?a, kiedy si? dowiedzia?em, co ci idioci zrobili.
	AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_05"); //Quentin i Aidan s? w porz?dku. Wstawili si? za mn?, chcieli poczeka? na ciebie.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_06"); //Wiem. Abel jest przewra?liwiony i wsz?dzie widzi wrog?w. ?wistak to chor?giewka na wietrze, p?jdzie za g?osem wi?kszo?ci.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_07"); //R?czka to idiota, kt?ry a? si? prosi o jaki? wypadek z belk?, kt?ra spadnie mu na g?ow?. 
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_08"); //Ale po Foxie si? tego nie spodziewa?em...
	AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_09"); //W takich chwilach najlepiej wida?, jak potrzebny jest silny przyw?dca.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_10"); //Naprawd? ciesz? si?, ?e Ci? widz?.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_11"); //Dowiedzia?e? si?, kto zabi? Toniego?
	AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_12"); //Nie i pewnie nigdy si? tego nie dowiem, ale na mil? zalatuje mi to Hrabi?.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_13"); //Ten sukinsyn jest naprawd? niebezpieczny. Musimy si? go pozby? i to jak najszybciej.
	AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_14"); //Te? o tym my?la?em. B?d? to mia? na uwadze.
	AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_15"); //Dobra, wystarczy ju? o tym co by?o. 
   
   Create_and_give(ItMiNugget, 200);
   
   AI_Output (self, other, "DIA_Cavalorn_SpyEnd_12_16"); //Przyjmij t? rud?, jako zado??uczynienie za zes?anie do G??bi oraz jako zap?at? za pomoc w szukaniu szpiega.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_19"); //Naprawd? si? ciesz?, ?e widz? ci? w?r?d ?ywych, Rick. Odpocznij troch?, bo wkr?tce pewnie b?d? mia? dla ciebie robot?.
   
   B_LogEntry(CH1_Rbl_Hrabia, "Cavalorn da? mi jasno do zrozumienia, ?e ?mier? Hrabiego bardzo by go ucieszy?a. Musz? si? nad tym solidnie zastanowi?.");
};

INSTANCE DIA_Cavalorn_NCRebel (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 57;
	condition		= DIA_Cavalorn_NCRebel_Condition;
	information		= DIA_Cavalorn_NCRebel_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

func int DIA_Cavalorn_NCRebel_Condition()
{  
   if (Npc_KnowsInfo (hero, DIA_RATFORD_WhatNext))
   {
      return 1;
   };
};

func void DIA_Cavalorn_NCRebel_Info()
{
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_00"); //Widz?, ?e jeste? ju? gotowy na kolejne zadanie.
   AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_01"); //Co tym razem?
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_02"); //Po odparciu ataku stra?nik?w, Gomez wzmocni? obron? Starego Obozu. Urt przes?a? mi raport, w kt?rym twierdzi, ?e przygotowania jeszcze bardziej si? przeci?gn?.
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_03"); //Napisa? te?, ?e sytuacja w Nowym Obozie staje si? do?? 'niestabilna'.
	AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_04"); //Co si? dzieje?
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_05"); //Podobno szykuje si? tam ma?a rebelia.
	AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_06"); //Ciekawe...
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_07"); //Dlatego chcia?bym, ?eby? si? tam dyskretnie rozejrza?.
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_08"); //Skontaktuj si? z buntownikami. Musimy im pom?c w puczu.
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_09"); //Wtedy b?dziemy trzyma? Gomeza za jaja.
	AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_10"); //Rozumiem. Wr?c?, kiedy dowiem si? czego? wi?cej.
	AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_11"); //Powodzenia, przyjacielu.

	Log_CreateTopic(CH4_RBL_NCRebel, LOG_MISSION);
	Log_SetTopicStatus(CH4_RBL_NCRebel, LOG_RUNNING);
	B_LogEntry(CH4_RBL_NCRebel, "W Nowym Obozie szykuje si? rebelia. Cavalorn poprosi? mnie, ?ebym rozezna? si? w sytuacji. Czas troch? rozprostowa? ko?ci...");
   
   B_Kapitelwechsel(4);
};

/*****************************

Chapter 6

*****************************/

INSTANCE DIA_Cavalorn_NCFinish (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 60;
	condition		= DIA_Cavalorn_NCFinish_Condition;
	information		= DIA_Cavalorn_NCFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wracam z Nowego Obozu."; 
};

FUNC INT DIA_Cavalorn_NCFinish_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Lee_AllCompleated))
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_NCFinish_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_01"); //Wracam z Nowego Obozu.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_02"); //Jak wygl?da sytuacja?
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_03"); //Jest stabilna. Lee panuje nad wszystkim.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_04"); //Dobrze to s?ysze?. A jeszcze lepiej, ?e ju? wr?ci?e?.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_05"); //Nowe k?opoty?
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_06"); //Raczej stare w nowej ods?onie. Nadszed? czas, aby ostatecznie rozliczy? si? z Gomezem.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_07"); //Nareszcie. Od czego zaczniemy?
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_08"); //Musisz znowu rozejrze? si? w Starym Obozie. Kilka dni temu urwa? si? kontakt z Urtem i Diego.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_09"); //Obawiam si? najgorszego.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_10"); //Lepiej ?eby? si? myli?. Urt ?wietnie zorganizowa? dywersj?, a Diego mia? wp?yn?? na kopaczy i cienie. Je?eli ci dwaj wypadli z gry, to atak na Stary Ob?z bardziej nas wykrwawi.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_11"); //Wiem o tym, dlatego ciesz? si? na Tw?j widok. Musisz odnale?? Urta i Diego.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_12"); //Nie rozpoczniemy ataku, zanim nie dowiem si?, co si? tam wyprawia. Zbyt wielu dobrych ludzi mog?oby zgin??...
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_13"); //Dobra, zrobi? to. Ale pod jednym warunkiem.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_14"); //Ty stawiasz warunki? To ciekawe...
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_15"); //Wszystko co znajd? w komnacie Gomeza nale?y do mnie.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_16"); //Wyrachowany do ko?ca. Niech b?dzie, mi zale?y tylko na g?owie tego sukinsyna. Reszta jest Twoja.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_17"); //To chcia?em us?ysze?. Jak dowiem si? czego? wi?cej, natychmiast dam Ci zna?.
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_18"); //Porozmawiaj jeszcze z Ratfordem, zdaje si?, ?e on te? si? za Tob? st?skni?.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_19"); //Odpowiedzialno?? za ten ob?z zaczyna mi ju? ci??y?. Za d?ugo przebywam na suchym l?dzie...
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_20"); //Ju? nied?ugo Rick wszystko si? zmieni. Wtedy ka?dy z nas p?jdzie w?asn? drog?.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_21"); //Nie zrozum mnie ?le. Wierz?, ?e nic nie dzieje si? bez powodu, ale to nie miejsce dla mnie. 
	AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_22"); //Ani dla wi?kszo?ci z nas. Zr?b, co do Ciebie nale?y, a wszyscy st?d znikniemy.
	AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_23"); //W porz?dku, zobacz?, co da si? zrobi?.

	Log_SetTopicStatus(CH4_RBL_NCRebel, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_NCRebel, "Sytuacja w Nowym Obozie znowu jest stabilna. Czas zaj?? si? czym? innym.");

	Log_CreateTopic(CH6_RBL_Recognise, LOG_MISSION);
	Log_SetTopicStatus(CH6_RBL_Recognise, LOG_RUNNING);
	B_LogEntry(CH6_RBL_Recognise, "Zabawa rozpoczyna si? od pocz?tku. Musz? dowiedzie? si?, co s?ycha? u Urta i Diego.");
		var C_NPC diego; diego = Hlp_GetNpc(PC_Thief);
			Npc_ExchangeRoutine	(diego, "JAIL");
};

INSTANCE DIA_Cavalorn_OCFinish (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 61;
	condition		= DIA_Cavalorn_OCFinish_Condition;
	information		= DIA_Cavalorn_OCFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wracam ze Starego Obozu."; 
};

FUNC INT DIA_Cavalorn_OCFinish_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_NCFinish))&&(Npc_KnowsInfo (hero,Info_Diego_Prison))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_OCFinish_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_01"); //Wracam ze Starego Obozu.
	AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_02"); //Jak wygl?da sytuacja?
	AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_03"); //Napi?ta i niestabilna. Uda?o mi si? uwolni? Diego, ale nie mo?emy by? pewni cieni ani kopaczy.
	AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_04"); //Co si? sta?o?
	AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_05"); //Urt okaza? si? zdrajc?. Stra?nicy przygotowali si? na atak, ale nie zauwa?y?em ?adnej zasadzki w tunelu.
	AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_06"); //Nadszed? Czas Zap?aty. Powiedz Ratfordowi, ?e jeste?my gotowi do ataku na Stary Ob?z.
	AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_07"); //W?a?nie to chcia?em us?ysze?!
	Log_SetTopicStatus(CH6_RBL_Recognise, LOG_SUCCESS);
	B_LogEntry(CH6_RBL_Recognise, "Rozpoznanie sko?czone, ruszamy na Stary Ob?z!");
};



/*****************************
HIDDEOUT1 - wejscie w jaskini
HIDDEOUT10 - wyj?cie w piwnicach
******************************/


//********************************************************

INSTANCE DIA_Cavalorn_Tunel (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 62;
	condition		= DIA_Cavalorn_Tunel_Condition;
	information		= DIA_Cavalorn_Tunel_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Tunel_Condition()
{

	if (Npc_KnowsInfo (hero, DIA_Cavalorn_OCFinish))&&(Npc_KnowsInfo (hero,DIA_RATFORD_PayDay))&&(Npc_KnowsInfo (hero, DIA_Angus_KillGuards))
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_Tunel_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_00"); //W ko?cu jeste?!
	AI_Output (other, self, "DIA_Cavalorn_Tunel_15_01"); //Ruszamy?
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_02"); //Tak, ale w ma?ej grupie, tak b?dzie bezpieczniej gdyby przygotowali zasadzk?.
	AI_Output (other, self, "DIA_Cavalorn_Tunel_15_03"); //Wcze?niej tunel by? 'czysty'.
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_04"); //Mo?liwe, ale stra?nicy nie s? idiotami. Mogli ci? obserwowa?.
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_05"); //Ty Rick i twoi ludzie p?jdziecie ze mn? w awangardzie. 
	AI_TurnToNpc(self, ratford);
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_06"); //Ratford poprowadzisz reszt? po stu uderzeniach serca.
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_07"); //Jeste? got?w?
	AI_Output (other, self, "DIA_Cavalorn_Tunel_15_08"); //Zawsze i wsz?dzie. Prowad?.
	AI_Output (self, other,"DIA_Cavalorn_Tunel_12_09"); //Za mn?!
	
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"HIDDOUT");

	B_LogEntry(CH6_RBL_PayDay, "Podzielili?my si?. Razem z Cavalornem i piratami sprawdzimy tunel. Ratford z reszt? wyrusz? za nami.");
	B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_Tunel1 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 62;
	condition		= DIA_Cavalorn_Tunel1_Condition;
	information		= DIA_Cavalorn_Tunel1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Tunel1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Tunel))&&(Npc_GetDistToWP (self,"HIDDEOUT1") < 500)
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_Tunel1_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"DIA_Cavalorn_Tunel1_12_00"); //Id? pierwszy, b?dziemy tu? za tob?!
	
	B_StopProcessInfos(self);
   
   B_Dungeon_Trap();
};

//********************************************************

INSTANCE DIA_Cavalorn_TunelTrap (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 63;
	condition		= DIA_Cavalorn_TunelTrap_Condition;
	information		= DIA_Cavalorn_TunelTrap_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_TunelTrap_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Tunel1))&&(Npc_GetDistToWP (self,"HIDDEOUT10") < 500)
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_TunelTrap_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_01"); //Jednak mia?em nosa. Czeka na nas komitet powitalny.
	AI_Output (self, other, "DIA_Cavalorn_TunelTrapAfter_12_02"); //Zr?bmy z nich ?liczn? siekank?!
	
	//doda? rebeliant?w do SO! - w sumie nie trzeba, oni i tak szli za dickiem
	
	B_StopProcessInfos(self);
   
   B_Trap_Hostile_grd();
};

//********************************************************

INSTANCE DIA_Cavalorn_TunelTrapAfter (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 63;
	condition		= DIA_Cavalorn_TunelTrapAfter_Condition;
	information		= DIA_Cavalorn_TunelTrapAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_TunelTrapAfter_Condition()
{
	var C_NPC grd1; grd1 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC grd2; grd2 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC grd3; grd3 = Hlp_GetNpc(Grd_220_Gardist);
	var C_NPC grd4; grd4 = Hlp_GetNpc(Grd_221_Gardist);
	var C_NPC grd5; grd5 = Hlp_GetNpc(Grd_222_Gardist);
	var C_NPC grd6; grd6 = Hlp_GetNpc(Grd_223_Gardist);
	var C_NPC grd7; grd7 = Hlp_GetNpc(Grd_225_Gardist);	
   
	if (Npc_IsDead(grd1))&&(Npc_IsDead(grd2))&&(Npc_IsDead(grd3))&&(Npc_IsDead(grd4))&&(Npc_IsDead(grd5))&&(Npc_IsDead(grd6))&&(Npc_IsDead(grd7))
	&&(Npc_KnowsInfo (hero, DIA_Cavalorn_TunelTrap))
	{
		return 1;
	};
};
FUNC VOID DIA_Cavalorn_TunelTrapAfter_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_01"); //Tych mamy z g?owy, teraz musimy przebi? si? do zamku.
	AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_02"); //Za mn?!	
	Npc_ExchangeRoutine(self,"CASTLE");	
	B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_Castle (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 65;
	condition		= DIA_Cavalorn_Castle_Condition;
	information		= DIA_Cavalorn_Castle_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_Castle_Condition()
{
	/****************************
ten wp to ten sam w kt?rym sta? Diego w lochu

****************************/

	if (Npc_KnowsInfo (hero, DIA_Cavalorn_TunelTrapAfter))&&(Npc_GetDistToWP (self,"OCC_MERCS_HALLWAY_FRONT") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Castle_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Cavalorn_Castle_12_01"); //Na pohybel skurwysynom!
	B_LogEntry(CH6_RBL_PayDay, "Ruszyli?my za Cavalornem do zamku.");
	Npc_ExchangeRoutine(self, "CASTLE");
	B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_CastleIn (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 66;
	condition		= DIA_Cavalorn_CastleIn_Condition;
	information		= DIA_Cavalorn_CastleIn_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_CastleIn_Condition()
{

	if (Npc_KnowsInfo (hero,DIA_Cavalorn_Castle))&&(Npc_GetDistToWP (self,"OCC_BARONS_ENTRANCE_DOWNSTAIRS") < 200)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_CastleIn_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Cavalorn_CastleIn_12_01"); //Szybciej, widzia?em jak Gomez znika w podziemiach!
	AI_Output (other, self, "DIA_Cavalorn_CastleIn_15_02"); //Jestem tu? za Tob?!

	B_LogEntry(CH6_RBL_PayDay, "Gomez uciek? do podziemi, idziemy jego tropem.");
	Npc_ExchangeRoutine(self, "CELLAR");
	B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_CastleIn1 (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 66;
	condition		= DIA_Cavalorn_CastleIn1_Condition;
	information		= DIA_Cavalorn_CastleIn1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Cavalorn_CastleIn1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cavalorn_CastleIn))&&(Npc_GetDistToWP (self,"OCC_LADDER_TOP") < 200)
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_CastleIn1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Cavalorn_CastleIn1_12_01"); //Zejd? na d?? i poszukaj przej?cia. My ich zatrzymamy!

	B_LogEntry(CH6_RBL_PayDay, "Gomez uciek? do podziemi, idziemy jego tropem.");
	Npc_ExchangeRoutine(self, "DEFEND");
	
	B_Pirats_Wait();

	B_StopProcessInfos(self);
};

/**********************************

SIDE QUEST

*********************************/

//********************************************************

INSTANCE DIA_Cavalorn_Leaf (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 70;
	condition		= DIA_Cavalorn_Leaf_Condition;
	information		= DIA_Cavalorn_Leaf_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pewien problem z Leafem."; 
};

FUNC INT DIA_Cavalorn_Leaf_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Leaf_StoneHave))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Leaf_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Leaf_15_01"); //Mam pewien problem z Leafem.
	AI_Output (self, other, "DIA_Cavalorn_Leaf_12_02"); //Co tym razem wymy?li??
	AI_Output (other, self, "DIA_Cavalorn_Leaf_15_03"); //(Rick streszcza histori? z kamieniem filozoficznym)
	AI_Output (self, other, "DIA_Cavalorn_Leaf_12_04"); //I dobrze, niech ?pi. B?dzie przynajmniej troch? spokoju.
	AI_Output (other, self, "DIA_Cavalorn_Leaf_15_05"); //W takim razie...
	AI_Output (self, other, "DIA_Cavalorn_Leaf_12_06"); //Zaczekaj. Niestety potrzebuj? ka?dego cz?owieka, musimy co? z tym zrobi?.
	AI_Output (self, other, "DIA_Cavalorn_Leaf_12_07"); //Porozmawiaj z Quentinem. Obi?o mi si? o uszy, ?e kiedy? by? pomocnikiem alchemika. Mo?e zna jaki? specyfik, kt?ry pomo?e Leafowi.
	AI_Output (other, self, "DIA_Cavalorn_Leaf_15_08"); //M?wimy o tym samym Quentinie?
	AI_Output (self, other, "DIA_Cavalorn_Leaf_12_09"); //Ludzie nie rodz? si? skaza?cami. Bywaj.
	B_LogEntry(CH1_RBL_Stone, "Cavalorn poradzi? mi, abym porozmawia? z Quentinem, kt?ry kiedy? by? pomocnikiem alchemika. Mo?e on zna jaki? specyfik, kt?ry pomo?e Leafowi.");
};

//********************************************************

INSTANCE DIA_Cavalorn_Kuva (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 71;
	condition		= DIA_Cavalorn_Kuva_Condition;
	information		= DIA_Cavalorn_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znasz kogo?, kto potrafi warzy? mikstury?"; 
};

FUNC INT DIA_Cavalorn_Kuva_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kuva_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_Kuva_Info()
{
	AI_Output (other, self, "DIA_Cavalorn_Kuva_15_01"); //Znasz kogo?, kto potrafi warzy? mikstury?
	AI_Output (self, other, "DIA_Cavalorn_Kuva_12_02"); //Milten, mo?e Quentin. Aha i Nabil, czasami si? tutaj kr?ci.
	AI_Output (self, other, "DIA_Cavalorn_Kuva_12_03"); //Dlaczego pytasz?
	AI_Output (other, self, "DIA_Cavalorn_Kuva_15_04"); //Mam podejrzany specyfik, kt?ry mo?e by? trucizn? i musz? dowiedzie? si? czyja to robota.
	AI_Output (self, other, "DIA_Cavalorn_Kuva_12_05"); //W takim razie poszukaj Nabila. To typ spod ciemnej gwiazdy. 
	AI_Output (self, other, "DIA_Cavalorn_Kuva_12_06"); //Czasami przychodzi do obozu i sprzedaje r??ne mikstury. Z tego co wiem, potrafi warzy? trucizny. Nie wiem, gdzie obozuje, to skryty cz?owiek.
	AI_Output (other, self, "DIA_Cavalorn_Kuva_15_07"); //Dzi?ki, Cavalorn. Bardzo mi pomog?e?.

	B_LogEntry(CH1_RBL_Cage, "Cavalorn powiedzia?, ?e tylko Nabil m?g?by uwarzy? trucizn?. Musz? go odnale??.");
};

INSTANCE DIA_Cavalorn_CrimeAgain (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 3;
	condition		= DIA_Cavalorn_CrimeAgain_Condition;
	information		= DIA_Cavalorn_CrimeAgain_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_CrimeAgain_Condition()
{
	if (Global_Crime_goldToPay)&&(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID DIA_Cavalorn_CrimeAgain_Info()
{
	AI_Output (self, other,"DIA_Cavalorn_CrimeAgain_12_01"); //Przyszed?e? zap?aci? kar??				
	
	B_Say_Gold (self, other,GOLDPENALTY_MURDER+GOLDPENALTY_DEFEAT+GOLDPENALTY_THEFT);			
	
	Info_ClearChoices (DIA_Cavalorn_CrimeAgain);
	if(npc_hasitems(hero,itminugget)>=Global_Crime_goldToPay)
	{
		Info_AddChoice (DIA_Cavalorn_CrimeAgain, "Zap?ac? kar?.", DIA_Cavalorn_Crime_Yes);
	};
	Info_AddChoice (DIA_Cavalorn_CrimeAgain, "Nie mam tyle rudy!", DIA_Cavalorn_Crime_No);
};

INSTANCE DIA_Cavalorn_Crime (C_INFO)
{
	npc				= HUN_336_CAVALORN;
	//nr				= 3;
	condition		= DIA_Cavalorn_Crime_Condition;
	information		= DIA_Cavalorn_Crime_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Cavalorn_Crime_Condition()
{

	if (GOLDPENALTY_MURDER+GOLDPENALTY_DEFEAT+GOLDPENALTY_THEFT)&&(Global_Crime_goldToPay==0)//>0
	{
		return 1;
	};

};
FUNC VOID DIA_Cavalorn_Crime_Info()
{
	if (!Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		AI_Output (self, other, "DIA_Cavalorn_Crime_12_01"); //Jeszcze z Tob? nie rozmawia?em, a ju? s?ysz? o przest?pstwach kt?re pope?ni?e?!		
	}
	if(GOLDPENALTY_MURDER)
	{
		AI_Output (self, other,"DIA_Cavalorn_Crime_12_02"); //Zamordowa?e? jednego z cz?onk?w obozu, byli ?wiadkowie.		
	};
	//DEFEAT
	if(GOLDPENALTY_MURDER)&&(GOLDPENALTY_DEFEAT)
	{
		AI_Output (self, other,"DIA_Cavalorn_Crime_12_03"); //Dosz?y mnie s?uchy, ?e kogo? pobi?e?.	
		if(GOLDPENALTY_DEFEAT>75)
		{
			AI_Output (self, other,"DIA_Cavalorn_Crime_12_04"); //S? ?wiadkowie.
		};	
	}
	else if(GOLDPENALTY_DEFEAT)
	{
		AI_Output (self, other,"DIA_Cavalorn_Crime_12_05"); //S?ysza?em, ?e kogo? pobi?e?.	
		if(GOLDPENALTY_DEFEAT>75)
		{
			AI_Output (self, other,"DIA_Cavalorn_Crime_12_04"); //S? ?wiadkowie.
		};		
	};
	//THEFT	
	if((GOLDPENALTY_MURDER)||(GOLDPENALTY_DEFEAT))&&(GOLDPENALTY_THEFT)
	{
		AI_Output (self, other,"DIA_Cavalorn_Crime_12_07"); //Na domiar z?ego, ukrad?e? przedmioty nale??ce do mieszka?c?w obozu.	
		if(GOLDPENALTY_THEFT>25)
		{
			AI_Output (self, other,"DIA_Cavalorn_Crime_12_08"); //Donios?o mi o tym kilka os?b.
		};	
	}
	else if(GOLDPENALTY_THEFT)
	{
		AI_Output (self, other,"DIA_Cavalorn_Crime_12_09"); //Ukrad?e? przedmioty nale??ce do mieszka?c?w obozu.				
	};	
	
	AI_Output (self, other,"DIA_Cavalorn_Crime_12_10"); //Nie mo?emy tolerowa? przest?pstwa w obozie.				
	AI_Output (self, other,"DIA_Cavalorn_Crime_12_11"); //Fakt, ?e jeste? skaza?cem czy piratem to ?adne usprawiedliwienie.				
	AI_Output (self, other,"DIA_Cavalorn_Crime_12_12"); //Musz? Cie ukara?, ku przestrodze innych.				
	AI_Output (self, other,"DIA_Cavalorn_Crime_12_13"); //Je?eli chcesz oczy?ci? swoje imi?, b?dziesz musia? zap?aci?.				
	AI_Output (self, other,"DIA_Cavalorn_Crime_12_14"); //Kara wynosi...	
	B_Say_Gold (self, other,GOLDPENALTY_MURDER+GOLDPENALTY_DEFEAT+GOLDPENALTY_THEFT);			

	Info_ClearChoices (DIA_Cavalorn_Crime);
	if(npc_hasitems(hero,itminugget)>=Global_Crime_goldToPay)
	{
		Info_AddChoice (DIA_Cavalorn_Crime, "Zap?ac? kar?.", DIA_Cavalorn_Crime_Yes);
	};
	Info_AddChoice (DIA_Cavalorn_Crime, "Nie mam tyle rudy!", DIA_Cavalorn_Crime_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_Crime_Yes()
{
	B_GIVEInvItems(other,self,ItMiNugget,Global_Crime_goldToPay);
	Npc_RemoveInvItems(self,ItMiNugget,Global_Crime_goldToPay);
	Global_Crime_goldToPay = 0;
	
	GOLDPENALTY_MURDER = 0;
	GOLDPENALTY_DEFEAT = 0;
	GOLDPENALTY_THEFT  = 0;
	
	AI_Output (other, self, "DIA_Cavalorn_Crime_Yes_15_15"); //Zap?ac? kar?.
	AI_Output (self, other, "DIA_Cavalorn_Crime_Yes_12_16"); //Dobrze wi?c, Twoje imi? zostaje oczyszczone. Przynajmniej na jaki? czas...
	
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_Crime_No()
{
	AI_Output (other, self, "DIA_Cavalorn_Crime_No_15_17"); //Nie mam tyle rudy.
	AI_Output (self, other, "DIA_Cavalorn_Crime_No_12_18"); //Nie b?d? grzeba? Ci po kieszeniach...
	AI_Output (self, other, "DIA_Cavalorn_Crime_No_12_19"); //Dobrze radz?, zap?a? t? rud? jak najszybciej.
	B_StopProcessInfos(self);
};