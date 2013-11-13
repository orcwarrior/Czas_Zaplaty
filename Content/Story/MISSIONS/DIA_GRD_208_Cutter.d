//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	B_StopProcessInfos(self);
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Spory ten zamek.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Spory ten zamek.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Chyba jeszcze Ciê tu nie widzia³em. Kim jesteœ?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Nikim, chcia³em siê tylko trochê rozejrzeæ.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 2;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 0;
	description = "Mo¿esz mi opowiedzieæ coœ wiêcej o zamku?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Mo¿esz mi opowiedzieæ coœ wiêcej o zamku?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Co tu gadaæ. Gomez i jego zbiry zajêli sto³p po buncie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Od pocz¹tku wiedzia³em, ¿e bezpieczniej jest stan¹æ po ich stronie.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Wielu z nas, jeszcze jako wiêŸniowie zamkniêci w lochach lub zmuszani do pracy w kopalni, uznawa³o zwierzchnictwo Gomeza.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Czy te lochy znajduj¹ siê pod zamkiem?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Tak, ale teraz œwiec¹ pustkami. Nikt tam nie schodzi³ od czasu buntu.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 3;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 0;
	description = "Jak wygl¹da ¿ycie stra¿nika?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak wygl¹da ¿ycie stra¿nika?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Jest spokojne. Jesteœmy najwiêkszym i najsilniejszym obozem w Kolonii. Nikt nie œmie nas zaczepiaæ.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Rozumiem.
	B_StopProcessInfos(self);
};

//******************************************

instance  DIA_Cutter_Att (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 4;
	condition	= DIA_Cutter_Att_Condition;
	information	= DIA_Cutter_Att_Info;
	permanent	= 0;
	description = "Co s¹dzisz o ataku?";
};                       

FUNC int  DIA_Cutter_Att_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_PERM))&&(CHEST_KNOW == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Att_Info()
{
	AI_Output (other, self,"DIA_Cutter_Att_15_00"); //Co s¹dzisz o ataku?
	AI_Output (self, other,"DIA_Cutter_Att_08_01"); //Szybko siê wykrwawi¹. A to co przejdzie przez bramê spotka mój miecz!
	AI_Output (other, self,"DIA_Cutter_Att_15_02"); //A gdyby zaatakowali znienacka?
	AI_Output (self, other,"DIA_Cutter_Att_08_03"); //Przecie¿ nie spadn¹ z nieba! Mówiê Ci, rebelianci po³ami¹ sobie zêby i wróc¹ z podkulonymi ogonami tam, sk¹d przyszli.
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Cutter_Woman (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 5;
	condition		= DIA_Cutter_Woman_Condition;
	information		= DIA_Cutter_Woman_Info;
	permanent		= 0;
	description		= "Sk¹d Gomez ma te wszystkie kobiety?"; 
};

FUNC INT DIA_Cutter_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Kira_OCHAfter))
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_Woman_Info()
{
	AI_Output (other, self,"DIA_Cutter_Woman_15_00"); //Sk¹d Gomez ma te wszystkie kobiety?
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Có¿, magnaci dostaj¹ wszystko, czego zapragn¹.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chcesz powiedzieæ, ¿e król wymienia kobiety na rudê?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Naturalnie, one te¿ trafiaj¹ tutaj prosto z wiêzienia. Gdyby Gomez nie œci¹gn¹³ ich tutaj, dalej gni³yby w jakimœ lochu.
	AI_Output (self, other,"DIA_Cutter_Woman_06_04"); //Ech, te¿ bym pochêdo¿y³...
	AI_Output (other, self,"DIA_Cutter_Woman_15_05"); //Mogê ci pomóc...
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Cutter_Woman_06_06"); //Nawet o tym nie myœl! Jak tylko zobaczê Twojego falusa, to utnê Ci kuœkê przy samej dupie!
	AI_Output (other, self,"DIA_Cutter_Woman_15_07"); //Nie mówi³em o sobie! Nie jestem a¿ tak wyposzczony, ¿eby... Chyba siê porzygam.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"DIA_Cutter_Woman_06_08"); //Ca³e szczêœcie. Ale mówi³eœ coœ o pomocy. Masz jak¹œ babkê na boku?
	AI_Output (other, self,"DIA_Cutter_Woman_15_09"); //Mniej wiêcej. Znam kogoœ, kto jest tob¹ ¿ywo zainteresowany.
	AI_Output (self, other,"DIA_Cutter_Woman_06_10"); //Kto to?
	AI_Output (other, self,"DIA_Cutter_Woman_15_11"); //To Kira, szefowa ³owców trolli.
	AI_Output (self, other,"DIA_Cutter_Woman_06_12"); //S³ysza³em, ¿e to niewy¿yte babsko. Hmm, brzmi ciekawie...
	AI_Output (other, self,"DIA_Cutter_Woman_15_13"); //Kiedy z ni¹ rozmawia³em, mówi³a, ¿e masz wyj¹tkowe... atrybuty.
	AI_Output (self, other,"DIA_Cutter_Woman_06_14"); //He, he, s³awa starego Siekacza dosz³a nawet do tej zawszonej Kolonii.
	AI_Output (self, other,"DIA_Cutter_Woman_06_15"); //A co mi tam. Stra¿nicy to banda przyg³upów. 
	AI_Output (self, other,"DIA_Cutter_Woman_06_16"); //Nied³ugo bêdzie tu gor¹co, a nie ma to jak dobra pochêdó¿ka przed walk¹.
	AI_Output (self, other,"DIA_Cutter_Woman_06_17"); //ProwadŸ do tej zdziry! 
   AI_Output (self, other,"DIA_Cutter_Woman_06_18"); //Albo czekaj... Muszê siê jeszcze odpowiednio... przygotowaæ. Spotkajmy siê wieczorem za pó³nocn¹ bram¹. 
	AI_Output (other, self,"DIA_Cutter_Woman_15_19"); //Dobra, wieczorem ciê zaprowadzê.
	B_LogEntry(CH6_RBL_Horse, "Uda³o siê! Siekacz pójdzie ze mn¹ do Kiry. Biedny stra¿nik musi siê jeszcze przygotowaæ...");

	Npc_ExchangeRoutine(self,"GateOC");
	B_StopProcessInfos(self); 
};

INSTANCE DIA_Cutter_GoToKira (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 5;
	condition		= DIA_Cutter_GoToKira_Condition;
	information		= DIA_Cutter_GoToKira_Info;
	important		= 1;
};

FUNC INT DIA_Cutter_GoToKira_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cutter_Woman)) &&(Npc_GetDistToWP (self,"OC1") < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_GoToKira_Info()
{
	AI_Output (self, other,"DIA_Cutter_GoToKira_06_00"); //ProwadŸ!
	AI_Output (other, self,"DIA_Cutter_GoToKira_15_01"); //Sam tego chcia³eœ...

	B_LogEntry(CH6_RBL_Horse, "No to idziemy...");
	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"Follow");
	B_StopProcessInfos(self); 
};
// **************************************************

INSTANCE DIA_Cutter_WomanOk (C_INFO)
{
	npc				= GRD_208_Cutter;
	nr				= 6;
	condition		= DIA_Cutter_WomanOk_Condition;
	information		= DIA_Cutter_WomanOk_Info;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cutter_WomanOk_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Cutter_Woman))&&(Npc_GetDistToWP (self,"TH_KIRA_01") < 600 )
	{
		return 1;
	};
};

FUNC VOID DIA_Cutter_WomanOk_Info()
{
	var C_NPC kira; kira = Hlp_GetNpc(Non_4027_Kira);

	B_FullStop (hero);
	B_FullStop (self);
	AI_GotoNpc(other, self);
	AI_Output (other, self,"DIA_Cutter_WomanOk_15_00"); //Jesteœmy na miejscu.
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_01"); //A gdzie ta moja ladacznica?
	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, kira);
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_02"); //Tuœ mi ma³a!
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_03"); //Dziêki, stary. Nie wiem, jak Ci siê odwdziêczê.
	AI_Output (other, self,"DIA_Cutter_WomanOk_15_04"); //Wystarczy, ¿e staniesz na wysokoœci zadania.
	AI_Output (self, other,"DIA_Cutter_WomanOk_06_05"); //He, he, o to siê nie bój.
	AI_TurnToNpc (self, kira);
	B_LogEntry(CH6_RBL_Horse, "Teraz wszystko w... lêdŸwiach Siekacza.");
	Party_RemoveNpc(self);

	/*********************
WP w pobli¿u Kiry, tak, ¿eby mo¿na by³o jej i siekaczowi zmieniæ rutynê na Small_Talk.
********************/

	Npc_ExchangeRoutine(self,"StayKira");
	Npc_ExchangeRoutine(kira,"KiraTalk");
	B_StopProcessInfos(self); 
};
