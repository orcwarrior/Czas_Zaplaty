
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Krzywy_Exit (C_INFO)
{
	npc			= VLK_4083_Krzywy;
	nr			= 999;
	condition	= DIA_Krzywy_Exit_Condition;
	information	= DIA_Krzywy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Krzywy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Krzywy_Exit_Info()
{
	B_StopProcessInfos	( self );
};

INSTANCE DIA_Krzywy_First (C_INFO)
{
	npc				= VLK_4083_Krzywy;
	nr				= 1;
	condition		= DIA_Krzywy_First_Condition;
	information		= DIA_Krzywy_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie boli ciê ju¿ dupa od siedzenia?"; 
};

FUNC INT DIA_Krzywy_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Krzywy_First_Info()
{
	AI_Output (other, self, "DIA_Krzywy_First_15_01"); //Nie boli ciê ju¿ dupa od siedzenia?
	AI_Output (self, other, "DIA_Krzywy_First_11_02"); //A co Ciê to obchodzi?
	AI_Output (other, self, "DIA_Krzywy_First_15_03"); //Grzeczniej, proszê.
	AI_Output (self, other, "DIA_Krzywy_First_11_04"); //Bo co? Zabijesz mnie? He, he, jakbyœ nie zauwa¿y³, to my wszyscy jesteœmy ju¿ martwi!
	AI_Output (other, self, "DIA_Krzywy_First_15_05"); //Nie ma st¹d ¿adnego wyjœcia?
	AI_Output (self, other, "DIA_Krzywy_First_11_06"); //Nie ma idioto i nigdy nie bêdzie, chyba, ¿e nogami do przodu!
	AI_Output (other, self, "DIA_Krzywy_First_15_07"); //To niemo¿liwe, zawsze jest jakieœ wyjœcie.
	AI_Output (self, other, "DIA_Krzywy_First_11_08"); //Pieprzysz jak ten œwir Paj¹k. On te¿ uwa¿a, ¿e z G³êbi mo¿na zbiec. Na staroœæ pomiesza³o mu siê we ³bie...
	AI_Output (self, other, "DIA_Krzywy_First_11_09"); //Daj mi wróciæ do pracy...
	B_LogEntry		(CH2_NON_Deep, "Krzywy powiedzia³, ¿e jakiœ Paj¹k twierdzi, ¿e z G³êbi mo¿na jednak zbiec. Muszê z nim pogadaæ.");
	B_StopProcessInfos	( self );
}; 

INSTANCE DIA_Krzywy_First1 (C_INFO)
{
	npc				= VLK_4083_Krzywy;
	nr				= 1;
	condition		= DIA_Krzywy_First1_Condition;
	information		= DIA_Krzywy_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Krzywy_First1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Krzywy_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Krzywy_First1_Info()
{
	AI_Output (self, other, "DIA_Krzywy_First1_11_01"); //Jak tak na Ciebie spojrzeæ to wygl¹dasz doœæ... smakowicie.
	AI_Output (self, other, "DIA_Krzywy_First1_11_02"); //Od dawna nie mia³em ludzkiego miêsa w ustach.	
	AI_Output (other, self, "DIA_Krzywy_First1_15_03"); //Je¿eli o mnie chodzi, to lepiej ¿eby tak pozosta³o!
};