
// **************************************************
// 						 EXIT 
// **************************************************
//TODO: POPRAWIC TEN DIALOG zjechany z Bulko!
INSTANCE DIA_Postronek_Exit (C_INFO)
{
	npc			= Non_4022_Postronek;
	nr			= 999;
	condition	= DIA_Postronek_Exit_Condition;
	information	= DIA_Postronek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Postronek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Postronek_Exit_Info()
{
   if (Npc_HasItems(hero, ItMw_2h_Post) == 1)
   {
      Npc_RemoveInvItems(hero, ItMw_2h_Post, 1);
   };
   
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Postronek_Hello (C_INFO)
{
	npc				= Non_4022_Postronek;
	nr				= 1;
	condition		= DIA_Postronek_Hello_Condition;
	information		= DIA_Postronek_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Postronek_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Postronek_Hello_Info()
{
	AI_Output (other, self, "DIA_Postronek_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Postronek_Hello_11_02"); //Wygl¹dasz jak nawóz.
	AI_Output (other, self, "DIA_Postronek_Hello_15_03"); //Co?!
	AI_Output (self, other, "DIA_Postronek_Hello_11_04"); //Mówiê, ¿e wygl¹dasz jak gówno i podobnie pachniesz.

	Info_ClearChoices (DIA_Postronek_Hello);
	Info_AddChoice (DIA_Postronek_Hello, "Gówno to Ty masz miêdzy uszami!", DIA_Postronek_Hello_Yes);
	Info_AddChoice (DIA_Postronek_Hello, "Chyba ju¿ sobie pójdê.", DIA_Postronek_Hello_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Postronek_Hello_Yes()
{
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_01"); //Gówno to ty masz miêdzy uszami!
	AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_02"); //He, he, masz jaja, ch³opcze. Podobasz mi siê, a tobie Mary?

	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_Wait				(self, 1);
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	AI_EquipBestMeleeWeapon	(self);
	
   AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_03"); //Mary te¿ Ciê polubi³a. Witaj w obozie, ch³opcze.
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_04"); //Rozmawiasz ze swoim... mieczem?
	AI_Output (self, other, "DIA_Postronek_Hello_Yes_07_05"); //To nie tylko miecz ch³opcze, to moja jedyna kochanka.
	AI_Output (other, self, "DIA_Postronek_Hello_Yes_15_06"); //Mi³o by³o... was poznaæ. Bywaj ³owco.
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Postronek_Hello_No()
{
	AI_Output (other, self, "DIA_Postronek_Hello_No_15_07"); //Chyba ju¿ sobie pójdê.
	AI_Output (self, other, "DIA_Postronek_Hello_No_07_08"); //Pieprzony tchórz. Nie tak szybko m¹dralo. Zaraz Mary zasmakujesz krwi tego chuderlaka...
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Postronek_Hello1 (C_INFO)
{
	npc				= Non_4022_Postronek;
	nr				= 1;
	condition		= DIA_Postronek_Hello1_Condition;
	information		= DIA_Postronek_Hello1_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Postronek_Hello1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Postronek_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Postronek_Hello1_Info()
{
	AI_Output (self, other, "DIA_Postronek_Hello1_11_01"); //To znowu Ty? I to w jednym kawa³ku, ca³kiem nieŸle, ch³opcze.
	AI_Output (other, self, "DIA_Postronek_Hello1_15_02"); //Radzê sobie jak mogê.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_03"); //W to nie w¹tpiê. Kira coœ mówi³a, ¿e szukasz sojuszników. Prawda to?
	AI_Output (other, self, "DIA_Postronek_Hello1_15_04"); //Tak, wys³a³ mnie Cavalorn, szef obozu rebeliantów.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_05"); //Wiem, znam tego œmierdziela Leafa.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_06"); //Czyli musisz udowodniæ coœ wart i takie tam.
	AI_Output (other, self, "DIA_Postronek_Hello1_15_07"); //Mniej wiêcej.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_08"); //Kira ma racjê, je¿eli mamy stan¹æ po czyjejœ stronie, to musimy dobrze wybraæ.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_09"); //Dla mnie liczy siê tylko si³a i moja Mary oczywiœcie.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_10"); //Hmm, je¿eli dasz radê unieœæ Mary, to powiem Kirze, ¿e zacny z Ciebie wojak.
	AI_Output (self, other, "DIA_Postronek_Hello1_11_11"); //Mo¿emy siê o to za³o¿yæ. Tak, zak³ad to przednia myœl!
	AI_Output (other, self, "DIA_Postronek_Hello1_15_12"); //Zastanowiê siê...

	Log_CreateTopic	(CH2_TRL_Mary, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Mary, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Mary, "Je¿eli chcê zdobyæ szacunek Postronka, to muszê sprostaæ jego Mary. No nic chyba warto spróbowaæ...");
};

// ************************************************************/
var int Post_WetteGewonnen;

//-------------------------

instance DIA_Post_Wette (C_INFO)
{
	npc			=  Non_4022_Postronek;
	nr			= 5;
	condition	= DIA_Post_Wette_Condition;
	information	= DIA_Post_Wette_Info;
	permanent		= 1;
	important		= 0;
	description	= "Za³o¿ê siê, ¿e spokojnie dam sobie radê z Twoj¹... Mary!"; 
};                       

FUNC INT DIA_Post_Wette_Condition()
{
	if (Post_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo (hero, DIA_Postronek_Hello1))
	{
		return TRUE;	
	};
};

FUNC VOID DIA_Post_Wette_Info()
{	
	AI_Output (other, self, "DIA_Post_Wette_15_00"); //Za³o¿ê siê, ¿e spokojnie dam sobie radê z Twoj¹... Mary!
	AI_Output (self, other, "DIA_Post_Wette_06_01"); //Naprawdê? Ile chcesz przegraæ?
	AI_Output (self, other, "DIA_Post_Wette_06_02"); //No có¿, wygl¹dasz raczej na biednego durnia. Powiedzmy - 100 bry³ek! Masz chocia¿ tyle?
	
	Info_ClearChoices (DIA_Post_Wette);

	if (NPC_HasItems(other,ItMiNugget)>=100)
	{	
		Info_AddChoice (DIA_Post_Wette, "Jasne.", DIA_Post_Wette_Yes);
	}
	else
	{
		Info_AddChoice (DIA_Post_Wette, "Nie.", DIA_Post_Wette_No);
	};
};

func void DIA_Post_Wette_No()
{
	AI_Output (other, self, "DIA_Post_Wette_No_15_03"); //Nie.
	AI_Output (self, other, "DIA_Post_Wette_No_06_04"); //To je zdob¹dŸ.
	
	Info_ClearChoices (DIA_Post_Wette);
};

func void DIA_Post_Wette_Yes()
{
	AI_Output (other, self, "DIA_Post_Wette_Yes_15_05"); //Jasne.
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_06"); //Niech no spojrzê...		
	
   AI_Output (other, self, "DIA_Post_Wette_Yes_15_07"); //Mam rudê!
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_08"); //W porz¹dku, zobaczmy, na co Ciê staæ...
	
	B_GiveInvItems (self, other, ItMw_2h_Post, 1);
	
	if (other.attribute[ATR_STRENGTH] >= 60)
	{
      var c_item hero_weapon; hero_weapon = Npc_GetEquippedMeleeWeapon(other);
      
		TH_trust = TH_trust + 1;
		B_GiveXP (250);
      AI_UnequipWeapons(other);
      EquipItem(hero, ItMw_2h_Post);
		AI_EquipBestMeleeWeapon	(other);
		AI_ReadyMeleeWeapon(hero);
						
		AI_Output (other, self, "DIA_Post_Wette_Yes_15_09");//Choæby na to?!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_10");//Wygl¹da na to, ¿e wygra³eœ.
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_11");//Kto by przypuszcza³. Naprawdê nie wygl¹dasz mi na kogoœ, kto mia³by tyle krzepy.
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_12");//W³aœnie straci³em 200 bry³ek, s¹ Twoje.
		
      AI_RemoveWeapon (hero);
      AI_UnequipWeapons	(hero);
      EquipItem(hero, hero_weapon);
      AI_EquipBestMeleeWeapon	(other);
      AI_EquipBestRangedWeapon(other);
   
      CreateInvItems (self, ItMiNugget,100); 
		B_GiveInvItems (self, other, ItMiNugget, 100);
		Post_WetteGewonnen = TRUE;
		Log_SetTopicStatus	(CH2_TRL_Mary, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Mary, "Sprosta³em Mary, Postronek chc¹c nie chc¹c, musi mnie poprzeæ. Dodatkowo wygra³em 200 bry³ek.");
	}
	else
	{
		AI_Output (other, self, "DIA_Post_Wette_Yes_15_13"); //Nie udŸwignê tej broni!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_14");//To w³aœnie próbujê Ci uœwiadomiæ!
		AI_Output (self, other, "DIA_Post_Wette_Yes_06_15");//Dawaj rudê, dzisiaj szczêœcie Ci nie sprzyja, przyjacielu.
		
      B_GiveInvItems (other, self, ItMiNugget, 100);
		Log_SetTopicStatus	(CH2_TRL_Mary, LOG_FAILED);
		B_LogEntry		(CH2_TRL_Mary, "Cholera jednak siê przeliczy³em i nie sprosta³em Mary.");
	};
	
	AI_Output (self, other, "DIA_Post_Wette_Yes_06_16");//A teraz oddaj miecz i znikaj.
   
	B_GiveInvItems (hero, self, ItMw_2h_Post, 1);	
   AI_EquipBestMeleeWeapon	(self);
   
	Info_ClearChoices (DIA_Post_Wette);
};
