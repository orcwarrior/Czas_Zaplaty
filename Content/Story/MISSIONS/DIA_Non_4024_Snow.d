
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snow_Exit (C_INFO)
{
	npc			= Non_4024_Snow;
	nr			= 999;
	condition	= DIA_Snow_Exit_Condition;
	information	= DIA_Snow_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snow_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snow_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Snow_Hello (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 1;
	condition		= DIA_Snow_Hello_Condition;
	information		= DIA_Snow_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Paskudne miejsce."; 
};

FUNC INT DIA_Snow_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Snow_Hello_Info()
{
	AI_Output (other, self, "DIA_Snow_Hello_15_01"); //Paskudne miejsce.
	AI_Output (self, other, "DIA_Snow_Hello_11_02"); //Mówisz o Kolonii czy o naszym zacnym obozie?
	AI_Output (other, self, "DIA_Snow_Hello_15_03"); //A co to za ró¿nica?
	AI_Output (self, other, "DIA_Snow_Hello_11_04"); //Racja, ¿adna. Skoro ju¿ tutaj wœciubi³eœ nos, to bêdê mia³ dla Ciebie pewn¹ propozycjê.
	AI_Output (self, other, "DIA_Snow_Hello_11_05"); //Ale najpierw pogadaj z szefow¹, ona lubi witaæ nowych... cz³onków.
	AI_Output (other, self, "DIA_Snow_Hello_15_06"); //Szefow¹?!
	AI_Output (self, other, "DIA_Snow_Hello_11_07"); //Niewa¿ne, cholera znowu zepsu³em niespodziankê.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Snow_What (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 2;
	condition		= DIA_Snow_What_Condition;
	information		= DIA_Snow_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz jakbyœ wdepn¹³ w spore ³ajno."; 
};

FUNC INT DIA_Snow_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_What_Info()
{
	AI_Output (other, self, "DIA_Snow_What_15_01"); //Wygl¹dasz jakbyœ wdepn¹ w spore ³ajno.
	AI_Output (self, other, "DIA_Snow_What_11_02"); //Mo¿na tak powiedzieæ. Jestem odpowiedzialny za zaopatrzenie w tym cholernym obozie.
	AI_Output (self, other, "DIA_Snow_What_11_03"); //Ci¹gle wszystkiego brakuje. Jestem pewien, ¿e któryœ z tych sukinsynów z obozu zakrada siê noc¹ do sk³adziku i zwija zapasy.
	AI_Output (self, other, "DIA_Snow_What_11_04"); //Ju¿ kilka razy próbowa³em siê zaczaiæ na z³odzieja, ale musia³ mieæ mnie na oku.
	AI_Output (other, self, "DIA_Snow_What_15_05"); //Mam propozycjê.
	AI_Output (self, other, "DIA_Snow_What_11_06"); //Mów.
	AI_Output (other, self, "DIA_Snow_What_15_07"); //Przyby³em tu, ¿eby zaproponowaæ Kirze sojusz przeciwko Gomezowi. Twoja szefowa powiedzia³a, ¿e najpierw musi sprawdziæ, co jestem wart, zanim podejmie decyzjê.
	AI_Output (self, other, "DIA_Snow_What_11_08"); //I s³usznie. Zawsze staliœmy z boku i nigdy nie anga¿owaliœmy siê w konflikty miêdzy obozami. To nie nasza sprawa.
	AI_Output (self, other, "DIA_Snow_What_11_09"); //Ale skoro Kira chce daæ Ci szansê, to czemu nie. Jak j¹ znam, to pewnie nie robi tego bezinteresownie.
	AI_Output (other, self, "DIA_Snow_What_15_10"); //Co masz na myœli?
	AI_Output (self, other, "DIA_Snow_What_11_11"); //Kira to wredna suka. Niech Ciê nie zwiod¹ pozory urody i rzeczowoœci.
	AI_Output (self, other, "DIA_Snow_What_11_12"); //Jak myœlisz, dlaczego baba mówi kilku facetom i orkowi co maj¹ robiæ?
	AI_Output (other, self, "DIA_Snow_What_15_13"); //Mo¿e ci faceci nie maj¹ jaj...
	AI_Output (self, other, "DIA_Snow_What_11_14"); //Bardzo œmieszne, ale lepiej tego nie powtarzaj przy innych.
	AI_Output (self, other, "DIA_Snow_What_11_15"); //Wróæmy jednak do Twojej propozycji. O Kirze mo¿emy pogadaæ póŸniej.
	AI_Output (other, self, "DIA_Snow_What_15_16"); //Pomogê Ci rozwi¹zaæ problem ze z³odziejem.
	AI_Output (self, other, "DIA_Snow_What_11_17"); //Bezinteresownie?
	AI_Output (other, self, "DIA_Snow_What_15_18"); //Niezupe³nie. Kira kaza³a mi zdobyæ wasz¹ przychylnoœæ.
	AI_Output (self, other, "DIA_Snow_What_11_19"); //Rozumiem. W porz¹dku, Ty pomo¿esz mi, ja pomogê Tobie. Brzmi uczciwie.
	AI_Output (other, self, "DIA_Snow_What_15_20"); //Opowiedz mi wszystko, co wiesz o tym z³odzieju.
	AI_Output (self, other, "DIA_Snow_What_11_21"); //Zakrada siê noc¹ do magazynku. Zabiera g³ównie ¿arcie, ale czasami te¿ inne przedmioty, takie które ³atwo sprzedaæ w Kolonii, albo wymieniæ.
	AI_Output (self, other, "DIA_Snow_What_11_22"); //To musi byæ ktoœ z nas. Wiem tylko, ¿e to nie jest Korth, bo on ci¹gle œlêczy na warcie.
};

// **************************************************

var int snow_day;
var int snow_compleated;

INSTANCE DIA_Snow_WhatOk (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 3;
	condition		= DIA_Snow_WhatOk_Condition;
	information		= DIA_Snow_WhatOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "W porz¹dku, przypilnujê magazynku."; 
};

FUNC INT DIA_Snow_WhatOk_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_What))
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_WhatOk_Info()
{
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	snow_compleated = 0;
	
   AI_Output (other, self, "DIA_Snow_WhatOk_15_01"); //W porz¹dku, przypilnujê magazynku.
	AI_Output (self, other, "DIA_Snow_WhatOk_11_02"); //Œwietnie.
	
   if (Wld_IsTime (20,00,06,00))
	{
		AI_Output (self, other, "DIA_Snow_WhatOk_11_03"); //W takim razie idê do siebie. Wrócê o œwicie.
	}
	else
	{
		AI_Output (self, other, "DIA_Snow_WhatOk_11_04"); //Wróæ wiêc o zmierzchu i miej oko na zapasy.
	};
   
   Npc_ExchangeRoutine(self,"GO_HOME");//zmiana standardowej rutyny pojdzie do chaty o 20 i bêdzie tam do 6

	Log_CreateTopic	(CH2_TRL_Thief, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Thief, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Thief, "Snow jest kwatermistrzem w obozie ³owców trolli i ma problemy ze z³odziejem, który noc¹ wykrada zaopatrzenie. Je¿eli chcê zdobyæ jego przychylnoœæ, to muszê dowiedzieæ siê, kim jest z³odziej. Powinienem poczekaæ w nocy, w pobli¿u magazynku i przy³apaæ z³odzieja na gor¹cym uczynku.");

	snow_day = B_SetDayTolerance()+1;
	B_StopProcessInfos (self);
	B_ExchangeRoutine(buk,"Thief");
};

INSTANCE DIA_Snow_Perm (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 4;
	condition		= DIA_Snow_Perm_Condition;
	information		= DIA_Snow_Perm_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jak tam zapasy? Nadal gin¹?"; 
};

FUNC INT DIA_Snow_Perm_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Snow_WhatOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_Perm_Info()
{
	AI_Output (other, self, "DIA_Snow_Perm_15_01"); //Jak tam zapasy? Nadal gin¹?

	if (snow_day<= (Wld_GetDay()))&&(snow_compleated == 0)
	{
		snow_day = B_SetDayTolerance()+1;
		AI_Output (self, other, "DIA_Snow_Perm_11_02"); //Ty sukinsynie, mia³eœ przypilnowaæ sk³adziku! Znowu coœ zginê³o.
      
		if (Wld_IsTime (20,00,06,00))
		{
			AI_Output (self, other, "DIA_Snow_Perm_11_03"); //Rusz dupê i przypilnuj skrzyñ, jak mnie nie bêdzie.
		}
		else
		{
			AI_Output (self, other, "DIA_Snow_Perm_11_04"); //Wróæ tu wieczorem i capnij tego cwaniaka!
		};
	}
	else if (snow_compleated == 1)
	{
		AI_Output (self, other, "DIA_Snow_Perm_11_05"); //Dziêki za pomoc, ju¿ wszystko w porz¹dku.
		DIA_Snow_Perm.permanent = 0;
	}
   else
   {
      AI_Output (self, other, "DIA_Snow_Perm_11_06"); //A z³apa³eœ z³odzieja? Nie, wiêc wróæ wieczorem i przyczaj siê gdzieœ.
   };

	B_StopProcessInfos (self);
};
// **************************************************

INSTANCE DIA_Snow_Find (C_INFO)
{
	npc				= Non_4024_Snow;
	nr				= 5;
	condition		= DIA_Snow_Find_Condition;
	information		= DIA_Snow_Find_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em tego z³odziejaszka."; 
};

FUNC INT DIA_Snow_Find_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bukhart_Thief))&&(snow_compleated == 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Snow_Find_Info()
{
	B_GiveXP (250);
	trol_cmp_trust = trol_cmp_trust + 1;
	snow_compleated = 1;
   
	AI_Output (other, self, "DIA_Snow_Find_15_01"); //Znalaz³em tego z³odziejaszka.
	AI_Output (self, other, "DIA_Snow_Find_11_02"); //Kto?
	AI_Output (other, self, "DIA_Snow_Find_15_03"); //To Bukhart majstrowa³ przy zapasach.
	AI_Output (self, other, "DIA_Snow_Find_11_04"); //Cholerny ochlej. Pewnie szuka³ piwska. Hmm, tylko ¿e alkohol nigdy nie zgin¹³...
	AI_Output (self, other, "DIA_Snow_Find_11_05"); //Wiêc czego on tam szuka³?

	Info_ClearChoices (DIA_Snow_Find);
	Info_AddChoice (DIA_Snow_Find, "To nie takie proste.", DIA_Snow_Find_Yes);
	Info_AddChoice (DIA_Snow_Find, "Nie mam pojêcia.", DIA_Snow_Find_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Snow_Find_Yes()
{
	TH_trust = TH_trust + 1;
	bukhart_trait = TRUE;
	snow_know = TRUE;
   
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_06"); //To nie takie proste.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_07"); //Bukhart to idiota, ale pewnie nie dzia³a³ sam. Mam racjê?
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_08"); //Tak, wiem, ¿e robi³ to w porozumieniu z Korthem.
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_09"); //Chodzi o ten zakaz Kiry z alkoholem.
	AI_Output (other, self, "DIA_Snow_Find_Yes_15_10"); //Bukhart krad³ towary, a Korth je... up³ynnia³.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_11"); //A niech to. Cwane skurczybyki. 
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_12"); //Zachowam to dla siebie, lepiej, ¿eby Kira siê o tym nie dowiedzia³a.
	AI_Output (self, other, "DIA_Snow_Find_Yes_11_13"); //Doceniam Twoj¹ szczeroœæ. WeŸ tê receptê, trudn¹ j¹ zdobyæ, a Tobie powinna siê przydaæ.
	
	CreateInvItems		(self, Recept_ItFo_Potion_Health_03, 1);//hp03 pot
	B_GiveInvItems		(self, other,Recept_ItFo_Potion_Health_03, 1);

	AI_Output (self, other, "DIA_Snow_Find_No_11_14"); //Dobra robota, bêdê o tym pamiêta³. Kira te¿ siê dowie, ¿e potrafisz sobie radziæ w ró¿nych sytuacjach.
	AI_Output (self, other, "DIA_Snow_Find_No_11_15"); //To mi wystarczy. Bywaj.

	Log_SetTopicStatus	(CH2_TRL_Thief, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Thief, "Powiedzia³em Snowowi, kto by³ z³odziejem i jakie by³y motywy. Wstawi siê za mn¹ u Kiry. Nie wiem tylko, czy ta szczeroœæ mi nie zaszkodzi.");
	B_LogEntry		(CH2_TRL_Quest, "Snow mnie poprze, to wcale nie by³o takie trudne.");
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Snow_Find_No()
{
	TH_trust = TH_trust + 1;	
	AI_Output (other, self, "DIA_Snow_Find_No_15_16"); //Nie mam pojêcia. Pewnie by³ g³odny.
	AI_Output (self, other, "DIA_Snow_Find_No_11_17"); //Mo¿liwe, Bukhart ca³y czas jest g³odny.
	AI_Output (self, other, "DIA_Snow_Find_No_11_18"); //W ka¿dym razie dziêki za pomoc. Bêdê o tym pamiêta³. Kira te¿ siê dowie, ¿e potrafisz sobie radziæ w ró¿nych sytuacjach.
	AI_Output (self, other, "DIA_Snow_Find_No_11_19"); //To mi wystarczy. Bywaj.
	
   Log_SetTopicStatus	(CH2_TRL_Thief, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Thief, "Powiedzia³em Snowowi, kto by³ z³odziejem, jednak przemilcza³em motywy Bukharta. Powiedzia³, ¿e poprze mnie przed Kir¹.");
	B_LogEntry		(CH2_TRL_Quest, "Snow mnie poprze, to wcale nie by³o takie trudne.");
	B_StopProcessInfos	(self); 
};