// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_RBL_2604_Tony_Exit (C_INFO)
{
	npc			= RBL_2604_Tony;
	nr			= 999;
	condition	= DIA_RBL_2604_Tony_Exit_Condition;
	information	= DIA_RBL_2604_Tony_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_RBL_2604_Tony_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2604_Tony_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_RBL_2604_Tony_Warn (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 2;
	condition		= DIA_RBL_2604_Tony_Warn_Condition;
	information		= DIA_RBL_2604_Tony_Warn_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RBL_2604_Tony_Warn_Condition()
{
	//Grds at last need to be down.
	var c_npc grd1; var c_npc grd2;
	grd1 = Hlp_GetNpc(GRD_2599_Guard);
	grd2 = Hlp_GetNpc(GRD_4063_Guard);
	if (Npc_GetDistToNpc(self,hero) < 450)
	&& (grd1.attribute[ATR_HITPOINTS]<2)
	&& (grd2.attribute[ATR_HITPOINTS]<2)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2604_Tony_Warn_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);	
	
	AI_ReadyMeleeWeapon			(hero);
	self.flags = 0;
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_01"); //Ten ³achmyta nosi czerwon¹ zbrojê, wyprujmy mu flaki!
	AI_ReadyMeleeWeapon			(hank);
	AI_ReadyMeleeWeapon			(rodney);
	AI_ReadyMeleeWeapon			(angus);	
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_02"); //Stójcie! Schowajcie miecze zanim bêdzie za póŸno!
	//	AI_RemoveWeapon 			( rodney );	
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_03"); //Za póŸno na co, czerwona mendo?!	
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_04"); //Na pomy³kê, która mo¿e was i mnie kosztowaæ ¿ycie.
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_05"); //Mów jaœniej, bo koñczy mi siê cierpliwoœæ.
	// 	AI_RemoveWeapon 			( angus );	
	// 	AI_RemoveWeapon 			( hank );
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_06"); //Polujecie na czerwone zbroje?
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_07"); //Tylko siê bronimy. Ci dranie rzucili siê na nas na pla¿y, kiedy chcieliœmy spokojnie porozmawiaæ.
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_08"); //Drugi raz nie pope³nimy tego samego b³êdu. A wiadomo, ¿e najlepsz¹ obron¹ jest atak.
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_09"); //Jesteœmy po tej samej stronie barykady. Jestem zbiegiem ze Starego Obozu. To ludzie stamt¹d nosz¹ czerwone pancerze.
	//	AI_RemoveWeapon 			( hero );		
	AI_Output (other, self,"DIA_RBL_2604_Tony_Warn_15_10"); //Stary Obóz? A sk¹d ja mam wiedzieæ, ¿e mówisz prawdê?
	AI_Output (self, other,"DIA_RBL_2604_Tony_Warn_08_11"); //Udowodniê to. Zaprowadzê was do Obozu Rebeliantów, do którego teraz nale¿ê.
	Log_CreateTopic	(CH1_Pir_RebelCamp, LOG_MISSION);
	B_LogSetTopicStatus(CH1_Pir_RebelCamp, LOG_RUNNING);
	B_LogEntry		(CH1_Pir_RebelCamp, "Spotkaliœmy kolesia w czerwonej zbroi, który twierdzi, ¿e jest uciekinierem ze Starego Obozu. W zamian za ¿ycie chce nam udowodniæ, ¿e mówi prawdê i zaprowadzi nas do Obozu Rebeliantów, do którego podobno teraz nale¿y."); 
	
	//Npc_ExchangeRoutine(self,"START");	
};

instance  RBL_2604_Tony_CAMPS (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 3;
	condition		= RBL_2604_Tony_CAMPS_Condition;
	information		= RBL_2604_Tony_CAMPS_Info;
	permanent		= 0;
	important		= 0;
	description		= "Powiedz nam coœ wiêcej o tych obozach."; 
};

FUNC int  RBL_2604_Tony_CAMPS_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RBL_2604_Tony_Warn))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_CAMPS_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_CAMPS_Info_15_01"); //Powiedz nam coœ wiêcej o tych obozach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_02"); //Sk¹d wy siê wziêliœcie?
	AI_Output (other, self,"RBL_2604_Tony_CAMPS_Info_15_03"); //Powiedzmy, ¿e przyp³ynêliœmy.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_04"); //W porz¹dku, nie chcê wiedzieæ nic wiêcej. Wracaj¹c do obozów...
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_05"); //Znajdujemy siê w Kolonii Karnej. To tutaj Rhobar zsy³a najgorszych przestêpców, którzy zdychaj¹ w kopalniach wydobywaj¹c dla królewskiej armii bezcenn¹ rudê.	
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_06"); //Przed powstaniem bariery stra¿e zamieszkiwa³y na zamku. Kiedy powsta³a magiczna os³ona coœ posz³o nie tak. Natychmiast wykorzysta³ to Gomez i jego banda.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_07"); //Stra¿nicy nie mieli najmniejszych szans. Ludzie ze Starego Obozu wyr¿nêli prawie wszystkich, zostawiaj¹c przy ¿yciu tylko magów ognia, których zreszt¹ zamordowali zaledwie kilka dni temu.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_08"); //Wtedy te¿ da³em nogê z obozu tych psychopatów.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_09"); //Poza Starym Obozem powsta³ te¿ Nowy Obóz i Obóz Bractwa na bagnach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_10"); //W Nowym Obozie rz¹dz¹ magowie wody i najemnicy. Ruda, któr¹ siê tam wydobywa nie trafia jednak do królewskich kuŸni. 
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_11"); //Magowie Wody sk³aduj¹ kruszec w ogromnym kopcu. Podobno chc¹ wykorzystaæ rudê do ucieczki z Kolonii.	
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_12"); //Z kolei Obóz Bractwa na bagnach to banda œwirów uzale¿nionych od bagiennego ziela. Ci wierz¹ w jakiegoœ Œni¹cego, który ma im zwróciæ wolnoœæ.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_13"); //Jak siê pewnie domyœlasz, nie ka¿demu odpowiada³o ¿ycie w tych obozach.
	AI_Output (self, other,"RBL_2604_Tony_CAMPS_Info_07_14"); //Dlatego w³aœnie powsta³ Obóz Rebeliantów.
};

instance  RBL_2604_Tony_RebelCamp (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 4;
	condition		= RBL_2604_Tony_RebelCamp_Condition;
	information		= RBL_2604_Tony_RebelCamp_Info;
	permanent		= 0;
	important		= 0;
	description		= "Obóz Rebeliantów?"; 
};

FUNC int  RBL_2604_Tony_RebelCamp_Condition()
{
	if (Npc_KnowsInfo(other,RBL_2604_Tony_CAMPS))
	{
		return 1;
	};
};


FUNC void  RBL_2604_Tony_RebelCamp_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_01"); //Obóz Rebeliantów?
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_02"); //Tak. A co w tym dziwnego?
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_03"); //Nie s¹dzi³em, ¿e mordercy, gwa³ciciele i z³odzieje odczuwaj¹ potrzebê rebelii.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_04"); //Nikt nie lubi, jak siê mu mówi co ma robiæ.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_05"); //W Starym Obozie wszystko krêci siê wokó³ rudy i Gomeza. Wychylisz siê i czapa.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_06"); //W Nowym Obozie nikt Ciê nie szanuje, chyba, ¿e jesteœ s³ugusem na posy³ki Magów Wody.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_07"); //A Bractwo to banda æpunów wierz¹cych w urojonego bo¿ka.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_08"); //Zaczynam rozumieæ. Pewnie sam da³bym sobie z nimi spokój.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_09"); //Dlatego w³aœnie uciek³em ze Starego Obozu.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_10"); //Cz³owiek powinien sam decydowaæ o w³asnym losie. Nawet je¿eli musi wybraæ 'mniejsze z³o'.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_11"); //W rzeczy samej.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_12"); //Mo¿e i jesteœmy band¹ skazañców, ale nawet skazañcy maj¹ swój honor i dumê.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_13"); //Czyli Obóz Rebeliantów to zbieranina z pozosta³ych obozów?	
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_14"); //Mo¿na tak powiedzieæ. A Ty i twoi przyjaciele prêdzej czy póŸniej te¿ bêdziecie musieli wybraæ, po której stronie staniecie.
	AI_Output (other, self,"RBL_2604_Tony_RebelCamp_Info_15_15"); //To siê jeszcze oka¿e. Kto jest waszym przywódc¹?
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_16"); //Cavalorn, kiedyœ tak¿e nale¿a³ do Starego Obozu.
	AI_Output (self, other,"RBL_2604_Tony_RebelCamp_Info_07_17"); //Zreszt¹ zamiast strzêpiæ jêzyk, mogê was tam zaprowadziæ.
   
	B_LogEntry		(CH1_Pir_RebelCamp, "Obóz Rebeliantów zrzesza uciekinierów z pozosta³ych obozów. Przewodzi nimi niejaki Cavalorn.");
};

var int oc_tony_know;

///////////////////////////////
//OLD CAMP
/////////////////////////////	
instance  RBL_2604_Tony_OLDCAMP (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 5;	
	condition		= RBL_2604_Tony_OLDCAMP_Condition;
	information		= RBL_2604_Tony_OLDCAMP_Info;
	important		= 0;
	permanent		= 1;
	description		= "Opowiedz mi o Starym Obozie."; 
};

FUNC int  RBL_2604_Tony_OLDCAMP_Condition()
{
	if Npc_KnowsInfo(hero, RBL_2604_Tony_CAMPS)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Info_15_01"); //Opowiedz mi o Starym Obozie.
	AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Info_07_02"); //To stamt¹d uciek³em, wiêc co nieco wiem o tym miejscu.
	if (oc_tony_know == FALSE)
	{
		oc_tony_know = TRUE;
		Log_CreateTopic	(CH1_Pir_OldCamp, LOG_NOTE);
		B_LogEntry		(CH1_Pir_OldCamp, "Tony uciek³ ze Starego Obozu. Mogê dowiedzieæ siê od niego du¿o wiêcej o tym miejscu.");
	};

	Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	Info_AddChoice		(RBL_2604_Tony_OLDCAMP,"Dziêki za informacje. (wróæ)"	,RBL_2604_Tony_OLDCAMP_Exit);		
	
	if (Tony_Members == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ ludzie ze Starego Obozu?"	,RBL_2604_Tony_OLDCAMP_Members);
	};
	if (Tony_Jobs == FALSE)
	{
		Info_AddChoice (RBL_2604_Tony_OLDCAMP,"Czym dok³adnie zajmuje siê Stary Obóz?"	,RBL_2604_Tony_OLDCAMP_Jobs);
	};
	if (Tony_Chief == FALSE)
	{
		Info_AddChoice (RBL_2604_Tony_OLDCAMP,"Kto jest szefem w Starym Obozie?"	,RBL_2604_Tony_OLDCAMP_Chief);	
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Members()
{
	if (Tony_Members==FALSE)
	{
		Tony_Members = TRUE;
		Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Members_Info_15_01"); //Kim s¹ ludzie ze Starego Obozu?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Members_Info_07_02"); //Cz³onkowie Starego Obozu dziel¹ siê na cztery kasty - magnaci, stra¿nicy, cienie i kopacze.
		
      B_LogEntry		(CH1_Pir_OldCamp, "Stary Obóz zamieszkuj¹ cztery kasty: magnaci, stra¿nicy, cienie i kopacze.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Members_Info_15_03"); //Kim s¹ ludzie ze Starego Obozu?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Members_Info_07_04"); //Przecie¿ ju¿ ci o tym mówi³em.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
		if (Tony_OreBaron == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
		};
		if (Tony_Guards == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ stra¿nicy?",RBL_2604_Tony_OLDCAMP_Guards);
		};
		if (Tony_Diggers == FALSE)
		{	
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo¿esz mi coœ powiedzieæ o kopaczach?",RBL_2604_Tony_OLDCAMP_Diggers);	
		};
		if (Tony_Shadows == FALSE)
		{
			Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s¹ cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
		};
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powrót).",RBL_2604_Tony_OLDCAMP_Back);
	};
};


FUNC void  RBL_2604_Tony_OLDCAMP_Jobs()
{
	if (Tony_Jobs == FALSE)
	{
		Tony_Jobs = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Jobs_Info_15_01"); //Czym dok³adnie zajmuje siê Stary Obóz?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_02"); //Stary Obóz od pocz¹tku istnienia dostarcza³ magiczn¹ rudê królowi.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_03"); //W zamian za ni¹ otrzymuje wszystko czego zapragnie.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_04"); //Ostatnio stra¿nicy i magnaci zaczêli podejrzewaæ, ¿e cienie s¹ w zmowie z rebeliantami. Pola³a siê krew.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_05"); //Dlatego siê stamt¹d wynios³em.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_06"); //Cienie nadal s³u¿¹ Gomezowi, jednak sytuacja jest doœæ napiêta.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_07"); //Gomez nie mo¿e otwarcie napuœciæ na nich swoich stra¿ników, bo straci³by zbyt wielu swoich ludzi i os³abi³ obóz.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_08"); //Wiedz¹ o tym magnaci, stra¿nicy jak i cienie. Kto wie jak to siê skoñczy...
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_09"); //Najgorzej maj¹ kopacze. Od œwitu do zmierzchu haruj¹ w pocie czo³a przy wydobyciu rudy.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_10"); //A jedyne co z tego maj¹ to ¿arcie i obelgi stra¿ników.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_11"); //Gdyby kopacze stanêli po stronie cieni, to Gomez mia³by spory problem.
		B_LogEntry		(CH1_Pir_OldCamp, "Sytuacja w Starym Obozie wydaje siê doœæ napiêta. Magnaci i stra¿nicy nie ufaj¹ cieniom, nie mog¹ jednak otwarcie przeciwko nim wyst¹piæ, bo za bardzo os³abi³oby to si³y obozu. Warto te¿ pamiêtaæ o kopaczach, którzy szczerze nienawidz¹ stra¿ników.");	
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Jobs_Info_15_12"); //Czym dok³adnie zajmuje siê Stary Obóz?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Jobs_Info_07_13"); //Przecie¿ ju¿ Ci o tym mówi³em.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_Chief()
{
	if (Tony_Chief == FALSE)
	{
		Tony_Chief = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Chief_Info_15_01"); //Kto jest szefem w Starym Obozie?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_02"); //W Starym Obozie niepodzielnie rz¹dz¹ magnaci.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_03"); //A najwiêkszym skurwysynem wœród nich jest Gomez.
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_04"); //Gomez to szaleniec. Liczy siê dla niego tylko w³adza, któr¹ mo¿e kupiæ za rudê.	
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_05"); //Zrobi wszystko by przej¹æ kontrolê nad wydobyciem rudy w Kolonii.
		B_LogEntry		(CH1_Pir_OldCamp, "Przywódc¹ magnatów w Starym Obozie jest Gomez. Tony twierdzi, ¿e Gomez nie cofnie siê przed niczym by zdobyæ kontrolê nad kopalniami rudy w Kolonii.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OLDCAMP_Chief_Info_15_06"); //Kto jest szefem w Starym Obozie?
		AI_Output (self, other,"RBL_2604_Tony_OLDCAMP_Chief_Info_07_07"); //Nie lubiê siê powtarzaæ.
		Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	};
};

FUNC void  RBL_2604_Tony_OLDCAMP_OreBaron()
{
	if (Tony_OreBaron == FALSE)
	{
		Tony_OreBaron = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_OreBaron_Info_15_00");//Opowiedz mi o magnatach.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_01"); //Magnaci sprawuj¹ niepodzieln¹ w³adzê w Starym Obozie.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_02"); //Ich wola decyduje o ¿yciu lub œmierci.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_03"); //Magnaci wymieniaj¹ rudê na wszystko czego zapragn¹. Dostaj¹ nawet kobiety!
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_04"); //Król musi spe³niæ ka¿d¹ zachciankê tych pijawek. Nie mo¿e ryzykowaæ utraty dostaw magicznej rody.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_05"); //Czym wtedy walczyliby jego dzielni paladyni z orkami pustosz¹cymi kontynent?
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_06"); //Tak naprawdê koniec magicznej rudy oznacza koniec Myrtany.
		B_LogEntry		(CH1_Pir_OldCamp, "Magnaci otrzymuj¹ od króla za magiczn¹ rudê wszystko czego zapragn¹.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_OreBaron_Info_15_00");//Opowiedz mi o magnatach.
		AI_Output (self, other,"RBL_2604_Tony_OreBaron_Info_07_01"); //Ju¿ o nich pyta³eœ.
	};
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ stra¿nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Powiedzieæ mi coœ wiêcej o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s¹ cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powrót)."	,RBL_2604_Tony_OLDCAMP_Back);



};
FUNC void  RBL_2604_Tony_OLDCAMP_Guards()
{
	if (Tony_Guards == FALSE)
	{
		Tony_Guards = TRUE;
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_00"); //Kim s¹ stra¿nicy?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_15_01"); //Stra¿nicy pilnuj¹ Starego Obozu i kopalni nale¿¹cej do magnatów.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_02"); //Dowodzi nimi Thorus. To prawdziwy twardziel. Ciê¿ko go zabiæ... On zasze wraca! 
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_03"); //Chyba jako jedyny stra¿nik nie pochwala³ eliminacji podejrzanych Cieni.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_04"); //Thorus jest jednak lojalny. Wype³ni ka¿de polecenie Gomeza, nawet je¿eli nie bêdzie siê z nim zgadza³.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_05"); //Stra¿nicy to najwiêksza si³a Starego Obozu.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_06"); //S¹ wœród nich te¿ prawdziwe menty, rz¹dni krwi sadyœci i socjopaci. Jak nie przymierzaj¹c Bloodwyn.
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_09"); //Kim jest Bloodwyn?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_10"); //Bloodwyn gdyby móg³ wlaz³by Gomezowi do ty³ka bez ³oju z kretoszczura.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_11"); //Zrobi dla niego wszystko.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_12"); //Do tego ci¹gle pastwi siê nad kopaczami i czerpie z tego perwersyjn¹ przyjemnoœæ.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_13"); //Kolejny sadysta to Szakal.
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_14"); //Chocia¿ ten woli szukaæ wyzwañ wœród Cieni lub nawet innych Stra¿ników.	
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_07_15"); //W ka¿dym razie stra¿nicy ze Starego Obozu to najgorsze menty w ca³ej kolonii.	
		B_LogEntry		(CH1_Pir_OldCamp, "Stra¿nicy ze Starego Obozu to najwiêksze sukinsyny w kolonii. Na szczególn¹ uwagê zas³uguj¹ Bloodwyn i Szakal.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Guards_Info_15_00"); //Kim s¹ stra¿nicy?
		AI_Output (self, other,"RBL_2604_Tony_Guards_Info_15_01"); //Przecie¿ ju¿ wiesz.
	};
	Info_ClearChoices (RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ stra¿nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo¿esz mi coœ powiedzieæ o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s¹ cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powrót)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Shadows()
{
	if (Tony_Shadows == FALSE)
	{
		Tony_Shadows = TRUE;
      
		AI_Output (other, self,"RBL_2604_Tony_Shadows_Info_15_00"); //Cienie? Kim s¹ cienie?
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_01"); //Cienie to g³ównie zwiadowcy i myœliwi. Ktoœ pomiêdzy kopaczem, a stra¿nikiem.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_02"); //Kiedyœ by³em jednym z  nich.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_03"); //Przywódc¹ cieni jest, lub raczej by³, Diego. To prawdziwy twardziel.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_04"); //Nawet magnaci go szanuj¹, choæ jest dla nich jak wrzód na ty³ku.	
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_05"); //Diego ma zasady i nigdy ich nie ³amie. Mo¿e dlatego jest tak niebezpieczny dla magnatów.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_06"); //Do tego Diego ¿yje w dobrych stosunkach z ka¿d¹ wp³ywow¹ osob¹ w Kolonii niezale¿nie od tego z jakiego obozu ta osoba pochodzi.
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_07"); //Je¿eli w Starym Obozie ktoœ mo¿e bezpoœrednio zagroziæ magnatom to tym kimœ jest w³aœnie Diego.
		B_LogEntry		(CH1_Pir_OldCamp, "Cienie to g³ównie myœliwi i zwiadowcy. Ich przywódc¹ jest niejaki Diego. Podobno szanuj¹ go wszyscy mieszkañcy kolonii niezale¿nie od obozu, do którego nale¿¹.");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Shadows_Info_15_00"); //Cienie? Kim s¹ cienie?
		AI_Output (self, other,"RBL_2604_Tony_Shadows_Info_07_01"); //Cieniami i tyle.
	};
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ stra¿nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo¿esz mi coœ powiedzieæ o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie? Kim s¹ cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powrót)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Diggers()
{
	if (Tony_Diggers == FALSE)
	{
		Tony_Diggers = TRUE;
      
		AI_Output (other, self,"RBL_2604_Tony_Diggers_Info_15_00"); //Mo¿esz mi coœ powiedzieæ o kopaczach?
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_01"); //WyobraŸ sobie kogoœ kto za spleœnia³y ser czy zepsute miêso pracuje w pocie czo³a od zmierzchu do œwitu.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_02"); //WyobraŸ sobie kogoœ kto ci¹gle s³ucha obelg stra¿ników, kto za nieopatrzne spojrzenie traci ostatnie zêby. 
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_03"); //W koñcu wyobraŸ sobie kogoœ kto dla krotochwili stra¿ników walczy w nierównej walce o ¿ycie jak zaszczuty pies.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_04"); //To s¹ w³aœnie kopacze.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_05"); //Ostatnie ogniwo ³añcucha pokarmowego w Kolonii.
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_06"); //Jednak wbrew pozorom, nawet kopacze mog¹ byæ sporym zagro¿eniem. Gdyby znalaz³ siê ktoœ kto zdo³a³by ich zjednoczyæ i wskazaæ wspólny cel...
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_07"); //Jedyn¹ osob¹, która przychodzi mi na myœl jest Diego. 
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_08"); //W koñcu nawet paladyn Innosa dupa kiedy wrogów kupa, he, he.
		B_LogEntry		(CH1_Pir_OldCamp, "Wiem, ¿e nie chcia³bym zostaæ kopaczem. Dziwiê siê, ¿e ludzie daj¹ siê tak upodlaæ, tylko po to, ¿eby prze¿yæ. Mo¿e znajdzie siê kiedyœ ktoœ kto wska¿e kopaczom inny cel w ¿yciu?");
	}
	else
	{
		AI_Output (other, self,"RBL_2604_Tony_Diggers_Info_15_00"); //Mo¿esz mi coœ powiedzieæ o kopaczach?
		AI_Output (self, other,"RBL_2604_Tony_Diggers_Info_07_01"); //Szkoda na to czasu.
	};
   
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	if (Tony_OreBaron == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Opowiedz mi o magnatach."	,RBL_2604_Tony_OLDCAMP_OreBaron);
	};
	if (Tony_Guards == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ stra¿nicy?"	,RBL_2604_Tony_OLDCAMP_Guards);
	};
	if (Tony_Diggers == FALSE)
	{	
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Mo¿esz mi coœ powiedzieæ o kopaczach?"	,RBL_2604_Tony_OLDCAMP_Diggers);	
	};
	if (Tony_Shadows == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Cienie?... Kim s¹ cienie?"	,RBL_2604_Tony_OLDCAMP_Shadows);
	};
   
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"To mi wystarczy (Powrót)."	,RBL_2604_Tony_OLDCAMP_Back);
};

FUNC void  RBL_2604_Tony_OLDCAMP_Back()
{
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
	
   if (Tony_Members == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kim s¹ ludzie z Starego Obozu?"	,RBL_2604_Tony_OLDCAMP_Members);
	};
   
	if (Tony_Jobs == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Czym konkretnie zajmuje siê Stary Obóz?"	,RBL_2604_Tony_OLDCAMP_Jobs);
	};
   
	if (Tony_Chief == FALSE)
	{
		Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Kto jest szefem w Starym Obozie?"	,RBL_2604_Tony_OLDCAMP_Chief);	
	};
   
	Info_AddChoice	(RBL_2604_Tony_OLDCAMP,"Dziêki za informacje. (powrót)"	,RBL_2604_Tony_OLDCAMP_Exit);	
};

FUNC void  RBL_2604_Tony_OLDCAMP_Exit()
{
	Tony_Members = TRUE;
	Tony_Jobs = TRUE;
	Tony_Chief = TRUE;
	Tony_Guards = TRUE;
	Tony_Shadows = TRUE;
	Tony_Diggers = TRUE;
	Tony_OreBaron = TRUE;
	Info_ClearChoices	(RBL_2604_Tony_OLDCAMP );
};

instance  RBL_2604_Tony_Fallow (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 6;
	condition		= RBL_2604_Tony_Fallow_Condition;
	information		= RBL_2604_Tony_Fallow_Info;
	permanent		= 0;
	important		= 0;
	description		= "ZaprowadŸ nas do Obozu Rebeliantów."; 
};

FUNC int  RBL_2604_Tony_Fallow_Condition()
{
	if (Npc_KnowsInfo(other,DIA_RBL_2604_Tony_Warn))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_Fallow_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);	
	Party_AddNpc(hank);
	Party_AddNpc(rodney);
	Party_AddNpc(angus);
   
	AI_Output (other, self,"RBL_2604_Tony_Fallow_Info_15_01"); //ZaprowadŸ nas do Obozu Rebeliantów.
	AI_Output (self, other,"RBL_2604_Tony_Fallow_Info_07_02"); //Œwietnie. ChodŸcie za mn¹, tylko siê nie zgubcie.
	
   B_LogEntry		(CH1_Pir_RebelCamp, "Tony zaprowadzi mnie do Obozu Rebeliantów.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self, "GuideOR");
	// Bugfix: Pirates sometimes disapear so follow pc routine is
	// set after that dialog, not cinematic - orc
	Npc_ClearAiQueue(angus);		
	Npc_ClearAiQueue(hank);		
	Npc_ClearAiQueue(rodney);		
	Npc_ExchangeRoutine	(angus,"FOLPC2HUN");
	Npc_ExchangeRoutine(hank,"FOLPC2HUN");
	Npc_ExchangeRoutine(rodney,"FOLPC2HUN");	
	self.flags=NPC_FLAG_FRIEND;
	B_SetPermAttitude(self,ATT_FRIENDLY);	
	B_StopProcessInfos	(self);	
};

instance  RBL_2604_Tony_FallowEnd (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 7;
	condition		= RBL_2604_Tony_FallowEnd_Condition;
	information		= RBL_2604_Tony_FallowEnd_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  RBL_2604_Tony_FallowEnd_Condition()
{
	if (Npc_KnowsInfo(other,RBL_2604_Tony_Fallow))&&(Npc_GetDistToWP (self,"OW_PATH_OC_NC4") < 500 )
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_FallowEnd_Info()
{
	B_FullStop (other);
	AI_TurnToNpc(hero, self);
	AI_GotoNpc(self,other);
	B_GiveXP(150);
   
	AI_Output (self, other,"RBL_2604_Tony_FallowEnd_Info_07_01"); //Jesteœmy na miejscu.
	AI_Output (self, other,"RBL_2604_Tony_FallowEnd_Info_07_02"); //Uwa¿ajcie na siebie i nie dajcie siê zabiæ!
	AI_Output (other, self,"RBL_2604_Tony_FallowEnd_Info_15_03"); //O to siê nie bój.
	
   B_LogEntry		(CH1_Pir_RebelCamp, "Dotarliœmy do Obozu Rebeliantów. Teraz wszystko w naszych rêkach.");	
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self, "OR");
	var c_npc entrancegrd; entrancegrd=hlp_getnpc(HUN_2615_Abel);
	AI_GotoNPC(entrancegrd,hero);
	B_StopProcessInfos	(self);
};

var int tony_guard;
var int guard_ok;
instance  RBL_2604_Tony_Guard (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 6;
	condition		= RBL_2604_Tony_Guard_Condition;
	information		= RBL_2604_Tony_Guard_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chcia³bym do was do³¹czyæ."; 
};

FUNC int  RBL_2604_Tony_Guard_Condition()
{
	if (Npc_KnowsInfo(other,DIA_HUN_336_Cavalorn_Hello))&&(guard_ok==FALSE)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_Guard_Info()
{
	AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_01"); //Chcia³bym do was do³¹czyæ.
	
   if (tony_guard==FALSE)
	{
		tony_guard=TRUE;
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_02"); //M¹dra decyzja. Na pewno tego nie po¿a³ujesz.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_03"); //Zgadujê, ¿e szukasz kogoœ kto siê za Tob¹ wstawi u Cavalorna, tak?
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_04"); //W rzeczy samej.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_05"); //To dobrze trafi³eœ. Poza tym coœ jestem Ci winien przyjacielu.
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_06"); //To jak bêdzie? Szepniesz za mn¹ s³ówko Cavalornowi?	
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_07"); //Nie tak szybko. Wdziêcznoœæ, wdziêcznoœci¹, ale faktycznie jest coœ co móg³byœ dla mnie zrobiæ.
		AI_Output (other, self,"RBL_2604_Tony_Guard_Info_15_08"); //Zamieniam siê w s³uch.	
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_09"); //Od jakiegoœ czasu mam pecha do nocnych wart. Konam ju¿ ze zmêczenia.
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_10"); //Staniesz w nocy za mnie na warcie?
	}
	else
	{
		AI_Output (self, other,"RBL_2604_Tony_Guard_Info_07_11"); //To jak bêdzie z t¹ wart¹? Mogê na Ciebie liczyæ?
	};
   
	Info_ClearChoices (RBL_2604_Tony_Guard);
	Info_AddChoice (RBL_2604_Tony_Guard, "Czemu nie.", RBL_2604_Tony_Guard_Yes);
	Info_AddChoice (RBL_2604_Tony_Guard, "Raczej nie teraz.", RBL_2604_Tony_Guard_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID RBL_2604_Tony_Guard_Yes()
{
	guard_ok = TRUE;
	AI_Output (other,self,"RBL_2604_Tony_Guard_Yes_Info_15_01"); //Czemu nie.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_02"); //Wiedzia³em, ¿e porz¹dny z Ciebie ch³op.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_03"); //Robota jest prosta. Stajesz na warcie i pilnujesz, ¿eby nic nie pod³azi³o za blisko obozu.
	//Sher, popraw jak cos
	// (Tony wczesniej rozpoczyna³ nam misje z warta bez wzgledu na pore dnia
	// obecnie zaczyna sie w poprawionym kolejnym dialogu z uwzglednieniem daty (rutyna tonego takze zmieniona))
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_04"); //Moja warta rozpocznie siê w nocy.
	AI_Output (self, other,"RBL_2604_Tony_Guard_Yes_Info_07_05"); //Bêdê na ciebie czeka³.
	Log_CreateTopic	(CH1_Rbl_TonyGuard, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_TonyGuard, "¯eby zostaæ jednym z rebeliantów zgodzi³em siê stan¹æ za Toniego na warcie w nocy. Muszê dotrwaæ do rana, inaczej Tony mo¿e mieæ nieprzyjemnoœci, a ja nie zdobêdê jego poparcia.");
	Info_ClearChoices (RBL_2604_Tony_Guard);
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"GUIDESENTRY");	
};

// ------------------No----------------

FUNC VOID RBL_2604_Tony_Guard_No()
{
	AI_Output (other,self,"RBL_2604_Tony_Guard_No_Info_15_01"); //Raczej nie teraz.
	AI_Output (self, other,"RBL_2604_Tony_Guard_No_Info_07_02"); //Jak tam sobie chcesz. Wróæ jak zmienisz zdanie.
	Info_ClearChoices (RBL_2604_Tony_Guard);
	B_StopProcessInfos	(self);
};

instance  RBL_2604_Tony_GuardGuide (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 86;
	condition		= RBL_2604_Tony_GuardGuide_Condition;
	information		= RBL_2604_Tony_GuardGuide_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC int  RBL_2604_Tony_GuardGuide_Condition()
{
	if (guard_ok)&&(Npc_GetDistToWP(hero,"WITAMYWHC")<350)
	&&(Wld_IsTime(20,00,03,00))
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_GuardGuide_Info()
{
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_01"); //To tutaj.	
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_02"); //Ja pójdê siê porz¹dnie wyspaæ i wrócê rano.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_03"); //Tylko pamiêtaj, ¿eby nie schodziæ z posterunku, bo Cavalorn urwie mi jaja.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_04"); //No nic, czas ju¿ na mnie.
	AI_Output (self, other,"RBL_2604_Tony_GuardGuide_Info_07_05"); //Bywaj, do rana. Spokojnej nocy.
	AI_Output (other,self,"RBL_2604_Tony_GuardGuide_Info_15_06"); //Niech Ci siê przyœni jakaœ ma³o ow³osiona panna.
	Log_CreateTopic	(CH1_Rbl_TonyGuard, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_RUNNING);
	//Sher, popraw jak cos
	B_LogEntry		(CH1_Rbl_TonyGuard, "Przej¹³em nocn¹ wartê Toniego.");

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"REST");			
	Story_RickSentry_MisState=1;//akceptacja
};

instance  RBL_2604_Tony_GuardFinal (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr 				= 16;
	condition		= RBL_2604_Tony_GuardFinal_Condition;
	information		= RBL_2604_Tony_GuardFinal_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  RBL_2604_Tony_GuardFinal_Condition()
{
	if (Story_RickSentry_MisState>1)
	{
		return 1;
	};
};

FUNC void  RBL_2604_Tony_GuardFinal_Info()
{
	if (Story_RickSentry_MisState==2)
	{
		tony_trust = TRUE;
		B_GiveXP(300);
		rebel_camp_trust = rebel_camp_trust + 1; // inkrementacja zmiennej globalnej z wartoœci¹ zaufania w obozie rebeliantów za wykonanie zadañ.
		
      AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_01"); //Œwietna robota przyjacielu. Czujê siê jak m³ody bóg. Masz mój g³os i miecz je¿eli przyjdzie taka potrzeba.
		AI_Output (other, self,"RBL_2604_Tony_GuardFinal_Info_15_02"); //Nie by³o ³atwo, ale zawsze to jakaœ odmiana.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_03"); //WeŸ to, zas³u¿y³eœ.
		//mo¿e Tony da mu jak¹œ recepturê, albo sk³adniki.
		CreateInvItems (self,ItMiNugget, 70);
		B_GiveInvItems (self, other, ItMiNugget, 70);	
		B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_SUCCESS);
		B_LogEntry		(CH1_Rbl_TonyGuard, "Uda³o mi siê dotrwaæ do rana na warcie. Tony by³ bardzo wdziêczny, na pewno wstawi siê za mn¹ przed Cavalornem. Do tego dosta³em 100 bry³ek rudy.");
		B_LogEntry		(CH1_Rbl_RebelCampTrust, "Zdoby³em poparcie Toniego. Tylko tak dalej.");
	}
	else if (Story_RickSentry_MisState==3)
	{
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_04"); //Niech to szlag. Cavalorn obchodzi³ w nocy stra¿e i mój posterunek by³ podobno pusty.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_05"); //£adnie mi siê odwdziêczasz za pomoc w dotarciu do obozu.
		AI_Output (self, other,"RBL_2604_Tony_GuardFinal_Info_07_06"); //Nie bêdê sprzeciwia³ siê, kiedy Cavalorn zdecyduje siê przyj¹æ Ciê do obozu. Ale te¿ Ciê nie poprê. RadŸ sobie sam.

		B_LogSetTopicStatus	(CH1_Rbl_TonyGuard, LOG_FAILED);
		B_LogEntry		(CH1_Rbl_TonyGuard, "Niech to szlag. Nie zdoby³em g³osu Toniego. Mog³em jednak staæ na warcie zamiast w³óczyæ siê po okolicy.");
	};
   
	Npc_ExchangeRoutine	(self,"OR");	
};

INSTANCE DIA_Tony_Attack (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 11;
	condition		= DIA_Tony_Attack_Condition;
	information		= DIA_Tony_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Tony_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Attack_Info()
{
	AI_Output (self, other, "DIA_Tony_Attack_11_01"); //Cholera, a ja Ciê tu przyprowadzi³em...
	AI_Output (self, other, "DIA_Tony_Attack_11_02"); //Pirackie œcierwo!
	
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);	
};

// **************************************************

INSTANCE DIA_Tony_Stew (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 12;
	condition		= DIA_Tony_Stew_Condition;
	information		= DIA_Tony_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jedz na zdrowie przyjacielu."; 
};

FUNC INT DIA_Tony_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Tony_Stew_15_01"); //Jedz na zdrowie przyjacielu.
	AI_Output (self, other, "DIA_Tony_Stew_11_02"); //Dziêki, tego mi brakowa³o...
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Tony podziêkowa³ i zjad³ gulasz zanim zd¹¿y³em zamrugaæ oczami."); 
};

INSTANCE DIA_Tony_Spy (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 13;
	condition		= DIA_Tony_Spy_Condition;
	information		= DIA_Tony_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "D³ugo jesteœ w obozie?"; 
};

FUNC INT DIA_Tony_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_Tony_Spy_15_01"); //D³ugo jesteœ w obozie?
	AI_Output (self, other, "DIA_Tony_Spy_11_02"); //Wystarczaj¹co d³ugo, ¿eby staæ siê jego czêœci¹.
	AI_Output (self, other, "DIA_Tony_Spy_11_03"); //I nie ¿a³ujê swojej decyzji. Stary Obóz to banda socjopatów, lepiej siê trzymaæ od nich z daleka.
	AI_Output (other, self, "DIA_Tony_Spy_15_04"); //Nie ma tam nikogo normalnego?
	AI_Output (self, other, "DIA_Tony_Spy_11_05"); //Mia³em tam tylko jednego przyjaciela, nazywa³ siê Szakal i niejedn¹ butelkê razem osuszyliœmy.
	
   if (Tony_Guards == TRUE)
	{
		AI_Output (other, self, "DIA_Tony_Spy_15_06"); //Szakal? Wczeœniej powiedzia³eœ, ¿e to wredny sukinsyn.
		AI_Output (self, other, "DIA_Tony_Spy_11_07"); //Niemo¿liwe. Muszê wracaæ do swoich obowi¹zków...
		B_LogEntry		(CH2_Rbl_Spy, "Przy³apa³em Toniego na k³amstwie. Wczeœniej nazwa³ Szakala wrednym sukinsynem, teraz twierdzi, ¿e nic takiego nie powiedzia³. Dziwne...");
	};
   
	B_LogEntry		(CH2_Rbl_Spy, "Tony powiedzia³ mi, ¿e nie ¿a³uje swej decyzji. Stary Obóz to wg niego banda socjopatów. Tony mia³ tam tylko jednego przyjaciela, który nazywa³ siê Szakal.");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Tony_Spy1 (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 13;
	condition		= DIA_Tony_Spy1_Condition;
	information		= DIA_Tony_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno nie zawsze wybierasz proste œcie¿ki."; 
};

FUNC INT DIA_Tony_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Spy1_Info()
{
	tony_spy = tony_spy + 1;
   
	AI_Output (other, self, "DIA_Tony_Spy1_15_01"); //Podobno nie zawsze wybierasz proste œcie¿ki.
	AI_Output (self, other, "DIA_Tony_Spy1_11_02"); //Nie rozumiem...
	AI_Output (other, self, "DIA_Tony_Spy1_15_03"); //Chodz¹ s³uchy, ¿e nie zawsze mówisz prawdê.
	AI_Output (self, other, "DIA_Tony_Spy1_11_04"); //W koñcu jesteœmy w Kolonii Karnej. Tutaj ka¿dy mówi to co chce. Masz z tym jakiœ problem?
	AI_Output (other, self, "DIA_Tony_Spy1_15_05"); //Mo¿e i mam. Nale¿ymy do tego samego... stada. Brak zaufania nas os³abia.
	AI_Output (self, other, "DIA_Tony_Spy1_11_06"); //Wtykasz nos w nie swoje sprawy. Mo¿e zrobi³em b³¹d przyprowadzaj¹c Ciê tutaj.
	AI_Output (self, other, "DIA_Tony_Spy1_11_07"); //ZejdŸ mi z oczu.

	B_LogEntry		(CH2_Rbl_Spy, "Rozmowa z Tonym nie wyjaœni³a zbyt wiele, prócz tego, ¿e by³ dziwnie zdenerwowany. Mo¿e to w³aœciwy trop...");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};
   
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Tony_Secrets1 (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Secrets1_Condition;
	information		= DIA_Tony_Secrets1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie propozycjê."; 
};

FUNC INT DIA_Tony_Secrets1_Condition()
{
	if (tony_spy == 15)&&(Npc_KnowsInfo (hero, DIA_Tony_Spy1))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Secrets1_Info()
{
	AI_Output (other, self, "DIA_Tony_Secrets1_15_01"); //Mam dla Ciebie propozycjê.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_02"); //Po naszej ostatniej rozmowie nie chcê mieæ z Tob¹ nic wspólnego.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_03"); //Spokojnie. Wtedy pad³o zbyt wiele pochopnych s³ów.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_04"); //Przemyœla³em kilka spraw i dlatego wróci³em.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_05"); //Streszczaj siê.
	AI_Output (other, self, "DIA_Tony_Secrets1_15_06"); //Cavalorn wie, ¿e ktoœ z obozu ryje na rzecz magnatów.
	AI_Output (self, other, "DIA_Tony_Secrets1_11_07"); //Po co mi to mówisz? Co mnie to obchodzi?!
	AI_Output (other, self, "DIA_Tony_Secrets1_15_08"); //Powinno, bo jestem pewien, ¿e to Ty!
	
   AI_DrawWeapon (self);
	
   AI_Output (self, other, "DIA_Tony_Secrets1_11_09"); //Nie bêdê obojêtnie s³ucha³ podobnych kalumnii! Zaraz ze¿resz to co powiedzia³eœ razem z ostrzem...
	AI_Output (other, self, "DIA_Tony_Secrets1_15_10"); //Zaczekaj! Gdybym przyszed³ tu po to, ¿eby Ciê za³atwiæ, to ju¿ le¿a³byœ martwy.
	
   AI_RemoveWeapon (self);
   
	AI_Output (self, other, "DIA_Tony_Secrets1_11_11"); //Skoñczymy tê rozmowê gdzie indziej. ChodŸ za mn¹!
   
	B_StopProcessInfos(self);
   
	//AI_GotoWP		(self, "TONY_M");
	//AI_GotoWP		(hero, "ABEL_M");
   Npc_ExchangeRoutine	(self,"MEETING");
};
	
INSTANCE DIA_Tony_Secrets (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Secrets_Condition;
	information		= DIA_Tony_Secrets_Info;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Tony_Secrets_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Tony_Secrets1))&&(Npc_GetDistToWP(self,"TONY_M") < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Secrets_Info()
{
	AI_GotoNPC(hero, self);	
	AI_TurnToNpc (self, other);
	AI_Output (self, other, "DIA_Tony_Secrets_11_11"); //A teraz mów o co ci chodzi.

	Info_ClearChoices (DIA_Tony_Secrets);
	Info_AddChoice (DIA_Tony_Secrets, "Zap³aæ za milczenie.", DIA_Tony_Secrets_Pay);
	Info_AddChoice (DIA_Tony_Secrets, "Chcia³em... zmieniæ stronê.", DIA_Tony_Secrets_Join);
	Info_AddChoice (DIA_Tony_Secrets, "Jednak siê rozmyœli³em... Giñ zdrajco!", DIA_Tony_Secrets_Kill);
};

// -----------------------pay--------------------------------------------
/*
TODO: Po zakonczeniu dialogu odpala sie kamerka, rick i tony wyjmuja bronie tony pada na glebe bohater zostaje "osaczony" przez mysliwych. -> start dialogu z abelem z automatu
*/
var int tony_pay;

FUNC VOID DIA_Tony_Secrets_Pay()
{
   tony_pay = 1;
	tony_spy = tony_spy + 2;//17

	AI_Output (other, self, "DIA_Tony_Secrets_Pay_15_01"); //Zap³aæ  za milczenie.
	AI_Output (self, other, "DIA_Tony_Secrets_Pay_11_02"); //P³aciæ za co? Za swoj¹ niewinnoœæ? Chyba uderzy³eœ siê w g³owê!
	AI_Output (other, self, "DIA_Tony_Secrets_Pay_15_03"); //Czyli nie zap³acisz?
	AI_Output (self, other, "DIA_Tony_Secrets_Pay_11_04"); //Nie, idioto! A teraz ¿ryj ¿elazo...
	
   Info_ClearChoices (DIA_Tony_Secrets);
	B_StopProcessInfos	(self);
};

// -------------------------kill------------------------------------------
var int tony_death;

FUNC VOID DIA_Tony_Secrets_Kill()
{
   tony_death = 1;
	tony_spy = tony_spy + 2;//17

	AI_Output (other, self, "DIA_Tony_Secrets_Kill_15_01"); //Jednak siê rozmyœli³em... Giñ zdrajco!
	AI_Output (self, other, "DIA_Tony_Secrets_Kill_11_02"); //Sam siê prosisz o œmieræ!
	
   Info_ClearChoices (DIA_Tony_Secrets);
   B_StopProcessInfos	(self);
};

// ----------------------------join---------------------------------------
var int tony_join;

FUNC VOID DIA_Tony_Secrets_Join()
{
   tony_join = 1;
	tony_spy = tony_spy + 1;//16
   
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_01"); //Chcia³em... zmieniæ stronê.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_02"); //Nie rozumiem...
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_03"); //Rozumiesz doskonale. Dlatego zamiast wydaæ Ciê Cavalornowi wola³em porozmawiaæ.
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_04"); //Za³ó¿my czysto hipotetycznie, ¿e masz racjê. Co mo¿esz mi zaoferowaæ?
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_05"); //Swoje us³ugi i spor¹ wiedzê o planach Cavalorna.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_06"); //Powiedz mi wszystko, a ja przeka¿ê Twoje s³owa komu trzeba.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_07"); //Nie jestem idiot¹. Chcê osobiœcie porozmawiaæ z Twoim kontaktem.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_08"); //To nie takie proste... Nikt Ciê nie zna, nikt Ci nie ufa...
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_09"); //Przecie¿ rozmawiamy czysto hipotetycznie. A co do ryzyka, to tylko ja je ponoszê.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_10"); //Je¿eli stwierdz¹, ¿e to co wiem to za ma³o, to skoñczê jako nawóz gdzieœ w kniei.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_11"); //Hmm... Dobra, tutaj jest za du¿o ciekawskich uszu i oczu.
	AI_Output (self, other, "DIA_Tony_Secrets_Join_11_12"); //Dokoñczymy tê hipotetyczn¹ rozmowê póŸniej. Bêdê tu czeka³ po zmroku.
	AI_Output (other, self, "DIA_Tony_Secrets_Join_15_13"); //Przyjdê na pewno.
	
   B_LogEntry		(CH2_Rbl_Spy, "Mam Toniego! Co prawda rozmawialiœmy czysto hipotetycznie, ale dowiem siê wiêcej po zmroku w pobli¿u G³êbi.");
	B_StopProcessInfos	(self);

	/*****************************
		W dzieñ normalnie a od 22 do 4 rano czeka tam w obozie na dicka

		*****************************/
	Npc_ExchangeRoutine	(self,"MOURDER");
};

INSTANCE DIA_Tony_SecretsMeet (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 16;
	condition		= DIA_Tony_SecretsMeet_Condition;
	information		= DIA_Tony_SecretsMeet_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tony_SecretsMeet_Condition()
{
	if (Npc_GetDistToWP(self,"TONY_M") < 500)&&(tony_join)&&(Wld_IsTime (22,00,04,00))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_SecretsMeet_Info()
{
	tony_spy = tony_spy + 1;//17
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_01"); //W koñcu jesteœ!
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_02"); //Nie zwyk³em rzucaæ s³ów na wiatr. Dowiem siê czegoœ wiêcej?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_03"); //Byæ mo¿e. Czyli chcesz zmieniæ... stronê?
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_04"); //Inaczej zamiast mnie przyszed³by tu Cavalorn i kilku rebeliantow, ¿eby wypruæ Ci flaki.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_05"); //Racja. Dobra wystarczy tych gierek.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_06"); //Owszem pracujê dla magnatów, a dok³adnie dla Hrabiego.
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_07"); //Hrabiego?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_08"); //To ktoœ komu lepiej nie wchodziæ w paradê. Hrabia s³ucha tylko Kruka, nawet Gomeza ma w dupie. To jemu sk³adam raporty.
	AI_Output (other, self, "DIA_Tony_SecretsMeet_15_09"); //Czyli za tym wszystkim nie stoi Gomez tylko Kruk?
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_10"); //Mo¿na tak powiedzieæ. Gomez myœli tylko o rudzie i zemœcie. Kruk ma dalekosiê¿ne plany, a Hrabia po prostu trzyma z silniejszym i sprytniejszym.
	AI_Output (self, other, "DIA_Tony_SecretsMeet_11_11"); //Umówiê Ciê z Hrabi¹ i wtedy...
	
   AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Tony_Mourder_11_05"); //Co to do cholery?
	
   AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
   AI_PlayAni(self, "T_HEASHOOT_2_STAND");
   
	AI_Output (self, other, "DIA_Tony_Mourder_11_06"); //Niiieeee!!!
	B_StopProcessInfos	(self);
};

//******************Killing

INSTANCE DIA_Tony_Mourder (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 15;
	condition		= DIA_Tony_Mourder_Condition;
	information		= DIA_Tony_Mourder_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Tony_Mourder_Condition()
{
	if (tony_pay)||(tony_death)||(Npc_KnowsInfo (hero, DIA_Tony_SecretsMeet))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Mourder_Info()
{
	var C_NPC abel; abel = Hlp_GetNpc(HUN_2615_Abel);
	Npc_ClearAiQueue(abel);		
	Npc_ExchangeRoutine(abel,"MOURDER");
   
   B_LogEntry(CH2_Rbl_Spy, "Tony zosta³ zabity na moich oczach strza³em z kuszy albo ³uku. Ktoœ to zaplanowa³ i wrobi³ mnie w morderstwo!");

   B_StopProcessInfos(self);
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
   B_StopProcessInfos(hero);
};

/***************************

SIDE QUEST

****************************/

INSTANCE DIA_Tony_Kuva (C_INFO)
{
	npc				= RBL_2604_Tony;
	nr				= 20;
	condition		= DIA_Tony_Kuva_Condition;
	information		= DIA_Tony_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jaki masz interes w wykupie d³ugu Kuvy?";
};

FUNC INT DIA_Tony_Kuva_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_KuvaOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Tony_Kuva_Info()
{
	AI_Output (other, self, "DIA_Tony_Kuva_15_01"); //Jaki masz interes w wykupie d³ugu Kuvy?
	AI_Output (self, other, "DIA_Tony_Kuva_11_02"); //Sk¹d o tym wiesz?
	AI_Output (other, self, "DIA_Tony_Kuva_15_03"); //To niewa¿ne. Co Kuva robi w klatce i kto go tam zamkn¹³?
	AI_Output (self, other, "DIA_Tony_Kuva_11_04"); //Sporo tych pytañ...
	AI_Output (self, other, "DIA_Tony_Kuva_11_05"); //D³ug Kuvy wykupi³em bo mia³em w³asne powody. To nie twoja sprawa.
	AI_Output (other, self, "DIA_Tony_Kuva_15_06"); //Ale sprawa Kuvy. Siedzi teraz w zamkniêciu i czeka na œmieræ!
	AI_Output (self, other, "DIA_Tony_Kuva_11_07"); //A co mnie to obchodzi.
	AI_Output (other, self, "DIA_Tony_Kuva_15_08"); //Je¿eli masz to gdzieœ to dlaczego wykupi³eœ jego d³ug?
	AI_Output (self, other, "DIA_Tony_Kuva_11_09"); //Ju¿ powiedzia³em, to nie twoja sprawa. Spadaj.

	B_LogEntry		(CH1_RBL_Cage, "Niczego nie dowiedzia³em siê od Toniego. Nie wiem, co on knuje, ale powinienem jeszcze raz porozmawiaæ z Kuv¹, mo¿e przypomni sobie coœ przydatnego.");
};
