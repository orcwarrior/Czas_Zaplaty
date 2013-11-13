
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Henger_EXIT(C_INFO)
{
	npc			= Grd_615_Gardist;
	nr			= 999;
	condition			= Info_Henger_EXIT_Condition;
	information			= Info_Henger_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Henger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Henger_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Henger_Hello (C_INFO)
{
	npc		= Grd_615_Gardist;
	nr			= 1;
	condition		= Info_Henger_Hello_Condition;
	information		= Info_Henger_Hello_Info;
	important		=1;
	permanent		= 1;
	description 	= "";
};                       

FUNC INT Info_Henger_Hello_Condition()
{	
	/***************************
Ma dzia³aæ tak, ¿e po ostatniej gadce z Krisem Wisielec ju¿ przepuszcza.

***************************/

	if (Npc_KnowsInfo (hero, Info_Henger_Again))&&(Npc_GetDistToNpc(self,hero) < 200)&&(!Npc_KnowsInfo (hero, Info_Kris_Fin))
	{
		return 1;
	};
};
FUNC VOID Info_Henger_Hello_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other,"Info_Henger_Hello_06_01"); //Nie wyjdziesz, dopóki Kris na to nie pozwoli.
	B_StopProcessInfos	(self);
	AI_GotoWP		(other, "KRIS_WAIT");
};


// ************************************************************

INSTANCE Info_Henger_Hello1 (C_INFO)
{
	npc		= Grd_615_Gardist;
	nr			= 1;
	condition		= Info_Henger_Hello1_Condition;
	information		= Info_Henger_Hello1_Info;
	important		=0;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Henger_Hello1_Condition()
{	

	if (Npc_GetDistToNpc(self,hero) < 200)&&(Npc_KnowsInfo (hero, Info_Kris_Fin))
	{
		return 1;
	};

};
FUNC VOID Info_Henger_Hello1_Info()
{	
	B_FullStop (hero);
	AI_Output (self, other,"Info_Henger_Hello_06_01"); //Mia³em do Ciebie nosa. W koñcu bêdê spokojnie spa³ w nocy.
	AI_Output (self, other,"Info_Henger_Hello_06_02"); //Dobrze wiedzieæ, ¿e zabójca ju¿ gryzie ziemiê.
	AI_Output (other, self,"Info_Henger_Again_15_03"); //Czasem ³atwo pomyliæ odbicie gwiazd w tafli wody z prawdziwym niebem.
	AI_Output (self, other,"Info_Henger_Hello_06_04"); //Co tam mamroczesz?
	AI_Output (other, self,"Info_Henger_Again_15_05"); //Nic takiego. Bywaj.

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"START");	
};



// ************************************************************

INSTANCE Info_Henger_Again (C_INFO)
{
	npc			= Grd_615_Gardist;
	nr			= 2;
	condition		= Info_Henger_Again_Condition;
	information		= Info_Henger_Again_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Henger_Again_Condition()
{	

	if  (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Henger_Again_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Henger_Again_06_01"); //Hej, Ty! PodejdŸ no tu z ³aski swojej.
	AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Henger_Again_06_02"); //Morda paskudna, ale bez szramy. Czego tu szukasz?
	AI_Output (other, self,"Info_Henger_Again_15_03"); //Dawno nikomu pyska nie obi³em. Co Ty na to?
	AI_Output (self, other,"Info_Henger_Again_06_04"); //Spokojnie. Mi nie do bitki siê spieszy. 
	AI_Output (self, other,"Info_Henger_Again_06_05"); //Mamy tu pewne... problemy. Dlatego nie wpuszczam do Orlego Gniazda pierwszego lepszego ³achmyty.
	AI_Output (other, self,"Info_Henger_Again_15_06"); //Dziêki, wiesz jak przypodobaæ siê ludziom.
	AI_Output (self, other,"Info_Henger_Again_06_07"); //Racja, dyplomata ze mnie ¿aden. Nie bierz tego do siebie. To przez tê cholern¹ wartê.
	AI_Output (other, self,"Info_Henger_Again_15_08"); //Czego pilnujesz? Nie wpuszczasz do twierdzy obcych?
	AI_Output (self, other,"Info_Henger_Again_06_09"); //Raczej nie wypuszczam nikogo poza mury. Mamy tu spory bajzel...
	AI_Output (self, other,"Info_Henger_Again_06_10"); //W³aŸ do œrodka i pogadaj z Krisem. Ale pamiêtaj, ¿e bez jego zgody nie opuœcisz Gniazda.
	AI_Output (other, self,"Info_Henger_Again_15_11"); //Niech bêdzie. 
	AI_Output (self, other,"Info_Henger_Again_06_12"); //Coœ czujê, ¿e bêdziesz tego ¿a³owa³. Krisa znajdziesz w pobli¿u bramy.


	Log_CreateTopic	(CH4_Non_Eagle, LOG_MISSION);
	Log_SetTopicStatus	(CH4_Non_Eagle, LOG_RUNNING);
	B_LogEntry		(CH4_Non_Eagle, "Orle Gniazdo. Stra¿nik - Wisielec - twierdzi, ¿e maj¹ jakiœ problem. I o dziwo nikogo nie wypuszczaj¹ na zewn¹trz. Ciekawe co siê tu œwiêci? Jak ju¿ bêdê w œrodku mam porozmawiaæ z jakimœ Krisem.");


	/*******************
Ork, Dick ma podejœæ do Krisa, który czeka gdzieœ niedaleko bramy. W sumie idealnie jakby Kris z kimœ rozmawia³. Po gadce z Krisem, Wisielec ju¿ nie wypuœci Dicka z Gniazda.
Dopiero po rozwi¹zaniu zagadnki Dick bêdzie móg³ wyjœæ. Takie ma³e utrudnienie dla graczy co te¿ powinno zaplusowaæ z klimatem questa ;)

*************************/

	B_StopProcessInfos	(self);
	AI_GotoWP		(other, "KRIS_WAIT");
}; 
