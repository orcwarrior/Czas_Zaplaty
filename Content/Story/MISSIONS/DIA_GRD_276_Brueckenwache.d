// **************************************
//					EXIT 
// **************************************

instance DIA_GRD_276_Brueckenwache_Exit (C_INFO)
{
	npc			= GRD_276_Brueckenwache;
	nr			= 999;
	condition	= DIA_GRD_276_Brueckenwache_Exit_Condition;
	information	= DIA_GRD_276_Brueckenwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GRD_276_Brueckenwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_276_Brueckenwache_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_GRD_276_Brueckenwache_Fault (C_INFO)
{
	npc			= GRD_276_Brueckenwache;
	nr			= 1;
	condition	= DIA_GRD_276_Brueckenwache_Fault_Condition;
	information	= DIA_GRD_276_Brueckenwache_Fault_Info;
	permanent	= 0;
	important   = 1;
	description	= "";
};                       

FUNC int DIA_GRD_276_Brueckenwache_Fault_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_276_Brueckenwache_Fault_Info()
{
	AI_Output (self, other,"DIA_GRD_276_Brueckenwache_Fault_11_01"); //Co ty tu robisz?
	AI_Output (other, self,"DIA_GRD_276_Brueckenwache_Fault_15_02"); //Spacerujê...
	AI_Output (self, other,"DIA_GRD_276_Brueckenwache_Fault_11_03"); //¯artowniœ siê znalaz³! Ciekawe co powiesz na to!

	B_StopProcessInfos(self);
	B_StartAfterDialogFight(self,other,true);
};
