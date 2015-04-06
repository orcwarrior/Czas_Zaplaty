
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Nikolas_Exit (C_INFO)
{
	npc			= Non_4026_Nikolas;
	nr			= 999;
	condition	= DIA_Nikolas_Exit_Condition;
	information	= DIA_Nikolas_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Nikolas_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Nikolas_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Nikolas_Hello (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 1;
	condition		= DIA_Nikolas_Hello_Condition;
	information		= DIA_Nikolas_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "NieŸle siê tutaj urz¹dziliœcie."; 
};

FUNC INT DIA_Nikolas_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Nikolas_Hello_Info()
{
	AI_Output (other, self, "DIA_Nikolas_Hello_15_01"); //NieŸle siê tutaj urz¹dziliœcie.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_02"); //A tyœ kto?
	AI_Output (other, self, "DIA_Nikolas_Hello_15_03"); //Przyjaciel.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_04"); //Ja nie mam przyjació³, przynajmniej nie poœród ¿ywych.
	AI_Output (other, self, "DIA_Nikolas_Hello_15_05"); //W takim razie wolê pozostaæ odstêpstwem od tej normy.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_06"); //Skoro nalegasz. Choæ dla mnie nie liczy siê d³ugoœæ ¿ycia, tylko jego intensywnoœæ.
	AI_Output (other, self, "DIA_Nikolas_Hello_15_07"); //Zdaje siê, ¿e na brak wra¿eñ nie mo¿esz narzekaæ.
	AI_Output (self, other, "DIA_Nikolas_Hello_11_08"); //Przynajmniej czujê, ¿e ¿yjê. Muszê wracaæ do zajêæ, bywaj.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Nikolas_Debt (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 2;
	condition		= DIA_Nikolas_Debt_Condition;
	information		= DIA_Nikolas_Debt_Info;
	permanent		= 0;
	important		= 1;
	description		= "S³ysza³em, ¿e Kira ma na Ciebie haka."; 
};

FUNC INT DIA_Nikolas_Debt_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_Debt_Info()
{
	AI_Output (self, other, "DIA_Nikolas_Debt_11_01"); //S³ysza³em, ¿e Kira ma na Ciebie haka.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_02"); //Co dok³adnie s³ysza³eœ?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_03"); //Podobno musisz udowodniæ jej coœ wart, ¿eby mog³a oceniæ potencja³ tych, których reprezentujesz.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_04"); //Doœæ trafnie to uj¹³eœ.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_05"); //Bardzo mnie to cieszy. Widzisz spad³eœ mi jak gwiazdka z nieba.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_06"); //No dobra, mów o co chodzi.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_07"); //Nagadam Kirze niestworzonych historii o Twojej odwadze, sile i takich tam pierdo³ach, jak coœ dla mnie zrobisz.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_08"); //Co to za robota?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_09"); //Odbierzesz moje nale¿noœci od pewnych wierzycieli.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_10"); //Haracz czy d³ugi?
	AI_Output (self, other, "DIA_Nikolas_Debt_11_11"); //Nie obra¿aj mnie, jestem uczciwym... z³odziejem. Te po¿yczki to by³a inwestycja w... ludzi.
	AI_Output (self, other, "DIA_Nikolas_Debt_11_12"); //Niestety ¿adna nie przynios³a zysków, a wierzyciele zapomnieli o sp³acie.
	AI_Output (other, self, "DIA_Nikolas_Debt_15_13"); //Nie uœmiecha mi siê bieganie po Kolonii za Twoimi d³ugami...
	AI_Output (self, other, "DIA_Nikolas_Debt_11_14"); //Wróæ, jak siê namyœlisz. Tylko tak Kira dowie siê ode mnie czegoœ interesuj¹cego na Twój temat.

	Log_CreateTopic	(CH2_TRL_Debt, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Debt, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Debt, "Nikolas poprosi³ mnie o odzyskanie nale¿noœci od wierzycieli. Tylko wtedy wstawi siê za mn¹ u Kiry. Czeka mnie chyba bieganie po kolonii...");
};

// **************************************************

INSTANCE DIA_Nikolas_Debtok (C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 3;
	condition		= DIA_Nikolas_Debtok_Condition;
	information		= DIA_Nikolas_Debtok_Info;
	permanent		= 0;
	important		= 0;
	description		= "Niech bêdzie, odzyskam Twoj¹ rudê."; 
};

FUNC INT DIA_Nikolas_Debtok_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Debt))
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_Debtok_Info()
{
	AI_Output (other, self, "DIA_Nikolas_Debtok_15_01"); //Niech bêdzie, odzyskam Twoj¹ rudê.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_02"); //Wiedzia³em, ¿e mo¿na na Ciebie liczyæ.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_03"); //Tu masz listê d³u¿ników i wysokoœæ nale¿noœci plus... odsetki.
	
   CreateInvItems (self, debt_list,1); 
	B_GiveInvItems (self, other, debt_list, 1);
	
   AI_Output (other, self, "DIA_Nikolas_Debtok_15_04"); //Co je¿eli nie bêd¹ chcieli oddaæ d³ugu po dobroci?
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_05"); //S³ysza³em, ¿e zaradny z Ciebie ch³opak. Poradzisz sobie.
	AI_Output (self, other, "DIA_Nikolas_Debtok_11_06"); //Powodzenia przyjacielu i wracaj tak szybko jak tylko siê da.
	
   B_LogEntry		(CH2_TRL_Debt, "Zgodzi³em siê odzyskaæ d³ugi dla Nikolasa. Da³ mi listê z d³u¿nikami, powinienem j¹ przeczytaæ.");
	Wld_InsertNpc				(NON_4029_Right,"OW_LEFT_RIGHT_CAMP");///Dodaæ szalenców Lewy i Prawy
	Wld_InsertNpc				(NON_4028_Left,"OW_LEFT_RIGHT_CAMP");//Dodaæ szalenców Lewy i Prawy
};

/**************************************************/

INSTANCE DIA_Nikolas_DebtFinish(C_INFO)
{
	npc				= Non_4026_Nikolas;
	nr				= 4;
	condition		= DIA_Nikolas_DebtFinish_Condition;
	information		= DIA_Nikolas_DebtFinish_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam twój d³ug."; 
};

FUNC INT DIA_Nikolas_DebtFinish_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Nikolas_Debtok))&&(NPC_HasItems(other,ItMiNugget)>=1230)
	{
		return 1;
	};
};

FUNC VOID DIA_Nikolas_DebtFinish_Info()
{
	var c_npc left; var c_npc right;
	right=Hlp_GetNpc(NON_4029_Right);
	left=Hlp_GetNpc(NON_4028_Left);
	
	TH_trust = TH_trust + 1;
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Nikolas_DebtFinish_15_01"); //Mam twój d³ug.
	AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_02"); //Naprawdê? SprawdŸmy.
	
   B_GiveInvItems (other, self, ItMiNugget, 1230);
	Npc_RemoveInvItems(self,ItMiNugget,1230);
	
   if  (debt_counter >=4)||(((debt_counter >=2)||(debt_counter <4))&&((Npc_IsDead(left)&&Npc_IsDead(right))||(Npc_HasItems(other,ItKeLeftChest))))
	{
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_03"); //Dosz³y mnie s³uchy, ¿e pogada³eœ z ch³opakami.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_04"); //Naprawdê nieŸle sobie poradzi³eœ.
	}
	else if (debt_counter >=1)||(debt_counter <4)
	{
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_05"); //Dosz³y mnie s³uchy, ¿e nie zebra³eœ d³ugu od wszystkich.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_06"); //No nic, najwa¿niejsze, ¿e mam ca³¹ rudê w sakiewce.
	}
	else if (debt_counter ==0)
	{
		debt_read = 2;
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_07"); //Dowiedzia³em siê, ¿e od nikogo jeszcze nie zebra³eœ d³ugu.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_08"); //Je¿eli chcesz bawiæ siê w kap³ana Adanosa to Twoja sprawa.
		AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_09"); //Ale w takim razie umarzam te d³ugi. Niech znaj¹ moj¹ hojnoœæ, he, he.
	};
   
	AI_Output (other, self, "DIA_Nikolas_DebtFinish_15_10"); //Czyli mogê na Ciebie liczyæ?
	AI_Output (self, other, "DIA_Nikolas_DebtFinish_11_11"); //W ka¿dej chwili przyjacielu. Kira te¿ siê dowie jaki z Ciebie spryciarz.
	
   Log_SetTopicStatus	(CH2_TRL_Debt, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Debt, "Nikolas odzyska³ rudê, a ja zdoby³em jego poparcie.");
	B_LogEntry(CH2_TRL_Quest, "Zdoby³em poparcie Nikolasa.");
};


