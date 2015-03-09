// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Kopaczus_Fault (C_INFO)
{
	npc			= VLK_4201_Buddler;
	nr			= 1;
	condition	= DIA_Kopaczus_Fault_Condition;
	information	= DIA_Kopaczus_Fault_Info;
	permanent	= 0;
	description	= "Mam coœ do przekazania.";
};                       

FUNC int DIA_Kopaczus_Fault_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Urt_DiegoJail))
	{
		return 1;
	};
};

FUNC VOID DIA_Kopaczus_Fault_Info()
{
	AI_Output (other, self,"DIA_Kopaczus_Fault_15_00"); //Mam coœ do przekazania.
	AI_Output (self, other,"DIA_Kopaczus_Fault_11_01"); //Tak?
	AI_Output (other, self,"DIA_Kopaczus_Fault_15_02"); //Ju¿ wkrótce zamkowy dziedziniec sp³ynie krwi¹ stra¿ników. Jesteœcie z nami?		
	AI_PlayAni(other,"T_YES");	
   	AI_Output (other, self,"DIA_Kopaczus_Fault_15_03"); //Kiedy zacznie siê jatka przepuœcicie atak na zewnêtrzny pierœcieñ i otworzycie bramy.
	AI_PlayAni(other,"T_YES");
    AI_Output (other, self,"DIA_Kopaczus_Fault_15_04"); //Ju¿ nied³ugo g³owa Gomeza bêdzie siê szczerzyæ na piêknie naostrzonym palu!
	AI_Output (self, other,"DIA_Kopaczus_Fault_11_05"); //To by³by wspania³y widok!	
	B_LogEntry		(CH6_RBL_Coordinate, "Kopacze zajm¹ siê zewnêtrznym pierœcieniem i bramami.");
	B_StopProcessInfos	(self);

};


