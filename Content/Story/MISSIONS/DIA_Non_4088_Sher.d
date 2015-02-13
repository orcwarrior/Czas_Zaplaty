
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Sher_Exit (C_INFO)
{
	npc			= Non_4088_Sher;
	nr			= 999;
	condition	= DIA_Sher_Exit_Condition;
	information	= DIA_Sher_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sher_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Sher_Exit_Info()
{
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Sher_GoAway (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 1;
	condition		= DIA_Sher_GoAway_Condition;
	information		= DIA_Sher_GoAway_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Sher_GoAway_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 2000)&&(!Npc_KnowsInfo (hero, DIA_Carlos_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_GoAway_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Sher_GoAway_11_01"); //Nie wiem jak siê tu dosta³eœ, ale nie powinno Ciê tutaj byæ.
	AI_Output (other, self, "DIA_Sher_GoAway_15_02"); //Zaczekaj...
	AI_Output (self, other, "DIA_Sher_GoAway_11_03"); //Robiê to dla twojego dobra, ch³opcze.
	AI_Output (self, other, "DIA_Sher_GoAway_11_04"); //Kiedyœ mi za to podziêkujesz...

	B_StopProcessInfos(self);

	/**************
	Wypad z kopalni, nie ma wstêpu przed odpowiednim w¹tkiem fabularnym xD
	*************/

	AI_GotoWP(hero, "FM_02");
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Sher_First (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 2;
	condition		= DIA_Sher_First_Condition;
	information		= DIA_Sher_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Sher_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Carlos_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
   
	if (Npc_KnowsInfo (hero, DIA_Sher_GoAway))
	{
		AI_Output (self, other, "DIA_Sher_First_11_01"); //To znowu Ty...
	};
   
	AI_Output (self, other, "DIA_Sher_First_11_02"); //Kolejny szczêœliwy skazaniec mog¹cy popracowaæ ku chwale i majêtnoœci Gomeza.
	AI_Output (other, self, "DIA_Sher_First_15_03"); //A co Tobie do tego?
	AI_Output (self, other, "DIA_Sher_First_11_04"); //Cynizm i duma to czêsto strony tej samej monety.
	
   var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
	
   if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Sher_First_11_05"); //Komu siê narazi³eœ?
		AI_Output (other, self, "DIA_Sher_First_15_06"); //To znaczy?
		AI_Output (self, other, "DIA_Sher_First_11_07"); //Nosisz pancerz stra¿nika.
		AI_Output (other, self, "DIA_Sher_First_15_08"); //To d³uga historia, a ja nie mam czasu na nudne opowieœci.
	};
	
   AI_Output (other, self, "DIA_Sher_First_15_02"); //Szukam Torlofa. Znasz go?
	AI_Output (self, other, "DIA_Sher_First_11_09"); //Znam, to w³aœnie on poleci³ mi witaæ nowych. Podobno mam do tego wrodzony dar...
	AI_Output (other, self, "DIA_Sher_First_15_10"); //Skoro tak twierdzisz. Gdzie go znajdê?
	AI_Output (self, other, "DIA_Sher_First_11_11"); //IdŸ dalej, nie sposób go nie zauwa¿yæ. Krzyczy najg³oœniej z ca³ej ho³oty.
	AI_Output (other, self, "DIA_Sher_First_15_12"); //Dziêki za radê.
	AI_Output (self, other, "DIA_Sher_First_11_13"); //Zaczekaj. Gdybyœ potrzebowa³ pomocy, to daj mi znaæ.
	AI_Output (other, self, "DIA_Sher_First_15_14"); //Bêdê o tym pamiêta³. Bywaj.
	
   B_LogEntry		(CH4_GRD_NewMine, "Pierwsz¹ osob¹, któr¹ spotka³em w kopalni by³ nijaki Sher. Mimo podejrzanego wygl¹du wywar³ na mnie dobre wra¿enie. Torlofa znajdê w g³êbi, podobno krzyczy najg³oœniej z ca³ej ho³oty, he, he.");
	B_StopProcessInfos	(self);

	/***************
	Wraca do rutyny kopania rudy - MUSI kopaæ gdzieœ w pobli¿u torlofa, góra 10m od niego
	**************/
	Npc_ExchangeRoutine(self,"GO");

	/***************
	Zmiana rutyny czy tam teleport carlosa, niech ju¿ bêdzie tam gdzie trzeba go póŸniej szukaæ i oczywiœcie hp = 0.
	**************/
};

// **************************************************

INSTANCE DIA_Sher_Hlp (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 3;
	condition		= DIA_Sher_Hlp_Condition;
	information		= DIA_Sher_Hlp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebujê Twojej pomocy."; 
};

FUNC INT DIA_Sher_Hlp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_Hlp))
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_Hlp_Info()
{
	AI_Output (other, self, "DIA_Sher_Hlp_15_01"); //Potrzebujê Twojej pomocy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_02"); //Co siê sta³o?
	AI_Output (other, self, "DIA_Sher_Hlp_15_03"); //Bêdê z tob¹ szczery. Przyby³em tu, aby nak³oniæ Torlofa do przy³¹czenia siê...
	AI_Output (self, other, "DIA_Sher_Hlp_11_04"); //Wiem po co tu przyby³eœ, piracie.
	AI_Output (other, self, "DIA_Sher_Hlp_15_05"); //Przecie¿ nikt z kopalni nie wie o tym kim kiedyœ by³em.
	AI_Output (self, other, "DIA_Sher_Hlp_11_06"); //Zdradzi³ Ciê chód. Z regu³y zwyczajnych marynarzy nie wtr¹caj¹ do Kolonii wiêc zaryzykowa³em stwierdzenie, ¿e jesteœ korsarzem. Jak widaæ trafne.
	AI_Output (other, self, "DIA_Sher_Hlp_15_07"); //Powiedzmy, ¿e Ci wierzê. Powiedz mi co taki cwaniak jak Ty robi w Kolonii, do tego wal¹c kilofem w bry³ê rudy?
	AI_Output (self, other, "DIA_Sher_Hlp_11_08"); //To samo co i Ty, poszukujê odpowiedzi. Wiêcej wiedzieæ nie musisz.
	AI_Output (other, self, "DIA_Sher_Hlp_15_09"); //Wspomnia³eœ coœ o pomocy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_10"); //W rzeczy samej. S³ucham wiêc, w czym tkwi problem.
	AI_Output (other, self, "DIA_Sher_Hlp_15_11"); //Torlof pomo¿e mi wydostaæ siê z kopalni je¿eli zdo³am przekonaæ kilku skazañców do bardziej wytê¿onej pracy.
	AI_Output (self, other, "DIA_Sher_Hlp_11_12"); //Niech zgadnê - Cipher, Homer i Butch?
	AI_Output (other, self, "DIA_Sher_Hlp_15_13"); //Cholera, jak Ty to robisz?!
	AI_Output (self, other, "DIA_Sher_Hlp_11_14"); //To proste, spêdzi³em w kopalni szmat czasu, do tego staram siê widzieæ, a nie tylko patrzeæ.
	AI_Output (self, other, "DIA_Sher_Hlp_11_15"); //£atwo wtedy dostrzec kto siê obija zamiast pracowaæ i z kim Torlof ma najwiêcej problemów.
	AI_Output (self, other, "DIA_Sher_Hlp_11_16"); //Obserwowa³em ka¿dego z tej trójki i wydaje mi siê, ¿e mogê Ci pomóc.
	AI_Output (other, self, "DIA_Sher_Hlp_15_17"); //Zamieniam siê w s³uch.
	AI_Output (self, other, "DIA_Sher_Hlp_11_18"); //Zacznijmy od Butcha. Tutaj wystarczy kilka inwektyw i têgie ciêgi. Tylko go nie zabij, wystarczy, ¿e poczuje smak w³asnej krwi.
	AI_Output (other, self, "DIA_Sher_Hlp_15_19"); //A pozostali?
	AI_Output (self, other, "DIA_Sher_Hlp_11_20"); //Homer to sentymentalny g³upiec. Nie ma dnia ¿eby nie opowiada³ o wspania³ej tamie, któr¹ sam zaprojektowa³.
	AI_Output (self, other, "DIA_Sher_Hlp_11_21"); //Trafisz do niego zachwalaj¹c tê budowlê, zasugeruj, ¿e tylko walka pozwoli mu wznieœæ kolejne dzie³o.
	AI_Output (self, other, "DIA_Sher_Hlp_11_22"); //A ¿eby walczyæ, najpierw trzeba trochê popracowaæ. Myœlê, ¿e to wystarczy.
	AI_Output (other, self, "DIA_Sher_Hlp_15_23"); //Zosta³ jeszcze Cipher.
	AI_Output (self, other, "DIA_Sher_Hlp_11_24"); //To akurat najmniejszy problem. Cipher sprzeda³by w³asn¹ matkê za paczkê ziela.
	
   if (NPC_HasItems(other,ItMiJoint_1)>=1)||(NPC_HasItems(other,ItMiJoint_2)>=1)||(NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		AI_Output (other, self, "DIA_Sher_Hlp_15_25"); //Na szczêœcie mam coœ co powinno przypaœæ mu do gustu.
	}
	else
	{
		AI_Output (other, self, "DIA_Sher_Hlp_15_26"); //Cholera, nie mam ¿adnego zielska.
		AI_Output (self, other, "DIA_Sher_Hlp_11_27"); //Masz szczêœcie. Chowa³em to na specjaln¹ okazjê, ale Tobie bardziej siê przyda. Bierz.
      
      CreateInvItems (self,ItMiJoint_3,1);
		B_GiveInvItems (self, other, ItMiJoint_3, 1);
      
      AI_Output (other, self, "DIA_Sher_Hlp_15_28"); //Dziêki, Sher.
	};
	
   AI_Output (self, other, "DIA_Sher_Hlp_11_29"); //To ju¿ chyba wszystko, ch³opcze.
	AI_Output (other, self, "DIA_Sher_Hlp_15_30"); //Dlaczego mi pomagasz?
	AI_Output (self, other, "DIA_Sher_Hlp_11_31"); //A dlaczego nie?
	
   AI_TurnToNpc(self, other);
	Ai_Wait (self,1);
	
   AI_Output (self, other, "DIA_Sher_Hlp_11_32"); //Powiedzmy, ¿e dostrzegam w Tobie coœ wiêcej ni¿ tylko zimne wyrachowanie wilka morskiego.
	AI_Output (self, other, "DIA_Sher_Hlp_11_33"); //¯ycie up³ywa w strugach gówna, przyjacielu. Czasami warto coœ zrobiæ ¿eby komuœ mniej... œmierdzia³o.
	AI_Output (other, self, "DIA_Sher_Hlp_15_34"); //Zapamiêtam to. Bywaj.
	AI_Output (self, other, "DIA_Sher_Hlp_11_35"); //Powodzenia, piracie.
	
   B_LogEntry		(CH4_GRD_NewMine, "Rozmowa z Sherem sporo mi pomog³a. Butcha wystarczy obiæ, Cipher zrobi wszystko za dobre zielsko a Homer ma bzika na punkcie tamy, któr¹ zaprojektowa³. Zobaczymy na ile zdadz¹ siê rady tego przem¹drza³ego kopacza.");
};

// **************************************************

INSTANCE DIA_Sher_HlpAfter (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 4;
	condition		= DIA_Sher_HlpAfter_Condition;
	information		= DIA_Sher_HlpAfter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uda³o siê, wszyscy zaczêli pracowaæ!"; 
};

FUNC INT DIA_Sher_HlpAfter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&(miners_work == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_HlpAfter_Info()
{
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_01"); //Uda³o siê, wszyscy zaczêli pracowaæ!
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_02"); //Cieszê siê, ¿e mog³em pomóc.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_03"); //To Twoja zas³uga!
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_04"); //Ja tylko wskaza³em Ci odpowiedni¹ drogê.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_05"); //Jakoœ siê odwdziêczê, przyjacielu.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_06"); //Wystarczy, ¿e nadal bêdziesz wybiera³ w³aœciwy kierunek.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_07"); //Kto wie, mo¿e spotkamy siê w lepszych czasach.
	AI_Output (other, self, "DIA_Sher_HlpAfter_15_08"); //By³bym rad. Bywaj, Sher.
	AI_Output (self, other, "DIA_Sher_HlpAfter_11_09"); //Powodzenia, Rick.
	
   B_LogEntry		(CH4_GRD_NewMine, "Wskazówki Shera bardzo mi pomog³y. Odnios³em wra¿enie, ¿e ten dziwny skazaniec mia³ jakiœ ukryty cel w tym aby mi pomóc.");
};

// **************************************************

INSTANCE DIA_Sher_End (C_INFO)
{
	npc				= Non_4088_Sher;
	nr				= 5;
	condition		= DIA_Sher_End_Condition;
	information		= DIA_Sher_End_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Sher_End_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jurgen_Second))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Sher_End_Info()
{
	var C_NPC jur; jur = Hlp_GetNpc(Grd_4090_Jurgen);
	B_FullStop (hero);
	AI_TurnToNpc(self, hero);
   
	AI_Output (self, hero, "DIA_Sher_End_11_00"); //Staæ!
	AI_Output (self, hero, "DIA_Sher_End_11_01"); //WeŸcie mnie zamiast jego.
	AI_Output (other, self, "DIA_Sher_End_15_02"); //Nie rób tego!
	AI_Output (self, hero, "DIA_Sher_End_11_03"); //To mój wybór ch³opcze.
	AI_Output (self, hero, "DIA_Sher_End_11_04"); //Poza tym to równie dobre miejsce na zakoñczenie wêdrówki, jak ka¿de inne.
	AI_Output (self, hero, "DIA_Sher_End_11_05"); //Zapamiêtaj przyjacielu, ¿e to nie cel podró¿y kszta³tuje ludzk¹ duszê, ale droga, która do niego zmierza. 
	AI_Output (self, hero, "DIA_Sher_End_11_06"); //To nasze wybory staj¹ siê œwiadectwem tego co po nas zostanie.
	AI_Output (other, self, "DIA_Sher_End_15_07"); //Dlaczego to robisz?
	AI_Output (self, hero, "DIA_Sher_End_11_08"); //Powiedzmy, ¿e mam przeczucie, ¿e dziêki tobie sporo siê tu zmieni na lepsze.
	
   AI_TurnToNpc(self, jur);
	AI_TurnToNpc(jur, hero);
	
   AI_Output (self, hero, "DIA_Sher_End_11_12"); //Na co czekasz Jurgen? Tylko zrób to jak nale¿y, od jednego ciêcia.
	
   B_StopProcessInfos(self);
};
