
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_RBL_2605_GARRY_Exit (C_INFO)
{
	npc			= RBL_2605_GARRY;
	nr			= 999;
	condition	= DIA_RBL_2605_GARRY_Exit_Condition;
	information	= DIA_RBL_2605_GARRY_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_RBL_2605_GARRY_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2605_GARRY_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_RBL_2605_GARRY_Hello (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 1;
	condition		= DIA_RBL_2605_GARRY_Hello_Condition;
	information		= DIA_RBL_2605_GARRY_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ciê¿ko pracujesz."; 
};

FUNC INT DIA_RBL_2605_GARRY_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2605_GARRY_Hello_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_Hello_15_01"); //Ciê¿ko pracujesz.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_02"); //Praca to mój ¿ywio³, a kowalstwo sprawia, ¿e znowu chcê ¿yæ.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_03"); //Nie s¹dzi³em, ¿e to taka radocha. Mogê teraz tworzyæ wspania³¹ broñ!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_Hello_11_04"); //Mogê pieœciæ ka¿de ostrze po wykuciu. Nie ma to jak syk stali w wodzie o poranku...
	AI_Output (other, self, "DIA_RBL_2605_GARRY_Hello_15_05"); //Skoro tak twierdzisz.
};


var int garry_fight;

INSTANCE DIA_RBL_2605_GARRY_GoBring (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 2;
	condition		= DIA_RBL_2605_GARRY_GoBring_Condition;
	information		= DIA_RBL_2605_GARRY_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie propozycjê nie do odrzucenia."; 
};

FUNC INT DIA_RBL_2605_GARRY_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2605_GARRY_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GoBring))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2605_GARRY_GoBring_Info()
{
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE);		Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);

	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_01"); //Mam dla Ciebie propozycjê nie do odrzucenia.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_02"); //To znaczy?
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_03"); //Przestañ pastwiæ siê nad kowad³em Aidana!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_04"); //Nic z tego. Jestem œwietnym kowalem, a Ty wtr¹casz siê w nie swoje sprawy.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_05"); //ZejdŸ mi z oczu.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_06"); //Powiem inaczej. 
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_07"); //Masz do wyboru dwie opcje.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_08"); //Opcja A. Odk³adasz m³otek z w³asnej woli i nie wracasz tu psuæ kowad³a.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_09"); //Opcja B. To du¿o mniej przyjemna wersja opcji A z ³amaniem koñczyn i obcinaniem palców w³¹cznie.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_GoBring_15_10"); //Wiêc jak bêdzie? Któr¹ opcjê wybierasz?
	
   var C_NPC Quentin; 	Quentin = Hlp_GetNpc(HUN_858_Quentin);

	if (Npc_KnowsInfo (hero, DIA_HUN_858_Quentin_Hello))&&(Npc_GetAivar(Quentin,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		garry_out = TRUE;
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_11"); //Widzia³em, jak walczy³eœ z Quentinem i raczej nie skorzystam z opcji B.
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_12"); //Wiedz jednak, ¿e z³ama³eœ mi serce i zada³eœ straszliwy ból mojej duszy artysty...
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_13"); //Przez Twoje barbarzyñstwo straci te¿ sztuka kowalstwa!
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_14"); //Idê siê schlaæ...
		B_GiveXP(250);
		B_LogEntry		(CH1_Rbl_AidanHelp, "Garry widzia³ jak za³atwi³em Quentina i zdaje siê, ¿e to zawa¿y³o na jego decyzji. Powiedzia³, ¿e idzie siê schlaæ.");

		Npc_ExchangeRoutine	(self,"GarryTavern");
		B_StopProcessInfos	(self); 
	}
	else
	{
		garry_fight = TRUE;
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_15"); //A kim Ty jesteœ, ¿eby mówiæ mi co mam robiæ?
		AI_Output (self, other, "DIA_RBL_2605_GARRY_GoBring_11_16"); //Niech bêdzie opcja B, gnojku!
		B_LogEntry		(CH1_Rbl_AidanHelp, "Garry nie rzuci kowalstwa po dobroci. No nic czas skopaæ mu rzyæ...");
		
      B_SetTimedATT(self,30*events_per_sec,-180,-180,-95);				
		
		B_StopProcessInfos	(self); 
      B_StartAfterDialogFight(self,other,false);	
	};
};

INSTANCE DIA_RBL_2605_GARRY_After (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 3;
	condition		= DIA_RBL_2605_GARRY_After_Condition;
	information		= DIA_RBL_2605_GARRY_After_Info;
	permanent		= 0;
	important		= 0;
	description		= "Idziemy!"; 
};

FUNC INT DIA_RBL_2605_GARRY_After_Condition()
{
	if (garry_fight == TRUE)&&(Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After_Info()
{
	garry_out = TRUE;
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After_15_01"); //Idziemy!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_02"); //Uspokój siê. Z³ama³eœ nie tylko mego ducha, ale i serce.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_03"); //Przez twoje barbarzyñstwo straci te¿ sztuka kowalstwa!
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After_11_04"); //Idê siê schlaæ...
	B_GiveXP(150);
	B_LogEntry		(CH1_Rbl_AidanHelp, "Solidne lanie pomog³o Garremu podj¹æ decyzjê. Ju¿ nie wróci do Aidana i poszed³ siê schlaæ.");

	Npc_ExchangeRoutine	(self,"GarryTavern");
	B_StopProcessInfos	(self); 

};


INSTANCE DIA_RBL_2605_GARRY_After1 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 4;
	condition		= DIA_RBL_2605_GARRY_After1_Condition;
	information		= DIA_RBL_2605_GARRY_After1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Topisz ¿ale w winie?"; 
};

FUNC INT DIA_RBL_2605_GARRY_After1_Condition()
{
	if (garry_out  == TRUE)&&(Npc_GetDistToWP (self,"GARRY") < 1000 ) //wp w którym siedzi w tawernie
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After1_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After1_15_01"); //Topisz ¿ale w winie?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_02"); //A co Ciê to obchodzi?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_03"); //Przez Ciebie nie mam teraz co robiæ.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After1_11_04"); //Do cholery, nie mam nawet za co chlaæ...
};

INSTANCE DIA_RBL_2605_GARRY_After2 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 5;
	condition		= DIA_RBL_2605_GARRY_After2_Condition;
	information		= DIA_RBL_2605_GARRY_After2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿e to ciê zainteresuje..."; 
};

FUNC INT DIA_RBL_2605_GARRY_After2_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_RBL_2605_GARRY_After1))&&(Npc_KnowsInfo (hero,  DIA_RBL_2613_VAM_GoBring))
	{
		return 1;
	};
};
FUNC VOID DIA_RBL_2605_GARRY_After2_Info()
{
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After2_15_01"); //Mo¿e to Ciê zainteresuje...
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_02"); //Co takiego?
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After2_11_03"); //Drwal Vam szuka pomocnika.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_04"); //Hmm. Drwal powiadasz?
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_05"); //Œcinanie drzew, obcowanie z matk¹ natur¹, heblowanie desek, g³adzenie delikatnej powierzchni drewna...
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_06"); //To coœ dok³adnie dla mnie!
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After2_11_07"); //ProwadŸ!

	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self); 

};

INSTANCE DIA_RBL_2605_GARRY_After3 (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 6;
	condition		= DIA_RBL_2605_GARRY_After3_Condition;
	information		= DIA_RBL_2605_GARRY_After3_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_RBL_2605_GARRY_After3_Condition()
{


	if (Npc_KnowsInfo (hero,  RBL_2613_Vam_Ok))
	{
		return 1;
	};



};
FUNC VOID DIA_RBL_2605_GARRY_After3_Info()
{
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After3_11_01"); //W sumie mo¿e i dobrze siê sta³o.
	AI_Output (self, other, "DIA_RBL_2605_GARRY_After3_11_02"); //Praca przy drewnie jest spokojniejsza i bardziej... uduchowiona.
	AI_Output (other, self, "DIA_RBL_2605_GARRY_After3_15_03"); //Skoro tak twierdzisz. Mi³ego obcowania z duchami!
	B_StopProcessInfos	( self );
};




INSTANCE DIA_Garry_Stew (C_INFO)
{
	npc				= RBL_2605_GARRY;
	nr				= 12;
	condition		= DIA_Garry_Stew_Condition;
	information		= DIA_Garry_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam gulasz Snafa."; 
};

FUNC INT DIA_Garry_Stew_Condition()
{


	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};


};

FUNC VOID DIA_Garry_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_Garry_Stew_15_01"); //Mam gulasz Snafa.
	AI_Output (self, other, "DIA_Garry_Stew_11_02"); //A ja mam wrzody i co z tego?
	AI_Output (other, self, "DIA_Garry_Stew_15_03"); //Bierzesz czy nie?
	AI_Output (self, other, "DIA_Garry_Stew_11_04"); //Pewnie, dawaj.
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Przyda siê Garremu ciep³a strawa na nowej posadce."); 

};



