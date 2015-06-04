
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_PIR_2601_Hank_Exit (C_INFO)
{
	npc			= PIR_2601_Hank;
	nr			= 999;
	condition	= DIA_PIR_2601_Hank_Exit_Condition;
	information	= DIA_PIR_2601_Hank_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PIR_2601_Hank_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_PIR_2601_Hank_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2601_Hank_Hello (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 1;
	condition		= DIA_PIR_2601_Hank_Hello_Condition;
	information		= DIA_PIR_2601_Hank_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2601_Hank_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 350)&&(Kapitel<=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_Hello_Info()
{
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);

	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_01"); //Rick... to Ty?!
	AI_Output (other, self,"DIA_PIR_2601_Hank_Hello_15_02"); //A kogo siê spodziewa³eœ? Syreny morskiej z cyckami do pasa?
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_03"); //Byliœmy pewni, ¿e Twoje koœci bielej¹ na dnie.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_04"); //Niech mnie! A to siê ch³opaki uciesz¹!
	AI_TurnToNpc			(self,rodney);			
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_05"); //Hej, darmozjady! Rick ¿yje!
	B_Kapitelwechsel(1);	 	
	CreateInvItems	(self, ItFoBeer, 4);
	AI_TurnToNpc			(self,other);	
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_06"); //Naprawdê dobrze Ciê znowu widzieæ. Ten paskudny sztorm kompletnie nas zaskoczy³.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_07"); //To nie mog³a byæ zwyczajna burza. Ale mniejsza o to, wa¿ne, ¿e jesteœ w jednym kawa³ku, bez œladów po zêbach rekina na ty³ku.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_08"); //Trzymaj flaszkê i wyp³ucz gard³o z piasku. Smakuje du¿o lepiej ni¿ s³ona woda.
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_09"); //Twoje zdrowie, brachu!
	B_GiveInvItems (self, other,ItFoBeer, 1);
   
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};
   
	AI_UseItem (other,ItFobeer);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"DIA_PIR_2601_Hank_Hello_09_10"); //He, he, jak zawsze do dna. Ale pamiêtaj - nastêpnym razem Ty stawiasz!
	Npc_ExchangeRoutine	(self,"START");	
};

INSTANCE DIA_PIR_2601_Hank_WhereAreWe (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 2;
	condition		= DIA_PIR_2601_Hank_WhereAreWe_Condition;
	information		= DIA_PIR_2601_Hank_WhereAreWe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gdzie my jesteœmy?"; 
};

FUNC INT DIA_PIR_2601_Hank_WhereAreWe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_Hello))
	{
		return 1;
	};
};
FUNC VOID DIA_PIR_2601_Hank_WhereAreWe_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_01"); //Gdzie jesteœmy?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_02"); //Nie jestem pewien, ale to chyba wybrze¿e wyspy Khorinis. Niestety nie rozbiliœmy siê po tej stronie co trzeba.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_03"); //Czyli jak zawsze mamy przechlapane.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_04"); //Mniej wiêcej. Chocia¿ raczej wiêcej ni¿ mniej.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_05"); //Khorinis to du¿a wyspa, ze œlicznym portowym miastem, z bogatymi kupcami gotowymi oddaæ nam swoje z³oto i córki.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_06"); //To gdzie tkwi haczyk?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_07"); //Khorinis to te¿ kopalnie, gdzie l¹duj¹ najwiêksze mêty z ca³ej Myrtany.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_08"); //No tak, Kolonia Karna.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_09"); //W rzeczy samej, a my trafiliœmy w sam œrodek tego ³ajna. Do tego otacza nas jakaœ magiczna bariera.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_10"); //Buk³ak próbowa³ j¹ sforsowaæ. Uczepi³ siê takielunku i zanim go powstrzymaliœmy zamieni³ siê w œliczn¹ skwarkê.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_11"); //Czyli jesteœmy udupieni?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_12"); //Nie inaczej, brachu.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_13"); //A ruszyliœcie ju¿ t³uste zadki, ¿eby pospacerowaæ po okolicy?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_14"); //To samo powiedzia³ Angus. Musimy zbadaæ wyspê i mo¿e wyniuchamy jak st¹d prysn¹æ zanim narazimy siê niew³aœciwej osobie.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_15"); //Mam tylko nadziejê, ¿e reszta skazañców nie jest taka nerwowa jak Ci idioci w czerwonych zbrojach.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_16"); //Ktoœ was zaatakowa³?	
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_17"); //Mo¿na tak powiedzieæ. W ka¿dym razie próbowali. Nie posz³o im za dobrze, ale lepiej, ¿eby ich kumple nas nie znaleŸli.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhereAreWe_15_18"); //Spotkaliœcie innych skazañców?			
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_19"); //Na razie tylko tych w czerwonych pancerzach. Dalej siê nie zapuszczaliœmy. Angus mówi, ¿e lepiej nie rzucaæ siê w oczy.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhereAreWe_09_20"); //Poczekamy a¿ zapadnie zmrok i wtedy obejrzymy sobie okolicê.								
	
   Log_CreateTopic(CH1_Pir_Colony, LOG_NOTE);
	B_LogEntry(CH1_Pir_Colony, "Po tym jak dopad³ nas paskudny sztorm trafiliœmy do Kolonii Karnej na wyspie Khorinis. Do tego ca³¹ Koloniê otacza jakaœ magiczna bariera. Trzeba bêdzie znaleŸæ sposób, ¿eby siê st¹d wyrwaæ i to jak najszybciej.");
};

INSTANCE DIA_PIR_2601_Hank_WhatDo (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 3;
	condition		= DIA_PIR_2601_Hank_WhatDo_Condition;
	information		= DIA_PIR_2601_Hank_WhatDo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Uda³o siê uratowaæ coœ z ³adowni okrêtu?"; 
};

FUNC INT DIA_PIR_2601_Hank_WhatDo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_WhereAreWe))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_WhatDo_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_01"); //Uda³o siê uratowaæ coœ z ³adowni okrêtu?
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_02"); //Niestety nie. Ocali³em tylko to co mia³em na sobie. No i kilka flaszek, które przezornie schowa³em za pazuch¹.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_03"); //Niech to szlag trafi! Ca³e uczciwie zrabowane z³oto posz³o na dno! 
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_04"); //Takie ¿ycie brachu. Raz na dziewce, raz pod ch³opem.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_05"); //Ale mog³o byæ gorzej. Mamy szczêœcie, którego sporo z braci nie mia³o.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_06"); //Nie wiem, kto mia³ wiêksze szczêœcie. Oni przynajmniej nie musz¹ myœleæ, jak siê st¹d wydostaæ.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_07"); //Ja tam wolê umrzeæ z kutasem w ustach dziwki i flaszk¹ w d³oni, ni¿ w szczêkach rekina.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_08"); //Angus na pewno coœ wymyœli. Wychodziliœmy ca³o z gorszych opresji.
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_09"); //To siê dopiero oka¿e. Ja wolê braæ los we w³asne rêce.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_10"); //Spokojnie. Jak chcemy wynieœæ st¹d ¿ycie to musimy mocno pog³ówkowaæ. A ja kurde nie potrafiê myœleæ na trzeŸwo...
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_11"); //Od razu lepiej, wróci³a mi trzeŸwoœæ umys³u. Na czym to ja skoñczy³em...
	AI_Output (other, self,"DIA_PIR_2601_Hank_WhatDo_15_12"); //Jak zawsze na butelce.
	AI_Output (self, other,"DIA_PIR_2601_Hank_WhatDo_09_13"); //IdŸ lepiej pogadaj z Angusem. I pamiêtaj - braæ zawsze trzyma siê razem!							
};

/********************************
Nauki nie rusza³em tylko ten dialog jako info zosta³
**********************************/

INSTANCE DIA_PIR_2601_Hank_CanUTeachMe (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 4;
	condition		= DIA_PIR_2601_Hank_CanUTeachMe_Condition;
	information		= DIA_PIR_2601_Hank_CanUTeachMe_Info;
	permanent		= 0;
	//important		= 1;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_PIR_2601_Hank_CanUTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_PIR_2601_Hank_WhatDo))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_CanUTeachMe_Info()
{
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_02"); //Oczywiœcie! W koñcu tym siê zajmujê.
	//Orc: Poprawione - zla nazwa zmiennej tematy brak create topic'a
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);	
	B_LogEntry(GE_TeacherOW, "Pirat Hank nauczy mnie pos³ugiwaæ siê broni¹ dwurêczn¹ i poka¿e mi, jak zwiêkszyæ si³ê.");
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_03"); //Ech, nie ma to jak t³uc kordelasem królewskie ³by.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_04"); //Mogê nauczyæ Ciê porz¹dnie machaæ dwurêcznym orê¿em. Poka¿ê Ci te¿, jak zwiêkszyæ si³ê.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_05"); //Coœ marnie wygl¹dasz, trochê æwiczeñ Ci nie zaszkodzi.
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_06"); //Cholera, nie mam sakiewki.	
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_07"); //Bez obaw przyjacielu. Nauka nic Ciê nie bêdzie kosztowaæ.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_08"); //Koniec koñców tkwimy w tym bagnie razem. Kto wie, mo¿e od tego jak dobrze bêdziesz dŸgaæ sztychem zale¿eæ bêdzie te¿ i moje ¿ycie.
	AI_Output (other, self,"DIA_PIR_2601_Hank_CanUTeachMe_15_09"); //Dziêkujê, ale ja zawsze sp³acam zaci¹gniête d³ugi.
	AI_Output (self, other,"DIA_PIR_2601_Hank_CanUTeachMe_09_10"); //W swoim czasie, przyjacielu. W swoim czasie...
};

INSTANCE DIA_Hank_KillAligator (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 10;
	condition		= DIA_Hank_KillAligator_Condition;
	information		= DIA_Hank_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Widzê, ¿e siê nudzisz."; 
};

FUNC INT DIA_Hank_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillAligator_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Hank_KillAligator_15_01"); //Widzê, ¿e siê nudzisz. 
	AI_Output (self, other, "DIA_Hank_KillAligator_11_02"); //Schnê jak œledŸ w wêdzarni, w tym obozie nic siê nie dzieje.
	AI_Output (other, self, "DIA_Hank_KillAligator_15_03"); //Wybieram siê na polowanie, co Ty na to?
	AI_Output (self, other, "DIA_Hank_KillAligator_11_04"); //Jeszcze siê pytasz?! Idê z Tob¹, przyjacielu.
	B_LogEntry		(CH1_Rbl_Aligator, "Hank wyruszy³ ze mn¹ na polowanie.");
	Party_AddNpc(self);
   
	if (C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp (self);
		AI_TurnToNpc (self, other);
	};	
   
	Npc_ExchangeRoutine	(self,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Hank_KillAligatorOut (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 11;
	condition		= DIA_Hank_KillAligatorOut_Condition;
	information		= DIA_Hank_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hank_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hank_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
   
	AI_Output (self, other,"DIA_Hank_KillAligatorOut_11_01"); //Polowanie skoñczone. Znowu bêdê musia³ zarzuciæ kotwicê w tym cholernym obozie.
	AI_Output (other, self,"DIA_Hank_KillAligatorOut_15_02"); //Dziêki za pomoc Hank.
	
   B_LogEntry(CH1_Rbl_Aligator, "Hank po zabiciu aligatora wróci³ do obozu.");
	B_StopProcessInfos(self);
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"INHC");
};

// /************************

// Po ataku na orków przy queœcie z Carlsonem
// ************************/

// INSTANCE DIA_Hank_KillOrc (C_INFO)
// {
// 	npc				= PIR_2601_Hank;
// 	nr				= 12;
// 	condition		= DIA_Hank_KillOrc_Condition;
// 	information		= DIA_Hank_KillOrc_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "..."; 
// };

// FUNC INT DIA_Hank_KillOrc_Condition()
// {

// 	if (orc_appear == TRUE)&&(Npc_IsDead(Orc1))&&(Npc_IsDead(Orc2))&&(Npc_IsDead(Orc3))&&(Npc_IsDead(Orc4))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Hank_KillOrc_Info()
// {
// 	B_FullStop (hero);
// 	AI_GotoNpc(self,other);
// 	B_GiveXP(100);
// 	AI_Output (self, other,"DIA_Hank_KillOrc_11_01"); //By³o gor¹co, ale za to jaki ubaw, he, he.
// 	AI_Output (other, self,"DIA_Hank_KillOrc_15_02"); //Bywaj, Hank.
// 	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
// 	Npc_ExchangeRoutine	(self,"INHC");
// 	B_StopProcessInfos	(self);
// };

INSTANCE DIA_Hank_KillPatrol (C_INFO)
{
	npc				= PIR_2601_Hank;
	nr				= 13;
	condition		= DIA_Hank_KillPatrol_Condition;
	information		= DIA_Hank_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochotê na ma³¹ rozróbê?"; 
};

FUNC INT DIA_Hank_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Hank_KillPatrol_Info()
{
	AI_Output (other, self,"DIA_Hank_KillPatrol_15_01"); //Masz ochotê na ma³¹ rozróbê?
   
	if (!Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_02"); //Znasz mnie, z chêci¹ obijê jakieœ pyski. Ale najpierw pogadaj z Angusem, wolê nie robiæ nic za jego plecami.
		AI_Output (other, self,"DIA_Hank_KillPatrol_15_03"); //W porz¹dku.
		B_LogEntry		(CH2_RBL_GuardCamp, "Hank mi pomo¿e w za³atwieniu stra¿ników, ale najpierw muszê pogadaæ o tym z Angusem.");
	}
	else
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_04"); //Jak zawsze, sterniku!
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2601_Hank_Stew (C_INFO)
{
	npc				= PIR_2601_Hank;
	//nr				= 12;
	condition		= DIA_PIR_2601_Hank_Stew_Condition;
	information		= DIA_PIR_2601_Hank_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie gulasz."; 
};

FUNC INT DIA_PIR_2601_Hank_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2601_Hank_Stew_Info()
{
	fox_stew += 1;
   
	AI_Output (other, self, "DIA_PIR_2601_Hank_Stew_15_01"); //Mam dla Ciebie gulasz.
	AI_Output (self, other, "DIA_PIR_2601_Hank_Stew_11_02"); //Dobra, daj mi go. Przynajmniej zaspokojê swój g³ód.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Hankowi bez problemu wcisn¹³em gulasz."); 
};