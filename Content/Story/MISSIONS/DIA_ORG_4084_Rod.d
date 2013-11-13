
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Rod_Exit (C_INFO)
{
	npc			= ORG_4084_Rod;
	nr			= 999;
	condition	= DIA_Rod_Exit_Condition;
	information	= DIA_Rod_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rod_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Rod_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					
// **************************************************




INSTANCE DIA_Rod_First (C_INFO)
{
	npc				= ORG_4084_Rod;
	nr				= 1;
	condition		= DIA_Rod_First_Condition;
	information		= DIA_Rod_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Rod_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};


};

FUNC VOID DIA_Rod_First_Info()
{

	//WTF? Rod przyby³ w G2 z sylvio...
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Rod_First_15_01"); //
	AI_Output (self, other, "DIA_Rod_First_11_01"); //

};
