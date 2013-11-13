// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_PIR_2600_Angus_Exit (C_INFO)
{
	npc			= PIR_2600_Angus;
	nr			= 999;
	condition	= DIA_PIR_2600_Angus_Exit_Condition;
	information	= DIA_PIR_2600_Angus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PIR_2600_Angus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_PIR_2600_Angus_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2600_Angus_Hello (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 2;
	condition		= DIA_PIR_2600_Angus_Hello_Condition;
	information		= DIA_PIR_2600_Angus_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2600_Angus_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_Hello_Info()
{
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_01"); //A niech mnie rekin wychêdo¿y, przecie¿ to Rick!
	AI_TurnToNpc 			(hero,self);
	AI_GotoNpc(self, other);
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_02"); //Dobrze widzieæ Ciê w jednym kawa³ku, Angus.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_03"); //Wiedzia³em, ¿e jesteœ zbyt koœcisty i cuchn¹cy nawet dla rekina.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_04"); //Wybra³eœ dobry moment, ¿eby powróciæ z martwych. Z Rodneyem ju¿ powspomina³eœ stare czasy.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_05"); //Skoro tak, to pewnie wiesz, w jakie gówno wdepnêliœmy.
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_06"); //Kolonia Karna.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_07"); //Dok³adnie, to miejsce jest, jak czarna dziura w dupie samego Beliara. Do tego ta bariera...
	
   if (Npc_KnowsInfo(hero,DIA_PIR_2601_Hank_WhereAreWe))
	{
		AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_08"); //Hank mówi³, ¿e masz jakiœ plan, ¿eby siê st¹d wydostaæ.
	};
   
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_09"); //Co zamierzasz?
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_10"); //Jak to co? Nie daæ siê zabiæ, nape³niæ brzuch i czekaæ na pomyœlny wiatr.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_11"); //Widzia³eœ tych pata³achów w czerwonych ³achmanach?
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_12"); //Jeszcze nie.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_13"); //Spróbowaliœmy negocjacji, ale rzucili siê na nas szybciej, ni¿ Hank zd¹¿y³ opró¿niæ butelkê rumu.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_14"); //Trzeba przyznaæ, ¿e odwagi im nie brakowa³o, choæ gorzej z rozumem. Nakarmiliœmy nimi ryby, ¿eby œcierwa nie psu³y powietrza na pla¿y.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_15"); //Teraz nadszed³ czas na bardziej przemyœlane posuniêcie. Zaczniemy od spacerku po okolicy.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_16"); //Poczekamy do zmierzchu, lepiej nie rzucaæ siê nikomu w oczy, bo coœ strasznie nerwowi ci skazañcy.
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_17"); //Jak dot¹d brzmi rozs¹dnie.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_18"); //Znasz mnie, rozs¹dek to moje drugie imiê, tym bardziej, ¿e ten las ma w sobie coœ z bestii.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_19"); //Przy zejœciu na pla¿ê widzia³em zwiadowcê w czerwonej zbroi. Na razie lepiej go omijaæ, przynajmniej w pojedynkê. 
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_20"); //Daj znaæ, jak bêdziesz chcia³ siê trochê rozerwaæ. Pójdziemy wyt³umaczyæ temu idiocie, ¿e nie lubimy, jak ktoœ nas podgl¹da.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_21"); //Poza tym przyda Ci siê trochê æwiczeñ, bo coœ marnie wygl¹dasz. 
	AI_Output (other, self,"DIA_PIR_2600_Angus_Hello_15_22"); //Do tej pory szumi mi w g³owie, ale z chêci¹ skopiê czyjeœ dupsko.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_23"); //To mi siê podoba przyjacielu, jak zawsze mo¿na na Ciebie liczyæ.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_24"); //Wróæ do mnie, jak bêdziesz gotów, bo z czerwonym musimy za³atwiæ sprawê szybko i czysto.
	AI_Output (self, other,"DIA_PIR_2600_Angus_Hello_07_25"); //I pogadaj z Rodneyem, da Ci kilka leczniczych mikstur. Wymieszane z grogiem daj¹ niez³ego kopa...
	
   Log_CreateTopic(CH1_PIR_Colony,LOG_NOTE);
	B_LogEntry(CH1_PIR_Colony, "Na szczêœcie Angus te¿ prze¿y³. Musimy rozejrzeæ siê po okolicy, mo¿e uda siê znaleŸæ jakiœ sposób na wydostanie siê z tego miejsca.");
};

//////////////////////////////////////////////////////////
// RICK WEAPON GET BACK////////////////////////////////
//////////////////////////////////////////////////////////
INSTANCE DIA_PIR_2600_Angus_RickWeap (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 3;
	condition		= DIA_PIR_2600_Angus_RickWeap_Condition;
	information		= DIA_PIR_2600_Angus_RickWeap_Info;
	permanent		= 0;
	description		= "Potrzebujê dobrego orê¿a."; 
};

FUNC INT DIA_PIR_2600_Angus_RickWeap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_RickWeap_Info()
{
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_01"); //Potrzebujê jakiegoœ orê¿a. Masz dla mnie coœ co nie rozsypie siê przy pierwszym uderzeniu?
	AI_TurnToNpc 			(hero,self);
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_02"); //Mam coœ lepszego, zgadnij co fale wyrzuci³y na brzeg. By³ wbity w kawa³ek masztu.
	
   CreateInvItem(self, Rick_Axe_1);	
	B_GiveInvItems(self,other,Rick_Axe_1,1);
	AI_EquipBestMeleeWeapon(other);
	AI_ReadyMeleeWeapon(other);
	AI_PlayAni(other, "T_1HSINSPECT");
	AI_RemoveWeapon(other);
   
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_03"); //A niech to! Mój stary topór!
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_04"); //Wyszczerbiony i têpy jak pomyœlunek Hanka, ale nadal mo¿esz tym nieŸle kogoœ pochlastaæ.
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_05"); //Dziêki, Angus. Dotyk zimnej stali zawsze mnie uspokaja³.
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_06"); //Jak ju¿ trochê siê tutaj rozejrzymy to poszukaj kowala. Podostrzy Ci ostrze i wywa¿y trzonek.
	AI_Output (other, self,"DIA_PIR_2600_Angus_RickWeap_15_07"); //Ale najpierw muszê go na czymœ wypróbowaæ!
	AI_Output (self, other,"DIA_PIR_2600_Angus_RickWeap_07_08"); //Stary dobry Rick. Ju¿ nied³ugo bêdziesz mia³ niejedn¹ okazjê, ¿eby wypruæ komuœ flaki, przyjacielu.
};

//-----------------------------------------------------------------
// 
//-----------------------------------------------------------------

var int angus_go;

instance PIR_2600_Angus_READY (C_INFO)
{
	npc				= PIR_2600_Angus;
	condition		= PIR_2600_Angus_READY_Condition;
	information		= PIR_2600_Angus_READY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ju¿ gotów skopaæ czyjeœ dupsko!"; 
};

FUNC int  PIR_2600_Angus_READY_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_RickWeap))&&(angus_go == FALSE)
	{
		return 1;
	};
};
func void  PIR_2600_Angus_READY_Info()
{
	if (Wld_IsTime (20,00,04,00))
	{
		angus_go = TRUE;
		var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
		var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
		AI_Output (other, self,"PIR_2600_Angus_READY_Info_15_01"); //Jestem ju¿ gotów skopaæ czyjeœ dupsko!
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_02"); //Najwy¿sza pora.
		AI_TurnToNpc 			(self,hank);	
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_03"); //Hej, ch³opaki, ruszcie t³uste zadki. Idziemy na spacerek.
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_04"); //Na pocz¹tek 'porozmawiamy' z podgl¹daczem w czerwonej zbroi.
		AI_Output (self, NULL,"PIR_2600_Angus_READY_Info_07_05"); //Ostatni na górze stawia wszystkim rum!
		Ai_Wait (self,0.3);	
		AI_TurnToNpc 			(self,rodney);		
		Party_AddNpc(hank);
		Party_AddNpc(rodney);
		Party_AddNpc(self);
		
		Npc_ExchangeRoutine	(self,"check");
		B_ExchangeRoutine(hank,"check");
		B_ExchangeRoutine(rodney,"check");

		B_StandUp(self);		
		B_StandUp(hank);			
		B_StandUp(rodney);			

		// Add tony and guards here:
		Wld_InsertNpc			 	(RBL_2604_Tony,"OW_HUN_SMALLCAMP");
		Wld_InsertNpc			 	(GRD_2599_Guard,"OW_HUN_SMALLCAMP");
		Wld_InsertNpc			 	(GRD_4063_Guard,"OW_HUN_SMALLCAMP");
		
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_06"); //Wyruszymy o zmierzchu, lepiej nie rzucaæ siê w oczy miejscowych sukinsynów.
		AI_Output (self, other,"PIR_2600_Angus_READY_Info_07_07"); //Wróæ, jak zapadnie zmrok.
	};
};

//-----------------------------------------------------------------
// Dusty abfangen
//-----------------------------------------------------------------
instance PIR_2600_Angus_HUNTERS (C_INFO)
{
	npc				= PIR_2600_Angus;
	condition		= PIR_2600_Angus_HUNTERS_Condition;
	information		= PIR_2600_Angus_HUNTERS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PIR_2600_Angus_HUNTERS_Condition()
{	
	// Dialog disabled
	// 	if (Npc_GetDistToWP(self,"OW_PATH_167")<250)
	// 	{
	return false;
	// 	};
};
func void  PIR_2600_Angus_HUNTERS_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC tony; tony = Hlp_GetNpc(RBL_2604_Tony);
	//Ai_Wait (rodney,2);	
	//Ai_Wait (hero,9);	
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_01"); //Widzicie tych cwaniaków po drugiej stronie mostu przy ognisku?
	AI_GotoNpc		(rodney, other);
	//AI_TurnToNpc 			(rodney,self);	
	AI_Output			(other, self,"PIR_2600_Angus_HUNTERS_Info_15_02"); //Rzeczywiœcie, ktoœ tam jest...
	AI_Output			(other, other,"PIR_2600_Angus_HUNTERS_Info_09_03"); //Czerwone pancerze.
	//AI_TurnToNpc 			(hero,rodney);	
	//Ai_Wait (rodney,5);
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_04"); //I bardzo dobrze. Wyprujemy im flaki za Skipa i Dustiego.
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_07_05"); //Tym razem dam Ci siê wykazaæ.
	AI_Output			(self, other,"PIR_2600_Angus_HUNTERS_Info_09_06"); //IdŸ pierwszy Rick, tylko zostaw coœ dla nas!
	Npc_ExchangeRoutine	(self,"FOLPC2HUN");
	B_ExchangeRoutine(pir_2601_hank,"FOLPC2HUN");
	B_ExchangeRoutine(pir_2602_rodney,"FOLPC2HUN");
	//********************poprawki
	/************************************
//Ork niech nadal maj¹ party jednak.
//	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
//	Npc_SetAivar(hank,AIV_PARTYMEMBER,  FALSE);
//	Npc_SetAivar(rodney,AIV_PARTYMEMBER,  FALSE);	
****************************************/
	//************************
	B_StopProcessInfos(self);
};

/***************************
Dodatkowy dialog
***************************/

INSTANCE DIA_Angus_KillSlay (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 22;
	condition		= DIA_Angus_KillSlay_Condition;
	information		= DIA_Angus_KillSlay_Info;
	permanent		= 0;
	important		= 1;
	description		= "?"; 
};

FUNC INT DIA_Angus_KillSlay_Condition()
{
	if (abel_ok)//(Npc_KnowsInfo(hero,HUN_2615_Abel_Hello_Yes)) -pudlo shergar ;P nie tak to sie robi
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillSlay_Info()
{
	AI_TurnToNpc 			(hero,self);
	AI_Output (self, other, "DIA_Angus_KillSlay_11_02"); //Na co czekamy? ChodŸmy wypatroszyæ te œwinie!
	
   B_LogEntry		(CH1_Rbl_AbelHead, "Piraci pomog¹ mi za³atwiæ wejœciówkê do obozu.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_KillAligator (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 10;
	condition		= DIA_Angus_KillAligator_Condition;
	information		= DIA_Angus_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochotê na ma³y spacerek?"; 
};

FUNC INT DIA_Angus_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillAligator_Info()
{
	B_GiveXP(100);
   
	AI_Output (other, self, "DIA_Angus_KillAligator_15_01"); //Masz ochotê na ma³y spacerek?
	AI_Output (self, other, "DIA_Angus_KillAligator_11_02"); //Mo¿e i móg³bym trochê rozprostowaæ koœci. O co chodzi?
	AI_Output (other, self, "DIA_Angus_KillAligator_15_03"); //O przys³ugê.
	AI_Output (self, other, "DIA_Angus_KillAligator_11_04"); //Nie ma sprawy Rick. Jesteœ jednym z nas. ProwadŸ.
	
   B_LogEntry		(CH1_Rbl_Aligator, "Angus zgodzi³ siê pomóc, nawet nie pytaj¹c w czym problem.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_KillAligatorOut (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 11;
	condition		= DIA_Angus_KillAligatorOut_Condition;
	information		= DIA_Angus_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Angus_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
	AI_Output (self, other,"DIA_Angus_KillAligatorOut_11_02"); //Bestia ju¿ gryzie ziemiê. Dziêki za rozrywkê.
	AI_Output (other, self,"DIA_Angus_KillAligatorOut_15_01"); //Bywaj Angus.
	
   B_LogEntry		(CH1_Rbl_Aligator, "Angus pomóg³ mi zabiæ Aligatora.");
	B_StopProcessInfos	(self);
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"INHC");
};

/************************

Po ataku na orków przy queœcie z Carlsonem
************************/

INSTANCE DIA_Angus_KillOrc (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 12;
	condition		= DIA_Angus_KillOrc_Condition;
	information		= DIA_Angus_KillOrc_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillOrc_Condition()
{
	if (orc_appear == TRUE)&&(Npc_IsDead(MIS_CarlsonOrcElite))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillOrc_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(200);
	AI_Output (self, other,"DIA_Angus_KillOrc_11_01"); //Przybyliœmy w ostatniej chwili!
	AI_Output (other, self,"DIA_Angus_KillOrc_15_02"); //Jak tu trafiliœcie?
	AI_Output (self, other,"DIA_Angus_KillOrc_11_03"); //Kaza³em Hankowi mieæ na Ciebie oko i jak zwykle mia³em nosa, ¿e wpakujesz siê w jakieœ k³opoty.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_04"); //Kiedy wyruszy³eœ na tereny orków, stwierdziliœmy, ¿e by³oby szkoda, gdybyœ ju¿ stamt¹d nie wróci³.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_05"); //Gdzie ja bym znalaz³ sternika, który nie wbije mi no¿a w plecy, ¿eby zgarn¹æ ca³y ³up dla siebie?
	AI_Output (other, self,"DIA_Angus_KillOrc_15_06"); //Dziêki, przyjacielu.
	AI_Output (self, other,"DIA_Angus_KillOrc_11_07"); //Braæ zawsze trzyma siê razem, Rick. Nigdy o tym nie zapominaj!
	
   B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "INHC");
	B_ExchangeRoutine(hank, "INHC");
	B_ExchangeRoutine(rodney, "INHC");
};

INSTANCE DIA_Angus_RebelCamp (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 11;
	condition		= DIA_Angus_RebelCamp_Condition;
	information		= DIA_Angus_RebelCamp_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_RebelCamp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return true;
	};
};

FUNC VOID DIA_Angus_RebelCamp_Info()
{
	var c_npc hank; hank = Hlp_GetNpc(pir_2601_hank);
	var C_NPC rodney;  rodney = Hlp_GetNpc(pir_2602_rodney);  

	AI_Output (self, other,"DIA_Angus_RebelCamp_07_01"); //Dotarliœmy do Obozu Rebeliantów. 
	AI_Output (other, self,"DIA_Angus_RebelCamp_15_02"); //To dopiero pocz¹tek drogi.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_03"); //Mo¿e dla Ciebie. Czas zarzuciæ kotwicê i odsapn¹æ.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_04"); //Pokrêcimy siê po obozie, jakoœ siê tutaj urz¹dzimy.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_05"); //Jakbyœ chcia³ pogadaæ, wypiæ z braci¹, czy spuœciæ komuœ ³omot to tu nas znajdziesz.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_06"); //Poza tym zawsze by³eœ wilkiem samotnikiem. Nie bêdziemy wchodziæ Ci w paradê, przyjacielu.
	AI_Output (other, self,"DIA_Angus_RebelCamp_15_07"); //Bêdzie mi brakowaæ twojego glêdzenia.
	AI_Output (self, other,"DIA_Angus_RebelCamp_07_08"); //Bywaj Rick, powodzenia na szlaku.

	B_LogSetTopicStatus	(CH1_Pir_RebelCamp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RebelCamp, "Szczêœliwie dotarliœmy do Obozu Rebeliantów. Angus, Hank i Rodney zostan¹ w obozie i jakoœ siê tu urz¹dz¹. Ale dla mnie to dopiero pocz¹tek drogi...");
	Party_RemoveNpc(self);
	Party_RemoveNpc(hank);
	Party_RemoveNpc(rodney);
	Npc_ExchangeRoutine	(self,"INHC");
	B_ExchangeRoutine(hank,"INHC");
	B_ExchangeRoutine(rodney,"INHC");

	B_StopProcessInfos	(self);
};

INSTANCE DIA_Angus_Patrol (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 13;
	condition		= DIA_Angus_Patrol_Condition;
	information		= DIA_Angus_Patrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz jakbyœ siê nudzi³."; 
};

FUNC INT DIA_Angus_Patrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1) && (!B_guards_patrol_finished()))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_Patrol_Info()
{
	AI_Output (other, self,"DIA_Angus_Patrol_15_00"); //Wygl¹dasz jakbyœ siê nudzi³.
	AI_Output (self, other,"DIA_Angus_Patrol_11_01"); //A ty wygl¹dasz jakbyœ potrzebowa³ pomocy. Zgad³em?
	AI_Output (other, self,"DIA_Angus_Patrol_15_02"); //W pobli¿u obozu krêci siê patrol stra¿y. Muszê siê go pozbyæ.
	AI_Output (self, other,"DIA_Angus_Patrol_11_03"); //Na mnie i ch³opaków mo¿esz liczyæ. Powiedz tylko kiedy i gdzie.
	AI_Output (self, other,"DIA_Angus_Patrol_11_04"); //Daj znaæ jak bêdziesz gotów.
	B_LogEntry		(CH2_RBL_GuardCamp, "Angus i reszta piratów pomog¹ mi w pozbyciu siê stra¿ników - muszê tylko zdecydowaæ jak to zrobimy.");
};

INSTANCE DIA_Angus_Patrol1 (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 14;
	condition		= DIA_Angus_Patrol1_Condition;
	information		= DIA_Angus_Patrol1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ruszamy."; 
};

FUNC INT DIA_Angus_Patrol1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_Patrol1_Info()
{
	AI_Output (other, self,"DIA_Angus_Patrol1_15_01"); //Ruszamy.
	AI_Output (self, other,"DIA_Angus_Patrol1_11_02"); //Jak zamierzasz za³atwiæ te œwinie?

	Info_ClearChoices (DIA_Angus_Patrol1);
	Info_AddChoice (DIA_Angus_Patrol1, "Za³atwimy sukinsynów atakiem frontalnym!", DIA_Angus_Patrol1_Fight);
	Info_AddChoice (DIA_Angus_Patrol1, "Urz¹dzimy zasadzkê.", DIA_Angus_Patrol1_Trap);
	Info_AddChoice (DIA_Angus_Patrol1, "Pogadam z nimi, wy zaczekacie w odwodzie.", DIA_Angus_Patrol1_Negotiate);
};

// ---------------------------Strength----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Fight()
{
	dick_patrol_choice = 1;
	AI_Output (other, self, "DIA_Angus_Patrol1_Fight_15_03"); //Za³atwimy sukinsynów atakiem frontalnym!
	AI_Output (self, other, "DIA_Angus_Patrol1_Fight_11_04"); //Prosto i bezmyœlnie, ale w³aœnie tego mi brakowa³o - porz¹dnej rozróby.
	AI_Output (self, other, "DIA_Angus_Patrol1_Fight_11_05"); //ProwadŸ, przyjacielu, niech zatañczy stal!
	B_LogEntry(CH2_RBL_GuardCamp, "Wybra³em rozwi¹zanie si³owe - za³atwimy stra¿ników w bezpoœrednim starciu. Sprowokujê ich podczas rozmowy do walki, wtedy te¿ uderzy Angus z piratami.");

	B_StopProcessInfos(self); 
	//Use old Routine	
	Npc_ExchangeRoutine(self,"FOLLOWALLIGATOR");
	Npc_ExchangeRoutine(hank,"FOLLOWALLIGATOR");
	Npc_ExchangeRoutine(rodney,"FOLLOWALLIGATOR");
};

// ---------------------------Smart----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Trap()
{
	dick_patrol_choice = 2;
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_06"); //Urz¹dzimy zasadzkê.
	AI_Output (self, other, "DIA_Angus_Patrol1_Trap_11_07"); //Hmm, ciekawe. Wygl¹dasz jakbyœ mia³ jakiœ plan.
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_08"); //Zaczaicie siê niedaleko ich obozu, w jaskini. Ja z nimi pogadam i odwrócê ich uwagê.
	AI_Output (other, self, "DIA_Angus_Patrol1_Trap_15_09"); //Postaram siê przyprowadziæ barany prosto na rzeŸ.
	AI_Output (self, other, "DIA_Angus_Patrol1_Trap_11_10"); //Œwietny pomys³. Ju¿ nie mogê siê doczekaæ kiedy zobaczê ich zaskoczone mordy!
	B_LogEntry(CH2_RBL_GuardCamp, "Urz¹dzimy zasadzkê. Pogadam ze stra¿nikami, a ch³opaki zaczaj¹ siê i przygotuj¹ zasadzkê. Po rozmowie poprowadzê stra¿ników na rzeŸ.");

	B_StopProcessInfos(self); 
	NPC_ExchangeRoutine(self,"PatrolTrap");
	B_ExchangeRoutine(hank,"PatrolTrap");
	B_ExchangeRoutine(rodney,"PatrolTrap");
};


// ---------------------------Negotiate----------------------------------------

FUNC VOID DIA_Angus_Patrol1_Negotiate()
{
	dick_patrol_choice = 3;
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_11"); //Pogadam z nimi, wy zaczekacie w odwodzie.
	AI_Output (self, other, "DIA_Angus_Patrol1_Negotiate_11_12"); //Chcesz rozmawiaæ z tymi ³achudrami? Nie poznajê Ciê Rick, zmiêk³eœ!
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_13"); //Nie ma sensu niepotrzebnie nara¿aæ nikogo z Was. Mo¿e uda siê to za³atwiæ inaczej.
	AI_Output (other, self, "DIA_Angus_Patrol1_Negotiate_15_14"); //Zaczekacie w pobliskiej jaskini, gdyby coœ posz³o nie tak wiesz co robiæ.
	AI_Output (self, other, "DIA_Angus_Patrol1_Negotiate_11_15"); //Hmm, mo¿e to i nie g³upi pomys³. Dobra, jesteœmy z tob¹.
	B_LogEntry(CH2_RBL_GuardCamp, "Wybra³em drogê negocjacji - spróbujê jakoœ nak³oniæ stra¿ników do opuszczenia naszego s¹siedztwa. Angus i piraci bêd¹ czekaæ w jaskini gdyby coœ posz³o nie tak jak powinno.");

	B_StopProcessInfos(self); 
	Npc_ExchangeRoutine(self,"PatrolTrap");
	B_ExchangeRoutine(hank,"PatrolTrap");
	B_ExchangeRoutine(rodney,"PatrolTrap");
};

// **************************************************

INSTANCE DIA_PIR_2600_Angus_AfterPatrolKill (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 152;
	condition		= DIA_PIR_2600_Angus_AfterPatrolKill_Condition;
	information		= DIA_PIR_2600_Angus_AfterPatrolKill_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2600_Angus_AfterPatrolKill_Condition()
{
	var c_npc duke; duke = Hlp_GetNpc(GRD_4061_Guard);

	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol1))&&(NPC_IsDead(Duke))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_AfterPatrolKill_Info()
{
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_01"); //Ca³kiem mocne skurczybyki.
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_02"); //Mi³o by³o rozprostowaæ koœci, ale czas ju¿ wracaæ do obozu.
	AI_Output (self, other, "DIA_PIR_2600_Angus_AfterPatrolKill_11_03"); //Do zobaczenia, Rick.
	
   B_ExchangeRoutine(rodney,"INHC"); 
	Npc_ExchangeRoutine(self,"INHC"); 
	B_ExchangeRoutine(hank,"INHC"); 	
	
	Party_RemoveNpc(self);
	Party_RemoveNpc(hank);
	Party_RemoveNpc(rodney);
	
	B_LogEntry(CH2_Rbl_Food, "Patrol stra¿ników nie powinien ju¿ sprawiaæ problemów, muszê poinformowaæ o tym Ratforda."); 
};

INSTANCE DIA_PIR_2600_Angus_Stew (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 12;
	condition		= DIA_PIR_2600_Angus_Stew_Condition;
	information		= DIA_PIR_2600_Angus_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochotê na gulasz?"; 
};

FUNC INT DIA_PIR_2600_Angus_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2600_Angus_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_PIR_2600_Angus_Stew_15_01"); //Masz ochotê na gulasz?
	AI_Output (self, other, "DIA_PIR_2600_Angus_Stew_11_02"); //Pewnie, strasznie burczy mi w brzuchu.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Potrawka Snafa powinna zaspokoiæ g³ód Angusa."); 
};


INSTANCE DIA_Angus_KillGuards (C_INFO)
{
	npc				= PIR_2600_Angus;
	nr				= 20;
	condition		= DIA_Angus_KillGuards_Condition;
	information		= DIA_Angus_KillGuards_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Angus_KillGuards_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cavalorn_OCFinish))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Angus_KillGuards_Info()
{
	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
	var C_NPC rod; rod = Hlp_GetNpc(PIR_2602_Rodney);
	var C_NPC jack; jack = Hlp_GetNpc(PIR_2612_JACKALLIGATOR);

	B_FullStop (hero);
	AI_GotoNpc(self,other);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_01"); //Pêdzisz jakby Ciê lewiatan gryz³ po zadzie.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_02"); //Zaczê³o siê! W koñcu dobierzemy siê do magnatów!
	AI_Output (self, other,"DIA_Angus_KillGuards_11_03"); //I do skarbca Gomeza! Chyba nie chcia³eœ pójœæ bez nas, hê?
	AI_Output (other, self,"DIA_Angus_KillGuards_15_04"); //Ekhm, nawet mi to przez myœl nie przesz³o.
	AI_Output (self, other,"DIA_Angus_KillGuards_11_05"); //Stary dobry Rick, jakby móg³, sprzeda³by w³asn¹ matkê.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_06"); //Có¿, wszystko ma swoj¹ cenê.
	AI_Output (self, other,"DIA_Angus_KillGuards_11_07"); //Ju¿ czujê zapach z³ota...
	AI_Output (self, other,"DIA_Angus_KillGuards_11_08"); //Zrobimy to jak za starych dobrych czasów, krwawo i bez pardonu.
	AI_TurnToNpc(self, hank);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_09"); //Co wy na to ch³opaki?
	AI_TurnToNpc(self, other);

	if (!Npc_IsDead(jack))
	{
		AI_Output (self, other,"DIA_Angus_KillGuards_11_10"); //Nawet Stary Jack chce rozprostowaæ koœci, nie odbierajmy mu tej przyjemnoœci!
		Party_AddNpc(jack);
		B_ExchangeRoutine	(jack,"FOLLOW2");
	};
   
	AI_Output (self, other,"DIA_Angus_KillGuards_11_11"); //Poza tym ktoœ musi pilnowaæ, ¿ebyœ nie da³ nogi objuczony skarbami.
	AI_Output (other, self,"DIA_Angus_KillGuards_15_12"); //Sk¹d ten brak zaufania?
	AI_Output (self, other,"DIA_Angus_KillGuards_11_13"); //Zbyt dobrze Ciê znam.
	AI_TurnToNpc(self, angus);
	AI_Output (self, other,"DIA_Angus_KillGuards_11_14"); //Idziemy z Rickiem i nie bierzemy jeñców!

	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");

	Party_AddNpc(hank);
	B_ExchangeRoutine	(hank,"FOLLOW");

	Party_AddNpc(rod);
	B_ExchangeRoutine	(rod,"FOLLOW");

	B_StopProcessInfos	(self);
};

