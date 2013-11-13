// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Condition;
	information	= Info_Diego_EXIT_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *************************************************************
// 							Hi 
// *************************************************************

INSTANCE Info_Diego_Hi (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Hi_Condition;
	information	= Info_Diego_Hi_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};                       

FUNC INT Info_Diego_Hi_Condition()
{
	return TRUE;
};

FUNC VOID Info_Diego_Hi_Info()
{
	AI_Output(other,self,"Info_Diego_Hi_15_00"); //Witaj.
	AI_Output(self,other,"Info_Diego_Hi_11_01"); //Cuchniesz piratem. Przez takich sukinsynów jak Ty straci³em ca³y maj¹tek.
	AI_Output(self,other,"Info_Diego_Hi_11_02"); //ZejdŸ mi z oczu, zanim zetrê ten durny uœmieszek z Twojej twarzy.
};

// *************************************************************

INSTANCE Info_Diego_Rebel (C_INFO)
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_Rebel_Condition;
	information	= Info_Diego_Rebel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musimy porozmawiaæ."; 
};                       

FUNC INT Info_Diego_Rebel_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_Again)) && (Npc_KnowsInfo(hero, Info_Diego_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rebel_Info()
{
	AI_Output(other,self,"Info_Diego_Rebel_15_00"); //Musimy porozmawiaæ.
	AI_Output(self,other,"Info_Diego_Rebel_11_01"); //Ja nic nie muszê piracie. ZejdŸ mi z oczu.
	AI_Output(other,self,"Info_Diego_Rebel_15_02"); //Najpierw mnie wys³uchasz!
	AI_Output(self,other,"Info_Diego_Rebel_11_03"); //Mów, skoro musisz.
	AI_Output(other,self,"Info_Diego_Rebel_15_04"); //W Starym Obozie szykuje siê bunt. Cienie i kopacze maj¹ ju¿ doœæ stra¿ników i dyryguj¹cych wszystkim magnatów.
	AI_Output(other,self,"Info_Diego_Rebel_15_05"); //Balam kaza³ Ciê pozdrowiæ. Powiedzia³ te¿, ¿e bez ciebie cienie nie rusz¹ do walki.
	AI_Output(self,other,"Info_Diego_Rebel_11_06"); //Zwolnij. Balam? Ten uparty kucharz ju¿ dawno powinien zaserwowaæ Gomezowi trutkê na szczury.
	AI_Output(self,other,"Info_Diego_Rebel_11_07"); //O co chodzi z tym buntem?
	AI_Output(other,self,"Info_Diego_Rebel_15_08"); //To dla nas jedyna szansa. Musimy zdobyæ poparcie cieni i kopaczy, po czym uderzyæ wspólnie na stra¿ników.
	AI_Output(self,other,"Info_Diego_Rebel_11_09"); //Hmm... To mog³oby siê udaæ. 
	AI_Output(self,other,"Info_Diego_Rebel_11_10"); //Dlaczego mam Ci zaufaæ? Œmierdzisz mi korsarzem.
	AI_Output(other,self,"Info_Diego_Rebel_15_11"); //Tak jak wszyscy chcê siê st¹d wydostaæ w jednym kawa³ku. A piratem nie zosta³em z wyboru.
	AI_Output(self,other,"Info_Diego_Rebel_11_12"); //I co ja niby mam zrobiæ?
	AI_Output(other,self,"Info_Diego_Rebel_15_13"); //Wystarczy, ¿e poka¿esz siê cieniom w obozie.
	AI_Output(self,other,"Info_Diego_Rebel_11_14"); //Tylko tyle? I oczywiœcie wejdê tam przez g³ówn¹ bramê, a stra¿nicy bêdê mi wiwatowaæ przez ca³¹ drogê.
	AI_Output(self,other,"Info_Diego_Rebel_11_15"); //Pos³uchaj ch³opcze. Mo¿e w moim interesie te¿ le¿y, ¿eby kopn¹æ Gomeza w dupê tak mocno jak tylko siê da.
	AI_Output(self,other,"Info_Diego_Rebel_11_16"); //Ale nie zamierzam zostaæ cholernym bohaterem, bo oni za krótko ¿yj¹.
	AI_Output(self,other,"Info_Diego_Rebel_11_17"); //Nie wejdê do Starego Obozu ¿ywy i dobrze o tym wiesz.
	AI_Output(other,self,"Info_Diego_Rebel_15_18"); //Dobra, znajdê sposób na to by wprowadziæ Ciê do obozu w bezpieczny sposób.
	AI_Output(self,other,"Info_Diego_Rebel_11_19"); //Umowa stoi ch³opcze. Mo¿e jednak pomyli³em siê co do Ciebie...
	
   B_LogEntry		(CH3_RBL_Shadows, "Diego nie wejdzie do obozu przez ¿adn¹ z bram. Cienie nie stan¹³ przeciwko stra¿nikom bez Diego. Muszê znaleŸæ jakiœ sposób...");
	Log_CreateTopic	(CH3_RBL_Diego, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Diego, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Diego, "Diego nie przejdzie przez ¿adn¹ z bram ¿ywy - stra¿nicy za dobrze go znaj¹. Muszê znaleŸæ sposób na to by wprowadziæ by³ego cienia do obozu. Od tego zale¿y powodzenie ataku na Stary Obóz.");
};

// *************************************************************

INSTANCE Info_Diego_Entrence (C_INFO)
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Entrence_Condition;
	information	= Info_Diego_Entrence_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, jak dostaniesz siê do obozu!"; 
};                       

FUNC INT Info_Diego_Entrence_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Teleport))&&(Npc_HasItems(other,ItArScrollTeleport1))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Entrence_Info()
{
	B_GiveXP(250);

	AI_Output(other,self,"Info_Diego_Entrence_15_00"); //Wiem, jak dostaniesz siê do obozu!
	AI_Output(self,other,"Info_Diego_Entrence_11_01"); //Wlecimy tam na miot³ach?
	AI_Output(other,self,"Info_Diego_Entrence_15_02"); //Jest prostszy sposób.
	AI_Output(self,other,"Info_Diego_Entrence_11_03"); //Czyli?
	AI_Output(other,self,"Info_Diego_Entrence_15_04"); //Mam dla Ciebie prezent od starego przyjaciela - Miltena. Ten zwój magiczny przeniesie Ciê do Starego Obozu.
	AI_Output(self,other,"Info_Diego_Entrence_11_05"); //Sprytne. Mam nadziejê, ¿e nie wyl¹dujê na stole Gomeza.
	AI_Output(self,other,"Info_Diego_Entrence_11_06"); //Jak znam Miltena to mogê spodziewaæ siê najgorszego. Ale warto zaryzykowaæ.
	AI_Output(self,other,"Info_Diego_Entrence_11_07"); //Szkoda czasu na strzêpienie jêzyka. Do zobaczenia w obozie.
	Log_SetTopicStatus	(CH3_RBL_Diego, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Diego, "Diego u¿yje teleportu do Starego Obozu.");

	B_StopProcessInfos(self);

	B_GiveInvItems(other,self,ItArScrollTeleport1,1);
};

// *************************************************************

INSTANCE Info_Diego_Hide (C_INFO)
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_Hide_Condition;
	information	= Info_Diego_Hide_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Hide_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Entrence))&&(Npc_GetDistToWp(self,"OCR_HUT_Z5_SIT")<2000)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Hide_Info()
{
	B_GiveXP(500);
	AI_Output(self,other,"Info_Diego_Hide_11_01"); //Nauczy³em siê dzisiaj, ¿e nie wszyscy piraci to skurwysyny.
	AI_Output(other,self,"Info_Diego_Hide_15_02"); //Nie zawsze jest siê tym kim chcia³oby siê byæ, przyjacielu.
	AI_Output(self,other,"Info_Diego_Hide_11_03"); //Zapamiêtam to. Bywaj ch³opcze i uwa¿aj na siebie.
	AI_Output(self,other,"Info_Diego_Hide_11_04"); //A o Cieni siê nie martw, ju¿ ja im przemówiê do rozs¹dku.
	
   Npc_ExchangeRoutine	(self, "OCW");
   B_StopProcessInfos	(self);
};

// *************************************************************

INSTANCE Info_Diego_Prison (C_INFO)
{
	npc		= PC_Thief;
	nr		= 5;
	condition		= Info_Diego_Prison_Condition;
	information		= Info_Diego_Prison_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Prison_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_GoBackDiego))&&(Npc_GetDistToNpc(self,other) < 600)&&(NPC_HasItems(other, DUNGEONKEY)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Prison_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_Output(self,other,"Info_Diego_Prison_11_01"); //Nie s¹dzi³em, ¿e jeszcze zobaczê przyjazn¹ twarz. Co Ty tu robisz?
	AI_Output(other,self,"Info_Diego_Prison_15_02"); //Jak to co? Robiê za jednoosobowy oddzia³, który ma za zadanie wydostaæ z celi jakiegoœ  starego pryka.
	AI_Output(self,other,"Info_Diego_Prison_11_03"); //Mam u Ciebie d³ug, przyjacielu.
	AI_Output(other,self,"Info_Diego_Prison_15_04"); //O sp³acie pomyœlimy jak uda siê nam st¹d wydostaæ. Ale najpierw powiedz jak tu trafi³eœ.
	AI_Output(self,other,"Info_Diego_Prison_11_05"); //Odkry³em, ¿e Urt to parszywy zdrajca.
	AI_Output(other,self,"Info_Diego_Prison_15_06"); //No to nie jesteœ sam. Masz jakieœ dowody?
	AI_Output(self,other,"Info_Diego_Prison_11_07"); //Ja jestem ¿ywym dowodem!
	AI_Output(self,other,"Info_Diego_Prison_11_08"); //Ten sukinsyn zorientowa³ siê, ¿e go przejrza³em, kiedy potajemnie spotka³em siê z dowódcami Cieni. Chcia³em razem z nimi pozbyæ siê Urta, ale by³ ode mnie szybszy.
	AI_Output(self,other,"Info_Diego_Prison_11_10"); //Urt przyszed³ ze stra¿nikami, którzy roznieœli pozosta³ych Cieni. Ja dosta³em po mordzie i odroczony wyrok.
	AI_Output(other,self,"Info_Diego_Prison_15_11"); //To widzê, ¿e zd¹¿y³em w ostatniej chwili.
	AI_Output(self,other,"Info_Diego_Prison_11_12"); //Chcia³em wys³aæ wiadomoœæ do przyjaciela, który by mnie st¹d wydosta³, ale stra¿nik by³ kompletnym idiot¹.
	AI_Output(other,self,"Info_Diego_Prison_15_13"); //Co to za przyjaciel?
	AI_Output(self,other,"Info_Diego_Prison_11_14"); //Bezimienny skazaniec. Na szczêœcie Ty siê zjawi³eœ.
	AI_Output(self,other,"Info_Diego_Prison_11_15"); //Muszê wydostaæ siê z obozu. 
	AI_Output(other,self,"Info_Diego_Prison_15_16"); //A Urt?
	AI_Output(self,other,"Info_Diego_Prison_11_17"); //Teraz jest poza naszym zasiêgiem. Jestem pewien, ¿e jeszcze go spotkamy i zd¹¿ymy mu odp³aciæ.
	AI_Output(self,other,"Info_Diego_Prison_11_18"); //Powiedz Balamowi, ¿e uciek³em i wrócê z rebeliantami podczas ataku.
	AI_Output(self,other,"Info_Diego_Prison_11_19"); //Niech przygotuje Cieni i Kopaczy. 
	
   if (Npc_KnowsInfo(hero,DIA_Cienius_Fault))&&(Npc_KnowsInfo(hero,DIA_Kopaczus_Fault))
	{

		/**************************

Ork jak ci siê chce i o ile jest to w zasiêgu to mo¿naby wzi¹æ to pod uwagê i cienie i kopacze rzeczywiœcie bêd¹ mieæ pecha bo straznicy w miejscach gdzie ude¿¹ bêd¹ przygotowani.
Mo¿na wtedy od razu uœmierciæ 1/3 atakuj¹cych a reszta i tak zginie.
czyli jak chest_conf == 2 to stra¿nicy x2 tam gdzie maj¹ zaatakowaæ Cienie i Kopacze

**************************/
		Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_FAILED);
		B_LogEntry		(CH6_RBL_Coordinate, "Spotkanie z wys³annikami kast to podpucha Urta. Przeze mnie zginie wielu Cieni i Kopaczy. Niech to szlag trafi!");

		AI_Output(other,self,"Info_Diego_Prison_15_20"); //Ju¿ o to zadba³em. Spotka³em siê z wys³annikami Cieni i Kopaczy.
		AI_Output(self,other,"Info_Diego_Prison_11_21"); //Kto powiedzia³ Ci o spotkaniu?!
		AI_Output(other,self,"Info_Diego_Prison_15_22"); //Urt... O cholera!
		AI_Output(self,other,"Info_Diego_Prison_11_23"); //To musia³y byæ jego wtyki.
		AI_Output(self,other,"Info_Diego_Prison_11_24"); //Czyli stra¿nicy teraz dok³adnie wiedz¹ gdzie uderz¹ Cienie i Kopacze. Niech to szlag...
		AI_Output(other,self,"Info_Diego_Prison_15_25"); //Dostaniemy siê do œrodka tunelem i mo¿e zdo³amy ich ostrzec.
		AI_Output(self,other,"Info_Diego_Prison_11_26"); //W¹tpiê. Na to nic ju¿ nie poradzimy. Miejmy tylko nadziejê, ¿e rebelianci i najemnicy zd¹¿¹ ich wesprzeæ.
	}
	else
	{
		AI_Output(other,self,"Info_Diego_Prison_15_27"); //W porz¹dku, dam mu znaæ.
		if (Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))
		{
			AI_Output(other,self,"Info_Diego_Prison_15_28"); //Urt poleci³ mi skontakowaæ siê z wys³annikami Cieni i Kopaczy.
			AI_Output(self,other,"Info_Diego_Prison_11_29"); //A to bydle. To s¹ jego donosiciele.
			AI_Output(self,other,"Info_Diego_Prison_11_30"); //Pod ¿adnym pozorem z nimi nie rozmawiaj!
			AI_Output(other,self,"Info_Diego_Prison_15_31"); //Dobrze wiedzieæ, zapamiêtam to.
			Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_SUCCESS);
			B_LogEntry		(CH6_RBL_Coordinate, "Ca³e szczêœcie, ¿e nie spotka³em siê z wys³annikami kast. Dziêki temu Cienie i Kopacze bêd¹ mieæ wiêksze szanse w walce.");
		};
	};
   
	AI_Output(self,other,"Info_Diego_Prison_11_32"); //Mam ju¿ doœæ tej celi. Bêdê czeka³ na rebeliantów w pobli¿u zachodniej bramy.
	AI_Output(self,other,"Info_Diego_Prison_11_33"); //Jeszcze raz dziêki, Rick. Nigdy Ci tego nie zapomnê.
	AI_Output(self,other,"Info_Diego_Prison_11_34"); //Jak to wszystko siê skoñczy to odwiedŸ mnie w Khorinis. Mam zamiar odebraæ swoj¹ w³asnoœæ, a wtedy miasto bêdzie nasze!
	AI_Output(other,self,"Info_Diego_Prison_15_35"); //He, he. Zapamiêtam to.

	/*******************
Diego niech czeka tam gdzie czeka³ w CH4.
*******************/

	Npc_ExchangeRoutine	(self, "OCWait");

	Log_SetTopicStatus	(CH6_RBL_Diego, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Diego, "Uwolni³em Diego. Bêdzie czeka³ w pobli¿u zachodniej bramy. Diego na odchodnym zleci³ mi jeszcze ma³y sabota¿ magazyny stra¿ników znajduj¹cego siê w pobli¿u kuŸni.");

	B_LogEntry		(CH6_RBL_Spy, "Diego potwierdzi³, ¿e to Urt zdradzi³. Muszê powiedzieæ o tym Balamowi i Ratfordowi.");

	B_LogEntry		(CH6_RBL_Recognise, "Uwolni³em Diego. Przywódca Cieni zaczeka na atak w pobli¿u palisady a gdy nadejdzie odpowiednia pora poprowadzi Cieni i Kopaczy do walki.");
	/****************************
Ork chcê jeszcze Urta wykorzystaæ. Teraz niech zniknie. Stanie na drodze Dicka jak ten bêdzie œciga³ Gomeza.
Na razie niech czeka w jakimœ niedostêpnym miejscu.

***************************/

	var C_NPC urt; urt = Hlp_GetNpc(RBL_4062_Urt);
	Npc_ExchangeRoutine	(urt, "HIDE");
   B_StopProcessInfos(self);
};

// *************************************************************

INSTANCE Info_Diego_Prison1 (C_INFO)
{
	npc		= PC_Thief;
	nr		= 6;
	condition		= Info_Diego_Prison1_Condition;
	information		= Info_Diego_Prison1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Prison1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Prison))&&(Npc_GetDistToNpc(self,other) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Prison1_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(self, other);
	
   AI_Output(self,other,"Info_Diego_Prison1_11_01"); //Aha i jeszcze jedno.
	AI_Output(other,self,"Info_Diego_Prison1_15_02"); //Tak?
	AI_Output(self,other,"Info_Diego_Prison1_11_03"); //Nie masz ochoty na ma³y sabota¿?
	AI_Output(other,self,"Info_Diego_Prison1_15_04"); //Czemu nie, skoro nie mogê dorwaæ Urta, to odreagujê inaczej.
	AI_Output(self,other,"Info_Diego_Prison1_11_05"); //Œwietnie. Zdob¹dŸ klucz do magazynu przy kuŸni w zamku i zabierz stamt¹d tyle broni ile siê da.
	AI_Output(self,other,"Info_Diego_Prison1_11_06"); //Przede wszystkim zdob¹dŸ piêæ egzemplarzy piewcy zag³ady. Te bastardy to ulubiona broñ osobistych przydupasów Gomeza. 
	AI_Output(other,self,"Info_Diego_Prison1_15_07"); //Nie wiesz, gdzie znajdê klucz?
	AI_Output(self,other,"Info_Diego_Prison1_11_08"); //Mia³ go przy sobie Stone, ale Gomez te¿ kaza³ go wtr¹ciæ do lochu.
	AI_Output(self,other,"Info_Diego_Prison1_11_09"); //Skip zabra³ Stonowi klucz, wiêc to on jest twoim celem.
	AI_Output(other,self,"Info_Diego_Prison1_15_10"); //Wiem ju¿ wszystko co nale¿y. Bywaj, Diego.
	AI_Output(self,other,"Info_Diego_Prison1_11_11"); //Powodzenia, Rick.
	Log_CreateTopic	(CH6_RBL_Thievery, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Thievery, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Thievery, "Na zakoñczenie mam jeszcze na g³owie ma³y sabot w Starym Obozie. Muszê zdobyæ 5 egzemplarzy piewcy zag³ady. Te bastardy s¹ przechowywane w magazynie przy kuŸni w zamku. Klucz powinien mieæ Skip. Muszê odnieœæ te miecze Diego.");

   B_StopProcessInfos(self);
	/**************************
Ork wrzuæ Skipowi do inv klucz od magazynu przy kuŸni.
Na razie zrobi³em ten, ¿eby w ogóle coœ by³o, zamieñ go na w³aœciwy
*************************/

	//var C_NPC skip; skip = Hlp_GetNpc(GRD_211_Skip);
	//CreateInvItems (skip,ITKEY_OB_SMITH_01,1);
};

// *************************************************************

INSTANCE Info_Diego_Swords (C_INFO)
{
	npc		= PC_Thief;
	nr		= 7;
	condition		= Info_Diego_Swords_Condition;
	information		= Info_Diego_Swords_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam miecze."; 
};                       

FUNC INT Info_Diego_Swords_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Prison1))&& (Npc_KnowsInfo(hero, DIA_Skip_Warehouse))&&(NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)>=4)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Swords_Info()
{
	AI_Output(other,self,"Info_Diego_Swords_15_01"); //Mam miecze.
	AI_Output(self,other,"Info_Diego_Swords_11_02"); //To œwietnie. Chcia³bym zobaczyæ miny stra¿ników, kiedy siê zorientuj¹, ¿e ich b³yskotki zniknê³y.
	AI_Output(other,self,"Info_Diego_Swords_15_03"); //W magazynie by³y tylko trzy miecze. Czwarty ukrad³em ze skrzyni Arto.
   
   if (NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)==4)
	{
		AI_Output(other,self,"Info_Diego_Swords_15_04"); //Ostatni gdzieœ zagin¹³.
		AI_Output(self,other,"Info_Diego_Swords_11_05"); //Nie szkodzi, nieŸle siê spisa³eœ. WeŸ to, powinno Ci siê przydaæ.

		Create_and_give(ItMiNugget, 200);
	}
	else if (NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)==5)
	{
		AI_Output(other,self,"Info_Diego_Swords_15_07"); //Pi¹te ostrze znalaz³em w doœæ dziwnym miejscu.

		/***************************
Ork ten miecz trzeba gdzieœ fajnie zabunkrowaæ w kolonii, mo¿e przy jakimœ szkielecie stra¿nika na terenach orków? Jak wsadzisz go spacerem to dopisz w dialogu gdzie Dick go znalaz³ - tak, tam gdzie zostawi³em te 3 kropki xD

****************************/
		AI_Output(self,other,"Info_Diego_Swords_11_08"); //Zadziwiasz mnie, Rick. WeŸ to, powinno Ci siê przydaæ.

		Create_and_give(ItMiNugget, 250);
	};

	AI_Output(self,other,"Info_Diego_Swords_11_09"); //Oddam te ostrza rebeliantom przed atakiem.
	AI_Output(other,self,"Info_Diego_Swords_15_10"); //Ciekawe co powiedz¹ stra¿nicy na ich widok, he, he.

	B_GiveInvItems (other,self,ItMw_1H_Sword_Bastard_05,NPC_HasItems(other,ItMw_1H_Sword_Bastard_05));
	Npc_RemoveInvItems(self,ItMw_1H_Sword_Bastard_05,NPC_HasItems(self,ItMw_1H_Sword_Bastard_05));

	Log_SetTopicStatus	(CH6_RBL_Thievery, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Thievery, "Diego dosta³ miecze. Powiedzia³, ¿e da je rebeliantom przed atakiem - porz¹dne ostrza na pewno siê przydadz¹.");
   
   B_StopProcessInfos	(self);
};

/*******************************
Diego z kilkoma cieniami i kopaczami spotka ich po wyjœciu z tunelu do lochów, dialog niech siê od razu odpali jak tak siê pojawi¹

*******************************/

// *************************************************************

INSTANCE Info_Diego_Tunel (C_INFO)
{
	npc		= PC_Thief;
	nr		= 10;
	condition		= Info_Diego_Tunel_Condition;
	information		= Info_Diego_Tunel_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Diego_Tunel_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cavalorn_TunelTrapAfter))&&(Npc_GetDistToNpc(self,other) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Tunel_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_Output(self,other,"Info_Diego_Tunel_11_01"); //Znowu siê spotykamy, przyjacielu. S³ysza³em jakiœ rumor, co siê sta³o?
	AI_Output(other,self,"Info_Diego_Tunel_15_02"); //Sekciarze zawalili tunel. Tylko my zdo³aliœmy przejœæ.
	AI_Output(self,other,"Info_Diego_Tunel_11_03"); //Nie mamy wyboru, musimy otworzyæ bramê. 
	AI_Output(self,other,"Info_Diego_Tunel_11_04"); //Wy ruszajcie do zamku, mo¿e dorwiecie tam Gomeza.
	AI_Output(self,other,"Info_Diego_Tunel_11_05"); //Ja z cieniami zajmiemy siê bramami i stra¿nikami, którzy stan¹ nam na drodze.
	AI_Output(other,self,"Info_Diego_Tunel_15_06"); //Powodzenia.
	B_LogEntry		(CH6_RBL_PayDay, "Spotkaliœmy w lochach Diego. On z cieniami zajm¹ siê bramami, my ruszymy do zamku rozprawiæ siê z Gomezem.");

	/**********************************
Mo¿e zrób mu takiego ZSa w tej rutynie, ¿e lata od bramy do bramy i je otwiera: zamkowa, po³udniowa i zachodnia.

********************************/

	Npc_ExchangeRoutine	(self, "gates");
	B_StopProcessInfos	(self);

	/********************
Niech Diego wyjdzie niby z tunelu...

*******************/
	//TODO: Rutyna poczatkowa diego - poza OR
	AI_GotoWP		(self, "TUNEL_OUT");
};


INSTANCE DIA_Diego_CanYouTeachMe (C_INFO)
{
	npc				= PC_Thief;
	condition		= DIA_Diego_CanYouTeachMe_Condition;
	information		= DIA_Diego_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Diego_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Diego_Hide))
	{
		return 1;
	};
};

FUNC VOID DIA_Diego_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Diego_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Diego_CanYouTeachMe_12_02"); //Mogê pokazaæ ci æwiczenia zwiêkszaj¹ce zrêcznoœæ.
	AI_Output (self, other, "DIA_Diego_CanYouTeachMe_12_03"); //NieŸle te¿ radzê sobie z ³ukiem.	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Diego poka¿e mi jak lepiej szyæ z ³uku i jak zwiêkszyæ zrêcznoœæ.");
};