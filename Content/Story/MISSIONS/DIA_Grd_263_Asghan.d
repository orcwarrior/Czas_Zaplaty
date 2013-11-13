
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance  DIA_Asghan_Hi (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= DIA_Asghan_Hi_Condition;
	information		= DIA_Asghan_Hi_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jakoœ tu nie pasujesz."; 
};

FUNC int  DIA_Asghan_Hi_Condition()
{	
	return 1;
};

FUNC void  DIA_Asghan_Hi_Info()
{
	AI_Output(other, self,"DIA_Asghan_Hi_Info_15_01"); //Jakoœ tu nie pasujesz.
	AI_Output(self, other,"DIA_Asghan_Hi_Info_06_02"); //Te¿ czujê siê nieswojo na powierzchni.
	AI_Output(self, other,"DIA_Asghan_Hi_Info_06_03"); //Do niedawna pilnowa³em bramy w Starej Kopalni. Wtedy ¿ycie by³o prostsze...
	AI_Output(self, other,"DIA_Asghan_Hi_Info_06_04"); //Tutaj trzeba uwa¿aæ z kim i o czym siê gada...
	B_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance  DIA_Asghan_Escort (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= DIA_Asghan_Escort_Condition;
	information		= DIA_Asghan_Escort_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nie masz ochoty na zmianê otoczenia?"; 
};

FUNC int  DIA_Asghan_Escort_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(Npc_KnowsInfo (hero, DIA_Asghan_Hi))
	{
		return 1;
	};
};
FUNC void  DIA_Asghan_Escort_Info()
{
	AI_Output(other, self,"DIA_Asghan_Escort_Info_15_01"); //Nie masz ochoty na zmianê otoczenia?
	AI_Output(self, other,"DIA_Asghan_Escort_Info_06_02"); //Czytasz w moich myœlach. Ten cholerny obóz to nie miejsce dla uczciwego mordercy. 
	AI_Output(self, other,"DIA_Asghan_Escort_Info_06_03"); //O jakiej odmianie mówisz?
	AI_Output(other, self,"DIA_Asghan_Escort_Info_15_04"); //Ma³a wyprawa w plener, œwie¿e powietrze, szum drzew, zawodzenie wilków i takie tam.
	AI_Output(self, other,"DIA_Asghan_Escort_Info_06_05"); //Czemu nie. Co mia³bym robiæ?
	AI_Output(other, self,"DIA_Asghan_Escort_Info_15_06"); //Bêdziemy pilnowaæ transportu broni do Nowego Obozu.
	AI_Output(self, other,"DIA_Asghan_Escort_Info_06_07"); //Dobra, mo¿esz mnie wpisaæ na listê.
	AI_Output(other, self,"DIA_Asghan_Escort_Info_15_08"); //Poczekaj przy bramie, nied³ugo siê tam zjawimy. Paczki z broni¹ znajdziesz w barakach.
	AI_Output(self, other,"DIA_Asghan_Escort_Info_06_09"); //W porz¹dku. I dziêki za mo¿liwoœæ wyrwania siê z tej cuchn¹cej nory.
	B_LogEntry(CH5_NC_Convoys, "Ashgan z chêci¹ do³¹czy do eskorty.");
	
	Npc_ExchangeRoutine(self,"WAIT");
};

// ********************************************

instance  DIA_Asghan_End (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= DIA_Asghan_End_Condition;
	information		= DIA_Asghan_End_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co teraz zrobisz?"; 
};

FUNC int  DIA_Asghan_End_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cord_ConvoyConvoyTrapEnd))
	{
		return 1;
	};
};

FUNC void  DIA_Asghan_End_Info()
{
	AI_Output(other, self,"DIA_Asghan_End_Info_15_01"); //Co teraz zrobisz?
	AI_Output(self, other,"DIA_Asghan_End_Info_06_02"); //Odetchnê. Mam ju¿ doœæ wojowania w Kolonii. 
	AI_Output(self, other,"DIA_Asghan_End_Info_06_03"); //Oby tê cholern¹ barierê jak najszybciej trafi³ szlag.
	AI_Output(other, self,"DIA_Asghan_End_Info_15_04"); //Oby. Bywaj.
	Npc_ExchangeRoutine(self,"NC1");
};
