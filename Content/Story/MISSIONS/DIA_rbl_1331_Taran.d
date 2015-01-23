// **************************************************
// // 						 EXIT 
// // **************************************************
//trader
// INSTANCE DIA_rbl_1331_baaltaran_Exit (C_INFO)
// {
// 	npc			= rbl_1331_baaltaran;
// 	nr			= 999;
// 	condition	= DIA_rbl_1331_baaltaran_Exit_Condition;
// 	information	= DIA_rbl_1331_baaltaran_Exit_Info;
// 	permanent	= 1;
// 	description = DIALOG_ENDE;
// };                       

// FUNC INT DIA_rbl_1331_baaltaran_Exit_Condition()
// {
// 	return 1;
// };

// FUNC VOID DIA_rbl_1331_baaltaran_Exit_Info()
// {
// 	B_StopProcessInfos	( self );
// };


// **************************************************

INSTANCE DIA_rbl_1331_baaltaran_Stew (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Stew_Condition;
	information		= DIA_rbl_1331_baaltaran_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie gulasz."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Stew_15_01"); //Mam dla Ciebie gulasz.
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Stew_11_02"); //Mo¿e by tym dziadostwem napchaæ fajkê wodn¹?
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Stew_15_03"); //Nie wiem, czy to dobry pomys³. Ale zrobisz jak uwa¿asz.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Taran zabra³ gulasz, a¿ siê bojê co z nim zrobi."); 
};

// **************************************************

var int Taran_300ore;
INSTANCE DIA_rbl_1331_baaltaran_Aloes (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz uwarzyæ miksturê z aloesu?"; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_01"); //Potrafisz uwarzyæ miksturê z aloesu?
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_02"); //Mo¿e i potrafiê. A do czego potrzebujesz tej mikstury?
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_03"); //Ktoœ straci³ g³os, a mi zale¿y na tym, aby go odzyska³.
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes_15_04"); //Potrafisz przygotowaæ miksturê?
	AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_05"); //Tak, ale to Ciê bêdzie kosztowaæ...
	
	// W momencie kiedy zobaczylem tekst o 800 bry³kach mialem 200 w ekwipunku + sam ekwipunek warty nie wiecej niz 100
	// 800 na ten moment to pomimo wszystko stanowczo za du¿o. 300 to i tak jest ogromna suma.
	if(taran_gone <= Wld_GetDay())&&(taran_gone!=0)//heh, dobry byl ten warunek sher :D
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_06"); //Hmm, zajmie mi to sporo pracy, do tego kosztowne ingrediencje no i op³ata manipulacyjna...
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_07"); //300 bry³ek!
		B_LogEntry		(CH1_Rbl_Plant, "Taran zgodzi³ siê uwarzyæ miksturê z aloesu ale za 300 bry³ek rudy. Jednak czasami warto uwa¿aæ komu siê podpada."); 
		Taran_300ore = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_08"); //Nie bêdê z ciebie zdziera³.
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes_11_09"); //100 bry³ek za³atwi sprawê.
		B_LogEntry		(CH1_Rbl_Plant, "Taran zgodzi³ siê uwarzyæ miksturê z aloesu za 100 bry³ek rudy."); 
	};
};

var int Aloes_Creation;
// **************************************************

func void B_Taran_create_aloes(var int nugget_value)
{
   if (NPC_HasItems(other,aloes)>=1)
	{		
		AI_Output (self, other, "B_Taran_create_aloes11_01"); //Œwietnie, masz rudê i niezbêdne sk³adniki. To potrwa tylko chwilkê...
		B_GiveInvItems(other,self,itminugget,nugget_value);
		Npc_RemoveInvItems(self,itminugget,nugget_value);
		B_GiveInvItems(other,self,aloes,1);
		Npc_RemoveInvItems(self,aloes,1);
		//ani
		AI_Output (self, other, "B_Taran_create_aloes_11_02"); //Oto i Twoje remedium.
		B_GiveInvItems(self,other,aloes_mixture,1);
		B_LogEntry		(CH1_Rbl_Plant, "Taran przygotowa³ miksturê, teraz wystarczy zanieœæ j¹ Pachowi."); 
		Aloes_Creation=TRUE;	
	}
	else
	{
		AI_Output (self, other, "B_Taran_create_aloes_11_03"); //Tak, masz rudê, ale jak mam zrobiæ miksturê z aloesu bez aloesu?
	};	
};

INSTANCE DIA_rbl_1331_baaltaran_Aloes2 (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes2_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Oto 100 bry³ek rudy, a teraz przygotuj miksturê."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes)&&(!Taran_300ore) && (!Aloes_Creation))
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes2_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes2_15_01"); //Oto 100 bry³ek rudy, a teraz przygotuj miksturê.
   
	if (NPC_HasItems(other,itminugget)>=100)
	{
		B_Taran_create_aloes(100);
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes2_11_05"); //Nie masz 100 bry³ek rudy, nie próbuj mnie oszukaæ.
	};
};

INSTANCE DIA_rbl_1331_baaltaran_Aloes2_2 (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 12;
	condition		= DIA_rbl_1331_baaltaran_Aloes2_2_Condition;
	information		= DIA_rbl_1331_baaltaran_Aloes2_2_Info;
	permanent		= 1;
	important		= 0;
	description		= "Oto 300 bry³ek rudy, a teraz przygotuj miksturê."; 
};

FUNC INT DIA_rbl_1331_baaltaran_Aloes2_2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_rbl_1331_baaltaran_Aloes))&&(Taran_300ore) && (!Aloes_Creation)
	{
		return 1;
	};
};

FUNC VOID DIA_rbl_1331_baaltaran_Aloes2_2_Info()
{
	AI_Output (other, self, "DIA_rbl_1331_baaltaran_Aloes2_2_15_01"); //Oto 300 bry³ek rudy, a teraz przygotuj miksturê.
   
	if (NPC_HasItems(other,itminugget)>=300)
	{
		B_Taran_create_aloes(300);
	}
	else
	{
		AI_Output (self, other, "DIA_rbl_1331_baaltaran_Aloes2_2_11_05"); //Nie masz 300 bry³ek rudy, nie próbuj mnie oszukaæ.
	};
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance DIA_BaalTaran_Greet (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jesteœ?";
};                       

FUNC int DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jesteœ?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa Œni¹cego.
};

INSTANCE DIA_BaalTaran_CanYouTeachMe (C_INFO)
{
	npc				=  RBL_1331_BaalTaran;
	nr				= 4;
	condition		= DIA_BaalTaran_CanYouTeachMe_Condition;
	information		= DIA_BaalTaran_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_BaalTaran_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTaran_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_BaalTaran_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_BaalTaran_CanYouTeachMe_15_02"); //Tak, mogê nauczyæ ciê, jak zwiêkszyæ swoj¹ duchow¹ si³ê.
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Taran mo¿e mi pomóc zwiêkszyæ manê.");
};
// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Bractwo Œni¹cego? A có¿ to takiego?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo Œni¹cego? A có¿ to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft1_05_01"); //Jesteœmy, lub raczej byliœmy wspólnot¹ wyznawców nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft1_05_02"); //Nasz obóz znajduje siê na wschód st¹d, na bagnie.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest Œni¹cy?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper1_05_01"); //Wierzyliœmy, ¿e Œni¹cy bêdzie naszym wybawicielem. Ale to nie by³a dobrze ulokowana wiara...
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach Œni¹cego.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach Œni¹cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Œni¹cy jest niezwykle potê¿ny, mo¿e nawet potê¿niejszy od Innosa, boga œwiat³a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre1_05_02"); //Ale jest przy tym zbyt zach³anny i krwio¿erczy. Wyrzek³em siê go i dobrze mi z tym.
};

// **************************************************

instance  DIA_BaalTaran_WhatDo (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 5;
	condition	= DIA_BaalTaran_WhatDo_Condition;
	information	= DIA_BaalTaran_WhatDo_Info;
	permanent	= 0;
	description = "Jak trafi³eœ do Obozu Rebeliantów?";
};                       

FUNC int  DIA_BaalTaran_WhatDo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Lehre))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo_15_00"); //Jak trafi³eœ do Obozu Rebeliantów?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo_05_01"); //Mia³em ju¿ doœæ tych œwirów na bagnie. Cavalorn m¹drze gada. Je¿eli zrobimy porz¹dek z Gomezem, to wtedy mo¿emy zacz¹æ ponowne negocjacje z królem.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo_05_02"); //Na pewno Arcymag Krêgu Ognia znajdzie sposób na zniszczenie bariery. Niech sobie Rhobar zabiera rudê, my chcemy siê tylko wyrwaæ z tego gówna.
};

// **************************************************

instance  DIA_BaalTaran_WhatDo1 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 6;
	condition	= DIA_BaalTaran_WhatDo1_Condition;
	information	= DIA_BaalTaran_WhatDo1_Info;
	permanent	= 0;
	description = "Czym siê zajmujesz w obozie?";
};                       

FUNC int  DIA_BaalTaran_WhatDo1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Lehre))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo1_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo1_15_00"); //Czym siê zajmujesz w obozie?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo1_05_01"); //Sprzedajê ziele, na tym znam siê najlepiej.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo1_05_02"); //Chcesz coœ kupiæ?
	Log_CreateTopic   	(CH2_DrugTrader,LOG_NOTE);
	B_LogEntry			(CH2_DrugTrader,"Taran w Obozie Rebeliantów sprzedaje ziele.");
};

// **************************************************

instance  DIA_BaalTaran_WhatDo3 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 8;
	condition	= DIA_BaalTaran_WhatDo3_Condition;
	information	= DIA_BaalTaran_WhatDo3_Info;
	important		= 1;
	permanent		= 0;
	description = "";
};                       

FUNC int  DIA_BaalTaran_WhatDo3_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo1))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo3_Info()
{
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_01"); //Zaczekaj chwilê... Twoje oczy...
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_02"); //Coœ z nimi nie tak?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_03"); //Wyczyta³em w nich... œmieræ.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_04"); //Co ty bredzisz. Od zielska zupe³nie pomiesza³o Ci siê w g³owie.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_05"); //Ziele pomaga mi dostrzec prawdê... 
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_06"); //Mo¿esz dowiedzieæ siê wiêcej za marne... 200 bry³ek.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo3_15_07"); //200 bry³ek za wys³uchanie jakiœ bredni? Nie jestem idiot¹!
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_08"); //Przeznaczenia nie oszukasz. Mogê Ci pomóc, ale nie za darmo.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo3_05_09"); //Wróæ jak zmienisz zdanie.
	Log_CreateTopic	(CH3_RBL_Destiny, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_Destiny, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_Destiny, "Taran twierdzi, ¿e potrafi zajrzeæ w przysz³oœæ. Za 200 bry³ek powie mi co mnie czeka. Mo¿e warto spróbowaæ?");
};

// **************************************************

instance  DIA_BaalTaran_WhatDo4 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 9;
	condition	= DIA_BaalTaran_WhatDo4_Condition;
	information	= DIA_BaalTaran_WhatDo4_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Przepowiedz mi przysz³oœæ.";
};                       

FUNC int  DIA_BaalTaran_WhatDo4_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo3))&& (NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo4_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_01"); //Przepowiedz mi przysz³oœæ.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_02"); //Tak te¿ i bêdzie...
	B_GiveInvItems (other, self, ItMiNugget, 200);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED", hero, hero, 1, 0, DAM_MAGIC, FALSE);	
	Mdl_ApplyOverlayMds(self,"humans_skeleton_fly.mds");
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_03"); //Przywiód³ Ciê tu gniew morza i ¿¹dza z³ota.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_04"); //Niestety znalaz³eœ tylko œmieræ i niepewnoœæ jutra.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_05"); //Tyle to sam wiem. Mia³eœ przepowiadaæ przysz³oœæ, a nie rozgrzebywaæ przesz³oœæ.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_06"); //Czeka Ciê d³uga droga, na której koñcu napotkasz... œmieræ.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_07"); //Przyjaciele wytrwaj¹ przy Tobie do koñca jednak spoczniesz sam tam gdzie z³o wziê³o swój pocz¹tek.
	AI_Output (other, self,"DIA_BaalTaran_WhatDo4_15_08"); //Kiedy to siê stanie?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_09"); //Wtedy gdy nadejdzie w³aœciwy czas...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_10"); //Ale bêdzie Ci dane wybraæ swój los. Bogowie nie nakreœlili Twego przeznaczenia, sam je ukszta³tujesz...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_11"); //Wczeœniej zostaniesz zdradzony jednak odp³acisz zdrajcy krwi¹...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_12"); //Ogieñ i œmieræ krocz¹ w Twym cieniu... Tak bêdzie do koñca Twych dni.
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_13"); //Pozorna prawda, wrogowie, którzy stan¹ siê przyjació³mi...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_14"); //Kl¹twa Pana Mroku...
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_15"); //Widzê... NIE!
	Mdl_RemoveOverlayMds(self,"humans_skeleton_fly.mds");
	AI_Output (self, other,"DIA_BaalTaran_WhatDo4_05_16"); //Nie mam ju¿ si³... OdejdŸ...
	Log_SetTopicStatus	(CH3_RBL_Destiny, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Destiny, "Taran ukaza³ mi przysz³oœæ, nie wiem jednak ile w jego s³owach jest prawdy... Poza tym ka¿dy musi w koñcu umrzeæ, kto chcia³by ¿yæ wiecznie? ");
	B_StopProcessInfos	( self );
};

// **************************************************

instance  DIA_BaalTaran_WhatDo5 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_WhatDo5_Condition;
	information	= DIA_BaalTaran_WhatDo5_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Wszystko w porz¹dku?";
};                       

FUNC int  DIA_BaalTaran_WhatDo5_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo4))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WhatDo5_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WhatDo5_15_01"); //Wszystko w porz¹dku?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo5_05_02"); //Nie! Do cholery nigdy jeszcze nie widzia³em czegoœ takiego...
	AI_Output (other, self,"DIA_BaalTaran_WhatDo5_15_03"); //O czym mówisz?
	AI_Output (self, other,"DIA_BaalTaran_WhatDo5_05_04"); //O niczym. OdejdŸ i najlepiej nigdy nie wracaj.
	B_StopProcessInfos	( self );
};

var int taran_gone;

// **************************************************

instance  DIA_BaalTaran_Stuff (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 11;
	condition	= DIA_BaalTaran_Stuff_Condition;
	information	= DIA_BaalTaran_Stuff_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam paczkê od Gilberta.";
};                       

FUNC int  DIA_BaalTaran_Stuff_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalKagan_StuffHave))&&(NPC_HasItems(other,package_stuff)>=1)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Stuff_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_01"); //Mam paczkê od Gilberta.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_02"); //Co? Dlaczego akurat Tobie j¹ da³? Poza tym mam jeszcze zapas.
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_03"); //Spotka³em go niedaleko Starego Obozu. Kiedyœ trochê mu pomog³em, a widaæ, ¿e wiek robi ju¿ swoje.
	AI_Output (other, self,"DIA_BaalTaran_Stuff_15_04"); //Powiedzia³, ¿e ma dla Ciebie przesy³kê wiêc zaoferowa³em pomoc. Ot i ca³a tajemnica.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_05"); //Staruszek pospieszy³ siê z dostaw¹. Ale w sumie co to za ró¿nica.
	AI_Output (self, other,"DIA_BaalTaran_Stuff_05_06"); //Daj paczkê. A to za fatygê.
	B_GiveInvItems (other, self, package_stuff, 1);
	Npc_RemoveInvItems(self,package_stuff,1);
	CreateInvItems (self,ItMiJoint_3, 1);
	B_GiveInvItems (self, other, ItMiJoint_3, 1);

	taran_gone = B_SetDayTolerance()+1;
	B_LogEntry		(CH2_RBL_Stuff,	"Taran dosta³ doprawiona paczkê ziela. Czas odebraæ zap³atê.");
};

// **************************************************

instance  DIA_BaalTaran_Stuff1 (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 12;
	condition	= DIA_BaalTaran_Stuff1_Condition;
	information	= DIA_BaalTaran_Stuff1_Info;
	important		= 1;
	permanent		= 0;
	description 		= ".";
};                       

FUNC int  DIA_BaalTaran_Stuff1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalKagan_StuffHave1))&&(taran_gone <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Stuff1_Info()
{
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_01"); //To Ty! To przez ciebie straci³em klientów!
	AI_Output (other, self,"DIA_BaalTaran_Stuff1_15_02"); //Nie wiem o czym mówisz...
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_03"); //Skurwiel! Ale nawet Ty nie uciekniesz przed kl¹tw¹ w³asnego przeznaczenia!
	AI_Output (self, other,"DIA_BaalTaran_Stuff1_05_04"); //Wspomnisz moje s³owa w chwili œmierci, piracie.
	B_StopProcessInfos	( self );
};

// **************************************************

instance  DIA_BaalTaran_Hanis (C_INFO)
{
	npc			= RBL_1331_BaalTaran;
	nr			= 13;
	condition	= DIA_BaalTaran_Hanis_Condition;
	information	= DIA_BaalTaran_Hanis_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia³em zapytaæ o Kharima.";
};                       

FUNC int  DIA_BaalTaran_Hanis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Quentin_Hanis1))&&(Npc_KnowsInfo(hero, DIA_BaalTaran_WhatDo1)) && (!Npc_KnowsInfo(hero, DIA_RATFORD_Hanis1))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Hanis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_01"); //Chcia³em zapytaæ o Kharima.
	AI_Output (self, other,"DIA_BaalTaran_Hanis_05_02"); //Tak?
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_03"); //Nie sprzeda³eœ mu ostatnio jakiegoœ ziela? Czegoœ specjalnego?
	AI_Output (self, other,"DIA_BaalTaran_Hanis_05_04"); //Nie. Nie sprzeda³em mu nic, odk¹d nie zap³aci³ za zew nocy. 
	AI_Output (other, self,"DIA_BaalTaran_Hanis_15_05"); //Dziêki.
	B_LogEntry		(CH2_RBL_Mem, "To nie Taran sprzeda³ ziele Kharimowi.");
};

//***************************************************************

/*************************************
Duch
*************************************/

// **************************************************

INSTANCE DIA_baaltaran_GhostMixt (C_INFO)
{
	npc				= rbl_1331_baaltaran;
	nr				= 312;
	condition		= DIA_baaltaran_GhostMixt_Condition;
	information		= DIA_baaltaran_GhostMixt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Rzucisz okiem na ten flakonik?"; 
};

FUNC INT DIA_baaltaran_GhostMixt_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Roderic_OldNote))&&(NPC_HasItems(other,dream_mixture)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_baaltaran_GhostMixt_Info()
{
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_01"); //Rzucisz okiem na ten flakonik?
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_02"); //Mogê i rzuciæ...

	/***************************
Przyda³a by siê jakas animacja z przyk³adaniem buteleczki do nosa

****************************/
	B_GiveInvitems(other,self,dream_mixture,1);
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_03"); //Co to mo¿e byæ?
	Ai_PlayAni(self,"T_CHECKPOTION_FULL");
	AI_WAit(self,1);
	
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_04"); //Wyczuwam ziele nostrzyka, liœæ melisy, korzeñ koz³ka, szyszki chmielu...
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_05"); //I siln¹ magiê. Ten napój musia³ sporz¹dziæ orkowy szaman. 
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_06"); //Jak dzia³a taka mikstura?
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_07"); //To mocny napój usypiaj¹cy. Z powodu szyszek chmielu czêsto dodaje siê do grzanego piwa, lub wina. Praktycznie nie da siê go wykryæ.
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_08"); //Chyba ju¿ rozumiem co siê sta³o.
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_09"); //Dziêki, Taran. Bardzo mi pomog³eœ.
	AI_Output (self, other, "DIA_baaltaran_GhostMixt_11_10"); //Nie ma sprawy. Mo¿e kupisz jakieœ ziele?
	AI_Output (other, self, "DIA_baaltaran_GhostMixt_15_11"); //Innym razem, bywaj.
	B_LogEntry		(CH3_RBL_RodneyHelp, "W fiolce, któr¹ znalaz³em w Wie¿y Mgie³ znajdowa³a siê silna mikstura usypiaj¹ca. Myœlê, ¿e to 'przyjaciel' ducha sta³ za zdrad¹. Poda³ mu grzane wino z œrodkiem usypiaj¹cym, a resztê za³atwili orkowie. Kawa³ z niego sukinsyna. Muszê porozmawiaæ z... duchem.");
}; 
