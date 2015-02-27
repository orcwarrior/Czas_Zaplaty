var int Drunkman_Chest_canbeopened;

func int B_PIWOSZ_CHEST()
{
	if(Drunkman_Chest_canbeopened)
	{
		if(Npc_CanSeeNpcFreeLOS		(piwosz,hero))
		{
			Npc_ClearAIQueue(piwosz);
			B_FullStop 		(piwosz);
			Npc_SetTarget(piwosz,HERO);
			AI_StartState	(piwosz, ZS_CatchThief, 0, "");
		};
      
		return 1;
	}
	else
	{
		return 0;	
	};
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Leaf_Exit (C_INFO)
{
	npc			= RBL_4011_Leaf;
	nr			= 999;
	condition	= DIA_Leaf_Exit_Condition;
	information	= DIA_Leaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Leaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Leaf_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Leaf_Hello (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 1;
	condition		= DIA_Leaf_Hello_Condition;
	information		= DIA_Leaf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Leaf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Leaf_Hello_Info()
{
	AI_Output (other, self, "DIA_Leaf_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Leaf_Hello_11_02"); //A Ty spadaj.
	AI_Output (other, self, "DIA_Leaf_Hello_15_03"); //Rozmowny jesteœ.
	AI_Output (self, other, "DIA_Leaf_Hello_11_04"); //Nie szukam nowych przyjació³, wypierdalaj!
	
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Leaf_Trol (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 1;
	condition		= DIA_Leaf_Trol_Condition;
	information		= DIA_Leaf_Trol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia³, ¿e znasz ³owców trolli."; 
};

FUNC INT DIA_Leaf_Trol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Hello))&&(Npc_KnowsInfo (hero, DIA_Cavalorn_BlackTroll2))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Trol_Info()
{
	cav_trol = 4;	
   
	AI_Output (other, self, "DIA_Leaf_Trol_15_01"); //Cavalorn powiedzia³, ¿e znasz ³owców trolli.
	AI_Output (self, other, "DIA_Leaf_Trol_11_02"); //Znam wiele szumowin, a co Tobie do tego?
	AI_Output (other, self, "DIA_Leaf_Trol_15_03"); //Zamierzam ich odwiedziæ. Im wiêcej siê dowiem, tym wiêksz¹ mam szansê na prze¿ycie.
	AI_Output (self, other, "DIA_Leaf_Trol_11_04"); //Có¿ za sk³adna konkluzja. Poczu³em siê prawie, jakbyœ by³ baka³arzem.
	AI_Output (self, other, "DIA_Leaf_Trol_11_05"); //W porz¹dku, powiem Ci co wiem.
	AI_Output (self, other, "DIA_Leaf_Trol_11_06"); //£owcy to banda myœliwych najwy¿szej próby. Fakt, ¿e wiêkszoœæ z nich to niezrównowa¿one bydlaki o sadystycznych sk³onnoœciach, ale poza tym s¹ w miarê normalni.
	AI_Output (self, other, "DIA_Leaf_Trol_11_07"); //Sêk w tym, ¿e oni nie wpuszczaj¹ do obozu byle kogo.
	AI_Output (self, other, "DIA_Leaf_Trol_11_08"); //A byle kto, to dla nich ktoœ kogo nie znaj¹.
	AI_Output (other, self, "DIA_Leaf_Trol_15_09"); //Ale znaj¹ Ciebie, tak?
	AI_Output (self, other, "DIA_Leaf_Trol_11_10"); //Mniej, wiêcej. 
	AI_Output (self, other, "DIA_Leaf_Trol_11_11"); //Tylko, ¿e wiedza kosztuje, piracie.
	AI_Output (other, self, "DIA_Leaf_Trol_15_12"); //Ile?
	AI_Output (self, other, "DIA_Leaf_Trol_11_13"); //Nie zupe³nie to mia³em na myœli.
	AI_Output (other, self, "DIA_Leaf_Trol_15_14"); //Streszczaj siê, bo nie mam ca³ego dnia!
	AI_Output (self, other, "DIA_Leaf_Trol_11_15"); //W koñcu to Ty chcesz pogadaæ z ³owcami, nie ja.
	AI_Output (self, other, "DIA_Leaf_Trol_11_16"); //Widzisz. Siedzê tu sobie i kontemplujê, jaki ten œwiat piêkny.
	AI_Output (self, other, "DIA_Leaf_Trol_11_17"); //Jednak do pe³ni szczêœcia brakuje mi... lazurowego trzmiela.
	AI_Output (other, self, "DIA_Leaf_Trol_15_18"); //Czego?
	AI_Output (self, other, "DIA_Leaf_Trol_11_19"); //To taki trunek. Pogadaj z Piwoszem, on wie o co chodzi.
	AI_Output (other, self, "DIA_Leaf_Trol_15_20"); //Dobra, wrócê tu z tym sikaczem i lepiej, ¿ebyœ wtedy powiedzia³, to co chcê us³yszeæ.
	
   Log_CreateTopic	(CH2_Rbl_Lazur, LOG_MISSION);
	B_LogSetTopicStatus	(CH2_Rbl_Lazur, LOG_RUNNING);
	B_LogEntry		(CH2_Rbl_Lazur, "Dowiem siê konkretów o ³owcach trolli, je¿eli przyniosê Leafowi lazurowego trzmiela. Piwosz powinien wiedzieæ coœ wiêcej na temat tego trunku.");
	B_StopProcessInfos	(self);
	Drunkman_Chest_canbeopened=true;
};

var int leaf_again;

INSTANCE DIA_Leaf_Trol1 (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 2;
	condition		= DIA_Leaf_Trol1_Condition;
	information		= DIA_Leaf_Trol1_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam samogon."; 
};

FUNC INT DIA_Leaf_Trol1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Lazur))
	&& (TH_hero_knowpwd==false)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Trol1_Info()
{
	AI_Output (other, self, "DIA_Leaf_Trol1_15_01"); //Mam samogon.
	
   if (leaf_again == FALSE)	
	{
		if (NPC_HasItems(other,ItFo_Lazur)>=1)
		{
			B_GiveXP(200);
			leaf_again = TRUE;
         
			AI_Output (self, other, "DIA_Leaf_Trol1_11_02"); //Tak, to lazurowy trzmiel!	
			
         B_GiveInvItems (other, self, ItFo_Lazur, 1);
			
         AI_Output (self, other, "DIA_Leaf_Trol1_11_03"); //Daj to zanim st³uczesz butelkê.
			
         AI_UseItem (self,ItFo_Lazur);
			
         AI_Output (self, other, "DIA_Leaf_Trol1_11_04"); //Tego mi brakowa³o...
			
         B_LogSetTopicStatus	(CH2_Rbl_Lazur, LOG_SUCCESS);
			B_LogEntry(CH2_Rbl_Lazur, "Przynios³em Leafowi lazurowego trzmiela, którego ten od razu wych³epta³.");
			
         AI_Output (other, self, "DIA_Leaf_Trol1_15_05"); //Nie chcê siê narzucaæ, ale skoro ju¿ siê napi³eœ...
			AI_Output (self, other, "DIA_Leaf_Trol1_11_06"); //I po co ten sarkazm? Gard³o przep³uka³em, ale to jeszcze nie wszystko.
			AI_Output (other, self, "DIA_Leaf_Trol1_15_07"); //Nie przeci¹gaj struny! Mów, co wiesz o tych ³owcach! Jak siê tam dostaæ?!
			AI_Output (self, other, "DIA_Leaf_Trol1_11_08"); //Spokojnie wszystko w swoim czasie.
			AI_DrawWeapon (other);
			AI_Output (self, other, "DIA_Leaf_Trol1_11_09"); //Przecie¿ nie zabijesz jednego ze swoich, co nie?
			AI_RemoveWeapon (other);
			AI_Output (self, other, "DIA_Leaf_Trol1_11_10"); //Tak ju¿ lepiej. Pomyœl o czymœ przyjemnym, pozb¹dŸ siê z³ych emocji...
			AI_Output (other, self, "DIA_Leaf_Trol1_15_11"); //Jedyna przyjemna myœl jaka przychodzi mi teraz do g³owy, to Twoja rozkwaszona morda! Czego chcesz?!
			AI_Output (self, other, "DIA_Leaf_Trol1_11_12"); //A czego mo¿e chcieæ biedny rebeliant bez perspektyw na przysz³oœæ.
			AI_Output (self, other, "DIA_Leaf_Trol1_11_13"); //250 bry³ek rudy powinno wystarczyæ.
			
         B_LogEntry		(CH2_Rbl_BlackTroll, "Leaf za informacjê o ³owcach ¿¹da 250 bry³ek rudy!");
			Info_ClearChoices (DIA_Leaf_Trol1);
			
			if (NPC_HasItems(other,ItMiNugget)>=250)
			{
				Info_AddChoice (DIA_Leaf_Trol1, "Bierz tê cholern¹ rudê!", DIA_Leaf_Trol1_Yes);
			}
			else
			{
				Info_AddChoice (DIA_Leaf_Trol1, "Nie mam tyle.", DIA_Leaf_Trol1_No);
			};			
		}
		else
		{
			AI_Output (self, other, "DIA_Leaf_Trol1_11_15"); //Nie masz trzmiela, nie zawracaj mi dupy.
			B_StopProcessInfos(self);
		};		
	}	
	else if (leaf_again == TRUE)
	{
		AI_Output (self, other, "DIA_Leaf_Trol1_11_14"); //Masz rudê?
		Info_ClearChoices (DIA_Leaf_Trol1);

		if (NPC_HasItems(other,ItMiNugget)>=250)
		{
			Info_AddChoice (DIA_Leaf_Trol1, "Bierz tê cholern¹ rudê!", DIA_Leaf_Trol1_Yes);
		}
		else
		{
			Info_AddChoice (DIA_Leaf_Trol1, "Nie mam tyle.", DIA_Leaf_Trol1_No);
		};		
	}
	else
	{
		AI_Output (self, other, "DIA_Leaf_Trol1_11_15"); //Nie masz trzmiela, nie zawracaj mi dupy.
		B_StopProcessInfos	(self);
	};
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_Trol1_Yes()
{
	B_GiveXP(250);
	DIA_Leaf_Trol1.permanent = 0;
	TH_hero_knowpwd = TRUE;
	B_GiveInvItems (other, self, ItMiNugget, 250);
   
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_01"); //Bierz tê cholern¹ rudê!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_02"); //I po co te nerwy? Z³oœæ piêknoœci szkodzi, a Ty jesteœ ju¿ wystarczaj¹co ohydny.
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_03"); //Nie pierdol mi tu farmazonów! Mów!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_04"); //£owcy trolli to odizolowana banda. Nie lubi¹ obcych pa³êtaj¹cych siê po ich cuchn¹cym obozie.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_05"); //Bez obrazy, ale nie wpuszczaj¹ te¿ do obozu pierwszego lepszego ³achmyty.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_06"); //No chyba, ¿e ten obwieœ zna has³o.
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_07"); //A Ty je znasz?
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_08"); //Ale¿ oczywiœcie. Has³o brzmi...
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_09"); //'Nigdy nie odwracaj siê ty³em do stra¿nika'.
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_10"); //He, he, rozumiesz... Ty³em, he, he...
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_11"); //Tak, bardzo zabawne. Je¿eli to has³o nie oka¿e siê prawdziwe, to wrócê po Ciebie i utnê Ci to i tamto!
	AI_Output (self, other, "DIA_Leaf_Trol1_Yes_11_12"); //Mam nadziejê, ¿e siê nie zmieni³o... 
	AI_Output (other, self, "DIA_Leaf_Trol1_Yes_15_13"); //Lepiej dla Ciebie i Twoich cz³onków ¿eby tak by³o!
	
   B_LogEntry		(CH2_Rbl_BlackTroll, "W koñcu wydusi³em od Leafa jakieœ konkrety. £owcy nie wpuszczaj¹ do obozu nikogo, kto nie zna has³a. Leaf twierdzi, ze has³o brzmi 'Nigdy nie odwracaj siê ty³em do stra¿nika', lepiej dla niego, ¿eby to by³a prawda...");
	Info_ClearChoices (DIA_Leaf_Trol1);
	B_StopProcessInfos	(self); 
};

// ------------------No----------------

FUNC VOID DIA_Leaf_Trol1_No()
{
	AI_Output (other, self, "DIA_Leaf_Trol1_No_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_Trol1_No_11_02"); //To wróæ, jak bêdziesz mia³.
	
   Info_ClearChoices (DIA_Leaf_Trol1);
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Leaf_Debt (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 3;
	condition		= DIA_Leaf_Debt_Condition;
	information		= DIA_Leaf_Debt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przysy³a mnie Nikolas."; 
};

FUNC INT DIA_Leaf_Debt_Condition()
{
	if (debt_read == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Debt_Info()
{
	debt_counter = debt_counter + 1;
	B_GiveXP (150);
   
	AI_Output (other, self, "DIA_Leaf_Debt_15_01"); //Przysy³a mnie Nikolas.
	AI_Output (self, other, "DIA_Leaf_Debt_11_02"); //Cholera myœla³em, ¿e ju¿ zapomnia³....
	AI_Output (other, self, "DIA_Leaf_Debt_15_03"); //To Ÿle myœla³eœ i dolicz jeszcze 50 bry³ek odsetek.
	AI_Output (self, other, "DIA_Leaf_Debt_11_04"); //Ile?! Bez przesady.
	AI_Output (other, self, "DIA_Leaf_Debt_15_05"); //Pos³uchaj, albo oddasz ca³¹ rudê po dobroci albo j¹ z Ciebie wycisnê.
	AI_Output (self, other, "DIA_Leaf_Debt_11_06"); //Dobra, ju¿ dobra. Zabieraj rudê i zejdŸ mi z oczu cholerna pijawko!
	
   CreateInvItems (self, ItMiNugget,250); 
	B_GiveInvItems (self, other, ItMiNugget, 250);
	B_LogEntry		(CH2_TRL_Debt, "Odebra³em d³ug od Leafa, to by³o ³atwiejsze ni¿ myœla³em.");
	B_StopProcessInfos	(self);
};

// **************************************************

var int leaf_plant;
var int leaf_give_plant;

INSTANCE DIA_Leaf_Plant (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 4;
	condition		= DIA_Leaf_Plant_Condition;
	information		= DIA_Leaf_Plant_Info;
	permanent		= 1;
	important		= 0;
	description		= "S³ysza³eœ kiedyœ o smoczym korzeniu?"; 
};

FUNC INT DIA_Leaf_Plant_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Plantsd)) && (!leaf_give_plant)
	{                                          	
		return 1;                                 	
	};                                         
};

FUNC VOID DIA_Leaf_Plant_Info()
{
	if (leaf_plant = FALSE)
	{
		leaf_plant = TRUE;
		AI_Output (other, self, "DIA_Leaf_Plant_15_01"); //S³ysza³eœ kiedyœ o smoczym korzeniu?
		AI_Output (self, other, "DIA_Leaf_Plant_11_02"); //Nie tylko s³ysza³em, ale nawet mam jeden na sprzeda¿.
		AI_Output (self, other, "DIA_Leaf_Plant_11_03"); //Ale to droga roœlina... Bardzo droga.
		AI_Output (other, self, "DIA_Leaf_Plant_15_04"); //Ile chcesz za korzeñ?
		AI_Output (self, other, "DIA_Leaf_Plant_11_05"); //Hmm, wliczaj¹c rzadkoœæ wystêpowania roœliny, ryzyko zwi¹zane z jej znalezieniem, koszty manipulacyjne...
		AI_Output (other, self, "DIA_Leaf_Plant_15_06"); //Ile?!
		AI_Output (self, other, "DIA_Leaf_Plant_11_07"); //500 bry³ek.
		
      DIA_Leaf_Plant.description = "Masz jeszcze ten korzeñ?";
		B_LogEntry		(CH2_RBL_Plants, "Ta pijawka Leaf chce za korzeñ 500 bry³ek! Najchêtniej star³bym ten g³upi uœmieszek z jego mordy kilofem...");
	}
	else
	{
		AI_Output (other, self, "DIA_Leaf_Plant_15_08"); //Masz jeszcze ten korzeñ?
		AI_Output (self, other, "DIA_Leaf_Plant_11_09"); //Tak, ale cena siê nie zmieni³a - 500 bry³ek!
	};
	
	Info_ClearChoices (DIA_Leaf_Plant);

	if (NPC_HasItems(other,ItMiNugget)>=500)
	{
		Info_AddChoice (DIA_Leaf_Plant, "Bierz tê cholern¹ rudê!", DIA_Leaf_Plant_Yes);
		Info_AddChoice (DIA_Leaf_Plant, "Muszê siê zastanowiæ.", DIA_Leaf_Plant_Go);
	}
	else
	{
		Info_AddChoice (DIA_Leaf_Plant, "Nie mam tyle.", DIA_Leaf_Plant_No);
	};
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_Plant_Yes()
{
	B_GiveXP(250);
	CreateInvItems (self, dragon_root,1); 
	B_GiveInvItems (self, other, dragon_root, 1);
	leaf_give_plant = true;
	B_GiveInvItems (other, self, ItMiNugget, 500);
	AI_Output (other, self, "DIA_Leaf_Plant_Yes_15_01"); //Bierz tê cholern¹ rudê!
	AI_Output (self, other, "DIA_Leaf_Plant_Yes_11_02"); //Pewnie, ¿e wezmê. A to Twoje zielsko. Mam nadziejê, ¿e to ten korzeñ...
	AI_Output (other, self, "DIA_Leaf_Plant_Yes_15_03"); //Je¿eli tak nie bêdzie, to wyprujê Ci flaki, cholerny sêpie!
	B_LogEntry		(CH2_RBL_Plants, "Kupi³em od Leafa smoczy korzeñ.");
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};



// ------------------No----------------

FUNC VOID DIA_Leaf_Plant_No()
{
	AI_Output (other, self, "DIA_Leaf_Plant_No_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_Plant_No_11_02"); //To wróæ, jak bêdziesz mia³.
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};

// ------------------go----------------

FUNC VOID DIA_Leaf_Plant_Go()
{
	AI_Output (other, self, "DIA_Leaf_Plant_Go_15_01"); //Muszê siê zastanowiæ.
	AI_Output (self, other, "DIA_Leaf_Plant_Go_11_02"); //Tylko nie myœl za d³ugo...
	Info_ClearChoices (DIA_Leaf_Plant);
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_RBL_4011_Leaf_Stew (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 12;
	condition		= DIA_RBL_4011_Leaf_Stew_Condition;
	information		= DIA_RBL_4011_Leaf_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie porcjê gulaszu."; 
};

FUNC INT DIA_RBL_4011_Leaf_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_4011_Leaf_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_4011_Leaf_Stew_15_01"); //Mam dla Ciebie porcjê gulaszu.
	AI_Output (self, other, "DIA_RBL_4011_Leaf_Stew_11_02"); //Dziêki.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Da³em gulasz Leafowi."); 
};

var int Leaf_finish_last_talk;

// **************************************************

INSTANCE DIA_Leaf_OCSpy (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 5;
	condition		= DIA_Leaf_OCSpy_Condition;
	information		= DIA_Leaf_OCSpy_Info;
	permanent		= 1;
	important		= 0;
	description		= "Podobno wiesz, jak dostaæ siê do Starego Obozu."; 
};

FUNC INT DIA_Leaf_OCSpy_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OldCampSpy))&&(!Leaf_OCSpy_notpermanent)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_OCSpy_Info()
{
	if (Leaf_finish_last_talk == FALSE)
	{
		Leaf_finish_last_talk = TRUE;
		DIA_Leaf_OCSpy.description = "Chcia³em dokoñczyæ poprzedni¹ rozmowê."; 
		AI_Output (other, self, "DIA_Leaf_OCSpy_15_01"); //Podobno wiesz, jak dostaæ siê do Starego Obozu.
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_02"); //Nic za darmo jak mawia³a moja mamusia, kiedy przychodzili klienci.
		AI_Output (other, self, "DIA_Leaf_OCSpy_15_03"); //Nie mam czasu na pierdo³y, mów czego chcesz.
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_04"); //Tego co zawsze - rudy... Okr¹g³y 1000 bêdzie w sam raz.
	}
	else
	{
		AI_Output (self, other, "DIA_Leaf_OCSpy_11_05"); //Jednak przejrza³eœ na oczy.
	};
   
	Info_ClearChoices (DIA_Leaf_OCSpy);

	Info_AddChoice (DIA_Leaf_OCSpy, "Nic Ci nie zap³acê!", DIA_Leaf_OCSpy_Fight);
	
   if (NPC_HasItems(other,ItMiNugget)>=1000)
	{
		Info_AddChoice (DIA_Leaf_OCSpy, "Bierz tê cholern¹ rudê!", DIA_Leaf_OCSpy_Money);
	};
   
	Info_AddChoice (DIA_Leaf_OCSpy, "Nie mam tyle.", DIA_Leaf_OCSpy_NoMoney);
};

// ---------------------------fight----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_Fight()
{
	B_GiveXP(300);
	Leaf_OCSpy_notpermanent = true;
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_00"); //Nic Ci nie zap³acê!
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_01"); //Pos³uchaj skurwielu!
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_02"); //Stoimy po tej samej stronie barykady, a Ty chcesz ze mnie zedrzeæ ostatni¹ skórê?!
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_03"); //To tylko interes, ¿yjemy w paskudnych czasach, nic nie ma za darmo...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_04"); //Masz racjê, ¿yjemy w paskudnych czasach. Ci¹gle s³yszy siê o œwirach, którzy wypruwaj¹ flaki innym tylko dlatego, ¿e tamci krzywo na niech spoj¿¹.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_05"); //Spokojnie, zrozumia³em aluzjê. Mo¿e i jestem zach³anny, ale nie g³upi. Schowaj to ¿elastwo.
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_06"); //Mów i lepiej, ¿ebym siê na Tobie nie zawiód³.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_07"); //Niech to bêdzie wyraz mojej dobrej woli. W koñcu walczymy po tej samej stronie.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_08"); //Znam kolesia, który stoi na stra¿y przy pó³nocnej bramie obozu. Trochê sie kiedyœ wa³êsaliœmy razem, jeszcze zanim trafi³em do Kolonii.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_09"); //Fakt, ¿e ju¿ za sob¹ specjalnie nie przepadamy, ale znam jego s³abe strony.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_10"); //Nie interesuje mnie Twoje ¿ycie intymne, czekam na konkrety.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_11"); //Bardzo œmieszne. Kiedy jest nawalony, mo¿esz mu wcisn¹æ ka¿de k³amstwo. Wmówisz mu nawet, ¿e jest pó³-orkiem, bo jego matka...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_12"); //Czyli wystarczy go spiæ? Mocny ma ³eb?
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_13"); //Za ko³nierz nie wylewa, ale powinieneœ sobie poradziæ. Najlepiej jakbyœ za³atwi³ sobie na tê okazjê jakiœ porz¹dny trunek.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Fight_15_14"); //Dobra Leaf, dziêki za przys³ugê. Je¿eli prze¿yjê wizytê w Starym Obozie to odp³acê Ci jak nale¿y za tê informacjê.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Fight_11_15"); //Wystarczy, ¿e pokrzy¿ujesz plany tego cuchn¹cego wieprza Gomeza. Powodzenia piracie.
	
   B_LogEntry		(CH3_RBL_OldCampSpy, "Wydusi³em z Leafa, ¿e stra¿nik przed pó³nocna bram¹ po pijaku mo¿e daæ siê oszukaæ. Mo¿e Piwosz bêdzie mia³ coœ na tê okazjê?");
	B_StopProcessInfos	(self); 
};

// ---------------------------money----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_Money()
{
	B_GiveXP(200);
	Leaf_OCSpy_notpermanent = true;
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_01"); //Bierz tê cholern¹ rudê!
	B_GiveInvItems (other, self, ItMiNugget, 1000);
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_06"); //Mów i lepiej, ¿ebym siê na tobie nie zawiód³.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_08"); //Znam kolesia, który stoi na stra¿y przy pó³nocnej bramie obozu. Trochê sie kiedyœ wa³êsaliœmy razem, jeszcze zanim trafi³em do Kolonii.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_09"); //Fakt, ¿e ju¿ za sob¹ specjalnie nie przepadamy, ale znam jego s³abe strony.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_10"); //Nie interesuje mnie Twoje ¿ycie intymne, czekam na konkrety.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_11"); //Bardzo œmieszne. Kiedy jest nawalony, mo¿esz mu wcisn¹æ ka¿de k³amstwo. Wmówisz mu nawet, ¿e jest pó³-orkiem bo jego matka...
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_12"); //Czyli wystarczy go spiæ? Mocn¹ ma g³owê?
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_13"); //Za ko³nierz nie wylewa, ale powinieneœ sobie poradziæ. Najlepiej jakbyœ za³atwi³ sobie na tê okazjê jakiœ porz¹dny trunek.
	AI_Output (other, self, "DIA_Leaf_OCSpy_Money_15_14"); //Dobra Leaf, dziêki za przys³ugê. Je¿eli mnie oszuka³eœ, to wrócê i wyprujê ci flaki.
	AI_Output (self, other, "DIA_Leaf_OCSpy_Money_11_15"); //Zapewniam, ¿e nie bêdzie takiej potrzeby. Powodzenia piracie.
	
   B_LogEntry		(CH3_RBL_OldCampSpy, "Za rudê Leaf powiedzia³, ¿e stra¿nik przed pó³nocna bram¹ po pijaku mo¿e daæ siê oszukaæ. Mo¿e Piwosz bêdzie mia³ coœ na tê okazjê?");
	B_StopProcessInfos	(self); 
};

// ---------------------------no cash----------------------------------------

FUNC VOID DIA_Leaf_OCSpy_NoMoney()
{
	AI_Output (other, self, "DIA_Leaf_OCSpy_NoMoney_15_01"); //Nie mam tyle.
	AI_Output (self, other, "DIA_Leaf_OCSpy_NoMoney_11_02"); //To nie mój problem.
	
   Info_ClearChoices (DIA_Leaf_OCSpy);
	B_StopProcessInfos	(self); 
};

/***************************
SIDE QUEST

***************************/

// **************************************************

INSTANCE DIA_Leaf_Cristal (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 10;
	condition		= DIA_Leaf_Cristal_Condition;
	information		= DIA_Leaf_Cristal_Info;
	permanent		= 0;
	important		= 0;
	description		= "Szukam... kryszta³u."; 
};

FUNC INT DIA_Leaf_Cristal_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_CristalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Cristal_Info()
{
	AI_Output (other, self, "DIA_Leaf_Cristal_15_01"); //Szukam... kryszta³u.
	AI_Output (self, other, "DIA_Leaf_Cristal_11_02"); //Jednak Œwistak znalaz³ jakiegoœ idiotê.
	AI_Output (other, self, "DIA_Leaf_Cristal_15_03"); //Bez takich wycieczek!
	AI_Output (self, other, "DIA_Leaf_Cristal_11_04"); //Bo co mi zrobisz? Dasz mi klapsa?
	AI_Output (self, other, "DIA_Leaf_Cristal_11_05"); //Spadaj st¹d, nie mam teraz czasu.
	B_LogEntry		(CH1_RBL_ArrowCristal, "Oglêdnie mówi¹c, Leaf mnie sp³awi³.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_CristalAgain (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 11;
	condition		= DIA_Leaf_CristalAgain_Condition;
	information		= DIA_Leaf_CristalAgain_Info;
	permanent		= 0;
	important		= 0;
	description		= "Pogadajmy."; 
};

FUNC INT DIA_Leaf_CristalAgain_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Cristal))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_CristalAgain_Info()
{
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_01"); //Pogadajmy.
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_02"); //Dla mnie ka¿da chwila jest bezcenna.
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_03"); //Ile?
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_04"); //50 bry³ek.
	AI_Output (other, self, "DIA_Leaf_CristalAgain_15_05"); //To rozbój!
	AI_Output (self, other, "DIA_Leaf_CristalAgain_11_06"); //Wróæ z rud¹, albo spadaj!
	B_LogEntry		(CH1_RBL_ArrowCristal, "Leaf porozmawia ze mn¹ za 50 bry³ek. Cholerna pijawka!");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_CristalPay (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 12;
	condition		= DIA_Leaf_CristalPay_Condition;
	information		= DIA_Leaf_CristalPay_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zap³acê Ci!"; 
};

FUNC INT DIA_Leaf_CristalPay_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_CristalAgain))&&(NPC_HasItems(other,ItMiNugget)>=50)

	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_CristalPay_Info()
{
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_01"); //Zap³acê Ci!
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_02"); //Najpierw ruda, buziaczki póŸniej jak mawia³a moja mamusia.
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_03"); //Bierz kanalio i mów, co wiesz o tym krysztale!
	B_GiveInvItems (other, self, ItMiNugget, 50);
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_04"); //Grzeczniej proszê. Poza tym sk¹d przypuszczenia, ¿e cokolwiek wiem o jakimœ tam krysztale?
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Leaf_CristalPay_15_05"); //Oddaj rudê, albo...
	AI_Output (self, other, "DIA_Leaf_CristalPay_11_06"); //Albo co? Schowaj ten patyk, zanim komuœ stanie siê krzywda.
	AI_RemoveWeapon (other);
	B_LogEntry		(CH1_RBL_ArrowCristal, "Leaf zabra³ rudê, ale nic nie powiedzia³. Cholerny sukinsyn!");
	
   Info_ClearChoices (DIA_Leaf_CristalPay);
	Info_AddChoice (DIA_Leaf_CristalPay, "Czas na lanie.", DIA_Leaf_CristalPay_Yes);
	Info_AddChoice (DIA_Leaf_CristalPay, "Jeszcze tu wrócê!", DIA_Leaf_CristalPay_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Leaf_CristalPay_Yes()
{
	quentin_fight = TRUE;
	AI_Output (other, self, "DIA_Leaf_CristalPay_Yes_15_01"); //Czas na lanie.
	AI_Output (self, other, "DIA_Leaf_CristalPay_Yes_07_02"); //O, pieseczek pokaza³ z¹bki.
	AI_Output (self, other, "DIA_Leaf_CristalPay_Yes_07_03"); //Zaraz zaczniesz skowytaæ!
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ------------------No----------------

FUNC VOID DIA_Leaf_CristalPay_No()
{
	AI_Output (other, self, "DIA_Leaf_CristalPay_No_15_01"); //Jeszcze tu wrócê!
	AI_RemoveWeapon (self);
	AI_Output (self, other, "DIA_Leaf_CristalPay_No_11_02"); //No có¿, smród zawsze wraca. Nic na to nie poradzê...
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Leaf_Beer (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 13;
	condition		= DIA_Leaf_Beer_Condition;
	information		= DIA_Leaf_Beer_Info;
	permanent		= 0;
	important		= 0;
	description		= "Napijesz siê?"; 
};

FUNC INT DIA_Leaf_Beer_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Leaf))&&(NPC_HasItems(other,ItFobeer)>=2)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Beer_Info()
{
	AI_Output (other, self, "DIA_Leaf_Beer_15_01"); //Napijesz siê?
	AI_Output (self, other, "DIA_Leaf_Beer_11_02"); //W koñcu zaczynasz rozmowê jak kurtu... kultru... porz¹dny cz³ek.
	AI_Output (other, self, "DIA_Leaf_Beer_15_03"); //Twoje zdrowie, Leaf!
	B_GiveInvItems (other, self, ItFoBeer, 1);

	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);

	AI_Output (self, other, "DIA_Leaf_Beer_11_04"); //Wiesz co? Rozczuli³eœ mnie. O co chodzi z tym kryszta³em?
	AI_Output (other, self, "DIA_Leaf_Beer_15_05"); //Œwistak ubzdura³ sobie, ¿e z metalu zawartego w meteorycie mo¿na wytopiæ groty ¿ywio³ów.
	AI_Output (self, other, "DIA_Leaf_Beer_11_06"); //Rozumiem. Dobra, powiem Ci co wiem.
	AI_Output (self, other, "DIA_Leaf_Beer_11_07"); //By³em na polowaniu. Mia³em straszne gazy po gulaszu Snafa... Polaz³em w krzaki i nagle jak nie pierdylnie!
	AI_Output (self, other, "DIA_Leaf_Beer_11_08"); //Najpierw myœla³em, ¿e to ja. Ale póŸniej zobaczy³em dymi¹c¹ dziurê i bij¹cy z niej trupi blask.
	AI_Output (self, other, "DIA_Leaf_Beer_11_09"); //Ledwo zd¹¿y³em portki podci¹gn¹æ tak stamt¹d wia³em!
	AI_Output (other, self, "DIA_Leaf_Beer_15_10"); //Gdzie znajdê ten krater?
	AI_Output (self, other, "DIA_Leaf_Beer_11_11"); //Przed bagnami skrêæ w lewo do lasu. IdŸ tak, aby mieæ po prawej ska³y, póŸniej skrêæ w lewo. 
	AI_Output (self, other, "DIA_Leaf_Beer_11_12"); //Gdzieœ tam jest taka paskudna dziura...
	AI_Output (self, other, "DIA_Leaf_Beer_11_13"); //Tylko uwa¿aj na wilki i cieniostwory, pe³no tam tego siê wa³êsa.
	B_LogEntry		(CH1_RBL_ArrowCristal, "Piwo pomog³o. Leaf zdradzi³ mi, gdzie szukaæ krateru. Przed bagnami muszê skrêciæ w lewo, mam iœæ kawa³ek maj¹c po prawej ska³y po czym skrêciæ w lewo w las. Gdzieœ tam znajdê kryszta³. Muszê uwa¿aæ na wilki i cieniostwory.");
};

/*********************************
Ork za³¹czam opis Laviusa. Zrób to jakoœ fajnie ;P

Dostajemy mapê z po³o¿eniem kryszta³u, gdzie to ma byæ zamieszczê póŸniej screena - screena nie ma, wiêc da³em tê dziurê bo po co kombinowaæ, opis celowo niedok³adny, ¿eby gracze trochê po³azili [sher]. 
W ka¿dym razie idziemy tam i podchodzimy do kryszta³u. 
Jeœli Rick ma przy sobie strza³y to zmieniaj¹ one formê w ogniowe i upadaj¹ na ziemie. 
Rick NIE mo¿e ich podnieœæ. Podchodzi on do kryszta³u i zabiera go. 
W momencie gdy go podnosi podbiega do niego z 5 œcierwojadów przemalowanych na fioletowo. 
Niech one maj¹ takie same obra¿enia jak normalne tyle ¿e maj¹ tak z 3 razy wiêcej ¿ycia. 
Rick je ubija i idzie do obozu. 

I tu proœba do Orc'a: Jeœli dobrze wiem to ty jesteœ odpowiedzialny za animacjê ubijania modzie Kolonia ¯ywych Trupów czy jakoœ tak to by³o. 
Pasowa³aby taka animacja ¿e kiedy przechodzimy obok kogoœ z kryszta³em robi on krok w ty³ i wyrzuca p³on¹ce lub mro¿¹ce strza³y. 
W ka¿dym razie Rick dociera do Œwistaka. Gdy podchodzi do niego wypadaj¹ mu z r¹k strza³y ogniste. Podchodzi on do nas i zagaduj...

------------------------

Czyli teraz dialog Œwistaka...

**********************************/

// **************************************************

INSTANCE DIA_Leaf_Stone (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 14;
	condition		= DIA_Leaf_Stone_Condition;
	information		= DIA_Leaf_Stone_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz jak struty."; 
};

FUNC INT DIA_Leaf_Stone_Condition()
{
	if (Kapitel>=3)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_Stone_Info()
{
	AI_Output (other, self, "DIA_Leaf_Stone_15_01"); //Wygl¹dasz jak struty.
	AI_Output (self, other, "DIA_Leaf_Stone_11_02"); //Ech... Dowiedzia³em siê czegoœ za co warto zabiæ, ale sprawa utknê³a w martwym punkcie.
	AI_Output (other, self, "DIA_Leaf_Stone_15_03"); //Co to za matactwo?
	AI_Output (self, other, "DIA_Leaf_Stone_11_04"); //Powiem Ci pod warunkiem, ¿e mi pomo¿esz. Dla takiego twardziela jak Ty to powinna byæ pestka.
	AI_Output (other, self, "DIA_Leaf_Stone_15_05"); //Czujê, ¿e bêdê tego ¿a³owa³...
	AI_Output (self, other, "DIA_Leaf_Stone_11_06"); //Wróæ jak zmienisz zdanie.
};

// **************************************************

INSTANCE DIA_Leaf_StoneOk (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 15;
	condition		= DIA_Leaf_StoneOk_Condition;
	information		= DIA_Leaf_StoneOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobra, zaryzykujê. O co chodzi?"; 
};

FUNC INT DIA_Leaf_StoneOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Stone))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneOk_Info()
{
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_01"); //Dobra, zaryzykujê. O co chodzi?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_02"); //A jednak masz jaja.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_03"); //Kupi³em pewn¹ ksiêgê. Ktoœ znalaz³ wolumin w Klasztorze Zmiennokszta³tnych. 
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_04"); //Przeczyta³em tam bardzo ciekaw¹ historyjkê o kamieniu filozoficznym i magach, którzy rzekomo odkryli jego tajemnicê. Magowi ci podobno mieli swoj¹ siedzibê na terenie Kolonii.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_05"); //A gdzie dok³adnie?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_06"); //W Kanionie Trolli.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_07"); //Chyba przesadzi³eœ... I ja mam tam pójœæ dobrowolnie?!
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_08"); //Wiesz czym jest kamieñ filozoficzny?
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_09"); //Obawiam siê, ¿e za chwilê siê dowiem.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_10"); //To cudo zapewnia posiadaczowi ¿ycie wieczne i to w dobrobycie!
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_11"); //Aha. Wiesz co, chyba zostawi³em miêso na patelni...
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_12"); //Tak ³atwo siê nie wywiniesz. Przecie¿ nie z³amiesz danego s³owa?
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_13"); //Niech to szlag. Dobra, czego dok³adnie mam szukaæ?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_14"); //No... kamienia. Wys³a³em ju¿ kilka osób, ale do tej pory nikt nie wróci³.
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_15"); //To mnie podnios³eœ na duchu. 
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_16"); //Pójdê do Kanionu Trolli i zobaczê co tam znajdê. A gdzie to jest?
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_17"); //Pomiêdzy œcie¿k¹ do Placu Wymian, a kopalni¹ Gomeza. Nie da siê tam nie trafiæ. Je¿eli odnajdziesz kamieñ, oboje bêdziemy op³ywaæ w bogactwach!
	AI_Output (other, self, "DIA_Leaf_StoneOk_15_18"); //¯ycz mi szczêœcia, bo czujê, ¿e bêdê go potrzebowa³.
	AI_Output (self, other, "DIA_Leaf_StoneOk_11_19"); //Tak, powodzenia. Przynieœ mój kamieñ jak najszybciej!

	Log_CreateTopic	(CH1_RBL_Stone, LOG_MISSION);
	Log_SetTopicStatus	(CH1_RBL_Stone, LOG_RUNNING);
	B_LogEntry		(CH1_RBL_Stone, "Kamieñ filozoficzny, który zapewnia wieczne i dostatnie ¿ycie. No có¿, podobno mogê coœ znaleŸæ w Kanionie Trolli. Drogi do kanionu mam szukaæ pomiêdzy œcie¿k¹ prowadz¹c¹ do Placu Wymian a kopalni¹ Gomeza. Cholera, ¿eby tylko piraci nie dowiedzieli siê w jakim idiotyŸmie biorê udzia³...");
	
	Wld_InsertNpc		(RBL_4128_DeathRebel,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY1");	
	var C_NPC rbl; rbl = Hlp_GetNpc(RBL_4128_DeathRebel);
	B_ChangeAttribute	(rbl, ATR_HITPOINTS, -rbl.attribute[ATR_HITPOINTS_MAX]);
	Wld_InsertNpc		(RBL_4127_DeathRebel,"SPAWN_BLACKGOBBO_PHYLOSOPHY_STONE_BODY2");
	rbl = Hlp_GetNpc(RBL_4127_DeathRebel);	
	B_ChangeAttribute	(rbl, ATR_HITPOINTS, -rbl.attribute[ATR_HITPOINTS_MAX]);	    
};
/*********************************
Ork teraz twoja brocha. Trzeba do Kanionu wsadziæ skrzyniê a do niej tê notatkê stone_note + kilka cia³ rebeliantów i szkielety dooko³a + kilka czarnych i kilkanaœcie zielonych goblinów
Jak gracz przeczyta to pojawi siê mag-szaleniec Non_4122_Kafu, ale to ju¿ moja dzia³a ;P
Aha ten mag mia³ mieæ niby szatê ziemi, ale nie znalaz³em w itemach to da³em mu szatê sêdziego - jak chcesz to zmieñ.
**********************************/

// **************************************************

INSTANCE DIA_Leaf_StoneHave (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 16;
	condition		= DIA_Leaf_StoneHave_Condition;
	information		= DIA_Leaf_StoneHave_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdoby³em kamieñ!"; 
};

FUNC INT DIA_Leaf_StoneHave_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kafu_Hallo))&&(Npc_KnowsInfo (hero, DIA_Leaf_StoneOk))&&(NPC_HasItems(other,Fil_Stone)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneHave_Info()
{
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_01"); //Zdoby³em kamieñ!
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_02"); //Bêdê bogaty! Bêdê bogiem! Daj mi to!
	
   B_GiveInvItems (other, self, Fil_Stone, 1);
	
   AI_Output (self, other, "DIA_Leaf_StoneHave_11_03"); //Coœ ma³y ten kamieñ...
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_04"); //To tylko odprysk. Ale dziêki niemu mag, którego zabi³em prze¿y³ kilka wieków.
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_05"); //Jak siê tego u¿ywa?
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_06"); //Nie mam pojêcia.
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_07"); //Hmm. Mo¿e to po³knê i popijê piwem...
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_08"); //Tak, to œwietny pomys³... (co za idiota)
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_09"); //Co tam mruczysz?
	AI_Output (other, self, "DIA_Leaf_StoneHave_15_10"); //Nic, nic. Smacznego.
	
   CreateInvItems	(self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	Npc_RemoveInvItems(self,Fil_Stone,1);
	
   AI_Output (self, other, "DIA_Leaf_StoneHave_11_11"); //Coœ dziwnie siê czujê... 
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_12"); //Dlaczego wszystko siê krêci?
	AI_Output (self, other, "DIA_Leaf_StoneHave_11_13"); //Ja...
	B_LogEntry		(CH1_RBL_Stone, "Œwietnie. Ten idiota Leaf po³kn¹³ odprysk kamienia filozoficznego i straci³ przytomnoœæ. Muszê jakoœ powiedzieæ o tym Cavalornowi...");

	Npc_ExchangeRoutine	(self, "DRAINED"); 
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Leaf_StoneFinished (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 17;
	condition		= DIA_Leaf_StoneFinished_Condition;
	information		= DIA_Leaf_StoneFinished_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Leaf_StoneFinished_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Quentin_LeafOk))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_StoneFinished_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_01"); //Strasznie boli mnie g³owa. Co siê sta³o?
	AI_Output (other, self, "DIA_Leaf_StoneFinished_15_02"); //Straci³eœ przytomnoœæ. To chyba nie by³o zbyt m¹dre, ¿eby po³ykaæ odprysk...
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_03"); //Chyba trochê mnie ponios³o...
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_04"); //Dziêki za uratowanie dupska. WeŸ to, solidnie zapracowa³eœ na ten pierœcieñ.

	/*****************
Ork daj dickowi jakiœ pierœcieñ czy co tam chcesz
*******************/

	AI_Output (other, self, "DIA_Leaf_StoneFinished_15_05"); //Dziêki, Leaf. I staraj siê ju¿ nie po³ykaæ nic magicznego.
	AI_Output (self, other, "DIA_Leaf_StoneFinished_11_06"); //Spadaj!
	Log_SetTopicStatus	(CH1_RBL_Stone, LOG_SUCCESS);
	B_LogEntry		(CH1_RBL_Stone, "I po sprawie. Leaf niestety wróci³ do formy. A kamieñ filozoficzny... No có¿, czeka go chyba niez³e zatwardzenie.");
}; 

instance Info_Leaf_Choice (C_INFO)
{
	npc			= RBL_4011_Leaf;
	condition	= Info_Leaf_Choice_Condition;
	information	= Info_Leaf_Choice_Info;
	important	= 0;
	permanent	= 0;
	description = "Mam do ciebie sprawê.";
};

FUNC int  Info_Leaf_Choice_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_RBL_2617_Carlson_armor))
	{
		return TRUE;
	};
};

FUNC void  Info_Leaf_Choice_Info()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_15_01"); //Mam do ciebie sprawê.
	AI_Output 		(self, hero,"Info_Leaf_Choice_14_02"); //Czego znowu chcesz?
   AI_Output 		(hero, self,"Info_Leaf_Choice_15_03"); //Podobno zyskujesz rudê od Carlsona i od razu mówiê, ¿e masz z tym natychmiast skoñczyæ!
   AI_Output 		(self, hero,"Info_Leaf_Choice_14_04"); //Bo co mi zrobisz?

	Info_ClearChoices (Info_Leaf_Choice);
	Info_AddChoice (Info_Leaf_Choice, "Po prostu walnê w twój pusty ³eb.", Info_Leaf_Choice_Yes);
	Info_AddChoice (Info_Leaf_Choice, "A dobre piwko?", Info_Leaf_Choice_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Leaf_Choice_Yes()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_Yes_15_01"); //Po prostu walnê w twój pusty ³eb.
	AI_Output 		(self, hero,"Info_Leaf_Choice_Yes_14_02"); //Chcesz siê biæ? Proszê bardzo.
   
   B_LogEntry		(CH2_RBL_armor, "No có¿, muszê znowu mu pokazaæ, gdzie jego miejsce.");
   Info_ClearChoices (Info_Leaf_Choice);
   B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Leaf_Choice_No()
{
	AI_Output 		(hero, self,"Info_Leaf_Choice_Nugget_15_01"); //A dobre piwko?
	AI_Output 		(self, hero,"Info_Leaf_Choice_Nugget_14_02"); //Zapomnij, teraz mam taki zarobek, ¿e nawet starczy mi alkohol do koñca mych dni.	
};

// **************************************************

INSTANCE DIA_Leaf_armor2 (C_INFO)
{
	npc				= RBL_4011_Leaf;
	nr				= 15;
	condition		= DIA_Leaf_armor2_Condition;
	information		= DIA_Leaf_armor2_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przestaniesz truæ dupê Carlsonowi, czy mamy kontynuowaæ?"; 
};

FUNC INT DIA_Leaf_armor2_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Leaf_Choice))
	{
		return 1;
	};
};

FUNC VOID DIA_Leaf_armor2_Info()
{
	AI_Output (other, self, "DIA_Leaf_armor2_15_01"); //Wiêc jak? Przestaniesz truæ dupê Carlsonowi, czy mamy kontynuowaæ?
	AI_Output (self, other, "DIA_Leaf_armor2_11_02"); //Niech ciê szlag trafi, dobra przestanê wyciskaæ od niego rudê, a teraz wynoœ siê z moich oczu. 
	
	B_LogEntry		(CH2_RBL_armor, "I po sprawie, g³adko posz³o teraz mogê wróciæ do Carlsona.");
};