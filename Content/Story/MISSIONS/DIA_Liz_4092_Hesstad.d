// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hess_Exit (C_INFO)
{
	npc			= Liz_4092_Hesstad;
	nr			= 999;
	condition	= DIA_Hess_Exit_Condition;
	information	= DIA_Hess_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hess_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hess_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int liz_questions;

INSTANCE DIA_Hess_First (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 1;
	condition		= DIA_Hess_First_Condition;
	information		= DIA_Hess_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_First_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Appear))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_First_11_01"); //Uwolni³eœ nas...
	AI_Output (other, self, "DIA_Hess_First_15_02"); //Nieœwiadomie. Sk¹d znasz ludzk¹ mowê?
	AI_Output (self, other, "DIA_Hess_First_11_03"); //Moje s³owa rozbrzmiewaj¹ w Twojej g³owie. Potrafiê te¿ odczytaæ twe myœli...
	AI_Output (self, other, "DIA_Hess_First_11_04"); //Waleczne w Tobie serce bije. Moi bracia s¹ Ci wdziêczni za wyzwolenie.
	AI_Output (other, self, "DIA_Hess_First_15_05"); //Zabi³em Bestiê, ale nie wiedzia³em, ¿e uwolniê coœ wiêcej ni¿ zniewolone dusze. Jak to siê sta³o, ¿e przybraliœcie materialn¹ postaæ?
	AI_Output (self, other, "DIA_Hess_First_11_06"); //Ci¹¿y na nas przekleñstwo szaleñstwa lub jak niektórzy twierdz¹, g³upoty. 
	AI_Output (self, other, "DIA_Hess_First_11_07"); //Przed bitw¹ wszyscy z³o¿yliœmy œluby krwi i na w³asne dusze przysiêgliœmy, ¿e nie spoczniemy, dopóki nie wyplenimy zaka³y tych ziem - orków.
	AI_Output (other, self, "DIA_Hess_First_15_08"); //Nie obraŸ siê, ale myœla³em, ¿e orkowie i wy s³u¿ycie temu samemu w³adcy.
	AI_Output (self, other, "DIA_Hess_First_11_09"); //Tylko nasi s³abi bracia ulegli namowom Beliara. Tych, których tu widzisz nasi potomkowie nazywali staro¿ytnymi.
	AI_Output (self, other, "DIA_Hess_First_11_10"); //Narodziliœmy siê z jaja Pradawnego, w czasach gdy bogowie st¹pali jeszcze wœród œmiertelników.
	B_LogEntry(CH5_NON_Lizard, "Nastêpstwem rytua³u okaza³o siê tak¿e uwolnienie jaszczuroludzi. Ciekawe dlaczego wrócili?");
};

// **************************************************

INSTANCE DIA_Hess_Born (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 2;
	condition		= DIA_Hess_Born_Condition;
	information		= DIA_Hess_Born_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jest Pradawny?"; 
};

FUNC INT DIA_Hess_Born_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Born_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Born_15_01"); //Kim jest Pradawny?
	AI_Output (self, other, "DIA_Hess_Born_11_02"); //To Pierwszy ze Smoków, nasz Ojciec i Bóg.
	AI_Output (self, other, "DIA_Hess_Born_11_03"); //To Pradawny wskrzesi³ do ¿ycia zapomnian¹ rasê jaszczuroludzi. Niestety byliœmy tylko cieniem naszych wielkich przodków, niegodnymi zaszczytów Smoczego Rodu.
	AI_Output (self, other, "DIA_Hess_Born_11_04"); //Pradawny porzuci³ nas... To dla nas najwiêksza hañba. Staliœmy siê dzieæmi niegodnymi ojca.
	AI_Output (self, other, "DIA_Hess_Born_11_05"); //Dlatego przez ca³e ¿ycie staraliœmy siê udowodniæ, ¿e Pradawny siê myli³.
	AI_Output (self, other, "DIA_Hess_Born_11_06"); //Wszystko co uczyniliœmy, zrobiliœmy ku jego chwale.
	AI_Output (self, other, "DIA_Hess_Born_11_07"); //Mo¿e jeszcze kiedyœ spojrzy na nas ³askawszym okiem...
	B_LogEntry(CH5_NON_Lizard, "Ojcem jaszczuroludzi jest Pradawny, Pierwszy Spoœród Smoków. Mimo, i¿ porzuci³ jaszczuroludzi ci nadal oddaj¹ mu bosk¹ czeœæ.");
};

// **************************************************

INSTANCE DIA_Hess_Ancesor (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 12;
	condition		= DIA_Hess_Ancesor_Condition;
	information		= DIA_Hess_Ancesor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak to cieniem przodków?"; 
};

FUNC INT DIA_Hess_Ancesor_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Born ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Ancesor_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Ancesor_15_01"); //Jak to cieniem przodków?
	AI_Output (self, other, "DIA_Hess_Ancesor_11_02"); //U zarania dziejów, jeszcze zanim narodzi³ siê ludzki ród, a tak¿e wasi bogowie na tych ziemiach ¿y³y tylko smoki i jaszczuroludzie.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_03"); //Jednak nasi przodkowie byli du¿o potê¿niejsi ni¿ jakakolwiek z dwuno¿nych ras rozumnych.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_04"); //¯yli ze smokami w symbiozie i przyjaŸni, dopóki nie rozpêta³a siê Wojna Ognia.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_05"); //Nikt dok³adnie nie pamiêta, kto zdradzi³ pierwszy, smoki, czy nasi przodkowie.
	AI_Output (self, other, "DIA_Hess_Ancesor_11_06"); //Wojna trwa³a setki lat, a¿ doprowadzi³a do ca³kowitej zag³ady naszych ansesorów.
};

// **************************************************

INSTANCE DIA_Hess_Left (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 13;
	condition		= DIA_Hess_Left_Condition;
	information		= DIA_Hess_Left_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dlaczego Pradawny was porzuci³?"; 
};

FUNC INT DIA_Hess_Left_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Born ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Left_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Left_15_01"); //Dlaczego Pradawny was porzuci³?
	AI_Output (self, other, "DIA_Hess_Left_11_02"); //Ojciec Smoków, wskrzeszaj¹c nasz¹ rasê, chcia³ odpokutowaæ winy swego rodu, które doprowadzi³y do zag³ady jaszczuroludzi w Wojnie Ognia.
	AI_Output (self, other, "DIA_Hess_Left_11_03"); //Niestety okazaliœmy siê zaledwie cieniem naszych ansesorów. Pradawny uzna³ nas za prymitywn¹ rasê, niegodn¹ dost¹pienia zaszczytu zg³êbiania potêgi naszych przodków.
	AI_Output (self, other, "DIA_Hess_Left_11_04"); //Jednak zanim odszed³, powiedzia³, ¿e droga, któr¹ wybierzemy mo¿e zaprowadziæ nas do kolebki narodzin.
	AI_Output (self, other, "DIA_Hess_Left_11_05"); //Niestety wiêkszoœæ z nas zaczê³o kierowaæ siê nienawiœci¹, co od razu wykorzysta³ Beliar.
	AI_Output (self, other, "DIA_Hess_Left_11_06"); //Ci jaszczuroludzie s³u¿¹ Panu Ciemnoœci i s¹ skazani na wieczne potêpienie.
	AI_Output (self, other, "DIA_Hess_Left_11_07"); //Garstka wybra³a drogê walki o w³asne przeznaczenie. Udowodnimy Pradawnemu, ¿e niew³aœciwie nas os¹dzi³!
	AI_Output (self, other, "DIA_Hess_Left_11_08"); //A wtedy staniemy siê godnymi, aby powróciæ na dziedzinê naszych ojców.

	B_LogEntry(CH5_NON_Lizard, "Jaszczuroludzie chc¹ udowodniæ Pradawnemu, ¿e s¹ godni chwa³y swych ojców.");
};

// **************************************************

INSTANCE DIA_Hess_Ancient (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 3;
	condition		= DIA_Hess_Ancient_Condition;
	information		= DIA_Hess_Ancient_Info;
	permanent		= 0;
	important		= 0;
	description		= "Staro¿ytni?"; 
};

FUNC INT DIA_Hess_Ancient_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Ancient_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Ancient_15_01"); //Staro¿ytni?
	AI_Output (self, other, "DIA_Hess_Ancient_11_02"); //Kieruj¹ nami inne pobudki, mamy cel, który musimy osi¹gn¹æ!
	AI_Output (self, other, "DIA_Hess_Ancient_11_03"); //Nasi zdegenerowani bracia s³u¿¹ Beliarowi i uosabiaj¹ wszystko, z czym tak zaciekle walczymy.
	AI_Output (self, other, "DIA_Hess_Ancient_11_04"); //To w nas narodzi siê ponownie chwa³a naszych ojców.
};

// **************************************************

INSTANCE DIA_Hess_Course (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 4;
	condition		= DIA_Hess_Course_Condition;
	information		= DIA_Hess_Course_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak chcecie pozbyæ siê wp³ywu kl¹twy?"; 
};

FUNC INT DIA_Hess_Course_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First ))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Course_Info()
{
	liz_questions = liz_questions + 1;
	AI_Output (other, self, "DIA_Hess_Course_15_01"); //Jak chcecie pozbyæ siê wp³ywu kl¹twy?
	AI_Output (self, other, "DIA_Hess_Course_11_02"); //¯yjemy po to by walczyæ ze s³ugami Beliara.
	AI_Output (self, other, "DIA_Hess_Course_11_03"); //Pan Ciemnoœci przyzwa³ Bestiê, aby sta³a siê nasz¹ zag³ad¹. Jednak dziêki Tobie i mocy Pradawnego znów ¿yjemy.
	AI_Output (self, other, "DIA_Hess_Course_11_04"); //Nadejdzie dzieñ, gdy zgnieciemy ca³y pomiot Beliara!
	B_LogEntry(CH5_NON_Lizard, "Ci jaszczuroludzie s¹ zaciek³ymi wrogami Beliara.");
};

// **************************************************

INSTANCE DIA_Hess_Kill (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 5;
	condition		= DIA_Hess_Kill_Condition;
	information		= DIA_Hess_Kill_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobry jaszczur, to martwy jaszczur!"; 
};

FUNC INT DIA_Hess_Kill_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First)) && (!Npc_KnowsInfo (hero, DIA_Hess_HelpOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Kill_Info()
{
	AI_Output (other, self, "DIA_Hess_Kill_15_00"); //Dobry jaszczur, to martwy jaszczur!
	AI_Output (self, other, "DIA_Hess_Kill_11_01"); //Nie tak ³atwo nas zabiæ, cz³owieku. Jednak skoro taka Twa wola...

	/**************

   Ork zmieñ tutaj nastawienie na wrogie wszystkim przywo³anym jaszczurkom
   *********************/

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);

	Log_SetTopicStatus(CH5_NON_Lizard, LOG_FAILED);
	B_LogEntry(CH5_NON_Lizard, "Nigdy nie lubi³em jaszczurek. Zrobiê sobie z nich porz¹dne buty!");
};

INSTANCE DIA_Hess_Help(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 10;
	condition		= DIA_Hess_Help_Condition;
	information		= DIA_Hess_Help_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_First))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Help_11_01"); //Zaczekaj cz³owieku! Mimo, ¿e nieœwiadomie to wiele dobrego dla nas uczyni³eœ.
	AI_Output (other, self, "DIA_Hess_Help_15_02"); //Jakoœ bêdê musia³ z tym ¿yæ...
	AI_Output (self, other, "DIA_Hess_Help_11_03"); //Mimo, i¿ honor i duma wzbraniaj¹ siê przed tymi s³owami muszê poprosiæ Ciê o jeszcze jedn¹ przys³ugê.
	AI_Output (other, self, "DIA_Hess_Help_15_04"); //A dlaczego mia³bym wam pomóc? Sk¹d pomys³, ¿e jestem zainteresowany waszym losem?
	
   if (liz_questions >1)&&(liz_questions <=5)
	{
		AI_Output (self, other, "DIA_Hess_Help_11_05"); //Zada³eœ wiele pytañ, na które uzyska³eœ szczere odpowiedzi. 
		AI_Output (self, other, "DIA_Hess_Help_11_06"); //Wiem, ¿e to niewiele, ale pozna³eœ nasz¹ tragiczn¹ historiê.
		AI_Output (self, other, "DIA_Hess_Help_11_07"); //Je¿eli zechcesz, mo¿esz nam pomóc napisaæ jej zakoñczenie.
	}
	else
	{
		AI_Output (self, other, "DIA_Hess_Help_11_08"); //Mimo, i¿ nie interesuje Ciê nasz los, wyczuwam w Tobie serce wojownika.
		AI_Output (self, other, "DIA_Hess_Help_11_09"); //Nasze ¿ycie to ci¹g³a walka. Je¿eli zechcesz stan¹æ u naszego boku, byæ mo¿e zdo³amy zakoñczyæ œmierteln¹ tu³aczkê.
	};	
   
	AI_Output (self, other, "DIA_Hess_Help_11_10"); //Jaka bêdzie Twoja odpowiedŸ?
	AI_Output (other, self, "DIA_Hess_Help_15_11"); //Zastanowiê siê...
	
   B_LogEntry(CH5_NON_Lizard, "Hesstad poprosi³ mnie o pomoc w walce. Domyœlam siê, ¿e ich celem s¹ orkowie. Sam nie wiem, czy powinienem wpl¹tywaæ siê w kolejn¹ sprawê, która mnie nie dotyczy...");
};

INSTANCE DIA_Hess_HelpOk (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 20;
	condition		= DIA_Hess_HelpOk_Condition;
	information		= DIA_Hess_HelpOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Stanê u Waszego boku."; 
};

FUNC INT DIA_Hess_HelpOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help))
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_HelpOk_Info()
{
	AI_Output (other, self, "DIA_Hess_HelpOk_15_01"); //Stanê u Waszego boku.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_02"); //To dla nas wielki zaszczyt. Nie trwoñmy jednak czasu na s³owa.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_03"); //Czujê, ¿e Pradawny nas obserwuje. Œmieræ Bestii musia³a zwróciæ jego uwagê, a wiêc i nasze powtórne narodziny.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_04"); //To nasza ostatnia szansa na udowodnienie swej wartoœci.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_05"); //Wiem, ¿e na tej wyspie znajduje siê œwi¹tynia Beliara, jednak nie ona jest naszym celem.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_06"); //Jaszczuroludzie unurzaj¹ tê krainê w krwi orków! Zabijemy pomiot Beliara, który obozuje przed œwi¹tyni¹.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_07"); //To szaleñstwo! To ogromny obóz, dobrze obwarowany o liczebnoœci orków nawet nie wspomnê.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_08"); //Dla nas nie ma innej drogi. Zgodzi³eœ siê stan¹æ u naszego boku w tej walce.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_09"); //Cholera, wiedzia³em, ¿e coœ tu œmierdzi. No dobra, jaki masz plan?
	AI_Output (self, other, "DIA_Hess_HelpOk_11_10"); //Pójdziemy tam i zabijemy wszystkich orków.
	AI_Output (other, self, "DIA_Hess_HelpOk_15_11"); //Hmm, widzê, ¿e d³ugo nad tym rozmyœla³eœ...
	AI_Output (self, other, "DIA_Hess_HelpOk_11_12"); //Jednak naszym g³ównym celem bêd¹ orkowi dowódcy. Je¿eli zabijemy ich wszystkich ³¹cznie z genera³em to wystarczy, aby zasiaæ w ich szeregach chaos.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_13"); //Wtedy nie bêd¹ ju¿ groŸni.
	AI_Output (self, other, "DIA_Hess_HelpOk_11_14"); //Ruszajmy do boju!
	AI_Output (other, self, "DIA_Hess_HelpOk_15_15"); //A jeœli zginiesz? Co wtedy zrobi Pradawny?
	AI_Output (self, other, "DIA_Hess_HelpOk_11_16"); //Nie sposób tego przewidzieæ. To staro¿ytna istota. Byæ mo¿e spopieli tê krainê by przypieczêtowaæ nasz¹ pora¿kê. W ka¿dym razie kiedyœ ju¿ tak uczyni³...
	AI_Output (other, self, "DIA_Hess_HelpOk_15_17"); //To œwietnie. W takim razie bêdê pilnowa³ twoich pleców. 
	
   B_LogEntry(CH5_NON_Lizard, "Zgodzi³em siê pomóc jaszczuroludziom w ich walce i ju¿ zaczynam tego ¿a³owaæ.");

	Log_CreateTopic(CH5_NON_OrCHunting, LOG_MISSION);
	Log_SetTopicStatus(CH5_NON_OrCHunting, LOG_RUNNING);
	B_LogEntry(CH5_NON_OrCHunting, "Hesstad ma œwietny plan - wyr¿n¹æ ca³y obóz orków! No nic, skoro ju¿ da³em s³owo, nie bêdê go cofa³. Na szczêœcie wystarczy 'tylko' wyr¿n¹æ wszystkich dowódców i genera³a co w sumie wychodzi na to samo, bo aby siê do nich dostaæ musimy przebiæ siê przez orkowy obóz. Aha - Hesstad nie mo¿e zgin¹æ, bo wtedy ten ich Pradawny mo¿e urz¹dziæ w Kolonii niez³y bajzel.");
	
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self, "GD1");
	
	Wld_InsertNpc(OrcGen1, "ORC_GEN12");
	Wld_InsertNpc(OrcElite1, "ORC_ELITE_TRAIN1");	
	Wld_InsertNpc(OrcElite1, "ORC_ELITE_TRAIN2");
	
	Wld_InsertNpc(OrcGen2, "ORC_GENERAL11");
	Wld_InsertNpc(OrcGen3, "OW_ORC_SHAMAN_ROOM2");
	
	Wld_InsertNpc(OrcElder, "ORC_ELDER");
	Wld_InsertNpc(OrcElite1, "ORK_ELITE1");	
	Wld_InsertNpc(OrcElite1, "ORK_ELITE2");	
};

INSTANCE DIA_Hess_Help1(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help1_Condition;
	information		= DIA_Hess_Help1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help))&&(Npc_GetDistToWP(self,"OW_ORC_PATH") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help1_11_01"); //Przyb¹dŸcie wojownicy, czas przelaæ orkow¹ krew!

	Npc_ExchangeRoutine(self, "GD2");	
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH");

	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH");
	
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH");
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help11(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help11_Condition;
	information		= DIA_Hess_Help11_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help11_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help1))&&(Npc_GetDistToWP(self,"OW_ORC_PATH_06_1") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help11_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_11_01"); //Wzywam was bracia, stañcie u mego boku!

	Npc_ExchangeRoutine(self, "GD3");
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_1");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH_06_1");
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help111(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help111_Condition;
	information		= DIA_Hess_Help111_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help111_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help11))&&(Npc_GetDistToWP(self,"OW_ORC_PATH_06_10") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help111_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_111_01"); //Odpowiedzcie na zew ognia!

	Npc_ExchangeRoutine(self, "GD4");
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_PATH_06_10");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_PATH_06_10");
		
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Help1111(C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 11;
	condition		= DIA_Hess_Help1111_Condition;
	information		= DIA_Hess_Help1111_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Help1111_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help111))&&(Npc_GetDistToWP(self,"OW_ORC_BOSS2") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Help1111_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_Output (self, other, "DIA_Hess_Help11_1111_01"); //Czas na ostateczn¹ walkê! Do mnie bracia!

	Npc_ExchangeRoutine(self, "GD5");	
	
	Wld_InsertNpc(DraconianScout, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianScout, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianSolidier, "OW_ORC_BOSS2");
	Wld_InsertNpc(DraconianOfficer, "OW_ORC_BOSS2");	
	
	B_StopProcessInfos(self);	
};	

INSTANCE DIA_Hess_Orks (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 21;
	condition		= DIA_Hess_Orks_Condition;
	information		= DIA_Hess_Orks_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Orks_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Help1111))&&(Npc_GetDistToNpc(self,hero) < 1500)
 	&& (Npc_IsDead(OrcGen1))&&(Npc_IsDead(OrcGen2))&&(Npc_IsDead(OrcGen3))&&(Npc_IsDead(OrcElder))
	{
      return 1;
	};
};

FUNC VOID DIA_Hess_Orks_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks_11_01"); //Uda³o siê! G³owy hydry zosta³y odciête!
	AI_Output (other, self, "DIA_Hess_Orks_15_02"); //Nie by³o ³atwo...
	AI_Output (self, other, "DIA_Hess_Orks_11_03"); //Wielkie czyny wymagaj¹ wielkich poœwiêceñ.
	AI_Output (self, other, "DIA_Hess_Orks_11_04"); //Czas oddaæ pok³on Pradawnemu.	
	AI_Output (self, other, "DIA_Hess_Orks_11_05"); //Znajdziesz mnie tam œmiertelniku gdzie wszystko siê zaczê³o.

	Log_SetTopicStatus(CH5_NON_OrCHunting, LOG_SUCCESS);
	B_LogEntry(CH5_NON_OrCHunting, "Uda³o siê, orkowie gryz¹ ziemiê. Hesstad powiedzia³, ¿e znajdê go tam gdzie wszystko siê zaczê³o. W¹tpiê w istnienie tego ich Ojca Smoków, ale kto wie...");

	/******************
Niech wszystkie ¿ywe jaszczurki udaj¹ siê do krêgu tam siê przeprowadzi mod³y
*******************/

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "START");
	B_StopProcessInfos(self);
	AI_Teleport(self, "START");
};

INSTANCE DIA_Hess_Orks2 (C_INFO)
{
	npc				= Liz_4092_Hesstad;
	nr				= 22;
	condition		= DIA_Hess_Orks2_Condition;
	information		= DIA_Hess_Orks2_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hess_Orks2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hess_Orks))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID DIA_Hess_Orks2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(hero, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks2_11_01"); //Krew wrze w mych ¿y³ach, w koñcu doczekaliœmy tej chwili...
	AI_Output (other, self, "DIA_Hess_Orks2_15_02"); //Obyœ siê nie myli³.

	/***********
Niech Hess i reszta jaszczurów odwróc¹ siê w stronê miejsca gdzie pojawi siê Pradawny, gdzieœ w pobli¿u krêgu, ¿eby by³o dla niego miejsce.
Ork wiem, ¿e jest animacja klêczenie, jakby siê da³o to niech wszystkie jaszczurki padn¹ na kolana
************************/
	AI_AlignToWP(self);
	AI_Output (self, other, "DIA_Hess_Orks2_11_03"); //Ojcze ognia, spójrz na swe dzieci!
	AI_Output (self, other, "DIA_Hess_Orks2_11_04"); //Okupiliœmy s³aboœæ w³asn¹ krwi¹ i ¿yciem braci. Nasza droga zakoñczy³a siê przed przepaœci¹... 
	AI_Output (self, other, "DIA_Hess_Orks2_11_05"); //Umarliœmy, aby narodziæ siê na nowo, pozwól nam przez ostateczn¹ œmieræ wróciæ do domu.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hess_Orks2_11_06"); //Dokona³o siê.

	B_LogEntry(CH5_NON_Lizard, "Niech mnie licho, oni naprawdê przywo³ali smoka!");

	/**************************
Ork po dialogu powinien pojawiæ siê w fajny sposób wielki i paskudny smok, który zagada do Dicka, jego instancja to DRG_4093_Ancient

****************************/
	B_StopProcessInfos(self);
	Wld_InsertNpc(DRG_4093_Ancient, "PSI_TELEPORT");
}; 
