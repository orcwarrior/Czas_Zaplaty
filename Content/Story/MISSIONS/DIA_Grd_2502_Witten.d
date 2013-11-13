
// **************************************************
//						 EXIT
// **************************************************

instance  Grd_2502_Witten_Exit (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 999;
	condition	= Grd_2502_Witten_Exit_Condition;
	information	= Grd_2502_Witten_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Grd_2502_Witten_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_2502_Witten_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
//					Rozdzia³: 3
//					Misja:  Pierœcionek
// QUESTID 552
// **************************************************
instance  Grd_2502_Asking_About_Witten_Ring (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 1;
	condition	= Grd_2502_Asking_About_Witten_Ring_Condition;
	information	= Grd_2502_Asking_About_Witten_Ring_Info;
	permanent	= 0;
	description = "£adny pierœcionek.";
};

FUNC int  Grd_2502_Asking_About_Witten_Ring_Condition()
{
	if (GetTheWittenRing == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Grd_2502_Asking_About_Witten_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Asking_About_Witten_Ring_11_00"); //£adny pierœcionek.
	AI_Output (self, other,"Grd_2502_Asking_About_Witten_Ring_11_01"); //Czego chcesz?
	AI_Output (other, self,"Grd_2502_Asking_About_Witten_Ring_11_02"); //Chcia³bym go kupiæ.
	AI_Output (self, other,"Grd_2502_Asking_About_Witten_Ring_11_03"); //Kolejny sukinsyn, który myœli, ¿e wszystko jest do kupienia. Ja Ci zaraz dam nauczkê œmieciu!

	B_StopProcessInfos(self);
	
	B_StartAfterDialogFight(self,other,false);
};
/******************************************************************************************/
instance  Grd_2502_Witten_First_Talk_About_Ring(C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 2;
	condition	= Grd_2502_Witten_First_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_First_Talk_About_Ring_Info;
	permanent	= 0;
	description = "Na pewno go nie sprzedasz?";
};

FUNC int  Grd_2502_Witten_First_Talk_About_Ring_Condition()
{
	if ((Npc_GetAivar(self,AIV_HASDEFEATEDSC) == true) && (Npc_KnowsInfo(hero,Grd_2502_Asking_About_Witten_Ring)))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_First_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_00"); //Na pewno go nie sprzedasz?
	//orc: musisz ustalic tutaj sume jaka chce: linia w scenariuszu: 30
	AI_Output (self, other,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_01"); //Ehh... nawet biæ siê nie umiesz. Ciê¿ko u mnie z gotówk¹... 200 bry³ek rudy.
	AI_Output (other, self,"Grd_2502_Witten_First_Talk_About_Ring_Info_15_02"); //To du¿o pieniêdzy.
	AI_Output (self, other,"Grd_2502_Witten_First_Talk_About_Ring_Info_11_03"); //Ale Tobie bardzo na tym zale¿y.
	
	B_LogEntry(KeretselLookingForWittenRing, "Witten mo¿e mi sprzedaæ pierœcieñ za 200 bry³ek rudy.");
};
/******************************************************************************************/
instance  Grd_2502_Witten_Second_Talk_About_Ring (C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 3;
	condition	= Grd_2502_Witten_Second_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_Second_Talk_About_Ring_Info;
	permanent	= 0;
	description = "Proszê, oto ruda.";
};

FUNC int  Grd_2502_Witten_Second_Talk_About_Ring_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_2502_Witten_First_Talk_About_Ring))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_Second_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_00"); //Proszê, oto ruda.
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		B_GiveInvItems	(other, self, ItMiNugget, 200);
		AI_Output(self, other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_02"); //Cholera, chyba mi odbi³o. Sprzedawaæ taki pierœcionek za kilka bry³ek rudy!
		AI_Output(self, other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_03"); //Dostaniesz go dopiero, jak dorzucisz trzydzieœci bry³ek.
		
		B_LogEntry(KeretselLookingForWittenRing, "Witten zabra³ ca³¹ rudê, ale nie odda³ pierœcienia! ¯¹da jeszcze trzydziestu bry³ek!");		
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Second_Talk_About_Ring_Info_11_01"); //Umiem liczyæ. PrzyjdŸ, kiedy bêdziesz mia³ doœæ rudy!
	};	
};
/******************************************************************************************/
instance  Grd_2502_Witten_Final_Talk_About_Ring(C_INFO)
{
	npc			= Grd_2502_Witten;
	nr			= 4;
	condition	= Grd_2502_Witten_Final_Talk_About_Ring_Condition;
	information	= Grd_2502_Witten_Final_Talk_About_Ring_Info;
	permanent	= 1;
	description = "Oto 30 bry³ek.";
};

FUNC int  Grd_2502_Witten_Final_Talk_About_Ring_Condition()
{
	if (Npc_KnowsInfo(hero,Grd_2502_Witten_Second_Talk_About_Ring))
	{
		return 1;
	};
};

FUNC int  Grd_2502_Witten_Final_Talk_About_Ring_Info()
{
	AI_Output (other, self,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_00"); //Oto 30 bry³ek.
	
	if (Npc_HasItems(other,ItMiNugget)>=30)
	{
		B_GiveInvItems	(other, self, ItMiNugget, 30);
		
		AI_Output(self, other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_02"); //Wiesz co... nie uwa¿asz, ¿e to trochê za ma³o?
		AI_Output(other, self,"Grd_2502_Witten_Final_Talk_About_Ring_Info_15_03"); //Nie. Dawaj pierœcieñ.
		AI_Output(self, other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_04"); //Niech Ci ju¿ bêdzie, bierz i spadaj.
		
		B_GiveInvItems	(self, other, WittenRing, 1);
		
		B_StopProcessInfos(self);
		
		B_LogEntry(KeretselLookingForWittenRing, "Witten chcia³ dalej kombinowaæ, ale w koñcu zgodzi³ siê oddaæ pierœcieñ.");	
	}
	else
	{
		AI_Output(self,other,"Grd_2502_Witten_Final_Talk_About_Ring_Info_11_01"); //To nie jest 30 bry³ek rudy! PrzyjdŸ, jak je zdobêdziesz!
	};	
};
