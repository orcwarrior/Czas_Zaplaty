// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Madman_Exit (C_INFO)
{
	npc			= VLK_4000_Buddler;
	nr			= 999;
	condition	= DIA_Madman_Exit_Condition;
	information	= DIA_Madman_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Madman_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Madman_Exit_Info()
{
	AI_Output (self, other, "DIA_Madman_Exit_11_00"); //Nie widzia³eœ jej?
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Madman_Hello (C_INFO)
{
	npc				= VLK_4000_Buddler;
	nr				= 1;
	condition		= DIA_Madman_Hello_Condition;
	information		= DIA_Madman_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Madman_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Madman_Hello_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

	AI_Output (self, other, "DIA_Madman_Hello_11_00"); //By³a tutaj... Widzia³em j¹, a potem zniknê³a w piasku.
	AI_Output (other, self, "DIA_Madman_Hello_15_01"); //Czego szukasz?
	AI_Output (self, other, "DIA_Madman_Hello_11_02"); //Wspomnieñ... Ta figurka nale¿a³a do niej... Tylko ona mi pozosta³a.
	B_StopProcessInfos	(self);
};
