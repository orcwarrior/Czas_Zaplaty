// Ork: Tu nekro w Cave.ZEN (1sze spotkanie) + w swojej siedzibie
// **************************************************
// 						 EXIT 
// **************************************************
prototype Necro_Exit (C_INFO)
{
	npc			=  DMB_1700_Necro;
	nr			=  999;
	condition	=  DIA_Necro_Exit_Condition;
	information	=  DIA_Necro_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

FUNC int DIA_Necro_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Necro_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Necro_Exit (Necro_Exit)
{
};      

INSTANCE DIA_NecroInNecroloc_Exit (Necro_Exit)
{
   npc = DMB_1701_NecroInNecroloc;
}; 

INSTANCE DIA_NecroInWorld_Exit (Necro_Exit)
{
   npc = DMB_1703_NecroInWorld;
};                  

INSTANCE DIA_Necro_First (C_INFO)
{
	npc				= DMB_1700_Necro;
	nr				= 1;
	condition		= DIA_Necro_First_Condition;
	information		= DIA_Necro_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Leren_RuneSwdBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	//AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_First_11_01"); //Jak œmiesz zabijaæ moje s³ugi?!
	AI_Output (self, other, "DIA_Necro_First_11_02"); //Spróbuj zatañczyæ z ogniem!
	//AI_Output (other, self, "DIA_Necro_First_15_02"); //
	B_LogEntry(CH4_Nec_BM, "Znalaz³em nekromantê! Mam nadziejê, ¿e prze¿yjê wystarczaj¹co d³ugo, aby z nim porozmawiaæ.");

	/******************
	Dodaj jakieœ szpanerskie efekty xD
	******************/
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	B_StopProcessInfos(self);
	/*********************
	Ork mo¿na to jedn¹ rutyn¹ za³atwiæ tylko dac tam warunki, czyli jak place_change ==1 to rutyna w tym wp, jak ==2 to w innym, etc.
	***********************/
	place_change = place_change + 1;
	Npc_ExchangeRoutine (self, "next_place");
	/***********************
	Z tego co aragorn pisa³ to koleœ ma po dialogach znikaæ, to mo¿e tym startstatem lepiej siê to robi bo TP chyba nie dzia³a tak.
	Stwórz jakiœ zs albo zrób to po swojemu
	Aha w zs te| uwzglêdnij place_change
	***********************/
	//AI_StartState(self,ZS_NekroTP,1,"");
};

// **************************************************

/*********************
Po ogniach i lawie
*********************/

INSTANCE DIA_Necro_Second(C_INFO)
{
	npc				= DMB_1700_Necro;
	nr				= 2;
	condition		= DIA_Necro_Second_Condition;
	information		= DIA_Necro_Second_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Second_Condition()
{
	// Ork: 3ci warunek powinien zahamowaæ nekro przed gadaniem zbyt wiele zanim uciekniemy przed lawa
	// #2 Ta pierwa rozmowa nie zawsze sie uruchamia (u mnie nigdy :P ) dlatego sprawdzmy lepiej zmienna z EventCave.d zamiast Info
	if (Npc_GetDistToNpc(self,hero) < 1000)&& (EvtCave_HeroRunawaySucess) && (Npc_GetDistToWP(self,"ESCAPE_DARKMAGE") < 2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Second_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Necro_Second_11_01"); //To znowu Ty?!
	AI_Output (self, other, "DIA_Necro_Second_11_02"); //Jak œmia³eœ przejœæ przez lawê?!
	AI_Output (other, self, "DIA_Necro_First_15_03"); //Tak jakoœ wysz³o.
	AI_Output (self, other, "DIA_Necro_Second_11_04"); //Ty natrêtna gnido. Œmiesz mi rzucaæ wyzwanie?!
	AI_Output (other, self, "DIA_Necro_First_15_05"); //Nie... Panie. Chcia³em tylko... b³agaæ o to, abyœ zaszczyci³ mnie odpowiedzi¹ na jedno pytanie?
	AI_Output (self, other, "DIA_Necro_Second_11_06"); //Zaszczyci³? Dobrze, dost¹pisz tego zaszczytu zanim wypcham Ciê i powieszê nad kominkiem. Pytaj!

	Info_ClearChoices (DIA_Necro_Second);
	Info_AddChoice (DIA_Necro_Second, "Zechcesz zostaæ moim mistrzem?", DIA_Necro_Second_Learn);
	
   if (NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
      Info_AddChoice (DIA_Necro_Second, "Spójrz na to ostrze.", DIA_Necro_Second_Swd);
	};
};

// ---------------------------Swd----------------------------------------

FUNC VOID DIA_Necro_Second_Swd()
{
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_01"); //Spójrz na to ostrze.
	AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_PlayAni				(other, "T_1HSINSPECT");
	AI_UnequipWeapons		(other);
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_02"); //Natychmiast oddaj mi miecz!
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_03"); //Proszê.
   
	B_GiveInvItems(other, self, ItMw_2H_RuneSWD_01, 1);
   
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_04"); //G³upcze ten miecz runiczny to Ostrze Boskiej Trójcy!
	AI_Output (other, self, "DIA_Necro_Second_Swd_15_05"); //Wiem o tym...
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_06"); //I odda³eœ mi orê¿ z w³asnej woli? Albo jesteœ idiot¹ albo najbardziej naiwnym skazañcem w ca³ej Kolonii.
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_07"); //Gdy tchnê moc w pradawn¹ stal bêdê w³ada³ nieujarzmion¹ potêg¹ ¿ywio³ów!
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_08"); //Ale ciebie ju¿ wtedy nie bêdzie wœród ¿ywych.
	AI_Output (self, other, "DIA_Necro_Second_Swd_11_09"); //Spróbuj znowu przejœæ przez p³omienie...

	B_StopProcessInfos(self);
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	/*********************
		Znowu gdzieœ spada, ale teraz to ju¿ nieistotne bo dick i tak umiera
		***********************/
	place_change = place_change + 1;
	Npc_ExchangeRoutine (self, "next_place");
	Rick_death = true;
	//AI_StartState(self,ZS_NekroTP,1,"");
	
	/************************
		Dicka znowu ma zalaæ lawa ale tym razem nie ma mo¿liwoœci ucieczki.
		***********************/
	//TODO: Przypomniec sobie triggery spisac TP i podnoszenie lavy z starego nekro (DMB NEKRO COSTAM
	//dick_end ();
};

FUNC VOID DIA_Necro_Second_Learn()
{
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_01"); //Zechcesz zostaæ moim mistrzem?
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_02"); //Jak œmiesz o to pytaæ?!
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_03"); //Jestem czarnym magiem, wybranym s³ug¹ Beliara, w³adam potêg¹ nekromancji, s³u¿¹ mi zastêpy umar³ych i demonów. 
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_04"); //Co Ty mi mo¿esz zaoferowaæ prócz swego nêdznego ¿ywota?
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_05"); //Przyniosê Ci g³owy Twych wrogów, wypalê Twe imiê w trwo¿liwych sercach œmiertelników, bêdê Twym mieczem i tarcz¹ po kres swych dni! 
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_06"); //Zapalczywe to s³owa... Hmm. Wyczuwam w Tobie... godny potencja³.
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_07"); //Przyda³by mi siê s³u¿¹cy, narzêdzie gotowe wype³niæ m¹ wolê.
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_08"); //Dobrze wiêc, uczyniê Ci ten zaszczyt. Ale najpierw musisz przejœæ Próbê Mroku, aby dowieœæ swej wartoœci.
	AI_Output (other, self, "DIA_Necro_Second_Learn_15_09"); //Co to za próba, Panie?
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_10"); //Dowiesz siê w swoim czasie. WeŸ tê runê. Mam nadziejê, ¿e wiesz, co masz z ni¹ zrobiæ...
	AI_Output (self, other, "DIA_Necro_Second_Learn_11_11"); //A na razie, ¿egnaj!

	//Ork: To chyba zostaje:
	B_LogEntry(CH4_Nec_BM, "Aby zdobyæ zaufanie nekromanty muszê odbyæ Próbê Mroku. Na razie dosta³em runê? Ciekawe, dok¹d mnie ona doprowadzi?");
	B_StopProcessInfos(self);
	place_change = place_change + 1; //Ork: NIE WIEM CO TO ZA ZMIENNA? ZOSTAWIAM NARAZIE TUTAJ
	Npc_ExchangeRoutine (self, "next_place");//Ork: Dodaje ju¿ runê tutaj, ale dialogów nie tykam :)
	Create_and_give(ItArRuneTeleportToNecroloc, 1);
};

INSTANCE DIA_Necro_GreetInNecroloc(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 31;
	condition		= DIA_Necro_GreetInNecroloc_Condition;
	information		= DIA_Necro_GreetInNecroloc_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_GreetInNecroloc_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1500)&&(Npc_KnowsInfo (hero, DIA_Necro_Second))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_GreetInNecroloc_Info()
{
	//Ork: Nekro podchodzi do hero
	if(Npc_GetDistToNpc(self,hero) > 400)
	{
		AI_TurnToNpc(self, other);
		AI_SetWalkmode(self,NPC_WALK);
		AI_GotoNpc(self,other);
	};
	AI_Output (self, other, "DIA_Necro_GreetInNecroloc_11_01"); //Na Beliara! Jednak odwa¿y³eœ siê do mnie teleportowaæ!
	AI_Output (other, self, "DIA_Necro_GreetInNecroloc_15_02"); //Bo chcê wszystko robiæ ku chwalê Beliara, mój panie!
	AI_Output (self, other, "DIA_Necro_GreetInNecroloc_11_03"); //Dobrze, bardzo dobrze. Daj znaæ, gdy tylko bêdziesz gotowy, aby rozpocz¹æ próbê!
};

INSTANCE DIA_Necro_ReadyForTest(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 32;
	condition		= DIA_Necro_ReadyForTest_Condition;
	information		= DIA_Necro_ReadyForTest_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem gotów byœ podda³ mnie próbie."; //Ork: Ewentualnie do poprawki 
};

FUNC INT DIA_Necro_ReadyForTest_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_GreetInNecroloc))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_ReadyForTest_Info()
{
	AI_Output (other, self, "DIA_Necro_ReadyForTest_15_01"); //Jestem gotów byœ podda³ mnie próbie.
   AI_Output (other, self, "DIA_Necro_ReadyForTest_11_02"); //Co to za próba, Panie?
	AI_Output (self, other, "DIA_Necro_ReadyForTest_11_03"); //Tylko ktoœ, kto potrafi zabiæ swoje w³asne jestestwo mo¿e staæ siê czar¹ Beliara.
	AI_Output (other, self, "DIA_Necro_ReadyForTest_11_04"); //Jestem gotów.
	AI_Output (self, other, "DIA_Necro_ReadyForTest_11_05"); //Zmierz siê wiêc z samym sob¹, ze swoj¹ si³¹ i s³aboœci¹, aby staæ siê Dzieckiem Ciemnoœci!
	
   Log_CreateTopic(CH4_Nec_Trial, LOG_MISSION);
	Log_SetTopicStatus(CH4_Nec_Trial, LOG_RUNNING);
	B_LogEntry(CH4_Nec_Trial, "Nekromanta podda³ mnie Próbie Mroku. Muszê zmierzyæ siê z... samym sob¹.");
	B_LogEntry(CH4_Nec_BM, "Aby zdobyæ zaufanie nekromanty, muszê odbyæ Próbê Mroku.");
	B_StopProcessInfos(self);
   
   /*********************
		Nekro znika i pojawia siê drugi Rick, tylko ma mieæ czerwone ga³y. Ork zrób to jak uwa¿asz...
		Opis Aragorna:
		Nawalamy siê z nim, ale po pewnym czasie zdajemy sobie sprawê z tego, ¿e mamy wa³a.
		Gdy obrywa nasz sobowtór my tracimy dok³adnie tyle samo hp. - jestem geniuszem :D
		Z otworu w sklepieniu pada struga œwiat³a, gdy uda nam siê w ni¹ zagnaæ przeciwnika ten zaczyna p³on¹æ. Wtedy atakuj¹c go nie tracimy hp.
		
		Po pokonaniu niech nekro znowy siê pojawia.
		Niech siê zmienna dick_trial ustawi na TRUE jak mu siê uda bo to bêdzie warunek do kolejnego dialogu
		***********************/
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);
	Wld_InsertNpc (PC_Hero_AlterEgo, "NECRO_CENTER");
};

/*********************
Po próbie
*********************/

INSTANCE DIA_Necro_Trial(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;//Ork: zrobione
	nr				= 3;
	condition		= DIA_Necro_Trial_Condition;
	information		= DIA_Necro_Trial_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Trial_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Necro_ReadyForTest)) && (Npc_IsDead(PC_Hero_AlterEgo))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Trial_Info()
{
	/*********************
	Ork wsadŸ Lestera i Bal trombala tam gdzie maj¹ byæ, bêd¹ ju¿ gotowi do zadania z jaszczurami

	Wld_InsertNpc (PC_Psionic,"wp");
	Wld_InsertNpc (Gur_1203_BaalTondral,"wp");

	**********************/

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_Trial_11_01"); //¯yjesz. Beliar Ci sprzyja³. Dowiod³eœ, ¿eœ wart bym uczyni³ Ciê swym narzêdziem.
	AI_Output (other, self, "DIA_Necro_Trial_15_02"); //To dla mnie zaszczyt, mistrzu.
	AI_Output (self, other, "DIA_Necro_Trial_11_04"); //Czas rozpocz¹æ naukê i lepiej, ¿ebyœ mnie nie zawiód³!

	Log_SetTopicStatus	(CH4_Nec_Trial, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_Trial, "Sta³o siê, zosta³em uczniem nekromanty. Ten arogancki idiota da³ siê nabraæ, zobaczymy na jak d³ugo.");
	B_LogEntry(CH4_Nec_BM, "Próbê Mroku mam ju¿ za sob¹, czas dowiedzieæ siê czegoœ wiêcej o almanachu.");

	Log_CreateTopic	(CH4_Nec_Master, LOG_MISSION);
	Log_SetTopicStatus	(CH4_Nec_Master, LOG_RUNNING);
	B_LogEntry(CH4_Nec_Master, "Zosta³em uczniem nekromanty! Muszê to dobrze wykorzystaæ. Powinienem poznaæ mo¿liwie du¿o tajników nekromancji, kto wie czy nie przydadz¹ mi siê kiedyœ w s³usznej sprawie?");
};

// **************************************************

/****************
	Ork dorób tu krêgi magi, etc. ja potem dodam teksty
	***************/

INSTANCE DIA_Necro_Learn (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc; //Ork: Poprawiam na NECROLOC.ZEN
	nr				= 4;
	condition		= DIA_Necro_Learn_Condition;
	information		= DIA_Necro_Learn_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcê zg³êbiæ tajemn¹ wiedzê."; 
};

FUNC INT DIA_Necro_Learn_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Learn_Info()
{
	AI_Output (other, self, "DIA_Necro_Learn_15_01"); //Chcê zg³êbiæ tajemn¹ wiedzê.
	AI_Output (self, other, "DIA_Necro_Learn_11_02"); //Uka¿ê Ci potêgê Beliara!
};
// **************************************************


/****************
	Ork dorób tu t¹ truzicnê ja nie mam pojêcia jak to dzia³a
	***************/

INSTANCE DIA_Necro_Poison (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc; //Ork: Poprawiam z necro w CAVE.ZEN => NECROLOC.ZEN
	nr				= 5;
	condition		= DIA_Necro_Poison_Condition;
	information		= DIA_Necro_Poison_Info;
	permanent		= 0;
	important		= 0;
	description		= "Naucz mnie przyrz¹dzaæ trucizny."; 
};

FUNC INT DIA_Necro_Poison_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Poison_Info()
{
	AI_Output (other, self, "DIA_Necro_Poison_15_01"); //Naucz mnie przyrz¹dzaæ trucizny.
	AI_Output (self, other, "DIA_Necro_Poison_11_02"); //To nic trudnego, wymaga tylko trochê czasu i sporej iloœci królików doœwiadczalnych...

	B_LogEntry(CH4_Nec_Master, "Mój mistrz nauczy mnie przyrz¹dzania trucizn.");
};

// **************************************************

INSTANCE DIA_Necro_Swd (C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 6;
	condition		= DIA_Necro_Swd_Condition;
	information		= DIA_Necro_Swd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Opowiedz mi o Ostrzu Boskiej Trójcy."; 
};

FUNC INT DIA_Necro_Swd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Trial))
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Swd_Info()
{
	AI_Output (other, self, "DIA_Necro_Swd_15_01"); //Opowiedz mi o Ostrzu Boskiej Trójcy.
	AI_Output (self, other, "DIA_Necro_Swd_11_02"); //Sk¹d o nim wiesz?! Przecie¿ jesteœ tylko zwyk³ym œmieciem!

	Info_ClearChoices (DIA_Necro_Swd);
   
	if (NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
      Info_AddChoice (DIA_Necro_Swd, "Mam ten miecz przy sobie.", DIA_Necro_Swd_Show);
	};
	Info_AddChoice (DIA_Necro_Swd, "Nale¿y do s³ugusów Innosa.", DIA_Necro_Swd_Tell);
};

// ---------------------------Swd----------------------------------------

FUNC VOID DIA_Necro_Swd_Show()
{
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_01"); //Mam ten miecz przy sobie.
	AI_Output (self, other, "DIA_Necro_Swd_Show_11_02"); //To niemo¿liwe - poka¿ orê¿!
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_03"); //Oto on.
	
   AI_EquipBestMeleeWeapon	(other);
	AI_ReadyMeleeWeapon		(other);
	AI_PlayAni				(other, "T_1HSINSPECT");
	AI_UnequipWeapons		(other);
	
   AI_Output (self, other, "DIA_Necro_Swd_Show_11_04"); //Natychmiast oddaj mi ten miecz!
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_05"); //Proszê, mistrzu.
	
   B_GiveInvItems(other, self, ItMw_2H_RuneSWD_01, 1);
	
   AI_Output (self, other, "DIA_Necro_Swd_Show_11_06"); //G³upcze, teraz ju¿ do niczego nie jesteœ mi potrzebny!
	AI_Output (self, other, "DIA_Necro_Swd_Show_11_07"); //Unurzam œwiat w krwi œmiertelników ku chwale mego Pana, a zacznê od Ciebie.
	AI_Output (other, self, "DIA_Necro_Swd_Show_15_08"); //Nie!
	
   B_StopProcessInfos	(self);
	Rick_death = true;
};

// ---------------------------Tell----------------------------------------

FUNC VOID DIA_Necro_Swd_Tell()
{
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_01"); //Nale¿y do s³ugusów Innosa z Obozu Rebeliantów.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_02"); //Muszê go mieæ!
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_03"); //Rozkazuj, mistrzu. ¯yjê by Ci s³u¿yæ.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_04"); //Tak, bêdziesz doskona³ym narzêdziem. Przynieœ mi ten miecz, tylko ja wiem jak tchn¹æ w martw¹ stal potêgê bogów.
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_05"); //Muszê rozejrzeæ siê w bibliotece za tym cholernym almanachem...
	AI_Output (self, other, "DIA_Necro_Swd_Tell_11_06"); //Na co czekasz! IdŸ wype³niæ wolê swego Pana.
	AI_Output (other, self, "DIA_Necro_Swd_Tell_15_07"); //Jak rozka¿esz, mistrzu.
	
   B_LogEntry(CH4_GRD_RuneSwd, "Nekromanta wspomnia³ coœ o almanachu w jego bibliotece. Powinienem siê tam rozejrzeæ.");
	B_LogEntry(CH4_Nec_BM, "Ten Nekromanta to skoñczony dureñ! Jak na razie dobrze odegra³em swoj¹ rolê. Mam mu przynieœæ miecz runiczny - to sobie trochê poczeka. Ten stary cap wspomnia³ coœ o almanachu w swojej bibliotece - chyba powinienem zwiedziæ te cuchn¹ce katakumby.");
	B_LogEntry(CH4_Nec_Master, "Mam dostarczyæ nekromancie miecz runiczny.");	
	B_StopProcessInfos	(self);
	/************
		Ork s³uchaj trzebaby mu tu daæ rytynê w stylu tej xardasa. Ork trzeba zrobiæ tak, ¿e jak nekro jest w bibliotece to dick nie ma szans coœ z niej zwin¹æ.
		Daj mu rutynê losow¹ mo¿e, ¿eby graczom trochê ¿ycie utrudniæ, i niech co kilka h na 1h stamt¹d wychodzi - tylko wtedy bêdzie mo¿na zwin¹æ almanach		
		************/
   Wld_InsertItem(almanach_res, "LIBRARY_ALMANACH");
	
	Npc_ExchangeRoutine (self, "read");
};

// **************************************************

/*******************
Opcja dla idiotów xD
********************/

INSTANCE DIA_Necro_GiveSwd(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 9;
	condition		= DIA_Necro_GiveSwd_Condition;
	information		= DIA_Necro_Swd_Show;
	permanent		= 0;
	important		= 0;
	description		= "Mam ten miecz przy sobie."; 
};

FUNC INT DIA_Necro_GiveSwd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(NPC_HasItems(other, ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

// **************************************************

INSTANCE DIA_Necro_Dead(C_INFO)
{
	npc				= DMB_1701_NecroInNecroloc;
	nr				= 7;
	condition		= DIA_Necro_Dead_Condition;
	information		= DIA_Necro_Dead_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Necro_Dead_Condition()
{
	/**************

	Ork trzeba zrobiæ tak, ¿e jak nekro jest w bibliotece to dick nie ma szans coœ z niej zwin¹æ.
	Daj mu rutynê losow¹ mo¿e, ¿eby graczom trochê ¿ycie utrudniæ, i niech co kilka h na 1h stamt¹d wychodzi - tylko wtedy bêdzie mo¿na zwin¹æ almanach

	Opis aragorna

Idziemy do biblioteki. Gdy zbli¿amy siê do wejœcia aktywuje siê kamerka ukazuj¹ca nekromantê przeszukuj¹cego pierwszy rega³. Necro ³azi miêdzy rega³ami, a naszym zadaniem jest znaleŸæ i zabraæ ksiêgê tak ¿eby nas nie zauwa¿y³.

	****************/

	if (Npc_KnowsInfo (hero, DIA_Necro_Swd))&&(Npc_GetDistToWP (self, "LIBRARY_ALMANACH") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Dead_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Necro_Dead_11_01"); //Czego tu szukasz przyb³êdo?!
	AI_Output (other, self, "DIA_Necro_Dead_15_02"); //Ekhm... Zgubi³em siê, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Dead_11_03"); //Czy¿by? A mi siê wydaje, ¿e chcia³eœ po³o¿yæ swoje brudne ³apska na którymœ z moich woluminów.
	AI_Output (self, other, "DIA_Necro_Dead_11_04"); //Giñ ¿a³osna kreaturo!
	AI_Output (other, self, "DIA_Necro_Dead_15_05"); //Nie!
	B_StopProcessInfos	(self);
	AI_PlayAni		(other,	"T_PSI_VICTIM");
	Npc_ChangeAttribute	(other, ATR_HITPOINTS, -other.attribute[ATR_HITPOINTS_MAX]);

};
// **************************************************

INSTANCE DIA_Necro_Thief (C_INFO)
{
	npc				= DMB_1703_NecroInWorld;
	nr				= 8;
	condition		= DIA_Necro_Thief_Condition;
	information		= DIA_Necro_Thief_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Necro_Thief_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lester_FightEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Necro_Thief_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);

	AI_Output (self, other, "DIA_Necro_Thief_11_01"); //Zabi³eœ Bestiê! To ja j¹ przywo³a³em, by³ moim chowañcem!
	AI_Output (other, self, "DIA_Necro_Thief_15_02"); //Nie wiedzia³em, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_11_03"); //Œmieræ Bestii prawie rozerwa³a mi duszê, ty pieprzony hipokryto! Do tego ukrad³eœ almanach!
	AI_Output (self, other, "DIA_Necro_Thief_11_04"); //Beliar wybra³ na swego pomazañca prawdziwego skurwiela. Ale to nie znaczy, ¿e nie os¹dzê Ciê tu i teraz!
	Info_ClearChoices (DIA_Necro_Thief);
	Info_AddChoice (DIA_Necro_Thief, "Wszystko co zrobi³em, uczyni³em ku chwale Beliara!", DIA_Necro_Thief_Beliar);
	Info_AddChoice (DIA_Necro_Thief, "Za malutki jesteœ, ¿eby stan¹æ mi na drodze.", DIA_Necro_Thief_Chelenge);
   
   Necro_teleport_after_deaths_beast = true;
};

// ---------------------------chg----------------------------------------

FUNC VOID DIA_Necro_Thief_Chelenge()
{
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_01"); //Za malutki jesteœ, ¿eby stan¹æ mi na drodze.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_02"); //Œmiesz rzucaæ mi wyzwanie?!
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_03"); //To nie ja wyzywam Ciebie, ale Ty wyzywasz samego Beliara, porywaj¹c siê na mnie.
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_04"); //Twój Pan wybra³ mnie do realizacji swego dzie³a.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_05"); //Obaj jesteœmy tylko narzêdziami, g³upcze!
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_06"); //Ale to nie Tobie oceniaæ, który z nas jest mniej przydatny. Oœmielisz siê podwa¿yæ wolê Beliara?
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_07"); //Nie jestem samobójc¹. Zapamiêtam jednak to, co tu us³ysza³em i kiedy nadejdzie Czas Zap³aty, gorzko tego po¿a³ujesz.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_08"); //Twoja dusza bêdzie siê wiæ w mackach mojej mocy...
	AI_Output (other, self, "DIA_Necro_Thief_Chelenge_15_09"); //Wybacz, ale spieszê siê... Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_Chelenge_11_10"); //Tym razem pozwolê Ci odejœæ. Ale bêdê Ciê bacznie obserwowa³, mo¿esz byæ tego pewien. Ja nigdy nie zapominam potwarzy!

   Info_ClearChoices (DIA_Necro_Thief);
   
	Log_SetTopicStatus	(CH4_Nec_BM, LOG_SUCCESS);
   Log_SetTopicStatus	(CH4_Nec_Master, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_BM, "Postawi³em siê nekromancie. Uwierzy³ w bajeczkê o Pomazañcu Beliara. Na razie mam z nim spokój, ale jestem pewien, ¿e jeszcze siê spotkamy.");
	B_LogEntry(CH4_Nec_Master, "Mój mistrz uwa¿a, ¿e jestem Wybrañcem Beliara. Na razie nie bêdê go wyprowadza³ z b³êdu.");
   
   Npc_ExchangeRoutine(self, "HIDE");
};

// ---------------------------Blr----------------------------------------

FUNC VOID DIA_Necro_Thief_Beliar()
{
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_01"); //Wszystko co zrobi³em, uczyni³em ku chwale Beliara!
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_02"); //Nie w¹tpiê, to najlepsze wyt³umaczenie.
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_03"); //Ale¿ mistrzu, nikt nie zdo³a³by pokonaæ Bestii, gdyby wola Beliara by³a inna!
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_04"); //Hmm... Pierwszy raz w Twych s³owach dostrzegam przeb³yski m¹droœci...
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_05"); //Obaj jesteœmy tylko narzêdziami. To nasz Pan decyduje o tym, jak wype³nimy nasze przeznaczenie.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_06"); //Dobrze wiêc. Tym razem wybaczê Ci Twoje uczynki.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_07"); //Ale b¹dŸ pewien, ¿e gdy nadejdzie Czas Zap³aty, bêdziesz musia³ dowieœæ swojej wartoœci, albo zginiesz!
	AI_Output (other, self, "DIA_Necro_Thief_Beliar_15_08"); //Wszystko w rêkach Beliara, Mistrzu.
	AI_Output (self, other, "DIA_Necro_Thief_Beliar_11_09"); //OdejdŸ wiêc i ciesz siê namiastk¹ ¿ycia, która jeszcze Ci pozosta³a.

   Info_ClearChoices (DIA_Necro_Thief);
   
	Log_SetTopicStatus	(CH4_Nec_BM, LOG_SUCCESS);
   Log_SetTopicStatus	(CH4_Nec_Master, LOG_SUCCESS);
	B_LogEntry(CH4_Nec_BM, "Przekona³em nekromantê. Uwierzy³ w bajeczkê o Pomazañcu Beliara. Na razie mam z nim spokój, ale jestem pewien, ¿e jeszcze siê spotkamy.");
	B_LogEntry			(CH4_Nec_Master, "Mój mistrz uwa¿a, ¿e jestem Wybrañcem Beliara. Na razie nie bêdê go wyprowadza³ z b³êdu.");
   
   Npc_ExchangeRoutine(self, "HIDE");
};

// *************************************************

instance  Info_Nekroman_Ritual (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	12;
	condition	=	Info_Nekroman_Ritual_Condition;
	information	=	Info_Nekroman_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mistrzu, mam do Ciebie proœbê."; 
};                       

FUNC int  Info_Nekroman_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Ritual))&&(!xardas_agree)&&(Npc_KnowsInfo(hero, DIA_Necro_Thief ))
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_Ritual_Info()
{
	AI_Output(other, self, "Info_Nekroman_Ritual_15_00"); //Mistrzu, mam do Ciebie proœbê.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_01"); //B³agaj na kolanach, psie!
	AI_PlayAni		(other,	"T_PSI_VICTIM");
	AI_Output(self, other,"Info_Nekroman_Ritual_14_02"); //Tak znacznie lepiej. Czego chcesz?
	AI_Output(other, self, "Info_Nekroman_Ritual_15_03"); //Potrzebujê Mistrzu Twej m¹droœci i wiedzy.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_04"); //Do czego?
	AI_Output(other, self, "Info_Nekroman_Ritual_15_05"); //Aby odprawiæ rytua³... Chcê przywróciæ mieczowi runicznemu dawn¹ moc.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_06"); //Jak œmiesz mnie o to prosiæ?! Ten miecz do mnie nale¿eæ powinien!
	//AI_DrawWeapon (self);
	AI_Output(other, self, "Info_Nekroman_Ritual_15_07"); //Ale¿ Panie nie dla siebie pragnê tego ostrza. Wype³niam tylko wielki plan Beliara. 
	AI_Output(other, self, "Info_Nekroman_Ritual_15_08"); //To on rozkaza³ mi zabiæ Bestiê, odnaleŸæ kryszta³y, omamiæ magów, namówiæ ich do pomocy i na³adowaæ miecz.
	AI_Output(self, other,"Info_Nekroman_Ritual_14_09"); //Zbyt lekce sobie szafujesz imieniem naszego Pana. Dobrze, pomogê Ci w rytuale, ale pod jednym warunkiem.
	AI_Output(other, self, "Info_Nekroman_Ritual_15_10"); //Tak?
	//AI_RemoveWeapon (self);
	AI_Output(self, other,"Info_Nekroman_Ritual_14_11"); //Dusze pozosta³ych magów bior¹cych udzia³ w ceremoniale bêd¹ nale¿eæ do mnie! Wypijê krew z ich stygn¹cych cia³ i nasikam im do garde³!

	Info_ClearChoices (Info_Nekroman_Ritual);
	Info_AddChoice (Info_Nekroman_Ritual, "To za wysoka cena.", Info_Nekroman_Ritual_No);
	Info_AddChoice (Info_Nekroman_Ritual, "Ich œmieræ zwieñczy nasze dzie³o!", Info_Nekroman_Ritual_Yes);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Nekroman_Ritual_No()
{
	AI_Output(other, self, "Info_Nekroman_Ritual_No_15_00"); //To za wysoka cena.
	AI_Output(self, other,"Info_Nekroman_Ritual_No_14_01"); //Wiêc po co zawracasz mi g³owê, skoro zale¿y Ci na ¿yciu tych miernot? Jesteœ za miêtki.
	AI_Output(self, other,"Info_Nekroman_Ritual_No_14_02"); //Jak Beliar móg³ wybraæ kogoœ takiego jak Ty! ZejdŸ mi z oczu.
	B_LogEntry(CH4_RBL_Rirual, "Nie zgodzi³em siê na œmieræ magów uczestnicz¹cych w rytuale. Nekromanta mi nie pomo¿e.");
	B_StopProcessInfos(self);
};


// ---------------------------Yes----------------------------------------

FUNC VOID Info_Nekroman_Ritual_Yes()
{
	necromant_agree = TRUE;
	AI_Output(other, self, "Info_Nekroman_Ritual_Yes_15_00"); //Ich œmieræ zwieñczy nasze dzie³o!
	AI_Output(self, other,"Info_Nekroman_Ritual_Yes_14_01"); //Beliar ucieszy siê z mojego daru.
	AI_Output(self, other,"Info_Nekroman_Ritual_Yes_14_02"); //OdejdŸ mój uczniu, wróæ kiedy wszystko do przeprowadzenia rytua³u bêdzie ju¿ gotowe.

	B_LogEntry(CH4_RBL_Rirual, "Nekromanta zgodzi³ siê uczestniczyæ w rytuale. Jednak w zamian za¿¹da³ krwi pozosta³ych magów.");
	B_StopProcessInfos(self);
};


// *************************************************

instance  Info_Nekroman_RitualBegin (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	13;
	condition	=	Info_Nekroman_RitualBegin_Condition;
	information	=	Info_Nekroman_RitualBegin_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Czas odprawiæ rytua³."; 
};                       

FUNC int  Info_Nekroman_RitualBegin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(necromant_agree == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_RitualBegin_Info()
{
	AI_Output(other, self, "Info_Nekroman_RitualBegin_15_00"); //Nadszed³ czas, aby odprawiæ rytua³.
	AI_Output(self, other,"Info_Nekroman_RitualBegin_14_01"); //Gdzie?
	AI_Output(other, self, "Info_Nekroman_RitualBegin_15_02"); //Tam gdzie wznosi siê kamienny kr¹g na bagnach.
	AI_Output(self, other,"Info_Nekroman_RitualBegin_14_03"); //Niech bêdzie. A póŸniej skosztujê krwi tych durniów!
	B_LogEntry(CH4_RBL_Rirual, "Nekromanta przybêdzie do kamiennego krêgu.");
	//Npc_ExchangeRoutine	(self, "RITUAL");
	B_StopProcessInfos	(self);
   
   Necro_teleport_on_ritual = true;
};

// *************************************************

instance  Info_Nekroman_RitualEnd (C_INFO)
{
	npc			=	DMB_1703_NecroInWorld;
	nr			=	14;
	condition	=	Info_Nekroman_RitualEnd_Condition;
	information	=	Info_Nekroman_RitualEnd_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int  Info_Nekroman_RitualEnd_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_RitualEnd))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_RitualEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_01"); //Czujê Zew Krwi. Za chwilê...
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_02"); //Wstrzymaj swój gniew Mistrzu! Ukaza³ mi siê sam Beliar!
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_03"); //Hê? Teraz?
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_04"); //Tak i nakaza³, ¿e ci magowie musz¹ ¿yæ!
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_05"); //To jakaœ bzdura!
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_06"); //W¹tpisz w moje s³owa i wolê naszego Pana?
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_07"); //Niech to wszystko szlag trafi! Znowu nikogo nie zabijê!
	AI_Output (other, self, "Info_Nekroman_RitualEnd_15_08"); //Beliar chce jeszcze kiedyœ wykorzystaæ tych magów wiêc musz¹ ¿yæ.
	AI_Output (self, other,"Info_Nekroman_RitualEnd_14_09"); //Krew mnie zalewa... Nic tu po mnie!
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self, "HIDE");

	/****************

Ork nekro ma siê teleportowaæ do domciu
****************/
};

// *************************************************

instance  Info_Nekroman_Poison (C_INFO)
{
	npc			=	DMB_1701_NecroInNecroloc;
	nr			=	15;
	condition	=	Info_Nekroman_Poison_Condition;
	information	=	Info_Nekroman_Poison_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Przyby³em, by wype³niæ wolê Beliara."; 
};                       

FUNC int  Info_Nekroman_Poison_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))
	{
		return 1;
	};
};

FUNC VOID  Info_Nekroman_Poison_Info()
{
	AI_Output (other, self, "Info_Nekroman_Poison_15_01"); //Przyby³em, by wype³niæ wolê Beliara.
	AI_Output (self, other,"Info_Nekroman_Poison_14_02"); //Jak¹ wolê?
	AI_Output (other, self, "Info_Nekroman_Poison_15_03"); //Nasz Pan wyznaczy³ mi zadanie niezwyk³ej wagi. Muszê otruæ pewnego wyznawcê Innosa.
	AI_Output (other, self, "Info_Nekroman_Poison_15_04"); //Przyby³em do Ciebie Mistrzu, po truciznê. 
	AI_Output (self, other,"Info_Nekroman_Poison_14_05"); //M¹drze post¹pi³eœ. WeŸ trupi jad, zabija d³ugo i boleœnie...
	AI_Output (other, self, "Info_Nekroman_Poison_15_06"); //To musi wygl¹daæ na zawa³ serca. Trucizna powinna zadzia³aæ b³yskawicznie.
	AI_Output (self, other,"Info_Nekroman_Poison_14_07"); //Hmm. WeŸ wiêc czarn¹ wdowê. Dzia³a szybko i bezboleœnie. Natychmiast parali¿uje uk³ad nerwowy, a serce piêknie eksploduje.
	CreateInvItems (self,ItFo_Potion_Poison,1);
	B_GiveInvItems (self, other, ItFo_Potion_Poison, 1);
	AI_Output (other, self, "Info_Nekroman_Poison_15_08"); //Ta bêdzie doskona³a, Mistrzu.
	AI_Output (self, other,"Info_Nekroman_Poison_14_09"); //Wype³nij wiêc wolê Beliara. A wkrótce i ja bêdê mia³ dla Ciebie coœ ciekawego...
	B_LogEntry(CH6_RBL_Diego, "Zdoby³em truciznê dla Balama.");
};
