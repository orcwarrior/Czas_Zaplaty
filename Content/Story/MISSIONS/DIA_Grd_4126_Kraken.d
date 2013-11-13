// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_KRAKEN_EXIT(C_INFO)
{
	npc			= Grd_4126_Kraken;
	nr			= 999;
	condition	= DIA_KRAKEN_EXIT_Condition;
	information	= DIA_KRAKEN_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_KRAKEN_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_KRAKEN_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_KRAKEN_Hello (C_INFO)
{
	npc			= Grd_4126_Kraken;
	nr			= 3;
	condition	= DIA_KRAKEN_Hello_Condition;
	information	= DIA_KRAKEN_Hello_Info;
	permanent	= 0;
	description = "Witaj.";
};                       

FUNC INT DIA_KRAKEN_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_KRAKEN_Hello_Info()
{	
	AI_Output (other, self,"DIA_KRAKEN_Hello_15_00"); //Witaj.
	AI_Output (self, other,"DIA_KRAKEN_Hello_06_01"); //Nie widzisz, ¿e jestem zajêty. IdŸ poirytuj kogoœ innego.
};

// ************************************************************

INSTANCE DIA_KRAKEN_Again (C_INFO)
{
	npc			= Grd_4126_Kraken;
	nr			= 2;
	condition	= DIA_KRAKEN_Again_Condition;
	information	= DIA_KRAKEN_Again_Info;
	permanent	= 0;
	description = "Chcia³em tylko...";
};                       

FUNC INT DIA_KRAKEN_Again_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_KRAKEN_Hello))
	{ 
		return 1;
	};
};

FUNC VOID DIA_KRAKEN_Again_Info()
{	
	AI_Output (other, self,"DIA_KRAKEN_Again_15_00"); //Chcia³em tylko...
	AI_Output (self, other,"DIA_KRAKEN_Again_06_01"); //Niech zgadnê. Dostaæ porz¹dny ³omot. Proszê bardzo, do us³ug!
	B_StopProcessInfos(self);
	B_StartAfterDialogFight(self,other,false);
};

// ************************************************************

INSTANCE DIA_KRAKEN_Again1 (C_INFO)
{
	npc			= Grd_4126_Kraken;
	condition	= DIA_KRAKEN_Again1_Condition;
	information	= DIA_KRAKEN_Again1_Info;
	permanent	= 0;
	description = "Co powiesz tym razem?";
};                       

FUNC INT DIA_KRAKEN_Again1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_KRAKEN_Again))
	{ 
		return 1;
	};
};

FUNC VOID DIA_KRAKEN_Again1_Info()
{	
	AI_Output (other, self,"DIA_KRAKEN_Again1_15_00"); //Co powiesz tym razem?
	AI_Output (self, other,"DIA_KRAKEN_Again1_06_01"); //Daj mi ju¿ spokój do cholery. Sk¹d bior¹ siê takie natrêtne robale jak Ty?
	B_StopProcessInfos(self);
};

// ************************************************************

INSTANCE DIA_KRAKEN_Raven (C_INFO)
{
	npc			= Grd_4126_Kraken;
	condition	= DIA_KRAKEN_Raven_Condition;
	information	= DIA_KRAKEN_Raven_Info;
	permanent		= 0;
	important		= 0;
	description = "Mam przesy³kê od Kruka.";
};                       

FUNC INT DIA_KRAKEN_Raven_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_After))&&(NPC_HasItems(other,Raven_bottle)>=1)
	{ 
		return 1;
	};
};

FUNC VOID DIA_KRAKEN_Raven_Info()
{	

	AI_Output (other, self,"DIA_KRAKEN_Raven_15_00"); //Mam przesy³kê od Kruka.
	AI_Output (self, other,"DIA_KRAKEN_Raven_06_01"); //Co tak d³ugo?
	
   B_GiveInvItems (other, self, Raven_bottle, 1);
	Npc_RemoveInvItems(self,Raven_bottle,1);
	
   AI_Output (self, other,"DIA_KRAKEN_Raven_06_02"); //A teraz spadaj.
	
   B_LogEntry(CH2_RBL_Lighthouse, "Dostarczy³em przesy³kê. Czas porozmawiaæ z Krukiem.");
	B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self, "OC");
};