/*
// ************************ EXIT **************************

instance  Info_StrangeDemon_EXIT (C_INFO)
{
	npc			=	StrangeDemon;
	nr			=	999;
	condition	=	Info_StrangeDemon_EXIT_Condition;
	information	=	Info_StrangeDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_StrangeDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_StrangeDemon_EXIT_Info()
{
	//AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //...
	//AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //Œmiertelny?... Kto, ja?... Dobrze, ju¿ idê!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Deep Demon
//***************************************************************************
instance Info_StrangeDemon_INTRO (C_INFO)
{
	npc			= StrangeDemon;
	condition	= Info_StrangeDemon_INTRO_Condition;
	information	= Info_StrangeDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_StrangeDemon_INTRO_Condition()
{	
	return 1;
};

FUNC VOID Info_StrangeDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_01"); //Zaraz... Kto... Kto to powiedzia³?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_02"); //To TY?! Jak... Jak siê dosta³eœ do mojej g³owy?
	AI_Output 		(self, other,"DIA_BaalCadar_NoTalk_Hi_02_03"); //
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_04"); //TYLE LAT W BUTELCE I TRAFI£ MI SIÊ IDIOTA.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_05"); //Ty mówisz?!
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_06"); //Mówiê, tañczê, jem i wydalam jak ka¿da ¿ywa istota.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_07"); //Demony to pomiot Beliara!
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_08"); //Pomiot co to pali wioski, porywa dziewice i zsy³a zarazê na pola... 
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_09"); //Powiedzmy, ¿e to zabobony. Nie ka¿dy demon s³u¿y Beliarowi.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_10"); //Tylko te które dadz¹ siê zwi¹zaæ S£OWEM MOCY.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_11"); //Jakim s³owem?
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_12"); //Musisz poznaæ imiê demona i wypowiedzieæ je w jego mowie. Ot i ca³y sekret.
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_13"); //A jakie jest twoje imiê?
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_14"); //Hmm, z nas dwojga to ty robisz za idiotê wiêc nie spodziewaj siê prawdziwej odpowiedzi.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_15"); //Mo¿esz nazywaæ mnie... Wielkim i Wspania³ym W³adc¹ Demonicznych Hord, Ksiêciem Ciemnoœci, Jego Mrocznoœci¹...
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_16"); //Nie doœæ, ¿e wygadany to jeszcze skromny...
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_17"); //No proszê, trafi³ mi siê œmiertelnik z poczuciem humoru. Jednak nie jest tak Ÿle.
	AI_Output		(self, hero,"Info_StrangeDemon_INTRO_17_18"); //To od czego zaczniemy?
	AI_Output		(hero, self,"Info_StrangeDemon_INTRO_15_19"); //Od niczego, nie bêdê traci³ czasu na demoniczne œcierwo.
	AI_StopProcessInfos	(self);
};

//***************************************************************************
instance Info_StrangeDemon_Halo (C_INFO)
{
	npc			= StrangeDemon;
	condition	= Info_StrangeDemon_Halo_Condition;
	information	= Info_StrangeDemon_Halo_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_StrangeDemon_Halo_Condition()
{	
	if (Npc_KnowsInfo (hero,  Info_StrangeDemon_INTRO))
	{
		return 1;
	};
};

FUNC VOID Info_StrangeDemon_Halo_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_01"); //Wybacz, mo¿e jednak Ÿle zaczêliœmy. Mam dla ciebie propozycjê.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_02"); //Nie bêdê paktowa³ z demonem.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_03"); //A ty w kó³ko to samo.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_04"); //Nie jestem zwyczajnym demonem. Narodzi³em siê w czasach kiedy nie by³o jeszcze Beliara i jego braci.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_05"); //Co mnie to obchodzi?	
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_06"); //Aleœ ty uparty!
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_07"); //Ujmê to tak. Znam sekrety, które uczyni¹ z ciebie obrzydliwie bogatego cz³owieka.
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_08"); //A ja w zamian mam ci oddaæ duszê czy nadstawiæ ty³ka?
	AI_Output		(self, hero,"Info_StrangeDemon_Halo_17_09"); //Wystarczy, ¿e mnie wys³uchasz. PóŸniej sam zdecydujesz co zrobisz.	
	AI_Output		(hero, self,"Info_StrangeDemon_Halo_15_10"); //Niech bêdzie, mów.
	
	B_LogEntry		(Strange_DemonStory, "");	
};
//***************************************************************************
instance Info_StrangeDemon_Halo1 (C_INFO)
{
	npc			= StrangeDemon;
	nr			=	2;
	condition	= Info_StrangeDemon_Halo1_Condition;
	information	= Info_StrangeDemon_Halo1_Info;
	permanent	= 0;
	important 	= 0;
	description =	"Zamieniam siê w s³uch.";
};

FUNC INT Info_StrangeDemon_Halo1_Condition()
{	
	if (Npc_KnowsInfo (hero,  Info_StrangeDemon_Halo))
	{
		return 1;
	};
};

FUNC VOID Info_StrangeDemon_Halo1_Info()
{
	AI_Output		(hero, self,"Info_StrangeDemon_Halo1_15_02"); //Zamieniam siê w s³uch.
	AI_Output		(self, hero,"Info_StrangeDemon_Halo1_17_01"); //Wszystko zaczê³o siê w czasach...
	AI_Output		(hero, self,"Info_StrangeDemon_Halo1_15_02"); //Nie jestem archeologiem, przejdŸ od razu do tej czêœci z obrzydliwym bogactwem.

	B_LogEntry		(Strange_DemonStory, "");	
};
*/