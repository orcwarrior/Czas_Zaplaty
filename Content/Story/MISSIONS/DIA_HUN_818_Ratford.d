// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_818_RATFORD_Exit (C_INFO)
{
	npc			= HUN_818_RATFORD;
	nr			= 999;
	condition	= DIA_HUN_818_RATFORD_Exit_Condition;
	information	= DIA_HUN_818_RATFORD_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_818_RATFORD_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_818_RATFORD_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int ratford_fight;
var int ratford_hunt;

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_818_RATFORD_Hello (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 1;
	condition		= DIA_HUN_818_RATFORD_Hello_Condition;
	information		= DIA_HUN_818_RATFORD_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Myœliwy?"; 
};

FUNC INT DIA_HUN_818_RATFORD_Hello_Condition()
{
	return 1;
};
FUNC VOID DIA_HUN_818_RATFORD_Hello_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
   
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_01"); //Myœliwy?
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_02"); //Jak na to wpad³eœ?
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_03"); //Dobra, przejdê od razu do rzeczy...
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_04"); //Nie musisz. Ka¿dy nowy przychodzi do mnie tylko po to, by udowodniæ swoj¹ wartoœæ.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_05"); //A ja z regu³y robiê najwiêkszy odsiew, bo nie przepadam za pata³achami.
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_06"); //Uwa¿aj na s³owa. Zêby ¿uje siê gorzej ni¿ tytoñ.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_07"); //A masz w jajach na tyle ikry by pokryæ to co powiedzia³eœ czynami?
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_08"); //SprawdŸ mnie.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_09"); //Niech bêdzie. Masz dwie mo¿liwoœci.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_10"); //Zabij kilka wilków i przynieœ mi ich k³y. Udowodnisz w ten sposób, ¿e wiesz jak oprawiaæ zwierzêta, a myœliwych nigdy za wiele.
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_15_11"); //A druga mo¿liwoœæ?
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_12"); //SprawdŸ siê w boju ze mn¹.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_13"); //Prawdziwi wojownicy staj¹ naprzeciw siebie na d³ugoœæ wyci¹gniêtego orê¿a.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_07_14"); //To jak bêdzie?
	Info_ClearChoices (DIA_HUN_818_RATFORD_Hello);
	Info_AddChoice (DIA_HUN_818_RATFORD_Hello, "Skrzy¿ujmy ostrza.", DIA_HUN_818_RATFORD_Hello_Yes);
	Info_AddChoice (DIA_HUN_818_RATFORD_Hello, "Pójdê na polowanie.", DIA_HUN_818_RATFORD_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_818_RATFORD_Hello_Yes()
{
	ratford_fight = TRUE;
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_Yes_15_01"); //Skrzy¿ujmy ostrza.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_Yes_07_02"); //No proszê, jednak masz jaja.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_Yes_07_03"); //No to sprawdŸmy jak twarde!
	Log_CreateTopic(CH1_Rbl_Wolf, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Wolf, "¯eby zdobyæ szacunek Ratforda, muszê pokonaæ go w walce co nie bêdzie ³atwe, ale radzi³em ju¿ sobie w gorszych opresjach.");
	B_SetTimedATT(self,30*events_per_sec,-150,-150,-80);
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_HUN_818_RATFORD_Hello_No()
{
	ratford_hunt = TRUE;
	AI_Output (other, self, "DIA_HUN_818_RATFORD_Hello_No_15_01"); //Pójdê na polowanie.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_No_07_02"); //Tak myœla³em. Du¿o ³atwiej ustrzeliæ wilka ni¿ skrzy¿owaæ miecz z wojownikiem.
	AI_Output (self, other, "DIA_HUN_818_RATFORD_Hello_No_07_03"); //Zabij kilka sierœciuchów. Powiedzmy, ¿e piêæ par k³ów wystarczy mi na naszyjnik.
	Log_CreateTopic(CH1_Rbl_Wolf, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Wolf, "¯eby udowodniæ sw¹ przydatnoœæ Ratfordowi, muszê ubiæ piêæ wilków i zdobyæ ich k³y. Nie powinno byæ z tym wiêkszych problemów.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Ratford_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_818_RATFORD;
	nr				= 4;
	condition		= DIA_Ratford_CanYouTeachMe_Condition;
	information		= DIA_Ratford_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Móg³byœ nauczyæ mnie polowaæ?"; 
};

FUNC INT DIA_Ratford_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_818_RATFORD_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Ratford_CanYouTeachMe_Info()
{
   AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Móg³byœ nauczyæ mnie polowaæ?
   AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Parê sztuczek móg³bym ci pokazaæ, ale to bêdzie kosztowaæ.
   AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wprawny ³owca potrafi zdobyæ k³y, pazury i skórê zwierzyny. Nie jest to ³atwe, ale doœæ op³acalne.
	AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //W ka¿dym razie ka¿dy kupiec chêtnie odkupi od ciebie trofea.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Ratford mo¿e mnie nauczyæ polowaæ: œci¹gania futer, zdobywania k³ów i pazurów.");
};

INSTANCE DIA_Ratford_Fight (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 2;
	condition		= DIA_Ratford_Fight_Condition;
	information		= DIA_Ratford_Fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Ratford_Fight_Condition()
{
	if (ratford_fight == TRUE)
	{
		return 1;
	};
};
FUNC VOID DIA_Ratford_Fight_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Ratford_Fight_15_01"); //To by³a niez³a bitka.
   
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		B_GiveXP(100);
		ratford_hunt = TRUE;
		AI_Output (self, other, "DIA_Ratford_Fight_07_02"); //Mo¿e i nie pokona³eœ mnie w walce, ale przynajmniej nie ucieka³eœ z podkulonym ogonem polowaæ na wilki.
		AI_Output (self, other, "DIA_Ratford_Fight_07_03"); //Mam jednak swoje zasady. Przynieœ 5 par wilczych k³ów i masz moje poparcie, przyjacielu.

		Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_RUNNING);
		B_LogEntry(CH1_Rbl_Wolf, "Wyzwa³em Ratforda na pojedynek, nie zdo³a³em jednak pokonaæ myœliwego. Mimo to Ratford wstawi siê za mn¹, je¿eli przyniosê mu piêæ par wilczych k³ów. Czas ruszyæ na polowanie.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		ratford_trust = TRUE;	//ORC: Bugfix - mission sucessed
		rebel_camp_trust = rebel_camp_trust + 1; 
		B_GiveXP(400);	
		AI_Output (self, other, "DIA_Ratford_Fight_07_04"); //Tego siê nie spodziewa³em - wygra³eœ w uczciwej walce. 
		AI_Output (self, other, "DIA_Ratford_Fight_07_05"); //Brakuje nam takich ludzi. Dobrze, ¿e jesteœ po naszej stronie.
		AI_Output (self, other, "DIA_Ratford_Fight_07_06"); //Zas³u¿y³eœ na mój szacunek, przyjacielu. A to nie czêsto siê zdarza.
		Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Wolf, "Pokona³em Ratforda w uczciwej walce. Zdoby³em szacunek i poparcie myœliwego. Zaczyna mi siê podobaæ wœród tych rebeliantów...");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "Zdoby³em szacunek Ratforda. Muszê przyznaæ, ¿e ten myœliwy trochê mi zaimponowa³.");
	};
};


INSTANCE DIA_Ratford_Hunt (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 3;
	condition		= DIA_Ratford_Hunt_Condition;
	information		= DIA_Ratford_Hunt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wilcze k³y."; 
};

FUNC INT DIA_Ratford_Hunt_Condition()
{
	if (NPC_HasItems(other,ItAt_WolfTeeth)>=5)&&(ratford_hunt)
	{
		return 1;
	};
};

FUNC VOID DIA_Ratford_Hunt_Info()
{
	ratford_trust = TRUE;
	rebel_camp_trust = rebel_camp_trust + 1; 
	B_GiveXP(150);	
	AI_Output (other, self, "DIA_Ratford_Hunt_15_01"); //Mam wilcze k³y.
	B_GiveInvItems (other, self, ItAt_WolfTeeth,5);
	Npc_RemoveInvItems(self,ItAt_WolfTeeth,5);
	AI_Output (self, other, "DIA_Ratford_Hunt_07_02"); //Rzeczywiœcie. Jak dla mnie mo¿e byæ. Najwa¿niejsze, ¿e potrafisz polowaæ.
	AI_Output (self, other, "DIA_Ratford_Hunt_07_03"); //Wstawiê siê za Tob¹ u Cavalorna, przyjacielu.
	Log_SetTopicStatus(CH1_Rbl_Wolf, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Wolf, "Odda³em Ratfordowi wilcze k³y. Myœliwy uzna³ to za wystarczaj¹cy dowód mojej 'u¿ytecznoœci'.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Udowodni³em Ratfordowi swoj¹ przydatnoœæ. Nied³ugo droga do obozu stanie przed mn¹ otworem.");
};

INSTANCE DIA_Ratfordr_Attack (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 11;
	condition		= DIA_Ratfordr_Attack_Condition;
	information		= DIA_Ratfordr_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ratfordr_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Ratfordr_Attack_Info()
{
	AI_Output (self, other, "DIA_Ratfordr_Attack_07_01"); //Pomyli³em siê co do Ciebie.
	AI_Output (self, other, "DIA_Ratfordr_Attack_07_02"); //Ale mogê to jeszcze nadrobiæ...
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_RATFORD_Stew (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 12;
	condition		= DIA_RATFORD_Stew_Condition;
	information		= DIA_RATFORD_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ciê rozgrzeje."; 
};

FUNC INT DIA_RATFORD_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RATFORD_Stew_15_01"); //To ciê rozgrzeje.
	AI_Output (self, other, "DIA_RATFORD_Stew_11_02"); //O ile wczeœniej mnie nie zabije...
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Ratford chyba nie przepada za gulaszem Snafa."); 
};

INSTANCE DIA_RATFORD_Spy (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 13;
	condition		= DIA_RATFORD_Spy_Condition;
	information		= DIA_RATFORD_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zawsze by³eœ myœliwym?"; 
};

FUNC INT DIA_RATFORD_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_RATFORD_Spy_15_01"); //Zawsze by³eœ myœliwym?
	AI_Output (self, other, "DIA_RATFORD_Spy_07_02"); //A Ty zawsze by³eœ piratem?
	AI_Output (other, self, "DIA_RATFORD_Spy_15_03"); //Nie.
	AI_Output (self, other, "DIA_RATFORD_Spy_07_04"); //Widzisz przyjacielu, czasami stajemy siê tym, kim musimy byæ, a nie tym kim byœmy chcieli.
	AI_Output (other, self, "DIA_RATFORD_Spy_15_05"); //Widzê w twoich oczach... smugê cienia. Coœ siê wydarzy³o, tak?
	AI_Output (self, other, "DIA_RATFORD_Spy_07_06"); //Ka¿dy ma swoje tajemnice. Czasami lepiej nie wiedzieæ zbyt wiele, d³u¿ej siê wtedy ¿yje.
	B_LogEntry(CH2_Rbl_Spy, "Ratford te¿ coœ ukrywa. W jego oczach widaæ pustkê i... zgliszcza. Co mog³o wypaliæ od œrodka tego twardego mê¿czyznê?.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_RATFORD_Spy1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 4;
	condition		= DIA_RATFORD_Spy1_Condition;
	information		= DIA_RATFORD_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em... przeprosiæ."; 
};

FUNC INT DIA_RATFORD_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Spy1_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_01"); //Chcia³em... przeprosiæ.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_02"); //Za co?
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_03"); //Ka¿dy z nas straci³ kogoœ... bliskiego. Nie powinienem tak Ciê nagabywaæ.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_04"); //Chyba ktoœ mia³ za d³ugi jêzyk. Takie jest ¿ycie piracie. To nie cel jest wa¿ny, ale droga, która do niego zmierza.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_05"); //Nasze œcie¿ki rozesz³y siê, a gdy znowu siê spotka³y, by³o ju¿ za póŸno.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_06"); //Od tej pory stroniê od ludzi. Nie chcê znów patrzeæ w twarz umieraj¹cego przyjaciela.
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_07"); //Rozumiem. Zostawiê Ciê samego...
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_08"); //Zaczekaj. O co chodzi? Szukasz czegoœ?
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_09"); //Raczej kogoœ, kto brata siê ze Starym Obozem.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_10"); //Hmm, te¿ mia³em takie podejrzenia, stra¿nicy za du¿o o nas wiedz¹.
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_11"); //Dam ci dobr¹ radê - nie szukaj tego co oczywiste, tylko tego co stwarza pozory prawdy.
	AI_Output (other, self, "DIA_RATFORD_Spy1_15_12"); //Chyba nie zrozumia³em...
	AI_Output (self, other, "DIA_RATFORD_Spy1_07_13"); //Zrozumiesz w swoim czasie.
	B_LogEntry(CH2_Rbl_Spy, "Ratford izoluje siê od ludzi, bo nie chce ponownie prze¿yæ straty przyjaciela. Powiedzia³ mi, abym nie wierzy³ pozorom. Chyba chcia³ mi powiedzieæ, ¿ebym nie ufa³ k³amcom. Jak na razie tylko Tony nie by³ ze mn¹ do koñca szczery. R¹czka te¿ coœ krêci. ");
	tony_spy = tony_spy + 1;

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_IwillBecameHunter(C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 151;
	condition		= DIA_RATFORD_IwillBecameHunter_Condition;
	information		= DIA_RATFORD_IwillBecameHunter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wkroczy³em na œcie¿kê ³owcy."; 
};

FUNC INT DIA_RATFORD_IwillBecameHunter_Condition()
{
	//TODO: Wybór Mag-£owca Powinien byc wlasnie po powrocie od £T, wiec w tym miejscu nalezy wpisaæ "Chcia³bym wkroczyæ na sciezke £owcy"(if(!SciezkaMaga)) dodac tez w dialogu z cav po powrocie o tym ze mamy wybrac, wrzucic tez konkretny dialog miltenowi.
	if (CAVALORN_ASK_TRAIL==1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_IwillBecameHunter_Info()
{
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_01"); //Wkroczy³em na œcie¿kê ³owcy.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_02"); //Wiem, rozmawia³em o Tobie z Cavalornem.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_03"); //Nie wierzê w przypadek, ani szczêœcie. To co siê stanie mniej lub bardziej zale¿y tylko i wy³¹cznie od Ciebie i innych ludzi.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_04"); //Po co mi o tym mówisz?
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_05"); //Najwy¿sza pora sprawdziæ, kim naprawdê jesteœ i na co Ciê staæ.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_06"); //Co przez to rozumiesz?
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_07"); //Dam Ci zadanie i tylko od Ciebie zale¿y, jak¹ drog¹ pod¹¿ysz, by je rozwi¹zaæ.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_08"); //Niedaleko st¹d pojawi³ siê patrol stra¿ników. Masz siê ich pozbyæ, to jak to zrobisz zale¿y tylko od Ciebie.
	AI_Output (other, self, "DIA_RATFORD_IwillBecameHunter_15_09"); //Rozumiem. Mo¿esz ju¿ uwa¿aæ ten problem za rozwi¹zany.
	AI_Output (self, other, "DIA_RATFORD_IwillBecameHunter_07_10"); //Wróæ, kiedy tak bêdzie.
	
   Log_CreateTopic(CH2_RBL_GuardCamp, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_GuardCamp, LOG_RUNNING);
	B_LogEntry(CH2_RBL_GuardCamp, "Ratford chce, ¿ebym zaj¹³ siê patrolem stra¿ników w pobli¿u obozu. To jak sobie z nim poradzê to moja sprawa. Mam kilka mo¿liwoœci: u¿ycie si³y, zaskoczenie lub spryt.");
	B_LogEntry(CH2_RBL_Hunter, "Ratford chce sprawdziæ, jak poradzê sobie z patrolem stra¿ników w pobli¿u obozu. Muszê mu pokazaæ, co jestem wart.");
	
	B_StopProcessInfos(self);	

	Wld_InsertNpc (GRD_4061_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4060_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4059_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4058_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4057_Guard,"MIS_GRDPATROL1_2");
	Wld_InsertNpc (GRD_4056_Guard,"MIS_GRDPATROL1_2");		
};
// **************************************************
INSTANCE DIA_RATFORD_Quest1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 16;
	condition		= DIA_RATFORD_Quest1_Condition;
	information		= DIA_RATFORD_Quest1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Quest1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_IwillBecameHunter))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Quest1_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other, "DIA_RATFORD_Quest1_07_01"); //Aha, dam Ci dobr¹ radê. Je¿eli masz tu jakiœ przyjació³, to warto z nimi porozmawiaæ, zanim znajdziesz ten patrol.
	AI_Output (other, self, "DIA_RATFORD_Quest1_15_02"); //Dziêki, bêdê o tym pamiêta³.
	AI_Output (self, other, "DIA_RATFORD_Quest1_07_03"); //Szczêœliwych ³owów.
	B_LogEntry(CH2_RBL_GuardCamp, "Na odchodnym Ratford poradzi³ mi, ¿ebym porozmawia³ z przyjació³mi, którzy mog¹ mi pomóc w rozprawieniu siê z patrolem stra¿y.");
	B_StopProcessInfos(self);
};

var int rat_info;

// **************************************************

INSTANCE DIA_RATFORD_PatrolFinish (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 17;
	condition		= DIA_RATFORD_PatrolFinish_Condition;
	information		= DIA_RATFORD_PatrolFinish_Info;
	permanent		= 1;
	important		= 0;
	description		= "Za³atwi³em sprawê z patrolem."; 
};

FUNC INT DIA_RATFORD_PatrolFinish_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(rat_info == false)//&&((patrol_trial >= 1))
	{
		return 1;
	};
};
FUNC VOID DIA_RATFORD_PatrolFinish_Info()
{
	AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_01"); //Za³atwi³em sprawê z patrolem.
	AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_02"); //Czy¿by...

	if (B_guards_patrol_finished())
	{
		rat_info = true;

		if (dick_patrol_choice == 1)&&(patrol_trial == 2)
		{
			B_GiveXP (500);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_03"); //Dorwa³em sukinsynów i zrobi³em z nimi porz¹dek. Pomogli mi piraci.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_04"); //Ma³o subtelnie, ale skutecznie. Dobrze, ¿e mnie pos³ucha³eœ i znalaz³eœ wsparcie.

		} 
		else if (dick_patrol_choice == 2)&&(patrol_trial == 3)
		{
			B_GiveXP (700);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_05"); //Zwabi³em stra¿ników w pu³apkê, pomogli mi piraci. Wyr¿nêliœmy ich co do nogi.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_06"); //NieŸle to wymyœli³eœ. Dobrze, ¿e mnie pos³ucha³eœ i znalaz³eœ wsparcie.

		}
		else if (dick_patrol_choice == 3)&&(patrol_trial == 10)
		{
			B_GiveXP (1000);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_07"); //Przekona³em ich do tego, ¿eby wrócili do Starego Obozu i nie wyœciubiali stamt¹d nosa. Piraci czekali w odwodzie, gdyby coœ posz³o nie tak.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_08"); //Zadziwiasz mnie. Wolê nie wiedzieæ, jak zdo³a³eœ tego dokonaæ.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_09"); //Mimo wszystko szkoda, ¿e ich nie zabi³eœ, Gomezowi przyby³o mieczy w Starym Obozie.
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_10"); //Hmm, o tym nie pomyœla³em.
		}
		else if (dick_patrol_choice == 3)&&(patrol_trial == 8)
		{
			B_GiveXP (800);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_11"); //Spróbowa³em przekonaæ ich, ¿eby wynieœli siê do Starego Obozu, ale nie dali siê nabraæ. Wyr¿n¹³em ich z piratami.
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_12"); //Dobrze zrobi³eœ - gdyby negocjacje siê uda³y, Gomezowi przyby³oby mieczy w Obozie.
			
		}
		else// if (dick_patrol_choice == 0)&&(patrol_trial == 1)
		{
			B_GiveXP (1250);
			AI_Output (other, self, "DIA_RATFORD_PatrolFinish_15_13"); //Znalaz³em sukinsynów i wyr¿n¹³em do nogi bez niczyjej pomocy!
			AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_14"); //Niesamowite! Nie wygl¹dasz na takiego sukinsyna...	
		};
      
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_15"); //Dobrze siê sprawi³eœ, zas³u¿y³eœ na nagrodê i chwilê spokoju.
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_16"); //Wróæ do mnie, jak bêdziesz gotów.

      CreateInvItems (self, ItMiNugget, 200);
      B_GiveInvItems (self, other, ItMiNugget, 200);

		Log_SetTopicStatus(CH2_RBL_GuardCamp, LOG_SUCCESS);
		B_LogEntry(CH2_RBL_GuardCamp, "Za³atwi³em sprawê z patrolem. Ratford by³ zadowolony, ba, pozwoli³ mi nawet odpocz¹æ przed kolejnym zadaniem. Mam siê do niego zg³osiæ, jak bêdê gotów.");
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_PatrolFinish_07_17"); //Zdaje siê, ¿e widzia³em któregoœ z tych stra¿ników, do tego ¿ywego. Za³atw sprawê jak nale¿y.
	};
};

// **************************************************

INSTANCE DIA_RATFORD_Rock (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 18;
	condition		= DIA_RATFORD_Rock_Condition;
	information		= DIA_RATFORD_Rock_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz¹dku, jestem gotów."; 
};

FUNC INT DIA_RATFORD_Rock_Condition()
{
	if (rat_info == true)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Rock_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Rock_15_01"); //W porz¹dku, jestem gotów.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_02"); //Bardzo mnie to cieszy. 
	AI_Output (self, other, "DIA_RATFORD_Rock_07_03"); //Udowodni³eœ, ¿e radzisz sobie z ró¿nymi sytuacjami i robisz to doœæ skutecznie. Zadanie, które chcê Ci powierzyæ mo¿e mieæ ogromny wp³yw na przysz³oœæ naszego obozu.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_04"); //Brzmi powa¿nie.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_05"); //Niestety sam nie wiem za du¿o. Nasi magowie wysondowali Ÿród³o potê¿nej mocy w ruinach staro¿ytnej œwi¹tyni w dolinie.
	AI_Output (self, other, "DIA_RATFORD_Rock_07_06"); //Chcê, ¿ebyœ siê tam wybra³ i rozejrza³. Magowie s¹ przekonani, ¿e odnajdziemy tam coœ, co pomo¿e nam w walce z Gomezem.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_07"); //Jak¹ mam pewnoœæ, ¿e znajdê tam coœ wiêcej ni¿ kurz?
	AI_Output (self, other, "DIA_RATFORD_Rock_07_08"); //¯adn¹. Tacy w³aœnie s¹ magowie, nigdy z nimi nie ma pewnoœci. Ale w naszej sytuacji musimy szukaæ pomocy wszêdzie gdzie to mo¿liwe.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_09"); //Rozumiem. Gdzie znajdê ruiny?
	AI_Output (self, other, "DIA_RATFORD_Rock_07_10"); //WeŸ tê mapê, magowie zaznaczyli na niej po³o¿enie œwi¹tyni. 

	CreateInvItems (self, KatarMap_Tomb,1); 
	B_GiveInvItems (self, other, KatarMap_Tomb, 1);
	AI_Output (self, other, "DIA_RATFORD_Rock_07_11"); //B¹dŸ ostro¿ny. To pradawna budowla, nie wiadomo, co kryje siê w jej trzewiach.
	AI_Output (other, self, "DIA_RATFORD_Rock_15_12"); //Ostro¿noœæ to moje drugie imiê, przyjacielu. Bywaj.

	Log_CreateTopic(CH2_RBL_Journey, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Journey, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Journey, "Ratford chce, ¿ebym rozejrza³ siê w ruinach jakiejœ œwi¹tyni. Podobno magowie wyczuli tam jakieœ Ÿród³o mocy, które mog³oby nam pomóc w walce z Gomezem. Ratford da³ mi mapê z zaznaczon¹ lokacj¹ tej œwi¹tyni. Znowu czeka mnie spacer wœród kurzu i zbutwia³ych koœci...");
	B_LogEntry(CH2_RBL_Hunter, "Ratford wys³a³ mnie do ruin, aby zadowoliæ magów, szukaj¹c jakiegoœ Ÿród³a mocy.");
	//OW_GROBOWIEC_01
};

var int rat_wait;

// **************************************************

INSTANCE DIA_RATFORD_RockEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 19;
	condition		= DIA_RATFORD_RockEnd_Condition;
	information		= DIA_RATFORD_RockEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "By³em w œwi¹tyni."; 
};

FUNC INT DIA_RATFORD_RockEnd_Condition()
{
	if (NPC_HasItems(other,Katrakanat_book)>=1)&&(NPC_HasItems(other,Katrakanat_piece)>=1)&&(Npc_KnowsInfo (hero, DIA_RATFORD_Rock))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RockEnd_Info()
{
	B_GiveXP (500);
   
	AI_Output (other, self, "DIA_RATFORD_RockEnd_15_01"); //By³em w œwi¹tyni.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_02"); //Co tam znalaz³eœ?
	AI_Output (other, self, "DIA_RATFORD_RockEnd_15_03"); //Miêdzy innymi ksiêgê i fragment 'czegoœ'.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_04"); //Daj mi to...
	
   B_GiveInvItems (other, self, Katrakanat_book, 1);
	B_GiveInvItems (other, self, Katrakanat_piece, 1);
	Npc_RemoveInvItems(self,Katrakanat_book,1);
	Npc_RemoveInvItems(self,Katrakanat_piece,1);
	
   AI_Output (self, other, "DIA_RATFORD_RockEnd_07_05"); //Ksiêga niemal¿e rozsypuje siê w rêkach. A ten kawa³ek musia³ byæ czêœci¹ czegoœ wiêkszego.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_06"); //To powinno zadowoliæ magów. Zaniosê im Twoj¹ zdobycz, jak tylko znajdê chwilkê.
	AI_Output (self, other, "DIA_RATFORD_RockEnd_07_07"); //Wróæ jutro, wtedy bêdê wiedzia³ coœ wiêcej o tych przedmiotach.
	
   rat_wait = B_SetDayTolerance()+1;
	Log_SetTopicStatus(CH2_RBL_Journey, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Journey, "Odda³em Ratfordowi ksiêgê i kawa³ek kamienia, które znalaz³em w œwi¹tyni. Powiedzia³, ¿e zaniesie to magom i kaza³ mi przyjœæ na drugi dzieñ.");
};

// **************************************************

INSTANCE DIA_RATFORD_Book (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 20;
	condition		= DIA_RATFORD_Book_Condition;
	information		= DIA_RATFORD_Book_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Book_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RockEnd))&&(rat_wait <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Book_Info()
{
	katar_rytual = TRUE;
   
	AI_Output (self, other, "DIA_RATFORD_Book_07_01"); //Niedawno wróci³em od magów. Przeprowadzili rytua³, ale wynik³y pewne... komplikacje.
	AI_Output (other, self, "DIA_RATFORD_Book_15_02"); //Co siê sta³o?
	AI_Output (self, other, "DIA_RATFORD_Book_07_03"); //Zaklêcia, którymi ob³o¿ono ten almanach s¹ zbyt potê¿ne, aby móg³ je zneutralizowaæ, któryœ z naszych magów.
	AI_Output (self, other, "DIA_RATFORD_Book_07_04"); //Zdo³ali jedynie st³umiæ mroczn¹ aurê ksiêgi.
	AI_Output (other, self, "DIA_RATFORD_Book_15_05"); //To œwietnie, ale jaki to ma zwi¹zek ze mn¹?
	AI_Output (self, other, "DIA_RATFORD_Book_07_06"); //Magowie twierdz¹, ¿e ksiêgi nie mo¿e otworzyæ nikt, kto w³ada moc¹ od jakiegokolwiek boga.
	AI_Output (self, other, "DIA_RATFORD_Book_07_07"); //Powiedzieli, ¿e musi to byæ ktoœ czysty, nie 'zbrukany' magi¹.
	AI_Output (other, self, "DIA_RATFORD_Book_15_08"); //A ty radoœnie pomyœla³eœ o mnie?
	AI_Output (self, other, "DIA_RATFORD_Book_07_09"); //Wiem, jak to wygl¹da, ale nie mamy wyboru. Potrzebujemy ka¿dej pomocy do walki o przetrwanie, a ta ksiêga ma ogromn¹ moc.
	AI_Output (self, other, "DIA_RATFORD_Book_07_10"); //Tajemnice, które skrywa mog¹ uratowaæ nas wszystkich...
	AI_Output (other, self, "DIA_RATFORD_Book_15_11"); //Albo zniszczyæ.
	AI_Output (self, other, "DIA_RATFORD_Book_07_12"); //Zdajê sobie z tego sprawê. Musimy zaryzykowaæ.
	AI_Output (other, self, "DIA_RATFORD_Book_15_13"); //To œwietnie, ale znajdŸ sobie innego idiotê. Nie bêdê nara¿a³ ¿ycia tylko po to, ¿eby zadowoliæ ego kilku magów.
	AI_Output (self, other, "DIA_RATFORD_Book_07_14"); //Nikt prócz Ciebie nie mo¿e otworzyæ ksiêgi.
	AI_Output (other, self, "DIA_RATFORD_Book_15_15"); //To jakieœ brednie...
	AI_Output (self, other, "DIA_RATFORD_Book_07_16"); //Ty pierwszy dotkn¹³eœ inkunabu³u. Magowie uwa¿aj¹, ¿e ten dotyk zosta³... zapamiêtany.
	AI_Output (other, self, "DIA_RATFORD_Book_15_17"); //Cholerny be³kot opêtanych magi¹ idiotów! Dobra, daj almanach. Zobaczymy, co siê stanie.
	
   CreateInvItems (self,Katrakanat_book,1);	
	B_GiveInvItems (self, other, Katrakanat_book, 1);
	
   AI_Output (self, other, "DIA_RATFORD_Book_07_18"); //Wierzê w Ciebie, przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_Book_15_19"); //Naiwniak z Ciebie, ale niech bêdzie.
	
   Log_CreateTopic(CH2_RBL_MysteryBook, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_MysteryBook, LOG_RUNNING);
	B_LogEntry(CH2_RBL_MysteryBook, "Magowie przeprowadzili rytua³, jednak nie mog¹ otworzyæ ksiêgi - podobno tylko ja mogê to uczyniæ. Po prostu œwietnie...");
	B_StopProcessInfos(self);
};

/**************************************************/

var int book_name;

INSTANCE DIA_RATFORD_BookKnow (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 21;
	condition		= DIA_RATFORD_BookKnow_Condition;
	information		= DIA_RATFORD_BookKnow_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przeczyta³em ksiêgê."; 
};

FUNC INT DIA_RATFORD_BookKnow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Book))&&(open_kart)&&(!book_name)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_BookKnow_Info()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_01"); //Przeczyta³em ksiêgê.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_02"); //I co?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_03"); //I ¿yjê!
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_04"); //To widzê, ale co tam by³o napisane?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_05"); //Same brednie i jakiœ traktat w obcym jêzyku.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_06"); //Nic wiêcej?! Powiedz dok³adnie co to za brednie.
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_07"); //'Ten, który zechce wyrzec siê œcie¿ki mroku i pod¹¿y drog¹ œwiat³a, pozna prawdziwe Ÿród³o pradawnej potêgi.'
	AI_Output (other, self, "DIA_RATFORD_BookKnow_15_08"); //'Dane mu bêdzie u¿yæ jej, aby skruszyæ ³añcuchy zapomnienia i zg³êbiæ tajemnicê przeklêtego imienia, z pierwszych znaków s³ów spisanych winem ¿ycia...'
	AI_Output (self, other, "DIA_RATFORD_BookKnow_07_09"); //Hmm, rzeczywiœcie doœæ zawi³a zagadka. Ale coœ mi œwita.
	AI_Output (other, self, "DIA_RATFORD_BookKnow_07_10"); //'z pierwszych znaków s³ów spisanych winem ¿ycia...'
	AI_Output (self, other, "DIA_RATFORD_BookKnow_15_11"); //To musi byæ klucz do ksiêgi. Tylko co to mo¿e oznaczaæ?

	Info_ClearChoices (DIA_RATFORD_BookKnow);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Nie mam pojêcia.", DIA_RATFORD_BookKnow_No);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Mo¿e trzeba po³¹czyæ pierwsze litery ka¿dego wersu?", DIA_RATFORD_BookKnow_Know);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Pewnie trzeba z³o¿yæ wyraz z pierwszych liter pierwszego zdania.", DIA_RATFORD_BookKnow_Maybe);
	Info_AddChoice (DIA_RATFORD_BookKnow, "Gdyby tak wzi¹æ pierwszy znak z ka¿dego wyrazu w ka¿dym zdaniu...", DIA_RATFORD_BookKnow_Hmm);
};

FUNC VOID DIA_RATFORD_BookKnow_No()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_No_15_01"); //Nie mam pojêcia.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_No_07_02"); //Móg³byœ siê bardziej wysiliæ.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

FUNC VOID DIA_RATFORD_BookKnow_Know()
{
	book_name = TRUE;
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_01"); //Mo¿e trzeba po³¹czyæ pierwsze litery ka¿dego wersu?
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_02"); //Brzmi rozs¹dnie. A co z tego powstanie?
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_03"); //Daj mi chwilê...
	
	/**************************
		Ork da siê zrobiæ, ¿eby przeczyta³ ksiêgê?
		***************************/
	B_UseFakeScroll(other);
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Know_15_04"); //K-A-T-R-A-K-A-N-A-T...
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_05"); //Niech mnie szlag, je¿eli wiem o co chodzi.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_06"); //Muszê pogadaæ z magami. Wróæ do mnie jutro...
	//		AI_Output (self, other, "DIA_RATFORD_BookKnow_Know_07_06"); //Udaj siê do magów, powiedz o tym co uda³o nam siê odkryæ Miltenowi. Wróæ do mnie jak najszybciej.

	rat_wait = B_SetDayTolerance()+1;
	B_LogEntry(CH2_RBL_MysteryBook, "Uda³o nam siê rozwik³aæ zagadkê ksiêgi, ukryte s³owo brzmi K-A-T-R-A-K-A-N-A-T. Ratford znowu poszed³ pogadaæ z magami, mam z nim porozmawiaæ jutro.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_RATFORD_BookKnow_Maybe()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Maybe_15_01"); //Pewnie trzeba z³o¿yæ wyraz z pierwszych liter pierwszego zdania.
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Maybe_07_02"); //Mo¿liwe, ale to zbyt proste. Nie, to musi byæ coœ innego.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

FUNC VOID DIA_RATFORD_BookKnow_Hmm()
{
	AI_Output (other, self, "DIA_RATFORD_BookKnow_Hmm_15_01"); //Gdyby tak wzi¹æ pierwszy znak z ka¿dego wyrazu w ka¿dym zdaniu...
	AI_Output (self, other, "DIA_RATFORD_BookKnow_Hmm_07_02"); //To wysz³oby nam kolejne zdanie, a nie wyraz. To nie to.
	Info_ClearChoices (DIA_RATFORD_BookKnow);
};

// **************************************************

INSTANCE DIA_RATFORD_Search (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 22;
	condition		= DIA_RATFORD_Search_Condition;
	information		= DIA_RATFORD_Search_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_Search_Condition()
{
	if (book_name == TRUE)&&(rat_wait <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Search_Info()
{
	//todo: trigger zmieniajacy nazwe jezeli (rat_wait <= (Wld_GetDay())
	//Katrakanat_book.name = "Katrakanat - pieœñ demona";
	AI_Output (self, other, "DIA_RATFORD_Search_07_01"); //Magowie sporo siê dowiedzieli.
	AI_Output (self, other, "DIA_RATFORD_Search_07_02"); //Ksiêga, któr¹ znalaz³eœ, rzeczywiœcie nazywa siê Katrakanat, jednak tajemnice, które skrywa powinny zostaæ zapomniane na wieki.
	AI_Output (self, other, "DIA_RATFORD_Search_07_03"); //Przynajmniej ja tak uwa¿am. Jednak Cavalorn i magowie maj¹ odmienne zdanie.
	AI_Output (other, self, "DIA_RATFORD_Search_15_04"); //O czym mówi ksiêga?
	AI_Output (self, other, "DIA_RATFORD_Search_07_05"); //Zdradza sposób na uwolnienie potê¿nego demona...
	AI_Output (other, self, "DIA_RATFORD_Search_15_06"); //Co?! A wy chcecie siê nim pos³u¿yæ w walce z Gomezem? Jesteœcie idiotami. 
	AI_Output (self, other, "DIA_RATFORD_Search_07_07"); //Powiedzia³em to samo. Demon mo¿e okazaæ siê... nieprzewidywalny. Jak¹ mamy pewnoœæ, ¿e nie zabije ka¿dej ¿ywej istoty, któr¹ napotka?
	AI_Output (other, self, "DIA_RATFORD_Search_15_08"); //¯adn¹ i magowie dobrze o tym wiedz¹.
	AI_Output (self, other, "DIA_RATFORD_Search_07_09"); //Tak, ale Cavalorn chce zaryzykowaæ. Poza tym demon ju¿ d³ugo by³ uwiêziony, bêdzie bardzo os³abiony i zanim odzyska pe³n¹ moc, minie sporo czasu.
	AI_Output (other, self, "DIA_RATFORD_Search_15_10"); //No dobra, a co ja mam zrobiæ?
	AI_Output (self, other, "DIA_RATFORD_Search_07_11"); //Po tym jak pozna³eœ imiê demona, magowie zdo³ali odczytaæ fragmenty tekstu.
	AI_Output (self, other, "DIA_RATFORD_Search_07_12"); //Ci, którzy zdo³ali uwiêziæ demona, rozbili na siedem czêœci kamieñ, w którym zaklêli jestestwo istoty.
	AI_Output (self, other, "DIA_RATFORD_Search_07_13"); //Wszystkie kawa³ki s¹ dobrze ukryte tutaj, w Dolinie Górniczej. 
	AI_Output (self, other, "DIA_RATFORD_Search_07_14"); //Magowie dotarli te¿ do fragmentu mówi¹cego o mapie. Dlatego poœwiêcili ca³¹ noc na okreœlenia miejsc ukrycia kamieni.
	AI_Output (other, self, "DIA_RATFORD_Search_15_15"); //Dlaczego akurat noc?
	AI_Output (self, other, "DIA_RATFORD_Search_07_16"); //Ka¿da z pierwszy liter ka¿dego z wersów daje te¿ pocz¹tek nazwom gwiazd. Ci, którzy uwiêzili demona wykorzystali mapê nieba do ukrycia kawa³ków kamienia.
	AI_Output (other, self, "DIA_RATFORD_Search_15_17"); //Nie rozumiem...
	AI_Output (self, other, "DIA_RATFORD_Search_07_18"); //Odbicie nocnego nieba jest map¹, a szeœæ najwa¿niejszych gwiazd wskazuje miejsca ukrycia kawa³ków Katrakanatu.
	AI_Output (self, other, "DIA_RATFORD_Search_07_19"); //To jest ta mapa, s¹ na niej zaznaczone wszystkie miejsca, gdzie zosta³y ukryte kawa³ki kamienia. Oczywiœcie o ile magowie siê nie pomylili...
	
   CreateInvItems (self, KatarMap, 1);
	B_GiveInvItems (self, other, KatarMap, 1);
	
   AI_Output (self, other, "DIA_RATFORD_Search_07_20"); //Owocnych poszukiwañ przyjacielu, czeka Ciê d³uga droga.
	AI_Output (other, self, "DIA_RATFORD_Search_15_21"); //Jak zawsze to ja muszê odwalaæ brudn¹ robotê...

	B_LogEntry(CH2_RBL_MysteryBook, "Muszê odnaleŸæ pozosta³ych piêæ czêœci Katrakanat - kamienia demonów. To co mo¿na przywo³aæ po z³o¿eniu kamienia mo¿e pomóc nam w walce z Gomezem... albo nas zabiæ. Nie mam jednak wyboru, to nie na mnie spadnie krew niewinnych, je¿eli coœ pójdzie nie tak jak powinno.");
	B_LogEntry(CH2_RBL_Hunter, "Tajemniczym Ÿród³em z ruin by³a ksiêga, w której zapisano miejsca ukrycia piêciu czêœci kamienia Katrakanat.");
	
	Wld_InsertItem(katrakanat_piece2,"FP_KATRAKANAT_1_SPAWN");
	Wld_InsertItem(katrakanat_piece3,"FP_KATRAKANAT_2_SPAWN");
	Wld_InsertItem(katrakanat_piece4,"FP_KATRAKANAT_3_SPAWN");
	Wld_InsertItem(katrakanat_piece5,"FP_KATRAKANAT_4_SPAWN");
	Wld_InsertItem(katrakanat_piece6,"FP_KATRAKANAT_5_SPAWN");
};

// **************************************************

var int Katrakanat_collected;
INSTANCE DIA_RATFORD_SearchEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 24;
	condition		= DIA_RATFORD_SearchEnd_Condition;
	information		= DIA_RATFORD_SearchEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam wszystkie czêœci Katrakanat."; 
};

FUNC INT DIA_RATFORD_SearchEnd_Condition()
{
	//todo
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Search))&&(!Katrakanat_collected)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchEnd_Info()
{
	AI_Output (other, self, "DIA_RATFORD_SearchEnd_15_21"); //Mam wszystkie czêœci Katrakanat.
	AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_02"); //Naprawdê?

	if ((NPC_HasItems(other,Katrakanat_piece2)>=1)&&(NPC_HasItems(other,Katrakanat_piece3)>=1)&&(NPC_HasItems(other,Katrakanat_piece4)>=1)&&(NPC_HasItems(other,Katrakanat_piece5)>=1)&&(NPC_HasItems(other,Katrakanat_piece6)>=1))
	{
		Katrakanat_collected=TRUE;
		B_GiveXP (1200);
      
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_03"); //A niech mnie, rzeczywiœcie zdoby³eœ szeœæ czêœci.
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_04"); //Magowie dostan¹ na ten widok œlinotoku.
		
		//Sher, popraw dialog jak cos:
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_05"); //Powiedz Miltenowi, ¿e zdoby³eœ Katrakanat, ja przechowam fragmenty do twojego powrotu.
		
      B_GiveInvItems			(other,self,katrakanat_piece2,1);
		B_GiveInvItems			(other,self,katrakanat_piece3,1);
		B_GiveInvItems			(other,self,katrakanat_piece4,1);
		B_GiveInvItems			(other,self,katrakanat_piece5,1);
		B_GiveInvItems			(other,self,katrakanat_piece6,1);
		B_GiveInvItems			(other,self,katrakanat_piece,1);
		
		NPC_RemoveInvItem			(self,katrakanat_piece2);
		NPC_RemoveInvItem			(self,katrakanat_piece3);
		NPC_RemoveInvItem			(self,katrakanat_piece4);
		NPC_RemoveInvItem			(self,katrakanat_piece5);
		NPC_RemoveInvItem			(self,katrakanat_piece6);
		NPC_RemoveInvItem			(self,katrakanat_piece);
		
		//Sher, popraw wpis jak cos:
		B_LogEntry(CH2_RBL_MysteryBook, "Odda³em Ratfordowi szeœæ czêœci Katrakanat, kaza³ mi poinformowaæ o tym Miltena.");
		//AI_Output (other, self, "DIA_RATFORD_SearchEnd_15_06"); //Nied³ugo wrócê, poczekaj tu na mnie.

		/*******************************
	Ork tu by siê kamerka przyda³a, ¿eby dick widzia³ jak Ratford idzie do magów, ale niech nie pokazuje jak ju¿ dochodzi i wraca, ¿eby by³o z³udzenie, ¿e tam z nimi gada naprawdê, poka¿ obóz z lotu ptaka, co tam chcesz
	*******************************/
		//Npc_ExchangeRoutine(self,"mags");
	}
	else if (NPC_HasItems(other,Katrakanat_piece)>=1)&&((NPC_HasItems(other,Katrakanat_piece)>=1)||(NPC_HasItems(other,Katrakanat_piece2)>=1)||(NPC_HasItems(other,Katrakanat_piece3)>=1)||(NPC_HasItems(other,Katrakanat_piece4)>=1)||(NPC_HasItems(other,Katrakanat_piece5)>=1)||(NPC_HasItems(other,Katrakanat_piece6)>=1))
	{
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_07"); //Rzeczywiœcie masz przy sobie kawa³ek Katrakanat, ale poczekam a¿ odzyskasz wszystko.
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_08"); //Zachowaj to co masz i wróæ, jak znajdziesz wszystkie.
	}
	else//no katrakanat pieces
	{
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_09"); //Nie denerwuj mnie, nawet jeszcze nie rozpocz¹³eœ poszukiwañ!
		AI_Output (self, other, "DIA_RATFORD_SearchEnd_07_10"); //Wróæ z kawa³kami Katrakanat.	
	};
   
   B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_RATFORD_SearchAgain (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 25;
	condition		= DIA_RATFORD_SearchAgain_Condition;
	information		= DIA_RATFORD_SearchAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_SearchAgain_Condition()
{
	if (Katrakanat_collected==3)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchAgain_Info()
{
	//That's crappy dialog has been created by orc /modified

	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_01"); //Jak posz³a rozmowa?
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_02"); //Nie mogli uwierzyæ, ¿e zdoby³em Katrakanat. Milten wspomina³ coœ o odprawieniu rytua³u.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_03"); //W takim razie nie bêdê Ciê zatrzymywa³.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_04"); //Bardzo zabawne. Muszê jeszcze znaleŸæ wodê œwiêcon¹ i pos¹¿ek Innosa.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_05"); //Dasz sobie radê.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_10"); //Gdzie ja znajdê w Kolonii Karnej wodê œwiecon¹ i pos¹¿ek Innosa?
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_11"); //Powiem szczerze, ¿e nie mam zielonego pojêcia. Kiedyœ na wyspie przebywali paladyni i magowie, mo¿e znajdziesz pos¹¿ek w jakimœ grobowcu.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_12"); //Najlepiej pogadaj z Quentinem, zna œwietnie wyspê, mo¿e bêdzie wiedzia³ coœ wiêcej.
	AI_Output (self, other, " DIA_RATFORD_SearchAgain_07_13"); //Co do wody œwiêconej, to kiedyœ Piwosz odgra¿a³ siê, ¿e zrobi³ samogon poœwiêcony samemu Innosowi.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain_15_14"); //Dobra, rozejrzê siê za pos¹¿kiem i samogonem. Ale to ju¿ ostatni raz kiedy latam po Kolonii jak jakiœ ¿ó³todziób.

	/*******************************
	Ork pos¹¿ek mo¿e gdzieœ z jakimœ skarbem siê da razem, czyli dick musi trochê pokopaæ, odpocznie sobie od fabu³y g³ównej - da³em ju¿ takie zadanie od jacka
	*******************************/

	B_LogEntry(CH2_RBL_MysteryBook, "Quentin mo¿e wiedzieæ, gdzie znaleœæ pos¹¿ek, powinieniem siê do niego udaæ.");
	B_LogEntry(CH2_RBL_MysteryBook, "Piwosz by³ kiedyœ w posiadaniu wody œwiêconej.");
};

// **************************************************

INSTANCE DIA_RATFORD_SearchAgain2 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 26;
	condition		= DIA_RATFORD_SearchAgain2_Condition;
	information		= DIA_RATFORD_SearchAgain2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em pos¹¿ek i œwiêcon¹... wódê."; 
};

FUNC INT DIA_RATFORD_SearchAgain2_Condition()
{
	//TODO /TEMP
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))&& (NPC_HasItems(other,innos_statue)>=1)&& (NPC_HasItems(other,ItFo_Innos_Booz)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_SearchAgain2_Info()
{
	B_GiveXP (600);
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_01"); //Znalaz³em pos¹¿ek i œwiêcon¹... wódê.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_02"); //Œwietna robota! Chwila, powiedzia³eœ wódê?
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_03"); //Piwosz zrobi³ z wody œwiêconej samogon.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_04"); //Cholerny idiota, ale to powinno nam wystarczyæ.
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_05"); //Teraz musisz wróciæ do œwi¹tyni, tam gdzie znalaz³eœ ksiêgê i odprawiæ rytua³ na o³tarzu poœwiêconym Innosowi.
	AI_Output (other, self, "DIA_RATFORD_SearchAgain2_15_06"); //Co dok³adnie muszê z³o¿yæ na o³tarzu?
	AI_Output (self, other, "DIA_RATFORD_SearchAgain2_07_07"); //Ustaw na nim pos¹¿ek, po³ó¿ dooko³a statuy czêœci Katranakat, oblej wszystko samogonem i odmów modlitwê ku chwale Innosa.
	
   B_LogEntry(CH2_RBL_MysteryBook, "Mam ju¿ pos¹¿ek i œwiêcony bimber Innosa. Muszê przeprowadziæ rytua³ na o³tarzu w œwi¹tyni Innosa. ¯eby to zrobiæ, muszê ustawiæ na o³tarzu pos¹¿ek, dooko³a niego po³o¿ê wszystkie czêœci Katrakanat, oblejê o³tarz wod¹ œwiêcon¹ i zmówiê modlitwê ku chwale Innosa. A jak bêdê mia³ szczêœcie, to mo¿e nawet to prze¿yjê....");
	
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_05"); //Cholera, dlaczego któryœ z magów tego nie zrobi?
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_06"); //Bo to zbyt... ryzykowne. Nie do koñca wiadomo, jak mo¿e skoñczyæ siê boska interwencja. Mo¿e zostaæ z Ciebie kupka popio³u, albo tylko postradasz zmys³y...
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_07"); //Rozumiem, mnie mo¿na poœwiêciæ, magowie s¹ zbyt cenni.
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_08"); //Nie to chcia³em powiedzieæ.
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_09"); //Dobra, miejmy to ju¿ za sob¹.	
   Wld_InsertNpc(Zombie_Katrakanat,"FP_ROAM_OW_SNAPPER_WOOD05_02");	
	B_StopProcessInfos(self);

	//Npc_ExchangeRoutine(self,"mags");

	B_GiveInvItems(self,other,katrakanat_piece2,1);
	B_GiveInvItems(self,other,katrakanat_piece3,1);
	B_GiveInvItems(self,other,katrakanat_piece4,1);
	B_GiveInvItems(self,other,katrakanat_piece5,1);
	B_GiveInvItems(self,other,katrakanat_piece6,1);
	B_GiveInvItems(self,other,katrakanat_piece,1); 
};

// **************************************************

INSTANCE DIA_RATFORD_RytualEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 28;
	condition		= DIA_RATFORD_RytualEnd_Condition;
	information		= DIA_RATFORD_RytualEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "To znowu ja."; 
};

FUNC INT DIA_RATFORD_RytualEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain2))&& (NPC_HasItems(other,Katrakanat)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RytualEnd_Info()
{
	B_GiveXP (400);
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_01"); //To znowu ja.
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_02"); //Widzê, i to w jednym kawa³ku. Uda³o siê?
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_03"); //Tak, kamienie scali³y siê, mam Katrakanat.
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_04"); //Wiedzia³em, ¿e zdo³asz tego dokonaæ! Daj mi to cholerstwo i wróæ o pó³nocy.
   
	B_GiveInvItems (other, self, Katrakanat, 1);
	Npc_RemoveInvItems(self,Katrakanat,1);
   
	AI_Output (self, other, "DIA_RATFORD_RytualEnd_07_05"); //Wtedy magowie odprawi¹ te swoje gus³a i w koñcu przekonamy siê, co kryje kamieñ.
	AI_Output (other, self, "DIA_RATFORD_RytualEnd_15_06"); //Postaram siê nie zapomnieæ.
	B_LogEntry(CH2_RBL_MysteryBook, "Odda³em Katrakanat Ratfordowi. Mam wróciæ o pó³nocy, aby uczestniczyæ w ostatecznej próbie wyzwolenia potêgi Katrakanat. W¹tpiê, ¿eby to by³ dobry pomys³, ale chyba warto to zobaczyæ na w³asne oczy...");
	
	B_StopProcessInfos(self);
	/*****************************
	Ork dorób im te rutyny niech siê ustawi¹ od 00 do 02 w jakimœ miejscu odpowiednim
	****************************/

	Npc_ExchangeRoutine(leren,"rytual");
	Npc_ExchangeRoutine(cavalorn,"rytual");
	Npc_ExchangeRoutine(self,"rytual");
};

// **************************************************

INSTANCE DIA_RATFORD_RytualFinish (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 29;
	condition		= DIA_RATFORD_RytualFinish_Condition;
	information		= DIA_RATFORD_RytualFinish_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_RytualFinish_Condition()
{
	//todo: remove if
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RytualEnd))&&(Wld_IsTime (23,50,04,30))&&(Npc_GetDistToWP(self,"WP_KAT_DEMON")<1500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RytualFinish_Info()
{
	AI_Output (self, other, "DIA_RATFORD_RytualDo_07_01"); //Przyby³eœ w sam¹ porê - zaczê³o siê!
	AI_Output (other, self, "DIA_RATFORD_RytualDo_15_02"); //Mam nadziejê, ¿e nie bêdê tego ¿a³owa³...
	B_StopProcessInfos(self);
	Ritual_Katrakanat_demon_counter=0;
	Katrakanat_collected=4;	
	Wld_SendTrigger("RITUAL_KATRAKANAT_SCRIPT");
	/****************************
	Ork nie mam zielonego pojêcia jak to chcesz zrobiæ wiêc nie bêde nic kombinowa³.
	Ale mo¿na by to zrobiæ podobnie jak rytua³ z okiem innosa w G2 z tym, ¿e lepiej ;) A to moja propozycja:
	- mag zaczyna rytua³, animacja practice + jakieœ obszarowe pfxy
	- nagle eksplozja, jakiœ pfx, mag pada na ziemiê jak walniêty przez kamiennego golema
	- pojawia siê paskudny demon a pod spodem jego tekst [instancje demona sam zrób]
	D: G³upcy, uwolniliœcie wiêcej ni¿ ten brudny œwiat mo¿e zdier¿yæ!
	D: Unurzam tê krainê we krwi i ogniu a potem rozszarpiê wszystkie nieœmiertelne dusze...
	ustaw zmienn¹ globaln¹ demon_appear = TRUE; bo bêdzie potrzebna w dialogu

	- Cavalorn leci za demonem - to jeszcze ty zrób.
	- [to ju¿ ja zrobi³em] Dick w koñcu jest odblokowany, leci z Ratfordem za Cavalornem, znajduj¹ go rannego, ale przytomnego, mówi, ¿e Demon uciek³, ble, ble...

	****************************/

	//Rytual_Katrakanat ();
};

// **************************************************

INSTANCE DIA_RATFORD_Demon (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 30;
	condition		= DIA_RATFORD_Demon_Condition;
	information		= DIA_RATFORD_Demon_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_Demon_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_RytualFinish))&&(Ritual_Katrakanat_demon_counter == 11)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Demon_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_RATFORD_Demon_07_01"); //Ten skurwiel zabije Cavalorna! Biegnij za mn¹!
	Party_AddNpc(self);
	B_LogEntry(CH2_RBL_MysteryBook, "Demon siê uwolni³, Leren le¿y nieprzytomny, a Cavalorn pobieg³ za besti¹. Musimy mu pomóc...");
	B_StopProcessInfos(self);

	/*****************
	Dodaj mu rutynê pod¹¿ania
	*****************/
	Npc_ExchangeRoutine(self,"rytualguide");
};

// **************************************************

INSTANCE DIA_RATFORD_DemonGo (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 5;
	condition		= DIA_RATFORD_DemonGo_Condition;
	information		= DIA_RATFORD_DemonGo_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RATFORD_DemonGo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Demon))&&(Npc_GetDistToWP (self,"LOCATION_23_01") < 900 )
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DemonGo_Info()
{
	B_FullStop (hero);
	B_FullStop (self);
	AI_GotoWP(other,"demon1");
	AI_GotoWP(self,"demon2");
	AI_Output (self, other, "DIA_RATFORD_DemonGo_07_01"); //SpóŸniliœmy siê...
	AI_Output (other, self, "DIA_RATFORD_DemonGo_15_02"); //Dobrze, ¿e Cavalorn ¿yje.
	AI_Output (self, other, "DIA_RATFORD_DemonGo_07_03"); //Pogadaj z nim, ja sprawdzê co z Lerenem.
	Party_RemoveNpc(self);
	B_LogEntry(CH2_RBL_MysteryBook, "Demona nigdzie nie widaæ - muszê porozmawiaæ z Cavalornem.");
   Log_SetTopicStatus(CH2_RBL_MysteryBook, LOG_SUCCESS);
	B_StopProcessInfos(self);

	/*****************
	Dodaj mu rutynê pod¹¿ania
	*****************/
	Npc_ExchangeRoutine(self,"rytualAfter");
	Npc_ExchangeRoutine(leren,"rytualAfter");
};

// **************************************************

INSTANCE DIA_RATFORD_ExterminatePatrols (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 31;
	condition		= DIA_RATFORD_ExterminatePatrols_Condition;
	information		= DIA_RATFORD_ExterminatePatrols_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak siê czuje mag?"; 
};

FUNC INT DIA_RATFORD_ExterminatePatrols_Condition()
{
	// rytual after - jak juz tam dojdzie, leren powinien byc na tym miejscu a wiec "juz sie zapytal maga jak sie czuje"// OW_PATH_02
	// not sure though require testing
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Demon)) //&& (Npc_GetDistToWP (self,"OW_PATH_02") < 900 )  
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_ExterminatePatrols_Info()
{
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_01"); //Jak siê czuje mag?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_02"); //Leren? Wy¿yje, magowie s¹ jak koty, zawsze spadaj¹ na cztery ³apy.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_03"); //Cavalorn porozmawia z magami, trzeba odnaleŸæ demona i skoñczyæ to, co tak nieopatrznie rozpoczêliœmy.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_04"); //Ano trzeba, ale póki co mam dla Ciebie inn¹ robótkê.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_05"); //Znowu? Chcia³em odpocz¹æ...
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_06"); //Odpoczniesz w grobie, przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_07"); //Bardzo zabawne. Dobra, mów o co chodzi.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_08"); //Kiedy ugania³eœ siê za Katrakanatem, pojawi³ siê kolejny problem.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_09"); //Gomez po niepowodzeniu poprzedniego patrolu postanowi³ wys³aæ ich wiêcej.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_10"); //Ile?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_11"); //Du¿o wiêcej, mo¿e nawet piêæ.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_12"); //Ale te patrole kontroluj¹ tylko obszar w pobli¿u Starego Obozu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_13"); //To niech sobie patroluj¹. Co nam to przeszkadza?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_14"); //Ano to, ¿e musimy oczyœciæ drogê do Starego Obozu.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_15"); //Po jak¹ cholerê mam wtykaæ kij w gniazdo szerszeni?
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_16"); //Mamy pewne plany co do inwigilacji Starego Obozu, dlatego musimy oczyœciæ drogê z patroli.
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_17"); //Wiesz co, zmieni³em zdanie. Wolê nie wiedzieæ, co knujecie. 
	AI_Output (other, self, "DIA_RATFORD_ExterminatePatrols_15_18"); //W porz¹dku, 'porozmawiam' ze stra¿nikami.
	AI_Output (self, other, "DIA_RATFORD_ExterminatePatrols_07_19"); //Œwietnie. Przynieœ mi jakiœ dowód, mog¹ byæ miecze. Poza tym broñ zawsze siê przyda.
	
	CreateInvItem(leren,ItArRuneHeal);	
	Spell_Heal_Npc(leren);
	B_ExchangeRoutine(leren,"start");
	Npc_ExchangeRoutine(self,"start");

	/*************************************
	Ork trzeba zrobiæ instancje tych patrolowców i wsadziæ ich do œwiata, ale ja nie wiem gdzie to nic nie robiê - myœlê, ¿e 5 patrloli po 2 stra¿ników wystarczy

	*************************************/
	Log_CreateTopic(CH2_RBL_Patrols, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Patrols, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Patrols, "Ech, nigdy nie odpocznê. Muszê pozbyæ siê patroli naoko³o Starego Obozu. Ratford za¿¹da³ mieczy stra¿ników jako dowodów.");

	Wld_InsertNpc(GRD_4070_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4071_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4072_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4073_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4074_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4075_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4076_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4077_Guard,"OC_ROUND_22");
	
	Wld_InsertNpc(GRD_4078_Guard,"OC_ROUND_22");
	Wld_InsertNpc(GRD_4079_Guard,"OC_ROUND_22");		
};

// **************************************************
var int ratford_patrols_success;

INSTANCE DIA_RATFORD_Patrols (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 32;
	condition		= DIA_RATFORD_Patrols_Condition;
	information		= DIA_RATFORD_Patrols_Info;
	permanent		= 1;
	important		= 0;
	description		= "Pozby³em siê patroli."; 
};

FUNC INT DIA_RATFORD_Patrols_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_ExterminatePatrols))&&(NPC_HasItems(other,GRD_Prl_Swd)) && (!ratford_patrols_success)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Patrols_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Patrols_15_01"); //Pozby³em siê patroli.

	if (NPC_HasItems(other,GRD_Prl_Swd)>=10)
	{
		B_GiveXP (1500);
		ratford_patrols_success = true;
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_02"); //Œwietna robota, ci stra¿nicy ju¿ nam nie zaszkodz¹.
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_03"); //Daj mi miecze i mo¿esz trochê odetchn¹æ. Zajmij siê w³asnymi sprawami.
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_04"); //Wróæ do mnie, jak bêdziesz gotów na kolejne harce.
		
		B_GiveInvItems(other,self,GRD_Prl_Swd,10);
		Npc_RemoveInvItems(self,GRD_Prl_Swd,10);
		Log_SetTopicStatus(CH2_RBL_Patrols, LOG_SUCCESS);
		B_LogEntry(CH2_RBL_Patrols, "Pozby³em siê patroli. Ratford kaza³ mi odpocz¹æ, mam z nim pogadaæ jak nabiorê si³.");
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_Patrols_07_05"); //Przynieœ mi wszystkie miecze.
	};
   
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_Raport (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 33;
	condition		= DIA_RATFORD_Raport_Condition;
	information		= DIA_RATFORD_Raport_Info;
	permanent		= 0;
	important		= 0;
	description		= "To o czym chcia³eœ pogadaæ?"; 
};

FUNC INT DIA_RATFORD_Raport_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_LastThreeFinish1))||(ratford_patrols_success)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Raport_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Raport_15_01"); //To o czym chcia³eœ pogadaæ?
	AI_Output (self, other, "DIA_RATFORD_Raport_07_02"); //Ju¿ od d³u¿szego czasu czekam na raport z Nowego Obozu. Jak pewnie siê domyœlasz, pos³aniec, którego wys³a³em, nie wróci³.
	AI_Output (other, self, "DIA_RATFORD_Raport_15_03"); //Mnie te¿ chcesz siê pozbyæ w ten sam sposób?
	AI_Output (self, other, "DIA_RATFORD_Raport_07_04"); //Wprost przeciwnie. Ju¿ nie raz udowodni³eœ, ¿e radzisz sobie w ka¿dej sytuacji.
	AI_Output (self, other, "DIA_RATFORD_Raport_07_05"); //Ruszaj do Nowego Obozu i rozejrzyj siê, mo¿e coœ Ci wpadnie w oko. Jak wrócisz, zdasz mi raport.
	AI_Output (other, self, "DIA_RATFORD_Raport_15_06"); //Nic za darmo Ratford. Nie bêdê nara¿a³ karku za dobre s³owo. 
	AI_Output (self, other, "DIA_RATFORD_Raport_07_07"); //Sam sobie wybierzesz nagrodê, jak wrócisz. 
	AI_Output (other, self, "DIA_RATFORD_Raport_15_08"); //Niech bêdzie. Bywaj.
	
   Log_CreateTopic(CH2_RBL_Raport, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Raport, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Raport, "Muszê pójœæ do Nowego Obozu i rozejrzeæ siê w sytuacji. Poprzedni pos³aniec nie wróci³, wiêc muszê zachowaæ ostro¿noœæ.");
	B_StopProcessInfos(self);
	//spawn gorn
	Wld_InsertNpc(PC_Fighter,"OW_PATH_064");		 //przed bram¹!
};

// **************************************************
// **************************************************

INSTANCE DIA_RATFORD_RaportDone (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 34;
	condition		= DIA_RATFORD_RaportDone_Condition;
	information		= DIA_RATFORD_RaportDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nowy Obóz upad³!"; 
};

FUNC INT DIA_RATFORD_RaportDone_Condition()
{
	if (Kapitel==3)&&(Npc_KnowsInfo (hero, DIA_Gorn_First))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_RaportDone_Info()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_01"); //Nowy Obóz upad³!
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_02"); //¯e co?!
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_03"); //Stra¿nicy zdobyli Nowy Obóz. Zaatakowali od frontu dla odwrócenia uwagi i jednoczeœnie uderzyli z ty³u. Chyba znaleŸli w górach ukryte przejœcie.
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_04"); //Na ow³osione jaja Beliara! No to mamy spory problem.
	AI_Output (other, self, "DIA_RATFORD_RaportDone_15_05"); //A co z moj¹ nagrod¹?
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_06"); //WeŸ ten pierœcieñ i powiedz Cavalornowi, co siê sta³o.
	CreateInvItems (self, Rat_ring,1); 	
	B_GiveInvItems (self, other, Rat_ring, 1);	
	AI_Output (self, other, "DIA_RATFORD_RaportDone_07_07"); //Nie mogê uwierzyæ. Nowy Obóz upad³...

	Log_SetTopicStatus(CH2_RBL_Raport, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Raport, "Powiedzia³em Ratfordowi, ¿e Nowy Obóz upad³. Rebeliant nie móg³ w to uwierzyæ. Muszê teraz porozmawiaæ z Cavalornem.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_OldCampSpy (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 35;
	condition		= DIA_RATFORD_OldCampSpy_Condition;
	information		= DIA_RATFORD_OldCampSpy_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_OldCampSpy_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_AIDAN_Eqquipment))&&(Npc_KnowsInfo (hero, DIA_Fox_Eqquipment)))||(Npc_KnowsInfo (hero, DIA_Leren_Eqqupiment))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OldCampSpy_Info()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Eqqupiment))//mag
	{
		AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_01"); //S³ysza³em, ¿e wybra³eœ drogê magii. Przyda siê nam ktoœ rozs¹dny wœród tych facetów w kieckach.
		AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_02"); //Mam nadziejê, ¿e nie bêdê tego ¿a³owa³.
	}
	else if (Npc_KnowsInfo (hero, DIA_Fox_Eqquipment))//hunter
	{
		AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_03"); //Zosta³eœ jednym z ³owców - œwietny wybór! Na pewno nie bêdziesz narzeka³ na nudê.
		AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_04"); //W to nie w¹tpiê.
	};
   
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_05"); //Cavalorn mówi³, ¿ebym siê do Ciebie zg³osi³. O co chodzi?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_06"); //Tym razem to powa¿na sprawa. Bêdziesz musia³ wykazaæ siê subtelnoœci¹ i sprytem.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_07"); //Chyba o czymœ zapomnia³em. Tak! Zostawi³em pieczyste nad ogniskiem, znajdŸ kogoœ innego do tej roboty. 
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_08"); //Nie ma nikogo innego. Musimy zinfiltrowaæ Stary Obóz.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_09"); //To mo¿e od razu rzucê siê na miecz, przynajmniej oszczêdzê trudu stra¿nikom Gomeza.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_10"); //To nie bêdzie potrzebne, wiêcej zdzia³asz ¿ywy. Mamy w obozie swojego cz³owieka. Nazywa siê Kelvin.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_11"); //Odnajdziesz go, a on wtajemniczy Ciê w nasze plany. Im bardziej zaszkodzimy Gomezowi i im wiêkszy chaos zasiejemy w szeregach wroga, tym lepiej dla nas.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_12"); //A jak niby mam siê dostaæ do Starego Obozu?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_13"); //Pogadaj z Leafem, ta szelma zna sposób na to jak tam wejœæ. Przynajmniej tak s³ysza³em od ch³opaków. Nie mam innego pomys³u.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_14"); //To naprawdê buduj¹ce, podnios³eœ mnie na duchu. 
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_15"); //No dobra, spróbujê. A ten Kelvin sk¹d bêdzie wiedzia³, ¿e jestem jednym z Was?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_16"); //O to siê nie bój. Przed atakiem na Star¹ Kopalniê wys³a³em mu wiadomoœæ, wie kogo ma siê spodziewaæ.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_17"); //Sprytne, ju¿ wtedy wiedzia³eœ, ¿e siê zgodzê. Cholera, mam za miêkkie serce.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_18"); //Ale masz przy tym tward¹ dupê, a to rzadko spotykana kombinacja. Poradzisz sobie Rick, nie znam nikogo innego, kto tak uparcie czepi³ siê ¿ycia.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy_15_19"); //Ech, a mog³em zostaæ ogrodnikiem, jak chcia³a mamusia...
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy_07_20"); //Aha i za³atw sobie wdzianko stra¿nika albo cienia. W pobli¿u Starego Obozu krêci siê nasz cz³owiek, nazywa siê Urt. Mo¿e za³atwi Ci jakieœ ³achy.
	Wld_InsertNpc(RBL_4062_Urt,"OC1");

	Log_CreateTopic(CH3_RBL_OldCampSpy, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampSpy, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampSpy, "No to wpad³em w spore gówno. Zgodzi³em siê, ¿eby znaleŸæ cz³owieka rebeliantów w Starym Obozie. Koleœ ma na imiê Kelvin i podobno wie kogo siê spodziewaæ. Muszê pogadaæ z Leafem, który niby zna sposób na to, jak wejœæ do Starego Obozu ¿ywcem. Muszê te¿ za³atwiæ sobie przebranie stra¿nika lub cienia, mo¿e mi w tym pomóc Urt - znajdê go gdzieœ w pobli¿u Starego Obozu.");
};

var int DIA_RATFORD_OldCampSpy1_deal;

// **************************************************

INSTANCE DIA_RATFORD_OldCampSpy1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 36;
	condition		= DIA_RATFORD_OldCampSpy1_Condition;
	information		= DIA_RATFORD_OldCampSpy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wieœci ze Starego Obozu."; 
};

FUNC INT DIA_RATFORD_OldCampSpy1_Condition()
{
	/*****************
	Zmieñ klucz jak ten jest z³y, poza tym drzwi s¹ ju¿ otwarte wiêc klucz i tak to œciema
	******************/
	if (Npc_KnowsInfo (hero,DIA_Urt_Kelvin1))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OldCampSpy1_Info()
{
	//Crappy dialog modified by orc
	B_GiveXP(1000);
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_01"); //Mam wieœci ze Starego Obozu.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_02"); //Mów.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_03"); //Przekona³em kopaczy do walki po stronie rebelii. Pzyprowadzi³em Diego do Starego Obozu, Cienie te¿ przy³¹cz¹ siê do naszej sprawy.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_04"); //Razem z Urtem zorganizuj¹ ludzi pod nosem Gomeza.
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_05"); //Niestety Kelvin nie ¿yje. Znalaz³em te notatki przy jego ciele.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_06"); //Szkoda Kelvina... Gomez zap³aci za œmieræ ka¿dego z moich ludzi po dwakroæ!
	AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_15_07"); //Co teraz?
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_18"); //Przygotujemy siê do ataku. Odpocznij, jutro mo¿e nas czekaæ niez³a jatka.
	AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_07_19"); //Aha, weŸ tê rudê. Przyda Ci siê. Wiêcej niestety nie mam.
   
   CreateInvItems (self, ItMiNugget, 400);
	B_GiveInvItems (self, other, ItMiNugget, 400);
   
   AI_Output (self, other, "DIA_RATFORD_OldCampSpy1_12_17"); //Oraz weŸ tê runê. Dziêki niej, bêdziesz móg³ siê szybko i bezpiecznie teleportowaæ do obozu.
   Create_and_give(ItArRuneTeleportToHuntersCamp, 1);
   AI_Output (other, self, "DIA_RATFORD_OldCampSpy1_12_18"); //Dziêki, przynajmniej nie bêdê musia³ tak wiele lataæ po kolonii. 
   
	B_GiveInvItems (other,self,kevin_diary,1);
	DIA_RATFORD_OldCampSpy1_deal = B_SetDayTolerance()+1;
	/*****************
	Zmieñ klucz jak ten jest z³y, poza tym drzwi s¹ ju¿ otwarte wiêc klucz i tak to œciema
	******************/

	B_GiveInvItems (other, self, ItKe_Secret_CM_Enter,1);
	Npc_RemoveInvItems(self,ItKe_Secret_CM_Enter,1);
	Log_SetTopicStatus(CH3_RBL_OldCampSpy, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampSpy, "Zda³em Ratfordowi raport. Mam czekaæ do jutra, wtedy dowiem siê czegoœ wiêcej o zamierzeniach rebeliantów. Chyba zas³u¿y³em na odpoczynek...");
	B_StopProcessInfos(self);
   
   Wld_SendUnTrigger("EVT_OC_INNERMAINGATE");
};

// **************************************************

INSTANCE DIA_RATFORD_Contact (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 37;
	condition		= DIA_RATFORD_Contact_Condition;
	information		= DIA_RATFORD_Contact_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_Contact_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OldCampSpy1))&&(DIA_RATFORD_OldCampSpy1_deal <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Contact_Info()
{
	AI_Output (self, other, "DIA_RATFORD_Contact_07_01"); //Dobrze, ¿e jesteœ, mamy ma³y problem.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_02"); //Czyli wszystko w normie. Co siê sta³o?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_03"); //By³ u mnie Urt, sytuacja siê trochê skomplikowa³a. Musimy wstrzymaæ siê z atakiem na Stary Obóz.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_04"); //To co zrobimy?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_05"); //Urt powiedzia³ tylko, ¿e zorganizowanie Cieni i Kopaczy zajmie wiêcej czasu. Czeka³ na wieœci od Balama dotycz¹ce posuniêæ magnatów.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_06"); //Ciekawe co to za nowiny.
	AI_Output (self, other, "DIA_RATFORD_Contact_07_07"); //Dowiesz siê tego jako pierwszy. Urt poprosi³, ¿ebyœ to w³aœnie Ty uda³ siê na spotkanie z jego wys³annikiem. Musia³eœ wywrzeæ na nim spore wra¿enie, bo bardzo na to nalega³.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_08"); //Czujê siê zaszczycony. No dobra, gdzie i kiedy ma czekaæ na mnie ten wys³annik?
	AI_Output (self, other, "DIA_RATFORD_Contact_07_09"); //Wiedzia³em, ¿e siê zgodzisz! Urt powiedzia³, ¿ebyœ poszed³ na Plac Wymian. Naszego cz³owieka znajdziesz po drodze, a rozpoznasz go po pancerzu stra¿nika.
	AI_Output (self, other, "DIA_RATFORD_Contact_07_10"); //To on ma przekazaæ wieœci od Balama.
	AI_Output (other, self, "DIA_RATFORD_Contact_15_11"); //W porz¹dku, nie traæmy wiêcej czasu.

	Wld_InsertNpc(RBL_4064_Info,"OC1");
   
   Rick_meets_informant = false;

	Log_CreateTopic(CH3_RBL_OldCampInfo, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_OldCampInfo, LOG_RUNNING);
	B_LogEntry(CH3_RBL_OldCampInfo, "Mam spotkaæ siê z wys³annikiem Urta w pobli¿u Placu Wymian. Nie wiem, co to za rewelacje ma mi przekazaæ, ale Urt bardzo nalega³, ¿ebym to w³aœnie ja spotka³ siê z informatorem. Atak na Stary Obóz zosta³ na razie odwo³any, zorganizowanie cieni i kopaczy zajmie Urtowi i Diego wiêcej czasu, ni¿ przypuszczali.");
};

//Spotkanie szefów rebelii - narada + magowie, po tym info o pomocy dla niektórych rblów i miecz runiczny.

// **************************************************

INSTANCE DIA_RATFORD_OCA (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 38;
	condition		= DIA_RATFORD_OCA_Condition;
	information		= DIA_RATFORD_OCA_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czeka nas walka."; 
};

FUNC INT DIA_RATFORD_OCA_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_RATFORD_Contact) && (Rick_meets_informant)) || (Npc_KnowsInfo (hero, DIA_NoName_HiAgain)))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCA_Info()
{
	AI_Output (other, self, "DIA_RATFORD_OCA_15_01"); //Czeka nas walka.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_02"); //Czego siê dowiedzia³eœ?
	AI_Output (other, self, "DIA_RATFORD_OCA_15_03"); //Informator Urta powiedzia³, ¿e stra¿nicy szykuj¹ siê do ataku na nasz obóz.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_04"); //Mówi³ kiedy nast¹pi atak?
	AI_Output (other, self, "DIA_RATFORD_OCA_15_05"); //Nie zd¹¿y³ powiedzieæ nic wiêcej. Zaskoczyli nas stra¿nicy, rzuci³ siê na nich, ¿eby daæ mi czas na ucieczkê.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_06"); //Kurwa maæ! Musimy natychmiast dzia³aæ. Gomez wytr¹ci³ nam atut zaskoczenia.
	AI_Output (self, other, "DIA_RATFORD_OCA_07_07"); //Spotkamy siê u Cavalorna. PrzyjdŸ tam, jak najszybciej!
	B_LogEntry(CH3_RBL_OldCampAttack, "Ratford musi naradziæ siê z Cavalornem. Spotkanie odbêdzie siê w chacie Cavalorna, mam siê tam, jak najszybciej stawiæ.");
	Npc_ExchangeRoutine	(self, "MEETING");
	B_ExchangeRoutine	(cavalorn, "MEETING");
	B_ExchangeRoutine	(milten, "MEETING");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RATFORD_MEETING (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 39;
	condition		= DIA_RATFORD_MEETING_Condition;
	information		= DIA_RATFORD_MEETING_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCA))&&(Npc_GetDistToWP(self,"OW_SAWHUT_SLEEP_01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_MEETING_Info()
{
	var C_NPC cav; cav = Hlp_GetNpc(HUN_336_Cavalorn);

	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_01"); //W koñcu przyszed³eœ.
	AI_Output (other, self, "DIA_RATFORD_MEETING_15_02"); //Co mam robiæ?
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_03"); //Omówimy nasz¹ taktykê. Narada nie potrwa d³ugo. Pracy jest du¿o, a czasu jak na lekarstwo.
	AI_TurnToNpc(self, cav);
	AI_TurnToNpc(hero,cav);
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_04"); //Czeka nas walka. Stary Obóz szykuje siê do ataku. Czasu na przygotowania mamy niewiele, mo¿liwe, ¿e zaledwie kilka dni.
	AI_Output (self, other, "DIA_RATFORD_MEETING_07_05"); //Musimy zgotowaæ stra¿nikom godne przyjêcie. Jakieœ propozycje?
	B_StopProcessInfos(self);
};

// **************************************************
INSTANCE DIA_RATFORD_MEETING_talking (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 40;
	condition		= DIA_RATFORD_MEETING_talking_Condition;
	information		= DIA_RATFORD_MEETING_talking_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING_talking_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

func void DIA_RATFORD_MEETING_talking_Info()
{
   AI_Output (self, other, "DIA_Ratford_Meeting_07_03"); //Mo¿esz na mnie liczyæ.
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_RATFORD_MEETING1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 40;
	condition		= DIA_RATFORD_MEETING1_Condition;
	information		= DIA_RATFORD_MEETING1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RATFORD_MEETING1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting3))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_MEETING1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_MEETING1_07_01"); //Poczekaj chwilê. Znowu najwiêcej roboty jest na mojej g³owie.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_07_02"); //Zanim wyruszysz do ³owców chcia³bym, ¿ebyœ mi trochê pomóg³ w obozie. Co ty na to?

	Info_ClearChoices (DIA_RATFORD_MEETING1);
	Info_AddChoice (DIA_RATFORD_MEETING1, "Mów, byle szybko.", DIA_RATFORD_MEETING1_Yes);
	Info_AddChoice (DIA_RATFORD_MEETING1, "Nie mam czasu.", DIA_RATFORD_MEETING1_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_RATFORD_MEETING1_Yes()
{
	ratford_help = TRUE;
	AI_Output (other, self, "DIA_RATFORD_MEETING1_Yes_15_01"); //Mów, byle szybko.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_02"); //Wiedzia³em, ¿e mo¿na na Tobie polegaæ.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_03"); //Sam wszystkiego nie ogarnê. 
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_04"); //Pomo¿esz wykuæ miecze Aidanowi. Razem zrobicie to du¿o szybciej.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_05"); //Rozniesiesz orê¿ rebeliantom. Niektórzy z nich musz¹ dostaæ now¹ broñ. Pogadaj o tym z Foxem.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_06"); //Porozmawiaj te¿ z Rodneyem i Œwistakiem. Jeden i drugi prosi³ mnie wczeœniej o przys³ugê.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_Yes_07_07"); //To by³oby na tyle. Dziêki za pomoc przyjacielu.
	AI_Output (other, self, "DIA_RATFORD_MEETING1_Yes_15_08"); //Po cholerê siê zgodzi³em. Znowu muszê odwaliæ brudn¹ robotê.
	
   Log_CreateTopic(CH3_RBL_AidanHelp, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_AidanHelp, LOG_RUNNING);
	B_LogEntry(CH3_RBL_AidanHelp, "Mam pomóc Aidanowi w wykuciu mieczy dla rebeliantów.");
	Log_CreateTopic(CH3_RBL_DelivWeapon, LOG_MISSION);
	Log_SetTopicStatus(CH3_RBL_DelivWeapon, LOG_RUNNING);
	B_LogEntry(CH3_RBL_DelivWeapon, "Fox da mi orê¿, który muszê roznieœæ rebeliantom.");

	B_LogEntry(CH3_RBL_OldCampAttack, "Muszê pomóc w przygotowaniach do obrony. Czeka mnie kucie mieczy z Aidanem i roznoszenie orê¿a od Foxa. Mam te¿ dowiedzieæ siê, jakie problemy maj¹ Rodney i Œwistak.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_RATFORD_MEETING1_No()
{
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_01"); //Nie mam czasu. 
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_02"); //Muszê, jak najszybciej wyruszyæ do obozu ³owców.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_03"); //Rozumiem. Jakoœ sobie poradzê.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_04"); //Mam tylko jedn¹ proœbê...
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_05"); //No dobra, mów.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_06"); //Rodney ma jakiœ problem. Pogadaj z nim, w koñcu to twój kumpel.
	AI_Output (other, self, "DIA_RATFORD_MEETING1_No_15_07"); //Zobaczê, co da siê zrobiæ.
	AI_Output (self, other, "DIA_RATFORD_MEETING1_No_07_08"); //W porz¹dku. Czeka nas pracowity dzionek...

	B_LogEntry(CH3_RBL_OldCampAttack, "Nie zgodzi³em siê pomóc Ratfordowi, sam mam ju¿ sporo na g³owie. Obieca³em tylko porozmawiaæ z Rodneyem i dowiedzieæ siê, jakie ma problemy.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// **************************************************

INSTANCE DIA_RATFORD_OCAttackFinal (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 41;
	condition		= DIA_RATFORD_OCAttackFinal_Condition;
	information		= DIA_RATFORD_OCAttackFinal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Obóz jest ju¿ chyba gotów do odparcia ataku."; 
};

FUNC INT DIA_RATFORD_OCAttackFinal_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_KiraAfter))&&(Npc_KnowsInfo (hero, DIA_Rodney_BecomeMagEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCAttackFinal_Info()
{
	var C_NPC abel; abel = Hlp_GetNpc(HUN_2615_Abel);

	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_01"); //Obóz jest ju¿ chyba gotów do odparcia ataku.
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_02"); //Jest coraz lepiej, ale nadal czeka nas sporo pracy.

	if (ratford_help == TRUE)&&(others_help == 4)
	{
		B_GiveXP(1000);
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_03"); //Naprawdê bardzo mi pomog³eœ w przygotowaniach.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_04"); //WeŸ ten amulet. Kiedyœ dobrze mi s³u¿y³, a teraz niech i Tobie siê na coœ przyda.

		CreateInvItems(self, Schutzamulett_Waffen, 1);
      B_GiveInvItems(self, other, Schutzamulett_Waffen, 1);
	};
	
	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_05"); //Rodney jest ju¿ magiem. Nie s¹dzi³em, ¿e ma duszê marzyciela... 
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_06"); //Hmm, czasem warto pomóc marzeniom w spe³nieniu.
	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_07"); //W rzeczy samej. 

	if (kira_help == 1)
	{
		AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_08"); //Kira i ³owcy wespr¹ nas.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_09"); //To wspania³a nowina! Naprawdê doda³eœ mi otuchy.
	}
	else
	{
		AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_10"); //Niestety Kira i jej ch³opcy nam nie pomog¹.
		AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_11"); //Cholera, szkoda, ale jakoœ sobie poradzimy.
	};
   
	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_12"); //ChodŸ, rzucimy okiem na palisadê...
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_13"); //Co to za ha³as?
	// 	AI_Output (other, self, "DIA_RATFORD_OCAttackFinal_15_14"); //Zaczê³o siê...
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_15"); //Do broni!
	// 	AI_Output (self, other, "DIA_RATFORD_OCAttackFinal_07_16"); //Trzymaj siê blisko mnie, to bêdzie krwawa jatka...
	B_LogEntry(CH3_RBL_OldCampAttack, "Stra¿nicy zaatakowali!");

	B_StopProcessInfos(self);
	//	Npc_ExchangeRoutine		(self,"Alarm");
	OR_PREALARM=1;

	OR_ATTACKED=TRUE;
	/*************************
	
	No ork to teraz twoja kolej - atak stra¿ników na obóz rblów
	Mo¿e niech na koñcu kiedy wszyscy stra¿nicy zgin¹³ zmienna grd_attack_finish = TRUE; to sobie od niej nastêpny dialog zainicjujê

	grds_attack ();

	To funkcja z pomoca kiry je¿eli  (kira_help == 1)
	kira_attack ();
	*******************/
};

// **************************************************

INSTANCE DIA_RATFORD_OCAttackEnd (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 43;
	condition		= DIA_RATFORD_OCAttackEnd_Condition;
	information		= DIA_RATFORD_OCAttackEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_OCAttackEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCAttackFinal)) && (!GrdsInAttack)
   && (OR_ATTACKED>=76) && (Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OCAttackEnd_Info()
{
	B_GiveXP(2500);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_01"); //Z³oiliœmy im skóry, ¿e a¿ mi³o! Gomez w koñcu zacznie siê nas baæ.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_02"); //Coœ mi siê wydaje, ¿e to dopiero pocz¹tek.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_03"); //Oczywiœcie, ale magnaci dwa razy siê zastanowi¹, zanim znowu uderz¹.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_04"); //Obyœ mia³ racjê...
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_05"); //Cholera, trzeba oblaæ takie zwyciêstwo! Obaj zas³u¿yliœmy na ma³y toaœcik...
   
	CreateInvItems	(self, ItFoBeer, 2);
	AI_TurnToNpc(self,other);
	B_GiveInvItems (self, other,ItFoBeer, 1);
   
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_06"); //Za tych co padli w boju. I na jaja Beliara - na pohybel suczym synom Gomeza. Do dna!
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_07"); //Nie ma to jak przep³ukaæ garde³ko po bitwie. 
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_08"); //A teraz ta mniej przyjemna czêœæ. Muszê sprawdziæ w jakiej kondycji s¹ ch³opaki.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_09"); //Trzeba te¿ pogrzebaæ tych, którzy padli w boju...
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_10"); //IdŸ siê przespaæ, bo wygl¹dasz jak dupa Gomeza.
	AI_Output (other, self, "DIA_RATFORD_OCAttackEnd_15_11"); //Tak chyba zrobiê. Bywaj.
	AI_Output (self, other, "DIA_RATFORD_OCAttackEnd_07_12"); //Spotkamy siê jutro, Rick.
	
   rat_wait = B_SetDayTolerance()+1;
	Log_SetTopicStatus(CH3_RBL_OldCampAttack, LOG_SUCCESS);
	B_LogEntry(CH3_RBL_OldCampAttack, "Odparliœmy atak stra¿ników! Ju¿ dawno nie widzia³em tyle krwi... Cieszê siê, ¿e jestem wœród ¿ywych. Zas³u¿y³em na porz¹dny sen...");	 	
	Npc_ExchangeRoutine(self,"start");   

   OR_PREALARM=false;
	OR_ATTACKED=false;
};

// **************************************************

INSTANCE DIA_RATFORD_WhatNext (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 45;
	condition		= DIA_RATFORD_WhatNext_Condition;
	information		= DIA_RATFORD_WhatNext_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_WhatNext_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OCAttackEnd))&& (rat_wait <= Wld_GetDay())&& (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_WhatNext_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_01"); //Posprz¹taliœmy po stra¿nikach. Na razie jakoœ sobie poradzê bez Ciebie. 
	AI_Output (other, self, "DIA_RATFORD_WhatNext_15_02"); //No proszê, w koñcu dosta³em wolne. Cholera, i co ja teraz zrobiê?
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_03"); //Coœ wymyœlisz. Powodzenia na szlaku, Rick.
   AI_Output (self, other, "DIA_RATFORD_WhatNext_07_04"); //A jak naprawdê ci siê nudzi, to idŸ do Cavalorna. Ma dla ciebie kolejne zadanie.
	AI_Output (other, self, "DIA_RATFORD_WhatNext_15_05"); //Czyli jednak nie mam wolnego... Daj wytchn¹æ ch³opakom w obozie, zas³u¿yli na to.
	AI_Output (self, other, "DIA_RATFORD_WhatNext_07_06"); //Przemyœlê to. Bywaj.
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_RATFORD_OtherHelp(C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 50;
	condition		= DIA_RATFORD_OtherHelp_Condition;
	information		= DIA_RATFORD_OtherHelp_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_RATFORD_OtherHelp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_NCFinish))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OtherHelp_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_01"); //W koñcu jesteœ!
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_02"); //Rozmawia³em ju¿ z Cavalornem. Podobno siê za mn¹ stêskni³eœ.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_03"); //Musisz porozmawiaæ z Kir¹. Przyda siê nam ka¿dy miecz podczas ataku na Stary Obóz.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_04"); //A najemnicy?
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_05"); //Po tym co zrobi³eœ w Nowym Obozie, Lee stoi za nami murem. Niedawno rozmawia³em z Cordem, najemnicy uderz¹ razem z nami.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_06"); //Lee poprowadzi pozorowany atak na zewnêtrzny pierœcieñ. W ten sposób ³atwiej bêdzie nam niepostrze¿enie dostaæ siê do œrodka przez ukryty tunel.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_07"); //Kiedy otworzymy bramê, najemnicy pomog¹ nam roznieœæ stra¿ników.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_08"); //Brzmi nieŸle. Dobra, odwiedzê Kirê i jej ch³opców.
	AI_Output (self, other, "DIA_RATFORD_OtherHelp_07_09"); //To œwietnie. Ten uparty babsztyl nie pos³ucha nikogo z nas. U¿yj wszelkich dostêpnych œrodków, aby j¹ przekonaæ.
	AI_Output (other, self, "DIA_RATFORD_OtherHelp_15_10"); //Zobaczê, co da siê zrobiæ.
   
	Log_CreateTopic(CH6_RBL_OtherHelp, LOG_MISSION);
	Log_SetTopicStatus(CH6_RBL_OtherHelp, LOG_RUNNING);
	B_LogEntry(CH6_RBL_OtherHelp, "Ratford chce, abym spotka³ siê z Kir¹. £owcy przydadz¹ siê podczas ataku na Stary Obóz. Dziêki nim ³atwiej bêdzie osaczyæ stra¿ników. Czas ruszyæ w drogê...");
};

// **************************************************

INSTANCE DIA_RATFORD_OtherHelpFinished (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 51;
	condition		= DIA_RATFORD_OtherHelpFinished_Condition;
	information		= DIA_RATFORD_OtherHelpFinished_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wróci³em."; 
};

FUNC INT DIA_RATFORD_OtherHelpFinished_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_Bring_Cutter))&&(Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_OtherHelpFinished_Info()
{
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_01"); //Wróci³em.
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_02"); //Zauwa¿y³em. Co z Kir¹?
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_03"); //Dosta³a to czego chcia³a i weŸmie udzia³ w ataku.
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_04"); //Œwietna robota!
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_05"); //Wyœlê do niej ³¹cznika. Na razie nie bêdziesz tu potrzebny. 
	AI_Output (self, other, "DIA_RATFORD_OtherHelpFinished_07_06"); //Muszê dopi¹æ przygotowania do ataku. Bywaj.
	AI_Output (other, self, "DIA_RATFORD_OtherHelpFinished_15_07"); //Powodzenia, Ratford.

	Log_SetTopicStatus(CH6_RBL_OtherHelp, LOG_SUCCESS);
	B_LogEntry(CH6_RBL_OtherHelp, "Ratford wyœle do Kiry ³¹cznika, który ustali z ³owcami, gdzie uderz¹.");
};

// **************************************************

INSTANCE DIA_RATFORD_Urt (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 52;
	condition		= DIA_RATFORD_Urt_Condition;
	information		= DIA_RATFORD_Urt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co wiesz o Urcie?"; 
};

FUNC INT DIA_RATFORD_Urt_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Urt_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Urt_15_01"); //Co wiesz o Urcie?
   
	if (!Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		AI_Output (self, other, "DIA_RATFORD_Urt_07_02"); //Za³atw sprawê z Kir¹ to pogadamy.
	}
	else
	{
		AI_Output (self, other, "DIA_RATFORD_Urt_07_03"); //Co chcesz wiedzieæ?
	};
};

// **************************************************

INSTANCE DIA_RATFORD_UrtKnow (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 53;
	condition		= DIA_RATFORD_UrtKnow_Condition;
	information		= DIA_RATFORD_UrtKnow_Info;
	permanent		= 0;
	important		= 0;
	description		= "Porozmawiajmy o Urcie."; 
};

FUNC INT DIA_RATFORD_UrtKnow_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Urt))&&(Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_UrtKnow_Info()
{
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_01"); //Porozmawiajmy o Urcie.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_02"); //W porz¹dku, ale dlaczego pytasz akurat o niego?
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_03"); //Coœ mi siê w nim nie podoba. Jesteœ pewien, ¿e mo¿na mu zaufaæ?
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_04"); //Zaskoczy³eœ mnie. Urta zarekrutowa³ Kelvin. Zreszt¹, to on zajmowa³ siê utworzeniem siatki na terenie Starego Obozu. Ja go praktycznie nie znam.
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_05"); //Kelvin nie ¿yje, a Urt go zast¹pi³. W¹tpiê, ¿eby to by³ przypadek.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_06"); //Nie chcê nawet myœleæ o tym, co mog³oby siê wydarzyæ, gdyby Urt okaza³ siê zdrajc¹. Przecie¿ to on przygotowa³ plan dywersyjny w Starym Obozie!
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_07"); //Spróbujê zdobyæ mocniejsze dowody, a na razie zagramy, jak nam rozda.
	AI_Output (self, other, "DIA_RATFORD_UrtKnow_07_08"); //B¹dŸ ostro¿ny i za wszelk¹ cenê uwolnij Diego. Mo¿e on wie coœ wiêcej...
	AI_Output (other, self, "DIA_RATFORD_UrtKnow_15_09"); //Racja, bywaj.
	B_LogEntry(CH6_RBL_Spy, "Rozgrywka trwa nadal. Nie mam niezbitych dowodów na to, ¿e to Urt ala Urthos jest zdrajc¹. Mo¿e Diego powie coœ wiêcej, ale najpierw muszê go uwolniæ.");
};

// **************************************************

INSTANCE DIA_RATFORD_DiegoFree (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 54;
	condition		= DIA_RATFORD_DiegoFree_Condition;
	information		= DIA_RATFORD_DiegoFree_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uwolni³em Diego."; 
};

FUNC INT DIA_RATFORD_DiegoFree_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_UrtKnow))&&(Npc_KnowsInfo (hero,Info_Diego_Prison))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DiegoFree_Info()
{
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_01"); //Uwolni³em Diego. To Urt zdradzi³.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_02"); //Zabi³eœ sukinsyna?
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_03"); //Jeszcze nie, na razie uciek³ mi spod miecza.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_04"); //Co siê odwlecze, to nie uciecze...
	AI_Output (other, self, "DIA_RATFORD_DiegoFree_15_05"); //Diego czeka w pobli¿u palisady na atak, wtedy do³¹czy do zabawy i poprowadzi do walki cienie.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_06"); //To chcia³em us³yszeæ.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree_07_07"); //Mam sporo na g³owie. Bywaj, Rick.
};

// **************************************************

INSTANCE DIA_RATFORD_DiegoFree2 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 56;
	condition		= DIA_RATFORD_DiegoFree2_Condition;
	information		= DIA_RATFORD_DiegoFree2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia³, ¿e nadszed³ Czas Zap³aty."; 
};

FUNC INT DIA_RATFORD_DiegoFree2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_OCFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_DiegoFree2_Info()
{
	AI_Output (other, self, "DIA_RATFORD_DiegoFree2_15_01"); //Cavalorn powiedzia³, ¿e nadszed³ Czas Zap³aty.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_02"); //D³ugo na to czeka³em.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_03"); //Zanim ruszymy do walki, za³atw wszystkie swoje sprawy, bo póŸniej mo¿e nie starczyæ czasu. Tylko siê pospiesz!
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_04"); //Jak bêdziesz gotów, wróæ do mnie.
	AI_Output (self, other, "DIA_RATFORD_DiegoFree2_07_05"); //Aha. Zaatakujemy po zmierzchu, to da nam wiêksz¹ szansê na zaskoczenie.

	Log_CreateTopic(CH6_RBL_PayDay, LOG_MISSION);
	Log_SetTopicStatus(CH6_RBL_PayDay, LOG_RUNNING);
	B_LogEntry	(CH6_RBL_PayDay, "Nadszed³ Czas Zap³aty. Ale zanim ruszê na Stary Obóz, muszê za³atwiæ wszystkie niezakoñczone sprawy, bo póŸniej mo¿e nie starczyæ czasu. Zaatakujemy po zmierzchu, kiedy bêdê gotów, mam porozmawiaæ z Ratfordem.");
};

// **************************************************

INSTANCE DIA_RATFORD_PayDay (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 57;
	condition		= DIA_RATFORD_PayDay_Condition;
	information		= DIA_RATFORD_PayDay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem gotów."; 
};

FUNC INT DIA_RATFORD_PayDay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_DiegoFree))&&(Wld_IsTime (20,00,04,00))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_PayDay_Info()
{
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_01"); //Jestem gotów.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_02"); //Czekaliœmy ju¿ tylko na Ciebie.
   
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
		AI_Output (self, other, "DIA_RATFORD_PayDay_07_03"); //Kira ruszy³a pod zachodni¹ bramê.
	};
   
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_04"); //Lee podzieli³ najemników na dwa oddzia³y. Wiêkszy uderzy na po³udniow¹ bramê pod wodz¹ Corda.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_05"); //Mniejsza grupa z Gornem na czele zajmie siê zachodni¹ bram¹.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_06"); //My dostaniemy siê przez tunel do wewnêtrznego pierœcienia.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_07"); //Diego ju¿ wyruszy³, razem z cieniami i kopaczami maj¹ podnieœæ kraty.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_08"); //Rebelianci musz¹ uderzyæ ca³¹ si³¹ na zamek i magnatów.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_09"); //Je¿eli wszystko pójdzie zgodnie z planem, to o œwicie bêdziemy ucztowaæ na zamku!
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_10"); //Kolonia bêdzie nasza! 
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_11"); //Kobiety Gomeza te¿...
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_12"); //He, he, od tej strony Ciê nie zna³em.
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_13"); //Ile mo¿na poœciæ?
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_14"); //Wystarczy tego gadania. A jak piraci?
   
	if (Npc_KnowsInfo (hero, DIA_Angus_KillGuards))
	{
		AI_Output (other, self, "DIA_RATFORD_PayDay_15_15"); //Rusz¹ razem ze mn¹.
	}
	else
	{
		AI_Output (other, self, "DIA_RATFORD_PayDay_15_16"); //Jeszcze z nimi nie rozmawia³em...
		AI_Output (self, other, "DIA_RATFORD_PayDay_07_17"); //To zrób to zanim pójdziesz do Cavalorna!
	};
   
	AI_Output (self, other, "DIA_RATFORD_PayDay_07_18"); //Powodzenia Rick i nie daj siê zabiæ!
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_19"); //Przecie¿ i tak nie bêdê ¿y³ wiecznie.
	AI_Output (other, self, "DIA_RATFORD_PayDay_15_20"); //IdŸ do Cavalorna, ja ju¿ mam swoje rozkazy.
   
	B_LogEntry(CH6_RBL_PayDay, "Zaczê³o siê. Nasi sojusznicy zaatakuj¹ zewnêtrzne bramy. Diego ruszy³ ju¿ tunelem, ¿eby skrzykn¹æ cienie i kopaczy, maj¹ te¿ otworzyæ bramy. Nam zostali na deser magnaci. Wejdziemy przez tunel i rozpêtamy na zamku prawdziwe piek³o!");

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"Follow");
	
/***************
Zmiana rutyn najemników i ³owców - czekaj¹ pod SO
***************/	
	
	B_OC_Mercenarys_Attack();
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelpFinished))
	{
      B_Kira_Attack();
	};
};

/****************************************
GorHanis quest ch1-2
***************************************/

// **************************************************

INSTANCE DIA_RATFORD_Hanis (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 60;
	condition		= DIA_RATFORD_Hanis_Condition;
	information		= DIA_RATFORD_Hanis_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dlaczego wyrzuciliœcie Gor Hanisa z obozu?"; 
};

FUNC INT DIA_RATFORD_Hanis_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Hanis_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_01"); //Dlaczego wyrzuciliœcie Gor Hanisa z obozu?
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_02"); //A dlaczego chwasty odrzuca siê od plewów?
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_03"); //Czy ktoœ powie mi w koñcu prawdê?!
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_04"); //Spokojnie. Nie ma tu nic do ukrycia.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_05"); //Hanis razem z Kharimem trenowali rekrutów. Urz¹dzali æwiczebne walki, uczyli nowych jak nakopaæ stra¿nikom.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_06"); //Podczas jednej z walk z Kharimem, Hanis dosta³ po g³owie. Nie wiem, jak to siê sta³o, ale w szale zabi³ jednego z rekrutów.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_07"); //Quentin widzia³ wszystko i zezna³, ¿e Gor Hanis jest winien. 
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_08"); //Muszê przyznaæ, ¿e te¿ mnie to zaskoczy³o. Najwidoczniej Hanis wpad³ w sza³ po tym, jak dosta³ przez ³eb. 
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_09"); //Musia³em usun¹æ go z naszych szeregów. Pozwoli³em mu jednak zostaæ w obozie. Szkoda ch³opaka... Tym bardziej teraz z t¹ g³ow¹. Nie mia³em serca wyrzucaæ go z obozu.
	AI_Output (other, self, "DIA_RATFORD_Hanis_15_10"); //Z tego co wiem, to Kharim da³ przez ³eb Hanisowi po tym, jak by³y sekciarz go powali³. W¹tpiê, ¿e od razu siê podniós³ i zabi³ rekruta.
	AI_Output (self, other, "DIA_RATFORD_Hanis_07_11"); //Mnie tam nie by³o. Quentin zezna³, ¿e to Kharim mówi prawdê. Pogadaj z nim, jak chcesz dowiedzieæ siê czegoœ wiêcej.
	B_LogEntry(CH2_RBL_Mem, "Hanis podobno zabi³ w szale jednego z rekrutów. Nie wydaje mi siê, ¿e po tym jak dosta³ przez ³eb, by³ zdolny do czegokolwiek. Œwiadkiem zdarzenia by³ Quentin. Coœ mi tu œmierdzi. Ktoœ tu k³amie i ciekawe, jakie ma motywy.");
};

// **************************************************

INSTANCE DIA_RATFORD_Hanis1 (C_INFO)
{
	npc				= HUN_818_RATFORD;
	nr				= 61;
	condition		= DIA_RATFORD_Hanis1_Condition;
	information		= DIA_RATFORD_Hanis1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gor Hanis jest niewinny!"; 
};

FUNC INT DIA_RATFORD_Hanis1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_BaalKagan_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_RATFORD_Hanis1_Info()
{
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_01"); //Gor Hanis jest niewinny!
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_02"); //Masz jakieœ dowody?
	//TODO: LOL WTF? 
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_03"); //To d³u¿sza historia... (Rick streszcza Ratfordowi to, czego siê dowiedzia³)
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_04"); //Ale dlaczego Kharim chcia³ go pogr¹¿yæ?
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_05"); //Jeszcze tego nie wiem.
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_06"); //I co ja mam zrobiæ z Kharimem? Chyba odeœlê go do Nowego Obozu. Niech tam siê z nim u¿eraj¹.
	AI_Output (self, other, "DIA_RATFORD_Hanis1_07_07"); //Powiedz Gor Hanisowi, ¿e znowu jest jednym z nas.
	AI_Output (other, self, "DIA_RATFORD_Hanis1_15_08"); //Z przyjemnoœci¹.
	B_ExchangeRoutine(kharim,"banned");
	B_LogEntry(CH2_RBL_Mem, "Ratford mi uwierzy³. Ciekawe, co sk³oni³o Kharima do takiej prowokacji? Muszê powiedzieæ Gor Hanisowi, ¿e znowu jest pe³noprawnym rebeliantem");

	HANIS_TRUST = true;	
};
