
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Ares_Exit (C_INFO)
{
	npc			= STT_345_Warrior;
	nr			= 999;
	condition	= DIA_Ares_Exit_Condition;
	information	= DIA_Ares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Ares_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Ares_Exit_Info()
{


	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Ares_Hello (C_INFO)
{
	npc				= STT_345_Warrior;
	nr				= 1;
	condition		= DIA_Ares_Hello_Condition;
	information		= DIA_Ares_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em..."; 
};

FUNC INT DIA_Ares_Hello_Condition()
{
	return 1;

};

FUNC VOID DIA_Ares_Hello_Info()
{
	AI_Output (other, self, "DIA_Ares_Hello_15_01"); //Chcia³em...
	AI_Output (self, other, "DIA_Ares_Hello_05_02"); //Wynoœ siê! To nie miejsce dla miêczaków.
	B_StopProcessInfos	(self);

};

// **************************************************


INSTANCE DIA_Ares_Provoke (C_INFO)
{
	npc				= STT_345_Warrior;
	nr				= 2;
	condition		= DIA_Ares_Provoke_Condition;
	information		= DIA_Ares_Provoke_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeszcze nie skoñczy³em!"; 
};

FUNC INT DIA_Ares_Provoke_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Ares_Hello))
	{

		return 1;

	};

};

FUNC VOID DIA_Ares_Provoke_Info()
{
	AI_Output (other, self, "DIA_Ares_Provoke_15_01"); //Jeszcze nie skoñczy³em!
	AI_Output (self, other, "DIA_Ares_Provoke_05_02"); //Ale ja tak - wynocha!
	B_StopProcessInfos	(self); 


};

// **************************************************


INSTANCE DIA_Ares_Provoke1 (C_INFO)
{
	npc				= STT_345_Warrior;
	nr				= 3;
	condition		= DIA_Ares_Provoke1_Condition;
	information		= DIA_Ares_Provoke1_Info;
	permanent		= 0;
	important		= 0;
	description		= "A¿ siê prosisz, ¿eby obiæ Ci ryj!"; 
};

FUNC INT DIA_Ares_Provoke1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Ares_Provoke))&&(Npc_KnowsInfo(hero,DIA_Felos_ArenaOk))
	{

		return 1;

	};

};

FUNC VOID DIA_Ares_Provoke1_Info()
{
	AI_Output (other, self, "DIA_Ares_Provoke1_15_01"); //A¿ siê prosisz, ¿eby obiæ Ci ryj!
	AI_Output (self, other, "DIA_Ares_Provoke1_05_02"); //Nic z tego z³amasie! Bez aprobaty Gomeza nie spuszczê Ci lania. Wynocha!
	B_LogEntry		(CH3_Grd_Arena, "Ares nie da³ siê sprowokowaæ.");
	B_StopProcessInfos	(self); 


}; 
