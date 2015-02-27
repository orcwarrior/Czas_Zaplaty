
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Carlson_Exit (C_INFO)
{
	npc			= RBL_2617_Carlson;
	nr			= 999;
	condition	= DIA_Carlson_Exit_Condition;
	information	= DIA_Carlson_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Carlson_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Carlson_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int carlson_y;

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Carlson_Hello (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 1;
	condition		= DIA_Carlson_Hello_Condition;
	information		= DIA_Carlson_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Carlson_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 450)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_Hello_Info()
{
	AI_Output (self, other, "DIA_Carlson_Hello_11_01"); //Cholera, nie wygl¹dasz jak ork, chocia¿ mordê te¿ masz zakazan¹.
	AI_Output (other, self, "DIA_Carlson_Hello_15_02"); //Ty za to cuchniesz jak ork.
	AI_Output (self, other, "DIA_Carlson_Hello_11_03"); //Gdybyœ spêdzi³ tyle czasu co ja w tych ostêpach, to nawet byœ siê nie obejrza³, a mia³byœ orkow¹ ¿onê!
	AI_Output (self, other, "DIA_Carlson_Hello_11_04"); //Czego tu szukasz?!
	AI_Output (other, self, "DIA_Carlson_Hello_15_05"); //Ekhm... Zbieram grzyby.
	AI_Output (self, other, "DIA_Carlson_Hello_11_06"); //Dobra wystarczy ju¿ tych grzecznoœci. Do którego obozu nale¿ysz?

	Info_ClearChoices (DIA_Carlson_Hello);
	Info_AddChoice (DIA_Carlson_Hello, "Do Starego Obozu.", DIA_Carlson_Hello_Old);
	Info_AddChoice (DIA_Carlson_Hello, "Do Nowego Obozu.", DIA_Carlson_Hello_New);
	Info_AddChoice (DIA_Carlson_Hello, "Do Obozu Bractwa.", DIA_Carlson_Hello_Sekt);
	Info_AddChoice (DIA_Carlson_Hello, "Do Obozu Rebeliantów.", DIA_Carlson_Hello_Rbl);
};

// ---------------------------rbl----------------------------------------

FUNC VOID DIA_Carlson_Hello_Rbl()
{
	carlson_y = TRUE;
   
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_01"); //Do Obozu Rebeliantów.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_02"); //A co to za obóz?
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_03"); //Chyba d³ugo tu siedzisz.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_04"); //No, jakiœ czas. 
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_05"); //Rebelianci to zbieranina tych, którzy maj¹ doœæ pozosta³ych obozów.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_06"); //Brzmi ciekawie. Mo¿e powinienem siê tam wybraæ...
	AI_Output (other, self, "DIA_Carlson_Hello_Rbl_15_07"); //Mogê Ciê tam zaprowadziæ.
	AI_Output (self, other, "DIA_Carlson_Hello_Rbl_11_08"); //Zastanowiê siê nad tym.
   
	Info_ClearChoices (DIA_Carlson_Hello);
};

// ------------------so----------------

FUNC VOID DIA_Carlson_Hello_Old()
{
	AI_Output (other, self, "DIA_Carlson_Hello_Old_15_01"); //Do Starego Obozu.
	AI_Output (self, other, "DIA_Carlson_Hello_Old_11_02"); //Przydupas Gomeza! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_Old_11_03"); //Dla takich jak Ty mam tylko jedno powitanie! ¯ryj stal!
	
   Info_ClearChoices (DIA_Carlson_Hello);
   
   Npc_ExchangeRoutine(self,"FIGHT");//ta_hostileguard ¿eby zawsze t³uk³ dicka
	B_StartAfterDialogFight(self,other,true);
};

// ------------------no----------------

FUNC VOID DIA_Carlson_Hello_New()
{
	AI_Output (other, self, "DIA_Carlson_Hello_New_15_01"); //Do Nowego Obozu.
	AI_Output (self, other, "DIA_Carlson_Hello_New_11_02"); //Dupow³az magów wody! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_New_11_03"); //Nie przepadam za sprzedajnymi najmitami. Jesteœcie gorsi ni¿ dziwki!
   
   Info_ClearChoices (DIA_Carlson_Hello);
   
	Npc_ExchangeRoutine	(self,"FIGHT");//ta_hostileguard ¿eby zawsze t³uk³ dicka
	B_StartAfterDialogFight(self,other,true);
};

// ------------------sekt----------------

FUNC VOID DIA_Carlson_Hello_Sekt()
{
	AI_Output (other, self, "DIA_Carlson_Hello_Sekt_15_01"); //Do Obozu Bractwa.
	AI_Output (self, other, "DIA_Carlson_Hello_Sekt_11_02"); //Kolejny œwir z Obozu Sekty! 
   
	AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Carlson_Hello_Sekt_11_03"); //Z przyjemnoœci¹ pomogê Ci spotkaæ siê ze Œni¹cym!
   
   Info_ClearChoices (DIA_Carlson_Hello);
   
	Npc_ExchangeRoutine	(self,"FIGHT");//ta_hostileguard ¿eby zawsze t³uk³ dicka
	B_StartAfterDialogFight(self,other,true);
};

// **************************************************

INSTANCE DIA_Carlson_CanYouTeachMe (C_INFO)
{
	npc				=  RBL_2617_Carlson;
	nr				= 4;
	condition		= DIA_Carlson_CanYouTeachMe_Condition;
	information		= DIA_Carlson_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Carlson_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Carlson_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Carlson_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Carlson_CanYouTeachMe_15_02"); //Tak, mogê ciê nauczyæ wykuwaæ miecze. Pewnie ci siê to przyda w ¿yciu...
      
   Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
   B_LogEntry(GE_TeacherOW, "Carlson mo¿e mnie nauczyæ kowalstwa.");
};

INSTANCE DIA_Carlson_Go (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 2;
	condition		= DIA_Carlson_Go_Condition;
	information		= DIA_Carlson_Go_Info;
	permanent		= 0;
	important		= 0;
	description		= "Idziesz ze mn¹?"; 
};

FUNC INT DIA_Carlson_Go_Condition()
{
	if (carlson_y == TRUE)&&(q_y==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_Go_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_Carlson_Go_15_01"); //Idziesz ze mn¹?
	AI_Output (self, other, "DIA_Carlson_Go_11_02"); //Czemu nie. Nic mnie tu nie trzyma prócz tych cholernych orków.
	AI_Output (other, self, "DIA_Carlson_Go_15_03"); //Orkami siê nie przejmuj. Damy sobie z nimi radê.
	AI_Output (self, other, "DIA_Carlson_Go_11_04"); //Dobra, niech bêdzie. Rozwalmy kilka orkowych ³bów po drodze.
   
	B_LogEntry		(CH1_Rbl_NewMembers, "Pomogê Carlsonowi dojœæ do Obozu Rebeliantów. Czeka nas przeprawa przez orkowe ziemie.");
	Party_AddNpc(self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	B_StopProcessInfos	(self);
	//*****
	Wld_InsertNpc		(MIS_CarlsonOrcElite, "OW_PATH_012");
	Wld_InsertNpc		(OrcScoutGYD, "OW_PATH_012");
	Wld_InsertNpc		(OrcScoutGYD, "OW_PATH_012");
	orc_appear=true;
	B_ExchangeRoutine	(PIR_2600_Angus,"RICKHELP");		
	B_ExchangeRoutine	(PIR_2601_Hank,"RICKHELP");	
	B_ExchangeRoutine	(PIR_2602_rodney,"RICKHELP");	
	//On a way to Rebel Camp:
	self.flags=self.flags|NPC_FLAG_FRIEND;
};

/*****************

dodaæ aligatora i piratów.

******************/

INSTANCE DIA_Carlson_GoOut (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 3;
	condition		= DIA_Carlson_GoOut_Condition;
	information		= DIA_Carlson_GoOut_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Carlson_GoOut_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Carlson_Go))&&((Npc_GetDistToWP (self,"MOVEMENT_TALL_PATH_BANDITOS2") < 550 )||(Npc_GetDistToWP (self,"PATH_OC_NC_11") < 550 )||(Npc_GetDistToWP (self,"HC_WARRIOR16") < 550 ))
	{
		return 1;
	};
};

FUNC VOID DIA_Carlson_GoOut_Info()
{
	carlson_trust = TRUE;
	B_FullStop (hero);
	AI_GotoNpc(self,other);
	B_GiveXP(250);
   
	AI_Output (other, self,"DIA_Carlson_GoOut_15_01"); //Jesteœmy na miejscu. Witaj w Obozie Rebeliantów.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_02"); //Dziêki przyjacielu. Mam u Ciebie d³ug.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_03"); //Rozejrzê siê po tym oboziku... Wygl¹da ca³kiem przyjemnie.
	AI_Output (self, other,"DIA_Carlson_GoOut_11_04"); //Aha. WeŸ tê receptê, mi siê ju¿ na nic nie przyda.
   
	CreateInvItems (self, Recept_ItMw_2H_Sword_01,1); //recepta na lekki miecz 2h
	B_GiveInvItems (self, other, Recept_ItMw_2H_Sword_01, 1);//jw
	B_LogEntry		(CH1_Rbl_NewMembers, "Doprowadzi³em Carlsona do obozu. Nie by³o ³atwo, ale jakoœ poradziliœmy sobie z orkami.");
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine	(self,"OR");
	B_ExchangeRoutine	(HUN_859_Aidan,"CarlsonArrived");	
	B_StopProcessInfos	(self);
	Know_Carlson=TRUE;
	
	self.flags=self.flags&~NPC_FLAG_FRIEND;
};

// **************************************************

INSTANCE DIA_RBL_2617_Carlson_Stew (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_Stew_Condition;
	information		= DIA_RBL_2617_Carlson_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zjesz gulasz?"; 
};

FUNC INT DIA_RBL_2617_Carlson_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Stew_15_01"); //Zjesz gulasz?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Stew_11_02"); //Jeszcze siê pytasz? Ja ca³y czas jestem g³odny!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Carlson zjad³ gulasz bez wiêkszych jêków."); 
}; 

INSTANCE DIA_RBL_2617_Carlson_armor (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_armor_Condition;
	information		= DIA_RBL_2617_Carlson_armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mi zrobiæ jakiœ pancerz z tej skóry?"; 
};

FUNC INT DIA_RBL_2617_Carlson_armor_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_HuntFinalEnd))&&(NPC_HasItems(other,ItAt_BlackTroSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_armor_Info()
{
	AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_01"); //Mo¿esz mi zrobiæ jakiœ pancerz z tej skóry?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_02"); //Poka¿ mi j¹.
   
   Give_and_remove(ItAt_BlackTroSkin, 1);
   
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_03"); //Ja pierdole, przecie¿ to skóra czarnego trolla! Nie s¹dzi³em, ¿e mo¿esz zabiæ takiego skurczybyka.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_04"); //Mo¿emy przejœæ do sedna sprawy?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_05"); //Ach tak mogê ci wykuæ pancerz, ale przys³uga za przys³ugê.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_06"); //¯e co!? Znowu mam robiæ za jakiegoœ ch³opca na posy³ki?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_07"); //Mam ci zrobiæ ten pancerz czy nie?
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_08"); //Ech... no dobra, mów, czego chcesz.
   
   AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
   
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_09"); //To dosyæ dziwna historia, a nie chcê, ¿eby ktoœ siê o tym dowiedzia³.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_10"); //Dobra, dobra, mów o co chodzi.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_11"); //Ostatnio podpad³em Cavalornowi i do bia³ego rana kaza³ mi wykuwaæ bronie dla tych obiboków.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_12"); //Po jakimœ czasie chcia³em zrobiæ sobie krótk¹ przerwê, wiêc poszed³em siê och³odziæ w rzece.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_13"); //Nagle, z lasu wybieg³ jakiœ szaleniec, zdj¹³ ubranie, wskoczy³ do wody i pop³yn¹³ w moim kierunku.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_14"); //Szczegó³ów nie chcê znaæ.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_15"); //Tak wiêc, od razu zabi³em tego peda³a, ale niestety mia³em pecha.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_16"); //Ten pijak Leaf wszystko widzia³, wykorzysta³ to i mnie teraz przeœladuje.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_17"); //¯¹da co 5 dni ode mnie 800 bry³ek rudy, ¿eby nie powiedzia³ wszystkim, ¿e siê rucha³em... z mê¿czyzn¹.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_18"); //¯e co do cholery?! Dlaczego nie wsadzisz mu topór prosto w dupê?
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_19"); //Bardzo tego chcê, ale jak ju¿ mówi³em podpad³em Cavalornowi i jak jeszcze raz nabrojê...
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_20"); //...to bêdê musia³ masowaæ Aidanowi œmierdz¹ce stopy przez ca³y miesi¹c.
   AI_Output (other, self, "DIA_RBL_2617_Carlson_armor_15_21"); //He, he, a to ci Cavalorn. Byæ mo¿e bêdziesz niez³ym masa¿yst¹.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_armor_11_22"); //Przestañ ¿artowaæ i za³atw to jak najszybciej, tym lepiej bêdzie dla mnie, a teraz zostaw mnie samego.
        
   Log_CreateTopic	(CH2_RBL_armor, LOG_MISSION);
	Log_SetTopicStatus	(CH2_RBL_armor, LOG_RUNNING);
	B_LogEntry		(CH2_RBL_armor, "Tego siê nie spodziewa³em, Carlsona dopad³ w nocy jakiœ peda³, a ten pijak Leaf wszystko widzia³ i zacz¹³ go szanta¿owaæ. Powiedzia³ równie¿ jaka kara spotka Carlsona, jeœli jeszcze raz nabroi. Im d³u¿ej znam Koloniê Karn¹, tym bardziej chcê siê znaleŸæ od niej jak najdalej st¹d. Lecz teraz muszê porozmawiaæ z Leafem w cztery oczy.");
}; 

// **************************************************
var int Carlson_armor;

INSTANCE DIA_RBL_2617_Carlson_Leaf_agree (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 12;
	condition		= DIA_RBL_2617_Carlson_Leaf_agree_Condition;
	information		= DIA_RBL_2617_Carlson_Leaf_agree_Info;
	permanent		= 0;
	important		= 0;
	description		= "I po sprawie."; 
};

FUNC INT DIA_RBL_2617_Carlson_Leaf_agree_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_armor2))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Leaf_agree_Info()
{
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Leaf_agree_15_01"); //I po sprawie, co z tym pancerzem?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Leaf_agree_11_02"); //Wielkie dziêki, naprawdê nie wiesz, jak bardzo jestem ci wdziêczny. A co do pancerza przyjdŸ za kilka dni, wtedy bêdzie gotowy.
   
   Carlson_armor = B_SetDayTolerance()+3;
	
	B_LogEntry(CH2_RBL_armor, "Powinienem przyjœæ za kilka dni po pancerz.");
};

//***********************************************
INSTANCE DIA_RBL_2617_Carlson_troll_armor_ready (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 5;
	condition		= DIA_RBL_2617_Carlson_troll_armor_ready_Condition;
	information		= DIA_RBL_2617_Carlson_troll_armor_ready_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_RBL_2617_Carlson_troll_armor_ready_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_RBL_2617_Carlson_Leaf_agree)&&(Carlson_armor <= Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_troll_armor_ready_Info()
{
	AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_01"); //Pancerz gotowy. I jak ci siê podoba?
	AI_Output (other, self, "DIA_RBL_2617_Carlson_troll_armor_ready_15_02"); //Nawet niez³y ten pancerz. Dziêki, kowalu.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_03"); //Nie ma sprawy, Carlson zawsze do us³ug.
   AI_Output (self, other, "DIA_RBL_2617_Carlson_troll_armor_ready_11_04"); //A teraz za³ó¿ nowe ³achy i pofruwaj sobie w nich po kolonii, he, he.

   CreateInvItem(self, HCG_ARMOR_H);
	B_GiveInvItems(self, other, HCG_ARMOR_H, 1);
	AI_EquipArmor(other, HCG_ARMOR_H);
   
   Log_SetTopicStatus(CH2_RBL_armor, LOG_SUCCESS);
	B_LogEntry(CH2_RBL_armor, "W nagrodê otrzyma³em swój wymarzony pancerz z trolla.");
};

INSTANCE DIA_RBL_2617_Carlson_Repair_Axe (C_INFO)
{
	npc				= RBL_2617_Carlson;
	nr				= 3;
	condition		= DIA_RBL_2617_Carlson_Repair_Axe_Condition;
	information		= DIA_RBL_2617_Carlson_Repair_Axe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy móg³byœ podostrzyæ mi mój topór?"; 
};

FUNC INT DIA_RBL_2617_Carlson_Repair_Axe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Carlson_GoOut)) && (!repaired_axe_Rick) && (NPC_HasItems(other, Rick_Axe_1)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2617_Carlson_Repair_Axe_Info()
{
	repaired_axe_Rick = TRUE; 
   
   B_unequip_current_mweapon_hero(Rick_Axe_1);
   
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Repair_Axe_15_01"); //Czy móg³byœ podostrzyæ mi mój topór?
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Repair_Axe_11_02"); //Tak, a przy okazji sprawdzê jakoœæ tutejszej kuŸni. Daj mi swój toporek.
   Give_and_remove(Rick_Axe_1, 1);
   Create_and_give(Rick_Axe_2b, 1);
	AI_Output (self, other, "DIA_RBL_2617_Carlson_Repair_Axe_15_03"); //Teraz ma³e poprawki i ju¿ jest gotowy!
	AI_Output (other, self, "DIA_RBL_2617_Carlson_Repair_Axe_15_04"); //Dziêki.
};