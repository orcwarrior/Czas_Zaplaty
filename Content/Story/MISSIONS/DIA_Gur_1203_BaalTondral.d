// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondralDream_Exit (C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 999;
	condition	= DIA_BaalTondralDream_Exit_Condition;
	information	= DIA_BaalTondralDream_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondralDream_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondralDream_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_BaalTondralDream_Hi(C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 1;
	condition	= DIA_BaalTondralDream_Hi_Condition;
	information	= DIA_BaalTondralDream_Hi_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondralDream_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondralDream_Hi_Info()
{
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_00"); //Œni¹cy oœwieci³ mój umys³! Bestia z³o¿y mu pok³on, a ty bêdziesz tym, który ugnie jej kolana!
   AI_Output (other, self, "DIA_BaalTondralDream_Hi_15_01"); //Cz³owieku, dobrze siê czujesz?
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_02"); //Milcz psubracie! Wypij ten wywar i do boju!!!
   AI_Output (other, self, "DIA_BaalTondralDream_Hi_15_03"); //Oszala³eœ? Przecie¿ to trucizna!
	AI_Output (self, other,"DIA_BaalTondralDream_Hi_13_04"); //Powiedzia³em pij! Nie sprzeciwiaj siê woli Œni¹cego!
   CreateInvItems (other, ItFobeer, 1);
	AI_UseItem (other, ItFobeer);
   
   B_LogEntry(CH4_RBL_Beast, "To by³ sen... Bestiê mo¿na zabiæ tylko za pomoc¹ trucizny. Potrzebujê te¿ kogoœ, kto pomo¿e mi w zrealizowaniu tego zamierzenia - muszê porozmawiaæ z Baal Tondralem.");
   B_StopProcessInfos(self);
};

INSTANCE DIA_BaalTondralDream_Dead(C_INFO)
{
	npc			= GUR_12030_BaalTondral_Dream;
	nr			= 1;
	condition	= DIA_BaalTondralDream_Dead_Condition;
	information	= DIA_BaalTondralDream_Dead_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondralDream_Dead_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTondralDream_Hi))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondralDream_Dead_Info()
{
   Dream_finished = true;
   
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
   
   hero.attribute[ATR_HITPOINTS] = 0;
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_BaalTondral_Hi(C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Hi_Condition;
	information	= DIA_BaalTondral_Hi_Info;
	permanent	= 0;
	important	= 0;
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_BaalTondral_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_Hi_Info()
{
	AI_Output (other, self, "DIA_BaalTondral_Hi_15_01"); //Kim jesteœ?
	AI_Output (self, other,"DIA_BaalTondral_Hi_13_02"); //Jestem... Kiedyœ by³em Baalem w Obozie Sekty.
	AI_Output (self, other,"DIA_BaalTondral_Hi_13_03"); //Teraz jestem ju¿ tylko wypalon¹ skorup¹ cz³owieka...
};

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 2;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lester_Beast))&&(Dream_finished)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	var C_NPC lester; lester = Hlp_GetNpc(PC_Psionic);
   
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nie wygl¹dasz mi na kogoœ, kto chcia³by nosiæ niewolnicze jarzmo nak³adane ludziom przez magnatów.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Myœlê, ¿e jesteœ raczej poszukiwaczem, kimœ, kto szuka prawdziwej wiary. Czy czujesz, jak ogieñ trawi Twoje cia³o podczas snu?
	AI_Output (other, self, "DIA_BaalTondral_FanaticTeacher1_15_02"); //Sk¹d wiesz o tym œnie?!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_03"); //By³em Baalem. Potrafiê wyczuæ targaj¹ce Twym umys³em emocje i lêki, które po¿eraj¹ Twego ducha.
	AI_Output (other, self, "DIA_BaalTondral_FanaticTeacher1_15_04"); //Widzia³em Ciê we œnie. Pomog³eœ mi zabiæ Bestiê.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_05"); //Tak, by³em tam. Zobaczy³eœ moje przeznaczenie i jestem gotów je wype³niæ.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher1_13_06"); //Ruszajmy. Czas nagli. Bestia z ka¿d¹ chwil¹ staje siê coraz silniejsza.

	B_LogEntry(CH4_RBL_Beast, "Baal Tondral ruszy ze mn¹, aby zg³adziæ Bestiê. Czujê w koœciach, ¿e znowu pakujê siê w paszczê Beliara.");
	B_StopProcessInfos(self);

	/************************
	ma do nich podejœæ Lester
	************************/

	AI_GotoWP(lester, "GO");
   Npc_ExchangeRoutine(lester, "GoToTondral");
};

// **************************************************

INSTANCE DIA_BaalTondral_Swamp (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 3;
	condition	= DIA_BaalTondral_Swamp_Condition;
	information	= DIA_BaalTondral_Swamp_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_Swamp_Condition()
{
	if (Npc_GetDistToWP (self,"PATH_OC_PSI_19") < 1000 )&&(Npc_KnowsInfo(hero,DIA_Lester_Join))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Swamp_Info()
{
	var C_NPC lest; lest = Hlp_GetNpc(PC_Psionic);
	B_FullStop (hero);
	B_FullStop (lest);
	AI_GotoNpc(other,self);
	AI_GotoNpc(lest,self);
   
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_00"); //Pamiêtajcie, po co tu przybyliœmy. Musimy zg³adziæ z³o i przynieœæ ukojenie naszym braciom.
	AI_Output (other, self, "DIA_BaalTondral_Swamp_15_01"); //We œnie widzia³em jak¹œ truciznê.
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_02"); //Tak, to by³a ta butelka.
   CreateInvItems (self, ItFobeer, 1);
	AI_UseItem (self, ItFobeer);
	AI_Output (other, self, "DIA_BaalTondral_Swamp_15_03"); //Co robisz?! Przecie¿ to trucizna!
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_04"); //Œmiertelna dla Bestii, ale dla cz³owieka to tylko odroczony wyrok œmierci. Prze¿yjê wystarczaj¹co d³ugo, aby rzuciæ siê na potwora.
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_05"); //Kiedy wypije moj¹ krew zginie. Chocia¿ tyle mogê zrobiæ dla moich braci...
	AI_Output (self, other,"DIA_BaalTondral_Swamp_13_06"); //Do ataku!
	B_LogEntry(CH4_RBL_Beast, "Baal Tondral wypi³ truciznê. Kiedy bestia go zabije i wypije krew sekciarza natychmiast zginie. Poœwiêcenie... Trudno zrozumieæ ludzi, którzy z w³asnej woli oddaj¹ ¿ycie za innych. Mam nadziejê, ¿e ja nie bêdê musia³ stawaæ przed podobnymi wyborami.");
	B_StopProcessInfos(self);

	AI_GotoWP(self, "PSI_START");
   Npc_ExchangeRoutine(self, "GuideToTemple");
};

// **************************************************

INSTANCE DIA_BaalTondral_End (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 4;
	condition	= DIA_BaalTondral_End_Condition;
	information	= DIA_BaalTondral_End_Info;
	permanent	= 0;
	important	= 1;
	description = "";
};                       

FUNC INT DIA_BaalTondral_End_Condition()
{
	/***************

Na placu przed wejœciem do œwiatymi bo tam jest bestia tak?

******************************/
	if (Npc_GetDistToWP (self, "PSI_TEMPLE_COURT_GURU") < 1000 )&&(Npc_KnowsInfo(hero,DIA_Lester_Comment))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_End_Info()
{
	var C_NPC lest; lest = Hlp_GetNpc(PC_Psionic);
	B_FullStop (hero);
	B_FullStop (lest);
	AI_GotoNpc(other,self);
	AI_GotoNpc(lest,self);
   
	AI_Output (self, other,"DIA_BaalTondral_End_13_00"); //Czujê wyziewy œmierci. Bestia czeka na nas w œrodku.
	AI_Output (other, self, "DIA_BaalTondral_End_15_01"); //Bêdziemy tu¿ za tob¹.
	AI_Output (self, other,"DIA_BaalTondral_End_13_02"); //Czas wype³niæ przeznaczenie... Argh!

	B_StopProcessInfos(self);
   Tondral_death = true;
	/***************
   Ork teraz zadanie dla ciebie.
   Ball pêdzie w stronê œwi¹tyni, ale na drodze nagle pojawi siê jakiœ super z¹biak i go œlicznie poszatkuje xD

   ****************************/
};
