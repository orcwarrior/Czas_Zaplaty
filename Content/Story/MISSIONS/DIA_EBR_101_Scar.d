// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Mówi¹ na mnie Blizna.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Czym siê zajmujesz?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ja i Arto zapewniamy Gomezowi spokój przed nieproszonymi goœæmi.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Oprócz tego, do moich obowi¹zków nale¿y poskramianie co zadziorniejszych kobiet.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 0;
	description = "Co mo¿esz mi powiedzieæ o Gomezie?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Co mo¿esz mi powiedzieæ o Gomezie?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //To najpotê¿niejszy cz³owiek w ca³ej Kolonii. To Ci powinno wystarczyæ.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostaje wszystko, czego zapragnie, choæ tak naprawdê zale¿y mu tylko na w³adzy.
};

// ************************************************************

INSTANCE DIA_SCAR_Attack (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 4;
	condition	= DIA_SCAR_Attack_Condition;
	information	= DIA_SCAR_Attack_Info;
	permanent	= 0;
	description = "Nie obawiasz siê ataku?";
};                       

FUNC INT DIA_SCAR_Attack_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_PERM))&&(CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Attack_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Attack_15_00"); //Nie obawiasz siê ataku?
	AI_Output (self, other,"DIA_SCAR_Attack_08_01"); //Tutaj? Nikt nie wedrze siê do zamku. Zanim sforsuj¹ bramê, zrobimy z nich r¹bankê.
	AI_Output (other, self,"DIA_SCAR_Attack_15_02"); //A je¿eli otworz¹ bramê?
	AI_Output (self, other,"DIA_SCAR_Attack_08_03"); //Dziwne pytanie. Po której Ty jesteœ ze stron?
	AI_Output (other, self,"DIA_SCAR_Attack_15_04"); //Tak tylko pytam.
	AI_Output (self, other,"DIA_SCAR_Attack_08_05"); //Spadaj.
};
