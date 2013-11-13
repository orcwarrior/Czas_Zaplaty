// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Edwin_Exit (C_INFO)
{
	npc			= Grd_4081_Edwin;
	nr			= 999;
	condition	= DIA_Edwin_Exit_Condition;
	information	= DIA_Edwin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Edwin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Edwin_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int ed_fight;

INSTANCE DIA_Edwin_First (C_INFO)
{
	npc				= Grd_4081_Edwin;
	nr				= 1;
	condition		= DIA_Edwin_First_Condition;
	information		= DIA_Edwin_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi³eœ?"; 
};

FUNC INT DIA_Edwin_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Edwin_First_Info()
{
	var C_NPC pom; pom = Hlp_GetNpc(Grd_4080_Pomroka);

	AI_Output (other, self, "DIA_Edwin_First_15_01"); //Jak tu trafi³eœ?
   
	if (Npc_GetAivar(pom,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Edwin_First_11_02"); //To Ty z³oi³eœ Pomrokê?
		AI_Output (other, self, "DIA_Edwin_First_15_03"); //Mia³em tê w¹tpliw¹ przyjemnoœæ.
		AI_Output (self, other, "DIA_Edwin_First_11_04"); //Nie chcê ¿adnych k³opotów!
		AI_Output (other, self, "DIA_Edwin_First_15_05"); //Wiêc odpowiedz na proste pytanie. Jak siê tu znalaz³eœ?
		AI_Output (self, other, "DIA_Edwin_First_11_06"); //Nale¿a³em do jednego z patroli, które przepatrywa³y teren w pobli¿u Starego Obozu.
		AI_Output (self, other, "DIA_Edwin_First_11_07"); //Pech chcia³, ¿e natknêliœmy siê na kilku rebeliantów. Tylko ja prze¿y³em, a te mendy wrzuci³y mnie do G³êbi.
		AI_Output (self, other, "DIA_Edwin_First_11_08"); //Ca³y czas ¿a³ujê, ¿e nie zgin¹³em w walce...
		AI_Output (other, self, "DIA_Edwin_First_15_09"); //Ciekawe... Jest st¹d jakieœ wyjœcie?
		AI_Output (self, other, "DIA_Edwin_First_11_10"); //Wyjœcie? Gdyby by³o to od dawna bym tu nie siedzia³!
		AI_Output (self, other, "DIA_Edwin_First_11_11"); //Jesteœmy jak trupy pogrzebane ¿ywcem...
		B_LogEntry(CH2_NON_Deep, "Podobno z G³êbi nie mo¿na zbiec. Ciekawe...");	
		B_StopProcessInfos(self); 
	}
	else
	{
		ed_fight = true;
		AI_Output (self, other, "DIA_Edwin_First_11_12"); //Nie wystarczy, ¿e Pomroka obi³ Ci ryj? Chcesz wiêcej?
		AI_Output (other, self, "DIA_Edwin_First_15_13"); //Zapyta³em tylko...
		AI_Output (self, other, "DIA_Edwin_First_11_14"); //A jednak chcesz wiêcej!
		B_StopProcessInfos	(self); 
		B_StartAfterDialogFight(self,other,false);
	};
};

INSTANCE DIA_Edwin_After (C_INFO)
{
	npc				= Grd_4081_Edwin;
	nr				= 2;
	condition		= DIA_Edwin_After_Condition;
	information		= DIA_Edwin_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Edwin_After_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Edwin_First ))&&(ed_fight == TRUE)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Edwin_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Edwin_After_07_01"); //Podoba³o siê? Chcesz wiêcej?
		AI_Output (other, self, "DIA_Edwin_After_15_02"); //Nie, dziêki.
		AI_Output (self, other, "DIA_Edwin_After_07_03"); //ZejdŸ mi z oczu, miêczaku!
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(200);
		AI_Output (self, other, "DIA_Edwin_After_07_04"); //Ty gnoju?! Spieprzaj zanim pójdê po kumpli...
		AI_Output (other, self, "DIA_Edwin_After_No_15_05"); //W¹tpiê, ¿e takie œcierwo jak ty ma tu jakiegoœ kamrata.
		AI_Output (self, other, "DIA_Edwin_After_07_06"); //Na kosmate jaja Beliara, to nie mo¿e siê tak skoñczyæ...
		AI_DrawWeapon (self);
		AI_Output (other, self, "DIA_Edwin_After_No_15_07"); //Chcesz zgin¹æ tylko dlatego, ¿e zapyta³em, jak tu trafi³eœ?
		AI_Output (self, other, "DIA_Edwin_After_07_08"); //Giñ popaprañcu!
		B_StopProcessInfos(self); 
      B_StartAfterDialogFight(self,other,true);
	};
};
