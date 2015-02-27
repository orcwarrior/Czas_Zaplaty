//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (Npc_GetAivar(self,AIV_PARTYMEMBER))
	{
		AI_Output (self, hero,"DIA_Milten_EXIT_02_00"); //Ruszamy w drogê.
	}
	else
	{
		AI_Output (self, hero,"DIA_Milten_EXIT_02_01"); //Do zobaczenia.
	};
   
	B_StopProcessInfos(self);
};

var int milten_think;
var int mil_ok;

//*********************************************

instance DIA_Milten_Guard (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 997;
	condition	= DIA_Milten_Guard_Condition;
	information	= DIA_Milten_Guard_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
};                       

FUNC INT DIA_Milten_Guard_Condition()
{
	return 1;
};

func VOID DIA_Milten_Guard_Info()
{
	AI_Output (self, other,"DIA_Milten_Guard_02_00"); //Czego tu szukasz przyb³êdo?
	AI_Output (other, self,"DIA_Milten_Guard_15_01"); //Co za mi³e przywitanie. I to w ustach faceta, który ubiera siê w sukienki.
	AI_Output (self, other,"DIA_Milten_Guard_02_02"); //Jak œmiesz! To Szata Ognia, ornament samego Innosa!
	AI_Output (other, self,"DIA_Milten_Guard_15_03"); //Bogowie ma³o mnie interesuj¹. Mo¿na powiedzieæ, ¿e oddajê im tak¹ sam¹ czeœæ jak¹ oni okazuj¹ ludziom. 
	AI_Output (other, self,"DIA_Milten_Guard_15_04"); //Jak dla mnie w odchodach œcierwojada mo¿na znaleŸæ wiêcej boskoœci ni¿ w twoich ornamentach.
	AI_Output (self, other,"DIA_Milten_Guard_02_05"); //BluŸnisz! ZejdŸ mi z oczu!
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Milten_CanYouTeachMe (C_INFO)
{
	npc				=  PC_MAGE;
	nr				= 4;
	condition		= DIA_Milten_CanYouTeachMe_Condition;
	information		= DIA_Milten_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Milten_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_Guard))
	{
		return 1;
	};
};

FUNC VOID DIA_Milten_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Milten_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_02"); //Hmm, mogê pomóc Ci lepiej zapamiêtaæ to z czym zetkniesz siê na co dzieñ.
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_03"); //Wtedy rzadziej bêdziesz siê uczy³ na w³asnych b³êdach.
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_04"); //Znam te¿ sporo tajników alchemii i wiem jak zwiêkszyæ moc duchow¹. 
   AI_Output (self, other, "DIA_Milten_CanYouTeachMe_15_05"); //Znam te¿ kilka zaklêæ, choæ nie wiem czy to dobry pomys³, ¿eby ciê tego uczyæ... 
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Milten mo¿e mi pomóc szybciej siê uczyæ. Wie te¿ sporo o alchemii i mocy duchowej. No i zna sporo magicznych formu³.");
};
//*********************************************
instance DIA_Milten_Teleport (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 978;
	condition	= DIA_Milten_Teleport_Condition;
	information	= DIA_Milten_Teleport_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Znasz sposób na to, by dostaæ siê do Starego Obozu?";
};                     

FUNC INT DIA_Milten_Teleport_Condition()
{
	if(Npc_KnowsInfo(hero,STT_Balam_Diego))
	{
		return 1;
	};
};

func VOID DIA_Milten_Teleport_Info()
{
	AI_Output (other, self,"DIA_Milten_Teleport_02_00"); //Znasz sposób na to, by dostaæ siê do Starego Obozu?
	AI_Output (self, other,"DIA_Milten_Teleport_02_01"); //Do Starego Obozu. A próbowa³eœ bram¹?
	AI_Output (other, self,"DIA_Milten_Teleport_15_02"); //Bardzo zabawne. A znasz jakiœ sposób, który nie skoñczy siê rozsiekaniem albo powieszeniem?
	AI_Output (self, other,"DIA_Milten_Teleport_02_03"); //To zale¿y kto chcia³by siê dostaæ do obozu.
	AI_Output (other, self,"DIA_Milten_Teleport_15_04"); //To cieñ, nazywa siê Diego.
	AI_Output (self, other,"DIA_Milten_Teleport_02_05"); //Diego... Tak, stary lis chce wróciæ do kurnika. Jakoœ mnie to nie dziwi.
	AI_Output (self, other,"DIA_Milten_Teleport_02_06"); //WeŸ ten zwój. To czar teleportacji, powinien jeszcze dzia³aæ.
	AI_Output (self, other,"DIA_Milten_Teleport_02_07"); //Tylko powiedz Diego, ¿e nie wiem, gdzie dok³adnie go przeniesie. Musi byæ przygotowany na ka¿d¹ ewentualnoœæ.
	AI_Output (other, self,"DIA_Milten_Teleport_15_08"); //Oby tylko nie trafi³ do sali tronowej.
	AI_Output (self, other,"DIA_Milten_Teleport_02_09"); //Chcia³bym zobaczyæ minê Gomeza, gdyby nagle Diego spad³ mu na g³owê...
	AI_Output (self, other,"DIA_Milten_Teleport_02_10"); //Aha i powiedz Diego, ¿e to prezent od starego przyjaciela.
	CreateInvItem(self,ItArScrollTeleport1);
	B_GiveInvItems(self,other,ItArScrollTeleport1,1);
	B_LogEntry		(CH3_RBL_Diego, "Milten odda³ mi zaklêcie, dziêki któremu Diego przeniesie sie do Starego Obozu omijaj¹c bramy i byæ mo¿e stra¿ników.");
};

//*********************************************

instance DIA_Milten_KatrakanatCollected (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 996;
	condition	= DIA_Milten_KatrakanatCollected_Condition;
	information	= DIA_Milten_KatrakanatCollected_Info;
	permanent	= 0;
	important	= 1;
	description 	= "";
};                       

FUNC INT DIA_Milten_KatrakanatCollected_Condition()
{
	if(Katrakanat_collected==TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_KatrakanatCollected_Info()
{
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_00"); //Jak sobie radzisz ze z³o¿eniem Katrakanatu?
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_01"); //Zdoby³em wszystkie czêœci.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_02"); //Niemo¿liwe!
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_03"); //Nadszed³ czas, by to co rozdarte, znów po³¹czy³o siê w ca³oœæ.
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_04"); //W takim razie nie przeszkadzam, bywaj.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_05"); //Nie tak szybko. Potrzebujemy jeszcze kilku przedmiotów do rytua³u.
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_06"); //Po prostu œwietnie.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_07"); //Wróæ na miejsce, w którym znalaz³eœ Katrakanat ze wszystkimi fragmentami, a tak¿e z pos¹¿kiem Innosa i wod¹ œwiêcon¹.
	AI_Output (self, other,"DIA_Milten_KatrakanatCollected_02_08"); //Porozmawiaj o tym z Ratfordem.	
	AI_Output (other, self,"DIA_Milten_KatrakanatCollected_15_09"); //Tak, jest! Znowu robiê za cholernego pos³añca.
	Katrakanat_collected=3;
	B_LogEntry(CH2_RBL_MysteryBook, "Œwietnie, znowu robiê za ch³opca na posy³ki. Tym razem muszê magom przynieœæ pos¹¿ek Innosa i wodê œwiêcon¹. Muszê porozmawiaæ z Ratfordem.");
};

//*********************************************

instance DIA_Milten_RickPassage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 996;
	condition	= DIA_Milten_RickPassage_Condition;
	information	= DIA_Milten_RickPassage_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Spójrz na ten pergamin.";
};                       

FUNC INT DIA_Milten_RickPassage_Condition()
{
	if(NPC_HasItems(hero,magpass)>=1)
	{
		return 1;
	};
};

func VOID DIA_Milten_RickPassage_Info()
{
	AI_Output (other, self,"DIA_Milten_RickPassage_15_00"); //Spójrz na ten pergamin.
	AI_Output (self, other,"DIA_Milten_RickPassage_02_01"); //Królewska pieczêæ. No dobra, skoro Cavalorn Ci ufa, to chyba nie mam wyboru.
	AI_Output (other, self,"DIA_Milten_RickPassage_15_02"); //Mogê wejœæ do œrodka?
	AI_Output (self, other,"DIA_Milten_RickPassage_02_03"); //WchodŸ, Leren na pewno siê ucieszy.
	AI_Output (self, other,"DIA_Milten_RickPassage_02_04"); //Mo¿esz te¿ skorzystaæ z naszych zapasów zwojów i roœlin.
	AI_Output (other, self,"DIA_Milten_RickPassage_15_05"); //Wielkie dziêki. Mo¿e coœ da siê wymieniæ na rudê...
	AI_Output (self, other,"DIA_Milten_RickPassage_02_06"); //Tak, pewnie, przecie¿ i tak byœ to ukrad³. Cholerni z³odzieje!
	Log_SetTopicStatus	(CH2_RBL_Mags, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Mags, "W koñcu magowie traktuj¹ mnie powa¿nie. Najwy¿sza pora rozejrzeæ siê po tej ich wie¿y.");
	ENTER_TO_MAGTOWER=TRUE;
	Npc_ExchangeRoutine	(self,"start");
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello1 (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello1_Condition;
	information	= DIA_Milten_Hello1_Info;
	permanent	= 0;
	important	= 0;
	description 	= "£adnie siê tutaj urz¹dziliœcie.";
};                       

FUNC INT DIA_Milten_Hello1_Condition()
{
	if (CAVALORN_ASK_TRAIL==2)
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello1_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello1_15_00"); //£adnie siê tutaj urz¹dziliœcie.
	AI_Output (self, other,"DIA_Milten_Hello1_02_01"); //Miejsce dobre jak ka¿de inne, przynajmniej mieliœmy spokój. A¿ do dzisiaj...
	AI_Output (self, other,"DIA_Milten_Hello1_02_02"); //Kim jesteœ i czego tu szukasz?
	AI_Output (other, self,"DIA_Milten_Hello1_15_03"); //Niewa¿ne kim jestem, wa¿ne co mogê Ci zaoferowaæ.
	AI_Output (self, other,"DIA_Milten_Hello1_02_04"); //Ty?! Nie b¹dŸ œmieszny, jesteœ kolejnym g³upcem, który uwa¿a siê za sprytnego, tylko dlatego, ¿e zdoby³ przepustkê.

	AI_PlayAni (self,"T_PRACTICEMAGIC3");
	/********************************

	Tutaj mo¿naby daæ animacjê wyci¹gniêcia kuli ognia
	*******************************/

	AI_Output (self, other,"DIA_Milten_Hello1_02_05"); //Daj mi chocia¿ jeden dobry powód, dla którego nie mia³bym zamieniæ Ciê w kupê popio³u.
	
	AI_PlayAni (self,"R_SCRATCHHEAD");

	/****************************
	Schowanie kuli i ta animacja z otrzepywaniem poparzonego rêkawa 
	****************************/

	AI_Output (other, self,"DIA_Milten_Hello1_15_06"); //Zamierzam zg³êbiæ magiczne sztuki!
	AI_Output (self, other,"DIA_Milten_Hello1_02_07"); //Co?! Nie doœæ, ¿e g³upi to jeszcze szalony! To nie jest szkó³ka niedzielna!
	AI_Output (other, self,"DIA_Milten_Hello1_15_08"); //Wiem, dlatego przyby³em zaoferowaæ wam swoje us³ugi.
	AI_Output (self, other,"DIA_Milten_Hello1_02_09"); //W zamian za co?
	AI_Output (other, self,"DIA_Milten_Hello1_15_10"); //Za naukê oczywiœcie.
	AI_Output (self, other,"DIA_Milten_Hello1_02_11"); //A dlaczego uwa¿asz, ¿e Twoje us³ugi mog¹ siê nam przydaæ? Sk¹d pomys³, ¿e w ogóle potrzebujemy jakiejkolwiek pomocy?

	Info_ClearChoices (DIA_Milten_Hello1);
	//ToFix: Hero na tamten czas ani wogole nie mog³ scalic katrakanatu - katra to scie¿ka ³owcy
	if (Npc_KnowsInfo(hero,DIA_Cavalorn_Demon))
	{
		Info_AddChoice (DIA_Milten_Hello1, "To ja scali³em Katrakanat!", DIA_Milten_Hello1_Katra);
	};

	Info_AddChoice (DIA_Milten_Hello1, "Magia to potêga, która zwalczy... moich wrogów.", DIA_Milten_Hello1_Power);
	Info_AddChoice (DIA_Milten_Hello1, "Chcê pod¹¿yæ œcie¿k¹ pokory.", DIA_Milten_Hello1_Ok);
	Info_AddChoice (DIA_Milten_Hello1, "A dlaczego nie?", DIA_Milten_Hello1_Why);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Katra()
{
	milten_think = B_SetDayTolerance()+1;
	mil_ok = TRUE;
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_00"); //To ja scali³em Katrakanat!
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_01"); //I uwa¿asz, ¿e to powód do dumy?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_02"); //Nie, ale nie mia³em wyboru. Musia³em spróbowaæ i... przegra³em.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_03"); //Hmm, to nie cel jest wa¿ny, lecz droga, która ku niemu zmierza...
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_04"); //Mimo to przekona³eœ mnie. Jest w Tobie coœ... Iskra, któr¹ ju¿ w kimœ widzia³em.
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_05"); //Kim on by³?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_06"); //Kim jest. To przyjaciel, który sam wybra³ swoje przeznaczenie. Niewa¿ne, mo¿e go kiedyœ poznasz...
	AI_Output (other, self,"DIA_Milten_Hello1_Katra_15_07"); //Od czego zaczniemy?
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_08"); //Od pokory oczywiœcie.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_09"); //Staram siê zg³êbiæ sztukê alchemii i uzdrawiania. Jednak potrzebujê do tego wielu sk³adników i wiedzy spisywanej w uczonych zwojach.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_10"); //Dam Ci listê sk³adników, których bêdê potrzebowa³.
	AI_Output (self, other,"DIA_Milten_Hello1_Katra_02_11"); //PrzyjdŸ po ni¹ jutro, muszê zdecydowaæ, które ingrediencje s¹ dla mnie najwa¿niejsze...
	if (mag_knows == FALSE)
	{
		mag_knows = TRUE;
		Log_CreateTopic	(CH2_RBL_Magic, LOG_MISSION);
		Log_SetTopicStatus	(CH2_RBL_Magic, LOG_RUNNING);
	};

	B_LogEntry		(CH2_RBL_Magic, "Milten zgodzi³ siê zostaæ moim... przewodnikiem. Nauczy mnie magii, ale muszê byæ pos³uszny i jak znam ¿ycie spe³niaæ ka¿d¹ zachciankê magów. Myœlê, ¿e jednak warto siê tak poœwiêcaæ...");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Power()
{
	AI_Output (other, self,"DIA_Milten_Hello1_Power_15_00"); //Magia to potêga, która zwalczy... moich przeciwników.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_01"); //Tak, a przyjació³ zamieni we wrogów.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_02"); //Magia nie mo¿e byæ tylko narzêdziem zniszczenia, musi tak¿e tworzyæ i dawaæ ¿ycie. Magia to równowaga wszystkich si³ jakie w³adaj¹ œwiatem œmiertelników.
	AI_Output (self, other,"DIA_Milten_Hello1_Power_02_03"); //Zapamiêtaj to, je¿eli chcesz wst¹piæ na Œcie¿kê Ognia.
	Info_ClearChoices (DIA_Milten_Hello1);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Ok()
{
	milten_think = B_SetDayTolerance()+1;
	mil_ok = TRUE;
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_00"); //Chcê pod¹¿yæ œcie¿k¹ pokory.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_01"); //Dlaczego?
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_02"); //Chcê poznaæ samego siebie, chcê zapanowaæ nad ogniem gniewu i zamieniæ go w lód spokoju. To jest mój cel.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_03"); //Nie cel jest wa¿ny, lecz droga, która ku niemu zmierza...
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_04"); //Mimo to przekona³eœ mnie. Jest w tobie coœ... Iskra, któr¹ ju¿ w kimœ widzia³em.
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_05"); //Kim on by³?
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_06"); //Kim jest. To przyjaciel, który sam wybra³ swoje przeznaczenie. Niewa¿ne, mo¿e go jeszcze poznasz...
	AI_Output (other, self,"DIA_Milten_Hello1_Ok_15_07"); //Od czego zaczniemy?
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_08"); //Od pokory oczywiœcie.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_09"); //Staram siê zg³êbiæ sztukê alchemii i uzdrawiania. Jednak potrzebujê do tego wielu sk³adników i wiedzy spisywanej na uczonych zwojach.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_10"); //Dam Ci listê sk³adników, których bêdê potrzebowa³.
	AI_Output (self, other,"DIA_Milten_Hello1_Ok_02_11"); //PrzyjdŸ jutro, muszê zdecydowaæ, które ingrediencje s¹ dla mnie najwa¿niejsze...
	Log_CreateTopic	(CH2_RBL_Magic, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Magic, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Magic, "Milten zgodzi³ siê zostaæ moim... przewodnikiem. Nauczy mnie magii, ale muszê byæ pos³uszny i jak znam ¿ycie spe³niaæ ka¿d¹ zachciankê magów. Myœlê, ¿e jednak warto siê tak poœwiêcaæ...");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Hello1_Why()
{
	AI_Output (other, self,"DIA_Milten_Hello1_Why_15_00"); //A dlaczego nie?
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_01"); //Nie pozna magii ten, który nie zdaje sobie sprawy z tego, czemu ona s³u¿y.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_02"); //Jesteœ jak wypalone naczynie, sito, przez które przelewa siê woda ¿ycia.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_03"); //Musisz wiedzieæ, co chcesz osi¹gn¹æ, aby poznaæ samego siebie i cel swej podró¿y.
	AI_Output (self, other,"DIA_Milten_Hello1_Why_02_04"); //Magia to œcie¿ka wyboru, nie przypadku.
	Info_ClearChoices (DIA_Milten_Hello1);
};

//*********************************************

instance DIA_Milten_Plants (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_Plants_Condition;
	information	= DIA_Milten_Plants_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Prosi³eœ mnie, ¿ebym przyszed³ po listê.";
};                       

FUNC INT DIA_Milten_Plants_Condition()
{
	if (mil_ok == TRUE)&&(milten_think <= (Wld_GetDay()))
	{
		return 1;
	};
};

func VOID DIA_Milten_Plants_Info()
{
	AI_Output (other, self,"DIA_Milten_Plants_15_00"); //Prosi³eœ mnie, ¿ebym przyszed³ po listê.
	AI_Output (self, other,"DIA_Milten_Plants_02_01"); //W rzeczy samej. To nie by³o ³atwe, ale w koñcu zdecydowa³em, które roœliny s¹ mi najbardziej potrzebne.
	AI_Output (self, other,"DIA_Milten_Plants_02_02"); //Oto lista ingrediencji.
	CreateInvItems (self, milten_list,1); 
	B_GiveInvItems (self, other, milten_list, 1);
	AI_Output (self, other,"DIA_Milten_Plants_02_03"); //Musisz przynieœæ wszystkie sk³adniki i staraj siê ich nie zniszczyæ. Musz¹ byæ w idealnym stanie!
	AI_Output (other, self,"DIA_Milten_Plants_15_04"); //Zrobiê co w mojej mocy, magu.
	AI_Output (self, other,"DIA_Milten_Plants_02_05"); //Ruszaj wiêc i... umyj siê, bo strasznie cuchniesz.
	Log_CreateTopic	(CH2_RBL_Plants, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Plants, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Plants, "Dosta³em listê sk³adników od Miltena. A¿ siê bojê do niej zagl¹daæ. Ten mag zaczyna mi dzia³aæ na nerwy.");
};

//*********************************************

instance DIA_Milten_Plantsd (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 3;
	condition	= DIA_Milten_Plantsd_Condition;
	information	= DIA_Milten_Plantsd_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Gdzie mogê znaleŸæ smoczy korzeñ?";
};                       

FUNC INT DIA_Milten_Plantsd_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsd_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsd_15_00"); //Gdzie mogê znaleŸæ smoczy korzeñ?	
	AI_Output (self, other,"DIA_Milten_Plantsd_02_01"); //Mo¿liwe, ¿e na terenach orków, ale nie jestem pewien.
	AI_Output (self, other,"DIA_Milten_Plantsd_02_02"); //Kiedyœ gdy potrzebowa³em smoczego korzenia, przyniós³ mi go Leaf. Porozmawiaj z nim, mo¿e dowiesz siê czegoœ wiêcej.
	B_LogEntry(CH2_RBL_Plants, "Smoczy korzeñ mo¿e rosn¹æ na terenach orków. Podobno wczeœniej Leaf przyniós³ korzeñ Miltenowi - powinienem pogadaæ z tym rebeliantem.");
};

//*********************************************

instance DIA_Milten_Plantsda (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 4;
	condition	= DIA_Milten_Plantsda_Condition;
	information	= DIA_Milten_Plantsda_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Nie wiedzia³em, ¿e w Kolonii rosn¹ dêby.";
};                       

FUNC INT DIA_Milten_Plantsda_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsda_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsda_15_00"); //Nie wiedzia³em, ¿e w Kolonii rosn¹ dêby.
	AI_Output (self, other,"DIA_Milten_Plantsda_02_01"); //Nie ma ich wiele, ale rzeczywiœcie mo¿na je tu spotkaæ. 
	AI_Output (self, other,"DIA_Milten_Plantsda_02_02"); //Wiem, ¿e jakiœ idiota w obozie pêdzi z liœci i ¿o³êdzi dêbu samogon.
	AI_Output (other, self,"DIA_Milten_Plantsda_15_03"); //Dlaczego od razu idiota?
	AI_Output (self, other,"DIA_Milten_Plantsda_02_04"); //Bo w takim stê¿eniu i w po³¹czeniu z alkoholem, z takiego samogonu robi siê wypalaj¹ca trzewia trucizna.
	AI_Output (other, self,"DIA_Milten_Plantsda_15_05"); //I w³aœnie o to chodzi, magu.
	AI_Output (self, other,"DIA_Milten_Plantsda_02_06"); //Co? Wszyscy jesteœcie niespe³na rozumu. IdŸ ju¿!

	B_LogEntry(CH2_RBL_Plants, "Dêby rosn¹ w tutejszych lasach, jednak nie ma ich zbyt wiele. Podobno ktoœ w obozie pêdzi z liœci i ¿o³êdzi bimber. Hmm, przychodzi mi na myœl tylko Piwosz.");
};

//*********************************************

instance DIA_Milten_Plantsdb (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 5;
	condition	= DIA_Milten_Plantsdb_Condition;
	information	= DIA_Milten_Plantsdb_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Nasienie czerwonego buku?";
};                       

FUNC INT DIA_Milten_Plantsdb_Condition()
{
	if (milten_inged == TRUE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Plantsdb_Info()
{
	AI_Output (other, self,"DIA_Milten_Plantsdb_15_00"); //Nasienie czerwonego buku?
	AI_Output (self, other,"DIA_Milten_Plantsdb_02_01"); //Wiem, brzmi dziwnie, ale to prawda. To ma³e cholerstwo mo¿na znaleŸæ w tutejszych lasach.
	AI_Output (self, other,"DIA_Milten_Plantsdb_02_02"); //Kilka dni temu zap³aci³em Harkowi 200 bry³ek za jedno z nasion. Mówi³, ¿e przyniesie mi wiêcej, ale od tego czasu ucieka na mój widok.
	AI_Output (other, self,"DIA_Milten_Plantsdb_15_03"); //W porz¹dku, porozmawiam z nim.	
	B_LogEntry		(CH2_RBL_Plants, "Hark podobno wie, gdzie mo¿na znaleŸæ nasiona czerwonego buku.");
};

//*********************************************
var int Milten_has_plants;
instance DIA_Milten_PlantsAll (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 5;
	condition	= DIA_Milten_PlantsAll_Condition;
	information	= DIA_Milten_PlantsAll_Info;
	permanent	= 1;
	important	= 0;
	description 	= "Mam ju¿ wszystkie ingrediencje.";
};                       

FUNC INT DIA_Milten_PlantsAll_Condition()
{
	if (milten_inged == TRUE) && (!Milten_has_plants) && (Npc_KnowsInfo(hero,DIA_Milten_Plantsdb))
   && (Npc_KnowsInfo(hero,DIA_Milten_Plantsda)) && (Npc_KnowsInfo(hero,DIA_Milten_Plantsd))
	{
		return 1;
	};
};

func VOID DIA_Milten_PlantsAll_Info()
{
	AI_Output (other, self,"DIA_Milten_PlantsAll_15_00"); //Mam ju¿ wszystkie ingrediencje.
	AI_Output (self, other,"DIA_Milten_PlantsAll_02_01"); //Naprawdê?
	if ((NPC_HasItems(other,dragon_root)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_OrcHerb_02)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_Bloodwood_01)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_Seraphis_01)>=3)&&
		(NPC_HasItems(other,ItFo_Plants_mushroom_01)>=5)&&
		(NPC_HasItems(other,ItMi_Alchemy_Alcohol_01)>=1)&&
		(NPC_HasItems(other,ItAt_WolfTeeth)>=5)&&
		(NPC_HasItems(other,ItFo_Plants_OrcHerb_01)>=3)&&
		(NPC_HasItems(other,ItAt_Bloodfly_02)>=1)&&
		(NPC_HasItems(other,ItFo_Plants_RavenHerb_01)>=2)&&
		(NPC_HasItems(other,ItFo_Plants_Bloodwood_01)>=1))
	//TODO: Check it (UP)
	{
      Milten_has_plants = true;
		mag_prove = mag_prove + 1;
		B_GiveXP(750);
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_02"); //Rzeczywiœcie zebra³eœ wszystkie sk³adniki!
		B_GiveInvItems (other, self, dragon_root,1);
		B_GiveInvItems (other, self, ItFo_Plants_OrcHerb_02,1);
		B_GiveInvItems (other, self, ItFo_Plants_Bloodwood_01,1);
		B_GiveInvItems (other, self, ItFo_Plants_Seraphis_01,3);
		B_GiveInvItems (other, self, ItFo_Plants_mushroom_01,5);
		B_GiveInvItems (other, self, ItMi_Alchemy_Alcohol_01,1);
		B_GiveInvItems (other, self, ItAt_WolfTeeth,5);
		B_GiveInvItems (other, self, ItFo_Plants_OrcHerb_01,3);
		B_GiveInvItems (other, self, ItAt_Bloodfly_02,1);
		B_GiveInvItems (other, self, ItFo_Plants_RavenHerb_01,2);
		B_GiveInvItems (other, self, ItFo_Plants_Bloodwood_01,1);

		Npc_RemoveInvItems(self,dragon_root,1);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,3);
		Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,5);
		Npc_RemoveInvItems(self,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(self,ItAt_WolfTeeth,5);
		Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_01,3);
		Npc_RemoveInvItems(self,ItAt_Bloodfly_02,1);
		Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,2);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_03"); //Jestem pod wra¿eniem. WeŸ to, naprawdê zas³u¿y³eœ na te mikstury.

		CreateInvItems (self,  ItFo_Potion_HP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_MP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_DEX_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_Str_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_HP_MP_2_temp,1);
		CreateInvItems (self,  ItFo_Potion_Prot_Total_2_temp,1);	
		
		B_GiveInvItems (self, other, ItFo_Potion_HP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_MP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_DEX_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_Str_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_HP_MP_2_temp,1);
		B_GiveInvItems (self, other, ItFo_Potion_Prot_Total_2_temp,1);
		/*********************************
	Ork niech milten da mu te mikstury czasowo zmieniaj¹ce atrybuty, kilka ró¿nych.

	*********************************/
		AI_Output (other, self,"DIA_Milten_PlantsAll_15_04"); //A co z nauk¹?
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_05"); //Na to przyjdzie jeszcze czas.
		AI_Output (other, self,"DIA_Milten_PlantsAll_15_06"); //Powiedzia³eœ, ¿e...
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_07"); //Wybacz, jestem bardzo zajêtym cz³owiekiem. W koñcu mam wszystkie sk³adniki...
		Log_SetTopicStatus	(CH2_RBL_Plants, LOG_SUCCESS);
		B_LogEntry		(CH2_RBL_Plants, "Dostarczy³em Miltenowi wszystkich sk³adników, a on najzwyczajniej w œwiecie poszed³ mieszaæ w kotle te cholerne mikstury! Powiedzia³, ¿e przyjdzie jeszcze czas na naukê - mam nadziejê, ¿e do¿yjê tej chwili.");
		B_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_PlantsAll_02_08"); //Nie masz wszystkiego, wróæ jak uzbierasz sk³adniki.
		B_StopProcessInfos	(self);
	};
};

//*********************************************

instance DIA_Milten_Ask (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 6;
	condition	= DIA_Milten_Ask_Condition;
	information	= DIA_Milten_Ask_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Co dalej?";
};                       

FUNC INT DIA_Milten_Ask_Condition()
{
	if (mag_prove == 2)
	{
		return 1;
	};
};

func VOID DIA_Milten_Ask_Info()
{
	AI_Output (other, self,"DIA_Milten_Ask_15_00"); //Co dalej?
	AI_Output (self, other,"DIA_Milten_Ask_02_01"); //A co ma byæ?
	AI_Output (other, self,"DIA_Milten_Ask_15_02"); //Wykona³em wasze zlecenia. Nadal chcê poznaæ tajniki magii. Mo¿e byœcie mnie w koñcu czegoœ nauczyli!
	AI_Output (self, other,"DIA_Milten_Ask_02_03"); //Porozmawiaj z Lerenem, on na pewno coœ wymyœli, ¿eby utrudniæ Ci ¿ycie.

	// akw_ring

	// powi¹zanie z magami wody, krêgiem i zniszczeniem bariery
};

//*********************************************

instance DIA_Milten_Eqquipment (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 7;
	condition	= DIA_Milten_Eqquipment_Condition;
	information	= DIA_Milten_Eqquipment_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Wybra³em drogê magii.";
};                       

FUNC INT DIA_Milten_Eqquipment_Condition()
{
	if (other.guild == GIL_MAG)
	{
		return 1;
	};
};

func VOID DIA_Milten_Eqquipment_Info()
{
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_00"); //Wybra³em drogê magii.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_01"); //No proszê, konkurencja mi roœnie. Masz siê nie tykaæ alchemii, zrozumiano?!
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_02"); //Ekhm, dobrze. Przyda³oby mi siê jakieœ wyposa¿enie godne... maga.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_03"); //Tak, oczywiœcie. Mam tu gdzieœ Wielki Kostur Ognistych Zamieci i Szatê Pijanego Arcymistrza.
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_04"); //Naprawdê?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_05"); //Nie do cholery! A mia³em Ciê za bardziej rozgarniêtego.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_06"); //Ka¿dy myœli, ¿e magowie to kasta wybrañców, ¿e to pomazañcy boga i takie tam bzdury.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_07"); //Ale to nie szata czyni magiem, ale umys³ i serce. 
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_08"); //To nie kostur da Ci si³ê, ale wiara i silna wola.
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_09"); //Zapamiêtaj to, a po¿yjesz d³u¿ej ni¿ przeciêtny idiota w Kolonii.
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_10"); //To dostanê w koñcu jakieœ szmaty?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_11"); //Od razu lepiej. Tak, mam dla Ciebie kostur i jedn¹ z run. Wybierz t¹, która bardziej Ci odpowiada.
	
	/*************************
	ork to ma byæ kostur, ale coœ ¿adnego nie znalaz³em
	*************************/

	CreateInvItems (self, MAG_MW_01, 1);
	B_GiveInvItems (self, other, MAG_MW_01, 1);	
	AI_Output (other, self,"DIA_Milten_Eqquipment_15_12"); //A co mam do wyboru?
	AI_Output (self, other,"DIA_Milten_Eqquipment_02_13"); //Sopel lodu albo ognisty pocisk.
	Info_ClearChoices (DIA_Milten_Eqquipment);
	Info_AddChoice (DIA_Milten_Eqquipment, "Niech bêdzie ognisty pocisk.", DIA_Milten_Eqquipment_Fire);
	Info_AddChoice (DIA_Milten_Eqquipment, "Wybieram sopel lodu.", DIA_Milten_Eqquipment_Ice);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Eqquipment_Fire()
{
	CreateInvItems (self,ItArRuneFirebolt,1);
	B_GiveInvItems (self, other, ItArRuneFirebolt, 1);
	AI_Output (other, self,"DIA_Milten_Eqquipment_Fire_15_00"); //Niech bêdzie ognisty pocisk.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Fire_02_01"); //To œwietny wybór, bêdziesz móg³ bez u¿ywania mózgu rozpaliæ ognisko, albo przypaliæ dupê jakiemuœ idiocie.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Fire_02_02"); //Tylko nie rzucaj tym w orka, bo nawet siê nie zorientujesz, co Ciê zabi³o.
	AI_Output (other, self,"DIA_Milten_Eqquipment_Fire_15_03"); //Bardzo œmieszne...
	
   B_eqquip_check_mag();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta³em od Miltena kostur i ognisty pocisk.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Milten_Eqquipment_Ice()
{
	CreateInvItems (self,ItArRuneThunderbolt,1);
	B_GiveInvItems (self, other, ItArRuneThunderbolt, 1);
	AI_Output (other, self,"DIA_Milten_Eqquipment_Ice_15_00"); //Wybieram sopel lodu.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Ice_02_01"); //Tak, to œwietny wybór, bêdziesz móg³ skutecznie sch³odziæ piwo albo wino. Wszystkie opoje w obozie bêd¹ Ciê za to nosiæ na rêkach.
	AI_Output (self, other,"DIA_Milten_Eqquipment_Ice_02_02"); //Tylko nie rzucaj tym w orka, bo nawet siê nie zorientujesz, co Ciê zabi³o.
	AI_Output (other, self,"DIA_Milten_Eqquipment_Ice_15_03"); //Bardzo œmieszne...

	B_eqquip_check_mag();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta³em od Miltena kostur i sopel lodu.");
	B_StopProcessInfos	(self);
};

//*********************************************

instance DIA_Milten_Cristals (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 8;
	condition	= DIA_Milten_Cristals_Condition;
	information	= DIA_Milten_Cristals_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Przysy³a mnie Leren.";
};                       

FUNC INT DIA_Milten_Cristals_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Leren_AlmanachReadAfter))
	{
		return 1;
	};
};

func VOID DIA_Milten_Cristals_Info()
{
	AI_Output (other, self,"DIA_Milten_Cristals_15_00"); //Przysy³a mnie Leren.
	AI_Output (self, other,"DIA_Milten_Cristals_02_02"); //Chodzi o gwiezdne kryszta³y?
	AI_Output (other, self,"DIA_Milten_Cristals_15_03"); //Dok³adnie.
	AI_Output (self, other,"DIA_Milten_Cristals_02_04"); //Rozwi¹zanie jest doœæ proste.
	AI_Output (self, other,"DIA_Milten_Cristals_02_05"); //Jaszczurka, która opisa³a tê historiê mia³a na myœli kryszta³y niewiadomego pochodzenia, które czasami spadaj¹ na ziemiê w deszczu meteorytów.
	AI_Output (self, other,"DIA_Milten_Cristals_02_06"); //S¹ to bardzo rzadkie minera³y, ale dla magów s¹ bezcenne, gdy¿ potrafi¹ skumulowaæ niewyobra¿alne pok³ady energii.
	AI_Output (self, other,"DIA_Milten_Cristals_02_07"); //Do tego masz szczêœcie, bo to czego szukasz jest na wyci¹gniêcie rêki.
	AI_Output (other, self,"DIA_Milten_Cristals_15_08"); //Czyli?
	AI_Output (self, other,"DIA_Milten_Cristals_02_09"); //Niedawno kilku takich kryszta³ów szuka³ mój przyjaciel, w Kolonii nazywaj¹ go Bezimiennym.
	AI_Output (other, self,"DIA_Milten_Cristals_15_10"); //Znalaz³ je?
	AI_Output (self, other,"DIA_Milten_Cristals_02_11"); //Z tego co wiem, tak. Wszystkie trafi³y w rêce Saturasa. Kryszta³y te zosta³y u¿yte przez nas podczas tworzenia magicznej Bariery.
	AI_Output (self, other,"DIA_Milten_Cristals_02_12"); //Nazywaj¹ siê Kamieniami Ogniskuj¹cymi.
	AI_Output (self, other,"DIA_Milten_Cristals_02_13"); //Jednak do zaabsorbowania tak ogromnej mocy jak¹ mo¿e w sobie nosiæ Bestia bêdziesz potrzebowa³ czegoœ wiêcej.
	AI_Output (other, self,"DIA_Milten_Cristals_15_14"); //Mów jaœniej.
	AI_Output (self, other,"DIA_Milten_Cristals_02_15"); //Wszystkiego dowiesz siê w swoim czasie. Przynieœ mi Kamienie Ogniskuj¹ce, a wtedy powiem Ci co dalej.
	AI_Output (other, self,"DIA_Milten_Cristals_15_16"); //Chyba nie mam wyboru.
	Log_CreateTopic	(CH4_RBL_FocusStones, LOG_MISSION);
	Log_SetTopicStatus	(CH4_RBL_FocusStones, LOG_RUNNING);
	B_LogEntry		(CH4_RBL_FocusStones, "Milten twierdzi, ¿e Gwiezdnymi Kryszta³ami mog¹ byæ Kamienie Ogniskuj¹ce, których magowie u¿yli do stworzenia Magicznej Bariery. Jakiœ Bezimienny odnalaz³ wszystkie kamienie i odda³ je Saturasowi.");

	B_LogEntry		(CH4_RBL_Almanach, "Gwiezdne Kryszta³y to nic wiêcej jak Kamienie Ogniskuj¹ce, które podobno posiada Saturas. Muszê je zdobyæ!");
};

//*********************************************

instance DIA_Milten_Stones (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 9;
	condition	= DIA_Milten_Stones_Condition;
	information	= DIA_Milten_Stones_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Zdoby³em kamienie ogniskuj¹ce.";
};                       

FUNC INT DIA_Milten_Stones_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Nefarius_Success))&&(NPC_HasItems(other,Focus_2)>=1)&&(NPC_HasItems(other,Focus_3)>=1)&&(NPC_HasItems(other,Focus_4)>=1)&&(NPC_HasItems(other,Focus_5)>=1)
	{
		return 1;
	};
};

func VOID DIA_Milten_Stones_Info()
{
	AI_Output (other, self,"DIA_Milten_Stones_15_01"); //Zdoby³em kamienie ogniskuj¹ce.
	AI_Output (self, other,"DIA_Milten_Stones_02_02"); //To œwietnie, daj mi je.
	B_GiveInvItems (other, self, Focus_2, 1);
	B_GiveInvItems (other, self, Focus_3, 1);
	B_GiveInvItems (other, self, Focus_4, 1);
	B_GiveInvItems (other, self, Focus_5, 1);
	AI_Output (self, other,"DIA_Milten_Stones_02_03"); //A jednak mia³em racjê!
	AI_Output (other, self,"DIA_Milten_Stones_15_04"); //Co siê sta³o?
	AI_Output (self, other,"DIA_Milten_Stones_02_05"); //D³ugo zastanawia³em siê dlaczego Bariera wymknê³a siê nam spod kontroli.
	AI_Output (self, other,"DIA_Milten_Stones_02_06"); //W koñcu doszed³em do wniosku, ¿e jakaœ tajemnicza si³a musia³a rozsynchronizowaæ kryszta³y podczas rytua³u.
	AI_Output (self, other,"DIA_Milten_Stones_02_07"); //Teraz mam na to dowód. Kryszta³y rzeczywiœcie emituj¹ energiê na ró¿nych poziomach.
	AI_Output (self, other,"DIA_Milten_Stones_02_08"); //Je¿eli chcemy ich u¿yæ w rytuale, to musz¹ byæ jak jedno. Daj mi chwilê, muszê siê skoncentrowaæ...
	Ai_Wait (self,2.0);	
	AI_PlayAni (self,"T_PRACTICEMAGIC4");
	AI_TurnToNpc 			(self,other);	
	AI_Output (self, other,"DIA_Milten_Stones_02_09"); //I jeszcze tylko to...
	Wld_PlayEffect("spellFX_INCOVATION_GREEN", self, self, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni (self,"T_PRACTICEMAGIC2");
	B_WhirlAround		(self, hero);
	AI_Output (self, other,"DIA_Milten_Stones_02_10"); //W porz¹dku, kamienie s¹ ju¿ zsynchronizowane. Oddaj je Lerenowi i powodzenia podczas rytua³u.
	B_GiveInvItems (self, other, Focus_2, 1);
	B_GiveInvItems (self, other, Focus_3, 1);
	B_GiveInvItems (self, other, Focus_4, 1);
	B_GiveInvItems (self, other, Focus_5, 1);
	AI_Output (other, self,"DIA_Milten_Stones_15_11"); //Dziêki, Milten. Bardzo mi pomog³eœ.
	AI_Output (self, other,"DIA_Milten_Stones_02_12"); //Ca³a przyjemnoœæ po mojej stronie, przyjacielu.

	Log_SetTopicStatus	(CH4_RBL_FocusStones, LOG_SUCCESS);
	B_LogEntry		(CH4_RBL_FocusStones, "Milten zsynchronizowa³ kryszta³y teraz pulsuj¹ jak jeden twór. Szanse na powodzenie rytua³u zdecydowanie wzros³y.");
};

INSTANCE Dia_Milten_meeting (C_INFO)
{
	npc				= PC_MAGE;
	nr				= 40;
	condition		= Dia_Milten_meeting_Condition;
	information		= Dia_Milten_meeting_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT Dia_Milten_meeting_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Meeting2))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

func void Dia_Milten_meeting_Info()
{
   AI_Output (self, other, "DIA_Milten_Meeting_07_05"); //Zrobimy wszystko, co w naszej mocy.
   
   B_StopProcessInfos(self);
};