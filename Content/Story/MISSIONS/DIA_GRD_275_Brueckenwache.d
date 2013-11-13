// **************************************
//					EXIT 
// **************************************

instance DIA_GRD_275_Brueckenwache_Exit (C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 999;
	condition	= DIA_GRD_275_Brueckenwache_Exit_Condition;
	information	= DIA_GRD_275_Brueckenwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GRD_275_Brueckenwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_275_Brueckenwache_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_GRD_275_Brueckenwache_Fault (C_INFO)
{
	npc			= GRD_275_Brueckenwache;
	nr			= 1;
	condition	= DIA_GRD_275_Brueckenwache_Fault_Condition;
	information	= DIA_GRD_275_Brueckenwache_Fault_Info;
	permanent	= 0;
	important   = 0;
	description	= "Coœ blado wygl¹dasz.";
};                       

FUNC int DIA_GRD_275_Brueckenwache_Fault_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_275_Brueckenwache_Fault_Info()
{
	AI_Output (other, self,"DIA_GRD_275_Brueckenwache_Fault_15_01"); //Coœ blado wygl¹dasz.
	AI_Output (self, other,"DIA_GRD_275_Brueckenwache_Fault_11_02"); //Byæ, albo nie byæ...
	AI_Output (other, self,"DIA_GRD_275_Brueckenwache_Fault_15_03"); //Dobrze siê czujesz?
	AI_Output (self, other,"DIA_GRD_275_Brueckenwache_Fault_11_04"); //Jesteœmy tylko prochem rzuconym na wiatr...	
	AI_Output (other, self,"DIA_GRD_275_Brueckenwache_Fault_15_05"); //Od tego stania na s³oñcu chyba ugotowa³eœ sobie mózg.
	AI_Output (self, other,"DIA_GRD_275_Brueckenwache_Fault_11_06"); //Memento mori...
	AI_Output (other, self,"DIA_GRD_275_Brueckenwache_Fault_15_07"); //No nic, na mnie ju¿ czas...
	AI_Output (self, other,"DIA_GRD_275_Brueckenwache_Fault_11_08"); //Hmm, wróg mojego przyjaciela jest moim wrogiem. Zdychaj!	
	B_StopProcessInfos(self);
	B_StartAfterDialogFight(self,other,true);
};
