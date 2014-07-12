// **************************************************
// 			    Dla kretoszczurów EXIT 
// **************************************************
prototype Snaf_Molerat_Exit (C_INFO)
{
	npc			=  Snf_Molerat1;
	nr			=  999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

INSTANCE DIA_Snf_Molerat1_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat1;
};

INSTANCE DIA_Snf_Molerat2_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat2;
};

INSTANCE DIA_Snf_Molerat3_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat3;
};

INSTANCE DIA_Snf_Molerat4_Exit (Snaf_Molerat_Exit)
{
	npc			= Snf_Molerat4;
};

var int Mis_Snaf_WolfSpawned;

FUNC VOID Rtn_MolKillerWolf_1050010 ()
{
	TA_FollowPC	(07,15,07,14,"OC_MOAT_18");
};

FUNC VOID MIS_SNAF_WOLFSPAWN_SCRIPT_FUNC()
{
	if(!Mis_Snaf_WolfSpawned)&&(snaf_help)
	{
		Mis_Snaf_WolfSpawned=TRUE;
		Wld_InsertNpc(Snf_MolKiller_Wolf,"OC_MOAT_18");
		Wld_InsertNpc(Snf_MolKiller_Wolf,"OC_MOAT_18");
	};
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (Snaf_Molerat_Exit)
{
	npc			= RBL_581_Snaf;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 1;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak leci?"; 
};

FUNC INT DIA_Snaf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nienajgorzej. Cz³owiek, który umie dobrze gotowaæ, ma tutaj wielu przyjació³.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Chcesz mo¿e trochê ry¿owej zupy?
	AI_Output (other, self,"DIA_Snaf_Hello_15_07"); //Pewnie!
	AI_Output (self, other,"DIA_Snaf_Hello_01_08");	//Móg³byœ coœ dla mnie zrobiæ...
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
var int snaf_help; 
var int snaf_help_no; 
var int scoop_ok;
// **************************************************

INSTANCE DIA_Snaf_Help (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Help_Condition;
	information		= DIA_Snaf_Help_Info;
	permanent		= 0;
	description		="Co takiego?";
};

FUNC INT DIA_Snaf_Help_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Help_Info()
{
	AI_Output (other, self,"DIA_Snaf_Help_15_00"); //Co takiego?
	AI_Output (self, other,"DIA_Snaf_Help_01_01"); //Wczoraj zaatakowa³y mnie wilki. Jakoœ je przepêdzi³em, ale sukinsyny poharata³y mi nogê.
	AI_Output (self, other,"DIA_Snaf_Help_01_02"); //Do tego zgubi³em moj¹ ulubion¹ warzechê!
	AI_Output (self, other,"DIA_Snaf_Help_01_03"); //Ty jesteœ tu nowy, wiêc jak obyczaj nakazuje musisz wkupiæ siê w ³aski reszty.
	AI_Output (other, self,"DIA_Snaf_Help_15_04"); //Ale co mia³bym zrobiæ?	
	AI_Output (self, other,"DIA_Snaf_Help_01_05"); //To proste. Wyprowadzisz na popas moje kretoszczury. 
	AI_Output (other, self,"DIA_Snaf_Help_15_06"); //A gdzie niby mia³bym je zaprowadziæ?
	AI_Output (self, other,"DIA_Snaf_Help_01_07"); //Pastwisko znajdziesz za wschodni¹ bram¹, nieopodal po³udniowego wejœcia do Starego Obozu.
	AI_Output (self, other,"DIA_Snaf_Help_01_08"); //To jak bêdzie?
	Log_CreateTopic(CH1_Rbl_SnafHelp, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafHelp, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafHelp, "Snaf poprosi³ mnie, ¿ebym popasa³ jego kretoszczury.");
	Info_ClearChoices(DIA_Snaf_Help);
	Info_AddChoice	 (DIA_Snaf_Help, "W porz¹dku." ,DIA_Snaf_Help_Yes);
	Info_AddChoice	 (DIA_Snaf_Help, "Chyba zg³upia³eœ!" ,DIA_Snaf_Help_No);
};

func void DIA_Snaf_Help_Yes()
{
	AI_Output (other, self,"DIA_Snaf_Help_Yes_15_00"); //W porz¹dku.
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_01"); //Œwietnie.
	AI_TurnToNpc(self, Snf_Molerat1);
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_02"); //Macie siê s³uchaæ i nie ¿reæ piekielników!
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_03"); //W porz¹dku, pójd¹ za Tob¹. Tylko siê nimi dobrze opiekuj.
	AI_Output (self, other,"DIA_Snaf_Help_Yes_01_04"); //Jak znajdziesz moj¹ warzechê, to dorzucê coœ ekstra.

	Log_CreateTopic(CH1_Rbl_SnafScoop, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafScoop, "Snaf zgubi³ gdzieœ swoj¹ warzechê. Mówi³ coœ o ataku wilków podczas popasu kretoszczurów wiêc pewnie gdzieœ tam powinienem jej poszukaæ.");

	snaf_help = TRUE;

	/***************

	//zmiana rutyny tych kretoszczurów, maj¹ pod¹¿aæ za dickiem
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_FollowPC;
	snfmol2.start_aistate				= ZS_FollowPC;
	snfmol3.start_aistate				= ZS_FollowPC;
	snfmol4.start_aistate				= ZS_FollowPC;
	AI_StartState(Snf_Molerat1, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat2, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat3, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat4, ZS_FollowPC, 1, "");
	/****************/

	B_LogEntry(CH1_Rbl_SnafHelp, "Zgodzi³em siê. Mam zabraæ te ma³e potworki na pastwisko gdzieœ w pobli¿u po³udniowego wejœcia do Starego Obozu. Aha, jak znajdê warzechê Snafa, to da mi jak¹œ specjaln¹ nagrodê.");
	Info_ClearChoices(DIA_Snaf_Help);
};

func void DIA_Snaf_Help_No()
{
	AI_Output (other, self,"DIA_Snaf_Help_No_15_00"); //Chyba zg³upia³eœ.
	AI_Output (self, other,"DIA_Snaf_Help_No_01_01"); //Ale miêso kretoszczurów to lubisz ¿reæ, hê?
	AI_Output (self, other,"DIA_Snaf_Help_No_01_02"); //Wróæ, jak zmienisz zdanie.
	snaf_help_no = TRUE;
	B_LogEntry(CH1_Rbl_SnafHelp, "Nie bêdê bawi³ siê w pastucha!");		
	Info_ClearChoices(DIA_Snaf_Help);	
};

INSTANCE DIA_Snaf_AfterGo (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_AfterGo_Condition;
	information		= DIA_Snaf_AfterGo_Info;
	permanent		= 1;
	description		= "Zmieni³em zdanie.";
};

FUNC INT DIA_Snaf_AfterGo_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Snaf_Help)) && (snaf_help_no==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterGo_Info()
{
	AI_Output (other, self,"DIA_Snaf_AfterGo_15_00"); //Zmieni³em zdanie.
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_01"); //Œwietnie.
	AI_TurnToNpc(self, Snf_Molerat1);
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_02"); //Macie siê s³uchaæ i nie ¿reæ piekielników!
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_03"); //W porz¹dku, pójd¹ za tob¹. Tylko siê nimi dobrze opiekuj.
	AI_Output (self, other,"DIA_Snaf_AfterGo_01_04"); //Aha. Jak znajdziesz moj¹ warzechê, to dorzucê coœ ekstra.
	snaf_help = TRUE;
	snaf_help_no=false;
	Log_CreateTopic(CH1_Rbl_SnafScoop, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_SnafScoop, "Snaf zgubi³ gdzieœ swoj¹ warzechê. Mówi³ coœ o ataku wilków podczas popasu kretoszczurów wiêc pewnie gdzieœ tam powinienem jej poszukaæ.");

	/***************

	//zmiana rutyny tych kretoszczurów, maj¹ pod¹¿aæ za dickiem
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_FollowPC;
	snfmol2.start_aistate				= ZS_FollowPC;
	snfmol3.start_aistate				= ZS_FollowPC;
	snfmol4.start_aistate				= ZS_FollowPC;
	AI_StartState(Snf_Molerat1, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat2, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat3, ZS_FollowPC, 1, "");
	AI_StartState(Snf_Molerat4, ZS_FollowPC, 1, "");	
	
	/****************/

	B_LogEntry(CH1_Rbl_SnafHelp, "Zgodzi³em siê. Mam zabraæ te ma³e potworki na pastwisko gdzieœ w pobli¿u po³udniowego wejœcia do Starego Obozu. Aha, jak znajdê warzechê Snafa, to da mi jak¹œ specjaln¹ nagrodê.");
};

INSTANCE DIA_Snaf_SUCCESS (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_SUCCESS_Condition;
	information		= DIA_Snaf_SUCCESS_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Snaf_SUCCESS_Condition()
{	
	if ((Npc_KnowsInfo(other,DIA_Snaf_Help))||(Npc_KnowsInfo(other,DIA_Snaf_AfterGo)))&& (snaf_help==TRUE)&&(Mis_Snaf_WolfSpawned)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_SUCCESS_Info()
{
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_01"); //Wróci³eœ!
	
   if (Npc_IsDead(Snf_Molerat1))||(Npc_IsDead(Snf_Molerat2))||(Npc_IsDead(Snf_Molerat3))||(Npc_IsDead(Snf_Molerat4))
	{
		B_FullStop (self);
		
		AI_PlayAni		(self,	"T_HEADACHE");		
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_02"); //Jak mog³eœ do tego dopuœciæ!
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_03"); //Moje pieszczoszki...

		AI_StandUp (self);
		AI_TurnToNpc (self, other);
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_04"); //No nic takie ¿ycie...
	}
	else
	{
		B_GiveXP(250);
		AI_TurnToNpc(self, Snf_Molerat1);
		AI_Output (self, other,"DIA_Snaf_SUCCESS_01_05"); //Moje maleñstwa! Nic wam siê nie sta³o...
		AI_TurnToNpc(self, other);
	};

	rebel_camp_trust = rebel_camp_trust + 1;
	snaf_trust = TRUE;

	AI_Output (other, self,"DIA_Snaf_SUCCESS_15_06"); //To jak bêdzie z Twoim poparciem?
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_07"); //Je¿eli o mnie chodzi, to mo¿esz zostaæ jednym z nas.
	AI_Output (other, self,"DIA_Snaf_SUCCESS_15_08"); //Œwietnie. Mi³o by³o Ciê poznaæ Snaf.
	AI_Output (self, other,"DIA_Snaf_SUCCESS_01_09"); //Wzajemnie piracie.
	/***************
	//zmiana rutyny tych kretoszczurów, maj¹ siê teraz znowu pa³êtaæ po obozie
	***************/
	var C_NPC snfmol1; snfmol1	=	Hlp_GetNpc(Snf_Molerat1);	
	var C_NPC snfmol2; snfmol2	=	Hlp_GetNpc(Snf_Molerat2);
	var C_NPC snfmol3; snfmol3	=	Hlp_GetNpc(Snf_Molerat3);
	var C_NPC snfmol4; snfmol4	=	Hlp_GetNpc(Snf_Molerat4);
	snfmol1.start_aistate				= ZS_MM_AllScheduler;
	snfmol2.start_aistate				= ZS_MM_AllScheduler;
	snfmol3.start_aistate				= ZS_MM_AllScheduler;
	snfmol4.start_aistate				= ZS_MM_AllScheduler;
	AI_StartState(Snf_Molerat1, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat2, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat3, ZS_MM_AllScheduler, 1, "");
	AI_StartState(Snf_Molerat4, ZS_MM_AllScheduler, 1, "");	

	/****************/
	B_LogSetTopicStatus(CH1_Rbl_SnafHelp, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_SnafHelp, "Ostatni raz bawi³em siê w pastucha. Mam poparcie Snafa.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby³em poparcie Snafa i jego kretoszczurów.");
};

INSTANCE DIA_Snaf_Scoop (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_Scoop_Condition;
	information		= DIA_Snaf_Scoop_Info;
	permanent		= 1;
	important		= 0;
	description		= "To twoja warzecha?"; 
};

FUNC INT DIA_Snaf_Scoop_Condition()
{	
	if (snaf_help==TRUE)&&(scoop_ok == FALSE)
	&& ( ( NPC_HasItems(other,ItMiScoop) ) || ( NPC_HasItems(other,Snaf_Scoop) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Scoop_Info()
{
	AI_Output (other, self,"DIA_Snaf_Scoop_01_01"); //To twoja warzecha?
	
   if (NPC_HasItems(other,Snaf_Scoop)>=1)
	{
		Scoop_ok=TRUE;
		B_GiveXP(150);
		AI_Output (self, other,"DIA_Snaf_Scoop_01_02"); //Tak, w rzeczy samej. Œwietna robota.
		B_GiveInvItems (other, self, Snaf_Scoop, 1);
		AI_Output (self, other,"DIA_Snaf_Scoop_01_03"); //WeŸ te bry³ki za fatygê.
		
		CreateInvItems (self,ItMiNugget,50);
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_SnafScoop, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_SnafScoop, "Zwróci³em Snafowi jego warzechê.");
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_Scoop_01_05"); //To nie moje. Szukaj dalej...
	};
};

INSTANCE DIA_Snaf_Spy (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 13;
	condition		= DIA_Snaf_Spy_Condition;
	information		= DIA_Snaf_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam takie pytanie."; 
};

FUNC INT DIA_Snaf_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Spy_Info()
{
	spy_count = spy_count + 1;
	AI_Output (other, self, "DIA_Snaf_Spy_15_01"); //Mam takie pytanie.
	AI_Output (self, other, "DIA_Snaf_Spy_07_02"); //Tak?
	AI_Output (other, self, "DIA_Snaf_Spy_15_03"); //Dlaczego stra¿nicy pozbyli siê dobrego kucharza?
	AI_Output (self, other, "DIA_Snaf_Spy_07_04"); //Ich zapytaj, nie mnie. Mo¿e zbrzyd³a im moja paskudna morda.
	AI_Output (self, other, "DIA_Snaf_Spy_07_05"); //A mo¿e ktoœ poda³ im potrawkê ze szczurów?
	AI_Output (other, self, "DIA_Snaf_Spy_15_06"); //Mimo wszystko dobry kucharz jest w Kolonii na wagê rudy.
	AI_Output (self, other, "DIA_Snaf_Spy_07_07"); //Mo¿liwe. Mo¿e mia³em inne powody, ¿eby stamt¹d odejœæ.
	AI_Output (other, self, "DIA_Snaf_Spy_15_08"); //Mo¿e...
	B_LogEntry		(CH2_Rbl_Spy, "Snaf te¿ nie zdradzi³ zbyt wiele. Ale dziwne, ¿e tak dobry kucharz zosta³ wyrzucony ze Starego Obozu.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Snaf_Spy1 (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 14;
	condition		= DIA_Snaf_Spy1_Condition;
	information		= DIA_Snaf_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiem, dlaczego musia³eœ uciekaæ ze Starego Obozu."; 
};

FUNC INT DIA_Snaf_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Snaf_Spy1_15_01"); //Wiem, dlaczego musia³eœ uciekaæ ze Starego Obozu.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_02"); //Nie jestem z tego specjalnie dumny, wiêc daj mi spokój. By³o, minê³o.
	AI_Output (other, self, "DIA_Snaf_Spy1_15_03"); //Ale nie o tym chcia³em rozmawiaæ.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_04"); //Tak?
	AI_Output (other, self, "DIA_Snaf_Spy1_15_05"); //Interesuje mnie to, co myœlisz o tym obozie. O jego mieszkañcach, o tym komu mo¿na ufaæ, a komu nie.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_06"); //Hmm. Obóz jak obóz, wszêdzie s¹ dobrzy ludzie i mendy. Co do zaufania...
	AI_Output (self, other, "DIA_Snaf_Spy1_07_07"); //Nie wiem co dok³adnie masz na myœli.
	AI_Output (other, self, "DIA_Snaf_Spy1_15_08"); //Kogoœ kto sympatyzuje z innymi obozami.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_09"); //Rozumiem.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_10"); //Aidan ci¹gle gdzieœ znika. Chocia¿ od jakiegoœ czasu zaprzesta³ nocnych wypadów.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_11"); //No i Tony... W Starym Obozie ci¹gle obraca³ siê w towarzystwie Szakala i innych przydupasów Gomeza.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_12"); //Nie jestem pewien, ale chyba kilka dni temu widzia³em jak szed³ po zmierzchu chy³kiem w stronê lasu.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_13"); //Pewnie nie zwróci³bym na to uwagi, ale niós³ coœ ciê¿kiego.
	AI_Output (self, other, "DIA_Snaf_Spy1_07_14"); //To chyba wszystko. 
	AI_Output (other, self, "DIA_Snaf_Spy1_15_15"); //Dziêkujê, to mi wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Snaf twierdzi, ze Aidan ju¿ nie znika noc¹ z obozu. Widzia³ te¿ Toniego jak ten wynosi³ coœ noc¹ z obozu. Ciekawe co to mog³o byæ?");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos	(self);
};

// **************************************************


INSTANCE DIA_RBL_581_Snaf_Stew (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 12;
	condition		= DIA_RBL_581_Snaf_Stew_Condition;
	information		= DIA_RBL_581_Snaf_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "(Daj gulasz) Poznajesz ten aromat?"; 
};

FUNC INT DIA_RBL_581_Snaf_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_581_Snaf_Stew_Info()
{
	AI_Output (other, self, "DIA_RBL_581_Snaf_Stew_15_01"); //Poznajesz ten aromat?
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_02"); //Cz³owieku przecie¿ to moje sztandarowe danie!
	AI_Output (other, self, "DIA_RBL_581_Snaf_Stew_15_03"); //Twoja porcja, bierz.
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_04"); //Nie jestem a¿ tak g³upi, ¿eby jeœæ to co sam ugotujê. 
	AI_Output (self, other, "DIA_RBL_581_Snaf_Stew_11_05"); //Zanieœ to jakiemuœ desperatowi.
	
	B_LogEntry		(CH2_Rbl_Food, "Snaf powiedzia³ ¿ebym da³ jego porcje komuœ innemu."); 
};

// **************************************************

INSTANCE DIA_RBL_581_Snaf_Aloes (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 12;
	condition		= DIA_RBL_581_Snaf_Aloes_Condition;
	information		= DIA_RBL_581_Snaf_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz przyrz¹dziæ miksturê z aloesu?"; 
};

FUNC INT DIA_RBL_581_Snaf_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)&& (!Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_581_Snaf_Aloes_Info()
{
	AI_Output (other, self, "DIA_RBL_581_Snaf_Aloes_15_01"); //Potrafisz przyrz¹dziæ miksturê z aloesu?
	AI_Output (self, other, "DIA_RBL_581_Snaf_Aloes_11_02"); //Chyba siê pomyli³eœ, jestem KUCHARZEM, nie ALCHEMIKIEM.
	AI_Output (self, other, "DIA_RBL_581_Snaf_Aloes_11_03"); //Radzê porozmawiaæ z którymœ z magów, albo by³ymi nowicjuszami z bractwa.
};

/****************************

SIDE QUEST

****************************/

INSTANCE DIA_Snaf_Molerats (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 20;
	condition		= DIA_Snaf_Molerats_Condition;
	information		= DIA_Snaf_Molerats_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Snaf_Molerats_Condition()
{
	if (Kapitel>=2)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Molerats_Info()
{
	B_FullStop (hero);
   
	AI_Output (self, other, "DIA_Snaf_Molerats_07_01"); //Hej, Rick. PodejdŸ na chwilê...
	
   AI_GotoNpc(other,self);
	
   AI_Output (other, self, "DIA_Snaf_Molerats_15_02"); //Coœ siê sta³o?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_03"); //Tak, ale to doœæ... osobista sprawa.
	
   AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	
   AI_Output (self, other, "DIA_Snaf_Molerats_07_04"); //Mam problem z kretoszczurami. Bydlaki tak siê spas³y, ¿e sta³y siê bardziej agresywne no i wielkie!
	AI_Output (other, self, "DIA_Snaf_Molerats_15_05"); //Ale co to ma za mn¹ wspólnego?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_06"); //Wiem, ¿e lubisz dobrze zjeœæ. A ja potrzebujê miêsa i w¹troby tych spasionych bydlaków.
	AI_Output (other, self, "DIA_Snaf_Molerats_15_07"); //To idŸ do zagrody i je zaszlachtuj.
	AI_Output (self, other, "DIA_Snaf_Molerats_07_08"); //Ekhm... W tym w³aœnie problem. One zrobi³y siê bardzo du¿e i wredne.
	AI_Output (other, self, "DIA_Snaf_Molerats_15_09"); //Dobra, dobra. Mam je dla ciebie zabiæ, tak?
	AI_Output (self, other, "DIA_Snaf_Molerats_07_10"); //Dok³adnie! W podziêce nauczê Ciê jak przyrz¹dzaæ pyszn¹ potrawkê z kretoszczurów.
	AI_Output (self, other, "DIA_Snaf_Molerats_07_11"); //Zgadzasz siê?
};

INSTANCE DIA_Snaf_MoleratsOk (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 21;
	condition		= DIA_Snaf_MoleratsOk_Condition;
	information		= DIA_Snaf_MoleratsOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, zabawiê siê w rzeŸnika."; 
};

FUNC INT DIA_Snaf_MoleratsOk_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Snaf_Molerats))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_MoleratsOk_Info()
{
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_01"); //Dobra, zabawiê siê w rzeŸnika.
	AI_Output (self, other, "DIA_Snaf_MoleratsOk_07_02"); //Innos Ci to w dzieciach wynagrodzi!
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_03"); //Oby nie za szybko...
	AI_Output (self, other, "DIA_Snaf_MoleratsOk_07_04"); //IdŸ do zagrody i zabij te bydlaki. Przynieœ mi ich miêso i w¹troby. Bez tego siê nie pokazuj!
	AI_Output (other, self, "DIA_Snaf_MoleratsOk_15_05"); //Zaraz wracam.

	Log_CreateTopic	(CH2_RBL_Molerats, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_Molerats, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_Molerats, "Snaf ma problem z kretoszczurami. Za bardzo je podkarmi³ przez co bydlaki sta³y siê du¿e i wredne. Mam je dla niego zaszlachtowaæ i przynieœæ mu miêso i w¹trobê. To bêdzie krótki spacerek...");
};

/*************************
Porobi³em 5 unikatowych kretoszczurów, ¿eby gracz zbytnio nie oszukiwa³ ;P
Fat_Snf_Molerat1 - Fat_Snf_Molerat5 ale w¹trobê i miêcho maj¹ jak reszta, wa¿ne ¿eby by³y martwe do zaliczenia zadania

*************************/

INSTANCE DIA_Snaf_MoleratsDone (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 22;
	condition		= DIA_Snaf_MoleratsDone_Condition;
	information		= DIA_Snaf_MoleratsDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za³atwione."; 
};

FUNC INT DIA_Snaf_MoleratsDone_Condition()
{
	var C_NPC mr1; mr1 = Hlp_GetNpc(Fat_Snf_Molerat1);
	var C_NPC mr2; mr2 = Hlp_GetNpc(Fat_Snf_Molerat2);
	var C_NPC mr3; mr3 = Hlp_GetNpc(Fat_Snf_Molerat3);
	var C_NPC mr4; mr4 = Hlp_GetNpc(Fat_Snf_Molerat4);
	var C_NPC mr5; mr5 = Hlp_GetNpc(Fat_Snf_Molerat5);

	if (Npc_KnowsInfo(other,DIA_Snaf_MoleratsOk))&&(NPC_HasItems(other,ItAt_WatMRat)>=5)&&(NPC_HasItems(other,ItFoMuttonRaw)>=10)
	&&(Npc_IsDead(mr1))&&(Npc_IsDead(mr2))&&(Npc_IsDead(mr3))&&(Npc_IsDead(mr4))&&(Npc_IsDead(mr5))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_MoleratsDone_Info()
{
	AI_Output (other, self, "DIA_Snaf_MoleratsDone_15_01"); //Za³atwione.
	AI_Output (self, other, "DIA_Snaf_MoleratsDone_07_02"); //To œwietnie, w koñcu mogê wypróbowaæ nowy przepis na w¹tróbkê.
	B_GiveInvItems (other, self, ItAt_WatMRat, 5);
	Npc_RemoveInvItems(self,ItAt_WatMRat,5);
	B_GiveInvItems (other, self, ItFoMuttonRaw, 10);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,10);
	AI_Output (self, other, "DIA_Snaf_MoleratsDone_07_03"); //To Twoja nagroda. Recepta na pewno siê przyda, to mój sekretny przepis.

	/************************
Ork niech Snaf da mu jak¹œ receptê na ¿arcie

***********************/
	//Todo: another cooking reciepe

	AI_Output (other, self, "DIA_Snaf_MoleratsDone_15_04"); //To siê oka¿e jak j¹ wypróbujê. Bywaj.

	Log_SetTopicStatus	(CH2_RBL_Molerats, LOG_SUCCESS);
	B_LogEntry		(CH2_RBL_Molerats, "Kretoszczury mam ju¿ z g³owy. Trzeba wypróbowaæ ten przepis od Snafa.");
	B_GIVEXP(150);
   
   Npc_ExchangeRoutine	(self,"START");
};


//***************************************************

INSTANCE DIA_Snaf_Martin (C_INFO)
{
	npc				= RBL_581_Snaf;
	nr				= 23;
	condition		= DIA_Snaf_Martin_Condition;
	information		= DIA_Snaf_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kiedy ostatnio widzia³eœ Martina?"; 
};

FUNC INT DIA_Snaf_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Martin_Info()
{
	AI_Output (other, self, "DIA_Snaf_Martin_15_01"); //Kiedy ostatnio widzia³eœ Martina?
	AI_Output (self, other, "DIA_Snaf_Martin_07_02"); //Hmm. Kilka dni temu wychodzi³ ze sk³adu.
	AI_Output (other, self, "DIA_Snaf_Martin_15_03"); //By³ z nim R¹czka?
	AI_Output (self, other, "DIA_Snaf_Martin_07_04"); //Niech pomyœlê...
	AI_Output (self, other, "DIA_Snaf_Martin_07_05"); //Tak! Szed³ z przeciwnej strony i chyba potr¹ci³ Martina.
	AI_Output (other, self, "DIA_Snaf_Martin_15_06"); //To ciekawe. Dziêki, Snaf.

	B_LogEntry(CH2_RBL_Feelings, "R¹czka potr¹ci³ Martina, to idealny moment na kradzie¿. Muszê pytaæ dalej.");

	B_fingers_proofs();
}; 

INSTANCE DIA_Snaf_CanYouTeachMe (C_INFO)
{
	npc				= RBL_581_Snaf;
	condition		= DIA_Snaf_CanYouTeachMe_Condition;
	information		= DIA_Snaf_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Snaf_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Snaf_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Snaf_CanYouTeachMe_12_02"); //Wiem jak wypatroszyæ zwierzaka i wyci¹æ w¹trobê. 
	AI_Output (self, other, "DIA_Snaf_CanYouTeachMe_12_03"); //Kiedyœ potrafi³em te¿ strzyc we³nê.	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Snaf poka¿e mi jak wypatroszyæ zwierzêta, wyci¹æ w¹trobê i jak strzyc we³nê.");
	
};