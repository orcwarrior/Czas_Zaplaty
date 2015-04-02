
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jack_Exit (C_INFO)
{
	npc			= PIR_2612_JACKALLIGATOR;
	nr			= 999;
	condition	= DIA_Jack_Exit_Condition;
	information	= DIA_Jack_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jack_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jack_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Jack_Hello (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 1;
	condition		= DIA_Jack_Hello_Condition;
	information		= DIA_Jack_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jesteœ?"; 
};

FUNC INT DIA_Jack_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Jack_Hello_Info()
{
	AI_Output (other, self, "DIA_Jack_Hello_15_01"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Jack_Hello_12_02"); //Na pewno o mnie s³ysza³eœ.
	AI_Output (self, other, "DIA_Jack_Hello_12_03"); //Jestem Jack Aligator.
	AI_Output (self, other, "DIA_Jack_Hello_12_04"); //Boj¹ siê mnie prawie wszyscy! Jestem najstraszliwszym piratem p³ywaj¹cymi po tych wodach.
	AI_Output (self, other, "DIA_Jack_Hello_12_05"); //Pod wodz¹ kapitana Grega z³upiliœmy wiêcej statków kupieckich, ni¿ jestem w stanie zliczyæ.
	AI_Output (self, other, "DIA_Jack_Hello_12_06"); //Rozmawiasz z ¿yw¹ legend¹, ¿e siê tak wyra¿ê.
	AI_Output (other, self, "DIA_Jack_Hello_15_07"); //Rzeczywiœcie nosisz zbrojê pirata. Albo zerwa³eœ j¹ z jakiœ zw³ok, albo rzeczywiœcie jesteœ jednym z nas.
	AI_Output (self, other, "DIA_Jack_Hello_12_08"); //Nawet w to nie w¹tp, chuderlaku!
	Log_CreateTopic	(CH1_Rbl_Pirates, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Pirates, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Pirates, "Piraci. NajwyraŸniej nie tylko nasz okrêt mia³ pecha. Znalaz³em w Kolonii niejakiego Jacka Aligatora. Mo¿e powie mi coœ wiêcej o pozosta³ych piratach.");
};

// **************************************************
INSTANCE DIA_JACKALLIGATOR_CanYouTeachMe (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 4;
	condition		= DIA_JACKALLIGATOR_CanYouTeachMe_Condition;
	information		= DIA_JACKALLIGATOR_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_JACKALLIGATOR_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jack_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_JACKALLIGATOR_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_JACKALLIGATOR_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_02"); //Ty nêdzny szczurze l¹dowy, jak œmiesz o to pytaæ?!
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_03"); //W sumie mogê ci pokazaæ jak unikaæ ciosów. Na pewno przyda siê to takiemu tchórzowi jak ty.
   AI_Output (self, other, "DIA_JACKALLIGATOR_CanYouTeachMe_15_04"); //Mogê te¿ nauczyæ ciê oprawiaæ zwierzynê.
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Jack Aligator mo¿e mnie nauczyæ unikania ciosów oraz oprawiania zwierzyny.");
};

INSTANCE DIA_Jack_Greg (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 2;
	condition		= DIA_Jack_Greg_Condition;
	information		= DIA_Jack_Greg_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znasz Grega?"; 
};

FUNC INT DIA_Jack_Greg_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Greg_Info()
{
	AI_Output (other, self, "DIA_Jack_Greg_15_01"); //Znasz Grega?
	AI_Output (self, other, "DIA_Jack_Greg_12_02"); //Czy ja znam Grega?!
	AI_Output (self, other, "DIA_Jack_Greg_12_03"); //A czy królewscy paladyni to idioci?
	AI_Output (other, self, "DIA_Jack_Greg_15_04"); //Hmm...
	AI_Output (self, other, "DIA_Jack_Greg_12_05"); //Pewnie, ¿e tak do stu beczek rumu!
	AI_Output (self, other, "DIA_Jack_Greg_12_06"); //Czym¿e by³by Greg gdyby nie Jack Aligator, hê? 
	AI_Output (other, self, "DIA_Jack_Greg_15_07"); //Pewnie nikim.
	AI_Output (self, other, "DIA_Jack_Greg_12_08"); //Dok³adnie!
	AI_Output (self, other, "DIA_Jack_Greg_12_09"); //P³ywa³em na morzach, kiedy Greg jeszcze obsikiwa³ pieluchy.
	AI_Output (self, other, "DIA_Jack_Greg_12_10"); //Zreszt¹, niewa¿ne.
	AI_Output (other, self, "DIA_Jack_Greg_15_11"); //Ale to Greg jest kapitanem, a nie Ty.
	AI_Output (self, other, "DIA_Jack_Greg_12_12"); //Bo... Bo mierzi mnie dowodzenia. Wolê to zostawiæ innym.
	AI_Output (other, self, "DIA_Jack_Greg_15_13"); //A co teraz porabia Greg?
	AI_Output (self, other, "DIA_Jack_Greg_12_14"); //Sztorm rozsmarowa³ nasz statek na ska³ach.
	AI_Output (self, other, "DIA_Jack_Greg_12_15"); //Kiedy obudzi³em siê na drugi dzieñ, nie spotka³em nikogo z naszych.
	AI_Output (self, other, "DIA_Jack_Greg_12_16"); //Ale jak znam Grega, to pewnie ma siê dobrze i kombinuje jak wyrwaæ siê z tej cholernej Kolonii.
	
   B_LogEntry		(CH1_Rbl_Pirates, "Jack powiedzia³, ¿e jego kapitan - Greg, pewnie prze¿y³ sztorm i powinien znajdowaæ siê gdzieœ w Kolonii. Mo¿e powinienem go poszukaæ?");
};

// **************************************************

INSTANCE DIA_Jack_WhatDo (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 3;
	condition		= DIA_Jack_WhatDo_Condition;
	information		= DIA_Jack_WhatDo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_Jack_WhatDo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Greg))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_WhatDo_Info()
{
	AI_Output (other, self, "DIA_Jack_WhatDo_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_02"); //Odpoczywam od cywilizacji, he, he.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_03"); //Kiedy nasza ³ajba rozbi³a siê na ska³ach podczas tego cholernego sztormu, docz³apa³em siê a¿ tutaj i zarzuci³em kotwicê.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_04"); //Ale Jack Aligator nie jest szczurem l¹dowym do kroæset!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_05"); //Kiedy tylko znajdê jak¹œ ³ajbê, wci¹gnê flagê na maszt i odp³ynê jak najdalej od tego zatêch³ego l¹du.
	AI_Output (other, self, "DIA_Jack_WhatDo_15_06"); //Wasz okrêt te¿ rozbi³ siê podczas sztormu?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_07"); //Z w³asnej woli bym tu nie rzuci³ kotwicy!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_08"); //Ju¿ dawno nie widzia³em takiego szkwa³u. By³o w nim coœ dziwnego...
	AI_Output (self, other, "DIA_Jack_WhatDo_12_09"); //Powietrze œmierdzia³o wtedy... umarlakami. Tak w³aœnie, umarlakami!
	AI_Output (self, other, "DIA_Jack_WhatDo_12_10"); //A stary Jack wie co mówi.
	AI_Output (other, self, "DIA_Jack_WhatDo_15_11"); //Umarlakami?
	AI_Output (self, other, "DIA_Jack_WhatDo_12_12"); //To nie by³ zwyczajny sztorm.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_13"); //Wiem co mówiê, bo prze¿y³em ju¿ niejedno porz¹dne wietrzysko na morzu.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_14"); //Po wzburzonych falach pe³ga³y blade ogniki, z odmêtów wynurzali siê umarli, a na niebie tañczy³y zmory i szczerzy³y do nas zêby.
	AI_Output (self, other, "DIA_Jack_WhatDo_12_15"); //To by³a paskudna noc...
	
   B_LogEntry		(CH1_Rbl_Pirates, "Okrêt Jacka, jak i mój, rozbi³ siê na ska³ach podczas sztormu. Jack twierdzi, ¿e to nie by³ zwyczajny szkwa³. Mówi, ¿e widzia³ umar³ych, ale nie ma co s³uchaæ przes¹dnego marynarza.");
};

// **************************************************

INSTANCE DIA_Jack_Ramos (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 4;
	condition		= DIA_Jack_Ramos_Condition;
	information		= DIA_Jack_Ramos_Info;
	permanent		= 0;
	important		= 0;
	description		= "S³ysza³eœ o Ramosie?"; 
};

FUNC INT DIA_Jack_Ramos_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_WhatDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Ramos_Info()
{
	AI_Output (other, self, "DIA_Jack_Ramos_15_01"); //S³ysza³eœ o kapitanie Ramosie?
	AI_Output (self, other, "DIA_Jack_Ramos_12_02"); //Pytasz Jacka Aligatora, czy s³ysza³ o starym Ramosie?!
	AI_Output (self, other, "DIA_Jack_Ramos_12_03"); //A myœlisz, ¿e kto nauczy³ Ramosa odró¿niaæ ¿agiel od damskich pantalonów, he, he.
	AI_Output (self, other, "DIA_Jack_Ramos_12_04"); //W³aœnie p³ynêliœmy na spotkanie z tym starym zrzêd¹, kiedy dopad³ nas szkwa³...
	
   B_LogEntry		(CH1_Rbl_Pirates, "Jack i Greg p³ynêli na spotkanie z Ramosem, kiedy dopad³ ich sztorm.");
	B_StopProcessInfos	( self );
};

// **************************************************

func void B_Aligators_PreQuest()
{
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_01"); //Tak jest, kapitanie!
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_02"); //Kapitanie? 
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_03"); //No tak, jestem teraz kapitanem!
};
   
func void B_Aligators_Quest()
{
   jack_yes = TRUE;
   
   AI_Output (other, self, "DIA_Jack_Question_Yes_15_05"); //A co to za bestia?
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_06"); //Stary i brzydki aligator.
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_07"); //Mówisz o sobie?
   
   if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == FALSE)
   {
      AI_Output (self, other, "DIA_Jack_Question_Yes_12_08"); //Nie prowokuj mnie sterniku!
      AI_Output (other, self, "DIA_Jack_Question_Yes_15_09"); //Tak jest, kapitanie!
   }
   else
   {
      AI_Output (self, other, "DIA_Jack_Fight_12_25"); //Nie prowokuj mnie ponownie!
		AI_Output (other, self, "DIA_Jack_Fight_15_26"); //W porz¹dku, jedna walka mi wystarczy.
   };
   
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_10"); //Wracaj¹c do aligatorów. Niedaleko st¹d znajduje siê jaskinia, w której te bestie maj¹ gniazdo.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_11"); //Widzia³em tam kilkutonow¹ matronê. To pewnie ona jest mamuœk¹ ca³ego miotu.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_12"); //Zabij tê cholerê i przynieœ mi jej pazury, a nie po¿a³ujesz.
	AI_Output (other, self, "DIA_Jack_Question_Yes_15_13"); //A co ja bêdê z tego mia³, prócz chwa³y i cudem wyniesionego ¿ycia?
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_14"); //Hmm... Zedrzyj z gada skórê, to sklecê z tego niezgorszy pancerz.
	AI_Output (self, other, "DIA_Jack_Question_Yes_12_15"); //Aha. I lepiej nie zapuszczaj siê tam sam, bo skoñczysz w brzuchu gada.
	
   Log_CreateTopic	(CH1_Rbl_Aligator, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Aligator, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Aligator, "Jack zleci³ mi zabicie starego aligatora, który zamieszkuje jaskiniê w pobli¿u jego kryjówki. Mam przynieœæ mu pazury gada. Jak zedrê skórê z aligatora, Jack zrobi mi z niej pancerz. Stary pirat zasugerowa³ te¿, ¿ebym nie szed³ tam sam.");
	
	Wld_InsertNpc		(Aligator_Boss,"SPAWN_OW_BLACKGOBBO_BOSS");		
	B_StopProcessInfos	(self); 
};

INSTANCE DIA_Jack_Question (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 5;
	condition		= DIA_Jack_Question_Condition;
	information		= DIA_Jack_Question_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Jack_Question_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Ramos))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Question_Info()
{
	AI_Output (self, other, "DIA_Jack_Question_12_01"); //Zaraz. Przecie¿ ja sk¹dœ znam Twoj¹ facjatê...
	AI_Output (self, other, "DIA_Jack_Question_12_02"); //Jesteœ jednym z wilków Ramosa!
	AI_Output (other, self, "DIA_Jack_Question_15_03"); //Niestety jednym z ostatnich.
	AI_Output (self, other, "DIA_Jack_Question_12_04"); //Co z kapitanem i statkiem?
	AI_Output (other, self, "DIA_Jack_Question_15_05"); //Kapitan nie ¿yje, tak samo sternik, nawigator i wiêkszoœæ za³ogi.
	AI_Output (self, other, "DIA_Jack_Question_12_06"); //Niech to Beliar poch³onie! Jak to siê sta³o?
	AI_Output (other, self, "DIA_Jack_Question_15_07"); //Sztorm i ska³y. Nie tylko was zaskoczy³ szkwa³ u wybrze¿y wyspy. Prze¿y³em tylko ja i kilku ch³opaków.
	AI_Output (self, other, "DIA_Jack_Question_12_08"); //Szkoda Ramosa. Stary by³ i wredny, ale uczciwy pirat. A takich coraz mniej p³ywa...
	AI_Output (self, other, "DIA_Jack_Question_12_09"); //To z Tob¹ mieliœmy siê spotkaæ na pla¿y w pobli¿u Khorinis?
	AI_Output (other, self, "DIA_Jack_Question_15_10"); //Tak. Ramos powiedzia³ tylko, ¿e musi sp³aciæ stare d³ugi, zanim z³o¿y koœci na dnie morza.
	AI_Output (self, other, "DIA_Jack_Question_12_11"); //He, he, ca³y Ramos. Co do d³ugów, skoro nie ma Grega to prawem piratów, ja przejmujê Twój d³ug.
	AI_Output (other, self, "DIA_Jack_Question_15_12"); //Prawem piratów? Pierwsze s³yszê...
	AI_Output (self, other, "DIA_Jack_Question_12_13"); //Boœ m³ody i nieopierzony. 
	AI_Output (self, other, "DIA_Jack_Question_12_14"); //Od tej chwili jesteœ moim... sternikiem.
	AI_Output (other, self, "DIA_Jack_Question_15_15"); //Mo¿e coœ Ci umknê³o, ale nie jesteœmy na morzu.
	AI_Output (self, other, "DIA_Jack_Question_12_16"); //Niewa¿ne, liczy siê funkcja. I wiêcej nie podwa¿aj mojego autorytetu!

	Info_ClearChoices (DIA_Jack_Question);
	Info_AddChoice (DIA_Jack_Question, "Tak jest, kapitanie!", DIA_Jack_Question_Yes);
	Info_AddChoice (DIA_Jack_Question, "Nikt nie bêdzie mi mówi³, co mam robiæ.", DIA_Jack_Question_No);
	Info_AddChoice (DIA_Jack_Question, "Nie bêdê z Tob¹ walczy³.", DIA_Jack_Question_Away);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Jack_Question_Yes()
{
   B_LogEntry(CH1_Rbl_Pirates, "Zosta³em 'sternikiem' Jacka. Wola³em nie wszczynaæ burdy z tym starym piratem.");
   B_Aligators_PreQuest();
   
   AI_Output (self, other, "DIA_Jack_Question_Yes_12_04"); //W takim razie zaczniesz pe³nienie swoich obowi¹zków od wys³ania pewnej wrednej bestii do Beliara.
   
   B_Aligators_Quest();
   
   Info_ClearChoices (DIA_Jack_Question);
};

// ------------------No----------------

FUNC VOID DIA_Jack_Question_No()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
	jack_no = TRUE;
   
	AI_Output (other, self, "DIA_Jack_Question_No_15_01"); //Nikt nie bêdzie mi mówi³, co mam robiæ.
	AI_Output (self, other, "DIA_Jack_Question_No_12_02"); //Skoro nie chcesz po dobroci, to niech bêdzie si³¹.
	AI_Output (self, other, "DIA_Jack_Question_No_12_03"); //Udowodnij, ¿eœ pirat, a nie szczur l¹dowy!
   
	B_LogEntry		(CH1_Rbl_Pirates, "¯eby udowodniæ Jackowi, ¿e jestem prawdziwym piratem, muszê... skopaæ mu dupê.");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);	
};

// ------------------Away----------------

FUNC VOID DIA_Jack_Question_Away()
{
	AI_Output (other, self, "DIA_Jack_Question_Away_15_01"); //Nie bêdê z Tob¹ walczy³.
	AI_Output (self, other, "DIA_Jack_Question_Away_12_02"); //Co?! I ty nazywasz siebie piratem?!
	AI_Output (self, other, "DIA_Jack_Question_Away_12_03"); //Zdychaj szczurze l¹dowy!!
   
	B_LogEntry		(CH1_Rbl_Pirates, "Kiedy powiedzia³em Jackowi, ¿e nie bêdê z nim walczy³, ten wpad³ we wœciek³oœæ i siê na mnie rzuci³. Albo on, albo ja...");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);	
};

// **************************************************

INSTANCE DIA_Jack_Fight (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 6;
	condition		= DIA_Jack_Fight_Condition;
	information		= DIA_Jack_Fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Jack_Fight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Question))&&(jack_no == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Fight_Info()
{
	//Bugfix: Anti-Fight by bow - add amunition after fight
	CreateInvItems (self, ItAmArrow,100);
   
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
      B_LogEntry		(CH1_Rbl_Pirates, "Nie zdo³a³em pokonaæ Jacka i zosta³em jego 'sternikiem'. Mo¿e to i lepiej...");
		
      AI_Output (self, other, "DIA_Jack_Fight_12_01"); //Nigdy wiêcej nie zaczynaj z Jackiem Aligatorem ch³ystku!
		AI_Output (self, other, "DIA_Jack_Fight_12_02"); //A teraz bez gadania zrobisz to, co Ci rozka¿ê. Rozumiemy siê?
      
      B_Aligators_PreQuest();
      
      AI_Output (self, other, "DIA_Jack_Fight_12_06"); //W takim razie... sterniku, zaczniesz pe³nienie obowi¹zków od wys³ania pewnej wrednej bestii do Beliara.
      
      B_Aligators_Quest();
	}
	else //if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
      B_GiveXP(150);
		
		AI_Output (self, other, "DIA_Jack_Fight_12_18"); //Niech to Beliar poch³onie - pokona³eœ mnie!
		AI_Output (self, other, "DIA_Jack_Fight_12_19"); //Ale nie myœl sobie, ¿e teraz wszystko Ci wolno!
		AI_Output (other, self, "DIA_Jack_Fight_15_20"); //Gdzie¿bym œmia³.
		AI_Output (self, other, "DIA_Jack_Fight_12_21"); //Skoro ju¿ tu jesteœ, to mam robótkê godn¹ takiego œmia³ka. Niedaleko st¹d pa³êta siê pewna wredna bestia Beliara.
		
      B_Aligators_Quest();
      
      B_LogEntry		(CH1_Rbl_Pirates, "Pokona³em Jacka. Nawet taki stary wilk morski jak on powinien znaæ swoje miejsce.");
	};
};

var int a_f_t;
var int a_f_e;

INSTANCE DIA_Jack_AligatorDead (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 7;
	condition		= DIA_Jack_AligatorDead_Condition;
	information		= DIA_Jack_AligatorDead_Info;
	permanent		= 1;
	important		= 0;
	description		= "Zabi³em wielkiego aligatora."; 
};

FUNC INT DIA_Jack_AligatorDead_Condition()
{
	if (jack_yes==TRUE)&&(Npc_IsDead(Aligator_Boss))&&(a_f_e == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead_Info()
{
	if (a_f_t == FALSE)
	{
		B_GiveXP(1000);
		a_f_t = TRUE;
      
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_01"); //Zabi³em wielkiego aligatora.
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_02"); //A niech mnie rekin wychêdo¿y! 
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_03"); //Naprawdê tego dokona³eœ... 
	};
   
	AI_Output (self, other, "DIA_Jack_AligatorDead_12_04"); //A gdzie trofea?
	
   if (NPC_HasItems(other,ItAt_BossAlgClaws)>=1)
	{
		a_f_e = TRUE;
      
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_05"); //Oto Twoje k³y.
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_06"); //Œwietnie. W koñcu przyozdobiê nimi rêkawice!
      
		B_GiveInvItems (other, self, ItAt_BossAlgClaws, 1);
      
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_07"); //Sam z chêci¹ pos³a³bym to bydlê do Beliara, ale trzeba daæ siê wykazaæ m³odym wilkom...
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_08"); //W koñcu nie bêdê ¿y³ wiecznie, he, he.
		
      Log_SetTopicStatus	(CH1_Rbl_Aligator, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Aligator, "Zabi³em ogromnego aligatora. Zrobi³em spore wra¿enie na Jacku, choæ stary pirat siê do tego nie przyzna³.");
	}
	else
	{
		AI_Output (other, self, "DIA_Jack_AligatorDead_15_09"); //Cholera! Wiedzia³em, ¿e o czymœ zapomnia³em...
		AI_Output (self, other, "DIA_Jack_AligatorDead_12_10"); //Wróæ wiêc po moje trofeum i nie zawracaj mi niepotrzebnie ty³ka.
		
      B_StopProcessInfos	(self); 
	};
};

var int aligator_armor;

INSTANCE DIA_Jack_AligatorDead1 (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 8;
	condition		= DIA_Jack_AligatorDead1_Condition;
	information		= DIA_Jack_AligatorDead1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mówi³eœ coœ o pancerzu ze skóry aligatora."; 
};

FUNC INT DIA_Jack_AligatorDead1_Condition()
{
	if (a_f_e == TRUE)&&(NPC_HasItems(other,ItAt_BossAlgSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead1_Info()
{
	aligator_armor = B_SetDayTolerance()+3;
   
	AI_Output (other, self, "DIA_Jack_AligatorDead1_15_01"); //Mówi³eœ coœ o pancerzu ze skóry aligatora.
	AI_Output (self, other, "DIA_Jack_AligatorDead1_12_02"); //A zdar³eœ z tego bydlêcia skórê?
	AI_Output (other, self, "DIA_Jack_AligatorDead1_15_03"); //Oto ona. 
	
   B_GiveInvItems (other, self, ItAt_BossAlgSkin, 1);
	Npc_RemoveInvItems(self,ItAt_BossAlgSkin,1);
	
   AI_Output (self, other, "DIA_Jack_AligatorDead1_12_04"); //No nawet zbytnio jej nie pochlasta³eœ...
	AI_Output (self, other, "DIA_Jack_AligatorDead1_12_05"); //W porz¹dku. Wróæ za trzy dni, a pancerz bêdzie gotowy.
	
   B_StopProcessInfos	(self); 
};

INSTANCE DIA_Jack_AligatorDead2 (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 9;
	condition		= DIA_Jack_AligatorDead2_Condition;
	information		= DIA_Jack_AligatorDead2_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jack_AligatorDead2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_AligatorDead1))&&(aligator_armor <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_AligatorDead2_Info()
{
	B_GiveXP(200);
   
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_01"); //Pancerz ju¿ gotowy. 
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_02"); //Trochê mi to zajê³o, ale to porz¹dna zbroja.
	AI_Output (self, other, "DIA_Jack_AligatorDead2_12_03"); //Niech Ci dobrze s³u¿y.
	
   CreateInvItem 		(other, ALG_ARMOR);
	AI_EquipArmor				(other, ALG_ARMOR);
   
	AI_Output (other, self, "DIA_Jack_AligatorDead2_15_04"); //Dziêki Jack.
	
   B_StopProcessInfos	(self); 
};

INSTANCE DIA_Aligator_Go (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 10;
	condition		= DIA_Aligator_Go_Condition;
	information		= DIA_Aligator_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿e pójdziesz ze mn¹?"; 
};

FUNC INT DIA_Aligator_Go_Condition()
{
	if  (a_f_e == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Aligator_Go_Info()
{
	AI_Output (other, self, "DIA_Aligator_Go_15_01"); //Mo¿e pójdziesz ze mn¹?
	AI_Output (self, other, "DIA_Aligator_Go_12_02"); //Ale gdzie i po co?
	AI_Output (other, self, "DIA_Aligator_Go_15_03"); //Zaszy³em siê z ch³opakami w obozie rebeliantów.
	AI_Output (other, self, "DIA_Aligator_Go_15_04"); //Zawsze to lepsze ni¿ spanie na pla¿y czy w jaskini pe³nej aligatorów.
	AI_Output (self, other, "DIA_Aligator_Go_12_05"); //W sumie racja.
	AI_Output (self, other, "DIA_Aligator_Go_12_06"); //Zreszt¹, nic ju¿ mnie tu nie trzyma.
	AI_Output (self, other, "DIA_Aligator_Go_12_07"); //ProwadŸ przyjacielu.
   
	B_LogEntry		(CH1_Rbl_NewMembers, "Jack pójdzie ze mn¹ do obozu rebeliantów.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Aligator_GoOut (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 11;
	condition		= DIA_Aligator_GoOut_Condition;
	information		= DIA_Aligator_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Aligator_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Aligator_Go))&&((Npc_GetDistToWP (self,"SPAWN_TALL_PATH_BANDITOS2") < 550 )|| (Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Aligator_GoOut_Info()
{
	Know_JackAlligator = TRUE;
	aligator_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (other, self,"DIA_Aligator_GoOut_15_01"); //Jesteœmy na miejscu. 
	AI_Output (self, other,"DIA_Aligator_GoOut_12_02"); //Bywa³em ju¿ w gorszych portach ni¿ ten.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_03"); //Mo¿e byæ, przynajmniej na jakiœ czas.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_04"); //WeŸ te pergaminy. Znalaz³em zwoje w jakiejœ skrzyni.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_05"); //Mo¿e zrobisz z nich lepszy u¿ytek ni¿ podtarcie ty³ka, he, he.
	AI_Output (other, self,"DIA_Aligator_GoOut_15_06"); //Postaram siê.
	AI_Output (self, other,"DIA_Aligator_GoOut_12_07"); //Nie daj siê zabiæ wilku!
   
	CreateInvItems (self, ItArScrollIceCube,2); 
	B_GiveInvItems (self, other, ItArScrollIceCube, 2);
	CreateInvItems (self, ItArScrollFireball,2); 
	B_GiveInvItems (self, other, ItArScrollFireball, 2);
	CreateInvItems (self, ItArScrollDestroyUndead,1); 
	B_GiveInvItems (self, other, ItArScrollDestroyUndead, 1);
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi³em Jacka Aligatora do obozu. Mam nadziejê, ¿e nie bêdê tego ¿a³owa³...");
   B_LogEntry(CH1_Rbl_Pirates, "No i stary Jack jest z nami w obozie.");
   Log_SetTopicStatus(CH1_Rbl_Pirates, LOG_SUCCESS);
	
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"OR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Jack_KillPatrol (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 12;
	condition		= DIA_Jack_KillPatrol_Condition;
	information		= DIA_Jack_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Muszê rozprawiæ siê z kilkoma stra¿nikami."; 
};

FUNC INT DIA_Jack_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_KillPatrol_Info()
{
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_01"); //Muszê rozprawiæ siê z kilkoma stra¿nikami.
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_02"); //To ¿yczê powodzenia.
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_03"); //Nie pomo¿esz mi?
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_04"); //Jack jest ju¿ za stary na takie harce. Czas, ¿ebyœcie wy, m³odzi pokazali coœcie warci.
	AI_Output (other, self, "DIA_Jack_KillPatrol_15_05"); //Powiedz lepiej, ¿e boisz siê nara¿aæ skórê.
	AI_Output (self, other, "DIA_Jack_KillPatrol_12_06"); //Stary Jack nie wie co to strach ch³ystku! A teraz zejdŸ mi z oczu.
	
   B_LogEntry		(CH2_RBL_GuardCamp, "Wielki Jack Aligator mi nie pomo¿e - cholerny stary pierdziel.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Jack_Treassure (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_Treassure_Condition;
	information		= DIA_Jack_Treassure_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Jack_Treassure_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_PalGraveyardBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_Treassure_Info()
{
	AI_Output (self, other, "DIA_Jack_Treassure_12_01"); //Dobrze, ¿e Ciê widzê brachu. Stary Jack ma dla Ciebie prezent.
	AI_Output (other, self, "DIA_Jack_Treassure_15_02"); //Bogowie strze¿cie mnie od piratów przynosz¹cych dary...
	AI_Output (self, other, "DIA_Jack_Treassure_12_03"); //Nie b¹dŸ g³upi, nie dam Ci nic za darmo.
	AI_Output (other, self, "DIA_Jack_Treassure_15_04"); //Akurat w to nie w¹tpi³em.
	AI_Output (self, other, "DIA_Jack_Treassure_12_05"); //Zdradzê Ci pewien sekret w zamian za przys³ugê.
	AI_Output (other, self, "DIA_Jack_Treassure_15_06"); //Co to za przys³uga?
	AI_Output (self, other, "DIA_Jack_Treassure_12_07"); //Coœ dla mnie... wykopiesz.
	AI_Output (self, other, "DIA_Jack_Treassure_12_08"); //Dam Ci mapê z zaznaczonymi kilkoma miejscami...
	AI_Output (other, self, "DIA_Jack_Treassure_15_09"); //Mapa skarbów?!
	AI_Output (self, other, "DIA_Jack_Treassure_12_10"); //Tylko jej po³ówka, ale rzeczywiœcie wskazuje miejsca, gdzie ukryto kilka b³yskotek.
	AI_Output (other, self, "DIA_Jack_Treassure_15_11"); //Dlaczego sam nie wykopiesz skarbów?
	AI_Output (self, other, "DIA_Jack_Treassure_12_12"); //Jack Aligator nie jest szczurem l¹dowym, a ju¿ na pewno nie jestem kretem albo nornic¹.
	AI_Output (self, other, "DIA_Jack_Treassure_12_13"); //Poza tym nie chcê tego przeklêtego skarbu...
	AI_Output (other, self, "DIA_Jack_Treassure_15_14"); //Jak to przeklêtego?
	AI_Output (self, other, "DIA_Jack_Treassure_12_15"); //To pewnie tylko zabobony, wiesz my piraci jesteœmy przes¹dni.
	AI_Output (other, self, "DIA_Jack_Treassure_15_16"); //Zaraz... Chyba nie mówisz o kl¹twie czarnej per³y?!
	AI_Output (self, other, "DIA_Jack_Treassure_12_17"); //Chyba nie wierzysz w te bajki? Nie ma ¿adnej armii umarlaków i Czarnego Psa. To tylko g³upie opowieœci trzês¹cych portkami piratów...
	//FIXME: Niby za co ten dzwiêk?
	Snd_Play 		("FoundRiddler");
	
   AI_Output (self, other, "DIA_Jack_Treassure_12_18"); //Cholera co to by³o?!
	
   AI_StandUp ( self);
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (other, self, "DIA_Jack_Treassure_15_19"); //Zdaje siê, ¿e ta g³upia bajka jest jednak czymœ wiêcej.
	AI_Output (self, other, "DIA_Jack_Treassure_12_20"); //To tylko wiatr, nic wiêcej...
	AI_Output (self, other, "DIA_Jack_Treassure_12_21"); //Chyba nie boisz siê przes¹dów, sterniku?
	AI_Output (other, self, "DIA_Jack_Treassure_15_22"); //Tylko idiota nie czuje strachu przed tym, czego nie zna.
	AI_Output (other, self, "DIA_Jack_Treassure_15_23"); //A co Ty chcesz w zamian za mapê?
	AI_Output (self, other, "DIA_Jack_Treassure_12_24"); //Przynieœ mi... czarn¹ per³ê.
	AI_Output (other, self, "DIA_Jack_Treassure_15_25"); //Niech Ciê cholera, wiedzia³em, ¿e ³¿esz. Sam sobie jej poszukaj, nie jestem idiot¹.
	AI_Output (self, other, "DIA_Jack_Treassure_12_26"); //Pos³uchaj, jak przyniesiesz mi per³ê, to zdradzê Ci, gdzie zakopano prawdziwy skarb Czarnego Psa.
	AI_Output (other, self, "DIA_Jack_Treassure_15_27"); //A sk¹d Ty to niby wiesz?
	AI_Output (self, other, "DIA_Jack_Treassure_12_28"); //By³em jego sternikiem. To by³y paskudne czasy...
	AI_Output (other, self, "DIA_Jack_Treassure_15_29"); //Skarb Czarnego Psa... Nawet je¿eli jest przeklêty, to spora góra z³ota...
	AI_Output (self, other, "DIA_Jack_Treassure_12_30"); //Calutki bêdzie Twój!
	AI_Output (other, self, "DIA_Jack_Treassure_15_31"); //Hmm, niech bêdzie. Móg³bym za to kupiæ porz¹dny galeon i pop³yn¹æ na po³udnie z dala od orków, paladynów Innosa, demonów i tych wszystkich bogów.
	AI_Output (self, other, "DIA_Jack_Treassure_12_32"); //Wiedzia³em, ¿e siê skusisz. Oto mapa.

	/********************************************
	tu mapê kilku zakopanych skarbów trzeba zrobiæ, niech to bêdzie tylko po³ówka. w jednym z tych miejsc niech gracz znajdzie pos¹¿ek innosa
	********************************************/
	Search_4_JackTreasure = TRUE;
	CreateInvItems (self, JackMap1, 1);
	B_GiveInvItems (self, other, JackMap1, 1);
	//TODO: Rick mo¿e byc kapitanem, nie sternikiem.
   
	AI_Output (self, other, "DIA_Jack_Treassure_12_33"); //I nie zapomnij o kilofie! Powodzenia, sterniku.
	
   Log_CreateTopic	(CH2_RBL_Treassure, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Treassure, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Treassure, "Jack Aligator da³ mi mapê z zaznaczonymi skarbami. Mam dla niego znaleŸæ czarn¹ per³ê, a wtedy zdradzi mi miejsce ukrycia skarbu Czarnego Psa. Muszê kupiæ jakiœ kilof i czas wyruszyæ na poszukiwanie skarbów.");
};

INSTANCE DIA_Jack_TreassureFound (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_TreassureFound_Condition;
	information		= DIA_Jack_TreassureFound_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto czarna per³a."; 
};

FUNC INT DIA_Jack_TreassureFound_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_Treassure))&&(Npc_HasItems(hero,Mis_Jack_BlackPearl))
	{
		return 1;
	};
};

FUNC VOID DIA_Jack_TreassureFound_Info()
{
	//That's crappy dialog has been created by orc	
	AI_Output (other, self, "DIA_Jack_TreassureFound_15_01"); //Oto czarna per³a.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_02"); //Dobrze siê spisa³eœ, je¿eli masz problemy z zagospodarowaniem reszty b³yskotek, które wykopa³eœ, to s³u¿ê pomoc¹.
	AI_Output (other, self, "DIA_Jack_TreassureFound_15_03"); //Pomocna z Ciebie d³oñ, ale dziêkujê, jakoœ sobie poradzê.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_04"); //Kiedyœ by³em tak krzepki jak Ty, nie takie bogactwa zdobywa³em ch³opcze.
	AI_Output (self, other, "DIA_Jack_TreassureFound_12_05"); //W ka¿dym razie dziêkujê. Przynios³eœ czarn¹ per³ê i jesteœmy kwita.
	
	B_GiveInvItems (other, self, Mis_Jack_BlackPearl, 1);
	Log_SetTopicStatus	(CH2_RBL_Treassure, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Treassure, "Zanios³em per³ê Jackowi, po kilku przechwa³kach w koñcu podziêkowa³.");
};

INSTANCE DIA_Jack_TreasureBlackDog (C_INFO)
{
	npc		= PIR_2612_JACKALLIGATOR;
	nr		= 13;
	condition		= DIA_Jack_TreasureBlackDog_Condition;
	information		= DIA_Jack_TreasureBlackDog_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mia³eœ mi powiedzieæ, gdzie znajdê skarb Czarnego Psa."; 
};

FUNC INT DIA_Jack_TreasureBlackDog_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jack_TreassureFound))
	{
		return 1;
	};
};

func void DIA_Jack_TreasureBlackDog_Info()
{
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_01"); //Mia³eœ mi powiedzieæ, gdzie znajdê skarb Czarnego Psa.
	AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_02"); //Nie wiem, o czym mówisz...
   
   AI_DrawWeapon(other);
   
	AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_03"); //Dobrze wiesz, stary piracie, o czym mówiê!
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_04"); //Dobra, dobra, schowaj t¹ broñ, to pogadamy.
   
   AI_RemoveWeapon(other);
   
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_05"); //No wiêc tak. Móg³bym ci daæ mapê, ale... na razie jest bezwartoœciowa.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_06"); //Co ty pieprzysz?
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_07"); //Stary Jack pieprzy tylko dziewki, he, he.
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_08"); //Ale wracaj¹c do rzeczy. Skarb Czarnego Psa nie znajduje siê w Górniczej Dolinie. Jest ukryty na wyspie, ale w innej czêœci.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_09"); //Czyli zrobi³eœ ze mnie tylko ch³opca na posy³ki? Jak myœlisz, co powinienem teraz z tob¹ zrobiæ?
   AI_Output (self, other, "DIA_Jack_TreasureBlackDog_12_10"); //Uspokój siê! Jak tylko barierê szlag trafi, to osobiœcie ciê znajdê i wsadzê ci t¹ mapê w dupê! Masz na to s³owo... pirata.
   AI_Output (other, self, "DIA_Jack_TreasureBlackDog_15_11"); //Mam nadziejê. Póki co nie zabijê ciê.
};
// **************************************************

INSTANCE DIA_PIR_2612_JACKALLIGATOR_Stew (C_INFO)
{
	npc				= PIR_2612_JACKALLIGATOR;
	nr				= 12;
	condition		= DIA_PIR_2612_JACKALLIGATOR_Stew_Condition;
	information		= DIA_PIR_2612_JACKALLIGATOR_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jad³eœ ju¿ coœ tak... egzotycznego jak gulasz Snafa?"; 
};

FUNC INT DIA_PIR_2612_JACKALLIGATOR_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2612_JACKALLIGATOR_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_PIR_2612_JACKALLIGATOR_Stew_15_01"); //Jad³eœ ju¿ coœ tak... egzotycznego jak gulasz Snafa?
	AI_Output (self, other, "DIA_PIR_2612_JACKALLIGATOR_Stew_11_02"); //Stary Jack znany jest z kulinarnych podró¿y, heh.
	AI_Output (self, other, "DIA_PIR_2612_JACKALLIGATOR_Stew_11_03"); //Daj tê potrawkê!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Jack wzi¹³ gulasz, przy okazji po raz kolejny pokazuj¹c swoje nabrzmia³e ego."); 
};
