/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Sld_701_Orik_Exit (C_INFO)
{
	npc			=  Sld_701_Orik;
	nr			=  999;
	condition	=  Sld_701_Orik_Exit_Condition;
	information	=  Sld_701_Orik_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_701_Orik_Exit_Condition()
{
	return 1;
};

FUNC VOID  Sld_701_Orik_Exit_Info()
{
	B_StopProcessInfos	( self );
};

instance  DIA_Orik_Hi (C_INFO)
{
	npc				= Sld_701_Orik;
	condition		= DIA_Orik_Hi_Condition;
	information		= DIA_Orik_Hi_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hej, Ty!"; 
};

FUNC int  DIA_Orik_Hi_Condition()
{	
	return 1;
};

FUNC void  DIA_Orik_Hi_Info()
{
	AI_Output (other, self,"DIA_Orik_Hi_15_01"); //Hej, Ty!
	AI_Output (self, other,"DIA_Orik_Hi_14_02"); //Co?
	AI_Output (other, self,"DIA_Orik_Hi_15_03"); //Witaj.
	AI_Output (self, other,"DIA_Orik_Hi_14_04"); //Co?!
	AI_Output (other, self,"DIA_Orik_Hi_15_05"); //Coœ ty og³uch³?
	AI_Output (self, other,"DIA_Orik_Hi_14_06"); //S³abo s³yszê. Dosta³em przez ³eb... Mówi³eœ coœ?
	AI_Output (other, self,"DIA_Orik_Hi_15_07"); //E, nie. Trzymaj siê.
	AI_Output (self, other,"DIA_Orik_Hi_14_08"); //Co?
	AI_Output (other, self,"DIA_Orik_Hi_15_09"); //Nic! Bywaj.
	B_StopProcessInfos	( self );
};

//**********************************

instance  DIA_Orik_Go (C_INFO)
{
	npc				= Sld_701_Orik;
	condition		= DIA_Orik_Go_Condition;
	information		= DIA_Orik_Go_Info;
	important		= 0;
	permanent		= 0;
	description		= "Idziemy na spacer!"; 
};

FUNC int  DIA_Orik_Go_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeople))&&(!Npc_KnowsInfo (hero, DIA_Budd_First))
	{
		return 1;
	};
};

FUNC void  DIA_Orik_Go_Info()
{
	AI_Output (other, self,"DIA_Orik_Go_15_01"); //Idziemy na spacer!
	AI_Output (self, other,"DIA_Orik_Go_14_02"); //Co?!
	AI_Output (other, self,"DIA_Orik_Go_15_03"); //Idziemy zabiæ kilku stra¿ników!
	AI_Output (self, other,"DIA_Orik_Go_14_04"); //Kogo zap³odniæ?
	AI_Output (other, self,"DIA_Orik_Go_15_05"); //Zabiæ! Stra¿ników!
	AI_Output (self, other,"DIA_Orik_Go_14_06"); //Aha, nie mog³eœ tak od razu?
	AI_Output (self, other,"DIA_Orik_Go_14_07"); //Bêdê tu¿ za Tob¹...
	B_LogEntry		(CH5_NC_Convoys, "Orik mi pomo¿e. Mam tylko nadziejê, ¿e zauwa¿y stra¿ników na czas...");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos	(self); 
};

//**********************************

instance  DIA_Orik_GoBack (C_INFO)
{
	npc				= Sld_701_Orik;
	condition		= DIA_Orik_GoBack_Condition;
	information		= DIA_Orik_GoBack_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_Orik_GoBack_Condition()
{	
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4102_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con4; con4 = Hlp_GetNpc(Grd_4105_Convoy);

	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Orik_Go))
	&& ((Npc_IsDead(con1))&&(Npc_IsDead(con2))&&(Npc_IsDead(con3))&&(Npc_IsDead(con4)))
	{
		return 1;
	};
};
FUNC void  DIA_Orik_GoBack_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Orik_GoBack_14_01"); //Fajnie by³o, ale na mnie ju¿ czas.
	AI_Output (other, self,"DIA_Orik_GoBack_15_02"); //Dziêki za pomoc, Orik.
	AI_Output (self, other,"DIA_Orik_GoBack_14_03"); //O cholera, s³uch mi siê poprawi³! Muszê czêœciej parowaæ uderzenia g³ow¹...
	B_LogEntry		(CH5_NC_Convoys, "Orik bardzo mi pomóg³. Od uderzenia w g³owê poprawi³ mu siê s³uch. Mo¿e by mu tak przywaliæ jeszcze raz?");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"NC1");
	B_StopProcessInfos	(self); 
};

