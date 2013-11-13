
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Ancient_Exit (C_INFO)
{
	npc			= DRG_4093_Ancient;
	nr			= 999;
	condition	= DIA_Ancient_Exit_Condition;
	information	= DIA_Ancient_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Ancient_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Ancient_Exit_Info()
{
	B_StopProcessInfos	( self );
};


/**************************************************
 					Jaszczury:
DraconianScout
DraconianSolidier
DraconianOfficer
Draco1
Draco2
Draco3
					
**************************************************/


/*******************************

Pojawia siê po udanej akcji z orkami, gdy Hesstad ¿yje
******************************/



INSTANCE DIA_Ancient_First (C_INFO)
{
	npc				= DRG_4093_Ancient;
	nr				= 1;
	condition		= DIA_Ancient_First_Condition;
	information		= DIA_Ancient_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ancient_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, DIA_Hess_Orks2))
	{
		return 1;
	};


};

FUNC VOID DIA_Ancient_First_Info()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);
	B_FullStop (hero);
	AI_TurnToNpc(self, liz);

	AI_Output (self, hero, "DIA_Ancient_First_11_01"); //ODPOWIEDZIA£EM NA WASZE WEZWANIE. CO MACIE MI DO ZAOFEROWANIA?
	AI_Output (hero, self, "DIA_Ancient_First_11_02"); //Zabierz nasze nieœmiertelne dusze do... domu.
	AI_Output (self, hero, "DIA_Ancient_First_11_03"); //P£ONIE W WAS INNY OGIEÑ, TA SKAZA ZAMYKA BRAMY WIECZNEGO MIASTA PRZED TWOIMI POBRATYMCAMI, PIERWSZY MIECZU.
	AI_Output (hero, self, "DIA_Ancient_First_11_04"); //Pradawny, wróciliœmy do ¿ycia, dope³niliœmy swego przeznaczenia. Bestia nie ¿yje!
	AI_Output (self, hero, "DIA_Ancient_First_11_05"); //ALE NIE Z WASZEJ RÊKI PAD£A! JAK ŒMIESZ PRZYW£ASZCZAÆ SOBIE ZAS£UGI INNYCH!
	AI_Output (hero, self, "DIA_Ancient_First_11_06"); //To prawda, ¿e nikt z nas nie zada³ œmiertelnego ciosu. Jednak nie ustaliœmy w walce, orkowe siedliszcze sp³ynê³o krwi¹.
	AI_Output (self, hero, "DIA_Ancient_First_11_07"); //WIEM CO SIÊ WYDARZY£O, NIE UWA¯ASZ CHYBA, ¯E ZABICIE KILKU ORKÓW TO ZAS£UGA TAK WIELKA ABY DOST¥PIÆ ZASZCZYTU ¯YCIA U MEGO BOKU?
	AI_Output (hero, self, "DIA_Ancient_First_11_08"); //Uczynisz co zechcesz, Pradawny. Prosimy tylko o wyzwolenie. Mamy ju¿ doœæ walki i tu³aczki...
	AI_Output (self, hero, "DIA_Ancient_First_11_09"); //PRZEMAWIA PRZEZ CIEBIE ¯AL, DZIECKO. BYÆ MO¯E WYSTAWI£EM WAS NA ZBYT CIÊ¯K¥ PRÓBÊ...
	AI_Output (self, hero, "DIA_Ancient_First_11_10"); //BYÆ MO¯E ZBYT WIELE OCZEKIWA£EM PO TWOICH POBRATYMCACH. NIKT NIE JEST TU BEZ WINY.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Ancient_First_11_11"); //WIDZÊ WŒRÓD WAS LUDZKIE DZIECIÊ. KIM JEST TEN ŒMIERTELNIK?
	AI_Output (hero, self, "DIA_Ancient_First_11_12"); //To on zabi³ Bestiê i sprowadzi³ nas do tego œwiata. To dziêki niemu pokonaliœmy orków.
	AI_Output (self, other, "DIA_Ancient_First_11_13"); //WIELE ZAS£UG JAK NA TAK W¥T£¥ I NIEDOSKONA£¥ ISTOTÊ. PRZEMÓW, ŒMIERTELNIKU.
	AI_Output (other, self, "DIA_Ancient_First_15_14"); //To prawda. Zabi³em Bestiê i wspar³em Hesstada w walce z orkami.
	AI_Output (self, other, "DIA_Ancient_First_11_15"); //TO JU¯ WIEM. DLACZEGO TAK POST¥PI£EŒ?

	Info_ClearChoices (DIA_Ancient_First);
	Info_AddChoice (DIA_Ancient_First, "Dla w³asnej chwa³y.", DIA_Ancient_First_Me);
	Info_AddChoice (DIA_Ancient_First, "Bo tak nale¿a³o uczyniæ.", DIA_Ancient_First_Hess);
};

// ---------------------------me----------------------------------------

FUNC VOID DIA_Ancient_First_Me()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);

	AI_Output (other, self, "DIA_Ancient_First_Me_15_01"); //Dla w³asnej chwa³y.
	AI_Output (self, other, "DIA_Ancient_First_Me_11_02"); //WIELKA TO ZAS£UGA DLA WOJOWNIKA. ROZUMIEM TWOJE POBÓDKI.
	AI_Output (self, other, "DIA_Ancient_First_Me_11_03"); //PRZYJMIJ ODE MNIE DAR, KTÓRY POMO¯E CI W WALCE Z POMIOTEM BELIARA.
	
	/***************
Ork daj tu jakiegoœ fajnego pfxa + jak¹œ sta³¹, wysok¹ odpornoœæ na ogieñ, ¿eby gracz siê zastanawia³ co wybraæ.
**************/
	AI_Output (self, other, "DIA_Ancient_First_Me_11_04"); //JA, NARODZONY W OGNIU STWORZENIA B£OGOS£AWIÊ TO DZIECIÊ. OD TEJ CHWILI OGIEÑ BÊDZIE CIÊ CHRONI£ I S£U¯Y£ CI POMOC¥.
	AI_TurnToNpc(self, liz);
	AI_Output (self, other, "DIA_Ancient_First_Me_11_05"); //A WY MOJE DZIECI ODEJDZIECIE WRAZ ZE MN¥. WASZA PODRÓ¯ DOBIEG£A KOÑCA...

	/**************
w jakiœ efektowny sposób niech wszyscy znikn¹³
***************/

	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_SUCCESS);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny wraz z jaszczuroludŸmi odszed³. Hesstad w koñcu zazna spokoju. Ojciec Smoków... Kto by pomyœla³? W ka¿dym razie ta istota obdarzy³a mnie odpornoœci¹ na ogieñ.");
	B_StopProcessInfos	(self);
	
	
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");
	
	Npc_ExchangeRoutine	(liz, "GO");
	AI_Teleport  (liz, "GO");	
	B_StopProcessInfos(self);

	

};


// ---------------------------hess----------------------------------------

FUNC VOID DIA_Ancient_First_Hess()
{
	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);

	AI_Output (other, self, "DIA_Ancient_First_Hess_15_01"); //Bo tak nale¿a³o uczyniæ.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_02"); //TO SZLACHETNE S£OWA I DZIWNIE BRZMI¥ W USTACH CZ£OWIEKA.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_03"); //ALE WYCZUWAM W TOBIE PRAWOŒÆ I SZLACHETNOŒÆ GODN¥ ZRODZONEGO W OGNIU.
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_04"); //PRZYJMIJ W PODZIÊCE TÊ RUNÊ. POMO¯E CI W WALCE Z POMIOTEM BELIARA, OCHRONI CIÊ TE¯ PRZED Z£OWROG¥ MAGI¥.

	/*******************
ork niech to bêdzie runa z jakimœ unikatowym czarem + jakaœ odpornoœæ na magiê - tê runê mo¿naby do miecza te¿ wsadziæ
*******************/


	AI_TurnToNpc(self, liz);
	AI_Output (self, other, "DIA_Ancient_First_Hess_11_05"); //A WY MOJE DZIECI ODEJDZIECIE WRAZ ZE MN¥. WASZA PODRÓ¯ DOBIEG£A JU¯ KOÑCA...
	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_SUCCESS);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny wraz z jaszczuroludŸmi odszed³. Hesstad w koñcu zazna spokoju. Ojciec Smoków... Kto by pomyœla³? W ka¿dym razie ta istota podarowa³a mi potê¿n¹ runê.");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");
	
	Npc_ExchangeRoutine	(liz, "GO");
	AI_Teleport  (liz, "GO");	
	B_StopProcessInfos(self);
};




/*******************************

Pojawia siê po nieudanej akcji z orkami, w momencie kiedy hesstad ginie - czyli mo¿e triggera wstaw
******************************/



INSTANCE DIA_Ancient_Dead (C_INFO)
{
	npc				= DRG_4093_Ancient;
	nr				= 2;
	condition		= DIA_Ancient_Dead_Condition;
	information		= DIA_Ancient_Dead_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Ancient_Dead_Condition()
{

	var C_NPC liz; liz = Hlp_GetNpc(Liz_4092_Hesstad);


	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, DIA_Hess_HelpOk))&&(Npc_IsDead(liz))
	{
		return 1;
	};


};

FUNC VOID DIA_Ancient_Dead_Info()
{

	B_FullStop (hero);
	AI_Output (self, other, "DIA_Ancient_Dead_11_01"); //NIE DOTRZYMA£EŒ S£OWA, ŒMIERTELNIKU!
	AI_Output (other, self, "DIA_Ancient_Dead_15_02"); //Zrobi³em wszystko co w mojej mocy, aby pomóc Hesstadowi. 
	AI_Output (self, other, "DIA_Ancient_Dead_11_03"); //TO ZBYT MA£O! MOJE DZIECI... ZABI£EŒ ICH SWOJ¥ IGNORANCJ¥!
	AI_Output (other, self, "DIA_Ancient_Dead_15_04"); //Ja nie...
	AI_Output (self, other, "DIA_Ancient_Dead_11_05"); //TERAZ TY ODPOWIESZ ZA ICH ŒMIERÆ!

	Info_ClearChoices (DIA_Ancient_Dead);
	Info_AddChoice (DIA_Ancient_Dead, "Chêdo¿ siê przeroœniêta jaszczurko!", DIA_Ancient_Dead_Kill);
	Info_AddChoice (DIA_Ancient_Dead, "Masz racjê, zawiod³em.", DIA_Ancient_Dead_True);
	Info_AddChoice (DIA_Ancient_Dead, "Nic nie mog³em zrobiæ!", DIA_Ancient_Dead_Weak);

};

// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_Kill()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Kill_15_01"); //Chêdo¿ siê przeroœniêta jaszczurko!
	AI_Output (self, other, "DIA_Ancient_Dead_Kill_11_02"); //ARGH! JAK ŒMIESZ NÊDZNY ŒMIERTELNIKU!
	AI_Output (self, other, "DIA_Ancient_Dead_Kill_11_03"); //UNU¯AM TWÓJ ŒWIAT W OGNIU, A TWOJ¥ DUSZÊ ROZERWÊ NA STRZÊPY...

	/*********************
ork daj jakiœ fajny pfx, niech jaszczuroludzie i orkowie sp³on¹ tak samo dick. jakby ci siê chcia³o i jak siê da to mo¿na zrobiæ szybki najazd na SO i NO, które te¿ ton¹ w ogniu
***********************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawdê wœciek³ siê za œmieræ Hesstada. Mog³em daæ z siebie wiêcej...");
	B_StopProcessInfos	(self);

};


// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_Weak()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Weak_15_01"); //Nic nie mog³em zrobiæ!
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_02"); //WIÊC JAK ZDO£A£EŒ ZG£ADZIÆ BESTIÊ?
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_03"); //£¯ESZ ŒMIERTELNIKU!
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_04"); //NIE ZABIJÊ CIÊ, ALE NAZNACZÊ CIÊ TAK ABYŒ ZAPAMIÊTA£ CZYM JEST GNIEW OJCA SMOKÓW!

	/*********************
ork daj jakiœ fajny pfx, niech jaszczuroludzie i orkowie sp³on¹. a dicka niech smok ude¿y kul¹ ognia, dick pada na kolana + zmiana tekstury twarzy na tak¹ popa¿on¹ + ujemny bonus do obra¿eñ od ognia mo¿e ze 20
***********************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawdê wœciek³ siê za œmieræ Hesstada. Naznaczy³ mnie ogniem. Mog³em daæ z siebie wiêcej...");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");	
	
	B_StopProcessInfos	(self);

};


// -------------------------------------------------------------------

FUNC VOID DIA_Ancient_Dead_True()
{
	AI_Output (other, self, "DIA_Ancient_Dead_Weak_15_01"); //Masz racjê, zawiod³em.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_02"); //DOBRZE, ¯E ROZUMIESZ SWÓJ B£¥D. NIESTETY TO ¯YCIA MYM DZIECIOM NIE PRZYWRÓCI.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_03"); //JEDNAK ZAPAMIÊTAJ, ¯E OJCIEC SMOKÓW JEST SPRAWIEDLIWYM SÊDZI¥.
	AI_Output (self, other, "DIA_Ancient_Dead_Weak_11_04"); //POZWOLÊ CI ODEJŒÆ, ABYŒ MÓG£ NAPRAWIÆ Z£O KTÓRE UCZYNI£EŒ...

	/**************
standardowo jaszczurki i orkowie gin¹, smok znika, a dickowi nic siê nie dzieje.
**************/


	Log_SetTopicStatus	(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry		(CH5_NON_Lizard, "Pradawny naprawdê wœciek³ siê za œmieræ Hesstada. Pradawny póœci³ mnie wolno. Mog³em daæ z siebie wiêcej...");
	
	Npc_ExchangeRoutine	(self, "GO");
	AI_Teleport  (self, "GO");	
	
	
	B_StopProcessInfos	(self);

};








