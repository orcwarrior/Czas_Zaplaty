var int Mis_SearchForPlatesAccepted;
// **************************************************
//						 EXIT
// **************************************************

instance  Stt_2501_Keretsel_Exit (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 999;
	condition	= Stt_2501_Keretsel_Exit_Condition;
	information	= Stt_2501_Keretsel_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Stt_2501_Keretsel_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_2501_Keretsel_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Pierœcionek
// QUESTID 552
// **************************************************
instance  Stt_2501_Keretsel_Ring (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 1;
	condition	= Stt_2501_Keretsel_Ring_Condition;
	information	= Stt_2501_Keretsel_Ring_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mogê Ci w czymœ pomóc?";
};

FUNC int  Stt_2501_Keretsel_Ring_Condition()
{
	//if (Kapitel >= 3)
	//{
	return 1;
	//};
};

FUNC VOID  Stt_2501_Keretsel_Ring_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Ring_11_00"); //Mogê Ci w czymœ pomóc?
	AI_Output (self, other,"Stt_2501_Keretsel_Ring_11_01"); //W rzeczy samej. Niejaki Witten jest w posiadaniu pewnego pierœcienia.
	AI_Output (self, other,"Stt_2501_Keretsel_Ring_11_02"); //Chcê go zdobyæ. I Ty mi w tym pomo¿esz, prawda?

	Info_ClearChoices	(Stt_2501_Keretsel_Ring);
	Info_AddChoice		(Stt_2501_Keretsel_Ring,"Nie ma mowy.",DIA_Stt_2501_Keretsel_Find_Decision_Ring_No);
	Info_AddChoice		(Stt_2501_Keretsel_Ring,"Oczywiœcie.",DIA_Stt_2501_Keretsel_Find_Decision_Ring_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Find_Decision_Ring_Yes()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Find_Decision_Ring_Yes_15_00"); //Oczywiœcie.
	AI_Output (self, other,"Stt_2501_Keretsel_Find_Decision_Ring_Yes_15_01"); //W takim razie poœpiesz siê.
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForWittenRing, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForWittenRing, LOG_RUNNING);
	B_LogEntry(KeretselLookingForWittenRing, "Keretsel chce, abym zdoby³ dla niego pierœcieñ Wittena.");
	
	GetTheWittenRing = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Find_Decision_Ring_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_00"); //Nie ma mowy.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_01"); //Kolejna osoba, która nie potrafi nawet gwizdn¹æ g³upiego kawa³ka metalu. Wypierdalaj!
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Find_Decision_Ring_No_15_02"); //Spokojnie. Ju¿ sobie idê.
	
	B_StopProcessInfos(self);
};  
/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_The_Witten_Ring(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 2;
	condition	= Stt_2501_Keretsel_Have_The_Witten_Ring_Condition;
	information	= Stt_2501_Keretsel_Have_The_Witten_Ring_Info;
	permanent	= 0;
	description = "Mam pierœcieñ Wittena.";
};

FUNC int  Stt_2501_Keretsel_Have_The_Witten_Ring_Condition()
{
	if ((Npc_HasItems(hero,WittenRing)) && (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Ring)))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Have_The_Witten_Ring_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_The_Witten_Ring_Info_11_00"); //Mam pierœcieñ Wittena.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_The_Witten_Ring_Info_11_01"); //Czas najwy¿szy! Dawaj go, oto ruda.

	B_GiveInvItems(hero,self,WittenRing,1);
	//zdefiniuj ile rudy dac (nie ma tego w scenariuszu) da³em 50 bo w scenariuszu by³o: (linia 63) "Keretsel wzamian za pierœcieñ da³ mi doœæ niewielk¹ nagrodê."
	CreateInvItems(self,ItMinugget,50);
	B_GiveInvItems(self,hero,ItMinugget,50);
	
	B_LogEntry(KeretselLookingForWittenRing, "Keretsel w zamian za pierœcieñ da³ mi niewielk¹ nagrodê. Niech szlag go trafi!");
	B_LogSetTopicStatus(KeretselLookingForWittenRing, LOG_SUCCESS);
	
	GetTheWittenRing = LOG_SUCCESS;
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Fanatyk bi¿uterii
// QUESTID 553
// **************************************************

instance  Stt_2501_Keretsel_Asking_About_Jewellery_Quest(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 3;
	condition	= Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Condition;
	information	= Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info;
	permanent	= 0;
	description = "Mogê jeszcze coœ dla Ciebie zrobiæ?";
};

FUNC int  Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Condition()
{
	if (GetTheWittenRing == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_00"); //Mogê jeszcze coœ dla Ciebie zrobiæ?
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_01"); //Tak. Zawsze znajdzie siê jakaœ robota.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Info_11_02"); //Podoba mi siê pewien amulet, ale jest w posiadaniu Ramona. Zdobêdziesz go dla mnie?

	Info_ClearChoices	(Stt_2501_Keretsel_Asking_About_Jewellery_Quest);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Jewellery_Quest,"Nie.",DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Jewellery_Quest,"Jasne.",DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes_15_00"); //Jasne.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_Yes_15_01"); //To dobrze. Bêdê na Ciebie czekaæ.
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForRamonAmulet, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForRamonAmulet, LOG_RUNNING);
	B_LogEntry(KeretselLookingForRamonAmulet, "Keretsel chce zdobyæ kolejny element bi¿uterii do kolekcji. Tym razem jest to amulet znajduj¹cy siê w posiadaniu Ramona.");

	GetTheRamonAmulet = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No_15_00"); //Nie.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Jewellery_Quest_No_15_01"); //Ju¿ doœæ mi pomog³eœ, sam sobie dam z tym radê.
	
	B_StopProcessInfos(self);
};  
/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_The_Ramon_Amulet(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 4;
	condition	= Stt_2501_Keretsel_Have_The_Ramon_Amulet_Condition;
	information	= Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info;
	permanent	= 0;
	description = "Mam amulet dla Ciebie.";
};

FUNC int  Stt_2501_Keretsel_Have_The_Ramon_Amulet_Condition()
{
	if ((Npc_HasItems(hero,RamonAmulet)) && (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Asking_About_Jewellery_Quest)))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info_11_00"); //Mam amulet dla Ciebie.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_The_Ramon_Amulet_Info_11_01"); //Œwietnie! Daj go tutaj. Hmm... masz. To powinno pokryæ wydatki.
	
	B_GiveInvItems(hero,self,RamonAmulet,1);
	
	CreateInvItems(self,ItMinugget,300);
	B_GiveInvItems(self,hero,ItMinugget,300);
	
	//orc: musisz zdefiniowac ile kasy znow jako nagroda
	
	B_LogEntry(KeretselLookingForRamonAmulet, "Odda³em amulet Keretselowi. W nagrodê otrzyma³em 300 bry³ek rudy.");
	B_LogSetTopicStatus(KeretselLookingForRamonAmulet, LOG_SUCCESS);
	
	GetTheRamonAmulet = LOG_SUCCESS;
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Drogie talerze
// QUESTID 554
// **************************************************

/******************************************************************************************/
instance  Stt_2501_Keretsel_Asking_About_Ileum_Quest(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 5;
	condition	= Stt_2501_Keretsel_Asking_About_Ileum_Quest_Condition;
	information	= Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info;
	permanent	= 1;
	description = "Mo¿e masz jeszcze jak¹œ robótkê?";
};

FUNC int  Stt_2501_Keretsel_Asking_About_Ileum_Quest_Condition()
{
	if (Npc_KnowsInfo(hero,Stt_2501_Keretsel_Have_The_Ramon_Amulet))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_00"); //Mo¿e masz jeszcze jak¹œ robótkê?
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_01"); //Owszem. Udowodni³eœ, ¿e potrafisz zdobyæ potrzebne mi przedmioty.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_02"); //Dowiedzia³em siê, i¿ w obozie mo¿na znaleŸæ talerze, które zosta³y niegdyœ skradzione Rhobarowi.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_03"); //Brzmi to mo¿e absurdalnie, ale znam osobê, która chêtnie je odkupi i to za niez³¹ cenê. ¯¹da tylko wszystkich na raz - pojedynczo niewiele znacz¹.
	AI_Output (self, other,"Stt_2501_Keretsel_Asking_About_Ileum_Quest_Info_11_04"); //Przyniesiesz je?
	
	Info_ClearChoices	(Stt_2501_Keretsel_Asking_About_Ileum_Quest);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Ileum_Quest,"Mam jeszcze masê innej roboty.",DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No);
	Info_AddChoice		(Stt_2501_Keretsel_Asking_About_Ileum_Quest,"Pewnie",DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes);
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes_15_00"); //Pewnie.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_Yes_15_01"); //Cieszê siê, ale idŸ ju¿. Ruda czeka.
	
	Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent = FALSE;
	
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KeretselLookingForFourIleum, LOG_MISSION);
	B_LogSetTopicStatus(KeretselLookingForFourIleum, LOG_RUNNING);
	B_LogEntry(KeretselLookingForFourIleum, "Keretsel zleci³ mi zdobycie srebrnych B³yszcz¹cych Talerzy nale¿¹cych do mieszkañców obozu. Powinienem przeszukaæ ich chaty.");

	//GetTheFourIleum = LOG_RUNNING;
};

FUNC void DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No()
{
	AI_Output (other, self,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No_15_00"); //Mam jeszcze masê innej roboty.
	AI_Output (self, other,"DIA_Stt_2501_Keretsel_Asking_About_Ileum_Quest_No_15_01"); //Jasne, rozumiem. Wróæ, kiedy siê zdecydujesz.
	
	B_StopProcessInfos(self);
};  

/******************************************************************************************/
instance  Stt_2501_Keretsel_How_Many_Ileum_Question(C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 6;
	condition	= Stt_2501_Keretsel_How_Many_Ileum_Question_Condition;
	information	= Stt_2501_Keretsel_How_Many_Ileum_Question_Info;
	permanent	= 0;
	description = "Ile jest tych talerzy?";
};

FUNC int  Stt_2501_Keretsel_How_Many_Ileum_Question_Condition()
{
	if ((Npc_KnowsInfo(hero,Stt_2501_Keretsel_Asking_About_Ileum_Quest))&&(Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent==FALSE))
	{
		return 1;
	};
};

FUNC int  Stt_2501_Keretsel_How_Many_Ileum_Question_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_How_Many_Ileum_Question_Info_11_00"); //Ile jest tych talerzy?
	AI_Output (self, other,"Stt_2501_Keretsel_How_Many_Ileum_Question_Info_11_01"); //Pó³ tuzina. Równo.
	
	B_LogEntry(KeretselLookingForFourIleum, "Podobno muszê zdobyæ szeœæ owych talerzy.");
};

/******************************************************************************************/
instance  Stt_2501_Keretsel_Have_All_Ileums (C_INFO)
{
	npc			= Stt_2501_Keretsel;
	nr			= 4;
	condition	= Stt_2501_Keretsel_Have_All_Ileums_Condition;
	information	= Stt_2501_Keretsel_Have_All_Ileums_Info;
	permanent	= 0;
	description = "Mam talerze.";
};

FUNC int  Stt_2501_Keretsel_Have_All_Ileums_Condition()
{
	if ((Npc_HasItems(other,KeretselIleums)>=6) && (Stt_2501_Keretsel_Asking_About_Ileum_Quest.permanent==FALSE))
	{
		return 1;
	};
};

FUNC VOID  Stt_2501_Keretsel_Have_All_Ileums_Info()
{
	AI_Output (other, self,"Stt_2501_Keretsel_Have_All_Ileums_11_00"); //Mam talerze.
	AI_Output (self, other,"Stt_2501_Keretsel_Have_All_Ileums_11_01"); //Poka¿!
	
	B_GiveInvItems(self,hero,KeretselIleums,6);
	
	AI_Output (self, other,"Stt_2501_Keretsel_Have_All_Ileums_11_02"); //Tak, to te. Bierz rudê. Po³owa zysków dla Ciebie.
	
	B_StopProcessInfos(self);

	B_LogEntry(KeretselLookingForFourIleum, "Keretsel odebra³ talerze i zap³aci³ z góry. Jego kolejne zlecenie zaliczone.");
	B_LogSetTopicStatus(KeretselLookingForFourIleum, LOG_SUCCESS);
};








