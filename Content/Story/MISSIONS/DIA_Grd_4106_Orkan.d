// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orkan_Exit (C_INFO)
{
	npc			= Grd_4106_Orkan;
	nr			= 999;
	condition	= DIA_Orkan_Exit_Condition;
	information	= DIA_Orkan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orkan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Orkan_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Orkan_First (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 1;
	condition		= DIA_Orkan_First_Condition;
	information		= DIA_Orkan_First_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Orkan_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Orkan_First_Info()
{
	AI_Output (other, self, "DIA_Orkan_First_15_02"); //Witaj.
	AI_Output (self, other, "DIA_Orkan_First_11_01"); //Odpierdol siê. Próbujê siê schlaæ...
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Orkan_Again (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 2;
	condition		= DIA_Orkan_Again_Condition;
	information		= DIA_Orkan_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "S³ysza³em jaki 'zaszczyt' Ciê spotka³."; 
};

FUNC INT DIA_Orkan_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cord_ConvoysPeopleDone4))&&(Npc_KnowsInfo (hero, DIA_Grd_217_Again))&&(Npc_KnowsInfo (hero, DIA_Orkan_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_Again_Info()
{
	AI_Output (other, self, "DIA_Orkan_Again_15_01"); //S³ysza³em jaki 'zaszczyt' Ciê spotka³.
	AI_Output (self, other, "DIA_Orkan_Again_11_02"); //Kurewsko siê z tego cieszê.
	AI_Output (other, self, "DIA_Orkan_Again_15_03"); //O co chodzi z tymi konwojami? S³ysza³em, ¿e to paskudna sprawa.
	AI_Output (self, other, "DIA_Orkan_Again_11_04"); //Cz³owieku, te transporty nigdy nie wracaj¹! A ja mam jutro ruszyæ z nastêpnym!
	
   orkan_wait = B_SetDayTolerance()+1;
	B_LogEntry(CH5_NC_Convoys, "Konwój wyruszy jutro, muszê jak najszybciej poinformowaæ cz³owieka Corda.");
	
   AI_Output (self, other, "DIA_Orkan_Again_11_05"); //Do tego nie mam jeszcze pe³nej obstawy eskorty.
	AI_Output (self, other, "DIA_Orkan_Again_11_06"); //A mog³êm siê rzuciæ na barierê, jak jeszcze by³a okazja...
	AI_Output (other, self, "DIA_Orkan_Again_15_07"); //Ilu ludzi potrzebujesz?
	AI_Output (self, other, "DIA_Orkan_Again_11_08"); //Co najmniej trzech. A co Ciê to obchodzi?
	AI_Output (other, self, "DIA_Orkan_Again_15_09"); //A gdybym zdo³a³ przekonaæ kilku stra¿ników? Co bym z tego mia³?
	AI_Output (self, other, "DIA_Orkan_Again_11_10"); //Przynajmniej stawiasz sprawê jasno.
	AI_Output (self, other, "DIA_Orkan_Again_11_11"); //Za ka¿dego dostaniesz rudê, a jak zbierzesz wszystkich, to dorzucê coœ ekstra. Masz czas do jutra.
	AI_Output (other, self, "DIA_Orkan_Again_15_12"); //Powinno wystarczyæ.
	AI_Output (self, other, "DIA_Orkan_Again_11_13"); //Dobra, wiesz, gdzie mnie szukaæ.
	AI_Output (self, other, "DIA_Orkan_Again_11_14"); //Aha. Jak znajdziesz jakiœ samobójców, niech czekaj¹ przy bramie. Paczki z broni¹ znajd¹ w barakach.	
	B_LogEntry(CH5_NC_Convoys, "Konwój wyruszy jutro, o ile znajdê dwóch stra¿ników chêtnych do ochraniania transportu. Muszê przekazaæ wieœci cz³owiekowi wys³anemu przez Corda.");
	B_LogEntry(CH5_NC_Convoys, "Muszê namówiæ dwóch stra¿ników, aby przy³¹czyli siê do konwoju. Oczywiœcie trzecim bêdê ja. Mam czas do jutra.");

	var C_NPC khar; khar = Hlp_GetNpc(hun_729_kharim);
   Npc_ExchangeRoutine(khar, "WaitInCave");
   
   wld_insertNPC(GRD_263_Asghan, "OCR_NORTHGATE_RAMP_ATOP");
};

// **************************************************

var int orkan_go;

INSTANCE DIA_Orkan_Escort (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 3;
	condition		= DIA_Orkan_Escort_Condition;
	information		= DIA_Orkan_Escort_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam kilku chêtnych."; 
};

FUNC INT DIA_Orkan_Escort_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Again))&&(Npc_KnowsInfo (hero, DIA_Asghan_Escort))&&(Npc_KnowsInfo (hero, Info_Kirgo_Escort))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_Escort_Info()
{
	AI_Output (other, self, "DIA_Orkan_Escort_15_01"); //Mam kilku chêtnych.
   
	if (orkan_wait >= Wld_GetDay())
	{
		orkan_go = TRUE;
		AI_Output (self, other, "DIA_Orkan_Escort_11_02"); //Uda³o Ci siê kogoœ zwerbowaæ?
		AI_Output (other, self, "DIA_Orkan_Escort_15_03"); //Kirgo i Ashgan rusz¹ razem z konwojem.
		AI_Output (self, other, "DIA_Orkan_Escort_11_04"); //Naprawdê siê zgodzili? Co za idioci. Ale brakuje jeszcze jednego szaleñca.
		AI_Output (other, self, "DIA_Orkan_Escort_15_05"); //Ostatnim ochotnikiem bêdê ja.
		AI_Output (self, other, "DIA_Orkan_Escort_11_06"); //Jesteœ pewien?
		AI_Output (other, self, "DIA_Orkan_Escort_15_07"); //Tak.
	}
	else if (orkan_wait < Wld_GetDay())
	{
		AI_Output (self, other, "DIA_Orkan_Escort_11_08"); //Za póŸno, konwój powinien ju¿ byæ w drodze. Gomez urwie mi jaja, idê siê schlaæ.
		B_LogEntry(CH5_NC_Convoys, "SpóŸni³em siê. Cord urwie mi jaja.");
		B_StopProcessInfos(self);
	};
};

// **************************************************

INSTANCE DIA_Orkan_EscortGo (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 4;
	condition		= DIA_Orkan_EscortGo_Condition;
	information		= DIA_Orkan_EscortGo_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortGo_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_Escort))&&(orkan_go == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortGo_Info()
{
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_01"); //To na co czekamy? 
	AI_Output (other, self, "DIA_Orkan_EscortGo_15_02"); //Na to a¿ wytrzeŸwiejesz.
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_03"); //Nie b¹dŸ œmieszny, po pijaku przynajmniej trzeŸwo myœlê.
	AI_Output (self, other, "DIA_Orkan_EscortGo_11_04"); //Idziemy po resztê zbieraniny.
	B_StopProcessInfos(self);
   
   Npc_ExchangeRoutine(self, "Wait");
};

// **************************************************

INSTANCE DIA_Orkan_EscortGo1 (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 4;
	condition		= DIA_Orkan_EscortGo1_Condition;
	information		= DIA_Orkan_EscortGo1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortGo1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_EscortGo))&&(Npc_GetDistToWP (self,"OC2") < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortGo1_Info()
{
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_01"); //Rzeczywiœcie czekaj¹!
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_02"); //Bierzemy dupê w troki i miejcie oczy dooko³a g³owy.
	AI_Output (self, other, "DIA_Orkan_EscortGo1_11_03"); //Za mn¹!	

	B_LogEntry(CH5_NC_Convoys, "Konwój ruszy³.");

	Npc_ExchangeRoutine(self,"GUIDE");
	Npc_ExchangeRoutine(kirgo,"FOLLOW");
	Npc_ExchangeRoutine(ashgan,"FOLLOW");

	CreateInvItems (self,weaponpackage,2);
	CreateInvItems (kirgo,weaponpackage,2);
	CreateInvItems (ashgan,weaponpackage,2);
	CreateInvItems (other,weaponpackage,2);
	
	Npc_ExchangeRoutine(cord,"TRAP");
	
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Orkan_EscortTrap (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 5;
	condition		= DIA_Orkan_EscortTrap_Condition;
	information		= DIA_Orkan_EscortTrap_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortTrap_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orkan_EscortGo1))&&(merc_trap == TRUE)&&(Npc_GetDistToWP (self,"FP_ROAM_OW_SNAPPER_OW_ORC") < 400 )
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortTrap_Info()
{
	B_FullStop (hero);
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_01"); //Coœ mi tu nie gra. 
	AI_DrawWeapon (self);
	AI_GotoNpc(other,self);
	AI_Output (other, self, "DIA_Orkan_EscortTrap_15_02"); //Co siê dzieje?
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_03"); //Œwie¿e œlady... 
	AI_Output (self, other, "DIA_Orkan_EscortTrap_11_04"); //To pu³apka, do broni!

	B_StopProcessInfos(self);

	AI_DrawWeapon (kirgo);
	AI_DrawWeapon (ashgan);
};

// **************************************************

INSTANCE DIA_Orkan_EscortTrapTalk (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 6;
	condition		= DIA_Orkan_EscortTrapTalk_Condition;
	information		= DIA_Orkan_EscortTrapTalk_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Orkan_EscortTrapTalk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cord_ConvoyConvoyTrap))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_EscortTrapTalk_Info()
{
	B_FullStop (hero);

	AI_TurnToNpc(self, cord);
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_01"); //Nie jestem idiot¹. Rzucimy broñ, a wy nas wyr¿niecie. Tak jak pozosta³e konwoje.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_02"); //Przebijemy siê!
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_15_03"); //Stój! To nie ma sensu, jest was tylko trzech.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_04"); //Jak to trzech?
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_05"); //Ty skurwielu!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_06"); //Pierdolony zdrajca! Zginiesz jako pierwszy!
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_15_07"); //Wys³uchaj mnie, Orkan. Zawsze zd¹¿ymy siê pozabijaæ.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_11_08"); //Mów, byle szybko!

	Info_ClearChoices (DIA_Orkan_EscortTrapTalk);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Do³¹czcie do najemników.", DIA_Orkan_EscortTrapTalk_Join);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Rzuæcie broñ, a traficie do kopalni.", DIA_Orkan_EscortTrapTalk_Mine);
	Info_AddChoice (DIA_Orkan_EscortTrapTalk, "Masz racjê, po co gadaæ!", DIA_Orkan_EscortTrapTalk_Die);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Die()
{
	merc_trap = 3;

	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Die_15_01"); //Masz racjê, po co gadaæ!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Die_11_02"); //Giñ, sukinsynie!

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(ashgan,other,true);
	B_StartAfterDialogFight(kirgo,other,true);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Mine()
{
	merc_trap = 3;

	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Mine_15_01"); //Rzuæcie broñ, a traficie do kopalni.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_02"); //O ile dotrzymasz s³owa, zdrajco.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_03"); //Poza tym wolê umrzeæ tu i teraz, ni¿ piæ do koñca ¿ycia w³asny pot w kopalni.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Mine_11_04"); //A wy?
	AI_TurnToNpc(self, kirgo);
	AI_PlayAni(kirgo,"T_YES");
	AI_TurnToNpc(self, ashgan);
	AI_PlayAni(ashgan,"T_YES");

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
	B_StartAfterDialogFight(ashgan,other,true);
	B_StartAfterDialogFight(kirgo,other,true);
};

// --------------------------------------------------------------

FUNC VOID DIA_Orkan_EscortTrapTalk_Join()
{
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_01"); //Do³¹czcie do najemników.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_02"); //Chyba zg³upia³eœ. Ca³e ¿ycie kopa³em ich w dupê, a teraz mia³bym do nich przystaæ?
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_03"); //A masz lepszy pomys³? Zreszt¹ co to za ró¿nica z kim trzymasz? Wszyscy jesteœmy skazañcami do cholery!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_04"); //Hmm...
	AI_Output (other, self, "DIA_Orkan_EscortTrapTalk_Join_15_05"); //Do tego w Nowym Obozie mo¿esz wypiæ wiêcej ry¿ówki ni¿ udŸwigniesz.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_06"); //Tym mnie przekona³eœ!
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_07"); //Ma racjê, na ow³osione jaja Beliara! Co za ró¿nica komu i dla kogo kopie siê dupska co nie ch³opaki?
	
   AI_TurnToNpc(self, kirgo);
	AI_PlayAni(kirgo,"T_YES");
	AI_TurnToNpc(self, ashgan);
	AI_PlayAni(ashgan,"T_YES");
	
   AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_08"); //Wa¿ne, ¿e jest je komu kopaæ i co wypiæ.
	AI_Output (self, other, "DIA_Orkan_EscortTrapTalk_Join_11_09"); //A co na to nasz wymuskany Pan Najmita?
	
   AI_TurnToNpc(self, cord);
	merc_trap = 2;
	B_StopProcessInfos(self); 
};

// **************************************************

INSTANCE DIA_Orkan_End (C_INFO)
{
	npc				= Grd_4106_Orkan;
	nr				= 7;
	condition		= DIA_Orkan_End_Condition;
	information		= DIA_Orkan_End_Info;
	permanent		= 0;
	important		= 1;
	description		= "Nie chowasz urazy?"; 
};

FUNC INT DIA_Orkan_End_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Cord_ConvoyConvoyTrapEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Orkan_End_Info()
{
	AI_Output (other, self, "DIA_Orkan_End_15_01"); //Nie chowasz urazy?
	AI_Output (self, other, "DIA_Orkan_End_11_02"); //Nie b¹dŸ idiot¹. Dziêki Tobie wyrwa³em siê ze Starego Obozu, a do tego bêdê teraz mia³ ry¿owki, ile dusza zapragnie.
	AI_Output (self, other, "DIA_Orkan_End_11_03"); //Czego mo¿na chcieæ wiêcej?
	AI_Output (other, self, "DIA_Orkan_End_15_04"); //Dobrze to s³yszeæ. Bywaj.
	AI_Output (self, other, "DIA_Orkan_End_11_05"); //Powodzenia, przyjacielu.
	
   Npc_ExchangeRoutine(self,"NC1");
};
