func void PACHO_OPEN_CHEST_SCRIPT()
{
	Mis_Pacho_ChestOpened=TRUE;	
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pacho_Exit (C_INFO)
{
	npc			= GRD_224_PACHO;
	nr			= 999;
	condition	= DIA_Pacho_Exit_Condition;
	information	= DIA_Pacho_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pacho_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pacho_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Pacho_Hello (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 1;
	condition		= DIA_Pacho_Hello_Condition;
	information		= DIA_Pacho_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 250)//A wlasnie ze powinno byc shergar, inaczej zagaduje do nas spod pó³ki skalnej
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Hello_Info()
{
	AI_TurnToNpc (Skorpio,other);
	AI_TurnToNpc (self,other);		
	Ai_Wait (self,1);//10sek WTF?	
	AI_Output (other, self, "DIA_Pacho_Hello_15_01"); //Co siê tak gapisz?
	AI_Output (self, other, "DIA_Pacho_Hello_11_02"); //Ekkhhhrrr... Khhhrrrr...

	AI_Output (other, self, "DIA_Pacho_Hello_15_03"); //Nie udawaj idioty. Je¿eli próbujesz mnie sprowokowaæ, to œwietnie Ci idzie...
	//AI_DrawWeapon (hero);
	B_ExchangeRoutine(Skorpio, "FOLLOW");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_Mixture (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 2;
	condition		= DIA_Pacho_Mixture_Condition;
	information		= DIA_Pacho_Mixture_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Mixture_Condition()
{
	if (NPC_HasItems(hero,aloes_mixture)>=1)&&(aloes_find==2)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Mixture_Info()
{
	B_GiveXP(500);
	B_GiveInvItems (other, self, aloes_mixture, 1);
   
	AI_Output (other, self, "DIA_Pacho_Mixture_15_01"); //Esencja strasznie cuchnie, ale powinna pomóc.
	AI_Output (other, self, "DIA_Pacho_Mixture_15_02"); //Jesteœ gotów?
   
	if (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_TurnToNpc (self, other);
   
	AI_Output (other, self, "DIA_Pacho_Mixture_15_03"); //To do dna. 
   
	AI_Wait(self,3);
	AI_UseItem (self,aloes_mixture);
	AI_Wait(self,1);	
	
	AI_PlayAni		(self,	"T_PSI_VICTIM");	
	AI_Output (other, self, "DIA_Pacho_Mixture_15_04"); //Wszystko w porz¹dku?
	AI_Output (self, other, "DIA_Pacho_Mixture_11_05"); //Khhrr... Ehmmm... Ta.
	AI_Output (self, other, "DIA_Pacho_Mixture_11_06"); //Ja... Mówiê....!
	AI_Output (self, other, "DIA_Pacho_Mixture_11_07"); //Dziêki przyjacielu! Wskoczê za Tob¹ w ka¿dy ogieñ!
	AI_Output (other, self, "DIA_Pacho_Mixture_15_08"); //Nigdzie nie musisz wskakiwaæ, wystarczy, ¿e oka¿esz sw¹ wdziêcznoœæ...
	AI_Output (self, other, "DIA_Pacho_Mixture_11_09"); //WeŸ tê rudê, nale¿y Ci siê jak jasna cholera.
   
	CreateInvItems (self,ItMiNugget,100);//ruda
	B_GiveInvItems (self, other, ItMiNugget, 100);
	Log_SetTopicStatus	(CH1_Rbl_Plant, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_Plant, "Mikstura zadzia³a³a i Pacho odzyska³ g³os. Muszê przyznaæ, ¿e jego hojnoœæ mnie zadziwi³a.");	
	B_StopProcessInfos(self);
	self.voice = 10;//make pacho have voice back ;-)
};

INSTANCE DIA_Pacho_GoOut (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 3;
	condition		= DIA_Pacho_GoOut_Condition;
	information		= DIA_Pacho_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Scorpio_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_GoOut_Info()
{
	pacho_trust = TRUE;
	B_GiveXP(200);
	B_FullStop (hero);
	AI_GotoNpc(self,other);
   
	AI_Output (self, other, "DIA_Pacho_GoOut_11_01"); //Jeszcze raz dziêkujê za wszystko. 
	AI_Output (self, other, "DIA_Pacho_GoOut_11_02"); //Kiedyœ Ci siê odwdziêczê, przyjacielu.
	AI_Output (other, self, "DIA_Pacho_GoOut_15_03"); //Trzymam Ciê za s³owo.
	AI_Output (self, other, "DIA_Pacho_GoOut_11_04"); //WeŸ tê miksturê. Mi siê ju¿ nie przyda.
	
   CreateInvItems (self,ItFo_Potion_Health_Perma_03,1);
	B_GiveInvItems (self, other, ItFo_Potion_Health_Perma_03, 1);
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_Map (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 4;
	condition		= DIA_Pacho_Map_Condition;
	information		= DIA_Pacho_Map_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam do Ciebie pytanie."; 
};

FUNC INT DIA_Pacho_Map_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Scorpio_Map))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Map_Info()
{
	AI_Output (other, self, "DIA_Pacho_Map_15_01"); //Mam do Ciebie pytanie.
	AI_Output (self, other, "DIA_Pacho_Map_11_02"); //Pytaj przyjacielu.
	AI_Output (other, self, "DIA_Pacho_Map_15_03"); //Skorpion potrzebowa³ mapê Kolonii. Uda³o mi siê jedn¹ dla niego zdobyæ. Nie chcia³ jednak powiedzieæ nic wiêcej.
	AI_Output (self, other, "DIA_Pacho_Map_11_04"); //Ka¿dy ma swoje tajemnice...
	AI_Output (other, self, "DIA_Pacho_Map_15_05"); //Co chcesz przez to powiedzieæ?
	AI_Output (self, other, "DIA_Pacho_Map_11_06"); //Ano to, ¿e o niektórych sekretach lepiej nie wiedzieæ, bo d³u¿ej siê wtedy ¿yje.
	AI_Output (other, self, "DIA_Pacho_Map_15_07"); //Rozumiem, ¿e to nie moja sprawa.
	AI_Output (self, other, "DIA_Pacho_Map_11_08"); //I tak, i nie.
	AI_Output (other, self, "DIA_Pacho_Map_15_09"); //Kontynuuj.
	AI_Output (self, other, "DIA_Pacho_Map_11_10"); //Lepiej, ¿eby to co teraz powiem, zosta³o miêdzy nami.
	
   AI_PlayAni(other,"T_YES");
	
   AI_Output (self, other, "DIA_Pacho_Map_11_11"); //Skorpion i ja mamy pewien uk³ad, który od jakiegoœ czasu sta³ siê niewygodny dla nas obu.
	AI_Output (self, other, "DIA_Pacho_Map_11_12"); //Dziêki Tobie odzyska³em g³os... Potraktuj to co powiem jako wyraz wdziêcznoœci.
	AI_Output (self, other, "DIA_Pacho_Map_11_13"); //Ja i Skorpion ukradliœmy Gomezowi sporo z jego zapasów rudy.
	AI_Output (other, self, "DIA_Pacho_Map_15_14"); //¯e co?! I wy jeszcze ¿yjecie?
	AI_Output (self, other, "DIA_Pacho_Map_11_15"); //To by³a dobrze zaplanowana akcja.
	AI_Output (self, other, "DIA_Pacho_Map_11_16"); //Skorpion mia³ dostêp do zamku i wewnêtrznego pierœcienia. Ja by³em zwiadowc¹, znam ludzi, koloniê i ekhm... odpowiednie miejsca, ¿eby siê ukryæ.
	AI_Output (self, other, "DIA_Pacho_Map_11_17"); //Skorpion wynosi³ rudê, a ja j¹ ukrywa³em. 
	AI_Output (self, other, "DIA_Pacho_Map_11_18"); //Robiliœmy to etapami, tak aby magnaci siê nie zorientowali.
	AI_Output (self, other, "DIA_Pacho_Map_11_19"); //Te szumowiny zostawi³y sobie spory zapas na czarn¹ godzinê.
	AI_Output (self, other, "DIA_Pacho_Map_11_20"); //Niestety Skorpion sta³ siê zbyt pazerny. Ostatnim razem prócz rudy przyniós³ jeszcze coœ cennego, co nale¿a³o do Gomeza.
	AI_Output (self, other, "DIA_Pacho_Map_11_21"); //Tym razem mieliœmy pecha. Byliœmy ju¿ za bram¹, kiedy rozleg³ siê alarm. W ostatniej chwili zaszyliœmy siê w lesie. 
	AI_Output (self, other, "DIA_Pacho_Map_11_22"); //Biegliœmy dopóki nie mieliœmy pewnoœci, ¿e stra¿nicy zgubili nasz trop.
	AI_Output (self, other, "DIA_Pacho_Map_11_23"); //Skorpion wróci³, ¿eby sprawdziæ czy nikt ju¿ za nami nie pod¹¿a.
	AI_Output (self, other, "DIA_Pacho_Map_11_24"); //Ja wykorzysta³em chwilê, ¿eby ukryæ ostatni ³up.
	AI_Output (self, other, "DIA_Pacho_Map_11_25"); //Miejsce wybra³em starannie. Nikt siê tam nie zapuszcza.
	AI_Output (self, other, "DIA_Pacho_Map_11_26"); //Niestety mia³em pecha. Koñczy³em w³aœnie zakopywaæ skarb, kiedy okaza³o siê, ¿e nie by³em sam.
	AI_Output (self, other, "DIA_Pacho_Map_11_27"); //Nie wiem, co to za bestia by³a. Chlasnê³a mnie przez pierœ, zanim zorientowa³em siê, co siê dzieje.
	AI_Output (self, other, "DIA_Pacho_Map_11_28"); //Gdyby nie pancerz, przep³aci³bym to ¿yciem.
	AI_Output (self, other, "DIA_Pacho_Map_11_29"); //Potwór pochlasta³ mi szyjê. Na oœlep siekn¹³em mieczem i rzuci³em siê do ucieczki.
	AI_Output (self, other, "DIA_Pacho_Map_11_30"); //Nie wiem dlaczego bestia mnie nie wykoñczy³a...
	AI_Output (self, other, "DIA_Pacho_Map_11_31"); //Straci³em przytomnoœæ gdzieœ w lesie.
	AI_Output (self, other, "DIA_Pacho_Map_11_32"); //Tam znalaz³ mnie Skorpion. Zatamowa³ krwotok i ukrywaliœmy siê, dopóki nas nie znalaz³eœ.
	AI_Output (other, self, "DIA_Pacho_Map_15_33"); //Ale co ma z tym wspólnego mapa Kolonii?
	AI_Output (self, other, "DIA_Pacho_Map_11_34"); //Powiedzia³em Skorpionowi, ¿e ju¿ tam nie wrócê.
	AI_Output (other, self, "DIA_Pacho_Map_15_35"); //Gdzie?
	AI_Output (self, other, "DIA_Pacho_Map_11_36"); //Tam gdzie zakopa³em ostatni, najwiêkszy ³up.
	AI_Output (self, other, "DIA_Pacho_Map_11_37"); //Opowiedzia³em mu o bestii, ale siê upar³. Ruda ca³kiem mu przes³oni³a zdrowy rozs¹dek.
	AI_Output (self, other, "DIA_Pacho_Map_11_38"); //Próbowa³em wyt³umaczyæ, gdzie to jest, ale to nie takie proste.
	AI_Output (self, other, "DIA_Pacho_Map_11_39"); //Powiedzia³em, ¿e wska¿ê mu to miejsce na mapie.
	AI_Output (other, self, "DIA_Pacho_Map_15_40"); //Rozumiem. A jaka w tym moja rola?
	AI_Output (self, other, "DIA_Pacho_Map_11_41"); //To by³a pokaŸna sumka. Naprawdê okr¹g³a. Do tego ta b³yskotka Gomeza...
	AI_Output (other, self, "DIA_Pacho_Map_15_42"); //Zaczynam rozumieæ. Nie zrezygnowa³eœ z rudy, ale obawiasz siê bestii.
	AI_Output (self, other, "DIA_Pacho_Map_11_43"); //Dok³adnie. Skorpionowi ju¿... nie ufam. Ruda nim zaw³adnê³a. 
	AI_Output (self, other, "DIA_Pacho_Map_11_44"); //Gdybym z nim poszed³, to pewnie zosta³bym tam na wieki z no¿em w plecach.
	AI_Output (self, other, "DIA_Pacho_Map_11_45"); //Ty... wzbudzasz zaufanie. A przede wszystkim pomog³eœ, kiedy tego najbardziej potrzebowa³em.
	AI_Output (self, other, "DIA_Pacho_Map_11_46"); //Dlaczego nie mielibyœmy na tym skorzystaæ obaj?
	AI_Output (self, other, "DIA_Pacho_Map_11_47"); //Podzielimy siê równo po po³owie, do tego mo¿esz wzi¹æ b³yskotkê Gomeza.
	AI_Output (other, self, "DIA_Pacho_Map_15_48"); //Jestem piratem. Sk¹d pewnoœæ, ¿e nie poder¿nê Ci gard³a, kiedy ju¿ bêdziemy na miejscu?
	AI_Output (self, other, "DIA_Pacho_Map_11_49"); //Znam siê na ludziach. Co Ty na to?

	Info_ClearChoices (DIA_Pacho_Map);
	Info_AddChoice (DIA_Pacho_Map, "¯yje siê tylko raz.", DIA_Pacho_Map_Yes);
	Info_AddChoice (DIA_Pacho_Map, "Wolê nie ryzykowaæ.", DIA_Pacho_Map_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Pacho_Map_Yes()
{
	pacho_ore = TRUE;
   
	AI_Output (other, self, "DIA_Pacho_Map_Yes_15_01"); //¯yje siê tylko raz. Niech bêdzie.
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_02"); //Nie bêdziesz ¿a³owa³!
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_03"); //Wyruszymy wieczorem, pod os³on¹ nocy nie bêdziemy tak siê rzucaæ w oczy.
	AI_Output (self, other, "DIA_Pacho_Map_Yes_11_04"); //Wróæ jak bêdziesz gotów.	
	
   Log_CreateTopic(CH1_Rbl_Ore, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_Ore, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_Ore, "Zgodzi³em siê pomóc Pacho w odkopaniu rudy, któr¹ wraz ze Skorpionem ukradli Gomezowi. To mo¿e byæ niebezpieczne przedsiêwziêcie, ale czasami trzeba zaryzykowaæ, ¿eby siê ob³owiæ. Wyruszymy, gdy zapadnie zmrok.");
	B_StopProcessInfos(self);
};

// ------------------No----------------

FUNC VOID DIA_Pacho_Map_No()
{
	AI_Output (other, self, "DIA_Pacho_Map_No_15_01"); //Wolê nie ryzykowaæ. RadŸ sobie sam, ja nie potrzebujê tej rudy.
	AI_Output (self, other, "DIA_Pacho_Map_No_11_02"); //Twoja strata. Jednak pomyli³em siê co do Ciebie...
	B_StopProcessInfos(self);
};

var int pacho_time_check;

INSTANCE DIA_Pacho_Journey (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 5;
	condition		= DIA_Pacho_Journey_Condition;
	information		= DIA_Pacho_Journey_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jestem gotów."; 
};

FUNC INT DIA_Pacho_Journey_Condition()
{
	if (pacho_ore == TRUE)&&(pacho_time_check == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Journey_Info()
{
	AI_Output (other, self, "DIA_Pacho_Journey_15_01"); //Jestem gotów.
   
	if (Wld_IsTime (21,00,04,00))
	{
		pacho_time_check = TRUE;
      
		AI_Output (self, other, "DIA_Pacho_Journey_11_02"); //Œwietnie. Ruszajmy wiêc.
		AI_Output (self, other, "DIA_Pacho_Journey_11_03"); //Tylko pamiêtaj, ¿e nie powinniœmy rzucaæ siê w oczy.
		
      if (scorpio_traitor == TRUE)
		{
			AI_Output (other, self, "DIA_Pacho_Journey_15_04"); //Oczywiœcie.
			AI_Quicklook(self, Skorpio);
			AI_TurnToNpc(self, Skorpio);
			AI_PlayAni(self, "t_ComeOverHere");
			B_LogEntry(CH1_Rbl_Ore, "Da³em znak Skorpionowi, ¿eby za nami pod¹¿y³.");
		};
      
		B_LogEntry(CH1_Rbl_Ore, "Wyruszy³em z Pacho do miejsca, gdzie zakopa³ rudê Gomeza. Musimy zachowaæ ostro¿noœæ...");
		Party_AddNpc(self);

		Npc_ExchangeRoutine(self, "pachotreasure");
		self.flags=NPC_FLAG_FRIEND;
		B_SetPermAttitude(self,ATT_FRIENDLY);
	}
	else
	{
		AI_Output (self, other, "DIA_Pacho_Journey_11_05"); //Wyruszymy kiedy zapadnie zmrok...
	};
   
   B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_JourneyEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 6;
	condition		= DIA_Pacho_JourneyEnd_Condition;
	information		= DIA_Pacho_JourneyEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_JourneyEnd_Condition()
{
	if (pacho_time_check == TRUE)&&(Npc_GetDistToWP (self,"OW_PATH_OW_PATH_WARAN05_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_JourneyEnd_Info()
{
	B_FullStop (self);
	B_FullStop (other);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(other, self);

	AI_Output (self, other, "DIA_Pacho_JourneyEnd_11_01"); //Jesteœmy ju¿ prawie na miejscu!

	B_LogEntry(CH1_Rbl_Ore, "Dotarliœmy ju¿ prawie na miejsce. Teraz musimy tylko znaleŸæ miejsce ukrycia rudy.");
	Party_AddNpc(self);

	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_OreEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 7;
	condition		= DIA_Pacho_OreEnd_Condition;
	information		= DIA_Pacho_OreEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_OreEnd_Condition()
{
	if (pacho_time_check == TRUE)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 600 )
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_OreEnd_Info()
{
	B_GiveXP(300);

	AI_Output (self, other, "DIA_Pacho_OreEnd_11_01"); //Tak, poznajê to miejsce!
	AI_Output (self, other, "DIA_Pacho_OreEnd_11_02"); //Tutaj trzeba kopaæ...
   
	AI_PlayAni(self,"T_PLUNDER");
	
   B_LogEntry(CH1_Rbl_Ore, "Pacho pokaza³ mi miejsce, w którym zakopa³ rudê. Nie pozostaje mi nic innego jak wykopaæ te bogactwa.");
	Party_RemoveNpc(self);

	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_OreDig (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 8;
	condition		= DIA_Pacho_OreDig_Condition;
	information		= DIA_Pacho_OreDig_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_OreDig_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_OreEnd))&&(Mis_PachoSplit)&&((!C_BodyStateContains(hero, BS_INVENTORY))
   &&(!C_BodyStateContains(hero, BS_MOBINTERACT_INTERRUPT)))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_OreDig_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other, self);
   
	AI_Output (self, other, "DIA_Pacho_OreDig_11_01"); //Wykopa³eœ wszystko! Daj mi moj¹ czêœæ i uciekajmy zanim...
	B_LogEntry(CH1_Rbl_Ore, "Po wykopaniu rudy Pacho za¿¹da³ swojej czêœci.");
   
	if (scorpio_traitor == TRUE)
	{
		AI_wait(self, 0.5);	
		AI_Output (self, other, "DIA_Pacho_OreDig_11_02"); //Co on tu robi?! 
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Pacho_OreDig_11_03"); //Zdrajca!
		B_LogEntry(CH1_Rbl_Ore, "Pacho niezbyt ucieszy³ siê na widok Skorpiona.");
	}
	else
	{
		AI_TurnToNpc(self, hrabia);
		AI_wait(self, 0.5);		
		AI_Output (self, other, "DIA_Pacho_OreDig_11_04"); //Ktoœ siê tam czai!
		AI_Output (other, self, "DIA_Pacho_OreDig_15_05"); //Kto to do cholery jest?!
		B_LogEntry(CH1_Rbl_Ore, "Ktoœ nas zaskoczy³ po wykopaniu rudy...");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Pacho_AfterDigEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 9;
	condition		= DIA_Pacho_AfterDigEnd_Condition;
	information		= DIA_Pacho_AfterDigEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_AfterDigEnd_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Hrabia_Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_AfterDigEnd_Info()
{
	if (scorpio_traitor == TRUE)
	{
		AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_01"); //Cholerny zdrajca! Masz szczêœcie, ¿e ¿yjemy.
	}
	else
	{
		AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_02"); //Jednak prze¿y³eœ!
	};
   
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_03"); //Mam silny instynkt samozachowawczy.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_04"); //Kim by³ ten... z³odziej?
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_05"); //Wiem tylko, ¿e lepiej schodziæ mu z drogi.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_06"); //Nazywa siê Hrabia.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_07"); //Czasami widywa³em go, jak zapuszcza³ siê sam na tereny orków.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_08"); //Raz za nim poszed³em.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_09"); //Kiedy natrafi³em na kilkanaœcie wyr¿niêtych wargów i kilka martwych patroli orków, wróci³em.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_10"); //Za Hrabi¹ kroczy œmieræ piracie i lepiej nie wchodziæ mu w drogê.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_11"); //A co z rud¹ Gomeza?
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_12"); //Je¿eli Hrabia po³o¿y³ na niej ³apy, to lepiej o niej zapomnij. Szkoda stawiaæ ¿ycie za kilka bry³ek.
	AI_Output (other, self, "DIA_Pacho_AfterDigEnd_15_13"); //Ja tak ³atwo nie zapominam...
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_14"); //To ju¿ Twoja sprawa. Ja tam wiem swoje. Nie ruszê siê z Obozu Rebeliantów, choæby przyszed³ tu sam Œni¹cy.
	AI_Output (self, other, "DIA_Pacho_AfterDigEnd_11_15"); //Mam ju¿ doœæ rudy i ca³ej tej cholernej kolonii!

	Log_SetTopicStatus(CH1_Rbl_Ore, LOG_FAILED);	
	B_LogEntry(CH1_Rbl_Ore, "I ca³¹ cholern¹ rudê Gomeza szlag trafi³! Hrabia, kimkolwiek jest, ograbi³ mnie z uczciwie ukradzionej rudy magnatów. Nadejdzie czas gdy wyrównam rachunki...");
	
   if (hrabia_log == FALSE)
	{
		hrabia_log = TRUE;
		Log_CreateTopic	(CH1_Rbl_Hrabia, LOG_MISSION);
		Log_SetTopicStatus	(CH1_Rbl_Hrabia, LOG_RUNNING);
	};
   
	B_LogEntry(CH1_Rbl_Hrabia, "Pacho powiedzia³ mi, ¿e gnojek, który zrabowa³ rudê Gomeza to niejaki Hrabia. By³y zwiadowca Gomeza radzi³ mi nie wchodziæ mu w drogê. Ja jednak tak ³atwo nie zapominam...");
	Npc_ExchangeRoutine(self, "OR");		

	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_GRD_224_PACHO_Stew (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 12;
	condition		= DIA_GRD_224_PACHO_Stew_Condition;
	information		= DIA_GRD_224_PACHO_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcjê gulaszu."; 
};

FUNC INT DIA_GRD_224_PACHO_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other, ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_GRD_224_PACHO_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_GRD_224_PACHO_Stew_15_01"); //Mam dla Ciebie porcjê gulaszu.
	AI_Output (self, other, "DIA_GRD_224_PACHO_Stew_11_02"); //Ale¿ to cuchnie.
	AI_Output (other, self, "DIA_GRD_224_PACHO_Stew_15_03"); //Wiem, ale muszê rozdaæ wszystkie porcja.
	AI_Output (self, other, "DIA_GRD_224_PACHO_Stew_11_04"); //No dobra wezmê to paskudztwo, ale robiê to tylko dla Ciebie.
	
	B_GiveInvItems(other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Pacho zabra³ gulasz, ale tylko ze wzglêdu na mnie."); 
};

/****************************

SIDE QUEST

***************************/

INSTANCE DIA_Pacho_Hunting (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 10;
	condition		= DIA_Pacho_Hunting_Condition;
	information		= DIA_Pacho_Hunting_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pacho_Hunting_Condition()
{
	if (Kapitel>=2)&&(Npc_GetDistToNpc(self, hero) < 600)&&(Npc_KnowsInfo(hero, DIA_Pacho_GoOut))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_Hunting_Info()
{
	B_FullStop (other);
	AI_Output (self, other, "DIA_Pacho_Hunting_11_01"); //Pst! Rick!
	AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Pacho_Hunting_15_02"); //Co tak syczysz?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_03"); //PodejdŸ na chwilê.
	AI_GotoNpc(other, self);
	AI_Output (other, self, "DIA_Pacho_Hunting_15_04"); //Znowu straci³eœ mowê?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_05"); //Nawet mi o tym nie przypominaj...
	AI_Output (self, other, "DIA_Pacho_Hunting_11_06"); //Mam dla Ciebie propozycjê. Chocia¿ tak mogê Ci siê odwdziêczyæ.
	AI_Output (other, self, "DIA_Pacho_Hunting_15_07"); //O co chodzi?
	AI_Output (self, other, "DIA_Pacho_Hunting_11_08"); //Tutaj nie mo¿emy rozmawiaæ, za du¿o wœcibskich uszu.
};

//*************************************************

INSTANCE DIA_Pacho_HuntingOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 11;
	condition		= DIA_Pacho_HuntingOk_Condition;
	information		= DIA_Pacho_HuntingOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, prowadŸ."; 
};

FUNC INT DIA_Pacho_HuntingOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_Hunting))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingOk_Info()
{
	AI_Output (other, self, "DIA_Pacho_HuntingOk_15_01"); //Dobra, prowadŸ.
	AI_Output (self, other, "DIA_Pacho_HuntingOk_11_02"); //Nie po¿a³ujesz.
   
   Npc_ExchangeRoutine(self, "GuideToTalking");
	B_StopProcessInfos(self);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingBegin (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 12;
	condition		= DIA_Pacho_HuntingBegin_Condition;
	information		= DIA_Pacho_HuntingBegin_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingBegin_Condition()
{
	if (Npc_KnowsInfo(hero,  DIA_Pacho_HuntingOk))&&(Npc_GetDistToWP(hero, "WITAMYWHC") < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingBegin_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(self, other);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_01"); //Tutaj nikt nas nie pods³ucha.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_02"); //Mów o co chodzi.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_03"); //Pods³ucha³em Lerena i Miltena, jak rozmawiali o stadzie czarnych wilków, a dok³adnie o przywódcy watahy.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_04"); //Dowiedzia³em siê czegoœ bardzo ciekawego.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_05"); //Podobno k³y przywódcy stada maj¹ bardzo przydatne w³aœciwoœci.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_06"); //Czyli jakie?
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_07"); //Je¿eli zrobiæ z nich gwizdek, to mo¿na zyskaæ sojusznika w walce.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_08"); //Nie rozumiem.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_09"); //Na g³os gwizdka przybêd¹ wilki i bêd¹ walczyæ po stronie tego, kto u¿y³ piszcza³ki.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_10"); //To rzeczywiœcie ciekawe. Oczywiœcie, o ile to prawda.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_11"); //Wiem, ale jest tylko jeden sposób na to, aby siê o tym przekonaæ. Musimy zapolowaæ na stado czarnych wilków.
	AI_Output (self, other, "DIA_Pacho_HuntingBegin_11_12"); //A je¿eli gwizdek oka¿e siê bujd¹, to zawsze mo¿esz sprzedaæ swój kie³ magom, he, he.
	AI_Output (other, self, "DIA_Pacho_HuntingBegin_15_13"); //Racja. Dobra, prowadŸ.

	Log_CreateTopic(CH2_RBL_WhiteTeeth, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_RUNNING);
	B_LogEntry(CH2_RBL_WhiteTeeth, "Razem z Pacho wyruszy³em na polowanie. Musimy ustrzeliæ przywódcê stada czarnych wilków i zdobyæ k³y zwierzêcia. Podobno kiedy zrobi siê z nich gwizdek, mo¿na przywo³aæ do walki wilka.");

	/*********************
Niech to nie bêdzie za daleko Ork, ale gdzieœ w lesie
Dorobi³em te¿ czarne wilki, ale bez textury + przywódcê
Daj im gdzieœ wp 6 powinno wystarczyæ a¿ nadto
**********************/

	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(BlackWolf, "OW_PATH_SCAVENGER01_SPAWN01");

	Wld_InsertNpc(BlackWolfBoss, "OW_PATH_SCAVENGER01_SPAWN01");

   var C_NPC Pacho; Pacho = Hlp_GetNpc(GRD_224_PACHO);
   
	Party_AddNpc(Pacho);
	Npc_ExchangeRoutine(Pacho, "GUIDEWOLF");
	B_StopProcessInfos(self);
};

/********************
Zrobi³em tak, ¿e ten gwizdek przywo³uje Bia³ego K³a, który od tej pory zostanie ju¿ z Dickiem for ever ;)
Je¿eli to Ci odpowiada to zrób mu ze 2 komendy chocia¿: ChodŸ, Zostañ.

Jak wolisz to zrób tak aby gwizdek przywo³ywa³ tylko okoliczne wilki, które bêd¹ walczyæ po stronie dicka przez jakiœ czas

Decyduj ;P
********************/

//*************************************************

INSTANCE DIA_Pacho_HuntingBeginOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 13;
	condition		= DIA_Pacho_HuntingBeginOk_Condition;
	information		= DIA_Pacho_HuntingBeginOk_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingBeginOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Pacho_HuntingBegin))&&(Npc_GetDistToWP (self, "MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingBeginOk_Info()
{
	B_FullStop (other);
	AI_GotoNpc(self, other);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Pacho_HuntingBeginOk_11_01"); //Jesteœmy na miejscu. Nie daj siê osaczyæ.
	AI_Output (other, self, "DIA_Pacho_HuntingBeginOk_15_02"); //Zabierzmy siê za te pieseczki.
	
   B_StopProcessInfos(self);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingFinished (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 14;
	condition		= DIA_Pacho_HuntingFinished_Condition;
	information		= DIA_Pacho_HuntingFinished_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingFinished_Condition()
{
	var C_NPC bw; bw = Hlp_GetNpc(BlackWolfBoss);

	if (Npc_KnowsInfo (hero, DIA_Pacho_HuntingBeginOk))&&(Npc_GetDistToNpc(self, hero) < 1000)&&(Npc_IsDead(bw))
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingFinished_Info()
{
	var C_NPC bw; bw = Hlp_GetNpc(BlackWolfBoss);

	/**********************
Niech Hark podejdzie gdzieœ blisko, najlepiej ¿eby go nie by³o widaæ

***********************/

	var C_NPC hark; hark = Hlp_GetNpc(RBL_2618_HARK);
	Npc_ExchangeRoutine	(hark, "WOLF");

	B_FullStop (other);
	AI_TurnToNpc (self, bw);
	AI_GotoNpc(self, bw);
	CreateInvItems (self, ItAt_BlackWolfTeeth, 1);

	//AI_Output (self, other, "DIA_Pacho_HuntingFinished_11_01"); //
	//AI_Output (other, self, "DIA_Pacho_HuntingFinished_15_02"); //
	B_StopProcessInfos(self);
	AI_PlayAni(self, "T_PLUNDER");
};

//*************************************************

INSTANCE DIA_Pacho_HuntingFinishedOk (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 15;
	condition		= DIA_Pacho_HuntingFinishedOk_Condition;
	information		= DIA_Pacho_HuntingFinishedOk_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingFinishedOk_Condition()
{
	if (Npc_KnowsInfo (hero,  DIA_Pacho_HuntingFinished))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingFinishedOk_Info()
{
	var C_NPC hark; hark = Hlp_GetNpc(RBL_2618_HARK);

	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_01"); //No i po wszystkim!
	AI_Output (other, self, "DIA_Pacho_HuntingFinishedOk_15_02"); //To nie by³o takie proste, jak myœla³em...
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_03"); //Wa¿ne, ¿e przywódca stada nie ¿yje. Zrobi³em z k³ów piszcza³ki, jedna jest dla Ciebie.
	B_GiveInvItems (self, other, ItAt_BlackWolfTeeth, 1);
	AI_Output (other, self, "DIA_Pacho_HuntingFinishedOk_15_04"); //Dziêki, Pacho. Ciekawe czy to rzeczywiœcie zadzia³a?
	AI_TurnToNpc (self, hark);
	AI_Output (self, other, "DIA_Pacho_HuntingFinishedOk_11_05"); //Chyba mamy goœcia...
	AI_TurnToNpc (hero, hark);
	B_StopProcessInfos	(self);
	AI_GotoNpc(hark, hero);
};

//*************************************************

INSTANCE DIA_Pacho_HuntingEnd (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 16;
	condition		= DIA_Pacho_HuntingEnd_Condition;
	information		= DIA_Pacho_HuntingEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hark_Tooth))&&(Npc_GetDistToNpc(self, hero) < 1000) && (pacho_heroservedhark)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingEnd_Info()
{
	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_Pacho_HuntingEnd_11_00"); //Ale z Ciebie miêczak. Po co ja Ciê zabra³em na polowanie?
	AI_Output(other, self, "DIA_Pacho_HuntingEnd_15_01"); //Czasami mam doœæ przemocy...
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_WhiteTeeth, "I po sprawie. Odda³em kie³ Harkowi. Zdaje siê, ¿e straci³em przez to w oczach Pacho.");

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "OR");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pacho_HuntingEnd2 (C_INFO)
{
	npc				= GRD_224_PACHO;
	nr				= 16;
	condition		= DIA_Pacho_HuntingEnd2_Condition;
	information		= DIA_Pacho_HuntingEnd2_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Pacho_HuntingEnd2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hark_Tooth_after_fight))&&(Npc_GetDistToNpc(self, hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Pacho_HuntingEnd2_Info()
{
	B_FullStop (other);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, other);

	AI_Output(self, other, "DIA_Pacho_HuntingEnd2_11_00"); //Dobrze, ¿e siê postawi³eœ. Tacy jak Hark to najgorsze mêty, ¿eruj¹ce na s³abszych.
	AI_Output(other, self, "DIA_Pacho_HuntingEnd2_15_01"); //Te¿ tak uwa¿am. Bywaj.
	Log_SetTopicStatus(CH2_RBL_WhiteTeeth, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_WhiteTeeth, "Ju¿ po wszystkim. Czas wypróbowaæ kie³!");

	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self, "OR");
	B_StopProcessInfos(self);
};