// ************************ EXIT **************************

instance  Info_Myxir_EXIT (C_INFO)
{
	npc			= KDW_601_Myxir;
	nr			= 999;
	condition	= Info_Myxir_EXIT_Condition;
	information	= Info_Myxir_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Myxir_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Myxir_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// *****************************************

instance  DIA_Myxir_Greet (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  1;	
	condition	=  DIA_Myxir_Greet_Condition;
	information	=  DIA_Myxir_Greet_Info;
	permanent	= 0;
	important 	= 0;
	description = "Kim jesteœ?";
};                       

FUNC int  DIA_Myxir_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Myxir_Greet_Info()
{
	AI_Output (other, self,"DIA_Myxir_Greet_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_01"); //Zw¹ mnie Myxir.
	AI_Output (other, self,"DIA_Myxir_Greet_15_02"); //Jesteœ magiem wody?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_03"); //A ty jesteœ skazañcem?
	AI_Output (other, self,"DIA_Myxir_Greet_15_04"); //Jak na to wpad³eœ?
	AI_Output (self, other,"DIA_Myxir_Greet1_08_05"); //Nie znoszê b³aznów...
	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Myxir_Problem (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  2;	
	condition	=  DIA_Myxir_Problem_Condition;
	information	=  DIA_Myxir_Problem_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mo¿esz powiedzieæ mi coœ o ornamentach?";
};                       

FUNC int  DIA_Myxir_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Ornament))
	{
		return 1;
	};
};

FUNC VOID  DIA_Myxir_Problem_Info()
{
	AI_Output (other, self,"DIA_Myxir_Problem_15_01"); //Mo¿esz powiedzieæ mi coœ o ornamentach?
	AI_Output (self, other,"DIA_Myxir_Problem_08_02"); //Oczywiœcie. To ja odkry³em ich tajemnicê.
	AI_Output (self, other,"DIA_Myxir_Problem_08_03"); //Ornamenty stanowi³y onegdaj ca³oœæ. Ko³o ornamentalne by³o czymœ w rodzaju klucza, otwiera³o wrota czasoprzestrzenne, dziêki którym mo¿na by³o przenieœæ siê do innego œwiata, nawet w innym czasie.
	AI_Output (self, other,"DIA_Myxir_Problem_08_04"); //By³a to bardzo stara i potê¿na magia. Staro¿ytne portale stworzy³a rasa ¿yj¹ca w Jarkendarze.
	AI_Output (self, other,"DIA_Myxir_Problem_08_05"); //Jednak z biegiem lat magia ta utraci³a sw¹ moc. Teraz przejœcia dzia³aj¹ jak zwyk³e portale i przenosz¹ w œciœle okreœlone miejsce.
	AI_Output (self, other,"DIA_Myxir_Problem_08_06"); //Musimy odnaleŸæ wszystkie cztery czêœci ornamentu. Kiedy po³¹czymy je w ca³oœæ, zdo³amy uruchomiæ portal i wype³niæ wolê Adanosa.
	AI_Output (other, self,"DIA_Myxir_Problem_15_07"); //Móg³bym tak¿e skorzystaæ z portalu?
	AI_Output (self, other,"DIA_Myxir_Problem_08_08"); //Hmm, byæ mo¿e, ale to zale¿y od Saturasa.
	B_LogEntry(CH3_NON_Ornament, "Cztery czêœci ornamentu mo¿na po³¹czyæ w ca³oœæ. Taki klucz umo¿liwia skorzystanie z portalu. Hmm, mo¿e te¿ móg³bym go u¿yæ?");
};

// *****************************************

instance DIA_Myxir_All (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  3;	
	condition	=  DIA_Myxir_All_Condition;
	information	=  DIA_Myxir_All_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mamy ju¿ wszystkie ornamenty.";
};                       

FUNC int  DIA_Myxir_All_Condition()
{
	return ritual_time_ok;
};

FUNC VOID  DIA_Myxir_All_Info()
{
	AI_Output (other, self,"DIA_Myxir_All_15_01"); //Mamy ju¿ wszystkie ornamenty.

	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"DIA_Myxir_All_08_02"); //W koñcu wola Adanosa zostanie spe³niona!
		AI_Output (other, self,"DIA_Myxir_All_15_03"); //Saturas powiedzia³...
		AI_Output (self, other,"DIA_Myxir_All_08_04"); //Wiem, gdzie zostanie przeprowadzony rytua³.
		B_LogEntry(CH3_NON_Ornament, "Powiedzia³em Myxirowi, aby ruszy³ na dziedziniec.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"DIA_Myxir_All_08_05"); //Ju¿ za póŸno... Nigdy nie wydostaniemy siê z tej cholernej Kolonii!
	};

	B_StopProcessInfos(self);
};

// *****************************************

instance DIA_Myxir_RitualPrepare (C_INFO)
{
	npc			=  KDW_601_Myxir;
	nr			=  4;	
	condition	=  DIA_Myxir_RitualPrepare_Condition;
	information	=  DIA_Myxir_RitualPrepare_Info;
	permanent	= 0;
	important 	= 0;
	description = "Chcia³em porozmawiaæ o pewnym rytuale...";
};                       

FUNC int  DIA_Myxir_RitualPrepare_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Myxir_Problem))&&(myxir_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Myxir_RitualPrepare_Info()
{
	AI_Output (other, self,"DIA_Myxir_RitualPrepare_15_01"); //Chcia³em porozmawiaæ o pewnym rytuale...
	AI_Output (self, other,"DIA_Myxir_RitualPrepare_08_02"); //Wiem. Daj znaæ, kiedy wszystko bêdzie przygotowane.
	B_LogEntry(CH4_RBL_Rirual, "Myxir weŸmie udzia³ w rytuale.");
};

instance Info_Myxir_Ritual (C_INFO)
{
	npc			=	KDW_601_Myxir;
	nr			=	5;
	condition	=	Info_Myxir_Ritual_Condition;
	information	=	Info_Myxir_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u."; 
};                       

FUNC int  Info_Myxir_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Ritual))&&(myxir_ritual == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Myxir_Ritual_Info()
{
	AI_Output(other, self, "Info_Myxir_Ritual_15_00"); //Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u.
	AI_Output(self, other,"Info_Myxir_Ritual_14_01"); //W porz¹dku, gdzie rytua³ siê odbêdzie?
	AI_Output(other, self, "Info_Myxir_Ritual_15_02"); //Leren czeka w pobli¿u kamiennego krêgu na bagnach.
	AI_Output(self, other,"Info_Myxir_Ritual_14_03"); //Wiem, gdzie to jest, wkrótce tam przybêdê.
	
   B_LogEntry(CH4_RBL_Rirual, "Myxir wyruszy³ do kamiennego krêgu.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};
