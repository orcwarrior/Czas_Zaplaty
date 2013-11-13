// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pomroka_Exit (C_INFO)
{
	npc			= Grd_4080_Pomroka;
	nr			= 999;
	condition	= DIA_Pomroka_Exit_Condition;
	information	= DIA_Pomroka_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pomroka_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pomroka_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int dark_fight;

INSTANCE DIA_Pomroka_First (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 1;
	condition		= DIA_Pomroka_First_Condition;
	information		= DIA_Pomroka_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pomroka_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Pomroka_First_11_01"); //Œwie¿y zrzut...
	AI_Output (self, other, "DIA_Pomroka_First_11_02"); //Witamy w G³êbi. A teraz wyskakuj z rudy.

	Info_ClearChoices (DIA_Pomroka_First);
	Info_AddChoice (DIA_Pomroka_First, "Sam j¹ sobie weŸ!", DIA_Pomroka_First_No);
	Info_AddChoice (DIA_Pomroka_First, "Nie chcê k³opotów, bierz rudê.", DIA_Pomroka_First_Yes);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Pomroka_First_Yes()
{
	AI_Output (other, self, "DIA_Pomroka_First_Yes_15_01"); //Nie chcê k³opotów, bierz rudê.
	AI_Output (self, other, "DIA_Pomroka_First_Yes_11_02"); //Grzeczny pieseczek. Tym razem ryja Ci nie obijê.
   
	B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget) );
	Npc_RemoveInvItems(self,ItMiNugget,NPC_HasItems(self,ItMiNugget));
	CreateInvItems(self,ItMiNugget, 825);
   
	AI_Output (self, other, "DIA_Pomroka_First_Yes_11_03"); //I zapamiêtaj sobie, w G³êbi rz¹dzi Pomroka!
	Log_CreateTopic(CH2_NON_Deep, LOG_MISSION);
	Log_SetTopicStatus(CH2_NON_Deep, LOG_RUNNING);
	B_LogEntry(CH2_NON_Deep, "No to witamy w G³êbi. Ju¿ na pocz¹tku jakiœ koleœ z babskim imieniem - Pomroka, zabra³ mi ca³¹ rudê. Czekaj¹ mnie trudne chwile...");

	B_StopProcessInfos(self); 
};

// ------------------No----------------

FUNC VOID DIA_Pomroka_First_No()
{
	dark_fight = TRUE;
	AI_Output (other, self, "DIA_Pomroka_First_No_15_01"); //Sam j¹ sobie weŸ!
	AI_Output (self, other, "DIA_Pomroka_First_No_11_02"); //Pieseczek pokazuje z¹bki.
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_Pomroka_First_No_11_03"); //Zaraz kilka profilaktycznie wybijemy...

	Log_CreateTopic(CH2_NON_Deep, LOG_MISSION);
	Log_SetTopicStatus(CH2_NON_Deep, LOG_RUNNING);
	B_LogEntry(CH2_NON_Deep, "No to witamy w G³êbi. Ju¿ na pocz¹tku jakiœ koleœ z babskim imieniem - Pomroka, chcia³ mi zabraæ ca³¹ rudê. Ale nie pójdzie im tak ³atwo - coœ mi siê wydaje, ¿e mieszkañców G³êbi czekaj¹ trudne chwile!");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

INSTANCE DIA_Pomroka_After (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 2;
	condition		= DIA_Pomroka_After_Condition;
	information		= DIA_Pomroka_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Pomroka_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pomroka_First ))&&(dark_fight == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Pomroka_After_07_01"); //I po co Ci to by³o ³achmyto? W G³êbi rz¹dzi...
		AI_Output (other, self, "DIA_Pomroka_After_15_02"); //Tak, wiem, Pomroka.
		AI_Output (self, other, "DIA_Pomroka_After_07_03"); //I dobrze, niech Ci siê to wyryje w pustej ³epetynie! A teraz dawaj rudê i zejdŸ mi z oczu.

		B_GiveInvItems (other, self,ItMiNugget,NPC_HasItems(other,ItMiNugget) );
		Npc_RemoveInvItems(self,ItMiNugget,NPC_HasItems(self,ItMiNugget));
		CreateInvItems(self,ItMiNugget, 825);
		B_LogEntry(CH2_NON_Deep, "Pomroka okaza³ siê twardym przeciwnikiem, a o rudzie mogê ju¿ zapomnieæ.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(200);
		AI_Output (self, other, "DIA_Pomroka_After_07_04"); //To niemo¿liwe... Nikt siê o tym nie mo¿e dowiedzieæ...
		AI_Output (other, self, "DIA_Pomroka_After_No_15_05"); //W koñcu trafi³eœ na wredniejszego od siebie, hê? A teraz grzecznie oddaj rudê, albo powtórzymy mordobicie.
		AI_Output (self, other, "DIA_Pomroka_After_07_06"); //Bierz rudê i... proszê nie bij mnie ju¿ wiêcej...
		B_GiveInvItems (self, other, ItMiNugget,NPC_HasItems(self,ItMiNugget) );
		B_LogEntry(CH2_NON_Deep, "Ten Pomroka to jakaœ kpina. Zabra³em mu rudê, ¿eby siê biedaczek nie przedŸwign¹³.");
	};
   
   B_StopProcessInfos(self); 
};

INSTANCE DIA_Pomroka_After1 (C_INFO)
{
	npc				= Grd_4080_Pomroka;
	nr				= 2;
	condition		= DIA_Pomroka_After1_Condition;
	information		= DIA_Pomroka_After1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co powiesz na ma³y wpierdol?"; 
};

FUNC INT DIA_Pomroka_After1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pomroka_First ))&&(dark_fight == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pomroka_After1_Info()
{
	AI_Output (other, self, "DIA_Pomroka_After1_15_01"); //Co powiesz na ma³y wpierdol?
	AI_Output (self, other, "DIA_Pomroka_After1_07_02"); //Spierdalaj!
};