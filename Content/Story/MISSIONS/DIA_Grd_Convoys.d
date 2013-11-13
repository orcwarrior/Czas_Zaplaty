// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Convoy1_Exit (C_INFO)
{
	npc			= Grd_4096_Convoy1;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Convoy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Convoy_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Convoy2_Exit (C_INFO)
{
	npc			= Grd_4097_Convoy2;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                    

INSTANCE DIA_ConvoyCommander_Exit (C_INFO)
{
	npc			= Grd_4102_Convoy;
	nr			= 999;
	condition	= DIA_Convoy_Exit_Condition;
	information	= DIA_Convoy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

INSTANCE DIA_Convoy1_First (C_INFO)
{
	npc				= Grd_4096_Convoy1;
	nr				= 1;
	condition		= DIA_Convoy1_First_Condition;
	information		= DIA_Convoy1_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Convoy1_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_Convoy1_First_Info()
{
	var C_NPC con; con = Hlp_GetNpc(Grd_4097_Convoy2);
	CreateInvItems (self,foodpackage,2);
	CreateInvItems (con,foodpackage,2);
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Convoy1_First_11_01"); //Ej, Ty! Sk¹dœ Ciê znam...
		AI_Output (other, self, "DIA_Convoy1_First_15_02"); //Mo¿liwe, niedawno Gomez wys³a³ mnie zreszt¹ ludzi do Fletchera. Mia³em wyjœæ wam naprzeciw i sprawdziæ, czy aby nie ze¿arliœcie ca³ego towaru.
		AI_Output (self, other, "DIA_Convoy1_First_11_03"); //Za kogo nas masz!
		AI_Output (other, self, "DIA_Convoy1_First_15_04"); //Za wiecznie g³odnych sukinsynów, którym nie chce siê dupy ruszyæ na czas.
		AI_Output (self, other, "DIA_Convoy1_First_11_05"); //Dobra, ju¿ dobra. Zaraz...
		AI_Output (self, other, "DIA_Convoy1_First_11_06"); //Ju¿ wiem, gdzie Ciê widzia³em! To Ty brata³eœ siê z tym zdrajc¹ Urtem!
		AI_Output (self, other, "DIA_Convoy1_First_11_07"); //To pies rebeliantów, zar¿n¹æ sukinsyna!
	}
	else
	{
		AI_Output (self, other, "DIA_Convoy1_First_11_08"); //Parszywy pies rebeliantów przyszed³ po swoj¹ œmieræ!
	};

	B_LogEntry(CH5_NC_Convoys, "Znalaz³em konwojentów. Muszê zabraæ im paczki zanim wszystko ze¿r¹!");
	B_StopProcessInfos(self);

	B_StartAfterDialogFight(self,other,true);
   B_StartAfterDialogFight(con,other,true);
};           

INSTANCE DIA_ConvoyCommander_First (C_INFO)
{
	npc				= Grd_4102_Convoy;
	nr				= 1;
	condition		= DIA_ConvoyCommander_First_Condition;
	information		= DIA_ConvoyCommander_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_ConvoyCommander_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeople))
	{
		return 1;
	};
};

FUNC VOID DIA_ConvoyCommander_First_Info()
{
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4105_Convoy);
	
	CreateInvItems (self,convoy_list,1);	
	
	B_FullStop (hero);
	AI_GotoNpc(other, self);

	var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
   
	if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_ConvoyCommander_First_11_01"); //Ktoœ ty?
		AI_Output (other, self, "DIA_ConvoyCommander_First_15_02"); //Twój najgorszy koszmar.
	};

	AI_Output (self, other, "DIA_ConvoyCommander_First_11_03"); //No proszê, kolejne œcierwo wchodzi pod nó¿.	

	B_LogEntry(CH5_NC_Convoys, "Znalaz³em konwojentów. Czas wys³aæ ich do Beliara.");
	B_StopProcessInfos(self);

	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(con1,other,true);
	B_StartAfterDialogFight(con2,other,true);
	B_StartAfterDialogFight(con3,other,true);
};