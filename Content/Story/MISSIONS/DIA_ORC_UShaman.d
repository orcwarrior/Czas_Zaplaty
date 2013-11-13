//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_UOrcShaman_EXIT (C_INFO)
{
	npc			= ORC_4031_Shaman;
	nr			= 999;
	condition	= Info_UOrcShaman_EXIT_Condition;
	information	= Info_UOrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_UOrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_UOrcShaman_EXIT_Info()
{
	B_StopProcessInfos	( self );
};


//---------------------------------------------------------------------
instance  Info_UOrcShaman_Kill(C_INFO)
{
	npc			= ORC_4031_Shaman;
	condition	= Info_UOrcShaman_Kill_Condition;
	information	= Info_UOrcShaman_Kill_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_UOrcShaman_Kill_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_UOrcShaman_Kill_Info()
{
	AI_Output 		(other,self,"Info_UOrcShaman_Kill_15_01"); //
	AI_Output 	(self, hero,"Info_UOrcShaman_Kill_17_02"); //

};




