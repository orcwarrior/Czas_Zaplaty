
// **************************************************
// 						 EXIT 
// **************************************************
//TODO: W 3cim rozdziale jakis dialog, moze misja w ktorej informacja ze kharim wyrusza do NO
INSTANCE DIA_hun_729_kharim_Exit (C_INFO)
{
	npc			= hun_729_kharim;
	nr			= 999;
	condition	= DIA_hun_729_kharim_Exit_Condition;
	information	= DIA_hun_729_kharim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_hun_729_kharim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_hun_729_kharim_Exit_Info()
{
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_hun_729_kharim_Stew (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 12;
	condition		= DIA_hun_729_kharim_Stew_Condition;
	information		= DIA_hun_729_kharim_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynios³em porcjê gulaszu."; 
};

FUNC INT DIA_hun_729_kharim_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	&&(!Npc_KnowsInfo(other,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

FUNC VOID DIA_hun_729_kharim_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_hun_729_kharim_Stew_15_01"); //Przynios³em porcjê gulaszu.
	AI_Output (self, other, "DIA_hun_729_kharim_Stew_11_02"); //Ca³kiem opad³em z si³, z chêci¹ wrzucê coœ na ruszt.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Gulasz doda³ si³ Kharimowi."); 
};

// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Lubisz machaæ mieczem?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_KharimOR_What_15_00"); //Lubisz machaæ mieczem?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Jestem Kharim! Widzê, ¿e trafi³eœ tu niedawno, inaczej ju¿ byœ o mnie us³ysza³!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Jestem najlepszym wojownikiem, jakiego ten zawszony obóz kiedykolwiek ogl¹da³.
};

// **************************************************

instance Info_Kharim_WhatGor (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 2;
	condition		= Info_Kharim_WhatGor_Condition;
	information		= Info_Kharim_WhatGor_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Hanis wspomina³, ¿e siê z tob¹ posprzecza³.";
};                       

FUNC INT Info_Kharim_WhatGor_Condition()
{
	if (Npc_KnowsInfo(other,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_Kharim_WhatGor_Info()
{
	AI_Output (other, self,"Info_Kharim_WhatGor_15_00"); //Hanis wspomina³, ¿e siê z tob¹ posprzecza³.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_01"); //Ten pó³g³ówek dosta³ to, na co zas³u¿y³! Œmiecie, jak on, musz¹ znaæ swoje miejsce w stadzie.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_02"); //To ty mu da³eœ przez ³eb?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_03"); //Pewnie, ¿e ja!
	AI_Output (self, other,"Info_Kharim_WhatGor_09_04"); //Ten idiota powali³ mnie na ziemiê podczas walki treningowej. Oczywiœcie to by³ czysty przypadek.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_05"); //Wyci¹gn¹³ rêkê, ¿eby pomóc mi wstaæ. To by³o naprawdê g³upie posuniêcie.
	AI_Output (self, other,"Info_Kharim_WhatGor_09_06"); //Przywali³em mu p³azem w ³eb, ¿e zadudni³o.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_07"); //To przez to ma problemy z pamiêci¹?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_08"); //A co mnie to obchodzi. Sam siê tego prosi³. A Tobie co do tego?
	AI_Output (other, self,"Info_Kharim_WhatGor_15_09"); //Kto go wyrzuci³ z obozu?
	AI_Output (self, other,"Info_Kharim_WhatGor_09_10"); //Ratford. Quentin widzia³ jak by³o i zezna³ na moj¹ korzyœæ.
	AI_Output (other, self,"Info_Kharim_WhatGor_15_11"); //Ciekawa historyjka.

	B_LogEntry(CH2_RBL_Mem, "Kharim potwierdzi³, ¿e to on uderzy³ Hanisa podczas walki treningowej. Do tego to by³ nieuczciwy cios. Dowiedzia³em siê te¿, ¿e Hanisa z obozu wyrzuci³ Ratford w œwietle zeznañ Quentina. Ciekawe... Mo¿e Quentin powie coœ wiêcej?");
};

// **************************************************

instance Info_Kharim_WhatGor1 (C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 3;
	condition		= Info_Kharim_WhatGor1_Condition;
	information		= Info_Kharim_WhatGor1_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Dlaczego to zrobi³eœ?";
};                       

FUNC INT Info_Kharim_WhatGor1_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

func VOID Info_Kharim_WhatGor1_Info()
{
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_00"); //Dlaczego to zrobi³eœ?
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_01"); //Co do cholery?
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_02"); //Mówiê o kl¹twie berserkera.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_03"); //Sk¹d... A to sukinsyn z tego Kagana. Jeszcze siê z nim policzê!
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_04"); //Z nikim siê ju¿ nie policzysz. Wracasz do Nowego Obozu, a Hanis znowu bêdzie szkoli³ rekrutów.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_05"); //Plujê na ten wasz obóz! Za dobry jestem, ¿eby tu gniæ! Ju¿ dawno mia³em wracaæ do Lee.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_06"); //Dlaczego uknu³eœ ca³y ten plan?
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_07"); //Dlaczego? Ten skurwiel Hanis pokona³ mnie w walce. I to dwukrotnie!
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_08"); //Nikt nie mo¿e byæ lepszy ode mnie! Nikt!
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_09"); //S³yszysz?! Jestem najlepszym szermierzem w ca³ej tej cuchn¹cej Kolonii!
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_10"); //Ty? Œcierwojad by sobie lepiej poradzi³ z twoim mieczem.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_11"); //Jak œmiesz...
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_12"); //Wiesz jak o tobie mówi¹? Wielki Kharim z ma³¹ kuœk¹.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_13"); //Mistrz przechwa³ek, z którego wszyscy szydz¹.
	AI_Output (self, other,"Info_Kharim_WhatGor1_09_14"); //To niemo¿liwe...
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_15"); //A jednak. Jesteœ poœmiewiskiem i tchórzem, który podstêpem pokona³ prawdziwego wojownika.
	AI_Output (other, self,"Info_Kharim_WhatGor1_15_16"); //A teraz zejdŸ mi z oczu gnido, bo wyprujê ci flaki!
	
	B_LogEntry(CH2_RBL_Mem, "Kharim wraca do Nowego Obozu.");
	Npc_ExchangeRoutine(self,"NC1");
	//TODO: Sher, W tym momencie brakuje ostrego wjazdu na psyche Kharima przez bohatera
	/****************
Niech Kharim wraca do NO, mo¿e staæ gdzieœ w pobli¿u Laresa, czyli tam gdzie kiedyœ sta³ ry¿owy ksi¹¿e i lewus.
//TODO
****************/
};

instance Info_Kharim_Hi(C_INFO)
{
	npc				= hun_729_kharim;
	nr				= 1;
	condition		= Info_Kharim_Hi_Condition;
	information		= Info_Kharim_Hi_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC INT Info_Kharim_Hi_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cord_ConvoysPeopleDone3))
	{
		return 1;
	};
};

func VOID Info_Kharim_Hi_Info()
{
	if (HANIS_TRUST)
	{
		AI_Output (other, self,"Info_Kharim_Hi_15_01"); //No proszê, znajome œcierwo.
		AI_Output (self, other,"Info_Kharim_Hi_09_02"); //Proszê, nie bij mnie!
		Npc_ExchangeRoutine(self,"NC1");
	}
	else
	{
      AI_Output (self, other,"Info_Kharim_Hi_09_03"); //Coœ ty za jeden?
      AI_Output (other, self,"Info_Kharim_Hi_15_04"); //Mamy wspólnego znajomego, Corda.
      AI_Output (self, other,"Info_Kharim_Hi_09_05"); //W porz¹dku, mów co z tym konwojem.
      Npc_ExchangeRoutine(self,"START");
	};
   
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(!Npc_KnowsInfo (hero, DIA_Orkan_EscortGo))&&(orkan_wait >= Wld_GetDay())
	{
		merc_trap = TRUE;
		AI_Output (other, self,"Info_Kharim_Hi_15_06"); //Konwój wyruszy ju¿ wkrótce. Niech Cord wyœle zwiadowców, muszê obserwowaæ eskortê, bo nie znam trasy przemarszu.
		AI_Output (self, other,"Info_Kharim_Hi_09_07"); //Cholera jeszcze niedawno obija³em mordy w Starym Obozie, a teraz robiê za pos³añca. Dobra, Cord o wszystkim siê dowie.
		
		/*********************
      Ork zadanie dla ciebie. Zorganizuj zasadzkê. Trasê przemarszu zrób mo¿e tak, ¿eby oni poszli t¹ drog¹ przez orkowe tereny, ko³o tego krêgu pod którym by³ kamieñ ogniskuj¹cy a na koñcu zejd¹ t¹ œcie¿k¹ w skale.
      Zasadzkê zorganizuj w³aœnie tam gdzie by³ kamieñ ogniskuj¹cy pilnowany przez nieumar³ego magnata to najlepsze miejsce.
      Niech tam czeka z 8 najemników z Cordem na czele. Dialog chcê tak zrobiæ, ¿e najpierw zagada Cord, Dick bêdzie móg³ przekonaæ stra¿ników, ¿e walka jest beznadziejna i mog¹ do³¹czyæ do najmusów, trafiæ do kopalni albo zgin¹æ.
      Wiêc niech najemnicy maj¹ gld nieutraln¹ ze stra¿nikami na razie.
      *********************/
		
		//cord_trap ()l
	}
	else
	{
		AI_Output (other, self,"Info_Kharim_Hi_15_08"); //Zawali³em sprawê. Konwój nie wyruszy z obozu.
		AI_Output (self, other,"Info_Kharim_Hi_09_09"); //I Cord zaufa³ takiemu ciastochowi. Niech Ciê szlag trafi!
	};
   
	B_StopProcessInfos(self);
};