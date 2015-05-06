// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_309_Whistler_Exit (C_INFO)
{
	npc			= HUN_309_Whistler;
	nr			= 999;
	condition	= DIA_HUN_309_Whistler_Exit_Condition;
	information	= DIA_HUN_309_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_309_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_309_Whistler_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_309_Whistler_Hello (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 1;
	condition		= DIA_HUN_309_Whistler_Hello_Condition;
	information		= DIA_HUN_309_Whistler_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_HUN_309_Whistler_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_309_Whistler_Hello_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Hello_11_02"); //O, nowa twarz. Witam w obozie tych, no... rebeliantów.
};

// **************************************************

INSTANCE DIA_HUN_309_Whistler_Ask (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 2;
	condition		= DIA_HUN_309_Whistler_Ask_Condition;
	information		= DIA_HUN_309_Whistler_Ask_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co myœlisz o rebeliantach?"; 
};

FUNC INT DIA_HUN_309_Whistler_Ask_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_Ask_Info()
{
	whistler_list = FALSE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_01"); //Co myœlisz o rebeliantach?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_02"); //A co mam myœleæ? Jak ka¿dy w tej cholernej Kolonii chc¹ prze¿yæ.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_03"); //Od reszty ró¿nimy siê tylko tym, ¿e mniej lub bardziej nie odpowiada nam 'klimat' panuj¹cy w pozosta³ych obozach.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_04"); //Czyli do³¹czenie do was to dobry wybór?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_05"); //Tak samo dobry jak przy³¹czenie siê do Gomeza, palenie trawki u sekciarzy, czy w³a¿enie w dupê magom wody.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_06"); //Nie ma innej alternatywy?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_07"); //Ale¿ jest. Mo¿e jakiœ ork pomyli Ciê z samic¹ w czasie rui, he, he.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_08"); //Podstawowa zasada jest taka - w kupie si³a. Dlatego te¿ powsta³y obozy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_09"); //W pojedynkê nikt nie prze¿yje w Kolonii zbyt d³ugo.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_10"); //Rozumiem, ¿e z jakiegoœ powodu wybra³eœ akurat ten obóz?
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_11"); //Oglêdnie mówi¹c, tak.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_12"); //Coœ Ciê nie kojarzê. Musia³eœ niedawno trafiæ do Kolonii. Zreszt¹ niewa¿ne...
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_13"); //Skoro chcesz staæ siê jednym z nas, musisz udowodniæ lojalnoœæ i przydatnoœæ oczywiœcie.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_14"); //Dla mnie s³owo przydatnoœæ oznacza kogoœ, kto pomo¿e mi coœ zdobyæ.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_15"); //Zamieniam siê w s³uch.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_16"); //Bo widzisz. Kolekcjonujê miecze.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_17"); //Ale nie wszystkie. Jestem jak to mówi¹ magowie - estet¹. Lubiê dobr¹ robotê po³¹czon¹ ze sztuk¹.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_18"); //Zdoby³em receptê na wspania³y miecz - pawie pióro. Nie mam jednak sk³adników potrzebnych do wykucia broni.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_19"); //Przez te cholerne obowi¹zki i niebezpieczeñstwo ataku ze strony Gomeza jestem tu udupiony.
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_20"); //Niech zgadnê. Szukasz frajera, który przyniesie Ci potrzebne sk³adniki.
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_21"); //Domyœlny jesteœ. To jak bêdzie?
	AI_Output (other, self, "DIA_HUN_309_Whistler_Ask_15_22"); //Raczej nie mam wyboru. Co to za sk³adniki?
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_23"); //Tu masz listê i 200 bry³ek rudy na wydatki.
	
   CreateInvItems (self,whistlerlist,1);//lista
	B_GiveInvItems (self, other, whistlerlist, 1);
	CreateInvItems (self,ItMiNugget,200);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 200);
   
	AI_Output (self, other, "DIA_HUN_309_Whistler_Ask_11_24"); //Wróæ tak szybko, jak tylko siê da. Nie mogê siê ju¿ doczekaæ tego miecza...
	
   Log_CreateTopic(CH1_Rbl_Sword, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Sword, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Sword, "Œwistak wstawi siê za mn¹, jak zdobêdê wszystkie sk³adniki niezbêdne do wykucia miecza zwanego pawim piórem. Da³ mi listê sk³adników i 200 bry³ek na wydatki.");
};

// **************************************************
var int whistler_approve;

INSTANCE DIA_HUN_309_Whistler_List (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 3;
	condition		= DIA_HUN_309_Whistler_List_Condition;
	information		= DIA_HUN_309_Whistler_List_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam pytanie co do listy."; 
};

FUNC INT DIA_HUN_309_Whistler_List_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_Ask))&&(whistler_list == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_List_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_01"); //Mam pytanie co do listy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_02"); //A Ty jeszcze tu jesteœ? Nie potrafisz czytaæ?
	AI_TurnAway(other, self);
	B_UseFakeScroll(other);
   AI_WhirlAround(other, self);
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_03"); //Nie mam problemów z odczytaniem listy, tylko zastanawiam siê po co Ci ser i wódka do wykucia miecza?
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_04"); //A co Ciê to obchodzi?
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_05"); //Obchodzi, skoro mam biegaæ za tym po ca³ej Kolonii.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_06"); //To pos³uchaj. Ty chcesz do³¹czyæ do rebeliantów.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_07"); //Ja chcê wykuæ wspania³y miecz i przy okazji nape³niæ brzuch bez ruszania siê z miejsca.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_08"); //Czy wyrazi³em siê wystarczaj¹co jasno?
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_15_09"); //A¿ za.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_11_10"); //To jak bêdzie? Poszukasz sk³adników, czy tylko tracisz mój czas?

	Info_ClearChoices (DIA_HUN_309_Whistler_List);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "W porz¹dku, poszukam sk³adników.", DIA_HUN_309_Whistler_List_Yes);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "Nie jestem idiot¹, poszukaj innego frajera.", DIA_HUN_309_Whistler_List_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_309_Whistler_List_Yes()
{
	whistler_approve = TRUE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_Yes_15_01"); //W porz¹dku, poszukam sk³adników.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_Yes_07_02"); //To co tu jeszcze robisz?
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_Yes_07_03"); //Tylko, ¿eby ¿arcie by³o œwie¿e!
	
   B_LogEntry(CH1_Rbl_Sword, "Zgodzi³em siê na przyniesienie WSZYSTKICH sk³adników z listy. Odnoszê dziwne wra¿enie, ¿e Œwistak wykorzystuje sytuacjê, ale robiê to ostatni raz!");
	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_HUN_309_Whistler_List_No()
{
	whistler_approve = FALSE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_15_01"); //Nie jestem idiot¹, poszukaj innego frajera.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_02"); //Niech Ciê szlag trafi! Wynoœ siê pókim dobry.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_03"); //Mo¿esz byæ pewien, ¿e Cavalorn nie us³yszy ode mnie dobrego s³owa na Twój temat...
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_07_04"); //A teraz oddaj moj¹ rudê!
	
	Info_ClearChoices (DIA_HUN_309_Whistler_List);
	Info_AddChoice (DIA_HUN_309_Whistler_List, "Nie mam ¿adnej rudy.", DIA_HUN_309_Whistler_List_No_NoOre);
	
   if(Npc_HasItems(other,itminugget)>=200)
	{
		Info_AddChoice (DIA_HUN_309_Whistler_List, "Bierz te swoje bry³ki.", DIA_HUN_309_Whistler_List_No_GiveBackOre);
	};

	B_LogSetTopicStatus(CH1_Rbl_Sword, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Sword, "Nie mam zamiaru robiæ za ch³opca na posy³ki. Niech Œwistak sam sobie poszuka idioty, który spe³ni jego kulinarne zachcianki.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "No nic, Œwistak raczej mnie nie poprze.");
	B_StopProcessInfos(self); 
};

func void DIA_HUN_309_Whistler_List_No_GiveBackOre()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_GiveBackOre_15_01"); //Bierz te swoje bry³ki.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_GiveBackOre_07_02"); //Twoje szczêœcie.
	B_GiveInvItems (other, self, ItMiNugget, 200);
};

func void DIA_HUN_309_Whistler_List_No_NoOre()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_No_NoOre_15_01"); //Nie mam tej rudy.
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_02"); //Jak to nie masz?!
	AI_GotoNpc(self,other);
	AI_PlayAni(self,"T_PLUNDER");
   
	if(Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_03"); //Cholerny k³amca! Upuszczê Ci za to krwi...
		B_GiveInvItems (other, self, ItMiNugget, 200);
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_No_NoOre_07_04"); //Ty cholerny z³odzieju. Upuszczê Ci za to krwi...
	};
	
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);		
};			
// **************************************************

var int whistler_compleated;

INSTANCE DIA_HUN_309_Whistler_List_All (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 5;
	condition		= DIA_HUN_309_Whistler_List_All_Condition;
	information		= DIA_HUN_309_Whistler_List_All_Info;
	permanent		= 1;
	important		= 0;
	description		= "Znalaz³em wszystkie sk³adniki!"; 
};

FUNC INT DIA_HUN_309_Whistler_List_All_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_309_Whistler_List))&&(whistler_approve == TRUE)&&(whistler_compleated == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_List_All_Info()
{
	AI_Output (other, self, "DIA_HUN_309_Whistler_List_All_15_01"); //Znalaz³em wszystkie sk³adniki z listy!
	AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_02"); //Czy aby na pewno?
	
   if ((NPC_HasItems(other,ItMa_Iron)>=2)&&(NPC_HasItems(other,ItMa_Steel)>=1)&&(NPC_HasItems(other,ItMa_carbon)>=2)&&(NPC_HasItems(other,ItMa_Goodlumber)>=1)&&(NPC_HasItems(other,ItFoBeer)>=6)&&(NPC_HasItems(other,ItFo_Addon_Grog)>=2)&&(NPC_HasItems(other,ItFoCheese)>=2)&&(NPC_HasItems(other,ItFoMutton)>=6))
	{
		whistler_compleated = TRUE;
		B_GiveXP(500);
      
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_03"); //Rzeczywiœcie, œwietna robota. 
		
      B_GiveInvItems (other, self, ItMa_Iron, 2);
		B_GiveInvItems (other, self, ItMa_Steel, 1);
		B_GiveInvItems (other, self, ItMa_carbon, 2);
		B_GiveInvItems (other, self, ItMa_Goodlumber, 1);
		B_GiveInvItems (other, self, ItFoBeer, 6);
		B_GiveInvItems (other, self, ItFo_Addon_Grog, 2);
		B_GiveInvItems (other, self, ItFoCheese, 2);
		B_GiveInvItems (other, self, ItFoMutton, 6);
		
      AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_04"); //Muszê najpierw sprawdziæ 'jakoœæ' sk³adników...
		
      if (C_BodystateContains(self, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (self, other);
		};
      
		CreateInvItem (self,ItFobeer); 
		
		AI_UseItem (self,ItFobeer); 
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_05"); //Wyborne piwo, zdaje siê, ¿e korzenne, wyczuwam delikatny posmak moczu cieniostwora!
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_06"); //A wracaj¹c do pawiego pióra...
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_07"); //Widzisz mam ju¿ wszystko, prócz umiejêtnoœci wytworzenia tego wspania³ego ostrza.
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_08"); //Poczekaj chwilê. Zapakujê sk³adniki do worka...
		
      B_LogEntry(CH1_Rbl_Sword, "Dostarczy³em Œwistakowi wszystkie sk³adniki. Najpierw wypi³ piwo, a póŸniej powiedzia³, ¿e i tak nie da rady zrobiæ z nich miecza!");

		AI_PlayAni(self, "T_PLUNDER");
		AI_TurnToNpc (self, other); 	
		AI_SetWalkmode (self,NPC_RUN); 	
		AI_GotoNpc (self, other);
	}
	else
	{	
		AI_Output (self, other, "DIA_HUN_309_Whistler_List_All_11_09"); //Nie wydaje mi siê. Szukaj dalej... pieseczku.
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_HUN_309_Whistler_GoBring (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 5;
	condition		= DIA_HUN_309_Whistler_GoBring_Condition;
	information		= DIA_HUN_309_Whistler_GoBring_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_HUN_309_Whistler_GoBring_Condition()
{
	if (Npc_RefuseTalk(self)==FALSE) && (whistler_compleated == TRUE)  && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_Whistler_GoBring_Info()
{
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_01"); //Proszê, oto pakunek ze wszystkimi sk³adnikami potrzebnymi do wykucia pawiego pióra.
	
   CreateInvItems (self,whistler_pack,1);//paczka z czêœciami
	B_GiveInvItems (self, other, whistler_pack, 1);

	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_15_02"); //I co ja niby mam z tym zrobiæ do cholery?!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_03"); //Jak to co? ZnaleŸæ kowala, który wykuje miecz moich marzeñ!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_04"); //U³atwiê Ci zadanie. Porozmawiaj z Aidanem, on zna moje potrzeby i wie jak wykuæ dobre ostrze.
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_11_05"); //To jak bêdzie?

	Info_ClearChoices (DIA_HUN_309_Whistler_GoBring);
	Info_AddChoice (DIA_HUN_309_Whistler_GoBring, "Ale to ju¿ ostatni raz!", DIA_HUN_309_Whistler_GoBring_Yes);
	Info_AddChoice (DIA_HUN_309_Whistler_GoBring, "Mam tego doœæ!", DIA_HUN_309_Whistler_GoBring_No);
	
   Npc_ExchangeRoutine(self,"OR");
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_309_Whistler_GoBring_Yes()
{
	whistler_last_approve = TRUE;
   
	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_Yes_15_01"); //Ale to ju¿ ostatni raz!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_Yes_07_02"); //Podj¹³eœ s³uszn¹ decyzjê. Sztuka zaklêta w ch³odnym ostrzu unu¿anym we krwi... Czujê dreszcz podniecenia!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_Yes_07_03"); //A teraz idŸ ju¿ po mój œliczny miecz!
	
   B_LogEntry(CH1_Rbl_Sword, "Znowu robiê za pos³añca. Tym razem muszê zanieœæ sk³adniki niezbêdne do wykucia miecza Aidanowi. Mam nadziejê, ¿e Œwistak ju¿ nic wiêcej nie wymyœli.");
	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_HUN_309_Whistler_GoBring_No()
{
	whistler_approve = FALSE;
   
	B_GiveInvItems (other, self, whistler_pack, 1);
	Npc_RemoveInvItems(self,whistler_pack,1);
	
   AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_No_15_01"); //Mam tego doœæ!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_No_07_02"); //Nie mo¿esz teraz tak mnie zostawiæ?! Musisz mi pomóc!
	AI_Output (other, self, "DIA_HUN_309_Whistler_GoBring_No_15_03"); //Nic nie muszê! RadŸ sobie sam. A jak masz z tym problem, to mo¿emy inaczej porozmawiaæ!
	AI_Output (self, other, "DIA_HUN_309_Whistler_GoBring_No_07_04"); //Nie, nie! Spokojnie. No nic, w takim razie pójdê do Aidana sam...
	
   Log_SetTopicStatus(CH1_Rbl_Sword, LOG_FAILED);
	whistler_trust = 2;//W sumie to jednak coœ by sie za to przyda³o
	B_LogEntry(CH1_Rbl_Sword, "Dotrzyma³em s³owa - nie bêdê po raz kolejny robi³ za ch³opca na posy³ki! Mam tylko nadziejê, ¿e Cavalorn nie weŸmie mi tego za z³e.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Nie bêdê robi³ u Œwistaka za pos³añca. Mam nadziejê, ¿e Cavalorn nie bêdzie mia³ mi tego za z³e.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 6;
	condition		= DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Condition;
	information		= DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam miecz."; 
};

FUNC INT DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_SwordOk))&&(NPC_HasItems(other,whistler_toy)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_Info()
{
	whistler_trust = TRUE;
	B_GiveXP(500);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_01"); //Mam miecz.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_02"); //To œwietnie, poka¿ mi to cudeñko!
	
   B_GiveInvItems (other, self, whistler_toy, 1);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self, "T_1HSINSPECT");
	AI_RemoveWeapon(self);
	
   AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_03"); //Wspania³y. Ach, ta delikatna linia, subtelny sztych i kr¹g³y jelec...
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_04"); //Mo¿e idŸ z nim do ³ó¿ka...
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_05"); //A myœla³eœ, ¿e gdzie go schowam w nocy? Wszystkie moje œlicznotki trzymam pod bar³ogiem.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_06"); //Dotyk stali koi mnie i sprawia, ¿e...
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_07"); //Nie chcê znaæ szczegó³ów. Wystarczy, ¿e poprzesz mnie przed Cavalornem.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_08"); //Masz to za³atwione jak w myrtañskim banku, przyjacielu.
	AI_Output (self, other, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_11_09"); //Co za cudeñko... Je¿eli pozwolisz, chcia³bym teraz zostaæ sam z tym dzie³em sztuki.
	AI_Output (other, self, "DIA_HUN_309_WhistleCH1_Rbl_SwordCompleated_15_10"); //Oczywiœcie, nie bêdê przeszkadza³ w schadzce.
	
   Log_SetTopicStatus(CH1_Rbl_Sword, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Sword, "Œwistak na widok nowej b³yskotki ma³o nie dosta³ wzwodu. Najwa¿niejsze jednak, ¿e wstawi siê za mn¹ u Cavalorna.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Mam g³os Œwistaka - kosztowa³o mnie to sporo biegania, ale takie ¿ycie.");
};

INSTANCE DIA_Whistler_Attack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 11;
	condition		= DIA_Whistler_Attack_Condition;
	information		= DIA_Whistler_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Whistler_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Attack_Info()
{
	AI_Output (self, other, "DIA_Whistler_Attack_11_01"); //Zaczekaj ch³optasiu. To Ty naplu³eœ Cavalornowi w twarz.
	AI_Output (self, other, "DIA_Whistler_Attack_11_02"); //To by³ spory b³¹d...
	
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Whistler_Stew (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 12;
	condition		= DIA_Whistler_Stew_Condition;
	information		= DIA_Whistler_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Œwie¿utki gulasz!"; 
};

FUNC INT DIA_Whistler_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Whistler_Stew_15_01"); //Œwie¿utki gulasz!
	AI_Output (self, other, "DIA_Whistler_Stew_11_02"); //Z chêci¹ zjem coœ gor¹cego.
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	AI_Output (other, self, "DIA_Whistler_Stew_15_03"); //Tak, nie musisz dziêkowaæ...
	
   B_LogEntry(CH2_Rbl_Food, "Œwistak z chêci¹ zje coœ gor¹cego."); 
};

INSTANCE DIA_Whistler_Spy (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 13;
	condition		= DIA_Whistler_Spy_Condition;
	information		= DIA_Whistler_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi³eœ?"; 
};

FUNC INT DIA_Whistler_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_Whistler_Spy_15_01"); //Jak tu trafi³eœ?
	AI_Output (self, other, "DIA_Whistler_Spy_11_02"); //Niewa¿ne. Powiedzmy, ¿e wszed³em w pewien uk³ad, za który teraz p³acê.
   
	B_LogEntry(CH2_Rbl_Spy, "Œwistak nie by³ zbyt rozmowny. Powiedzia³ tylko, ¿e wszed³ z kimœ w jakiœ uk³ad, za który teraz p³aci.");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Whistler_Spy1 (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 14;
	condition		= DIA_Whistler_Spy1_Condition;
	information		= DIA_Whistler_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, czym siê naprawdê zajmujesz."; 
};

FUNC INT DIA_Whistler_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Spy1_Info()
{
	AI_Output (other, self, "DIA_Whistler_Spy1_15_01"); //Wiem, czym siê naprawdê zajmujesz.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_02"); //Doprawdy?
	AI_Output (other, self, "DIA_Whistler_Spy1_15_03"); //Twoje oczy i uszy pozosta³y w Starym Obozie...
	AI_Output (self, other, "DIA_Whistler_Spy1_11_04"); //Pssttt!
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Whistler_Spy1_11_05"); //Chcesz, ¿eby ktoœ nas us³ysza³?!
	AI_Output (other, self, "DIA_Whistler_Spy1_15_06"); //Wprost przeciwnie. Szukam pewnej analogii.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_07"); //Mów o co chodzi, tylko siê poœpiesz.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_08"); //Szukam dowodów zdrady w tym obozie, Œwistak. Wiesz coœ o tym?
	AI_Output (self, other, "DIA_Whistler_Spy1_11_09"); //Nie zadawaj g³upich pytañ. Przecie¿ to oczywiste.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_10"); //Wiem, ¿e Gomez podrzuci³ nam œmierdz¹ce jajo, ale mam tylko podejrzenia.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_11"); //Z przyjemnoœci¹ ich wys³ucham.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_12"); //Mam trzech kandydatów na zdrajcê: Aidana, R¹czkê i Toniego.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_13"); //Dlaczego akurat oni?
	AI_Output (self, other, "DIA_Whistler_Spy1_11_14"); //Aidan doœæ czêsto znika wieczorami. Nikt nie wie, gdzie chadza i po co. 
	AI_Output (self, other, "DIA_Whistler_Spy1_11_15"); //Co do R¹czki, to jego t³umaczenie, ¿e podpad³ Gomezowi, bo popar³ jakiegoœ skazañca trochê mi œmierdzi.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_16"); //Znowu Tony jest tu najkrócej i najmniej go znam. Do tego nied³ugo po tym jak go przygarnêliœmy, pojawi³y siê przecieki.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_17"); //Rozumiem. Dobry z Ciebie obserwator.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_18"); //Mam u³atwione zadanie, bo wszyscy uwa¿aj¹ mnie za œwira, dla którego licz¹ siê tylko œwiecide³ka.
	AI_Output (self, other, "DIA_Whistler_Spy1_11_19"); //Pozory potrafi¹ zmyliæ ka¿dego, piracie.
	AI_Output (other, self, "DIA_Whistler_Spy1_15_20"); //Zapamiêtam i przemyœlê to, co powiedzia³eœ.
	
   tony_spy = tony_spy + 1;
	B_LogEntry(CH2_Rbl_Spy, "Œwistak podejrzewa o zdradê Aidana, R¹czkê lub Toniego. Wed³ug niego Aidan znika na ca³e noce, R¹czka krêci, dlaczego musia³ uciekaæ ze Starego Obozu, a Toniemu po prostu nie ufa, bo jest tu najkrócej - do tego to po jego pojawieniu siê w obozie, rozpoczê³y siê przecieki.");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Whistler_Sack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 15;
	condition		= DIA_Whistler_Sack_Condition;
	information		= DIA_Whistler_Sack_Info;
	permanent		= 0;
	important		= 0;
	description		= "To twoja zguba?"; 
};

FUNC INT DIA_Whistler_Sack_Condition()
{
	if (NPC_HasItems(other,poor_sack)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Sack_Info()
{
	AI_Output (other, self, "DIA_Whistler_Sack_15_01"); //To twoja zguba?
	
   B_GiveInvItems (other, self, poor_sack, 1);
	Npc_RemoveInvItems(self,poor_sack,1);
	
   AI_Output (self, other, "DIA_Whistler_Sack_11_02"); //Sk¹d to masz?!
	AI_Output (other, self, "DIA_Whistler_Sack_15_03"); //Znalaz³em przy Kuflu, kiedy spuœci³em mu ³omot.
	AI_Output (self, other, "DIA_Whistler_Sack_11_04"); //Sakiewkê skradziono mi kilka dni temu. Od razu spisa³em j¹ na straty.
	AI_Output (self, other, "DIA_Whistler_Sack_11_05"); //To dziwne, ale nikomu nie mówi³em o zgubie...
	AI_Output (other, self, "DIA_Whistler_Sack_15_06"); //Mam nosa do takich spraw.
	AI_Output (self, other, "DIA_Whistler_Sack_11_07"); //Hmm, rozumiem. Jakiœ dziwny jesteœ, ¿e mi j¹ oddajesz. 
	AI_Output (self, other, "DIA_Whistler_Sack_11_08"); //W ka¿dym razie dziêki za zwrócenie sakiewki i jej zawartoœci.
	
   B_LogEntry(CH2_RBL_Tritetra, "Odda³em sakiewkê Œwistakowi");
	
	//I dunno if its proper value...
	B_GiveXP(500);
};

// **************************************************

INSTANCE DIA_Whistler_NewBow (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 16;
	condition		= DIA_Whistler_NewBow_Condition;
	information		= DIA_Whistler_NewBow_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno potrzebujesz pilnej pomocy."; 
};

FUNC INT DIA_Whistler_NewBow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING))&& (ratford_help == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_NewBow_Info()
{
	AI_Output (other, self, "DIA_Whistler_NewBow_15_01"); //Podobno potrzebujesz pilnej pomocy.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_02"); //O, to Ty! Wiedzia³em, ¿e Ratford przyœle kogoœ kompetentnego.
	AI_Output (other, self, "DIA_Whistler_NewBow_15_03"); //Co siê sta³o?
	AI_Output (self, other, "DIA_Whistler_NewBow_11_04"); //Sta³o siê coœ strasznego... Moje ¿ycie przesta³o lœniæ barwami szczêœcia...
	AI_Output (other, self, "DIA_Whistler_NewBow_15_05"); //Co to za tragedia?!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_06"); //Mój ³uk... Jest stary i szary, ca³y porysowany. Nie mogê ju¿ siê z nim nigdzie pokazaæ!
	AI_Output (other, self, "DIA_Whistler_NewBow_15_07"); //Na w³osy na dupsku Beliara i to jest ten problem?!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_08"); //Problem? To koszmar, tragedia, kataklizm...
	AI_Output (other, self, "DIA_Whistler_NewBow_15_09"); //Dobra, ju¿ dobra. Mów, co mam zrobiæ i miejmy tê farsê za sob¹.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_10"); //Wiem, kto ma ³uk moich marzeñ!
	AI_Output (self, other, "DIA_Whistler_NewBow_11_11"); //To stra¿nik, nazywa siê Paul, prawie ca³y dzieñ patroluje Koloniê. Problem w tym, ¿e nie wiadomo, gdzie siê pojawi.
	AI_Output (self, other, "DIA_Whistler_NewBow_11_12"); //ZnajdŸ tego gnojka i odbierz mu mój œliczny perlisty podmuch.
	AI_Output (other, self, "DIA_Whistler_NewBow_15_13"); //Perlisty podmuch?
	AI_Output (self, other, "DIA_Whistler_NewBow_11_14"); //Tak nazywa siê to arcydzie³o, prawda, ¿e romantycznie? Tylko go nie zarysuj!

	Log_CreateTopic(CH3_RBL_PerlBlow, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_PerlBlow, LOG_RUNNING);
	B_LogEntry(CH3_RBL_PerlBlow, "Œwistak stwierdzi³, ¿e jego stary ³uk jest ju¿ niegodzien, aby z nim paradowaæ. Muszê znaleŸæ mu œliczny, nowy ³uczek, który podobno ma stra¿nik o mêskim imieniu Paul, patroluj¹cy teren ca³ej kolonii. Co za farsa!");

	/************ TODO:
	Ork daj temu Paulowi zmienn¹ rutyn¹, czyli ¿e co 3 dzieñ bêdzie siê pojawia³ przed wejœciem na bagna, to trochê doda realizmu i pownerwia graczy ;)
	Daj mu tez w inventory ten ³uk BlowPerl
	************/
	WLD_InsertNpc(GRD_4069_Paul,"OC1");
	WLD_InsertNpc(Grd_4129_PaulPatrol,"OC1");
	WLD_InsertNpc(Grd_4130_PaulPatrol,"OC1");
};

// **************************************************

INSTANCE DIA_Whistler_NewBowBack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 17;
	condition		= DIA_Whistler_NewBowBack_Condition;
	information		= DIA_Whistler_NewBowBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam twoje œwiecide³ko."; 
};

FUNC INT DIA_Whistler_NewBowBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_NewBow))&&(NPC_HasItems(other,BlowPerl)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_NewBowBack_Info()
{
	others_help = others_help + 1;
	B_GiveXP(500);
	
   AI_Output (other, self, "DIA_Whistler_NewBowBack_15_01"); //Mam twoje œwiecide³ko.
	AI_Output (self, other, "DIA_Whistler_NewBowBack_11_02"); //Cudownie! Oddaj mi ten skarb!
	
   B_GiveInvItems (other, self, BlowPerl, 1);
   Npc_RemoveInvItems(self, BlowPerl, 1);
	
   AI_Output (self, other, "DIA_Whistler_NewBowBack_11_03"); //Piêkny! Lœni niczym...
	AI_Output (other, self, "DIA_Whistler_NewBowBack_15_04"); //Jaja cieniostwora po deszczu!
	
   Log_SetTopicStatus(CH3_RBL_PerlBlow, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_PerlBlow, "Odnios³em Œwistakowi jego cacuszko. Co ja robiê?!");
};

/****************************

SIDE QUESTS

******************************/

// **************************************************

INSTANCE DIA_Whistler_Cristal (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 20;
	condition		= DIA_Whistler_Cristal_Condition;
	information		= DIA_Whistler_Cristal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Coœ marnie wygl¹dasz..."; 
};

FUNC INT DIA_Whistler_Cristal_Condition()
{
	if (Kapitel>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Cristal_Info()
{
	AI_Output (other, self, "DIA_Whistler_Cristal_15_01"); //Coœ marnie wygl¹dasz...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_02"); //Bo marnie siê czujê!
	AI_Output (other, self, "DIA_Whistler_Cristal_15_03"); //Mów co Ciê gnêbi. Jakieœ œwiecide³ko siê popsu³o?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_04"); //Nie ¿artuj z moich... cacuszek! Ale masz racjê...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_05"); //Niedawno kupi³em wspania³y ³uk, nie mogê go jednak wypróbowaæ!
	AI_Output (other, self, "DIA_Whistler_Cristal_15_06"); //Dlaczego?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_07"); //Nie mam odpowiedniej amunicji. Ten ³uk miota tylko strza³y ¿ywio³ów.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_08"); //¯e co?
	AI_Output (self, other, "DIA_Whistler_Cristal_11_09"); //Gdzieœ Ty siê chowa³? Ogniste strza³y, lodowe i burzowe, czy jak tam one siê nazywaj¹.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_10"); //To dokup odpowiedni¹ amunicjê i po krzyku.
	AI_Output (self, other, "DIA_Whistler_Cristal_11_11"); //Gdyby to by³o takie proste...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_12"); //Groty do tych strza³ musz¹ zostaæ wykonane ze specjalnego metalu, który mo¿na znaleŸæ tylko w meteorytach...
	AI_Output (self, other, "DIA_Whistler_Cristal_11_13"); //Ostatnio nawet jeden przebi³ barierê i spad³ gdzieœ w Kolonii. Podobno Leaf widzia³ ten kryszta³...
	AI_Output (other, self, "DIA_Whistler_Cristal_15_14"); //Nie patrz tak na mnie!
	AI_Output (self, other, "DIA_Whistler_Cristal_11_15"); //B³agam! Nie po¿a³ujesz! Zap³acê Ci rud¹ i dorzucê coœ ekstra.
	AI_Output (other, self, "DIA_Whistler_Cristal_15_16"); //Sam nie wiem... Muszê siê zastanowiæ.
};

// **************************************************

INSTANCE DIA_Whistler_CristalOk (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 21;
	condition		= DIA_Whistler_CristalOk_Condition;
	information		= DIA_Whistler_CristalOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, poszukam tego kryszta³u."; 
};

FUNC INT DIA_Whistler_CristalOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Cristal))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_CristalOk_Info()
{
	AI_Output (other, self, "DIA_Whistler_CristalOk_15_01"); //Dobra, poszukam tego kryszta³u.
	AI_Output (self, other, "DIA_Whistler_CristalOk_11_02"); //To cudownie! Porozmawiaj z Leafem, on wie, gdzie odnaleŸæ kryszta³.
	AI_Output (self, other, "DIA_Whistler_CristalOk_11_03"); //Proszê, poœpiesz siê, chcia³bym, jak najszybciej wypróbowaæ to cudeñko!

	Log_CreateTopic(CH1_RBL_ArrowCristal, LOG_MISSION);
	Log_SetTopicStatus(CH1_RBL_ArrowCristal, LOG_RUNNING);
	B_LogEntry(CH1_RBL_ArrowCristal, "Œwistak kupi³ ³uk miotaj¹cy strza³ami ¿ywio³ów. Nie ma jednak odpowiedniej amunicji. Podobno groty do takich strza³ mo¿na odlaæ tylko z metalu znajduj¹cego siê w meteorytach. Mam porozmawiaæ z Leafem, on gdzieœ widzia³ taki kryszta³.");
};

// **************************************************

INSTANCE DIA_Whistler_Leaf (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 22;
	condition		= DIA_Whistler_Leaf_Condition;
	information		= DIA_Whistler_Leaf_Info;
	permanent		= 0;
	important		= 0;
	description		= "Leaf nic mi nie powiedzia³!"; 
};

FUNC INT DIA_Whistler_Leaf_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_CristalPay))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Leaf_Info()
{
	AI_Output (other, self, "DIA_Whistler_Leaf_15_01"); //Leaf nic mi nie powiedzia³!
	AI_Output (self, other, "DIA_Whistler_Leaf_11_02"); //Zdradzê Ci pewien sekret. Do Kolonii trafiaj¹ raczej Ci Ÿli, wredni i brzydcy...
	AI_Output (self, other, "DIA_Whistler_Leaf_11_03"); //Powiedzia³em tylko, ¿e Leaf wie coœ o krysztale. Nie powiedzia³em, ¿e coœ Ci zdradzi!
	AI_Output (other, self, "DIA_Whistler_Leaf_15_04"); //Niech to szlag, straci³em 50 bry³ek!
	AI_Output (self, other, "DIA_Whistler_Leaf_11_05"); //£adnie Ciê podpuœci³.
	AI_Output (self, other, "DIA_Whistler_Leaf_11_06"); //Ale mo¿e piwo rozwi¹¿e mu jêzyk? Daj mu kilka piw i kto wie...
	
   B_LogEntry(CH1_RBL_ArrowCristal, "Œwistak zasugerowa³, ¿e kilka piw powinno rozwi¹zaæ Leafowi jêzyk. Mo¿e warto spróbowaæ?");
};

// **************************************************

INSTANCE DIA_Whistler_LeafBack (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 23;
	condition		= DIA_Whistler_LeafBack_Condition;
	information		= DIA_Whistler_LeafBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam kryszta³."; 
};

FUNC INT DIA_Whistler_LeafBack_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_CristalOk))&&(NPC_HasItems(other,arrow_cristal)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_LeafBack_Info()
{
	AI_Output (other, self, "DIA_Whistler_LeafBack_15_01"); //Mam kryszta³.
	AI_Output (self, other, "DIA_Whistler_LeafBack_11_02"); //Daj mi go!
	
   B_GiveInvItems (other, self, arrow_cristal, 1);
	Npc_RemoveInvItems(self,arrow_cristal,1);
	
   AI_Output (self, other, "DIA_Whistler_LeafBack_11_03"); //Zaczekaj tu chwilê...
	AI_Output (other, self, "DIA_Whistler_LeafBack_15_04"); //A nagroda?!
	AI_Output (self, other, "DIA_Whistler_LeafBack_11_05"); //Zaraz wrócê!

	B_StopProcessInfos(self);

	AI_SetWalkmode (self, NPC_RUN);
	AI_GotoWP (self, "HC_HUTIN_X");
	AI_PlayAni (self,"T_PRACTICEMAGIC2");
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
	AI_GotoNpc (self, other);
};

// **************************************************

INSTANCE DIA_Whistler_CristalCompleated (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 24;
	condition		= DIA_Whistler_CristalCompleated_Condition;
	information		= DIA_Whistler_CristalCompleated_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Whistler_CristalCompleated_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_LeafBack))&&(Npc_GetDistToNpc(self,hero) < 200)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_CristalCompleated_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_01"); //Uda³o siê!
	AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_02"); //To œwietnie, ale co?
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_03"); //Prze¿y³em! I mam dla Ciebie odpowiedni¹ nagrodê.
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_04"); //WeŸ te strza³y, na pewno Ci siê przydadz¹.
	
   CreateInvItems (self,ItAmFireArrow,25);
	B_GiveInvItems (self, other, ItAmFireArrow, 25);
	CreateInvItems (self,ItAmIceArrow,25);
	B_GiveInvItems (self, other, ItAmIceArrow, 25);
	
   AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_05"); //Rzeczywiœcie by³o warto...
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_06"); //A to 50 bry³ek, które straci³eœ przez Leafa.
   
   CreateInvItems (self,ItMiNugget, 50);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 50);
   
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_07"); //Jeszcze raz przyjmij wyrazy mojej wdziêcznoœci.
	AI_Output (self, other, "DIA_Whistler_CristalCompleated_11_08"); //Gdybym móg³ jeszcze jakoœ Ci siê odwdziêczyæ...
	AI_Output (other, self, "DIA_Whistler_CristalCompleated_15_09"); //Ekhm... To wystarczy, bywaj.

	Log_SetTopicStatus(CH1_RBL_ArrowCristal, LOG_SUCCESS);
	B_LogEntry(CH1_RBL_ArrowCristal, "Rzeczywiœcie warto by³o uganiaæ siê za tym kryszta³em. Dosta³em magiczne strza³y i jeszcze zwrot kosztów. Ale Œwistakowi zbyt siê oczy œwiec¹ na mój widok, na jakiœ czas lepiej omijaæ go szerokim ³ukiem i na Beliara, lepiej nie odwracaæ siê do niego ty³em!");
};

// **************************************************

INSTANCE DIA_Whistler_Revange (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 25;
	condition		= DIA_Whistler_Revange_Condition;
	information		= DIA_Whistler_Revange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Whistler_Revange_Condition()
{
	//Two days after Pacho arrived to OR Camp
	if (Day_PachoJoinsORCamp)&&(Day_PachoJoinsORCamp+2<Wld_GetDay())&&(Npc_KnowsInfo (hero, Info_Drax_Trust))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Revange_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other, "DIA_Whistler_Revange_11_01"); //Zaczekaj, mo¿emy porozmawiaæ?
	AI_Output (other, self, "DIA_Whistler_Revange_15_02"); //Porozmawiaæ zawsze mo¿na. O co chodzi?
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Whistler_Revange_11_03"); //Ktoœ mi zacz¹³ psuæ interes...
	AI_Output (other, self, "DIA_Whistler_Revange_15_04"); //Chwila. Wiem, ¿e wygl¹dam, jak najgorsza szumowina, ale nie bêdê nikogo zabija³ na zlecenie!
	AI_Output (self, other, "DIA_Whistler_Revange_11_05"); //Spokojnie, nie musisz nikogo zabijaæ. Jest prostszy i mniej zabójczy sposób.
	AI_Output (other, self, "DIA_Whistler_Revange_15_06"); //No dobra, mów.
	AI_Output (self, other, "DIA_Whistler_Revange_11_07"); //Drax przesta³ u mnie kupowaæ skóry, odk¹d do obozu przypa³êta³ siê Pacho.
	AI_Output (self, other, "DIA_Whistler_Revange_11_08"); //Co w tym niezwyk³ego, to normalne prawo konkurencji.
	AI_Output (self, other, "DIA_Whistler_Revange_11_09"); //Ale z Draxem mia³em s³own¹ umowê, ¿e bêdzie skupowa³ tylko MOJE skóry!
	AI_Output (self, other, "DIA_Whistler_Revange_11_10"); //Ja w zamian znalaz³em kilku klientów na te cholerne konfitury!
	AI_Output (other, self, "DIA_Whistler_Revange_15_11"); //Do czego zmierzasz?
	AI_Output (self, other, "DIA_Whistler_Revange_11_12"); //Podmienisz konfitury w skrzyni Draxa, na te przygotowane przeze mnie.
	AI_Output (other, self, "DIA_Whistler_Revange_15_13"); //Z czego je zrobi³eœ? 
	AI_Output (self, other, "DIA_Whistler_Revange_11_14"); //A ró¿ne takie wnêtrznoœci i odchody. Kiedy Drax sprzeda weki, to klienci go zlinczuj¹, he, he.
	AI_Output (other, self, "DIA_Whistler_Revange_15_15"); //Kawa³ z Ciebie sukinsyna.
	AI_Output (self, other, "DIA_Whistler_Revange_11_16"); //W koñcu Kolonia to nie miejsce dla miêczaków. Wiêc jak bêdzie?
};

// **************************************************

INSTANCE DIA_Whistler_RevangeOk (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 26;
	condition		= DIA_Whistler_RevangeOk_Condition;
	information		= DIA_Whistler_RevangeOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, daj te 'konfitury'."; 
};

FUNC INT DIA_Whistler_RevangeOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_GoOut))&&(Npc_KnowsInfo (hero, DIA_Whistler_Revange))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeOk_Info()
{
	AI_Output (other, self, "DIA_Whistler_RevangeOk_15_01"); //Dobra, daj te 'konfitury'.
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_02"); //Wiedzia³em, ¿e mo¿na na Ciebie liczyæ! WeŸ wszystkie weki.
   
	CreateInvItems (self, konfitury_fake,5); 
	B_GiveInvItems (self, other, konfitury_fake, 5);
   
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_03"); //Tylko ich nie kosztuj, s¹ ohydne...
	AI_Output (other, self, "DIA_Whistler_RevangeOk_15_04"); //O to siê nie bój. Cholera, ale to cuchnie. Miejmy to ju¿ za sob¹.
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_05"); //Aha. Przynieœ mi konfitury ze skrzyni Draxa... 
	AI_Output (self, other, "DIA_Whistler_RevangeOk_11_06"); //G³upio mi o tym mówiæ, ale s¹ przepyszne!
   
	Log_CreateTopic(CH1_RBL_Revange, LOG_MISSION);
	Log_SetTopicStatus(CH1_RBL_Revange, LOG_RUNNING);
	B_LogEntry(CH1_RBL_Revange, "Pomogê Œwistakowi w zemœcie na Draxie. Muszê podmieniæ konfitury z kufra Draxa na cuchn¹c¹ podróbkê Œwistaka, a konfitury ze skrzyni mam zanieœæ Œwistakowi.");
};

// **************************************************

INSTANCE DIA_Whistler_RevangeDone (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 27;
	condition		= DIA_Whistler_RevangeDone_Condition;
	information		= DIA_Whistler_RevangeDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za³atwione, weŸ konfitury."; 
};

FUNC INT DIA_Whistler_RevangeDone_Condition()
{
	if (NPC_HasItems(other,konfitury_chest)>=5)&&(Mob_HasItems ("OR_CHEST_DRAX", konfitury_fake)>=5)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeDone_Info()
{
	AI_Output (other, self, "DIA_Whistler_RevangeDone_15_01"); //Za³atwione, weŸ konfitury.
   
	B_GiveInvItems (other, self, konfitury_chest, 5);
	Npc_RemoveInvItems(self,konfitury_chest,5);
   
	AI_Output (self, other, "DIA_Whistler_RevangeDone_11_02"); //Ju¿ nie mogê doczekaæ siê miny Draxa, jak sprzeda weki.
	AI_Output (self, other, "DIA_Whistler_RevangeDone_11_03"); //Zas³u¿y³eœ na tê rudê, przyjacielu.

	CreateInvItems (self, itminugget,50); 
	B_GiveInvItems (self, other, itminugget, 50);
   
	B_LogEntry(CH1_RBL_Revange, "Zarobi³em 50 bry³ek, ale jak pozbyæ siê smrodu?");
	B_Givexp(150);
};

// **************************************************

INSTANCE DIA_Whistler_RevangeAfter (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 28;
	condition		= DIA_Whistler_RevangeAfter_Condition;
	information		= DIA_Whistler_RevangeAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Whistler_RevangeAfter_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Drax_RevangeDone))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RevangeAfter_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_01"); //Hey, Ty!
	AI_TurnToNpc (other, self);
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_02"); //Ja?
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_03"); //Tak. PodejdŸ do mnie.
	AI_GotoNpc(other, self);
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_04"); //Znowu coœ siê sta³o?
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_05"); //Jakiœ bezczelny gnojek ukrad³ mi ber³o! Nic o tym nie wiesz?
	AI_Output (other, self, "DIA_Whistler_RevangeAfter_15_06"); //Ja nic o niczym nie wiem! Do jasnej cholery, dajcie mi wszyscy spokój!
	AI_Output (self, other, "DIA_Whistler_RevangeAfter_11_07"); //Spokojnie, tak tylko zapyta³em...

	Log_SetTopicStatus(CH1_RBL_Revange, LOG_SUCCESS);
	B_LogEntry(CH1_RBL_Revange, "Mam ju¿ doœæ pomagania innym!");
};

// **************************************************

INSTANCE DIA_Whistler_Kuva (C_INFO)
{
	npc				= HUN_309_Whistler;
	nr				= 30;
	condition		= DIA_Whistler_Kuva_Condition;
	information		= DIA_Whistler_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znasz niejakiego Kuvê?"; 
};

FUNC INT DIA_Whistler_Kuva_Condition()
{
	return Kuva_Help;
};

FUNC VOID DIA_Whistler_Kuva_Info()
{
	AI_Output (other, self, "DIA_Whistler_Kuva_15_01"); //Znasz niejakiego Kuvê?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_02"); //Pewnie, ¿e znam tego gnoja! Jest mi winien rudê. Albo raczej by³...
	AI_Output (other, self, "DIA_Whistler_Kuva_15_03"); //Jak to by³?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_04"); //Chcia³em siê z nim spotkaæ kilka dni temu, ale nie przyszed³. Mia³em mu wtedy powiedzieæ, ¿e jego d³ug wykupi³ R¹czka.
	AI_Output (other, self, "DIA_Whistler_Kuva_15_05"); //A dlaczego R¹czka to zrobi³?
	AI_Output (self, other, "DIA_Whistler_Kuva_11_06"); //Nie mam zielonego pojêcia. Dla mnie liczy siê tylko ruda. Odzyska³em swój d³ug, a reszta to nie moja sprawa.
	AI_Output (other, self, "DIA_Whistler_Kuva_15_07"); //No to muszê porozmawiaæ z R¹czk¹. Bywaj.

	B_LogEntry(CH1_RBL_Cage, "D³ug Kuvy wykupi³ R¹czka. Ciekawe dlaczego?");
};
