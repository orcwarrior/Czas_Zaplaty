// **************************************************
// 						 EXIT
// **************************************************
prototype NoName_Exit (C_INFO)
{
	npc			=  Nameless_SecondMeet;
	nr			=  999;
	condition	=  DIA_NoName_Exit_Condition;
	information	=  DIA_NoName_Exit_Info;
	important	=  0;
	permanent	=  1;
	description = DIALOG_ENDE;
};

instance DIA_NoNamer_Exit (NoName_Exit)
{
};

FUNC int  DIA_NoName_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_NoName_Exit_Info()
{
	B_StopProcessInfos(self);
};

instance DIA_NoNamer_Exit2 (NoName_Exit)
{
	npc = Nameless_ThirdMeet;
};

instance DIA_NoNamer_Exit3 (NoName_Exit)
{
	npc = Nameless_ThirdMeetGYD;
};

instance DIA_NoNamer_Exit4 (NoName_Exit)
{
	npc = Nameless_FourthMeet;
};

instance DIA_NoNamer_Exit5 (NoName_Exit)
{
	npc = Nameless_Temple;
};

//--------------------------------------------------------------------------
// Spotkanie po rozmowie z Informatorem ze SO wys³anym przez Urta. Bezi ma siê pojawiæ jak informator umrze.
//--------------------------------------------------------------------------
instance  DIA_NoName_Hi (C_INFO)
{
	npc				= Nameless_SecondMeet;
	condition		= DIA_NoName_Hi_Condition;
	information		= DIA_NoName_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_Hi_Condition()
{
	var C_NPC info; info = Hlp_GetNpc(RBL_4064_Info);

	if (Npc_GetDistToNpc(self,hero) < 2000)&&(Npc_IsDead(Info))
	{
		return 0;
	};
};

FUNC void  DIA_NoName_Hi_Info()
{
	var C_NPC g1; g1 = Hlp_GetNpc(GRD_4065_Guard);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_Hi_Info_15_01"); //Niez³a jatka. Zajmê siê s³ugusami Gomeza.
	AI_Output (other, self,"DIA_NoName_Hi_Info_15_02"); //Nie pozwolê, ¿eby ominê³a mnie taka zabawa...
	B_StopProcessInfos	(self);
	Npc_SetTarget(self,g1);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_HiAgain (C_INFO)
{
	npc				= Nameless_SecondMeet;
	condition		= DIA_NoName_HiAgain_Condition;
	information		= DIA_NoName_HiAgain_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_HiAgain_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1500)&&((Npc_IsDead(GRD_2730_Gardist)+Npc_IsDead(GRD_2731_Gardist)+Npc_IsDead(GRD_2732_Gardist)+Npc_IsDead(GRD_2733_Gardist))>=4)
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_HiAgain_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_01"); //I po sprawie.
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_02"); //Czy ja ju¿ Ciê kiedyœ nie spotka³em?
	
   if(Npc_KnowsInfo(hero,RBL_2604_Tony_GuardFinal))
	{
		AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_03"); //To chyba Ty za³atwi³eœ tego trolla w Obozie Rebeliantów. Zdaje siê, ¿e uratowa³eœ mi wtedy skórê.
		
      B_LogEntry		(CH1_Rbl_NoName, "Ten dziwny skazaniec znowu uratowa³ mi ty³ek. Sk¹d on siê tutaj wzi¹³?");
	}
	else
	{
		//crappy dialog, by orcwarrior:
		AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_08"); //Nie przypominam sobie. Zdaje siê, ¿e w³aœnie uratowa³eœ mi skórê.
		
      B_LogEntry		(CH1_Rbl_NoName, "Ten dziwny skazaniec uratowa³ mi ty³ek. Sk¹d on siê tutaj wzi¹³?");
	};
   
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_04"); //Tylko nie mów tego za g³oœno, bo popsujesz mi reputacjê, he, he.
	AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_05"); //Nie ma sprawy, bêdê milcza³ jak grób. Mimo wszystko... Dziêki.
	AI_Output (self, other,"DIA_NoName_HiAgain_Info_15_06"); //Powodzenia na szlaku.
	AI_Output (other, self,"DIA_NoName_HiAgain_Info_15_07"); //Bywaj.
	
   CreateInvItem(self,ItArScrollTeleport1);

	B_StopProcessInfos	(self);

	/****************
Niech Bezio gdzieœ pójdzie
******************/

	Npc_ExchangeRoutine(self,"INVISIBLE");
};

//--------------------------------------------------------------------------

/******************
Bezio w obozie rbló
*******************/

instance  DIA_NoName_RBL1 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL1_Condition;
	information		= DIA_NoName_RBL1_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL1_Condition()
{
	return TRUE;
};

FUNC void  DIA_NoName_RBL1_Info()
{
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_01"); //Witaj. Móg³byœ mi powiedzieæ coœ o tym obozie?
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_02"); //Je¿eli nie musisz, to siê tutaj nie krêæ. To niezbyt bezpieczne miejsce.
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_03"); //Potrafiê o siebie zadbaæ.
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_04"); //Nie mówiê, ¿e nie. Rebelianci to paskudna banda, a ³¹czy ich tylko jeden cel - wykopaæ Gomeza z Kolonii.
	AI_Output (self, other,"DIA_NoName_RBL1_Info_15_05"); //To mamy sporo wspólnego. Rozejrzê siê po obozie, mo¿e znajdê coœ do roboty.
	AI_Output (other, self,"DIA_NoName_RBL1_Info_15_06"); //Powodzenia.

	B_LogEntry		(CH1_Rbl_NoName, "Bezimienny skazaniec w koñcu trafi³ do obozu rebeliantów. Chyba nie tylko ja ci¹gle wtykam nos w nie swoje sprawy...");
	B_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_RBL2 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL2_Condition;
	information		= DIA_NoName_RBL2_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chcia³byœ coœ zarobiæ?";
};

FUNC int  DIA_NoName_RBL2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL1))&&(Npc_KnowsInfo (hero,DIA_Roderic_OldNote1))&&(!Npc_KnowsInfo (hero,Info_OrcGhost_Kill))
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL2_Info()
{
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_01"); //Chcia³byœ coœ zarobiæ?
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_02"); //Pewnie. Mów o co chodzi.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_03"); //Czeka mnie spacerek na stare cmentarzysko orków...
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_04"); //Wiem gdzie to jest, ju¿ tam by³em. Obawiam siê, ¿e nie znajdziesz tam nic ciekawego.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_05"); //A ja siê obawiam, ¿e jednak mo¿esz siê myliæ.
	AI_Output (other, self,"DIA_NoName_RBL2_Info_15_06"); //Zap³acê Ci... 200 bry³ek. Wiêc jak bêdzie?
	AI_Output (self, other,"DIA_NoName_RBL2_Info_15_07"); //Daj mi chwilê na zastanowienie.
	
   B_LogEntry		(CH1_Rbl_NoName, "Zapyta³em Bezimiennego, czy nie chcia³by przejœæ siê ze mn¹ na cmentarzysko orków. Powiedzia³, ¿e musi siê chwilê zastanowiæ.");
	B_StopProcessInfos	(self);
};

//--------------------------------------------------------------------------

instance  DIA_NoName_RBL3 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL3_Condition;
	information		= DIA_NoName_RBL3_Info;
	important		= 0;
	permanent		= 0;
	description		= "Idziesz?";
};

FUNC int  DIA_NoName_RBL3_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL2))&&(!Npc_KnowsInfo (hero,Info_OrcGhost_Kill))
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL3_Info()
{
	AI_Output (other, self,"DIA_NoName_RBL3_Info_15_01"); //Idziesz?
	AI_Output (self, other,"DIA_NoName_RBL3_Info_15_02"); //Dobra, chodŸ za mn¹.

	/*******************
Bezio przy³¹cza siê do Dicka
*******************/
	B_LogEntry		(CH1_Rbl_NoName, "Bezimienny wyruszy ze mn¹ na cmentarzysko orków.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOWGYD");
	B_StopProcessInfos	(self);
};

instance  DIA_NoName_RBL3_2 (C_INFO)
{
	npc				= Nameless_ThirdMeet;
	condition		= DIA_NoName_RBL3_2_Condition;
	information		= DIA_NoName_RBL3_2_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_2_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3))&&(Npc_GetDistToWP(self,"OW_PATH_198_ORCGRAVEYARD8")<1000)
	{
		return TRUE;
	};
};

var int nameless_enterGYD;

FUNC void  DIA_NoName_RBL3_2_Info()
{
	AI_Output (self, other,"DIA_NoName_RBL3_2_Info_15_01"); //No to jesteœmy na miejscu.
	AI_Output (other, self,"DIA_NoName_RBL3_2_Info_15_02"); //Dobra, otworzê bramê.
	nameless_enterGYD=TRUe;

	B_LogEntry		(CH1_Rbl_NoName, "Dotarliœmy na cmentarzysko orków, ciekawe co nas czeka w œrodku.");
	Party_RemoveNpc(self);
	B_StopProcessInfos	(self);
};

instance  DIA_NoName_RBL3_3_1 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL3_3_1_Condition;
	information		= DIA_NoName_RBL3_3_1_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_3_1_Condition()
{
	if (Npc_GetDistToWP(hero,"GRYD_003")<700)
	{
		return 1;
	};
};

FUNC void  DIA_NoName_RBL3_3_1_Info()
{
	AI_Output (other, self, "DIA_NoName_RBL3_3_1_Info_15_01"); //Ciemno tutaj.
	AI_Output (self, other, "DIA_NoName_RBL3_3_1_Info_15_02"); //WeŸ to, bêdziesz chocia¿ widzia³, w co wpychasz miecz.
	Npc_SetTarget(self,self);
	AI_ReadySpell			(self,	SPL_LIGHT,	1);
	AI_PlayAni(self,"T_MAGRUN_2_SLESHOOT");
	Wld_PlayEffect("SPELLFX_LIGHT_ACTIVE", self, self, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni(self,"T_SLESHOOT_2_STAND");
	AI_UnReadySpell			(self);

	CreateInvItems(self,ItArSCrollLight,5);
	B_GiveInvItems(self,other,ItArSCrollLight,5);
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOWGYDIN");
	B_StopProcessInfos	(self);
};

instance DIA_NoName_RBL3_3 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL3_3_Condition;
	information		= DIA_NoName_RBL3_3_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL3_3_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3_2))&&(Npc_GetDistToWP(hero,"GRYD_054")<2000)
	{
		return 1;
	};
};

FUNC void  DIA_NoName_RBL3_3_Info()
{
	AI_Output (self, other,"DIA_NoName_RBL3_3_Info_15_01"); //Co teraz?
	AI_Output (other, self,"DIA_NoName_RBL3_3_Info_15_02"); //Nie wiem, ale na prawo nie ma nic ciekawego.
	AI_Output (other, self,"DIA_NoName_RBL3_3_Info_15_03"); //Mo¿e spróbujmy wdrapaæ siê wy¿ej.

	B_LogEntry		(CH1_Rbl_NoName, "Jedyna sensowna mo¿liwoœæ to wdrapaæ siê na górê.");
	B_StopProcessInfos	(self);
};
//--------------------------------------------------------------------------

instance  DIA_NoName_RBL4 (C_INFO)
{
	npc				= Nameless_ThirdMeetGYD;
	condition		= DIA_NoName_RBL4_Condition;
	information		= DIA_NoName_RBL4_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_NoName_RBL4_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_NoName_RBL3))&&(Npc_KnowsInfo (hero,Info_OrcGhost_Kill))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void  DIA_NoName_RBL4_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
   
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_01"); //Na mnie ju¿ czas. Posz³o ca³kiem g³adko.
	AI_Output (other, self,"DIA_NoName_RBL4_Info_15_02"); //Dziêki za pomoc, chocia¿ pewnie poradzi³bym sobie sam.
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_03"); //Tak, tak, felczer kaza³ przytakiwaæ...
	AI_Output (self, other,"DIA_NoName_RBL4_Info_15_04"); //A teraz moje 200 bry³ek ciê¿ko zarobionej rudy.
	
   if (NPC_HasItems(other,ItMiNugget)>=200)
	{
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_05"); //No, nie wiem... Przecie¿ nic takiego nie zrobi³eœ.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_06"); //Widzê, ¿e ciê¿ko Ci siê rozstaæ z rud¹. Mam Ci w tym pomóc?
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_07"); //No dobra, bierz.
		B_GiveInvItems (other, self, ItMiNugget, 200);
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_08"); //Dziêki, brachu. To by³ ³atwy zarobek. Powodzenia na szlaku.
	}
	else
	{
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_10"); //Ekhm... Jakby Ci to powiedzieæ...
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_11"); //Tylko mi nie mów, ¿e nie masz marnych 200 bry³ek!
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_12"); //No, sêk w tym, ¿e nie mam.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_13"); //Cholera mog³em sprawdziæ przed wyruszeniem w drogê z takim go³odupcem.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_14"); //Niech bêdzie. Tym razem Ci podarujê.
		AI_Output (other, self,"DIA_NoName_RBL4_Info_15_15"); //Obgadamy to w karczmie, o ile tam zagl¹dasz.
		AI_Output (self, other,"DIA_NoName_RBL4_Info_15_16"); //Czemu nie. Trzymam Ciê za s³owo. Powodzenia na szlaku.
	};
   
   AI_Output (other, self,"DIA_NoName_RBL4_Info_15_09"); //Wzajemnie.
   
	B_LogEntry		(CH1_Rbl_NoName, "No i po sprawie. W sumie Bezimienny jest dobrym kompanem. Mo¿e warto to kiedyœ powtórzyæ?");
	/*******************
	Bezio od³¹cza siê od Dicka, nie wiem gdzie ma iœæ, wiêc to twoja dzia³a Ork
	*******************/
	Party_RemoveNpc(self);
   
	Hero_GotoGYD = 2;
	removeNamelessFromWorldZen = true;
	Npc_ExchangeRoutine(self,"INVISIBLEGRYD");
	B_StopProcessInfos	(self);
};

/***********************

Wystêpy Beziego

0. Trol. V
1. Informator. V
2. Kopalnia. V
3. przed cmentarzem w trakcie misji z rodneyem - pojawi siê jak mamy iœæ na cmentarz. V

x. Œwi¹tynia œpiocha. V

**************************/


