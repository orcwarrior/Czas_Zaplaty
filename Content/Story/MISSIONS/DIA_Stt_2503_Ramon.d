
// **************************************************
//						 EXIT
// **************************************************

instance  Stt_2503_Ramon_Exit (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 999;
	condition	= Stt_2503_Ramon_Exit_Condition;
	information	= Stt_2503_Ramon_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Stt_2503_Ramon_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_2503_Ramon_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Fanatyk bi¿uterii
// QUESTID 553
// **************************************************
instance  Stt_2503_Ramon_Chest_Quest (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 1;
	condition	= Stt_2503_Ramon_Chest_Quest_Condition;
	information	= Stt_2503_Ramon_Chest_Quest_Info;
	permanent	= 0;
	description = "Ten amulet jest na zbyciu?";
};

FUNC int  Stt_2503_Ramon_Chest_Quest_Condition()
{
	if (GetTheRamonAmulet == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Chest_Quest_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Chest_Quest_11_00"); //Ten amulet jest na zbyciu?
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_01"); //Interesuje Ciê bi¿uteria? To niespotykane w tej zapchlonej dziurze.
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_02"); //Dostaniesz go, ale nie za darmo.
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_03"); //Ktoœ zrobi³ sobie ze mnie ¿arty i porozrzuca³ po ca³ej jaskini moje skrzynie z... niewa¿ne z czym. Przynieœ mi je.
	AI_Output (other, self,"Stt_2503_Ramon_Chest_Quest_11_04"); //Jak mam je znaleŸæ, skoro nie wiem co w nich jest?
	AI_Output (self, other,"Stt_2503_Ramon_Chest_Quest_11_05"); //S¹ podpisane moim imieniem. Wiêkszoœæ ju¿ znalaz³em. Pozosta³y tylko cztery skrzynki.

	B_LogEntry(KeretselLookingForRamonAmulet, "Ramon odda mi amulet, jeœli przyniosê mu cztery skrzynie podpisane jego imieniem. Porozrzucane s¹ po jaskini mieszkalnej.");
	
	//uk³adamy 4 skrzynie w wybranych waypointach.. nazwa skrzyñ: RamonChests
};
/******************************************************************************************/
instance  Stt_2503_Ramon_Have_All_Chests (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 2;
	condition	= Stt_2503_Ramon_Have_All_Chests_Condition;
	information	= Stt_2503_Ramon_Have_All_Chests_Info;
	permanent	= 0;
	description = "Znalaz³em wszystkie Twoje skrzynie.";
};

FUNC int  Stt_2503_Ramon_Have_All_Chests_Condition()
{
	if ((Npc_HasItems(other,RamonChests)>=4) && (Npc_KnowsInfo(hero, Stt_2503_Ramon_Chest_Quest)))
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Have_All_Chests_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_00"); //Znalaz³em wszystkie Twoje skrzynie.
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_01"); //Dawaj je tu.
	
	B_GiveInvItems(self,hero,RamonChests,4);
	
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_02"); //Tak, to te. Co Ty w koñcu chcia³eœ?
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_03"); //Amulet.
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_04"); //Racja, racja. Wyœwiadczy³eœ mi przys³ugê. Jeœli chcesz to proszê, bierz. Ale nie za darmo.
	AI_Output (other, self,"Stt_2503_Ramon_Have_All_Chests_11_05"); //To za ile?
	
	//ORC: Zdefiniu ile rudy ma ¿¹daæ 
	AI_Output (self, other,"Stt_2503_Ramon_Have_All_Chests_11_06"); //Marne 100 bry³ek rudy. 

	B_LogEntry(KeretselLookingForRamonAmulet, "Zanios³em skrzynie Ramonowi. Odda mi on amulet, jeœli przyniosê mu jeszcze 100 bry³ek rudy.");
};
/******************************************************************************************/
instance  Stt_2503_Ramon_Give_Payment_For_Amulet (C_INFO)
{
	npc			= Stt_2503_Ramon;
	nr			= 3;
	condition	= Stt_2503_Ramon_Give_Payment_For_Amulet_Condition;
	information	= Stt_2503_Ramon_Give_Payment_For_Amulet_Info;
	permanent	= 0;
	description = "Oto ruda.";
};

FUNC int  Stt_2503_Ramon_Give_Payment_For_Amulet_Condition()
{
	if (Npc_KnowsInfo(hero, Stt_2503_Ramon_Have_All_Chests))
	{
		return 1;
	};
};

FUNC VOID  Stt_2503_Ramon_Give_Payment_For_Amulet_Info()
{
	AI_Output (other, self,"Stt_2503_Ramon_Give_Payment_For_Amulet_11_00"); //Oto ruda.
	
	if (Npc_HasItems(other,ItMiNugget)>=100)
	{
		B_GiveInvItems(other, self, ItMiNugget, 100);
		B_GiveInvItems(self,other,RamonAmulet,1);
	
		AI_Output (self, other,"Stt_2503_Ramon_Give_Payment_For_Amulet_11_01"); //No i widzisz? Pomog³eœ mi, teraz ja pomogê Tobie.
	
		B_LogEntry(KeretselLookingForRamonAmulet, "Ramon odda³ mi swój amulet. Mogê teraz zanieœæ go Keretselowi");
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_02"); //Chcesz mnie wyrolowaæ!? To nie jest 100 bry³ek rudy! Wróæ gdy je zdobêdziesz!
	};	
}; 
