//*********************************************************
//							EXIT									
//*********************************************************

instance  DIA_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  DIA_700_Lee_Exit_Condition;
	information	=  DIA_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_700_Lee_Exit_Info()
{
	B_StopProcessInfos	(self);
};

//*********************************************************
//						Greet									
//*********************************************************

instance  DIA_Lee_Hello(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  DIA_Lee_Hello_Condition;
	information	=  DIA_Lee_Hello_Info;
	permanent	=  0;
	description = "Paskudnie to wygl¹da.";
};                       

FUNC int  DIA_Lee_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Lee_Hello_Info()
{
	AI_Output (other, self,"DIA_Lee_Hello_15_00"); //Paskudnie to wygl¹da.
	AI_Output (self, other,"DIA_Lee_Hello_08_01"); //O czym Ty mówisz?
	AI_Output (other, self,"DIA_Lee_Hello_15_02"); //O twojej ranie, przecie¿ nie o mordzie tego wielkoluda w sali z klatkami.
	AI_Output (self, other,"DIA_Lee_Hello_08_03"); //Masz szczêœcie, ¿e w bitwie Orik dosta³ przez ³eb i stêpia³ mu s³uch.
	AI_Output (self, other,"DIA_Lee_Hello_08_04"); //Co do rany, to magowie uratowali mi ty³ek, dlatego nadal tu jestem. Zawsze sp³acam zaci¹gniête d³ugi.
};

//*********************************************************

instance  DIA_Lee_Who(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  DIA_Lee_Who_Condition;
	information	=  DIA_Lee_Who_Info;
	important		= 0;
	permanent		= 0;
	description = "Kim jesteœ?";
};                       

FUNC int  DIA_Lee_Who_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Who_Info()
{
	AI_Output (other, self,"DIA_Lee_Who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Lee_Who_08_01"); //Kiedyœ by³em genera³em, teraz jestem najemnikiem. Mo¿esz nazywaæ mnie Lee.
	AI_Output (other, self,"DIA_Lee_Who_15_02"); //Ciekawa historia...
	AI_Output (self, other,"DIA_Lee_Who_08_03"); //Raczej nudna, ale to nie Twoja sprawa.
	
   B_StopProcessInfos(self);
};

//*********************************************************

instance DIA_Lee_Cord (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  3;
	condition	=  DIA_Lee_Cord_Condition;
	information	=  DIA_Lee_Cord_Info;
   important		= 1;
	description = "";
};                       

FUNC int DIA_Lee_Cord_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Who))&&(Npc_KnowsInfo(hero,DIA_Cord_Question))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Cord_Info()
{
   lee_offer = TRUE;
   AI_Output (self, other,"DIA_Lee_Cord_08_01"); //Cord mówi³, ¿e spotka³eœ Jarvisa. Da³byœ radê znowu go odnaleŸæ?
   AI_Output (other, self,"DIA_Lee_Cord_15_02"); //Pewnie. A dlaczego pytasz?
   AI_Output (self, other,"DIA_Lee_Cord_08_03"); //Muszê coœ mu przekazaæ, a brakuje mi ludzi. Co Ty na to?
   AI_Output (other, self,"DIA_Lee_Cord_15_04"); //Pod jednym warunkiem. Zap³acisz mi za poprzedni¹ wiadomoœæ od Jarvisa.
   AI_Output (other, self,"DIA_Lee_Cord_15_05"); //Mia³em otrzymaæ tyle rudy ile udŸwignê, a Cord zwyczajnie mnie sp³awi³.
   AI_Output (self, other,"DIA_Lee_Cord_08_06"); //Zrobimy tak. Dam Ci teraz 1000 bry³ek. Je¿eli zrobisz to o co Ciê poproszê, otrzymasz drugie tyle i widoki na wiêcej.
   AI_Output (self, other,"DIA_Lee_Cord_08_07"); //Co Ty na to?

	Info_ClearChoices (DIA_Lee_Cord);
	Info_AddChoice (DIA_Lee_Cord, "Rudy nigdy za wiele.", DIA_Lee_Cord_Yes);
	Info_AddChoice (DIA_Lee_Cord, "Zastanowiê siê.", DIA_Lee_Cord_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Lee_Cord_Yes()
{
	lee_offer_condition = 1;
	CreateInvItems (self,ItMiNugget,1000);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 1000);
	AI_Output (other, self,"DIA_Lee_Cord_Yes_15_01"); //Rudy nigdy za wiele.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_02"); //Te¿ tak mówiê.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_03"); //Powiedz Jarvisowi, ¿e potrzebujemy jeszcze jednego 'wzorca'. Bêdzie wiedzia³ o co chodzi.
	AI_Output (other, self,"DIA_Lee_Cord_Yes_15_04"); //Co to za wzorzec?
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_05"); //Gdybym to zdradzi³, musia³bym Ciê zabiæ.
	AI_Output (self, other,"DIA_Lee_Cord_Yes_08_06"); //Ruszaj i pamiêtaj, ¿e im mniej wiesz, tym lepiej dla ciebie.
	
   B_LogEntry(CH3_NON_Mercenary, "Dziwna sprawa z tymi najemnikami. Coœ kombinuj¹, ale na razie nic z nich nie wyci¹gn¹³em. Mam znowu odnaleŸæ Jarvisa i przekazaæ mu, ¿e najemnicy potrzebuj¹ jeszcze jednego wzorca. ");
	B_StopProcessInfos(self);
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_Lee_Cord_No()
{
	AI_Output (other, self,"DIA_Lee_Cord_No_15_01"); //Zastanowiê siê.
	AI_Output (self, other,"DIA_Lee_Cord_No_08_02"); //Skoro musisz.
	B_StopProcessInfos(self);
};

instance DIA_Lee_Cord2 (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  3;
	condition	=  DIA_Lee_Cord2_Condition;
	information	=  DIA_Lee_Cord_Yes;
	description = "Zmieni³em zdanie.";
};

func int DIA_Lee_Cord2_Condition()
{
   if (Npc_KnowsInfo(hero, DIA_Lee_Cord))&&(!lee_offer_condition)
	{
		return 1;
	};
};
//*********************************************************

instance DIA_Lee_Trap(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  4;
	condition	=  DIA_Lee_Trap_Condition;
	information	=  DIA_Lee_Trap_Info;
	important		= 0;
	permanent		= 0;
	description = "Musimy porozmawiaæ.";
};                       

FUNC int  DIA_Lee_Trap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_LeeCamp))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Trap_Info()
{
	AI_Output (other, self,"DIA_Lee_Trap_15_00"); //Musimy porozmawiaæ.
	AI_Output (self, other,"DIA_Lee_Trap_08_01"); //Widzia³em Jarvisa. Co siê sta³o?
	AI_Output (other, self,"DIA_Lee_Trap_15_02"); //Hrabia zdoby³ drugi kawa³ek ornamentu...
	AI_Output (self, other,"DIA_Lee_Trap_08_03"); //Sk¹d... Jarvis! Zawsze mia³ za d³ugi jêzyk, chyba powinienem mu go obci¹æ.
	AI_Output (other, self,"DIA_Lee_Trap_15_04"); //Nic ju¿ nie zmieni faktu, ¿e ja te¿ jestem w to wpl¹tany. Poza tym mam do porozmawiania z tym Hrabi¹. Powiedzmy, ¿e to sprawy osobiste.
	AI_Output (other, self,"DIA_Lee_Trap_15_05"); //O co chodzi z ornamentami?
	AI_Output (self, other,"DIA_Lee_Trap_08_06"); //Dobra i tak ju¿ wiesz wiêcej, ni¿ powinieneœ.
	AI_Output (self, other,"DIA_Lee_Trap_08_07"); //Byliœmy najemnikami na us³ugach magów wody. Kiedy stra¿nicy zaatakowali obóz, walczyliœmy do koñca. Nie by³o ³atwo...
	AI_Output (self, other,"DIA_Lee_Trap_08_08"); //Dosta³em przez ¿ebra, reszta te¿ nie wygl¹da³a najlepiej. Stra¿ników nadal przybywa³o. Musieli znaleŸæ tajne przejœcie przez góry.
	AI_Output (self, other,"DIA_Lee_Trap_08_09"); //Magowie odprawili rytua³ teleportacji. W ostatniej chwili widz¹c, ¿e ju¿ po nas Saturas obj¹³ i nas zaklêciem.
	AI_Output (self, other,"DIA_Lee_Trap_08_10"); //Uratowa³ mi ¿ycie, a ja zawsze sp³acam d³ugi. Riordian posk³ada³ nas do kupy.
	AI_Output (other, self,"DIA_Lee_Trap_15_11"); //Ale co to ma wspólnego z ornamentami?
	AI_Output (self, other,"DIA_Lee_Trap_08_12"); //Magowie wody wyniuchali jakiœ sposób na wydostanie siê z Kolonii.
	AI_Output (self, other,"DIA_Lee_Trap_08_13"); //Odczytali piktogramy na œcianach œwi¹tyni. Saturas zdo³a³ utworzyæ mapê na podstawie zapisków na œcianach.
	AI_Output (self, other,"DIA_Lee_Trap_08_14"); //Mapa wskazuje miejsca ukrycia czterech czêœci ornamentu, którego potrzebuj¹ magowie.
	AI_Output (self, other,"DIA_Lee_Trap_08_15"); //Saturas powiedzia³, ¿e je¿eli pomo¿emy im odnaleŸæ kawa³ki ornamentu, to bêdziemy kwita.
	AI_Output (self, other,"DIA_Lee_Trap_08_16"); //Dlatego pomagam magom. Kiedy tylko z nimi skoñczê, wracam do Nowego Obozu skopaæ dupy stra¿nikom i przywróciæ wolnoœæ najemnikom.
	AI_Output (self, other,"DIA_Lee_Trap_08_17"); //Potem wyniesiemy siê z tej zapad³ej dziury, bo mam do sp³acenia jeszcze jeden d³ug...
	AI_Output (other, self,"DIA_Lee_Trap_15_18"); //Nie chcê byæ ciekawski, ale co to za d³ug?
	AI_Output (self, other,"DIA_Lee_Trap_08_19"); //To nie jest ¿adna tajemnica. 
	AI_Output (self, other,"DIA_Lee_Trap_08_20"); //By³em kiedyœ genera³em i przyjacielem Rhobara.
	AI_Output (self, other,"DIA_Lee_Trap_08_21"); //Magnatom nie spodoba³o siê to, ¿e zwyk³y ¿o³nierz jest powiernikiem króla. Do tego za tym wojakiem sta³a ca³a armia Myrtany. ¯o³nierze poszliby za mn¹ w ogieñ.
	AI_Output (self, other,"DIA_Lee_Trap_08_22"); //Magnaci uknuli spisek, którego ofiar¹ pad³a ¿ona Rhobara. Oczywiœcie zabito j¹ moim sztyletem.
	AI_Output (self, other,"DIA_Lee_Trap_08_23"); //Proces by³ krótki. Rhobar ze wzglêdu na zas³ugi i przyjaŸñ zes³a³ mnie do Kolonii.
	AI_Output (self, other,"DIA_Lee_Trap_08_24"); //Mam zamiar wróciæ do Myrtany i odp³aciæ magnatom dobrym za nadobne.
	AI_Output (other, self,"DIA_Lee_Trap_15_25"); //¯ycia up³ywa w strugach gówna, przyjacielu.
	AI_Output (self, other,"DIA_Lee_Trap_08_26"); //Œwiête s³owa. 
	AI_Output (self, other,"DIA_Lee_Trap_08_27"); //Wystarczy ju¿ tych pogawêdek, wróæ kiedy bêdziesz gotów na wyprawê po kolejny kawa³ek ornamentu.
	AI_Output (other, self,"DIA_Lee_Trap_15_28"); //Ja?
	AI_Output (self, other,"DIA_Lee_Trap_08_29"); //A kogo mam wys³aæ? Cord i Orik s¹ mi potrzebni tutaj. S¹siedztwo trzêsawisk Ÿle wp³ywa na nasze morale, a i magowie nie ciesz¹ siê z bliskoœci mieszkañców bagna...
	AI_Output (self, other,"DIA_Lee_Trap_08_30"); //Jarvis ju¿ raz zawiód³, poza tym nie chcê nara¿aæ w³asnych ludzi...
	AI_Output (other, self,"DIA_Lee_Trap_15_31"); //Przynajmniej jesteœ szczery. Rozumiem, ¿e moje ¿ycie jest nic nie warte?
	AI_Output (self, other,"DIA_Lee_Trap_08_32"); //le mnie zrozumia³eœ. Pokaza³eœ, ¿e œwietnie sobie radzisz w najtrudniejszych sytuacjach. Tylko ktoœ taki poradzi sobie podczas poszukiwañ.
	AI_Output (self, other,"DIA_Lee_Trap_08_33"); //My zajmiemy siê pilnowaniem pleców magów, kiedy Ty bêdziesz siê ugania³ za ornamentami.
	AI_Output (self, other,"DIA_Lee_Trap_08_34"); //Wróæ, jak siê zdecydujesz. Aha i pamiêtaj, ¿e magowie dobrze p³ac¹.

	B_LogEntry(CH3_NON_Mercenary, "Lee opowiedzia³ mi ciekaw¹ historiê. W ka¿dym razie przywódca najemników ma d³ug wzglêdem magów, którego sp³at¹ ma byæ w³aœnie pomoc w odnalezieniu ornamentów. Lee chce, ¿ebym to ja poszuka³ pozosta³ych dwóch czêœci ornamentu.");
};

//*********************************************************

instance  DIA_Lee_Agree(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  5;
	condition	=  DIA_Lee_Agree_Condition;
	information	=  DIA_Lee_Agree_Info;
	important		= 0;
	permanent		= 0;
	description = "Dobra, jestem z wami.";
};                       

FUNC int  DIA_Lee_Agree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Lee_Trap))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Agree_Info()
{
	AI_Output (other, self,"DIA_Lee_Agree_15_00"); //Dobra, jestem z wami.
	AI_Output (self, other,"DIA_Lee_Agree_08_01"); //Wiedzia³em, ¿e siê zgodzisz. A tak miêdzy nami robisz to dla rudy?
	AI_Output (other, self,"DIA_Lee_Agree_15_02"); //Nie tylko. Mam z Hrabi¹ na pieñku.
	AI_Output (self, other,"DIA_Lee_Agree_08_03"); //Rozumiem. Tylko nie pozwól, by emocje wziê³y górê nad zdrowym rozs¹dkiem. Nie chcê wys³aæ Corda po Twoje zw³oki.
	AI_Output (other, self,"DIA_Lee_Agree_15_04"); //Bez obaw, Lee. Mój gniew jest zimny jak lód. Hrabia dostanie to na co zas³u¿y³.
	AI_Output (self, other,"DIA_Lee_Agree_08_05"); //W porz¹dku. IdŸ do Saturasa, powiedz, ¿e ja Ciê przysy³am. Dostaniesz mapê z lokalizacj¹ kolejnego ornamentu.
	AI_Output (self, other,"DIA_Lee_Agree_08_06"); //I uwa¿aj na siebie.
	AI_Output (other, self,"DIA_Lee_Agree_15_07"); //Jak zawsze. Bywaj.
	B_LogEntry		(CH3_NON_Ornament, "Zgodzi³em siê pomóc najemnikom w poszukiwaniu ornamentów dla magów. Muszê porozmawiaæ z Saturasem, dostanê od niego mapê z lokalizacj¹ kolejnego ornamentu.");
};

//*********************************************************

instance  DIA_Lee_LasOrn(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  6;
	condition	=  DIA_Lee_LasOrn_Condition;
	information	=  DIA_Lee_LasOrn_Info;
	important		= 0;
	permanent		= 0;
	description = "I szlag trafi³ kolejny ornament!";
};                       

FUNC int  DIA_Lee_LasOrn_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Konwer))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_LasOrn_Info()
{
	AI_Output (other, self,"DIA_Lee_LasOrn_15_00"); //Straci³em kolejny ornament!
	AI_Output (self, other,"DIA_Lee_LasOrn_08_01"); //Co siê sta³o?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_02"); //Hrabia znowu mnie uprzedzi³. Mam trzy dnia na odnalezienie pozosta³ych czêœci, albo ca³y plan magów szlag trafi.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_03"); //Nie mamy wyboru. Musimy im pomóc. Co zamierzasz?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_04"); //Spróbujê odnaleŸæ te cholerne ornamenty. W koñcu da³em ci s³owo.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_05"); //Myœla³em, ze robisz to dla rudy i dla zemsty na Hrabim?
	AI_Output (other, self,"DIA_Lee_LasOrn_15_06"); //Przypominasz mi siebie samego, Lee. Sporo nas ³¹czy, ¿aden z nas nie chcia³ zostaæ tym, kim jest teraz.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_07"); //Masz racjê przyjacielu. Szkoda, ¿e nie poznaliœmy siê w lepszych czasach.
	AI_Output (other, self,"DIA_Lee_LasOrn_15_08"); //Mo¿e kiedyœ to nadrobimy...
	AI_Output (self, other,"DIA_Lee_LasOrn_08_09"); //Wróæ, jak skoñczy siê ta heca z ornamentami. Do tego czasu bêdê ju¿ czu³ siê lepiej.
	AI_Output (other, self,"DIA_Lee_LasOrn_15_10"); //Dobra. Bywaj.
	AI_Output (self, other,"DIA_Lee_LasOrn_08_11"); //Uwa¿aj na siebie.
	B_LogEntry(CH3_NON_Mercenary, "Kiedy skoñczy siê ta ca³a heca z ornamentami, mam porozmawiaæ z Lee.");
};

//*********************************************************

instance  DIA_Lee_AfterRitual(C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  7;
	condition	=  DIA_Lee_AfterRitual_Condition;
	information	=  DIA_Lee_AfterRitual_Info;
	important		= 1;
	permanent		= 0;
	description = "";
};                       

FUNC int  DIA_Lee_AfterRitual_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))&&(lee_free == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_AfterRitual_Info()
{
	B_GiveXP(1250);
	var C_NPC myxir; myxir = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC merd; merd = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC nefar; nefar = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC cron; cron = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC riod; riod = Hlp_GetNpc(KDW_605_Riordian);

	var C_NPC jar; jar = Hlp_GetNpc(Sld_728_Jarvis);
	var C_NPC orik; orik = Hlp_GetNpc(Sld_701_Orik);
	var C_NPC cord; cord = Hlp_GetNpc(SLD_709_Cord);

	AI_Output (self, other,"DIA_Lee_AfterRitual_08_01"); //Cholera to by³o niespodziewane!
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_02"); //Jak to siê sta³o? Kto sta³ na warcie?
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_03"); //Jarvis. Zdaje siê, ¿e uci¹³ sobie drzemkê. Poder¿nêli mu gard³o i pobiegli do Komnaty Portali.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_04"); //Minêli Orika, ale ten pata³ach jest g³uchy jak pieñ!
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_05"); //Cord akurat wraca³ z wychodka, kiedy wbiegali do œrodka. Krzykn¹³ i rzuciliœmy siê w pogoñ...
	
   if (Npc_IsDead(jar))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_06"); //Szkoda Jarvisa. Ale magowie te¿ ucierpieli. 
	};
	if (Npc_IsDead(myxir))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_07"); //Myxir ju¿ raczej siê nie obudzi.
	};
	if (Npc_IsDead(merd))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_08"); //Szkoda Merdariona, sporo mi pomóg³.
	};
	if (Npc_IsDead(nefar))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_09"); //Nefarius te¿ poleg³.
	};
	if (Npc_IsDead(cron))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_10"); //Cronos jednak nie by³ taki twardy, jakiego zgrywa³.
	};
	if (Npc_IsDead(riod))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_11"); //Riordian... Jedyny mag, który okaza³ mi serce. Niech Adanos nad nim czuwa.
	};
	if (Npc_IsDead(orik))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_12"); //Orik pewnie nawet nie us³ysza³, co go zabi³o.
	};
	if (Npc_IsDead(cord))
	{
		AI_Output (other, self,"DIA_Lee_AfterRitual_15_13"); //Nie s¹dzi³em, ¿e ktokolwiek zdo³a pokonaæ Corda!
	};
   
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_14"); //Tak, to by³ krwawy dzionek. Mam ju¿ doœæ tej cholernej Kolonii...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_15"); //Saturas powiedzia³, ¿e jesteœcie kwita, d³ug sp³acony.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_16"); //Czasami ¿a³ujê, ¿e stawiam honor ponad zdrowy rozs¹dek... Gdyby nie mój upór Jarvis nadal by ¿y³...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_17"); //Nie zawsze mamy wp³yw na to, co siê wydarzy. 
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_18"); //Tak wielu przyjació³ ju¿ pochowa³em... 
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_19"); //Oni umr¹ dopiero wtedy, kiedy zginie pamiêæ o ich czynach.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_20"); //Masz racjê! Kiedy tylko wrócê do Myrtany i wyrównam rachunki, kupiê gdzieœ kawa³ek ziemi i zostanê rolnikiem.
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_21"); //Tak, a ja zostanê rybakiem i bêdziemy co wieczór wspominaæ przy kuflu stare dobre czasy. Mo¿emy te¿ zapisaæ siê do ko³a hafciarek, he, he.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_22"); //Masz racjê, te¿ nie mogê sobie tego wyobraziæ. Ech, czasami dobrze by³oby po prostu usi¹œæ z przyjacielem przy anta³ku piwa i ur¿n¹æ siê do nieprzytomnoœci...
	AI_Output (other, self,"DIA_Lee_AfterRitual_15_23"); //Jak tylko skoñcz¹ siê te brewerie z barier¹ to s³u¿ê pomoc¹.
	AI_Output (self, other,"DIA_Lee_AfterRitual_08_24"); //Trzymam Ciê za s³owo, Rick! Dobra, wracam do ch³opaków.

	Log_SetTopicStatus(CH3_NON_Mercenary, LOG_SUCCESS);
	B_LogEntry(CH3_NON_Mercenary, "Lee sp³aci³ d³ug wzglêdem magów z moim 'ma³ym' udzia³em. Cieszê siê, ¿e pomog³em najemnikom. Znalaz³em te¿ przyjaciela w by³ym generale królewskiej armii. Dziwny jest ten œwiat...");
};

//*********************************************************

var int lee_agree;
var int tor_know;

instance  DIA_Lee_RBL (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  8;
	condition	=  DIA_Lee_RBL_Condition;
	information	=  DIA_Lee_RBL_Info;
	important		= 0;
	permanent		= 1;
	description = "Jesteœ potrzebny w Nowym Obozie!";
};                       

FUNC int DIA_Lee_RBL_Condition()
{
	if (lee_back >=1)&&(lee_agree < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBL_Info()
{
	AI_Output (other, self,"DIA_Lee_RBL_15_00"); //Jesteœ potrzebny w Nowym Obozie!
	AI_Output (self, other,"DIA_Lee_RBL_08_01"); //A co tam siê dzieje?

	if (Npc_KnowsInfo(hero,DIA_Torlof_Fight))&&(tor_know == FALSE)
	{
		tor_know = TRUE;
		AI_Output (other, self,"DIA_Lee_RBL_15_02"); //Torlof ma spore problemy. Broni siê ze swoimi ludŸmi w kopalni, ale to d³ugo nie potrwa.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Powiedzia³em Lee o Torlofie.");
	};
	if (lares_cooperate == TRUE)
	{
		lares_cooperate = 2;
		AI_Output (other, self,"DIA_Lee_RBL_15_03"); //Lares ma ju¿ doœæ stania obok. Powiedz tylko s³owo, a pola ry¿owe sp³yn¹ krwi¹.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Lee wie ju¿ o Laresie.");
	};
	if (wolf_cooperate == TRUE)
	{
		wolf_cooperate = false;
		AI_Output (other, self,"DIA_Lee_RBL_15_04"); //Wilk jest gotów by na twój znak rozpêtaæ piek³o w Kotle.
		lee_agree = lee_agree + 1;
		B_LogEntry (CH4_NC_RBLBosses, "Przekaza³em Lee pozdrowienia od Wilka.");
	};
};

//*********************************************************

instance DIA_Lee_RBLBosses (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  9;
	condition	=  DIA_Lee_RBLBosses_Condition;
	information	=  DIA_Lee_RBLBosses_Info;
	important		= 0;
	permanent		= 0;
	description = "Co teraz zrobisz?";
};                       

FUNC int DIA_Lee_RBLBosses_Condition()
{
	if (lee_back == 4)&&(lee_agree == 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLBosses_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_00"); //Co teraz zrobisz?
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_01"); //Muszê siê zastanowiæ.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_02"); //Nie ma na to czasu, tam umieraj¹ ludzie!
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_03"); //To moi ludzie! Wiem, co robiê i nikt nie bêdzie w¹tpi³ w moj¹ lojalnoœæ.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_04"); //Na co chcesz czekaæ?!
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_05"); //Nie jestem idiot¹, nie pobiegnê do Nowego Obozu bez sprawdzenia, co tam siê naprawdê dzieje.
	AI_Output (other, self,"DIA_Lee_RBLBosses_15_06"); //Nie ufasz mi?
	AI_Output (self, other,"DIA_Lee_RBLBosses_08_07"); //Ja nikomu nie ufam. Ale powiem Ci, kiedy bêdê gotów do walki o Nowy Obóz i moich ludzi.
	if (!Npc_KnowsInfo(hero,DIA_Lee_Agree))
	{
		AI_Output (self, other,"DIA_Lee_RBLBosses_08_08"); //Poza tym muszê sp³aciæ d³ug wzglêdem Magów Wody. Dopiero wtedy bêdê móg³ wróciæ do Nowego Obozu.
		B_LogEntry (CH4_RBL_NCRebel, "Lee nie ruszy siê, dopóki nie za³atwi swoich spraw u Magów Wody. Mo¿e warto mu w tym pomóc?");

	};
	//AI_Output (other, self,"DIA_Lee_RBLBosses_15_09"); //Wrócê tu i oby nie by³o za póŸno.
	Log_SetTopicStatus	(CH4_NC_RBLBosses, LOG_SUCCESS);
	B_LogEntry (CH4_NC_RBLBosses, "Lee na coœ czeka, nie chce od razu ruszyæ do ataku. No nic, poza³atwiam swoje sprawy i mo¿e wtedy sytuacja dojrzeje na tyle, ¿e ruszymy do walki.");
	B_LogEntry (CH4_RBL_NCRebel, "Lee chce najpierw sam sprawdziæ, co siê dzieje w Nowym Obozie. Zdaje siê, ¿e nic na to nie poradzê.");
};

instance  DIA_Lee_RBLBosses1 (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  9;
	condition	=  DIA_Lee_RBLBosses1_Condition;
	information	=  DIA_Lee_RBLBosses1_Info;
	important		= 1;
	permanent		= 0;
	description = "Co teraz zrobisz?";
};                       

FUNC int  DIA_Lee_RBLBosses1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_AfterRitual) && Npc_KnowsInfo(hero,DIA_Leren_RitualEnd))
	{
		return 1;
	};
};


FUNC VOID  DIA_Lee_RBLBosses1_Info()
{
	AI_Output (self, other,"DIA_Lee_RBLBosses1_08_00"); //Czas wracaæ na stare œmieci. 
	AI_Output (other, self,"DIA_Lee_RBLBosses1_15_01"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lee_RBLBosses1_08_02"); //Wrócê do Nowego Obozu i wykopiê skurwieli Gomeza a¿ do Myrtany!	
	B_NC_LeeBack();
};

//*********************************************************

instance DIA_Lee_RBLBegin (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  10;
	condition		=  DIA_Lee_RBLBegin_Condition;
	information		=  DIA_Lee_RBLBegin_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC int DIA_Lee_RBLBegin_Condition()
{
	if (Npc_GetDistToWP(self, "NC_RICELORD_SIT") < 600) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_RBLBegin_Info()
{
	/************************
Ork Gorn ma byæ gdzieœ w pobli¿u Lee przez ca³y czas, przyda siê dopiero póŸniej

**********************/

	B_FullStop (hero);
	//AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_01"); //Wróci³em, najwy¿szy czas, ¿eby upuœciæ krwi stra¿nikom.
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_02"); //Cieszy mnie to! Od czego zaczniemy?
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_03"); //My?
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_04"); //Chyba nie myœla³eœ, ¿e nie wezmê udzia³u w takiej jatce? Poza tym stra¿nicy wywo³uj¹ u mnie wzmo¿one parcie na stolec.
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_05"); //Nie pozwolê, ¿ebyœ nabawi³ siê niestrawnoœci. Dobrze wiedzieæ, ¿e mamy Ciê u swego boku.
	AI_Output (self, other,"DIA_Lee_RBLBegin_08_06"); //Porozmawiaj z Laresem, on dok³adnie wprowadzi Ciê w sytuacjê. PóŸniej podejmiemy decyzjê od czego powinniœmy zacz¹æ.
	AI_Output (other, self,"DIA_Lee_RBLBegin_15_07"); //W porz¹dku.
	
   Log_SetTopicStatus	(CH4_RBL_NCRebel, LOG_SUCCESS);
	B_LogEntry (CH4_RBL_NCRebel, "No to zaczê³a siê zabawa. Czas wykopaæ stra¿ników z Nowego Obozu!");

	Log_CreateTopic(CH5_NO_Rebel, LOG_MISSION);
	Log_SetTopicStatus(CH5_NO_Rebel, LOG_RUNNING);
	B_LogEntry(CH5_NO_Rebel, "Walka o Nowy Obóz w³aœnie siê rozpoczê³a. Najwa¿niejsze, ¿e Lee jest z nami, najemnicy i szkodniki pójd¹ za genera³em w ¿ywy ogieñ. Muszê porozmawiaæ z Laresem i dowiedzieæ siê czegoœ wiêcej o aktualnej sytuacji w obozie.");
	
};

//*********************************************************

instance  DIA_Lee_RBLTasks (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  11;
	condition		=  DIA_Lee_RBLTasks_Condition;
	information		=  DIA_Lee_RBLTasks_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co zamierzasz?";
};                       

FUNC int  DIA_Lee_RBLTasks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_WhatNext))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLTasks_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_01"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_02"); //Przede wszystkim musimy po³¹czyæ si³y i uderzyæ na wroga jednoczeœnie z kilku stron.
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_03"); //Zamieniam siê w s³uch.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_04"); //Musimy odci¹æ stra¿ników oblegaj¹cych Orle Gniazdo.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_05"); //Trzeba przedrzeæ siê z niewielkim oddzia³em i pomóc Torlofowi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_06"); //Ktoœ musia³by te¿ przemkn¹æ siê do Wilka i powiedzieæ mu jak wygl¹da sytuacja.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_07"); //Mam ju¿ dwóch dowódców, którzy zg³osili siê na ochotnika. To Lares i Cord.
	AI_Output (other, self,"DIA_Lee_RBLTasks_15_08"); //Nie musisz wiêc szukaæ trzeciego. Co mam zrobiæ?
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_09"); //Mo¿esz pomóc Torlofowi, zakraœæ siê do Wilka albo zamkn¹æ oblê¿enie kasztelu.
	AI_Output (self, other,"DIA_Lee_RBLTasks_08_10"); //Co wybierasz?
	B_LogEntry		(CH5_NO_Rebel, "Szykuje siê niez³a zabawa. Zosta³em dowódc¹ trzeciego oddzia³u, sam muszê wybraæ czym siê zajmê.");

	Info_ClearChoices (DIA_Lee_RBLTasks);
	Info_AddChoice (DIA_Lee_RBLTasks, "Zrobiê niespodziankê Wilkowi.", DIA_Lee_RBLTasks_Wolf);
	Info_AddChoice (DIA_Lee_RBLTasks, "Pomogê Torlofowi, jestem mu to winien.", DIA_Lee_RBLTasks_Torlof);
	Info_AddChoice (DIA_Lee_RBLTasks, "Z przyjemnoœci¹ zajmê siê Fletcherem.", DIA_Lee_RBLTasks_Siege);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Wolf()
{
	task_choice = 1;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Wolf_15_01"); //Zrobiê niespodziankê Wilkowi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_02"); //Tylko uwa¿aj, ¿eby Ciê nie pomyli³ z jakimœ stra¿nikiem.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_03"); //Najlepiej jakbyœ podkrad³ siê pod os³on¹ nocy. Po zmierzchu wartownicy nie s¹ tak czujni jak za dnia. Wtedy ry¿ówka lepiej im smakuje.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_04"); //Powiedz Wilkowi, ¿e sygna³em do ataku bêdzie krzyk harpii.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Wolf_15_05"); //W porz¹dku. A pozosta³e grupy?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Wolf_08_06"); //Cord uderzy na stra¿ników w kopalni, Lares zamknie oblê¿enie stra¿ników. Powodzenia.

	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi robi¹ czystki w kopalni [w sumie najlepiej od razu uœmieræ wszystkich stra¿ników chyba, ¿e chcesz ¿eby gracz widzia³ walkê] 
i laresowi + kilku jego ludzi [zamkniêcie oblegaj¹cych orle gniazdo stra¿ników]
Tutaj Dick nie mo¿e wzi¹æ ze sob¹ najemników ambientów. Zrób rutyny stra¿ników oblegaj¹cych wilka tak, ¿eby mo¿na by³o siê zakraœæ pomiêdzy nimi, ale tylko w nocy. Aha i je¿eli wykryj¹ Dicka podczas skradania siê to misja jest spalona a Dick ma zgin¹æ. Tu nie ma mo¿liwoœci ataku na hura, niech gracze u¿ywaj¹ mózgów po wybraniu tej opcji.
**************************/

	B_LogEntry		(CH5_NO_Wolf, "Wybra³em Wilka. Najlepiej bêdzie przekraœæ siê przez barykady pod os³on¹ nocy. Cord uderzy na kopalni¹, a Lares zajmie siê Orlim Gniazdem.");
   Log_SetTopicStatus	(CH5_NO_Mine, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Guards, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
   // Ork: Nie wiem, chyba tutaj rozpocza³bym muzykê do rebelii, to doœæ
   // d³ugi kawalek wiêc nie powinien przeszkadzaæ:
   BOSSFIGHT_CURRENT = BOSSFIGHT_FGT3;
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Torlof()
{
	task_choice = 2;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Torlof_15_01"); //Pomogê Torlofowi, jestem mu to winien.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_02"); //Rozumiem. Najemnicy z kopalni broni¹ siê ju¿ resztkami si³.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_03"); //Je¿eli siê poœpieszysz mo¿e siê udaæ. WeŸ ze sob¹ kilku najemników.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Torlof_15_04"); //A pozostali?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Torlof_08_05"); //Cord zajmie siê Orlim Gniazdem, a Lares skontaktuje siê z Wilkiem. Powodzenia.


	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi zajmuj¹ pozycje za stra¿nikami, kilka trupów stra¿ników nie zaszkodzi [w sumie najlepiej od razu uœmieræ wszystkich stra¿ników chyba, ¿e chcesz ¿eby gracz widzia³ walkê] 
a Lares niech siê pojawi u Wilka.
Dick mo¿e wzi¹æ ze sob¹ kilku sposród kilkunastu najemników ambientów, którzy s¹ teraz na poddoboziu [tam gdzie ry¿owy ksi¹¿e mia³ chatê i okolice]
Zrób to tak, ¿e kolesie maj¹ ten sam dialog tylko jakaœ zmienna ++ i mo¿e góra 4-5 najemników niech przy³¹czy siê do Dicka

**************************/

	B_LogEntry		(CH5_NO_Mine, "Pomogê Torlofowi, jestem mu to winien. Muszê siê poœpieszyæ. Lee pozwoli³ mi zabraæ kilku najemników. W tym czasie Cord zajmie siê Orlim Gniazdem a Lares skontaktuje siê z Wilkiem.");
   Log_SetTopicStatus	(CH5_NO_Wolf, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Guards, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lee_RBLTasks_Siege()
{
	task_choice = 3;
	AI_Output (other, self,"DIA_Lee_RBLTasks_Siege_15_01"); //Z przyjemnoœci¹ zajmê siê Fletcherem.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_02"); //Fletcher ze spor¹ grup¹ stra¿ników oblega Orle Gniazdo z Hrabi¹ w œrodku.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_03"); //Trzeba ich odci¹æ od Nowego Obozu i ewentualnych posi³ków ze Starego Obozu.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_04"); //Musisz zdobyæ dwa przyczó³ki w pobli¿u Orlego Gniazda i zostawiæ tam naszych ludzi.
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_05"); //WeŸ tylu najemników ilu zdo³asz, dowódcy zajm¹ siê posterunkami.
	AI_Output (other, self,"DIA_Lee_RBLTasks_Siege_15_06"); //Dobrze, a co z reszt¹?
	AI_Output (self, other,"DIA_Lee_RBLTasks_Siege_08_07"); //Cord zajmie siê kopalni¹, a Lares skontaktuje siê z Wilkiem. Powodzenia.


	/************************
Ork musisz tu pozmienia rutyny cordowi + kilku jego ludzi robi¹ czystki w kopalni [w sumie najlepiej od razu uœmieræ wszystkich stra¿ników chyba, ¿e chcesz ¿eby gracz widzia³ walkê]  
a Lares niech siê pojawi u Wilka.
Z dickiem pójdzie 2 dowódców - ka¿dy zagada do dicka, ka¿dy z nich weŸmie ze sob¹ 5 ambientów najemników, którzy s¹ teraz na poddoboziu [tam gdzie ry¿owy ksi¹¿e mia³ chatê i okolice]

**************************/

	B_LogEntry(CH5_NO_Guards, "Wybra³em Fletchera, mam zdobyæ dwa przyczu³ki w pobli¿u Orlego Gniazda. Cord zajmie siê kopalni¹, a Lares skontaktuje siê z Wilkiem. Mogê wzi¹æ tylu najemników, ilu zdo³am.");
   Log_SetTopicStatus	(CH5_NO_Mine, LOG_FAILED);
   Log_SetTopicStatus	(CH5_NO_Wolf, LOG_FAILED);
   Info_ClearChoices (DIA_Lee_RBLTasks);
};

//***************quests****************

//*********************************************************

instance  DIA_Lee_RBLWolf (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  12;
	condition		=  DIA_Lee_RBLWolf_Condition;
	information		=  DIA_Lee_RBLWolf_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Ju¿ za³atwione!";
};                       

FUNC int DIA_Lee_RBLWolf_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Wolf_Sudden))||(Npc_KnowsInfo(hero,DIA_Torlof_Save))||(merc_done == 2)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLWolf_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_01"); //Ju¿ za³atwione!

	if (Npc_KnowsInfo(hero,DIA_Wolf_Sudden))
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_02"); //Rozmawia³em z Wilkiem.
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_03"); //Przekaza³eœ mu jaki jest sygna³ do ataku?
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_04"); //Tak, ca³a sfora bêdzie czekaæ na krzyk harpii.
		Log_SetTopicStatus	(CH5_NO_Wolf, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Wolf, "Plan ataku powoli przybiera konkretny kszta³t. Lee by³ bardzo zadowolony. Oby tylko sfora Wilka cierpliwie czeka³a na sygna³.");
	}
	else if(Npc_KnowsInfo(hero,DIA_Torlof_Save))
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_05"); //Torlof nie mo¿e siê ju¿ doczekaæ kiedy ostatecznie za³atwimy stra¿ników.
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_06"); //I dobrze, to ju¿ nied³ugo.
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_07"); //Kaza³ ciê pozdrowiæ. Na razie zabezpieczy kopalniê i bêdzie czeka³ na rozkaz.
		Log_SetTopicStatus	(CH5_NO_Mine, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Mine, "Plan ataku powoli przybiera konkretny kszta³t. Lee by³ bardzo zadowolony. Torlof ju¿ wkrótce bêdzie móg³ zatañczyæ ze stra¿nikami.");
	}
	else if(merc_done == 2)
	{
		AI_Output (other, self,"DIA_Lee_RBLWolf_15_08"); //Dowódcy najemników s¹ ju¿ z oddzia³ami na miejscu. 
		AI_Output (self, other,"DIA_Lee_RBLWolf_08_09"); //W takim razie Fletcher i Orle Gniazdo s¹ odciête - upiekliœmy dwie pieczenie przy jednym ogniu.
		Log_SetTopicStatus	(CH5_NO_Guards, LOG_SUCCESS);
		B_LogEntry		(CH5_NO_Guards, "Plan ataku powoli przybiera konkretny kszta³t. Lee by³ bardzo zadowolony. Oby tylko najemnicy wytrzymali na posterunkach do czasu ataku.");
	};

	AI_Output (self, other,"DIA_Lee_RBLWolf_08_10"); //To œwietnie. Lares i Cord te¿ wype³nili swoje zadania.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_11"); //Ale coœ jeszcze zosta³o do zrobienia.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_12"); //Tak?
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_13"); //To niebezpieczne i ryzykowne zadanie, dlatego musisz sam zadecydowaæ.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_14"); //Mów do cholery o co chodzi!
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_15"); //Nie mo¿emy pope³niæ tego samego b³êdu co poprzednio. Trzeba zlokalizowaæ ukryte przejœcie i strzec go za wszelk¹ cenê.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_16"); //To nie powinno byæ takie trudne.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_17"); //Obawiam siê, ¿e mo¿esz siê myliæ.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_18"); //Stra¿nicy regularnie organizuj¹ tam przerzuty broni i ludzi. Z tego co wiem, jest tam dobrze ukryty i strze¿ony posterunek.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_19"); //Niestety nikt dok³adnie nie wie, gdzie jest samo przejœcie i gdzie znajduje siê posterunek.
	AI_Output (other, self,"DIA_Lee_RBLWolf_15_20"); //Hmm, rzeczywiœcie nie wygl¹da to ró¿owo.
	AI_Output (self, other,"DIA_Lee_RBLWolf_08_21"); //Wiêc jaka jest twoja decyzja?

	B_LogEntry		(CH5_NO_Rebel, "Nied³ugo uderzymy na stra¿ników. Lee potrzebuje kogoœ do zlokalizowania ukrytej prze³êczy w górach.");
};

//*********************************************************

instance  DIA_Lee_RBLOk (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  13;
	condition		=  DIA_Lee_RBLOk_Condition;
	information		=  DIA_Lee_RBLOk_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Zrobiê to.";
};                       

FUNC int  DIA_Lee_RBLOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLWolf))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLOk_Info()
{
	AI_Output (other, self,"DIA_Lee_RBLOk_15_01"); //Zrobiê to.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_02"); //Œwietnie, musisz tam wyruszyæ niezw³ocznie.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_03"); //Przejœcia szukaj w pobli¿u kopalni, w ka¿dym razie tam uderzyli najpierw.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_04"); //Aha i musisz pójœæ sam. Nie mogê oddaæ ci ¿adnego najemnika, dopóki nie odnajdziesz przejœcia.
	AI_Output (self, other,"DIA_Lee_RBLOk_08_05"); //Niech ci nie przyjdzie do g³owy zgrywaæ bohatera. Jak tylko znajdziesz przejœcie i posterunek wróæ, wyœlê tam ludzi, którzy zajm¹ siê reszt¹.
	AI_Output (other, self,"DIA_Lee_RBLOk_15_06"); //Zobaczê, co da siê zrobiæ. 

	Log_CreateTopic		(CH5_NC_Passage,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_NC_Passage,	LOG_RUNNING);
	B_LogEntry		(CH5_NC_Passage,	"Przed atakiem na stra¿ników Lee chce, ¿ebym odnalaz³ prze³êcz, przez któr¹ wczeœniej przedarli siê stra¿nicy. Muszê odnaleŸæ przejœcie i ukryty tam posterunek, potem mam wróciæ do Lee, on zajmie siê reszt¹. Powinienem zacz¹æ poszukiwania w pobli¿u kopalni.");
//WP: STRAZNICA1-6

   Wld_InsertNpc(EBR_4444_Stern, "STRAZNICA1");
   Wld_InsertNpc(GRD_4446_Gardist , "STRAZNICA2");
   Wld_InsertNpc(Grd_4445_Gardist, "STRAZNICA3");
};

/******************
Ork najlepiej by³oby zrobiæ triggera i kiedy dick znajdzie siê 5m od wejœcie do prze³êczy pojawi siê komunikat, ¿e w³aœnie znalaz³ ukryte przejœcie.
Drugi komunikat pojawi siê kiedy dick zbli¿y siê do posterunku. Aha do posterunku nie mo¿na siê fizycznie dostaæ, niech gracze nie zabijaj¹ tych stra¿ników, maj¹ tylko wróciæ do Lee i zameldowaæ gdzie jest przejœcie i posterunek.
Jak odkryje przejœcie do zmienna passage_know ++ i jak odkryje posterunek to te¿ ja w warunku dam passage_know == 2

*******************/

//*********************************************************

instance DIA_Lee_RBLFound (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  14;
	condition		=  DIA_Lee_RBLFound_Condition;
	information		=  DIA_Lee_RBLFound_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Za³atwione.";
};                       

FUNC int  DIA_Lee_RBLFound_Condition()
{
   var C_NPC Stern; Stern = Hlp_GetNpc(EBR_4444_Stern);
   
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLOk))&&(Npc_IsDead(Stern))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_RBLFound_Info()
{
	var C_NPC fl; fl = Hlp_GetNpc(GRD_255_Fletcher);
	Npc_ExchangeRoutine(fl,"DIE");	
   AI_PlayAni(fl, "s_deadb");
   AI_PlayAni(fl, "s_woundedb");
	fl.attribute[ATR_HITPOINTS]-=fl.attribute[ATR_HITPOINTS]-5;	
	
	var C_NPC gr1; gr1 = Hlp_GetNpc(Grd_659_Gardist);
	Npc_ExchangeRoutine(gr1,"NC1");	
	gr1.attribute[ATR_HITPOINTS]-=gr1.attribute[ATR_HITPOINTS];		
	
	var C_NPC gr2; gr2 = Hlp_GetNpc(Grd_626_Gardist);
	Npc_ExchangeRoutine(gr2,"NC1");		
	gr2.attribute[ATR_HITPOINTS]-=gr2.attribute[ATR_HITPOINTS];	
	
	Log_SetTopicStatus	(CH5_NC_Passage,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Passage,	"Sprawa z prze³êcz¹ za³atwiona. Lee wyœle tam najemników, tym razem stra¿nicy nas nie zaskocz¹.");

	AI_Output (other, self,"DIA_Lee_RBLFound_15_01"); //Za³atwione.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_02"); //Odnalaz³eœ przejœcie?
	AI_Output (other, self,"DIA_Lee_RBLFound_15_03"); //Stra¿nicê te¿ (Rick wyjaœnia dok³adn¹ lokalizacjê)...
	AI_Output (self, other,"DIA_Lee_RBLFound_08_04"); //Natychmiast wyœlê tam najemników.

	/************************************
Ork twoja dzia³a. Zabicie skryptem stra¿ników z tamtej stra¿nicy i wsadzenie tam najemników, tak¿e kilku w samym przejœciu.
hide_clear ();
**********************************/

	AI_Output (self, other,"DIA_Lee_RBLFound_08_05"); //Kiedy Ciê nie by³o, wydarzy³o siê coœ... nieoczekiwanego.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_06"); //Co tym razem?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_07"); //W Orlim GnieŸdzie rozgorza³a walka. Nie wiemy dok³adnie co siê sta³o, ale by³o ostro.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_08"); //Fletcher i jego ludzie zamiast zaatakowaæ chcieli uciekaæ, ale najemnicy zdrowo ich przetrzebili.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_09"); //Fletcher z niedobitkami stra¿ników przebi³ siê i broni¹ siê teraz na grani w pobli¿u tunelu prowadz¹cego do kopalni.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_10"); //Do Orlego Gniazda nadal nie mo¿emy wejœæ. Najdziwniejsze jest to, ¿e sto³p wygl¹da na opustosza³y. Trzeba coœ wymyœliæ, ¿eby dowiedzieæ siê co siê sta³o z Hrabi¹ i jego ludŸmi.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_11"); //Masz jakiœ pomys³?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_12"); //Trzeba dorwaæ Fletchera, mo¿e on wie coœ wiêcej.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_13"); //Szkoda jednak traciæ dobrych ludzi. Grani ³atwo siê broni, kilku ludzi z ³ukami i kuszami bez problemów powstrzyma spory oddzia³. Znajdziesz tam Gorna i jego oddzia³, od niego dowiesz siê wiêcej.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_14"); //Rozumiem, ¿e wolisz wys³aæ i ewentualnie straciæ tylko jednego szaleñca?
	AI_Output (self, other,"DIA_Lee_RBLFound_08_15"); //Nie mam wyboru. Ale negocjacje nie wchodz¹ w rachubê.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_16"); //Potrzebujemy g³owy Fletchera, tylko najpierw musisz wydusiæ z niego wszystko, co wie o Orlim GnieŸdzie i tym co siê tam wydarzy³o.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_17"); //A jak mam siê tam dostaæ? Nie wdrapiê siê nawet na grañ, bo podziurawi¹ mnie be³tami.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_18"); //Spróbuj pójœæ w nocy, kto wie, mo¿e uda Ci siê przemkn¹æ w pobli¿u stra¿ników.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_19"); //Œwietna rada... No dobra, spróbujê.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_20"); //Wiedzia³em, ¿e siê skusisz. Czasami wydaje mi siê, ¿e... szukasz œmierci.
	AI_Output (other, self,"DIA_Lee_RBLFound_15_21"); //To raczej ona szuka mnie. Na szczêœcie jak do tej pory, bezskutecznie.
	AI_Output (self, other,"DIA_Lee_RBLFound_08_22"); //Powodzenia na szlaku, Rick.

	/************************
Kolejny mi¹ch. Zrób tak, ¿eby siê wydawa³o, ¿e pod murami gniazda rozegra³a siê za¿arta walka, zabij wiêkszoœæ ze stra¿ników i z po³owê najemników, cia³ powinno byæ sporo.
Fletchera wyrutynuj na skarpê po prawej stronie jak siê idzie do kopalni z nowego obozu, wchodzi siê tam po tych du¿ych stopniach. W pobli¿u skarpy niech siê znajdzie kilku najemników, w tym gorn który dowodzi t¹ grup¹.
Niespodzianka ma byæ taka, ¿e wszyscy stra¿nicy nie ¿yj¹, a Fletcher ledwo zipie - zabij kilku stra¿ników na tej grani a fletchera powa¿nie rañ, ale z do³u ma tego nie byæ widaæ. Aha a pod grani¹ na drodze do kopalni daj z kilka cia³ najemników, ¿e niby zaatakowali bez rezultatu.

fletcher_escape ();
**********************/
	B_LogEntry		(CH5_NO_Rebel, "Przejœcie jest ju¿ zabezpieczone przez najemników.");

	Log_CreateTopic(CH5_NC_TheRock,	LOG_MISSION);
	Log_SetTopicStatus(CH5_NC_TheRock,	LOG_RUNNING);
	B_LogEntry(CH5_NC_TheRock,	"Pod moj¹ nieobecnoœæ coœ siê wydarzy³o w Orlim GnieŸdzie. Nawet Fletcher tak siê przerazi³, ¿e nie bacz¹c na nic przebi³ siê przez najemników i z resztk¹ stra¿ników zaszy³ siê na grani po drodze do kopalni. Muszê dowiedzieæ siê od Fletchera, ile tylko zdo³am o tym, co siê sta³o w sto³pie i dlaczego kasztel wygl¹da na opuszczony. Lee zasugerowa³, ¿e po rozmowie powinienem raz na zawsze pozbyæ siê Fletchera.");
	
   var C_NPC gorn; gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"WATCH");
   
	B_NC_Free();
};

//*********************************************************

instance  DIA_Lee_Convoys (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_Convoys_Condition;
	information		=  DIA_Lee_Convoys_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC int  DIA_Lee_Convoys_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLTasks))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Convoys_Info()
{
	AI_Output (self, other,"DIA_Lee_Convoys_08_01"); //Aha, jeszcze coœ.
	AI_Output (other, self,"DIA_Lee_Convoys_15_02"); //Tak?
	AI_Output (self, other,"DIA_Lee_Convoys_08_03"); //Porozmawiaj z Cordem. Dorwaliœmy jednego ze stra¿ników. Zanim wyzion¹³ ducha zacz¹³ coœ krzyczeæ o konwojach z broni¹.
	AI_Output (self, other,"DIA_Lee_Convoys_08_04"); //Cord mia³ siê tym zaj¹æ, ale potrzebuje do pomocy kogoœ z g³ow¹ na karku.
	AI_Output (other, self,"DIA_Lee_Convoys_15_05"); //Dobra, porozmawiam z Cordem.

	B_LogEntry		(CH5_NO_Rebel, "Cord potrzebuje pomocy z jakimiœ konwojami. Warto z nim porozmawiaæ.");

	Log_CreateTopic		(CH5_NC_Convoys,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_RUNNING);
	B_LogEntry		(CH5_NC_Convoys,	"Cord potrzebuje kogoœ do pomocy w sprawie konwojów ze Starego Obozu. Powinienem z nim porozmawiaæ.");
};

//*********************************************************

instance  DIA_Lee_TheRock (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  15;
	condition		=  DIA_Lee_TheRock_Condition;
	information		=  DIA_Lee_TheRock_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Rozmawia³em z Fletcherem.";
};                       

FUNC int  DIA_Lee_TheRock_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gorn_TheRockback))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_TheRock_Info()
{
	AI_Output (other, self,"DIA_Lee_TheRock_15_01"); //Rozmawia³em z Fletcherem.
	AI_Output (self, other,"DIA_Lee_TheRock_08_02"); //Nie s¹dzi³em, ¿e dopadniesz go ¿ywego. Powiedzia³ coœ ciekawego?
	AI_Output (other, self,"DIA_Lee_TheRock_15_03"); //(Rick streszcza Lee to co us³ysza³ od Fletchera)
	AI_Output (self, other,"DIA_Lee_TheRock_08_04"); //Cholera, nie dobrze. Myœla³em, ze Hrabia i Kruk stoj¹ po tej samej stronie barykady.
	AI_Output (self, other,"DIA_Lee_TheRock_08_05"); //Kruk to najbardziej niebezpieczny z magnatów. Wbrew pozorom to jego trzeba siê baæ, nie Gomeza.
	AI_Output (self, other,"DIA_Lee_TheRock_08_06"); //Musisz dalej w to brn¹æ. W miêdzyczasie znalaz³em w skrzyni runê. Byæ mo¿e ci siê przyda.
   
   Create_and_give(TheRockTP, 1);
   
   AI_Output (other, self,"DIA_Lee_TheRock_08_07"); //Dziêki. Teraz tylko teleportowaæ siê do Orlego Gniazda.
	AI_Output (self, other,"DIA_Lee_TheRock_08_08"); //Sytuacja w obozie jest ju¿ stabilna, rozprawiliœmy siê z reszt¹ stra¿ników.

	/*************************

Ork idealna by³aby funkcja sprawdzaj¹ca czy któryœ ze stra¿ników z NO jeszcze ¿yje, jak tak to tutaj go skilluj

***************************/
	AI_Output (self, other,"DIA_Lee_TheRock_08_09"); //Dowiedz siê, co knuje Kruk i co wydarzy³o siê w Orlim GnieŸdzie. Nie mo¿emy pod w³asnym nosem chowaæ puszki Beliara.
	AI_Output (other, self,"DIA_Lee_TheRock_15_10"); //Wrócê, jak dowiem siê czegoœ wiêcej.
	//B_LogEntry		(CH5_NC_TheRock,	"Czas poszukaæ kufra Hrabiego w by³ej siedzibie Magów Wody i sprawdziæ co w nim znajdê.");
   B_LogEntry(CH5_NC_TheRock,	"Poinformowa³em Lee, co siê sta³o na grani, a on znalaz³ dla mnie runê do Orlego Gniazda. Czas spotkaæ siê z Hrabi¹!");
   
   B_ExchangeRoutine(grd_4010_hrabia,"start");
};

//*********************************************************

instance  DIA_Lee_TheRockCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  16;
	condition		=  DIA_Lee_TheRockCompleated_Condition;
	information		=  DIA_Lee_TheRockCompleated_Info;
	important		= 0;
	permanent		= 0;
	description 		= "By³em w Orlim GnieŸdzie.";
};                       

FUNC int  DIA_Lee_TheRockCompleated_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_TheRock))&&(Npc_KnowsInfo(hero,DIA_Hrabia_TheRock))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_TheRockCompleated_Info()
{
	var C_NPC hr; hr = Hlp_GetNpc(GRD_4010_Hrabia);

	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_01"); //By³em w Orlim GnieŸdzie.
	//AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_02"); //Jak siê tam dosta³eœ?
	//AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_03"); //W kufrze Hrabiego znalaz³em runê teleportacyjn¹.
	//AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_04"); //Coœ jeszcze?
   AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_04"); //Jak wygl¹da tam sytuacja?
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_05"); //Trupy stra¿ników i demony. Zdaje siê, ¿e Kruk by³ tam przede mn¹ i poszczu³ stra¿ników swoimi pupilkami.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_06"); //A Hrabia?
	
   if (Npc_IsDead(hr))
	{
		AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_07"); //Martwy.
	}
	else
	{
		AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_08"); //Dogada³em siê z nim. Wspólnie dobierzemy siê do Kruka.
		AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_09"); //Pewnie wiesz, co robisz, ale uwa¿aj na niego, to szczwany lis.
	};
   
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_10"); //Krata do Orlego Gniazda jest zablokowana, nikt stamt¹d nie wyjdzie, ani tym bardziej nikt tam nie wejdzie.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_11"); //Tym zajmiemy siê póŸniej. Na razie postawiê przed bram¹ kilku najemników.

	/*******************
Ork daj tam 2 najemników, znaczy zmieñ rutyny jakimœ 2 ambientom
******************/

	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_12"); //Zrobi³eœ wiêcej ni¿ od Ciebie oczekiwa³em.
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_13"); //Jak to wszystko siê skoñczy, usi¹dziemy i schlejemy siê w sztok. Oczywiœcie na twój rachunek.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_14"); //Masz to jak w myrtañskim banku.
	AI_Output (self, other,"DIA_Lee_TheRockCompleated_08_15"); //Aha, mam jeszcze jedn¹ proœbê. Powiedz Saturasowi, ¿e Nowy Obóz znowu jest bezpieczny. Je¿eli magowie chc¹, mog¹ wróciæ na stare œmieci.
	AI_Output (other, self,"DIA_Lee_TheRockCompleated_15_16"); //W porz¹dku, bywaj.
   
   Log_SetTopicStatus(CH5_NC_TheRock, LOG_SUCCESS);
   B_LogEntry		(CH5_NC_TheRock, "Lee dowiedzia³ siê, co siê wydarzy³o w Orlim GnieŸdzie.");
	B_LogEntry		(CH5_NO_Rebel, "Orle Gniazdo jest ju¿... zamkniête.");

	/******************************

Ork idealnie by³oby choæ czêœæiowo odtworzyæ porz¹dek w NO sprzed ataku stra¿ników. Niech chocia¿ g³ówni NPCe wróc¹ do swoich startowych ruty.

*******************************/

	//merc_start ();
};

//*********************************************************

instance  DIA_Lee_ConvoysCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  17;
	condition		=  DIA_Lee_ConvoysCompleated_Condition;
	information		=  DIA_Lee_ConvoysCompleated_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Pomog³em Cordowi z konwojami.";
};                       

FUNC int  DIA_Lee_ConvoysCompleated_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Cord_ConvoyConvoyTrapEnd))||(Npc_KnowsInfo(hero,DIA_Cord_ConvoyTrapEnd1)))
	&&(Npc_KnowsInfo(hero,DIA_Lee_Convoys))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_ConvoysCompleated_Info()
{
	AI_Output (other, self,"DIA_Lee_ConvoysCompleated_15_01"); //Pomog³em Cordowi z konwojami.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_02"); //Wiedzia³em, ¿e jesteœ w³aœciw¹ osob¹ do tego zadania.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_03"); //Cord na pewno odpowiednio doceni³ Twoje wysi³ki.
	AI_Output (other, self,"DIA_Lee_ConvoysCompleated_15_04"); //Mo¿na tak powiedzieæ.
	AI_Output (self, other,"DIA_Lee_ConvoysCompleated_08_05"); //Dobrze mieæ Ciê po swojej stronie, Rick.
	B_LogEntry(CH5_NO_Rebel, "Sprawa Corda by³a bardziej z³o¿ona ni¿ podejrzewa³em, ale mam to ju¿ za sob¹.");
};

//*********************************************************

instance  DIA_Lee_MagsBack (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_MagsBack_Condition;
	information		=  DIA_Lee_MagsBack_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Rozmawia³em z Saturasem.";
};                       

FUNC int  DIA_Lee_MagsBack_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_GoBackNC))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_MagsBack_Info()
{
	AI_Output (other, self,"DIA_Lee_MagsBack_15_01"); //Rozmawia³em z Saturasem.
	AI_Output (self, other,"DIA_Lee_MagsBack_08_02"); //Wiem, te¿ siê z nim widzia³em. Dobrze, ¿e wszystko wróci³o do starego porz¹dku.
};

//*********************************************************

instance  DIA_Lee_AllCompleated (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  18;
	condition		=  DIA_Lee_AllCompleated_Condition;
	information		=  DIA_Lee_AllCompleated_Info;
	important		= 1;
	permanent		= 0;
	description 	= ".";
};                       

FUNC int  DIA_Lee_AllCompleated_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_ConvoysCompleated))&&(Npc_KnowsInfo(hero,DIA_Lee_TheRockCompleated))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_AllCompleated_Info()
{
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_01"); //Zrobi³eœ dla nas wiêcej ni¿ œmia³em oczekiwaæ. Zaskakujesz mnie, piracie.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_02"); //Sam siê zaskakujê. Nigdy bym nie przypuszcza³, ¿e znajdê tu... przyjació³.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_03"); //Nic nie dzieje siê bez powodu, Rick. Obyœmy do¿yli lepszych czasów.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_04"); //Nie mam zamiaru opowiadaæ swoich przygód wnukom, wystarczy, ¿e sam mam koszmary.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_05"); //Mimo wszystko warto coœ po sobie zostawiæ, przyjacielu.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_06"); //Cz³owiek umiera dwa razy...
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_07"); //Pierwszy raz, gdy przestanie biæ serce.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_08"); //Drugi raz, kiedy ginie pamiêæ o nim i jego czynach.
	AI_Output (other, self,"DIA_Lee_AllCompleated_15_09"); //Zapamiêtam to, Lee. Bywaj.
	AI_Output (self, other,"DIA_Lee_AllCompleated_08_10"); //Do nastêpnego razu, piracie.

	Log_SetTopicStatus(CH5_NO_Rebel, LOG_SUCCESS);
	B_LogEntry(CH5_NO_Rebel, "Nowy Obóz znowu jest wolny od stra¿ników. Sporo mnie to kosztowa³o wysi³ku, ale by³o warto.");

	B_LogEntry (CH4_RBL_NCRebel, "W Nowym Obozie zapanowa³ stary porz¹dek. Czas porozmawiaæ z Cavalornem.");
	B_Kapitelwechsel(6);	 

	// Ork: Tutaj koniec? No chyba:
	BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
};

//*********************************************************

instance  DIA_Lee_Urt (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  20;
	condition		=  DIA_Lee_Urt_Condition;
	information		=  DIA_Lee_Urt_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Znasz stra¿nika o imieniu Urt?";
};                       

FUNC int DIA_Lee_Urt_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lee_Urt_Info()
{
	AI_Output (other, self,"DIA_Lee_Urt_15_01"); //Znasz stra¿nika o imieniu Urt?
	AI_Output (self, other,"DIA_Lee_Urt_08_02"); //Nigdy o nim nie s³ysza³em.
	AI_Output (other, self,"DIA_Lee_Urt_15_03"); //A imiê... Urthos coœ ci mówi?
	AI_Output (self, other,"DIA_Lee_Urt_08_04"); //Hmm... By³ kiedyœ ktoœ w królewskiej gwardii o takim imieniu.
	AI_Output (self, other,"DIA_Lee_Urt_08_05"); //Z tego co pamiêtam zdaje siê, ¿e by³ zamieszany w kradzie¿ klejnotów koronnych.
	AI_Output (self, other,"DIA_Lee_Urt_08_06"); //Król rozkaza³ straciæ wszystkich, którzy brali udzia³ w tym procederze. Tylko Urthos zdo³a³ zbiec, to podobno on by³ przywódc¹ szajki.
	AI_Output (self, other,"DIA_Lee_Urt_08_07"); //Dlaczego pytasz?
	AI_Output (other, self,"DIA_Lee_Urt_15_08"); //Urt, jeden ze stra¿ników, a zarazem rebeliant odpowiedzialny za stworzenie siatki dywersyjnej w Starym Obozie to w³aœnie Urthos.
	AI_Output (self, other,"DIA_Lee_Urt_08_09"); //No proszê, jaki ten œwiat ma³y. W koñcu trafi³ tam gdzie jego miejsce.
	AI_Output (other, self,"DIA_Lee_Urt_15_10"); //Podejrzewam, ¿e móg³ nas zdradziæ. Nie mam niezbitych dowodów, tylko poszlaki. Co o tym myœlisz?
	AI_Output (self, other,"DIA_Lee_Urt_08_11"); //Urthos to cwane bydlê. W gwardii dos³u¿y³ siê porucznika. By³ jednak zbyt zach³anny i to go zgubi³o.
	AI_Output (self, other,"DIA_Lee_Urt_08_12"); //Chocia¿ plan kradzie¿y obmyœli³ bardzo b³yskotliwie... Na pewno nadaje siê do sabota¿u.
	AI_Output (self, other,"DIA_Lee_Urt_08_13"); //Obawiam siê jednak, ¿e móg³by byæ z niego niez³y materia³ na zdrajcê. Dla niego liczy siê tylko z³oto, ruda i wszystko na czym móg³by zarobiæ.
	AI_Output (other, self,"DIA_Lee_Urt_15_14"); //Zaufa³byœ mu?
	AI_Output (self, other,"DIA_Lee_Urt_08_15"); //Nigdy w ¿yciu. Uwa¿aj na niego, Rick.
	AI_Output (other, self,"DIA_Lee_Urt_15_16"); //Dziêki, Lee. To w³aœnie chcia³em us³yszeæ.
	
   B_LogEntry(CH6_RBL_Spy, "Lee potwierdzi³ wersjê Ciphera. Dodatkowo powiedzia³ mi, ¿e Urthosowi nie mo¿na zaufaæ. Muszê zdobyæ niepodwa¿alne dowody. Mo¿e znajdê jakiegoœ ¿ywego œwiadka?");
}; 

INSTANCE DIA_Lee_CanYouTeachMe (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= DIA_Lee_CanYouTeachMe_Condition;
	information		= DIA_Lee_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Lee_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe_12_02"); //Wiem sporo o dwurêcznej broni, mogê podzieliæ siê t¹ wiedz¹.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Lee nauczy mnie jak po mistrzowsku w³adaæ dwurêcznym orê¿em.");
};

INSTANCE DIA_Lee_CanYouTeachMe1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= DIA_Lee_CanYouTeachMe1_Condition;
	information		= DIA_Lee_CanYouTeachMe1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzia³eœ kiedyœ miecz runiczny?"; 
};

FUNC INT DIA_Lee_CanYouTeachMe1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID DIA_Lee_CanYouTeachMe1_Info()
{
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe1_15_01"); //Widzia³eœ kiedyœ miecz runiczny?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_02"); //Nie, ale s³ysza³em, ¿e to potê¿na broñ.
	AI_Output (other, self, "DIA_Lee_CanYouTeachMe1_15_03"); //Wiesz jak ni¹ w³adaæ?
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_04"); //Na twoje szczêœæie, tak.
	AI_Output (self, other, "DIA_Lee_CanYouTeachMe1_12_05"); //S³uchaj uwa¿nie, bo nie bêdê powtarza³...	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Lee nauczy mnie jak w³adaæ mieczem runicznym.");
};