
var int firts_exit;

// ************************ EXIT **************************

instance DIA_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= DIA_Grimes_Exit_Condition;
	information	= DIA_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Grimes_Exit_Info()
{
	if (firts_exit == false)
	{
		firts_exit = TRUE;
		AI_Output (other, self,"DIA_Grimes_Exit_Info_15_01"); //Powodzenia!
		AI_Output (self, other,"DIA_Grimes_Exit_Info_04_02"); //Nawzajem, ch³opcze. Nawzajem.
	};
	B_StopProcessInfos	(self);
};


// ***************** Hi *****************************

instance  DIA_Grimes_Hi (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= DIA_Grimes_Hi_Condition;
	information		= DIA_Grimes_Hi_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co tutaj robisz?"; 
};

FUNC int  DIA_Grimes_Hi_Condition()
{	
	//	if (Npc_KnowsInfo (hero,DIA_Grimes_FIRST))
	//	{
	return 1;
	//	};

};


FUNC void  DIA_Grimes_Hi_Info()
{
	AI_Output (other, self,"DIA_Grimes_Hi_Info_15_01"); //Co tutaj robisz?
	AI_Output (self, other,"DIA_Grimes_Hi_Info_04_02"); //Dogorywam ch³opcze. Sporo ju¿ widzia³em, mój czas powoli siê koñczy.

};



// ***************** Infos *****************************

instance  DIA_Grimes_Hello (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= DIA_Grimes_Hello_Condition;
	information		= DIA_Grimes_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jesteœ?"; 
};

FUNC int  DIA_Grimes_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Grimes_Hi))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
	{
		return 1;
	};

};


FUNC void  DIA_Grimes_Hello_Info()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_01"); //Od dawna tu jesteœ?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_02"); //Dobre dziesiêæ lat. Ale w obozie od niedawna.
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_03"); //Wiêkszoœæ czasu spêdzi³em w kopalni. By³o ciê¿ko, ale do wszystkiego mo¿na siê przyzwyczaiæ.
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_04"); //Nie masz ju¿ doœæ takiego ¿ycia?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_05"); //A czy to wa¿ne? Do wszystkiego mo¿na siê...
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_06"); //Wiem, ju¿ to mówi³eœ. Nie ¿al Ci towarzyszy, których zakatowali stra¿nicy? Albo innych, którzy zginêli w kopalni tylko dlatego, ¿eby nabiæ kabzê Gomezowi?
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_07"); //Do czego zmierzasz ch³opcze?
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_08"); //Gomez zaszed³ za skórê wielu ludziom, którzy postanowili powiedzieæ - NIE!
	AI_Output (other, self,"DIA_Grimes_Hello_Info_15_09"); //Kopacze tak¿e mog¹ zrzuciæ kajdany, ale nikt za was nie podejmie tej decyzji.
	AI_Output (self, other,"DIA_Grimes_Hello_Info_04_10"); //Jestem ju¿ stary, mam ju¿ doœæ ¿ycia. Po co mam walczyæ?
	Info_ClearChoices (DIA_Grimes_Hello);
	Info_AddChoice (DIA_Grimes_Hello, "Chcia³byœ ujrzeæ zachód s³oñca jako wolny cz³owiek?", DIA_Grimes_Hello_Sun);
	Info_AddChoice (DIA_Grimes_Hello, "Dla zemsty.", DIA_Grimes_Hello_Revange);
	Info_AddChoice (DIA_Grimes_Hello, "¯eby zrzuciæ kajdany niewoli.", DIA_Grimes_Hello_Chains);
};

// ---------------------------sun----------------------------------------

FUNC VOID DIA_Grimes_Hello_Sun()
{
	B_GiveXP(250);
	buddler_join = buddler_join + 1;
	AI_Output (other, self,"DIA_Grimes_Hello_Sun_15_01"); //Chcia³byœ ujrzeæ zachód s³oñca jako wolny cz³owiek?
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_02"); //Zachód s³oñca? Ju¿ dawno go nie ogl¹da³em...
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_03"); //Kiedy ¿yjesz jak szczur zapominasz, ¿e jesteœ cz³owiekiem.
	AI_Output (self, other,"DIA_Grimes_Hello_Sun_04_04"); //Przekonam kopaczy do walki o wolnoœæ.
	AI_Output (other, self,"DIA_Grimes_Hello_Sun_15_05"); //Dziêkujê!
	B_LogEntry		(CH3_RBL_Buddler, "Grimes przekona swoich popleczników do walki o wolnoœæ.");
	B_StopProcessInfos	(self);
};

// ---------------------------revange----------------------------------------

FUNC VOID DIA_Grimes_Hello_Revange()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Revange_15_01"); //Dla zemsty.
	AI_Output (self, other,"DIA_Grimes_Hello_Revange_04_02"); //W moim wieku zemsta?
	AI_Output (self, other,"DIA_Grimes_Hello_Revange_04_03"); //Zemsta to g³upota, szkoda na ni¹ czasu. Poza tym co schorowany starzec mo¿e zrobiæ stra¿nikom?
	Info_ClearChoices (DIA_Grimes_Hello);
};


// ---------------------------chains----------------------------------------

FUNC VOID DIA_Grimes_Hello_Chains()
{
	AI_Output (other, self,"DIA_Grimes_Hello_Chains_15_01"); //¯eby zrzuciæ kajdany niewoli.
	AI_Output (self, other,"DIA_Grimes_Hello_Chains_04_02"); //Kajdany... Po pewnym czasie cz³owiek przyzwyczaja siê do wszystkiego.
	AI_Output (self, other,"DIA_Grimes_Hello_Chains_04_03"); //Jestem ju¿ za stary i zbyt zmêczony, ¿eby walczyæ.
	Info_ClearChoices (DIA_Grimes_Hello);
};

