
// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fisk_Hello (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 1;
	condition		= DIA_Fisk_Hello_Condition;
	information		= DIA_Fisk_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Fisk_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Fisk_Hello_Info()
{
	AI_Output (self, other, "DIA_Fisk_Hello_12_01"); //Coœ podaæ, ¿ó³todziobie?
	AI_Output (other, self, "DIA_Fisk_Hello_15_02"); //Nie zwyk³em p³ukaæ gard³a l¹dowymi szczynami. Masz coœ mocniejszego?
	AI_Output (self, other, "DIA_Fisk_Hello_12_03"); //Mo¿e i mam. Sam sprawdŸ.
	
	Log_CreateTopic(GE_TraderOR, LOG_NOTE);
	B_LogEntry(GE_TraderOR,	"U Fiska mogê siê czegoœ napiæ i najeœæ.");
};

// **************************************************

INSTANCE DIA_Fisk_Bartender (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 3;
	condition		= DIA_Fisk_Bartender_Condition;
	information		= DIA_Fisk_Bartender_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jesteœ karczmarzem?"; 
};

FUNC INT DIA_Fisk_Bartender_Condition()
{
   if (Npc_KnowsInfo(other,DIA_Fisk_Hello))
   { 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_Bartender_Info()
{
	AI_Output (other, self, "DIA_Fisk_Bartender_15_01"); //Jesteœ karczmarzem?
	AI_Output (self, other, "DIA_Fisk_Bartender_12_02"); //Nie, do cholery. Ale ktoœ musi prowadziæ interes.
	AI_Output (other, self, "DIA_Fisk_Bartender_15_03"); //Czym zajmowa³eœ siê wczeœniej?
	AI_Output (self, other, "DIA_Fisk_Bartender_12_04"); //By³em kupcem w Starym Obozie i wiod³o mi siê nie najgorzej, dopóki Gomez nie zacz¹³ usuwaæ Cieni.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_05"); //Wtedy stwierdzi³em, ¿e nadszed³ w³aœciwy czas na zmianê otoczenia.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_06"); //Z Cavalornem znam siê od lat. Jak widzisz mam oko na tutejsze menty przesiaduj¹ce w ober¿y.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_07"); //Ale Ciebie widzê tu po raz pierwszy. Ten pancerz...
	AI_Output (self, other, "DIA_Fisk_Bartender_12_08"); //Nie jesteœ skazañcem?
	AI_Output (other, self, "DIA_Fisk_Bartender_15_09"); //Jestem... By³em... 'marynarzem'.
	AI_Output (other, self, "DIA_Fisk_Bartender_15_10"); //Mój okrêt rozbi³ siê u wybrze¿y Khorinis, a przez barierê nie mogê siê st¹d wydostaæ.
	AI_Output (self, other, "DIA_Fisk_Bartender_12_11"); //Hmm, piraci w Kolonii. Ciekawe...
	AI_Output (other, self, "DIA_Fisk_Bartender_15_12"); //Powiedzia³em, ¿e jestem marynarzem!
	AI_Output (self, other, "DIA_Fisk_Bartender_12_13"); //Jak tam sobie chcesz. 
	AI_Output (self, other, "DIA_Fisk_Bartender_12_14"); //Mi³o siê gawêdzi³o, ale muszê wracaæ do wycierania kufli.
};

// **************************************************

var int fisk_answer;
var int fisk_agree_fight;

INSTANCE DIA_Fisk_Fight (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_Fight_Condition;
	information		= DIA_Fisk_Fight_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przysy³a mnie Cavalorn."; 
};

FUNC INT DIA_Fisk_Fight_Condition()
{
   if (Npc_KnowsInfo(other,DIA_Fisk_Bartender))&&(Npc_KnowsInfo(other,DIA_HUN_336_Cavalorn_Hello))
   &&(hark_trial!=5) && (!fisk_agree_fight)//fight not ready Done
   { 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_Fight_Info()
{
	if (fisk_answer == FALSE)
	{
      fisk_answer = TRUE;
	
      AI_Output (other, self, "DIA_Fisk_Fight_15_01"); //Przysy³a mnie Cavalorn.
      AI_Output (self, other, "DIA_Fisk_Fight_12_02"); //Cavalorn podsy³a mi nowych tylko po to, ¿eby ich sprawdziæ.
      AI_Output (self, other, "DIA_Fisk_Fight_12_03"); //Nie mam teraz nic do roboty.
      AI_Output (self, other, "DIA_Fisk_Fight_12_04"); //Ostatnio w karczmie nic siê nie dzieje, mo¿na usn¹æ z nudów...
      AI_Output (other, self, "DIA_Fisk_Fight_15_05"); //Na pewno nic siê dla mnie nie znajdzie?
      AI_Output (self, other, "DIA_Fisk_Fight_12_06"); //Sam widzisz. Cisza i spokój...
      AI_Output (self, other, "DIA_Fisk_Fight_12_07"); //Zaraz... Mam pomys³.
      AI_Output (self, other, "DIA_Fisk_Fight_12_08"); //Rozruszaj towarzystwo w ober¿y to siê za Tob¹ wstawiê.
      AI_Output (other, self, "DIA_Fisk_Fight_15_09"); //Ale jak mam to zrobiæ?
      AI_Output (self, other, "DIA_Fisk_Fight_12_10"); //A ja myœla³em, ¿e masz g³owê na karku.
      AI_Output (other, self, "DIA_Fisk_Fight_15_11"); //Masz na myœli rozróbê?
      AI_Output (self, other, "DIA_Fisk_Fight_12_12"); //Jednak masz jaja. Tak, czas trochê rozruszaæ towarzystwo.
	}
	else
	{
      AI_Output (other, self, "DIA_Fisk_Fight_15_13"); //Przysy³a mnie Cavalorn.
      AI_Output (self, other, "DIA_Fisk_Fight_12_14"); //To ju¿ wiem. To jak bêdzie z rozruszaniem towarzystwa?
	};

	Info_ClearChoices(DIA_Fisk_Fight);
	Info_AddChoice	 (DIA_Fisk_Fight, "W porz¹dku. Zobaczê co da siê zrobiæ." ,DIA_Fisk_Fight_Yes);
	Info_AddChoice	 (DIA_Fisk_Fight, "Nie szukam guza." ,DIA_Fisk_Fight_No);
};

func void DIA_Fisk_Fight_Yes()
{
	AI_Output (other, self,"DIA_Fisk_Fight_Yes_15_00"); //W porz¹dku. Zobaczê co da siê zrobiæ.
	AI_Output (self, other,"DIA_Fisk_Fight_Yes_12_01"); //Œwietnie. Tylko nie upaprajcie pod³ogi za bardzo krwi¹ bo ciê¿ko j¹ póŸniej doszorowaæ.
	AI_Output (self, other,"DIA_Fisk_Fight_Yes_12_02"); //I ma byæ bez ofiar. Taka spokojna burda na lepsze kr¹¿enie.
	Log_CreateTopic(CH1_Rbl_SkipFight, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Rbl_SkipFight, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SkipFight, "Zgodzi³em siê zainicjowaæ burdê w ober¿y Fiska. Tylko jak to zrobiæ?");
	
   fisk_agree_fight = true;
	Info_ClearChoices(DIA_Fisk_Fight);
};

func void DIA_Fisk_Fight_No()
{
	AI_Output (other, self,"DIA_Fisk_Fight_No_15_00"); //Nie szukam guza. 
	AI_Output (self, other,"DIA_Fisk_Fight_No_12_01"); //Ale ja szukam rozrywki. Wróæ jak zmienisz zdanie.
	Info_ClearChoices(DIA_Fisk_Fight);	
};

// **************************************************
func void Dia_Fisk_trust()
{
   fisk_trust = TRUE;
	B_GiveXP(250);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
   AI_Output (self, other, "DIA_Fisk_AfterFight_12_03"); //Piwo na mój koszt i niech Ci idzie na zdrowie.
   
   CreateInvItems	(self, ItFoBeer, 6);
	B_GiveInvItems (self, other,ItFoBeer, 6);
	AI_Output (other, self, "DIA_Fisk_AfterFight_15_04"); //Dziêki.
	AI_UseItem (other,ItFobeer);
   
	B_LogSetTopicStatus(CH1_Rbl_SkipFight, LOG_Success);
	B_LogEntry(CH1_Rbl_SkipFight, "Doprowadzi³em do burdy w karczmie. Fisk by³ zadowolony.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zadowoli³em Fiska.");
};

INSTANCE DIA_Fisk_AfterFight(C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_AfterFight_Condition;
	information		= DIA_Fisk_AfterFight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak Ci siê podoba³o przedstawienie?"; 
};

FUNC INT DIA_Fisk_AfterFight_Condition()
{
  	if (DIA_Fisk_Fight.permanent == 0)&&(hark_trial >= 5)&&(hark_trial!=10)&& (!Npc_KnowsInfo(other, DIA_Fisk_AfterFight_WOIntroduce))//10=fail
  	{ 
   	return TRUE; 
   }; 
};

FUNC VOID DIA_Fisk_AfterFight_Info()
{
	AI_Output (other, self, "DIA_Fisk_AfterFight_15_01"); //Jak Ci siê podoba³o przedstawienie?
	AI_Output (self, other, "DIA_Fisk_AfterFight_12_02"); //By³o ca³kiem nieŸle. O to mi chodzi³o.
	
   Dia_Fisk_trust();
};

INSTANCE DIA_Fisk_AfterFight_WOIntroduce(C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 4;
	condition		= DIA_Fisk_AfterFight_WOIntroduce_Condition;
	information		= DIA_Fisk_AfterFight_WOIntroduce_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Fisk_AfterFight_WOIntroduce_Condition()
{
   if (!Npc_KnowsInfo(other,DIA_Fisk_Fight))&&(hark_trial >= 5) && (!Npc_KnowsInfo(other, DIA_Fisk_AfterFight))
  	{ 
   	return TRUE; 
  	}; 
};

FUNC VOID DIA_Fisk_AfterFight_WOIntroduce_Info()
{
	// Sher, popraw dialog.
	// (ca³y dialog jest utworzony na wypadek gdyby Rick doprowadzi³ do burdy bez
	// wczesniejszej rozmowy z Fiskiem)
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_00"); //By³o ca³kiem nieŸle.
	AI_Output (other, self, "DIA_Fisk_AfterFight_WOIntroduce_15_01"); //Masz na myœli burdê?
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_02"); //Przednia rozrywka, przyjacielu. No i ober¿a niezbyt zachlapana krwi¹, po prostu idealnie!
	AI_Output (self, other, "DIA_Fisk_AfterFight_WOIntroduce_12_03"); //Na pewno wspomnê o Tobie Cavalornowi.
	
   Dia_Fisk_trust();
};

// **************************************************

INSTANCE DIA_Fisk_Stew (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 12;
	condition		= DIA_Fisk_Stew_Condition;
	information		= DIA_Fisk_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios³em pyszny gulasz."; 
};

FUNC INT DIA_Fisk_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fisk_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Fisk_Stew_15_01"); //Przynios³em pyszny gulasz.
	AI_Output (self, other, "DIA_Fisk_Stew_11_02"); //Nie przesadzaj. Za te pomyje, ju¿ dawno ktoœ powinien utopiæ Snafa w kotle.
	AI_Output (self, other, "DIA_Fisk_Stew_11_03"); //Ale lepsze to ni¿ nic.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
 	B_LogEntry		(CH2_Rbl_Food, "Fisk stwierdzi³, ¿e to pomyje, ale te¿ zjad³."); 
};

INSTANCE DIA_FISK_Spy (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 13;
	condition		= DIA_FISK_Spy_Condition;
	information		= DIA_FISK_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz na kogoœ kto ju¿ sporo widzia³."; 
};

FUNC INT DIA_FISK_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_FISK_Spy_15_01"); //Wygl¹dasz na kogoœ kto ju¿ sporo widzia³.
	AI_Output (self, other, "DIA_FISK_Spy_07_02"); //Nie powiem, widzia³em to i owo. A co konkretnie masz na myœli?
	AI_Output (other, self, "DIA_FISK_Spy_15_03"); //Kim by³eœ w Starym Obozie?
	AI_Output (self, other, "DIA_FISK_Spy_07_04"); //Nikim wa¿nym. Zwyk³ym kupcem.
	AI_Output (other, self, "DIA_FISK_Spy_15_05"); //Dobrze znasz Gomeza?
	AI_Output (self, other, "DIA_FISK_Spy_07_06"); //Tyle ile trzeba by³o by prze¿yæ wœród magnatów. A po co te pytania?
	AI_Output (other, self, "DIA_FISK_Spy_15_07"); //Jestem tylko ciekaw czym siê wczeœniej zajmowa³eœ.
	AI_Output (self, other, "DIA_FISK_Spy_07_08"); //Ciekawoœæ w Kolonii to czêsta przyczyna k³opotów. Zapamiêtaj to.
	B_LogEntry		(CH2_Rbl_Spy, "Fisk by³ kimœ wa¿nym w Obozie Gomeza. Dobrze zna³ magnatów. Ciekawe czy to tylko przypadek, ¿e znalaz³ siê w Obozie Rebeliantów?");
	
	if (spy_count == 12)
	{
      spy_count = spy_count + 1;
      
      AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od ciebie chcia³.
      
      B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FISK_Spy1 (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 13;
	condition		= DIA_FISK_Spy1_Condition;
	information		= DIA_FISK_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno musia³eœ uciekaæ z Obozu Stra¿ników przez jakiegoœ skazañca."; 
};

FUNC INT DIA_FISK_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_FISK_Spy1_15_01"); //Podobno musia³eœ uciekaæ z Obozu Stra¿ników przez jakiegoœ skazañca.
	AI_Output (self, other, "DIA_FISK_Spy1_07_02"); //To nie by³ zwyczajny skazaniec. 
	AI_Output (self, other, "DIA_FISK_Spy1_07_03"); //Powiedzmy, ¿e sprzeda³em mu wiêcej ni¿ powinienem.
	AI_Output (other, self, "DIA_FISK_Spy1_15_04"); //A Gomezowi siê to nie spodoba³o.
	AI_Output (self, other, "DIA_FISK_Spy1_07_05"); //W rzeczy samej. Nie mia³em wielkiego wyboru. Nie chcia³em podzieliæ losu Magów Ognia czy niektórych spoœród Cieni.
	AI_Output (other, self, "DIA_FISK_Spy1_15_06"); //Myœlisz, ¿e Gomez móg³by mieæ w obozie swojego szpiega?
	AI_Output (self, other, "DIA_FISK_Spy1_07_07"); //Je¿eli myœlisz o mnie to nawet za górê rudy bym dla niego nie pracowa³.
	AI_Output (self, other, "DIA_FISK_Spy1_07_08"); //Gomez to szaleniec, który prêdzej czy póŸniej zap³aci za swoje zbrodnie.
	AI_Output (self, other, "DIA_FISK_Spy1_07_09"); //Nie sypn¹³bym Cavalorna i ch³opaków - nie gryzie siê rêki, która Ciê karmi, piracie.
	AI_Output (other, self, "DIA_FISK_Spy1_15_10"); //To mo¿e ktoœ inny?
	AI_Output (self, other, "DIA_FISK_Spy1_07_11"); //Nie wiem... Chocia¿ coœ ci powiem. Tony by³ kumplem Szakala, a to jeden z najbardziej zaufanych ludzi Gomeza.
	AI_Output (self, other, "DIA_FISK_Spy1_07_12"); //Z tego co wiem nikt ze stra¿ników nie œciga³ Toniego kiedy to niby ucieka³ z obozu Gomeza.
	AI_Output (self, other, "DIA_FISK_Spy1_07_13"); //Ale to tylko moje spostrze¿enia. Mogê siê myliæ, dlatego trzymam jêzyk za zêbami. Nie oskar¿am nikogo je¿eli nie mam dowodów.
	AI_Output (other, self, "DIA_FISK_Spy1_15_14"); //To rzadka zaleta. Przemyœlê to co powiedzia³eœ...
	
   B_LogEntry		(CH2_Rbl_Spy, "Fisk raczej nie jest cz³owiekiem Gomeza. I nawet on zauwa¿y³, ¿e z Tonym jest coœ nie tak. Zwróci³ mi uwagê na to, ¿e Szakal i Tony byli przyjació³mi. Powinienem o tym pamiêtaæ.");
	
   if (tony_spy == 12)
	{
      tony_spy = tony_spy + 1;
	
      AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
	
      B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};
	
   B_StopProcessInfos	(self);
};

/*********************************

SIDE QUEST

*********************************/

INSTANCE DIA_FISK_Martin (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 20;
	condition		= DIA_FISK_Martin_Condition;
	information		= DIA_FISK_Martin_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_FISK_Martin_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cavalorn_BlackTrollBack))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_Martin_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_FISK_Martin_07_01"); //Zatrzymaj siê! Nie szukasz jakiejœ roboty?
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_FISK_Martin_15_02"); //Mo¿e i szukam.
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_FISK_Martin_07_03"); //Wiedzia³em, ¿e siê skusisz.
	AI_Output (other, self, "DIA_FISK_Martin_15_04"); //Najpierw powiedz o co chodzi.
	AI_Output (self, other, "DIA_FISK_Martin_07_05"); //Mój przyjaciel ma problemy. Nazywa siê Martin.
	AI_Output (self, other, "DIA_FISK_Martin_07_06"); //Od jakiegoœ czasu stoi nad brzegiem rzeki i... stoi. Gapi siê tylko w wodê. Robi to ca³ymi dniami.
	AI_Output (other, self, "DIA_FISK_Martin_15_07"); //Mo¿e szuka spokoju? Albo chce siê rzuciæ w odmêty.
	AI_Output (self, other, "DIA_FISK_Martin_07_08"); //Tam? Co najwy¿ej by siê poobija³ na tej p³yciŸnie.
	AI_Output (self, other, "DIA_FISK_Martin_07_09"); //Najgorsze jest to, ¿e nie chce mi powiedzieæ co siê dzieje. Dobrze go znam, wiem, ¿e coœ go trapi.
	AI_Output (other, self, "DIA_FISK_Martin_15_10"); //Czym zajmowa³ siê wczeœniej?
	AI_Output (self, other, "DIA_FISK_Martin_07_11"); //A ró¿nie. Trochê polowa³, czasami wykona³ jakieœ zadanie dla Ratforda, sporo te¿ spêdza³ czasu w tawernie.
	AI_Output (self, other, "DIA_FISK_Martin_07_12"); //Pomo¿esz?
};

//***************************************************************

INSTANCE DIA_FISK_MartinOk (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 21;
	condition		= DIA_FISK_MartinOk_Condition;
	information		= DIA_FISK_MartinOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, porozmawiam z Martinem."; 
};

FUNC INT DIA_FISK_MartinOk_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_FISK_Martin))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinOk_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinOk_15_01"); //Dobra, porozmawiam z Martinem.
	AI_Output (self, other, "DIA_FISK_MartinOk_07_02"); //Kamieñ mi spad³ z serca. Mo¿e komuœ obcemu prêdzej siê zwierzy.
	AI_Output (self, other, "DIA_FISK_MartinOk_07_03"); //Znajdziesz go nad rzek¹. Powodzenia.
	AI_Output (other, self, "DIA_FISK_MartinOk_15_04"); //Chwileczkê. A zap³ata?
	AI_Output (self, other, "DIA_FISK_MartinOk_07_05"); //Dostaniesz 100 bry³ek po wykonanej robocie.
	AI_Output (other, self, "DIA_FISK_MartinOk_15_06"); //Niech bêdzie.
   
   Wld_InsertNpc(RBL_4125_Martin, "HC_NEAR_WATCHTOWER3_2"); 

	Log_CreateTopic	(CH2_RBL_Feelings, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Feelings, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Feelings, "Fisk prosi³ mnie, ¿ebym siê dowiedzia³ co drêczy jego przyjaciela, Martina. Znajdê go nad rzek¹ gdzie ostatnio notorycznie przesiaduje.");
};

//***************************************************************

INSTANCE DIA_FISK_MartinRing (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 22;
	condition		= DIA_FISK_MartinRing_Condition;
	information		= DIA_FISK_MartinRing_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia³em z Martinem."; 
};

FUNC INT DIA_FISK_MartinRing_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_What))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinRing_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinRing_15_01"); //Rozmawia³em z Martinem.
	AI_Output (self, other, "DIA_FISK_MartinRing_07_02"); //I?
	
   if (!Help_Martin)
	{
      AI_Output (other, self, "DIA_FISK_MartinRing_15_03"); //Nic mi nie powiedzia³. Skoro ma tajemnice to trzeba to uszanowaæ.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_04"); //Nie wywi¹za³eœ siê z umowy. Po co ja w ogóle traci³em na Ciebie czas?
      AI_Output (other, self, "DIA_FISK_MartinRing_15_05"); //Mam wystarczaj¹co du¿o w³asnych problemów, ¿eby jeszcze zajmowaæ siê cudzymi. Bywaj.
	
      Log_SetTopicStatus(CH2_RBL_Feelings, LOG_FAILED);
      B_LogEntry(CH2_RBL_Feelings, "Sprawa z Martinem zakoñczona, niech sami radz¹ sobie ze swoimi problemami.");
	}
	else
	{
      AI_Output (other, self, "DIA_FISK_MartinRing_15_06"); //Wiem co go drêczy. Ktoœ mu ukrad³ z³oty pierœcionek, który wiele dla niego znaczy³.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_07"); //A teraz nagroda.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_08"); //Spokojnie. Dostaniesz rudê jak pomo¿esz Martinowi odzyskaæ pierœcieñ.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_09"); //Nie tak siê umawialiœmy. Jesteœ cholernym oszustem!
      AI_Output (self, other, "DIA_FISK_MartinRing_07_10"); //Co najwy¿ej naci¹gaczem, a to spora ró¿nica. Poza tym czego siê spodziewa³eœ po skazañcu?
      AI_Output (other, self, "DIA_FISK_MartinRing_15_11"); //Niech to szlag. Dobra, dowiem siê kto za tym stoi. Masz jakieœ podejrzenia?
      AI_Output (self, other, "DIA_FISK_MartinRing_07_12"); //Stawia³bym na profesjonalistê. W obozie mamy tylko jednego wykwalifikowanego z³odzieja.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_13"); //R¹czka. Masz racjê, zacznê od niego.
      AI_Output (self, other, "DIA_FISK_MartinRing_07_14"); //W¹tpiê, ¿e siê przyzna. Pogadaj z ludŸmi w obozie, mo¿e ktoœ coœ widzia³.
      AI_Output (other, self, "DIA_FISK_MartinRing_15_15"); //Martinowi zale¿a³o na dyskrecji...
      AI_Output (self, other, "DIA_FISK_MartinRing_07_16"); //Wiêc b¹dŸ dyskretny. Powodzenia.
	
      B_LogEntry(CH2_RBL_Feelings, "Dostanê rudê jak pomogê Martinowi odzyskaæ pierœcieñ. Fisk to cholerny oszust. Martin twierdzi³, ¿e sygnetu nie ukrad³ amator, w obozie znajdê R¹czkê - œwietnego z³odzieja. W¹tpiê, ¿e R¹czka przyzna siê do kradzie¿y, ale mo¿e ktoœ w obozie coœ widzia³?");
	};
};

//***************************************************************

INSTANCE DIA_FISK_MartinRingOk (C_INFO)
{
	npc				= RBL_311_FISK;
	nr				= 23;
	condition		= DIA_FISK_MartinRingOk_Condition;
	information		= DIA_FISK_MartinRingOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Martin wróci³ do ¿ywych."; 
};

FUNC INT DIA_FISK_MartinRingOk_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Martin_Ring))
	{
		return 1;
	};
};

FUNC VOID DIA_FISK_MartinRingOk_Info()
{
	AI_Output (other, self, "DIA_FISK_MartinRingOk_15_01"); //Martin wróci³ do ¿ywych.
	AI_Output (self, other, "DIA_FISK_MartinRingOk_07_02"); //O to mi w³aœnie chodzi³o!
	AI_Output (self, other, "DIA_FISK_MartinRingOk_07_03"); //To twoja ruda, nale¿y Ci siê.
	AI_Output (other, self, "DIA_FISK_MartinRingOk_15_04"); //Te¿ tak uwa¿am. Bywaj.

	CreateInvItems (self,ItMiNugget, 100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	Log_SetTopicStatus	(CH2_RBL_Feelings, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Feelings, "I po sprawie. Jestem bogatszy o pierœcieñ, rudê i kilka œwie¿ych blizn. Ach to ¿ycie...");
};

