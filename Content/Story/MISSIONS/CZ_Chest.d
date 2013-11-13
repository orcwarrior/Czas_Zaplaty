//**************************************************************
// Made by Shergar			       *
//**************************************************************

func void chestout()
{
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
	Snd_Play("LevelUp");
	MOBUSE = 0;
	//PRINTGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero,PERC_ASSESSENTERROOM,NULL,hero);
};

func void chest_s1()
{
	var C_Npc him;
	var C_Npc rocker;
	MOBUSE = CHEST_USED;
	him = Hlp_GetNpc(PC_Hero);
	rocker = Hlp_GetNpc(PC_Rockefeller);
	
   if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(him)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rocker)))
	{
		Npc_SetAivar(self,AIV_INVINCIBLE,  TRUE);
		B_ProcessInfos(him);
	};
};

instance NOchest1(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = nochest1_condition;
	information = nochest1_info;
	important = 0;
	permanent = 1;
	description = "Zabieraj brudne ³apska - skrzynia jest pusta!";
};


func int nochest1_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == FALSE)
	{
		return 1;
	};
};

func void nochest1_info()
{
	B_StopProcessInfos (self);
	MOBUSE = 0;
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
};

instance NOchest(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = nochest_condition;
	information = nochest_info;
	important = 0;
	permanent = 1;
	description = "Zostaw skrzyniê w spokoju.";
};

func int nochest_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

func void nochest_info()
{
	B_StopProcessInfos (self);
	MOBUSE = 0;
	Npc_SetAivar(self,AIV_INVINCIBLE,  FALSE);
};

instance Shadows_Write (C_Info)
{
	npc = PC_Hero;
	condition = Shadows_Write_condition;
	information = Shadows_Write_info;
	important = 0;
	permanent = 1;
	description = "Cienie.";
};

func int Shadows_Write_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)&&(chest_conf < 2)
	{
		return 1;
	};
};

func void Shadows_Write_info()
{
	AI_Output (other, self,"Shadows_Write_15_00"); //Po wnikliwym rozpoznaniu rozmieszczenia posterunków stra¿ników i ustaleniu czêstotliwoœci zmiany wart...
	AI_Output (other, self,"Shadows_Write_15_01"); //A pieprzyæ to gówno! Zróbcie to, co teraz napiszê...

	Info_ClearChoices (Shadows_Write);
	Info_AddChoice (Shadows_Write, "Zaatakujcie zewnêtrzne bramy.", Shadows_Write_Gate);
	Info_AddChoice (Shadows_Write, "Zajmijcie siê stra¿nikami w pierœcieniu.", Shadows_Write_Guards);
	Info_AddChoice (Shadows_Write, "Zaatakujcie bramê zamkow¹.", Shadows_Write_Castle);
	Info_AddChoice (Shadows_Write, "Róbcie, co chcecie.", Shadows_Write_Nothing);
};

// --------------------------------------------------------------
/*********************
Kurde jednak nie zrobiê tego sam bo nie wiem, którzy z cienii s¹ w obozie no i jak to zrobiæ najoptymalniej.
Chodzi o to, ¿eby wszystkie cienie w tej opcji podczas ataku [nie po wybraniu opcji, wiêc jakiœ trigger chyba bêdzie potrzebny albo wywo³anie funkcji inicjuj¹cej podczas dialogu przed atakiem]
ustawili siê w pobli¿u zewnêtrznych bram, czyli 2 oddzia³y z nich trzeba zrobiæ.
**********************/


/****************
Ta zmienna jak = 2 to znaczy, ¿e i Cienie i Kopacze ju¿ s¹ skonfigurowani
******************/

FUNC VOID Shadows_Write_Gate()
{
	chest_conf = chest_conf + 1;
	shadows_exterior_gates ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie zaatakuj¹ wewnêtrzne bramy.");
};


// --------------------------------------------------------------

FUNC VOID Shadows_Write_Guards()
{
	chest_conf = chest_conf + 1;
	shadows_ring_attack ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie zajm¹ siê stra¿nikami w pierœcieniu.");
};

// --------------------------------------------------------------

FUNC VOID Shadows_Write_Castle()
{
	chest_conf = chest_conf + 1;
	shadows_interior_gate ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Cienie uderz¹ na bramê zamkow¹.");
};

// --------------------------------------------------------------

FUNC VOID Shadows_Write_Nothing()
{
	chest_conf = chest_conf + 1;
	shadows_what_want ();
	Info_ClearChoices (Shadows_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Niech Cienie robi¹, co chc¹.");
};

instance Diggers_Write (C_Info)
{
	npc = PC_Hero;
	condition = Diggers_Write_condition;
	information = Diggers_Write_info;
	important = 0;
	permanent = 1;
	description = "Kopacze.";
};

func int Diggers_Write_condition()
{
	if (MOBUSE == CHEST_USED) && (CHEST_KNOW == TRUE)&&(chest_conf < 2)
	{
		return 1;
	};
};

func void Diggers_Write_info()
{
	AI_Output (other, self,"Diggers_Write_15_00"); //To wasza jedyna szansa na odzyskanie wolnoœci.
	AI_Output (other, self,"Diggers_Write_15_01"); //Zróbcie, co napiszê, a byæ mo¿e po¿yjecie wystarczaj¹co d³ugo, aby nacieszyæ siê zwyciêstwem.

	Info_ClearChoices (Diggers_Write);
	Info_AddChoice (Diggers_Write, "Zaatakujcie zewnêtrzne bramy.", Diggers_Write_Gate);
	Info_AddChoice (Diggers_Write, "Zajmijcie siê stra¿nikami w pierœcieniu.", Diggers_Write_Guards);
	Info_AddChoice (Diggers_Write, "Zaatakujcie bramê zamkow¹.", Diggers_Write_Castle);
	Info_AddChoice (Diggers_Write, "Róbcie, co chcecie.", Diggers_Write_Nothing);
};


// --------------------------------------------------------------

FUNC VOID Diggers_Write_Gate()
{
	chest_conf = chest_conf + 1;
	Diggers_exterior_gates ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze zaatakuj¹ zewnêtrzne bramy.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Guards()
{
	chest_conf = chest_conf + 1;
	Diggers_ring_attack ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze zajm¹ siê stra¿nikami w pierœcieniu.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Castle()
{
	chest_conf = chest_conf + 1;
	Diggers_interior_gate ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry(CH6_RBL_Coordinate, "Kopacze uderz¹ na bramê zamkow¹.");
};

// --------------------------------------------------------------

FUNC VOID Diggers_Write_Nothing()
{
	chest_conf = chest_conf + 1;
	Diggers_what_want ();
	Info_ClearChoices (Diggers_Write);
	B_LogEntry		(CH6_RBL_Coordinate, "Niech Kopacze robi¹ co chc¹.");
};

/*********************

Ogólnie mo¿na to zrobiæ tak, ¿eby by³ realny wp³yw na walkê. Dam kilku stra¿nikom dialogi z infem, gdzie ich bêdzie najwiêcej podczas ewentualnego ataku.
W NWN2 doœæ fajnie zrobili obronê twierdzy. Rzeczywiœcie wybór mia³ wp³yw na przebieg walki, fakt, ¿e nie drastyczny, ale fajnie by³o mieæ tak¹ œwiadomoœæ, ¿e jednak mo¿na kogoœ rozstawiaæ po k¹tach xD

Chyba, ¿e macie lepsze pomys³y co do miejsc ataku, etc. to siê pozmienia/

********************************/
