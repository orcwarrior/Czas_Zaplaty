
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_336_Mark_Exit (C_INFO)
{
	npc			= RBL_2616_Mark;
	nr			= 999;
	condition	= DIA_HUN_336_Mark_Exit_Condition;
	information	= DIA_HUN_336_Mark_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_336_Mark_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_336_Mark_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Mark_Hello (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 1;
	condition		= DIA_Mark_Hello_Condition;
	information		= DIA_Mark_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mark_Hello_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Hello_Info()
{
	AI_Output (self, other, "DIA_Mark_Hello_11_01"); //Hej Ty! Nigdy Ciê tu nie widzia³em. Z którego obozu Ciê wyrzucili? 
	AI_Output (other, self, "DIA_Mark_Hello_15_02"); //Nie Twój interes.
	AI_Output (self, other, "DIA_Mark_Hello_11_03"); //A za co dosta³eœ kopa?
	AI_Output (other, self, "DIA_Mark_Hello_15_04"); //Za obcinanie jêzyków wœcibskich idiotów!
	AI_Output (self, other, "DIA_Mark_Hello_11_05"); //Zrozumia³em aluzjê. Rzeczywiœcie niemi³e z Ciebie bydlê!		
	
   B_StopProcessInfos	( self );
};

// **************************************************

INSTANCE DIA_Mark_Again (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 2;
	condition		= DIA_Mark_Again_Condition;
	information		= DIA_Mark_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ty jesteœ Mark?"; 
};

FUNC INT DIA_Mark_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_CAVALORN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Again_Info()
{
	AI_Output (other, self, "DIA_Mark_Again_15_01"); //Ty jesteœ Mark?
	AI_Output (self, other, "DIA_Mark_Again_11_02"); //Tak. A co Ci do tego?
	AI_Output (other, self, "DIA_Mark_Again_15_03"); //Cavalorn twierdzi, ¿e wiesz wszystko o tym obozie. Chcia³em zasiêgn¹æ jêzyka.
	AI_Output (self, other, "DIA_Mark_Again_11_04"); //Ostatnim razem mówi³eœ coœ innego. Je¿eli pamiêæ mnie nie myli, to by³o coœ o obcinaniu jêzyków.
	AI_Output (other, self, "DIA_Mark_Again_15_05"); //Wybacz, ponios³o mnie. Ci wszyscy skazañcy doprowadzaj¹ mnie do sza³u!
	AI_Output (self, other, "DIA_Mark_Again_11_06"); //Nie tylko Ty masz ten problem. Na szczêœcie nie jestem pamiêtliwy.
	AI_Output (self, other, "DIA_Mark_Again_11_07"); //No i wiêkszoœæ z obozowych obwiesi ma mnie doœæ. Pytaj o co chcesz!	
	
	Log_CreateTopic	(CH1_Rbl_MarkInfo, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_MarkInfo, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_MarkInfo, "Po niezbyt fortunnym rozpoczêciu znajomoœci, Mark zgodzi³ siê odpowiedzieæ na moje pytania.");
};

//**************************************************

INSTANCE DIA_Mark_Attack (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 11;
	condition		= DIA_Mark_Attack_Condition;
	information		= DIA_Mark_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Mark_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Attack_Info()
{
	AI_Output (self, other, "DIA_Mark_Attack_11_01"); //Czego tu jeszcze szukasz ³azêgo?
	AI_Output (self, other, "DIA_Mark_Attack_11_02"); //Chyba porz¹dnego lania!
	AI_Output (self, other, "DIA_Mark_Attack_11_03"); //Ale ja nie lubiê przemocy. Tym razem Ci odpuszczê!	
	
   B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Mark_Camp (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp_Condition;
	information		= DIA_Mark_Camp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co to za obóz?"; 
};

FUNC INT DIA_Mark_Camp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp_15_01"); //Co to za obóz?
	AI_Output (self, other, "DIA_Mark_Camp_11_02"); //NieŸle siê tu urz¹dziliœmy, co nie? Mo¿e to nie zamek Gomeza, ale jest przytulnie i w miarê bezpiecznie.
	AI_Output (self, other, "DIA_Mark_Camp_11_03"); //Reszta obwiesi nazywa nas rebeliantami, bo otwarcie sprzeciwiliœmy siê Gomezowi i jego przydupasom.
	
   B_LogEntry(CH1_Rbl_MarkInfo, "Czyli to obóz rebeliantów. Ciekawe miejsce i ciekawi ludzie, niestety maj¹ wiêcej wrogów ni¿ sojuszników.");
};

// **************************************************

INSTANCE DIA_Mark_Camp1 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp1_Condition;
	information		= DIA_Mark_Camp1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kto to Gomez?"; 
};

FUNC INT DIA_Mark_Camp1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp1_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp1_15_01"); //Kto to Gomez?
	AI_Output (self, other, "DIA_Mark_Camp1_11_02"); //Hmm, jakby to powiedzieæ.
	AI_Output (self, other, "DIA_Mark_Camp1_11_03"); //WyobraŸ sobie kogoœ, kto w³aœnie spali³ Ci dom, wyrucha³ ¿onê i ulubionego konia.
	AI_Output (self, other, "DIA_Mark_Camp1_11_04"); //A wszystko po to, ¿eby zdobyæ kilka bry³ek rudy.
	AI_Output (self, other, "DIA_Mark_Camp1_11_05"); //Taki jest w³aœnie Gomez. Zrobi wszystko, ¿eby po³o¿yæ ³apê na wszystkich kopalniach rudy w Kolonii.
	AI_Output (self, other, "DIA_Mark_Camp1_11_06"); //No i jeszcze w³adza. To go nakrêca bardziej ni¿ bagienne ziele sekciarzy.
	AI_Output (self, other, "DIA_Mark_Camp1_11_07"); //Radzê omijaæ Stary Obóz szerokim ³ukiem.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Gomez to kawa³ skurwiela, dla którego liczy siê tylko ruda i w³adza.");
};

// **************************************************

INSTANCE DIA_Mark_Camp2 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp2_Condition;
	information		= DIA_Mark_Camp2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak siê tu ¿yje?"; 
};

FUNC INT DIA_Mark_Camp2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp2_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp2_15_01"); //Jak siê tu ¿yje?
	AI_Output (self, other, "DIA_Mark_Camp2_11_02"); //Jak i wszêdzie.
	AI_Output (self, other, "DIA_Mark_Camp2_11_03"); //Musisz jeœæ, sraæ i czasem nadstawiæ dupê jakiemuœ skurwielowi, co by sobie pochêdo¿y³, zamiast wypru³ Ci flaki.
	AI_Output (self, other, "DIA_Mark_Camp2_11_04"); //No i jeszcze orkowie. Ale z nimi nie da siê pogadaæ. Najlepsza metoda na prze¿ycie to szybko przebieraæ nogami i nie ogl¹daæ siê za siebie, dopóki nie zobaczysz bramy obozu.
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Przyjemne miejsce ten obóz rebeliantów, muszê uwa¿aæ na to co mówiê i z kim rozmawiam.");
};

// **************************************************

INSTANCE DIA_Mark_Camp3 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp3_Condition;
	information		= DIA_Mark_Camp3_Info;
	permanent		= 0;
	important		= 0;
	description		= "Z kim powinienem porozmawiaæ?"; 
};

FUNC INT DIA_Mark_Camp3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp3_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp3_15_01"); //Z kim powinienem porozmawiaæ?
	AI_Output (self, other, "DIA_Mark_Camp3_11_02"); //Oczywiœcie ze mn¹!
	AI_Output (other, self, "DIA_Mark_Camp3_15_03"); //Bez urazy, ale mia³em na myœli kogoœ, delikatnie mówi¹c... bardziej powa¿anego.	
	AI_Output (self, other, "DIA_Mark_Camp3_11_04"); //To nie by³o mi³e! 
	AI_Output (self, other, "DIA_Mark_Camp3_11_05"); //No dobra, wiem, ¿e jestem tylko lokaln¹ atrakcj¹.
	AI_Output (self, other, "DIA_Mark_Camp3_11_06"); //Co do reszty...
	AI_Output (self, other, "DIA_Mark_Camp3_11_07"); //Na pewno Cavalorn i Ratford, tych dwóch tutaj rz¹dzi. Ale uwa¿aj przy nich na s³owa, bo mo¿esz straciæ jêzyk.
	AI_Output (self, other, "DIA_Mark_Camp3_11_08"); //Z magów to Milten i Leren, choæ to zarozumia³e i aroganckie dupki.
	AI_Output (self, other, "DIA_Mark_Camp3_11_09"); //A reszta to zbieranina ze wszystkich obozów. Wiêkszych ment nigdzie nie znajdziesz!
	AI_Output (self, other, "DIA_Mark_Camp3_11_10"); //Œwistak na widok b³yszcz¹cego miecza dostaje wzwodu.
	AI_Output (self, other, "DIA_Mark_Camp3_11_11"); //Aidan podgl¹da kopuluj¹ce cieniostwory z rêk¹ w spodniach.
	AI_Output (self, other, "DIA_Mark_Camp3_11_12"); //R¹czka... No có¿, temu ostatnio ca³kiem odbi³o. Jego musisz przed u¿yciem wstrz¹sn¹æ.
	AI_Output (self, other, "DIA_Mark_Camp3_11_13"); //Quentin to zabijaka, z nim radzê ostro¿nie. W ka¿dym razie bez kija nie podchodŸ, bo to wœciek³y pies.
	AI_Output (self, other, "DIA_Mark_Camp3_11_14"); //Tony to nowy nabytek. £ajza ze Starego Obozu. Niby nie jest z³a ch³opina, ale zbyt chêtnie bierze za innych warty jak na mój gust.
	AI_Output (self, other, "DIA_Mark_Camp3_11_15"); //Fox za konfitury da siê wyruchaæ orkowi, a Garry to urodzony nieudacznik.
	AI_Output (self, other, "DIA_Mark_Camp3_11_16"); //Kto tam jeszcze zosta³...
	AI_Output (self, other, "DIA_Mark_Camp3_11_17"); //Aha, Fisk. Prowadzi gospodê, lub raczej mordowniê. Lepiej omijaj to miejsce chyba, ¿e bol¹ Ciê zêby.
	AI_Output (self, other, "DIA_Mark_Camp3_11_18"); //Z Vamem te¿ coœ jest nie tak. Z w³asnej woli zajmuje siê ciesielk¹ i chyba nawet to lubi.
	AI_Output (self, other, "DIA_Mark_Camp3_11_19"); //Drax to kombinator i malkontent, ale jakoœ sobie radzi.
	AI_Output (self, other, "DIA_Mark_Camp3_11_20"); //Jest jeszcze Abel. Prosty jak jego miecz, idealny pies wartowniczy.
	AI_Output (self, other, "DIA_Mark_Camp3_11_21"); //Dam Ci te¿ dobr¹ radê. Nigdy nie bierz do ust czegoœ, co upichci³ Snaf! Mo¿na siê po tym przekrêciæ.
	AI_Output (self, other, "DIA_Mark_Camp3_11_22"); //W sumie by³aby z jego potrawek niez³a broñ, mo¿na by tym obrzucaæ orków.
	AI_Output (self, other, "DIA_Mark_Camp3_11_23"); //To mniej wiêcej tyle. Pogadaj z ch³opakami, to dowiesz siê wiêcej.
	
   B_LogEntry(CH1_Rbl_MarkInfo, "W obozie rebeliantów mieszka niez³a mena¿eria. Warto porozmawiaæ z ka¿dym z nich.");
};

// **************************************************

INSTANCE DIA_Mark_Camp4 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp4_Condition;
	information		= DIA_Mark_Camp4_Info;
	permanent		= 0;
	important		= 0;
	description		= "A co z innymi obozami?"; 
};

FUNC INT DIA_Mark_Camp4_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp4_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp4_15_01"); //A co z innymi obozami?
	AI_Output (self, other, "DIA_Mark_Camp4_11_02"); //A co ma byæ? S¹ i tyle.
	AI_Output (other, self, "DIA_Mark_Camp4_15_03"); //Mo¿esz powiedzieæ coœ wiêcej?
	AI_Output (self, other, "DIA_Mark_Camp4_11_04"); //Ju¿ siê ba³em, ¿e nie zapytasz!
	AI_Output (self, other, "DIA_Mark_Camp4_11_05"); //Kiedyœ by³y trzy g³ówne obozy.
	AI_Output (self, other, "DIA_Mark_Camp4_11_06"); //Zabijaki Gomeza w Starym Obozie. 
	AI_Output (self, other, "DIA_Mark_Camp4_11_07"); //Œwiry na bagnie, czcz¹cy Œni¹cego i ci¹gle nabakani zielem.
	AI_Output (self, other, "DIA_Mark_Camp4_11_08"); //No i najemne s³ugusy magów wody z Nowego Obozu.
	AI_Output (self, other, "DIA_Mark_Camp4_11_09"); //Rozk³ad si³ by³ mniej wiêcej równy. Ka¿dy mia³ coœ, czego potrzebowa³ inny obóz.
	AI_Output (self, other, "DIA_Mark_Camp4_11_10"); //Sekciarze handlowali zielem, w Nowym Obozie pêdzili ry¿ówkê, a Gomez trzyma³ ³apê na rudzie i dostawach dla Rhobara.
	AI_Output (self, other, "DIA_Mark_Camp4_11_11"); //Mo¿na by rzec, ¿e ¿yliœmy w stanie b³ogiej równowagi.
	AI_Output (self, other, "DIA_Mark_Camp4_11_12"); //Wszystko by³o dobrze, dopóki w Kolonii nie pojawi³ siê pewien Bezimienny idiota, który zacz¹³ wszêdzie wtykaæ nos.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Kiedyœ w Kolonii Karnej rz¹dzi³y trzy g³ówne obozy: Stary, Nowy i na bagnie.");
};

// **************************************************

INSTANCE DIA_Mark_Camp5 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp5_Condition;
	information		= DIA_Mark_Camp5_Info;
	permanent		= 0;
	important		= 0;
	description		= "A jak to wygl¹da teraz?"; 
};

FUNC INT DIA_Mark_Camp5_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp4))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp5_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp5_15_01"); //A jak to wygl¹da teraz?
	AI_Output (self, other, "DIA_Mark_Camp5_11_02"); //Ano trochê siê popierdoli³o.
	AI_Output (self, other, "DIA_Mark_Camp5_11_03"); //Sekciarze chyba przesadzili z zielem, bo straciliœmy z nimi kontakt. Lepiej tam nie zagl¹daæ.
	AI_Output (self, other, "DIA_Mark_Camp5_11_04"); //W ka¿dym razie jeszcze nikt nie wróci³ stamt¹d ¿ywy.	
	AI_Output (self, other, "DIA_Mark_Camp5_11_05"); //Gomez wyr¿n¹³ magów ognia i chce zagarn¹æ wszystkie kopalnie dla siebie.
	AI_Output (self, other, "DIA_Mark_Camp5_11_06"); //Totalnie mu odbi³o, jak tak dalej pójdzie, to unu¿a ca³¹ Koloniê we krwi.
	AI_Output (self, other, "DIA_Mark_Camp5_11_07"); //A w Nowym Obozie póki co bez wiêkszych zmian. 
	AI_Output (self, other, "DIA_Mark_Camp5_11_08"); //Najemnicy i magowie wody wydobywaj¹ rudê, ¿eby przeprowadziæ jakiœ rytua³ i daæ nogê z Kolonii.
	AI_Output (self, other, "DIA_Mark_Camp5_11_09"); //Ci którzy mieli doœæ pozosta³ych obozów przyszli tutaj.
	AI_Output (self, other, "DIA_Mark_Camp5_11_10"); //Jest jeszcze kilku œwirów z obozu ³owców, ale ich radzê omijaæ szerokim ³ukiem.
	AI_Output (self, other, "DIA_Mark_Camp5_11_11"); //Dla nich liczy siê tylko zabijanie trolli i innego plugastwa.	
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Obecnie w Kolonii prócz pozosta³ych obozów powsta³y jeszcze obozy rebeliantów i ³owców.");
};

// **************************************************

INSTANCE DIA_Mark_Camp6 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp6_Condition;
	information		= DIA_Mark_Camp6_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co to za Bezimienny?"; 
};

FUNC INT DIA_Mark_Camp6_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp4))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp6_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp6_15_01"); //Co to za Bezimienny?
	AI_Output (self, other, "DIA_Mark_Camp6_11_02"); //Cz³owieku, to dopiero jest opowieœæ!
	AI_Output (self, other, "DIA_Mark_Camp6_11_03"); //Je¿eli chodzi o kataklizmy, które nawiedzi³y Koloniê Karn¹ to do tej pory by³y trzy.
	AI_Output (self, other, "DIA_Mark_Camp6_11_04"); //Pierwszy to magiczna bariera, któr¹ stworzyli magowie Rhobara, ¿eby odizolowaæ skazañców od œwiata.
	AI_Output (self, other, "DIA_Mark_Camp6_11_05"); //Eksperyment zakoñczy³ siê uwiêzieniem magów, œmierci¹ ¿o³nierzy króla, a nasz monarcha musi teraz p³aciæ za rudê.
	AI_Output (self, other, "DIA_Mark_Camp6_11_06"); //Kolejna tragedia to przejêcie w³adzy przez psychopatê Gomeza.
	AI_Output (self, other, "DIA_Mark_Camp6_11_07"); //RzeŸnia by³a przednia, ale zabawa szybko siê skoñczy³a, kiedy siê okaza³o, ¿e powsta³ nowy podzia³ na lepszych i gorszych.
	AI_Output (self, other, "DIA_Mark_Camp6_11_08"); //Osobiœcie wola³em czasy sprzed Gomeza, przynajmniej cz³owiek by³ pewien, ¿e nie obudzi siê z no¿em w plecach, a co najwy¿ej z czyimœ kutasem w dupie.
	AI_Output (self, other, "DIA_Mark_Camp6_11_09"); //Ostatni kataklizm to przybycie do Kolonii Bezimiennego skazañca, który wszêdzie wœciubia³ nos.
	AI_Output (self, other, "DIA_Mark_Camp6_11_10"); //To przez niego Gomez zabi³ magów ognia i zaostrzy³a siê sytuacja w obozach.
	AI_Output (self, other, "DIA_Mark_Camp6_11_11"); //Ale te¿ dziêki niemu zaczêliœmy walczyæ o wolnoœæ i tylko on odwa¿y³ siê zrobiæ coœ, ¿eby zniszczyæ barierê.
	AI_Output (self, other, "DIA_Mark_Camp6_11_12"); //Mo¿e jest trochê drêtwy i cyniczny, ale pomóg³ nam wiêcej ni¿ wszyscy kap³ani Adanosa razem wziêci. No i orkowie robi¹ pod siebie na jego widok!
	AI_Output (self, other, "DIA_Mark_Camp6_11_13"); //Powiem Ci, ¿e on zajdzie daleko. Nie zdziwi³bym siê, gdyby kiedyœ wykopa³ Rhobara i posadzi³ dupsko na jego tronie.
	AI_Output (self, other, "DIA_Mark_Camp6_11_14"); //Ale po¿yjemy, zobaczymy.
	AI_Output (self, other, "DIA_Mark_Camp6_11_15"); //Chcesz jeszcze o coœ zapytaæ?
	
	B_LogEntry(CH1_Rbl_MarkInfo, "Do Kolonii trafi³ te¿ jakiœ Bezimienny skazaniec, który sporo tu namiesza³. Chyba warto by³oby zrobiæ z niego sojusznika.");
};

// **************************************************

INSTANCE DIA_Mark_Camp7 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Camp7_Condition;
	information		= DIA_Mark_Camp7_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jakieœ dobre rady?"; 
};

FUNC INT DIA_Mark_Camp7_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Mark_Camp6))
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Camp7_Info()
{
	AI_Output (other, self, "DIA_Mark_Camp7_15_01"); //Jakieœ dobre rady?
	AI_Output (self, other, "DIA_Mark_Camp7_11_02"); //Uwa¿aj z kim rozmawiasz i co mówisz.
	AI_Output (self, other, "DIA_Mark_Camp7_11_03"); //Czasem lepiej najpierw zabiæ, a dopiero póŸniej pytaæ.
	AI_Output (self, other, "DIA_Mark_Camp7_11_04"); //Choæ z drugiej strony wtedy trochê mniej siê dowiesz...
	AI_Output (self, other, "DIA_Mark_Camp7_11_05"); //Zdob¹dŸ szacunek tych, których powa¿aj¹ inni, to najwiêksze szumowiny dadz¹ Ci ¿yæ i bêd¹ schodziæ z drogi.
	AI_Output (self, other, "DIA_Mark_Camp7_11_06"); //I nigdy, ale to nigdy, nie jedz tego, co przyrz¹dzi³ Snaf!
	AI_Output (self, other, "DIA_Mark_Camp7_11_07"); //No i jak k³adziesz siê spaæ, to odwracaj siê ty³kiem do œciany, bo ró¿nie bywa.
	AI_Output (self, other, "DIA_Mark_Camp7_11_08"); //A tak w ogóle, po prostu uwa¿aj na siebie.
	AI_Output (self, other, "DIA_Mark_Camp7_11_09"); //Kolonia Karna to paskudne miejsce. Czêsto trzeba wybraæ mniejsze z³o, albo siê zeszmaciæ, ¿eby prze¿yæ i osi¹gn¹æ zamierzony cel.
	AI_Output (self, other, "DIA_Mark_Camp7_11_10"); //Ostro¿nie dobieraj przyjació³ i nie ganiaj za trollami, bo to nikomu jeszcze nie wysz³o na dobre!
	AI_Output (self, other, "DIA_Mark_Camp7_11_11"); //Rób co mówiê i mo¿e doczekasz czasów, kiedy barierê szlag trafi. 
	AI_Output (other, self, "DIA_Mark_Camp7_15_12"); //Dziêki Mark. Sporo mi pomog³eœ.
	AI_Output (self, other, "DIA_Mark_Camp7_11_13"); //Nie ma sprawy przyjacielu. Tylko nie daj siê zabiæ, bo kogo ja wtedy bêdê zanudza³?
	AI_Output (self, other, "DIA_Mark_Camp7_11_14"); //Powodzenia na szlaku!
	
   B_LogSetTopicStatus	(CH1_Rbl_MarkInfo, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_MarkInfo, "Mark sporo mi pomóg³, wiele dowiedzia³em siê o Kolonii Karnej. Nie bêdzie ³atwo, ale dam sobie radê!");
};

//**************************************************

INSTANCE DIA_Mark_Spy (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 13;
	condition		= DIA_Mark_Spy_Condition;
	information		= DIA_Mark_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie zauwa¿y³eœ czegoœ podejrzanego?"; 
};

FUNC INT DIA_Mark_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Spy_Info()
{
	AI_Output (other, self, "DIA_Mark_Spy_15_01"); //Nie zauwa¿y³eœ czegoœ podejrzanego?
	AI_Output (self, other, "DIA_Mark_Spy_11_02"); //Masz na myœli pirata wtykaj¹cego wszêdzie nos?
	AI_Output (other, self, "DIA_Mark_Spy_11_03"); //Pytam powa¿nie. Ktoœ w obozie wêszy dla Gomeza.
	AI_Output (self, other, "DIA_Mark_Spy_11_04"); //O kurwa! To ju¿ po nas!
	AI_Output (other, self, "DIA_Mark_Spy_15_05"); //Ciszej, bo ktoœ nas us³yszy! Uspokój siê i mów, czy nie zauwa¿y³eœ czegoœ dziwnego.	
	AI_Output (self, other, "DIA_Mark_Spy_11_06"); //Hmm, tu nic nie jest normalne.
	AI_Output (self, other, "DIA_Mark_Spy_11_07"); //Ka¿dy ma jakieœ tajemnice, a ja wolê sie od nich trzymaæ z daleka.
	AI_Output (self, other, "DIA_Mark_Spy_11_08"); //Popytaj innych, nie chcê sobie narobiæ wrogów.
	AI_Output (other, self, "DIA_Mark_Spy_11_09"); //Boisz siê kogoœ?
	AI_Output (self, other, "DIA_Mark_Spy_11_10"); //Ja?!
	AI_Output (self, other, "DIA_Mark_Spy_11_11"); //Pewnie, ¿e siê bojê, idioto! Sram w gacie na widok w³asnego cienia, nawet golê siê têp¹ brzytw¹.
	AI_Output (self, other, "DIA_Mark_Spy_11_12"); //Nie zamierzam zgrywaæ bohatera, popytaj innych!

	B_LogEntry		(CH2_Rbl_Spy, "Mark o dziwo nie okaza³ siê zbyt rozmowny. Widaæ, ¿e kogoœ siê boi i nie puœci pary z ust. Muszê spróbowaæ szczêœcia gdzie indziej.");

	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Mark_Spy1 (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 13;
	condition		= DIA_Mark_Spy1_Condition;
	information		= DIA_Mark_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kogo siê boisz?"; 
};

FUNC INT DIA_Mark_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Spy1_Info()
{
	AI_Output (other, self, "DIA_Mark_Spy1_15_01"); //Kogo siê boisz?
	AI_Output (self, other, "DIA_Mark_Spy1_11_02"); //Ciebie, orków, Gomeza, potrawek Snafa, ki³y, chêdo¿onych magów...
	AI_Output (self, other, "DIA_Mark_Spy1_11_03"); //Mam wyliczaæ dalej?
	AI_Output (other, self, "DIA_Mark_Spy1_15_04"); //Nie trzeba. Szkoda na Ciebie traciæ czas.
	AI_Output (self, other, "DIA_Mark_Spy1_11_05"); //Dok³adnie! Mark nie lubi rzucaæ siê w oczy, dlatego wszyscy mnie lubi¹.
	AI_Output (other, self, "DIA_Mark_Spy1_15_06"); //I niech tak zostanie. Bywaj.

	B_LogEntry		(CH2_Rbl_Spy, "Od Marka nie dowiem siê niczego, ten cz³owiek boi siê w³asnego cienia!");

	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Mark_Stew (C_INFO)
{
	npc				= RBL_2616_Mark;
	nr				= 12;
	condition		= DIA_Mark_Stew_Condition;
	information		= DIA_Mark_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcjê przepysznego gulaszu od Snafa."; 
};

FUNC INT DIA_Mark_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Mark_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Mark_Stew_15_01"); //Mam dla Ciebie porcjê przepysznego gulaszu od Snafa.
	AI_Output (self, other, "DIA_Mark_Stew_11_02"); //Zabierz to œwiñstwo ode mnie. Od potrawek Snafa mam koszmary.
   AI_Output (other, self, "DIA_Mark_Stew_15_03"); //WeŸmiesz ten gulasz, czy mam Ci go pchn¹æ do gard³a?
   AI_Output (self, other, "DIA_Mark_Stew_11_04"); //Daj mi ten gulasz, jakoœ to prze¿yjê.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Mark wspomnia³, ¿e ma koszmary od potraw Snafa, ale nak³oni³em go, ¿eby wzi¹³ porcjê."); 
}; 