// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Kim jesteœ?";
};                       

FUNC int DIA_Lester_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Lester_Hallo1_05_01"); //Nazywam siê Lester. Co za ból... Moja g³owa...
	AI_Output (self, other,"DIA_Lester_Hallo1_05_02"); //Wybacz, jestem bardzo zmêczony.
};

// **************************************************

instance DIA_Lester_Beast (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  2;
	condition		=  DIA_Lester_Beast_Condition;
	information		=  DIA_Lester_Beast_Info;
	important		=  0;
	permanent		=  0;
	description		= "Podobno wróci³eœ z bagien.";
};                       

FUNC int DIA_Lester_Beast_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))&&(Npc_KnowsInfo(hero,DIA_Leren_Beast))
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_Beast_Info()
{
	AI_Output (other, self,"DIA_Lester_Beast_15_00"); //Podobno wróci³eœ z bagien.
	AI_Output (self, other,"DIA_Lester_Beast_05_01"); //Tak, to nie by³a przyjemna wyprawa.
	AI_Output (other, self,"DIA_Lester_Beast_15_02"); //Co tam siê dzieje?
	AI_Output (self, other,"DIA_Lester_Beast_05_03"); //To prawdziwy koszmar, nie sposób tego opisaæ s³owami.
	AI_Output (self, other,"DIA_Lester_Beast_05_04"); //Kiedy wróci³em z wyprawy poszukuj¹cej Cor Kaloma, nie uwierzy³em w³asnym oczom...
	AI_Output (self, other,"DIA_Lester_Beast_05_05"); //Moi przyjaciele, ludzie, których zna³em od lat zamienili siê w nieumar³e istoty. Ca³e bagno zamieni³o siê w koszmarn¹ nekropoliê.
	AI_Output (self, other,"DIA_Lester_Beast_05_06"); //Jednak to co spotka³em w g³êbi moczarów...
	AI_Output (self, other,"DIA_Lester_Beast_05_07"); //Do tej pory czujê zimny dreszcz na plecach... Te oczy... Zdawa³o siê, ¿e samym spojrzeniem wydziera mi duszê z trzewi!
	AI_Output (self, other,"DIA_Lester_Beast_05_08"); //Nigdy w ¿yciu tak szybko nie ucieka³em jak wtedy. I nikomu przy zdrowych zmys³ach nie radzi³bym zapuszczaæ siê na bagna.
	AI_Output (other, self,"DIA_Lester_Beast_15_09"); //Nie mam wyboru, muszê zg³adziæ bestiê i wyrwaæ jej serce.
	AI_Output (self, other,"DIA_Lester_Beast_05_10"); //Czyœ Ty oszala³? Jesteœ jakimœ... sekciarzem?!
	AI_Output (other, self,"DIA_Lester_Beast_15_11"); //I kto to mówi? Ja przynajmniej nie wyznajê Œni¹cego.
	AI_Output (self, other,"DIA_Lester_Beast_05_12"); //To Twój wybór, nie mój. Jak chcesz do³¹czyæ do armii zombie, to proszê bardzo, droga wolna.
	AI_Output (other, self,"DIA_Lester_Beast_15_13"); //Sêk w tym, ¿e w³aœnie nie mam zamiaru nigdzie do³¹czaæ. A ju¿ na pewno nie do zgrai nieumar³ych sekciarzy. Oczywiœcie bez obrazy...
	AI_Output (self, other,"DIA_Lester_Beast_05_14"); //W porz¹dku. Jestem trochê zmêczony...
	AI_Output (self, other,"DIA_Lester_Beast_05_15"); //Mo¿e œmieræ Bestii uwolni umêczone dusze moich braci?
	AI_Output (self, other,"DIA_Lester_Beast_05_16"); //Hmm. Byæ mo¿e mamy wspólny cel. Ale ¿eby zabiæ bestiê najpierw musimy poznaæ jej s³aby punkt.
	AI_Output (other, self,"DIA_Lester_Beast_15_17"); //Co masz na myœli?
	AI_Output (self, other,"DIA_Lester_Beast_05_18"); //Wypal ten... dar. To niezwykle mocny, halucynogenny narkotyk. Ziele pomo¿e Ci ujrzeæ prawdziw¹ naturê Bestii i byæ mo¿e uka¿e Ci s³aby punkt potwora.
	AI_Output (other, self,"DIA_Lester_Beast_15_19"); //Sam sobie wypal to paskudztwo!
	AI_Output (self, other,"DIA_Lester_Beast_05_20"); //Zrobi³bym to, ale na mnie narkotyk ju¿ nie dzia³a. Zbyt czêsto u¿ywa³em go w przesz³oœci.
	AI_Output (self, other,"DIA_Lester_Beast_05_21"); //Oto ziele. Do Ciebie nale¿y wybór. Wróæ do mnie, jak dowiesz siê czegoœ wiêcej.

	CreateInvItems (self,ItMiJoint_Lester,1);
	B_GiveInvItems (self, other, ItMiJoint_Lester, 1);

	B_LogEntry(CH4_RBL_Beast, "Lester powiedzia³ mi, ¿e dopiero po jego powrocie bagno przerodzi³o siê w koszmarn¹ nekropoliê. Lester twierdzi, ¿e narkotyk, który mi podarowa³ pozwoli mi poznaæ prawdê o Bestii. No nic, wybór nale¿y do mnie. Muszê spróbowaæ...");
};

// **************************************************

instance DIA_Lester_Joint (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  3;
	condition		=  DIA_Lester_Joint_Condition;
	information		=  DIA_Lester_Joint_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_Joint_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Beast))&&(Dream_finished)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_Joint_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Lester_Joint_05_01"); //Mêtne spojrzenie... Przykurcz twarzy... Wypali³eœ ziele!
	AI_Output (other, self,"DIA_Lester_Joint_15_02"); //Tak jakoœ wysz³o.
	AI_Output (self, other,"DIA_Lester_Joint_05_03"); //Nie s¹dzi³em, ¿e siê na to odwa¿ysz. Nikt jeszcze tego nie prze¿y³... A przynajmniej nikt kogo zna³em.
	AI_Output (other, self,"DIA_Lester_Joint_15_04"); //Co?!
	AI_Output (self, other,"DIA_Lester_Joint_05_05"); //To by³o jedyne wyjœcie. Narkotyk jest bardzo silny i naprawdê ukazuje to jak zaradziæ z³u. Ale jakoœ jeszcze nikt nie zdo³a³ o tym opowiedzieæ.
	AI_Output (other, self,"DIA_Lester_Joint_15_06"); //Mog³em przez Ciebie zgin¹æ!
	AI_Output (self, other,"DIA_Lester_Joint_05_07"); //Wiem, ale gotów by³em na takie poœwiêcenie. Dziêki Tobie Bestia zostanie zniszczona!
	AI_Output (other, self,"DIA_Lester_Joint_15_08"); //A co gdybym nie prze¿y³? Jakbyœ siê wtedy dowiedzia³, co nale¿y uczyniæ, aby zabiæ potwora z bagien?
	AI_Output (self, other,"DIA_Lester_Joint_05_09"); //Poszuka³bym innego... ochotnika.
	AI_Output (other, self,"DIA_Lester_Joint_15_10"); //Niech Ciê szlag, Lester!
	AI_Output (self, other,"DIA_Lester_Joint_05_11"); //Zostawmy przesz³oœæ za sob¹, nie ma sensu rozgrzebywaæ zasz³oœci.
	AI_Output (self, other,"DIA_Lester_Joint_05_12"); //Co zobaczy³eœ?
	AI_Output (other, self,"DIA_Lester_Joint_15_13"); //To akurat zachowam dla siebie.
	AI_Output (self, other,"DIA_Lester_Joint_05_14"); //Nie mo¿esz...
	AI_Output (other, self,"DIA_Lester_Joint_15_15"); //Ale¿ mogê. Ty tak lekce szafowa³eœ moim ¿yciem, to ja teraz wystawiê na próbê Twoj¹ ciekawoœæ. To i tak niska cena, powinienem jeszcze coœ Ci obci¹æ w ramach rekompensaty.
	AI_Output (self, other,"DIA_Lester_Joint_05_16"); //Dobra ju¿, dobra. Nie chowam urazy. Porozmawiamy kiedy... och³oniesz.
	B_LogEntry(CH4_RBL_Beast, "Okaza³o siê, ¿e jak zwykle mia³em wiêcej szczêœcia ni¿ rozumu. Jeszcze nikt nie prze¿y³ wypalenia tego narkotyku. Muszê zacz¹æ wystrzegaæ siê skazañców nios¹cych dary...");
};

// **************************************************

instance DIA_Lester_Join(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  3;
	condition		=  DIA_Lester_Join_Condition;
	information		=  DIA_Lester_Join_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_Join_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_FanaticTeacher))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Join_Info()
{
	var C_NPC bal; bal = Hlp_GetNpc(Gur_1203_BaalTondral);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Join_05_01"); //Nie tak szybko! Idê z wami. Chcê na w³asne oczy zobaczyæ, jak Bestia ginie.
	AI_Output (other, self,"DIA_Lester_Join_15_02"); //Ja na Twoim miejscu wybra³bym inny rodzaj samobójstwa, ale jak tam sobie chcesz. Ruszamy!
	AI_TurnToNpc(other, bal);
	AI_Output (other, self,"DIA_Lester_Join_15_03"); //ProwadŸ, Baalu!
	AI_PlayAni(bal,"T_YES");
	B_LogEntry		(CH4_RBL_Beast, "Do wyprawy na Bestiê do³¹czy³ Lester.");
	B_StopProcessInfos	(self);

	/********************
Ork bal prowadzi, lester pod¹¿a za dickiem. To fallow niech bêzie a¿ do œwi¹tyni gdzie jest Bestia

********************************/

	Party_AddNpc(bal);
	Npc_ExchangeRoutine	(bal, "Guide");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

// **************************************************

instance  DIA_Lester_Comment(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  4;
	condition		=  DIA_Lester_Comment_Condition;
	information		=  DIA_Lester_Comment_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Comment_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_Swamp))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Comment_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Comment_05_01"); //Nie s¹dzi³em, ¿e jakiegokolwiek Baala staæ na takie poœwiêcenie.
	AI_Output (other, self,"DIA_Lester_Comment_15_02"); //S³abo znasz siê na ludziach, Lester.
	AI_Output (self, other,"DIA_Lester_Comment_05_03"); //Byæ mo¿e, ale Tondral wydaje siê nieobecny duchem... Powinniœmy pozwoliæ mu pójœæ przodem, skoro i tak szuka œmierci.
	AI_Output (other, self,"DIA_Lester_Comment_15_04"); //To ostro¿noœæ czy tchórzostwo przez Ciebie przemawia?
	AI_Output (self, other,"DIA_Lester_Comment_05_05"); //Jedno i drugie. Nie b¹dŸ idiot¹. Nie chcê zostaæ bohaterem, bo oni najczêœciej koñcz¹ w paszczach koszmarnych Bestii.
	AI_Output (self, other,"DIA_Lester_Comment_05_06"); //A to zdaje siê Twoja rola w tym dramacie.
	AI_Output (other, self,"DIA_Lester_Comment_15_07"); //Przestañ gadaæ i zabijmy kilka zombie!
	AI_Output (self, other,"DIA_Lester_Comment_05_08"); //Mówisz o moich przyjacio³ach!
	AI_Output (other, self,"DIA_Lester_Comment_15_09"); //Jakbyœ nie zauwa¿y³ oni s¹ martwi i zdaje siê, ¿e niezbyt za nami przepadaj¹. Idziesz czy zostajesz?
	AI_Output (self, other,"DIA_Lester_Comment_05_10"); //Idê, do cholery!
	AI_Output (other, self,"DIA_Lester_Comment_15_11"); //Wiêc zamknij gêbê i zrób po¿ytek z tego, co masz przy pasie!
	B_LogEntry(CH4_RBL_Beast, "Lester zdecydowanie za du¿o gada!");
   
   B_StopProcessInfos	(self);
   Npc_ExchangeRoutine(self, "FollowToTemple");
};

// **************************************************

instance  DIA_Lester_Butcher(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  5;
	condition		=  DIA_Lester_Butcher_Condition;
	information		=  DIA_Lester_Butcher_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Butcher_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_End))&&(Npc_GetDistToNpc(self,hero) < 1000) && Npc_IsDead(tondral)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Butcher_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Lester_Butcher_05_01"); //Cholerny g³upiec, zgin¹³ zanim dopad³ Bestiê. Co teraz zrobimy?
	AI_Output (other, self,"DIA_Lester_Butcher_15_02"); //Musimy sami za³atwiæ potwora.
	AI_Output (self, other,"DIA_Lester_Butcher_05_03"); //Hmm. Tondral wypi³ ca³¹ truciznê. Skoro kr¹¿y³a w jego ¿y³ach, to musimy wyci¹æ z niego kawa³ek i nakarmiæ nim potwora.
	AI_Output (other, self,"DIA_Lester_Butcher_15_04"); //To makabryczny pomys³, ale chyba nie ma innego rozwi¹zania. Wytnij mu serce.
	AI_Output (self, other,"DIA_Lester_Butcher_05_05"); //Dlaczego ja?! Nie jestem rzeŸnikiem!
	AI_Output (other, self,"DIA_Lester_Butcher_15_06"); //To Twój pomys³. Ja tu poczekam.
	AI_Output (self, other,"DIA_Lester_Butcher_05_07"); //Niech Ciê szlag trafi, piracie!
	AI_Output (self, other,"DIA_Lester_Butcher_05_08"); //Dobra, ale karmiæ Bestiê bêdziesz sam!
	B_StopProcessInfos	(self);
   
   Lester_butcher = true;
	/************************
	Lester podchodzi do martwego Baala pochyla siê i niby wycina serce, a potem czeka na dicka
	************************/
};

// **************************************************

instance  DIA_Lester_Heart(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  6;
	condition		=  DIA_Lester_Heart_Condition;
	information		=  DIA_Lester_Heart_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Heart_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Butcher))&&(Npc_GetDistToWP (self,"PSI_TEMPLE_IN_1") < 1500 ) && (!Lester_butcher)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Heart_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_Heart_05_01"); //Zrobione. Teraz Twoja kolej. Wepchnij serce Tondrala w gard³o Bestii!
	CreateInvItems (self,baal_heart,1);
	B_GiveInvItems (self, other, baal_heart, 1);
	B_LogEntry		(CH4_RBL_Beast, "Muszê 'nakarmiæ' Bestiê sercem Baala. Po prostu œwietnie...");
	B_StopProcessInfos	(self);

	/***********************

Ork:
1. Lester oddaje serce dickowi.
2. Razem wchodz¹ do œwi¹tyni.
3. Dorób kraty, niech opadn¹ jak ch³opaki wejd¹.
4. Wtedy Bestia zwróci siê w ich stronê i zainicjuje siê kolejny dialog.

	************************/
   wld_insertNPC(MonsterOfSwamp, "PSI_TEMPLE_ROOMS_IN_02");
   
	AI_GotoWP(self, "PSI_TEMPLE_IN");
	AI_GotoWP(other, "PSI_TEMPLE_IN");
};

// **************************************************

instance DIA_Lester_HeartThrow(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  7;
	condition		=  DIA_Lester_HeartThrow_Condition;
	information		=  DIA_Lester_HeartThrow_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int DIA_Lester_HeartThrow_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Heart))&&(Npc_GetDistToWP (self,"PSI_TEMPLE_IN") < 1500 )
   &&(NPC_HasItems(other,baal_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Lester_HeartThrow_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_01"); //Rzucaj do cholery!
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_02"); //O kurwa, co za bydlê!
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_03"); //Rzucaj!

	/****************

Ork jakaœ animacja rzucania, mo¿e strzelanie z kuszy bez kuszy?
**************************/
   NPC_RemoveInvItem(other, baal_heart);
   
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_04"); //I co teraz?
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_05"); //Uciekamy!
	AI_Output (other, self, "DIA_Lester_HeartThrow_15_06"); //Ale gdzie?
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_07"); //Tam!
	AI_TurnToNpc(self, beast);
	AI_Output (self, other,"DIA_Lester_HeartThrow_05_08"); //Prywatne komnaty Y'Beriona. Musimy do nich dotrzeæ, zanim Bestia siê na nas rzuci.
	B_StopProcessInfos	(self);

	/***********************

Ork:
Ch³opaki niech wymin¹ Bestiê i niech siê chowaj¹ w tych komnatach
Zrezygnowa³em z tego manewru z klatk¹ aragorna bo to trochê naci¹gane no i pewnie nie ³atwe do zrobienia. Poza tym w œwi¹tyni nigdy nie by³o klatek na Cieniostwory xD

ALe jak chcesz mo¿esz zrobiæ to po aragornowemu, tu masz opis.

- bestia jest oczywiœcie nieœmiertelna, szybsza od nas i ogólnie nie mamy ¿adnych szans, oprócz jednej rzecz jasna. Tu¿ obok nas znajduje siê dŸwignia zamykaj¹ca klatkê. U¿ywamy jej po czym wbiegamy pod klatkê wraz z lesterem który za nami pod¹¿a, bestia próbuje nas ze¿reæ ale nie mo¿e pokonaæ przeszkody, po jakimœ czasie zaczyna powoli odchodziæ

	************************/

	AI_GotoWP(self, "PSI_TEMPLE_ROOMS_IN_02");
	AI_GotoWP(other, "PSI_TEMPLE_ROOMS_IN_02");
   
   AI_Teleport(MonsterOfSwamp, "PSI_TEMPLE_IN_05");
};

// **************************************************

instance  DIA_Lester_Fight(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  8;
	condition		=  DIA_Lester_Fight_Condition;
	information		=  DIA_Lester_Fight_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_Fight_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_HeartThrow))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Fight_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_Fight_05_01"); //Trucizna chyba ju¿ zaczyna dzia³aæ.
	AI_Output (other, self, "DIA_Lester_Fight_15_02"); //Nie bêdê siê tu wiêcej chowa³, czas nakopaæ temu stworowi do nieumar³ego dupska!
	AI_Output (self, other,"DIA_Lester_Fight_05_03"); //Ekhm... Bêdê tu¿ za tob¹.
	B_LogEntry		(CH4_RBL_Beast, "Trucizna ju¿ dzia³a, ale musimy sami zabiæ Bestiê. Nie mogê zapomnieæ o wyciêciu serca!");
	
   self.flags = NPC_FLAG_IMMORTAL;
	B_ClearImmortal(beast);
   Npc_ChangeAttribute	(beast, ATR_HITPOINTS, -beast.attribute[ATR_HITPOINTS_MAX]/2);

	B_StopProcessInfos	(self);

	/***********************

Ork:
CH³opaki wychodz¹ i adzia xD
Bestia niech ju¿ nie bêdzie nieœmiertelna i hp tez jej zmniejszy³em musz¹ sobie poradziæ, ale walka MUSI byæ naprawdê trudna.

	************************/

	AI_GotoWP(self, "FIGHT");
	AI_GotoWP(other, "FIGHT");
};

// **************************************************

instance  DIA_Lester_FightEnd(C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  9;
	condition		=  DIA_Lester_FightEnd_Condition;
	information		=  DIA_Lester_FightEnd_Info;
	important		=  1;
	permanent		=  0;
	description		= "";
};                       

FUNC int  DIA_Lester_FightEnd_Condition()
{
	if (Npc_IsDead(beast))&&(Npc_KnowsInfo(hero,DIA_Lester_Fight))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,beast_heart)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_FightEnd_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Lester_FightEnd_05_01"); //Bestia nie ¿yje! Dokonaliœmy tego.
	AI_Output (other, self, "DIA_Lester_FightEnd_15_02"); //Nie by³o ³atwo, ale poœwiêcenie Tondrala nie posz³o na marne.
	AI_Output (self, other,"DIA_Lester_FightEnd_05_03"); //To prawda. 
	AI_Output (self, other,"DIA_Lester_FightEnd_05_04"); //Na razie nasze drogi musz¹ siê rozejœæ. Mam sporo do przemyœlenia.
	AI_Output (self, other,"DIA_Lester_FightEnd_05_05"); //Muszê dowiedzieæ siê co knuje Cor Kalom. Ale to ju¿ nie twój problem, Rick.
	AI_Output (other, self, "DIA_Lester_FightEnd_15_06"); //Bywaj Lester i powodzenia w tym co zamierzasz.

	/****************

Ork otwórz bramê w tym dialogu, chyba, ¿e wolisz po œmierci bestii triggerem.
*****************************/

	Log_SetTopicStatus(CH4_RBL_Beast, LOG_SUCCESS);
	B_LogEntry(CH4_RBL_Beast, "Bestia nie ¿yje, a ja wyci¹³em jej serce. Czas znowu porozmawiaæ z Lerenem.");
	B_LogEntry(CH4_RBL_Rirual, "Zdoby³em serce Bestii. Muszê porozmawiaæ z Lerenem.");
	B_StopProcessInfos(self);

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "STAY");

	/*******************
Niech Lester tu zostanie i poczyta ksiêgi w komnatach Yberiona
***********************/

	/**************************
Niech siê gdzieœ pojawi Nekro w takim miejscu, ¿eby Dick nie móg³ go omin¹æ.
************************/
   wld_insertNPC(DMB_1703_NecroInWorld, "PSI_TEMPLE_IN_1");
   AI_Teleport(necro_in_world, "PSI_TEMPLE_IN_1");
	B_ExchangeRoutine	(necro_in_world, "AfterDeadsBeast");
	// Ork: Wylaczam motyw walki z bossem
   BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
};
