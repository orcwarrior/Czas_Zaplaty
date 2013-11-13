var int Mis_Quentin_HeroAppearOnGraveyard;
var int Mis_Quentin_SentHeroToGYD;

FUNC VOID MIS_QUENTIN_GRAVEYARD_SCRIPT_FUNC()
{
	if(!Mis_Quentin_HeroAppearOnGraveyard)&&(Mis_Quentin_SentHeroToGYD)
	{
		Mis_Quentin_HeroAppearOnGraveyard=TRUE;
		B_LogEntry(CH2_RBL_MysteryBook, "Quentin jednak siê pomyli³, nie znalaz³em pos¹¿ka na cmentarzu. Powinienem jeszcze raz z nim porozmawiaæ."); 
	};
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_858_Quentin_Exit (C_INFO)
{
	npc			= HUN_858_Quentin;
	nr			= 999;
	condition	= DIA_HUN_858_Quentin_Exit_Condition;
	information	= DIA_HUN_858_Quentin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_858_Quentin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_858_Quentin_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_HUN_858_Quentin_Hello (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 1;
	condition		= DIA_HUN_858_Quentin_Hello_Condition;
	information		= DIA_HUN_858_Quentin_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_HUN_858_Quentin_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_858_Quentin_Hello_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE); Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_01"); //Witaj. Widzê, ¿e lubisz machaæ mieczem?
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_02"); //Mo¿e i lubiê. A co Ciê to obchodzi?
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_03"); //Chcia³em tylko zagaiæ rozmowê...
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_04"); //Wiesz co? Nie lubiê miêczaków miel¹cych ozorem.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_05"); //Udowodnij, ¿eœ wart mojego czasu, to pogadamy.
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_15_06"); //Ale jak mam to zrobiæ?
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_07"); //To proste. Wyci¹gnij ¿elazo i nie daj siê zabiæ...
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_07_08"); //To jak bêdzie ch³opcze? Stajesz jak mê¿czyzna, czy uciekasz jak zaj¹c?

	Info_ClearChoices (DIA_HUN_858_Quentin_Hello);
	Info_AddChoice (DIA_HUN_858_Quentin_Hello, "Czemu nie.", DIA_HUN_858_Quentin_Hello_Yes);
	Info_AddChoice (DIA_HUN_858_Quentin_Hello, "Mo¿e innym razem.", DIA_HUN_858_Quentin_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_HUN_858_Quentin_Hello_Yes()
{
	quentin_fight = TRUE;
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_Yes_15_01"); //Czemu nie. Trochê ruchu mi nie zaszkodzi.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_Yes_07_02"); //To mi siê podoba.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_Yes_07_03"); //Graj muzyczko!
   
	B_SetTimedATT(self,30*events_per_sec,-250,-250,-80);		
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_HUN_858_Quentin_Hello_No()
{
	// modificated by orc:
	// react on hero flee
	quentin_fight = -1;//hero don't want to fight, but fight goes on anyway
	AI_Output (other, self, "DIA_HUN_858_Quentin_Hello_No_15_01"); //Raczej innym razem.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_07_02"); //Cholerny tchórz! Myœlisz, ¿e pozwolê Ci tak ³atwo odejœæ?!
	AI_Output (self, other, "DIA_HUN_858_Quentin_Hello_No_07_03"); //Upuszczê Ci trochê krwi, mo¿e w koñcu zrozumiesz, gdzie trafi³eœ!
   
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
	B_SetTimedATT(self,30*events_per_sec,-250,-250,-60);				
};

INSTANCE DIA_Quentin_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_858_Quentin;
	nr				= 4;
	condition		= DIA_Quentin_CanYouTeachMe_Condition;
	information		= DIA_Quentin_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Quentin_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_858_Quentin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Quentin_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   
   if (quentin_fight == TRUE) && (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
   {
      AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_02"); //Pokona³eœ w walce, ale jestem w stanie pokazaæ ci kilka nowych sztuczek.
   }
   else
   {
      AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_03"); //Machasz mieczem jak cepem, musisz jeszcze sporo siê nauczyæ.
   };
   
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_04"); //Poka¿ê ci podstawy walki broni¹ jednorêczn¹.
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_05"); //Znam te¿ kilka æwiczeñ na poprawienie zrêcznoœci.
   AI_Output (self, other, "DIA_Quentin_CanYouTeachMe_15_06"); //Wiem te¿ jak szybko zregenerowaæ si³y. 
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Quentin to dobry wojownik i mo¿e mnie wiele nauczyæ. Mo¿e mi pokazaæ, jak sprawnie walczyæ broni¹ jednorêczn¹, zna kilka æwiczeñ poprawiaj¹cych zrêcznoœæ i wie jak szybko zregenerowaæ si³y ¿yciowe.");
};

INSTANCE DIA_HUN_858_Quentin_After (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 2;
	condition		= DIA_HUN_858_Quentin_After_Condition;
	information		= DIA_HUN_858_Quentin_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_858_Quentin_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_858_Quentin_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_HUN_858_Quentin_After_15_01"); //Witamy w Obozie Rebeliantów.
   
	if (quentin_fight == TRUE)
	{
		if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_02"); //Mo¿e i nie jesteœ mistrzem, ale masz serce do walki, a to najwa¿niejsze.
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_03"); //Dobrze wiedzieæ, ¿e chce do nas do³¹czyæ ktoœ, kto nie ucieka na widok miecza.
			B_GiveXP(100);
		}
		else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_04"); //Cholera, pokona³eœ mnie!
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_05"); //Dobrze wiedzieæ, ¿e chce do nas do³¹czyæ taki charakternik.
			B_GiveXP(500);	
		};
	}
	else
	{
		if (quentin_fight == 2)//hero flee detected!
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_10"); //Ucieka³eœ jak tchórz! Gdybyœ by³ prawdziwym wojownikiem, nigdy byœ tak nie post¹pi³...
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_09"); //A teraz zejdŸ mi z oczu.	
		}		
		else if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_06"); //Zapamiêtaj sobie tê naukê, bo tutaj nikt nie lubi tchórzy!
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_07"); //A teraz zejdŸ mi z oczu.
		}
		else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_08"); //Jak to siê sta³o? Cholera mam z³y dzieñ, skoro taki chuderlak mnie pokona³.
			AI_Output (self, other, "DIA_HUN_858_Quentin_After_07_09"); //A teraz zejdŸ mi z oczu.	
			B_GiveXP(100);
		};
	};
};

// **************************************************

var int quentin_ok;

INSTANCE DIA_HUN_858_Quentin_Talk (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 3;
	condition		= DIA_HUN_858_Quentin_Talk_Condition;
	information		= DIA_HUN_858_Quentin_Talk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿emy porozmawiaæ?"; 
};

FUNC INT DIA_HUN_858_Quentin_Talk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_858_Quentin_Talk_Info()
{
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_01"); //Mo¿emy porozmawiaæ?
   
	if (quentin_fight == TRUE)
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_02"); //Pewnie. Dobrze zrobi mi krótka przerwa.
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_03"); //Mów, skoro musisz, tylko siê streszczaj.
	};
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_04"); //Rozmawia³em z Cavalornem. Chcê do was do³¹czyæ, mamy wspólnych wrogów, przyda siê Wam jeszcze jeden miecz.
	AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_05"); //Mówisz o czerwonych?
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_06"); //Tak.
   
	if (quentin_fight == TRUE)
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_07"); //Pokaza³eœ ju¿, ¿e masz serce do walki. Ale nadal brak Ci doœwiadczenia.
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_08"); //Nie przepadam za tchórzami, ale przyda siê teraz ka¿dy, kto da radê unieœæ miecz.
	};
   
	Log_CreateTopic(CH1_Rbl_Warrior, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Warrior, "¯eby zdobyæ uznanie Quentina muszê pokazaæ, ¿e potrafiê walczyæ mieczem.");
   
	AI_Output (other, self, "DIA_HUN_858_Quentin_Talk_15_09"); //Z orê¿em radzê sobie ca³kiem nieŸle.
   
	if (Npc_GetTalentValue(other, NPC_TALENT_1H)>=30)||(Npc_GetTalentValue(other, NPC_TALENT_2H)>=30)
	{
		B_GiveXP(250);
		quentin_ok = TRUE;
		rebel_camp_trust = rebel_camp_trust + 1;//inkrementacja zmiennej odpowiedzialnej za przyjêcie do obozu
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_10"); //Rzeczywiœcie. Radzisz sobie z broni¹ lepiej, ni¿ s¹dzi³em.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_11"); //Je¿eli o mnie chodzi, to nie mam nic przeciwko, ¿ebyœ sta³ siê jednym z nas.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_12"); //Wiesz ju¿, który koniec miecza pchaæ w przeciwnika, a to najwa¿niejsze.
      
		if (quentin_fight == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_13"); //Do tego nie stronisz od porz¹dnej bitki. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_14"); //WeŸ tê receptê, mo¿e zrobisz z niej lepszy u¿ytek ni¿ ja.
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_15"); //Nijak nie potrafiê zrozumieæ, co tam nabazgrano. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_16"); //Zosta³a mi tylko jedna. Reszt¹ podtar³em ty³ek.
         
			CreateInvItems (self,Recept_ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_Light_01, 1);
		};
      
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_17"); //Wracam do swoich zajêæ.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_18"); //Je¿eli Cavalorn zapyta mnie, co o Tobie myœlê, to powiem, ¿e powinieneœ na coœ siê przydaæ.

		Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Warrior, "Udowodni³em Quentinowi, ¿e potrafiê w³adaæ mieczem i toporem.");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "To Quentina mam z g³owy. Zaufania tego wœciek³ego wilka nie zdoby³em, ale przynajmniej poprze mnie przed Cavalornem.");
		
		quentin_fight = 0;
	}
	else
	{
		PrintScreen("Wymagane 30 % walki broni¹ jednorêczn¹ lub dwurêczn¹!", -1, _YPOS_MESSAGE_Joincamp, "font_old_10_white.tga", _TIME_MESSAGE_LOGENTRY);
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_19"); //Nie wydaje mi siê.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Talk_07_20"); //PrzyjdŸ, jak przestaniesz œmierdzieæ ¿ó³todziobem, wtedy pogadamy.
		B_StopProcessInfos(self); 
	};
};

INSTANCE DIA_HUN_858_Quentin_Proof (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 4;
	condition		= DIA_HUN_858_Quentin_Proof_Condition;
	information		= DIA_HUN_858_Quentin_Proof_Info;
	permanent		= 1;
	important		= 0;
	description		= "Potrafiê w³adaæ mieczem!"; 
};

FUNC INT DIA_HUN_858_Quentin_Proof_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Talk))&&(quentin_ok == FALSE)
	{
		return 1;
	};
};
FUNC VOID DIA_HUN_858_Quentin_Proof_Info()
{
	AI_Output (other, self, "DIA_HUN_858_Quentin_Proof_15_09"); //Potrafiê w³adaæ mieczem!
   
	if (Npc_GetTalentValue(other, NPC_TALENT_1H)>=30)||(Npc_GetTalentValue(other, NPC_TALENT_2H)>=30)
	{
		quentin_trust = TRUE;
		B_GiveXP(250);
		quentin_ok = TRUE;
		rebel_camp_trust = rebel_camp_trust + 1;//inkrementacja zmiennej odpowiedzialnej za przyjêcie do obozu
		
      AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_10"); //Rzeczywiœcie. Radzisz sobie z broni¹ lepiej, ni¿ s¹dzi³em.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_11"); //Je¿eli o mnie chodzi, to nie mam nic przeciwko, ¿ebyœ sta³ siê jednym z nas.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_12"); //Wiesz ju¿, który koniec miecza pchaæ w przeciwnika, a to najwa¿niejsze.
		
      if (quentin_fight == TRUE)
		{
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_13"); //Do tego nie stronisz od porz¹dnej bitki. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_14"); //WeŸ tê receptê, mo¿e zrobisz z niej lepszy u¿ytek ni¿ ja.
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_15"); //Nijak nie potrafiê zrozumieæ, co tam nabazgrolono. 
			AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_16"); //Zosta³a mi tylko jedna. Reszt¹ podtar³em ty³ek.
         
			CreateInvItems (self,Recept_ItMw_2H_Sword_Light_01,1);
			B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_Light_01, 1);
		};
      
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_17"); //Wracam do swoich zajêæ.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_18"); //Je¿eli Cavalorn zapyta mnie, co o Tobie myœlê, to powiem, ¿e powinieneœ na coœ siê przydaæ.

		Log_SetTopicStatus(CH1_Rbl_Warrior, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Warrior, "Udowodni³em Quentinowi, ¿e potrafiê w³adaæ mieczem i toporem.");
		B_LogEntry(CH1_Rbl_RebelCampTrust, "To Quentina mam z g³owy. Zaufania tego wœciek³ego wilka nie zdoby³em, ale przynajmniej poprze mnie przed Cavalornem.");
		quentin_fight = 0;
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_19"); //Nie wydaje mi siê.
		AI_Output (self, other, "DIA_HUN_858_Quentin_Proof_07_20"); //PrzyjdŸ, jak przestaniesz œmierdzieæ ¿ó³todziobem, wtedy pogadamy.
      
		B_StopProcessInfos(self); 
	};
};

INSTANCE DIA_Quentin_Attack (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 11;
	condition		= DIA_Quentin_Attack_Condition;
	information		= DIA_Quentin_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Quentin_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Attack_Info()
{
	AI_Output (self, other, "DIA_Quentin_Attack_11_01"); //Myœla³em, ¿e jednak jesteœ m¹drzejszy.
	AI_Output (self, other, "DIA_Quentin_Attack_11_02"); //Szkoda, bo pasowa³byœ do nas, ch³opcze.
	AI_Output (self, other, "DIA_Quentin_Attack_11_03"); //ZejdŸ mi z oczu!
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Stew (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_Stew_Condition;
	information		= DIA_Quentin_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "To doda Ci si³."; 
};

FUNC INT DIA_Quentin_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_Quentin_Stew_15_01"); //To doda Ci si³.
	AI_Output (self, other, "DIA_Quentin_Stew_11_02"); //Na kontynencie powiadaj¹, ¿e co Ciê nie zabije, to Ciê wzmocni. Zaryzykujê...
   
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Quentin chyba s³ysza³ negatywne opinie na temat gulaszu Snafa, ale postanowi³ zaryzykowaæ."); 
};

INSTANCE DIA_Quentin_Spy (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 13;
	condition		= DIA_Quentin_Spy_Condition;
	information		= DIA_Quentin_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nied³ugo czeka nas walka."; 
};

FUNC INT DIA_Quentin_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_Quentin_Spy_15_01"); //Nied³ugo czeka nas walka.
	AI_Output (self, other, "DIA_Quentin_Spy_07_02"); //Ca³e ¿ycie to walka. Kiedy opadniesz z si³ to ju¿ po Tobie.
	AI_Output (other, self, "DIA_Quentin_Spy_15_03"); //A z kim Ty walczysz Quentin? Widzê na Twojej twarzy gniew i... smutek.
	AI_Output (self, other, "DIA_Quentin_Spy_07_04"); //Z samym sob¹ piracie. Z w³asnymi s³aboœciami. 
	AI_Output (self, other, "DIA_Quentin_Spy_07_05"); //Walka zamienia cia³o w stal i hartuje umys³. Kiedy nadejdzie czas, miêœnie zareaguj¹ instynktownie.
	AI_Output (self, other, "DIA_Quentin_Spy_07_06"); //Wtedy nie bêdzie czasu na myœlenie...
	AI_Output (other, self, "DIA_Quentin_Spy_15_07"); //Kiedy?
	AI_Output (self, other, "DIA_Quentin_Spy_07_08"); //Gdy nadejdzie czas zap³aty. 
	AI_Output (self, other, "DIA_Quentin_Spy_07_09"); //Wystarczy ju¿ tego strzêpienia jêzyka...
   
	B_LogEntry(CH2_Rbl_Spy, "Quentin ¿yje tylko po to by walczyæ. Twierdzi, ¿e walczy z samym sob¹, ¿e przygotowuje siê do 'czegoœ'. Tylko do czego?");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od ciebie chcia³.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_Quentin_Spy1 (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 14;
	condition		= DIA_Quentin_Spy1_Condition;
	information		= DIA_Quentin_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "A Ty nadal walczysz?"; 
};

FUNC INT DIA_Quentin_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Quentin_Spy1_15_01"); //A Ty nadal walczysz?
	AI_Output (self, other, "DIA_Quentin_Spy1_07_02"); //Tylko walka siê dla mnie liczy.
	AI_Output (other, self, "DIA_Quentin_Spy1_15_03"); //Chcia³em o coœ zapytaæ...
	AI_Output (self, other, "DIA_Quentin_Spy1_07_04"); //Wiem. Rozumiem Twoje obawy, ale nie potrafiê pomóc.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_05"); //Gdybym zauwa¿y³ coœ podejrzanego, za³atwi³bym to po swojemu.
	AI_Output (other, self, "DIA_Quentin_Spy1_15_06"); //Rozumiem. Popytam innych.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_07"); //Chocia¿... Wydaje mi siê, ¿e Tony zbyt ochoczo bierze s³u¿by na warcie za innych.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_08"); //Rzadko siê zdarza, ¿eby ktoœ z w³asnej woli pcha³ siê na nocne wachty.
	AI_Output (self, other, "DIA_Quentin_Spy1_07_09"); //Ale to tylko moje domys³y, mo¿e jestem przewra¿liwiony.
   
	B_LogEntry(CH2_Rbl_Spy, "Hmm, Quentin zwróci³ mi uwagê na to, ¿e Tony czêsto bierze s³u¿by za innych. To faktycznie jest doœæ dziwne.");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_Quentin_PalGraveyard (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_PalGraveyard_Condition;
	information		= DIA_Quentin_PalGraveyard_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy wiesz gdzie znajdê pos¹¿ek Innosa?"; 
};

FUNC INT DIA_Quentin_PalGraveyard_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_PalGraveyard_Info()
{
	//That's crappy dialog has been created by orc
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_01"); //Czy wiesz gdzie znajdê pos¹¿ek Innosa?
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_02"); //Pos¹¿ek Innosa w Kolonii Karnej?
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_03"); //Kiedyœ na tych ziemiach przebywali paladyni i magowie. Mam nadziejê, ¿e zosta³o po nich coœ wiecej, ni¿ bielej¹ce koœci.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_04"); //Chyba wiem, o czym mówisz. Zdaje siê, ¿e kiedyœ natkn¹³em siê na jakiœ grobowiec.
	AI_Output (other, self, "DIA_Quentin_PalGraveyard_15_05"); //Pamiêtasz, gdzie to by³o?
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_06"); //Przy wejœciu na ziemie orków, niedaleko po³udniowej bramy Starego Obozu. Chyba orkowie przydybali tam kiedyœ paladynów.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_07"); //W ka¿dym razie widzia³em resztki pancerzy i zmursza³e proporce.
	AI_Output (self, other, "DIA_Quentin_PalGraveyard_11_08"); //Kto wie, mo¿e znajdziesz te¿ i pos¹¿ek Innosa.
	
   Mis_Quentin_SentHeroToGYD=TRUE;
	B_LogEntry(CH2_RBL_MysteryBook, "Quentin wspomnia³ o cmentarzu paladynów, zaraz za wejœciem na terytoria orków, drog¹ od po³udniowej bramy Starego Obozu."); 
};

INSTANCE DIA_Quentin_PalGraveyardBack (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 12;
	condition		= DIA_Quentin_PalGraveyardBack_Condition;
	information		= DIA_Quentin_PalGraveyardBack_Info;
	permanent		= 0;
	important		= 0;
	description		= "By³em na cmentarzu."; 
};

FUNC INT DIA_Quentin_PalGraveyardBack_Condition()
{
	if (Mis_Quentin_HeroAppearOnGraveyard)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_PalGraveyardBack_Info()
{
	//That's crappy dialog has been created by orc
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_01"); //By³em na cmentarzu.
	AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_02"); //I jak, odnalaz³eœ pos¹¿ek Innosa?
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_03"); //Niestety nie.
	AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_04"); //Ja Ci ju¿ nie pomogê. Nie mam pojêcia, gdzie móg³byœ jeszcze zajrzeæ.
	AI_Output (other, self, "DIA_Quentin_PalGraveyardBack_15_05"); //Rozumiem, bywaj.
   
	if(aligator_trust)
	{
		AI_Output (self, other, "DIA_Quentin_PalGraveyardBack_11_06"); //Zaczekaj chwilê. Jakiœ pirat Ciê tu szuka³. To chyba ten ‘legendarny’.
	};
   
	B_GiveXP(500);
	B_LogEntry(CH2_RBL_MysteryBook, "Po ponownej wizycie u Quentina nadal nie wiem, gdzie znaleŸæ pos¹¿ek. Quentin wspomina³ jeszcze o Jacku Aligatorze, który mnie szuka³, mo¿e on mi jakoœ pomo¿e?"); 
};

INSTANCE DIA_Quentin_Leaf (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 20;
	condition		= DIA_Quentin_Leaf_Condition;
	information		= DIA_Quentin_Leaf_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno znasz siê na alchemii."; 
};

FUNC INT DIA_Quentin_Leaf_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Leaf))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Leaf_Info()
{
	AI_Output (other, self, "DIA_Quentin_Leaf_15_01"); //Podobno znasz siê na alchemii.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_02"); //Co Ci do tego?
	AI_Output (other, self, "DIA_Quentin_Leaf_15_03"); //Leaf po³kn¹³ magiczny specyfik i straci³ przytomnoœæ.
	AI_Output (other, self, "DIA_Quentin_Leaf_15_04"); //Cavalorn powiedzia³, ¿e móg³byœ pomóc.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_05"); //Leaf ci¹gle pakuje siê w jakieœ k³opoty.
	AI_Output (self, other, "DIA_Quentin_Leaf_11_06"); //Chyba mam coœ co mu pomo¿e. ZaprowadŸ mnie do niego.
	AI_Output (other, self, "DIA_Quentin_Leaf_15_07"); //Ruszajmy.
	
   B_LogEntry(CH1_RBL_Stone, "Quentin siê zgodzi³. Muszê zaprowadziæ go do Leafa.");

   Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_LeafFind (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 21;
	condition		= DIA_Quentin_LeafFind_Condition;
	information		= DIA_Quentin_LeafFind_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Quentin_LeafFind_Condition()
{
	var C_NPC leaf; leaf = Hlp_GetNpc(RBL_4011_Leaf);

	if (Npc_KnowsInfo (hero, DIA_Quentin_Leaf))&&(Npc_GetDistToNpc(self,leaf) < 300)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_LeafFind_Info()
{
	var C_NPC leaf; leaf = Hlp_GetNpc(RBL_4011_Leaf);

	B_FullStop (hero);
	
   AI_Output (other, self, "DIA_Quentin_LeafFind_15_01"); //Jesteœmy na miejscu!
	
   AI_TurnToNpc (other, leaf);
	AI_TurnToNpc (self, leaf);
	
   AI_Output (self, other, "DIA_Quentin_LeafFind_11_02"); //Daj mi chwilê...
	
   AI_GotoNpc(self,leaf);
	B_StopProcessInfos(self); 
	AI_PlayAni(self, "T_PLUNDER");
	AI_StandUp(leaf);
	AI_TurnToNpc (leaf, other);
	Npc_ExchangeRoutine(leaf,"START");
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************

INSTANCE DIA_Quentin_LeafOk (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 22;
	condition		= DIA_Quentin_LeafOk_Condition;
	information		= DIA_Quentin_LeafOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co zrobi³eœ?"; 
};

FUNC INT DIA_Quentin_LeafOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_LeafFind))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_LeafOk_Info()
{
	B_FullStop (hero);
	B_FullStop (self);
	
   AI_Output (other, self, "DIA_Quentin_LeafOk_15_01"); //Co zrobi³eœ?
	
   AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Quentin_LeafOk_11_02"); //Da³em mu po mordzie. To najlepsza metoda. Bywaj!
	
   Npc_ExchangeRoutine(self,"START");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Martin (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 23;
	condition		= DIA_Quentin_Martin_Condition;
	information		= DIA_Quentin_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzia³eœ Martina?"; 
};

FUNC INT DIA_Quentin_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Martin_Info()
{
	AI_Output (other, self, "DIA_Quentin_Martin_15_01"); //Widzia³eœ Martina?
	AI_Output (self, other, "DIA_Quentin_Martin_11_02"); //Nie, ju¿ od kilku dni nie widzia³em tej zakazanej mordy.
	AI_Output (other, self, "DIA_Quentin_Martin_15_03"); //A R¹czkê?
	AI_Output (self, other, "DIA_Quentin_Martin_11_04"); //Tak, jakiœ czas temu szed³ z kilofem w stronê bramy. Podrzuca³ w rêku jakieœ œwiecide³ko...
	AI_Output (other, self, "DIA_Quentin_Martin_15_05"); //Dziêki, Quentin.
	AI_Output (self, other, "DIA_Quentin_Martin_11_06"); //Do us³ug.

	B_LogEntry(CH2_RBL_Feelings, "Quentin widzia³ jak R¹czka opuszcza³ obóz z kilofem. Do tego podrzuca³ w rêku jakieœ œwiecide³ko. Ten sukinsyn chyba gdzieœ zakopuje swoje ³upy.");

	B_fingers_proofs();
};

INSTANCE DIA_Quentin_Hanis (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 25;
	condition		= DIA_Quentin_Hanis_Condition;
	information		= DIA_Quentin_Hanis_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em zapytaæ o Gor Hanisa."; 
};

FUNC INT DIA_Quentin_Hanis_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kharim_WhatGor))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Hanis_Info()
{
	AI_Output (other, self, "DIA_Quentin_Hanis_15_01"); //Chcia³em zapytaæ o Gor Hanisa.
	AI_Output (self, other, "DIA_Quentin_Hanis_11_02"); //Tak?
	AI_Output (other, self, "DIA_Quentin_Hanis_15_03"); //Podobno to twoje s³owo zawa¿y³o na wydaleniu go z obozu.
	AI_Output (self, other, "DIA_Quentin_Hanis_11_04"); //Tak.
	AI_Output (other, self, "DIA_Quentin_Hanis_15_05"); //Nie masz nic wiêcej do powiedzenia?
	AI_Output (self, other, "DIA_Quentin_Hanis_11_06"); //Nie.
	
   B_LogEntry(CH2_RBL_Mem, "Coœ mi tu œmierdzi. Quentin nabra³ wody w usta. Zosta³ mi tylko Ratford.");
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Quentin_Hanis1 (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 26;
	condition		= DIA_Quentin_Hanis1_Condition;
	information		= DIA_Quentin_Hanis1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em znowu zapytaæ o Gor Hanisa."; 
};

FUNC INT DIA_Quentin_Hanis1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Hanis))
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_Hanis1_Info()
{
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_01"); //Chcia³em znowu zapytaæ o Gor Hanisa.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_02"); //Powiedzia³em Ci wszystko co wiem, a teraz zejdŸ mi z oczu.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_03"); //Coœ tu œmierdzi. Hanis nie móg³ zabiæ rekruta, bo pewnie nadal le¿a³ nieprzytomny po ciosie Kharima.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_04"); //Jaka jest prawda?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_05"); //Pos³uchaj mnie uwa¿nie. Gor Hanis zabi³ rekruta. Wiem, co widzia³em. 
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_06"); //Odpowiedz dok³adnie, co widzia³eœ.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_07"); //Zrobiê to, ale po raz ostatni.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_08"); //Gor Hanis powali³ Kharima. Nie powiem, ³adnie za³atwi³ skurczybyka.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_09"); //Kiedy wyci¹gn¹³ rêkê do najemnika, ten uderzy³ p³azem miecza.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_10"); //No có¿. Ka¿dy wojownik powinien byæ przygotowany na nieczysty cios.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_11"); //Kharim o dziwo pochyli³ siê nad Hanisem i ocuci³ go, uderzaj¹c w twarz.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_12"); //Jak go znam, to pewnie robi³ to z uœmiechem na ustach. Co by³o dalej?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_13"); //Hanis nagle odzyska³ œwiadomoœæ. Pamiêtam, ¿e coœ wyplu³...
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_14"); //PóŸniej zacz¹³ opêtañczo krzyczeæ, wyrwa³ miecz i skoczy³ na rekruta. Ten nie mia³ szans.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_15"); //Zanim zaatakowa³ kolejn¹ ofiarê, uderzy³em go g³owic¹ miecza w potylicê.
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_16"); //Zwi¹zaliœmy nieszczêœnika i zanieœliœmy do Ratforda. Resztê ju¿ znasz.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_17"); //Powiedzia³eœ, ¿e Hanis coœ wyplu³. Co to mog³o byæ?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_18"); //Mo¿e z¹b? Nie mam pojêcia. To Kharim go cuci³.
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_19"); //Hmm. Coœ mi œwita. Mam pewien pomys³. Kto w obozie sprzedaje ziele?
	AI_Output (self, other, "DIA_Quentin_Hanis1_11_20"); //Baal Taran i Baal Kagan. A dlaczego pytasz?
	AI_Output (other, self, "DIA_Quentin_Hanis1_15_21"); //Myœlê, ¿e Kharim nie tylko cuci³ Gor Hanisa. Bywaj.
	
   B_LogEntry(CH2_RBL_Mem, "Quentin zrelacjonowa³ mi wszystko. Wydaje mi siê, ¿e Kharim nie tylko cuci³ Gor Hanisa, ale te¿ poda³ mu doustnie jakiœ specyfik, który sprawi³, ¿e by³y sekciarz wpad³ w sza³. Muszê pogadaæ ze sprzedawcami ziela - Baal Taranem i Baal Kaganem, czy przypadkiem Kharim niczego od nich ostatnio nie kupi³.");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Quentin_NewWeapon (C_INFO)
{
	npc				= HUN_858_Quentin;
	nr				= 15;
	condition		= DIA_Quentin_NewWeapon_Condition;
	information		= DIA_Quentin_NewWeapon_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie nowy miecz."; 
};

FUNC INT DIA_Quentin_NewWeapon_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(other,HUN_MW_03)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Quentin_NewWeapon_Info()
{
	B_GiveXP(100);
	
   AI_Output (other, self, "DIA_Quentin_NewWeapon_15_01"); //Mam dla Ciebie nowy miecz.
	AI_Output (self, other, "DIA_Quentin_NewWeapon_11_02"); //To œwietnie, stary jest ju¿ bardziej wyszczerbiony ni¿ gêba Kufla.
	
   B_GiveInvItems (other, self, HUN_MW_03, 1);
	AI_Output (self, other, "DIA_Quentin_NewWeapon_11_03"); //Dziêki, bêdzie czym ok³adaæ stra¿ników.
   
	B_LogEntry(CH3_RBL_DelivWeapon, "Quentin dosta³ nowy miecz.");
};