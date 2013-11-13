// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Carlos_Exit (C_INFO)
{
	npc			= Grd_4087_Carlos;
	nr			= 999;
	condition	= DIA_Carlos_Exit_Condition;
	information	= DIA_Carlos_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Carlos_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Carlos_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Carlos_First (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 1;
	condition		= DIA_Carlos_First_Condition;
	information		= DIA_Carlos_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_First_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Carlos_First_11_01"); //Czego tu szukasz?
	AI_Output (other, self, "DIA_Carlos_First_15_02"); //Chcia³em siê rozejrzeæ. Ta okolica to...
	AI_Output (self, other, "DIA_Carlos_First_11_03"); //Na twoim miejscu poszuka³bym sobie innych zainteresowañ, ni¿ szwendanie siê tam, gdzie ktoœ mo¿e skróciæ Ciê o g³owê.
	AI_Output (self, other, "DIA_Carlos_First_11_04"); //Zmiataj st¹d.

	/*************************
Ork Carlos stoi przed bram¹ na pola ry¿owe, daj wiêæ wp gdzie dick bêdzie wraca³.

*************************/

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");
};

INSTANCE DIA_Carlos_First1 (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 1;
	condition		= DIA_Carlos_First1_Condition;
	information		= DIA_Carlos_First1_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_First1_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(hero,DIA_Carlos_First))&&(!Npc_KnowsInfo(hero,DIA_RATFORD_Raport))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_First1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_First1_11_04"); //Wynocha!

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");
};

// **************************************************

INSTANCE DIA_Carlos_Again (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 2;
	condition		= DIA_Carlos_Again_Condition;
	information		= DIA_Carlos_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Again_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_First))&&(Npc_GetDistToNpc(self,hero) < 400)&&(Npc_KnowsInfo(hero,DIA_RATFORD_Raport))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Again_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other, "DIA_Carlos_Again_11_01"); //Widzê, ¿e muszê Ci rêcznie wyt³umaczyæ, ¿e to nie miejsca dla takich jak Ty.
	AI_Output (other, self, "DIA_Carlos_Again_15_02"); //Zaczekaj! Chcê tylko wejœæ do obozu i trochê siê rozejrzeæ - nic wiêcej.
	AI_Output (self, other, "DIA_Carlos_Again_11_03"); //A co ja z tego bêdê mia³?
	AI_Output (other, self, "DIA_Carlos_Again_15_04"); //Mam trochê rudy...
	AI_Output (self, other, "DIA_Carlos_Again_11_05"); //500 bry³ek - nie mniej, choæ mo¿e byæ wiêcej. Wróæ, jak bêdziesz gotów je wydaæ.

	B_StopProcessInfos(self);
	AI_GotoWP(hero, "H_GOOUT");

	Log_CreateTopic(CH3_Grd_Bribe, LOG_MISSION);
	Log_SetTopicStatus(CH3_Grd_Bribe, LOG_RUNNING);
	B_LogEntry(CH3_Grd_Bribe, "Carlos, stra¿nik przy bramie na Pola Ry¿owe, z których dostanê siê do Nowego Obozu, wpuœci mnie pod jednym warunkiem - muszê zasiliæ jego fundusz emerytalny. Chce 500 bry³ek rudy.");
};

// **************************************************

var int carlos_bribe;

INSTANCE DIA_Carlos_Bribe (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 3;
	condition		= DIA_Carlos_Bribe_Condition;
	information		= DIA_Carlos_Bribe_Info;
	permanent		= 1;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Bribe_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Again))&&(Npc_GetDistToNpc(self,hero) < 1000)&&(carlos_bribe == 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Bribe_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_Bribe_11_01"); //Masz rudê?
	
   if (NPC_HasItems(other,ItMiNugget)>=500)
	{
		carlos_bribe = 1;
		B_GiveInvItems (other, self, ItMiNugget, 500);
      
		AI_Output (other, self, "DIA_Carlos_Bribe_15_02"); //Mam. To twoje 500 bry³ek.
		
      AI_PlayAni ( self, "T_SEARCH");
		AI_TurnToNpc (self, other);
		
      AI_Output (self, other, "DIA_Carlos_Bribe_11_03"); //Dobra, w³aŸ. Ale jakby co to siê nie znamy.
		
      Log_SetTopicStatus(CH3_Grd_Bribe, LOG_SUCCESS);
		B_LogEntry(CH3_Grd_Bribe, "Przekupi³em Carlosa, stra¿nika przy bramie na Pola Ry¿owe. W koñcu bêdê móg³ siê rozejrzeæ w sytuacji w Nowym Obozie.");
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (other, self, "DIA_Carlos_Bribe_15_04"); //Mo¿e...
		AI_Output (self, other, "DIA_Carlos_Bribe_11_05"); //Spadaj! Wróæ z rud¹.
		
      B_StopProcessInfos(self);
		AI_GotoWP(hero, "H_GOOUT");
	};
};

// **************************************************

INSTANCE DIA_Carlos_Surprise (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 4;
	condition		= DIA_Carlos_Surprise_Condition;
	information		= DIA_Carlos_Surprise_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Surprise_Condition()
{
	if (grd_NC_pass)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Surprise_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Carlos_Surprise_11_01"); //No proszê. Kogo to ja widzê?
	AI_Output (other, self, "DIA_Carlos_Surprise_15_02"); //Tylko nie mów, ¿e znowu muszê zap³aciæ!
	AI_Output (self, other, "DIA_Carlos_Surprise_11_03"); //Tym razem niech bêdzie na mój koszt, przyjacielu.
	AI_Output (self, other, "DIA_Carlos_Surprise_11_04"); //Mo¿e oprowadziæ Ciê po obozie?
	AI_Output (other, self, "DIA_Carlos_Surprise_15_05"); //Czemu nie. Jestem tu pierwszy raz.
	AI_Output (self, other, "DIA_Carlos_Surprise_11_06"); //Œwietnie. ChodŸ za mn¹.

	/*********************
Dick razem z Carlosem wchodz¹ na tamê
**********************/
   
   AI_SetWalkmode (self,NPC_RUN); 
	AI_GotoWP(self, "NC_DAM");
	AI_GotoWP(other, "NC_DAM2");
   
   B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Carlos_Dam (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 5;
	condition		= DIA_Carlos_Dam_Condition;
	information		= DIA_Carlos_Dam_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Dam_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Surprise))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Dam_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Carlos_Dam_11_01"); //To nasza cholerna tama. Homer zbudowa³ to ustrojstwo jakiœ czas temu.
	AI_Output (other, self, "DIA_Carlos_Dam_15_02"); //I co siê z nim sta³o?
	AI_Output (self, other, "DIA_Carlos_Dam_11_03"); //Za zas³ugi wyl¹dowa³ w kopalni, he, he.
	AI_Output (self, other, "DIA_Carlos_Dam_11_04"); //ChodŸmy dalej.

	/****************************
Ork przyda³oby siê albo wsadziæ ze 2-3 stra¿ników tam gdzie Cord uczy³ walki mieczem i tam nas zaprowadzi Carlos.
Oni tam mog¹ staæ ca³y czas, czyli mo¿e byæ to w startupie

****************************/

	// 	Wld_InsertNpc				(grd1,"CAR_TRAP1");
	// 	Wld_InsertNpc				(grd2,"CAR_TRAP2");
	// 	Wld_InsertNpc				(grd3,"CAR_TRAP3");

	/******************
Id¹ przed Kocio³
******************/
   
   AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "NC_PATH75");
	AI_GotoWP(hero, "NC_PATH70");
   
   B_StopProcessInfos(self);
   Npc_ExchangeRoutine(self, "Kociol");
};

// **************************************************

INSTANCE DIA_Carlos_Caul (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 6;
	condition		= DIA_Carlos_Caul_Condition;
	information		= DIA_Carlos_Caul_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Caul_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Dam))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Caul_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
   
	AI_Output (self, other, "DIA_Carlos_Caul_11_01"); //To Kocio³. S³odki dom... Chyba siê wzruszy³em.
	AI_Output (other, self, "DIA_Carlos_Caul_15_02"); //Co to za dziura?
	AI_Output (self, other, "DIA_Carlos_Caul_11_03"); //Tam sk³adujemy urobek rudy. Kiedyœ magowie trzymali na tym ³apê.
	AI_Output (self, other, "DIA_Carlos_Caul_11_04"); //Poka¿ê Ci coœ, co na pewno Ciê zainteresuje...

	/************************
Teraz id¹ do miejsca gdzie czekaj¹ tamci 3 stra¿nicy, tam gdzie Cord uczy³ walki
************************/

   AI_SetWalkmode (self,NPC_RUN);
	AI_GotoWP(self, "FMC_FM_ENTRANCE");
	AI_GotoWP(hero, "FMC_PATH18");
   
   B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Carlos_Trap (C_INFO)
{
	npc				= Grd_4087_Carlos;
	nr				= 7;
	condition		= DIA_Carlos_Trap_Condition;
	information		= DIA_Carlos_Trap_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlos_Trap_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Carlos_Caul))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlos_Trap_Info()
{
   var c_npc carlos;
   carlos = hlp_getNpc(Grd_4087_Carlos);
   B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
   
	AI_Output (self, other, "DIA_Carlos_Trap_11_01"); //A to... A to s¹ ch³opaki.
	/*************
Niech rzuci okiem na jednego z grd
	AI_TurnToNpc(other, grd1);
-e po kiego ;P
*************/
	AI_Output (other, self, "DIA_Carlos_Trap_15_02"); //Co to ma znaczyæ?
	AI_Output (self, other, "DIA_Carlos_Trap_11_03"); //Ano to brachu, ¿e w³aœnie wpad³eœ w spore gówno.
	AI_Output (self, other, "DIA_Carlos_Trap_11_04"); //Skoro tak bardzo interesuje Ciê nasz obóz, to mo¿e chcia³byœ te¿ zwiedziæ kopalniê. Co Ty na to?
	AI_Output (other, self, "DIA_Carlos_Trap_15_05"); //Znajdê Ciê Carlos, mo¿esz byæ tego pewien.
	AI_Output (self, other, "DIA_Carlos_Trap_11_06"); //Zobaczymy. Mi³ego pobytu w kopalni.
	AI_Output (self, other, "DIA_Carlos_Trap_11_07"); //Ch³opcy, odprowadŸcie 'pana'.

	Log_CreateTopic(CH4_GRD_NewMine, LOG_MISSION);
	Log_SetTopicStatus(CH4_GRD_NewMine, LOG_RUNNING);
	B_LogEntry(CH4_GRD_NewMine, "Stra¿nik Carlos za³atwi³ mi darmowy pobyt w kopalni. Jeszcze siê policzê z tym sukinsynem.");
   
   freemine_ready_to_opened = true;
   
   Wld_SendTrigger("FREEMINEGATE");
   
   var c_item my_meleeweapon;
   my_meleeweapon = Npc_GetEquippedMeleeWeapon(hero);
   
	if (NPC_HasItems(other,ItMw_1H_RuneSWD_01)>=1)||(NPC_HasItems(other,ItMw_2H_RuneSWD_01)>=1)
	{
		sword_stolen = TRUE;
      
		AI_Output (self, other, "DIA_Carlos_Trap_11_08"); //Jeszcze chwila. Co to za ¿elastwo?
		AI_Output (other, self, "DIA_Carlos_Trap_15_09"); //Nic Ci do tego!
		AI_Output (self, other, "DIA_Carlos_Trap_11_10"); //Chyba w³aœnie o czymœ takim marzy³em. Dawaj miecz!
		
		if (NPC_HasItems(other,ItMw_1H_RuneSWD_01)>=1)
		{
         if (Hlp_IsItem(my_meleeweapon, ItMw_1H_RuneSWD_01))
         {
            AI_UnequipWeapons(hero);
         };
         
			B_GiveInvItems (other, self, ItMw_1H_RuneSWD_01, 1);
		}
		else
		{
         if (Hlp_IsItem(my_meleeweapon, ItMw_2H_RuneSWD_01))
         {
            AI_UnequipWeapons(hero);
         };
         
			B_GiveInvItems (other, self, ItMw_2H_RuneSWD_01, 1);
		};
      
      AI_EquipBestMeleeWeapon(hero);
		AI_EquipBestMeleeWeapon(carlos);
		AI_ReadyMeleeWeapon(carlos);
		AI_PlayAni(carlos, "T_1HSINSPECT");
		AI_RemoveWeapon(carlos);
      
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_11"); //Co za robota! Prawdziwe cudo. Stal pakietowa, b³êkitne szlify - teraz ju¿ siê takich nie robi.
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_12"); //Ten miecz musi pamiêtaæ du¿o lepsze czasy. Ale jakby go trochê...
		AI_Output (other, carlos, "DIA_Carlos_Trap_15_13"); //Chyba siê zapêdzi³eœ. Oddaj miecz!
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_14"); //Daæ taki miecz nieznajomemu... Albo jesteœ g³upi, albo naiwny. Móg³bym daæ siê zer¿n¹æ orkowi dla takiego cuda.
		AI_Output (other, carlos, "DIA_Carlos_Trap_15_15"); //Ty skurw...
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_16"); //Jakbyœ zapomnia³ jesteœmy w Koloni Karnej. Ciesz siê, ¿e jestem w dobrym nastroju.
		AI_Output (carlos, other, "DIA_Carlos_Trap_11_17"); //Zamiast Ciê zabiæ, spe³niê obietnicê - witamy w kopalni, he, he...

		B_LogEntry(CH4_GRD_NewMine, "Ten sukinsyn Carlos zabra³ mój miecz i wtr¹ci³ mnie do kopalni! Jeszcze policzê siê z tym 'mi³oœnikiem' orê¿a.");
	};

	/*************************
Ork teraz twoja dzia³a. Ci 3 stra¿nicy powinni Dicka zaprowadziæ do Kolalni i go do niej wykopaæ. Albo po prostu zrób to jakoœ inaczej - w sumie wystarczy sam ekran ³adowania do kopalni.

************************/

	Npc_ExchangeRoutine(carlos,"DEAD");

	/*************
	Nowy stra¿nik na miejsce Carlosa przed kopalni¹
	**************/
	Wld_InsertNpc(Grd_4089_Bern,"FMC_PATH18");
   
   B_StopProcessInfos(self);
};
