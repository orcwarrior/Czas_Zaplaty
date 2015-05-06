
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Korth_Exit (C_INFO)
{
	npc			= Non_4023_Korth;
	nr			= 999;
	condition	= DIA_Korth_Exit_Condition;
	information	= DIA_Korth_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Korth_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Korth_Exit_Info()
{
	B_StopProcessInfos	( self );
};

var int Korth_ok;
var int Korth_know;
var int Korth_warn;

// **************************************************
// 				
// **************************************************

INSTANCE DIA_Korth_Hello (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 2;
	condition		= DIA_Korth_Hello_Condition;
	information		= DIA_Korth_Hello_Info;
	permanent		= 1;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Korth_Hello_Condition()
{
	//todo: ok, but check onceagain
	if (Korth_ok==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Korth_Hello_11_01"); //Czego tu szukasz?
	
   if (TH_hero_knowpwd == TRUE)
	{
		if (Korth_know==FALSE)
		{
			Korth_know=TRUE;
			AI_DrawWeapon (self);
			
         AI_Output (other, self,"DIA_Korth_Hello_15_02"); //Rozmawia³em z Leafem. Podobno was zna.
			AI_Output (self, other,"DIA_Korth_Hello_11_03"); //Leaf? Tak, by³ tu kilka razy.
			AI_Output (self, other,"DIA_Korth_Hello_11_04"); //Ale ¿eby wejœæ musisz znaæ has³o.
			AI_RemoveWeapon (self);
		}
		else
		{	
			AI_Output (self, other,"DIA_Korth_Hello_11_05"); //To jak bêdzie z tym has³em? Znasz je czy nie?
		};
	}
	else
	{
		if (Korth_warn==FALSE)
		{
			Korth_warn = TRUE;
			AI_DrawWeapon (self);
         
			AI_Output (other, self,"DIA_Korth_Hello_15_06"); //Witaj. Co to za miejsce?
			AI_Output (self, other,"DIA_Korth_Hello_11_07"); //Miejsce, w którym nikt nie lubi obcych - spadaj.
		}
		else
		{
			AI_DrawWeapon (self);
         
			AI_Output (other, self,"DIA_Korth_Hello_15_08"); //Chcia³em tylko...
			AI_Output (self, other,"DIA_Korth_Hello_11_09"); //Powiedzia³em zje¿d¿aj st¹d!
		};
      
		AI_RemoveWeapon (self);
		B_StopProcessInfos	(self);
		AI_GotoWP		(other, "OW_PATH_185");
	};

	if (TH_hero_knowpwd == TRUE)
	{
		Info_ClearChoices (DIA_Korth_Hello);
		Info_AddChoice (DIA_Korth_Hello, "'Nigdy nie odwracaj siê ty³em do stra¿nika'.", Korth_Hello_1);
		Info_AddChoice (DIA_Korth_Hello, "'¯ycie up³ywa w strugach gówna'.", Korth_Hello_2);
		Info_AddChoice (DIA_Korth_Hello, "'Gomez woli owce'.", Korth_Hello_3);
		Info_AddChoice (DIA_Korth_Hello, "'Dobry troll, to martwy troll'.", Korth_Hello_4);
	}
	else
	{
		Info_AddChoice (DIA_Korth_Hello, "To ja ju¿ sobie pójdê.", Korth_Hello_5);
	};
};

// ---------------------------1----------------------------------------

FUNC VOID Korth_Hello_1()
{
	Korth_ok = TRUE; //hero entered camp
	AI_Output (other,self,"Korth_Hello_1_Info_15_01"); //'Nigdy nie odwracaj siê ty³em do stra¿nika'.
	AI_Output (self, other,"Korth_Hello_1_Info_11_02"); //Œwiête s³owa, bo on mo¿e woli ch³opców, he, he. £apisz? Ty³em...
	AI_Output (self, other,"Korth_Hello_1_Info_11_03"); //Niewa¿ne, w³aŸ. Tylko uwa¿aj na siebie, nikt tu nie przepada za obcymi.
	
   B_LogEntry		(CH2_Rbl_BlackTroll, "Uda³o mi siê wejœæ do obozu ³owców trolli. Ale to by³a ta ³atwiejsza czêœæ.");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
	B_SetTimedATT(self,30*events_per_sec,(-70),(-70),(-100));		
};

// ------------------2----------------

FUNC VOID Korth_Hello_2()
{
	AI_Output (other,self,"Korth_Hello_2_Info_15_01"); //'¯ycie up³ywa w strugach gówna'.
	AI_Output (self, other,"Korth_Hello_2_Info_11_02"); //Racja, ale nie o to pyta³em.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// ------------------3----------------

FUNC VOID Korth_Hello_3()
{
	AI_Output (other,self,"Korth_Hello_3_Info_15_01"); //'Gomez woli owce'.
	AI_Output (self, other,"Korth_Hello_3_Info_11_02"); //He, he, ano jego wybór. Ale to nie has³o.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// ------------------4----------------

FUNC VOID Korth_Hello_4()
{
	AI_Output (other,self,"Korth_Hello_4_Info_15_01"); //'Dobry troll, to martwy troll'.
	AI_Output (self, other,"Korth_Hello_4_Info_11_02"); //Œwiêta prawda! Tylko, ¿e to nie has³o.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};

// -----------------5----------------

FUNC VOID Korth_Hello_5()
{
	AI_Output (other,self,"Korth_Hello_5_Info_15_01"); //To ja ju¿ sobie pójdê.
	AI_Output (self, other,"Korth_Hello_5_Info_11_02"); //To chyba najlepszy pomys³.
	
   AI_GotoWP		(other, "OW_PATH_185");
	Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};	

// **************************************************

INSTANCE DIA_Korth_Hello1 (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 3;
	condition		= DIA_Korth_Hello1_Condition;
	information		= DIA_Korth_Hello1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobre miejsce na obóz."; 
};

FUNC INT DIA_Korth_Hello1_Condition()
{
	if (Korth_ok == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Hello1_Info()
{
	AI_Output (other, self,"DIA_Korth_Hello1_15_01"); //Dobre miejsce na obóz.
	AI_Output (self, other,"DIA_Korth_Hello1_11_02"); //Dobre jak ka¿de inne. Nie lubimy, jak siê nam obcy pod nosem pa³êtaj¹.
	AI_Output (other, self,"DIA_Korth_Hello1_15_03"); //Rozumiem.
	AI_Output (self, other,"DIA_Korth_Hello1_11_04"); //Chyba jednak nie rozumiesz, skoro z Tob¹ rozmawiam. ZejdŸ mi z drogi ch³opcze i dobrze Ci radzê, uwa¿aj na to co mówisz.
	AI_Output (other, self,"DIA_Korth_Hello1_15_05"); //Zapamiêtam.
	
   B_StopProcessInfos	(self);
};

var int korth_day;

// **************************************************

INSTANCE DIA_Korth_Dick (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 4;
	condition		= DIA_Korth_Dick_Condition;
	information		= DIA_Korth_Dick_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Korth_Dick_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Bukhart_Thief))&&(Npc_KnowsInfo (hero,DIA_Snow_Find))
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_Dick_Info()
{
	if (snow_know == TRUE)
	{
		B_FullStop (hero);
		AI_Output (self, other,"DIA_Korth_Dick_11_01"); //PodejdŸ no tu ³achmyto!
		AI_GotoNpc(other,self);
		AI_Output (self, other,"DIA_Korth_Dick_11_02"); //Zdaje siê, ¿e ktoœ ma za d³ugi ozor! Z chêci¹ bym go skróci³, ale Kira urwa³aby mi za to nogi przy samej dupie.
		AI_Output (other, self,"DIA_Korth_Dick_15_03"); //Spokojnie. Mam pewn¹ propozycjê.
	}
	else
	{
		AI_Output (self, other,"DIA_Korth_Dick_11_04"); //Bukhart powiedzia³, ¿e zaskoczy³eœ go w magazynku. 
		AI_Output (self, other,"DIA_Korth_Dick_11_05"); //Cieszê siê, ¿e zatrzyma³eœ nasze... motywy dla siebie.
		AI_Output (other, self,"DIA_Korth_Dick_15_06"); //Mam pewn¹ propozycjê.
	};
   
	AI_Output (self, other,"DIA_Korth_Dick_11_07"); //Mów.
	AI_Output (other, self,"DIA_Korth_Dick_15_08"); //Wam brakuje trunków, a ja muszê udowodniæ Kirze, ¿e nadajê siê do tego i owego.
	AI_Output (self, other,"DIA_Korth_Dick_11_09"); //Hmm, dobry pomys³. Nie ma sprawy, wstawiê siê za Tob¹, jak przyniesiesz zapasik na co najmniej tydzieñ.
	AI_Output (other, self,"DIA_Korth_Dick_15_10"); //Ile tego ma byæ?
	AI_Output (self, other,"DIA_Korth_Dick_11_11"); //Powiedzmy, ¿e 30 piw, 10 win i 10 ry¿ówek. Powinno wystarczyæ na jakiœ czas.
	AI_Output (other, self,"DIA_Korth_Dick_15_12"); //To ma byæ zapas na tydzieñ? Ju¿ nie dziwiê siê Kirze, ¿e zakaza³a wam piæ.
	AI_Output (self, other,"DIA_Korth_Dick_11_13"); //Nie mêdrkuj, tylko rusz ty³ek. Zasch³o mi w gardle...
	AI_Output (self, other,"DIA_Korth_Dick_11_14"); //I niech Ci to nie zajmie wiecznoœci. Masz cztery dni, potem nakopiê Ci do ty³ka.
	
   korth_day = B_SetDayTolerance()+4;
	Log_CreateTopic	(CH2_TRL_Drinks, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Drinks, "Zawar³em z Korthem uk³ad. Dostarczê mu zapas gorza³y na tydzieñ: 30 piw, 10 win i 10 ry¿ówek, a on wstawi siê za mn¹ przed Kir¹. Mam na to cztery dni.");

	B_StopProcessInfos	(self);
};

var int korth_check;

// **************************************************

INSTANCE DIA_Korth_DickEnd (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 5;
	condition		= DIA_Korth_DickEnd_Condition;
	information		= DIA_Korth_DickEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam gorza³ê."; 
};

FUNC INT DIA_Korth_DickEnd_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Korth_Dick))&&(!korth_check)//&&(korth_day <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_DickEnd_Info()
{
	AI_Output (other, self,"DIA_Korth_Dick_15_01"); //Mam gorza³ê.
	
   if (korth_day >= Wld_GetDay())&&(NPC_HasItems(other,ItFoBeer)>=30)&&(NPC_HasItems(other,ItFoWine)>=10)&&(NPC_HasItems(other,ItFoBooze)>=10)
	{
		TH_trust = TH_trust + 1;
		korth_check = TRUE;
		B_GiveXP (500);
		AI_PlayAni ( self, "T_SEARCH");
		AI_TurnToNpc (self, other);
      
		AI_Output (self, other,"DIA_Korth_DickEnd_11_02"); //Œwietna robota przyjacielu. Trzeba przyznaæ, ¿e nie robisz sobie dupy z mordy.
		
      B_GiveInvItems (other, self, ItFoBeer,30);
		B_GiveInvItems (other, self, ItFoWine,10);
		B_GiveInvItems (other, self, ItFoBooze,10);
		
      AI_Output (other, self,"DIA_Korth_DickEnd_15_03"); //Zawsze dotrzymujê s³owa. Mogê na Ciebie liczyæ?
		AI_Output (self, other,"DIA_Korth_DickEnd_11_04"); //Pewnie, nie powiem na Ciebie z³ego s³owa, nawet jak Kira weŸmie mnie na te swoje tortury, he, he.
		AI_Output (self, other,"DIA_Korth_DickEnd_11_05"); //Masz moje poparcie. A teraz pozwolisz, ¿e wypijê za Twoje zdrowie...
		
      AI_UseItem (self,ItFobeer);
		Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Drinks, "Dostarczy³em Korthowi przesy³kê z gorza³¹. Zdoby³em uznanie ³owcy i chyba coœ jeszcze - przyjació³ nigdy za wiele.");
		B_LogEntry		(CH2_TRL_Quest, "Korth mnie poprze, ba, nawet wypije za moje zdrowie!");
	}
	else if (korth_day >= Wld_GetDay())&&(korth_check == FALSE)
	{
		AI_Output (self, other,"DIA_Korth_DickEnd_11_06"); //Chyba waln¹³eœ siê w g³owê. Wróæ z ca³ym zapasem albo wcale!
	};
   
   B_StopProcessInfos	(self); 
};

//Added by orc
INSTANCE DIA_Korth_DickEnd_TimesUP (C_INFO)
{
	npc				= Non_4023_Korth;
	nr				= 6;
	condition		= DIA_Korth_DickEnd_TimesUP_Condition;
	information		= DIA_Korth_DickEnd_TimesUP_Info;
	permanent		= 0;
	important		= 1;
	description		= "."; 
};

FUNC INT DIA_Korth_DickEnd_TimesUP_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Korth_Dick))&&(korth_day < Wld_GetDay())&&(!korth_check)
	{
		return 1;
	};
};

FUNC VOID DIA_Korth_DickEnd_TimesUP_Info()
{
	DIA_Korth_DickEnd.permanent = 0;
   
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_01"); //No proszê, kogo to ja widzê?
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_02"); //To¿ to ta szumowina, która coœ mi obieca³a!
	AI_Output (other, self,"DIA_Korth_DickEnd_TimesUP_15_03"); //Wynik³y pewne komplikacje...
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_04"); //Komplikacje powiadasz? Có¿, nie ¿ywiê urazy, powiem Kirze co z Ciebie za ³ajno.
	AI_Output (self, other,"DIA_Korth_DickEnd_TimesUP_11_05"); //A to nagroda za Twoj¹ nieudolnoœæ...
	
   Log_SetTopicStatus	(CH2_TRL_Drinks, LOG_FAILED);
	B_LogEntry		(CH2_TRL_Drinks, "Cholera wiedzia³em, ¿e o czymœ zapomnia³em. Nie dostarczy³em Korthowi gorza³y w umówionym czasie. Przed Kir¹ na pewno mnie nie poprze, a do tego chcia³ mnie spraæ.");
	B_LogEntry		(CH2_TRL_Quest, "Ola³em zlecenie od Kortha, wiêc poparcie z jego strony mi nie grozi.");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};
