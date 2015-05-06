
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Bukhart_Exit (C_INFO)
{
	npc			= Non_4021_Bukhart;
	nr			= 999;
	condition	= DIA_Bukhart_Exit_Condition;
	information	= DIA_Bukhart_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Bukhart_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Bukhart_Hello (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 1;
	condition		= DIA_Bukhart_Hello_Condition;
	information		= DIA_Bukhart_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Bukhart_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Bukhart_Hello_Info()
{
	AI_Output (self, other, "DIA_Bukhart_Hello_11_01"); //Kto Ciê tu do ciê¿kiej cholery wpuœci³?!
	AI_Output (other, self, "DIA_Bukhart_Hello_15_02"); //Znajomy z obozu rebeliantów opowiedzia³ mi o ³owcach trolli, wiêc przyszed³em przekonaæ siê na w³asne oczy, czy te wszystkie opowieœci nie s¹ przesadzone.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_03"); //£owcy trolli? Co za idiotyczna nazwa. A co do opowieœci, to nie znam ¿adnej, która koñczy³a by siê dobrze dla trolla, he, he.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_04"); //Witaj w naszym 'os³awionym' obozie. Tylko nie w³aŸ nikomu w drogê, bo szkoda by by³o takiego œlicznego ch³opczyka poharataæ.
	AI_Output (other, self, "DIA_Bukhart_Hello_15_05"); //Potrafiê o siebie zadbaæ.
	AI_Output (self, other, "DIA_Bukhart_Hello_11_06"); //Po¿yjemy, zobaczymy. Bywaj.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Bukhart_Thief (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 2;
	condition		= DIA_Bukhart_Thief_Condition;
	information		= DIA_Bukhart_Thief_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie przeszkadzam?"; 
};

FUNC INT DIA_Bukhart_Thief_Condition()
{
	if (Burhart_Doing_Bad)&&(Npc_KnowsInfo (hero,DIA_Snow_WhatOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Thief_Info()
{
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Bukhart_Thief_15_01"); //Nie przeszkadzam?
	
   B_SmartTurnToNpc	(self, other);
	
   AI_Output (self, other, "DIA_Bukhart_Thief_11_02"); //Niech Ciê szlag, ale mnie nastraszy³eœ... Co ty tu robisz o tej porze?
	AI_Output (other, self, "DIA_Bukhart_Thief_15_03"); //Czekam na z³odzieja zapasów. I wiesz co? Chyba w³aœnie go znalaz³em.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_04"); //Cholerny Snow Ciê wynaj¹³? Mia³em go na oku, nie przyszed³bym tu, gdyby ten cwaniak nie poszed³ spaæ.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_05"); //Najwidoczniej nie przewidzia³eœ wszystkiego. Snow siê ucieszy, kiedy powiem, kogo tutaj spotka³em.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_06"); //To nie jest to, na co wygl¹da. Poza tym lepiej by by³o, jakbyœ trzyma³ jêzyk za zêbami.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_07"); //Grozisz mi?
	AI_Output (self, other, "DIA_Bukhart_Thief_11_08"); //Widzisz, nie skubiê Snowa dla krotochwili czy z g³odu. To bardziej skomplikowane ni¿ myœlisz.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_09"); //Mów, mam czas.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_10"); //No dobra.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_11"); //Ta zdzira zakaza³a nam... piæ przed akcj¹.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_12"); //Co?! Kobieta nie pozwala wam piæ?! I wy jej s³uchacie?!
	AI_Output (self, other, "DIA_Bukhart_Thief_11_13"); //Nie znasz Kiry. Ona jest jak cholerna dziwka Beliara. Potrafi dopiec do ¿ywego i to nie tylko jêzykiem.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_14"); //Chyba tylko Tablor da³by jej radê na miecze, ale on jest zbyt honorowy, by skrzy¿owaæ orê¿ z kobiet¹.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_15"); //Ju¿ kilka razy próbowaliœmy go podpuœciæ, ale za ka¿dym razem spra³ nas p³azem - cholerny rycerzyk.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_16"); //Snow znowu jest uparty jak wó³ i ma te, no... zasady. Nie pozwala nam zbli¿aæ siê do zapasów, wszystkie racje rozdziela sam.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_17"); //Butelka piwa dziennie! Przecie¿ to siê nie mieœci w g³owie!
	AI_Output (other, self, "DIA_Bukhart_Thief_15_18"); //Rzeczywiœcie, nie zazdroszczê wam. Kto by pomyœla³, s³awni ³owcy trolli zastraszeni przez jedn¹ kobietê.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_19"); //Dlatego kradnê zapasy Snowa. Oczywiœcie ginie wszystko prócz alkoholu.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_20"); //Korth ma uk³ad z jakimœ handlarzem, wymiana towarowa. £apiesz?
	AI_Output (other, self, "DIA_Bukhart_Thief_15_21"); //Skradzione zapasy, za piwo, wino i wódê. Chyba rozumiem.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_22"); //A dlaczego Kira zakaza³a wam piæ?
	AI_Output (self, other, "DIA_Bukhart_Thief_11_23"); //G³upia sprawa.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_24"); //Poszliœmy na ostatni¹ robotê po ostrej popijawie. Ledwo widzia³em na oczy, Korth mia³ kaca, a Postronek zerzyga³ siê na cieniostwora, he, he.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_25"); //Tropiliœmy trolla. Pech chcia³, ¿e napatoczyliœmy siê na ca³¹ cholern¹ rodzinkê.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_26"); //Cztery trolle, a my byliœmy tak wstawieni, ze ledwie je zauwa¿yliœmy.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_27"); //Gdyby nie Kira i Tablor, to pewnie byœmy stamt¹d nie wrócili.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_28"); //Hmm, ale z tego wynika, ¿e Kira dobrze zrobi³a.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_29"); //Mo¿e i dobrze, ale to by³ cios poni¿ej pasa. Wola³bym ju¿ rzuciæ siê na trolla z go³ymi rêkami, ni¿ usychaæ z pragnienia.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_30"); //Dziewczyna chce ¿ebyœcie d³u¿ej po¿yli, bo od waszej... kondycji zale¿y te¿ i jej ¿ycie.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_31"); //Nie potrzebujê kaznodzieja. Wiem o tym, ale ¿ycie bez piwa...
	AI_Output (other, self, "DIA_Bukhart_Thief_15_32"); //W porz¹dku, us³ysza³em ju¿ wszystko, co mnie interesowa³o.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_33"); //Cholera, Korth mnie zabije.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_34"); //Pogadam z nim, mo¿e jakoœ siê dogadamy.
	AI_Output (other, self, "DIA_Bukhart_Thief_15_35"); //Ale muszê powiedzieæ Snowowi, ¿e to Twoja robota. Przemilczê tylko sprawê... motywów.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_36"); //Wiem, wiem, s³owo nie dym. Dobra, to w sumie moja wina, ¿e da³em siê dorwaæ i to jeszcze jakiemuœ ¿ó³todziobowi.
	AI_Output (self, other, "DIA_Bukhart_Thief_11_37"); //Powodzenia na szlaku.
	
   B_LogEntry		(CH2_TRL_Thief, "Znalaz³em z³odzieja. Okaza³ siê nim Bukhart. Jednak jego motywy... No nic powinienem pogadaæ z Korthem, mo¿e uda siê coœ wymyœliæ. Czas powiedzieæ Snowowi, kto okrada³ go z zapasów.");
	B_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"Start");
};

var int bukhart_price;

// **************************************************
INSTANCE DIA_Bukhart_Trol (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 3;
	condition		= DIA_Bukhart_Trol_Condition;
	information		= DIA_Bukhart_Trol_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Bukhart_Trol_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero,DIA_Tablor_Talk))
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Trol_Info()
{
	B_FullStop (hero);
	
   AI_Output (self, other, "DIA_Bukhart_Trol_11_01"); //Hej, Ty. Zaczekaj...
	
   if  (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self,	hero);
	};
		//AI_TurnToNpc (other, self);
	AI_GotoNpc(self, other);
	AI_Output (other, self, "DIA_Bukhart_Trol_15_02"); //Co chcesz? Spieszê siê...
	AI_Output (self, other, "DIA_Bukhart_Trol_11_03"); //Mam dla Ciebie pewn¹ propozycjê.
	AI_Output (other, self, "DIA_Bukhart_Trol_15_04"); //Streszczaj siê.
	
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Bukhart_Trol_11_05"); //Podobno Tablor za¿¹da³ od Ciebie jakiejœ skóry.

	if (tablor_trol== TRUE)&&(tablor_beast==FALSE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_06"); //Zgodzi³em siê przynieœæ mu skórê trolla.
	}
	else if (tablor_shadow == TRUE)&&(tablor_beast==FALSE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_07"); //Tak, zedrê dla niego skórê z cieniostwora.
	} 
	else if ((tablor_shadow == TRUE)||(tablor_trol== TRUE))&&(tablor_beast==TRUE)
	{
		AI_Output (other, self, "DIA_Bukhart_Trol_15_08"); //To ju¿ nieaktualne.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_09"); //Ujmê to tak - je¿eli chcesz, ¿ebym nie nagada³ Kirze na Twój temat jakiœ g³upot, to za³ó¿my, ¿e ta kwestia nadal jest aktualna.
	};
   
	AI_Output (other, self, "DIA_Bukhart_Trol_15_10"); //A co Tobie do tego?
	AI_Output (self, other, "DIA_Bukhart_Trol_11_11"); //Tylko to, ¿e przypadkiem mam na zbyciu skórê trolla.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_12"); //Namyœl siê. Po co siê mêczyæ, po co nara¿aæ ¿ycie, skoro mo¿esz kupiæ 'ciep³y towar' za kilka nêdznych bry³ek.
	AI_Output (other, self, "DIA_Bukhart_Trol_15_13"); //A ile ten 'ciep³y towar' kosztuje?

	if (bukhart_trait == TRUE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_14"); //Wypapla³eœ Snowowi to, co obieca³eœ zachowaæ dla siebie.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_15"); //Cholerni hipokryci p³ac¹ podwójnie - 2000 bry³ek rudy!
		
      bukhart_price = 1;
	}
	else if (bukhart_trait == FALSE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_16"); //Nie bêdê z Ciebie zdziera³, nie zdradzi³eœ Snowowi mojego sekretu.
		AI_Output (self, other, "DIA_Bukhart_Trol_11_17"); //Wystarczy 1000 bry³ek rudy, przyjacielu.
		
      bukhart_price = 2;
	}
	else //if (bukhart_trait == FALSE)&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		AI_Output (self, other, "DIA_Bukhart_Trol_11_18"); //Jak dla Ciebie niech bêdzie... 1500 bry³ek rudy.
		
      bukhart_price = 3;
	};
   
	AI_Output (other, self, "DIA_Bukhart_Trol_15_19"); //Ale z Ciebie zdzierca - muszê siê nad tym zastanowiæ.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_20"); //Przemyœl to i pamiêtaj, ¿e szepnê za Tob¹ Kirze s³odkie s³ówko do uszka tylko wtedy, jak kupisz skórê.
	AI_Output (self, other, "DIA_Bukhart_Trol_11_21"); //A teraz wracaj ju¿ do tych swoich spraw.

	Log_CreateTopic	(CH2_TRL_TrolFure, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_TrolFure, "Nie ma to jak szanta¿. Bukhart poprze mnie przed Kir¹, je¿eli kupiê od niego skórê trolla. Chyba nie mam wyboru...");
	B_StopProcessInfos (self);
};

var int Bukhart_TrollSkin;

INSTANCE DIA_Bukhart_Trol2 (C_INFO)
{
	npc				= Non_4021_Bukhart;
	nr				= 4;
	condition		= DIA_Bukhart_Trol2_Condition;
	information		= DIA_Bukhart_Trol2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Kupiê skórê trolla."; 
};

FUNC INT DIA_Bukhart_Trol2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Talk)) && (!Bukhart_TrollSkin)
	{
		return 1;
	};
};

FUNC VOID DIA_Bukhart_Trol2_Info()
{
	AI_Output (other, self, "DIA_Bukhart_Trol2_15_01"); //Kupiê skórê trolla.

	if (bukhart_price == 1)&&(NPC_HasItems(other,ItMiNugget)>=2000)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (200);
		B_GiveInvItems (other, self, ItMiNugget, 2000);
      
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_02"); //Interesy z Tob¹ to prawdziwa przyjemnoœæ.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_03"); //W tym wypadku jednostronna. Daj tê wylinia³¹ skórê i pamiêtaj, co przyrzek³eœ.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_04"); //Bez obaw, Kira dowie siê jaki to z Ciebie cudowny ch³opiec, he, he.
		
      Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure, "Za poparcie Bukharta musia³em s³ono zap³aciæ, bo a¿ 2000 bry³ek - mog³em jednak trzymaæ jêzyk za zêbami, kiedy rozmawia³em ze Snowem.");
		B_LogEntry(CH2_TRL_Quest, "Zdoby³em popracie Bukharta za 2000 bry³ek...");
	}
	else if (bukhart_price == 2)&&(NPC_HasItems(other,ItMiNugget)>=1000)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (500);
		B_GiveInvItems (other, self, ItMiNugget, 1000);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_05"); //To by³a naprawdê niska cena, zdoby³em tê skórê z nara¿eniem ¿ycia.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_06"); //Tak, oczywiœcie. Daj to futro i szepnij Kirze o mnie coœ mi³ego.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_07"); //Bez obaw, dodam kilka pikantnych szczegó³ów - nie zdziw siê, jak Kira od razu siê na Ciebie rzuci, he, he.
		Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure, "Poparcie Bukharta kosztowa³o mnie 1000 bry³ek i to tylko dziêki temu, ¿e nie zdradzi³em Snowowi jego sekretu.");
		B_LogEntry(CH2_TRL_Quest, "Bukhart szepnie Kirze o mnie kilka s³ów poparcia.");
	}
	else if (bukhart_price == 3)&&(NPC_HasItems(other,ItMiNugget)>=1500)
	{
		TH_trust = TH_trust + 1;
		Bukhart_TrollSkin = true;
		B_GiveXP (300);
		B_GiveInvItems (other, self, ItMiNugget, 1500);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_08"); //Skóra jest w dobrym stanie, ta ruda choæ po czêœci zrekompensuje mi trudy jej zdobycia.
		AI_Output (other, self, "DIA_Bukhart_Trol2_15_09"); //Bardzo mnie to cieszy - niech Kira te¿ siê o tym dowie.
		
      CreateInvItems (self, ItAt_TrollSkin,1); 	
		B_GiveInvItems (self, other, ItAt_TrollSkin, 1);
		
      AI_Output (self, other, "DIA_Bukhart_Trol2_11_10"); //O to siê nie bój, ju¿ ja wiem, co jej powiedzieæ.
		
      Log_SetTopicStatus	(CH2_TRL_TrolFure, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_TrolFure,"No có¿ 1500 bry³ek za wylinia³¹ skórê i poparcie u Kiry - Bukhart nieŸle siê ceni.");
		B_LogEntry(CH2_TRL_Quest, "Bukhart szepnie Kirze o mnie kilka s³ów poparcia.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bukhart_Trol2_11_11"); //Nie ma rudy, nie ma skóry.
	};
   
	B_StopProcessInfos (self);
};