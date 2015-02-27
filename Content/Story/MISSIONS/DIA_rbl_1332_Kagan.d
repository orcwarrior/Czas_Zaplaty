// **************************************************
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Jesteœ z obozu Sekty, nieprawda¿?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello1_15_00"); //Jesteœ z obozu Sekty, nieprawda¿?
	AI_Output			(self, other,"DIA_BaalKagan_Hello1_13_01"); //By³em, ale ju¿ nie nale¿ê do œwirów z bagna.
	AI_Output			(self, other,"DIA_BaalKagan_Hello1_13_02"); //Jestem Baal Kagan, znaczy bez tego Baal. A Œni¹cy to kawa³ek cuchn¹cego gówna.
};

// ************************************************************
// 						Warum hier
// ************************************************************
//TODO: Sher, albo poprawic tresc dialogu albo zostawic wywalony, logiczna calosc to to narazie nie jest
INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Co tu robisz?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Kiedyœ werbowa³em nowych do Bractwa.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ale to dawne dzieje. Teraz zajmujê siê wy³¹cznie sprzeda¿¹ ziela.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Palenie ziela to doœæ popularne zajêcie w tych stronach. Mo¿e nawet zbyt popularne. Ledwie nad¹¿am z kolejnymi dostawami.

	Log_CreateTopic	(GE_TraderOR,	LOG_NOTE);
	B_LogEntry		(GE_TraderOR,	"Baal Kagan sprzedaje ma³e porcje ziela w obozie.");
};


// ************************************************************
// 						TRADE
// ************************************************************
INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Poka¿ mi co masz do zaoferowania.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Poka¿, co masz do zaoferowania.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Jak sobie ¿yczysz.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	important	= 1;	
	permanent	= 0;
	description = "";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_01"); //Zaczekaj chwilkê. Jest coœ o czym chcia³bym z Tob¹ porozmawiaæ.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_02"); //Mów.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_03"); //To doœæ delikatna sprawa...
	AI_PlayAni (self, "T_SEARCH");
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_04"); //Spotka³eœ ju¿ Baal Tarana?
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Greet))
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_05"); //Tak.
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_06"); //Jeszcze nie.
	};
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_07"); //A wiêc ta menda...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_08"); //Menda? Przecie¿ pochodzicie z tego samego obozu.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_09"); //To stare dzieje. Teraz liczy siê tylko to, ¿eby przetrwaæ.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_10"); //A ¿eby przetrwaæ trzeba mieæ za co ¿yæ.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_11"); //A ¿eby mieæ za co ¿yæ trzeba zarabiaæ.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_12"); //A ¿eby zarabiaæ trzeba coœ sprzedaæ.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_13"); //A ¿eby coœ...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_14"); //Skoñcz ju¿ z t¹ wyliczank¹. Mów o co chodzi!
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_15"); //Taran robi mi konkurencjê.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_16"); //Mówisz o handlu zielem?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_17"); //Tak, do cholery. Przecie¿ nie o krêceniu ty³kiem!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_18"); //Chyba wiem do czego zmierzasz. Moja odpowiedŸ brzmi - NIE. Nie wyprujê mu flaków tylko dlatego, ¿e sprzedaje ziele.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_19"); //Spokojnie, wysnu³eœ zbyt pochopne wnioski. A kto mówi o zabijaniu?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_20"); //Wystarczy, ¿e Taran zrazi do siebie klientów. Ja ju¿ zajmê siê reszt¹.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_21"); //Co mia³bym zrobiæ?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_22"); //Taran sam nie zbiera ziela. Jego dostawca to pustelnik Gilbert.
	if (!Npc_KnowsInfo(hero,DIA_Gilbert_First))
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_23"); //Gdzie go znajdê?
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_24"); //W tym w³aœnie tkwi problem. Nie mam bladego pojêcia.
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_25"); //Musisz odnaleŸæ Gilberta.
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_26"); //Wiem gdzie mieszka.
		AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_27"); //To œwietnie!
	};
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_28"); //Powiesz temu staremu pacanowi, ¿e przyszed³eœ po dostawê dla Tarana.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_29"); //Gilbert albo Taran nie bêd¹ nic podejrzewaæ?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_30"); //Gilbert to ju¿ Twój problem. Co do Tarana... Cz³owieku on jest ca³y czas zabakany w trupa! Nie odró¿ni³by w s³oneczny dzieñ go³ej dupy od mordy orka.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_31"); //No dobra. I co dalej?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_32"); //Kiedy dostaniesz paczkê od Gilberta najpierw przyniesiesz j¹ do mnie, a ja trochê doprawiê ziele.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_33"); //PóŸniej zaniesiesz paczkê Taranowi.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_34"); //To wszystko?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_35"); //Tak, mówi³em, ¿e dla kogoœ takiego jak Ty to ¿aden wysi³ek.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_36"); //Tylko musisz paczkê najpierw przynieœæ mi. Je¿eli zaniesiesz j¹ od razu do Tarana, to mój misterny plan szlag trafi.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_37"); //No dobra, a co ja bêdê z tego mia³?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_38"); //Zap³acê Ci... 300 bry³ek.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_39"); //To za ma³o.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_40"); //No dobra niech bêdzie 400, ale ani bry³ki wiêcej!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_41"); //Nie o tym myœla³em. Dasz mi udzia³ w zyskach.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_42"); //Chyba za mocno uderzy³eœ siê w g³owê!
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_43"); //Udzia³ w zyskach albo Taran o wszystkim siê dowie. Ciekawe co wtedy powiedz¹ rebelianci, którzy kupuj¹ ziele? Myœlê, ¿e raczej Twoja popularnoœæ od tego nie wzroœnie.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_44"); //Ale z ciebie skurwiel! Niech bêdzie. Dostaniesz udzia³ w utargu. Powiedzmy... 10 procent.
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_45"); //Mam lepszy pomys³. Odpalisz mi 20 procent co 10 dni. 
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_46"); //Ty...
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp1_15_47"); //Uwa¿aj na s³owa, je¿eli lubisz swój jêzyk.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp1_13_48"); //Niech Ciê szlag! Dobra, przynieœ mi tê cholern¹ paczkê. Zaczynam ¿a³owaæ, ¿e wda³em siê z Tob¹ w interesy...

	Log_CreateTopic		(CH2_RBL_Stuff,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Stuff,	LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Stuff, "A ludzie mówi¹, ¿e ruda nie le¿y na ziemi. Pomogê Kaganowi pozbyæ siê konkurencji, czyli Baal Tarana w zamian za 20-procentowy udzia³ w zyskach. Rudê bêdê odbiera³ co 10 dni. Muszê mu tylko dostarczyæ paczkê ziela od niejakiego Gilberta.");	
};


// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 3;
	condition	= DIA_BaalKagan_StuffHave_Condition;
	information	= DIA_BaalKagan_StuffHave_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam przesy³kê od Gilberta.";
};                       

FUNC INT DIA_BaalKagan_StuffHave_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gilbert_Stuff1))&&(Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))&&(NPC_HasItems(other,package_stuff)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave_15_01"); //Mam przesy³kê od Gilberta.
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave_13_02"); //Nareszcie. Daj ziele, to je doprawiê...
	B_GiveInvItems (other, self, package_stuff, 1);
	Ai_Wait (self,2);	
	B_GiveInvItems (self, other, package_stuff, 1);
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave_13_03"); //W porz¹dku, gotowe. Zanieœ paczkê Baal Taranowi z pozdrowieniami od Gilberta.
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave_15_04"); //Bez obaw. Zaraz po tym wrócê po swój udzia³.
	B_LogEntry		(CH2_RBL_Stuff, "Mam ju¿ doprawion¹ paczkê ziela. Czas oddaæ j¹ Baal Taranowi.");
};

var int kagan_pay;

// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave1 (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 4;
	condition	= DIA_BaalKagan_StuffHave1_Condition;
	information	= DIA_BaalKagan_StuffHave1_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zrobi³em swoje, czas odebraæ zap³atê.";
};                       

FUNC INT DIA_BaalKagan_StuffHave1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Stuff))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave1_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave1_15_01"); //Zrobi³em swoje, czas odebraæ zap³atê.
	AI_Output			(self, other,"DIA_BaalKagan_StuffHave1_13_02"); //Nie tak szybko. Wróæ za 10 dni, wtedy dostaniesz swoj¹ dolê.
	AI_Output			(other, self,"DIA_BaalKagan_StuffHave1_15_03"); //Mo¿esz byæ pewien, ¿e o tym nie zapomnê.

	kagan_pay = B_SetDayTolerance()+10;
	Log_SetTopicStatus	(CH2_RBL_Stuff,	LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Stuff,	"Sprawa za³atwiona. Muszê tylko pamiêtaæ, ¿eby wracaæ co tydzieñ po swoj¹ dolê.");
};

// ************************************************************

INSTANCE DIA_BaalKagan_StuffHave2 (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 5;
	condition	= DIA_BaalKagan_StuffHave2_Condition;
	information	= DIA_BaalKagan_StuffHave2_Info;
	important	= 0;	
	permanent	= 1;
	description = "Chyba coœ mi siê nale¿y.";
};                       

FUNC INT DIA_BaalKagan_StuffHave2_Condition()
{
	//TODO: Kiedys trzeba zatrzymaæ ta nieustanna machine zarabiania kasy
	if (Npc_KnowsInfo(hero,DIA_BaalTaran_Stuff))&&(kagan_pay <= (Wld_GetDay()))&&(kagan_pay!=0)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_StuffHave2_Info()
{	
	//Jako ze zmniejszona zostala zaplata dla Tarana z 800 na 300
	//to zmniejszam rownie¿ troche kase ktora wyp³aca Kagan.
   AI_Output			(other, self,"DIA_BaalKagan_StuffHave2_15_01"); //Chyba coœ mi siê nale¿y.
   
	if(Aloes_Creation==TRUE)&&(Taran_300ore)
	{
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_02"); //Taran przej¹³ ostatnio wiêkszoœæ moich klientów, ledwo starcza mi rudy na jedzenie.
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_03"); //Nie mam nic dla Ciebie.
		kagan_pay=0;
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_StuffHave2_13_02"); //Zabieraj swoj¹ dolê i zejdŸ mi z oczu, krwiopijco!
		CreateInvItems (self, ItMiNugget, 100);
		B_GiveInvItems (self, other, ItMiNugget, 100);
	};
   
	kagan_pay = B_SetDayTolerance()+10;
};

// ************************************************************

INSTANCE DIA_BaalKagan_Hanis (C_INFO)
{
	npc			= rbl_1332_baalkagan;
	nr			= 6;
	condition	= DIA_BaalKagan_Hanis_Condition;
	information	= DIA_BaalKagan_Hanis_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam pytanie.";
};                       

FUNC INT DIA_BaalKagan_Hanis_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Quentin_Hanis1))&&(Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_Hanis_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_01"); //Mam pytanie.
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_02"); //Jakie?
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_03"); //Masz na sprzeda¿ jakiœ specyfik, po którym cz³owiek wpada w sza³?
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_04"); //Hmm. Znam tylko jedn¹ tak¹ roœlinê. To kl¹twa berserkera.
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_05"); //Bardzo rzadkie ziele. 
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_06"); //Komuœ je sprzeda³eœ?
	AI_Output			(self, other,"DIA_BaalKagan_Hanis_13_07"); //Jakiœ czas temu Kharim pyta³ mnie o podobny specyfik. Akurat znalaz³em ziele na orkowym cmentarzu. Sporo za nie zap³aci³, wiêc o nic wiêcej nie pyta³em.
	AI_Output			(other, self,"DIA_BaalKagan_Hanis_15_08"); //Bardzo mi pomog³eœ. Bywaj.

	B_LogEntry		(CH2_RBL_Mem, "To Baal Kagan sprzeda³ Kharimowi kl¹twê berserkera - ziele, po którym cz³owiek wpada w sza³. W koñcu mam dowody na to, ¿e Gor Hanis jest niewinny. Muszê porozmawiaæ z Ratfordem.");
};

// **************************************************

INSTANCE DIA_rbl_1332_baalkagan_Stew (C_INFO)
{
	npc				= rbl_1332_baalkagan;
	nr				= 12;
	condition		= DIA_rbl_1332_baalkagan_Stew_Condition;
	information		= DIA_rbl_1332_baalkagan_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Twoja porcja pysznego gulaszu, smacznego."; 
};

FUNC INT DIA_rbl_1332_baalkagan_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1332_baalkagan_Stew_Info()
{
	fox_stew = fox_stew + 1;
	//TODO: Sher FIX Needed. anotha' crappy dialog created by orc
	
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Stew_15_01"); //Twoja porcja pysznego gulaszu, smacznego.
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Stew_11_02"); //S³uchaj no, dawaj swoj¹ porcje, bo inaczej to bêd¹ ostatnie s³owa w twoim ¿yciu.
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Stew_15_03"); //Och, doprawdy?
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Stew_11_04"); //Nie cholera, ¿artowa³em, dwie porcje to dawka œmiertelna.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Kagana trzymaj¹ siê ¿arty, mimo tego ¿e musia³ zjeœæ swoj¹ porcje."); 
};

// **************************************************

INSTANCE DIA_rbl_1332_baalkagan_Aloes (C_INFO)
{
	npc				= rbl_1332_baalkagan;
	nr				= 12;
	condition		= DIA_rbl_1332_baalkagan_Aloes_Condition;
	information		= DIA_rbl_1332_baalkagan_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz przyrz¹dziæ miksturê z aloesu?"; 
};

FUNC INT DIA_rbl_1332_baalkagan_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)&& (!Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1332_baalkagan_Aloes_Info()
{
	//crappy dialog created by orc
	AI_Output (other, self, "DIA_rbl_1332_baalkagan_Aloes_15_01"); //Potrafisz przyrz¹dziæ miksturê z aloesu?
	AI_Output (self, other, "DIA_rbl_1332_baalkagan_Aloes_11_02"); //Nie, ale Taran na pewno da sobie radê, pomaga³ kiedyœ przygotowywaæ guru mikstury pozwalaj¹ce na kontakt ze Œni¹cym.
}; 
