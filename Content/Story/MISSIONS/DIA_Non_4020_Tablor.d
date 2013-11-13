
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tablor_Exit (C_INFO)
{
	npc			= Non_4020_Tablor;
	nr			= 999;
	condition	= DIA_Tablor_Exit_Condition;
	information	= DIA_Tablor_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tablor_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tablor_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Tablor_Hello (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 1;
	condition		= DIA_Tablor_Hello_Condition;
	information		= DIA_Tablor_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj..."; 
};

FUNC INT DIA_Tablor_Hello_Condition()
{
	if(!Npc_KnowsInfo (hero,DIA_Tablor_Talk))
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Hello_Info()
{
	B_FullStop			(self);
	B_RemoveWeapon		(self);	
   
	AI_Output (other, self, "DIA_Tablor_Hello_15_01"); //Witaj...
	
   AI_TurnToNpc(self,other);
	Ai_Wait (self,0.5);
   
	AI_Output (other, self, "DIA_Tablor_Hello_15_02"); //Jesteœ niemow¹?
	
   AI_TurnAway(self,other);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_03"); //Rozumiem, ¿e nie chcesz gadaæ albo nie masz o czym, ale to nie oznacza, ¿e...
	
   AI_TurnToNpc 	(self,other);
	AI_DrawWeapon (self);
	Ai_Wait (self,0.5);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_04"); //Dobra, dobra ju¿ sobie idê.
	
   AI_RemoveWeapon (self);
	
   AI_Output (other, self, "DIA_Tablor_Hello_15_05"); //Cholerny œwir...
	
   B_StopProcessInfos	(self);
};
// **************************************************
INSTANCE DIA_Tablor_Talk (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 2;
	condition		= DIA_Tablor_Talk_Condition;
	information		= DIA_Tablor_Talk_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Tablor_Talk_Condition()
{
	var C_NPC kron; kron = Hlp_GetNpc(Non_4025_Kron);
	if (Npc_KnowsInfo (hero,DIA_Kron_AfterFight))&&(Npc_GetAivar(kron,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Talk_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_Output (self, other, "DIA_Tablor_Talk_11_01"); //Pokona³eœ Krona, a to nie³atwa sztuka.
	AI_Output (other, self,"DIA_Tablor_Talk_15_02"); //Ty mówisz!
	AI_Output (self, other, "DIA_Tablor_Talk_11_03"); //Rozmawiam tylko z wojownikami, którzy s¹ tego warci.
	AI_Output (other, self,"DIA_Tablor_Talk_15_04"); //Walka z jednym orkiem sprawi³a, ¿e okaza³em siê godny Twojej uwagi?
	AI_Output (self, other, "DIA_Tablor_Talk_11_05"); //Niezupe³nie, ale zaciekawi³eœ mnie. ¯eby zdobyæ mój szacunek musia³byœ wykazaæ siê naprawdê godnym czynem.
	AI_Output (other, self,"DIA_Tablor_Talk_15_06"); //Wiem, ¿e pewnie bêdê tego ¿a³owa³, ale co masz na myœli?
	AI_Output (self, other, "DIA_Tablor_Talk_11_07"); //Pokonaj bestiê, a uznam, ¿e jesteœ prawdziwym wojownikiem.
	AI_Output (other, self,"DIA_Tablor_Talk_15_08"); //Jak¹ bestiê?
	AI_Output (self, other, "DIA_Tablor_Talk_11_09"); //Wybór nale¿y do ciebie, pamiêtaj jednak, ¿e im wiêksza chwa³a tym wiêksza nagroda.

	Info_ClearChoices (DIA_Tablor_Talk);
	Info_AddChoice (DIA_Tablor_Talk, "Przyniosê Ci skórê... trolla!", DIA_Tablor_Talk_Trol);
	Info_AddChoice (DIA_Tablor_Talk, "Ukatrupiê cieniostwora!", DIA_Tablor_Talk_Shadow);
	Info_AddChoice (DIA_Tablor_Talk, "Zabijê œcierwojada!", DIA_Tablor_Talk_Scav);
};

// ---------------------------trol----------------------------------------

FUNC VOID DIA_Tablor_Talk_Trol()
{
	tablor_trol = TRUE;
   
	AI_Output (other, self, "DIA_Tablor_Talk_Trol_15_01"); //Przyniosê Ci skórê... trolla!
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_02"); //Hmm, to by³by prawdziwy wyczyn.
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_03"); //Niech bêdzie, kiedy to siê stanie udowodnisz, ¿e jesteœ nie tylko odwa¿ny, ale i œmiertelnie niebezpieczy.
	AI_Output (self, other, "DIA_Tablor_Talk_Trol_11_04"); //Ruszaj wiêc i powodzenia na szlaku.
	
	Log_CreateTopic	(CH2_TRL_Warrior, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Warrior, "Zgodzi³em siê przynieœ Tablorowi skórê trolla. Nie wiem, co mi strzeli³o do g³owy, ale to jedyny sposób, ¿eby uzna³ we mnie wojownika.");

	B_StopProcessInfos	(self); 
};

// ------------------shadow----------------

FUNC VOID DIA_Tablor_Talk_Shadow()
{
	tablor_shadow = TRUE;
	AI_Output (other, self, "DIA_Tablor_Talk_Shadow_15_01"); //Ukatrupiê cieniostwora!
	AI_Output (self, other, "DIA_Tablor_Talk_Shadow_11_02"); //Niech i tak bêdzie. Cieniostwory to podstêpne bestie, musisz wykazaæ siê nie tylko odwag¹, ale i rozwag¹.
	AI_Output (self, other, "DIA_Tablor_Talk_Shadow_11_03"); //Przynieœ mi skórê tej bestii, a uznam, ¿eœ godzien miana wojownika.
	
	Log_CreateTopic	(CH2_TRL_Warrior, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Warrior, "Tablor nazwie mnie wojownikiem, je¿eli przyniosê mu skórê cieniostwora.");

	B_StopProcessInfos	(self); 
};

// ------------------scav----------------

FUNC VOID DIA_Tablor_Talk_Scav()
{

	AI_Output (other, self, "DIA_Tablor_Talk_Scav_15_01"); //Zabijê œcierwojada!
	AI_Output (self, other, "DIA_Tablor_Talk_Scav_11_02"); //Je¿eli chcia³eœ mnie rozbawiæ, to prawie Ci siê to uda³o...
	//Info_ClearChoices (DIA_Tablor_Talk);
};

// **************************************************

INSTANCE DIA_Tablor_Done (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 3;
	condition		= DIA_Tablor_Done_Condition;
	information		= DIA_Tablor_Done_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam skórê bestii!"; 
};

FUNC INT DIA_Tablor_Done_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Talk)) && (!tablor_beast)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_Done_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_Output (other, self,"DIA_Tablor_Done_15_01"); //Mam skórê bestii!

	if ((NPC_HasItems(other,ItAt_TrollSkin)>=1)||(NPC_HasItems(other,ItAt_YoTroSkin)>=1))&&(tablor_trol == TRUE)
	{
		tablor_beast = TRUE;
		tablor_trol = 2;
      
		if (NPC_HasItems(other,ItAt_Troll_01)>=1)
		{
			B_GiveXP (500);
			B_GiveInvItems (other, self, ItAt_Troll_01,1);
		}
		else if (NPC_HasItems(other,ItAt_TrollSkin)>=1)
		{
			B_GiveXP (500);
			B_GiveInvItems (other, self, ItAt_TrollSkin,1);
		}
		else if (NPC_HasItems(other,ItAt_YoTroSkin)>=1)
		{
			B_GiveXP (400);
			B_GiveInvItems (other, self, ItAt_YoTroSkin,1);
		};

		TH_trust = TH_trust + 1;
      
		AI_Output (self, other, "DIA_Tablor_Done_11_02"); //W rzeczy samej, udowodni³eœ, ¿e jesteœ godzieñ miana wojownika.
		AI_Output (self, other, "DIA_Tablor_Done_11_03"); //Kira dowie siê, ¿e kroczy miêdzy nami cz³ek odwa¿ny i niez³omny. Masz mój szacunek, a nawet coœ... wiêcej.
		AI_Output (other, self,"DIA_Tablor_Done_15_04"); //Co przez to rozumiesz?
		AI_Output (self, other, "DIA_Tablor_Done_11_05"); //W mojej g³owie narodzi³o siê pytanie... Wróæ, gdy bêdziesz gotów, by daæ mi na nie odpowiedŸ.
		
      Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Warrior, "Przynios³em Tablorowi skórê trolla, by³ wyraŸnie zdumiony. Zaskarbi³em sobie szacunek tego wojownika i chyba... coœ jeszcze. Kira dowie siê na co mnie staæ.");
		B_LogEntry		(CH2_TRL_Quest, "Udowodni³em Tablorowi, ¿e jestem prawdziwym wojownikiem.");
	}
	else if (NPC_HasItems(other,ItAt_ShadowSkin)>=1)&&(tablor_shadow == TRUE)
	{
		B_GiveXP (400);
		tablor_beast = TRUE;
		B_GiveInvItems (other, self, ItAt_ShadowSkin,1);
		kira_trial = kira_trial + 1;	
      
		AI_Output (self, other, "DIA_Tablor_Done_11_06"); //Rzeczywiœcie to skóra cieniostwora. Udowodni³eœ, ¿e nie znasz lêku ni trwogi.
		AI_Output (self, other, "DIA_Tablor_Done_11_07"); //Masz mój szacunek, choæ by³em przekonany, ¿e staæ Ciê na wiêcej.
		AI_Output (other, self,"DIA_Tablor_Done_15_08"); //Co masz na myœli?
		AI_Output (self, other, "DIA_Tablor_Done_11_09"); //Nic, nadal szukam odpowiedzi na pewne pytanie, ale to ju¿ niewa¿ne.
		AI_Output (self, other, "DIA_Tablor_Done_11_10"); //Kira dowie siê coœ wart. Bywaj.
		
      Log_SetTopicStatus	(CH2_TRL_Warrior, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Warrior, "Przynios³em Tablorowi skórê cieniostwora. Wojownik stwierdzi³, ¿e staæ mnie na wiêcej, by³ jednak wystarczaj¹co usatysfakcjonowany. Powie Kirze, co o mnie myœli.");
		B_LogEntry		(CH2_TRL_Quest, "Udowodni³em Tablorowi, ¿e jestem prawdziwym wojownikiem.");
	}
   else
   {
      AI_Output (self, other, "DIA_Tablor_Done_11_11"); //Nie wydaje mi siê. OdejdŸ i nie ustawaj w poszukiwaniach.
   };

	B_StopProcessInfos	(self); 
};

var int tablor_challenge;
var int tablor_req;

// **************************************************

INSTANCE DIA_tablor_challenge (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 4;
	condition		= DIA_tablor_challenge_Condition;
	information		= DIA_tablor_challenge_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mówi³eœ coœ o pytaniu, które ciê drêczy."; 
};

FUNC INT DIA_tablor_challenge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Tablor_Done))&&((tablor_trol == 2) ||(tablor_beast)) && (!tablor_challenge)
	{
		return 1;
	};
};

FUNC VOID DIA_tablor_challenge_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

	if (tablor_req == FALSE)
	{ 
		tablor_req = TRUE;

		AI_Output (other, self,"DIA_tablor_challenge_15_01"); //Mówi³eœ coœ o pytaniu, które ciê drêczy.
		AI_Output (self, other, "DIA_tablor_challenge_11_02"); //Tak, mam pewne w¹tpliwoœci.
		AI_Output (other, self,"DIA_tablor_challenge_15_03"); //Jakie w¹tpliwoœci?
		AI_Output (self,other, "DIA_tablor_challenge_11_04"); //Drêczy mnie niepewnoœæ, nie wiem, kto z nas jest lepszym wojownikiem.
		AI_Output (other, self,"DIA_tablor_challenge_15_05"); //Uwa¿aj, bo ta niepewnoœæ mo¿e Ciê zabiæ
		AI_Output (self, other, "DIA_tablor_challenge_11_06"); //Bez obaw, jestem gotów podj¹æ to wyzwanie. A ty?
      
      Log_CreateTopic	(CH2_TRL_Chalange, LOG_MISSION);
      Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_RUNNING);
      B_LogEntry		(CH2_TRL_Chalange, "Tablor rzuci³ mi wyzwanie. Ten dumny wojownik chce sprawdziæ, kto z nas jest lepszy.");
	}
   else
   {
      AI_Output (self, other, "DIA_tablor_challenge_11_07"); //Jesteœ gotów, aby skrzy¿owaæ ze mn¹ orê¿?
   };
	
   Info_ClearChoices (DIA_tablor_challenge);
	Info_AddChoice (DIA_tablor_challenge, "Jestem gotów.", DIA_tablor_challenge_Yes);
	Info_AddChoice (DIA_tablor_challenge, "Jeszcze nie teraz.", DIA_tablor_challenge_No);
};

// ---------------------------trol----------------------------------------

FUNC VOID DIA_tablor_challenge_Yes()
{
	tablor_challenge = TRUE;
   
	AI_Output (other, self, "DIA_tablor_challenge_Yes_15_01"); //Jestem gotów.
	AI_Output (self, other, "DIA_tablor_challenge_Yes_11_02"); //To dla mnie zaszczyt wojowniku.
	AI_Output (other, self, "DIA_tablor_challenge_Yes_11_03"); //Niech przemówi stal!
	
   B_LogEntry		(CH2_TRL_Chalange, "Przyj¹³em wyzwanie Tablora.");	

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------shadow----------------

FUNC VOID DIA_tablor_challenge_No()
{
	AI_Output (other, self, "DIA_tablor_challenge_No_15_01"); //Jeszcze nie teraz.
	AI_Output (self, other, "DIA_tablor_challenge_No_11_02"); //Droga wojownika, to tak¿e droga cierpliwoœci - poczekam.
	
   B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Tablor_AfterChalange (C_INFO)
{
	npc				= Non_4020_Tablor;
	nr				= 5;
	condition		= DIA_Tablor_AfterChalange_Condition;
	information		= DIA_Tablor_AfterChalange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tablor_AfterChalange_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_tablor_challenge))&&(tablor_challenge == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tablor_AfterChalange_Info()
{
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};

   AI_Output (self, other, "DIA_Tablor_AfterChalange_11_01"); //Droga do doskona³oœci jest zawsze drog¹ nauki.
	AI_Output (self, other, "DIA_Tablor_AfterChalange_11_02"); //Jedynym z czego trzeba sobie zdaæ sprawê, to kto jest uczniem, a kto mistrzem.
      
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		B_GiveXP(200);
		
		AI_Output (other, self,"DIA_Tablor_AfterChalange_15_03"); //Zrozumia³em... tê lekcjê.
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_04"); //Ja tak¿e wiele siê nauczy³em. Dziêkujê Ci za to przyjacielu.
		
      Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Chalange, "Przegra³em, lecz mimo to poczu³em siê jak... wygrany. Zdoby³em te¿ przyjaciela, a to jest dla mnie najwa¿niejsze.");
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		B_GiveXP(500);
		
		AI_Output (other, self, "DIA_Tablor_AfterChalange_11_07"); //A ja zrozumia³em... tê lekcjê.
		AI_Output (self, self,"DIA_Tablor_AfterChalange_15_08"); //Ja tak¿e wiele siê nauczy³em, dziêkujê Ci za to przyjacielu.
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_09"); //Zas³u¿y³eœ na nagrodê. WeŸ to ostrze - zawsze dobrze mi s³u¿y³o.
		
      AI_RemoveWeapon(self);
		AI_UnequipWeapons	(self);

		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_10"); //Bardziej ni¿ ja godzien jesteœ je nosiæ.
		AI_Output (other, self,"DIA_Tablor_AfterChalange_15_11"); //To zbyt wiele...
		AI_Output (self, other, "DIA_Tablor_AfterChalange_11_12"); //Wystarczy ju¿ s³ów, przyjacielu.
		
      B_GiveInvItems (self, other, ItMw_2H_Axe_Heavy_02,1);//mo¿na zmieniæ na jakiœ s³abszy orê¿, albo receptê na coœ dobrego.
		CreateInvItems (self, ItMw_2H_Axe_Heavy_02,1); 
		AI_EquipBestMeleeWeapon	(self);

		Log_SetTopicStatus	(CH2_TRL_Chalange, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Chalange, "Pokona³em Tablora, ten wspania³y wojownik podarowa³ mi w nagrodê swój topór. Znalaz³em dziœ nowego przyjaciela...");
	};
   
   B_StopProcessInfos	(self); 
};