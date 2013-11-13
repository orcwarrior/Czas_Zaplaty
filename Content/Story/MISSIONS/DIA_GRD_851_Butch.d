// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Butch_Exit (C_INFO)
{
	npc			= GRD_851_Butch;
	nr			= 999;
	condition	= DIA_Butch_Exit_Condition;
	information	= DIA_Butch_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Butch_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Butch_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Butch_Hello (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 1;
	condition		= DIA_Butch_Hello_Condition;
	information		= DIA_Butch_Hello_Info;
	important		= 0;
	description		= "Kim jesteœ?";
};

FUNC int  DIA_Butch_Hello_Condition()
{	
	return 1;
};

func void  DIA_Butch_Hello_Info()
{
	AI_Output (other, self,"DIA_Butch_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Butch_Hello_13_01"); //Spierdalaj, nie podoba mi siê Twoja morda!
	
   B_StopProcessInfos	(self);
};

// ****************************************

instance DIA_Butch_HelloAgain (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 2;
	condition		= DIA_Butch_HelloAgain_Condition;
	information		= DIA_Butch_HelloAgain_Info;
	important		= 0;
	description		= "Twoja gêba a¿ siê prosi o mordobicie!";
};

FUNC int  DIA_Butch_HelloAgain_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Butch_Hello))&&(Npc_KnowsInfo (hero, DIA_Sher_Hlp))
	{
		return 1;
	};
};

func void  DIA_Butch_HelloAgain_Info()
{
	AI_Output (other, self,"DIA_Butch_HelloAgain_15_00"); //Twoja gêba a¿ siê prosi o mordobicie!
	AI_Output (self, other,"DIA_Butch_HelloAgain_13_01"); //Œmierdzisz jak œwie¿y trup!
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ****************************************

instance DIA_Butch_After (C_INFO)
{
	npc				= GRD_851_Butch;
	nr				= 3;
	condition		= DIA_Butch_After_Condition;
	information		= DIA_Butch_After_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC int  DIA_Butch_After_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Butch_HelloAgain))
	{
		return 1;
	};
};

func void  DIA_Butch_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE) //dick przegra³
	{
      AI_Output (self, other,"DIA_Butch_After_13_01"); //I po co ci to by³o, z³amasie?
      AI_Output (other, self,"DIA_Butch_After_15_02"); //Zaczekaj...
      AI_Output (self, other,"DIA_Butch_After_13_03"); //Spierdalaj!
      
      B_LogEntry(CH4_GRD_NewMine, "Butch mnie pokona³. Torlof nie bêdzie zadowolony.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//dick wygra³
	{
      miners_work = miners_work + 1;
      
      AI_Output (self, other,"DIA_Butch_After_13_04"); //Ty sukinsynie, to jeszcze nie koniec...
      AI_Output (other, self,"DIA_Butch_After_15_05"); //Masz racjê. Teraz pójdziesz i staniesz siê wzorem kopacza!
      AI_Output (self, other,"DIA_Butch_After_13_06"); //Chyba za mocno uderzy³em Ciê w g³owê. Nigdy...
      AI_DrawWeapon (hero);
      AI_Output (self, other,"DIA_Butch_After_13_07"); //Dobra, ju¿ dobra. Bêdê kopa³ rudê. Ale pewnego dnia naszczam do twojej uœmiechniêtej gêby!
      AI_RemoveWeapon (hero);
      AI_Output (other, self,"DIA_Butch_After_15_08"); //Kto wie. Mi³ego kopania.
      B_GiveXP(250);	
      B_LogEntry(CH4_GRD_NewMine, "Butch po dzia³aniach prewencyjnych okaza³ siê doœæ podatny na sugestie. W ka¿dym razie Torlof powinien byæ zadowolony.");
      
      B_StopProcessInfos	(self);

      /***************
      rutyna kopania rudy
      **************/
      Npc_ExchangeRoutine(self,"Pick");
      var C_NPC vlk3; vlk3 = Hlp_GetNpc(VLK_5001_Buddler);
      Npc_ExchangeRoutine(vlk3,"GO");
	};
};
