// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guard_Exit (C_INFO)
{
	npc			= Grd_4107_Guard;
	nr			= 999;
	condition	= DIA_Guard_Exit_Condition;
	information	= DIA_Guard_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guard_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guard_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int guard_warn;

INSTANCE DIA_Guard_First (C_INFO)
{
	npc				= Grd_4107_Guard;
	nr				= 1;
	condition		= DIA_Guard_First_Condition;
	information		= DIA_Guard_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Guard_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Guard_First_Info()
{
	/*********************
Niech Bulit czeka teraz przed zejœciem na dó³ do lochów, musi zagadaæ do Dicka po tym jak wywali go stra¿ników celi z Diego 

********************/

	var C_NPC bul; bul = Hlp_GetNpc(GRD_203_Bullit);
	B_ExchangeRoutine(bul,"WAIT");

	B_FullStop (hero);
	AI_DrawWeapon (self);
	AI_GotoNpc(other,self);

	if (guard_warn==0)
	{
		guard_warn = guard_warn + 1;//1
		AI_Output (self, other,"DIA_Guard_First_14_01"); //Wynocha, nikt bez pozwolenia Gomeza nie ma tu wstêpu!
		AI_Output (other, self,"DIA_Guard_First_15_02"); //Chodzê tam, gdzie mi siê podoba.
		AI_Output (self, other,"DIA_Guard_First_14_03"); //Co Ty nie powiesz? Wypierdalaj!
	}
	else if (guard_warn==1)
	{
		guard_warn = guard_warn + 1;//2
		AI_Output (other, self,"DIA_Guard_First_15_04"); //Powiedzia³em, ¿e robiê co chcê i gdzie chcê!
		AI_Output (self, other,"DIA_Guard_First_06_05"); //Gomez zakaza³ mi zabijaæ stra¿ników - won!
	}
	else if (guard_warn==2)
	{
		guard_warn = guard_warn + 1;//3
		AI_Output (other, self,"DIA_Guard_First_15_06"); //Zamiast gadaæ, zrób coœ w koñcu!
		AI_Output (self, other,"DIA_Guard_First_06_07"); //Z przyjemnoœci¹ bym Ci z³oi³ skórê, ale mam inne rozkazy.
	}
	else
	{
		AI_Output (self, other,"DIA_Guard_First_06_08"); //Wypierdalaj!
	};
   
   AI_RemoveWeapon(self);
	B_StopProcessInfos(self);
	AI_GotoWP(other, "OCC_MERCS_DOWNSTAIRS_2");
};
