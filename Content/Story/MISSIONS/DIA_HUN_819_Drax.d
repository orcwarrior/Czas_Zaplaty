var int ore_check;
// **************************************************
// 						 EXIT 
// **************************************************

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Drax_Hello (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 1;
	condition		= DIA_Drax_Hello_Condition;
	information		= DIA_Drax_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 	
};

FUNC INT DIA_Drax_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Drax_Hello_Info()
{
	drax_warn = 0;
   
	AI_Output (other, self,  "DIA_Drax_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Drax_Hello_11_02"); //Nowa twarz. Skoro dotar³eœ a¿ tutaj w jednym kawa³ku, to mo¿esz siê przydaæ.
	AI_Output (self, other, "DIA_Drax_Hello_11_03"); //Widzisz tamto wzgórze?
	AI_Output (other, self,  "DIA_Drax_Hello_15_04"); //Tych kilka wzniesieñ?
	AI_Output (self, other, "DIA_Drax_Hello_11_05"); //Tak, tam gdzie pal¹ siê ogniska.
	AI_Output (self, other, "DIA_Drax_Hello_11_06"); //Problem tkwi w tym, ¿e jeszcze wczoraj by³o tam puœciutko. 
	AI_Output (self, other, "DIA_Drax_Hello_11_07"); //Kiedy wsta³em o œwicie i podla³em pieñ, poczu³em sw¹d palonych bierwion.
	AI_Output (self, other, "DIA_Drax_Hello_11_08"); //Nie wiem, kto tam koczuje, ale na pewno robi to za blisko naszego obozu.
	AI_Output (self, other, "DIA_Drax_Hello_11_09"); //Jak chcesz siê przys³u¿yæ rebeliantom, to zainteresuj siê tymi cwaniakami.
	AI_Output (other, self,  "DIA_Drax_Hello_15_10"); //W porz¹dku, rozejrzê siê.
	AI_Output (self, other, "DIA_Drax_Hello_11_11"); //Tylko b¹dŸ ostro¿ny. Nie chcia³bym mieæ Ciê na sumieniu.
	AI_Output (other, self,  "DIA_Drax_Hello_15_12"); //Bez obaw. Potrafiê o siebie zadbaæ.
	AI_Output (other, self,  "DIA_Drax_Hello_15_13"); //Wrócê niebawem.
	Log_CreateTopic	(CH1_Rbl_Camp, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Camp, "Drax obawia siê o to, kto rozbi³ obozowisko w pobli¿u Obozu Rebeliantów. Da³ mi do zrozumienia, ¿e powinienem rozejrzeæ siê w sytuacji. Warto zdobyæ sobie kolejnego sprzymierzeñca, wiêc chyba przyjrzê siê bli¿ej temu obozowi.");
	Npc_ExchangeRoutine	(self,"start");
};

var int drax_quest;

INSTANCE DIA_Drax_Camp (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 2;
	condition		= DIA_Drax_Camp_Condition;
	information		= DIA_Drax_Camp_Info;
	permanent		= 1;
	important		= 0;
	description		= "By³em w tamtym obozie."; 	
};

FUNC INT DIA_Drax_Camp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))&&(Npc_KnowsInfo (hero, DIA_Drax_Hello))&& (drax_quest==false)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Camp_Info()
{
	AI_Output (other, self,  "DIA_Drax_Camp_15_01"); //By³em w tamtym obozie.

	if (Npc_IsDead(camper_1))&&(Npc_IsDead(camper_2))&&(Npc_IsDead(camper_3))&&(Npc_IsDead(camper_4))
	{
		drax_trust = TRUE;
		drax_quest = TRUE;
		B_GiveXP(500);
		rebel_camp_trust = rebel_camp_trust + 1; 
      
		AI_Output (self, other, "DIA_Drax_Camp_11_02"); //Rzeczywiœcie nikt ju¿ siê tam nie krêci.
		AI_Output (self, other, "DIA_Drax_Camp_11_03"); //Dobra robota. Cavalorn us³yszy ode mnie, ¿e mo¿esz byæ cennym nabytkiem dla obozu.

		Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_Camp, "Zabi³em bandytów w obozie na wzgórzu. Drax poprze mnie przed Cavalornem.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Po pozbyciu siê bandytów w obozie na wzgórzu zdoby³em poparcie w osobie Draxa.");
	}
	else
	{
		if (drax_warn==0)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_04"); //Doprawdy?
			AI_Output (self, other, "DIA_Drax_Camp_11_05"); //Nie wydaje mi siê. Nadal widzê tam jakiœ ludzi.
			AI_Output (self, other, "DIA_Drax_Camp_11_06"); //Nastêpnym razem powiedz prawdê, bo bêdê musia³ Ciê obiæ.
			
         B_LogEntry		(CH1_Rbl_Camp, "Powinienem zabiæ bandytów w tamtym obozie.");
		};
      
		if (drax_warn == 1)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_07"); //Chyba nie wyrazi³em siê doœæ jasno ostatnim razem.
			AI_Output (self, other, "DIA_Drax_Camp_11_08"); //Zabij tych skurwieli, albo nie pokazuj mi siê na oczy.
			AI_Output (self, other, "DIA_Drax_Camp_11_09"); //A teraz won!
			
         B_LogEntry		(CH1_Rbl_Camp, "Drax nie da³ siê oszukaæ. Albo zabijê bandytów z obozu, albo mogê sobie napytaæ biedy.");
		};
      
		if (drax_warn == 2)
		{
			AI_Output (self, other, "DIA_Drax_Camp_11_10"); //Albo jesteœ bezczelny, albo po prostu g³upi!
			AI_Output (self, other, "DIA_Drax_Camp_11_11"); //Pora na ma³¹ nauczkê!
			
         Log_SetTopicStatus	(CH1_Rbl_Camp, LOG_FAILED);
			B_LogEntry		(CH1_Rbl_Camp, "K³amstwo jednak nie pop³aca. Drax siê na mnie rzuci³ i raczej w¹tpiê, ¿e powie o mnie Cavalornowi coœ dobrego.");
			B_LogEntry		(CH1_Rbl_RebelCampTrust, "Nie zdoby³em poparcia Draxa - czasami jednak nie warto k³amaæ.");
			B_StopProcessInfos	(self); 
         B_StartAfterDialogFight(self,other,false);
		};
      
		drax_warn = drax_warn + 1;
		B_StopProcessInfos	(self); 
	};
};

INSTANCE DIA_Drax_Sweets (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 3;
	condition		= DIA_Drax_Sweets_Condition;
	information		= DIA_Drax_Sweets_Info;
	permanent		= 1;
	important		= 0;
	description		= "Przyszed³em po konfitury."; 	
};

FUNC INT DIA_Drax_Sweets_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Again))&&(ore_check == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Sweets_Info()
{
	drax_getlost = 0;
   
	AI_Output (other, self,  "DIA_Drax_Sweets_15_01"); //Przyszed³em po konfitury.
   
	if (NPC_HasItems(other,ItMiNugget)>=200)
	{
		ore_check = TRUE;
		
      AI_Output (self, other, "DIA_Drax_Sweets_11_02"); //Czy¿by Fox zg³odnia³? Najpierw ruda, potem smako³yki.
		AI_Output (other, self,  "DIA_Drax_Sweets_15_03"); //Mam 200 bry³ek na 10 weków.
		AI_Output (self, other, "DIA_Drax_Sweets_11_04"); //To za ma³o. Za 200 dostaniesz najwy¿ej 5.
		
      Info_ClearChoices (DIA_Drax_Sweets);
		Info_AddChoice (DIA_Drax_Sweets, "Niech bêdzie!", Drax_Sweets1);
		Info_AddChoice (DIA_Drax_Sweets, "le kombinujesz!", Drax_Sweets2);
	}
	else
	{
		AI_Output (other, self,  "DIA_Drax_Sweets_15_05"); //Mam 200 bry³ek na 10 weków.
		AI_Output (self, other, "DIA_Drax_Sweets_11_06"); //Jesteœ pewien, ¿e masz 200 bry³ek?
		AI_Output (self, other, "DIA_Drax_Sweets_11_07"); //Wróæ z rud¹, wtedy pogadamy.
      
		B_StopProcessInfos	(self);
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// ------------------------------------1--------------------------------
FUNC VOID Drax_Sweets1()
{	
	AI_Output (other, self,"Drax_Sweets1_15_01"); //Niech bêdzie. Oto ruda.
   
	B_GiveInvItems (other, self, ItMiNugget, 200);
   
	AI_Output (self, other,"Drax_Sweets1_11_02"); //Interesy z Tob¹ to czysta przyjemnoœæ.
	
   CreateInvItems (self,konfitury,5);
	B_GiveInvItems (self, other, konfitury, 5);
	B_LogEntry		(CH1_Rbl_Food, "Drax sprzeda³ mi 5 weków konfitur za 200 bry³ek rudy. Mam nadziejê, ¿e to wystarczy Foxowi.");
	B_StopProcessInfos	(self);
};

// ------------------------------------2--------------------------------
FUNC VOID Drax_Sweets2()
{	
	drax_getlost = 1;	
	
   AI_Output (other, self,"Drax_Sweets2_15_01"); //le kombinujesz. Powiedzia³em 10 weków za 200 bry³ek!
	AI_Output (self, other,"Drax_Sweets2_11_02"); //Spokojnie, mo¿e siê jakoœ dogadamy.
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Drax_Talk (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Talk_Condition;
	information		= Info_Drax_Talk_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Drax_Talk_Condition()
{	
	if (drax_getlost == 1)&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Talk_Info()
{	
	AI_Output (other, self,"Info_Drax_Talk_15_01"); //Co to za propozycja?
	AI_Output (self, other,"Info_Drax_Talk_11_02"); //Zap³acisz za 5 weków 150 bry³ek. Ty zarobisz 50 bry³ek, a ja dzisiaj zasnê z poczuciem dobrze spe³nionego obowi¹zku.
	AI_Output (self, other,"Info_Drax_Talk_11_03"); //To jak bêdzie?
	
   Info_ClearChoices (Info_Drax_Talk);
	Info_AddChoice (Info_Drax_Talk, "Czemu nie.", Info_Drax_Talk1);
	Info_AddChoice (Info_Drax_Talk, "Nie ma mowy!", Info_Drax_Talk2);
};

// ------------------------------------1--------------------------------
FUNC VOID Info_Drax_Talk1()
{	
	AI_Output (other, self,"Info_Drax_Talk1_15_01"); //Czemu nie, brzmi rozs¹dnie.
	
   B_GiveInvItems (other, self, ItMiNugget, 150);
	
   AI_Output (self, other,"Info_Drax_Talk1_02_02"); //I tak siê w³aœnie robi interesy.
	
   CreateInvItems (self,konfitury,5);
	B_GiveInvItems (self, other, konfitury, 5);
	B_LogEntry		(CH1_Rbl_Food, "Drax sprzeda³ mi 5 weków konfitur za 150 bry³ek rudy. Zarobi³em na tym 50 bry³ek. Mam nadziejê, ¿e Fox bêdzie zadowolony.");
	B_StopProcessInfos	(self);
};

////////////////////////////////////Edit By Fenix////////////////////////////////////////////////////////////////////
// ------------------------------------2--------------------------------
FUNC VOID Info_Drax_Talk2()
{	
	AI_Output (other, self,"Info_Drax_Talk2_15_01"); //Nie ma mowy. Powiedzia³em 10 weków za 200 bry³ek.
	AI_Output (self, other,"Info_Drax_Talk2_11_02"); //A niech Ciê szlag trafi. Bierz te cholerne konfitury i daj mi spokój!
	
   B_GiveInvItems (other, self, ItMiNugget, 200);
	CreateInvItems (self,konfitury,10);
	B_GiveInvItems (self, other, konfitury, 10);
   
	AI_Output (other, self,"Info_Drax_Talk2_15_03"); //Interesy z Tob¹ to prawdziwa przyjemnoœæ.

	B_LogEntry		(CH1_Rbl_Food, "Nie da³em siê oszukaæ Draxowi. Dosta³em 10 weków konfitur za 200 bry³ek, choæ nie by³o ³atwo. Czas oddaæ przysmaki Foxowi.");
	drax_getlost = drax_getlost + 1;
	B_StopProcessInfos	(self);
};

INSTANCE Info_Drax_Trust (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Trust_Condition;
	information		= Info_Drax_Trust_Info;
	important		= 1;
	permanent		= 0;
};                       

FUNC INT Info_Drax_Trust_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Fox_Final)) && (drax_getlost ==2)
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Trust_Info()
{	
	AI_Output (self, other,"Info_Drax_Trust_11_01"); //Zaczekaj!
	AI_Output (self, other,"Info_Drax_Trust_11_02"); //Obrabowa³eœ mnie ze wszystkich konfitur. A do tego mój dostawca nie daje znaków ¿ycia.
	AI_Output (self, other,"Info_Drax_Trust_11_03"); //Mam dla Ciebie propozycjê.
	AI_Output (other, self,"Info_Drax_Trust_15_04"); //S³ucham, tylko siê streszczaj.
	AI_Output (self, other,"Info_Drax_Trust_11_05"); //Konfitur dostarcza mi pewien typ, który ukrywa siê w pobli¿u Starego Obozu.
	AI_Output (self, other,"Info_Drax_Trust_11_06"); //Nie mam pojêcia, gdzie dok³adnie mieszka. Jedyne co wiem to, ¿e ma na imiê Gilbert.
	AI_Output (self, other,"Info_Drax_Trust_11_07"); //Niestety od kilku dni nie pojawi³ siê, a do tej pory zawsze na czas przynosi³ mi konfitury.
	AI_Output (self, other,"Info_Drax_Trust_11_08"); //Poszukaj Gilberta i zdob¹dŸ dla mnie co najmniej 20 weków z konfiturami.
	AI_Output (self, other,"Info_Drax_Trust_11_09"); //Dobrze zap³acê za ka¿dy s³oiczek.
	
   Info_ClearChoices (Info_Drax_Trust);
	Info_AddChoice (Info_Drax_Trust, "Mogê spróbowaæ.", Info_Drax_Trust1);
	Info_AddChoice (Info_Drax_Trust, "Nie mam czasu na pierdo³y.", Info_Drax_Trust2);
};

// ------------------------------------1--------------------------------
FUNC VOID Info_Drax_Trust1()
{	
	AI_Output (other, self,"Info_Drax_Trust1_15_01"); //Mogê spróbowaæ.
	AI_Output (self, other,"Info_Drax_Trust1_11_02"); //To œwietnie! Wróæ z konfiturami.
	
   drax_getlost = drax_getlost + 1;//3
	Log_CreateTopic	(CH1_Rbl_FindGilbert, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_FindGilbert, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_FindGilbert, "Drax poprosi³ mnie o odnalezienie tajemniczego Gilberta - osoby, która dostarcza mu konfitury. Wiem tylko, ¿e Gilbert mieszka gdzieœ w pobli¿u Starego Obozu. Drax potrzebuje 20 s³oików konfitur.");
	B_StopProcessInfos	(self);
};
// ------------------------------------2--------------------------------
FUNC VOID Info_Drax_Trust2()
{	
	AI_Output (other, self,"Info_Drax_Trust2_15_01"); //Nie mam czasu na pierdo³y.
	AI_Output (self, other,"Info_Drax_Trust2_11_02"); //Cholera, przez Ciebie bêdê musia³ sam w³óczyæ siê za Gilbertem.
	AI_Output (self, other,"Info_Drax_Trust2_11_03"); //ZejdŸ mi z oczu!
	
   B_StopProcessInfos	(self);
};

INSTANCE DIA_Drax_Konfitury (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 7;
	condition		= DIA_Drax_Konfitury_Condition;
	information		= DIA_Drax_Konfitury_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam konfitury od Gilberta."; 	
};

FUNC INT DIA_Drax_Konfitury_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gilbert_BerrysOk))&&(NPC_HasItems(other,konfitury)>=20)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Konfitury_Info()
{
	B_GiveXP(250);
   
	AI_Output (other, self,  "DIA_Drax_Konfitury_15_01"); //Mam konfitury od Gilberta.
	AI_Output (self, other, "DIA_Drax_Konfitury_11_02"); //W koñcu. Fox ju¿ mi ¿yæ nie daje.
	AI_Output (self, other, "DIA_Drax_Konfitury_11_03"); //Oto twoja ruda, z rêki do rêki.
	
   CreateInvItems(self,ItMiNugget,100);
	B_GiveInvItems(self,other,ItMiNugget,100);
	B_GiveInvItems(other,self,konfitury,20);
	Npc_RemoveInvItems(self,konfitury,NPC_HasItems(self,konfitury));
	Log_SetTopicStatus	(CH1_Rbl_FindGilbert, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_FindGilbert, "Dostarczy³em Draxowi 20 s³oików konfitur. Ca³kiem nieŸle za nie zap³aci³. Teraz Fox bêdzie móg³ przez jakiœ czas ob¿eraæ siê swoim przysmakiem.");
};

INSTANCE DIA_Drax_Attack (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 11;
	condition		= DIA_Drax_Attack_Condition;
	information		= DIA_Drax_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Drax_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Attack_Info()
{
	AI_Output (self, other, "DIA_Drax_Attack_11_01"); //Ty pieprzony gnoju!
	AI_Output (self, other, "DIA_Drax_Attack_11_02"); //Spróbuj zadrzeæ ze mn¹...
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Drax_Stew (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 12;
	condition		= DIA_Drax_Stew_Condition;
	information		= DIA_Drax_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Lubisz gulasz?"; 
};

FUNC INT DIA_Drax_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(hero, ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Drax_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Drax_Stew_15_01"); //Lubisz gulasz?
	AI_Output (self, other, "DIA_Drax_Stew_11_02"); //Wolê kawior, ale dawaj, co tam masz.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Drax powybrzydza³, ale spa³aszowa³ ca³¹ miskê."); 
};

INSTANCE DIA_DRAX_Spy (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 13;
	condition		= DIA_DRAX_Spy_Condition;
	information		= DIA_DRAX_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zamyœli³eœ siê..."; 
};

FUNC INT DIA_DRAX_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DRAX_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_DRAX_Spy_15_01"); //Zamyœli³eœ siê...
	AI_Output (self, other, "DIA_DRAX_Spy_07_02"); //Co? Coœ mówi³eœ?
	AI_Output (other, self, "DIA_DRAX_Spy_15_03"); //By³eœ jakiœ nieobecny.
	AI_Output (self, other, "DIA_DRAX_Spy_07_04"); //Wydaje Ci siê. Zreszt¹ co Ciê to obchodzi. 
	AI_Output (other, self, "DIA_DRAX_Spy_15_05"); //Wszyscy nale¿ymy do tego samego... stada. To naturalne, ¿e martwiê siê o tych, którzy byæ mo¿e bêd¹ walczyæ u mego boku.
	AI_Output (self, other, "DIA_DRAX_Spy_07_06"); //Walka... Tak, krew i ogieñ. Nied³ugo czeka nas wszystkich próba ognia...
	AI_Output (other, self, "DIA_DRAX_Spy_15_07"); //Co masz na myœli?
	AI_Output (self, other, "DIA_DRAX_Spy_07_08"); //Niewa¿ne. Nied³ugo sam siê przekonasz. Bywaj.
	
   B_LogEntry		(CH2_Rbl_Spy, "Drax wydaje siê jakiœ nieobecny. Przeb¹kiwa³ coœ o walce. Chyba powinienem mieæ go na oku.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
      
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		
      B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_DRAX_Spy1 (C_INFO)
{
	npc				= HUN_819_DRAX;
	nr				= 14;
	condition		= DIA_DRAX_Spy1_Condition;
	information		= DIA_DRAX_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ciekawe co przyniesie nam nowy dzieñ..."; 
};

FUNC INT DIA_DRAX_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_DRAX_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_DRAX_Spy1_15_01"); //Ciekawe co przyniesie nam nowy dzieñ...
	AI_Output (self, other, "DIA_DRAX_Spy1_07_02"); //To co poprzedni, czyli nic dobrego.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_03"); //Co masz na myœli?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_04"); //Nic, tak sobie tylko gadam.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_05"); //Zreszt¹ co mi tam.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_06"); //W tym obozie dzieje siê coœ dziwnego. Ludzie przestaj¹ sobie ufaæ.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_07"); //Pad³ na nas blady cieñ Gomeza i to chyba dos³ownie.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_08"); //Mów jaœniej.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_09"); //Czy Ty mnie w ogóle s³uchasz?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_10"); //Przecie¿ mówiê, ¿e ktoœ tu wêszy!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_11"); //Masz jakieœ podejrzenia?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_12"); //Mo¿e i mam, ale to moja sprawa.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_13"); //Nie tylko twoja, wszyscy nale¿ymy do tego obozu.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_14"); //Hmm... W sumie racja.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_15"); //Tylko zachowaj to dla siebie.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_16"); //Kilka dni temu widzia³em jak R¹czka rozmawia z kimœ w lesie!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_17"); //I?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_18"); //Kiedy sobie poszed³, podkrad³em siê do tamtego miejsca, ale nie znalaz³em ¿adnych œladów.
	AI_Output (self, other, "DIA_DRAX_Spy1_07_19"); //Za to sta³ tam pieñ z³amanego drzewa. Wydaje mi siê, ¿e R¹czka gada³ z cholern¹ roœlin¹!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_20"); //A co w tym z³ego?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_21"); //Ano to, ¿e s³ysza³em, jak ten pieñ mu odpowiada!
	AI_Output (other, self, "DIA_DRAX_Spy1_15_22"); //Oczywiœcie nic wczeœniej nie pi³eœ...
	AI_Output (self, other, "DIA_DRAX_Spy1_07_23"); //By³em trzeŸwy, wiem, co s³ysza³em.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_24"); //Mo¿e by³ tam ktoœ jeszcze?
	AI_Output (self, other, "DIA_DRAX_Spy1_07_25"); //Nie wydaje mi siê. Akurat Tony wraca³ z patrolu w lesie. Skin¹³ mi rêk¹ na chwilê przed tym, jak zauwa¿y³em R¹czkê.
	AI_Output (other, self, "DIA_DRAX_Spy1_15_26"); //Hmm, to mi ju¿ chyba wystarczy.
	B_LogEntry		(CH2_Rbl_Spy, "Bardziej zawi³ej historyjki ni¿ ta Draxa ju¿ dawno nie s³ysza³em. W ka¿dym razie przewinê³y siê przez ni¹ dwa imiona: R¹czka i Tony.");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Drax_NewSword (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_NewSword_Condition;
	information		= Info_Drax_NewSword_Info;
	permanent		= 0;
	important		= 0;
	description		= "To Twój nowy przyjaciel."; 
};                       

FUNC INT Info_Drax_NewSword_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(hero,HUN_MW_03)>=1)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_NewSword_Info()
{	
	B_GiveXP(100);
   
	AI_Output (other, self,"Info_Drax_NewSword15_01"); //To Twój nowy przyjaciel.
	AI_Output (self, other,"Info_Drax_NewSword_11_02"); //O czym Ty mówisz?
	AI_Output (other, self,"Info_Drax_NewSword15_03"); //Mam dla Ciebie nowy miecz od Foxa.
	AI_Output (self, other,"Info_Drax_NewSword_11_04"); //Dobra, daj to ¿elastwo i podziêkuj Foxowi.
	B_GiveInvItems (other, self, HUN_MW_03, 1);
	B_LogEntry		(CH3_RBL_DelivWeapon, "Drax te¿ dosta³ nowego 'przyjaciela'.");
};

/*******************
Side quest

********************/

// ************************************************************

INSTANCE Info_Drax_Chest (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Chest_Condition;
	information		= Info_Drax_Chest_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_Chest_Condition()
{	
	/*******************
WP z chaty Draxa, ork wsadŸ mu do skrzyni 5x konfitury_chest 
******************/
	if (Npc_KnowsInfo(hero, DIA_Whistler_RevangeOk))&&(NPC_HasItems(hero, konfitury_chest)>=5)&&(Npc_GetDistToWP(hero, "DRAX_SHOP_PATCH")<=600)&&(Mob_HasItems ("OR_CHEST_DRAX", konfitury_fake)>=5)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_Chest_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"Info_Drax_Chest_15_01"); //O cholera, chyba ktoœ idzie...
	AI_GotoNpc(self, other);
	AI_Output (self, other,"Info_Drax_Chest_11_02"); //Co Ty tu robisz?!
	AI_Output (other, self,"Info_Drax_Chest_15_03"); //E nic, rozgl¹da³em siê tylko...
	AI_Output (self, other,"Info_Drax_Chest_11_04"); //Mam nadziejê, ¿e nie dotyka³eœ mojej skrzyni...
	B_StopProcessInfos	(self);

	/******************
Ork dorób ten wp pod skrzyni¹
******************/

	// 	AI_GotoWP 			(self,	"DRAX_CHEST");
	// 	AI_AlignToWP		(self);
	// 	AI_PlayAni			(self,	"T_PLUNDER");
};

// ************************************************************

INSTANCE Info_Drax_ChestCheck (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_ChestCheck_Condition;
	information		= Info_Drax_ChestCheck_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_ChestCheck_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Drax_Chest))&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_ChestCheck_Info()
{	
	/***********************
Teoretycznie powinno dzia³aæ, ale gracz móg³ wyrzuciæ konfitury i nie wsadziæ do skkrzyni. Je¿eli da siê sprawdziæ zawartoœæ okreœlonej skrzyni to dodaj to do warunku poprzedniego dialogu.
***********************/

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Drax_ChestCheck_11_01"); //Mniej wiêcej wszystko jest na miejscu. Ale co tu tak cuchnie?
	AI_Output (other, self,"Info_Drax_ChestCheck_15_02"); //To chyba ja...
	AI_Output (self, other,"Info_Drax_ChestCheck_11_03"); //IdŸ siê umyj cz³owieku i won z mojej chaty!
	
   B_LogEntry		(CH1_RBL_Revange, "Uda³o mi siê podmieniæ konfitury. Czas wracaæ do Œwistaka.");

	/**************
Na drugi dzieñ Drax zaczepi Dicka
***************/

	drax_sell = B_SetDayTolerance()+1;
};

// ************************************************************

INSTANCE Info_Drax_Revange (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_Revange_Condition;
	information		= Info_Drax_Revange_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};                       

FUNC INT Info_Drax_Revange_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 600)
   && ((Npc_KnowsInfo(hero, Info_Drax_ChestCheck)&&(drax_sell <= Wld_GetDay())) 
   || Npc_KnowsInfo(hero, DIA_Whistler_RevangeDone))
	{
		return 1;
	};
};

FUNC VOID Info_Drax_Revange_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Drax_Revange_11_01"); //Ty œmierdz¹cy z³odzieju!
	AI_Output (other, self,"Info_Drax_Revange_15_02"); //Nie wiem o czym mówisz...
	AI_Output (self, other,"Info_Drax_Revange_11_03"); //To Ty grzeba³eœ w mojej skrzyni z konfiturami! Podmieni³eœ je na te cuchn¹ce pomyje!
	AI_Output (self, other,"Info_Drax_Revange_11_04"); //Na szczêœcie sam otworzy³em jeden wek przed snem. Dobrze, ¿e to nie by³ jeden z moich klientów.
	AI_Output (self, other,"Info_Drax_Revange_11_05"); //Przez Ciebie zarzyga³em ca³¹ chatê!
	AI_Output (other, self,"Info_Drax_Revange_15_06"); //Spokojnie, mogê to wyt³umaczyæ...
	AI_Output (self, other,"Info_Drax_Revange_11_07"); //A co tu jest do t³umaczenia. Jesteœ z³odziejem, a dla takich jest tylko jedna kara!
	AI_Output (other, self,"Info_Drax_Revange_15_08"); //Zaczekaj! To Œwistak mnie namówi³...
	AI_Output (self, other,"Info_Drax_Revange_11_09"); //A to pod³a menda! 
	AI_Output (self, other,"Info_Drax_Revange_11_10"); //Chce wojny? To bêdzie j¹ mia³!
	AI_Output (self, other,"Info_Drax_Revange_11_11"); //S³uchaj. Zapomnê o sprawie, pod jednym warunkiem.
	AI_Output (other, self,"Info_Drax_Revange_15_12"); //Tak?
	AI_Output (self, other,"Info_Drax_Revange_11_13"); //Ukradniesz z jego chaty perliste ber³o. To jedno z jego ulubionych œwiecide³ek.
	AI_Output (other, self,"Info_Drax_Revange_15_14"); //Chyba nie mam wyboru...
	AI_Output (self, other,"Info_Drax_Revange_11_15"); //Szybko siê uczysz. A teraz idŸ coœ ukraœæ, w koñcu w tym jesteœ najlepszy.

	B_LogEntry(CH1_RBL_Revange, "To jeszcze nie koniec. Drax mnie zdemaskowa³. Muszê ukraœæ dla niego perliste ber³o z chaty Œwistaka...");
   
   Wld_insertItem(ItMw_Whistler_Toy, "HC_HUTIN_X");
};

// ************************************************************

INSTANCE Info_Drax_RevangeDone (C_INFO)
{
	npc			= HUN_819_DRAX;
	condition		= Info_Drax_RevangeDone_Condition;
	information		= Info_Drax_RevangeDone_Info;
	permanent		= 0;
	important		= 0;
	description		= "WeŸ ber³o i zapomnijmy o sprawie."; 
};                       

FUNC INT Info_Drax_RevangeDone_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Drax_Revange))&&(NPC_HasItems(other,ItMw_Whistler_Toy)>=1)
	{
		return 1;
	};
};
FUNC VOID Info_Drax_RevangeDone_Info()
{	
	AI_Output (other, self,"Info_Drax_RevangeDone_15_01"); //WeŸ ber³o i zapomnijmy o sprawie.
	AI_Output (self, other,"Info_Drax_RevangeDone_11_02"); //Niestrawnoœæ by³a tego warta!
   
	B_GiveInvItems (other, self, ItMw_Whistler_Toy, 1);
	Npc_RemoveInvItems(self,ItMw_Whistler_Toy,1);
   
	AI_Output (self, other,"Info_Drax_RevangeDone_11_03"); //Zrobiê sobie z tego pogrzebacz. Albo przepychacz w kloace... 
	AI_Output (self, other,"Info_Drax_RevangeDone_11_04"); //Hmm, muszê siê zastanowiæ.
	AI_Output (other, self,"Info_Drax_RevangeDone_15_05"); //Czyli jesteœmy kwita?
	AI_Output (self, other,"Info_Drax_RevangeDone_11_06"); //Tak, ju¿ o wszystkim zapomnia³em.
	B_LogEntry		(CH1_RBL_Revange, "Drax dosta³ ber³o i zapomnia³ o sprawie. Ma³o brakowa³o...");
};
