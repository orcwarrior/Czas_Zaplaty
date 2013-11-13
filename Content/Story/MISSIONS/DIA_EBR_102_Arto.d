// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ARTO_EXIT(C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 999;
	condition	= DIA_ARTO_EXIT_Condition;
	information	= DIA_ARTO_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ARTO_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_ARTO_Hello (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_Hello_Condition;
	information	= DIA_ARTO_Hello_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_ARTO_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_Hello_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_ARTO_Hello_13_01"); //Jestem Arto.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_ARTO_What (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_What_Condition;
	information	= DIA_ARTO_What_Info;
	permanent	= 0;
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC INT DIA_ARTO_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_What_Info()
{	
	AI_Output (other, self,"DIA_ARTO_What_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_ARTO_What_13_01"); //Jestem stra¿nikiem Gomeza.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_ARTO_PERM (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_PERM_Condition;
	information	= DIA_ARTO_PERM_Info;
	permanent	= 0;
	description = "Nie lubisz du¿o gadaæ, co?";
};                       

FUNC INT DIA_ARTO_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_What))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_PERM_Info()
{	
	AI_Output (other, self,"DIA_ARTO_PERM_15_00"); //Nie lubisz du¿o gadaæ, co?
	AI_Output (self, other,"DIA_ARTO_PERM_13_01"); //Nie.
};

// ************************************************************

INSTANCE DIA_ARTO_Sword (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 4;
	condition	= DIA_ARTO_Sword_Condition;
	information	= DIA_ARTO_Sword_Info;
	permanent	= 0;
	description = "Podobno wolisz miecze ni¿ kobiety.";
};                       

FUNC INT DIA_ARTO_Sword_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Skip_Swords))&&(Npc_KnowsInfo (hero,DIA_ARTO_PERM))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_Sword_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Sword_15_00"); //Podobno wolisz miecze ni¿ kobiety.
	AI_Output (self, other,"DIA_ARTO_Sword_13_01"); //Kto to powiedzia³?
	AI_Output (other, self,"DIA_ARTO_Sword_15_02"); //Skip wygaduje ró¿ne g³upoty po pijaku.
	AI_Output (self, other,"DIA_ARTO_Sword_13_03"); //Zabijê skurwiela...

	/********************

Niech siê przejdzie do SKkipa i go kropnie - gadanie nie pop³aca ;P
*********************/

	AI_GotoWP(self, "OCC_STABLE_BACK");

	var C_NPC skip; skip = Hlp_GetNpc(GRD_211_Skip);
	Npc_ChangeAttribute	(skip, ATR_HITPOINTS, -skip.attribute[ATR_HITPOINTS_MAX]);

	AI_GotoWP(self, "OCC_BARONS_HALLWAY_FRONT");
	AI_GotoNpc(other, self);
	AI_Output (other, self,"DIA_ARTO_Sword_15_04"); //Jak posz³o?
	AI_TurnToNpc(self,other);
	AI_Output (self, other,"DIA_ARTO_Sword_13_05"); //Skip juz nic wiêcej nie powie.
	B_StopProcessInfos(self);
};
