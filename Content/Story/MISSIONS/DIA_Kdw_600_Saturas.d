// ************************ EXIT **************************

instance Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Saturas_EXIT_Info()
{

	B_StopProcessInfos(self);
};

// ************************ Intruder **************************

instance Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int Info_Saturas_Intruder_Condition()
{
	return 1;
};

FUNC VOID Info_Saturas_Intruder_Info()
{
	AI_Output(self, other,"Info_Saturas_Intruder_14_00"); //Co Ty tu robisz? Nie masz tu czego szukaæ! Precz!

	B_StopProcessInfos(self);
};

// *************************************************

instance Info_Saturas_Ornament (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	2;
	condition	=	Info_Saturas_Ornament_Condition;
	information	=	Info_Saturas_Ornament_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Przysy³a mnie Lee."; 
};                       

FUNC int Info_Saturas_Ornament_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Agree))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Ornament_Info()
{
	AI_Output(other, self, "Info_Saturas_Ornament_15_00"); //Przysy³a mnie Lee.
	AI_Output(self, other,"Info_Saturas_Ornament_14_01"); //Kolejny najemnik. Za ka¿dym razem przysy³a kogoœ innego. Coœ marnie wam idzie...
	AI_Output(other, self, "Info_Saturas_Ornament_15_02"); //Zabija nas to, czego szukamy, magu.
	AI_TurnToNpc 	(self, other);
	Ai_Wait (self,1.0);
	AI_Output(self, other,"Info_Saturas_Ornament_14_03"); //Pos³uchaj mnie uwa¿nie! Lee da³ s³owo, ¿e pomo¿e nam w poszukiwaniach, chyba nie zamierzasz splugawiæ honoru swego przywódcy?
	AI_Output(other, self, "Info_Saturas_Ornament_15_04"); //Nikt za mn¹ nie stoi. 
	AI_Output(self, other,"Info_Saturas_Ornament_14_05"); //Wiêc co tutaj robisz?!
	AI_Output(other, self, "Info_Saturas_Ornament_15_06"); //Powiedzmy, ¿e Lee bardzo przekonuj¹co prosi³ o pomoc.
	AI_Output(self, other,"Info_Saturas_Ornament_14_07"); //Skoñczmy tê rozmowê. IdŸ do Nefariusa, przygotowa³ mapê z zaznaczon¹ lokalizacj¹ kolejnego ornamentu.
	AI_Output(self, other,"Info_Saturas_Ornament_14_08"); //Raporty z poszukiwañ sk³adaj Cronosowi. Je¿eli potrzebujesz jakiegoœ ekwipunku, to on tak¿e Ci w tym pomo¿e.
	AI_Output(self, other,"Info_Saturas_Ornament_14_09"); //A teraz zejdŸ mi z oczu, bo tracê przez ciebie cenny czas.
	AI_Output(other, self, "Info_Saturas_Ornament_15_10"); //Jeszcze jedno.
	AI_Output(self, other,"Info_Saturas_Ornament_14_11"); //Mów!
	AI_Output(other, self, "Info_Saturas_Ornament_15_12"); //Kawa³ z ciebie bezdusznego sukinsyna!
	AI_Output(self, other,"Info_Saturas_Ornament_14_13"); //To co robiê, robiê tylko i wy³¹cznie dla zachowania równowagi. Œmieræ kilku œmiertelników to znikoma cena za to, czemu mo¿e zdo³amy zapobiec w przysz³oœci.
	AI_Output(self, other,"Info_Saturas_Ornament_14_14"); //A teraz precz z moich oczu! Nastêpnym razem zamieniê Ciê w bry³ê lodu!
	B_LogEntry(CH3_NON_Ornament, "Rozmowa z Saturasem nie by³a zbyt przyjemna. Od Nefariusa otrzymam kolejn¹ mapê. Raport z poszukiwañ mam sk³adaæ Cronosowi, tak¿e od niego bêdê móg³ coœ kupiæ. Widaæ, ¿e Saturas jest gotów zap³aciæ ka¿d¹ cenê za odnalezienie ornamentów.");
	B_StopProcessInfos(self);
};

// *************************************************

instance Info_Saturas_SaveDick (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	3;
	condition	=	Info_Saturas_SaveDick_Condition;
	information	=	Info_Saturas_SaveDick_Info;
	permanent	=	0;
	important	=	1;	
	description		= "."; 
};                       

FUNC int Info_Saturas_SaveDick_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_FindThief1))&&(Npc_GetDistToWP (hero,"LOCATION_19_03_ROOM6_BARRELCHAMBER2") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_SaveDick_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);
	AI_Output(self, other,"Info_Saturas_SaveDick_14_01"); //Uda³o siê!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_02"); //Jak ja siê tu znalaz³em?
	AI_Output(self, other,"Info_Saturas_SaveDick_14_03"); //Wyczu³em, ¿e grozi Ci niebezpieczeñstwo. To nie by³o ³atwe, ale uda³o siê sprowadziæ Ciê ¿ywego.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_04"); //Zbytek ³aski, poradzi³bym sobie sam. 
	AI_Output(self, other,"Info_Saturas_SaveDick_14_05"); //Ale z Ciebie uparte bydlê!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_06"); //Nie oszukujmy siê, uratowa³eœ mnie tylko dlatego, ¿e mia³em przy sobie ornament.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_07"); //le mnie oceniasz... Twoje ¿ycie jest równie wa¿ne, jak nie wa¿niejsze. Zbyt wielu ju¿ zginê³o, próbuj¹c nam pomóc.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_08"); //Sk¹d te nag³e wyrzuty sumienia? Wczeœniej ich nie zauwa¿y³em.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_09"); //Nie jest ³atwo wype³niaæ rozkazy boga. To co czynimy, nie robimy dla siebie, ale dla Adanosa.
	AI_Output(other, self, "Info_Saturas_SaveDick_15_10"); //Chcesz mi wmówiæ, ¿e rozmawiasz z bogiem?!
	AI_Output(self, other,"Info_Saturas_SaveDick_14_11"); //Nie rozmawiam, ale s³yszê jego nakazy i zawsze je wype³niam, nawet wbrew w³asnej woli. Jestem tylko narzêdziem... Nie mia³em wyboru...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_12"); //Gdybym móg³ ocaliæ ¿ycie twoich poprzedników, zrobi³bym to!
	AI_Output(other, self, "Info_Saturas_SaveDick_15_13"); //Hmm... Mo¿e oceni³em Ciê zbyt pochopnie.
	AI_Output(self, other,"Info_Saturas_SaveDick_14_14"); //To co robimy oceni¹ kiedyœ potomni i sama historia...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_15"); //Przeka¿ Cronosowi ornament i idŸ po kolejn¹ mapê do Nefariusa. Mamy coraz mniej czasu...
	AI_Output(self, other,"Info_Saturas_SaveDick_14_16"); //Niech Adanos nad Tob¹ czuwa.
	B_LogEntry(CH3_NON_Ornament, "To Saturas mnie uratowa³. Teleportowa³ mnie w ostatniej chwili. Wydaje siê, ¿e nawet on jest tylko narzêdziem. Trochê pochopnie go oceni³em. Czas oddaæ ornament Cronosowi i pójœæ po kolejn¹ mapê do Nefariusa.");
};

// *************************************************

instance Info_Saturas_Konwer (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	4;
	condition	=	Info_Saturas_Konwer_Condition;
	information	=	Info_Saturas_Konwer_Info;
	permanent	=	0;
	important	=	1;	
	description		= "..."; 
};                       

FUNC int Info_Saturas_Konwer_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))&&(Npc_GetDistToWP (hero,"LOCATION_19_03_ROOM6_BARRELCHAMBER2") < 500 ) //wp gdzie siê dick teleportn¹
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Konwer_Info()
{
	AI_Output(other, self, "Info_Saturas_Konwer_15_01"); //Mog³eœ chwilê zaczekaæ. Mamy spory problem.
	AI_Output(self, other,"Info_Saturas_Konwer_14_02"); //Ornament znikn¹³.
	AI_Output(other, self, "Info_Saturas_Konwer_15_03"); //Sk¹d wiesz?
	AI_Output(self, other,"Info_Saturas_Konwer_14_04"); //Ornamenty zosta³y konsekrowane na o³tarzu Adanosa. Potrafiê wyczuæ ich aurê, a tak¿e tych, którzy s¹ w ich posiadaniu.
	AI_Output(self, other,"Info_Saturas_Konwer_14_05"); //Niestety potrafiê wyczuæ tylko najprostsze emocje czy instynkty.
	AI_Output(other, self, "Info_Saturas_Konwer_15_06"); //Wiesz, gdzie ukryto ornamenty?
	AI_Output(self, other,"Info_Saturas_Konwer_14_07"); //Niestety nie. Nie potrafiê wyczuæ aury... Ktoœ musi j¹ blokowaæ. 
	AI_Output(other, self, "Info_Saturas_Konwer_15_08"); //Jakiœ mag?
	AI_Output(self, other,"Info_Saturas_Konwer_14_09"); //Niekoniecznie. Wystarczy miejsce poœwiêcone innemu bogu, aby st³umiæ aurê.
	AI_Output(other, self, "Info_Saturas_Konwer_15_10"); //Stawiasz na Innosa czy Beliara?
	AI_Output(self, other,"Info_Saturas_Konwer_14_11"); //W¹tpiê, aby s³udzy Innosa stawali nam na drodze.
	AI_Output(other, self, "Info_Saturas_Konwer_15_12"); //Co teraz zrobimy?
	AI_Output(self, other,"Info_Saturas_Konwer_14_13"); //Musimy odnaleŸæ pozosta³e fragmenty. I musimy zrobiæ to w przeci¹gu trzech dni.
	AI_Output(other, self, "Info_Saturas_Konwer_15_14"); //O co chodzi z tymi trzema dniami? Hrabia mówi³ to samo.
	AI_Output(self, other,"Info_Saturas_Konwer_14_15"); //Co to za Hrabia?
	AI_Output(other, self, "Info_Saturas_Konwer_15_16"); //Typek, który ci¹gle mnie uprzedza. Mam wam przekazaæ, ¿e je¿eli w przeci¹gu trzech dni nie oddacie po dobroci ornamentu, to znajdzie was i sam go sobie weŸmie.
	AI_Output(self, other,"Info_Saturas_Konwer_14_17"); //Za trzy dni odbêdzie siê konwergerencja sfer. Wtedy pierwotna moc wszystkich bogów po³¹czy siê...
	AI_Output(self, other,"Info_Saturas_Konwer_14_18"); //To zjawisko zdarza siê raz na dziesiêæ lat. Jest niezwykle potê¿ne, ale krótkotrwa³e.
	AI_Output(self, other,"Info_Saturas_Konwer_14_19"); //Jego moc os³abi barierê na tyle, ¿e bêdzie mo¿na siê poza ni¹ teleportowaæ.
	AI_Output(other, self, "Info_Saturas_Konwer_15_16"); //Bêdzie mo¿na przez ni¹ przejœæ?
	AI_Output(self, other,"Info_Saturas_Konwer_14_20"); //Niestety nie, tylko magia zdo³a siê przedrzeæ przez os³onê.
	AI_Output(self, other,"Info_Saturas_Konwer_14_20"); //To dla nas jedyna szansa, aby odnaleŸæ drogê do Jarkendaru.
	AI_Output(other, self, "Info_Saturas_Konwer_15_21"); //Gdzie?
	AI_Output(self, other,"Info_Saturas_Konwer_14_22"); //Do miejsca, gdzie ju¿ wkrótce narodzi siê potê¿ne z³o. Wiêcej wiedzieæ nie musisz.
	AI_Output(other, self, "Info_Saturas_Konwer_15_23"); //Czyli mam trzy dni na znalezienie ornamentów?
	AI_Output(self, other,"Info_Saturas_Konwer_14_24"); //Tak. 
	AI_Output(other, self, "Info_Saturas_Konwer_15_25"); //Rozumiem, ¿e zwrócenie ornamentu nie wchodzi w rachubê?
	AI_Output(self, other,"Info_Saturas_Konwer_14_26"); //Oczywiœcie. Porozmawiaj z Merdarionem, on mo¿e Ci pomóc. A teraz ruszaj, muszê wróciæ do pracy.
	
   B_LogEntry(CH3_NON_Ornament, "Mam trzy dni na odnalezienie pozosta³ych czeœci ornamentu. Wtedy nadejdzie jakaœ konwergerencja i magowie bêd¹ mogli siê teleportowaæ poza barierê. Muszê porozmawiaæ z Merdarionem, podobno mo¿e mi pomóc.");
};

// *************************************************

instance Info_Saturas_Find (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	5;
	condition	=	Info_Saturas_Find_Condition;
	information	=	Info_Saturas_Find_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mam pozosta³e ornamenty!"; 
};                       

FUNC int Info_Saturas_Find_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))&&(NPC_HasItems(hero,orn1)>=1)&&(NPC_HasItems(hero,orn2)>=1)&&(NPC_HasItems(hero,orn4)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Find_Info()
{
	AI_Output(other, self, "Info_Saturas_Find_15_01"); //Mam pozosta³e ornamenty!
   
	if (ornament_wait >= (Wld_GetDay()))
	{
		ritual_time_ok = TRUE;
		B_GiveXP(2500);
      
		AI_Output(self, other,"Info_Saturas_Find_14_02"); //Zd¹¿ymy jeszcze przeprowadziæ rytua³!
		AI_Output(self, other,"Info_Saturas_Find_14_03"); //Natychmiast zanieœ fragmenty Cronosowi. Powiedz te¿ pozosta³ym magom, ¿eby wyszli na dziedziniec.
		AI_Output(self, other,"Info_Saturas_Find_14_04"); //Bêdê tam na nich czeka³. Porozmawiaj ze mn¹, kiedy sprowadzisz wszystkich magów.
		AI_Output(self, other,"Info_Saturas_Find_14_05"); //Nie traæ czasu, ruszaj natychmiast! 
		
      B_LogEntry(CH3_NON_Ornament, "Muszê natychmiast zanieœæ ornamenty Cronosowi i powiedzieæ wszystkim magom, aby stawili siê na dziedziñcu, gdzie Saturas bêdzie ju¿ na nich czeka³. Gdy przyjd¹ wszyscy, muszê porozmawiaæ z Saturasem.");
		B_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RIT");	
	}
	else
	{
		AI_Output(self, other,"Info_Saturas_Find_14_06"); //Ju¿ za póŸno... ZejdŸ mi z oczu.
		AI_Output(self, other,"Info_Saturas_Find_14_07"); //Powiedz Lee, ¿e mo¿e odejœæ.
		
      lee_free = TRUE;
		Log_SetTopicStatus(CH3_NON_Ornament, LOG_FAILED);
		B_LogEntry(CH3_NON_Ornament, "SpóŸni³em siê... Magowie Wody nie odprawi¹ ju¿ rytua³u, a ja nie dowiem siê, czy im siê to uda. Niech to szlag, nie lubiê przegrywaæ...");
	};
};

// *************************************************

instance Info_Saturas_Rytual (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	6;
	condition	=	Info_Saturas_Rytual_Condition;
	information	=	Info_Saturas_Rytual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Gotowe. Co teraz?"; 
};                       

FUNC int Info_Saturas_Rytual_Condition()
{
	if (ritual_time_ok == TRUE)&&(Npc_KnowsInfo(hero,KDW_605_Riordian_All))&&(Npc_KnowsInfo(hero,Info_Nefarius_All))&&(Npc_KnowsInfo(hero,DIA_Myxir_All))&&(Npc_KnowsInfo(hero,DIA_Merdarion_FindAll))&&(Npc_KnowsInfo(hero,DIA_Cronos_OrnamentAll))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Rytual_Info()
{
	var C_NPC cron; cron = Hlp_GetNpc(KDW_604_Cronos);

	AI_Output(other, self, "Info_Saturas_Rytual_15_01"); //Gotowe. Co teraz?
	
   if (ornament_wait >= Wld_GetDay())
	{
		AI_Output(self, other,"Info_Saturas_Rytual_14_02"); //Odsuñ siê i czekaj.
		AI_Output(self, other,"Info_Saturas_Rytual_14_03"); //Czas dokonaæ po³¹czenia!
		AI_TurnToNpc(self, cron);
		AI_Output(self, other,"Info_Saturas_Rytual_14_04"); //Ruszaj Cronosie...
		
      AI_PlayAni(cron,"T_YES");

		B_LogEntry(CH3_NON_Ornament, "Rytua³ siê rozpocz¹³...");
		B_StopProcessInfos(self);
		AI_GotoWP (cron, "RIT7");
		AI_AlignToWP(cron);
		AI_PlayAni(self, "T_PLUNDER");

		/***********************
      Ork to twoja dzia³a. Trzeba jakoœ zajebiœcie zrobiæ ten rytua³. Opiszê jakby to mog³o wygl¹daæ.

   Oczywiœcie z kamerk¹ ;P

   0. Na pocz¹tku zamykaj¹ siê wrota, czy tam opuszcza siê karata do sali, ¿eby nikt magom nie przeszkadza³
   1. Cronos podchodzi do jakiegoœ miejsca, rzuca kawa³ki ornamentu w górê czy tam w ogieñ, etc.
   2. Cronos wraca na swoje miejsce.
   3. Wszyscy magowie zaczynaj¹ inkantowaæ, ³apki w górê, etc.
   4. Zaczyna siê coœ dziaæ z ornamentami, ³¹cz¹ siê i klucz unosi siê w górê.
   5. Mo¿e jakieœ œwiat³o z tego klucza pada na martwy portal.
   6. Portal zaczyna siê tworzyæ, trzêsienie ziemi, jakiœ fajny pfxa.
   7. H³e, hle. Krata siê podnosi, do komnaty wpadaj¹ siepacze Hrabiego i przeyrwaj¹ rytua³. Portal eksploduje, klucz zostaje zniszczony i mamy unhuppy end ;)
   To ich instancje:
      var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
      var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
      var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
      var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
      var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
      var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

   Zmieñ im te¿ nastawienie, ale niech nie rzucaj¹ siê tylko na dicka, ale te¿ na magów i najemników:

      Npc_SetTempAttitude(weg, ATT_HOSTILE); Npc_SetAttitude(weg, ATT_HOSTILE);
      Npc_SetTempAttitude(grd1, ATT_HOSTILE); Npc_SetAttitude(grd1, ATT_HOSTILE);
      Npc_SetTempAttitude(grd2, ATT_HOSTILE); Npc_SetAttitude(grd2, ATT_HOSTILE);
      Npc_SetTempAttitude(grd3, ATT_HOSTILE); Npc_SetAttitude(grd3, ATT_HOSTILE);
      Npc_SetTempAttitude(grd4, ATT_HOSTILE); Npc_SetAttitude(grd4, ATT_HOSTILE);
      Npc_SetTempAttitude(grd5, ATT_HOSTILE); Npc_SetAttitude(grd5, ATT_HOSTILE);

   8. Za siepaczami wpadaj¹ najemnicy, zaczyna siê rzeŸnia. Mo¿esz od razu uœmierciæ Myxira podczas walki, a cia³o Jarvisa niech le¿y na zewn¹trz, to on mia³ wartê kiedy ude¿yli stra¿nicy, dlatego reszta da³a siê zaskoczyæ.
   9. 
   10. na koñcu funkcji niech zmienna rytual_break = TRUE;
	*************************/

		B_RitualBreak();
	}
	else
	{
		AI_Output(self, other,"Info_Saturas_Rytual_14_05"); //Dlaczego tyle zwleka³eœ?! Precz mi z oczu.
		AI_Output(self, other,"Info_Saturas_Rytual_14_06"); //Powiedz Lee, ¿e jesteœmy ju¿ kwita.
		
      lee_free = TRUE;
		Log_SetTopicStatus(CH3_NON_Ornament, LOG_FAILED);
		B_LogEntry(CH3_NON_Ornament, "SpóŸni³em siê... Magowie wody nie odprawi¹ ju¿ rytua³u, a ja nie dowiem siê, czy im siê to uda. Niech to szlag, nie lubiê przegrywaæ...");
	};
};

// *************************************************

instance Info_Saturas_RytualFinished (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	7;
	condition	=	Info_Saturas_RytualFinished_Condition;
	information	=	Info_Saturas_RytualFinished_Info;
	permanent	=	0;
	important	=	1;	
	description		= "..."; 
};                       

FUNC int Info_Saturas_RytualFinished_Condition()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	if (rytual_break == TRUE)&&(Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo(hero,Info_Saturas_Rytual))
   &&((Npc_IsDead(grd1))&&(Npc_IsDead(grd2))&&(Npc_IsDead(grd3))&&(Npc_IsDead(grd4))&&(Npc_IsDead(grd5))&&(Npc_IsDead(weg)))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_RytualFinished_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);
   
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_01"); //To niemo¿liwe... Portal zniszczony... Ornament przepad³... Tyle przygotowañ...
	AI_Output(other, self, "Info_Saturas_RytualFinished_15_02"); //Trzeba przyznaæ, ¿e Hrabia dotrzyma³ s³owa. Co teraz?
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_03"); //Adanos wystawia nas na ciê¿k¹ próbê. To musia³ byæ znak...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_04"); //Tak, Adanos nas sprawdza. Musi byæ inny sposób... Znajdziemy go, a wtedy z³o w Jarkendarze zadr¿y...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_05"); //Co do Ciebie...
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_06"); //Bardzo nam pomog³eœ, to nie zostanie zapomniane.

	/****************
	Ork co do nagrody to nie wiem, sam coœ wymyœl. Mo¿e niech któryœ z magów uczy te¿ bezia zaklêæ po tym rytuale
	****************/

	AI_Output(self, other,"Info_Saturas_RytualFinished_14_07"); //Powiedz Lee, ¿e jego d³ug zosta³ sp³acony.
	AI_Output(self, other,"Info_Saturas_RytualFinished_14_08"); //A teraz odejdŸ i niech Adanos czuwa nad Tob¹.
	lee_free = TRUE;	
	Log_SetTopicStatus(CH3_NON_Ornament, LOG_SUCCESS);
	B_LogEntry(CH3_NON_Ornament, "Rytua³ zakoñczy³ siê krwawym fiaskiem. Portal zosta³ zniszczony, magowie musz¹ poszukaæ innej drogi ku wolnoœci.");	
	B_StopProcessInfos(self);

	var C_NPC mag1; mag1 = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC mag2; mag2 = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC mag3; mag3 = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC mag4; mag4 = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC mag5; mag5 = Hlp_GetNpc(KDW_605_Riordian);

	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(mag1,"start");
	Npc_ExchangeRoutine(mag2,"start");
	Npc_ExchangeRoutine(mag3,"start");
	Npc_ExchangeRoutine(mag4,"start");
	Npc_ExchangeRoutine(mag5,"start");
};

// *************************************************

instance Info_Saturas_Ritual (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	8;
	condition	=	Info_Saturas_Ritual_Condition;
	information	=	Info_Saturas_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Potrzebujê pomocy."; 
};                       

FUNC int Info_Saturas_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_RuneSwd1))&&(Npc_KnowsInfo(hero,Info_Saturas_Intruder))&&(!Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Ritual_Info()
{
	AI_Output(other, self, "Info_Saturas_Ritual_15_00"); //Potrzebujê pomocy.
	AI_Output(self, other,"Info_Saturas_Ritual_14_01"); //Jak my wszyscy.
	AI_Output(other, self, "Info_Saturas_Ritual_15_02"); //Ale to bardzo wa¿ne! Znalaz³em miecz i...
	AI_Output(self, other,"Info_Saturas_Ritual_14_03"); //OdejdŸ!
	B_LogEntry(CH4_GRD_RuneSwd, "Saturas pomo¿e mi tylko wtedy, jak zdobêdê jego zaufanie. Muszê pokrêciæ siê w pobli¿u tych magów.");
};

// *************************************************

var int satur_ritual;

instance Info_Saturas_RitualOk (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	9;
	condition	=	Info_Saturas_RitualOk_Condition;
	information	=	Info_Saturas_RitualOk_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Potrzebujê pomocy."; 
};                       

FUNC int Info_Saturas_RitualOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_RuneSwd1))&&(Npc_KnowsInfo(hero,Info_Saturas_RytualFinished))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_RitualOk_Info()
{
	var C_NPC myxir; myxir = Hlp_GetNpc(KDW_601_Myxir);

	AI_Output(other, self, "Info_Saturas_RitualOk_15_00"); //Potrzebujê pomocy.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_01"); //Magowie maj¹ wobec Ciebie d³ug wdziêcznoœci. Co to za problem?
	AI_Output(other, self, "Info_Saturas_RitualOk_15_02"); //Znalaz³em runiczny miecz i...
	AI_Output(self, other,"Info_Saturas_RitualOk_14_03"); //To niemo¿liwe, ten miecz zagin¹³ wieki temu!
	AI_Output(other, self, "Info_Saturas_RitualOk_15_04"); //Jak widaæ to ju¿ przesz³oœæ. Teraz miecz nale¿y do mnie.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_05"); //Gdyby powiedzia³ mi to ktoœ inny, bez zastanowienia odebra³bym mu to ostrze.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_06"); //Miecz runiczny to przeklêty orê¿. Zawsze prowadzi³ do zguby swego posiadacza. Jego moc jest zbyt potê¿na dla zwyk³ego œmiertelnika.
	AI_Output(other, self, "Info_Saturas_RitualOk_15_07"); //Nie obawiaj siê, miecz jest 'martwy'. 
	AI_Output(self, other,"Info_Saturas_RitualOk_14_08"); //A Ty zapewne chcesz przebudziæ drzemi¹ce w ostrzu moce?
	AI_Output(other, self, "Info_Saturas_RitualOk_15_09"); //Trafnie odgad³eœ. Dlatego w³aœnie potrzebujê twojej pomocy.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_10"); //Wiesz chocia¿, jak siê do tego zabraæ? To nie takie proste, nale¿y...
	AI_Output(other, self, "Info_Saturas_RitualOk_15_11"); //...odprawiæ rytua³ odrodzenia przez trzech kap³anów wyznaj¹cych ró¿nych bogów. Oczywiœcie muszê najpierw zdobyæ 'Almanach odrodzenia'.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_12"); //Ty rzeczywiœcie chcesz to zrobiæ i niestety znasz sposób.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_13"); //W porz¹dku, magowie wody zawsze sp³acaj¹ swoje zobowi¹zania.
	
   if (Npc_IsDead(myxir))
	{
		satur_ritual = TRUE;
		AI_Output(self, other,"Info_Saturas_RitualOk_14_14"); //To Myxir by³ naszym mistrzem przywo³añ. Po jego œmierci tylko ja posiadam odpowiedni¹ wiedzê, aby Ci pomóc.
		AI_Output(self, other,"Info_Saturas_RitualOk_14_15"); //PrzyjdŸ do mnie, kiedy wszystko bêdzie ju¿ przygotowane do rytua³u.
		
		B_LogEntry(CH4_RBL_Rirual, "Sam Saturas weŸmie udzia³ w rytuale. Ale najpierw muszê wszystko przygotowaæ, czyli muszê odnaleŸæ ten cholerny almanach.");
	}
	else
	{
		myxir_ritual = TRUE;
		AI_Output(self, other,"Info_Saturas_RitualOk_14_17"); //To Myxir jest mistrzem przywo³añ. Porozmawiaj z nim, kiedy ju¿ wszystko bêdzie przygotowane do rytua³u.

		B_LogEntry(CH4_RBL_Rirual, "Myxir weŸmie udzia³ w rytuale. Ale najpierw muszê wszystko przygotowaæ, czyli muszê odnaleŸæ ten cholerny almanach.");
	};
   
   AI_Output(self, other,"Info_Saturas_RitualOk_14_18"); //Od tej chwili magowie wody uwa¿aj¹ swój d³ug za sp³acony.
	AI_Output(self, other,"Info_Saturas_RitualOk_14_19"); //OdejdŸ w pokoju, Rick.
};

instance Info_Saturas_Stones (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	10;
	condition	=	Info_Saturas_Stones_Condition;
	information	=	Info_Saturas_Stones_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Mistrzu Saturasie, szukam kamieni ogniskuj¹cych."; 
};                       

FUNC int Info_Saturas_Stones_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Milten_Cristals))
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_Stones_Info()
{
	AI_Output(other, self, "Info_Saturas_Stones_15_00"); //Mistrzu Saturasie, szukam kamieni ogniskuj¹cych.
	AI_Output(self, other,"Info_Saturas_Stones_14_01"); //Pierwszy raz nazwa³eœ mnie mistrzem. Nie lubiê, jak ktoœ bez ³oju wchodzi mi...
	AI_Output(other, self, "Info_Saturas_Stones_15_02"); //Wybacz. Bardzo zale¿y mi na kamieniach. 
	AI_Output(self, other,"Info_Saturas_Stones_14_03"); //Do czego potrzebujesz tych artefaktów?
	AI_Output(other, self, "Info_Saturas_Stones_15_04"); //S¹ niezbêdne do przywrócenia mocy mieczowi runicznemu.
	AI_Output(self, other,"Info_Saturas_Stones_14_05"); //Rozumiem...
	AI_Output(self, other,"Info_Saturas_Stones_14_06"); //Jednak kamienie ogniskuj¹ce to potê¿ne artefakty. 
	AI_Output(self, other,"Info_Saturas_Stones_14_07"); //Dlaczego mielibyœmy oddaæ je w twoje rêce?

	Info_ClearChoices (Info_Saturas_Stones);
	Info_AddChoice (Info_Saturas_Stones, "Kamienie pomog¹ mi zachowaæ równowagê pomiêdzy boskimi si³ami.", Info_Saturas_Stones_Protect);
	Info_AddChoice (Info_Saturas_Stones, "Dziêki ostrzu zdobêdê s³awê.", Info_Saturas_Stones_Glory);
	Info_AddChoice (Info_Saturas_Stones, "Oddaj kamienie, albo wyprujê Ci flaki!", Info_Saturas_Stones_Kill);
};

// ---------------------------kil----------------------------------------

FUNC VOID Info_Saturas_Stones_Kill()
{
	AI_Output(other, self, "Info_Saturas_Stones_Kill_15_00"); //Oddaj kamienie, albo wyprujê Ci flaki!
	AI_Output(self, other,"Info_Saturas_Stones_Kill_14_01"); //Jak œmiesz groziæ mistrzowi Krêgu Wody.
	AI_Output(self, other,"Info_Saturas_Stones_Kill_14_02"); //Zap³acisz za to w³asn¹ krwi¹!
	Log_SetTopicStatus(CH4_RBL_FocusStones, LOG_FAILED);
	B_LogEntry(CH4_RBL_FocusStones, "No có¿, chyba trochê mnie ponios³o. Mogê zapomnieæ o kamieniach ogniskuj¹cych.");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

// ---------------------------glr----------------------------------------

FUNC VOID Info_Saturas_Stones_Glory()
{
	AI_Output(other, self, "Info_Saturas_Stones_Glory_15_00"); //Dziêki ostrzu zdobêdê s³awê.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_01"); //Nie pomogê komuœ, kim kieruj¹ tylko egoistyczne pobudki.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_02"); //Miecz runiczny zosta³ wykuty z myœl¹ o niesieniu pomocy lub szerzeniu zag³ady.
	AI_Output(self, other,"Info_Saturas_Stones_Glory_14_03"); //Jeszcze nikt nie u¿ywa³ ostrza, aby s³u¿yæ równowadze tego œwiata.
	B_LogEntry(CH4_RBL_FocusStones, "Nie zdobêdê kamieni, myœl¹c tylko o sobie.");
	Info_ClearChoices (Info_Saturas_Stones);
};

// --------------------------glr----------------------------------------

FUNC VOID Info_Saturas_Stones_Protect()
{
	focus_get = TRUE;
	AI_Output(other, self, "Info_Saturas_Stones_Protect_15_00"); //Kamienie pomog¹ mi zachowaæ równowagê pomiêdzy boskimi si³ami.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_01"); //To ciekawe... Byæ mo¿e pomyli³em siê co do Ciebie.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_02"); //Dobrze, otrzymasz kamienie ogniskuj¹ce.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_03"); //Stra¿nikiem kamieni jest Nefarius.
	AI_Output(self, other,"Info_Saturas_Stones_Protect_14_04"); //Przekonaj go tak, jak przekona³eœ mnie.
	B_LogEntry(CH4_RBL_FocusStones, "Przekona³em Saturasa. Stra¿nikiem kamieni jest Nefarius. Muszê natychmiast z nim porozmawiaæ.");
	B_StopProcessInfos(self); 
};

// *************************************************

instance Info_Saturas_StonesAgain (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	11;
	condition	=	Info_Saturas_StonesAgain_Condition;
	information	=	Info_Saturas_StonesAgain_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wracaj¹c do kamieni..."; 
};                       

FUNC int Info_Saturas_StonesAgain_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Stones))&&(!focus_get)
	{
		return 1;
	};
};

FUNC VOID Info_Saturas_StonesAgain_Info()
{
	AI_Output(other, self, "Info_Saturas_StonesAgain_15_00"); //Wracaj¹c do kamieni...
	AI_Output(self, other,"Info_Saturas_StonesAgain_14_01"); //Nie mamy do czego wracaæ - odejdŸ!
	
   B_StopProcessInfos(self); 
};

// *************************************************

instance  Info_Saturas_Ritual2 (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	12;
	condition	=	Info_Saturas_Ritual2_Condition;
	information	=	Info_Saturas_Ritual2_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u."; 
};                       

FUNC int  Info_Saturas_Ritual2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(satur_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Ritual2_Info()
{
	AI_Output(other, self, "Info_Saturas_Ritual2_15_00"); //Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u.
	AI_Output(self, other,"Info_Saturas_Ritual2_14_01"); //W porz¹dku, gdzie rytua³ siê odbêdzie?
	AI_Output(other, self, "Info_Saturas_Ritual2_15_02"); //Leren czeka w pobli¿u kamiennego krêgu na bagnach.
	AI_Output(self, other,"Info_Saturas_Ritual2_14_03"); //Wiem, gdzie to jest, wkrótce tam przybêdê.
	B_LogEntry(CH4_RBL_Rirual, "Saturas wyruszy³ do kamiennego krêgu.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

// *************************************************

instance  Info_Saturas_WhereLee (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	13;
	condition	=	Info_Saturas_WhereLee_Condition;
	information	=	Info_Saturas_WhereLee_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Gdzie jest Lee?"; 
};                       

FUNC int  Info_Saturas_WhereLee_Condition()
{
	if (Kapitel>=5)&&(Npc_KnowsInfo(hero,DIA_Lee_RBLBosses))
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_WhereLee_Info()
{
	AI_Output(other, self, "Info_Saturas_WhereLee_15_00"); //Gdzie jest Lee?
	AI_Output(self, other,"Info_Saturas_WhereLee_14_01"); //Wyruszy³ do Nowego Obozu. Pos³a³em z nim Cronosa, by³em mu to winien.
	AI_Output(other, self, "Info_Saturas_WhereLee_15_02"); //Cholera, mam nadziejê, ¿e nie zaczn¹ beze mnie!
	B_LogEntry (CH4_RBL_NCRebel, "Lee wyruszy³ do Nowego Obozu, muszê tam go poszukaæ.");
};

// *************************************************

instance  Info_Saturas_GoBackNC (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	14;
	condition	=	Info_Saturas_GoBackNC_Condition;
	information	=	Info_Saturas_GoBackNC_Info;
	permanent	=	0;
	important	=	0;	
	description		= "W Nowym Obozie zapanowa³ stary porz¹dek."; 
};                       

FUNC int  Info_Saturas_GoBackNC_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_WhereLee))&&(Npc_KnowsInfo(hero,DIA_Lee_TheRockCompleated))
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_GoBackNC_Info()
{
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_00"); //W Nowym Obozie zapanowa³ stary porz¹dek.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_01"); //By³em pewien, ¿e Lee dopnie swego. Ciekawe, ile stra¿nicy rozkradli z naszego mienia?
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_02"); //Sami siê przekonajcie. Lee powiedzia³, ¿e mo¿ecie wracaæ do 'domu'.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_03"); //I tak te¿ siê stanie. Ale na razie wrócimy tylko do Nowego Obozu.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_04"); //Emisariusz dobrego s³owa jest u nas zawsze mile widziany.
	AI_Output(self, other,"Info_Saturas_GoBackNC_14_05"); //Pod¹¿aj drog¹ Adanosa.
	AI_Output(other, self, "Info_Saturas_GoBackNC_15_06"); //Nigdy nie wiadomo, gdzie siê zb³¹dzi... Bywaj.

	var C_NPC mag1; mag1 = Hlp_GetNpc(KDW_601_Myxir);
	var C_NPC mag2; mag2 = Hlp_GetNpc(KDW_602_Merdarion);
	var C_NPC mag3; mag3 = Hlp_GetNpc(KDW_603_Nefarius);
	var C_NPC mag4; mag4 = Hlp_GetNpc(KDW_604_Cronos);
	var C_NPC mag5; mag5 = Hlp_GetNpc(KDW_605_Riordian);

	Npc_ExchangeRoutine(self,"start");
	Npc_ExchangeRoutine(mag1,"start");
	Npc_ExchangeRoutine(mag2,"start");
	Npc_ExchangeRoutine(mag3,"start");
	Npc_ExchangeRoutine(mag4,"start");
	Npc_ExchangeRoutine(mag5,"start");
};

INSTANCE DIA_Saturas_CanYouTeachMe (C_INFO)
{
	npc				= KDW_600_Saturas;
	//nr				= 71;
	condition		= DIA_Saturas_CanYouTeachMe_Condition;
	information		= DIA_Saturas_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Saturas_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Saturas_SaveDick))
	{
		return 1;
	};
};

FUNC VOID DIA_Saturas_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Saturas_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Saturas_CanYouTeachMe_12_02"); //Posiadam wiedzê o krêgach magii.
	
	Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Saturas nauczy mnie magicznych zaklêæ, ale tylko jak zostanê magiem.");
};