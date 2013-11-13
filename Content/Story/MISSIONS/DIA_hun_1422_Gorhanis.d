// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_hun_1422_gorhanis_Exit (C_INFO)
{
	npc			= hun_1422_gorhanis;
	nr			= 999;
	condition	= DIA_hun_1422_gorhanis_Exit_Condition;
	information	= DIA_hun_1422_gorhanis_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_1422_gorhanis_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_1422_gorhanis_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_hun_1422_gorhanis_Stew (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 12;
	condition		= DIA_hun_1422_gorhanis_Stew_Condition;
	information		= DIA_hun_1422_gorhanis_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie gulasz od Snafa."; 
};

FUNC INT DIA_hun_1422_gorhanis_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_hun_1422_gorhanis_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_hun_1422_gorhanis_Stew_15_01"); //Mam dla ciebie gulasz od Snafa.
	AI_Output (self, other, "DIA_hun_1422_gorhanis_Stew_11_02"); //Niebo w gêbie.
	AI_Output (other, self, "DIA_hun_1422_gorhanis_Stew_15_03"); //Eee...
	AI_Output (self, other, "DIA_hun_1422_gorhanis_Stew_11_04"); //Dziêki, a teraz nie przeszkadzaj mi w degustacji.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Hanis z chêci¹ wzi¹³ swoj¹ porcjê."); 
};
// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Co tu robisz?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Co tu robisz?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Ja? Walczê ku chwale wielkiego Œni¹cego!
	AI_Output (self, other,"Info_GorHanis_What_08_02"); //A nie... Zdaje siê, ¿e coœ popl¹ta³em.
	AI_Output (self, other,"Info_GorHanis_What_08_03"); //Kilka dni temu Kharim waln¹³ mnie w ³eb i od tego czasu ciê¿ko mi pozbieraæ myœli.
	AI_Output (self, other,"Info_GorHanis_What_08_04"); //Ekhm...
	AI_Output (self, other,"Info_GorHanis_What_08_05"); //Sk¹d Ty siê tu wzi¹³eœ?
	AI_Output (other, self,"Info_GorHanis_What_15_06"); //Przyp³yn¹³em...
	AI_Output (self, other,"Info_GorHanis_What_08_07"); //Cholera, jak ja siê nazywam?
	AI_Output (other, self,"Info_GorHanis_What_15_08"); //To ja ju¿ sobie pójdê...
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 2;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 0;
	description 	= "Walczy³eœ na arenie?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena1_15_00"); //Walczy³eœ na arenie?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Zosta³em wybrany przez moich mistrzów, by broniæ na arenie honoru obozu na bagnie.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Przyœwieca mi wiêc wy¿szy cel. Walczê, by pokazaæ niewiernym, jak wielka jest potêga Œni¹cego!
	AI_Output (self, other,"Info_GorHanis_Arena_08_03"); //Zaraz... 
   
	AI_PlayAni (self, "T_SEARCH");
   
	AI_Output (self, other,"Info_GorHanis_Arena_08_04"); //Przecie¿ to nie ten obóz!
	AI_Output (self, other,"Info_GorHanis_Arena_08_05"); //Gdzie ja do cholery jestem?
	AI_Output (other, self,"Info_GorHanis_Arena_15_06"); //Zdaje siê, ¿e w Obozie Rebeliantów. Coœ Ci to mówi?
	AI_Output (self, other,"Info_GorHanis_Arena_08_07"); //Tak! St¹d te¿ mnie za coœ wyrzucili, tylko nie pamiêtam, co to by³o...
	AI_Output (self, other,"Info_GorHanis_Arena_08_08"); //Zdaje siê, ¿e posz³o o coœ z Kharimem...

	Log_CreateTopic(CH2_RBL_Mem, LOG_MISSION);
	Log_SetTopicStatus(CH2_RBL_Mem, LOG_RUNNING);
	B_LogEntry(CH2_RBL_Mem, "Spotka³em Gor Hanisa. Dziwnie siê z nim rozmawia. Twierdzi, ¿e odk¹d Kharim uderzy³ go w g³owê, ma problemy z pamiêci¹. Powiedzia³ te¿, ¿e usuniêto go z Obozu Rebeliantów w³aœnie przez jak¹œ sprzeczkê z Kharimem. Ciekawe co siê za tym kryje?");
};

// **************************************************

instance Info_GorHanis_RBL (C_INFO)
{
	npc				= hun_1422_gorhanis;
	nr				= 3;
	condition		= Info_GorHanis_RBL_Condition;
	information		= Info_GorHanis_RBL_Info;
	permanent		= 0;
	description 	= "Znowu nale¿ysz do obozu.";
};                       

FUNC INT Info_GorHanis_RBL_Condition()
{
	if (Npc_KnowsInfo(self,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

func VOID Info_GorHanis_RBL_Info()
{
	AI_Output (other, self,"Info_GorHanis_RBL_15_00"); //Znowu nale¿ysz do obozu.
	AI_Output (self, other,"Info_GorHanis_RBL_08_01"); //Ja? Przecie¿ zabi³em tego rekruta. Nie mogê spojrzeæ w twarz innym rebeliantom.
	AI_Output (other, self,"Info_GorHanis_RBL_15_02"); //To nie by³a twoja wina. Kharim poda³ Ci kl¹twê berserkera, kiedy Ciê cuci³. Wpad³eœ w sza³ i dlatego zgin¹³ rekrut.
	AI_Output (self, other,"Info_GorHanis_RBL_08_03"); //A to skurwiel!
	AI_Output (self, other,"Info_GorHanis_RBL_08_04"); //Cholera! Wróci³a mi pamiêæ! To pewnie przez szok jaki teraz prze¿y³em...
	AI_Output (other, self,"Info_GorHanis_RBL_15_05"); //Mo¿liwe. Co teraz zamierzasz?
	AI_Output (self, other,"Info_GorHanis_RBL_08_06"); //Nadal bêdê szkoli³ rekrutów. 
	AI_Output (other, self,"Info_GorHanis_RBL_15_07"); //Chcesz siê zemœciæ?
	AI_Output (self, other,"Info_GorHanis_RBL_08_08"); //Zemsta jest przywilejem bogów. Nie pod¹¿ê t¹ sam¹ drog¹ co Kharim.
	AI_Output (other, self,"Info_GorHanis_RBL_15_09"); //Dobrze to s³yszeæ.
	AI_Output (self, other,"Info_GorHanis_RBL_08_10"); //Dziêki, przyjacielu. Bardzo mi pomog³eœ. Nie wiem, jak móg³bym siê odwdziêczyæ...
	AI_Output (self, other,"Info_GorHanis_RBL_08_11"); //WeŸ to. Znalaz³em ten zwój, kiedy by³em jeszcze stra¿nikiem w obozie na bagnie.

	CreateInvItems (self,ItArScrollStormfist,1);
	B_GiveInvItems (self, other, ItArScrollStormfist, 1);
	HANIS_TRUST = true;

	/****************
Ork niech teraz ma practice sword gdzieœ z rekrutami w obozie
****************/

	Npc_ExchangeRoutine(self,"start");

	Log_SetTopicStatus(CH2_RBL_Mem, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_Mem, "Wszystko wróci³o do normy. Hanis odzyska³ pamiêæ i nadal chce szkoliæ rekrutów. Zrezygnowa³ te¿ z zemsty, a ja na tym zarobi³em. Czyli po staremu.");
};
