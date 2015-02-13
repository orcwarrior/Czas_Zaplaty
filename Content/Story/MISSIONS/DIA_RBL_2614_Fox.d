// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fox_Hello (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 1;
	condition		= DIA_Fox_Hello_Condition;
	information		= DIA_Fox_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz jak ktoœ, kto potrzebuje pomocy."; 
};

FUNC INT DIA_Fox_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Fox_Hello_Info()
{
	AI_Output (other, self, "DIA_Fox_Hello_15_01"); //Wygl¹dasz jak ktoœ, kto potrzebuje pomocy.
	AI_Output (self, other, "DIA_Fox_Hello_11_02"); //A Ty wygl¹dasz jak ktoœ, kto szuka guza. Spadaj.
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Fox_Trade(C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 1;
	condition		= DIA_Fox_Trade_Condition;
	information		= DIA_Fox_Trade_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zajmujesz siê handlem?"; 
};

FUNC INT DIA_Fox_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Fox_Trade_Info()
{
	AI_Output (other, self, "DIA_Fox_Trade_15_01"); //Zajmujesz siê handlem?
	AI_Output (self, other, "DIA_Fox_Trade_11_02"); //Tak, handlujê broni¹ byœcie siê mogli wzajemnie ok³adaæ.
	
	Log_CreateTopic(GE_TraderOR,	LOG_NOTE);
	B_LogEntry(GE_TraderOR,	"Fox sprzedaje broñ w obozie.");
};

// **************************************************

INSTANCE DIA_Fox_Again (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 2;
	condition		= DIA_Fox_Again_Condition;
	information		= DIA_Fox_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia³em z Cavalornem."; 
};

FUNC INT DIA_Fox_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Again_Info()
{
	AI_Output (other, self, "DIA_Fox_Again_15_01"); //Rozmawia³em z Cavalornem.
	AI_Output (self, other, "DIA_Fox_Again_11_02"); //Tak? To œwietnie. A co mnie to obchodzi?
	AI_Output (other, self, "DIA_Fox_Again_15_03"); //Zasugerowa³, ¿ebym porozmawia³ z kim siê da. Mam udowodniæ swoj¹ przydatnoœæ...
	AI_Output (self, other, "DIA_Fox_Again_11_04"); //Rozumiem. Nastêpny uciekinier z innych obozów. Po prostu œwietnie, robi siê tu prawdziwe schronisko dla psów!
	AI_Output (other, self, "DIA_Fox_Again_15_05"); //Masz z tym jakiœ problem?
	AI_Output (self, other, "DIA_Fox_Again_11_06"); //Pewnie, ¿e mam. Kolejna morda do wy¿ywienia!
	AI_Output (other, self, "DIA_Fox_Again_15_07"); //Mo¿e zaraz pozbêdê siê jednej wyszczekanej gêby.
	AI_Output (self, other, "DIA_Fox_Again_11_08"); //Chcia³byœ idioto! Lepiej ze mn¹ nie zadzieraj! Problem w tym, ¿e im wiêcej nowych tym mniej porz¹dnego ¿arcia dla mnie. A przede wszystkim mniej moich ukochanych konfiturek...
	AI_Output (other, self, "DIA_Fox_Again_15_09"); //Dobrze siê czujesz?
	AI_Output (self, other, "DIA_Fox_Again_11_10"); //Nie do cholery! Czujê siê fatalnie. Ju¿ pó³ dnia bez konfitur...
	AI_Output (self, other, "DIA_Fox_Again_11_11"); //Zaraz. Chwila. Co Cavalorn powiedzia³?
	AI_Output (other, self, "DIA_Fox_Again_15_12"); //Chce, ¿ebym udowodni³ swoj¹ przydatnoœæ...
	AI_Output (other, self, "DIA_Fox_Again_15_13"); //Dobra, nie rób ju¿ takiej miny, wiem co chcesz powiedzieæ. Poszukam tych konfitur.
	AI_Output (self, other, "DIA_Fox_Again_11_15"); //A jednak jest nadzieja na tym œwiecie! S³uchaj!
	AI_Output (self, other, "DIA_Fox_Again_11_16"); //Konfitury sprzedaje Drax. Nie wiem sk¹d ten troglodyta je bierze, ale s¹ przepyszne.
	AI_Output (self, other, "DIA_Fox_Again_11_17"); //WeŸ tê rudê i przynieœ mi co najmniej 10 weków konfitur.
	
   CreateInvItems (self,ItMiNugget,200);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 200);
	
   AI_Output (self, other, "DIA_Fox_Again_11_18"); //Aha. I nie daj siê oszukaæ. Drax to szczwany lis i na ka¿dym chce zarobiæ.
	AI_Output (self, other, "DIA_Fox_Again_11_19"); //Pospiesz siê!
	AI_Output (other, self, "DIA_Fox_Again_15_20"); //Grzmia³o?
	AI_Output (self, other, "DIA_Fox_Again_11_21"); //Nie idioto, to mój brzuch!
	
	Log_CreateTopic	(CH1_Rbl_Food, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Food, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Food, "Ci rebelianci to dziwna zbieranina. Jedni chc¹ ludzkich g³ów inni weków z konfiturami. Muszê kupiæ dla Foxa od Draxa co najmniej 10 s³oików z konfiturami. Fox przestrzeg³ mnie te¿ przed Draxem, który podobno nie jest zbyt uczciwym sprzedawc¹.");
};

INSTANCE DIA_Fox_Final (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 3;
	condition		= DIA_Fox_Final_Condition;
	information		= DIA_Fox_Final_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam konfitury."; 
};

FUNC INT DIA_Fox_Final_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_Drax_Sweets))||(Npc_KnowsInfo (hero, Info_Drax_Talk)))&&(NPC_HasItems(other,konfitury)>=5)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Final_Info()
{
	fox_trust = TRUE;
	AI_Output (other, self, "DIA_Fox_Final_15_01"); //Mam konfitury.
	
   if (NPC_HasItems(other,konfitury)<=9)
	{
		B_GiveXP(100);
		rebel_camp_trust = rebel_camp_trust + 1; 
		AI_Output (self, other, "DIA_Fox_Final_11_02"); //Nie masz dziesiêciu s³oików?
		AI_Output (other, self, "DIA_Fox_Final_15_03"); //Drax mia³ ich tylko piêæ.
		AI_Output (self, other, "DIA_Fox_Final_11_04"); //Ostrzega³em Ciê, ¿e Drax to szczwany lis. Jednak lepsze to ni¿ nic. Daj konfitury.
		B_GiveInvItems (other, self, konfitury, 5);
		Npc_RemoveInvItems (self,konfitury,5);
		AI_Output (self, other, "DIA_Fox_Final_11_05"); //Co tak patrzysz? Poprê Ciê przed Cavalornem, ale nici z premii. 
		AI_Output (self, other, "DIA_Fox_Final_11_06"); //A teraz zejdŸ mi z oczu. Tatuœ nadchodzi konfiturki!
		Log_SetTopicStatus	(CH1_Rbl_Food, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Food, "Fox dosta³ 5 weków konfitur. Poprze mnie przed Cavalornem, ale ominê³a mnie premia.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby³em poparcie Foxa - przez ¿o³¹dek do serca.");
	}
	else
	{
		B_GiveXP(250);
		rebel_camp_trust = rebel_camp_trust + 1; 
		AI_Output (self, other, "DIA_Fox_Final_11_07"); //Cudownie! Dziesiêæ weków!
		AI_Output (self, other, "DIA_Fox_Final_11_08"); //Œwietna robota. A teraz daj mi te smako³yki...
		B_GiveInvItems (other, self, konfitury, 10);
		Npc_RemoveInvItems (self,konfitury,10);
		AI_Output (self, other, "DIA_Fox_Final_11_09"); //Nie da³eœ siê oszukaæ Draxowi. Zas³u¿y³eœ na premiê.
		AI_Output (self, other, "DIA_Fox_Final_11_10"); //WeŸ ten pierœcieñ, niech Ci dobrze s³u¿y.
		CreateInvItems (self,Schutzring_Geschosse1,1);
		B_GiveInvItems (self, other, Schutzring_Geschosse1, 1);
		AI_Output (self, other, "DIA_Fox_Final_11_11"); //Tatuœ nadchodzi konfiturki!
		Log_SetTopicStatus	(CH1_Rbl_Food, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Food, "Fox dosta³ 10 weków konfitur. Poprze mnie przed Cavalornem i do tego da³ mi ciekawy pierœcieñ.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby³em poparcie Foxa - przez ¿o³¹dek do serca.");
	};
};

INSTANCE DIA_Fox_Attack (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 11;
	condition		= DIA_Fox_Attack_Condition;
	information		= DIA_Fox_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Fox_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Attack_Info()
{
	AI_Output (self, other, "DIA_Fox_Attack_11_01"); //Czego tu jeszcze szukasz ³azêgo?
	AI_Output (self, other, "DIA_Fox_Attack_11_02"); //Chyba porz¹dnego lania!
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);	
};

// **************************************************

INSTANCE DIA_Fox_Camp (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 12;
	condition		= DIA_Fox_Camp_Condition;
	information		= DIA_Fox_Camp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia³, ¿e jesteœ kwatermistrzem."; 
};

FUNC INT DIA_Fox_Camp_Condition()
{
	if (Kapitel>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Camp_Info()
{
	AI_Output (other, self, "DIA_Fox_Camp_15_01"); //Cavalorn powiedzia³, ¿e jesteœ kwatermistrzem.
	AI_Output (self, other, "DIA_Fox_Camp_11_02"); //Ano jestem. Dbam o to, ¿eby nikomu z was nie zabrak³o ¿arcia ani onuc.
	AI_Output (other, self, "DIA_Fox_Camp_15_03"); //Cavalorn mówi³ coœ o jakimœ problemie...
	AI_Output (self, other, "DIA_Fox_Camp_11_04"); //Mam teraz pe³ne rêce roboty, a trzeba poroznosiæ ¿arcie.
	AI_Output (self, other, "DIA_Fox_Camp_11_05"); //Powinien siê tym zaj¹æ Snaf, w koñcu to on gotuje ten cholerny gulasz...
	AI_Output (other, self, "DIA_Fox_Camp_15_06"); //Gulasz?
	AI_Output (self, other, "DIA_Fox_Camp_11_07"); //Tak, potrawka z miêsa kretoszczurów i cholera wie czego jeszcze.
	AI_Output (self, other, "DIA_Fox_Camp_11_08"); //Mam zapas tego paskudztwa w kufrze, w magazynku. Ale nie dam rady roznieœæ potrawki.
	AI_Output (other, self, "DIA_Fox_Camp_15_09"); //Dobra, przestañ mêdrkowaæ bo Ci g³owa od tego spuchnie. Pomogê Ci z gulaszem.
	AI_Output (self, other, "DIA_Fox_Camp_11_10"); //Wiedzia³em, ¿e siê domyœlisz.
	AI_Output (self, other, "DIA_Fox_Camp_11_11"); //Przetrz¹œnij skrzyniê na zapleczu. Znajdziesz tam wystarczaj¹c¹ iloœæ porcji gulaszu.
	AI_Output (self, other, "DIA_Fox_Camp_11_12"); //Rozdaj potrawkê ch³opakom w obozie. Jak skoñczysz, wróæ do mnie.
	AI_Output (other, self, "DIA_Fox_Camp_15_13"); //O to siê nie bój. Przyda³by mi siê nowy pancerz.
	AI_Output (self, other, "DIA_Fox_Camp_11_14"); //Roznieœ gulasz, to pogadamy o pancerzu.
	AI_Output (other, self, "DIA_Fox_Camp_15_15"); //Umowa stoi.
	
   B_LogEntry		(CH2_Rbl_RebelCampLife, "Fox zatrudni³ mnie do roznoszenia gulaszu po obozie. Te¿ mi obowi¹zki...");
	Log_CreateTopic	(CH2_Rbl_Food, LOG_MISSION);
	B_LogSetTopicStatus	(CH2_Rbl_Food, LOG_RUNNING);
	B_LogEntry		(CH2_Rbl_Food, "Fox poprosi³ mnie o rozniesienie gulaszu po obozie. W zamian dostanê od niego jakiœ pancerz. No nic, trzeba siê bêdzie trochê nachodziæ..."); 
	fox_stew = 0;
	Mob_CreateItems ("OR_SUPLIES", ItFo_Stew, 32);
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Fox_Stew (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_Fox_Stew_Condition;
	information		= DIA_Fox_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozda³em gulasz."; 
};

FUNC INT DIA_Fox_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(fox_stew >= 25)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Stew_Info()
{
	AI_Output (other, self, "DIA_Fox_Stew_15_01"); //Rozda³em gulasz.
	
   if(fox_stew!=32)
	{
		AI_Output (self, other, "DIA_Fox_Stew_11_02"); //Rozdzieli³eœ wszystkie porcje?
		AI_Output (other, self, "DIA_Fox_Stew_15_03"); //Chyba tak.	Obawiam siê, ¿e skoñczy siê to epidemi¹ sraczki w obozie.
		AI_Output (self, other, "DIA_Fox_Stew_11_04"); //Najwa¿niejsze, ¿e siê tego pozby³eœ.
		B_GiveXP(500);
	}
	else
	{
		B_GiveXP(500);		
		AI_Output (self, other, "DIA_Fox_Stew_11_05"); //Cholera i nikt Ciê nie obi³? Œwietna robota!
	};
   
	AI_Output (other, self, "DIA_Fox_Stew_15_06"); //A co z pancerzem?
	AI_Output (self, other, "DIA_Fox_Stew_11_07"); //Jest Twój. Prawie nowy strój rebelianta. Poprzedni w³aœciciel niezbyt d³ugo siê nim cieszy³.
	AI_Output (other, self, "DIA_Fox_Stew_15_08"); //A co mu sie sta³o?
	AI_Output (self, other, "DIA_Fox_Stew_11_09"); //Ze¿ar³y go wilki.
	AI_Output (self, other, "DIA_Fox_Stew_11_10"); //Porozmawiaj z Aidanem. Zdaje siê, ¿e te¿ przyda³aby siê mu pomoc.

	CreateInvItem		(self,			RBL_ARMOR_L);
	B_GiveInvItems		(self, other,	RBL_ARMOR_L, 1);
	AI_EquipArmor				(other, RBL_ARMOR_L);

	B_LogSetTopicStatus	(CH2_Rbl_Food, LOG_SUCCESS);
	B_LogEntry		(CH2_Rbl_Food, "Za rozniesienie gulaszu dosta³em strój rebelianta. Nie wiem czy by³o warto..."); 
	B_LogEntry		(CH2_Rbl_RebelCampLife, "Pomog³em Foxowi w rozniesieniu gulaszu za co dosta³em lichy pancerz.");
	B_LogEntry		(CH2_Rbl_RebelCampLife, "Kwatermistrz powiedzia³, ¿ebym porozmawia³ z Aidanem. Podobno kowal potrzebuje pomocy.");
};

INSTANCE DIA_FOX_Spy (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_FOX_Spy_Condition;
	information		= DIA_FOX_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak to jest byæ kwatermistrzem rebeliantów?"; 
};

FUNC INT DIA_FOX_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FOX_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_FOX_Spy_15_01"); //Jak to jest byæ kwatermistrzem rebeliantów?
	AI_Output (self, other, "DIA_FOX_Spy_11_02"); //A jak to jest byæ piratem, hê?
	AI_Output (other, self, "DIA_FOX_Spy_15_03"); //Nigdy siê nad tym nie zastanawia³em...
	AI_Output (self, other, "DIA_FOX_Spy_11_04"); //Ani ja, wiêc daj sobie spokój z takimi pytaniami.
	AI_Output (other, self, "DIA_FOX_Spy_15_05"); //A jak tu trafi³eœ?
	AI_Output (self, other, "DIA_FOX_Spy_11_06"); //Powiedzmy, ¿e nie dano mi wyboru. Jasne?
	AI_Output (other, self, "DIA_FOX_Spy_15_07"); //Powiedzmy, ¿e tak.

	B_LogEntry		(CH2_Rbl_Spy, "Fox nie jest zbyt rozmowny. Nie zdradzi³ jak trafi³ do obozu, powiedzia³ tylko, ¿e nie mia³ wyboru. Ciekawe co mia³ na myœli?");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od ciebie chcia³.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FOX_Spy1 (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 13;
	condition		= DIA_FOX_Spy1_Condition;
	information		= DIA_FOX_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ilu was pozosta³o?"; 
};

FUNC INT DIA_FOX_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FOX_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_FOX_Spy1_15_01"); //Ilu was pozosta³o?
	AI_Output (self, other, "DIA_FOX_Spy1_11_02"); //Co masz na myœli?
	AI_Output (other, self, "DIA_FOX_Spy1_15_03"); //By³eœ kurierem Magów. Z tego co wiem, nie mia³eœ wyboru i musia³eœ przystaæ do Obozu Rebeliantów.
	AI_Output (self, other, "DIA_FOX_Spy1_11_04"); //Sporo wiesz jak na kogoœ, kto jest tu od niedawna.
	AI_Output (self, other, "DIA_FOX_Spy1_11_05"); //Rzeczywiœcie by³em kurierem magów. To by³a dobra posada.
	AI_Output (self, other, "DIA_FOX_Spy1_11_06"); //Jednak kiedy Gomez rozprawi³ siê z magami ognia, wszystko siê spapra³o.
	AI_Output (self, other, "DIA_FOX_Spy1_11_07"); //W Starym Obozie nie mia³em czego szukaæ, w Nowym te¿ za mn¹ nie przepadano, a o Sekcie wolê nie s³yszeæ.
	AI_Output (self, other, "DIA_FOX_Spy1_11_08"); //Wtedy znalaz³em obóz Cavalorna. Urz¹dzi³em siê tutaj jak mog³em.
	AI_Output (other, self, "DIA_FOX_Spy1_15_09"); //W interesie kwatermistrza jest, ¿eby obóz dobrze prosperowa³.
	AI_Output (self, other, "DIA_FOX_Spy1_11_10"); //Wiem co mam robiæ. Nie chcesz mi chyba zarzuciæ niegospodarnoœci?!
	AI_Output (other, self, "DIA_FOX_Spy1_15_11"); //Nie o tym mówiê. Wydaje mi siê, ¿e jest tu ktoœ, kto d¹¿y do czegoœ zupe³nie odmiennego.
	AI_Output (self, other, "DIA_FOX_Spy1_11_12"); //Hmm, parszywy wilk w stadzie? Je¿eli dobrze Ciê zrozumia³em to uwa¿asz, ¿e jest wœród nas zdrajca?
	AI_Output (other, self, "DIA_FOX_Spy1_15_13"); //Tak.
	AI_Output (self, other, "DIA_FOX_Spy1_11_14"); //Znam wszystkich z tego obozu, ale nikogo nie przy³apa³em na knuciu...
	AI_Output (self, other, "DIA_FOX_Spy1_11_15"); //Jedyne co mi zawsze nie pasowa³o to przybycie Twoje i Toniego.
	AI_Output (self, other, "DIA_FOX_Spy1_11_16"); //Co do Ciebie, to udowodni³eœ ju¿, ¿e warto Ci zaufaæ.
	AI_Output (self, other, "DIA_FOX_Spy1_11_17"); //Co do Toniego, to nie zmieni³em zdania.
	AI_Output (other, self, "DIA_FOX_Spy1_15_18"); //Co masz na myœli?
	AI_Output (self, other, "DIA_FOX_Spy1_11_19"); //Tony nadal œmierdzi Starym Obozem. To tylko przeczucie, ale mu nie ufam.
	AI_Output (other, self, "DIA_FOX_Spy1_15_20"); //Dziêki, to mi wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Fox nie przy³apa³ nikogo z obozu na zdradzie. Jednak nie ufa Toniemu, ale to tylko jego przeczucia. Wola³bym dowodów...");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RBL_2614_FOX_Stew (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 12;
	condition		= DIA_RBL_2614_FOX_Stew_Condition;
	information		= DIA_RBL_2614_FOX_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Porcja dla Ciebie."; 
};

FUNC INT DIA_RBL_2614_FOX_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2614_FOX_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_2614_FOX_Stew_15_01"); //Porcja dla Ciebie.
	AI_Output (self, other, "DIA_RBL_2614_FOX_Stew_11_02"); //Przestañ, przecie¿ tego nie da siê zjeœæ.
	AI_Output (other, self, "DIA_RBL_2614_FOX_Stew_15_03"); //Mia³em roznieœæ ka¿demu trochê gulaszu, bez wyj¹tków!
	AI_Output (self, other, "DIA_RBL_2614_FOX_Stew_11_04"); //No dobra, mo¿e tym razem jakoœ to prze³knê.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Fox mia³ nadziejê, ¿e gulasz da siê zjeœæ."); 
};

INSTANCE DIA_Fox_SpyKillEnd (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_SpyKillEnd_Condition;
	information		= DIA_Fox_SpyKillEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Fox_SpyKillEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Abel_SpyKillEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_SpyKillEnd_Info()
{
	AI_Output (self, other, "DIA_Abel_SpyKillEnd_07_11"); //Sprawa wygl¹da doœæ oczywiœcie. Niech bêdzie G³êbia.
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Fox_Eqquipment (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 14;
	condition		= DIA_Fox_Eqquipment_Condition;
	information		= DIA_Fox_Eqquipment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyszed³em po wyposa¿enie."; 
};

FUNC INT DIA_Fox_Eqquipment_Condition()
{
	if (other.guild == GIL_HUN)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_Eqquipment_Info()
{
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_01"); //Przyszed³em po wyposa¿enie.
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_02"); //Ale w Starej Kopalni by³a jatka! To dopiero by³a wyprawa, Gomeza pewnie krew zaleje, he, he.
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_03"); //Dla Ciebie znajdê jakiœ pancerz, ale nic za darmo...
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_04"); //Po wyprawie do Starej Kopalni ³atwo puszczaj¹ mi nerwy. Czasami tracê œwiadomoœæ, a po chwili wokó³ mnie walaj¹ siê por¹bane cia³a...
	AI_Output (self, other, "DIA_Fox_Eqquipment_11_05"); //Eee, wiesz co? Potraktuj ten pancerz jako podarunek. Prezent od starego, dobrego Foxa.

	CreateInvItem(self, HUN_ARMOR_L);
	B_GiveInvItems(self, other, HUN_ARMOR_L, 1);
	AI_EquipArmor(other, HUN_ARMOR_L);
	AI_Output (other, self, "DIA_Fox_Eqquipment_15_06"); //Bêdê o tym pamiêta³.

	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta³em od Foxa lepszy pancerz.");
};

//**************************************************

INSTANCE DIA_Fox_WeaponDev (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 15;
	condition		= DIA_Fox_WeaponDev_Condition;
	information		= DIA_Fox_WeaponDev_Info;
	permanent		= 0;
	important		= 0;
	description		= "Pomogê Ci z orê¿em."; 
};

FUNC INT DIA_Fox_WeaponDev_Condition()
{
	if (ratford_help == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_WeaponDev_Info()
{
	AI_Output (other, self, "DIA_Fox_WeaponDev_15_01"); //Pomogê Ci z orê¿em.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_02"); //Nie wiesz jak mnie to cieszy. Nogi mi ju¿ do dupy w³a¿¹ od biegania po obozie.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_03"); //Przez ten cholerny atak nagle ka¿dy przypomnia³ sobie, ¿e czegoœ potrzebuje.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_04"); //Jakby wczeœniej nie mo¿na by³o o tym pomyœleæ!
	AI_Output (other, self, "DIA_Fox_WeaponDev_15_05"); //Dobra, mów komu mam zanieœæ broñ i miejmy to ju¿ za sob¹.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_06"); //Zosta³o mi jeszcze kilku rebeliantów.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_07"); //Quentin, Drax, R¹czka i Cavalorn.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_08"); //Najwy¿sza pora, ¿eby wymienili to swoje przerdzewia³e ¿elastwo.
	AI_Output (self, other, "DIA_Fox_WeaponDev_11_09"); //Oto miecze, pospiesz siê bo czasu mamy coraz mniej.
	CreateInvItems (self,HUN_MW_03,4); 
	B_GiveInvItems (self, other, HUN_MW_03, 4);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Dosta³em od Foxa nowe miecza dla Quentina, Draxa, R¹czki i Cavalorna. Nie ma na co czekaæ, stra¿nicy mog¹ uderzyæ w ka¿dej chwili.");
	B_StopProcessInfos	(self);
};

//**************************************************

INSTANCE DIA_Fox_WeaponDevback (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_WeaponDevback_Condition;
	information		= DIA_Fox_WeaponDevback_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za³atwi³em sprawê z orê¿em."; 
};

FUNC INT DIA_Fox_WeaponDevback_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_NewWeapon))&&(Npc_KnowsInfo (hero, Info_Drax_NewSword))&&(Npc_KnowsInfo (hero, DIA_Fingers_NewSword))&&(cav_take == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fox_WeaponDevback_Info()
{
	others_help = others_help + 1;
	B_GiveXP(500);
   
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_01"); //Za³atwi³em sprawê z orê¿em.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_02"); //Cavalorn te¿ wzi¹³ miecz?
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_03"); //Wzi¹³ choæ z oporami.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_04"); //Ja nigdy bym go do tego nie namówi³. Œwietna robota.
	AI_Output (self, other, "DIA_Fox_WeaponDevback_11_05"); //Nie mogê daæ Ci nic w podziêce.
	AI_Output (other, self, "DIA_Fox_WeaponDevback_15_06"); //Dobra, czas ju¿ na mnie.
	
   Log_SetTopicStatus	(CH3_RBL_DelivWeapon, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Roznios³em wszystkie miecze. Fox jest mi wdziêczny i to w sumie wszystko. Psujê sobie reputacjê, robi¹c zadania za darmo...");
}; 

INSTANCE DIA_Fox_Armor (C_INFO)
{
	npc				= RBL_2614_FOX;
	nr				= 16;
	condition		= DIA_Fox_Armor_Condition;
	information		= DIA_Fox_Armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz mo¿e lepszy pancerz dla mnie?"; 
};

FUNC INT DIA_Fox_Armor_Condition()
{
	return C_IsChapter(4);
};

FUNC VOID DIA_Fox_Armor_Info()
{
	AI_Output (other, self, "DIA_Fox_Armor_15_01"); //Masz mo¿e lepszy pancerz dla mnie?
	AI_Output (self, other, "DIA_Fox_Armor_11_02"); //Tak...
	AI_Output (other, self, "DIA_Fox_Armor_15_03"); //To daj mi go.
	AI_Output (self, other, "DIA_Fox_Armor_11_04"); //Hola, hola. Nie tak szybko! Bêdziesz musia³ za niego zap³aciæ!
	AI_Output (other, self, "DIA_Fox_Armor_15_05"); //Mo¿e przyniosê ci kilka konfitur i za³atwimy t¹ sprawê?
   AI_Output (self, other, "DIA_Fox_Armor_11_06"); //KONFITURY!!! NIE, nie namówisz mnie! Nie mogê tak rozdawaæ pancerzy.
   AI_Output (self, other, "DIA_Fox_Armor_11_07"); //Musisz zap³aciæ. Ale warte s¹ swojej ceny. Obejrzyj je sobie.
	AI_Output (other, self, "DIA_Fox_Armor_15_08"); //Zobaczmy...
}; 

var int buy_HUN_ARMOR_M;
var int buy_HUN_ARMOR_H;
var int buy_HUN_ARMOR_H2;

instance RBL_2614_FOX_HUN_ARMOR_M (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_HUN_ARMOR_M_Condition;
	information		= RBL_2614_FOX_HUN_ARMOR_M_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_MiddleHunterArmor, VALUE_HUN_ARMOR_M);
};

FUNC int RBL_2614_FOX_HUN_ARMOR_M_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_M)
	{
      return 1;
	};
};

func void RBL_2614_FOX_HUN_ARMOR_M_Info()
{
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia³bym kupiæ zbrojê.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_M.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Proszê, mam nadziejê, ¿e bêdziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_M);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_M.value); 
		AI_EquipArmor(hero, HUN_ARMOR_M);
      buy_HUN_ARMOR_M = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj¹cej iloœci rudy, a ja nie mogê robiæ tak hojnych prezentów!
	};

	B_StopProcessInfos(self);
};

instance RBL_2614_FOX_HUN_ARMOR_H (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_HUN_ARMOR_H_Condition;
	information		= RBL_2614_FOX_HUN_ARMOR_H_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_HeavyHunterArmor, VALUE_HUN_ARMOR_H);
};

FUNC int RBL_2614_FOX_HUN_ARMOR_H_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_H)
	{
      return 1;
	};
};

func void RBL_2614_FOX_HUN_ARMOR_H_Info()
{      
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia³bym kupiæ zbrojê.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_H.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Proszê, mam nadziejê, ¿e bêdziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_H);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_H.value); 
		AI_EquipArmor(hero, HUN_ARMOR_H);
      buy_HUN_ARMOR_H = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj¹cej iloœci rudy, a ja nie mogê robiæ tak hojnych prezentów!
	};

	B_StopProcessInfos(self);
};

instance RBL_2614_FOX_Improved_HUN_ARMOR_H (C_INFO)
{
	npc				= RBL_2614_FOX;
   nr				   = 900;
	condition		= RBL_2614_FOX_Improved_HUN_ARMOR_H_Condition;
	information		= RBL_2614_FOX_Improved_HUN_ARMOR_H_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_ImprovedHeavyHunterArmor, VALUE_HUN_ARMOR_H2);
};

FUNC int RBL_2614_FOX_Improved_HUN_ARMOR_H_Condition()
{	
	if Npc_KnowsInfo(hero, DIA_Fox_Armor) && (!buy_HUN_ARMOR_H2)
	{
      return 1;
	};
};

func void RBL_2614_FOX_Improved_HUN_ARMOR_H_Info()
{   
   AI_Output(other, self,"RBL_2614_FOX_BuyArmorAtFox_15_01"); //Chcia³bym kupiæ zbrojê.
   
	if (Npc_HasItems(hero, itminugget)>= HUN_ARMOR_H2.value)
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFox_08_02"); //Proszê, mam nadziejê, ¿e bêdziesz z niej zadowolony!		
		CreateInvItem (hero, HUN_ARMOR_H2);	
		Npc_RemoveInvItems (hero, ItMiNugget, HUN_ARMOR_H2.value); 
		AI_EquipArmor(hero, HUN_ARMOR_H2);
      buy_HUN_ARMOR_H2 = true;
	}
	else
	{
		AI_Output(self, other,"RBL_2614_FOX_BuyArmorAtFoxRefused_07_03"); //Nie masz wystarczaj¹cej iloœci rudy, a ja nie mogê robiæ tak hojnych prezentów!
	};

	B_StopProcessInfos(self);
};
