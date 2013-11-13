// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_hun_828_bruce_Exit (C_INFO)
{
	npc			= hun_828_bruce;
	nr			= 999;
	condition	= DIA_hun_828_bruce_Exit_Condition;
	information	= DIA_hun_828_bruce_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_828_bruce_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_828_bruce_Exit_Info()
{
	B_StopProcessInfos(self);
};
