//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Do zobaczenia.
	B_StopProcessInfos(self);
};

/********************

Gorn MUSI staæ przed Carlosem, przed bram¹ na Pola ry¿owe, dopiero po tym dialogu wejdzie poza palisadê.

************************/

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Raport))
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej, nowa twarz.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam siê Gorn. Jestem najemnikiem w s³u¿bie magów.
	AI_Output (self, other,"DIA_Gorn_First1_09_03"); //Lub raczej by³em. Odk¹d Nowy Obóz upad³...
	AI_Output (other, self,"DIA_Gorn_First_15_04"); //Jak to upad³?
	AI_Output (self, other,"DIA_Gorn_First1_09_05"); //A tak to. Stra¿nicy Gomeza znaleŸli przejœcie w górach, zaatakowali od ty³u. Jednoczeœnie przeprowadzili frontalny atak, ¿eby odwróciæ nasz¹ uwagê.
	AI_Output (self, other,"DIA_Gorn_First1_09_06"); //I jak widaæ uda³o siê tym skurczybykom na ca³ej linii.
	AI_Output (other, self,"DIA_Gorn_First_15_07"); //Niech to szlag. Muszê opowiedzieæ w obozie rebeliantów, co siê tutaj wydarzy³o.
	AI_Output (self, other,"DIA_Gorn_First1_09_08"); //Jesteœ cz³owiekiem Cavalorna? Pozdrów ode mnie tego starego capa. 
	B_LogEntry(CH2_RBL_Raport, "Nowy Obóz upad³! Podbili go stra¿nicy i podporz¹dkowali sobie tych, którzy ocaleli. Muszê natychmiast z³o¿yæ raport Ratfordowi.");
	
	/*****************
Zmiana rutyny. Gorn po gadce ma wejœæ do obozu i staæ z 10m przed bram¹ do w³aœciwego obozu.

******************/
	B_Kapitelwechsel(3);	
	Npc_ExchangeRoutine(self,"OR");
   Wld_InsertNpc(ORG_833_Buster, "OW_PATH_056");
};

//*************************************

instance DIA_Gorn_What (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_What_Condition;
	information		= Dia_Gorn_What_Info;
	permanent		= 0;
	important		= 1;
	description		= "Jak leci?"; 
};

FUNC int DIA_Gorn_What_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_First))&&(!Npc_KnowsInfo (hero, DIA_Lee_RBLBegin))&&(Npc_KnowsInfo (hero, DIA_Cavalorn_SpyEnd))
	{
		return 1;
	};
};

func void DIA_Gorn_What_Info()
{
	AI_Output (other, self,"DIA_Gorn_What_15_01"); //Jak leci?
	AI_Output (self, other,"DIA_Gorn_What_09_02"); //Jak krew z nosa, ale mog³o byæ gorzej.
};

//*************************************

instance DIA_Gorn_Rebel (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Rebel_Condition;
	information		= Dia_Gorn_Rebel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak siê tu dosta³eœ?"; 
};

FUNC int DIA_Gorn_Rebel_Condition()
{
	if (Npc_GetDistToWP(self, "NC_PATH87") < 500)
	{
		return 1;
	};
};

func void DIA_Gorn_Rebel_Info()
{
	AI_Output (other, self,"DIA_Gorn_Rebel_15_01"); //Jak siê tu dosta³eœ?
	AI_Output (self, other,"DIA_Gorn_Rebel_09_02"); //Tak jak wszyscy. Zap³aci³em temu durniowi Carlosowi.
	AI_Output (other, self,"DIA_Gorn_Rebel_15_03"); //Muszê dostaæ siê do obozu.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_04"); //A po jak¹ cholerê?
	AI_Output (other, self,"DIA_Gorn_Rebel_15_05"); //Mam swoje powody.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_06"); //Co ty nie powiesz. A wetkn¹³ Ci ktoœ kiedyœ topór w dupê?!
	AI_Output (other, self,"DIA_Gorn_Rebel_15_07"); //Zaczekaj! Przysy³a mnie Cavalorn.
	AI_Output (self, other,"DIA_Gorn_Rebel_09_08"); //Ciszej!
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Gorn_Rebel_09_09"); //ChodŸ za mn¹. Pogadamy w spokojniejszym miejscu.
	B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self,"talking");
};

//*************************************

instance DIA_Gorn_RebelTalk (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 4;
	condition		= Dia_Gorn_RebelTalk_Condition;
	information		= Dia_Gorn_RebelTalk_Info;
	permanent		= 0;
	important		= 1;
	description		= "Muszê dostaæ siê do obozu."; 
};

FUNC int DIA_Gorn_RebelTalk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_Rebel)) && (Npc_GetDistToWP(self, "NC_DAM_BOTTOM") < 500)
	{
		return 1;
	};
};

func void DIA_Gorn_RebelTalk_Info()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_00"); //Muszê dostaæ siê do obozu.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_01"); //Dobra, mów.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_02"); //Podobno w waszym obozie nie wszyscy s¹ zadowoleni z obecnych rz¹dów.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_03"); //Ba, a kto by siê cieszy³ robi¹c na emeryturê Gomeza.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_04"); //Nie wiem czy mogê Ci zaufaæ...
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_05"); //Ch³opcze, tutaj nikt nikomu nie ufa! Ale mo¿esz byæ pewien, ¿e nie gram w zespole weso³ych muzykantów Gomeza.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_06"); //Przed ca³ym tym zamieszaniem by³em najemnikiem. Sporo nabruŸdzi³em stra¿nikom.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_07"); //Po ataku o dziwo Gomez zarz¹dzi³, ¿eby nie wy¿ynaæ nikogo, ale co najwy¿ej wtr¹caæ do kopalni albo zaganiaæ do pracy na polach ry¿owych.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_08"); //Sporo najemników przesz³o na stronê stra¿ników.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_09"); //Dlaczego?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_10"); //Dla rudy, ch³opcze. To jedyny powód. Ale myœlê, ¿e powrót Lee sporo by zmieni³.
	
   if (!Npc_KnowsInfo (hero, DIA_Lee_Cord))
	{
		AI_Output (other, self,"DIA_Gorn_RebelTalk_15_11"); //Kto to jest Lee?
		AI_Output (self, other,"DIA_Gorn_RebelTalk_09_12"); //Lee to nasz przywódca, pójdziemy za nim w paszczê samego Beliara.
	};
   
	AI_Output (other, self,"DIA_Gorn_RebelTalk_15_13"); //A co Lee móg³by tu zmieniæ?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_09_14"); //Wszystko, ch³opcze. W tej chwili rebelianci s¹ rozproszeni. Z tego co wiem powsta³y trzy niezale¿ne frakcje, na których czele stoj¹ Lares, Wilk i Torlof.
	lee_back = lee_back + 1;

	Log_CreateTopic	(CH4_NC_RBLBosses, LOG_MISSION);
	Log_SetTopicStatus	(CH4_NC_RBLBosses, LOG_RUNNING);
	B_LogEntry		(CH4_NC_RBLBosses, "Za rebeli¹ w Nowym Obozie stoi trzech ludzi: Torlof, Lares i Wilk. Ciekawe czy ten Triumwirat to przemyœlany twór?");
	B_LogEntry		(CH4_RBL_NCRebel, "Przywódcami rebelii s¹ Torlof, Lares i Wilk. Powinienem z nimi jak najszybciej porozmawiaæ.");
	Info_ClearChoices (DIA_Gorn_RebelTalk);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Us³ysza³em ju¿ doœæ.", DIA_Gorn_RebelTalk_End);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Kim jest Torlof?", DIA_Gorn_RebelTalk_Torlof);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Wilk?", DIA_Gorn_RebelTalk_Wolf);
	Info_AddChoice (DIA_Gorn_RebelTalk, "Gdzie spotkam Laresa?", DIA_Gorn_RebelTalk_Lares);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Torlof()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_01"); //Kim jest Torlof?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_02"); //Torlof by³ kiedyœ kapitanem. Jak go znam to pewnie p³ywa³ pod pirack¹ bander¹.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_03"); //Kiedy trafi³ do Koloni przysta³ do najemników.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_04"); //Podczas ataku na obóz œwietnie radzi³ sobie z pozorowanymi atakami i pu³apkami.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_05"); //Po wszystkim stra¿nicy wtr¹cili go do kopalni, bo zbytnio wda³ im siê we znaki.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_06"); //Teraz to w³aœnie Torlof stoi na czele rebeliantów w Kopalni.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_07"); //Niestety na jego g³owie jest tak¿e limit dziennego wydobycia rudy.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_08"); //Co to znaczy?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_09"); //Ano to, ¿e jak kopacze nie wykonaj¹ normy to stra¿nicy zabijaj¹ losowo wybranego pechowca.
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Torlof_15_10"); //Czêsto siê to zdarza?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Torlof_09_11"); //Rzadko, ale ostatnio zwiêkszono limity i teraz kopaczom jest naprawdê ciê¿ko. Cieszê siê, ¿e mnie tam nie ma...
	B_LogEntry		(CH4_NC_RBLBosses, "Torlof przewodzi kopaczom i skazañcom z Nowej Kopalni. Torlof jest odpowiedzialny za dzienne limity rudy - nie wywi¹zanie siê z wyrobu rudy koñczy siê œmierci¹ losowo wybranego kopacza.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Wolf()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Wolf_15_01"); //Wilk?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_02"); //Tak, jeden z naszych. By³ najemnikiem, teraz jest na us³ugach stra¿ników.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_03"); //Wilk wytwarza przednie ³uki, a do tego tylko on potrafi zrobiæ pancerz z p³ytek pe³zaczy.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_04"); //Wœród stra¿ników zapanowa³a moda na te cholerne p³ytki. Jak ze sraczk¹ kupuj¹ je od kopaczy, a Wilk utwardza nimi pancerze. 
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Wolf_09_05"); //Wilk stoi na czele rebeliantów z Kot³a.
	B_LogEntry		(CH4_NC_RBLBosses, "Wilk przewodzi w Kotle. To doskona³y ³uczarz, potrafi te¿ skleciæ pancerz z p³ytek pe³zaczy.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);			
};


// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_Lares()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_Lares_15_01"); //Gdzie spotkam Laresa?
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_02"); //Na polu ry¿owym. Dosta³ fuchê Ry¿owego Ksiêcia kiedy ten radoœnie zadynda³ na stryku.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_03"); //Lares odpowiada za zbiory ry¿u. Podobnie jak Torlof ma okreœlone limity, których musi przestrzegaæ.
	AI_Output (self, other,"DIA_Gorn_RebelTalk_Lares_09_04"); //Kara za niewype³nienie przydzia³ów jest identyczna jak w przypadku kopaczy.
	B_LogEntry		(CH4_NC_RBLBosses, "Lares przewodzi skazañcom na polu ry¿owym, tak¿e jest zwi¹zany limitami zbioru ry¿u.");	
	//Info_ClearChoices (DIA_Gorn_RebelTalk);			
};

// -------------------------------------------------------------------

FUNC VOID DIA_Gorn_RebelTalk_End()
{
	AI_Output (other, self,"DIA_Gorn_RebelTalk_End_15_01"); //Us³ysza³em ju¿ doœæ.
	Info_ClearChoices (DIA_Gorn_RebelTalk);			
	B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self,"NC");
};

//*************************************

instance DIA_Gorn_Guards (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_Guards_Condition;
	information		= Dia_Gorn_Guards_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co do stra¿ników - jak dostanê siê do obozu?"; 
};

FUNC int DIA_Gorn_Guards_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

func void DIA_Gorn_Guards_Info()
{
	AI_Output (other, self,"DIA_Gorn_Guards_15_01"); //Co do stra¿ników - jak dostanê siê do obozu?
	AI_Output (self, other,"DIA_Gorn_Guards_09_02"); //Za du¿o Ci w tym nie pomogê. Zabij jakiegoœ stra¿nika i zabierz mu pancerz. Ci przy bramie to idioci, jakoœ ich przekonasz, ¿e powinni Ciê wpuœciæ.
	AI_Output (self, other,"DIA_Gorn_Guards_09_03"); //Aha. Mo¿e to Ci siê przyda. Oficjalnie z ramienia Gomeza w obozie rz¹dzi Fletcher. Ale szar¹ eminencj¹ jest tutaj Hrabia.
	AI_Output (other, self,"DIA_Gorn_Guards_15_04"); //W porz¹dku, dziêki za radê. Bywaj.
	AI_Output (self, other,"DIA_Gorn_Guards_09_05"); //Powodzenia, ch³opcze.
	
   B_LogEntry		(CH4_RBL_NCRebel, "Gorn powiedzia³, ¿e oficjalnie w obozie rz¹dzi Fletcher, ale szar¹ eminencj¹ jest Hrabia. Ta informacja mo¿e mi siê kiedyœ przydaæ.");
	B_StopProcessInfos	(self);
};

//*************************************

instance DIA_Gorn_LeeBack (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 7;
	condition		= Dia_Gorn_LeeBack_Condition;
	information		= Dia_Gorn_LeeBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znowu z Lee?"; 
};

FUNC int DIA_Gorn_LeeBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lee_RBLBegin))
	{
		return 1;
	};
};

func void DIA_Gorn_LeeBack_Info()
{
	AI_Output (other, self,"DIA_Gorn_LeeBack_15_01"); //Znowu z Lee?
	AI_Output (self, other,"DIA_Gorn_LeeBack_09_02"); //Jak za starych dobrych czasów! Z chêci¹ poklepa³bym stra¿ników toporem, ale Lee kaza³ mi zostaæ tutaj.
	AI_Output (other, self,"DIA_Gorn_LeeBack_15_03"); //Pewnie nie chce ¿eby jednoosobowa armia pod wodz¹ Gorna rozwi¹za³a problem stra¿ników przed nim.
	AI_Output (self, other,"DIA_Gorn_LeeBack_09_04"); //He, he, coœ w tym jest. No nic, poczekamy, zobaczymy.
};

//*************************************

instance DIA_Gorn_TheRock (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 8;
	condition		= Dia_Gorn_TheRock_Condition;
	information		= Dia_Gorn_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int DIA_Gorn_TheRock_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lee_RBLFound))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void DIA_Gorn_TheRock_Info()
{
	var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);

	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_01"); //Uwa¿aj brachu, stra¿nicy zaszyli siê na grani i za cholerê nie mo¿emy ich stamt¹d wykurzyæ.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_02"); //Wiem o wszystkim, rozmawia³em z Lee. Co tu siê sta³o?
	AI_TurnToNpc(self, flet);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_03"); //Zaatakowaliœmy. Jak widzisz to by³ raczej g³upi pomys³. Fletcher i jego ho³ota mog¹ tam siedzieæ jak d³ugo zechc¹. Wczoraj jeden ze stra¿ników, prawie nasika³ mi na g³owê!
	AI_Output (other, self,"DIA_Gorn_TheRock_15_04"); //Lee poleci³ mi dowiedzieæ siê od Flethera wszystkiego co dotyczy Orlego Gniazda.
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Gorn_TheRock_09_05"); //Tfu. Ten kasztel jest przeklêty, mówiê Ci. Kiedy rozpoczê³o siê zamieszanie w Orlim GnieŸdzie ze sto³pu dochodzi³y nieludzkie krzyki, a¿ mnie ciarki przesz³y.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_06"); //Ktoœ wtedy wyszed³ na blanki i krzykn¹³ coœ do Fletchera. Szkoda, ¿e nie widzia³eœ przera¿enia na twarzy tego dupka.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_07"); //NieŸle siê zdziwi³em kiedy Fletcher na czele stra¿ników rzuci³ siê w nasz¹ stronê. Te sukinsyny bi³y siê jak demony i muszê przyznaæ, ¿e zas³u¿enie przebili sobie drogê przez nasze szeregi.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_08"); //Œcigaliœmy stra¿ników a¿ do grani. Po pierwszym ataku daliœmy sobie spokój, szkoda traciæ ludzi.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_09"); //Jak sytuacja wygl¹da teraz?
	AI_Output (self, other,"DIA_Gorn_TheRock_09_10"); //Staramy siê nie podchodziæ za blisko, ale jakby trochê przycich³o.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_11"); //To znaczy w nocy coœ s³yszeliœmy, jakby zduszony krzyk. Oczywiœcie nikt z nas nie kwapi³ siê, ¿eby to sprawdziæ.
	AI_Output (self, other,"DIA_Gorn_TheRock_09_12"); //A¿ mnie rêce œwierzbi¹, ¿eby dorwaæ Fletchera, ale Lee kaza³ tu przycupn¹æ i czekaæ. Zdaje siê, ¿e to Ty masz odwaliæ ca³¹ brudn¹ robotê.
	AI_Output (other, self,"DIA_Gorn_TheRock_15_13"); //Ano, coœ ostatnio pech mnie przeœladuje. Dobra, w³a¿ê na grañ, zobaczymy co tam znajdê...
	AI_Output (self, other,"DIA_Gorn_TheRock_09_14"); //Nie daj siê zabiæ!

	B_LogEntry		(CH5_NC_TheRock,	"Gorn powiedzia³ mi, ¿e kiedy wybuch³o zamieszanie w Orlim GnieŸdzie ktoœ pojawi³ siê na blankach i to na jego widok Fletcher uciek³ spod murów. Gorn twierdzi, ¿e na grani jakby przycich³o. Mo¿e powinienem spróbowaæ siê tam wspi¹æ?");
};

//*************************************

instance DIA_Gorn_TheRockback (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 9;
	condition		= Dia_Gorn_TheRockback_Condition;
	information		= Dia_Gorn_TheRockback_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int DIA_Gorn_TheRockback_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock1))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void DIA_Gorn_TheRockback_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_01"); //Wróci³eœ! Co z Fletcherem?
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_02"); //Nie ¿yje.
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_03"); //Co?! Nie s³ysza³em odg³osów walki.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_04"); //Jakiœ demon w nocy za³atwi³ wszystkich stra¿ników. Fletcherowi rozpru³ bebechy, ¿eby d³u¿ej zdycha³.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_05"); //Skróci³em jego mêki.
	AI_Output (self, other,"DIA_Gorn_TheRockback_09_06"); //Niech to szlag, nie cierpiê demonów! Powiedz o wszystkim Lee, ja zostanê tu z ch³opakami na wszelki wypadek.
	AI_Output (other, self,"DIA_Gorn_TheRockback_15_07"); //Bywaj, Gorn.
	B_LogEntry		(CH5_NC_TheRock,	"Czas zdaæ relacjê Lee.");

	/************************
Ork w tym miejscu misisz oczyœciæ barykadê Wilka, czyli stra¿ników zamieñ w trupy + kilku ludzi wilka, a Wilk niech stoi gdzieœ przed wejœciem do siedziby magów

***********************/
};

INSTANCE DIA_Gorn_CanYouTeachMe (C_INFO)
{
	npc				= PC_Fighter;
	//nr				= 71;
	condition		= DIA_Gorn_CanYouTeachMe_Condition;
	information		= DIA_Gorn_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Gorn_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Gorn_What))
	{
		return 1;
	};
};

FUNC VOID DIA_Gorn_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Gorn_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Gorn_CanYouTeachMe_12_02"); //Widzisz te bicepsy? Znam sporo æwiczeñ na nabranie krzepy.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Gorn pomo¿e mi nabraæ krzepy.");
};