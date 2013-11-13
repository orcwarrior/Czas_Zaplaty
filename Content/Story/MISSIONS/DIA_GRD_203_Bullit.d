//******************************************
//					EXIT	
//******************************************

instance  DIA_Bullit_Exit (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 999;
	condition	= DIA_Bullit_Exit_Condition;
	information	= DIA_Bullit_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Bullit_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_Exit_Info()
{
	B_StopProcessInfos(self);
};

//******************************************
//					First	
//******************************************

instance  DIA_Bullit_First (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_First_Condition;
	information	= DIA_Bullit_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int  DIA_Bullit_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_First_Info()
{
	AI_Output (self, other,"DIA_Bullit_First1_06_00"); //Kogo my tu mamy? Jesteœ jednym z tych, których ochrzci³em wczeœniej? Czego chcesz? Przyszed³eœ po repetê? 
	AI_Output (other, self, "DIA_Bullit_First1_15_01"); //Jak bêdê chcia³ dostaæ po mordzie, to dam Ci znaæ. Tylko przyprowadŸ kumpli, bo w pojedynkê by³byœ dla mnie obelg¹.
	AI_Output (self, other,"DIA_Bullit_First1_06_02"); //Za kogo Ty siê uwa¿asz gnido? Zaraz poka¿ê Ci, co robimy z zarozumia³ymi typami.
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self, other, false);
};

//******************************************

instance  DIA_Bullit_Eskort (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 2;
	condition	= DIA_Bullit_Eskort_Condition;
	information	= DIA_Bullit_Eskort_Info;
	permanent	= 0;
	important	= 0;
	description	= "Chcia³byœ obiæ komuœ mordê?"; 
};                       

FUNC int  DIA_Bullit_Eskort_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(Npc_KnowsInfo (hero, DIA_Bullit_First))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Eskort_Info()
{
	AI_Output (other, self, "DIA_Bullit_Eskort_15_01"); //Chcia³byœ obiæ komuœ mordê?
	AI_Output (self, other,"DIA_Bullit_Eskort_06_02"); //Ka¿da okazja jest dobra. O co chodzi?
	AI_Output (other, self, "DIA_Bullit_Eskort_15_03"); //Szykuje siê wyprawa poza palisadê. Mo¿e byæ gor¹co.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_04"); //Chyba nie mówisz o transporcie broni?
	AI_Output (other, self, "DIA_Bullit_Eskort_15_05"); //W³aœnie o tym.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_06"); //Nie jestem idiot¹. Co innego spuœciæ wpierdol ¿ó³todziobowi, a co innego szukaæ œmierci.
	AI_Output (self, other,"DIA_Bullit_Eskort_06_07"); //Poszukaj frajera gdzie indziej.
	B_LogEntry(CH5_NC_Convoys, "Bulit nie da³ siê przekonaæ.");
	B_StopProcessInfos(self);
};

//******************************************

instance  DIA_Bullit_Attack (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 3;
	condition	= DIA_Bullit_Attack_Condition;
	information	= DIA_Bullit_Attack_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nie obawiasz siê ataku?"; 
};                       

FUNC int  DIA_Bullit_Attack_Condition()
{
	if (CHEST_KNOW == TRUE)&&(Npc_KnowsInfo (hero, DIA_Bullit_First))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Attack_Info()
{
	AI_Output (other, self, "DIA_Bullit_Attack_15_01"); //Nie obawiasz siê ataku?
	AI_Output (self, other,"DIA_Bullit_Attack_06_02"); //A czego tu siê baæ? Brama zamkowa bêdzie zamkniêta, wiêc rebelianci mog¹ nam naskoczyæ.
	AI_Output (self, other,"DIA_Bullit_Attack_06_02"); //Wystrzelamy ich jak kaczki z murów i przez kraty.
	AI_Output (other, self, "DIA_Bullit_Attack_15_03"); //Czyli atak na bramê zamkow¹ to czyste szaleñstwo...
	AI_Output (self, other,"DIA_Bullit_Attack_06_04"); //Raczej	samobójstwo. No chyba, ¿e ktoœ by bramê podniós³, ale raczej nikt nie jest a¿ takim idiot¹.
};

//******************************************

instance  DIA_Bullit_Guard (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 4;
	condition	= DIA_Bullit_Guard_Condition;
	information	= DIA_Bullit_Guard_Info;
	permanent	= 0;
	important	= 1;
	description	= ""; 
};                       

FUNC int  DIA_Bullit_Guard_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Guard_First))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Guard_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Bullit_Guard_06_01"); //S³ysza³em, jak stra¿nik wykopa³ Ciê z lochów. Lepiej siê tam teraz nie pchaæ.
	AI_Output (other, self,"DIA_Bullit_Guard_15_02"); //Dlaczego?
	AI_Output (self, other,"DIA_Bullit_Guard_06_03"); //Gomez zamkn¹³ w podziemiach Diego po tym, jak ten stary cap wróci³ do obozu, ¿eby spiskowaæ z cieniami. 
	AI_Output (self, other,"DIA_Bullit_Guard_06_04"); //Jutro maj¹ go straciæ.
	diego_dead = B_SetDayTolerance()+1;
	AI_Output (other, self,"DIA_Bullit_Guard_15_05"); //Magnaci nie boj¹ siê, ¿e po œmierci Diego, cienie siê zbuntuj¹?
	AI_Output (self, other,"DIA_Bullit_Guard_06_06"); //To skoñczy³oby siê krwaw¹ rzezi¹ cieni. Kruk ju¿ nas na to przygotowa³. 
	AI_Output (self, other,"DIA_Bullit_Guard_06_07"); //Poza tym egzekucja ma siê odbyæ po cichu w celi. PóŸniej Gomez chce wywiesiæ cia³o Diego na zamkowych murach.
	AI_Output (other, self,"DIA_Bullit_Guard_15_08"); //Kruk wyda³ taki rozkaz stra¿nikom?
	AI_Output (self, other,"DIA_Bullit_Guard_06_09"); //Tak. Tylko magnaci maj¹ tam wstêp.
	AI_Output (self, other,"DIA_Bullit_Guard_06_10"); //S³ysza³em, jak Kruk powiedzia³, ¿e nikogo innego nie mo¿na wpuszczaæ do celi z tym parszywym zdrajc¹.
	AI_Output (other, self,"DIA_Bullit_Guard_15_11"); //A kto przynosi jedzenie?
	AI_Output (self, other,"DIA_Bullit_Guard_06_12"); //Balam. Stra¿nik strasznie przy tym narzeka, ale zawsze wy¿era miêso dla Diego.
	AI_Output (other, self,"DIA_Bullit_Guard_15_13"); //Szkoda porz¹dnego pieczystego na chodz¹cego trupa.
	AI_Output (self, other,"DIA_Bullit_Guard_06_14"); //Dok³adnie.
	AI_Output (other, self,"DIA_Bullit_Guard_15_15"); //Muszê ju¿ iœæ.
	AI_Output (self, other,"DIA_Bullit_Guard_06_16"); //Tylko nie pl¹cz siê ju¿ po lochach.
	B_LogEntry(CH6_RBL_Diego, "Stra¿nik przed drzwiami nikogo nie przepuœci, a mam tylko dobê na uwolnienie Diego, zanim zostanie stracony. Ale zaczepi³ mnie Bullit. Stra¿nik twierdzi, ¿e prócz magnatów i Balama, który zanosi jeñcowi jedzenie, nikt nie ma tam dostêpu. Bullit doda³, ¿e stra¿nik zawsze zabiera miêso i sam je zjada. Mam pomys³, muszê tylko porozmawiaæ z Balamem.");

	Npc_ExchangeRoutine(self,"START");
};

//******************************************

instance  DIA_Bullit_Skip (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 5;
	condition	= DIA_Bullit_Skip_Condition;
	information	= DIA_Bullit_Skip_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dobrze znasz Skipa?"; 
};                       

FUNC int  DIA_Bullit_Skip_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Skip_Warehouse))
	{
		return 1;
	};
};

FUNC VOID  DIA_Bullit_Skip_Info()
{
	AI_Output (other, self,"DIA_Bullit_Skip_15_01"); //Dobrze znasz Skipa?
	AI_Output (self, other,"DIA_Bullit_Skip_06_02"); //Tak sobie, a bo co?
	AI_Output (other, self,"DIA_Bullit_Skip_15_03"); //Wspomnia³ coœ o mieczach osobistych stra¿ników Gomeza, które trzyma w magazynie. Jestem pewien, ¿e to bujda...
	AI_Output (self, other,"DIA_Bullit_Skip_06_04"); //A, te b³yskotki. Po tym jak jeden z tych gamoni przechla³ miecz, Gomez rozkaza³ je zamkn¹æ. Idiotyczna historia.
	AI_Output (other, self,"DIA_Bullit_Skip_15_05"); //Czyli Skip mówi³ prawdê?
	AI_Output (self, other,"DIA_Bullit_Skip_06_06"); //Niestety, tak. Zreszt¹, ten pacan zacz¹³ ostatnio ostro popijaæ. Ju¿ kilka razy widzia³em, jak po zmierzchu szpera w pakach z ry¿ówk¹.
	AI_Output (other, self,"DIA_Bullit_Skip_15_07"); //A po cholerê?
	AI_Output (self, other,"DIA_Bullit_Skip_06_08"); //A po co siê szuka wódy? ¯eby j¹ wypiæ!
	AI_Output (self, other,"DIA_Bullit_Skip_06_09"); //Tracê czas na rozmowê z idiot¹...
	B_LogEntry(CH6_RBL_Thievery, "Nie lubiê robiæ z siebie b³azna, ale czasami nie mam wyboru. Dziêki temu Bullit zdradzi³ mi, ¿e Skip po nocy buszuje w pakach z ry¿ówk¹. Muszê zaczekaæ do zmroku i pójœæ za Skipem. Jak bêdê szybki, to z³ojê mu skórê, zanim zorientuje siê, kto to by³. Klucz pewnie bêdzie mia³ przy sobie.");

	/*******************************
Ork zmieñ skipowi gld tak, ¿eby mo¿na by³o go zlaæ kiedy bêdzie przy tych pakach.
Aha chodzi o te paki pomiêdzy siedzib¹ magów a zamkiem, tu¿ pod murem. Niech tam stoi i chleje pó³ nocy.

*******************************/
};
