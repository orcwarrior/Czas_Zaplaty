// **************************************************
// 						 EXIT 
// **************************************************
var int RodneyHelp;
var int weapon_package;

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_PIR_2602_Rodney_Hello (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_Hello_Condition;
	information		= DIA_PIR_2602_Rodney_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_PIR_2602_Rodney_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2601_Hank_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Hello_Info()
{
	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);

	AI_GotoNpc(self, hero);
	AI_TurnToNpc (self,hero);
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Hello_15_01"); //Co siê sta³o? £eb mi pêka i nic nie pamiêtam...
	//AI_GotoNpc(hero, self);
	AI_TurnToNpc (hero,self);
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_02"); //Widzia³em jak uderzy³eœ g³ow¹ o pok³ad, kiedy fale rzuci³y nas na ska³y.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_03"); //Ale i tak mia³eœ wiêcej szczêœcia ni¿ pozostali.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_04"); //Burza pojawi³a siê znik¹d. Jakby na nas czeka³a...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_05"); //Do tego ska³y i ta przeklêta bariera.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_06"); //ZnaleŸliœmy niedaleko kilka cia³. Dwa z nich to chyba Dustin i Skip.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Hello_15_07"); //Chyba?
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_08"); //Byli tak zmasakrowani, ¿e nie mia³em pewnoœci. Skipa pozna³em po chuœcie na g³owie.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_09"); //Drugi mia³ na ramieniu tatua¿ z syren¹. Pamiêtam, jak Dustin po pijaku kaza³ to sobie wydziargaæ, mia³a mu przynieœæ szczêœcie...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_10"); //Cholerny sztorm... Do tego ca³y ³adunek szlag trafi³.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_11"); //Uda³o mi siê na szczêœcie odzyskaæ kilka pak i skrzyñ.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_12"); //Niektóre rzeczy mogê Ci tanio odsprzedaæ.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_13"); //Aha. PrzyjdŸ do mnie, jak bêdziesz mia³ chwilkê.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Hello_08_14"); //Bêdê mia³ ma³¹ proœbê. Nie po¿a³ujesz.	
};

var int last_armor;

//-----------------------------------------------------------------
// Dusty abfangen
//-----------------------------------------------------------------
instance PIR_2602_Rodney_PIRARMOR_M (C_INFO)
{
	npc				= PIR_2602_Rodney;
   nr				   = 900;
	condition		= PIR_2602_Rodney_PIRARMOR_M_Condition;
	information		= PIR_2602_Rodney_PIRARMOR_M_Info;
	important		= 0;
	permanent		= 1;
   description = B_BuildBuyArmorString(NAME_PiratesArmor, value_pir_armor_m);
	//description		= "Kup zbrojê pirata (Obr. przed broni¹ 54, strza³ami 48, ogniem 22, koszt: 1800)";
};

FUNC int  PIR_2602_Rodney_PIRARMOR_M_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))&&(last_armor == FALSE)
	{
      return 1;
	};
};

func void  PIR_2602_Rodney_PIRARMOR_M_Info()
{
	AI_Output(other, self,"PIR_2602_Rodney_PIRARMOR_M_Info_15_01"); //Chcia³bym kupiæ zbrojê pirata.
   
	if (Npc_HasItems(hero, itminugget)>=value_pir_armor_m)
	{
		last_armor = TRUE;
		AI_Output(self, other,"PIR_2602_Rodney_PIRARMOR_M_Info_08_02"); //Proszê, lepszej zbroi tutaj nie znajdziesz!		
		CreateInvItem (hero,PIR_ARMOR_M);	
		Npc_RemoveInvItems (hero, ItMiNugget, value_pir_armor_m); 
		AI_EquipArmor(hero, PIR_ARMOR_M);
	}
	else
	{
		AI_Output(self, other,"PIR_2602_Rodney_PIRARMOR_M_Info_07_03"); //Nie masz wystarczaj¹cej iloœci rudy, a ja nie mogê robiæ tak hojnych prezentów!
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2602_Rodney_Junk (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_Junk_Condition;
	information		= DIA_PIR_2602_Rodney_Junk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Angus powiedzia³, ¿e dasz mi kilka mikstur."; 
};

FUNC INT DIA_PIR_2602_Rodney_Junk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2600_Angus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Junk_Info()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Junk_15_01"); //Angus powiedzia³, ¿e dasz mi kilka mikstur.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Junk_08_02"); //Pewnie. Tylko nie wypij wszystkiego na raz, to drogi towar.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Junk_08_03"); //A tak w ogóle... Dobrze widzieæ Ciê wœród ¿ywych, Rick.
	
   CreateInvItems (self,ItFo_Potion_Health_01,2);
	B_GiveInvItems (self, other, ItFo_Potion_Health_01, 2);
	B_GiveXP(50);
	B_StopProcessInfos(self);
};

INSTANCE DIA_PIR_2602_Rodney_What (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 2;
	condition		= DIA_PIR_2602_Rodney_What_Condition;
	information		= DIA_PIR_2602_Rodney_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mówi³eœ coœ o przys³udze..."; 
};

FUNC INT DIA_PIR_2602_Rodney_What_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_What_Info()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_01"); //Mówi³eœ coœ o przys³udze...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_02"); //Tak, mam ma³¹ proœbê.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_03"); //Widzisz, wiêkszoœæ ³adunku posz³a na dno. Ale trochê wala siê jeszcze tu i ówdzie na brzegu. 
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_04"); //Nie mam teraz czasu, ¿eby samemu pozbieraæ to co ocala³o.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_05"); //Przynieœ mi tyle paczek, ile zdo³asz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_06"); //Szczególnie interesuj¹ mnie paczki z ekwipunkiem, jak miecze, kusze czy ³uki.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_07"); //A co ja bêdê z tego mia³?
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_08"); //Moj¹ wdziêcznoœæ oczywiœcie!
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_09"); //Tym siê nie najem, ani nie obroniê.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_10"); //Bez obaw, nie po¿a³ujesz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_11"); //Im wiêcej paczek przyniesiesz, tym wiêkszy dam Ci upust.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_12"); //A je¿eli znajdziesz paczki z broni¹, to bêdziesz móg³ sobie wybraæ receptê na jakiœ egzemplarz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_13"); //Ale musisz przynieœæ przynajmniej trzy paczki z orê¿em.
	AI_Output (other, self,"DIA_PIR_2602_Rodney_What_15_04"); //Zobaczê, co da siê zrobiæ.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_What_08_15"); //Jakby co, wiesz gdzie mnie szukaæ.
	
   Log_CreateTopic	(CH1_Pir_RodneyHelp, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_RUNNING);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Obieca³em pomóc Rodneyowi. Mam rozejrzeæ siê po okolicy za paczkami z ³adunkiem. Do tego jak znajdê trzy paczki z orê¿em to Rodney pozwoli mi wybraæ dla siebie receptê na jeden egzemplarz.");
	RodneyHelp=0;
	B_StopProcessInfos	(self);
};

INSTANCE DIA_PIR_2602_Rodney_Packages(C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 4;
	condition		= DIA_PIR_2602_Rodney_Packages_Condition;
	information		= DIA_PIR_2602_Rodney_Packages_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam paczki..."; 
};

FUNC INT DIA_PIR_2602_Rodney_Packages_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_PIR_2602_Rodney_What))&&((NPC_HasItems(other,package1)>0)||(NPC_HasItems(other,package2)>0))
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Packages_Info()
{
	var int expsum;//dont show multiple GiveXP notifications -orc
	expsum = 0;
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_15_00"); //Mam paczki...
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_01"); //To œwietnie. Zobaczmy co tam masz...
   
	if (NPC_HasItems(other,package1)>0)
	{
		expsum += 10*Npc_HasItems(other,package1);
		
		PutMsg(ConcatStrings("Odda³eœ ",ConcatStrings(IntToString(Npc_HasItems(other,package1))," paczki.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		
		//CreateInvItems		(self,	package1,	Npc_HasItems(other,package1));
		Npc_RemoveInvItems	(other,	package1,	Npc_HasItems(other,package1));
	};
   
	if (NPC_HasItems(other,package2)>0)
	{
		expsum += 25*Npc_HasItems(other,package2);
		weapon_package=weapon_package+NPC_HasItems(other,package2);
		PutMsg(ConcatStrings("Odda³eœ ",ConcatStrings(IntToString(Npc_HasItems(other,package2))," paczki z broni¹.")),"font_default.tga",RGBAToZColor(255,255,255,255),8,"");
		//CreateInvItems		(self,	package2,	Npc_HasItems(other,package2));
		Npc_RemoveInvItems	(other,	package2,	Npc_HasItems(other,package2));

	};
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_02"); //Œwietna robota.
	
	//Merged second dialog:
	if (weapon_package>=3)
	{
		expsum += 100;
		AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_03"); //Znalaz³eœ sporo paczek z broni¹, przydadz¹ siê na czarn¹ godzinê.
		AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_08_04"); //Jak powiedzia³em, w nagrodê mo¿esz wybraæ receptê na orê¿. Co potrzebujesz?
		Info_ClearChoices (DIA_PIR_2602_Rodney_Packages);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Wybieram receptê na miecz.", DIA_PIR_2602_Rodney_Packages_sword);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Przyda³aby mi siê recepta na ³uk.", DIA_PIR_2602_Rodney_Packages_bow);
		Info_AddChoice (DIA_PIR_2602_Rodney_Packages, "Recepta na kuszê to najlepszy wybór.", DIA_PIR_2602_Rodney_Packages_crossbow);		
	};
   
	if(expsum)
	{
		B_GiveXP(expsum);
	};
	//B_StopProcessInfos	(self);
};
// ---------------------------sword----------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_sword()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_sword_15_01"); //Wybieram receptê na miecz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_sword_08_02"); //Dziêki tej recepcie wykujesz niez³e ostrze.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_sword_08_03"); //Niech Ci dobrze s³u¿y.
	CreateInvItems (self,Recept_ItMw_1H_Sword_04,1);
	B_GiveInvItems (self, other, Recept_ItMw_1H_Sword_04, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios³em Rodneyowi wszystkie paczki z broni¹ jakie znalaz³em na pla¿y. W zamian kwatermistrz da³ mi receptê na niezgorszy miecz.");
	B_StopProcessInfos	(self);
};

// ------------------------------bow-------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_bow()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_bow_15_01"); //Przyda³aby mi siê recepta na ³uk.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_bow_08_02"); //Proszê bardzo. Dziêki tej recepcie stworzysz ³uk, który przebije niejeden pancerz.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_bow_08_03"); //Niech ci dobrze s³u¿y.
	CreateInvItems (self,Recept_ItRw_Bow_Long_02,1);
	B_GiveInvItems (self, other, Recept_ItRw_Bow_Long_02, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios³em Rodneyowi wszystkie paczki z broni¹ jakie znalaz³em na pla¿y. W zamian kwatermistrz da³ mi receptê na porz¹dny ³uk.");
	B_StopProcessInfos	(self);
};

// ------------------------------crossbow-------------------------------------

FUNC VOID DIA_PIR_2602_Rodney_Packages_crossbow()
{
	AI_Output (other, self,"DIA_PIR_2602_Rodney_Packages_crossbow_15_01"); //Recepta na kuszê to najlepszy wybór.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_crossbow_08_02"); //W rzeczy samej. Kusza, któr¹ mo¿esz stworzyæ przebija ciê¿k¹ zbrojê ze stu kroków.
	AI_Output (self, other,"DIA_PIR_2602_Rodney_Packages_crossbow_08_03"); //Niech ci dobrze s³u¿y.
	CreateInvItems (self,Recept_ItRw_Crossbow_01,1);
	B_GiveInvItems (self, other, Recept_ItRw_Crossbow_01, 1);
	Log_SetTopicStatus	(CH1_Pir_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH1_Pir_RodneyHelp, "Przynios³em Rodneyowi wszystkie paczki z broni¹ jakie znalaz³em na pla¿y. W zamian kwatermistrz da³ mi receptê na porz¹dn¹ kuszê.");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_KillAligator (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 10;
	condition		= DIA_Rodney_KillAligator_Condition;
	information		= DIA_Rodney_KillAligator_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak ci siê podoba obóz?"; 
};

FUNC INT DIA_Rodney_KillAligator_Condition()
{
	if (jack_yes==TRUE)&&(!Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillAligator_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Rodney_KillAligator_15_01"); //Jak ci siê podoba obóz?
	AI_Output (self, other, "DIA_Rodney_KillAligator_11_02"); //Ujdzie. Zawsze to lepszy port ni¿ ¿aden.
	AI_Output (other, self, "DIA_Rodney_KillAligator_15_03"); //Mam problem z pewnym aligatorem...
	AI_Output (self, other, "DIA_Rodney_KillAligator_11_04"); //ProwadŸ, rozwi¹zywanie problemów to moja specjalnoœæ!
	
   B_LogEntry		(CH1_Rbl_Aligator, "Rodney pomo¿e mi rozwi¹zaæ problem z aligatorem.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(PIR_2602_Rodney,"FOLLOWALLIGATOR");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_KillAligatorOut (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 11;
	condition		= DIA_Rodney_KillAligatorOut_Condition;
	information		= DIA_Rodney_KillAligatorOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Rodney_KillAligatorOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_KillAligator))&&(Npc_IsDead(Aligator_Boss))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillAligatorOut_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(100);
	AI_Output (self, other,"DIA_Rodney_KillAligatorOut_11_01"); //Dobry aligator, to martwy aligator. Czas wracaæ ogrzaæ dupsko przy ognisku.
	AI_Output (other, self,"DIA_Rodney_KillAligatorOut_15_02"); //Uwa¿aj na siebie.
   
	B_LogEntry		(CH1_Rbl_Aligator, "Rodney pomóg³ mi przy zabiciu aligatora.");
   B_StopProcessInfos	(self);
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(PIR_2602_Rodney,"INHC");
};

// /************************

// Po ataku na orków przy queœcie z Carlsonem
// ************************/

// INSTANCE DIA_Rodney_KillOrc (C_INFO)
// {
// 	npc				= PIR_2602_Rodney;
// 	nr				= 12;
// 	condition		= DIA_Rodney_KillOrc_Condition;
// 	information		= DIA_Rodney_KillOrc_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "..."; 
// };

// FUNC INT DIA_Rodney_KillOrc_Condition()
// {

// 	if (orc_appear == TRUE)&&(Npc_IsDead(Orc1))&&(Npc_IsDead(Orc2))&&(Npc_IsDead(Orc3))&&(Npc_IsDead(Orc4))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Rodney_KillOrc_Info()
// {
// 	B_FullStop (hero);
// 	AI_GotoNpc(self,other);
// 	B_GiveXP(100);
// 	AI_Output (self, other,"DIA_Rodney_KillOrc_11_01"); //Dobry ork, to martwy ork.
// 	AI_Output (other, self,"DIA_Rodney_KillOrc_15_02"); //Dziêki za pomoc przyjacielu.
// 	Npc_SetAivar(self,AIV_PARTYMEMBER,  FALSE);
// 	Npc_ExchangeRoutine	(self,"RBL_CAMP");
// 	B_StopProcessInfos	(self);
// };

INSTANCE DIA_Rodney_KillPatrol (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 13;
	condition		= DIA_Rodney_KillPatrol_Condition;
	information		= DIA_Rodney_KillPatrol_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebujê pomocy."; 
};

FUNC INT DIA_Rodney_KillPatrol_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_Quest1))&&(!Npc_KnowsInfo (hero, DIA_Duke_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_KillPatrol_Info()
{
	AI_Output (other, self,"DIA_Rodney_KillPatrol_15_01"); //Potrzebujê pomocy.
	
   if (!Npc_KnowsInfo (hero, DIA_Angus_Patrol))
	{
		AI_Output (self, other,"DIA_Rodney_KillPatrol_11_02"); //Mo¿esz na mnie liczyæ. Tylko powiedz Angusowi o co chodzi.
		AI_Output (other, self,"DIA_Rodney_KillPatrol_15_03"); //Dobrze.
		B_LogEntry		(CH2_RBL_GuardCamp, "Rodney pomo¿e mi - powinienem te¿ porozmawiaæ z Angusem.");
	}
	else
	{
		AI_Output (self, other,"DIA_Hank_KillPatrol_11_04"); //Nie ma sprawy.
	};
   
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_PIR_2602_Rodney_Stew (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 12;
	condition		= DIA_PIR_2602_Rodney_Stew_Condition;
	information		= DIA_PIR_2602_Rodney_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gulasz z pozdrowieniami od Snafa."; 
};

FUNC INT DIA_PIR_2602_Rodney_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_PIR_2602_Rodney_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_PIR_2602_Rodney_Stew_15_01"); //Gulasz z pozdrowieniami od Snafa.
	AI_Output (self, other, "DIA_PIR_2602_Rodney_Stew_11_02"); //Pachnie dziwnie, ale nie bêdê wybrzydza³.
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Rodney przyj¹³ gulasz Snafa."); 
};

/************************
Chapter 3
************************/
var int rodn_mag_frst;

INSTANCE DIA_Rodney_Help (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 14;
	condition		= DIA_Rodney_Help_Condition;
	information		= DIA_Rodney_Help_Info;
	permanent		= 1;
	important		= 0;
	description		= "Podobno masz jakiœ problem."; 
};

FUNC INT DIA_Rodney_Help_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_MEETING1))&&(!Hero_GotoGYD)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Help_Info()
{
	//Przed ork. cmentarzyskiem wieza mgie³
	AI_Output (other, self,"DIA_Rodney_Help_15_01"); //Podobno masz jakiœ problem.
	AI_Output (self, other,"DIA_Rodney_Help_11_02"); //I to spory.
	AI_Output (other, self,"DIA_Rodney_Help_15_03"); //Mów co siê sta³o, mo¿e bêdê móg³ pomóc.
	AI_Output (self, other,"DIA_Rodney_Help_11_04"); //To trochê... krêpuj¹ca sytuacja, ale Tobie powiem. W koñcu znamy siê tyle lat.
	AI_Output (self, other,"DIA_Rodney_Help_11_05"); //Chcê zostaæ magiem!
	AI_Output (other, self,"DIA_Rodney_Help_15_06"); //Ty?!
	AI_Output (self, other,"DIA_Rodney_Help_11_07"); //Nie patrz tak na mnie. Zawsze o tym marzy³em... Nie zosta³em piratem z wyboru.
	AI_Output (self, other,"DIA_Rodney_Help_11_08"); //Zreszt¹ niewa¿ne...
	AI_Output (other, self,"DIA_Rodney_Help_15_09"); //Nie, nie! Mów dalej. Ka¿dy ma prawo by marzyæ, przyjacielu.
	AI_Output (self, other,"DIA_Rodney_Help_11_10"); //Cieszê siê, ¿e tak uwa¿asz. Tylko na razie... Nie mów o tym ch³opakom. Hank nie da³by mi ¿yæ.
	AI_Output (other, self,"DIA_Rodney_Help_15_11"); //W porz¹dku.
	AI_Output (self, other,"DIA_Rodney_Help_11_12"); //Rozmawia³em ju¿ z Miltenem i Lerenem. Zrobi³em kilka prostych zadañ i dosta³em powa¿niejsze zlecenie.
	AI_Output (self, other,"DIA_Rodney_Help_11_13"); //Leren odkry³, ¿e w podziemiach Klasztoru Zmiennokszta³tnych pogrzebano jakiœ potê¿ny artefakt.
	AI_Output (self, other,"DIA_Rodney_Help_11_14"); //Jednak klucz do podziemi znajduje siê w jakiejœ orkowej cytadeli.
	AI_Output (self, other,"DIA_Rodney_Help_11_15"); //Pomijaj¹c to, ¿e nie mam pojêcia, gdzie mo¿na znaleŸæ te ruiny to wiesz, ¿e ja nigdy nie nale¿a³em do najodwa¿niejszych.
	AI_Output (self, other,"DIA_Rodney_Help_11_16"); //Nie mam zamiaru ryzykowaæ ¿ycia nawet za cenê spe³nienia marzeñ.
	AI_Output (other, self,"DIA_Rodney_Help_15_17"); //Rozumiem. Czyli szukasz idioty, który znajdzie Cytadelê, nie da siê zabiæ orkom i odnajdzie klucz?
	AI_Output (self, other,"DIA_Rodney_Help_11_18"); //Gdybym szuka³ idioty, to nie rozmawia³bym z Tob¹. Masz wyj¹tkowe zdolnoœci, zawsze spadasz na cztery ³apy i wychodzisz ca³o z najgorszych opresji. To rzadka przywara...
	AI_Output (self, other,"DIA_Rodney_Help_11_19"); //To jak, pomo¿esz mi?

	Info_ClearChoices (DIA_Rodney_Help);
	Info_AddChoice (DIA_Rodney_Help, "Nigdy nie opuszczam przyjació³ w biedzie.", DIA_Rodney_Help_Yes);
	Info_AddChoice (DIA_Rodney_Help, "Muszê siê zastanowiæ.", DIA_Rodney_Help_No);
};
// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Rodney_Help_Yes()
{
	DIA_Rodney_Help.permanent = 0;
	Hero_GotoGYD = TRUE;
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_01"); //Nigdy nie opuszczam przyjació³ w biedzie.
	AI_Output (self, other,"DIA_Rodney_Help_Yes_11_02"); //Wiedzia³em, ¿e jednak siê skusisz. To dla mnie wiele znaczy, Rick.
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_03"); //Od czego mam zacz¹æ?
	AI_Output (self, other,"DIA_Rodney_Help_Yes_11_04"); //Wiem tylko to co Ci powiedzia³em. OdpowiedŸ znajdziesz w Orkowej Cytadeli.
	AI_Output (other, self,"DIA_Rodney_Help_Yes_15_05"); //Pewnie nied³ugo tego po¿a³ujê... 
	Log_CreateTopic	(CH3_RBL_RodneyHelp, LOG_MISSION);
	Log_SetTopicStatus	(CH3_RBL_RodneyHelp, LOG_RUNNING);
	B_LogEntry		(CH3_RBL_RodneyHelp, "Obieca³em pomóc Rodneyowi. Stary pirat od zawsze chcia³ zostaæ magiem, a teraz pojawi³a siê taka mo¿liwoœæ. Jednak zadanie inicjuj¹ce go przerasta i poprosi³ mnie o pomoc. Muszê odnaleŸæ sposób na to, aby dostaæ siê do podziemi Klasztoru Zmiennokszta³tnych. Niestety poszukiwania muszê rozpocz¹æ od odnalezienie Orkowej Cytadeli.");
	B_StopProcessInfos	(self);
	
	/***************
		Ork o wp pamiêtaj dla tego orka
		***************/
	//Wld_InsertNpc	(Roderic,"OW_FOGTOWER_TOP");
	Wld_InsertNpc	(Nameless_ThirdMeet,"OR1");
};

// ---------------------------No----------------------------------------

FUNC VOID DIA_Rodney_Help_No()
{
	AI_Output (other, self,"DIA_Rodney_Help_No_15_01"); //Muszê siê zastanowiæ.
	AI_Output (self, other,"DIA_Rodney_Help_No_11_02"); //Rozumiem, wiem, ¿e o wiele proszê. Daj znaæ gdybyœ zmieni³ zdanie.
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Rodney_Help2 (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 14;
	condition		= DIA_Rodney_Help2_Condition;
	information		= DIA_Rodney_Help2_Info;
	permanent		= 1;
	important		= 0;
	description		= "To trudna decyzja."; 
};

FUNC INT DIA_Rodney_Help2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_Help))&&(!Hero_GotoGYD)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Help2_Info()
{
	AI_Output (other, self,"DIA_Rodney_Help_15_19"); //To trudna decyzja.
	AI_Output (self, other,"DIA_Rodney_Help_11_20"); //Wiêc?
	Info_ClearChoices (DIA_Rodney_Help2);
	Info_AddChoice (DIA_Rodney_Help2, "Nigdy nie opuszczam przyjació³ w biedzie.", DIA_Rodney_Help_Yes);
	Info_AddChoice (DIA_Rodney_Help2, "Muszê siê zastanowiæ.", DIA_Rodney_Help_No);
};

INSTANCE DIA_Rodney_OldNote (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 314;
	condition		= DIA_Rodney_OldNote_Condition;
	information		= DIA_Rodney_OldNote_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em Orkow¹ Cytadelê."; 
};

FUNC INT DIA_Rodney_OldNote_Condition()
{
	if (Hero_GotoGYD)&&(NPC_HasItems(other,ork_oldnote)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_OldNote_Info()
{
	AI_Output (other, self,"DIA_Rodney_OldNote_15_01"); //Znalaz³em Orkow¹ Cytadelê.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_02"); //Wiedzia³em, ¿e dasz sobie radê. Wpad³o Ci w rêce coœ ciekawego?
	AI_Output (other, self,"DIA_Rodney_OldNote_15_03"); //Trochê ¿elastwa i rozsypuj¹cy siê pergamin, napisany w dziwnym jêzyku.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_04"); //Ja Ci z tym nie pomogê, poka¿ papier Lerenowi, mam nadziejê, ¿e to mnie zbli¿y do wst¹pienia w szeregi magów.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_05"); //Dziêki, ¿e zapyta³eœ czy nie rzuci³a siê na mnie horda krwio¿erczych orków.
	AI_Output (self, other,"DIA_Rodney_OldNote_11_06"); //Wybacz. Czujê, ¿e dziêki Tobie to bêdzie tylko formalnoœæ.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_07"); //Masz szczêœcie Rodney, ¿e ciê lubiê. Inaczej sam byœ bawi³ siê w kotka i myszkê z orkami.
	AI_Output (other, self,"DIA_Rodney_OldNote_15_08"); //Idê pogadaæ z Lerenem. Mam nadziejê, ¿e ten pergamin jest coœ wart.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Muszê zanieœæ pergamin Lerenowi, mam nadziejê, ¿e mag potrafi go odczytaæ.");
};

//****************************

var int rod_wait;

INSTANCE DIA_Rodney_Ghost (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 15;
	condition		= DIA_Rodney_Ghost_Condition;
	information		= DIA_Rodney_Ghost_Info;
	permanent		= 0;
	important		= 0;
	description		= "By³em na cmentarzu orków."; 
};

FUNC INT DIA_Rodney_Ghost_Condition()
{
	if (Npc_KnowsInfo (hero, Info_OrcGhost_Kill))&&(!Npc_KnowsInfo (hero, DIA_RodericMD_Thx))
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Ghost_Info()
{
	B_GiveXP(500);
	AI_Output (other, self,"DIA_Rodney_Ghost_15_01"); //By³em na cmentarzu orków.
	AI_Output (self, other,"DIA_Rodney_Ghost_11_02"); //I co tam znalaz³eœ?
	AI_Output (other, self,"DIA_Rodney_Ghost_15_03"); //Martwego orka, który sporo gada³.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_04"); //Dowiedzia³em siê tylko tego, ¿e kiedyœ jakiœ cz³owiek zdoby³ zaufanie orków, a potem ich zdradzi³.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_05"); //Zdaje siê, ¿e jego jedynym celem by³o posi¹œæ tajemnice, jakie skrywaj¹ podziemia klasztoru.
	AI_Output (other, self,"DIA_Rodney_Ghost_15_06"); //Niestety dopi¹³ swego. Wiêcej siê nie dowiedzia³em.
	AI_Output (self, other,"DIA_Rodney_Ghost_11_07"); //Hmm, zagmatwane to wszystko. To na co czekasz? Szukaj dalej!
	AI_Output (other, self,"DIA_Rodney_Ghost_15_08"); //Chyba trochê Ciê ponios³o!
	AI_Output (self, other,"DIA_Rodney_Ghost_11_09"); //Wybacz. Proszê, dowiedz siê czegoœ wiêcej.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Powiedzia³em o wszystkim Rodneyowi. Teraz muszê czekaæ na to co powiedz¹ magowie. Mam siê spotkaæ z Rodneyem jutro.");
	Hero_GotoGYD = 3;//end of mission
};

// INSTANCE DIA_Rodney_GhostAfter (C_INFO)
// {
// 	npc				= PIR_2602_Rodney;
// 	nr				= 16;
// 	condition		= DIA_Rodney_GhostAfter_Condition;
// 	information		= DIA_Rodney_GhostAfter_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= "."; 
// };

// FUNC INT DIA_Rodney_GhostAfter_Condition()
// {

// 	if (Npc_KnowsInfo (hero, DIA_Rodney_Ghost))&&(rod_wait <= (Wld_GetDay()))
// 	{
// 		return 1;
// 	};
// 		
// };

// FUNC VOID DIA_Rodney_GhostAfter_Info()
// {
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_01"); //Dobrze, ¿e jesteœ.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_02"); //Powiedzia³em Lerenowi, co niby znalaz³em na cmentarzysku. 
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_03"); //Ten gnojek pokiwa³ g³ow¹ i mrukn¹³, ¿e tego siê spodziewa³.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_04"); //Powiedzia³, ¿e muszê szukaæ odpowiedzi wœród umar³ych.
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_05"); //To œwietnie, ¿yczê powodzenia.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_06"); //Nie rób mi tego, bez Ciebie nigdy nie zostanê magiem!
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_07"); //Dobra, ju¿ dobra, ¿artowa³em. Mów czego siê jeszcze dowiedzia³eœ.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_08"); //Milten twierdzi, ¿e widzia³ kiedyœ po zmierzchu zjawê w okolicach klasztoru.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_09"); //Leren uzna³, ¿e to mo¿e byæ kolejna wskazówka.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_10"); //Mam ruszyæ noc¹ do twierdzy i... porozmawiaæ z tym duchem.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_11"); //Ale znasz mnie...
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_12"); //W porz¹dku. Duchów bojê siê mniej ni¿ œmiertelników. A jak trzeba to umarlaki te¿ da siê zabiæ.
// 	AI_Output (other, self,"DIA_Rodney_GhostAfter_15_13"); //Pójdê do klasztoru i poszukam tej zjawy.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_14"); //Odwdziêczê Ci siê, mo¿esz byæ tego pewien.
// 	AI_Output (self, other,"DIA_Rodney_GhostAfter_11_15"); //Aha i pamiêtaj, ¿eby szukaæ tego ducha po zmroku.
// 	B_LogEntry		(CH3_RBL_RodneyHelp, "Kolejna wskazówka ma na mnie czekaæ noc¹ w okolicach klasztoru. Czeka mnie kolejna rozmowa z duchem.");
//
// };

INSTANCE DIA_Rodney_Sword (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 17;
	condition		= DIA_Rodney_Sword_Condition;
	information		= DIA_Rodney_Sword_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ostatni raz coœ dla Ciebie zrobi³em!"; 
};

FUNC INT DIA_Rodney_Sword_Condition()
{
	var C_NPC urk; urk = Hlp_GetNpc(NON_4072_Urksh);

	/**************************
	Ork sprawdŸ czy dobra instancja miecza
	****************************/

	if (NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_Sword_Info()
{
	var int xp;
	xp = 0;
   
	if (!Npc_KnowsInfo (hero, DIA_RodericMD_Thx))
	{
		xp = 1000;
	};
   
	xp += 500;
	B_GiveXP(xp);
	
	AI_Output (other, self,"DIA_Rodney_Sword_15_01"); //Ostatni raz coœ dla Ciebie zrobi³em!
	AI_Output (self, other,"DIA_Rodney_Sword_11_02"); //Najwa¿niejsze, ¿e ¿yjesz przyjacielu.
	AI_Output (other, self,"DIA_Rodney_Sword_15_03"); //Tak, pewnie. Widzê, ¿e a¿ siê trzêsiesz, ¿eby zapytaæ jak mi posz³o.
	AI_Output (self, other,"DIA_Rodney_Sword_11_04"); //Niech mnie szlag! Pewnie, ¿e chcê wiedzieæ. By³eœ w tych podziemiach?
	AI_Output (other, self,"DIA_Rodney_Sword_15_05"); //By³em.
	AI_Output (self, other,"DIA_Rodney_Sword_11_06"); //Znalaz³eœ artefakt?!
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"DIA_Rodney_Sword_11_07"); //Daj mi go!
	AI_Output (other, self,"DIA_Rodney_Sword_15_08"); //Raczej... Nie. Zbyt wiele wysi³ku kosztowa³o mnie zdobycie tego ¿elastwa.
	AI_Output (other, self,"DIA_Rodney_Sword_15_09"); //Dla Ciebie to tylko artefakt, dziêki któremu przypodobasz siê facetom w kieckach i z wybuja³ym ego.
 	AI_Output (other, self,"DIA_Rodney_Sword_15_10"); //Dla mnie to nagroda, dziêki której zachowam pamiêæ o... mêstwie i poœwiêceniu godnym lepszych czasów.
	AI_Output (other, self,"DIA_Rodney_Sword_15_11"); //Niewa¿ne. Miecza nie oddam nikomu, przynajmniej nie po dobroci.
	AI_Output (self, other,"DIA_Rodney_Sword_11_12"); //Wybacz mi. Ponios³o mnie... Tak bardzo chcê zostaæ magiem... Zaœlepi³ mnie egoizm.
	AI_Output (other, self,"DIA_Rodney_Sword_15_13"); //W porz¹dku Rodney. Pogadam z Lerenem, powiem, ¿e tylko pomog³em Ci zdobyæ artefakt.
	AI_Output (other, self,"DIA_Rodney_Sword_15_14"); //Przekonam magów, ¿eby uznali Twoj¹ inicjacjê za dope³nion¹.
	AI_Output (self, other,"DIA_Rodney_Sword_11_15"); //Bêdê Ci wdziêczny, Rick!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Muszê pokazaæ miecz Lerenowi i przekonaæ magów, ¿e Rodney zas³u¿y³ na to, aby wst¹piæ w ich szeregi.");
};

INSTANCE DIA_Rodney_BeginMag (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 18;
	condition		= DIA_Rodney_BeginMag_Condition;
	information		= DIA_Rodney_BeginMag_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dobre wieœci!"; 
};

FUNC INT DIA_Rodney_BeginMag_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leren_Rodney))&&(rodney_mag == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_BeginMag_Info()
{
	B_GiveXP(1500);

	AI_Output (other, self,"DIA_Rodney_BeginMag_15_01"); //Mam dobre wieœci!
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_02"); //Mów!
	AI_Output (other, self,"DIA_Rodney_BeginMag_15_03"); //Leren zaakceptowa³ Twoj¹ inicjacjê...
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_04"); //Na Adanosa, to najwspanialszy dzieñ w moim ¿yciu! Lepiej czu³em siê tylko wtedy, kiedy przeci¹gnêliœmy pod kilem gubernatora Verony.
	AI_Output (other, self,"DIA_Rodney_BeginMag_15_05"); //IdŸ do Lerena po kieckê i runê.
	AI_Output (self, other,"DIA_Rodney_BeginMag_11_06"); //Nie dam mu czekaæ! A to siê Hank zdziwi...

	Log_SetTopicStatus	(CH3_RBL_RodneyHelp, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_RodneyHelp, "Rodney w koñcu zosta³ magiem! To mnie nauczy³o, ¿e bezinteresowna pomoc jednak czasami pop³aca.");

	/*******************
	Ork chodzi o to, ¿eby rodney polaz³ do Lerena, przebra³ siê w szatê, dosta³ runê, zmieni³ fai, etc. Zrób to inaczej jak chcesz jak to moje nie jest za dobre
	*******************/

	RodneyMage_Day = B_SetDayTolerance();
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"BeingMage");
	B_ExchangeRoutine(leren,"RodneyMage");

	//TODO IN RODNEY SCRIPT
	// 	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,2);			
	// 	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  2);
	// 	fight_tactic = FAI_HUMAN_MAGE;
};


INSTANCE DIA_Rodney_BecomeMagEnd (C_INFO)
{
	npc				= PIR_2602_Rodney;
	nr				= 19;
	condition		= DIA_Rodney_BecomeMagEnd_Condition;
	information		= DIA_Rodney_BecomeMagEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Rodney_BecomeMagEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Rodney_BeginMag))&&(Npc_GetDistToNpc(self,hero) < 600)&&(RodneyMage_Day==1024)
	{
		return 1;
	};
};

FUNC VOID DIA_Rodney_BecomeMagEnd_Info()
{
	others_help = others_help + 1;
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_01"); //Wybacz Rick. Zapomnia³em Ci podziêkowaæ... 
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_02"); //Nie szkodzi przyjacielu. Mnie ta przygoda te¿ wiele nauczy³a. To mi wystarczy za podziêkowania.
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_03"); //No i miecz, he, he.
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_04"); //Masz racjê. Uwa¿aj na siebie... magu.
	AI_Output (self, other,"DIA_Rodney_BecomeMagEnd_11_05"); //Zawsze uwa¿a³em, ¿e by³byœ najlepszym kandydatem na nowego kapitana, gdyby Ramos wykorkowa³.
	AI_Output (other, self,"DIA_Rodney_BecomeMagEnd_15_06"); //Hmm, dziêki Rodney. Bywaj.
};
