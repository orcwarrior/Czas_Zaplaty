// **************************** 
//				EXIT 
// ****************************

instance  Info_Kuva_EXIT (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	999;
	condition	=	Info_Kuva_EXIT_Condition;
	information	=	Info_Kuva_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Kuva_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Kuva_EXIT_Info()
{
	B_StopProcessInfos	(self);
};



/************************

Ork ten Kuva ma byæ zamkniêty w jaskini pomiêdzy SK a Kanionem Trola - jest tam taka jedna. Wstaw kraty + drzwi zamkniête na klucz kuva_key 


*************************/




// **************************** 
//			Hallo 
// ****************************

instance  Info_Kuva_Hallo (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	1;
	condition	=	Info_Kuva_Hallo_Condition;
	information	=	Info_Kuva_Hallo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};                       

FUNC int  Info_Kuva_Hallo_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  Info_Kuva_Hallo_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"Info_Kuva_Hallo_04_01"); //Hej, Ty! Stój!
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Kuva_Hallo_15_02"); //Co to za ptaszek w klatce?
	AI_Output (self, other,"Info_Kuva_Hallo_04_03"); //Bardzo œmieszne.
	AI_Output (other, self,"Info_Kuva_Hallo_15_04"); //Sam siê tu zamkn¹³eœ?
	AI_Output (self, other,"Info_Kuva_Hallo_04_05"); //Nie b¹dŸ idiot¹. Musisz mnie st¹d wydostaæ!
	AI_Output (other, self,"Info_Kuva_Hallo_15_06"); //Je¿eli ktoœ Ciê tu zamkn¹³ to musia³ mieæ jakiœ powód. Nie chcê siê nikomu naraziæ.
	AI_Output (self, other,"Info_Kuva_Hallo_04_07"); //Niech Ciê szlag. Przecie¿ mnie tu nie zostawisz!

	Info_ClearChoices (Info_Kuva_Hallo);
	Info_AddChoice (Info_Kuva_Hallo, "Dobra, pomogê Ci.", Info_Kuva_Hallo_Yes);
	Info_AddChoice (Info_Kuva_Hallo, "A co mnie to obchodzi.", Info_Kuva_Hallo_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Kuva_Hallo_Yes()
{
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_01"); //Dobra, pomogê Ci.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_02"); //Nigdy Ci tego nie zapomnê, przyjacielu!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_03"); //Kto Ciê tu zamkn¹³?
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_04"); //Nie mam pojêcia, ale przyszed³em tu na spotkanie ze Œwistakiem.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_05"); //Nawet nie wiem kiedy oberwa³em przez ³eb. Kiedy odzyska³em przytomnoœæ le¿a³em zamkniêty w klatce. 
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_06"); //Sukinsyn zostawi³ mi trochê ¿arcia i buteleczkê z trucizn¹. Niech go szlag trafi!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_07"); //Ciesz siê, ¿e nie przyku³ Ciê ³añcuchem do kraty i nie zostawi³ pi³y...
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_08"); //Aleœ Ty pomys³owy!
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_09"); //Nie widzia³eœ jego twarzy?
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_10"); //Nie. Ale to pewnie Œwistak. Wisia³em mu sporo rudy. Ostatnio jestem ma³o wyp³acalny...
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_11"); //Pewnie da³ mi w ³eb, przeszuka³, nie znalaz³ rudy wiêc siê wnerwi³, a resztê ju¿ znasz.
	AI_Output (other, self,"Info_Kuva_Hallo_Yes_15_12"); //Dobra, pogadam ze Œwistakiem. Nigdzie siê st¹d nie ruszaj.
	AI_Output (self, other,"Info_Kuva_Hallo_Yes_04_13"); //Bardzo œmieszne...
	Log_CreateTopic	(CH1_RBL_Cage, LOG_MISSION);
	Log_SetTopicStatus	(CH1_RBL_Cage, LOG_RUNNING);
	B_LogEntry		(CH1_RBL_Cage, "Obieca³em pomóc Kuvie, którego ktoœ pomys³owy zamkn¹³ w klatce. Kuva twierdzi, ¿e by³ winien Œwistakowi rudê i to z nim mia³ siê tu spotkaæ. Od niego powinienem zacz¹æ.");
	Kuva_Help=TRUE;
};


// ---------------------------No----------------------------------------

FUNC VOID Info_Kuva_Hallo_No()
{
	AI_Output (other, self,"Info_Kuva_Hallo_No_15_01"); //A co mnie to obchodzi.
	AI_Output (self, other,"Info_Kuva_Hallo_No_04_02"); //Ty gnoju! Nie masz serca!
	AI_Output (other, self,"Info_Kuva_Hallo_No_15_03"); //Witamy w Kolonii Karnej. Baw siê dobrze...
	AI_Output (self, other,"Info_Kuva_Hallo_No_04_04"); //Skurwiel!
	B_StopProcessInfos	(self);
};



// ****************************

instance  Info_Kuva_Again (C_INFO)
{
	npc			=	RBL_4123_Kuva;
	nr			=	2;
	condition	=	Info_Kuva_Again_Condition;
	information	=	Info_Kuva_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};                       

FUNC int  Info_Kuva_Again_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero, DIA_Tony_Kuva))

	{
		return 1;
	};


};

FUNC VOID  Info_Kuva_Again_Info()
{
	B_FullStop (hero);
	AI_Output (self, other,"Info_Kuva_Again_04_01"); //Dowiedzia³eœ siê czegoœ nowego?
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Kuva_Again_15_02"); //Mniej, wiêcej. 
	AI_Output (other, self,"Info_Kuva_Again_15_03"); //Twój d³ug wykupi³ R¹czka, to chcia³ Ci powiedzieæ podczas spotkania Œwistak.
	AI_Output (other, self,"Info_Kuva_Again_15_04"); //Rudê na wykup R¹czka dosta³ od Toniego.
	AI_Output (other, self,"Info_Kuva_Again_15_05"); //Ale Tony nie powiedzia³ mi nic wiêcej. Muszê zdobyæ jakiœ dowód, coœ co mo¿e wskazaæ sprawcê.
	AI_Output (self, other,"Info_Kuva_Again_04_06"); //Ale to pogmatwane...
	AI_Output (other, self,"Info_Kuva_Again_15_07"); //Zaraz... Trucizna! Ilu w Kolonii jest skazañców potrafi¹cych wa¿yæ truciznê?
	AI_Output (self, other,"Info_Kuva_Again_04_08"); //Pewnie niewielu. Masz racjê, to jest w³aœciwy œlad!
	AI_Output (other, self,"Info_Kuva_Again_15_09"); //Mam nadziejê, ¿e jeszcze nie wypi³eœ tej trucizny?
	AI_Output (self, other,"Info_Kuva_Again_04_10"); //Nie jestem idiot¹! Mam j¹ przy sobie.
	AI_Output (other, self,"Info_Kuva_Again_15_11"); //Tak w³aœciwie to sk¹d pewnoœæ, ¿e to trucizna?
	AI_Output (self, other,"Info_Kuva_Again_04_12"); //Bo ja wiem... Dziwna buteleczka z cuchn¹c¹ zawartoœci¹ nie mo¿e byæ afrodyzjakiem.
	AI_Output (other, self,"Info_Kuva_Again_15_13"); //Znasz kogoœ kto potrafi wa¿yæ mikstury?
	AI_Output (self, other,"Info_Kuva_Again_04_14"); //Ja nie, ale pogadaj z Cavalornem on zna tu wszystkich.
	AI_Output (other, self,"Info_Kuva_Again_15_15"); //Daj mi buteleczkê i znikam.
	CreateInvItems (self,ItFo_Nabil_Poison,1);
	B_GiveInvItems (self, other, ItFo_Nabil_Poison, 1);
	AI_Output (self, other,"Info_Kuva_Again_04_16"); //Tylko o mnie nie zapomnij!

	B_LogEntry		(CH1_RBL_Cage, "Dziwna buteleczka wcale nie musi byæ trucizn¹. Muszê poszukaæ skazañców, którzy potrafi¹ wa¿yæ mikstury. Cavalorn zna tu wszystkich, ciekawe co powie?");
}; 
