// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Nazywam siê Bartholo. Zajmujê siê zaopatrywaniem magnatów.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Dostarczam im wszystkiego - od ziela, przez ¿ywnoœæ, a¿ po kobiety.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Oprócz tego pilnujê tych imbecyli z kuchni.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Te b³azny powinny byæ mi wdziêczne. Gomez nie toleruje partactwa, nawet w kuchni. Poprzednimi kucharzami nakarmi³ topielce.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Chcê dobiæ z tob¹ targu.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chcê dobiæ z tob¹ targu.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mam sporo ciekawych rzeczy - jeœli masz wystarczaj¹co du¿o rudy.
};
