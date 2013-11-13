// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
{
	return 1;
};

FUNC VOID DIA_Orry_PreExit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_Hi (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_Hi_Condition;
	information		= DIA_Orry_Hi_Info;
	permanent		= 0;
	description		= "Czym siê zajmujesz?"; 
};

FUNC INT DIA_Orry_Hi_Condition()
{	
	return 1;
};

FUNC VOID DIA_Orry_Hi_Info()
{
	AI_Output (other, self,"DIA_Orry_Hi1_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_Orry_Hi1_06_01"); //Kiedyœ dba³em o to, by nikt nieproszony nie pa³êta³ siê w pobli¿u Placu Wymiany.
	AI_Output (self, other,"DIA_Orry_Hi1_06_02"); //Teraz gnijê w obozie jak wiêkszoœæ stra¿ników. Czasami zastanawiam siê, czy dobrze zrobi³em do³¹czaj¹c do tej bandy.
};

// **************************************************

INSTANCE DIA_Orry_Eskort (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_Eskort_Condition;
	information		= DIA_Orry_Eskort_Info;
	permanent		= 0;
	description		= "Wygl¹dasz na znudzonego."; 
};

FUNC INT DIA_Orry_Eskort_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Orry_Hi))&&(Npc_KnowsInfo (hero, DIA_Orkan_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Eskort_Info()
{
	AI_Output (other, self,"DIA_Orry_Eskort_15_00"); //Wygl¹dasz na znudzonego.
	AI_Output (self, other,"DIA_Orry_Eskort_06_01"); //W tym obozie nic siê nie dzieje. W ka¿dym razie nic interesuj¹cego.
	AI_Output (other, self,"DIA_Orry_Eskort_15_02"); //Nie masz ochoty na ma³¹ wyprawê poza palisadê?
	AI_Output (self, other,"DIA_Orry_Eskort_06_03"); //Wiem, kim jesteœ. Namawiasz stra¿ników do przy³¹czenia siê, do tego nieszczêsnego konwoju.
	AI_Output (self, other,"DIA_Orry_Eskort_06_04"); //Z chêci¹ bym pomóg³, ale to zbyt niebezpieczne. Zamierzam do¿yæ do momentu kiedy, tê cholern¹ barierê szlag trafi.
	AI_Output (other, self,"DIA_Orry_Eskort_15_05"); //Rozumiem, bywaj.
};

// **************************************************

INSTANCE DIA_Orry_Attack (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Attack_Condition;
	information		= DIA_Orry_Attack_Info;
	permanent		= 0;
	description		= "Nie obawiasz siê rebeliantów?"; 
};

FUNC INT DIA_Orry_Attack_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Orry_Eskort))&&(CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Attack_Info()
{
	AI_Output (other, self,"DIA_Orry_Attack_15_00"); //Nie obawiasz siê rebeliantów?
	AI_Output (self, other,"DIA_Orry_Attack_06_01"); //Co ma byæ to bêdzie. Zewnêtrzny pierœcieñ jest dobrze strze¿ony, w¹tpiê, ¿e ktoœ zdo³a siê przebiæ dalej ni¿ do zamkowej bramy.
	AI_Output (other, self,"DIA_Orry_Attack_15_02"); //Ale atak na pierœcieñ mocno os³abi³by obóz.
	AI_Output (self, other,"DIA_Orry_Attack_06_03"); //Niezupe³nie. Gomez wiêkszoœæ stra¿ników wycofa³ do zamku, a tam raczej nikt nie dojdzie w jednym kawa³ku.
	AI_Output (other, self,"DIA_Orry_Attack_15_04"); //Chyba, ¿e ktoœ podniesie bramê...
	AI_Output (self, other,"DIA_Orry_Attack_06_05"); //Co Ty pieprzysz. To niemo¿liwe, nikt nie jest a¿ takim idiot¹.
	AI_Output (self, other,"DIA_Orry_Attack_06_06"); //Poza tym Gomez dodatkowo wzmocni³ obstawê bramy zamkowej i ko³owrotu. Nikt nie zrobi³by tego po cichu.

	/***************
Ork dodaj tam z kilkunastu stra¿ników, przy samym ko³owrocie ze 4-5, niech to bêdzie mo¿liwe, ale ekstremalnie trudne.

*****************/
};
