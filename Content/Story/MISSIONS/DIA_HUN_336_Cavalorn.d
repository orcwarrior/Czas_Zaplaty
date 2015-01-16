// **************************************************
//                    EXIT 
// **************************************************

INSTANCE DIA_HUN_336_CAVALORN_Exit (C_INFO)
{
   npc         = HUN_336_CAVALORN;
   nr         = 999;
   condition   = DIA_HUN_336_CAVALORN_Exit_Condition;
   information   = DIA_HUN_336_CAVALORN_Exit_Info;
   permanent   = 1;
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
//                hello
// **************************************************

INSTANCE DIA_HUN_336_CAVALORN_Hello (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 2;
   condition      = DIA_HUN_336_CAVALORN_Hello_Condition;
   information      = DIA_HUN_336_CAVALORN_Hello_Info;
   permanent      = 0;
   important      = 1;
   description      = ""; 
};

FUNC INT DIA_HUN_336_CAVALORN_Hello_Condition()
{
   return C_IsChapter(1);
};

FUNC VOID DIA_HUN_336_CAVALORN_Hello_Info()
{
   B_LogEntry(CH1_Pir_RebelCamp, "W koñcu dotar³em do Cavalorna. Obóz Rebeliantów wzbudza respekt. Teraz muszê 'tylko' przekonaæ Cavalorna, ¿e warto mi zaufaæ.");
   B_LogSetTopicStatus(CH1_Pir_RebelCamp, LOG_SUCCESS);
   Log_CreateTopic(CH1_Rbl_RebelCampTrust, LOG_MISSION);
   B_LogSetTopicStatus(CH1_Rbl_RebelCampTrust, LOG_RUNNING);
   B_LogEntry(CH1_Rbl_RebelCampTrust, "No to trafi³em do Obozu Rebeliantów. Cavalorn wygl¹da na konkretn¹ osobê. Uk³ad jest prosty. ¯eby staæ siê cz³onkiem obozu, muszê udowodniæ swoj¹ wartoœæ. Cavalorn powiedzia³ mi, ¿ebym rozejrza³ siê po obozie i przekona³ ludzi, ¿e warto mi zaufaæ.");
   B_LogEntry(CH1_Rbl_RebelCampTrust, "Cavalorn doda³, ¿e je¿eli mam jakieœ pytania, to powinienem poszukaæ Marka. Zwykle krêci siê w centrum obozu.");
   
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_01"); //No proszê, kolejny skazaniec.
   
   if (Npc_KnowsInfo (hero, DIA_HUN_2615_Abel_SlyKill1))
   {
      AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_02"); //Skoro przyprowadzi³ Ciê Abel, to pewnie odcinanie g³ów masz ju¿ za sob¹.
      B_GiveXP(100);
   }
   else
   {
      AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_03"); //Nie wiem, jak omin¹³eœ stra¿e, ale jestem pod wra¿eniem. Ma³o komu udaje siê ta sztuka.
      B_GiveXP(250);
   };
   
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_04"); //Potrzeba nam wiêcej zaradnych ludzi, którzy nie dadz¹ siê zabiæ.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_05"); //Nie przyszed³em tu ¿eby strzêpiæ jêzyk po pró¿nicy. A skóry tanio nie sprzedam, tego mo¿esz byæ pewien.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_06"); //Mocne s³owa. Czemu wiêc zawdziêczam ten 'zaszczyt'?
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_07"); //Ja i moi towarzysze trafiliœmy na paskudny sztorm.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_08"); //Czyli nie jesteœcie skazañcami? Ciekawe, mów dalej.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_09"); //Jesteœmy... Byliœmy piratami. Pech chcia³, ¿e trafiliœmy do Kolonii.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_10"); //Có¿, raczej nikt nie trafia tu z w³asnej woli lub z nadmiaru szczêœcia.
   
   if (Npc_KnowsInfo (hero, RBL_2604_Tony_FallowEnd))
   {   
      AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_11"); //Po drodze napatoczyliœmy siê na Toniego. Wyratowaliœmy twojego cz³owieka z opresji, a on w zamian pokaza³ nam drogê do obozu.
   };
   
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_12"); //Ale nie planujemy na d³ugo zarzucaæ tu kotwicy.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_13"); //To tak samo jak ja i moi ch³opcy.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_14"); //Sam widzisz, ¿e sporo nas ³¹czy. Mo¿e powinniœmy po³¹czyæ si³y.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_15"); //To siê jeszcze oka¿e. Nie znam was. Mo¿e i jesteœcie piratami, a mo¿e nas³a³ was Gomez. Kto wie?
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_16"); //Je¿eli chcecie tu zostaæ, to musicie udowodniæ, ¿e na coœ siê przydacie.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_17"); //Sk¹d ja to znam...
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_18"); //W porz¹dku. Im szybciej bêdziemy to mieæ za sob¹, tym szybciej zostawimy Koloniê za ruf¹.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_19"); //Spokojnie, to nie wyœcig szczurów. Pogadaj najpierw z ch³opakami.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_20"); //Poka¿ na co Ciê staæ i wróæ do mnie. Jeœli uznam, ¿eœ wart mego zaufania, to wtedy porozmawiamy o Twojej przysz³oœci.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_21"); //Wszystko w Twoich rêkach, piracie.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_22"); //Nazywam siê Rick.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_23"); //A wiêc witamy w Obozie Rebeliantów, Rick.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_24"); //Rozejrzyj siê, poznaj ch³opaków i przekonaj ich do siebie.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_25"); //Mamy tu napiêt¹ sytuacjê, wiêc ka¿dy miecz jest na wagê rudy.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_26"); //A teraz odejdŸ, mam jeszcze sporo do zrobienia.
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Hello_15_27"); //Wrócê szybciej, ni¿ myœlisz.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_28"); //To siê jeszcze oka¿e. Bywaj, ch³opcze.
   AI_Output (self, other,"DIA_HUN_336_CAVALORN_Hello_12_29"); //Aha. Jak chcesz siê dowiedzieæ czegoœ wiêcej, to poszukaj Marka. Zna tu ka¿dego i lubi strzêpiæ jêzyk. Zwykle krêci siê w centrum obozu.
   rebel_camp_trust = 0;
   //    
   Npc_ExchangeRoutine   (self,"start");
   //Wld_InsertNpc(Org_2500_Kasztan, "OC1");
};

var int q_n;
var int Cavalorn_ORRecruitCount;

INSTANCE DIA_Cavalorn_CanYouTeachMe (C_INFO)
{
   npc            =  HUN_336_CAVALORN;
   nr            = 4;
   condition      = DIA_Cavalorn_CanYouTeachMe_Condition;
   information      = DIA_Cavalorn_CanYouTeachMe_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mo¿esz mnie czegoœ nauczyæ?"; 
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
   AI_Output (other, self, "DIA_Cavalorn_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Cavalorn_CanYouTeachMe_12_02"); //Mogê pokazaæ ci jak podejœæ niezauwa¿onym do nieprzyjaciela i wygarn¹æ mu z ³uku.
   AI_Output (self, other, "DIA_Cavalorn_CanYouTeachMe_12_03"); //Poka¿ê ci te¿ kilka æwiczeñ, dziêki którym bêdziesz zrêczniejszy.
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   
   B_LogEntry(GE_TeacherOR, "Cavalorn poka¿e mi jak siê skradaæ, szyæ z ³uku i co zrobiæ ¿eby byæ zrêczniejszym.");
};

INSTANCE DIA_Cavalorn_Recruits (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 3;
   condition      = DIA_Cavalorn_Recruits_Condition;
   information      = DIA_Cavalorn_Recruits_Info;
   permanent      = 0;
   important      = 0;
   description      = "Opowiedz mi coœ wiêcej o waszym obozie."; 
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
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_01"); //Opowiedz mi coœ wiêcej o waszym obozie.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_02"); //Wybacz, ale jestem bardzo zajêtym cz³owiekiem.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_03"); //Mam na g³owie ca³y obóz, a stra¿nicy mog¹ uderzyæ w ka¿dej chwili.
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_04"); //Szykuje siê jakiœ atak?
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_05"); //No dobra, skoro i tak chcesz zostaæ jednym z nas, to poœwiêcê Ci chwilê.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_06"); //Mamy w Starym Obozie swojego cz³owieka, który informuje nas o planach tych œcierwojadów.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_07"); //Tylko dlatego jeszcze ¿yjemy.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_08"); //Stra¿nicy znowu szykuj¹ siê do ataku. Bêdzie to ostatnia próba ognia dla wszystkich rebeliantów.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_09"); //Dlatego rekrutujemy ka¿dego, kto chce do nas do³¹czyæ. 
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_10"); //Niestety, niesie to ze sob¹ pewne ryzyko, o którym powiem Ci, jak stwierdzê, ¿eœ godzien zaufania.
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_11"); //Rozumiem. Te¿ bym nie ufa³ komuœ tylko dlatego, ¿e mu z oczu ³adnie patrzy.
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_12"); //Myœlê, ¿e móg³bym pomóc w rekrutacji nowych cz³onków obozu.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_13"); //Czemu nie. Nikt Ciê tu nie zna. Stra¿nicy nie bêd¹ na Ciebie polowaæ, bo nie wiedz¹, ¿e jesteœ jednym z nas.
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_14"); //Ilu rekrutów wystarczy?
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_15"); //Im wiêcej, tym lepiej. Dobrze, ¿eby to nie by³y ¿ó³todzioby, co na widok orka robi¹ pod siebie.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_16"); //Je¿eli uda Ci siê sprowadziæ, powiedzmy, piêciu nowych, to znacznie przyczynisz siê naszej sprawie.
   AI_Output (other, self, "DIA_Cavalorn_Recruits_15_17"); //Ale nic za darmo. Przys³uga za przys³ugê.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_18"); //Rozumiem. Niestety nie œpiê na rudzie jak Gomez albo magowie wody.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_19"); //Zap³acê ci 200 bry³ek za ka¿dego rekruta.
   AI_Output (self, other,"DIA_Cavalorn_Recruits_12_20"); //Co Ty na to?

   Info_ClearChoices (DIA_Cavalorn_Recruits);
   Info_AddChoice (DIA_Cavalorn_Recruits, "Brzmi uczciwie.", DIA_Cavalorn_Recruits_Yes);
   Info_AddChoice (DIA_Cavalorn_Recruits, "200 bry³ek to za ma³o.", DIA_Cavalorn_Recruits_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_Recruits_Yes()
{
   q_y = TRUE;
   Cavalorn_ORRecruitCount = 0;
   
   AI_Output (other, self, "DIA_Cavalorn_Recruits_Yes_15_21"); //Brzmi uczciwie.
   AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_22"); //W takim razie umowa stoi.
   AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_23"); //200 bry³ek za 'g³owê'.
   AI_Output (self, other, "DIA_Cavalorn_Recruits_Yes_12_24"); //Tylko pospiesz siê, Gomez nie bêdzie wiecznie czeka³ z atakiem. 
   
   Log_CreateTopic(CH1_Rbl_NewMembers, LOG_MISSION);
   Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
   B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn powiedzia³ mi, ¿e stra¿nicy ze Starego Obozu przygotowuj¹ siê do ataku na rebeliantów. Cavalorn ma swojego cz³owieka wœród ludzi Gomeza. Jednak tym razem atak mo¿e ostatecznie rozstrzygn¹æ o losach rebeliantów. Zaproponowa³em Cavalornowi pomoc w znalezieniu co najmniej piêciu rekrutów, chêtnych aby do³¹czyæ do rebeliantów. Najwy¿sza pora rozejrzeæ siê za kandydatami na rebelianta.");
   B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_Recruits_No()
{
   q_n = TRUE;
   
   AI_Output (other, self, "DIA_Cavalorn_Recruits_No_15_25"); //200 bry³ek to za ma³o.
   AI_Output (self, other, "DIA_Cavalorn_Recruits_No_12_26"); //Ale z Ciebie pijawka!
   B_StopProcessInfos(self);
};

var int Cavalorn_GiveRingToHero;

INSTANCE DIA_Cavalorn_RecruitsAgain (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 4;
   condition      = DIA_Cavalorn_RecruitsAgain_Condition;
   information      = DIA_Cavalorn_RecruitsAgain_Info;
   permanent      = 0;
   important      = 1;
   description      = "..."; 
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
   AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_15_01"); //Zmieni³eœ zdanie?
   AI_Output (self, other,"DIA_Cavalorn_RecruitsAgain_12_02"); //Niech ciê szlag. Dobra, jak sprowadzisz piêciu rekrutów, to dorzucê magiczny pierœcieñ.
   AI_Output (self, other,"DIA_Cavalorn_RecruitsAgain_12_03"); //Ale to moja ostateczna oferta. To jak bêdzie?

   Info_ClearChoices (DIA_Cavalorn_RecruitsAgain);
   Info_AddChoice (DIA_Cavalorn_RecruitsAgain, "W porz¹dku.", DIA_Cavalorn_RecruitsAgain_Yes);
   Info_AddChoice (DIA_Cavalorn_RecruitsAgain, "To nadal za ma³o...", DIA_Cavalorn_RecruitsAgain_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_RecruitsAgain_Yes()
{
   Cavalorn_GiveRingToHero = TRUE;
   q_y = TRUE;
   Cavalorn_ORRecruitCount = 0;
   
   AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_Yes_15_04"); //W porz¹dku.
   AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_05"); //W takim razie umowa stoi.
   AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_06"); //200 bry³ek za 'g³owê' i pierœcieñ, jak przyprowadzisz co najmniej pi¹tkê rekrutów.
   AI_Output (self, other, "DIA_Cavalorn_RecruitsAgain_Yes_12_07"); //Tylko pospiesz siê, Gomez nie bêdzie wiecznie czeka³ z atakiem. 
   
   Log_CreateTopic(CH1_Rbl_NewMembers, LOG_MISSION);
   Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
   B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn powiedzia³ mi, ¿e stra¿nicy ze Starego Obozu przygotowuj¹ siê do ataku na rebeliantów. Cavalorn ma swojego cz³owieka wœród ludzi Gomeza. Jednak tym razem atak mo¿e ostatecznie rozstrzygn¹æ o losach rebeliantów. Zaproponowa³em Cavalornowi pomoc w znalezieniu co najmniej piêciu rekrutów, chêtnych aby do³¹czyæ do rebeliantów. Cavalorn zap³aci mi za ka¿dego 200 bry³ek i doda magiczny pierœcieñ, jak znajdê ochotników. Najwy¿sza pora rozejrzeæ siê za kandydatami na rebelianta.");
   B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_RecruitsAgain_No()
{
   //TODO: Sher, Troche zbyt drastyczne podejscie jak do gimnazialistów ;P
   q_n_again = TRUE;
   AI_Output (other, self, "DIA_Cavalorn_RecruitsAgain_No_15_08"); //To nadal za ma³o. A pierœcieñ mo¿esz sobie wsadziæ.
   AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_12_09"); //Za ma³o powiadasz?
   AI_DrawWeapon (self);
   AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_12_10"); //W takim razie to Ci powinno wystarczyæ cholerny krwiopilco!
   
   Log_SetTopicStatus(CH1_Rbl_RebelCampTrust, LOG_FAILED);
   B_LogEntry(CH1_Rbl_RebelCampTrust, "Chyba przesadzi³em z t¹ pazernoœci¹. U rebeliantów nie mam ju¿ czego szukaæ. Mo¿e powinienem pójœæ do Starego Obozu?");
   Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_RUNNING);
   B_LogEntry(CH1_Rbl_NewMembers, "Cavalorn chcia³ mi zap³aciæ za ka¿dego rekruta 200 bry³ek i dorzuciæ jeszcze jakiœ pierœcionek. Chyba jest œmieszny skoro myœli, ¿e w zamian za takie œmieci bêdê biega³ po kolonii i szuka³ idiotów chêtnych do wst¹pienia w szeregi rebeliantów. Mo¿e powinienem pójœæ do obozu Gomeza?");
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
   npc            = HUN_336_CAVALORN;
   //nr            = 5;
   condition      = DIA_Cavalorn_RecruitsFinish_Condition;
   information      = DIA_Cavalorn_RecruitsFinish_Info;
   permanent      = 1;
   important      = 0;
   description      = "Przyprowadzi³em nowych rekrutów."; 
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
   AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_01"); //Przyprowadzi³em nowych rekrutów.
   AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_02"); //Zobaczmy...

   if (pacho_trust == TRUE) && (Cavalorn_PachoIn == FALSE)
   {
      Cavalorn_PachoIn = TRUE;
      Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_03"); //Widzia³em w obozie zwiadowcê Gomeza, Pacho.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_04"); //NieŸle, s¹dzi³em, ¿e nie starczy mu odwagi, ¿eby przeciwstawiæ siê Gomezowi.
   }
   else if (Cavalorn_PachoIn == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_05"); //Pacho ju¿ mamy z g³owy.
   };

   if (scorpion_trust == TRUE) && (Cavalorn_ScorpionIn == FALSE)
   {
      Cavalorn_ScorpionIn = TRUE;
      Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_06"); //Skorpion! 
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_07"); //Œwietna robota. Uczy³ stra¿ników jak walczyæ, dobrze jest mieæ go w swoich szeregach.
   }
   else if (Cavalorn_ScorpionIn == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_08"); //O Skorpionie ju¿ wiem. Ten drañ ca³kiem spustoszy nam spi¿arniê...
   };

   if (aligator_trust == TRUE) && (Cavalorn_AligatorIn == FALSE)
   {
      Cavalorn_AligatorIn = TRUE;
      Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
      
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_09"); //Kolejny pirat w obozie.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_11"); //Wygl¹da, jakby niejedno mia³ na sumieniu. Mo¿e siê przydaæ.
      AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_11"); //Nigdy nie s³ysza³eœ o Jacku Aligatorze?
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_12"); //A powinienem?
      AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_13"); //Nie, ale mu o tym nie mów.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_14"); //He, he, rozumiem.
   }
   else if (Cavalorn_AligatorIn == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_15"); //Tak, wiem, legendarny Jack Aligator te¿ jest z nami.
   };

   if (carlson_trust == TRUE) && (Cavalorn_CarlsonIn == FALSE)
   {
      Cavalorn_CarlsonIn = TRUE;
      Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_16"); //Carlson? Masz na myœli tego kowala?
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_17"); //Wygl¹da na to ¿e to œwietny rzemieœlnik, Aidan bêdzie móg³ trochê odetchn¹æ.
   }
   else if (Cavalorn_CarlsonIn == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_18"); //Carlsona i jego m³ot s³ychaæ nawet tutaj. 
   };

   if (gestath_trust == TRUE) && (Cavalorn_GestathIn == FALSE)
   {
      B_GiveXP(250);
      Cavalorn_GestathIn = TRUE;
      Cavalorn_ORRecruitCount = Cavalorn_ORRecruitCount + 1;
      
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_19"); //Nie wiem, jak tego dokona³eœ!
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_20"); //Mój w³asny brat w Kolonii! A¿ mi szkoda Gomeza...
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_21"); //Œwietna robota. Zas³u¿y³eœ na coœ specjalnego.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_22"); //WeŸ te strza³y.
      
      CreateInvItems      (self, ItAmFireArrow, 10);
      B_GiveInvItems      (self, other,ItAmFireArrow, 10);
      
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_23"); //Znalaz³em je kiedyœ w starej cytadeli. Tylko rozwa¿nie ich u¿ywaj, bo nie ma ich wiele.
   }
   else if (Cavalorn_GestathIn == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_24"); //Mojego braciszka ju¿ przyprowadzi³eœ.
   };

   if (Cavalorn_ORRecruitCount>=5)
   {
      B_GiveXP(1000);
      recruit_finish = TRUE;
      
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_25"); //Œwietna robota. Przyprowadzi³eœ piêciu rekrutów.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_26"); //Naprawdê jestem pod wra¿eniem.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_27"); //le Ciê oceni³em za pierwszym razem.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_28"); //Mam dla Ciebie coœ, co powinno choæ po czêœci zrekompensowaæ trudy.
      
      CreateInvItems(self, ItWr_Bloodfly_01, 1);//ma byæ ksi¹¿ka Prawdziwy wojownik, tatoo znamiê wojownika
      B_GiveInvItems(self, other, ItWr_Bloodfly_01, 1);
      
      AI_Output (other, self, "DIA_Cavalorn_RecruitsFinish_15_29"); //Przyda siê. A co z rud¹?
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_30"); //Bez obaw. Nie zwyk³em robiæ z twarzy dupy, nie zapomnia³em o Twojej doli piracie.
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_31"); //1000 bry³ek rudy, tak jak obieca³em.
      
      CreateInvItems (self,ItMiNugget,1000);//ruda
      B_GiveInvItems (self, other, ItMiNugget, 1000);

      if (Cavalorn_GiveRingToHero == TRUE)
      {
         AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_32"); //Pierœcieñ te¿ jest Twój.
         CreateInvItems (self,Schutzring_Total1,1);
         B_GiveInvItems (self, other, Schutzring_Total1, 1);
      };
      
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_33"); //Teraz jesteœmy kwita.
      Log_SetTopicStatus(CH1_Rbl_NewMembers, LOG_SUCCESS);
      B_LogEntry(CH1_Rbl_NewMembers, "Przyprowadzi³em Cavalornowi piêciu rekrutów. Przywódca rebeliantów dotrzyma³ s³owa - dosta³em swoj¹ rudê. W interesach nie ma sentymentów...");
   }
   else if (Cavalorn_ORRecruitCount>0)&&(Cavalorn_ORRecruitCount<5)
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_34"); //NieŸle, ale nadal za ma³o chêtnych. Gomez uderzy ju¿ wkrótce. 
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_35"); //PrzyprowadŸ wiêcej rekrutów.
   }
   else
   {
      AI_Output (self, other,"DIA_Cavalorn_RecruitsFinish_12_36"); //Nie rób ze mnie idioty, jeszcze nikogo nie przyprowadzi³eœ!
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

// Troche tutaj namiesza³em ;-) -orc
INSTANCE DIA_Cavalorn_RebelCampTrust (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 6;
   condition      = DIA_Cavalorn_RebelCampTrust_Condition;
   information      = DIA_Cavalorn_RebelCampTrust_Info;
   permanent      = 1;
   important      = 0;
   description      = "Co z moim zaufaniem w obozie?"; 
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
 Ostatni ID kwesti = 61
-----------------------------*/

func void DIA_Cavalorn_RebelCampTrust_ItCanWait()
{
   AI_Output (other, self,"DIA_Cavalorn_RebelCampTrust_12_56"); //To mo¿e poczekaæ.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_57"); //Dobrze, gdyby coœ siê zmieni³o, wiesz, gdzie mnie szukaæ.
   Info_ClearChoices (DIA_Cavalorn_RebelCampTrust);
};

func void DIA_Cavalorn_RebelCampTrust_BecomeRebelNow()
{
      if(rbl_count_trust<126)
      {
         B_GiveXP (1000);
      }
      else//Calkiem fajny bonus za wykonanie wszystkich zadañ
      {
         B_GiveXP (1500);
         //TODO: Sher, ewentualnie to popraw
         AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_52"); //W obozie mówi¹ Tylko o Tobie, no i przyprowadzi³eœ piêciu rekrutów.
         AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_53"); //Mam coœ specjalnego, weŸ t¹ ksiêgê, przyda Ci siê nie tylko w wychodku.
         
         CreateInvItems(self, Kampfkunst, 1);//ma byæ ksi¹¿ka Prawdziwy wojownik, tatoo znamiê wojownika
         B_GiveInvItems(self, other, Kampfkunst, 1);
      };
      
      rbl_camp_trust = TRUE;
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_41"); //Zas³u¿y³eœ na nasze zaufanie. Odt¹d jesteœ jednym z nas.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_44"); //Nie pozostaje mi nic innego jak wypiæ za Twoje zdrowie.
      CreateInvItems (self,ItFoBeer,2);
      B_GiveInvItems (self, other,ItFoBeer, 1);   
      AI_UseItem (other,ItFobeer);
      AI_UseItem (self,ItFobeer);

      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_45"); //Witaj wœród nas, Rick.
      AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_46"); //Nie bêdziesz tego ¿a³owa³.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_47"); //To siê dopiero oka¿e, przyjacielu.

      Npc_SetTrueGuild (other,GIL_RBL);
      other.guild = GIL_RBL;
      
      B_LogSetTopicStatus   (CH1_Rbl_RebelCampTrust, LOG_SUCCESS);
      B_LogEntry(CH1_Rbl_RebelCampTrust, "Zosta³em jednym z rebeliantów! Przekona³em do siebie wiêkszoœæ spoœród ludzi Cavalorna. Ustawi³em siê ca³kiem dobrze jak na pocz¹tek. Teraz muszê tylko nie daæ siê zabiæ tym popychad³om Gomeza...");
      Info_ClearChoices(DIA_Cavalorn_RebelCampTrust);
};

FUNC VOID DIA_Cavalorn_RebelCampTrust_Info()
{
   AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_01"); //Co z moim zaufaniem w obozie?
   AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_02"); //Rozmawia³em z ch³opakami.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampTrust_15_03"); //I co powiedzieli?
   rbl_count_trust = 0;
   
   // ************************
   // Œwistak
   // (Sk³adniki broni) - z wykonaniem broni.
   // ************************   
   if (whistler_trust == TRUE) && (Cavalorn_whistler_know == FALSE)
   {
      Cavalorn_whistler_know = TRUE;
      rbl_count_trust = rbl_count_trust + 10;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_04"); //Œwistak tak Ciê zachwala³, ¿e przez chwilê zapomnia³ g³adziæ swój nowy miecz.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_05"); //Mo¿e i jest ekscentryczny, ale jego zdanie ma znaczenie, a Ty zdoby³eœ jego wdziêcznoœæ i zaufanie.
   }
   else if (Cavalorn_whistler_know == TRUE)&&(whistler_trust == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_06"); //Wszyscy ju¿ widzieli nowy i bezu¿yteczny miecz Œwistaka. Dobra robota.
      rbl_count_trust = rbl_count_trust + 10;   
   };

   // ************************
   // Œwistak
   // (Sk³adniki broni) - bez biegania do Aidana
   // ************************
   if (whistler_trust == 2) && (Cavalorn_whistler_know == FALSE)//Jezeli przyniesliœmy sk³adniki, ale nie zgodzilismy sie na zaniesienie ich Aidanowi
   {
      Cavalorn_whistler_know = TRUE;
      rbl_count_trust = rbl_count_trust + 7;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_07"); //Œwistak burcza³ coœ, ¿e nie zakoñczy³eœ zlecenia. Z tego co wiem, sporo nabiega³eœ siê za sk³adnikami na miecz.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_08"); //Znam go, wiêc nie dziwiê siê, ¿e nie chcia³eœ robiæ za ch³opca na posy³ki. To mi wystarczy...
   }
   else if (Cavalorn_whistler_know == TRUE)&&(whistler_trust == 2)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_09"); //Powiedzmy, ¿e Œwistak te¿ siê za tob¹ wstawi³...
      rbl_count_trust = rbl_count_trust + 5;   
   };   

   // ************************
   // Ratford
   // (4x Wilcze K³y)
   // ************************   
   if (ratford_trust == TRUE) && (Cavalorn_ratford_know == FALSE)
   {
      Cavalorn_ratford_know = TRUE;
      rbl_count_trust = rbl_count_trust + 8;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_10"); //Ratford by³ z Ciebie zadowolony. Oczywiœcie nie da³ tego po sobie poznaæ.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_11"); //Dobrze, ¿e przypad³eœ mu do gustu, bo on zna siê na ludziach.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_13"); //Drax opowiedzia³ mi, jak pozby³eœ siê tych bandytów ze wzgórza. Dobra robota.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_14"); //Bezpieczeñstwo obozu jest najwa¿niejsze.   
   }
   else if (Cavalorn_drax_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_15"); //Tak, Drax uwa¿a, ¿e porz¹dny z Ciebie ch³op.
      rbl_count_trust = rbl_count_trust + 15;      
   }
   else if (drax_warn == 3)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_16"); //Drax powiedzia³, ¿e próbowa³eœ go ok³amaæ. Nie potrzebujemy tu oszustów.
   };
   
   // ************************
   // Quentin
   // (30%/30% 1h/2h)
   // ************************   
   if (quentin_trust == TRUE) && (Cavalorn_quentin_know == FALSE)
   {
      Cavalorn_quentin_know = TRUE;
      rbl_count_trust = rbl_count_trust + 10;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_17"); //Ten stary wilk Quentin rzadko mówi o kimœ bez pikantnych epitetów. Nie wiem jak, ale zdoby³eœ jego przychylnoœæ.
   }
   else if (Cavalorn_quentin_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_18"); //Quentin ju¿ siê za Tob¹ wstawi³.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_19"); //Aidan nigdy nie lubi³ partactwa Garrego. Dobrze zrobi³eœ.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_20"); //Nasz kowal chyba Ciê polubi³.
   }
   else if (Cavalorn_aidan_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_21"); //Aidana te¿ przekona³eœ.
      rbl_count_trust = rbl_count_trust + 8;   
   };

   // ************************
   // R¹czka
   // (P³ot grozy)
   // ************************      
   if (fingers_trust == TRUE) && (Cavalorn_fingers_know == FALSE)
   {
      Cavalorn_fingers_know = TRUE;
      rbl_count_trust = rbl_count_trust + 5;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_22"); //Dziêki tobie R¹czka znów jest sob¹. No i p³ot te¿ naprawi³eœ.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_23"); //Ca³kiem nieŸle.
   }
   else if (Cavalorn_fingers_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_24"); //R¹czka nic nie pamiêta, ale to w³aœnie œwiadczy na Twoj¹ korzyœæ.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_25"); //Tony od pocz¹tku w Ciebie wierzy³. Dobrze, ¿e pomog³eœ mu na warcie, ch³opak by³ ju¿ wykoñczony.
   }
   else if (Cavalorn_tony_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_26"); //Œmia³o mo¿esz powiedzieæ, ¿e Tony jest Twoim przyjacielem.
      rbl_count_trust = rbl_count_trust + 12;      
   }
   else if (Story_RickSentry_MisState==3)&& (Cavalorn_tony_know == FALSE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_27"); //Tony nie ma nic przeciwko, ale wpadka na warcie wychodzi mu ju¿ bokiem.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_28"); //Bêdzie tam sta³, dopóki nie uznam, ¿e ma doœæ. Czyli nie tak prêdko...   
   };

   // ************************
   // Vam
   // (Pomocnik)
   // ************************      
   if (vam_trust == TRUE) && (Cavalorn_vam_know == FALSE)
   {
      Cavalorn_vam_know = TRUE;
      rbl_count_trust = rbl_count_trust + 5;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_29"); //Ma³o kto lubi harowaæ w pocie czo³a, ale to nie oznacza, ¿e praca Vama jest mniej wa¿na.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_30"); //Dobrze, ¿e namówi³eœ Garrego do zmiany profesji.
   }
   else if (Cavalorn_vam_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_31"); //Vam jest Ci bardzo wdziêczny.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_32"); //Fox znowu ob¿era siê konfiturami. Mam nadziejê, ¿e nie bêdzie nimi rzuca³ w stra¿ników, jak nas odwiedz¹...
   }
   else if (Cavalorn_fox_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_33"); //Foxa ju¿ kupi³eœ.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_34"); //Snaf powiedzia³ mi, jak siê sprawi³eœ w roli pastucha. Dobra robota.
   }
   else if (Cavalorn_snaf_know == TRUE)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_35"); //Snaf bardzo Ciê polubi³.
      rbl_count_trust = rbl_count_trust + 10;   
   };

   // ************************
   // Fisk
   // (Bójka w karczmie)
   // ************************   
   if (fisk_trust == TRUE) && (Cavalorn_fisk_know == FALSE)
   {
      Cavalorn_fisk_know = TRUE;
      rbl_count_trust = rbl_count_trust + 5;
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_36"); //Fisk powiedzia³, ¿e jesteœ œwietnym lekarstwem na nudê.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_37"); //Nie wiem, co mia³ na myœli, ale masz jego g³os.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_58"); //Gor Hanis i jego miecz znowu s¹ z nami. 
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_59"); //Powoli zaczynam odzyskiwaæ wiarê w ludzi.
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
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_39"); //Przyprowadzaj¹c rekrutów, udowodni³eœ, ¿e zale¿y Ci na naszej sprawie.
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_40"); //Takich ludzi nam w³aœnie potrzeba. Mnie przekona³eœ.
   }
   else if (Cavalorn_Cavalorn_know == TRUE)&&(recruit_finish == TRUE)
   {
      rbl_count_trust = rbl_count_trust + 25;      
      
		AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_61"); //Masz moje poparcie. Rekruci siê dobrze spisuj¹.
   }
   else if (Cavalorn_ORRecruitCount>0)&&(Cavalorn_ORRecruitCount<5)
   {
      rbl_count_trust = rbl_count_trust + (Cavalorn_ORRecruitCount*5);   
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_42"); //PrzyprowadŸ wiêcej rekrutów, to zdobêdziesz moje poparcie.
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
         AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_43"); //Przekona³eœ do siebie wiêkszoœæ z rebeliantów.
         //TODO: Sher, ewentualnie to popraw
         AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_54"); //Je¿eli dasz radê zdobyæ zaufanie wszystkich, to bêdê mia³ dla ciebie coœ specjalnego.
         AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_55"); //Ale zrobisz jak uwa¿asz.
         
         Info_ClearChoices (DIA_Cavalorn_RebelCampTrust);
         Info_AddChoice (DIA_Cavalorn_RebelCampTrust, "(Nie przerywaj)", DIA_Cavalorn_RebelCampTrust_BecomeRebelNow);
         Info_AddChoice (DIA_Cavalorn_RebelCampTrust, "To mo¿e poczekaæ.", DIA_Cavalorn_RebelCampTrust_ItCanWait);         
      };
   }
   else if (rbl_count_trust>80)&&(rbl_count_trust<110)
   {
      //TODO: Sher, ewentualnie to popraw
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_51"); //Jesteœ ju¿ bardzo blisko celu.
   }
   else if (rbl_count_trust>50)&&(rbl_count_trust<80)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_48"); //Radzisz sobie ca³kiem nieŸle, ale to jeszcze nie koniec.
   }
   else if (rbl_count_trust>0)&&(rbl_count_trust<=50)
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_49"); //Nie ustawaj w trudach, przed Tob¹ jeszcze sporo pracy.
   }
   else 
   {
      AI_Output (self, other,"DIA_Cavalorn_RebelCampTrust_12_50"); //Nie zgrywaj siê. Jeszcze nic nie zrobi³eœ...
      //B_StopProcessInfos   (self);
   };
};

INSTANCE DIA_Cavalorn_RebelCamp (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 7;
   condition      = DIA_Cavalorn_RebelCamp_Condition;
   information      = DIA_Cavalorn_RebelCamp_Info;
   permanent      = 0;
   important      = 0;
   description      = "Czyli jestem ju¿ jednym z Was?"; 
};

FUNC INT DIA_Cavalorn_RebelCamp_Condition()
{
   return rbl_camp_trust;
};
FUNC VOID DIA_Cavalorn_RebelCamp_Info()
{
   AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_01"); //Czyli jestem ju¿ jednym z Was?
   //TODO: Skorygowaæ badaj¹c sredni lvl gracza po wykonaniu zadañ
   if(hero.level<BecomeRBL_Level)
   {
      //TODO: Sher, ewentualnie to popraw
      AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_10"); //Prawie, jednak Twoje umiejêtnoœci pozostawiaj¹ jeszcze wiele do ¿yczenia.
      B_PrintGuildCondition(BecomeRBL_Level);
   };
   
   AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_02"); //Tak, przyjacielu.
   AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_03"); //I co teraz?
   AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_04"); //Jak to co? Rozejrzyj siê po obozie i pogadaj z ch³opakami.
   AI_Output (self, other, "DIA_Cavalorn_RebelCamp_15_05"); //Zacznij od Foxa. Jest naszym kwatermistrzem i zdaje siê, ¿e ma jakiœ problem.
   AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_06"); //W porz¹dku. Przyda³by mi siê lepszy pancerz. Masz coœ dla mnie?
   AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_07"); //Nie zajmujê siê ekwipunkiem. Pogadaj z Foxem, on trzyma pieczê nad magazynem.
   AI_Output (self, other,"DIA_Cavalorn_RebelCamp_12_08"); //Rozejrzyj siê te¿ po okolicy. Tylko nie daj siê zabiæ!
   AI_Output (other, self, "DIA_Cavalorn_RebelCamp_15_09"); //Bez obaw, zamierzam doczekaæ staroœci.
   
   B_Kapitelwechsel(2);   

   Log_CreateTopic(CH2_Rbl_RebelCampLife, LOG_MISSION);
   B_LogSetTopicStatus(CH2_Rbl_RebelCampLife, LOG_RUNNING);
   B_LogEntry(CH2_Rbl_RebelCampLife, "Zosta³em jednym z rebeliantów. Cavalorn poradzi³ mi, abym porozmawia³ z ch³opakami w obozie. Zasugerowa³, abym rozpocz¹³ od Foxa, kwatermistrz ma podobno jakiœ problem.");

   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_RebelCampAgain (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 8;
   condition      = DIA_Cavalorn_RebelCampAgain_Condition;
   information      = DIA_Cavalorn_RebelCampAgain_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_01"); //Aha i jeszcze coœ.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_15_02"); //Tak?
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_03"); //Udowodni³eœ, ¿e potrafisz poradziæ sobie w najró¿niejszych sytuacjach.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_04"); //Mam pewn¹ delikatn¹ sprawê, niestety nie mogê zleciæ jej nikomu z obozu.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_05"); //Ale musisz mi zaufaæ. Powiem Ci wiêcej tylko wtedy, gdy zgodzisz siê pomóc.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_06"); //Co Ty na to?

   Info_ClearChoices (DIA_Cavalorn_RebelCampAgain);
   Info_AddChoice (DIA_Cavalorn_RebelCampAgain, "Dobra, mów.", DIA_Cavalorn_RebelCampAgain_Yes);
   Info_AddChoice (DIA_Cavalorn_RebelCampAgain, "Wolê nie wiedzieæ za du¿o.", DIA_Cavalorn_RebelCampAgain_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Cavalorn_RebelCampAgain_Yes()
{
   spy_ok = 2;
   
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_01"); //Dobra, mów.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_02"); //Wiedzia³em, ¿e jednak ciekawoœæ weŸmie górê nad zdrowym rozs¹dkiem. I dobrze!
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_03"); //Sprawa jest bardzo delikatna i zaraz dowiesz siê, dlaczego nie mogê zleciæ jej nikomu z obozu.
   AI_StandUp (self);
   AI_PlayAni (self, "T_SEARCH");
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_04"); //S³uchaj uwa¿nie i nie przerywaj.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_05"); //Mamy w obozie zgni³e jab³ko...
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_06"); //Chcia³eœ powiedzieæ szpiega, tak?
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_07"); //W rzeczy samej.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_08"); //Mamy tu szpiega Gomeza.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_09"); //Dlatego zbadanie tej sprawy muszê powierzyæ komuœ 'z zewn¹trz', komuœ spoza uk³adów.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_10"); //Rozumiem. Co dalej?
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_11"); //Dowiesz siê, jak przestaniesz mi przerywaæ!
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_12"); //Wybacz, kontynuuj.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_13"); //Najgorsze jest to, ¿e nie mam ¿adnych podejrzeñ. Wiem tylko, ¿e Gomez na pewno ma tu swojego cz³owieka.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_14"); //Tak to ju¿ jest, my szpiegujemy jego, a on nas.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_15"); //Nasz cz³owiek z obozu Gomeza ju¿ kilkakrotnie donosi³, ¿e magnaci wiedz¹ o sprawach, o których rozmawialiœmy pod moim dachem.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_16"); //Nie mam wyboru. Przed ostateczn¹ konfrontacj¹ musimy wyci¹æ ten wrzód na ty³ku. Nawet je¿eli bêdzie bola³o jak cholera!
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_17"); //Musisz odkryæ i zdemaskowaæ tego sukinsyna!
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_18"); //Od tego zale¿y nie tylko przysz³oœæ obozu, ale i Twoja.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_19"); //Od czego powinienem zacz¹æ?
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_20"); //Sam nie wiem... Pogadaj z ch³opakami. Mo¿e ktoœ coœ zauwa¿y³.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_21"); //Tylko nikogo nie pytaj wprost!
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_22"); //To ma byæ... œledztwo.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_23"); //Musisz wykazaæ siê subtelnoœci¹ i sprytem, ale tego akurat Ci nie brakuje.
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_Yes_15_24"); //Zrobiê co w mojej mocy.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_Yes_12_25"); //Powodzenia ch³opcze. Przyda Ci siê ono równie mocno co i nam.
   
   Log_CreateTopic(CH2_Rbl_Spy, LOG_MISSION);
   B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_RUNNING);
   B_LogEntry(CH2_Rbl_Spy, "Gdy sta³em siê jednym z rebeliantów, Cavalorn poprosi³ mnie o rozwik³anie trudnego problemu. W obozie jest szpieg Gomeza, a ja mam dowiedzieæ siê, kto nim jest. Cavalorn powiedzia³, ¿e nie mogê pytaæ wprost, ¿e muszê wykazaæ siê sprytem. £atwo mu mówiæ... No nic, zobaczê, co da siê zrobiæ.");
   
   B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_RebelCampAgain_No()
{
   spy_ok = 1;
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_No_15_01"); //Wolê nie wiedzieæ za du¿o.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_No_12_02"); //Fakt, ¿yje sie wtedy d³u¿ej. Ale chyba nie chcesz ¿yæ wiecznie, he, he.
   AI_Output (self, other, "DIA_Cavalorn_RebelCampAgain_No_12_03"); //Wróæ, jak zmienisz zdanie.
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_RebelCampAgain_change (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 8;
   condition      = DIA_Cavalorn_RebelCampAgain_change_Condition;
   information      = DIA_Cavalorn_RebelCampAgain_change_Info;
   permanent      = 0;
   important      = 0;
   description      = "Zmieni³em zdanie"; 
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
   AI_Output (other, self, "DIA_Cavalorn_RebelCampAgain_15_07"); //Zmieni³em zdanie.
   AI_Output (self, other,"DIA_Cavalorn_RebelCampAgain_12_08"); //Czyli chcesz us³yszeæ wiêcej?
   
   DIA_Cavalorn_RebelCampAgain_Yes();
};

INSTANCE DIA_Cavalorn_BlackTroll (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 9;
   condition      = DIA_Cavalorn_BlackTroll_Condition;
   information      = DIA_Cavalorn_BlackTroll_Info;
   permanent      = 0;
   important      = 0;
   description      = "Aidan powiedzia³, ¿e mnie szuka³eœ."; 
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
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_01"); //Aidan powiedzia³, ¿e mnie szuka³eœ.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_02"); //Tak, mam dla Ciebie pewne zadanie.
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_03"); //Co tym razem?
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_04"); //Jesteœmy zadr¹ w ty³ku Gomeza...
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_05"); //To ju¿ wiem.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_06"); //Ale nadal jesteœmy za s³abi, ¿eby otwarcie rzuciæ wyzwanie magnatom i stra¿nikom.
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_07"); //Widzê, ¿e masz jakiœ pomys³ na to jak wyrównaæ nasze szanse w tej walce. 
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_08"); //Musimy spróbowaæ wszystkiego, w koñcu stawk¹ w grze jest nasze ¿ycie.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_09"); //W Kolonii znajduje siê obóz ³owców trolli. Gdyby uda³o siê ich przekonaæ do naszej sprawy. Nad¹¿asz?
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_10"); //Rozumiem i stwierdzi³eœ, ¿e ja siê do tego najlepiej nadajê. 
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll_15_11"); //Pomijaj¹c wybór emisariusza, reszta planu wydaje siê doœæ rozs¹dna.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_12"); //Wprost przeciwnie. Jesteœ idealnym kandydatem.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_13"); //Nikt ciê tu nie zna, nikomu jeszcze nie zalaz³eœ za skórê.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_14"); //£owcy to banda twardych drani. ¯yj¹ tylko po to by zabijaæ bestie i chyba to lubi¹.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_15"); //Oczywiœcie nie robi¹ tego bezinteresownie. 
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_16"); //Je¿eli ktoœ ma wystarczaj¹co du¿o odwagi, to jest to ca³kiem niez³y sposób na zdobycie maj¹tku.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_17"); //W koñcu bariera nie bêdzie trwaæ wiecznie. Kiedy szlag j¹ trafi, ³owcy bêd¹ mogli sprzedaæ trofea i nieŸle siê na tym ob³owi¹.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_12_18"); //Wiêc jak bêdzie? Porozmawiasz z ³owcami w moim imieniu?
   
   Log_CreateTopic(CH2_Rbl_TrollHunters, LOG_NOTE);
   B_LogEntry(CH2_Rbl_TrollHunters, "Cavalorn opowiedzia³ mi o obozie ³owców trolli. Pozosta³e obozy staraj¹ siê od nich stroniæ, co oznacza, ¿e ci ³owcy to banda niez³ych sukinsynów.");

   Info_ClearChoices(DIA_Cavalorn_BlackTroll);
   Info_AddChoice    (DIA_Cavalorn_BlackTroll, "To trudna decyzja..." ,DIA_Cavalorn_BlackTroll_No);   
   Info_AddChoice    (DIA_Cavalorn_BlackTroll, "Wyruszê do obozu ³owców." ,DIA_Cavalorn_BlackTroll_Yes);
};

func void DIA_Cavalorn_BlackTroll_Yes()
{
   cav_trol = 2;
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_00"); //Wyruszê do obozu ³owców.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_01"); //Wiedzia³em, ¿e mogê na Ciebie liczyæ.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_03"); //Nie pozostaje mi nic innego jak ¿yczyæ Ci powodzenia, przyjacielu.
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_04"); //Gdzie znajdê ten obóz?
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_05"); //£owcy obozuj¹ gdzieœ pomiêdzy Placem Wymian, a kopalni¹ nale¿¹c¹ do Gomeza.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_Yes_12_06"); //Niestety nie znam dok³adnej lokalizacji obozu.
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll_Yes_15_07"); //Jakoœ sobie poradzê. Bywaj. 

   Log_CreateTopic(CH2_Rbl_BlackTroll, LOG_MISSION);
   B_LogSetTopicStatus(CH2_Rbl_BlackTroll, LOG_RUNNING);
   B_LogEntry(CH2_Rbl_BlackTroll, "Zgodzi³em siê pomóc Cavalornowi w pozyskaniu sojuszników do naszej sprawy. Muszê odnaleŸæ obóz ³owców trolli i sprawiæ, ¿eby stanêli po naszej stronie w sporze z Gomezem. Ich obóz znajduje siê gdzieœ pomiêdzy Star¹ Kopalni¹ a Placem Wymian.");
   Info_ClearChoices(DIA_Cavalorn_BlackTroll);
};

func void DIA_Cavalorn_BlackTroll_No()
{
   cav_trol = 1;
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll_No_15_00"); //To trudna decyzja...
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll_No_12_01"); //Rozumiem. Wróæ, kiedy nabierzesz pewnoœci, jak powinieneœ post¹piæ.
   Info_ClearChoices(DIA_Cavalorn_BlackTroll);   
};

INSTANCE DIA_Cavalorn_BlackTroll1 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 10;
   condition      = DIA_Cavalorn_BlackTroll1_Condition;
   information      = DIA_Cavalorn_BlackTroll1_Info;
   permanent      = 0;
   important      = 0;
   description      = "Jestem ju¿ gotów. Poszukam ³owców."; 
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
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_00"); //Jestem ju¿ gotów. Poszukam ³owców.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_01"); //Wiedzia³em, ¿e mogê na Ciebie liczyæ.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_02"); //Nie pozostaje mi nic innego jak ¿yczyæ Ci powodzenia, przyjacielu.
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_03"); //Gdzie znajdê ten obóz?
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_04"); //£owcy obozuj¹ gdzieœ pomiêdzy Placem Wymian a kopalni¹ nale¿¹c¹ do Gomeza.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll1_12_05"); //Niestety nie znam dok³adnej lokalizacji ich obozu.
   AI_Output (other, self,"DIA_Cavalorn_BlackTroll1_15_06"); //Jakoœ sobie poradzê. Bywaj. 

   Log_CreateTopic(CH2_Rbl_BlackTroll, LOG_MISSION);
   B_LogSetTopicStatus(CH2_Rbl_BlackTroll, LOG_RUNNING);
   B_LogEntry(CH2_Rbl_BlackTroll, "Zgodzi³em siê pomóc Cavalornowi w pozyskaniu sojuszników do naszej sprawy. Muszê odnaleŸæ obóz ³owców trolli i sprawiæ, ¿eby stanêli po naszej stronie w sporze z Gomezem. Ich obóz znajduje siê gdzieœ pomiêdzy Star¹ Kopalni¹ a Placem Wymian.");
};

INSTANCE DIA_Cavalorn_BlackTroll2 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 1;
   condition      = DIA_Cavalorn_BlackTroll2_Condition;
   information      = DIA_Cavalorn_BlackTroll2_Info;
   permanent      = 0;
   important      = 1;
   description      = "..."; 
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
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_01"); //Zaczekaj chwilê!
   AI_Output (other, self, "DIA_Cavalorn_BlackTroll2_15_02"); //Co siê sta³o?
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_03"); //Pogadaj z Leafem. On by³ kiedyœ w obozie ³owców, mo¿e na coœ siê w koñcu przyda.
   AI_Output (self, other,"DIA_Cavalorn_BlackTroll2_12_04"); //WeŸ te¿ te mikstury. Mo¿esz ich potrzebowaæ.
   
   CreateInvItems (self, ItFo_Potion_Health_02,5); 
   B_GiveInvItems (self, other,ItFo_Potion_Health_02, 5);
   CreateInvItems (self, ItFo_Potion_Mana_02,2); 
   B_GiveInvItems (self, other,ItFo_Potion_Mana_02, 2);
   CreateInvItems (self, ItFo_Potion_Haste_02,1); 
   B_GiveInvItems (self, other,ItFo_Potion_Haste_02, 1);

   AI_Output (other, self, "DIA_Cavalorn_BlackTroll2_15_05"); //Bywaj.
   B_LogEntry(CH2_Rbl_BlackTroll, "Cavalorn powiedzia³, ¿e Leaf zna ³owców trolli, powinienem z nim pogadaæ. Da³ mi te¿ kilka mikstur 'na drogê'.");
   B_StopProcessInfos(self);
};

VAR INT CAVALORN_ASK_TRAIL;

INSTANCE DIA_Cavalorn_BlackTrollBack (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 11;
   condition      = DIA_Cavalorn_BlackTrollBack_Condition;
   information      = DIA_Cavalorn_BlackTrollBack_Info;
   permanent      = 0;
   important      = 0;
   description      = "£owcy trolli stan¹ po naszej stronie!"; 
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
   
   AI_Output (other, self, "DIA_Cavalorn_BlackTrollBack_15_01"); //£owcy trolli stan¹ po naszej stronie!
   AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_02"); //Œwietna robota, dziêki Tobie zdobyliœmy kolejnych sojuszników.
   AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_03"); //Gomez ud³awi siê z wœciek³oœci, jak siê o tym dowie.
   AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_04"); //Dobra robota, myœlê, ¿e jesteœ ju¿ gotów by wybraæ swoj¹ œcie¿kê w obozie.
   AI_Output (other, self, "DIA_Cavalorn_BlackTrollBack_15_05"); //Mówisz o specjalizacji?
   AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_06"); //Tak, staramy siê, aby ka¿dy robi³ to, co lubi i w czym jest najlepszy.
   AI_Output (self, other,"DIA_Cavalorn_BlackTrollBack_12_07"); //Musisz sam okreœliæ, co chcia³byœ robiæ.   

   /***************************************
   Ork gadaliœmy o tych rangach, tutaj mo¿na daæ kolejn¹
   I dick zasili³ w³aœnie poczet myœliwych ;P
   ****************************************/

   /********************************

   Jakaœ fajna recepta w nagrodê

   *********************************/
   Info_ClearChoices (DIA_Cavalorn_BlackTrollBack);
   Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Muszê siê zastanowiæ...", DIA_Cavalorn_BlackTrollBack_Think);
   Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Chcê zg³êbiaæ tajniki magii.",DIA_Cavalorn_BlackTrollBack_Mag);
   Info_AddChoice (DIA_Cavalorn_BlackTrollBack, "Wybieram drogê ³owcy.", DIA_Cavalorn_BlackTrollBack_Hunter);
};

// ---------------------------mag----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Mag()
{
   CAVALORN_ASK_TRAIL=2;//mage

   AI_Output (other, self, "DIA_Cavalorn_MineEnd_Mag_15_01"); //Chcê zg³êbiaæ tajniki magii.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_02"); //To Twój wybór. Bêdzie, jak zechcesz.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_03"); //Jak ju¿ bêdziesz gotów, to pogadaj z Miltenem.   
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Mag_12_04"); //Naprawdê cieszê siê, ¿e jesteœ po naszej stronie, Rick.
   
   B_LogEntry(CH3_RBL_Choose, "Wybra³em œcie¿kê magii. Jak ju¿ bêdê gotowy, to mam siê zg³osiæ do Miltena.");   
   B_StopProcessInfos(self);   
};

// ---------------------------hunter----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Hunter()
{
   CAVALORN_ASK_TRAIL=1;//hunter

   AI_Output (other, self, "DIA_Cavalorn_MineEnd_Hunter_15_01"); //Wybieram drogê ³owcy.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_02"); //Pod¹¿asz t¹ sam¹ œcie¿k¹ co ja, to œwietny wybór.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_04"); //Jak ju¿ bêdziesz gotów, to pogadaj z Ratfordem.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Hunter_12_05"); //Naprawdê cieszê siê, ¿e jesteœ po naszej stronie, Rick.
   
   Log_CreateTopic(CH2_RBL_Hunter, LOG_MISSION);
   Log_SetTopicStatus(CH2_RBL_Hunter, LOG_RUNNING);
   B_LogEntry(CH2_RBL_Hunter, "Wkroczy³em na drogê ³owcy, czeka mnie szereg prób dziêki, którym dowiodê, ¿e jestem godzien nosiæ to miano. Najpierw muszê porozmawiaæ z Ratfordem.");
   B_LogEntry(CH3_RBL_Choose, "Wybra³em œcie¿kê ³owcy. Muszê porozmawiaæ z Ratfordem, dostanê nowe zadanie.");
   B_StopProcessInfos(self);   
};

// ---------------------------think----------------------------------------

FUNC VOID DIA_Cavalorn_BlackTrollBack_Think()
{
   CAVALORN_ASK_TRAIL=0;//still unknown
   
   AI_Output (other, self, "DIA_Cavalorn_MineEnd_Think_15_01"); //Muszê siê zastanowiæ...
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_Think_12_02"); //Rozumiem. Wróæ, kiedy bêdziesz pewien, co chcia³byœ robiæ.
   
   B_LogEntry(CH3_RBL_Choose, "Muszê to przemyœleæ...");
   
   B_StopProcessInfos(self);   
};

INSTANCE DIA_Cavalorn_Decision (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 11;
   condition      = DIA_Cavalorn_Decision_Condition;
   information      = DIA_Cavalorn_Decision_Info;
   permanent      = 1;
   important      = 0;
   description      = "Podj¹³em ju¿ decyzjê."; 
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
   AI_Output (other, self, "DIA_Cavalorn_Decision_15_01"); //Podj¹³em ju¿ decyzjê.
   AI_Output (self, other, "DIA_Cavalorn_Decision_12_02"); //Tak? Jaki jest wiêc twój wybór?
   
   Info_ClearChoices (DIA_Cavalorn_Decision);
   Info_AddChoice (DIA_Cavalorn_Decision, "Muszê siê zastanowiæ...", DIA_Cavalorn_BlackTrollBack_Think);
   Info_AddChoice (DIA_Cavalorn_Decision, "Chcê zg³êbiaæ tajniki magii.",DIA_Cavalorn_BlackTrollBack_Mag);
   Info_AddChoice (DIA_Cavalorn_Decision, "Wybieram drogê ³owcy.", DIA_Cavalorn_BlackTrollBack_Hunter);
};

INSTANCE DIA_Cavalorn_Demon (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 33;
   condition      = DIA_Cavalorn_Demon_Condition;
   information      = DIA_Cavalorn_Demon_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_01"); //Ma³o brakowa³o...
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_02"); //Bêdziesz ¿y³. A gdzie demon?
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_03"); //Waln¹³ mnie i znikn¹³. Teleportowa³o siê œcierwo, zanim zd¹¿y³em dojœæ do siebie.
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_04"); //Ciesz siê, ¿e to zrobi³, bo inaczej musielibyœmy wybraæ nowego szefa.
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_05"); //Masz racjê, przeliczy³em siê. To by³o ponad moje si³y...
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_06"); //Racja, zachowa³eœ siê jak idiota. Goniæ demona w pojedynkê...
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_07"); //Chyba mamy ze sob¹ wiêcej wspólnego, ni¿bym chcia³ przyznaæ.
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_08"); //Co teraz?
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_09"); //Porozmawiam z magami. Musimy dowiedzieæ siê, gdzie demon móg³ siê ukryæ.
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_10"); //A co potem?
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_11"); //Bêdziemy siê o to martwiæ, jak go znajdziemy. Ale du¿ego wyboru nie ma, demon musi zgin¹æ.
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_12"); //Mówi³em, ¿e to zbyt du¿e ryzyko...
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_13"); //Kto mieczem wojuje, ten od miecza ginie. Czasami trzeba zaryzykowaæ.
   AI_Output (other, self, "DIA_Cavalorn_Demon_15_14"); //Dobra, nie ma co strzêpiæ jêzyka po pró¿nicy. Daj mi znaæ, jak dowiesz siê czegoœ nowego o naszej zgubie.
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_15"); //Mo¿esz byæ tego pewien. Nie zamierzam wiêcej bawiæ siê w bohatera.
   AI_Output (self, other,"DIA_Cavalorn_Demon_12_16"); //Chyba pójdê na g³êbszego.
   
   Log_SetTopicStatus(CH2_RBL_Hunter, LOG_SUCCESS);
   B_LogEntry(CH2_RBL_MysteryBook, "Demon uciek³. Cavalorn porozmawia z magami i mo¿e uda siê znaleŸæ zgubê. Nie ma to jak uwolniæ pradawnego demona, ¿eby sobie pohasa³ po Kolonii...");

   //Log_CreateTopic(CH2_RBL_Katrakanat, LOG_MISSION);
   //Log_SetTopicStatus(CH2_RBL_Katrakanat, LOG_RUNNING);
   //B_LogEntry(CH2_RBL_Katrakanat, "Wiêzieñ Katrakanat znów jest na wolnoœci. Musimy znaleŸæ demona, zanim zaczniemy ¿a³owaæ na w³asnej skórze tego, ¿e to dziêki nam jest na wolnoœci.");

   /*************************
   Ork wymyœl jak¹œ fajn¹ nagrodê
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
   npc            = HUN_336_CAVALORN;
   //nr            = 44;
   condition      = DIA_Cavalorn_Pass_Condition;
   information      = DIA_Cavalorn_Pass_Info;
   permanent      = 0;
   important      = 0;
   description      = "Opowiedz mi coœ wiêcej o magach z waszego obozu."; 
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
   AI_Output (other, self, "DIA_Cavalorn_Pass_15_01"); //Opowiedz mi coœ wiêcej o magach z waszego obozu.
   //   AI_Output (self, other,"DIA_Cavalorn_Pass_12_02"); //Z waszego? Raczej z naszego obozu.
   //   AI_Output (other, self, "DIA_Cavalorn_Pass_15_03"); //Jeszcze z nimi nie rozmawia³em, jakoœ nigdy nie przepada³em za kap³anami.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_04"); //Magowie to doœæ skryte persony.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_05"); //Nie wyœciubiaj¹ nosa sponad ksi¹g, ka¿d¹ woln¹ chwilê spêdzaj¹ na niekoñcz¹cych siê debatach i k³ótniach.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_06"); //Poza tym s¹ tacy jak my, musz¹ jeœæ, piæ, wypró¿niæ siê no i chc¹ prze¿yæ w Kolonii jak d³ugo siê da.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_07"); //Mamy wspólne cele, a to mocno spaja.
   AI_Output (other, self, "DIA_Cavalorn_Pass_15_08"); //Jak mo¿na siê do nich dostaæ?
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_09"); //Z magami mog¹ siê spotkaæ tylko najbardziej zaufani spoœród nas.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_10"); //I nie chodzi tu o hierarchiê spo³eczn¹ tylko o zwyczajny pragmatyzm. Magowie to arogancka banda, a ja nie chcia³bym, ¿eby któryœ z nich skoñczy³ z no¿em w oku.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_11"); //Za bardzo s¹ nam potrzebni.
   AI_Output (other, self, "DIA_Cavalorn_Pass_15_12"); //Czyli w pewnym sensie to z³o konieczne, tak?
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_13"); //Niezupe³nie. My pomagamy im, oni nam. Uzupe³niamy siê, to raczej symbioza, chocia¿ to g³ównie my pomagamy im.
   AI_Output (other, self, "DIA_Cavalorn_Pass_15_14"); //Rozumiem, ¿e nie rozmawiaj¹ z pierwszy lepszym skazañcem.
   AI_Output (self, other,"DIA_Cavalorn_Pass_12_15"); //To zale¿y. Udowodnij coœ wart, wtedy pogadamy.

   Log_CreateTopic(CH2_RBL_Mags, LOG_MISSION);
   Log_SetTopicStatus(CH2_RBL_Mags, LOG_RUNNING);
   B_LogEntry(CH2_RBL_Mags, "Aby przekonaæ do siebie magów, muszê tradycyjnie udowodniæ, co jestem wart. Ciekawe, co dok³adnie Cavalorn mia³ na myœli?");
};

//TEMPORARY DISABLED - MAYBE LETER SOME QUEST FOR WARRIOR?

INSTANCE DIA_Cavalorn_MagProve (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 45;
   condition      = DIA_Cavalorn_MagProve_Condition;
   information      = DIA_Cavalorn_MagProve_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam sprawê do magów."; 
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
   AI_Output (other, self, "DIA_Cavalorn_MagProve_15_01"); //Mam sprawê do magów.
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_02"); //Dziêki tobie ch³opcy Kiry s¹ po naszej stronie. Gdybym mia³ wiêcej takich chojraków, to Gomez ju¿ by pakowa³ manatki.
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_03"); //Je¿eli o mnie chodzi, to œmia³o mo¿esz im poprzeszkadzaæ. To jest przepustka...
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_04"); //Poka¿ to Miltenowi i nie zwracaj uwagi na jego docinki. Zachowuje siê tak, odk¹d Gomez rozkaza³ za³atwiæ magów ognia.
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_05"); //Jeszcze tylko sprawdzê, czy z papierem wszystko w porz¹dku.
   B_UseFakeScroll(self);
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_06"); //Lak nie odpada. Dobra, weŸ pergamin.
   
   CreateInvItems (self, magpass, 1);
   B_GiveInvItems (self, other, magpass, 1);
   
   AI_Output (other, self, "DIA_Cavalorn_MagProve_15_07"); //Sk¹d wzi¹³eœ papier z królewsk¹ pieczêci¹?
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_08"); //Wypad³ z jakiegoœ transportu, mam tego ca³y rulon.
   AI_Output (self, other,"DIA_Cavalorn_MagProve_12_09"); //Wszystkie in blanco. Planujê zrobiæ z nich lepszy u¿ytek, jak ju¿ siê st¹d wyrwiemy.

   Log_SetTopicStatus(CH2_RBL_Mags, LOG_SUCCESS);
   B_LogEntry(CH2_RBL_Mags, "Cavalorn da³ mi przepustkê do magów, kiedy doprowadzi³em do sojuszu z ³owcami trolli. Teraz powinni lepiej mnie potraktowaæ.");
};

INSTANCE DIA_Cavalorn_Raport (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 46;
   condition      = DIA_Cavalorn_Raport_Condition;
   information      = DIA_Cavalorn_Raport_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam z³e wieœci."; 
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
   AI_Output (other, self, "DIA_Cavalorn_Raport_15_01"); //Mam z³e wieœci.
   AI_Output (self, other,"DIA_Cavalorn_Raport_12_02"); //Co siê sta³o?
   AI_Output (other, self, "DIA_Cavalorn_Raport_15_03"); //Nowy Obóz upad³.
   AI_Output (self, other,"DIA_Cavalorn_Raport_12_04"); //Niech to szlag trafi!
   AI_Output (self, other,"DIA_Cavalorn_Raport_12_05"); //Musimy natychmiast odpowiedzieæ magnatom. Nie mogê w to uwierzyæ...
   AI_Output (self, other,"DIA_Cavalorn_Raport_12_06"); //Gomez ma nas teraz jak na sztychu miecza.
   AI_Output (self, other,"DIA_Cavalorn_Raport_12_07"); //Bêdê czeka³ przy stró¿ówce Toniego. PrzyjdŸ tam jak najszybciej, czeka nas sporo pracy.
   
   Log_CreateTopic(CH3_RBL_NCFall, LOG_MISSION);
   Log_SetTopicStatus(CH3_RBL_NCFall, LOG_RUNNING);
   B_LogEntry(CH3_RBL_NCFall, "Nowy Obóz upad³. To radykalnie zmienia plany rebeliantów. Mam jak najszybciej porozmawiaæ z Cavalornem przy stró¿ówce Toniego.");
   AI_SetWalkmode (self,NPC_RUN); 
   Npc_ExchangeRoutine(self, "ORHAVETROUBLES");//rutyna ze staniem ko³o stró¿ówki
   
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
   npc            = HUN_336_CAVALORN;
   //nr            = 12;
   condition      = DIA_HUN_336_CAVALORN_Stew_Condition;
   information      = DIA_HUN_336_CAVALORN_Stew_Info;
   permanent      = 0;
   important      = 0;
   description      = "Przynios³em trochê specja³u Snafa, pyszny gulasz..."; 
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
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Stew_15_01"); //Przynios³em trochê specja³u Snafa, pyszny gulasz...
   AI_Output (self, other, "DIA_HUN_336_CAVALORN_Stew_11_02"); //To œwietnie!
   AI_Output (other, self, "DIA_HUN_336_CAVALORN_Stew_15_03"); //Mówisz powa¿nie?
   AI_Output (self, other, "DIA_HUN_336_CAVALORN_Stew_11_04"); //Pewnie. Zalêg³y mi siê szczury w chacie, a gulasz Snafa odstrasza szkodniki lepiej ni¿ stare onuce.
   
   B_GiveInvItems (other, self, ItFo_Stew, 1);
   B_LogEntry(CH2_Rbl_Food, "Gulasz Snafa wspomo¿e Cavalorna w walce ze szczurami."); 
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
   B_ExchangeRoutine   (npc, "GuideMine");
   Npc_SetAttitude(npc, ATT_FRIENDLY);
   Npc_SetTempAttitude(npc, ATT_FRIENDLY);   
};

INSTANCE DIA_Cavalorn_Mine (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 47;
   condition      = DIA_Cavalorn_Mine_Condition;
   information      = DIA_Cavalorn_Mine_Info;
   permanent      = 0;
   important      = 1;
   //   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_Mine_12_01"); //Dobrze, ¿e jesteœ, najwy¿szy czas odp³aciæ Gomezowi t¹ sam¹ monet¹.
   AI_Output (other, self, "DIA_Cavalorn_Mine_15_02"); //Co zamierzasz?
   AI_Output (self, other,"DIA_Cavalorn_Mine_12_03"); //Wyr¿niemy wszystkich s³ugusów Gomeza w Starej Kopalni!
   AI_Output (other, self, "DIA_Cavalorn_Mine_15_04"); //Je¿eli spodziewaj¹ siê ataku to ju¿ po nas.
   AI_Output (self, other,"DIA_Cavalorn_Mine_12_05"); //Musimy zaryzykowaæ. Je¿eli Gomez bêdzie mia³ w rêku dwie kopalnie to i tak przegramy. 
   AI_Output (self, other,"DIA_Cavalorn_Mine_12_06"); //Nic go tak nie ugodzi, jak utrata ukochanej rudy. A nam da to chwilow¹ przewagê i wystarczaj¹c¹ iloœæ bry³ek by przygotowaæ siê do ostatecznej konfrontacji.
   AI_Output (self, other,"DIA_Cavalorn_Mine_12_07"); //Wystarczy ju¿ gadania, czas nakarmiæ miecze krwi¹ tych skurwieli!
   
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
   B_LogEntry(CH3_RBL_NCFall, "W odwecie zaatakujemy Star¹ Kopalniê!");
   Log_CreateTopic(CH3_RBL_MineAttack, LOG_MISSION);
   Log_SetTopicStatus(CH3_RBL_MineAttack, LOG_RUNNING);
   B_LogEntry(CH3_RBL_MineAttack, "Ale wdepn¹³em. W³aœnie sta³em siê czêœci¹ oddzia³u, który ma wyr¿n¹æ stra¿ników i cienie w Starej Kopalni. Grunt to nie daæ siê zabiæ.");
   Party_AddNpc(self);
   self.flags = NPC_FLAG_IMMORTAL;
   Npc_ExchangeRoutine(self, "GUIDEMINE");
   B_StopProcessInfos(self);   
   self.senses =   SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
   self.senses_range = 3000;
   self.protection[PROT_BLUNT] += 250;
   self.protection[PROT_EDGE] += 250;
   Npc_SetAttitude(self, ATT_FRIENDLY);
   Npc_SetTempAttitude(self, ATT_FRIENDLY);   
};

var int dickon_choose;

func void B_remove_npc_to_enforcement(var int instance_npc, var string routine)
{
   var c_npc npc;
   npc = Hlp_GetNPC(instance_npc);
   Party_RemoveNpc(npc);
   npc.attribute[ATR_HITPOINTS]=npc.attribute[ATR_HITPOINTS_MAX];  
   npc.protection[PROT_BLUNT] -= 250;
   npc.protection[PROT_EDGE] -= 250;

   B_ExchangeRoutine   (npc, routine);   
};

INSTANCE DIA_Cavalorn_MineEnd (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 48;
   condition      = DIA_Cavalorn_MineEnd_Condition;
   information      = DIA_Cavalorn_MineEnd_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_MineEnd_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_Cavalorn_Mine))&&(OldCampGrds>=19)&&(Npc_GetDistToWP(hero,"OW_OM_ENTRANCE02") < 400) //jakaœ zmienna okreslaj¹ca zabitych strazników i ciebie w kopalni
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_MineEnd_Info()
{
   if (hanis_trust)
   {
      B_remove_npc_to_enforcement(HUN_1422_GorHanis, "start");
   }
   else
   {
      B_remove_npc_to_enforcement(HUN_729_Kharim, "start");
   };
  
   B_remove_npc_to_enforcement(PIR_2600_Angus, "InHC");
   B_remove_npc_to_enforcement(HUN_2615_Abel, "start");

   NPC_ExchangeRoutine   (self, "start");   

   self.attribute[ATR_HITPOINTS_MAX]=self.attribute[ATR_HITPOINTS_MAX];   
   Party_RemoveNpc(self);
   self.protection[PROT_BLUNT] -= 250;
   self.protection[PROT_EDGE] -= 250;
   
   B_FullStop (hero);
   AI_GotoNpc(hero,self);
   
   B_GiveXP (1000);
   AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_01"); //No to koniec zabawy. Stara Kopalnia jest teraz Woln¹ Kopalni¹!
   AI_Output (other, self, "DIA_Cavalorn_MineEnd_15_02"); //NieŸle siê namacha³em mieczem...
   Log_SetTopicStatus(CH3_RBL_MineAttack, LOG_SUCCESS);
   B_LogEntry(CH3_RBL_MineAttack, "Atak na Star¹ Kopalniê zakoñczy³ siê rzezi¹ i naszym zwyciêstwem.");

   if (CAVALORN_ASK_TRAIL==2)
   {
      Npc_SetTrueGuild (other,GIL_MAG);
      other.guild = GIL_MAG;   
      AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_03"); //Racja. Dowiod³eœ, ¿eœ wart by staæ siê magiem.
      
      AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_04"); //Porozmawiaj z Miltenem on da Ci runê i kostur. Od Lerena otrzymasz szatê maga.
      AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_05"); //Jak ju¿ bêdziesz gotów, to pogadaj z Ratfordem.   
      B_LogEntry(CH3_RBL_Choose, "Bêdê pod¹¿a³ œcie¿k¹ magii. Muszê porozmawiaæ z Miltenem i Lerenem w sprawie lepszego wyposa¿enia i nauki. Jak ju¿ bêdê gotowy, to mam siê zg³osiæ do Ratforda po nowe zadanie.");   
   }
   else
   {
      Npc_SetTrueGuild (other,GIL_HUN);
      other.guild = GIL_HUN;

      AI_Output (self, other,"DIA_Cavalorn_MineEnd_12_06"); //Racja. Dowiod³eœ, ¿eœ wart by staæ siê ³owc¹.
      AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_07"); //Porozmawiaj z Aidanem i Foxem, dadz¹ Ci porz¹dne wyposa¿enie.
      B_LogEntry(CH3_RBL_Choose, "Zosta³em ³owc¹. Muszê porozmawiaæ z Aidanem i Foxem w sprawie lepszego wyposa¿enia. Jak ju¿ bêdê gotowy, to mam siê zg³osiæ do Ratforda po nowe zadanie.");
   };
   
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_08"); //Jak ju¿ bêdziesz gotów to pogadaj z Ratfordem.
   AI_Output (self, other, "DIA_Cavalorn_MineEnd_12_09"); //Do zobaczenia w obozie.
   B_StopProcessInfos(self);   
};

INSTANCE DIA_Cavalorn_Meeting (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   nr            = 50;
   condition      = DIA_Cavalorn_Meeting_Condition;
   information      = DIA_Cavalorn_Meeting_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_Meeting_Condition()
{  
   if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING))&& (Npc_GetDistToNpc(self,hero) < 1000)
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_Meeting_Info()
{
   AI_TurnToNpc(other, self);
   AI_Output (self, other,"DIA_Cavalorn_Meeting_12_01"); //Przede wszystkim nie mo¿na dopuœciæ do paniki. Ludzie musz¹ uwierzyæ w zwyciêstwo.
   AI_TurnToNpc(self, ratford);
   AI_Output (self, other,"DIA_Cavalorn_Meeting_12_02"); //Przygotowaniami umocnieñ zajmie siê Ratford. Trzeba naprawiæ ka¿d¹ dziurê, wzmocniæ palisadê, wydaæ ludziom broñ i zaplanowaæ strategiê obrony.
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Meeting2 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   nr            = 50;
   condition      = DIA_Cavalorn_Meeting2_Condition;
   information      = DIA_Cavalorn_Meeting2_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_Meeting2_Condition()
{
   if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING_talking))&& (Npc_GetDistToNpc(self,hero) < 1000)
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_Meeting2_Info()
{   
   AI_TurnToNpc(self, milten);
   AI_Output (self, other,"DIA_Cavalorn_Meeting_12_04"); //Magowie niech przygotuj¹ tyle mikstur, ile siê da. Kiedy nadejdzie w³aœciwa pora, wesprzecie nas zaklêciami.
   AI_PlayAni(milten,"T_YES");
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Meeting3 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   nr            = 50;
   condition      = DIA_Cavalorn_Meeting3_Condition;
   information      = DIA_Cavalorn_Meeting3_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_Meeting3_Condition()
{   
   if (Npc_KnowsInfo (hero, Dia_Milten_meeting))&& (Npc_GetDistToNpc(self,hero) < 1000)
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_Meeting3_Info()
{   
   AI_TurnToNpc(self, other);
   AI_Output (self, other,"DIA_Cavalorn_Meeting_12_06"); //Ty wyruszysz do ³owców troli. Niech bêd¹ gotowi. Powiesz Kirze, ¿e zaatakuj¹ ty³y stra¿ników, kiedy ci rzuc¹ siê na palisadê.
   AI_Output (other, self, "DIA_Cavalorn_Meeting_15_07"); //Postaram siê j¹ przekonaæ do naszej sprawy.
   AI_Output (self, other,"DIA_Cavalorn_Meeting_12_08"); //Skoro ka¿dy zna swoje obowi¹zki, to ruszcie dupska! Czeka nas sporo pracy.
   
   B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn rozdzieli³ zadania. Ja mam wyruszyæ do obozu ³owców trolli i powiedzieæ im, ¿eby nas wsparli. Maj¹ uderzyæ na ty³y atakuj¹cych stra¿ników.");
   Log_CreateTopic(CH3_RBL_TrolHelp, LOG_MISSION);
   Log_SetTopicStatus(CH3_RBL_TrolHelp, LOG_RUNNING);
   B_LogEntry(CH3_RBL_TrolHelp, "Muszê zawiadomiæ ³owców trolli, ¿e Gomez ju¿ wkrótce na nas uderzy. Kira ze swoimi ludŸmi ma zaatakowaæ ty³y stra¿ników.");

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
   npc            = HUN_336_CAVALORN;
   //nr            = 51;
   condition      = DIA_Cavalorn_NewSword_Condition;
   information      = DIA_Cavalorn_NewSword_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam dla ciebie nowe ostrze."; 
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
   AI_Output (self, other,"DIA_Cavalorn_NewSword_12_02"); //Fox Ciê nas³a³?
   AI_PlayAni(other,"T_YES");
   AI_Output (self, other,"DIA_Cavalorn_NewSword_12_03"); //Nie potrzebujê œwiec¹cego ¿elastwa. Mam stary, sprawdzony miecz.
   Info_ClearChoices (DIA_Cavalorn_NewSword);
   Info_AddChoice (DIA_Cavalorn_NewSword, "Twój miecz to z³om.", DIA_Cavalorn_NewSword_Scrab);
   Info_AddChoice (DIA_Cavalorn_NewSword, "WeŸ go ze wzglêdu na swoje ¿ycie.", DIA_Cavalorn_NewSword_Care);
   Info_AddChoice (DIA_Cavalorn_NewSword, "Zrób to dla mnie.", DIA_Cavalorn_NewSword_Me);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Me()
{
   B_GiveXP(200);
   AI_Output (other, self, "DIA_Cavalorn_NewSword_Me_15_01"); //Zrób to dla mnie.
   AI_Output (other, self, "DIA_Cavalorn_NewSword_Me_15_02"); //Jak nie weŸmiesz ostrza, to Fox nie da mi ¿yæ.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Me_12_03"); //W porz¹dku. Ale robiê to tylko ze wzglêdu na Ciebie.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Me_12_04"); //Stary miecz schowam do kufra. Coœ mi siê wydaje, ¿e to nowe œwiecide³ko szybko gdzieœ siê zawieruszy...
   cav_take = true;
   B_GiveInvItems (other, self, HUN_MW_03, 1);
   B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn przyj¹³ ostrze, co nie by³o takie proste.");
   B_StopProcessInfos(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Scrab()
{
   AI_Output (other, self, "DIA_Cavalorn_NewSword_Scrab_15_01"); //Twój miecz to z³om.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_02"); //Ten z³om zabi³ wiêcej stra¿ników ni¿ potrawki Snafa.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Scrab_12_03"); //Nie zamieniê tego ostrza na ¿aden inny. Powiedz Foxowi, ¿eby siê ju¿ wiêcej nie trudzi³.
   B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj¹³ ostrza. Nie uda³o mi siê go przekonaæ by wzi¹³ miecz. No có¿, lepiej na razie nie wracaæ do Foxa...");
   B_StopProcessInfos(self);
   
   Log_SetTopicStatus   (CH3_RBL_DelivWeapon, LOG_FAILED);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_NewSword_Care()
{
   AI_Output (other, self, "DIA_Cavalorn_NewSword_Care_15_01"); //WeŸ go ze wzglêdu na swoje ¿ycie.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_02"); //Nigdy siê z sob¹ nie cacka³em. Je¿eli zginê, to na pewno nie przez ten miecz.
   AI_Output (self, other,"DIA_Cavalorn_NewSword_Care_12_03"); //Nie zamieniê orê¿a na ¿aden inny. Powiedz Foxowi, ¿eby siê ju¿ wiêcej nie trudzi³.
   B_LogEntry(CH3_RBL_DelivWeapon, "Cavalorn nie przyj¹³ ostrza. Nie uda³o mi siê go przekonaæ by wzi¹³ miecz. No có¿, lepiej na razie nie wracaæ do Foxa...");
   B_StopProcessInfos(self);
   
   Log_SetTopicStatus   (CH3_RBL_DelivWeapon, LOG_FAILED);
};
//*********************************

INSTANCE DIA_Cavalorn_KiraAfter (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 53;
   condition      = DIA_Cavalorn_KiraAfter_Condition;
   information      = DIA_Cavalorn_KiraAfter_Info;
   permanent      = 0;
   important      = 0;
   description      = "Rozmawia³em z Kir¹."; 
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
   AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_01"); //Rozmawia³em z Kir¹.
   AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_02"); //Pomo¿e nam?
   
   if (kira_help == 1)
   {
      B_GiveXP(500);
      AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_03"); //Tak, ³owcy troli uderz¹ na ty³y stra¿ników. 
      AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_04"); //Œwietna robota!
      AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_05"); //Zrobiliœmy ju¿ prawie wszystko, aby przygotowaæ siê do odparcia ataku.

      B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn prawie podskakiwa³ z radoœci, kiedy dowiedzia³ siê, ¿e Kira i ³owcy uderz¹ na stra¿ników.");
   }
   else
   {
      AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_08"); //Kira nie da³a siê przekonaæ...
      AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_09"); //Niech to szlag trafi! Bardzo liczy³em na pomoc ³owców.
      AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_10"); //No nic, musimy przetrzymaæ atak bez ich wsparcia.
      
      B_LogEntry(CH3_RBL_OldCampAttack, "Cavalorn by³ bardzo zawiedziony, kiedy dowiedzia³ siê, ¿e Kira i ³owcy nam nie pomog¹.");
   };
   
   AI_Output (self, other,"DIA_Cavalorn_KiraAfter_12_11"); //Wracaj do swoich obowi¹zków i... uwa¿aj na siebie.
   AI_Output (other, self, "DIA_Cavalorn_KiraAfter_15_12"); //'Uwa¿aj na siebie' to moje drugie imiê. Bywaj.
      
   B_ExchangeRoutine(ratford,"PREATTACK");
   B_StopProcessInfos(self);
};

/************************************

SPY STORY

*************************************/

INSTANCE DIA_Cavalorn_Spy (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 32;
   condition      = DIA_Cavalorn_Spy_Condition;
   information      = DIA_Cavalorn_Spy_Info;
   permanent      = 0;
   important      = 1;
   description      = "..."; 
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
   
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_01"); //S³ysza³em, ¿e sporo wypytywa³eœ w obozie. 
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_02"); //Obawiam siê jednak, ¿e za bardzo rzucasz siê w oczy.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_03"); //Czego siê dowiedzia³eœ?
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_04"); //Prawie ka¿dy z twoich ludzi ma coœ do ukrycia. Ciê¿ko bêdzie znaleŸæ tego w³aœciwego.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_05"); //Mo¿e ja Ci pomogê, znam ich doœæ dobrze. Mów.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_06"); //Œwistak coœ ukrywa. Zdradzi³ tylko, ¿e wszed³ w jakiœ uk³ad z kimœ ze Starego Obozu i teraz p³aci za to z nawi¹zk¹.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_07"); //Jego mo¿esz skreœliæ. Œwistak nadal ma w Starym Obozie dobrych znajomych.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_08"); //To dziêki niemu informacje od naszego cz³owieka trafiaj¹ tam, gdzie trzeba.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_09"); //Mówi¹c o tym uk³adzie, mia³ na myœli mnie i naszego informatora. Mów dalej.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_10"); //Ratford twierdzi, ¿e nie ka¿dy staje siê tym, kim chcia³by byæ. Jednak w jego spojrzeniu jest coœ... smutnego.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_11"); //Wygl¹da, jakby coœ go z³ama³o.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_12"); //To co teraz powiem, musi zostaæ miêdzy nami. Rozumiesz?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_13"); //Ratford nie zawsze by³ myœliwym. 
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_14"); //Nie trafi³ te¿ do Kolonii sam. Po jakimœ czasie stan¹³ przed wyborem.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_15"); //Jego towarzysz wybra³ inn¹ drogê.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_16"); //Kiedy ponownie siê spotkali, by³a miêdzy nimi tylko stal.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_17"); //Ratford chcia³ umrzeæ, niestety bogowie lubi¹ z nas drwiæ.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_18"); //Po tym incydencie trafi³ tutaj. Myœlê, ¿e szuka³ spokoju, zapomnienia i... zrozumienia.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_19"); //Mam nadziejê, ¿e to znalaz³...
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_20"); //Z tego co powiedzia³eœ wynika, ¿e Ratford i jego towarzysz do³¹czyli do ró¿nych obozów.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_21"); //Idê o zak³ad, ¿e by³ to Stary i Nowy Obóz, najzacieklejsi wrogowie.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_22"); //I tak przyjaŸñ skoñczy³a siê na ostrzu miecza... Teraz rozumiem, sk¹d w jego spojrzeniu ta smuga cienia.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_23"); //Wystarczy ju¿ o tym. Kto jest nastêpny?
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_24"); //Drax. Jest jakiœ nieobecny, roztargniony. Mówi³ coœ o krwi i ogniu.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_25"); //Drax to prosty cz³owiek, ca³e ¿ycie walczy³. Widzisz, stal hartuje siê w ogniu.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_26"); //Ka¿dy z nas przeczuwa kres swych dni. Myœlê, ¿e to w³aœnie m¹ci mu myœli.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_27"); //Ale mogê siê myliæ. Mów dalej.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_28"); //Quentin. On ci¹gle walczy, nawet z w³asnym cieniem. Na coœ siê szykuje.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_29"); //Nie znam go dobrze. To wojownik, podobny do Ratforda czy Draxa. Mimo to, wyczuwam w nim niepokój.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_30"); //Kiedyœ by³ bandyt¹, który nie przebiera³ w œrodkach. Teraz próbuje zag³uszyæ wyrzuty sumienia za pomoc¹ miecza.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_31"); //Myœlê, ¿e do³¹czy³ do nas, ¿eby w jakiœ sposób odkupiæ dawne winy.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_32"); //A co myœlisz o Aidanie? Trochê przypomina cieniostwora, chadza w³asnymi œcie¿kami i woli samotnoœæ.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_33"); //W koñcu to myœliwy. Nie wiem, za co trafi³ do Kolonii, ale cieszê siê, ¿e jest po naszej stronie.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_34"); //Co do tych œcie¿ek... Mo¿e natkn¹³ siê na coœ, czego wola³by nie ogl¹daæ. 
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_35"); //W koñcu jesteœmy w Kolonii Karnej, tutaj nawet zatwardziali mordercy siê ³ami¹.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_36"); //Mo¿liwe.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_37"); //Nic nie wydoby³em od Abla.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_38"); //To mnie akurat nie dziwi. Abel jest prosty jak jego miecz.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_39"); //Nie ufa nikomu, ale nie oczekuje te¿ niczego od innych.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_40"); //Nie nadaje siê na szpiega, poza tym ci¹gle pilnuje bramy.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_41"); //Zauwa¿y³bym, gdyby coœ kombinowa³.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_42"); //Zastanawia mnie Fisk. By³ w Starym Obozie kimœ, zna³ magnatów. Dlaczego trafi³ tutaj?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_43"); //Fisk popad³ w nie³aski Gomeza i nie mia³ wyboru.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_44"); //Jak to siê sta³o?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_45"); //Fisk sprzedawa³ broñ w Starym Obozie. Handlowa³ te¿ z pewnym skazañcem, który niewiele przed Wami trafi³ do Kolonii.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_46"); //Po jakimœ czasie ten skazaniec sta³ siê wrzodem na dupie Gomeza i zarazem persona non grata w Starym Obozie.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_47"); //O kim mówisz?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_48"); //O kimœ, kto sporo namiesza³ w uk³adzie si³ w Kolonii. Mo¿e kiedyœ go spotkasz.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_49"); //Ale co ma do tego Fisk?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_50"); //Gomez w swoich urojeniach ubzdura³ sobie, ¿e ten skazaniec dzia³a³ w porozumieniu z Fiskiem.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_51"); //Gomez zniszczy³ prawie wszystkich ludzi ze Starego Obozu, którzy zadawali siê z tym skazañcem.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_52"); //Fisk nie jest idiot¹, powiedzmy, ¿e wybra³ mniejsze z³o i tak znalaz³ siê tutaj.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_53"); //Kogo masz jeszcze na liœcie?
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_54"); //R¹czka to zarozumia³y gnojek. Nie ufam mu.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_55"); //Ja te¿, w koñcu to z³odziej. I do tego dobry.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_56"); //Ale mia³ pecha. Jako jeden z kilku innych wp³ywowych cieni popar³ skazañca, o którym ju¿ wspomnia³em.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_57"); //Niech zgadnê, musia³ znikn¹æ ze Starego Obozu?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_58"); //W rzeczy samej.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_59"); //Hmm, ta spirala nienawiœci Gomeza okrêca siê wokó³ jednego skazañca. Ciekawe.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_60"); //Tu chodzi te¿ o ura¿on¹ dumê.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_61"); //Ten skazaniec splun¹³ Gomezowi w twarz, a takich obelg siê nie zapomina.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_62"); //Kontynuuj.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_63"); //Co powiesz o Snafie? Dobry kucharz w Kolonii jest na wagê rudy.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_64"); //Trafnie to uj¹³eœ - dobry.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_65"); //A co Snaf Ÿle gotuje?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_66"); //Nie powiedzia³em, ¿e Ÿle, po prostu inaczej.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_67"); //A do tego ma doœæ specyficzne poczucie humoru. Szczególnie dobrze przekonali siê o tym stra¿nicy, kiedy zjedli zupê ze szczurów myœl¹c, ¿e to myrtañski gulasz, he, he.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_68"); //Niestety, danie trafi³o te¿ na stó³ magnatów i Snaf wola³ nie czekaæ na reakcjê Gomeza, Kruka czy Bartholo.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_69"); //Rozumiem. 
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_70"); //Tony mnie tu przyprowadzi³, widzia³em, jak walczy³ ze stra¿nikami.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_71"); //Mimo to nie powiedzia³ mi ca³ej prawdy. Wed³ug niego Stary Obóz to banda socjopatów.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_72"); //Hmm. Tony jest tu od niedawna. Nie mam co do niego zastrze¿eñ, ale niepokoj¹ce sygna³y od mojego cz³owieka zaczê³y siê w tym samy okresie, kiedy do³¹czy³ do nas Tony.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_73"); //Co chcesz przez to powiedzieæ?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_74"); //Zupe³nie nic, to tylko przypuszczenia. Nie musisz dawaæ im wiary.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_75"); //A Vam? Co o nim powiesz?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_76"); //Jest pracowity, nie lubi, jak ktoœ mówi mu, co ma robiæ. Do tego nigdy nie oddala siê z obozu.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_77"); //W¹tpiê, ¿e móg³by nas zdradziæ.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_78"); //Czasami najciemniej jest pod latarni¹.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_79"); //Mo¿e i masz racjê. Zosta³ ktoœ jeszcze?
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_80"); //A co z Foxem? Mówi³, ¿e trafi³ tu, bo nie mia³ wyboru.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_81"); //Fox by³ kurierem magów. Kiedy Corristo i reszta magów ognia skoñczy³a z poder¿niêtymi gard³ami, straci³ zajêcie i oczywiœcie nie mia³ ju¿ czego szukaæ w Starym Obozie.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_82"); //W Nowym te¿ nie mia³ zbyt wielu przyjació³, wybra³ wiêc nas.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_83"); //Nie jest mo¿e zbyt towarzyski, ale na swój sposób jest uczciwy i sprawiedliwy.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_84"); //Dlatego zosta³ kwatermistrzem.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_85"); //To ju¿ wszyscy?
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_86"); //Chyba tak. I co teraz?
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_87"); //Teraz musisz siê zastanowiæ nad tym, co powiedzia³em. Ktoœ z tych, których wymieni³eœ jest zdrajc¹.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_88"); //Jeszcze raz pogadaj z ch³opakami, wiesz ju¿ o nich du¿o wiêcej. Wykorzystaj tê wiedzê.
   AI_Output (self, other,"DIA_Cavalorn_Spy_12_89"); //Mo¿e ktoœ siê zdradzi, wygada, sk³amie. Musisz spróbowaæ.
   AI_Output (other, self,"DIA_Cavalorn_Spy_15_90"); //W porz¹dku. Zobaczymy, czego dowiem siê tym razem.

   B_LogEntry(CH2_Rbl_Spy, "To by³a cholernie d³uga rozmowa. Dowiedzia³em siê sporo o najwa¿niejszych osobach w obozie, teraz muszê porozmawiaæ z nimi jeszcze raz. Mo¿e dowiem siê w koñcu czegoœ konkretnego.");
};

var int cav_spy;

INSTANCE DIA_Cavalorn_Spy1 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 31;
   condition      = DIA_Cavalorn_Spy1_Condition;
   information      = DIA_Cavalorn_Spy1_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam pewne poszlaki."; 
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
   AI_Output (self, other,"DIA_Cavalorn_Spy1_12_02"); //Mów.
   Info_ClearChoices (DIA_Cavalorn_Spy1);
   Info_AddChoice (DIA_Cavalorn_Spy1, "Moim zdaniem to R¹czka.", DIA_Cavalorn_Spy1_Fingers);
   Info_AddChoice (DIA_Cavalorn_Spy1, "Postawi³bym ca³¹ rudê na Toniego.", DIA_Cavalorn_Spy1_Tony);
   Info_AddChoice (DIA_Cavalorn_Spy1, "To Aidan œmierdzi zdrad¹.", DIA_Cavalorn_Spy1_Aidan);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Fingers()
{
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Fingers_15_01"); //Moim zdaniem to R¹czka.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_02"); //R¹czka? 
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_03"); //Jakie masz dowody?
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Fingers_15_04"); //R¹czka to œwir. Wiem, ¿e podpad³ Gomezowi, ale to tak¿e œwiadczy przeciwko niemu.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_05"); //Nie wydaje mi siê.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_06"); //Znam R¹czkê i wiem na co go staæ.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Fingers_12_07"); //Niewa¿ne. Zapomnij o ca³ej sprawie. Sam to jakoœ rozwi¹¿ê.

   B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_FAILED);
   B_LogEntry(CH2_Rbl_Spy, "Powiedzia³em Cavalornowi, ¿e zdrajc¹ jest R¹czka, ale coœ mi nie uwierzy³. W ka¿dym razie problem szukania zdrajcy mam ju¿ z g³owy.");
   Info_ClearChoices (DIA_Cavalorn_Spy1);   
   B_StopProcessInfos( self );
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Aidan()
{
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Aidan_15_01"); //To Aidan œmierdzi zdrad¹.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_02"); //Aidan? Niby dlaczego?
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Aidan_15_03"); //Wa³êsa siê nocami, wraca nad ranem. Nie wiadomo, co naprawdê robi...
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_04"); //Przecie¿ ju¿ o tym rozmawialiœmy... Aidan udowodni³, ¿e zale¿y mu na obozie.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Aidan_12_05"); //Niewa¿ne. Zapomnij o ca³ej sprawie. Sam jakoœ to rozwi¹¿ê.

   B_LogSetTopicStatus(CH2_Rbl_Spy, LOG_FAILED);
   B_LogEntry(CH2_Rbl_Spy, "Powiedzia³em Cavalornowi, ¿e zdrajc¹ jest Aidan, ale coœ mi nie uwierzy³. W ka¿dym razie problem szukania zdrajcy mam ju¿ z g³owy.");
   Info_ClearChoices (DIA_Cavalorn_Spy1);   
   B_StopProcessInfos( self );
};

// -------------------------------------------------------------------

FUNC VOID DIA_Cavalorn_Spy1_Tony()
{
   tony_spy = tony_spy + 1;//15
   
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_01"); //Postawi³bym ca³¹ rudê na Toniego.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_02"); //Dlaczego akurat on?
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_03"); //Jego historyjki nie trzymaj¹ siê kupy.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_04"); //Do tego jako jedyny wzbudza tak¿e nieufnoœæ innych. Kilka razy opuœci³ obóz, myœl¹c, ¿e nikt go nie widzi.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_05"); //To wszystko?
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_06"); //Nie. Przeb¹kiwa³ coœ o tym, ¿e Szakal to jego przyjaciel. Odszed³ ze Starego obozu bez konkretnych powodów.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_07"); //No i to nasze spotkanie...
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_08"); //Tak?
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_09"); //Kiedy zobaczy³em go po raz pierwszy, sta³ w otoczeniu stra¿ników.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_10"); //Dopiero teraz uœwiadomi³em sobie, ¿e ¿aden stra¿nik nie trzyma³ wyci¹gniêtego miecza.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_11"); //Da³bym sobie uci¹æ wszystkie cz³onki, ¿e oni tam rozmawiali.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_12"); //Dopiero na nasz widok Tony podniós³ larum. Wybiliœmy stra¿ników, a on powiedzia³, ¿e by³ ich wiêŸniem.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_13"); //To nam w zupe³noœci wystarczy³o. Potem przyprowadzi³ nas do obozu.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_14"); //Brzmi przekonywuj¹co...
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_15"); //Co teraz zrobimy?
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_16"); //Zdob¹dŸ zaufanie Toniego. Niech doprowadzi Ciê do tego, komu sk³ada meldunki.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_17"); //Musimy zlikwidowaæ ca³¹ siatkê. Tony to tylko informator, ciekaw jestem z kim i gdzie siê spotyka.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_18"); //Dajê Ci na to trzy dni. Do tego czasu musisz ustaliæ, z kim i gdzie spotyka siê Tony.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_19"); //Zrobiê co w mojej mocy.
   AI_Output (self, other,"DIA_Cavalorn_Spy1_Tony_12_20"); //I pamiêtaj, ¿e mo¿esz polegaæ tylko na sobie. Nikt z obozu nie wie o Twoim zadaniu. B¹dŸ ostro¿ny.
   AI_Output (other, self, "DIA_Cavalorn_Spy1_Tony_15_21"); //Bêdê, bywaj.
   
   cav_spy = B_SetDayTolerance()+3;
   B_LogEntry(CH2_Rbl_Spy, "Przekona³em Cavalorna, ¿e zdrajc¹ jest Tony. Muszê zdobyæ jego zaufanie i dowiedzieæ siê, komu przekazuje informacje. Muszê jak najszybciej porozmawiaæ z Tonym. Cavalorn da³ mi 3 dni na rozwi¹zanie tej zagadki.");
   Info_ClearChoices (DIA_Cavalorn_Spy1);   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Cavalorn_Spy11 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 34;
   condition      = DIA_Cavalorn_Spy11_Condition;
   information      = DIA_Cavalorn_Spy11_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam Toniego!"; 
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
   AI_Output (self, other,"DIA_Cavalorn_Spy11_12_02"); //Przyzna³ siê?
   AI_Output (other, self, "DIA_Cavalorn_Spy11_15_03"); //Poniek¹d, tak. Spotkam siê z nim po zmierzchu. Wtedy dowiem siê wiêcej.
   AI_Output (self, other,"DIA_Cavalorn_Spy11_12_04"); //Œmierdzi mi to pu³apk¹.
   AI_Output (other, self, "DIA_Cavalorn_Spy11_15_05"); //Wiem, ale bêdê ostro¿ny. Poza tym nie mam wyboru. To mo¿e byæ jedyna szansa, ¿eby dowiedzieæ siê czegoœ wiêcej.
   AI_Output (self, other,"DIA_Cavalorn_Spy11_12_06"); //Masz racjê, ale miej oczy szeroko otwarte. Nie nara¿aj siê niepotrzebnie.
   AI_Output (other, self, "DIA_Cavalorn_Spy11_15_07"); //Poradzê sobie, bywaj.
   B_LogEntry(CH2_Rbl_Spy, "Powiedzia³em Cavalornowi o spotkaniu z Tonim. Cavalorn przestrzeg³ mnie, ¿e to mo¿e byæ pu³apka. Muszê zaryzykowaæ, w koñcu wychodzi³em ca³o z gorszych opresji.");
};

INSTANCE DIA_Cavalorn_SpyEnd (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 57;
   condition      = DIA_Cavalorn_SpyEnd_Condition;
   information      = DIA_Cavalorn_SpyEnd_Info;
   permanent      = 0;
   important      = 1;
   description      = "..."; 
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
   
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_01"); //¯yjesz! S³ysza³em, co siê sta³o.
   AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_02"); //Ch³opaki trochê siê zapêdzili. Na szczêœcie jakoœ wygrzeba³em siê z G³êbi.
   
   if (Npc_KnowsInfo (hero, DIA_Spider_Escape))
   {
      AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_03"); //Czasami i w s³owach szaleñca mo¿na odnaleŸæ ziarno prawdy...
   };
   
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_04"); //Krew mnie zala³a, kiedy siê dowiedzia³em, co ci idioci zrobili.
   AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_05"); //Quentin i Aidan s¹ w porz¹dku. Wstawili siê za mn¹, chcieli poczekaæ na ciebie.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_06"); //Wiem. Abel jest przewra¿liwiony i wszêdzie widzi wrogów. Œwistak to chor¹giewka na wietrze, pójdzie za g³osem wiêkszoœci.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_07"); //R¹czka to idiota, który a¿ siê prosi o jakiœ wypadek z belk¹, która spadnie mu na g³owê. 
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_08"); //Ale po Foxie siê tego nie spodziewa³em...
   AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_09"); //W takich chwilach najlepiej widaæ, jak potrzebny jest silny przywódca.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_10"); //Naprawdê cieszê siê, ¿e Ciê widzê.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_11"); //Dowiedzia³eœ siê, kto zabi³ Toniego?
   AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_12"); //Nie i pewnie nigdy siê tego nie dowiem, ale na milê zalatuje mi to Hrabi¹.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_13"); //Ten sukinsyn jest naprawdê niebezpieczny. Musimy siê go pozbyæ i to jak najszybciej.
   AI_Output (other, self, "DIA_Cavalorn_SpyEnd_15_14"); //Te¿ o tym myœla³em. Bêdê to mia³ na uwadze.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_15"); //Dobra, wystarczy ju¿ o tym co by³o. 
   
   Create_and_give(ItMiNugget, 200);
   
   AI_Output (self, other, "DIA_Cavalorn_SpyEnd_12_16"); //Przyjmij tê rudê, jako zadoœæuczynienie za zes³anie do G³êbi oraz jako zap³atê za pomoc w szukaniu szpiega.
   AI_Output (self, other,"DIA_Cavalorn_SpyEnd_12_19"); //Naprawdê siê cieszê, ¿e widzê ciê wœród ¿ywych, Rick. Odpocznij trochê, bo wkrótce pewnie bêdê mia³ dla ciebie robotê.
   
   B_LogEntry(CH1_Rbl_Hrabia, "Cavalorn da³ mi jasno do zrozumienia, ¿e œmieræ Hrabiego bardzo by go ucieszy³a. Muszê siê nad tym solidnie zastanowiæ.");
};

INSTANCE DIA_Cavalorn_NCRebel (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 57;
   condition      = DIA_Cavalorn_NCRebel_Condition;
   information      = DIA_Cavalorn_NCRebel_Info;
   permanent      = 0;
   important      = 1;
   description      = "..."; 
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
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_00"); //Widzê, ¿e jesteœ ju¿ gotowy na kolejne zadanie.
   AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_01"); //Co tym razem?
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_02"); //Po odparciu ataku stra¿ników, Gomez wzmocni³ obronê Starego Obozu. Urt przes³a³ mi raport, w którym twierdzi, ¿e przygotowania jeszcze bardziej siê przeci¹gn¹.
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_03"); //Napisa³ te¿, ¿e sytuacja w Nowym Obozie staje siê doœæ 'niestabilna'.
   AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_04"); //Co siê dzieje?
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_05"); //Podobno szykuje siê tam ma³a rebelia.
   AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_06"); //Ciekawe...
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_07"); //Dlatego chcia³bym, ¿ebyœ siê tam dyskretnie rozejrza³.
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_08"); //Skontaktuj siê z buntownikami. Musimy im pomóc w puczu.
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_09"); //Wtedy bêdziemy trzymaæ Gomeza za jaja.
   AI_Output (other, self, "DIA_Cavalorn_NCRebel_15_10"); //Rozumiem. Wrócê, kiedy dowiem siê czegoœ wiêcej.
   AI_Output (self, other, "DIA_Cavalorn_NCRebel_12_11"); //Powodzenia, przyjacielu.

   Log_CreateTopic(CH4_RBL_NCRebel, LOG_MISSION);
   Log_SetTopicStatus(CH4_RBL_NCRebel, LOG_RUNNING);
   B_LogEntry(CH4_RBL_NCRebel, "W Nowym Obozie szykuje siê rebelia. Cavalorn poprosi³ mnie, ¿ebym rozezna³ siê w sytuacji. Czas trochê rozprostowaæ koœci...");
   
   B_Kapitelwechsel(4);
};

/*****************************

Chapter 6

*****************************/

INSTANCE DIA_Cavalorn_NCFinish (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 60;
   condition      = DIA_Cavalorn_NCFinish_Condition;
   information      = DIA_Cavalorn_NCFinish_Info;
   permanent      = 0;
   important      = 0;
   description      = "Wracam z Nowego Obozu."; 
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
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_02"); //Jak wygl¹da sytuacja?
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_03"); //Jest stabilna. Lee panuje nad wszystkim.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_04"); //Dobrze to s³yszeæ. A jeszcze lepiej, ¿e ju¿ wróci³eœ.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_05"); //Nowe k³opoty?
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_06"); //Raczej stare w nowej ods³onie. Nadszed³ czas, aby ostatecznie rozliczyæ siê z Gomezem.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_07"); //Nareszcie. Od czego zaczniemy?
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_08"); //Musisz znowu rozejrzeæ siê w Starym Obozie. Kilka dni temu urwa³ siê kontakt z Urtem i Diego.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_09"); //Obawiam siê najgorszego.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_10"); //Lepiej ¿ebyœ siê myli³. Urt œwietnie zorganizowa³ dywersjê, a Diego mia³ wp³yn¹æ na kopaczy i cienie. Je¿eli ci dwaj wypadli z gry, to atak na Stary Obóz bardziej nas wykrwawi.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_11"); //Wiem o tym, dlatego cieszê siê na Twój widok. Musisz odnaleŸæ Urta i Diego.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_12"); //Nie rozpoczniemy ataku, zanim nie dowiem siê, co siê tam wyprawia. Zbyt wielu dobrych ludzi mog³oby zgin¹æ...
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_13"); //Dobra, zrobiê to. Ale pod jednym warunkiem.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_14"); //Ty stawiasz warunki? To ciekawe...
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_15"); //Wszystko co znajdê w komnacie Gomeza nale¿y do mnie.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_16"); //Wyrachowany do koñca. Niech bêdzie, mi zale¿y tylko na g³owie tego sukinsyna. Reszta jest Twoja.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_17"); //To chcia³em us³yszeæ. Jak dowiem siê czegoœ wiêcej, natychmiast dam Ci znaæ.
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_18"); //Porozmawiaj jeszcze z Ratfordem, zdaje siê, ¿e on te¿ siê za Tob¹ stêskni³.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_19"); //Odpowiedzialnoœæ za ten obóz zaczyna mi ju¿ ci¹¿yæ. Za d³ugo przebywam na suchym l¹dzie...
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_20"); //Ju¿ nied³ugo Rick wszystko siê zmieni. Wtedy ka¿dy z nas pójdzie w³asn¹ drog¹.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_21"); //Nie zrozum mnie Ÿle. Wierzê, ¿e nic nie dzieje siê bez powodu, ale to nie miejsce dla mnie. 
   AI_Output (self, other,"DIA_Cavalorn_NCFinish_12_22"); //Ani dla wiêkszoœci z nas. Zrób, co do Ciebie nale¿y, a wszyscy st¹d znikniemy.
   AI_Output (other, self, "DIA_Cavalorn_NCFinish_15_23"); //W porz¹dku, zobaczê, co da siê zrobiæ.

   Log_SetTopicStatus(CH4_RBL_NCRebel, LOG_SUCCESS);
   B_LogEntry(CH4_RBL_NCRebel, "Sytuacja w Nowym Obozie znowu jest stabilna. Czas zaj¹æ siê czymœ innym.");

   Log_CreateTopic(CH6_RBL_Recognise, LOG_MISSION);
   Log_SetTopicStatus(CH6_RBL_Recognise, LOG_RUNNING);
   B_LogEntry(CH6_RBL_Recognise, "Zabawa rozpoczyna siê od pocz¹tku. Muszê dowiedzieæ siê, co s³ychaæ u Urta i Diego.");
      var C_NPC diego; diego = Hlp_GetNpc(PC_Thief);
         Npc_ExchangeRoutine   (diego, "JAIL");
};

INSTANCE DIA_Cavalorn_OCFinish (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 61;
   condition      = DIA_Cavalorn_OCFinish_Condition;
   information      = DIA_Cavalorn_OCFinish_Info;
   permanent      = 0;
   important      = 0;
   description      = "Wracam ze Starego Obozu."; 
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
   AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_02"); //Jak wygl¹da sytuacja?
   AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_03"); //Napiêta i niestabilna. Uda³o mi siê uwolniæ Diego, ale nie mo¿emy byæ pewni cieni ani kopaczy.
   AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_04"); //Co siê sta³o?
   AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_05"); //Urt okaza³ siê zdrajc¹. Stra¿nicy przygotowali siê na atak, ale nie zauwa¿y³em ¿adnej zasadzki w tunelu.
   AI_Output (self, other,"DIA_Cavalorn_OCFinish_12_06"); //Nadszed³ Czas Zap³aty. Powiedz Ratfordowi, ¿e jesteœmy gotowi do ataku na Stary Obóz.
   AI_Output (other, self, "DIA_Cavalorn_OCFinish_15_07"); //W³aœnie to chcia³em us³yszeæ!
   Log_SetTopicStatus(CH6_RBL_Recognise, LOG_SUCCESS);
   B_LogEntry(CH6_RBL_Recognise, "Rozpoznanie skoñczone, ruszamy na Stary Obóz!");
};



/*****************************
HIDDEOUT1 - wejscie w jaskini
HIDDEOUT10 - wyjœcie w piwnicach
******************************/


//********************************************************

INSTANCE DIA_Cavalorn_Tunel (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 62;
   condition      = DIA_Cavalorn_Tunel_Condition;
   information      = DIA_Cavalorn_Tunel_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_00"); //W koñcu jesteœ!
   AI_Output (other, self, "DIA_Cavalorn_Tunel_15_01"); //Ruszamy?
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_02"); //Tak, ale w ma³ej grupie, tak bêdzie bezpieczniej gdyby przygotowali zasadzkê.
   AI_Output (other, self, "DIA_Cavalorn_Tunel_15_03"); //Wczeœniej tunel by³ 'czysty'.
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_04"); //Mo¿liwe, ale stra¿nicy nie s¹ idiotami. Mogli ciê obserwowaæ.
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_05"); //Ty Rick i twoi ludzie pójdziecie ze mn¹ w awangardzie. 
   AI_TurnToNpc(self, ratford);
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_06"); //Ratford poprowadzisz resztê po stu uderzeniach serca.
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_07"); //Jesteœ gotów?
   AI_Output (other, self, "DIA_Cavalorn_Tunel_15_08"); //Zawsze i wszêdzie. ProwadŸ.
   AI_Output (self, other,"DIA_Cavalorn_Tunel_12_09"); //Za mn¹!
   
   Party_AddNpc(self);
   Npc_ExchangeRoutine(self,"HIDDOUT");

   B_LogEntry(CH6_RBL_PayDay, "Podzieliliœmy siê. Razem z Cavalornem i piratami sprawdzimy tunel. Ratford z reszt¹ wyrusz¹ za nami.");
   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_Tunel1 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 62;
   condition      = DIA_Cavalorn_Tunel1_Condition;
   information      = DIA_Cavalorn_Tunel1_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_Tunel1_12_00"); //IdŸ pierwszy, bêdziemy tu¿ za tob¹!
   
   B_StopProcessInfos(self);
   
   B_Dungeon_Trap();
   // Ork: Bossfight tutaj? chyba tak:
      BOSSFIGHT_CURRENT = BOSSFIGHT_FGT4;
		
	B_ExchangeRoutine(gomez, "HIDE");
};

//********************************************************

INSTANCE DIA_Cavalorn_TunelTrap (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 63;
   condition      = DIA_Cavalorn_TunelTrap_Condition;
   information      = DIA_Cavalorn_TunelTrap_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_01"); //Jednak mia³em nosa. Czeka na nas komitet powitalny.
   AI_Output (self, other, "DIA_Cavalorn_TunelTrapAfter_12_02"); //Zróbmy z nich œliczn¹ siekankê!
   
   //dodaæ rebeliantów do SO! - w sumie nie trzeba, oni i tak szli za dickiem
   
   B_StopProcessInfos(self);
   
   B_Trap_Hostile_grd();
};

//********************************************************

INSTANCE DIA_Cavalorn_TunelTrapAfter (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 63;
   condition      = DIA_Cavalorn_TunelTrapAfter_Condition;
   information      = DIA_Cavalorn_TunelTrapAfter_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
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
   AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_01"); //Tych mamy z g³owy, teraz musimy przebiæ siê do zamku.
   AI_Output (self, other,"DIA_Cavalorn_TunelTrapAfter_12_02"); //Za mn¹!   
   Npc_ExchangeRoutine(self,"FightInCastle");   
   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_Castle (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 65;
   condition      = DIA_Cavalorn_Castle_Condition;
   information      = DIA_Cavalorn_Castle_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_Castle_Condition()
{
   /****************************
ten wp to ten sam w którym sta³ Diego w lochu

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
   B_LogEntry(CH6_RBL_PayDay, "Ruszyliœmy za Cavalornem do zamku.");
   Npc_ExchangeRoutine(self, "CASTLE");
   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_CastleIn (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 66;
   condition      = DIA_Cavalorn_CastleIn_Condition;
   information      = DIA_Cavalorn_CastleIn_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_CastleIn_Condition()
{

   if (Npc_KnowsInfo (hero,DIA_Cavalorn_Castle))&&(Npc_GetDistToWP (self,"OCC_BARONS_ENTRANCE_DOWNSTAIRS") < 500)
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_CastleIn_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cavalorn_CastleIn_12_01"); //Szybciej, widzia³em jak Gomez znika w podziemiach!
   AI_Output (other, self, "DIA_Cavalorn_CastleIn_15_02"); //Jestem tu¿ za Tob¹!

   B_LogEntry(CH6_RBL_PayDay, "Gomez uciek³ do podziemi, idziemy jego tropem.");
   Npc_ExchangeRoutine(self, "CELLAR");
   B_StopProcessInfos(self);
};

//********************************************************

INSTANCE DIA_Cavalorn_CastleIn1 (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 66;
   condition      = DIA_Cavalorn_CastleIn1_Condition;
   information      = DIA_Cavalorn_CastleIn1_Info;
   permanent      = 0;
   important      = 1;
   description      = "."; 
};

FUNC INT DIA_Cavalorn_CastleIn1_Condition()
{
   if (Npc_KnowsInfo (hero,DIA_Cavalorn_CastleIn))&&(Npc_GetDistToWP (self,"OCC_LADDER_TOP") < 800)
   {
      return 1;
   };
};

FUNC VOID DIA_Cavalorn_CastleIn1_Info()
{
   B_FullStop (hero);
   AI_GotoNpc(other, self);
   AI_TurnToNpc(self, other);
   AI_Output (self, other, "DIA_Cavalorn_CastleIn1_12_01"); //ZejdŸ na dó³ i poszukaj przejœcia. My ich zatrzymamy!

   B_LogEntry(CH6_RBL_PayDay, "Gomez uciek³ do podziemi, idziemy jego tropem.");
   Npc_ExchangeRoutine(self, "DEFEND");
	Wld_InsertItem(ITKE_DUNG_KEY,"OCC_CELLAR_FIRST_ROOM");
   
   B_Pirats_Wait();

   B_StopProcessInfos(self);
};

/**********************************

SIDE QUEST

*********************************/

//********************************************************

INSTANCE DIA_Cavalorn_Leaf (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 70;
   condition      = DIA_Cavalorn_Leaf_Condition;
   information      = DIA_Cavalorn_Leaf_Info;
   permanent      = 0;
   important      = 0;
   description      = "Mam pewien problem z Leafem."; 
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
   AI_Output (self, other, "DIA_Cavalorn_Leaf_12_02"); //Co tym razem wymyœli³?
   AI_Output (other, self, "DIA_Cavalorn_Leaf_15_03"); //(Rick streszcza historiê z kamieniem filozoficznym)
   AI_Output (self, other, "DIA_Cavalorn_Leaf_12_04"); //I dobrze, niech œpi. Bêdzie przynajmniej trochê spokoju.
   AI_Output (other, self, "DIA_Cavalorn_Leaf_15_05"); //W takim razie...
   AI_Output (self, other, "DIA_Cavalorn_Leaf_12_06"); //Zaczekaj. Niestety potrzebujê ka¿dego cz³owieka, musimy coœ z tym zrobiæ.
   AI_Output (self, other, "DIA_Cavalorn_Leaf_12_07"); //Porozmawiaj z Quentinem. Obi³o mi siê o uszy, ¿e kiedyœ by³ pomocnikiem alchemika. Mo¿e zna jakiœ specyfik, który pomo¿e Leafowi.
   AI_Output (other, self, "DIA_Cavalorn_Leaf_15_08"); //Mówimy o tym samym Quentinie?
   AI_Output (self, other, "DIA_Cavalorn_Leaf_12_09"); //Ludzie nie rodz¹ siê skazañcami. Bywaj.
   B_LogEntry(CH1_RBL_Stone, "Cavalorn poradzi³ mi, abym porozmawia³ z Quentinem, który kiedyœ by³ pomocnikiem alchemika. Mo¿e on zna jakiœ specyfik, który pomo¿e Leafowi.");
};

//********************************************************

INSTANCE DIA_Cavalorn_Kuva (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 71;
   condition      = DIA_Cavalorn_Kuva_Condition;
   information      = DIA_Cavalorn_Kuva_Info;
   permanent      = 0;
   important      = 0;
   description      = "Znasz kogoœ, kto potrafi warzyæ mikstury?"; 
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
   AI_Output (other, self, "DIA_Cavalorn_Kuva_15_01"); //Znasz kogoœ, kto potrafi warzyæ mikstury?
   AI_Output (self, other, "DIA_Cavalorn_Kuva_12_02"); //Milten, mo¿e Quentin. Aha i Nabil, czasami siê tutaj krêci.
   AI_Output (self, other, "DIA_Cavalorn_Kuva_12_03"); //Dlaczego pytasz?
   AI_Output (other, self, "DIA_Cavalorn_Kuva_15_04"); //Mam podejrzany specyfik, który mo¿e byæ trucizn¹ i muszê dowiedzieæ siê czyja to robota.
   AI_Output (self, other, "DIA_Cavalorn_Kuva_12_05"); //W takim razie poszukaj Nabila. To typ spod ciemnej gwiazdy. 
   AI_Output (self, other, "DIA_Cavalorn_Kuva_12_06"); //Czasami przychodzi do obozu i sprzedaje ró¿ne mikstury. Z tego co wiem, potrafi warzyæ trucizny. Nie wiem, gdzie obozuje, to skryty cz³owiek.
   AI_Output (other, self, "DIA_Cavalorn_Kuva_15_07"); //Dziêki, Cavalorn. Bardzo mi pomog³eœ.

   B_LogEntry(CH1_RBL_Cage, "Cavalorn powiedzia³, ¿e tylko Nabil móg³by uwarzyæ truciznê. Muszê go odnaleŸæ.");
};

INSTANCE DIA_Cavalorn_CrimeAgain (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 3;
   condition      = DIA_Cavalorn_CrimeAgain_Condition;
   information      = DIA_Cavalorn_CrimeAgain_Info;
   permanent      = 1;
   important      = 1;
   description      = "..."; 
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
   AI_Output (self, other,"DIA_Cavalorn_CrimeAgain_12_01"); //Przyszed³eœ zap³aciæ karê?            
   
   B_Say_Gold (self, other,GOLDPENALTY_MURDER+GOLDPENALTY_DEFEAT+GOLDPENALTY_THEFT);         
   
   Info_ClearChoices (DIA_Cavalorn_CrimeAgain);
   if(npc_hasitems(hero,itminugget)>=Global_Crime_goldToPay)
   {
      Info_AddChoice (DIA_Cavalorn_CrimeAgain, "Zap³acê karê.", DIA_Cavalorn_Crime_Yes);
   };
   Info_AddChoice (DIA_Cavalorn_CrimeAgain, "Nie mam tyle rudy!", DIA_Cavalorn_Crime_No);
};

INSTANCE DIA_Cavalorn_Crime (C_INFO)
{
   npc            = HUN_336_CAVALORN;
   //nr            = 3;
   condition      = DIA_Cavalorn_Crime_Condition;
   information      = DIA_Cavalorn_Crime_Info;
   permanent      = 1;
   important      = 1;
   description      = "..."; 
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
      AI_Output (self, other, "DIA_Cavalorn_Crime_12_01"); //Jeszcze z Tob¹ nie rozmawia³em, a ju¿ s³yszê o przestêpstwach które pope³ni³eœ!      
   }
   if(GOLDPENALTY_MURDER)
   {
      AI_Output (self, other,"DIA_Cavalorn_Crime_12_02"); //Zamordowa³eœ jednego z cz³onków obozu, byli œwiadkowie.      
   };
   //DEFEAT
   if(GOLDPENALTY_MURDER)&&(GOLDPENALTY_DEFEAT)
   {
      AI_Output (self, other,"DIA_Cavalorn_Crime_12_03"); //Dosz³y mnie s³uchy, ¿e kogoœ pobi³eœ.   
      if(GOLDPENALTY_DEFEAT>75)
      {
         AI_Output (self, other,"DIA_Cavalorn_Crime_12_04"); //S¹ œwiadkowie.
      };   
   }
   else if(GOLDPENALTY_DEFEAT)
   {
      AI_Output (self, other,"DIA_Cavalorn_Crime_12_05"); //S³ysza³em, ¿e kogoœ pobi³eœ.   
      if(GOLDPENALTY_DEFEAT>75)
      {
         AI_Output (self, other,"DIA_Cavalorn_Crime_12_04"); //S¹ œwiadkowie.
      };      
   };
   //THEFT   
   if((GOLDPENALTY_MURDER)||(GOLDPENALTY_DEFEAT))&&(GOLDPENALTY_THEFT)
   {
      AI_Output (self, other,"DIA_Cavalorn_Crime_12_07"); //Na domiar z³ego, ukrad³eœ przedmioty nale¿¹ce do mieszkañców obozu.   
      if(GOLDPENALTY_THEFT>25)
      {
         AI_Output (self, other,"DIA_Cavalorn_Crime_12_08"); //Donios³o mi o tym kilka osób.
      };   
   }
   else if(GOLDPENALTY_THEFT)
   {
      AI_Output (self, other,"DIA_Cavalorn_Crime_12_09"); //Ukrad³eœ przedmioty nale¿¹ce do mieszkañców obozu.            
   };   
   
   AI_Output (self, other,"DIA_Cavalorn_Crime_12_10"); //Nie mo¿emy tolerowaæ przestêpstwa w obozie.            
   AI_Output (self, other,"DIA_Cavalorn_Crime_12_11"); //Fakt, ¿e jesteœ skazañcem czy piratem to ¿adne usprawiedliwienie.            
   AI_Output (self, other,"DIA_Cavalorn_Crime_12_12"); //Muszê Cie ukaraæ, ku przestrodze innych.            
   AI_Output (self, other,"DIA_Cavalorn_Crime_12_13"); //Je¿eli chcesz oczyœciæ swoje imiê, bêdziesz musia³ zap³aciæ.            
   AI_Output (self, other,"DIA_Cavalorn_Crime_12_14"); //Kara wynosi...   
   B_Say_Gold (self, other,GOLDPENALTY_MURDER+GOLDPENALTY_DEFEAT+GOLDPENALTY_THEFT);         

   Info_ClearChoices (DIA_Cavalorn_Crime);
   if(npc_hasitems(hero,itminugget)>=Global_Crime_goldToPay)
   {
      Info_AddChoice (DIA_Cavalorn_Crime, "Zap³acê karê.", DIA_Cavalorn_Crime_Yes);
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
   
   AI_Output (other, self, "DIA_Cavalorn_Crime_Yes_15_15"); //Zap³acê karê.
   AI_Output (self, other, "DIA_Cavalorn_Crime_Yes_12_16"); //Dobrze wiêc, Twoje imiê zostaje oczyszczone. Przynajmniej na jakiœ czas...
   
   B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Cavalorn_Crime_No()
{
   AI_Output (other, self, "DIA_Cavalorn_Crime_No_15_17"); //Nie mam tyle rudy.
   AI_Output (self, other, "DIA_Cavalorn_Crime_No_12_18"); //Nie bêdê grzeba³ Ci po kieszeniach...
   AI_Output (self, other, "DIA_Cavalorn_Crime_No_12_19"); //Dobrze radzê, zap³aæ tê rudê jak najszybciej.
   B_StopProcessInfos(self);
};