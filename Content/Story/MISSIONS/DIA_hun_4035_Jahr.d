// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_hun_4035_jahr_Exit (C_INFO)
{
	npc			= hun_4035_jahr;
	nr			= 999;
	condition	= DIA_hun_4035_jahr_Exit_Condition;
	information	= DIA_hun_4035_jahr_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_4035_jahr_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_4035_jahr_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_hun_4035_jahr_Hello (C_INFO)
{
	npc				= hun_4035_jahr;
	nr				= 12;
	condition		= DIA_hun_4035_jahr_Hello_Condition;
	information		= DIA_hun_4035_jahr_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_hun_4035_jahr_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_4035_jahr_Hello_Info()
{
	AI_Output (self, other, "DIA_hun_4035_jahr_Hello_15_01"); //Aaa! Zabierz to ode mnie!
	B_StopProcessInfos(self);
};
