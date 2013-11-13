// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_20254_Grd (C_INFO)
{
	npc			= HUN_20254_Grd;
	nr			= 999;
	condition	= DIA_HUN_20254_Grd_Exit_Condition;
	information	= DIA_HUN_20254_Grd_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_20254_Grd_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_20254_Grd_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_HUN_20254_Grd_Hello (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello_Condition;
	information		= DIA_HUN_20254_Grd_Hello_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_01"); //Zgubi³eœ siê?
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello_15_02"); //Co to za miejsce?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_03"); //Ta cuchn¹ca nora, to wejœcie do G³êbi.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello_15_04"); //G³êbia?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_05"); //Opuszczona kopalnia, z której nie ma wyjœcia.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello_06_06"); //OdejdŸ, nie wpuszczam tu nikogo bez zgody Cavalorna.
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello1 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello1_Condition;
	information		= DIA_HUN_20254_Grd_Hello1_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello1_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))&&(Npc_KnowsInfo(other,DIA_HUN_20254_Grd_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_01"); //To znowu Ty.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello1_15_02"); //Mo¿e jednak zmienisz zdanie? Z chêci¹ zwiedzê kopalniê.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_03"); //Lepiej nie kuœ losu. Nikt przy zdrowych zmys³ach nie pcha siê tam dobrowolnie.
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello1_15_04"); //To jak bêdzie?
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello1_06_05"); //OdejdŸ.
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello2 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello2_Condition;
	information		= DIA_HUN_20254_Grd_Hello2_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_20254_Grd_Hello2_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(!Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))&&(Npc_KnowsInfo(other,DIA_HUN_20254_Grd_Hello1))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello2_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello2_06_01"); //Zmiataj st¹d!
	
   B_StopProcessInfos(self);
	AI_GotoWP(other, "OW_PATH_BEACH");
};	
	
INSTANCE DIA_HUN_20254_Grd_Hello3 (C_INFO)
{
	npc				= HUN_20254_Grd;
	nr				= 2;
	condition		= DIA_HUN_20254_Grd_Hello3_Condition;
	information		= DIA_HUN_20254_Grd_Hello3_Info;
	permanent		= 0;
	important		= 1;
	description		= "Jak ty stamt¹d uciek³eœ?"; 
};

FUNC INT DIA_HUN_20254_Grd_Hello3_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(other,DIA_Abel_SpyKillEnd6))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_20254_Grd_Hello3_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_01"); //Jak ty stamt¹d uciek³eœ?
	AI_Output (other, self,"DIA_HUN_20254_Grd_Hello3_15_02"); //Powiedzmy, ¿e mia³em farta.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_03"); //Nie wierzê w szczêœcie, ale niech ci bêdzie.
	AI_Output (self, other,"DIA_HUN_20254_Grd_Hello3_06_04"); //Bywaj.
	
   B_StopProcessInfos(self);
};	
	