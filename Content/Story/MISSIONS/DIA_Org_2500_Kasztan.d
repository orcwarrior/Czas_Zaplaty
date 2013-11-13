
// **************************************************
//						 EXIT
// **************************************************

instance  Org_2500_Kasztan_Exit (C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 999;
	condition	= Org_2500_Kasztan_Exit_Condition;
	information	= Org_2500_Kasztan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Org_2500_Kasztan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_2500_Kasztan_Exit_Info()
{
	B_StopProcessInfos(self);
};

instance  Org_2500_Kasztan_Stylize (C_INFO)
{
	npc			=  Org_2500_Kasztan;
	nr			=  986;
	condition	=  Org_2500_Kasztan_Stylize_Condition;
	information	=  Org_2500_Kasztan_Stylize_Info;
	important	=  0;	
	permanent	=  1;
	description = "(Zmieñ wygl¹d)";
};                       

FUNC int  Org_2500_Kasztan_Stylize_Condition()
{
	return 1;
};

FUNC VOID  Org_2500_Kasztan_Stylize_Info()
{
	bloops=0;	
	stylist=hlp_getnpc(Org_2500_Kasztan);
	Wld_SendTrigger("STYLIST");		
	B_StopProcessInfos	(self);
};

INSTANCE Org_2500_Kasztan_Cash4Style (c_Info)
{
	npc				= Org_2500_Kasztan;
	nr				= 656;
	condition		= Org_2500_Kasztan_Cash4Style_Condition;
	information		= Org_2500_Kasztan_Cash4Style_Info;
	important		= 1;
	permanent		= 1;
};

FUNC INT Org_2500_Kasztan_Cash4Style_Condition()
{		
	if(changes_price)
	{		
		return 1;
	};
};

func VOID Org_2500_Kasztan_Cash4Style_Info()
{
	AI_Output (self, other,"Org_2500_Kasztan_Cash4Style_11_00"); //Czas zap³aciæ za us³ugi.

	Info_ClearChoices	(Org_2500_Kasztan_Cash4Style);
	Info_AddChoice		(Org_2500_Kasztan_Cash4Style,"Nie zap³acê.",Org_2500_Kasztan_Cash4Style_No);
	if(NPC_HasItems(hero,itminugget)>=changes_price)
	{
		Info_AddChoice		(Org_2500_Kasztan_Cash4Style,ConcatStrings(ConcatStrings("Trzymaj swoj¹ rudê (",Inttostring(changes_price))," bry³ek rudy)."),Org_2500_Kasztan_Cash4Style_Yes);
	};
};
func VOID Org_2500_Kasztan_Cash4Style_No()
{
	AI_Output (other, self,"Org_2500_Kasztan_Cash4Style_NO_11_00"); //Nie zap³acê.
	
	HERO_TATTOO=hero_last_aplied_face%10;
	HERO_BEARD=((hero_last_aplied_face%100)-HERO_TATTOO)/10;
	HERO_HAIR=(hero_last_aplied_face-((HERO_BEARD*10)+HERO_TATTOO))/100;	
	hero_last_face=hero_last_aplied_face;
	//p/rint(inttostring(HERO_TATTOO+HERO_BEARD+HERO_HAIR));
	Mdl_SetHeroAppearance();	
	Info_ClearChoices	(Org_2500_Kasztan_Cash4Style);
	changes_price=0;
};
func VOID Org_2500_Kasztan_Cash4Style_Yes()
{
	AI_Output (other, self,"Org_2500_Kasztan_Cash4Style_Yes_11_00"); //Trzymaj swoj¹ rudê.

	B_GiveInvItems(hero,self,ITMINUGGET,changes_price);
	Info_ClearChoices	(Org_2500_Kasztan_Cash4Style);
	changes_price=0;
   hero_changes_visual = true;
};
// **************************************************
//					Pierwsze spotkanie
// QUESTID 550
// **************************************************
instance  Org_2500_Kasztan_Greet (C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 1;
	condition	= Org_2500_Kasztan_Greet_Condition;
	information	= Org_2500_Kasztan_Greet_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC int  Org_2500_Kasztan_Greet_Condition()
{
	/*if ((Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) || (Kapitel >= 3))
	{
		return 1;
	};*/
   
   return 0;
};

FUNC VOID  Org_2500_Kasztan_Greet_Info()
{

	AI_SetWalkmode	(other, NPC_WALK);
	AI_GotoNpc		(other, self);

	AI_Output (self, other,"Org_2500_Kasztan_Greet_11_00"); //Hej, Ty! PodejdŸ tu. Potrzebujê pomocy.
	AI_Output (other, self,"Org_2500_Kasztan_Greet_11_01"); //Tak? O co chodzi?
	AI_Output (self, other,"Org_2500_Kasztan_Greet_11_02"); //Dowiedzia³em siê o miejscu pobytu trzech uciekinierów z kopalni. Pomó¿ mi ich z³apaæ.

	Info_ClearChoices	(Org_2500_Kasztan_Greet);
	Info_AddChoice		(Org_2500_Kasztan_Greet,"Sam sobie ich ³ap.",DIA_Org_2500_Find_Deserters_Agree_No);
	Info_AddChoice		(Org_2500_Kasztan_Greet,"Pomogê Ci.",DIA_Org_2500_Find_Deserters_Agree_Yes);
};

FUNC void DIA_Org_2500_Find_Deserters_Agree_Yes()
{
	AI_Output (other, self,"DIA_Org_2500_Find_Deserters_Agree_Yes_15_00"); //Pomogê ci.
	AI_Output (self, other,"DIA_Org_2500_Find_Deserters_Agree_Yes_15_01"); //Œwietnie. Wróæ, gdy bêdziesz gotowy. Tylko siê poœpiesz! Nie bêd¹ na nas czekaæ wiecznie!
	B_StopProcessInfos	(self);
	
	Log_CreateTopic(KasztanLookForDeserters, LOG_MISSION);
	Log_SetTopicStatus(KasztanLookForDeserters, LOG_RUNNING);
	B_LogEntry(KasztanLookForDeserters, "Kasztan chce, abym pomóg³ mu w polowaniu na zbiegów.");
};

FUNC void DIA_Org_2500_Find_Deserters_Agree_No()
{
	//(linia 15 w scenariuszu) Autor proponuje tutaj dodac 1000 sily agresorowi. Moze jest jakis inny dobry sposob? Narazie pozostawiam to Tobie
	AI_Output (other, self,"DIA_Org_2500_Find_Deserters_Agree_No_15_00"); //Sam sobie ich ³ap.
	AI_Output (self, other,"DIA_Org_2500_Find_Deserters_Agree_No_15_01"); //Ja Ci zaraz dam takie odzywki.
	
	B_StopProcessInfos(self);

	B_StartAfterDialogFight(self,other,false);	
	
	//Teraz wedlug scenariusza trzeba zrobic to ze wyladujemy w kopalni jesli nas pobije :)
};  

instance  Org_2500_Kasztan_Go_And_Kill_Deserters(C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 2;
	condition	= Org_2500_Kasztan_Go_And_Kill_Deserters_Condition;
	information	= Org_2500_Kasztan_Go_And_Kill_Deserters_Info;
	permanent	= 0;
	description = "Jestem gotowy! Mo¿emy udaæ siê na poszukiwanie zbiegów.";
};

FUNC int  Org_2500_Kasztan_Go_And_Kill_Deserters_Condition()
{
	if (Npc_KnowsInfo(hero,Org_2500_Kasztan_Greet))
	{
		return 1;
	};
};

FUNC int  Org_2500_Kasztan_Go_And_Kill_Deserters_Info()
{
	AI_Output (other, self,"Org_2500_Kasztan_Go_And_Kill_Deserters_Info_11_00"); //Jestem gotowy! Mo¿emy udaæ siê na poszukiwanie zbiegów.
	AI_Output (self, other,"Org_2500_Kasztan_Go_And_Kill_Deserters_Info_11_01"); //Ruszajmy.

	B_StopProcessInfos	(self);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);

	//wpis w dzienniku

	Party_AddNpc(self);
	
	//teraz pojawiaja sie uciekinierzy wrogo do nas nastawieni

	B_ExchangeRoutine	(Org_2500_Kasztan,"GUIDE");
};

instance  Org_2500_Kasztan_WhenDesertersAreDead(C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 3;
	condition	= Org_2500_Kasztan_WhenDesertersAreDead_Condition;
	information	= Org_2500_Kasztan_WhenDesertersAreDead_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC int  Org_2500_Kasztan_WhenDesertersAreDead_Condition()
{
	//zmienic nazwy NPC na tych ktorzy tam beda :)
	if 	( Npc_KnowsInfo(hero,Org_2500_Kasztan_Go_And_Kill_Deserters)) && (Npc_IsDead(self)) && (Npc_IsDead(self))
	{
		return 1;
	};
};

FUNC VOID  Org_2500_Kasztan_WhenDesertersAreDead_Info()
{
	AI_Output (self, other,"Org_2500_Kasztan_WhenDesertersAreDead_11_00"); //Ju¿ po nich. Dobra robota. ChodŸ do obozu, przyda mi siê eskorta na wszelki wypadek.
	
	B_LogEntry(KasztanLookForDeserters, "Zbiedzy nie ¿yj¹! Mam teraz wróciæ z Kaszatanem do Nowego Obozu.");

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"GUIDE");
};

instance  Org_2500_Kasztan_BackToNewCamp(C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 4;
	condition	= Org_2500_Kasztan_BackToNewCamp_Condition;
	information	= Org_2500_Kasztan_BackToNewCamp_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC int  Org_2500_Kasztan_BackToNewCamp_Condition()
{
	if 	((Hlp_StrCmp(Npc_GetNearestWP(self),"Dac tutaj odpowiedni waypoint miejsca w nowym obozie")) && (Npc_KnowsInfo(hero,Org_2500_Kasztan_BackToNewCamp))) 
	{
		return 1;
	};
};

FUNC VOID  Org_2500_Kasztan_BackToNewCamp_Info()
{
	AI_Output (self, other,"Org_2500_Kasztan_BackToNewCamp_11_00"); //Dziêki. A teraz odejdŸ, mam tu coœ do za³atwienia.
	
	B_LogEntry(KasztanLookForDeserters, "Zaprowadzi³em Kasztana z powrotem pod jego chatê. Koleœ chyba zapomnia³ o nagrodzie.");
	//B_GiveMisXP(XP_MED); 

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"GUIDE");
};

instance  Org_2500_Kasztan_RememberAboutReward(C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 5;
	condition	= Org_2500_Kasztan_RememberAboutReward_Condition;
	information	= Org_2500_Kasztan_RememberAboutReward_Info;
	permanent	= 0;
	important 	= 1;
	description = "Chyba o czymœ zapomnia³eœ.";
};

FUNC int  Org_2500_Kasztan_RememberAboutReward_Condition()
{
	if 	(Npc_KnowsInfo(hero,Org_2500_Kasztan_BackToNewCamp))
	{
		return 1;
	};
};

FUNC VOID  Org_2500_Kasztan_RememberAboutReward_Info()
{
	AI_Output (other, self,"Org_2500_Kasztan_RememberAboutReward_11_00"); //Chyba o czymœ zapomnia³eœ.
	AI_Output (self, other,"Org_2500_Kasztan_RememberAboutReward_11_01"); //O czym niby?
	AI_Output (other, self,"Org_2500_Kasztan_RememberAboutReward_11_02"); //Zap³ata?
	AI_Output (self, other,"Org_2500_Kasztan_RememberAboutReward_11_03"); //Nie by³o ¿adnej umowy. Mog³eœ przeszukaæ ekwipunek uciekinierów, z pewnoœci¹ coœ mieli.

	B_LogEntry(KasztanLookForDeserters, "Sukinkot próbuje wymigaæ siê od p³acenia. Trzeba go jakoœ przekonaæ.");
	B_StopProcessInfos	(self);
};

instance  Org_2500_Kasztan_GiveReward(C_INFO)
{
	npc			= Org_2500_Kasztan;
	nr			= 5;
	condition	= Org_2500_Kasztan_GiveReward_Condition;
	information	= Org_2500_Kasztan_GiveReward_Info;
	permanent	= 0;
	important 	= 1;
	description = "Daj mi rudê.";
};

FUNC int  Org_2500_Kasztan_GiveReward_Condition()
{
	if 	(Npc_KnowsInfo(hero,Org_2500_Kasztan_RememberAboutReward))
	{
		return 1;
	};
};

FUNC VOID  Org_2500_Kasztan_GiveReward_Info()
{
	AI_Output (other, self,"Org_2500_Kasztan_GiveReward_11_00"); //Daj mi rudê.
	AI_Output (self, other,"Org_2500_Kasztan_GiveReward_11_01"); //Czy ja mówi³em ju¿, ¿e nie by³o ¿adnej umowy?
	AI_Output (other, self,"Org_2500_Kasztan_GiveReward_11_02"); //Tak. Ja jednak wola³bym coœ zarobiæ.
	AI_Output (self, other,"Org_2500_Kasztan_GiveReward_11_03"); //W takim razie spróbuj sobie sam wzi¹æ!

	B_LogEntry(KasztanLookForDeserters, "Gdy stanowczo za¿¹da³em zap³aty, Kaszatan rzuci³ siê na mnie. Ciekawi mnie wynik walki!");
	Log_SetTopicStatus(KasztanLookForDeserters,LOG_SUCCESS);
	
	B_StopProcessInfos	(self);

	B_StartAfterDialogFight(self,other,false);	
};
