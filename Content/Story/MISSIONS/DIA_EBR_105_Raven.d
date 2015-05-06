// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Kim jesteœ?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Nazywam siê Kruk. Jestem praw¹ rêk¹ Gomeza. 
	AI_Output (self, other,"DIA_Raven_Who_10_02"); //Ka¿dy, kto chce siê spotkaæ z szefem, musi najpierw porozmawiaæ ze mn¹.
};

// **************************************

instance DIA_Raven_Wait (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 2;
	condition	= DIA_Raven_Wait_Condition;
	information	= DIA_Raven_Wait_Info;
	permanent		= 0;
	important		= 1;
	description	= "";
};                       

FUNC int DIA_Raven_Wait_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Who))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Wait_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other,"DIA_Raven_Wait_10_01"); //Jeszcze z Tob¹ nie skoñczy³em.
	AI_GotoNpc(other,self);
	AI_Output (other, self,"DIA_Raven_Wait_15_02"); //Ale mo¿e ja nie mam ochoty na dalsz¹ rozmowê.
	AI_Output (self, other,"DIA_Raven_Wait_10_03"); //Akurat to, ch³opcze jest ma³o wa¿ne.
	AI_Output (self, other,"DIA_Raven_Wait_10_04"); //Tym razem nie obijê Ci pyska za bezczelnoœæ.
	AI_Output (other, self,"DIA_Raven_Wait_15_05"); //Zbytek ³aski.
	AI_Output (self, other,"DIA_Raven_Wait_10_06"); //Szukam kogoœ wœcibskiego i zaradnego, a Ty na kogoœ takiego wygl¹dasz.
	AI_Output (other, self,"DIA_Raven_Wait_15_07"); //Nie jestem zainteresowany.
	AI_Output (self, other,"DIA_Raven_Wait_10_08"); //Wyt³umaczê to inaczej...
	
   AI_DrawWeapon (self);
	B_StopProcessInfos(self);
	B_StartAfterDialogFight(self, other, false);
};

// **************************************

var int raven_wait;

instance DIA_Raven_After (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 3;
	condition	= DIA_Raven_After_Condition;
	information	= DIA_Raven_After_Info;
	permanent		= 0;
	important		= 1;
	description	= "";
};                       

FUNC int DIA_Raven_After_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Wait))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_After_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Raven_After_10_01"); //Dotar³o w koñcu do Ciebie, ¿e ze mn¹ nie ma ¿artów?
	AI_Output (other, self,"DIA_Raven_After_15_02"); //Skoro musisz, mów o co chodzi.
	AI_Output (self, other,"DIA_Raven_After_10_03"); //Tak jest du¿o lepiej i nie boli, prawda?
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"DIA_Raven_After_10_04"); //S³uchaj uwa¿nie. Dostarczysz coœ ode mnie komuœ, kto na to czeka. Znajdziesz go na Placu Wymian.
	AI_Output (self, other,"DIA_Raven_After_10_05"); //I ¿adnych pytañ. Idziesz, wracasz, zachowujesz ¿ycie. Skrewisz - umrzesz.
	AI_Output (self, other,"DIA_Raven_After_10_06"); //Jasne?
	AI_PlayAni(other,"T_YES");
   Create_and_give(Raven_bottle, 1);
	AI_Output (self, other,"DIA_Raven_After_10_07"); //WeŸ tê butelkê, tylko jej nie zgub!
	AI_Output (self, other,"DIA_Raven_After_10_08"); //Na co czekasz? Masz na to jeden dzieñ!
	raven_wait = B_SetDayTolerance()+1;
	Log_CreateTopic(CH2_RBL_Lighthouse, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Lighthouse, "Pozna³em prawdziwe oblicze Kruka - kawa³ z niego skurwiela. Nie mam wyboru, muszê dostarczyæ tê butelkê komuœ na Placu Wymian. Mam na to jeden dzieñ. Swoj¹ drog¹ ciekawe co w tej butelce jest?");
   
   wld_insertnpc(Grd_4126_Kraken, "OW_PATH_1_16_8");
};

instance DIA_Raven_Letter (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 4;
	condition		= DIA_Raven_Letter_Condition;
	information		= DIA_Raven_Letter_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sprawa z przesy³k¹ zakoñczona.";
};                       

FUNC int DIA_Raven_Letter_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_KRAKEN_Raven))||(raven_list)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Letter_Info()
{
	AI_Output (other, self,"DIA_Raven_Letter_15_01"); //Sprawa z przesy³k¹ zakoñczona.

	if (raven_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Raven_Letter_10_02"); //Zagl¹da³eœ do butelki?
      
		if (raven_list)
		{
			AI_Output (other, self,"DIA_Raven_Letter_15_03"); //Nie... Ja...
			AI_Output (self, other,"DIA_Raven_Letter_10_04"); //Mo¿e kolejne lanie nauczy Ciê, ¿e nie czyta siê cudzej korespondencji!
			Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_FAILED);
			B_LogEntry(CH2_RBL_Lighthouse, "Ten Kruk to straszne bydlê. Nie chcê mieæ z nim nic wspólnego.");
			AI_DrawWeapon(self);
			B_StopProcessInfos(self); 
			B_StartAfterDialogFight(self,other,false);
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_Letter_15_05"); //Nie jestem idiot¹. Butelkê dosta³ Kraken w idealnym stanie.
			AI_Output (self, other,"DIA_Raven_Letter_10_06"); //Tak, wiem. Zapamiêtam Twoj¹ twarz, mo¿e kiedyœ jeszcze siê przydasz.
			Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_SUCCESS);
			B_LogEntry(CH2_RBL_Lighthouse, "Zadanie zakoñczone. Mam dziwne przeczucie, ¿e powinienem trzymaæ siê od Kruka jak najdalej.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Raven_Letter_10_07"); //SpóŸni³eœ siê gnoju!
		AI_Output (self, other,"DIA_Raven_Letter_10_08"); //Mo¿e kolejne lanie czegoœ Ciê nauczy...
		Log_SetTopicStatus(CH2_RBL_Lighthouse, LOG_FAILED);
		B_LogEntry(CH2_RBL_Lighthouse, "Ten Kruk to straszne bydlê. Nie chcê mieæ z nim nic wspólnego.");
		AI_DrawWeapon (self);
		B_StopProcessInfos(self); 
		B_StartAfterDialogFight(self,other,false);
	};
};

//********Hrabia + mag + orle gniazdo*********************

var int raven_ok;
var int Hrabia_RavenTrap;
instance DIA_Raven_Mag (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 5;
	condition		= DIA_Raven_Mag_Condition;
	information		= DIA_Raven_Mag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dosz³y mnie s³uchy, ¿e szukasz maga.";
};                       

FUNC int DIA_Raven_Mag_Condition()
{
	return Hrabia_RavenTrap;
};

FUNC VOID DIA_Raven_Mag_Info()
{
	AI_Output (other, self,"DIA_Raven_Mag_15_01"); //Dosz³y mnie s³uchy, ¿e szukasz maga.

	if (Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) <= 3) && (hero.guild == GIL_MAG)
	{
		AI_Output (self, other,"DIA_Raven_Mag_10_02"); //Nie szukam adepta, tylko prawdziwego maga. Wróæ jak czegoœ siê nauczysz.
		B_LogEntry(CH1_Rbl_Hrabia, "Muszê bardziej zg³êbiæ magiczn¹ wiedzê. Kruk potrzebuje doœwiadczonego maga.");
	}
	else
	{
		raven_ok = TRUE;
		AI_Output (self, other,"DIA_Raven_Mag_10_03"); //Myœlê, ¿e sprostasz moim wymaganiom.
		AI_Output (self, other,"DIA_Raven_Mag_10_04"); //Sprawa jest prosta. Zabiorê Ciê w pewne miejsce, a Ty wymówisz s³owa inkantacji. 
		AI_Output (other, self,"DIA_Raven_Mag_15_05"); //P³atne z góry.
		AI_Output (self, other,"DIA_Raven_Mag_10_06"); //Niech bêdzie, wróæ do mnie, jak bêdziesz gotów.
		B_LogEntry(CH1_Rbl_Hrabia, "Sprawa za³atwiona. Mam wróciæ do Kruka jak bêdê gotów.");
	};
};

//****************************

instance DIA_Raven_MagAgain (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 6;
	condition		= DIA_Raven_MagAgain_Condition;
	information		= DIA_Raven_MagAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nadal szukasz maga?";
};                       

FUNC int DIA_Raven_MagAgain_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Mag))&&(raven_ok == FALSE )&&(Npc_GetAivar(hero,TALENT_MAGIC_CIRCLE) >= 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_MagAgain_Info()
{
	raven_ok = TRUE; 
	AI_Output (other, self,"DIA_Raven_MagAgain_15_01"); //Nadal szukasz maga?
	AI_Output (self, other,"DIA_Raven_MagAgain_10_02"); //Myœlê, ¿e sprostasz moim wymaganiom.
	AI_Output (self, other,"DIA_Raven_MagAgain_10_03"); //Sprawa jest prosta. Zabiorê Ciê w pewno miejsce, a Ty wymówisz s³owa inkantacji. 
	AI_Output (other, self,"DIA_Raven_MagAgain_15_04"); //P³atne z góry.
	AI_Output (self, other,"DIA_Raven_MagAgain_10_05"); //Niech bêdzie, wróæ do mnie, jak bêdziesz gotów.
	B_LogEntry(CH1_Rbl_Hrabia, "Sprawa za³atwiona. Mam wróciæ do Kruka, jak bêdê gotów.");
};

//****************************

instance DIA_Raven_MagAgainReadyReady (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 6;
	condition		= DIA_Raven_MagAgainReady_Condition;
	information		= DIA_Raven_MagAgainReady_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jestem gotów.";
};                       

FUNC int DIA_Raven_MagAgainReady_Condition()
{
	if ((Npc_KnowsInfo (hero,DIA_Raven_MagAgain))||(Npc_KnowsInfo (hero,DIA_Raven_Mag)))&&(raven_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_MagAgainReady_Info()
{
	raven_ok = TRUE; 
	AI_Output (other, self,"DIA_Raven_MagAgainReady_15_01"); //Jestem gotów.
	AI_Output (self, other,"DIA_Raven_MagAgainReady_10_02"); //W porz¹dku. Stój blisko mnie...

	/****************************
Ork niech Kruk teleportuje Dicka i siebie do Orlego Gniazda, daj tu te¿ demona na dziedziniec tam gdzie siê pojawi¹. Oczywiœcie demona ma ich zaatakowaæ - stwórz tak¹ mocniejsz¹ wersjê lorda demona RavenDemonLord.
Ork zmieñ mu te¿ w tym momencie pancerz na ten kruka z G2 NK
****************************/

	B_LogEntry(CH1_Rbl_Hrabia, "No to czeka mnie ostra jazda...");
   Raven_teleport_to_EN = true;
   Wld_InsertNpc(RavenDemonLord, "NC_EN_MAINPATH_03");
};

//****************************
// TODO: Porz¹dny cinematic znacznie ciekawszy, napewno lepiej sie sprawdzi
//****************************
instance DIA_Raven_Castle (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 7;
	condition		= DIA_Raven_Castle_Condition;
	information		= DIA_Raven_Castle_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_Castle_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Raven_MagAgainReadyReady))&&(Npc_GetDistToWP(self,"NC_EN_MAINPATH_05") < 2500)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Castle_Info()
{
	B_FullStop (hero);
   B_FullStop (hrabia);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Raven_Castle_10_01"); //Nie obawiaj siê demona. To mój...
	AI_TurnToNpc(self, RavenDemonLord);
	AI_Output (self, other,"DIA_Raven_Castle_10_02"); //Co do cholery?!
	AI_Output (other, self,"DIA_Raven_Castle_15_03"); //Musimy go zabiæ!
	B_StopProcessInfos(self);
   
   self.flags = NPC_FLAG_IMMORTAL;
   AI_GotoWP(self, "NC_EN_MAINPATH_04");
   B_ExchangeRoutine(hrabia, "WaitInEN");
   AI_Teleport(hrabia, "NC_EN_TAVERN_03");
};

//****************************

instance DIA_Raven_Castle1 (C_INFO)
{
	npc		= Ebr_105_Raven;
	nr		= 7;
	condition		= DIA_Raven_Castle1_Condition;
	information		= DIA_Raven_Castle1_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_Castle1_Condition()
{
	var C_NPC demi; demi = Hlp_GetNpc(RavenDemonLord);

	if (Npc_KnowsInfo (hero, DIA_Raven_Castle))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_IsDead(demi))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Castle1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Raven_Castle1_10_01"); //Nie rozumiem, jak to siê mog³o staæ.
	AI_Output (other, self,"DIA_Raven_Castle1_15_02"); //Takie rzeczy siê zdarzaj¹. Demony to niestabilne istoty...
	AI_Output (self, other,"DIA_Raven_Castle1_10_03"); //Nie o tym mówi³em. Wydaje mi siê, ¿e jednak Ÿle Ciê oceni³em.
	AI_Output (other, self,"DIA_Raven_Castle1_15_04"); //Tak?
	AI_Output (self, other,"DIA_Raven_Castle1_10_05"); //¯eby przygotowaæ tak¹ zasadzkê trzeba mieæ jaja.
	AI_Output (other, self,"DIA_Raven_Castle1_15_06"); //Sk¹d...
	AI_Output (self, other,"DIA_Raven_Castle1_10_07"); //Powiedzmy, ¿e Beliar szepcze mi do ucha. Zacznijmy od tego ¿ywotnego sukinsyna.
	AI_TurnToNpc(self, hrabia);
	AI_Output (self, other,"DIA_Raven_Castle1_10_08"); //WyjdŸ z ukrycia, przyjacielu!
	B_StopProcessInfos	(self);

	/***********************

Niech hrabia wyjdzie z ukrycia gdzieœ na œrodek dziedziñca...

**********************/
   AI_Teleport(hrabia, "NC_EN_MAINPATH_04");
   B_ExchangeRoutine(hrabia, "death");
   AI_SetWalkmode (hrabia, NPC_RUN); 
	AI_GotoWP(hrabia, "NIA_INSPECT");
};

//****************************

instance DIA_Raven_CastleCount (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition		= DIA_Raven_CastleCount_Condition;
	information		= DIA_Raven_CastleCount_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleCount_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_Castle1)) && (Npc_GetDistToWP(hrabia, "NIA_INSPECT") < 500) && (Npc_GetDistToWP(self, "NIA_INSPECT") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleCount_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, hrabia);

	AI_Output (self, other,"DIA_Raven_CastleCount_10_01"); //¯ywotne z Ciebie bydlê. Ale z tym nie wygrasz.
	AI_Output (self, other,"DIA_Raven_CastleCount_10_02"); //Wzywam Ciê BELIARZE. Uka¿ temu g³upcowi SW¥ potêgê!
	
   B_StopProcessInfos(self);
	Snd_Play ("FoundRiddler");	
	Wld_PlayEffect("spellFX_Thunderstorm", self, hrabia, 1, 0, DAM_MAGIC, FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, hrabia, 1, 0, DAM_MAGIC, FALSE);
	AI_PlayAni(hrabia, "T_PSI_VICTIM");
	Npc_ChangeAttribute(hrabia, ATR_HITPOINTS, -hrabia.attribute[ATR_HITPOINTS_MAX]);
   self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};

//****************************

instance DIA_Raven_CastleFight (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 9;
	condition		= DIA_Raven_CastleFight_Condition;
	information		= DIA_Raven_CastleFight_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleFight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_CastleCount))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_IsDead(hrabia))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleFight_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);

	AI_Output (self, other,"DIA_Raven_CastleFight_10_01"); //Teraz Twoja kolej. Zobaczmy coœ wart...
	AI_DrawWeapon (self);
	AI_GotoNpc(self, other);
	B_LogEntry(CH1_Rbl_Hrabia, "Hrabia nie ¿yje. Muszê sam stawiæ czo³a Krukowi!");
   B_ClearIMMORTAL(Ebr_105_Raven);
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, true);
   Raven_fights_Rick = true;
};

//****************************

instance DIA_Raven_CastleFightAfter (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 10;
	condition		= DIA_Raven_CastleFightAfter_Condition;
	information		= DIA_Raven_CastleFightAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};                       

FUNC int DIA_Raven_CastleFightAfter_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Raven_CastleFight))&&(!Raven_fights_Rick)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_CastleFightAfter_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Raven_CastleFightAfter_10_01"); //Zaskoczy³eœ mnie...
	AI_Output (other, self,"DIA_Raven_CastleFightAfter_15_02"); //Daj mi jeszcze chwilê. Wyprujê Ci flaki i nic Ciê ju¿ nie zaskoczy.
	AI_Output (self, other,"DIA_Raven_CastleFightAfter_10_03"); //Wola³bym nie. Mam inne plany. Mam nadziejê, ¿e ju¿ siê nie spotkamy.
	AI_Output (other, self,"DIA_Raven_CastleFightAfter_15_04"); //Tchórz! Nigdy wiêcej nie wchodŸ mi w drogê!
	Log_SetTopicStatus(CH1_Rbl_Hrabia, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hrabia, "Hrabia skoñczy³ tak jak ¿y³, czyli z mieczem w rêku. Mo¿e to i dobrze... A Kruk najzwyczajniej w œwiecie zwia³. Mam nadziejê, ¿e ju¿ go nie spotkam.");
	/********************
Ork Kruk ma znikn¹æ, nie poartów do SO tylko gdzieœ gdzie gracze nie maj¹ dostêpu. Mo¿e ten placyk nad Placem wymian sk¹d Bezia wrzucili do Kolonii.

*********************/
   Raven_teleport_to_hidden = true;
   
   Npc_ExchangeRoutine(self,"Hidden");
   B_StopProcessInfos(self); 
};
