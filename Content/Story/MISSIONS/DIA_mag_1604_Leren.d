//Exit in traders func's

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Leren_Hello (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 1;
	condition		= DIA_Leren_Hello_Condition;
	information		= DIA_Leren_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Hello_Condition()
{
// Ork: Tak mi sie przypomnia³a ta rozmowa wyskakuj¹ca w nieodpowiednim miejscu, w
// nie odpowiednim czasie co skonczy³o siê zmian¹ Rutyny i rozkurwieniem gry w piŸdzieæ :P
// *mam nadzieje ze to odp. WP (TODO / do sprawdzenia) i w miare dobry dystans
	if(Npc_GetDistToPlayer(self) < 200 && Npc_GetDistToWP(self,"WAY_PATHMAGE") < 1900)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Hello_Info()
{
	AI_Output (self, other, "DIA_Leren_Hello_11_00"); //Kolejny œmierdz¹cy szczur szukaj¹cy szczêœcia!
	AI_Output (other, self, "DIA_Leren_Hello_15_01"); //Nie jestem...
	AI_Output (self, other, "DIA_Leren_Hello_11_02"); //ZejdŸ mi z oczu, z³odzieju!
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(baalparvez,"start");
};

// **************************************************

INSTANCE DIA_Leren_Mag (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 2;
	condition		= DIA_Leren_Mag_Condition;
	information		= DIA_Leren_Mag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jesteœ magiem?"; 
};

FUNC INT DIA_Leren_Mag_Condition()
{
	if (CAVALORN_ASK_TRAIL==2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag_Info()
{
	AI_Output (other, self, "DIA_Leren_Mag_15_01"); //Jesteœ magiem?
	AI_Output (self, other, "DIA_Leren_Mag_11_02"); //Jak na to wpad³eœ? Kolejny dureñ, który traci mój bezcenny czas.
	AI_Output (other, self, "DIA_Leren_Mag_15_03"); //Mogê Ci pomóc.
	AI_Output (self, other, "DIA_Leren_Mag_11_04"); //Ty? A niby w czym?
	AI_Output (other, self, "DIA_Leren_Mag_15_05"); //Jesteœmy w Kolonii, a tutaj ka¿dy mniej lub bardziej potrzebuje czyjejœ pomocy. No wiesz, 'przynieœ, zabij, spal, zgwa³æ' i takie tam.
	AI_Output (self, other, "DIA_Leren_Mag_11_06"); //Hmm, mo¿e jednak warto poœwiêciæ Ci chwilkê.
	AI_Output (self, other, "DIA_Leren_Mag_11_07"); //A czego ¿¹dasz w zamian?
	AI_Output (other, self, "DIA_Leren_Mag_15_08"); //Podzielisz siê ze mn¹ swoj¹ wiedz¹. Chcê poznaæ arkana magii.
	AI_Output (self, other, "DIA_Leren_Mag_11_09"); //Jednak jesteœ g³upcem! Nie ka¿dy mo¿e zostaæ magiem. Myœlisz, ¿e to takie proste? Formu³ka i bach kula ognia!
	AI_Output (self, other, "DIA_Leren_Mag_11_10"); //To lata zg³êbiania tajemnej wiedzy, medytacja, ofiary poœwiêcone bogom, próby cia³a jak i ducha, droga do doskona³oœci, a w koñcu...
	AI_Output (other, self, "DIA_Leren_Mag_15_11"); //Przestañ pieprzyæ. Wszystkiego mo¿na siê nauczyæ, równie dobrze mo¿e to byæ robienie lewatywy, co rzucenie kuli ognia. 
	AI_Output (other, self, "DIA_Leren_Mag_15_12"); //Wszystko zale¿y od motywacji i determinacji, a mi nie brakuje jednego ani drugiego. Wiêc jak bêdzie?
	AI_Output (self, other, "DIA_Leren_Mag_11_13"); //No dobra, nauczê Ciê kilku sztuczek, ale najpierw coœ dla mnie zrobisz.
	AI_Output (other, self, "DIA_Leren_Mag_15_14"); //W³aœnie po to tu jestem.
	AI_Output (self, other, "DIA_Leren_Mag_11_15"); //Widzisz, jestem naukowcem, wizjonerem i kolekcjonerem.
	AI_Output (self, other, "DIA_Leren_Mag_11_16"); //Od zawsze fascynowa³y mnie przedmioty poœwiêcone bogom, emanuj¹ce moc¹, naznaczone magi¹...
	AI_Output (other, self, "DIA_Leren_Mag_15_17"); //Czyli artefakty. Mo¿e i jestem piratem, ale nie jestem idiot¹.
	AI_Output (self, other, "DIA_Leren_Mag_11_18"); //Tak, artefakty. Tak siê sk³ada, ¿e wyczu³em aurê takiego przedmiotu w œwi¹tyni orków.
	AI_Output (other, self, "DIA_Leren_Mag_15_19"); //Ju¿ powiedzia³em, ¿e nie jestem idiot¹. Nie pójdê po jakieœ œwiecide³ko do œwi¹tyni pe³nej orków.
	AI_Output (self, other, "DIA_Leren_Mag_11_20"); //Ale tam ju¿ od dawna ich nie ma. To stara, zrujnowana œwi¹tynia. Cuchnie œmierci¹ i szczurzymi odchodami. Poczujesz siê tam jak w domu.
	AI_Output (self, other, "DIA_Leren_Mag_11_21"); //Znajdziesz tam przedmiot o potê¿nej aurze, ale nie mo¿esz go u¿yæ! Przynieœ go do mnie, to dobijemy targu.
	
   if (mag_knows == FALSE)
	{
		mag_knows = TRUE;
		Log_CreateTopic(CH2_RBL_Magic, LOG_MISSION);
		Log_SetTopicStatus(CH2_RBL_Magic, LOG_RUNNING);
	};
		
   B_LogEntry(CH2_RBL_Magic, "Leren nauczy mnie kilku magicznych sztuczek, je¿eli przyniosê mu jakiœ magiczny artefakt ze zrujnowanej œwi¹tyni orków.");
   B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_Leren_CanYouTeachMe (C_INFO)
{
	npc				=  mag_1604_Leren;
	nr				= 4;
	condition		= DIA_Leren_CanYouTeachMe_Condition;
	information		= DIA_Leren_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Leren_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Mag))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Leren_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Leren_CanYouTeachMe_15_02"); //Mogê nauczyæ ciê, jak zwiêkszyæ duchow¹ si³ê i jak regenerowaæ manê. 
   AI_Output (self, other, "DIA_Leren_CanYouTeachMe_15_03"); //Kiedy zostaniesz magiem, przeka¿ê ci wiedzê dotycz¹c¹ piêciu krêgów.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Leren mo¿e mi pomóc zwiêkszyæ manê i j¹ zregenerowaæ. Jak zostanê magiem, to nauczy mnie te¿ magicznych sztuczek.");
};

INSTANCE DIA_Leren_Mag1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 3;
	condition		= DIA_Leren_Mag1_Condition;
	information		= DIA_Leren_Mag1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, pójdê do tej œwi¹tyni."; 
};

FUNC INT DIA_Leren_Mag1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag1_Info()
{
	AI_Output (other, self, "DIA_Leren_Mag1_15_01"); //Dobra, pójdê do tej œwi¹tyni.
	AI_Output (self, other, "DIA_Leren_Mag1_11_02"); //Wiedzia³em, ¿e znajdziesz w sobie wystarczaj¹ca odwagê, aby...
	AI_Output (other, self, "DIA_Leren_Mag1_15_03"); //Daruj sobie. Gdzie ta kupa gruzu?
	
	//orc-edytowany dialog, swiatynia jest blisko wiec Leren tlumaczy tylko jak dotrzec
	AI_Output (self, other, "DIA_Leren_Mag1_11_04"); //Œwi¹tynia znajdujê siê niedaleko.
	AI_Output (self, other, "DIA_Leren_Mag1_11_05");//PrzejdŸ pod mostem, omiñ zagrodê Snafa i idŸ ca³y czas na wprost. Dotrzesz do dawnej orkowej areny. 
	AI_Output (self, other, "DIA_Leren_Mag1_11_06"); //Tam znajdziesz artefakt.
	AI_Output (other, self, "DIA_Leren_Mag1_15_07"); //Komu w drogê temu czas.

	Wld_insertItem(ItArArifact_01, "WP_ORNAMENT");

	Log_CreateTopic(CH2_RBL_Artefact, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Artefact, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Artefact, "Leren wskaza³ mi drogê do œwi¹tyni orków. Mam tam odnaleŸæ jakiœ artefakt i przynieœæ go magowi. Powinno pójœæ doœæ ³atwo, o ile tam faktycznie nie ma ¿ywych orków.");
};

// **************************************************

INSTANCE DIA_Leren_Mag2 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 3;
	condition		= DIA_Leren_Mag2_Condition;
	information		= DIA_Leren_Mag2_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ten artefakt?"; 
};

FUNC INT DIA_Leren_Mag2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag1))&&(NPC_HasItems(hero,dusk_power)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Mag2_Info()
{
	mag_prove = mag_prove + 1;
	B_GiveXP(800);
	AI_Output (other, self, "DIA_Leren_Mag2_15_01"); //To ten artefakt?
	AI_Output (self, other, "DIA_Leren_Mag2_11_02"); //Na ow³osione jaja Beliara, uda³o Ci siê!
	AI_Output (other, self, "DIA_Leren_Mag2_15_03"); //Zabi³em przy tym pewnego rozgadanego umarlaka...
	AI_Output (self, other, "DIA_Leren_Mag2_11_04"); //Niewa¿ne, daj mi relikt!
	B_GiveInvItems (other, self, dusk_power,1);
	AI_Output (other, self, "DIA_Leren_Mag2_15_05"); //A co z nauk¹?
	AI_Output (self, other, "DIA_Leren_Mag2_11_06"); //PóŸniej o tym pogadamy! 
	AI_Output (self, other, "DIA_Leren_Mag2_11_07"); //Teraz muszê zg³êbiæ tajemnicê tego wspania³ego dziedzictwa orków...
	
   Log_SetTopicStatus(CH2_RBL_Artefact, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Artefact, "Odda³em Lerenowui zorzê, tylko, ¿e ten zamiast mnie czegoœ nauczyæ, zacz¹³ œliniæ siê na widok artefaktu. Coraz bardziej dziwiê siê tym, którzy dobrowolnie zostaj¹ magami.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Leren_Next (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 4;
	condition		= DIA_Leren_Next_Condition;
	information		= DIA_Leren_Next_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem ju¿ gotów na naukê!"; 
};

FUNC INT DIA_Leren_Next_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Ask))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Next_Info()
{
	AI_Output (other, self, "DIA_Leren_Next_15_01"); //Jestem ju¿ gotów na naukê!
	AI_Output (self, other, "DIA_Leren_Next_11_02"); //Ale ja nie jestem jeszcze na to przygotowany.
	AI_Output (other, self, "DIA_Leren_Next_15_03"); //Rozmawia³em z Miltenem...
	AI_Output (self, other, "DIA_Leren_Next_11_04"); //Wiem, przynios³eœ mu wszystkie sk³adniki do wywarów. Wytrwa³y z Ciebie skurczybyk.
	AI_Output (other, self, "DIA_Leren_Next_15_05"); //Wiêc jak bêdzie z nauk¹?
	AI_Output (self, other, "DIA_Leren_Next_11_06"); //Z chêci¹ pokaza³bym Ci kilka sztuczek, ale Ÿród³a s¹ teraz bardzo niestabilne.
	AI_Output (other, self, "DIA_Leren_Next_15_07"); //Jakie Ÿród³a?
	AI_Output (self, other, "DIA_Leren_Next_11_08"); //ród³a magii g³upcze! A sk¹d mam czerpaæ energiê, z onuc?
	AI_Output (self, other, "DIA_Leren_Next_11_09"); //Jakiœ czas temu skradziono cholern¹ Tritetrê. Od tej chwili magowie w Kolonii maj¹ problem ze zogniskowaniem mocy.
	AI_Output (other, self, "DIA_Leren_Next_15_10"); //Co to za Tritetra?
	AI_Output (self, other, "DIA_Leren_Next_11_11"); //To dwanaœcie œwiêtych pos¹¿ków. Ka¿dy z nich zosta³ konsekrowany na o³tarzu w Wielkiej Œwi¹tyni jakiegoœ boga.
	AI_Output (other, self, "DIA_Leren_Next_15_12"); //Beliara te¿?
	AI_Output (self, other, "DIA_Leren_Next_11_13"); //Oczywiœcie. Tritetra jest bardzo stara, nie mam pojêcia, jak siê tutaj znalaz³a. Ale jej po³¹czona moc mog³aby zniszczyæ barierê, a przy okazji wszystkich skazañców.
	AI_Output (self, other, "DIA_Leren_Next_11_14"); //Ten ktoœ musia³ wiedzieæ, co robi. Zdo³a³em wyœledziæ miejsca, gdzie ukryto figurki. Rozrzucono je po ca³ej Kolonii.
	AI_Output (other, self, "DIA_Leren_Next_15_15"); //Dlaczego ktoœ mia³by to robiæ?
	AI_Output (self, other, "DIA_Leren_Next_11_16"); //Figurki przechowywane by³y w starych grobowcach, spoczywali tam bohaterowie ka¿dego z bogów. Ich nieumar³e aspekty strzeg³y pos¹¿ków.
	AI_Output (self, other, "DIA_Leren_Next_11_17"); //Jednak ktoœ na tyle szalony by rzuciæ wyzwanie bogom, skrad³ pos¹¿ki i zniszczy³ stra¿ników.
	AI_Output (self, other, "DIA_Leren_Next_11_18"); //Ale ¿aden œmiertelnik nie jest w stanie przenieœæ sam wszystkich pos¹¿ków. Ich moc jest zbyt potê¿na, zniszczy³aby ka¿dego œmia³ka.
	AI_Output (other, self, "DIA_Leren_Next_15_19"); //Dlatego porozrzuca³ je po Kolonii?
	AI_Output (self, other, "DIA_Leren_Next_11_20"); //Raczej ukry³ w ró¿nych miejscach. Nie przewidzia³ tylko jednego, ¿e figurki zechc¹ mu siê sprzeciwiæ.
	AI_Output (other, self, "DIA_Leren_Next_15_21"); //A motywy?
	AI_Output (self, other, "DIA_Leren_Next_11_22"); //Tego nigdy siê nie dowiemy. Znalaz³em szcz¹tki tego g³upca, a przy nim pierœcieñ z akwamarynem.
	AI_Output (other, self, "DIA_Leren_Next_15_23"); //Akwamaryn? Mo¿e to symbol jakiejœ organizacji albo sekty?
	AI_Output (self, other, "DIA_Leren_Next_11_24"); //Mo¿liwe. Ale tajemnice to specjalnoœæ Miltena. Pogadaj z nim o pierœcieniu. Dla mnie najwa¿niejsze s¹ pos¹¿ki.
	AI_Output (other, self, "DIA_Leren_Next_15_25"); //Mam je odnaleŸæ?
	AI_Output (self, other, "DIA_Leren_Next_11_26"); //Raczej przynieœæ, bo okreœli³em ju¿ po³o¿enie ka¿dej z figurek. Przyniesiesz pos¹¿ki w okreœlonej kolejnoœci, inaczej móg³byœ przep³aciæ to ¿yciem.
	AI_Output (self, other, "DIA_Leren_Next_11_27"); //Wiêc jak bêdzie?
};

// **************************************************

INSTANCE DIA_Leren_Next1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 5;
	condition		= DIA_Leren_Next1_Condition;
	information		= DIA_Leren_Next1_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz¹dku, przyniosê pos¹¿ki."; 
};

FUNC INT DIA_Leren_Next1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Next1_Info()
{
	AI_Output (other, self, "DIA_Leren_Next1_15_01"); //W porz¹dku, przyniosê pos¹¿ki.
	AI_Output (self, other, "DIA_Leren_Next1_11_02"); //Nie traæmy wiêc czasu na zbêdne k³apanie gêb¹. Pos¹¿ków jest dwanaœcie, po cztery dla ka¿dego boga. 
	AI_Output (other, self, "DIA_Leren_Next1_15_03"); //Dlaczego akurat po cztery?
	AI_Output (self, other, "DIA_Leren_Next1_11_04"); //Bo tyle jest stron œwiata g³upcze! No i tyle jest te¿ Wielkich Œwi¹tyñ konsekrowanych ka¿demu z bogów.
	AI_Output (self, other, "DIA_Leren_Next1_11_05"); //Jako pierwsz¹ przynieœ figurkê Beliara. Znajdziesz j¹ gdzieœ na wybrze¿u, tam gdzie morze wyrzuci³o was na brzeg.
	AI_Output (self, other, "DIA_Leren_Next1_11_06"); //Tylko uwa¿aj, figurka jest przesycona magi¹ Beliara. Figurkê jak najszybciej przynieœ do mnie.
	AI_Output (other, self, "DIA_Leren_Next1_15_07"); //W porz¹dku.

	/*****************************
	Ork jakiœ WP mu daj
	***************************/
	MIS_Tritetra_on=1;
	Wld_InsertNpc(SkeletonMage_Beliar,"OW_COAST_SHIPWRECK_WARAN_2");
	Log_CreateTopic(CH2_RBL_Tritetra, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Tritetra, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Tritetra, "Muszê przynieœæ Lerenowi Tritetrê - dwanaœcie pos¹¿ków poœwiêconych ka¿demu z bogów. Mam zacz¹æ od pos¹¿ka Beliara ukrytego gdzieœ na pla¿y.");
	MIS_Tritetra_innos_counter_max=60;
	MIS_Tritetra_adanos_counter_max=50;
};

// **************************************************

INSTANCE DIA_Leren_FirstBeliar (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 5;
	condition		= DIA_Leren_FirstBeliar_Condition;
	information		= DIA_Leren_FirstBeliar_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zabierz ode mnie to cholerstwo!"; 
};

FUNC INT DIA_Leren_FirstBeliar_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_HelloAgain))&&(NPC_HasItems(other,tri_beliar_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstBeliar_Info()
{
	B_GiveXP (500);
	
   AI_Output (other, self, "DIA_Leren_FirstBeliar_15_01"); //Zabierz ode mnie to cholerstwo!
	AI_Output (self, other, "DIA_Leren_FirstBeliar_11_02"); //Cuchnie samym Beliarem, daj to natychmiast!
	
   B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	
   AI_Output (self, other, "DIA_Leren_FirstBeliar_11_03"); //Odniosê pos¹¿ek tam, gdzie jego moc nikomu nie zaszkodzi.
	
   B_LogEntry(CH2_RBL_Tritetra, "Odda³em pierwszy pos¹¿ek Beliara Lerenowi. Czu³em siê, jakby to paskudztwo ch³epta³o moja krew.");
	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_FirstInnos (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 6;
	condition		= DIA_Leren_FirstInnos_Condition;
	information		= DIA_Leren_FirstInnos_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_FirstInnos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstBeliar ))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstInnos_Info()
{
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_01"); //Teraz przynieœ mi pos¹¿ek Innosa, znajdziesz go na Placu Wymian.
	AI_Output (other, self, "DIA_Leren_FirstInnos_15_02"); //Na Placu Wymian? A co to za miejsce?
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_03"); //To pierwsze co widz¹ skazañcy trafiaj¹c do Kolonii. 
	AI_Output (self, other, "DIA_Leren_FirstInnos_11_04"); //Ruszaj¹c ze Starego Obozu w stronê kopalni Iana, skrêæ w prawo i idŸ ca³y czas œcie¿k¹ w górê. Na koñcu drogi znajdziesz niewielk¹ nieckê i placyk. To jest w³aœnie Plac Wymian.
	B_LogEntry(CH2_RBL_Tritetra, "Kolejny pos¹¿ek, tym razem poœwiêcony Innosowi, odnajdê na Placu Wymian.");
	Wld_InsertNpc(GreenGobboGarbus,"WP_INTRO_FALL3");
};

// **************************************************

INSTANCE DIA_Leren_FirstInnos1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 7;
	condition		= DIA_Leren_FirstInnos1_Condition;
	information		= DIA_Leren_FirstInnos1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto pos¹¿ek Innosa."; 
};

FUNC INT DIA_Leren_FirstInnos1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Garbus_HelloAgain))&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstInnos1_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Leren_FirstInnos1_15_01"); //Oto pos¹¿ek Innosa.
	AI_Output (self, other, "DIA_Leren_FirstInnos1_11_02"); //Wyœmienicie. Uwolniê Ciê od tego ciê¿aru.
   
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Odda³em Lerenowi pos¹¿ek Innosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_FirstAdan (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 8;
	condition		= DIA_Leren_FirstAdan_Condition;
	information		= DIA_Leren_FirstAdan_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_FirstAdan_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstInnos1))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstAdan_Info()
{
	AI_Output (self, other, "DIA_Leren_FirstAdan_11_01"); //Teraz wyruszysz po pos¹¿ek Adanosa. Poszukaj w pobli¿u kamiennej twierdzy.
	AI_Output (other, self, "DIA_Leren_FirstAdan_15_02"); //Dobrze.
	
   B_LogEntry(CH2_RBL_Tritetra, "Pierwszy pos¹¿ek Adanosa odnajdê w pobli¿u kamiennej twierdzy.");
	Wld_InsertNpc(Wisp_Adan,"PATH_TO_PLATEAU04_BRIDGE2");
};

// **************************************************

INSTANCE DIA_Leren_AdanosFirst (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 9;
	condition		= DIA_Leren_AdanosFirst_Condition;
	information		= DIA_Leren_AdanosFirst_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios³em pos¹¿ek Adanosa."; 
};

FUNC INT DIA_Leren_AdanosFirst_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Garbus_HelloAgain))&&(NPC_HasItems(other,tri_adan_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AdanosFirst_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Leren_AdanosFirst_15_01"); //Przynios³em pos¹¿ek Adanosa.
	AI_Output (self, other, "DIA_Leren_AdanosFirst_11_02"); //Œwietnie, zaczynam wierzyæ, ¿e zdo³asz odzyskaæ ca³¹ Tritetrê.
   
	B_GiveInvItems (other, self, tri_adan_statue, 1);
	Npc_RemoveInvItems(self,tri_adan_statue,1);
	B_LogEntry(CH2_RBL_Tritetra, "Odda³em Lerenowi pos¹¿ek Adanosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_NextStatu (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 9;
	condition		= DIA_Leren_NextStatu_Condition;
	information		= DIA_Leren_NextStatu_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_NextStatu_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_AdanosFirst ))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_NextStatu_Info()
{
	AI_Output (self, other, "DIA_Leren_NextStatu_11_01"); //Czas na kolejn¹ próbê. Niestety mam z³e wieœci.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_02"); //Co siê sta³o?
	AI_Output (self, other, "DIA_Leren_NextStatu_11_03"); //Bogowie postanowili pokrzy¿owaæ nam plany. Pos¹¿ki siê po³¹czy³y, powsta³y trzy pary i jedna trójca.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_04"); //Rzeczywiœcie bêdzie trudniej. Ale musimy spróbowaæ.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_05"); //Poza tym ja zawsze koñczê to, co zaczynam. Mów, co robimy.
	AI_Output (self, other, "DIA_Leren_NextStatu_11_06"); //Dwa pos¹¿ki, poœwiêcone Beliarowi i Innosowi znajdziesz w pobli¿u orkowego cmentarzyska.
	AI_Output (self, other, "DIA_Leren_NextStatu_11_07"); //Tylko uwa¿aj, po³¹czona moc figurek mo¿e Ciê z ³atwoœci¹ zabiæ.
	AI_Output (other, self, "DIA_Leren_NextStatu_15_08"); //Bez obaw, ostro¿noœæ to moje drugie imiê.

	B_LogEntry(CH2_RBL_Tritetra, "Dwa pos¹¿ki - Beliara i Innosa, znajdê gdzieœ na bagnach.");
	B_StopProcessInfos(self);
	var C_NPC BeliarSke; BeliarSke=Hlp_GetNpc(SkeletonMage_Beliar);
	Npc_ExchangeRoutine(BeliarSke,"GRAVEYARD");
};

// **************************************************

INSTANCE DIA_Leren_FirstTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 10;
	condition		= DIA_Leren_FirstTwo_Condition;
	information		= DIA_Leren_FirstTwo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pierwsz¹ parê!"; 
};

FUNC INT DIA_Leren_FirstTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Mag_Beliar_Hello))&&(NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_FirstTwo_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_FirstTwo_15_01"); //Mam pierwsz¹ parê!
	AI_Output (self, other, "DIA_Leren_FirstTwo_11_02"); //Podo³a³eœ kolejnej próbie, przeka¿ mi swoje brzemiê.
   
	B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Oddda³em Lerenowi pos¹¿ek Innosa i Beliara.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_NextTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 11;
	condition		= DIA_Leren_NextTwo_Condition;
	information		= DIA_Leren_NextTwo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_NextTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstTwo))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_NextTwo_Info()
{
	AI_Output (self, other, "DIA_Leren_NextTwo_11_01"); //Kolejn¹ parê znajdziesz w pobli¿u wejœcia do Starej Kopalni. Tym razem bêd¹ to dwa pos¹¿ki Adanosa.
	AI_Output (other, self, "DIA_Leren_NextTwo_15_02"); //Ju¿ nie mogê siê doczekaæ...
	
   B_LogEntry(CH2_RBL_Tritetra, "Kolejna para pos¹¿ków 'czeka' na mnie w pobli¿u Starej Kopalni.");
	B_StopProcessInfos(self);
	var C_NPC Adanos_wisp; Adanos_wisp=Hlp_GetNpc(Wisp_Adan);	
	Npc_ExchangeRoutine(Adanos_wisp,"MINE");
};

// **************************************************

INSTANCE DIA_Leren_TwoAdan (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 12;
	condition		= DIA_Leren_TwoAdan_Condition;
	information		= DIA_Leren_TwoAdan_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto pos¹¿ki Adanosa."; 
};

FUNC INT DIA_Leren_TwoAdan_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Pair1))&&(NPC_HasItems(other,tri_adan_statue)>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_TwoAdan_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_TwoAdan_15_01"); //Oto pos¹¿ki Adanosa.
	AI_Output (self, other, "DIA_Leren_TwoAdan_11_02"); //Przyjmê je i odniosê w bezpieczne miejsce.
	
   B_GiveInvItems (other, self, tri_adan_statue, 2);
	Npc_RemoveInvItems(self,tri_adan_statue,2);

	B_LogEntry(CH2_RBL_Tritetra, "Odda³em Lerenowi dwa pos¹¿ki Adanosa.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastTwo (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 13;
	condition		= DIA_Leren_LastTwo_Condition;
	information		= DIA_Leren_LastTwo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastTwo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_TwoAdan))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastTwo_Info()
{
	AI_Output (self, other, "DIA_Leren_LastTwo_11_01"); //To ju¿ ostatnia dwójka. To dziwne, ale znalaz³ j¹ jakiœ skazaniec. Szukaj go przed po³udniowym wejœciem do Starego Obozu.
	AI_Output (other, self, "DIA_Leren_LastTwo_15_02"); //Mam nadziejê, ¿e nie zaniesie ich Gomezowi.
	AI_Output (self, other, "DIA_Leren_LastTwo_11_03"); //To by³oby niefortunne. Ruszaj jak najszybciej.
	
   B_LogEntry(CH2_RBL_Tritetra, "Ostatnia para pos¹¿ków znajduje siê w posiadaniu jakiegoœ cz³owieka. Mam go szukaæ przed po³udniowym wejœciem do Starego Obozu.");
	Wld_InsertNpc(HUN_4035_Jahr,"OC_ROUND_13");
};

// **************************************************

INSTANCE DIA_Leren_LastTwoFinish (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 14;
	condition		= DIA_Leren_LastTwoFinish_Condition;
	information		= DIA_Leren_LastTwoFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ostatni¹ parê."; 
};

FUNC INT DIA_Leren_LastTwoFinish_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_hun_4035_jahr_Hello))&&(NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastTwoFinish_Info()
{
	B_GiveXP (800);
	AI_Output (other, self, "DIA_Leren_LastTwoFinish_15_01"); //Mam ostatni¹ parê.
	AI_Output (self, other, "DIA_Leren_LastTwoFinish_11_02"); //Ju¿ je zabieram.
	
   B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Znowu odda³em Lerenowi pos¹¿ek Innosa i Beliara.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastThree (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 15;
	condition		= DIA_Leren_LastThree_Condition;
	information		= DIA_Leren_LastThree_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastThree_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastTwoFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThree_Info()
{
	AI_Output (self, other, "DIA_Leren_LastThree_11_01"); //Nie mamy czasu do stracenia. Zosta³y ostatnie trzy pos¹¿ki. 
	AI_Output (other, self, "DIA_Leren_LastThree_15_02"); //Gdzie je znajdê?
	AI_Output (self, other, "DIA_Leren_LastThree_11_03"); //Gdzieœ w jaskini nieopodal wejœcia na terytorium orków.
	AI_Output (self, other, "DIA_Leren_LastThree_11_04"); //Bêdê z Tob¹ szczery. Z tego co wiem, jeszcze ¿aden œmiertelnik nie zdo³a³ zdzier¿yæ mocy trzech statuetek.
	AI_Output (other, self, "DIA_Leren_LastThree_15_05"); //Wiêc lepiej módl siê o to, ¿ebym by³ pierwszy. Ruszam.
	AI_Output (self, other, "DIA_Leren_LastThree_11_06"); //Niech Ciê Innos strze¿e.
	AI_Output (other, self, "DIA_Leren_LastThree_15_07"); //Wola³bym raczej, ¿eby ¿aden z bogów nie zwraca³ na mnie uwagi.
	
   B_LogEntry(CH2_RBL_Tritetra, "Czeka mnie wyprawa po ostatnie trzy pos¹¿ki. Znajdê je gdzieœ w jaskini nieopodal wejœcia na orkowe tereny.");
	B_StopProcessInfos(self);	
	var C_NPC Adanos_wisp; Adanos_wisp=Hlp_GetNpc(Wisp_Adan);	
	Npc_ExchangeRoutine(Adanos_wisp,"Cave");	
};

// **************************************************

INSTANCE DIA_Leren_LastThreeFinish (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 16;
	condition		= DIA_Leren_LastThreeFinish_Condition;
	information		= DIA_Leren_LastThreeFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto ostatnie pos¹¿ki!"; 
};

FUNC INT DIA_Leren_LastThreeFinish_Condition()
{
	if (NPC_HasItems(other,tri_beliar_statue)>=1)&&(NPC_HasItems(other,tri_innos_statue)>=1)&&(NPC_HasItems(other,tri_adan_statue)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThreeFinish_Info()
{
	AI_Output (other, self, "DIA_Leren_LastThreeFinish_15_01"); //Oto ostatnie pos¹¿ki!
	AI_Output (self, other, "DIA_Leren_LastThreeFinish_11_02"); //Dokona³o siê. Obym zdo³a³ donieœæ je na miejsce...
   
	B_GiveInvItems (other, self, tri_beliar_statue, 1);
	Npc_RemoveInvItems(self,tri_beliar_statue,1);
	B_GiveInvItems (other, self, tri_innos_statue, 1);
	Npc_RemoveInvItems(self,tri_innos_statue,1);
	B_GiveInvItems (other, self, tri_adan_statue, 1);
	Npc_RemoveInvItems(self,tri_adan_statue,1);
   
	B_LogEntry(CH2_RBL_Tritetra, "Odda³em Lerenowi ostatnie trzy pos¹¿ki.");

	B_StopProcessInfos(self);
	AI_GotoWP(self, "WP_GO");
	AI_GotoWP(self, "WP_BACK");
};

// **************************************************

INSTANCE DIA_Leren_LastThreeFinish1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 17;
	condition		= DIA_Leren_LastThreeFinish1_Condition;
	information		= DIA_Leren_LastThreeFinish1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_LastThreeFinish1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastThreeFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_LastThreeFinish1_Info()
{
	B_GiveXP (1500);
	
   AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_01"); //Trudno mi w to uwierzyæ. Tritetra znowu jest po³¹czona!
	AI_Output (other, self, "DIA_Leren_LastThreeFinish1_15_02"); //Co zamierzasz uczyniæ?
	AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_03"); //O to siê nie k³opotaj, przyjacielu. Dowiesz siê wszystkiego w swoim czasie.
	AI_Output (self, other, "DIA_Leren_LastThreeFinish1_11_04"); //Nied³ugo rozpoczniemy naukê magii. Jednak najpierw idŸ porozmawiaj z Ratfordem.
	
   Log_SetTopicStatus(CH2_RBL_Tritetra, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Tritetra, "Tritetra znowu jest jednoœci¹. Leren nie zdradzi³ co magowie zamierzaj¹ uczyniæ z jej moc¹. Powiedzia³, ¿e nied³ugo rozpoczniemy naukê magii. Aha i mam porozmawiaæ z Ratfordem.");
	B_StopProcessInfos(self);	
	MIS_Tritetra_on=0;
};

// **************************************************

INSTANCE DIA_Leren_Eqqupiment (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 18;
	condition		= DIA_Leren_Eqqupiment_Condition;
	information		= DIA_Leren_Eqqupiment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyby³em po szatê maga."; 
};

FUNC INT DIA_Leren_Eqqupiment_Condition()
{
	if (other.guild == GIL_MAG)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Eqqupiment_Info()
{
	AI_Output (other, self, "DIA_Leren_Eqqupiment_15_01"); //Przyby³em po szatê maga.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_02"); //Przyby³eœ? No dobra, weŸ te ³achy. Zosta³y po jednym pechowcu, co rzuca³ w orków kulami ognia.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_03"); //Krew i fekalia na szacie ju¿ prawie zasch³y. Niech Ci s³u¿y lepiej ni¿ jemu.
	AI_Output (self, other, "DIA_Leren_Eqqupiment_11_04"); //Aha i dam Ci dobr¹ radê - wypierz te szmaty, zanim je za³o¿ysz!

	CreateInvItem(other, MAG_ARMOR_L);
	CreateInvItem(self, MAG_ARMOR_L);
	B_GiveInvItems(self, other, MAG_ARMOR_L, 1);
	AI_EquipArmor(other, MAG_ARMOR_L);

	B_eqquip_check_mag();
	
   B_LogEntry(CH3_RBL_Choose, "Otrzyma³em od Lerena szatê maga.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Leren_OldNote (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 190;
	condition		= DIA_Leren_OldNote_Condition;
	information		= DIA_Leren_OldNote_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em coœ starego i cuchn¹cego..."; 
};

FUNC INT DIA_Leren_OldNote_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Rodney_OldNote))&&(NPC_HasItems(other,ork_oldnote)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_OldNote_Info()
{
	AI_Output (other, self, "DIA_Leren_OldNote_15_01"); //Znalaz³em coœ starego i cuchn¹cego...
	AI_Output (self, other, "DIA_Leren_OldNote_11_02"); //O czym Ty mówisz?
	AI_Output (other, self, "DIA_Leren_OldNote_15_03"); //I pomyœla³em, ¿e mo¿e rzucisz na to okiem.
	AI_Output (self, other, "DIA_Leren_OldNote_11_04"); //Co to jest?
	AI_Output (other, self, "DIA_Leren_OldNote_15_05"); //Rozsypuj¹cy siê pergamin...
	AI_Output (self, other, "DIA_Leren_OldNote_11_06"); //Ostro¿nie! Poka¿ papier.
	
   B_GiveInvItems(other,self,ork_oldnote,1);
	B_UseFakeScroll(self);
	
   AI_Output (self, other, "DIA_Leren_OldNote_11_07"); //Ciekawe... To wczesna mroczna mowa.
	AI_Output (other, self, "DIA_Leren_OldNote_15_08"); //Co to znaczy?
	AI_Output (self, other, "DIA_Leren_OldNote_11_09"); //To pismo orków. Ale nawet jak na nich bardzo toporne. W sumie to piktogramy.
	AI_Output (other, self, "DIA_Leren_OldNote_15_10"); //Potrafisz je odczytaæ?
	AI_Output (self, other, "DIA_Leren_OldNote_11_11"); //Pewnie, ale wiêkszoœæ wyblak³a.
	AI_Output (self, other, "DIA_Leren_OldNote_11_12"); //Orkowy dowódca zdoby³ ludzk¹ osadê. Ten znaczek, nie znam go...
	AI_Output (self, other, "DIA_Leren_OldNote_11_13"); //To mo¿e oznaczaæ fortel, albo podstêp... 
	AI_Output (self, other, "DIA_Leren_OldNote_11_14"); //Wynika z tego, ¿e zdobyli ludzkie sadyby z pomoc¹ zdrajcy.
	AI_Output (self, other, "DIA_Leren_OldNote_11_15"); //To ciekawe. Co za cz³owiek chcia³by pomagaæ orkom?
	AI_Output (other, self, "DIA_Leren_OldNote_15_16"); //Co dalej?
	AI_Output (self, other, "DIA_Leren_OldNote_11_17"); //W sumie niewiele. Jest jakaœ nazwa... Orgh'Athogn.
	AI_Output (self, other, "DIA_Leren_OldNote_11_18"); //Hmm. Mgliste Wzgórze, albo jakaœ wynios³a budowla we mgle.
	AI_Output (other, self, "DIA_Leren_OldNote_15_19"); //Mo¿e Wie¿a Mgie³?
	AI_Output (self, other, "DIA_Leren_OldNote_11_20"); //Byæ mo¿e. Nic wiêcej... O cholera! List ca³kiem siê rozsypa³.
	AI_Output (other, self, "DIA_Leren_OldNote_15_21"); //No to œwietnie. Ale chyba wiem, gdzie mo¿na znaleŸæ Wie¿ê Mgie³.
	AI_Output (other, self, "DIA_Leren_OldNote_15_22"); //Dziêki za pomoc, Leren.
	
   B_LogEntry(CH3_RBL_RodneyHelp, "Lerenowi uda³o siê odczytaæ skrawek pergaminu, zanim ca³kiem siê rozpad³. Wieki temu orkowie zdobyli ludzk¹ osadê z pomoc¹ zdrajcy spoœród ludzi. W tekœcie przewinê³a siê te¿ nazwa podobna do Wie¿y Mgie³. Ciekawe tylko, czego mam tam szukaæ?");

	/*********************************

Ork tutaj wypada³oby wsadziæ pana Roderica do wie¿y mgie³. I pamietaj, ¿e ma byæ on tylko miêdzy 22 a 4

************************************/
	Wld_InsertNpc(Roderic,"OW_FOGTOWER_TOP");
};

// **************************************************

INSTANCE DIA_Leren_Rodney (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 19;
	condition		= DIA_Leren_Rodney_Condition;
	information		= DIA_Leren_Rodney_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em porozmawiaæ o inicjacji Rodneya."; 
};

FUNC INT DIA_Leren_Rodney_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_Sword))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Rodney_Info()
{
	AI_Output (other, self, "DIA_Leren_Rodney_15_01"); //Chcia³em porozmawiaæ o inicjacji Rodneya.
	AI_Output (self, other, "DIA_Leren_Rodney_11_02"); //Wiem, ¿e mu pomagasz. 
	AI_Output (other, self, "DIA_Leren_Rodney_15_03"); //A ja wiem, ¿e przymkniesz na to oko.
	AI_Output (self, other, "DIA_Leren_Rodney_11_04"); //A niby dlaczego?

	Info_ClearChoices (DIA_Leren_Rodney);
	Info_AddChoice (DIA_Leren_Rodney, "A dlaczego nie?", DIA_Leren_Rodney_Want);
	
	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog³em.", DIA_Leren_Rodney_Help);
	};
	
   Info_AddChoice (DIA_Leren_Rodney, "Pomaga³em przyjacielowi.", DIA_Leren_Rodney_Should);
};

// ---------------------------mag----------------------------------------

FUNC VOID DIA_Leren_Rodney_Mag()
{
	B_GiveXP(250);	
	rodney_mag = TRUE;
	
   AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_01"); //Bo jestem jednym z was!
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_02"); //Hmm, mo¿e i jesteœ, ale zbyt krótko, aby...
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_03"); //To, ¿e nie noszê szaty maga od kilku lat nie oznacza, ¿e jestem od was gorszy.
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_04"); //Nie to chcia³em powiedzieæ...
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_05"); //A ja chcia³em powiedzieæ, ¿e ta rozmowa zaczyna mnie nu¿yæ. A kiedy siê niecierpliwiê mam brzydki zwyczaj wydobywaæ miecz...
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_06"); //Nie musisz zni¿aæ siê do tak prostackich uwag!
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_07"); //Wiêc?
	AI_Output (self, other, "DIA_Leren_Rodney_Mag_11_08"); //Dobra, uznajmy, ¿e Rodney pomyœlnie zakoñczy³ inicjacjê. Powiedz mu, ¿e mo¿e przyjœæ po szatê i runê.
	AI_Output (other, self, "DIA_Leren_Rodney_Mag_15_09"); //Tylko to chcia³em us³yszeæ.
	
   B_LogEntry(CH3_RBL_RodneyHelp, "Leren ³askawie uzna³ inicjacjê Rodneya za pomyœlnie zakoñczon¹.");
	B_StopProcessInfos(self);
};

// ---------------------------help----------------------------------------

FUNC VOID DIA_Leren_Rodney_Help()
{
	B_GiveXP(250);	
	rodney_mag = TRUE;
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_01"); //Sporo wam pomog³em.
	AI_Output (self, other, "DIA_Leren_Rodney_Help_11_02"); //Wiem o tym.

	if (Npc_KnowsInfo (hero, DIA_Leren_Mag1)) 
	{
		AI_Output (other, self, "DIA_Leren_Rodney_Help_15_03"); //Zdoby³em dla Ciebie zorzê.
	};

	if (Npc_KnowsInfo (hero, DIA_Leren_LastThreeFinish1)) 
	{
		AI_Output (other, self, "DIA_Leren_Rodney_Help_15_04"); //Pomog³em Wam z Tritetr¹!
	};
   
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_05"); //Czy moje zas³ugi nie wystarcz¹ na to, abyœcie zaufali Rodneyowi? Rêczê za niego!
	AI_Output (self, other, "DIA_Leren_Rodney_Help_11_06"); //Dobra ju¿, dobra. Uznajmy, ¿e Rodney pomyœlnie zakoñczy³ inicjacjê. Powiedz mu, ¿e mo¿e przyjœæ po szatê i runê.
	AI_Output (other, self, "DIA_Leren_Rodney_Help_15_07"); //Tylko to chcia³em us³yszeæ.

	B_LogEntry(CH3_RBL_RodneyHelp, "Leren ³askawie uzna³ inicjacjê Rodneya za pomyœlnie zakoñczon¹.");
	B_StopProcessInfos(self);
};

// ---------------------------should----------------------------------------

FUNC VOID DIA_Leren_Rodney_Should()
{
	AI_Output (other, self, "DIA_Leren_Rodney_Should_15_01"); //Pomaga³em przyjacielowi.
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_02"); //To zacne pobudki, ale co mnie to obchodzi?
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_03"); //Je¿eli Rodney chce zostaæ jednym z nas, musi wykazaæ siê nie tylko sprytem, ale tak¿e odwag¹ i poœwiêceniem.
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_04"); //Przecie¿ nie bêdziesz mu ze wszystkim pomaga³! A z sikaniem sam sobie radzi?
	AI_Output (self, other, "DIA_Leren_Rodney_Should_11_05"); //Nie odpowiadaj! To by³o pytanie retoryczne...

	Info_ClearChoices (DIA_Leren_Rodney);
	Info_AddChoice (DIA_Leren_Rodney, "A dlaczego nie?", DIA_Leren_Rodney_Want);
	
	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog³em.", DIA_Leren_Rodney_Help);
	};
};

// ---------------------------want----------------------------------------

FUNC VOID DIA_Leren_Rodney_Want()
{
	AI_Output (other, self, "DIA_Leren_Rodney_Want_15_01"); //A dlaczego nie?
	AI_Output (self, other, "DIA_Leren_Rodney_Want_11_02"); //Nie rób z siebie idioty. 
	AI_Output (self, other, "DIA_Leren_Rodney_Want_11_03"); //Chocia¿by dlatego, ¿e musi dowieœæ swojej przydatnoœci i zaradnoœci.
	
   Info_ClearChoices (DIA_Leren_Rodney);

	if (DICK_CHOOSE == 1)
	{
		Info_AddChoice (DIA_Leren_Rodney, "Bo jestem jednym z was!", DIA_Leren_Rodney_Mag);
	}
	else
	{
		Info_AddChoice (DIA_Leren_Rodney, "Sporo wam pomog³em.", DIA_Leren_Rodney_Help);
	};
   
	Info_AddChoice (DIA_Leren_Rodney, "Pomaga³em przyjacielowi.", DIA_Leren_Rodney_Should);
};

// **************************************************

var int leren_read;

INSTANCE DIA_Leren_RuneSwd (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 20;
	condition		= DIA_Leren_RuneSwd_Condition;
	information		= DIA_Leren_RuneSwd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Rodney))&&(rodney_mag == TRUE)&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwd_Info()
{
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_01"); //Nie tak szybko! A co z artefaktem?
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_02"); //Mam go przy sobie.
	
   AI_UnequipWeapons(other);
	EquipItem(other,ItMw_2H_RuneSWD_01);
   AI_DrawWeapon(other);
	AI_PlayAni(other, "T_1HSINSPECT");
	AI_RemoveWeapon(other);
	
   AI_Output (self, other, "DIA_Leren_RuneSwd_11_03"); //Miecz ¿ywio³ów! Zw¹ go te¿ mieczem runicznym albo mieczem Boskiej Trójcy.
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_04"); //Sporo o nim wiesz.
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_05"); //Myœla³em, ¿e to tylko legenda...
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_06"); //Ten miecz jest potê¿niejszy ni¿ Uriziel.
	AI_Output (other, self, "DIA_Leren_RuneSwd_15_07"); //W tej chwili nie wygl¹da za dobrze.
	AI_Output (self, other, "DIA_Leren_RuneSwd_11_08"); //Muszê przejrzeæ ksiêgi... Dbaj o ostrze, a ja dowiem siê, jak przywróciæ mu dawn¹ œwietnoœæ.
	
   leren_read = B_SetDayTolerance()+2;
	Log_CreateTopic(CH4_GRD_RuneSwd, LOG_MISSION);
	Log_SetTopicStatus(CH4_GRD_RuneSwd, LOG_RUNNING);
	B_LogEntry(CH4_GRD_RuneSwd, "Miecz, który zdoby³em to legendarne ostrze, zwane mieczem runicznym. Leren obieca³, ¿e dowie siê czegoœ wiêcej. Muszê z nim porozmawiaæ za jakiœ czas.");
	B_StopProcessInfos(self);
   
   if (NPC_HasItems(other,ItMw_2H_RuneSWD_01)>1)
   {
      Npc_RemoveInvItems(other, ItMw_2H_RuneSWD_01, 1);
   };
};

INSTANCE DIA_Leren_RuneSwd1 (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 21;
	condition		= DIA_Leren_RuneSwd1_Condition;
	information		= DIA_Leren_RuneSwd1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwd1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RuneSwd))&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)&&(leren_read <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwd1_Info()
{
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_01"); //Znalaz³em sposób, ale to nie bêdzie ³atwe.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_02"); //Tego siê domyœlam. 
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_03"); //Miecz runiczny zosta³ stworzony na o³tarzu ka¿dego z trzech bogów.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_04"); //Dodatkowo sk³ada siê z trzech nierozerwalnych elementów konsekrowanych w ró¿nych œwi¹tyniach.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_05"); //Ostrze poœwiêcono Innosowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_06"); //Jelec, Beliarowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_07"); //A osadzony w rêkojeœci klejnot, Adanosowi.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_08"); //W zasadzie ten miecz to jedyny artefakt skupiaj¹cy w sobie moce wszystkich bogów!
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_09"); //To œwietnie, ale mnie g³ównie interesuje, jak mo¿na przywróciæ ostrzu dawn¹ œwietnoœæ.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_10"); //Musisz znaleŸæ wyznawcê ka¿dego z bogów. Je¿eli o Innosa chodzi, to ja siê tego podejmê. Co do Adanosa to poszukaj magów wody - jak ich znam, to gdzieœ tu siê jeszcze chowaj¹.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_11"); //Gorzej bêdzie z Beliarem. Hmm, móg³byœ spróbowaæ porozmawiaæ z Xardasem, ma wie¿ê gdzieœ na terenach orków.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_12"); //Ale on nie lubi nieproszonych goœci.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_13"); //I co dalej?
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_14"); //Trzej kap³ani wyznaj¹cy ró¿nych bogów, musz¹ przeprowadziæ rytua³ odrodzenia ostrza.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_15"); //Rozumiem.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_16"); //To jeszcze nie wszystko. Do przeprowadzenia rytua³u potrzebny jest specjalny almanach. I to jest w³aœnie najwiêkszy problem.
	AI_Output (self, other, "DIA_Leren_RuneSwd1_11_17"); //Musisz poszukaæ tego inkunabu³u. Jest du¿a szansa, ¿e znajduje siê gdzieœ w Kolonii. W koñcu ostrze wykuto na wyspie Khorinis.
	AI_Output (other, self, "DIA_Leren_RuneSwd1_15_18"); //Dobrze, poszukam tej ksiêgi.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Istnieje sposób na przywrócenie ostrzu dawnej œwiêtoœci. Nale¿y odprawiæ rytua³ za poœrednictwem wyznawców Adanosa, Innosa i Beliara. Ale najpierw muszê odnaleŸæ 'Almanach odrodzenia', dziêki któremu magowie poznaj¹ procedurê rytua³u.");
   
   Wld_InsertItem(ItArRuneTeleport3, "DT_E1_06");
};

INSTANCE DIA_Leren_RuneSwdBack (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 22;
	condition		= DIA_Leren_RuneSwdBack_Condition;
	information		= DIA_Leren_RuneSwdBack_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RuneSwdBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Bern_First))&&(Npc_KnowsInfo (hero, DIA_Leren_RuneSwd1))&&(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RuneSwdBack_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
   Black_mag_arrived = true;
	
   AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_01"); //Masz miecz?!
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_02"); //Tak, odzyska³em ostrze. Jeden samobójca ukrad³ miecz i przeprowadzi³ z nim jednoosobow¹ inwazjê na tereny orków.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_03"); //Innos nad Tob¹ czuwa³! Czy ostrze siê zmieni³o?
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_04"); //Jest parz¹co zimne i bardziej popêkane. Wygl¹da jakby siê... postarza³o o kilka wieków.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_05"); //To wp³yw jednego z bogów. Wydaje mi siê, ¿e równowaga si³ zosta³a zak³ócona.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_06"); //Co to oznacza?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_07"); //W Kolonii pojawi³ siê czarny mag, albo jakiœ potê¿ny nekromanta.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_08"); //Tylko mi nie mów, ¿e z powodu miecza dobrowolnie przeszed³ przez barierê?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_09"); //Obawiam siê, ¿e w³aœnie tak by³o. Ten miecz mo¿e byæ zarówno zwiastunem nieszczêœcia jak i odkupicielem win.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_10"); //Jestem te¿ pewien, ¿e ten nekromanta mo¿e wiedzieæ coœ wiêcej o almanachu.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_11"); //Musisz go odnaleŸæ i dowiedzieæ siê wszystkiego, co tylko zdo³asz.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_12"); //Gdzie mam go szukaæ?
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_13"); //Tego niestety nie wiem. Ten sukinsyn œwietnie siê maskuje. Ale b¹dŸ ostro¿ny, miejsce, które wybra³, mo¿e byæ naje¿one straszliwymi niebezpieczeñstwami.
	AI_Output (self, other, "DIA_Leren_RuneSwdBack_11_14"); //I nie lekcewa¿ tego maga. Na wyspie Khorinis ukryto gdzieœ jedn¹ z czterech œwi¹tyñ poœwiêconych Beliarowi. Bliskoœæ takiego miejsca mo¿e zwielokrotniæ moc nekromanty.
	AI_Output (other, self, "DIA_Leren_RuneSwdBack_15_15"); //Bez obaw, poradzê sobie. Bywaj.
	
   B_LogEntry(CH4_GRD_RuneSwd, "W Kolonii pojawi³ siê kolejny nekromanta. Leren twierdzi, ¿e to w³aœnie miecz go tu œci¹gn¹³. Muszê odnaleŸæ tego maga i dowiedzieæ siê, czy nie wie, gdzie jest 'Almanach odrodzenia'.");
	
	Log_CreateTopic(CH4_Nec_BM, LOG_MISSION);
	Log_SetTopicStatus(CH4_Nec_BM, LOG_RUNNING);
	B_LogEntry(CH4_Nec_BM, "W Kolonii pojawi³ siê jakiœ nekromanta, muszê go odnaleŸæ. Kto wie, je¿eli przywiód³ go tu miecz runiczny, to mo¿e bêdzie wiedzia³, gdzie znaleŸæ almanach?");

	B_StopProcessInfos(self);

	/***********************
	Ork dobrze by³oby, ¿eby dopiero teraz nekro pojawi³ siê w grze, mo¿e niech siê otworzy jakieœ przejœcie: g³az, krata, które wczeœniej by³y zyamkniête. Mo¿e dodaæ przed tym wejœciem kilka martwych cia³ ludzi - wczeœniej ich nie by³o.
	Gracz by siê w ten sposób skapn¹³ gdzie jest nekro
	***********************/
};

INSTANCE DIA_Leren_Almanach (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 23;
	condition		= DIA_Leren_Almanach_Condition;
	information		= DIA_Leren_Almanach_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em almanach!"; 
};

FUNC INT DIA_Leren_Almanach_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(NPC_HasItems(other,almanach_res)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Almanach_Info()
{
	AI_Output (other, self, "DIA_Leren_Almanach_15_01"); //Znalaz³em almanach!
	AI_Output (self, other, "DIA_Leren_Almanach_11_02"); //Nie s¹dzi³em, ¿e to w ogóle mo¿liwe. 
	AI_Output (other, self, "DIA_Leren_Almanach_15_03"); //Mia³eœ racjê. Inkunabu³ spoczywa³ w bibliotece nekromanty. Trochê siê namêczy³em, ¿eby go zdobyæ.
	AI_Output (self, other, "DIA_Leren_Almanach_11_04"); //Czyta³eœ ksiêgê?
	
   if (alman_read == TRUE)
	{
		AI_Output (other, self, "DIA_Leren_Almanach_15_05"); //Tak, ale nic nie zrozumia³em z tego be³kotu. To jakiœ archaiczny jêzyk.
	}
	else
	{
		AI_Output (other, self, "DIA_Leren_Almanach_15_06"); //Nie, wolê nie psuæ sobie oczu s³owem pisanym.
	};
	
   AI_Output (self, other, "DIA_Leren_Almanach_11_07"); //To ciekawe... Daj mi inkunabu³, niech no na niego rzucê okiem.
	B_GiveInvItems (other, self, almanach_res, 1);
	
	/******************************
	Ork da siê to zrobiæ z ksiêg¹?
	*******************************/

	B_UseFakeScroll(self);
	AI_Output (self, other, "DIA_Leren_Almanach_11_08"); //Ten jêzyk to staro¿ytne glify, lub raczej piktogramy. Na pewno nie s¹ dzie³em cz³owieka, choæ noœnik jakim jest ksiêga, wygl¹da na ludzkie rzemios³o. 
	AI_Output (self, other, "DIA_Leren_Almanach_11_09"); //Dziwne...
	AI_Output (other, self, "DIA_Leren_Almanach_15_10"); //Dasz radê odczytaæ almanach?
	AI_Output (self, other, "DIA_Leren_Almanach_11_11"); //Spróbujê, ale to nie bêdzie ³atwe. Wróæ za kilka dni, wtedy dam Ci ostateczn¹ odpowiedŸ.
	AI_Output (other, self, "DIA_Leren_Almanach_15_12"); //Powodzenia Leren, to dla mnie bardzo wa¿ne.
	AI_Output (self, other, "DIA_Leren_Almanach_11_13"); //Nie tylko dla Ciebie, przyjacielu.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Odda³em almanach Lerenowi. Mag nie móg³ go odczytaæ, wolumin zapisano jakimœ staro¿ytnym pismem. Mam wróciæ za kilka dni, wtedy dowiem siê, czy mag w ogóle da radê poznaæ procedurê rytua³u.");
	leren_read = B_SetDayTolerance()+3;//3 dni w koñcu to nie jest takie proste
};

INSTANCE DIA_Leren_AlmanachRead (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 24;
	condition		= DIA_Leren_AlmanachRead_Condition;
	information		= DIA_Leren_AlmanachRead_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_AlmanachRead_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Almanach))&&(leren_read <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AlmanachRead_Info()
{
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_01"); //Ta ksiêga jest niesamowita!
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_02"); //To znaczy?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_03"); //Sam almanach odrodzenia i zawarta w nim formu³a to niezwykle z³o¿ony czar.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_04"); //Czar?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_05"); //Tak, ju¿ to t³umaczê.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_06"); //Almanach dostraja siê do tego, kto go przeczyta. I w zale¿noœci od rasy tego, kto go czyta eksponuje inn¹ formu³ê na przywrócenie ostrzu dawnej potêgi.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_07"); //W naszym przypadku procedura rytua³u zosta³a zapisana w jêzyku... jaszczuroludzi!
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_08"); //Dlaczego?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_09"); //Wydaje mi siê, ¿e ksiêga zosta³a ob³o¿ona czarem, który celowo mo¿liwie mocno utrudnia rozwik³anie tajemnicy przywrócenia ostrzu dawnej œwietnoœci. 
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_10"); //W sumie to doœæ logiczna konkluzja, lepiej, ¿eby na³adowane ostrze nie trafi³o w rêce jakiegoœ szaleñca!
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_11"); //Jaszczuroludzi nie widziano tu ju¿ od wieków. W dodatku u¿yte tu piktogramy to jêzyk archaiczny, a tym pos³ugiwali siê tylko pradawni przodkowie tej rasy i do tego tylko uczeni w piœmie, których by³o naprawdê niewielu.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_12"); //Czyli wszystko stracone?
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_13"); //Niezupe³nie. Ten kto rzuci³ czar, nie doceni³ moich zdolnoœci lingwistycznych i zwyczajnego przypadku.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_14"); //Nowicjat up³yn¹³ mi na wyspie Risen. Tam nadal mieszkaj¹ jaszczuroludzie. Z tym, ¿e rasa zosta³a zasymilowana przez zamieszkuj¹cych wyspê górników i osadników.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_15"); //Ludzie i jaszczurki ¿yj¹ tam w idealnej harmonii! Tam te¿ pozna³em jêzyk wê¿owatych, a do tego dialekt uczonych, który pod wieloma wzglêdami jest bardzo podobny do tego z almanachu.
	AI_Output (other, self, "DIA_Leren_AlmanachRead_15_16"); //Uff, czyli mam sporo szczêœcia.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_17"); //W¹tpiê, przyjacielu. Moim zdaniem nic nie dzieje siê bez powodu. Nie wierzê w przypadek. Los po prostu chcia³, abym to w³aœnie ja pomóg³ Ci odczytaæ almanach.
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_18"); //Zreszt¹ niewa¿ne. Wszystko co zdo³a³em odczytaæ, spisa³em na tym pergaminie. 
	AI_Output (self, other, "DIA_Leren_AlmanachRead_11_19"); //Rzuæ okiem na kartkê i wtedy znowu porozmawiamy.
	
   CreateInvItems (self,alm_log,1);
	B_GiveInvItems (self, other, alm_log, 1);
	Log_CreateTopic(CH4_RBL_Rirual, LOG_MISSION);
	Log_SetTopicStatus(CH4_RBL_Rirual, LOG_RUNNING);
	B_LogEntry(CH4_RBL_Rirual, "Leren odczyta³ z almanachu, ¿e aby przywróciæ mieczowi runicznemu dawn¹ moc, nale¿y przeprowadziæ bardzo skomplikowany rytua³.");

	Log_SetTopicStatus(CH4_RBL_Almanach, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Almanach, "Leren zdo³a³ odczytaæ almanach. Teraz muszê zdobyæ wszystkie przedmioty niezbêdne do przeprowadzenia rytua³u.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Leren_AlmanachReadAfter (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 25;
	condition		= DIA_Leren_AlmanachReadAfter_Condition;
	information		= DIA_Leren_AlmanachReadAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_AlmanachReadAfter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_AlmanachRead))&&(alm_log_read == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_AlmanachReadAfter_Info()
{
	AI_Output (self, other, "DIA_Leren_AlmanachReadAfter_11_01"); //Wiem, co Ciê niepokoi. Sam siê zastanawia³em co to za kryszta³y. Rozmawia³em o tym z Miltenem i chyba pozna³em odpowiedŸ.
	AI_Output (other, self, "DIA_Leren_AlmanachReadAfter_15_02"); //Ca³y zamieniam siê w s³uch.
	AI_Output (self, other, "DIA_Leren_AlmanachReadAfter_11_03"); //Najlepiej jak sam zapytasz Miltena. Bêdê tu na Ciebie czeka³.
	
   B_LogEntry(CH4_RBL_Rirual, "Leren twierdzi, ¿e Milten wie, co to za gwiezdne kryszta³y s¹ potrzebne do zniszczenia serca Bestii. Muszê natychmiast z nim porozmawiaæ.");
};

INSTANCE DIA_Leren_Beast (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 26;
	condition		= DIA_Leren_Beast_Condition;
	information		= DIA_Leren_Beast_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia³em z Miltenem."; 
};

FUNC INT DIA_Leren_Beast_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Cristals))&&(Npc_KnowsInfo (hero, DIA_Leren_AlmanachReadAfter))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Beast_Info()
{
	AI_Output (other, self, "DIA_Leren_Beast_15_01"); //Rozmawia³em z Miltenem.
	AI_Output (self, other, "DIA_Leren_Beast_11_02"); //Czyli wiesz ju¿ czego i gdzie szukaæ. Sam musisz odnaleŸæ kamienie ogniskuj¹ce, w tym nikt Ci nie pomo¿e.
	AI_Output (other, self, "DIA_Leren_Beast_15_03"); //Ale gdzie szukaæ Bestii?
	AI_Output (self, other, "DIA_Leren_Beast_11_04"); //Niestety na bagnach.
	AI_Output (other, self, "DIA_Leren_Beast_15_05"); //Dlaczego niestety?
	AI_Output (self, other, "DIA_Leren_Beast_11_06"); //Bo z³o, które tam zamieszka³o, a¿ przyt³acza sw¹ moc¹. Nie zazdroszczê Ci przyjacielu...
	AI_Output (self, other, "DIA_Leren_Beast_11_07"); //Czeka Ciê walka jakiej jeszcze ¿aden œmiertelnik nie stoczy³. W ka¿dym razie ja nie znam nikogo tak g³upiego, kto dobrowolnie rzuci³by wyzwanie tak przera¿aj¹cej istocie.
	AI_Output (other, self, "DIA_Leren_Beast_15_08"); //Dziêki za s³owa otuchy i wiarê w moje mo¿liwoœci. Czas nagli, ruszam na bagna.
	AI_Output (self, other, "DIA_Leren_Beast_11_09"); //Nie tak szybko! ¯eby pokonaæ z³o, z którym zamierzasz walczyæ, najpierw musisz je poznaæ i zrozumieæ.
	AI_Output (self, other, "DIA_Leren_Beast_11_10"); //Niedawno z bagien wróci³ Lester. Porozmawiaj z nim, on wie ca³kiem sporo o Bestii.
	AI_Output (self, other, "DIA_Leren_Beast_11_11"); //Dam Ci dobr¹ radê - mniej poœpiechu, wiêcej taktyki. Mo¿e wtedy d³u¿ej po¿yjesz.
	AI_Output (other, self, "DIA_Leren_Beast_15_12"); //Nikt nie ¿yje wiecznie, magu.
	
   Log_CreateTopic(CH4_RBL_Beast, LOG_MISSION);
	Log_SetTopicStatus(CH4_RBL_Beast, LOG_RUNNING);
	B_LogEntry(CH4_RBL_Beast, "Bestia, której serce mam zniszczyæ, zamieszkuje bagna. Wiêcej o tej istocie dowiem siê od Lestera, który niedawno przyby³ do obozu.");
	B_LogEntry(CH4_RBL_Rirual, "Bestiê znajdê na bagnach, ale najpierw powinienem porozmawiaæ z Lesterem.");
   
   Wld_InsertNpc (PC_Psionic,"PATCHH");
	Wld_InsertNpc (Gur_1203_BaalTondral,"GO");
};

INSTANCE DIA_Leren_BeastDead (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 27;
	condition		= DIA_Leren_BeastDead_Condition;
	information		= DIA_Leren_BeastDead_Info;
	permanent		= 0;
	important		= 0;
	description		= "Oto serce Bestii!"; 
};

FUNC INT DIA_Leren_BeastDead_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lester_FightEnd))&&(NPC_HasItems(other,beast_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_BeastDead_Info()
{
	AI_Output (other, self, "DIA_Leren_BeastDead_15_01"); //Oto serce Bestii!
	AI_Output (self, other, "DIA_Leren_BeastDead_11_02"); //Nie s¹dzi³em, ¿e jakikolwiek œmiertelnik zdo³a tego dokonaæ...
	B_GiveInvItems (other, self, beast_heart, 1);
	Npc_RemoveInvItems(self,beast_heart,1);
	B_LogEntry(CH4_RBL_Rirual, "Odda³em Lerenowi serce Bestii.");
};

INSTANCE DIA_Leren_StonesGive (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 28;
	condition		= DIA_Leren_StonesGive_Condition;
	information		= DIA_Leren_StonesGive_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdoby³em kamienie ogniskuj¹ce."; 
};

FUNC INT DIA_Leren_StonesGive_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Stones))&&(NPC_HasItems(other,Focus_2)>=1)&&(NPC_HasItems(other,Focus_3)>=1)&&(NPC_HasItems(other,Focus_4)>=1)&&(NPC_HasItems(other,Focus_5)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_StonesGive_Info()
{
	AI_Output (other, self, "DIA_Leren_StonesGive_15_01"); //Zdoby³em kamienie ogniskuj¹ce.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_02"); //Wiedzia³em, ¿e sobie poradzisz. Daj mi je.
   
	B_GiveInvItems (other, self, Focus_2, 1);
	B_GiveInvItems (other, self, Focus_3, 1);
	B_GiveInvItems (other, self, Focus_4, 1);
	B_GiveInvItems (other, self, Focus_5, 1);
	Npc_RemoveInvItems(self,Focus_2,1);
	Npc_RemoveInvItems(self,Focus_3,1);
	Npc_RemoveInvItems(self,Focus_4,1);
	Npc_RemoveInvItems(self,Focus_5,1);
   
	AI_Output (other, self, "DIA_Leren_StonesGive_15_03"); //Milten zsynchronizowa³ kamienie, teraz mamy wiêksz¹ szansê na powodzenie rytua³u.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_04"); //Milten dzia³a mi na nerwy, ale czasami okazuje siê bardzo przydatny.
	AI_Output (self, other, "DIA_Leren_StonesGive_11_05"); //Jest jak wrzód na ty³ku, do którego cz³owiek najpierw siê przyzwyczaja, a póŸniej nie potrafi bez niego ¿yæ.
	B_LogEntry(CH4_RBL_Rirual, "Odda³em Lerenowi kamienie ogniskuj¹ce.");
};

INSTANCE DIA_Leren_Ritual (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 29;
	condition		= DIA_Leren_Ritual_Condition;
	information		= DIA_Leren_Ritual_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Ritual_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_StonesGive))&&(Npc_KnowsInfo (hero, DIA_Leren_BeastDead))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Ritual_Info()
{
	AI_Output (self, other, "DIA_Leren_Ritual_11_01"); //Mamy ju¿ wszystko co potrzebne do przeprowadzenia rytua³u.
	AI_Output (other, self, "DIA_Leren_Ritual_15_02"); //To œwietnie. Co mam robiæ?
	AI_Output (self, other, "DIA_Leren_Ritual_11_03"); //Powiadom tych, którzy, prócz mnie, musz¹ uczestniczyæ w rytuale, aby przybyli do kamiennego krêgu na bagnach - tam odprawimy inkantacjê.
	AI_Output (self, other, "DIA_Leren_Ritual_11_04"); //Ja wyruszê ju¿ teraz. Pospiesz siê, bo nie chcê tkwiæ tam d³u¿ej ni¿ to konieczne.
	
   AI_PlayAni(other,"T_YES");
	B_LogEntry(CH4_RBL_Rirual, "Mo¿na ju¿ rozpocz¹æ rytua³ przywrócenie mocy mieczowi runicznemu. Leren bêdzie czeka³ na pozosta³ych magów przy kamiennym krêgu na bagnach. Muszê natychmiast poinformowaæ Xardasa i maga wody.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Leren_RitualBegin (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				=30;
	condition		= DIA_Leren_RitualBegin_Condition;
	information		= DIA_Leren_RitualBegin_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RitualBegin_Condition()
{
	if (NPC_HasItems(hero,ItMw_2H_RuneSWD_01)>=1) && (Npc_KnowsInfo (hero, DIA_Leren_Ritual))
   &&((Npc_KnowsInfo (hero, Info_Xardas_Ritual))||(Npc_KnowsInfo (hero, Info_Nekroman_RitualBegin)))
   &&((satur_ritual) || (Npc_KnowsInfo (hero, Info_Myxir_Ritual)))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RitualBegin_Info()
{
	var C_NPC xar; xar = Hlp_GetNpc(Kdf_404_Xardas);
	var C_NPC sat; sat = Hlp_GetNpc(KDW_600_Saturas);
	var C_NPC myx; myx = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC nek; nek = Hlp_GetNpc(DMB_1700_Necro);

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   AI_UnequipWeapons(other);
   Give_and_remove(ItMw_2H_RuneSWD_01, 1);
   
	AI_Output (self, other, "DIA_Leren_RitualBegin_11_01"); //Wszyscy ju¿ s¹. Czas rozpocz¹æ rytua³. Stañ w bezpiecznej odleg³oœci i nie przeszkadzaj.
	AI_Output (other, self, "DIA_Leren_RitualBegin_15_02"); //Oczywiœcie, w koñcu to Ty jesteœ 'wielkim' magiem.

	B_LogEntry(CH4_RBL_Rirual, "Rytua³ siê rozpocz¹³.");
	B_StopProcessInfos(self);

   if (satur_ritual)
   {
      Npc_ExchangeRoutine	(sat, "RITUAL1");
   }
   else
   {
      Npc_ExchangeRoutine	(myx, "RITUAL1");
   };
	
	if(Npc_KnowsInfo (hero, Info_Xardas_Ritual))
	{
		Npc_ExchangeRoutine	(xar, "RITUAL1");
	};
	if(Npc_KnowsInfo (hero, Info_Nekroman_RitualBegin))
	{
		Npc_ExchangeRoutine	(nek, "RITUAL1");
	};

	Npc_ExchangeRoutine	(self, "RITUAL1");

	AI_PlayAni(self,"T_PRACTICEMAGIC4");

	/***********************
Ork zrób to jak chcesz, ale nie bêdzie fajne. Moja propozycja.
1. Magowie podchodzê do okreœlonych WP wokó³ o³atarza w krêgu
2. Miecz umieszczony jest na o³tarzu a kamienia na oko³o.
3. Rozpoczyna siê rytua³.
4. PO zakoñczeniu na³¹dowany miecz niech zostanie na o³tarzu, Dick sam go sobie zabierze.
5. Na koñcu ustaw zmienn¹ ritual_end na true a magowie odchodz¹ do swych startowych rutyn.

***********************/
};

INSTANCE DIA_Leren_RitualEnd (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 30;
	condition		= DIA_Leren_RitualEnd_Condition;
	information		= DIA_Leren_RitualEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_RitualEnd_Condition()
{
   if ((Npc_KnowsInfo (hero, Info_Nekroman_RitualEnd))||(Npc_KnowsInfo (hero, Info_Xardas_RitualEnd)))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_RitualEnd_Info()
{
   if (satur_ritual)
   {
      var C_NPC sat; sat = Hlp_GetNpc(KDW_600_Saturas);
      Npc_ExchangeRoutine	(sat, "START");
   }
   else
   {
      var C_NPC myx; myx = Hlp_GetNpc(KDW_601_Myxir);
      Npc_ExchangeRoutine	(myx, "START");
   };
   
   var int random; random = Hlp_Random(6);
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_01"); //Uda³o siê! To niesamowite, taka moc...
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_02"); //Co z mieczem?
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_03"); //Spoczywa na o³tarzu, nie œmia³em go tkn¹æ.
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_04"); //Jestem twoim d³u¿nikiem, Leren.
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_05"); //Nie ma o czym mówiæ. Skop kilka stra¿niczych dup i bêdziemy kwita.
	AI_Output (self, other, "DIA_Leren_RitualEnd_11_06"); //Aha. Nie wiem, czy to Ciê zainteresuje, ale w Nowym Obozie coœ siê dzieje. Podobno Lee chce poprowadziæ swoich ludzi do walki ze stra¿nikami.
	AI_Output (other, self, "DIA_Leren_RitualEnd_15_07"); //Na to w³aœnie czeka³em! Dziêki Leren.

   if (random == 0)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_01, "PSI_TELEPORT");
   }
   else if (random == 1)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_DARK, "PSI_TELEPORT");
   }
   else if (random == 2)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_FIRE, "PSI_TELEPORT");
   }
   else if (random == 3)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_LIGHT, "PSI_TELEPORT");
   }
   else if (random == 4)
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_WATER, "PSI_TELEPORT");
   }
   else
   {
      Wld_InsertItem(ItMw_2H_RuneSWD_PSI, "PSI_TELEPORT");
   };

	Log_SetTopicStatus(CH4_RBL_Rirual, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Rirual, "Rytua³ dobieg³ koñca. Miecz czeka na mnie na o³tarzu. Ju¿ nie mogê siê doczekaæ, kiedy poznam moc orê¿a.");
	B_LogEntry(CH4_RBL_NCRebel, "Podobno Lee w koñcu podj¹³ decyzjê. Czas zobaczyæ jak wygl¹da sytuacja w Nowym Obozie.");
	B_Kapitelwechsel(5);	 	
   
   Npc_ExchangeRoutine(self, "START");
	/*************************************
Ork odpal tu funkcjê odpowiedzialn¹ za rebeliê Hrabiego i bunt w Nowym obozie:
1. Orle Gniazdo zostaje odciête, jest oblegane przez stra¿ników wiernych Gomezowi i Fletcherowi.
2. Lares i jego ludzie wyr¿nêli stra¿ników na polach ry¿owych. Tam te¿ ma siê znaleŸæ Lee i jego ludzie od magów wody a tak¿e Cronos je¿eli nadal ¿yje.
3. W Kotle Wilk ze swoimi ludŸmi wycofa³ siê tam gdzie w podstawce mieszkali magowie. Wilk i jego ludzie odparli kilka ataków stra¿ników.
4. W kopalni albo raczej przed jej wejœciem stra¿nicy szykuj¹ siê do ostatecznego ude¿enia.

Sporo tego, ale ma byæ widaæ zmiany, chodzi g³ównie o zmiany rutyn, trochê trupów, etc. Musi byæ jak najbardziej realistycznie. Jak dasz radê dodaæ trochê modeli, np. barykada w przejœciu do magów wody tam gdzie jest Wilk to by³oby ok.

***********************************/
};

INSTANCE DIA_Leren_SwdUse (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 30;
	condition		= DIA_Leren_SwdUse_Condition;
	information		= DIA_Leren_SwdUse_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak u¿ywa siê mocy miecza?"; 
};

FUNC INT DIA_Leren_SwdUse_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RitualEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_SwdUse_Info()
{
	AI_Output (other, self, "DIA_Leren_SwdUse_15_01"); //Jak siê u¿ywa mocy miecza?
	AI_Output (self, other, "DIA_Leren_SwdUse_11_02"); //To proste. Osadzasz w jelcu runê, z której mocy ma korzystaæ ostrze.
	AI_Output (self, other, "DIA_Leren_SwdUse_11_03"); //Wypróbuj ró¿ne runy, jestem pewien, ¿e ka¿da da inny efekt w po³¹czeniu z tym potê¿nym artefaktem.
	AI_Output (other, self, "DIA_Leren_SwdUse_15_04"); //Dziêki, Leren.
	
   Log_SetTopicStatus(CH4_GRD_RuneSwd, LOG_SUCCESS);
	B_LogEntry(CH4_GRD_RuneSwd, "Miecz runiczny odzyska³ sw¹ moc! Mogê na³adowaæ ostrze dowoln¹ run¹, osadzaj¹c runê w jelcu miecza. Ju¿ nie mogê siê doczekaæ eksperymentów z ostrzem!");
};

INSTANCE DIA_Leren_Appear (C_INFO)
{
	npc				= mag_1604_Leren;
	nr				= 31;
	condition		= DIA_Leren_Appear_Condition;
	information		= DIA_Leren_Appear_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leren_Appear_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_RitualEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Leren_Appear_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Leren_Appear_11_01"); //Aha. Zapomnia³em jeszcze o jednym drobnym szczególe. Mia³em Ci o tym nie mówiæ, bo pewnie to tylko Ÿle przet³umaczony urywek almanachu wprowadzi³ mnie w b³¹d...
	AI_Output (other, self, "DIA_Leren_Appear_15_02"); //Coœ mi siê wydaje, ¿e zaraz gorzko po¿a³ujê tej niewiedzy.
	AI_Output (self, other, "DIA_Leren_Appear_11_03"); //Raczej nie. Jak odszed³eœ zabawiæ siê z Besti¹, doczyta³em w almanachu, ¿e po zniszczeniu serca dusze tych, którzy zostali zniewoleni przez Bestiê powróc¹.
	AI_Output (self, other, "DIA_Leren_Appear_11_04"); //Oczywiœcie powróc¹ nie tylko pod eteraln¹ postaci¹. Ale jak sam widzisz, nic siê nie dzieje, wiêc...
	AI_Output (self, other, "DIA_Leren_Appear_11_05"); //O cholera, coœ wyczuwam...
	AI_Output (self, other, "DIA_Leren_Appear_11_06"); //Nie powinno mnie tu byæ. Nie daj siê zabiæ!
	/**************************
Ork tak chcia³bym, ¿eby to wygl¹da³o.
0. Leren i reszta magów ma stamt¹d uciec jak najszybciej, mo¿e mdla na sprint im zmieñ, tylko dick ma zostaæ.
1. Najazd kamerk¹ gdzieœ w pobli¿e krêgu.
2. Rozb³ysk w miejscu gdzie pojawi siê 1 jaszczur. W tym samym momencie taka fala odrzutu, albo trzêsienie ziemi, ¿eby Dick upad³ - niech go fajnie odrzuci.
3. Po tej pierwszej jaszczurce niech siê pojawi¹ kolejne w rozb³yskach.
4. Ta 1 jaszczura ma podejœæ do Dicka i zagaiæ rozmowê.

**************************/

//************Jaszczury

	Wld_InsertNpc(Liz_4092_Hesstad, "PATH_NEW_AROUND_PSI21");
	Wld_InsertNpc(Draco1, "PATH_NEW_AROUND_PSI20");
	Wld_InsertNpc(Draco2, "PATH_NEW_AROUND_PSI17");

	Npc_ExchangeRoutine(self, "START");
	Log_CreateTopic(CH5_NON_Lizard, LOG_MISSION);
	Log_SetTopicStatus(CH5_NON_Lizard, LOG_RUNNING);
	B_LogEntry(CH5_NON_Lizard, "Zniszczenie serca Bestii uwolni³o uwiêzione tam dusze jaszczuroludzi!");
	B_StopProcessInfos(self);
   
   Leren_teleport_after_ritual = true;
};
