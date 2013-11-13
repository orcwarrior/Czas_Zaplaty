// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mathis_Exit (C_INFO)
{
	npc			= Grd_3101_Mathis;
	nr			= 999;
	condition	= DIA_Mathis_Exit_Condition;
	information	= DIA_Mathis_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mathis_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Mathis_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Mathis_Hello (C_INFO)
{
	npc				= Grd_3101_Mathis;
	nr				= 1;
	condition		= DIA_Mathis_Hello_Condition;
	information		= DIA_Mathis_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Mathis_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Mathis_Hello_Info()
{
	AI_Output (self, other, "DIA_Mathis_Hello_07_01"); //Tu nie ma wejœcia!
	AI_Output (other, self, "DIA_Mathis_Hello_15_02"); //Co tam chowacie? Kobitki?
	AI_Output (self, other, "DIA_Mathis_Hello_07_03"); //Gdybym Ci powiedzia³, musia³bym Ciê zabiæ. Spadaj!
	B_StopProcessInfos(self);
};

//***************************************

instance DIA_Mathis_Do (C_INFO)
{
	npc				= Grd_3101_Mathis;
	condition		= DIA_Mathis_Do_Condition;
	information		= DIA_Mathis_Do_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_Mathis_Do_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Mathis_Hello))
	{
		return 1;
	};
};
func void  DIA_Mathis_Do_Info()
{
	AI_Output (self, other,"DIA_Mathis_Do_Info_07_01"); //I pamiêtaj, ¿e bêdê mia³ na Ciebie oko, wiêc ³apska precz od skrzyñ!
	AI_Output (other, self,"DIA_Mathis_Do_Info_15_02"); //Jakich skrzyñ? Przecie¿ i tak s¹ zamkniête, a klucza nie mam.
	AI_Output (self, other,"DIA_Mathis_Do_Info_07_03"); //Sk¹d wiesz o kluczu?! Chyba nie grzeba³eœ w skrzyni w ruinach chaty?!
	AI_Output (other, self,"DIA_Mathis_Do_Info_15_04"); //Gdzie¿bym œmia³, bywaj.
	//NOTE: Sher, Crappy dialog (log) modified by orc
	// I mo¿e jakaœ bardziej szczególna wskazówka, bo po obecnej nie³atwo domyslec sie ze klucz jest schowany
	// w skrzyni w ruinach chaty.
	B_LogEntry(CH3_RBL_Weapon, "Mathis, cz³owiek który pilnuje magazynu przy arenie, o ma³o nie wypapla³ jak dostaæ siê do wnêtrza. Kiedy powiedzia³em o kluczu, wspomnia³ coœ o skrzyni w zrujnowanej chacie. Sêk w tym, ¿e takich chat jest ca³kiem sporo, czas wiêc rozpocz¹æ poszukiwania.");	
	B_StopProcessInfos(self);
};
