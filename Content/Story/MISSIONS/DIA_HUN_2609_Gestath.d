// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Gestath_Exit (C_INFO)
{
	npc			= HUN_2609_GESTATH;
	nr			= 999;
	condition	= DIA_Gestath_Exit_Condition;
	information	= DIA_Gestath_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Gestath_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gestath_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

var int gestath_y;
var int gestath_n;

INSTANCE DIA_Gestath_Hello (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 1;
	condition		= DIA_Gestath_Hello_Condition;
	information		= DIA_Gestath_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Gestath_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Gestath_Hello_Info()
{
	AI_Output (self, other, "DIA_Gestath_Hello_11_01"); //Kim Ty do cholery jesteœ i co tutaj robisz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_02"); //Móg³bym zapytaæ o to samo.
	AI_Output (self, other, "DIA_Gestath_Hello_11_03"); //Masz szczêœcie, ¿e mam mocne nerwy i nie puœci³em ciêciwy. Czego tu szukasz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_04"); //Zwiedzam...
	AI_Output (self, other, "DIA_Gestath_Hello_11_05"); //Wybra³eœ niezbyt fortunne miejsce na przechadzkê.
	AI_Output (self, other, "DIA_Gestath_Hello_11_06"); //Jestem Gestath, myœliwy. Jakiœ czas pracowa³em dla Gomeza.
	AI_Output (self, other, "DIA_Gestath_Hello_11_07"); //Ale od niedawna polujê na w³asny rachunek.
	AI_Output (other, self, "DIA_Gestath_Hello_15_08"); //Nale¿ysz do Starego Obozu? Je¿eli tak...
   
	AI_DrawWeapon (self);
   AI_DrawWeapon (other);
   
	AI_Output (self, other, "DIA_Gestath_Hello_11_09"); //Spokojnie. Schowaj ¿elastwo, zanim komuœ stanie siê krzywda.
	AI_Output (self, other, "DIA_Gestath_Hello_11_10"); //Ju¿ nie pracujê dla Gomeza. 
   
   AI_RemoveWeapon (other);
	AI_RemoveWeapon (self);
   
	AI_Output (other, self, "DIA_Gestath_Hello_15_11"); //Móg³byœ mówiæ jaœniej?
	AI_Output (self, other, "DIA_Gestath_Hello_11_12"); //Czemu nie, mam teraz sporo wolnego czasu.
	AI_Output (self, other, "DIA_Gestath_Hello_11_13"); //Trafi³em do Kolonii w poszukiwaniu brata.
	AI_Output (other, self, "DIA_Gestath_Hello_15_14"); //Brata? Czy ja dobrze zrozumia³em? Da³eœ wtr¹ciæ siê za barierê, ¿eby znaleŸæ brata?!
	AI_Output (self, other, "DIA_Gestath_Hello_11_15"); //Tak. By³em mu to winien. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_16"); //Widzisz. Jakiœ czas temu polowaliœmy razem w królewskich lasach.
	AI_Output (other, self, "DIA_Gestath_Hello_15_17"); //Chcia³eœ powiedzieæ, ¿e k³usowaliœcie.
	AI_Output (self, other, "DIA_Gestath_Hello_11_18"); //Jak zwa³, tak zwa³. Mniejsza o semantykê.
	AI_Output (self, other, "DIA_Gestath_Hello_11_19"); //Nie polowaliœmy jednak na byle co.
	AI_Output (self, other, "DIA_Gestath_Hello_11_20"); //S³ysza³eœ kiedyœ o lodowym trollu?
	AI_Output (other, self, "DIA_Gestath_Hello_15_21"); //Nie, nigdy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_22"); //Bo ma³o kto o tym stworzeniu s³ysza³. Ja te¿ zawsze uwa¿a³em tê bestiê za wymys³ bardów.
	AI_Output (self, other, "DIA_Gestath_Hello_11_23"); //Jednak lodowe trolle ¿yj¹. I uwierz mi, ¿e czarny troll przy nim, to niegroŸny szczeniaczek.
	AI_Output (other, self, "DIA_Gestath_Hello_15_24"); //Mów dalej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_25"); //Dowiedzieliœmy siê, ¿e jedna z tych bestii spustoszy³a kilka wiosek u podnó¿a gór. Ruszyliœmy na ³owy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_26"); //Jednak do zabicia takiego cholerstwa potrzeba specjalnej broni i specjalnej amunicji.
	AI_Output (self, other, "DIA_Gestath_Hello_11_27"); //Szukaliœmy czarnodrzewa na ³uk i królewskiej harpii na pióra do brzechwy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_28"); //Niestety królewskie harpie ¿yj¹ tylko w królewskim lesie, a do tego s¹ oczkiem w g³owie Rhobara.
	AI_Output (self, other, "DIA_Gestath_Hello_11_29"); //Król uwielbia na nie polowaæ, co trzeba przyznaæ, jest doœæ niebezpiecznym zajêciem.
	AI_Output (self, other, "DIA_Gestath_Hello_11_30"); //Mieliœmy pecha, bo kiedy po³o¿yliœmy dwie harpie, napatoczy³ siê królewski ³owczy. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_31"); //Ja zdo³a³em skoczyæ z grani, ale Cavalorn zosta³. Jestem pewien, ¿e te¿ móg³by daæ nogê, ale ten idiota chcia³ daæ mi szansê na ucieczkê.
	AI_Output (other, self, "DIA_Gestath_Hello_15_32"); //Cavalorn? To twój brat?
	AI_Output (self, other, "DIA_Gestath_Hello_11_33"); //Tak. Mo¿e go znasz?
	AI_Output (other, self, "DIA_Gestath_Hello_15_34"); //Kto wie. Mów dalej, to zaczyna siê robiæ coraz ciekawsze.
	AI_Output (self, other, "DIA_Gestath_Hello_11_35"); //Brat nie wyda³ mnie. Wzi¹³ ca³¹ winê na siebie. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_36"); //Trochê czasu zajê³o mi wywiedzenie siê, gdzie go wys³ali. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_37"); //Sprzeda³em ca³y dobytek na ³apówki, ale by³o warto.
	AI_Output (self, other, "DIA_Gestath_Hello_11_38"); //W koñcu dowiedzia³em siê, ¿e zosta³ zes³any do Kolonii Karnej na wyspie Khorinis.
	AI_Output (self, other, "DIA_Gestath_Hello_11_39"); //Problem tkwi³ w tym, ¿e okrêty handlowe ju¿ nie p³ywa³y do Khorinis. Wszyscy bali siê orków.
	AI_Output (self, other, "DIA_Gestath_Hello_11_40"); //Moj¹ jedyn¹ szans¹ by³a galera ze skazañcami.
	AI_Output (self, other, "DIA_Gestath_Hello_11_41"); //Prawie wszyscy skazani za wiêksze przewinienia trafiali do Kolonii, bo król potrzebowa³ rudy.
	AI_Output (self, other, "DIA_Gestath_Hello_11_42"); //Nie mia³em nic do stracenia.
	AI_Output (self, other, "DIA_Gestath_Hello_11_43"); //Pod okiem ³owczego zaciuka³em królewsk¹ harpiê. Do tego ubi³em te¿ konia pod samym Rhobarem!
	AI_Output (self, other, "DIA_Gestath_Hello_11_44"); //Ma³o tego nie przep³aci³em g³ow¹.
	AI_Output (self, other, "DIA_Gestath_Hello_11_45"); //Na szczêœcie król doceni³ mój strza³ - trafi³em harpiê w oko ze stu kroków!
	AI_Output (self, other, "DIA_Gestath_Hello_11_46"); //Dosta³em bilet w jedn¹ stronê do Kolonii Karnej i tak siê tu znalaz³em.
	AI_Output (self, other, "DIA_Gestath_Hello_11_47"); //Kiedy trafi³em do Starego Obozu zacz¹³em wypytywaæ o Cavalorna. W miêdzyczasie wykona³em kilka zleceñ dla Gomeza.
	AI_Output (self, other, "DIA_Gestath_Hello_11_48"); //Cieniostwory, zêbacze, trolle. Trochê z tego co upolowa³em, powinno jeszcze znajdowaæ siê w skrzyniach ukrytych w wie¿y zamkowej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_49"); //Niestety mia³em pecha. Gomezowi odbi³o i zabi³ magów ognia. 
	AI_Output (self, other, "DIA_Gestath_Hello_11_50"); //Z³orzeczy³ te¿ na jakiegoœ Bezimiennego sukinsyna.
	AI_Output (self, other, "DIA_Gestath_Hello_11_51"); //A ja po cichu ulotni³em siê ze Starego Obozu.
	AI_Output (self, other, "DIA_Gestath_Hello_11_52"); //Mia³em w³aœnie na nowo rozpocz¹æ poszukiwania brata, kiedy zjawi³eœ siê Ty.
	AI_Output (other, self, "DIA_Gestath_Hello_15_53"); //I dobrze siê sta³o. Wiem, gdzie obozuje Cavalorn.
	AI_Output (self, other, "DIA_Gestath_Hello_11_54"); //Co?! Mów! Gdzie jest mój brat?!
	AI_Output (other, self, "DIA_Gestath_Hello_15_55"); //Przewodzi obozowi rebeliantów. Mówi ci to coœ?
	AI_Output (self, other, "DIA_Gestath_Hello_11_56"); //Tak. Gomez coœ przeb¹kiwa³ o tych rebeliantach. Ale zdaje siê, ¿e nie traktowa³ ich powa¿nie.
	AI_Output (other, self, "DIA_Gestath_Hello_15_57"); //W³aœnie teraz obóz rebeliantów przygotowuje siê do odparcia ataku stra¿ników.
	AI_Output (self, other, "DIA_Gestath_Hello_11_58"); //W takim razie nie mo¿e mnie tam zabrakn¹æ! ProwadŸ.
	
   if (q_y==TRUE)
	{
		AI_Output (other, self, "DIA_Gestath_Hello_15_59"); //Cavalornowi przyda siê ka¿da pomoc. Ktoœ z twoimi umiejêtnoœciami bêdzie cennym 'nabytkiem' dla obozu.	
		AI_Output (other, self, "DIA_Gestath_Hello_15_60"); //Poza tym to Twój brat...
	};
   
	AI_Output (self, other, "DIA_Gestath_Hello_11_61"); //Albo poczekaj...
	AI_Output (self, other, "DIA_Gestath_Hello_11_62"); //Nie chcê przywitaæ brata z pustymi rêkami.
	AI_Output (other, self, "DIA_Gestath_Hello_15_63"); //Co masz na myœli?
	AI_Output (self, other, "DIA_Gestath_Hello_11_64"); //Dam mu w prezencie pióra harpii! Przednia myœl!
	AI_Output (self, other, "DIA_Gestath_Hello_11_65"); //W koñcu to przez te bestyjki oboje znaleŸliœmy siê w Kolonii Karnej.
	AI_Output (self, other, "DIA_Gestath_Hello_11_66"); //Co do samego polowania to mam dla Ciebie propozycjê.
	AI_Output (self, other, "DIA_Gestath_Hello_11_67"); //Zwabisz tu kilka z tych paskudztw, a ja uwolniê œwiat od ich skrzeku.
	AI_Output (other, self, "DIA_Gestath_Hello_15_68"); //Nie wiem, czy to taki dobry pomys³. Ty bêdziesz tu sobie spokojnie czeka³, a ja mam robiæ za przynêtê...
	AI_Output (self, other, "DIA_Gestath_Hello_11_69"); //Bez obaw. Te harpie s¹ o po³owê mniejsze od królewskich. Do tego wygl¹daj¹ na wychudzone.
	AI_Output (self, other, "DIA_Gestath_Hello_11_70"); //Niedaleko jest cytadela. Widzia³em tam kilkanaœcie harpii. Wystarczy, ¿e zwabisz tu kilka z tych bestii.
	AI_Output (self, other, "DIA_Gestath_Hello_11_71"); //Co Ty na to?

	Info_ClearChoices (DIA_Gestath_Hello);
	Info_AddChoice (DIA_Gestath_Hello, "Niech bêdzie.", DIA_Gestath_Hello_Yes);
	Info_AddChoice (DIA_Gestath_Hello, "Dziêki, ale nie skorzystam.", DIA_Gestath_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Gestath_Hello_Yes()
{
	gestath_y = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_Hello_Yes_15_01"); //Niech bêdzie.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_02"); //To ruszaj do cytadeli.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_03"); //Zwab tu kilka z tych bestii.
	AI_Output (self, other, "DIA_Gestath_Hello_Yes_11_04"); //Jak z nimi skoñczê, to zaprowadzisz mnie do Cavalorna. 
   
	Log_CreateTopic(CH1_Rbl_Harpies, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Harpies, "Dziwna historia. Spotka³em myœliwego o imieniu Gestath. Okaz³o siê, ¿e jest bratem Cavalorna i trafi³ tu z poczucia winy. Niewa¿ne... W ka¿dym razie Gestath chce pomóc bratu w walce ze stra¿nikami. Nie chce jednak iœæ z pustymi rêkami. Ubzdura³ sobie, ¿e da Cavalornowi w prezencie pióra harpii, a ja mam mu w tym pomóc, zwabiaj¹c kilka z nich do kryjówki myœliwego. No mam nadziejê, ¿e one nie lataj¹ za szybko...");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAITFORHARPIES");
};

// ------------------No----------------

FUNC VOID DIA_Gestath_Hello_No()
{
	gestath_n = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_Hello_No_15_01"); //Dziêki, ale raczej nie skorzystam.
	AI_Output (self, other, "DIA_Gestath_Hello_No_11_02"); //Cholera! Nie chcê powitaæ brata bez prezentu.
	AI_Output (self, other, "DIA_Gestath_Hello_No_11_03"); //Wróæ, jak zmienisz zdanie.
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_CanYouTeachMe (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 4;
	condition		= DIA_Gestath_CanYouTeachMe_Condition;
	information		= DIA_Gestath_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Gestath_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gestath_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Gestath_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Gestath_CanYouTeachMe_15_02"); //Tak, w koñcu jestem myœliwym. Czego konkretnie chcia³byœ siê nauczyæ?
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Gestath jest myœliwym, wiêc mogê siê od niego wiele nauczyæ.");
};

INSTANCE DIA_Gestath_HelloAgain (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 2;
	condition		= DIA_Gestath_HelloAgain_Condition;
	information		= DIA_Gestath_HelloAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zmieni³em zdanie."; 
};

FUNC INT DIA_Gestath_HelloAgain_Condition()
{
	if (gestath_n == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_HelloAgain_Info()
{
	gestath_y = TRUE;
   
	AI_Output (other, self, "DIA_Gestath_HelloAgain_Yes_15_01"); //Zmieni³em zdanie.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_02"); //To œwietnie. W takim razie ruszaj do cytadeli.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_03"); //Zwab tu kilka harpii.
	AI_Output (self, other, "DIA_Gestath_HelloAgain_Yes_11_04"); //Jak z nimi skoñczê, to zaprowadzisz mnie do Cavalorna. 
	Log_CreateTopic(CH1_Rbl_Harpies, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Harpies, "Dziwna historia. Spotka³em myœliwego o imieniu Gestath. Okaz³o siê, ¿e jest bratem Cavalorna i trafi³ tu z poczucia winy. Niewa¿ne... W ka¿dym razie Gestath chce pomóc bratu w walce ze stra¿nikami. Nie chce jednak iœæ z pustymi rêkami. Ubzdura³ sobie, ¿e da Cavalornowi w prezencie pióra harpii, a ja mam mu w tym pomóc, zwabiaj¹c kilka z nich do kryjówki myœliwego. No mam nadziejê, ¿e one nie lataj¹ za szybko...");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT4HARPIES");
};

INSTANCE DIA_Gestath_HarpKill (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 3;
	condition		= DIA_Gestath_HarpKill_Condition;
	information		= DIA_Gestath_HarpKill_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Gestath_HarpKill_Condition()
{
	if (gestath_y == TRUE)&&(Npc_IsDead(harp1))&&(Npc_IsDead(harp2))&&(Npc_IsDead(harp3))&&(Npc_IsDead(harp4))&&(Npc_IsDead(harp5))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_HarpKill_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Gestath_HarpKill_11_01"); //Œwietna robota, wszystkie harpie s¹ martwe!
	AI_Output (self, other,"DIA_Gestath_HarpKill_11_02"); //Zas³u¿y³eœ na ³uk. Oto recepta.
   
	CreateInvItems (self, Recept_ItRw_Bow_Long_04,1); //recepta na ³uk czy ³uk?
	B_GiveInvItems (self, other, Recept_ItRw_Bow_Long_04, 1);//jw
   
	AI_Output (other, self,"DIA_Gestath_HarpKill_15_03"); //Na szczêœcie szybko biegam. 
	Log_SetTopicStatus(CH1_Rbl_Harpies, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Harpies, "Polowanie na harpie zakoñczone, strat w³asny brak! Gestath da³ mi receptê na niez³y ³uk.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_Go (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 4;
	condition		= DIA_Gestath_Go_Condition;
	information		= DIA_Gestath_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ruszajmy do Obozu Rebeliantów."; 
};

FUNC INT DIA_Gestath_Go_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_HarpKill))&&(q_y==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_Go_Info()
{
	B_GiveXP(100);
   
	AI_Output (other, self,"DIA_Gestath_Go_15_01"); //Ruszajmy do Obozu Rebeliantów.
	AI_Output (self, other,"DIA_Gestath_Go_11_02"); //ProwadŸ. Ju¿ nie mogê doczekaæ siê spotkania z bratem!
   
	B_LogEntry(CH1_Rbl_NewMembers, "Zgodzi³em siê zaprowadziæ Gestatha do Obozu Rebeliantów.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Gestath_GoOut (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 5;
	condition		= DIA_Gestath_GoOut_Condition;
	information		= DIA_Gestath_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Gestath_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gestath_Go))&&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Gestath_GoOut_Info()
{
	gestath_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(200);
   
	AI_Output (other, self,"DIA_Gestath_GoOut_15_01"); //Jesteœmy na miejscu. Cavalorna znajdziesz w centrum obozowiska.
	AI_Output (self, other,"DIA_Gestath_GoOut_11_02"); //Dziêki przyjacielu. Nie zapomnê Ci tego.
	AI_Output (self, other,"DIA_Gestath_GoOut_11_03"); //Mamy z bratem tyle do nadrobienia...
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi³em Gestatha do obozu.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"OR");
	B_ExchangeRoutine	(hun_336_cavalorn,"GestathIn");	
	B_StopProcessInfos(self);
	Know_Gestath=TRUE;
};

// **************************************************

INSTANCE DIA_HUN_2609_GESTATH_Stew (C_INFO)
{
	npc				= HUN_2609_GESTATH;
	nr				= 12;
	condition		= DIA_HUN_2609_GESTATH_Stew_Condition;
	information		= DIA_HUN_2609_GESTATH_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcjê gulaszu."; 
};

FUNC INT DIA_HUN_2609_GESTATH_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_2609_GESTATH_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_HUN_2609_GESTATH_Stew_15_01"); //Spróbuj gulaszu Snafa, w dziczy nie jad³eœ takich... specja³ów.
	AI_Output (self, other, "DIA_HUN_2609_GESTATH_Stew_11_02"); //Dziêki przyjacielu, z chêci¹ wrzucê coœ na z¹b.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Gestath bez oporów zjad³ gulasz."); 
};
