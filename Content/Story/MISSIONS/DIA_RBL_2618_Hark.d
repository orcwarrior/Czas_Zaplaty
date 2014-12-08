
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hark_Exit (C_INFO)
{
	npc			= RBL_2618_HARK;
	nr			= 999;
	condition	= DIA_Hark_Exit_Condition;
	information	= DIA_Hark_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hark_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hark_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Hark_Hello (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 1;
	condition		= DIA_Hark_Hello_Condition;
	information		= DIA_Hark_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co porabiasz?"; 
};

FUNC INT DIA_Hark_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Hark_Hello_Info()
{
	AI_Output (other, self, "DIA_Hark_Hello_15_01"); //Co porabiasz?
	AI_Output (self, other, "DIA_Hark_Hello_11_02"); //Pijê. A bo co?
	AI_Output (other, self, "DIA_Hark_Hello_15_03"); //Tak tylko pytam.
	AI_Output (self, other, "DIA_Hark_Hello_11_04"); //Postaw piwo to pogadamy.
	
   Log_CreateTopic(CH1_Rbl_Hark, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Hark, "Miejscowy ¿ul imieniem Hark powiedzia³, ¿e jak postawiê mu piwo to bêdzie mia³ do mnie sprawê. Jedno piwo w t¹, jedno w tam¹, chyba nic nie stracê?");
};

var int fight_with_Hark;

INSTANCE DIA_Hark_What (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 2;
	condition		= DIA_Hark_What_Condition;
	information		= DIA_Hark_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Twoje zdrowie."; 
};

FUNC INT DIA_Hark_What_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Hark_Hello))&&((NPC_HasItems(other,ItFobeer)>=1))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_What_Info()
{
	hark_trial = 0;
	Npc_SetAivar(self,AIV_WASDEFEATEDBYSC,  FALSE);	Npc_SetAivar(self,AIV_HASDEFEATEDSC,  FALSE);
	B_GiveXP(50);
   
	AI_Output (other, self, "DIA_Hark_What_15_01"); //Twoje zdrowie.
	AI_Output (self, other, "DIA_Hark_What_11_02"); //Mo¿e byæ nawet zdrowie Rhobara, ka¿da okazja jest dobra, ¿eby siê napiæ...
	
   if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};	
	
   B_GiveInvItems (other,self,ItFobeer,1);
	AI_UseItem (self,ItFobeer);
	
   AI_Output (self, other, "DIA_Hark_What_11_03"); //Od razu lepiej. Piwo to nektar bogów...
	AI_Output (other, self, "DIA_Hark_What_15_04"); //Co to za sprawa?
	AI_Output (self, other, "DIA_Hark_What_11_05"); //Jaka sprawa?
	AI_Output (other, self, "DIA_Hark_What_15_06"); //Mówi³eœ, ¿e pogadasz ze mn¹ jak postawiê Ci piwo.
	AI_Output (self, other, "DIA_Hark_What_11_07"); //Przecie¿ gadamy.
	AI_Output (other, self, "DIA_Hark_What_15_08"); //Cholera straci³em przez Ciebie piwo!
	
   B_LogEntry(CH1_Rbl_Hark, "Przynios³em Harkowi piwo, jak siê okaza³o niepotrzebnie...");
	
   AI_Output (self, other, "DIA_Hark_What_11_00"); //Ale za to zyska³eœ przyjaciela.
	AI_Output (other, self, "DIA_Hark_What_15_10"); //Raczej pijaka i z³odzieja.
	AI_Output (self, other, "DIA_Hark_What_11_11"); //Uwa¿aj na s³owa ch³opcze! Nie takich jak Ty bra³em na sztych miecza...
	AI_Output (self, other, "DIA_Hark_What_11_12"); //(bekniêcie)

	Info_ClearChoices(DIA_Hark_What);
	Info_AddChoice	 (DIA_Hark_What, "Sam siê prosisz o lanie!" ,DIA_Hark_What_Yes);
	Info_AddChoice	 (DIA_Hark_What, "Nie jestem dziœ w nastroju do bitki." ,DIA_Hark_What_No);
};

func void DIA_Hark_What_Yes()
{
	AI_Output (other, self,"DIA_Hark_What_Yes_15_00"); //Sam siê prosisz o lanie!
	AI_Output (self, other,"DIA_Hark_What_Yes_11_01"); //W koñcu ktoœ z jajami...
	
   B_LogEntry(CH1_Rbl_Hark, "Hark a¿ prosi siê o porz¹dne lanie!");
	hark_trial = 5;
   fight_with_Hark = true;
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

func void DIA_Hark_What_No()
{
	hark_trial = 1;
   
	AI_Output (other, self,"DIA_Hark_What_No_15_00"); //Nie jestem dziœ w nastroju do bitki.
	AI_Output (self, other,"DIA_Hark_What_No_11_01"); //Szkoda. Rozochoci³eœ mnie. Przyda³oby siê skopaæ czyjeœ dupsko...
	AI_Output (self, other,"DIA_Hark_What_No_11_02"); //Mam pomys³! 
	AI_Output (self, other,"DIA_Hark_What_No_11_03"); //S³uchaj jest tu jeden koleœ, który dzia³a mi na nerwy. Nazywa siê Kufel.
	AI_Output (self, other,"DIA_Hark_What_No_11_04"); //Z chêci¹ bym go poturbowa³, ale Cavalorn nie lubi jak wszczyna siê burdy.
	AI_Output (self, other,"DIA_Hark_What_No_11_05"); //Mo¿e byœ mi pomóg³?
	AI_Output (other, self,"DIA_Hark_What_No_15_06"); //Niby jak?
	AI_Output (self, other,"DIA_Hark_What_No_11_07"); //Coœ wymyœlisz. Pogadaj z tym frajerem.
	AI_Output (self, other,"DIA_Hark_What_No_11_08"); //Aha. Kufel zawsze by³ wra¿liwy na punkcie swojej rodziny. Zwyzywaj jego mamuœkê od kurew, to powinno zachêciæ go do bitki.

	B_LogEntry(CH1_Rbl_Hark, "Nie chce mi siê walczyæ z Harkiem. Jednak pijak jest wyraŸnie rozochocony do bitki. Powiedzia³, ¿e nie lubi kolesia o imieniu Kufel. Nie mo¿e go jednak sam prowokowaæ, bo Cavalorn nie toleruje burd. Pogadam z tym Kuflem i zobaczê, co da siê zrobiæ.");

	Info_ClearChoices(DIA_Hark_What);	
};

INSTANCE DIA_Hark_Again (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again_Condition;
	information		= DIA_Hark_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kufel powiedzia³, ¿e Twój stary wola³ owce."; 
};

FUNC INT DIA_Hark_Again_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cup_What))&&(hark_trial == 2)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again_Info()
{
	hark_trial = hark_trial  +1;//3
   
	AI_Output (other, self, "DIA_Hark_Again_15_01"); //Kufel powiedzia³, ¿e Twój stary wola³ owce.
	AI_Output (self, other, "DIA_Hark_Again_11_02"); //A to parszywy ochlej!
	AI_Output (self, other, "DIA_Hark_Again_11_03"); //Powiedz mu, ¿e to pewnie po tatusiu œmierdzi i wygl¹da jak ork.
	
   B_LogEntry(CH1_Rbl_Hark, "Hark powiedzia³, ¿e Kufel po tatusiu œmierdzi i wygl¹da jak ork.");
};

INSTANCE DIA_Hark_Again1 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again1_Condition;
	information		= DIA_Hark_Again1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hark_Again1_Condition()
{
	var C_NPC cup; cup = Hlp_GetNpc(RBL_2619_Cup);

	if (Npc_KnowsInfo(other,DIA_Cup_Again)) && (hark_trial == 4) && (Npc_GetAivar(cup, AIV_BEENATTACKED) == TRUE)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again1_Info()
{
	B_GiveXP(150);
	hark_trial = hark_trial  +1;//5
   
	AI_Output (self, other, "DIA_Hark_Again1_11_01"); //Sprowokowanie tego idioty nie by³o takie trudne.
	AI_Output (other, self, "DIA_Hark_Again1_15_02"); //Faktycznie Kufel jest doœæ wra¿liwy na punkcie rodziny.
	AI_Output (self, other, "DIA_Hark_Again1_11_03"); //A nie mówi³em?
	AI_Output (self, other, "DIA_Hark_Again1_11_04"); //Dziêki za rozrywkê przyjacielu.
	AI_Output (other, self, "DIA_Hark_Again1_15_05"); //Ca³a przyjemnoœæ po mojej stronie.
	
   B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hark, "Sprawa z Harkiem i Kuflem za³atwiona. Trzeba przyznaæ, ¿e rozrywkowi ci rebelianci.");
};

INSTANCE DIA_Hark_Again2 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 3;
	condition		= DIA_Hark_Again2_Condition;
	information		= DIA_Hark_Again2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nie uda³o mi siê sprowokowaæ Kufla."; 
};

FUNC INT DIA_Hark_Again2_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cup_What))&&(hark_trial == 10)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Again2_Info()
{
	hark_trial = 5;//Za chuja by to nie dzia³a³o
   
	AI_Output (other, self, "DIA_Hark_Again2_15_01"); //Nie uda³o mi siê sprowokowaæ Kufla.
	AI_Output (self, other, "DIA_Hark_Again2_11_02"); //Dupa jesteœ i tyle. Nawet Wrzód by sobie lepiej poradzi³.
	AI_Output (self, other, "DIA_Hark_Again2_11_03"); //No nic, zamiast Kufla mogê st³uc Ciebie. Mi tam zjedno komu spuszczê ³omot.
	
   B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Hark, "Nie uda³o mi siê sprowokowaæ Kufla i Hark siê na mnie rzuci³. Dziwni ci rebelianci...");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
	Npc_ExchangeRoutine	(self,"start");//normal routine outside tavern, too
	Npc_ExchangeRoutine	(cup,"start");//normal routine outside tavern, too
};

INSTANCE DIA_Hark_fight_in_tavern (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_fight_in_tavern_Condition;
	information		= DIA_Hark_fight_in_tavern_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_fight_in_tavern_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_What) && (fight_with_Hark))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_fight_in_tavern_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_fight_in_tavern_11_00"); //Od razu lepiej. Nie ma to, jak obiæ komuœ mordê.
		
      B_LogEntry(CH1_Rbl_Hark, "Przegra³em z Harkiem. No có¿, zdarza siê...");
      B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_failed);
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (200);
		
      AI_Output (self, other, "DIA_Hark_fight_in_tavern_11_06"); //Cholera! Pokona³eœ mnie!
		AI_Output (self, other, "DIA_Hark_fight_in_tavern_15_07"); //Mo¿e coœ z ciebie bêdzie. Zobaczymy...
		
      B_LogEntry(CH1_Rbl_Hark, "Pokona³em Harka.");
      B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_SUCCESS);
	};
};
// **************************************************

INSTANCE DIA_Hark_Plant (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 6;
	condition		= DIA_Hark_Plant_Condition;
	information		= DIA_Hark_Plant_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wiesz co to czerwony buk?"; 
};

FUNC INT DIA_Hark_Plant_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Milten_Plantsdb))
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Plant_Info()
{
	AI_Output (other, self, "DIA_Hark_Plant_15_01"); //Wiesz co to czerwony buk?
	AI_Output (self, other, "DIA_Hark_Plant_11_02"); //W ¿yciu o czymœ takim nie s³ysza³em, a bo co?
	AI_Output (other, self, "DIA_Hark_Plant_15_03"); //Milten twierdzi coœ zupe³nie innego. Zarzucasz magowi k³amstwo?
	AI_Output (self, other, "DIA_Hark_Plant_11_04"); //Nic magom do tego co mówiê. Ani Tobie przyb³êdo!
	AI_Output (other, self, "DIA_Hark_Plant_15_05"); //Uwa¿aj na to co mówisz ow³osiona ma³po.
	AI_Output (self, other, "DIA_Hark_Plant_11_06"); //A co mi zrobisz? Dasz mi klapsa?

	Info_ClearChoices(DIA_Hark_Plant);
	Info_AddChoice	 (DIA_Hark_Plant, "Znowu prosisz o lanie!" ,DIA_Hark_Plant_Yes);
	Info_AddChoice	 (DIA_Hark_Plant, "Nie jestem w nastroju do bitki." ,DIA_Hark_Plant_No);
};

func void DIA_Hark_Plant_Yes()
{
	AI_Output (other, self,"DIA_Hark_Plant_Yes_15_00"); //Znowu prosisz o lanie!
	AI_Output (self, other,"DIA_Hark_Plant_Yes_11_01"); //Graj muzyczko!
	
   B_LogEntry		(CH2_RBL_Plants, "Znowu muszê spraæ Harka, ¿eby zacz¹³ mówiæ do rzeczy.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

func void DIA_Hark_Plant_No()
{
	AI_Output (other, self,"DIA_Hark_Plant_No_15_00"); //Nie jestem w nastroju do bitki.
	AI_Output (self, other,"DIA_Hark_Plant_No_11_01"); //To masz pecha, bo ja jestem! Graj muzyczko!
	
   B_LogEntry		(CH2_RBL_Plants, "Znowu muszê spraæ Harka, ¿eby zacz¹³ mówiæ do rzeczy.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Hark_Plant1 (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_Plant1_Condition;
	information		= DIA_Hark_Plant1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Plant1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_Plant))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_Plant1_Info()
{
	AI_Output (self, other, "DIA_Hark_Plant1_11_01"); //Nie ma to jak ma³a rozróba!

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_Plant1_11_02"); //Nadal jesteœ miêtki i wolny jak ciê¿arny œcierwojad.
		AI_Output (other, self, "DIA_Hark_Plant1_15_03"); //Do cholery, chcia³em tylko porozmawiaæ o Czerwonym Buku...
		AI_Output (self, other, "DIA_Hark_Plant1_11_04"); //Przegra³eœ, a ja nie mam czasu na przegranych.
		AI_Output (self, other, "DIA_Hark_Plant1_11_05"); //Poszukaj sobie czerwonego buka jak tak Ciê to interesuje. A teraz zejdŸ mi z oczu!
		
      B_LogEntry		(CH2_RBL_Plants, "Nie dowiedzia³em siê niczego od Harka o czerwonym buku, a przy okazji skopa³ mi dupê.");	
		B_StopProcessInfos	(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (400);
		
      AI_Output (self, other, "DIA_Hark_Plant1_11_06"); //Stwardnia³eœ ch³opcze. Zmê¿nia³eœ i nabra³eœ pewnoœci siebie, to lubiê.
		AI_Output (other, self, "DIA_Hark_Plant1_15_07"); //Do cholery chcia³em tylko porozmawiaæ o Czerwonym Buku...
		AI_Output (self, other, "DIA_Hark_Plant1_11_08"); //A co chcesz o nim wiedzieæ? To tylko paskudne drzewo.
		AI_Output (other, self, "DIA_Hark_Plant1_15_09"); //Potrzebujê jednego nasiona.
		AI_Output (self, other, "DIA_Hark_Plant1_11_10"); //Widzê, ¿e Milten znalaz³ sobie nowego ch³opca na posy³ki. Powiem Ci, ¿e nie cierpiê magów.
		AI_Output (self, other, "DIA_Hark_Plant1_11_11"); //Raz przynios³em mu to cholerne nasionko bo potrzebowa³em rudy, a on sobie ubzdura³, ¿e bêdê robi³ u niego za s³u¿¹cego.
		AI_Output (self, other, "DIA_Hark_Plant1_11_12"); //I b¹dŸ tu dobry dla ludzi.
		AI_Output (other, self, "DIA_Hark_Plant1_15_13"); //Nie zamierzam robiæ u magów za dostawcê ingrediencji, mam wa¿ny powód, ¿eby wkupiæ siê w ich ³aski.
		AI_Output (other, self, "DIA_Hark_Plant1_15_14"); //To jak, pomo¿esz mi?
		AI_Output (self, other, "DIA_Hark_Plant1_11_15"); //Komuœ z takim ciosem jak Twój pomogê za darmo. Twoje zdrówko przyjacielu. Na pohybel suczym synom co w³adaj¹ magi¹ i myœl¹, ¿e s¹ pêpkiem œwiata!
		
      CreateInvItems	(self, ItFoBeer, 2);
		B_GiveInvItems (self, other,ItFoBeer, 1);
		AI_UseItem (other,ItFobeer);
		AI_UseItem (self,ItFobeer);
		
      AI_Output (self, other, "DIA_Hark_Plant1_11_16"); //WeŸ to ziarno i wsadŸ je Miltenowi w dupê. Pewnie mu siê to spodoba, he, he.
		CreateInvItems (self, ItFo_Plants_Bloodwood_01, 1);
		B_GiveInvItems (self, other, ItFo_Plants_Bloodwood_01, 1);
		
      AI_Output (other, self, "DIA_Hark_Plant1_15_17"); //Przemyœlê to. Bywaj Hark.
		
      B_LogEntry(CH2_RBL_Plants, "Mam nasienie czerwonego buka. Op³aci³o siê skopaæ Harkowi dupsko.");
	};
};

// **************************************************

INSTANCE DIA_RBL_2618_HARK_Stew (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 12;
	condition		= DIA_RBL_2618_HARK_Stew_Condition;
	information		= DIA_RBL_2618_HARK_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gulasz od Snafa."; 
};

FUNC INT DIA_RBL_2618_HARK_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2618_HARK_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_RBL_2618_HARK_Stew_15_01"); //Gulasz od Snafa.
	AI_Output (self, other, "DIA_RBL_2618_HARK_Stew_11_02"); //Akurat by³em g³odny, dziêki.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Gulasz zaspokoi³ g³ód Harka."); 
};


/************************************

SIDE QUEST

************************************/

// **************************************************

INSTANCE DIA_Hark_Tooth (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 10;
	condition		= DIA_Hark_Tooth_Condition;
	information		= DIA_Hark_Tooth_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Tooth_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Pacho_HuntingFinishedOk))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Hark_Tooth_Info()
{
	AI_Output (self, other, "DIA_Hark_Tooth_11_01"); //Brawo. Piêkna walka, a teraz oddaj mi kie³.

	Info_ClearChoices(DIA_Hark_Tooth);
	Info_AddChoice	 (DIA_Hark_Tooth, "Nie chcê k³opotów. Zabieraj kie³." ,DIA_Hark_Tooth_Yes);
	Info_AddChoice	 (DIA_Hark_Tooth, "Obrazi³eœ mnie przychodz¹c tu w pojedynkê." ,DIA_Hark_Tooth_No);
};

func void DIA_Hark_Tooth_Yes()
{
	AI_Output (other, self,"DIA_Hark_Tooth_Yes_15_00"); //Nie chcê k³opotów. Zabieraj kie³.
	
   B_GiveInvItems (other, self, ItAt_BlackWolfTeeth, 1);
	
   AI_Output (self, other,"DIA_Hark_Tooth_Yes_11_01"); //Ale z Ciebie miêczak. Tacy jak Ty sprawiaj¹, ¿e ¿ycie jest zbyt ³atwe.
	AI_Output (self, other,"DIA_Hark_Tooth_Yes_11_02"); //Bywaj, frajerze.
	
   B_LogEntry		(CH2_RBL_WhiteTeeth, "Po walce zaczepi³ mnie Hark. Odda³em mu kie³, nie potrzebujê k³opotów.");
	pacho_heroservedhark=TRUE;
	Npc_ExchangeRoutine	(self, "START");
	B_StopProcessInfos	(self); 
};

func void DIA_Hark_Tooth_No()
{
	AI_Output (other, self,"DIA_Hark_Tooth_No_15_00"); //Obrazi³eœ mnie przychodz¹c tu w pojedynkê.
	AI_Output (self, other,"DIA_Hark_Tooth_No_11_01"); //Taki z Ciebie chojrak? Zaraz zobaczymy jakiœ twardy!
	
   B_LogEntry(CH2_RBL_WhiteTeeth, "Postawi³em siê Harkowi. Czas obiæ mu porz¹dnie mordê!");
	Npc_ExchangeRoutine	(self, "START");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
}; 

INSTANCE DIA_Hark_Tooth_after_fight (C_INFO)
{
	npc				= RBL_2618_HARK;
	nr				= 7;
	condition		= DIA_Hark_Tooth_after_fight_Condition;
	information		= DIA_Hark_Tooth_after_fight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Hark_Tooth_after_fight_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hark_Tooth) && (!pacho_heroservedhark))
	{ 
		return TRUE; 
	};
};

FUNC VOID DIA_Hark_Tooth_after_fight_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_00"); //Ha, ha, ha!!! Dosta³eœ niez³e baty.
      
      B_GiveInvItems (other, self, ItAt_BlackWolfTeeth, 1);
      
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_01"); //Dziêki za kie³!
		AI_Output (other, self, "DIA_Hark_Tooth_after_fight_15_02"); //Kiedyœ tego po¿a³ujesz...
      AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_03"); //Chyba nie wiesz, co mówisz. Ha, ha, ha!
		
      B_LogEntry(CH2_RBL_WhiteTeeth, "Hark mnie pokona³ i zabra³ kie³.");	
		B_StopProcessInfos(self); 
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)//pokonany
	{
		B_GiveXP (200);
		
      AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_06"); //Cholera! Pokona³eœ mnie!
		AI_Output (other, self, "DIA_Hark_Tooth_after_fight_15_07"); //A teraz zje¿d¿aj, œmieciu!
		AI_Output (self, other, "DIA_Hark_Tooth_after_fight_11_08"); //Dobra, dobra, spokojnie. Ju¿ mnie tu nie ma.
		
      B_LogEntry(CH2_RBL_WhiteTeeth, "Myœlê, ¿e da³em Harkowi porz¹dn¹ nauczkê.");
	};
};