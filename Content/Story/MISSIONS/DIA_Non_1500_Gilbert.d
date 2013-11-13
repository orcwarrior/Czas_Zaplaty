// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam zbyt czêsto goœci!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widzê, ¿e niez³y cwaniak z Ciebie. Tak znaleŸæ moj¹ kryjówkê, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia³em ju¿ doœæ Starego Obozu. Podpad³em paru ludziom Gomeza. To by³o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju¿ o mnie nie pamiêta, ale ja siê st¹d nie ruszam. Jak na mój gust - w Starym Obozie wci¹¿ jest za du¿o têpych osi³ków.


};


instance DIA_Gilbert_Ask (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 2;
	condition	= DIA_Gilbert_Ask_Condition;
	information	= DIA_Gilbert_Ask_Info;
	permanent	= 0;
	description = "Przysy³a mnie Drax.";
};                       

FUNC int DIA_Gilbert_Ask_Condition()
{
	if (Npc_KnowsInfo(other,  Info_Drax_Trust)) && (Npc_KnowsInfo(other,  DIA_Gilbert_Hallo)) &&  (drax_getlost == 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_Ask_Info()
{
	drax_getlost = drax_getlost + 1;//4
	AI_Output (other, self,"DIA_Gilbert_Ask_15_00"); //Przysy³a mnie Drax.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_01"); //Pewnie po konfitury.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_02"); //W rzeczy samej. Drax straci³ ca³y zapas konfitur, a popyt nadal roœnie.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_03"); //Mia³em dostarczyæ kolejn¹ partiê kilka dni temu, ale chyba zwichn¹³em nogê schodz¹c z grani.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_04"); //To niedobrze.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_05"); //Mi to mówisz? Ledwo dowlok³em siê z powrotem do kryjówki. Wolê nie myœleæ co wœciek³e psy Gomeza by ze mn¹ zrobi³y gdyby mnie dorwali.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_06"); //A¿ tak zalaz³eœ im za skórê?
	AI_Output (self, other,"DIA_Gilbert_Ask_04_07"); //Od jakiegoœ czasu pomagam rebeliantom. Raz podczas wymiany z Draxem zaskoczy³o nas kilku stra¿ników.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_08"); //Dwóch za³atwiliœmy, ale jeden da³ nogê. Do tego ten gnojek zna³ mnie ju¿ wczeœniej. W Starym Obozie jestem spalony.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_09"); //Sam siê sobie dziwiê, ale robienie konfitur sprawia mi prawdziw¹ radoœæ.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_10"); //Uspokajam siê przy tym no i mam zajêcie.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_11"); //Tylko, ¿e teraz przez spuchniêt¹ kostkê nie dam rady nazbieraæ jagód.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_12"); //Chyba móg³bym Ci pomóc. 
	AI_Output (self, other,"DIA_Gilbert_Ask_04_13"); //To œwietnie. Przynieœ mi jagód zerwanych z co najmniej 10 krzaczków.
	AI_Output (self, other,"DIA_Gilbert_Ask_04_14"); //Powinno tego wystarczyæ na jakieœ 20 weków konfitur.
	AI_Output (other, self,"DIA_Gilbert_Ask_15_15"); //W porz¹dku, rozejrzê siê za jagodami. 
	AI_Output (self, other,"DIA_Gilbert_Ask_04_16"); //Aha i jeszcze jedno. Je¿eli znajdziesz wiêcej jagód to wezmê ka¿d¹ iloœæ. Bez obaw, zap³acê rud¹.
	B_LogEntry		(CH1_Rbl_FindGilbert, "Gilbert zrobi konfitury dla Draxa, ale muszê przynieœæ mu jagód. Wystarczy owoców z 10 krzaków. Za jagody Gilbert zap³aci rud¹.");
};

var int gilbert_trade;
var int gilbert_berrys;


instance DIA_Gilbert_Berrys (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 3;
	condition	= DIA_Gilbert_Berrys_Condition;
	information	= DIA_Gilbert_Berrys_Info;
	permanent	= 1;
	description = "Mam jagody.";
};                       

FUNC int DIA_Gilbert_Berrys_Condition()
{
	if (Npc_KnowsInfo(other,  DIA_Gilbert_Ask)) &&  (drax_getlost == 4) && (gilbert_trade == FALSE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_Berrys_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Berrys_15_00"); //Mam jagody.
	if (NPC_HasItems(other,ItFo_Plants_Berrys_01)>=10)
	{
		gilbert_trade = TRUE;
		B_GiveXP(100);
		drax_getlost = drax_getlost + 1;//5
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_01"); //To œwietnie. Daj mi je.
		B_GiveInvItems (other, self, ItFo_Plants_Berrys_01, 10);
		Npc_RemoveInvItems(self,ItFo_Plants_Berrys_01,10);
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_02"); //PrzyjdŸ jutro, konfitury bêd¹ wtedy gotowe.
		AI_Output (other, self,"DIA_Gilbert_Berrys_15_03"); //20 weków?
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_04"); //Co najmniej 20.
		gilbert_berrys = B_SetDayTolerance()+1;
		B_LogEntry		(CH1_Rbl_FindGilbert, "Przynios³em Gilbertowi jagody. Mam wróciæ jutro po 20 weków konfitur.");
	}
	else
	{
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_05"); //Mo¿e i masz, ale za ma³o. Wróæ z wiêksz¹ iloœci¹.
		AI_Output (self, other,"DIA_Gilbert_Berrys_04_06"); //Pamiêtaj, ¿e potrzebujê owoców z co najmniej 10 krzaczków.
	};
};

instance DIA_Gilbert_BerrysOk (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 4;
	condition	= DIA_Gilbert_BerrysOk_Condition;
	information	= DIA_Gilbert_BerrysOk_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC int DIA_Gilbert_BerrysOk_Condition()
{
	if (gilbert_berrys <= (Wld_GetDay())) &&  (drax_getlost == 5)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_BerrysOk_Info()
{
	B_GiveXP(150);
	drax_getlost = drax_getlost + 1;//6
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_01"); //Konfitury ju¿ gotowe. Tak jak siê umawialiœmy, 20 s³oików.
	CreateInvItems (self, konfitury,20); 
	B_GiveInvItems (self, other, konfitury, 20);
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_02"); //Zanieœ je Draxowi
	AI_Output (other, self,"DIA_Gilbert_BerrysOk_15_03"); //Dziêki. Postaram siê ich nie zjeœæ po drodze.
	AI_Output (self, other,"DIA_Gilbert_BerrysOk_04_04"); //I pamiêtaj, ¿e zawsze mo¿esz mi sprzedaæ jagody.
	B_LogEntry		(CH1_Rbl_FindGilbert, "W koñcu mam konfitury dla Draxa - wszystkie 20 weków.");
	Log_CreateTopic   	(CH1_Rbl_Gilbert,LOG_NOTE);
	B_LogEntry(CH1_Rbl_Gilbert, "Gilbert kupi ode mnie ka¿d¹ iloœæ jagód.");


};

INSTANCE DIA_Gilbert_Buy (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 15;
	condition		= DIA_Gilbert_Buy_Condition;
	information		= DIA_Gilbert_Buy_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Mam jagody na sprzeda¿.";
};                       

FUNC INT DIA_Gilbert_Buy_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gilbert_BerrysOk))
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Buy_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Buy_15_00"); //Mam jagody na sprzeda¿.
	if (NPC_HasItems(other,ItFo_Plants_Berrys_01)>0)
	{
		AI_Output (self, other,"DIA_Gilbert_Buy_07_01"); //To œwietnie. A to Twoja ruda.
		CreateInvItems(self,ItMiNugget,15*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveInvItems(self,other,ItMiNugget,15*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveXP(5*NPC_HasItems(other,ItFo_Plants_Berrys_01));
		B_GiveInvItems (other,self,ItFo_Plants_Berrys_01,NPC_HasItems(other,ItFo_Plants_Berrys_01));
		Npc_RemoveInvItems(self,ItFo_Plants_Berrys_01,NPC_HasItems(self,ItFo_Plants_Berrys_01));
		AI_Output (self, other,"DIA_Gilbert_Buy_07_02"); //Przynieœ ich wiêcej.
	}
	else
	{
		AI_Output (self, other,"DIA_Gilbert_Buy_07_03"); //Nie masz jagód. Wróæ jak jakieœ nazbierasz.
	};
};

/*************************
Side quests
**************************/


INSTANCE DIA_Gilbert_Stuff (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 25;
	condition		= DIA_Gilbert_Stuff_Condition;
	information		= DIA_Gilbert_Stuff_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przyszed³em po paczkê dla Baal Tarana.";
};                       

FUNC INT DIA_Gilbert_Stuff_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_BaalKagan_OrderHelp))&&(Npc_KnowsInfo (hero, DIA_Gilbert_First))
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Stuff_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Stuff_15_00"); //Przyszed³em po paczkê dla Baal Tarana.
	AI_Output (self, other,"DIA_Gilbert_Stuff_07_01"); //Trochê za wczeœnie, nie uzbiera³em jeszcze wszystkich zió³.
	AI_Output (other, self,"DIA_Gilbert_Stuff_15_02"); //Nie szkodzi. Taranowi bardzo zale¿y na towarze bo ostatnio przyby³o mu klientów.
	AI_Output (self, other,"DIA_Gilbert_Stuff_07_03"); //W porz¹dku. W takim razie policzê mu trochê mniej. Wystarczy 200 bry³ek.
	B_LogEntry		(CH2_RBL_Stuff,	"Cholera o tym nie pomyœla³em. Gilbert chce za paczkê 200 bry³ek.");
};



INSTANCE DIA_Gilbert_Stuff1 (C_INFO)
{
	npc		= Non_1500_Gilbert;
	nr			= 26;
	condition		= DIA_Gilbert_Stuff1_Condition;
	information		= DIA_Gilbert_Stuff1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "W porz¹dku, zap³acê za tê paczkê.";
};                       

FUNC INT DIA_Gilbert_Stuff1_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gilbert_Stuff))&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;  
	};
};

FUNC VOID DIA_Gilbert_Stuff1_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Stuff1_15_00"); //W porz¹dku, zap³acê za tê paczkê.
	B_GiveInvItems (other, self, ItMiNugget, 200);
	AI_Output (self, other,"DIA_Gilbert_Stuff1_07_01"); //Mi³o mi to s³yszeæ. A to Twoje ziele.
	CreateInvItems (self,package_stuff,1);
	B_GiveInvItems (self, other, package_stuff, 1);
	AI_Output (self, other,"DIA_Gilbert_Stuff1_07_02"); //Tylko powiedz Taranowi, ¿e na nastêpn¹ dostawê bêdzie musia³ poczekaæ trochê d³u¿ej.
	AI_Output (other, self,"DIA_Gilbert_Stuff1_15_03"); //W porz¹dku. Bywaj.
	B_LogEntry		(CH2_RBL_Stuff,	"Mam paczkê ziela dla Tarana. Muszê je najpierw zanieœæ Kaganowi.");
};


