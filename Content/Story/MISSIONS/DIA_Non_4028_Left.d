
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Left_Exit (C_INFO)
{
	npc			= Non_4028_Left;
	nr			= 999;
	condition	= DIA_Left_Exit_Condition;
	information	= DIA_Left_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Left_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Left_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Left_Hello (C_INFO)
{
	npc				= Non_4028_Left;
	nr				= 1;
	condition		= DIA_Left_Hello_Condition;
	information		= DIA_Left_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_Left_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Left_Hello_Info()
{
	AI_Output (other, self, "DIA_Left_Hello_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_Left_Hello_11_02"); //S³ucham duchów, gromadzê wiedzê wielu wieków i czekam na konwergerencjê...
	B_StopProcessInfos	(self);
};
