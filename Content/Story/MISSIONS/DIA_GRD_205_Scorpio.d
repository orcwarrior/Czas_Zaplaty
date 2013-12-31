
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_SCORPIO;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

var int scorpio_food;

INSTANCE DIA_Scorpio_Hello (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 1;
	condition		= DIA_Scorpio_Hello_Condition;
	information		= DIA_Scorpio_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 450)&&(Npc_KnowsInfo (hero, DIA_Pacho_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_TurnToNpc (self,other);
   AI_DrawWeapon (hero);
	AI_Output (self, other, "DIA_Scorpio_Hello_11_01"); //Schowaj ¿elazo, zanim komuœ stanie siê krzywda.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_02"); //Twój kumpel mnie obrazi³.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_03"); //Cz³owieku on ma pochlastane struny g³osowe. 
	AI_Output (self, other, "DIA_Scorpio_Hello_11_04"); //Pewnie z przyzwyczajenia chcia³ zapytaæ coœ Ty za jeden, ale nie da³ rady nic wykrztusiæ.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_05"); //Hmm... W porz¹dku, pospieszy³em siê.
	AI_RemoveWeapon (hero);
	AI_Output (self, other, "DIA_Scorpio_Hello_11_06"); //Tak ju¿ lepiej. Myœla³em, ¿e znam wiêkszoœæ skazañców, ale ciebie nie kojarzê...
	AI_Output (other, self, "DIA_Scorpio_Hello_15_07"); //Bo jestem na tym zadupiu od niedawna. 
	AI_Output (other, self, "DIA_Scorpio_Hello_15_08"); //Sk¹d siê tu wzi¹³eœ?
	AI_Output (self, other, "DIA_Scorpio_Hello_11_09"); //A co Ciê to obchodzi? 
	AI_Output (self, other, "DIA_Scorpio_Hello_11_10"); //Skoro stronimy od innych to zdaje siê, ¿e mamy ku temu powody.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_11"); //Zreszt¹, imiona w Kolonii nic nie znacz¹.
	AI_Output (other, self, "DIA_Scorpio_Hello_15_12"); //Nie chcia³em byæ wœcibski, ale wygl¹dacie, jakby was Beliar wysra³.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_13"); //A Ty co, kap³an Adanosa? Biegasz sobie po Kolonii i ratujesz kogo siê da?
	AI_Output (other, self, "DIA_Scorpio_Hello_15_14"); //Dobra, ju¿ mnie nie ma, pozdrówcie cieniostwory i wargi.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_15"); //Zaczekaj!
	
   Log_CreateTopic(CH1_Rbl_Hungry, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Hungry, "Skorpion i Pacho potrzebuj¹ jedzenia. Twierdz¹, ¿e dobrze zap³ac¹ wiêc mo¿e warto coœ im przynieœæ.");
	
   AI_Output (self, other, "DIA_Scorpio_Hello_11_16"); //Od dwóch dni nie mieliœmy nic w ustach. Pacho ci¹gle gor¹czkuje po tym, jak topielce pochlasta³y mu szyjê i brzuch.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_17"); //Muszê przy nim siedzieæ, ¿eby nie dokoñczy³y tego co zaczê³y.
	AI_Output (self, other, "DIA_Scorpio_Hello_11_18"); //Masz coœ do zjedzenia?
	
   if ((NPC_HasItems(other,ItAt_Meatbug_01)>=1)||(NPC_HasItems(other,ItFoApple)>=1)||(NPC_HasItems(other,ItFo_wineberrys_01)>=1)||(NPC_HasItems(other,ItMa_Goodlumber)>=1)||(NPC_HasItems(other,ItFoLoaf)>=1)||(NPC_HasItems(other,ItFoMuttonRaw)>=1)||(NPC_HasItems(other,ItFoCheese)>=1)||(NPC_HasItems(other,ItFoMutton)>=1)||(NPC_HasItems(other,ItFoRice)>=1)||(NPC_HasItems(other,ItFoSoup)>=1)||(NPC_HasItems(other,ItFoMeatbugragout)>=1)||(NPC_HasItems(other,ItFoCrawlersoup)>=1)||(NPC_HasItems(other,ItFo_Stew)>=1)||(NPC_HasItems(other,ItFo_Fish)>=1))
	{
		scorpio_food = TRUE;
		AI_Output (other, self, "DIA_Scorpio_Hello_15_19"); //WeŸ to...
		
      if (NPC_HasItems(other,ItAt_Meatbug_01)>=1)
		{
			B_GiveInvItems (other, self, ItAt_Meatbug_01, 1);
		}
		else if (NPC_HasItems(other,ItFoApple)>=1)
		{
			B_GiveInvItems (other, self, ItFoApple, 1);
		}
		else if (NPC_HasItems(other,ItFo_wineberrys_01)>=1)
		{
			B_GiveInvItems (other, self, ItFo_wineberrys_01, 1);
		}
		else if (NPC_HasItems(other,ItFoLoaf)>=1)
		{
			B_GiveInvItems (other, self, ItFoLoaf, 1);
		}
		else if (NPC_HasItems(other,ItFoMuttonRaw)>=1)
		{
			B_GiveInvItems (other, self, ItFoMuttonRaw, 1);
		}
		else if (NPC_HasItems(other,ItFoCheese)>=1)
		{
			B_GiveInvItems (other, self, ItFoCheese, 1);
		}
		else if (NPC_HasItems(other,ItFoMutton)>=1)
		{
			B_GiveInvItems (other, self, ItFoMutton, 1);
		}
		else if (NPC_HasItems(other,ItFoRice)>=1)
		{
			B_GiveInvItems (other, self, ItFoRice, 1);
		}
		else if (NPC_HasItems(other,ItFoSoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoSoup, 1);
		}
		else if (NPC_HasItems(other,ItFoMeatbugragout)>=1)
		{
			B_GiveInvItems (other, self, ItFoMeatbugragout, 1);
		}
		else if (NPC_HasItems(other,ItFoCrawlersoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoCrawlersoup, 1);
		}
		else if (NPC_HasItems(other,ItFo_Stew)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Stew, 1);
		}
		else if (NPC_HasItems(other,ItFo_Fish)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Fish, 1);
		};
      
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Hello_11_20"); //Dziêki przyjacielu. To nas postawi na nogi.
		AI_Output (self, other, "DIA_Scorpio_Hello_11_21"); //WeŸ tê rudê, chocia¿ tak mogê siê odwdziêczyæ.
		AI_Output (other, self, "DIA_Scorpio_Hello_15_22"); //Rudy nigdy zbyt wiele.
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Hungry, "Przynios³em Skorpionowi i Pacho jedzenie. Uczciwie zap³acili rud¹.");
	}
	else
	{
		AI_Output (other, self, "DIA_Scorpio_Hello_15_23"); //Raczej nie.
		AI_Output (self, other, "DIA_Scorpio_Hello_11_24"); //Przynieœ coœ do ¿arcia, a sowicie Ciê wynagrodzê.
      
      B_StopProcessInfos(self);
	};
   
	NPC_ExchangeRoutine(self, "start");
};


INSTANCE DIA_Scorpio_Food (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 2;
	condition		= DIA_Scorpio_Food_Condition;
	information		= DIA_Scorpio_Food_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam jedzenie."; 
};

FUNC INT DIA_Scorpio_Food_Condition()
{
	if (scorpio_food == FALSE)&&(Npc_KnowsInfo (hero, DIA_Scorpio_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Food_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Food_15_01"); //Mam jedzenie.
	AI_Output (self, other, "DIA_Scorpio_Food_11_02"); //Zobaczmy, z czym przyszed³eœ...
   
	if ((NPC_HasItems(other,ItAt_Meatbug_01)>=1)||(NPC_HasItems(other,ItFoApple)>=1)||(NPC_HasItems(other,ItFo_wineberrys_01)>=1)||(NPC_HasItems(other,ItMa_Goodlumber)>=1)||(NPC_HasItems(other,ItFoLoaf)>=1)||(NPC_HasItems(other,ItFoMuttonRaw)>=1)||(NPC_HasItems(other,ItFoCheese)>=1)||(NPC_HasItems(other,ItFoMutton)>=1)||(NPC_HasItems(other,ItFoRice)>=1)||(NPC_HasItems(other,ItFoSoup)>=1)||(NPC_HasItems(other,ItFoMeatbugragout)>=1)||(NPC_HasItems(other,ItFoCrawlersoup)>=1)||(NPC_HasItems(other,ItFo_Stew)>=1)||(NPC_HasItems(other,ItFo_Fish)>=1))
	{
		scorpio_food = TRUE;
		AI_Output (other, self, "DIA_Scorpio_Food_15_03"); //WeŸ to...
		
      if (NPC_HasItems(other,ItAt_Meatbug_01)>=1)
		{
			B_GiveInvItems (other, self, ItAt_Meatbug_01, 1);
		}
		else if (NPC_HasItems(other,ItFoApple)>=1)
		{
			B_GiveInvItems (other, self, ItFoApple, 1);
		}
		else if (NPC_HasItems(other,ItFo_wineberrys_01)>=1)
		{
			B_GiveInvItems (other, self, ItFo_wineberrys_01, 1);
		}
		else if (NPC_HasItems(other,ItMa_Goodlumber)>=1)
		{
			B_GiveInvItems (other, self, ItMa_Goodlumber, 1);
		}
		else if (NPC_HasItems(other,ItFoLoaf)>=1)
		{
			B_GiveInvItems (other, self, ItFoLoaf, 1);
		}
		else if (NPC_HasItems(other,ItFoMuttonRaw)>=1)
		{
			B_GiveInvItems (other, self, ItFoMuttonRaw, 1);
		}
		else if (NPC_HasItems(other,ItFoCheese)>=1)
		{
			B_GiveInvItems (other, self, ItFoCheese, 1);
		}
		else if (NPC_HasItems(other,ItFoMutton)>=1)
		{
			B_GiveInvItems (other, self, ItFoMutton, 1);
		}
		else if (NPC_HasItems(other,ItFoRice)>=1)
		{
			B_GiveInvItems (other, self, ItFoRice, 1);
		}
		else if (NPC_HasItems(other,ItFoSoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoSoup, 1);
		}
		else if (NPC_HasItems(other,ItFoMeatbugragout)>=1)
		{
			B_GiveInvItems (other, self, ItFoMeatbugragout, 1);
		}
		else if (NPC_HasItems(other,ItFoCrawlersoup)>=1)
		{
			B_GiveInvItems (other, self, ItFoCrawlersoup, 1);
		}
		else if (NPC_HasItems(other,ItFo_Stew)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Stew, 1);
		}
		else if (NPC_HasItems(other,ItFo_Fish)>=1)
		{
			B_GiveInvItems (other, self, ItFo_Fish, 1);
		};
      
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Food_11_04"); //Dziêki przyjacielu. To nas postawi na nogi.
		AI_Output (self, other, "DIA_Scorpio_Food_11_05"); //WeŸ tê rudê, chocia¿ tak mogê siê odwdziêczyæ.
		B_GiveInvItems (self, other, ItMiNugget, 50);
		Log_SetTopicStatus(CH1_Rbl_Hungry, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Hungry, "Przynios³em Skorpionowi i Pacho jedzenie. Uczciwie zap³acili rud¹.");
	}
   else
   {
      AI_Output (self, other, "DIA_Scorpio_Food_11_07"); //Przecie¿ Ty nic nie masz. Wróæ z ¿arciem, a nie po¿a³ujesz.
      B_StopProcessInfos(self);
   };
};

var int scorpio_plant;

INSTANCE DIA_Scorpio_Story (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 3;
	condition		= DIA_Scorpio_Story_Condition;
	information		= DIA_Scorpio_Story_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tutaj robicie?"; 
};

FUNC INT DIA_Scorpio_Story_Condition()
{
	if (scorpio_food == TRUE)&&((Npc_KnowsInfo (hero, DIA_Scorpio_Hello))||(Npc_KnowsInfo (hero, DIA_Scorpio_Story)))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Story_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Story_15_01"); //Co tutaj robicie?
	AI_Output (self, other, "DIA_Scorpio_Story_11_02"); //Uciekliœmy ze Starego Obozu. Mieliœmy ju¿ doœæ wyzysku i ¿ycia na ³asce magnatów.
	AI_Output (self, other, "DIA_Scorpio_Story_11_03"); //Moim zdaniem Gomez ca³kiem straci³ rozum. Ten cholerny psychopata nie ufa ju¿ nawet Krukowi.
	AI_Output (self, other, "DIA_Scorpio_Story_11_04"); //Uciekliœmy w nocy. Pacho szed³ przodem, bo lepiej zna okolice.
	AI_Output (self, other, "DIA_Scorpio_Story_11_05"); //Nagle nie wiadomo sk¹d, rzuci³y siê na nas... topielce. Tak, to by³y topielce. 
	AI_Output (self, other, "DIA_Scorpio_Story_11_06"); //Pacho mia³ pecha, poœlizgn¹³ siê i dorwa³y go na ziemi.
	AI_Output (self, other, "DIA_Scorpio_Story_11_07"); //Zanim dobieg³em, by³ ju¿ porz¹dnie pochlastany.
	AI_Output (self, other, "DIA_Scorpio_Story_11_08"); //Zdo³a³em zatamowaæ krew, ale ch³opak straci³ g³os.
	AI_Output (self, other, "DIA_Scorpio_Story_11_09"); //Dobrze gadam, Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho, "T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Scorpio_Story_11_10"); //Sam widzisz, ¿e nie jest z nim za dobrze.
	AI_Output (self, other, "DIA_Scorpio_Story_11_11"); //Jedyna nadzieja w odchodach trolla.
	AI_Output (other, self, "DIA_Scorpio_Story_15_12"); //¯e co?
	AI_Output (self, other, "DIA_Scorpio_Story_11_13"); //Na trollich odchodach roœnie pewna rzadka roœlina.
	AI_Output (self, other, "DIA_Scorpio_Story_11_14"); //Wyci¹g z jej ³odygi mo¿e zregenerowaæ struny g³osowe i byæ mo¿e Pacho wróci³by g³os.
	AI_Output (other, self, "DIA_Scorpio_Story_15_15"); //To dlaczego nie poszukacie tej roœliny?
	AI_Output (self, other, "DIA_Scorpio_Story_11_16"); //Pacho jeszcze nie doszed³ do siebie. 
	AI_Output (other, self, "DIA_Scorpio_Story_15_17"); //A mo¿e odprowadziæ was do Obozu Rebeliantów?
	AI_Output (self, other, "DIA_Scorpio_Story_11_18"); //Mamy ju¿ doœæ wszelkiej 'zorganizowanej spo³ecznoœci' w tej zawszonej Kolonii. Co nie Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
	AI_Output (other, self, "DIA_Scorpio_Story_15_19"); //W Obozie Rebeliantów dostaniecie tyle jedzenia, ile zdo³acie udŸwign¹æ.
	AI_Output (self, other, "DIA_Scorpio_Story_11_20"); //Nie ¿artuj. S³ysza³em, ¿e rebelianci to banda szaleñców i pijaków.
	AI_Output (other, self, "DIA_Scorpio_Story_15_21"); //W sumie to masz racjê, ale ch³opaki przynajmniej trzymaj¹ siê razem. A z tego co widzê, to chyba nie macie innej alternatywy.
	AI_Output (self, other, "DIA_Scorpio_Story_11_22"); //Hmm... Co ty na to Pacho?
	
   AI_TurnToNpc (self, Pacho);
	
   if (C_BodystateContains(Pacho, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_Story_11_23"); //Niech bêdzie. Ale pod jednym warunkiem.
	AI_Output (self, other, "DIA_Scorpio_Story_11_24"); //Pogrzebiesz w trollich odchodach i poszukasz tej roœliny.
	AI_Output (other, self, "DIA_Scorpio_Story_15_25"); //Nie bêdê babra³ siê w gównie!
	AI_Output (self, other, "DIA_Scorpio_Story_11_26"); //Spokojnie, to ziele roœnie na ziemi, nie na ³ajnie.
	AI_Output (self, other, "DIA_Scorpio_Story_11_27"); //To jak bêdzie?

	Info_ClearChoices (DIA_Scorpio_Story);
	Info_AddChoice (DIA_Scorpio_Story, "No dobra.", DIA_Scorpio_Story_Yes);
	Info_AddChoice (DIA_Scorpio_Story, "Muszê to przemyœleæ.", DIA_Scorpio_Story_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Scorpio_Story_Yes()
{
	scorpio_plant = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_Story_Yes_15_01"); //No dobra. 
	AI_Output (self, other, "DIA_Scorpio_Story_Yes_11_02"); //Wiedzia³em, ¿e porz¹dny z Ciebie ch³op.
	AI_Output (self, other, "DIA_Scorpio_Story_Yes_11_03"); //Wróæ z roœlin¹, to pójdziemy z Tob¹ do rebeliantów.
	Log_CreateTopic(CH1_Rbl_Plant, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Plant, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Plant, "Skorpion i Pacho pójd¹ ze mn¹ do Obozu Rebeliantów, je¿eli poszukam jakiejœ roœliny rosn¹cej na odchodach trolla. Czeka mnie babranie w gównie...");
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho pójd¹ ze mn¹ do Obozu Rebeliantów, je¿eli znajdê dla nich jakaœ roœlinê wschodz¹c¹ na odchodach trolla.");
   B_StopProcessInfos(self); 
	
	Wld_InsertNpc(MIS_PACHOTROLL,"FP_ROAM_OW_SNAPPER_OW_ORC");
	var C_NPC halfdeadtroll; halfdeadtroll = Hlp_GetNpc(MIS_PACHOTROLL);
	B_ChangeAttribute	(halfdeadtroll, ATR_HITPOINTS, -500);	
	Wld_InsertNpc(GRD_240_Gardist, "FP_ROAM_OW_SNAPPER_OW_ORC"); 
	var C_NPC gieerde; gieerde = Hlp_GetNpc(GRD_240_Gardist);
	B_ChangeAttribute	(gieerde, ATR_HITPOINTS, -gieerde.attribute[ATR_HITPOINTS_MAX]);	    
	Wld_InsertItem	(aloes,"OW_PATH_019");		
};

// ------------------No----------------

FUNC VOID DIA_Scorpio_Story_No()
{
	AI_Output (other, self, "DIA_Scorpio_Story_No_15_01"); //Muszê to przemyœleæ.
	AI_Output (self, other, "DIA_Scorpio_Story_No_11_02"); //Rozumiem, w koñcu z trollami nie ma ¿artów.
	AI_Output (self, other, "DIA_Scorpio_Story_No_11_03"); //Jakbyœ zmieni³ zdanie, to wiesz, gdzie nas szukaæ.
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_CanYouTeachMe (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 4;
	condition		= DIA_Scorpio_CanYouTeachMe_Condition;
	information		= DIA_Scorpio_CanYouTeachMe_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Scorpio_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_Hello) && (Scorpio_teacher == false)) 
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_CanYouTeachMe_Info()
{
   if (scorpio_food)
   {
      Scorpio_teacher = true;
      
      AI_Output (other, self, "DIA_Scorpio_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
      AI_Output (self, other, "DIA_Scorpio_CanYouTeachMe_15_02"); //Móg³bym ci pokazaæ, jak sprawnie pos³ugiwaæ siê kusz¹.
      AI_Output (self, other, "DIA_Scorpio_CanYouTeachMe_15_03"); //Daj znaæ, jak bêdziesz chcia³ potrenowaæ.
      
      Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
      B_LogEntry(GE_TeacherOW, "Skorpion mo¿e pokazaæ mi, jak pos³ugiwaæ siê kusz¹.");
   }
   else
   {
      AI_Output (other, self, "DIA_Scorpio_CanYouTeachMe_15_04"); //Przynieœ ¿arcie, to pogadamy.
   };
};

INSTANCE DIA_Scorpio_StoryOk (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 4;
	condition		= DIA_Scorpio_StoryOk_Condition;
	information		= DIA_Scorpio_StoryOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Poszukam tej roœliny."; 
};

FUNC INT DIA_Scorpio_StoryOk_Condition()
{
	if (scorpio_plant == FALSE)&&(Npc_KnowsInfo (hero, DIA_Scorpio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_StoryOk_Info()
{
	scorpio_plant = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_StoryOk_15_01"); //Poszukam tej roœliny. 
	AI_Output (self, other, "DIA_Scorpio_StoryOk_11_02"); //Wiedzia³em, ¿e porz¹dny z Ciebie ch³op.
	AI_Output (self, other, "DIA_Scorpio_StoryOk_11_03"); //Wróæ z roœlin¹ to pójdziemy z Tob¹ do rebeliantów.
	Log_CreateTopic(CH1_Rbl_Plant, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Plant, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Plant, "Skorpion i Pacho pójd¹ ze mn¹ do Obozu Rebeliantów, je¿eli poszukam jakiejœ roœliny rosn¹cej na odchodach trolla. Czeka mnie babranie w gównie...");	
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho pójd¹ ze mn¹ do Obozu Rebeliantów, je¿eli znajdê dla nich jakaœ roœlinê wschodz¹c¹ na odchodach trolla.");
	
	Wld_InsertNpc(MIS_PACHOTROLL,"FP_ROAM_OW_SNAPPER_OW_ORC");
	var C_NPC halfdeadtroll; halfdeadtroll = Hlp_GetNpc(MIS_PACHOTROLL);
	B_ChangeAttribute	(halfdeadtroll, ATR_HITPOINTS, -500);	
	Wld_InsertNpc(GRD_240_Gardist, "FP_ROAM_OW_SNAPPER_OW_ORC"); 
	var C_NPC gieerde; gieerde = Hlp_GetNpc(GRD_240_Gardist);
	B_ChangeAttribute	(gieerde, ATR_HITPOINTS, -gieerde.attribute[ATR_HITPOINTS_MAX]);	    
	Wld_InsertItem	(aloes,"FP_MIS_ALOES");	
	
	B_StopProcessInfos	(self); 
};

var int aloes_find;

INSTANCE DIA_Scorpio_Plant (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 5;
	condition		= DIA_Scorpio_Plant_Condition;
	information		= DIA_Scorpio_Plant_Info;
	permanent		= 1;
	important		= 0;
	description		= "Znalaz³em roœlinê."; 
};

FUNC INT DIA_Scorpio_Plant_Condition()
{
	if (!aloes_find)&&(scorpio_plant)&&((Npc_KnowsInfo (hero, DIA_Scorpio_Story))||(Npc_KnowsInfo (hero, DIA_Scorpio_StoryOk)))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Plant_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Plant_15_01"); //Znalaz³em roœlinê. 
	AI_Output (self, other, "DIA_Scorpio_Plant_11_02"); //Zobaczmy, co tam masz...
   
	if (NPC_HasItems(other,aloes)>=1)
	{
		aloes_find = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_Scorpio_Plant_11_03"); //Œwietna robota. Prawda Pacho?
		AI_TurnToNpc (self, Pacho);
      
		if (C_BodystateContains(Pacho, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (Pacho, other);
		};
      
		AI_PlayAni(Pacho,"T_YES");
		AI_Waitms(self,500);
		AI_TurnToNpc (self, other);

		AI_Output (self, other, "DIA_Scorpio_Plant_11_04"); //To teraz musisz tylko zrobiæ z niej miksturê i mo¿emy iœæ.
		AI_Output (other, self, "DIA_Scorpio_Plant_15_05"); //Nie mówi³eœ nic o robieniu mikstur!
		AI_Output (self, other, "DIA_Scorpio_Plant_11_06"); //Naprawdê? Musia³o mi to umkn¹æ. 
		AI_Output (self, other, "DIA_Scorpio_Plant_11_07"); //Pójdziemy za Tob¹ dopiero, jak Pacho dostanie miksturê. Dobrze gadam?
		AI_TurnToNpc (self, Pacho);
      
		if (C_BodystateContains(Pacho, BS_SIT))
		{
			AI_StandUp (self);
			AI_TurnToNpc (Pacho, other);
		};
      
		AI_PlayAni(Pacho,"T_YES");
		AI_Waitms(self,500);
		AI_TurnToNpc (self, other);
      
		AI_Output (self, other, "DIA_Scorpio_Plant_11_08"); //Nie przejmuj siê. Poczekamy tu na Ciebie.
		B_LogEntry(CH1_Rbl_Plant, "Skorpion mnie wykorzysta³. Przynios³em roœlinê, ale by³y stra¿nik i jego towarzysz pójd¹ za mn¹ dopiero, jak przyniosê im miksturê sporz¹dzon¹ z roœliny. Ciekawe co jeszcze wymyœl¹?");	
		B_LogEntry(CH1_Rbl_NewMembers, "Skorpion mnie wykorzysta³. Tym razem twierdzi, ¿e pójd¹ za mn¹ do rebeliantów, jak sporz¹dzê z roœliny miksturê dla Pacho.");
	}
	else
	{
		AI_Output (self, other, "DIA_Scorpio_Plant_11_09"); //Nie masz ziela, którego potrzebujemy.
		AI_Output (self, other, "DIA_Scorpio_Plant_11_10"); //Szukaj dalej.
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Scorpio_Mixture (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 6;
	condition		= DIA_Scorpio_Mixture_Condition;
	information		= DIA_Scorpio_Mixture_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam esencjê z aloesu."; 
};

FUNC INT DIA_Scorpio_Mixture_Condition()
{
	if (NPC_HasItems(hero,aloes_mixture)>=1)&&(aloes_find)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Mixture_Info()
{
	B_GiveXP(100);

	AI_Output (other, self, "DIA_Scorpio_Mixture_15_01"); //Mam esencjê z aloesu. 
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_02"); //Cholera, nie s¹dzi³em, ¿e tu jeszcze wrócisz.
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_03"); //Jesteœ gotów Pacho?
	AI_TurnToNpc (self, Pacho);
	aloes_find=2;
   
	if (C_BodystateContains(Pacho, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (Pacho, other);
	};
   
	AI_PlayAni(Pacho,"T_YES");
	AI_Waitms(self,500);
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_04"); //W porz¹dku. Daj miksturê Pacho. Mam nadziejê, ¿e go to nie zabije.
	AI_Output (self, other, "DIA_Scorpio_Mixture_11_05"); //Do dna przyjacielu!
	B_LogEntry(CH1_Rbl_Plant, "Najwy¿szy czas daæ miksturê Pacho i zobaczyæ, co siê stanie.");	
	B_LogEntry(CH1_Rbl_NewMembers, "Przynios³em miksturê Pacho. Zobaczymy, jak zadzia³a.");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_Go (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 7;
	condition		= DIA_Scorpio_Go_Condition;
	information		= DIA_Scorpio_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿emy ju¿ iœæ?"; 
};

FUNC INT DIA_Scorpio_Go_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_Mixture))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Go_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Go_15_01"); //Mo¿emy ju¿ iœæ?
	AI_Output (self, other, "DIA_Scorpio_Go_11_02"); //Jak najbardziej. Muszê przyznaæ, ¿e rzadko spotyka siê w Kolonii kogoœ takiego jak Ty.
	AI_Output (self, other, "DIA_Scorpio_Go_11_03"); //Jak dojdziemy na miejsce, bêdê mia³ do Ciebie pewn¹ delikatn¹ sprawê.
	AI_Output (self, other, "DIA_Scorpio_Go_11_04"); //Ale teraz w drogê.
	AI_TurnToNpc (self, Pacho);
	AI_Output (self, other, "DIA_Scorpio_Go_11_05"); //Pacho ruszaj zad, czeka nas ma³y spacerek.
	AI_Output (self, other, "DIA_Scorpio_Go_11_06"); //Tylko tym razem omijaj topielce, he, he...
	B_LogEntry(CH1_Rbl_NewMembers, "Skorpion i Pacho zgodzili siê pójœæ za mn¹ do Obozu Rebeliantów.");
	Party_AddNpc(self);
	Party_AddNpc(pacho);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_ExchangeRoutine(GRD_224_PACHO,"FOLLOW");
	B_StopProcessInfos(self); 
	Know_PachoAndScorpio=TRUE;
};

INSTANCE DIA_Scorpio_GoOut (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 8;
	condition		= DIA_Scorpio_GoOut_Condition;
	information		= DIA_Scorpio_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_Go))
   &&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )
   ||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_GoOut_Info()
{
   var C_NPC Pacho; Pacho = Hlp_GetNpc(GRD_224_Pacho);
   
	scorpion_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_01"); //Nie brzydki ten obóz...
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_02"); //Powinno nam tu byæ dobrze, Pacho.
	AI_Output (other, self, "DIA_Scorpio_GoOut_15_03"); //Jedzenia na pewno wam nie zabraknie.
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_04"); //W porz¹dku, zostajemy.
	AI_Output (self, other, "DIA_Scorpio_GoOut_11_05"); //WeŸ te mikstury, Tobie bardziej siê przydadz¹.
   
	CreateInvItems (self, ItFo_Potion_Health_02,5); 
	B_GiveInvItems (self, other,ItFo_Potion_Health_02, 5);
   
	B_LogEntry(CH1_Rbl_NewMembers, "Doprowadzi³em Skorpiona i Pacho do Obozu Rebeliantów.");
	Party_RemoveNpc(self);
	Party_RemoveNpc(pacho);
	Npc_ExchangeRoutine(self,"OR");
	B_ExchangeRoutine(GRD_224_PACHO,"OR");
	self.flags	= self.flags & ~NPC_FLAG_IMMORTAL;
	pacho.flags	= pacho.flags & ~NPC_FLAG_IMMORTAL;
	AI_Wait(pacho,2);		
	B_StopProcessInfos(self); 
	//For whistler quest:
	Day_PachoJoinsORCamp = B_SetDayTolerance();
};

var int skorpio_map;

INSTANCE DIA_Scorpio_Case (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 9;
	condition		= DIA_Scorpio_Case_Condition;
	information		= DIA_Scorpio_Case_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wspomnia³eœ coœ wczeœniej..."; 
};

FUNC INT DIA_Scorpio_Case_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Case_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Case_15_01"); //Wspomnia³eœ coœ wczeœniej...
	AI_Output (self, other, "DIA_Scorpio_Case_11_02"); //Tak, mam pewien problem, a nie znam za dobrze nikogo w tym obozie.
	AI_Output (other, self, "DIA_Scorpio_Case_15_03"); //Co to za problem?
	AI_Output (self, other, "DIA_Scorpio_Case_11_04"); //Potrzebujê mapy Kolonii. Nie musi byæ bardzo dok³adna. Grunt, ¿eby by³y na niej zaznaczone najwa¿niejsze punkty orientacyjne.
	AI_Output (self, other, "DIA_Scorpio_Case_11_05"); //Mo¿e wiesz, kto w obozie mia³by coœ takiego na sprzeda¿?
	AI_Output (other, self, "DIA_Scorpio_Case_15_06"); //Nie wiem, ale mogê siê rozejrzeæ. Oczywiœcie nie za darmo.
	AI_Output (self, other, "DIA_Scorpio_Case_11_07"); //To siê rozumie. Dostaniesz... 200 bry³ek rudy.
	AI_Output (other, self, "DIA_Scorpio_Case_15_08"); //Dobra niech bêdzie, ale po³owa p³atna z góry. Nazwijmy to kosztami amortyzacji.
	AI_Output (self, other, "DIA_Scorpio_Case_11_09"); //Zdaje siê, ¿e nie mam wyboru. Oto 100 bry³ek. 
	
   CreateInvItems (self,ItMiNugget,100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	
   AI_Output (self, other, "DIA_Scorpio_Case_11_10"); //Ale stawiam jeden warunek.
	AI_Output (other, self, "DIA_Scorpio_Case_15_11"); //Jaki?
	AI_Output (self, other, "DIA_Scorpio_Case_11_12"); //Masz dwa dni na przyniesienie mapy.
	AI_Output (other, self, "DIA_Scorpio_Case_15_13"); //Nie ma sprawy, bêdziesz j¹ mia³ du¿o wczeœniej.
	
   skorpio_map = B_SetDayTolerance()+2;
	Log_CreateTopic(CH1_Rbl_Map, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Map, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Map, "Skorpion poprosi³ mnie o przyniesienie mapy Kolonii. Zap³aci mi za to 200 bry³ek, z czego po³owê ju¿ uiœci³. Ciekawe, po co mu ta mapa?");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_Map (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 10;
	condition		= DIA_Scorpio_Map_Condition;
	information		= DIA_Scorpio_Map_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynoszê mapê."; 
};

FUNC INT DIA_Scorpio_Map_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_Case))&&(NPC_HasItems(other,ItWrWorldmap)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Map_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Map_15_01"); //Przynoszê mapê.
	
   if (Wld_GetDay() <= skorpio_map)
	{
		B_GiveXP(150);
		AI_Output (self, other, "DIA_Scorpio_Map_11_02"); //Œwietnie. Zd¹¿y³eœ w dwa dni tak jak prosi³em.
		AI_Output (self, other, "DIA_Scorpio_Map_11_03"); //WeŸ rudê, uczciwie zarobi³eœ.
      
		CreateInvItems (self,ItMiNugget,100);
		B_GiveInvItems (self, other, ItMiNugget, 100);
      
		AI_Output (other, self, "DIA_Scorpio_Map_15_04"); //Po co ci ta mapa?
      
		B_GiveInvItems (other, self, ItWrWorldmap, 1);
      
		AI_Output (self, other, "DIA_Scorpio_Map_11_05"); //Nie chcê siê zgubiæ w Kolonii, wiesz to bardzo niebezpieczne miejsce...
		AI_Output (other, self, "DIA_Scorpio_Map_15_06"); //A powa¿nie?
		AI_Output (self, other, "DIA_Scorpio_Map_11_07"); //A powa¿nie to nie Twój interes. Bywaj.
      
		Log_SetTopicStatus(CH1_Rbl_Map, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Map, "Przynios³em mapê Skorpionowi. Da³ mi resztê rudy, ale nie chcia³ zdradziæ po co mu mapa. Ciekawe, mo¿e Pacho coœ mi powie, w koñcu to przyjaciele.");
	}
	else
	{
		AI_Output (self, other, "DIA_Scorpio_Map_11_08"); //Mówi³em dwa dni!
		AI_Output (other, self, "DIA_Scorpio_Map_15_09"); //Wyst¹pi³y pewne komplikacje...
		AI_Output (self, other, "DIA_Scorpio_Map_11_10"); //Gówno mnie to obchodzi! Dawaj mapê.
      
		B_GiveInvItems (other, self, ItWrWorldmap, 1);
      
		AI_Output (other, self, "DIA_Scorpio_Map_15_11"); //A reszta rudy?
		AI_Output (self, other, "DIA_Scorpio_Map_11_12"); //Trzaby³o siê nie spóŸniæ!
		AI_Output (other, self, "DIA_Scorpio_Map_15_09"); //Co siê tak wœciekasz. Po co ci ta mapa?
		AI_Output (self, other, "DIA_Scorpio_Map_11_10"); //A co ciê to obchodzi?! Bywaj.
      
		Log_SetTopicStatus(CH1_Rbl_Map, LOG_SUCCESS);
		B_LogEntry(CH1_Rbl_Map, "Przynios³em mapê Skorpionowi. SpóŸni³em siê i nie dosta³em reszty rudy. By³y stra¿nik nie chcia³ te¿ zdradziæ, do czego potrzebuje t¹ mapê. Ciekawe, mo¿e Pacho coœ mi powie, w koñcu to przyjaciele.");
	};
   
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Scorpio_Traitor (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 10;
	condition		= DIA_Scorpio_Traitor_Condition;
	information		= DIA_Scorpio_Traitor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Musimy porozmawiaæ o Pacho."; 
};

FUNC INT DIA_Scorpio_Traitor_Condition()
{
	if (pacho_ore)&&(!Npc_KnowsInfo (hero, DIA_Pacho_JourneyEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Traitor_Info()
{
	AI_Output (other, self, "DIA_Scorpio_Traitor_15_01"); //Musimy porozmawiaæ o Pacho.
	AI_Output (self, other, "DIA_Scorpio_Traitor_11_02"); //O co chodzi?

	Info_ClearChoices (DIA_Scorpio_Traitor);
	Info_AddChoice (DIA_Scorpio_Traitor, "Pacho z³o¿y³ mi propozycjê.", DIA_Scorpio_Traitor_Yes);
	Info_AddChoice (DIA_Scorpio_Traitor, "To nic wa¿nego.", DIA_Scorpio_Traitor_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Scorpio_Traitor_Yes()
{
	B_GiveXP(200);
	scorpio_traitor = TRUE;
   
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_01"); //Pacho z³o¿y³ mi propozycjê nie do odrzucenia.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_02"); //Mów jaœniej.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_03"); //Opowiedzia³ mi o rudzie skradzionej pewnemu magnatowi...
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_04"); //Niech to szlag trafi! Zdradziecka menda!
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_05"); //Spokojnie. Mo¿emy siê dogadaæ.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_06"); //Co masz na myœli?
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_07"); //Kiedy Pacho poka¿e mi, gdzie zakopa³ rudê, rozwalê mu ³eb.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_08"); //Mów dalej...
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_09"); //Zanim wyruszymy dam Ci znaæ, pójdziesz za nami.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_10"); //W odpowiednim momencie pomo¿esz mi wykopaæ rudê i bêdziesz uwa¿a³ na tê niby bestiê.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_11"); //I najwa¿niejsze. Wezmê trzy czwarte rudy i b³yskotkê Gomeza.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_12"); //Po moim trupie!
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_13"); //To da siê za³atwiæ.
	
   AI_DrawWeapon (hero);
	
   AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_14"); //Spokojnie, dogadamy siê...
	
   AI_RemoveWeapon (self);
	
   AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_15"); //Je¿eli bajka o tej bestii jest prawd¹ to mo¿e byæ gor¹co...
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_16"); //Dobra niech bêdzie. Jest tego tyle, ¿e nawet czwarta czêœæ mi wystarczy.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_17"); //Daj mi znak, zanim wyruszycie. Pod¹¿ê za wami.
	AI_Output (other, self, "DIA_Scorpio_Traitor_Yes_15_18"); //Tylko pamiêtaj, ¿e je¿eli Pacho Ciê dostrze¿e, to nasza umowa jest niewa¿na.
	AI_Output (self, other, "DIA_Scorpio_Traitor_Yes_11_19"); //Bez obaw. Kiedy potrzeba, potrafiê zachowaæ dyskrecjê.
   
	B_LogEntry(CH1_Rbl_Ore, "Zdradzi³em Pacho. Powiedzia³em wszystko Skorpionowi. Stra¿nik z oporami, ale zgodzi³ siê na jedn¹ czwart¹ rudy. Jak na mój gust za szybko przysta³ na moje warunki. Muszê mieæ go na oku, kiedy ju¿ wykopiemy rudê.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Scorpio_Traitor_No()
{
	AI_Output (other, self, "DIA_Scorpio_Traitor_No_15_01"); //To nic wa¿nego... Po prostu wydaje mi siê, ¿e twój przyjaciel jeszcze nie odzyska³ pe³ni si³.
	AI_Output (self, other, "DIA_Scorpio_Traitor_No_11_02"); //Rany na Pacho goj¹ siê jak na psie. Szybko do siebie dojdzie.
	AI_Output (self, other, "DIA_Scorpio_Traitor_No_11_03"); //Na pewno tylko to chcia³eœ mi powiedzieæ?
	AI_Output (other, self, "DIA_Scorpio_Traitor_No_15_04"); //Tak. Bywaj...
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_AfterDig (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 11;
	condition		= DIA_Scorpio_AfterDig_Condition;
	information		= DIA_Scorpio_AfterDig_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_AfterDig_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_OreDig))&&(NPC_HasItems(hero, gomez_mirror)>=1)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_AfterDig_Info()
{
	AI_Output (self, other, "DIA_Scorpio_AfterDig_11_01"); //Tak, Pacho, ja te¿ cieszê siê na Twój widok.
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Scorpio_AfterDig_15_02"); //Wystarczy ju¿ tych czu³oœci. Co do rudy...

	AI_Output (self, other, "DIA_Scorpio_AfterDig_11_03"); //Ktoœ siê tam czai!
	AI_wait(self, 0.5);		
	AI_Output (other, self, "DIA_Scorpio_AfterDig_15_04"); //Kto to do cholery?!
	B_LogEntry(CH1_Rbl_Ore, "Ktoœ nas zaskoczy³ po wykopaniu rudy...");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Scorpio_AfterDigEnd (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 12;
	condition		= DIA_Scorpio_AfterDigEnd_Condition;
	information		= DIA_Scorpio_AfterDigEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Scorpio_AfterDigEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))&&(scorpio_traitor)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_AfterDigEnd_Info()
{
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_01"); //Mieliœmy cholernego farta, ¿e ¿yjemy.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_02"); //Kto to by³?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_03"); //To by³a sama œmieræ, piracie.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_04"); //To dlaczego nadal ¿yjemy?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_05"); //Pewnie myœla³, ¿e bestia nas wykoñczy.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_06"); //Opowiedz mi o nim coœ wiêcej.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_07"); //Nazywa siê Hrabia. Lub raczej tak chce, ¿eby na niego mówiono.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_08"); //Nikt nie wie, sk¹d wzi¹³ siê w Kolonii. Niektórzy twierdz¹, ¿e by³ tam na d³ugo przed barier¹ i nawet sam¹ Koloni¹.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_09"); //Szkoli³em akurat nowych rekrutów, kiedy po raz pierwszy stan¹³ przed bram¹.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_10"); //Pamiêtam, jak spojrza³ na Thorusa, a ten bez s³owa zszed³ mu z drogi.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_11"); //Stra¿nicy przy bramie zamku okazali siê wiêkszymi idiotami i wyci¹gnêli miecze.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_12"); //Padli martwi, zanim zrozumieli, co ich zabi³o.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_13"); //Nie wiem sk¹d, ale Hrabia i Kruk dobrze siê znaj¹. Widzia³em to w oczach magnata.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_14"); //Kruk wygl¹da³, jakby czeka³ na przyjœcie Hrabiego.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_15"); //Razem poszli do Gomeza i od tej pory Hrabia wykonuje brudne zlecenia magnatów.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_16"); //Jestem jednak pewien, ¿e to tylko przykrywka.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_17"); //Hrabia i Kruk... Oni coœ ukrywaj¹. 
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_18"); //Hrabia czêsto znika³ na ca³e dni.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_19"); //Gomez kilka razy wysy³a³ za nim cienie, ale ¿aden z nich nie wróci³.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_20"); //Mimo, ¿e Gomez nie ufa³ Hrabiemu, Kruk go przekona³, ¿e to potê¿ny i przydatny sojusznik.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_21"); //Od tamtego czasu Hrabia by³ pos³añcem œmierci Gomeza. Wykonywa³ najtrudniejsze zlecenia i nigdy nie zawiód³.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_22"); //A¿ do teraz.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_23"); //W¹tpiê. Nie zostawi³ nas przy ¿yciu bez powodu.
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_24"); //Ale wiem jedno. Nie ruszê siê ju¿ z obozu na krok!
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_25"); //Mam gdzieœ te cholerne bry³ki. ¯ycie jest dla mnie cenniejsze.
	AI_Output (other, self, "DIA_Scorpio_AfterDigEnd_15_26"); //A co z rud¹ Gomeza?
	AI_Output (self, other, "DIA_Scorpio_AfterDigEnd_11_27"); //Skoro Hrabia j¹ zabra³, to ja na Twoim miejscu bym o niej zapomnia³.

	if (hrabia_log == FALSE)
	{
		hrabia_log = TRUE;
		Log_CreateTopic	(CH1_Rbl_Hrabia, LOG_MISSION);
		Log_SetTopicStatus	(CH1_Rbl_Hrabia, LOG_RUNNING);
	};
   
	B_LogEntry(CH1_Rbl_Hrabia, "Skorpion zdradzi³ mi, kim by³ nieznajomy w zbroi magnatów, który ograbi³ mnie z uczciwie skradzionej rudy. Nazywa siê Hrabia i podobno zna siê dobrze z Krukiem. Do tego jest kimœ od zadañ specjalnych w Starym Obozie. Mam z nim rachunki do wyrównania...");
	Npc_ExchangeRoutine(self, "OR");		

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_GRD_205_SCORPIO_Stew (C_INFO)
{
	npc				= GRD_205_SCORPIO;
	nr				= 12;
	condition		= DIA_GRD_205_SCORPIO_Stew_Condition;
	information		= DIA_GRD_205_SCORPIO_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie gulasz Snafa."; 
};

FUNC INT DIA_GRD_205_SCORPIO_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_205_SCORPIO_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_GRD_205_SCORPIO_Stew_15_01"); //Mam dla ciebie gulasz Snafa.
	AI_Output (self, other, "DIA_GRD_205_SCORPIO_Stew_11_02"); //Gulasz Snafa? Na sam¹ myœl dostajê rozwolnienia. Daj to paskudztwo.
	AI_Output (other, self, "DIA_GRD_205_SCORPIO_Stew_15_03"); //Tylko poczekaj z jedzeniem, a¿ odejdê.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Skorpion narzeka³ na gulasz, ale jakoœ upcha³em mu porcjê."); 
};
