// ************************ EXIT **************************

instance  Info_Merdarion_EXIT (C_INFO)
{
	npc			= KDW_602_Merdarion;
	nr			= 999;
	condition	= Info_Merdarion_EXIT_Condition;
	information	= Info_Merdarion_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Merdarion_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_Hi (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  1;	
	condition	=  DIA_Merdarion_Hi_Condition;
	information	=  DIA_Merdarion_Hi_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co porabiasz?";
};                       

FUNC int  DIA_Merdarion_Hi_Condition()
{
	return 1;
};

FUNC VOID  DIA_Merdarion_Hi_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Hi_15_01"); //Co porabiasz?
	AI_Output (self, other,"DIA_Merdarion_Hi_08_02"); //Wybacz, nie mogê teraz rozmawiaæ.
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_Problem (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  2;	
	condition	=  DIA_Merdarion_Problem_Condition;
	information	=  DIA_Merdarion_Problem_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam problem z ornamentami.";
};                       

FUNC int  DIA_Merdarion_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Wait))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Problem_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Problem_15_01"); //Mam problem z ornamentami.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_02"); //Jak my wszyscy, a dok³adniej z ich brakiem.
	AI_Output (other, self,"DIA_Merdarion_Problem_15_03"); //Ktoœ ci¹gle jest o krok przede mn¹.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_04"); //Kto taki?
	AI_Output (other, self,"DIA_Merdarion_Problem_15_05"); //Nazywa siê Hrabia. S³u¿y któremuœ z magnatów.
	AI_Output (self, other,"DIA_Merdarion_Problem_08_06"); //Ale jak magnaci dowiedzieli siê o ornamentach? To bez sensu...
	AI_Output (self, other,"DIA_Merdarion_Problem_08_07"); //Chocia¿...
	AI_Output (self, other,"DIA_Merdarion_Problem_08_08"); //Dowiedz siê, dla którego z magnatów pracuje Hrabia. 
	AI_Output (self, other,"DIA_Merdarion_Problem_08_09"); //To pomo¿e nam przedsiêwzi¹æ dalsze kroki.
	AI_Output (other, self,"DIA_Merdarion_Problem_15_10"); //Bêdê mia³ to na uwadze.

	B_LogEntry(CH3_NON_Seekers, "Merdarion poprosi³ mnie, ¿ebym dowiedzia³ siê, któremu z magnatów s³u¿y Hrabia.");
};

// *****************************************

instance DIA_Merdarion_Crow (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  3;	
	condition	=  DIA_Merdarion_Crow_Condition;
	information	=  DIA_Merdarion_Crow_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Wiem, czyje rozkazy wykonuje Hrabia.";
};                       

FUNC int  DIA_Merdarion_Crow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_FindThief1))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Crow_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Crow_15_01"); //Wiem, czyje rozkazy wykonuje Hrabia.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_02"); //To Kruk, prawda?
	AI_Output (other, self,"DIA_Merdarion_Crow_15_03"); //Sk¹d wiedzia³eœ?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_04"); //Tego siê obawia³em. 
	AI_Output (self, other,"DIA_Merdarion_Crow_08_05"); //Kruk kontaktowa³ siê z nami przez kurierów jeszcze przed zamordowaniem magów ognia.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_06"); //G³ównie ja z nim korespondowa³em i to wbrew zakazom Saturasa.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_07"); //Dlaczego?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_08"); //Kruk posiad³ pewien staro¿ytny wolumin, w którym spisano historiê dawnej rasy ¿yj¹cej w Jarkendarze.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_09"); //Czym jest ten Jarkendar?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_10"); //To staro¿ytna kraina, onegdaj w³adali tam potê¿ni œmiertelnicy. Jednak wszystko ma swój pocz¹tek jak i koniec.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_11"); //W³adza, zdrada i zag³ada...
	AI_Output (self, other,"DIA_Merdarion_Crow_08_12"); //Nie ma ju¿ staro¿ytnych, pozosta³o jednak wiele pytañ bez odpowiedzi, a tak¿e potêga, któr¹ pozostawiono bez stra¿nika.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_13"); //Kruk nie potrafi³ odczytaæ staro¿ytnego jêzyka, w którym spisano wolumin.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_14"); //Ja po czêœci potrafiê przet³umaczyæ te znaki, ale nie mam ksiêgi.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_15"); //Spotkaliœcie siê?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_16"); //Tak, ale tylko raz.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_17"); //Saturas o tym wiedzia³?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_18"); //Nie, ale po spotkaniu wyjawi³em mu prawdê, a tak¿e pobudki, które mn¹ kierowa³y.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_19"); //Kruk przyby³ w towarzystwie Hrabiego. Pokaza³ mi ksiêgê i za¿¹da³, ¿ebym j¹ przet³umaczy³.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_20"); //Kiedy zobaczy³em inkanuba³... A¿ kipia³ mrokiem Beliara. Wyrwa³em wolumin i teleportowa³em siê na oœlep.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_21"); //Trafi³em do jakiejœ zatopionej wie¿y, w której a¿ cuchnê³o od nekromancji. Ukry³em wolumin w jednej ze skrzyñ i teleportowa³em siê z powrotem.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_22"); //Dlaczego nie zabra³eœ ksiêgi ze sob¹?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_23"); //Bo te piktogramy to nie by³ jêzyk staro¿ytnych... To by³a mroczna mowa!
	AI_Output (self, other,"DIA_Merdarion_Crow_08_24"); //Ten manuskrypt poœwiêcono Beliarowi. Ledwo prze¿y³em kontakt z ksiêg¹.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_25"); //St¹d w³aœnie pojawi³a siê skaza u Kruka.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_26"); //Jestem pewien, ¿e Beliar opêta³ go, magnat nie jest ju¿ sob¹.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_27"); //Zrobi wszystko by dostaæ siê do Jarkendaru, gdzie z³o wziê³o swój pocz¹tek.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_28"); //Jak to siê zaczê³o?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_29"); //Nienawiœæ dwóch braci - Innosa i Beliara.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_30"); //Tam w³aœnie wykuto szpon Beliara, straszliwe ostrze, które jest tym potê¿niejsze, im silniejszy jest ten, kto nim w³ada.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_31"); //Tam te¿ stworzono opokê Innosa, tarczê, która mo¿e odbiæ ka¿dy czar do Ÿród³a i daje temu, który j¹ nosi niewra¿liwoœæ na ogieñ.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_32"); //Dwa potê¿ne artefakty w jednej krainie. Kasty, które rozpêta³y bratobójcz¹ walkê, rzeka ognia i krwi, która poch³onê³a wszystkich œmiertelników...
	AI_Output (self, other,"DIA_Merdarion_Crow_08_33"); //Jestem pewien, ¿e Kruk chce zdobyæ szpon Beliara.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_34"); //Magnat s¹dzi³, ¿e znajdzie odpowiedzi w ksiêdze, któr¹ wzi¹³ za wolumin napisany przez staro¿ytnych.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_35"); //Musia³ gdzieœ przeczytaæ o Jarkendarze.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_36"); //Dlatego w³aœnie porzuci³em almanach i mam nadziejê, ¿e nikt go ju¿ nie odnajdzie. Niech spoczywa w tej plugawej wie¿y po wsze czasy.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_37"); //Rozumiem, ¿e ka¿dy kto wejdzie w posiadanie woluminu zostanie opêtany przez Beliara?
	AI_Output (self, other,"DIA_Merdarion_Crow_08_38"); //Prêdzej b¹dŸ póŸniej, ale tak. Ksiêgê spisano ludzk¹ krwi¹ i nikt kto w³ada magi¹ inn¹ ni¿ Beliara, nie powinien jej nawet dotykaæ.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_39"); //Ale tobie siê uda³o.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_40"); //Kontakt by³ zbyt krótki. To mnie ocali³o.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_41"); //Wybra³em losowy teleport, ale ksiêga zniekszta³ci³a zaklêcie, wolumin sam wybra³ miejsce, do którego chcia³ trafiæ.
	AI_Output (self, other,"DIA_Merdarion_Crow_08_42"); //Ta wie¿a... Do dzisiaj przechodz¹ mnie ciarki, kiedy pomyœlê o tym miejscu.
	AI_Output (other, self,"DIA_Merdarion_Crow_15_43"); //Hmm... To co powiedzia³eœ da³o mi do myœlenia. Bywaj.
	
   //Mob_CreateItems ("OC_CHEST_RAVEN", ItKe_SunkenTower, 1); //klucz dodany jest ju¿ do skrzyni w zenie
	B_LogEntry(CH3_NON_Seekers, "Sporo siê dowiedzia³em od Merdariona. Z opowieœci maga wynika, ¿e Kruk zosta³ opêtany przez Beliara i ¿e magnat pragnie dostaæ w swoje ³apska jakiœ szpon Beliara ukryty gdzieœ w Jarkendarze. Nie wiem, co z tego wyniknie... Merdarion ukry³ jakiœ plugawy manuskrypt Beliara w starej wie¿y nekromanty.");
};

/****************************

Ork w starej wie¿y Xardasa powinny byæ potê¿ne demony Beliara, mo¿e jakiœ ksi¹¿e demonów, który przepuszcza tylko Kruka.
magnat ukry³ 3 ornamenty w skrzyni. Klucz jest w skrzyni tam gzie Kruk œpi, czyli Dick musi zakraœæ siê do zamku i obrobiæ skrzyniê.
Pewnie ju¿ to dawno zrobi³ podczas zadañ z broni¹ dla Urta wiêc luzik.
MAGICTOWER_03 œrodek
MAGICTOWER_02 wejscie
ItKe_SunkenTower - klucz do skrzyni
orn1-orn4

****************************/

// *****************************************

instance DIA_Merdarion_Aura (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  5;	
	condition	=  DIA_Merdarion_Aura_Condition;
	information	=  DIA_Merdarion_Aura_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Hrabia da³ nam ultimatum.";
};                       

FUNC int  DIA_Merdarion_Aura_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Konwer))
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Aura_Info()
{
   Mob_CreateItems ("CHEST_ORNAMENTS", orn1, 1); 
   Mob_CreateItems ("CHEST_ORNAMENTS", orn2, 1); 
   Mob_CreateItems ("CHEST_ORNAMENTS", orn4, 1); 

	AI_Output (other, self,"DIA_Merdarion_Aura_15_01"); //Hrabia da³ nam ultimatum.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_02"); //Co takiego?
	AI_Output (other, self,"DIA_Merdarion_Aura_15_03"); //Je¿eli nie zwrócê mu ornamentu, który odda³em Cronosowi, sam po niego przyjdzie.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_04"); //Nie masz chyba zamiaru uk³adaæ siê z tym... ³ajdakiem?
	AI_Output (other, self,"DIA_Merdarion_Aura_15_05"); //Nie mam wyboru, muszê odnaleŸæ ornamenty, które Hrabia odda³ Krukowi.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_06"); //Niestety Saturas nie mo¿e wykryæ aury ornamentów. Powiedzia³, ¿e musi je t³umiæ jakaœ inna, antagonistyczna aura.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_07"); //Znam tylko jedno miejsce w Kolonii, gdzie aura Beliara jest tak potê¿na. To zatopiona wie¿a nekromanty.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_08"); //Kruk musia³ o niej wiedzieæ. To idealne miejsce na ukrycie ornamentów.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_09"); //Mam siê zapuœciæ do zatopionej wie¿y nekromanty? Nie jestem a¿ takim szaleñcem!
	AI_Output (self, other,"DIA_Merdarion_Aura_08_10"); //Nie powinno byæ tak Ÿle. Z tego co wiem, Xardas opuœci³ j¹ jakiœ czas temu.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_11"); //W wie¿y znajdziesz co najwy¿ej trochê przywo³anych s³ug.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_12"); //I tak nie mam wyboru. Gdzie znajdê tê wie¿ê?
	AI_Output (self, other,"DIA_Merdarion_Aura_08_13"); //Id¹c do kamiennej cytadeli, tam gdzie harpie maj¹ swój dom, skrêæ w prawo, napotkasz sznurowy most prowadz¹cy do ruin twierdzy. 
	AI_Output (self, other,"DIA_Merdarion_Aura_08_14"); //Z mostu widaæ niewielkie jezioro z wysepk¹, na której znajdziesz wejœcie do zatopionej wie¿y.
	AI_Output (self, other,"DIA_Merdarion_Aura_08_15"); //Mo¿esz te¿ spróbowaæ poszukaæ przejœcia przez orkowe tereny, ale to bardziej niebezpieczna droga.
	AI_Output (other, self,"DIA_Merdarion_Aura_15_16"); //Dziêki, magu. Ruszam bo czas nagli.
	B_LogEntry(CH3_NON_Seekers, "Merdarion twierdzi, ¿e Kruk móg³ ukryæ ornamenty w zatopionej wie¿y nekromanty Xardasa. Czeka mnie niezbyt mi³y spacer...");
};

// *****************************************

instance DIA_Merdarion_Find (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  6;	
	condition	=  DIA_Merdarion_Find_Condition;
	information	=  DIA_Merdarion_Find_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Znalaz³em ornamenty!";
};                       

FUNC int  DIA_Merdarion_Find_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Merdarion_Aura))&&(!Npc_KnowsInfo(hero,Info_Saturas_Find))&&(NPC_HasItems(hero,orn1)>=1)&&(NPC_HasItems(hero,orn2)>=1)&&(NPC_HasItems(hero,orn4)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_Find_Info()
{
	AI_Output (other, self,"DIA_Merdarion_Find_15_01"); //Znalaz³em ornamenty!
	if (ornament_wait >= (Wld_GetDay()))
	{
		AI_Output (self, other,"DIA_Merdarion_Find_08_02"); //Niech Adanosowi bêd¹ dziêki!
		AI_Output (self, other,"DIA_Merdarion_Find_08_03"); //Natychmiast powiedz to Saturasowi.
	}
	else
	{
		AI_Output (self, other,"DIA_Merdarion_Find_08_04"); //SpóŸni³eœ siê... Ornamenty s¹ teraz tylko bezwartoœciowymi kawa³kami kamienia...
	};
   
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Merdarion_FindAll (C_INFO)
{
	npc			=  KDW_602_Merdarion;
	nr			=  7;	
	condition	=  DIA_Merdarion_FindAll_Condition;
	information	=  DIA_Merdarion_FindAll_Info;
	permanent	= 0;
	important 	= 0;
	description 	= "Saturas chce rozpocz¹æ rytua³.";
};                       

FUNC int  DIA_Merdarion_FindAll_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Merdarion_Aura))&&(ritual_time_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Merdarion_FindAll_Info()
{
	AI_Output (other, self,"DIA_Merdarion_FindAll_15_01"); //Saturas chce rozpocz¹æ rytua³.
   
	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_02"); //W koñcu uwolnimy siê od tej cholernej bariery.
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_03"); //Ju¿ idê.
		B_LogEntry(CH3_NON_Ornament, "Merdarion ruszy³ do komnaty.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"DIA_Merdarion_FindAll_08_04"); //SpóŸni³eœ siê... Wszystko stracone!
	};
   
	B_StopProcessInfos(self);
};
