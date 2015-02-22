var int hero_is_in_kevin_room_ontime;
func int Kevin_Door()
{
	// 	if(hero_is_in_kevin_room_ontime==1)&&(Npc_IsPlayer(self))
	// 	{
	// 		return 0;
	// 	}
	// 	else
	// 	{
	return 1;
	//	};
};
func int Kevin_Touch_Func()
{
	if(hero_is_in_kevin_room_ontime!=2)//&&(Npc_KnowsInfo(hero,DIA_Urt_ShadowSucess))
	{
		hero_is_in_kevin_room_ontime = TRUE;
	};
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Urt_Exit (C_INFO)
{
	npc			= RBL_4062_Urt;
	nr			= 999;
	condition	= DIA_Urt_Exit_Condition;
	information	= DIA_Urt_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Urt_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Urt_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Urt_Hello (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 1;
	condition		= DIA_Urt_Hello_Condition;
	information		= DIA_Urt_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Urt_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_RATFORD_OldCampSpy))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Hello_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other, "DIA_Urt_Hello_11_00"); //Stój, gdzie leziesz?!
	AI_Output (other, self, "DIA_Urt_Hello_15_01"); //Ty jesteœ Urt? Ratford powiedzia³, ¿e mogê od Ciebie dostaæ wdzianko stra¿nika.
	AI_Output (self, other, "DIA_Urt_Hello_11_02"); //A po cholerê Ci ten pancerz?
	AI_Output (other, self, "DIA_Urt_Hello_15_03"); //Zg³osi³em siê na 'ochotnika', ¿eby pomyszkowaæ w Starym Obozie.
	AI_Output (self, other, "DIA_Urt_Hello_11_04"); //To mi³o by³o Ciê poznaæ, bo ju¿ jesteœ trupem.
	AI_Output (other, self, "DIA_Urt_Hello_15_05"); //Nie potrzebujê wnikliwej analizy sytuacji, tylko zbroi.
	AI_Output (self, other, "DIA_Urt_Hello_11_06"); //W koñcu to Twoje ¿ycie. WeŸ tê, œlady krwi ju¿ prawie zasch³y.
	AI_Output (self, other, "DIA_Urt_Hello_11_07"); //WyobraŸ sobie, ¿e dureñ, który wczeœniej nosi³ ten pancerz schla³ siê i spad³ z palisady. Chyba nawet nikt nie zauwa¿y³ tej straty.
	AI_Output (other, self, "DIA_Urt_Hello_15_08"); //Dostanê pancerz czy najpierw zagadasz mnie na œmieræ?
	AI_Output (self, other, "DIA_Urt_Hello_11_09"); //Bierz ³achmany i powodzenia, bo bêdziesz go potrzebowa³.
	
	CreateInvItem(self, GRD_ARMOR_L);
	B_GiveInvItems(self, other, GRD_ARMOR_L, 1);
	AI_EquipArmor(other, GRD_ARMOR_L);
   
	AI_Output (other, self, "DIA_Urt_Hello_15_10"); //Dziêki... Ale ta zbroja cuchnie!
	AI_Output (self, other, "DIA_Urt_Hello_11_11"); //Dam Ci dobr¹ radê. Staraj siê nie rzucaæ w oczy.
	AI_Output (self, other, "DIA_Urt_Hello_11_12"); //Stra¿nicy doœæ dobrze siê znaj¹. 
	AI_Output (self, other, "DIA_Urt_Hello_11_13"); //Z obozu wychodz¹ tylko ci, którzy wype³niaj¹ konkretne rozkazy, najczêœciej wydawane przez Gomeza, albo Kruka.
	AI_Output (self, other, "DIA_Urt_Hello_11_14"); //Skontaktuj siê z naszym cz³owiekiem, tylko tak bêdziesz móg³ wyjœæ ¿ywy z obozu.
	AI_Output (self, other, "DIA_Urt_Hello_11_15"); //Byæ mo¿e jeszcze siê spotkamy...

	B_LogEntry(CH3_RBL_OldCampSpy, "Mam ju¿ zbrojê stra¿nika.");
   B_equipment_to_OC();
   
	B_StopProcessInfos(self);

	/***************************
	Koleœ ma iœæ do obozu ale najpierw przebraæ siê w pancerz no i stra¿nicy nie powinno go atakowaæ
	****************************/

	Npc_ExchangeRoutine(self,"OC");
	
	Wld_InsertNpc(Grd_214_Torwache,"OC1");//Nordtor			
	Wld_InsertNpc(Grd_215_Torwache,"OC1");//Nordtor 	
	/***********************
	Dick_guild_changer();

	Ork trzebaby tutaj chyba zmieniæ jakoœ gildiê dickowi, czy coœ. Znaczy wraz ze zmian¹ pancerza, ¿eby stra¿nicy go nie t³ukli.
	************************/
};

// **************************************************

INSTANCE DIA_Urt_Again (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 2;
	condition		= DIA_Urt_Again_Condition;
	information		= DIA_Urt_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Urt_Again_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grd_215_First))&&(Npc_KnowsInfo(hero,DIA_Urt_Hello ))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Again_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Again_11_00"); //A jednak uda³o Ci siê wejœæ! Jestem pod wra¿eniem!
	AI_Output (other, self, "DIA_Urt_Again_15_01"); //Jak siê tu dosta³eœ?
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Urt_Again_11_02"); //Podobnie jak Ty, udajê stra¿nika. Próbujê te¿ zorganizowaæ z Kelvinem niespodziankê dla Gomeza.
	AI_Output (other, self, "DIA_Urt_Again_15_03"); //Co to za niespodzianka?
	AI_Output (self, other, "DIA_Urt_Again_11_04"); //Wszystkiego dowiesz siê w swoim czasie. Teraz mam dla Ciebie coœ do zrobienia.
	AI_Output (other, self, "DIA_Urt_Again_15_05"); //Chwileczkê. Ratford wys³a³ mnie tylko po to, ¿ebym spotka³ siê z Kelvinem.
	AI_Output (self, other, "DIA_Urt_Again_11_06"); //Wiem, ale Kevin przebywa w zamku, a Ty nie dostaniesz siê tak po prostu do twierdzy.
	AI_Output (other, self, "DIA_Urt_Again_15_07"); //Wiêc pomó¿ mi, na pewno wiesz jak to zrobiæ.
	AI_Output (self, other, "DIA_Urt_Again_11_08"); //Jasne, ale zanim ja pomogê Tobie, Ty musisz pomóc mi.
	AI_Output (self, other, "DIA_Urt_Again_11_09"); //I zanim zaczniesz siê wykrêcaæ, pamiêtaj dla kogo oboje pracujemy.
	AI_Output (other, self, "DIA_Urt_Again_15_10"); //Mów o co chodzi.
	AI_Output (self, other, "DIA_Urt_Again_11_11"); //Stra¿nicy magazynuj¹ w obozie zapasy broni. Musimy przej¹æ te paczki.
	AI_Output (other, self, "DIA_Urt_Again_15_12"); //A jak ja mam niby to zrobiæ?!
	AI_Output (self, other, "DIA_Urt_Again_11_13"); //To ju¿ Twoje zmartwienie. Z tego co wiem czêœæ paczek przechowuj¹ w magazynie nieopodal areny, resztê chyba gdzieœ na targowisku.
	AI_Output (self, other, "DIA_Urt_Again_11_14"); //Przynieœ mi wszystko co tam znajdziesz, myœlê, ¿e powinno byæ z dziesiêæ paczek.
	AI_Output (self, other, "DIA_Urt_Again_11_15"); //Wtedy dowiesz siê co dalej.
	AI_Output (self, other, "DIA_Urt_Again_11_16"); //Wybacz te podchody, ale najpierw muszê byæ pewien, ¿e podo³asz temu co nas czeka.
	AI_Output (self, other, "DIA_Urt_Again_11_17"); //Kiedy ju¿ zdobêdziesz paczki, znajdziesz mnie w pobli¿u tego miejsca.
	AI_Output (self, other, "DIA_Urt_Again_11_19"); //Powodzenia.
	Log_CreateTopic	(CH3_RBL_Weapon, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Weapon, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Weapon, "Muszê zdobyæ dla Urta paczki z broni¹, któr¹ stra¿nicy magazynuj¹ w obozie. Mo¿e ich byæ oko³o dziesiêciu. Z informacji Urta wynika ze paczki znajduj¹ siê w magazynach przy arenie i targowisku. Kiedy ju¿ zdobêdê wszystkie paczki, znajdê go w pobli¿u miejsca gdzie go spotka³em w obozie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Kelvin jest w zamku do którego nie mam wstêpu. Urt, jego wspólnik w obozie, pomo¿e mi do niego dotrzeæ. Jednak najpierw muszê pomóc Urtowi.");	
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"OC2");
};

/**************************************************/

INSTANCE DIA_Urt_Packages (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 3;
	condition		= DIA_Urt_Packages_Condition;
	information		= DIA_Urt_Packages_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam wszystkie paczki."; 
};

FUNC INT DIA_Urt_Packages_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_Again ))&&(NPC_HasItems(other,packageOC)>=10)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Packages_Info()
{
	B_GiveXP(500);
	AI_Output (other, self, "DIA_Urt_Packages_15_01"); //Mam wszystkie paczki.
	AI_Output (self, other, "DIA_Urt_Packages_11_02"); //Wiedzia³em, ¿e sobie poradzisz. Strata broni os³abi stra¿ników podwójnie.
	AI_Output (self, other, "DIA_Urt_Packages_11_03"); //Po pierwsze, czêœæ z nich w decyduj¹cym momencie bêdzie musia³a walczyæ pogrzebaczami. A druga sprawa to morale. Kiedy dowiedz¹ siê, ¿e ktoœ zwin¹³ broñ z obozu pod ich nosem poczuj¹ siê mniej pewnie.
	AI_Output (self, other, "DIA_Urt_Packages_11_04"); //Naprawdê œwietna robota.
	B_GiveInvItems (other, self, packageOC, 10);
	Npc_RemoveInvItems(self,packageOC,10);
	//NOTE: Crappy dialog modified by orc
	
	AI_Output (other, self, "DIA_Urt_Packages_15_05"); //Nie wydaje Ci siê, ¿e jak siê zorientuj¹, ¿e zapasy zniknê³y to ich tylko rozsierdzi i za wszelk¹ cenê bêd¹ szukaæ sprawcy?
	AI_Output (self, other, "DIA_Urt_Packages_11_06"); //I dobrze, ten kto dzia³a w gniewie pope³nia b³êdy. Nie znajd¹ nas, jesteœmy na to za cwani.
	AI_Output (self, other, "DIA_Urt_Packages_11_07"); //Da³eœ sobie œwietnie radê, ale to jeszcze nie koniec.
	AI_Output (self, other, "DIA_Urt_Packages_11_08"); //Musimy stworzyæ solidne podwaliny rebelii.
	AI_Output (other, self, "DIA_Urt_Packages_15_09"); //Nie masz chyba zamiaru agitowaæ stra¿ników do przejœcia na nasz¹ stronê?
	AI_Output (self, other, "DIA_Urt_Packages_11_10"); //Nie o stra¿nikach mówiê. S¹ tutaj inne gildie, których nie docenia ¿adna ze stron - cienie i kopacze.
	AI_Output (other, self, "DIA_Urt_Packages_15_11"); //Hmm, to mo¿e siê udaæ. Ale jak zamierzasz ich przekonaæ do walki po naszej stronie?
	AI_Output (self, other, "DIA_Urt_Packages_11_12"); //Cienie po odejœciu Diego i tak s¹ na bakier ze stra¿nikami. W zasadzie wojna wisi na w³osku. Cieniom brak jednak przywódcy, który przekona ich do walki, kogoœ komu ufaj¹.
	AI_Output (other, self, "DIA_Urt_Packages_15_13"); //A kopacze?
	AI_Output (self, other, "DIA_Urt_Packages_11_14"); //Ci maj¹ doœæ wszystkiego. Ka¿dy nimi pomiata. Wystarczy sprawiæ, ¿eby poczuli siê jak ludzie, a zerw¹ okowy i wbij¹ kilofy w plecy stra¿ników.
	AI_Output (self, other, "DIA_Urt_Packages_11_15"); //T¹ czêœci¹ zadania mia³ siê zaj¹æ Kelvin. Ja muszê jeszcze ukryæ paczki z broni¹ i za³atwiæ kilka spraw. 
	AI_Output (self, other, "DIA_Urt_Packages_11_16"); //Zaczniesz od przekonania Kopaczy. Porozmawiaj z ich przywódcami. Jest ich trzech - Grimes, Guy i Grim.
	AI_Output (self, other, "DIA_Urt_Packages_11_17"); //Je¿eli chcemy utopiæ Gomeza we krwi, kopacze musz¹ stan¹æ po naszej stronie.
	AI_Output (other, self, "DIA_Urt_Packages_15_18"); //Zrobiê co w mojej mocy.	
	
	// 	Log_CreateTopic	(CH3_RBL_Shadows, LOG_MISSION);
	// 	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_RUNNING);
	//	B_LogEntry		(CH3_RBL_Shadows, "Muszê przekonaæ Cienie do walki po naszej stronie. Ich obecnym przywódc¹ jest Balam - kucharz Gomeza. Muszê z nim porozmawiaæ.");
	Log_CreateTopic	(CH3_RBL_Buddler, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Buddler, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Buddler, "¯eby przekonaæ kopaczy muszê przekonaæ ich przywódców - Grimesa, Guya i Grima. Od tego mo¿e zale¿eæ nie tylko los kopaczy, ale tak¿e powodzenie ataku.");

	Log_SetTopicStatus	(CH3_RBL_Weapon, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Weapon, "Przynios³em Urtowi wszystkie paczki z broni¹. Teraz czeka mnie kolejne zadanie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Paczki z broni¹ przydadz¹ siê naszym sojusznikom w obozie.");
	B_LogEntry		(CH3_RBL_OldCampSpy, "Urt zleci³ mi kolejne zadanie. Muszê przekonaæ kopaczy. Kiedy do cholery dowiem siê wreszcie jak dostaæ siê do zamku?");
};

var int urt_go;

/**************************************************/

INSTANCE DIA_Urt_Buddler (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 5;
	condition		= DIA_Urt_Buddler_Condition;
	information		= DIA_Urt_Buddler_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kopaczy mamy z g³owy."; 
};

FUNC INT DIA_Urt_Buddler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_Packages))&&(buddler_join == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Buddler_Info()
{
	//NOTE: Crappy dialog modified by orc

	AI_Output (other, self, "DIA_Urt_Buddler_15_01"); //Kopaczy mamy z g³owy.
	AI_Output (self, other, "DIA_Urt_Buddler_11_02"); //Œwietna robota. 
	AI_Output (self, other, "DIA_Urt_Buddler_11_03"); //Nadszed³ czas na trudniejsz¹ przeprawê. Porozmawiaj z Balamem, to kucharz Gomeza. Po odejœciu Diego to on zosta³ nieoficjalnym przywódc¹ cieni.
	AI_Output (self, other, "DIA_Urt_Buddler_11_04"); //Balam jest blisko koryta, wie co siê œwiêci i zawsze jest dobrze poinformowany.
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Buddler_11_05"); //Od czasu do czasu znajdziesz go poza kasztelem, wtedy by³oby najbezpieczniej z nim porozmawiaæ.
	//NOTE: Crappy dialog modified by orc
	AI_Output (self, other, "DIA_Urt_Buddler_11_06"); //Ja wracam do swoich zajêæ. Powodzenia.

	Log_SetTopicStatus	(CH3_RBL_Buddler, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Buddler, "Zdoby³em poparcie wszystkich przywódców kopaczy.");
	B_LogEntry(CH3_RBL_OldCampSpy, "Uda³o siê zdobyæ poparcie kopaczy. Teraz czas na zdobycie zaufania cieni.");

	Log_CreateTopic	(CH3_RBL_Shadows, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_RUNNING);
	//NOTE: Crappy dialog modified by orc 	
	B_LogEntry		(CH3_RBL_Shadows, "Muszê przekonaæ cienie do walki po naszej stronie. Ich obecnym przywódc¹ jest Balam - kucharz Gomeza. Muszê z nim porozmawiaæ, wieczorem jest widywany na terenie ca³ego zewnêtrznego pierœcienia.");
	//NOTE: Crappy dialog modified by orc
};

// ---------------------------go----------------------------------------

/**************************************************/

INSTANCE DIA_Urt_Diego (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 4;
	condition		= DIA_Urt_Diego_Condition;
	information		= DIA_Urt_Diego_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rozmawia³em z Diego."; 
};

FUNC INT DIA_Urt_Diego_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rebel))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Diego_Info()
{
	//NOTE: Crappy dialog modified by orc 	

	AI_Output (other, self, "DIA_Urt_Diego_15_01"); //Rozmawia³em z Diego.
	AI_Output (self, other, "DIA_Urt_Diego_11_02"); //NieŸle. Czyli cieni mamy ju¿ z g³owy?
	AI_Output (other, self, "DIA_Urt_Diego_15_03"); //Niezupe³nie. Muszê jeszcze znaleŸæ sposób na to, ¿eby sprowadziæ go do obozu.
	AI_Output (self, other, "DIA_Urt_Diego_11_04"); //To na co czekasz? A¿ Gomez wyœle ci zaproszenie?
	AI_Output (other, self, "DIA_Urt_Diego_15_05"); //Bardzo œmieszne. Idê odwaliæ za Ciebie czarn¹ robotê.
};

/**************************************************/

INSTANCE DIA_Urt_ShadowSucess (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 9;
	condition		= DIA_Urt_ShadowSucess_Condition;
	information		= DIA_Urt_ShadowSucess_Info;
	permanent		= 0;
	important		= 1;
	description		= "Cienie stan¹ po naszej stronie."; 
};

FUNC INT DIA_Urt_ShadowSucess_Condition()
{
	//TODO / FIX TEST
	if (Npc_KnowsInfo (hero,STT_Balam_DiegoCome))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_ShadowSucess_Info()
{
	B_GiveXP(250);

	//NOTE: Crappy dialog modified by orc 	

	AI_Output (other, self, "DIA_Urt_ShadowSucess_15_00"); //Cienie stan¹ po naszej stronie.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_01"); //Œwietna robota. Z reszt¹ moich zadañ dam sobie radê.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_02"); //WeŸ ten list, przedstaw siê jako pos³aniec Fletchera z Nowego Obozu, stra¿nicy na pewno to ³ykn¹.
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_03"); //Kelvina znajdziesz gdzieœ na terenie zamku. 
	AI_Output (self, other, "DIA_Urt_ShadowSucess_11_04"); //Powodzenia. 
	
   CreateInvItem		(self,			ItWr_FletcherFake_Letter_01);
	B_GiveInvItems		(self, other,	ItWr_FletcherFake_Letter_01, 1);	
	Npc_ExchangeRoutine	(self, "KELVIN");
   Wld_InsertNpc(RBL_2400_Kelvin,"OCC_GUARD_ROOM_BACK2");
	var c_npc kevin; kevin = Hlp_GetNpc(RBL_2400_Kelvin);
	kevin.attribute[ATR_HITPOINTS]-=kevin.attribute[ATR_HITPOINTS];
	B_StopProcessInfos(self);
};

/**************************************************/

INSTANCE DIA_Urt_Kelvin (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 6;
 	condition		= DIA_Urt_Kelvin_Condition;
 	information		= DIA_Urt_Kelvin_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Kelvin_Condition()
{
 	if (Npc_GetDistToWP (self,"OCC_GUARD_ROOM_BACK2") < 800 )&&(Npc_KnowsInfo (hero,DIA_Urt_ShadowSucess))
 	{
 		return 1;
 	};
};

FUNC VOID DIA_Urt_Kelvin_Info()
{
 	B_GiveXP (500);
 	B_FullStop (hero);
 	AI_GotoNpc(other,self);
 	AI_TurnToNpc (hero,self);
 	AI_Output(self, other, "DIA_Urt_Kelvin_11_01"); //Niech to szlag, spóŸniliœmy siê. Kelvin nie ¿yje.
 	AI_Output(self, other, "DIA_Urt_Kelvin_11_02"); //Te skurwysyny go torturowa³y, ale nie sprawdzili pod podeszw¹ butów...	
 	B_LogEntry(CH3_RBL_OldCampSpy, "SpóŸniliœmy siê, znaleŸliœmy cia³o Kelvina.");

 	B_StopProcessInfos(self);
 	AI_GotoWP(self, "OCC_GUARD_ROOM_BACK2");
 	AI_AlignToWP(self);
 	AI_PlayAni(self, "T_PLUNDER");
};

/**************************************************/

INSTANCE DIA_Urt_Kelvin1 (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 7;
 	condition		= DIA_Urt_Kelvin1_Condition;
 	information		= DIA_Urt_Kelvin1_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Kelvin1_Condition()
{
 	if (Npc_KnowsInfo (hero,DIA_Urt_Kelvin))
 	{
 		return 1;
 	};
};

FUNC VOID DIA_Urt_Kelvin1_Info()
{
 	AI_StandUp (self);
 	AI_TurnToNpc (self, hero);
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_01"); //Znalaz³em przy Kelvinie mapê.
 	B_UseFakeScroll(self);
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_02"); //A niech mnie, ten cwany skurczybyk znalaz³ tajemne wejœcie do Starego Obozu!
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_03"); //Kelvin nawet zza grobu potrafi dokopaæ Gomezowi.
 	AI_Output (other, self, "DIA_Urt_Kelvin1_15_04"); //¯a³ujê, ¿e go nie zna³em. To musia³ byæ niez³y...
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_05"); //Stra¿nicy! Id¹ tutaj. Biegnij, uciekaj najszybciej jak tylko potrafisz.
 	AI_Output (self, other, "DIA_Urt_Kelvin1_11_06"); //Ja ich zatrzymam tak d³ugo jak siê da.
 	AI_Output (other, self, "DIA_Urt_Kelvin1_15_07"); //Zginiesz!
	AI_Output (self, other, "DIA_Urt_Kelvin1_11_08"); //Dam sobie radê, uciekaj do lochów pod zamkiem, tam znajdziesz tajne przejœcie! 	
	
 	B_LogEntry		(CH3_RBL_OldCampSpy, "Urt znalaz³ przy ciele Kelvina klucz i mapê z lokalizacj¹ tajnego wejœcie do obozu. Muszê zd¹¿yæ tam przed stra¿nikami.");
 	/*********************
 	Jakaœ funkcja z wnerwinymi stra¿nikami + zmiana dickowi i urtowi na super szybkie bieganie. AHa i Urt ma klucz do zamkniêtych drzwi, przez które musz¹ przejœc, mo¿na tak?
 	*********************/

   //guard_aler ();

   Npc_ExchangeRoutine	(self, "HIDE");
 	B_StopProcessInfos	(self);
};

/**************************************************

INSTANCE DIA_Urt_Escape (C_INFO)
{
 	npc				= RBL_4062_Urt;
 	nr				= 8;
 	condition		= DIA_Urt_Escape_Condition;
 	information		= DIA_Urt_Escape_Info;
 	permanent		= 0;
 	important		= 1;
 	description		= "."; 
};

FUNC INT DIA_Urt_Escape_Condition()
{

 	if (Npc_GetDistToWP (self,"KELVIN_OUT") < 800 )&&(Npc_KnowsInfo (hero,DIA_Urt_Kelvin1)) //Wyjœcie poza stary obóz
 	{
 		return 1;
 	};


};

FUNC VOID DIA_Urt_Escape_Info()
{
 	B_GiveXP(1000);
 	B_FullStop (hero);
 	AI_GotoNpc(other,self);
 	AI_TurnToNpc (hero,self);
 	AI_Output (self, other, "DIA_Urt_Escape_11_01"); //Uda³o siê! Zapadliœmy siê pod ziemiê, pod samym nosem stra¿ników.
 	AI_Output (other, self, "DIA_Urt_Escape_15_02"); //Podziemny tunel... Kto by pomyœla³. Ciekawe kto jeszcze o nim wie?
 	AI_Output (self, other, "DIA_Urt_Escape_11_03"); //Mo¿e nikt. WeŸ ten klucz, wiesz które drzwi otwiera.

 	B_GiveInvItems (self, other, ItKe_Secret_CM_Enter,1); //Ork, który klucz otwiera te drzwi? mo¿e ten ItKe_Secret_CM_Enter - jak nie to zmieñ na w³aœciwy
 	AI_Output (self, other, "DIA_Urt_Escape_11_04"); //Ja zniszczê mapê, ¿eby nie wpad³a w niepowo³ane rêce.
 	AI_Output (self, other, "DIA_Urt_Escape_11_05"); //Aha, zanim pogadasz z Ratfordem przyprowadŸ do obozu Diego. W ten sposób zyskamy te¿ wsparcie Cieni.
 	AI_Output (other, self, "DIA_Urt_Escape_15_06"); //O to siê nie bój, nied³ugo zatañczymy nad cia³em Gomeza.
 	AI_Output (self, other, "DIA_Urt_Escape_11_07"); //I nasikamy mu do gard³a, he, he. Bywaj przyjacielu, cieszê siê, ¿e nale¿y do nas ktoœ tak zaradny jak Ty.
 	AI_Output (other, self, "DIA_Urt_Escape_15_08"); //Wzajemnie Urt, nie daj siê zabiæ.
 	AI_Output (self, other, "DIA_Urt_Escape_11_09"); //Bez obaw, nie bêdê siê wychyla³. Poczekam na Diego. Razem wykoncypujemy strategiê walki Cieni i Kopaczy.
 	AI_Output (self, other, "DIA_Urt_Escape_11_10"); //Reszta zale¿y ju¿ tylko od Cavalorna i Ratforda. 
 	AI_Output (self, other, "DIA_Urt_Escape_11_11"); //My bêdziemy czekaæ na znak.
 	AI_Output (other, self, "DIA_Urt_Escape_15_12"); //Bywaj.
 	B_LogEntry		(CH3_RBL_Diego, "Wiem jak mo¿na dostaæ sie po kryjomu do Starego Obozu! Teraz Diego bêdzie móg³ bezpiecznie porozmawiaæ z Cieniami i przekonaæ ich do walki po stronie rebelii.");
 	B_LogEntry		(CH3_RBL_OldCampSpy, "Mam klucz do piwnic magnatów. Muszê powiedzieæ o tym Ratfordowie, ale najpierw powinienem wprowadziæ do obozu Diego przez tajne wejœcie.");

   Npc_SetAivar(self,AIV_PARTYMEMBER, 	FALSE);
 	Npc_ExchangeRoutine	(self, "HIDE"); // wraca do piwnicy magnatów i czeka tam na Diego
};

**************************************************/

INSTANCE DIA_Urt_DiegoJail (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 10;
	condition		= DIA_Urt_DiegoJail_Condition;
	information		= DIA_Urt_DiegoJail_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Urt_DiegoJail_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo(hero,DIA_Cavalorn_NCFinish))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_DiegoJail_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_01"); //Kto idzie?!
	AI_DrawWeapon (self);
	AI_GotoNpc(hero,self);
	AI_TurnToNpc (self, hero);
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_02"); //Co Ty tu robisz?!
	AI_RemoveWeapon (self);
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_03"); //Mam randkê z Gomezem.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_04"); //Do cholery, nie czas na g³upie ¿arty!
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_05"); //A po co mia³bym z w³asnej woli pakowaæ siê do tego obozu?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_06"); //Wybacz... Mam nerwy w strzêpach.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_07"); //Cavalorn czeka na wiadomoœci od Was. Co siê dzieje?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_08"); //Dorwali Diego.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_09"); //Jak to siê sta³o?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_10"); //Stra¿nicy przydybali go podczas spotkania z dowódcami Cieni i Kopaczy. Dorwali ich wszystkich.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_11"); //Cieni i Kopaczy stracili od razu, ¿eby zastraszyæ pozosta³ych.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_12"); //Diego zostawili na deser.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_13"); //Gdzie go przetrzymuj¹?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_14"); //W zamkowych lochach. Jest dobrze strze¿ony, a ja jestem spalony. Szukaj¹ mnie od kilku dni. Na szczêœcie nikomu nie przysz³o na myœl, ¿eby tu zajrzeæ.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_15"); //Sk¹d stra¿nicy dowiedzieli siê o spotkaniu Diego z Cieniami i Kopaczami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_16"); //To musia³ byæ ktoœ z nas, ktoœ kto wiedzia³ o powrocie Diego i planowanej rebelii.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_17"); //Z kim prócz mnie rozmawia³eœ o Diego?
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_18"); //Z nikim... Hmm, chocia¿... 
	
   if (Npc_KnowsInfo(hero,STT_Balam_Again))
	{
		AI_Output (other, self, "DIA_Urt_DiegoJail_15_19"); //Balam powiedzia³ mi, ¿e bez Diego cienie nie pójd¹ do walki.
	};
	if (Npc_KnowsInfo(hero,STT_Balam_Diego))||(Npc_KnowsInfo(hero,STT_Balam_DiegoCome))
	{
		AI_Output (other, self, "DIA_Urt_DiegoJail_15_20"); //PóŸniej wypytywa³ o powrót Diego. Ale wydawa³o mi siê to naturalne.
	};
   
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_21"); //Byæ mo¿e by³o. Ale na razie to jedyny podejrzany.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_22"); //Pod warunkiem, ¿e wykluczymy Ciebie.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_23"); //Masz racjê. Dlatego bêdê tu siedzia³, a Ty zajmiesz siê wykryciem sprawcy i moimi obowi¹zkami.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_24"); //¯eby by³a jasnoœæ.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_25"); //Nie trafi³em do Kolonii, ¿eby czyniæ dobro, ratowaæ czyjeœ dupsko z opresji, czy udawaæ kap³ana Adanosa.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_26"); //Mamy wspólne cele i tylko dlatego pomagam Wam, a nie Gomezowi. Czy to jasne?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_27"); //Zrozumia³em. Myœlisz, ¿e ja jestem urodzonym anarchist¹? Jak powiedzia³eœ, mamy ten sam cel i w tej chwili tylko to siê liczy.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_28"); //Dobra, dowiem siê komu trzeba uci¹æ jêzor. O co chodzi z tymi obowi¹zkami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_29"); //Musisz przygotowaæ cieni i kopaczy do ataku. Rozejrzyj siê po obozie i wybierz miejsca gdzie i w jaki sposób powinni uderzyæ.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_30"); //Tylko tyle?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_31"); //To nie takie proste. Od twoich decyzji bêdzie zale¿a³a skutecznoœæ ataku, a tak¿e to jakie straty ponios¹ rebelianci.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_32"); //Dlaczego sam im tego wczeœniej nie powiedzia³eœ?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_33"); //Jakbyœ nie zauwa¿y³ siedzê tu zamkniêty od kilku dni. Nie mam pojêcia jak wygl¹da aktualna sytuacja.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_34"); //Ty mo¿esz swobodnie rozejrzeæ siê po obozie, to wystarczy w zupe³noœci do realnej oceny sytuacji.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_35"); //Dlaczego ka¿dy chce siê wys³ugiwaæ takim biednym piratem jak ja?
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_36"); //Dobra rozejrzê siê w po obozie.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_37"); //Jak mam porozumieæ siê z cieniami i kopaczami?
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_38"); //Spotkasz siê z ich kontaktami o ile jeszcze ¿yj¹.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_39"); //W pobli¿u szafotu bêdzie czeka³ wys³annik cieni.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_40"); //Cz³owiek kopaczy bêdzie siê krêci³ przy bocznej bramie.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_41"); //W porz¹dku.
	AI_Output (self, other, "DIA_Urt_DiegoJail_11_42"); //Mamy ma³o czasu. Jak najszybciej rozejrzyj siê w sytuacji i odnajdŸ Diego.
	AI_Output (other, self, "DIA_Urt_DiegoJail_15_43"); //Wrócê jak dowiem siê czegoœ wiêcej.

	/*******************
Ork to jest zmienna od skrzyni, teraz Dick mo¿e monologowaæ ze skrzyni¹

	CHEST_KNOW = TRUE;

**********************/
	Log_CreateTopic	(CH6_RBL_Spy, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Spy, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Spy, "Ktoœ zdradzi³ w szeregach cieni i kopaczy. To przez tego szczura Diego trafi³ w ³apska stra¿ników. Muszê odnaleŸæ sukinsyna i podziêkowaæ mu za wspó³pracê. Powinienem zacz¹æ od Balama, tylko on prócz Urta wiedzia³ o powrocie Diego.");

	Log_CreateTopic	(CH6_RBL_Diego, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Diego, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Diego, "Stra¿nicy dorwali Diego. Urt twierdzi, ¿e trzymaj¹ go pod stra¿¹ w zamkowym lochu. Muszê uwolniæ tego starego capa bo inaczej cienie i kopacze nie rusz¹ do walki.");

	Log_CreateTopic	(CH6_RBL_Coordinate, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Coordinate, "Muszê rozejrzeæ siê w sytuacji i na podstawie wyci¹gniêtych wniosków ustaliæ poczynania cieni i kopaczy. Wys³annika Cieni znajdê pod szafotem, cz³owiek kopaczy ma siê krêciæ w pobli¿u bocznej bramy.");
	
	B_LogEntry		(CH6_RBL_Recognise, "Diego w lochu, cienie i kopacze rozproszeni, brak rozeznania sytuacji. Jest gorzej ni¿ myœla³em. Czas siê za to zabraæ.");

	B_StopProcessInfos	(self);

	/*********************
Stra¿nik lochów, stoi przed cel¹ w której jest zamkniêty Diego

********************/
	Wld_InsertNpc				(Grd_4107_Guard,"OCC_CELLAR_HALLWAY_BACK");

/***************
Kontakty cieni i kopaczy
*****************/
	Wld_InsertNpc				(Stt_4200_Schatten,"OCR_CROWD_03");
	Wld_InsertNpc				(VLK_4201_Buddler,"OCR_HUT_Z4");	

};

//**************************************************

INSTANCE DIA_Urt_Chest (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 12;
	condition		= DIA_Urt_Chest_Condition;
	information		= DIA_Urt_Chest_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przekaza³em wytyczne."; 
};

FUNC INT DIA_Urt_Chest_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cienius_Fault))&&(Npc_KnowsInfo(hero,DIA_Kopaczus_Fault))&&(Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Chest_Info()
{
	AI_Output (other, self, "DIA_Urt_Chest_15_01"); //Przekaza³em wytyczne.
	AI_Output (self, other, "DIA_Urt_Chest_11_02"); //Œwietna robota, nied³ugo nadejdzie Czas Zap³aty.
	
	Log_SetTopicStatus	(CH6_RBL_Coordinate, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Coordinate, "Kopacze i cienie wespr¹ atak na Stary Obóz.");	

};

//**************************************************

INSTANCE DIA_Urt_Urthos (C_INFO)
{
	npc				= RBL_4062_Urt;
	nr				= 13;
	condition		= DIA_Urt_Urthos_Condition;
	information		= DIA_Urt_Urthos_Info;
	permanent		= 0;
	important		= 0;
	description		= "Urthos!"; 
};

FUNC INT DIA_Urt_Urthos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Urt))&&(Npc_KnowsInfo(hero,DIA_Cipher_Urt))
	{
		return 1;
	};
};

FUNC VOID DIA_Urt_Urthos_Info()
{
	AI_Output (other, self, "DIA_Urt_Urthos_15_01"); //Urthos!
	AI_Output (self, other, "DIA_Urt_Urthos_11_02"); //Sk¹d znasz to imiê?
	AI_Output (other, self, "DIA_Urt_Urthos_15_03"); //Czyli to prawda. Masz mi jeszcze coœ do powiedzenia?
	AI_Output (self, other, "DIA_Urt_Urthos_11_04"); //Nic poza to, ¿e ludzie w takim miejscu jak Kolonia czêsto siê zmieniaj¹.
	AI_Output (other, self, "DIA_Urt_Urthos_15_05"); //Ale czy na lepsze?
	AI_Output (self, other, "DIA_Urt_Urthos_11_06"); //Mo¿esz byæ tego pewien.
	AI_Output (other, self, "DIA_Urt_Urthos_15_07"); //Balam i Lee twierdz¹ coœ zgo³a odmiennego.
	AI_Output (self, other, "DIA_Urt_Urthos_11_08"); //Przysz³oœæ poka¿e, kto walczy po w³aœciwej stronie...
	Npc_ExchangeRoutine	(self, "GONE");
};


