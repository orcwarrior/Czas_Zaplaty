
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Pluskwa_Exit (C_INFO)
{
	npc			= Grd_4086_Pluskwa;
	nr			= 999;
	condition	= DIA_Pluskwa_Exit_Condition;
	information	= DIA_Pluskwa_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pluskwa_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Pluskwa_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Pluskwa_Hi (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 1;
	condition		= DIA_Pluskwa_Hi_Condition;
	information		= DIA_Pluskwa_Hi_Info;
	permanent		= 0;
	important		= 1;
	description		= "Czym siê zajmujesz?"; 
};

FUNC INT DIA_Pluskwa_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Pluskwa_Hi_Info()
{
	AI_Output (other, self, "DIA_Pluskwa_Hi_15_01"); //Czym siê zajmujesz?
	AI_Output (self, other, "DIA_Pluskwa_Hi_11_02"); //Gówno Ciê to obchodzi, sp³ywaj z fekaliami.
	B_StopProcessInfos(self);
};

INSTANCE DIA_Pluskwa_First (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 2;
	condition		= DIA_Pluskwa_First_Condition;
	information		= DIA_Pluskwa_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pluskwa_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Wolf_RBL1))
	{
		return 1;
	};
};

FUNC VOID DIA_Pluskwa_First_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
   
	AI_Output (self, other, "DIA_Pluskwa_First_11_01"); //Nasz Wilczek ma nowego przyjaciela? Czego tu szukasz przyb³êdo?
	AI_Output (other, self, "DIA_Pluskwa_First_15_02"); //Chcia³em kupiæ ³uk.
	AI_Output (self, other, "DIA_Pluskwa_First_11_03"); //Nie znam Ciê...
	
   var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(hero);
	
   if (Hlp_IsItem(myarmor, GRD_ARMOR_L))||(Hlp_IsItem(myarmor, GRD_ARMOR_M))
	{
		AI_Output (self, other, "DIA_Pluskwa_First_11_04"); //Zbroja stra¿nika jeszcze Ciê nim nie czyni, je¿eli wiesz o czym mówiê.
	};
   
	AI_Output (other, self, "DIA_Pluskwa_First_15_05"); //Jedyne co mnie interesuje to ³uk i strza³y. 
	AI_Output (self, other, "DIA_Pluskwa_First_11_06"); //Dobra, znaj ³askê pana. Kupuj i nie miel jêzorem z tym wsza¿em, bo Ci go utnê przy samej dupie!
	
   B_StopProcessInfos(self);
};
// **************************************************

func void B_ExchangeRoutine_Pluskwa()
{
   B_LogEntry(CH4_NC_RBLBosses, "No to Pluskwê mam z g³owy. Czas w spokoju porozmawiaæ z Wilkiem.");
	B_StopProcessInfos(Grd_4086_Pluskwa);	

	/*****************
		Startowa rutyna pluska ma byæ taka, ¿e ca³y czas stoi przy wolfie, w nocy stroi przed jego chat¹, albo siedzi.
		Ta go zmienia to, niech idzie do karczmy i tam ca³y czas chleje czy coœ tam
		*****************/
	
	Npc_ExchangeRoutine(Grd_4086_Pluskwa, "go");
};

INSTANCE DIA_Pluskwa_Again (C_INFO)
{
	npc				= Grd_4086_Pluskwa;
	nr				= 3;
	condition		= DIA_Pluskwa_Again_Condition;
	information		= DIA_Pluskwa_Again_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Pluskwa_Again_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Wolf_RBL2))
	{
		return 1;
	};
};

FUNC VOID DIA_Pluskwa_Again_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Pluskwa_Again_11_01"); //Wystarczy ju¿ tego kupowania. ZejdŸ mi z oczu.
	AI_Output (other, self, "DIA_Pluskwa_Again_15_02"); //Coœ Ty taki nerwowy?
	AI_Output (self, other, "DIA_Pluskwa_Again_11_03"); //Nie Twoja sprawa. Spierdalaj!

	Info_ClearChoices (DIA_Pluskwa_Again);
	Info_AddChoice (DIA_Pluskwa_Again, "Powinieneœ coœ wypiæ.", DIA_Pluskwa_Again_Drink);
	Info_AddChoice (DIA_Pluskwa_Again, "Zdaje siê, ¿e porz¹dny wpierdol dobrze Ci zrobi!", DIA_Pluskwa_Again_Kill);
	Info_AddChoice (DIA_Pluskwa_Again, "Uwa¿aj na to, co mówisz.", DIA_Pluskwa_Again_Fear);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Kill()
{
	if (plusk_angry == FALSE)
	{
		AI_Output (other, self, "DIA_Pluskwa_Again_Kill_15_00"); //Zdaje siê, ¿e porz¹dny wpierdol dobrze Ci zrobi!
	}
	else
	{
		AI_Output (other, self, "DIA_Pluskwa_Again_Kill_15_01"); //Wyprujê Ci flaki!
	};
   
	AI_Output (self, other, "DIA_Pluskwa_Again_Kill_11_02"); //O proszê, trafi³ siê jakiœ idiota.
	AI_Output (self, other, "DIA_Pluskwa_Again_Kill_11_03"); //Ch³opaki, czas na rozrywkê!

	/*****************
		Ork chodzi o to, ¿eby rzucili siê na niego okoliczni stra¿nicy, dick nie powinien tego prze¿yæ ;P
		*****************/

	B_StopProcessInfos(self);					
	B_IntruderAlert(self, other);
	B_SetAttackReason(self, AIV_AR_INTRUDER);
	B_StartAfterDialogFight(self,other,true);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_15_01"); //Uwa¿aj na to, co mówisz.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_11_02"); //A co mi zrobisz z³amasie?
	
   plusk_angry = TRUE;
	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Znam kogoœ, kto nie bêdzie tak cierpliwy.", DIA_Pluskwa_Again_Fear_Know);
	};
   
	Info_AddChoice (DIA_Pluskwa_Again, "Wyprujê Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_15_01"); //Znam kogoœ, kto nie bêdzie tak cierpliwy.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_11_02"); //Pewnie twoja stara, he, he.


	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Ore))||(Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Chyba rzeczywiœcie pogadam z Hrabi¹...", DIA_Pluskwa_Again_Fear_Know_Hrabia);
	};
	if (Npc_KnowsInfo (hero, DIA_Fletcher_Hello))
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Powiem o wszystkim Fletcherowi!", DIA_Pluskwa_Again_Fear_Know_Flet);
	};
   
	Info_AddChoice (DIA_Pluskwa_Again, "Wyprujê Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know_Hrabia()
{
	plusk_fear = TRUE;
   
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_01"); //Chyba rzeczywiœcie pogadam z Hrabi¹...
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_02"); //Co?! Zaczekaj! Nie wiedzia³em, ¿e znasz szefa.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_03"); //Przecie¿ szefem jest Fletcher.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_04"); //Ten nadêty bêcwa³ to tylko marionetka, za sznurki poci¹ga Hrabia.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_05"); //Mamy wiêc wspólnych znajomych.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_06"); //Co proponujesz?
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_07"); //Dasz spokój Wilkowi, a ja zapomnê o twojej nadgorliwoœci.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_08"); //To nie takie proste...
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_09"); //Kto kaza³ Ci pilnowaæ Wilka?
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_10"); //Fletcher.
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_11"); //A kim on jest?
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_12"); //Racja. Dobra, coœ wymyœlê. Tylko napomknij o mnie Hrabiemu!
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Hrabia_15_13"); //Mo¿esz byæ pewien, ¿e nie omieszkam.
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Hrabia_11_14"); //Wypijê za to!
	
   Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Fear_Know_Flet()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Fear_Know_Flet_15_01"); //Powiem o wszystkim Fletcherowi!
	AI_Output (self, other, "DIA_Pluskwa_Again_Fear_Know_Flet_11_02"); //A mów sobie, ten cieæ mo¿e mi naskoczyæ.
	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Drink()
{
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_15_01"); //Powinieneœ coœ wypiæ.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_11_02"); //A masz coœ godnego mojego podniebienia?

	Info_ClearChoices (DIA_Pluskwa_Again);
   
	if (NPC_HasItems(other,ItFoBooze)>=4)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Mam kilka ry¿ówek.", DIA_Pluskwa_Again_Drink_Rice);
	};
	if (NPC_HasItems(other,ItFoBeer)>=6)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Co powiesz na kilka piwek?", DIA_Pluskwa_Again_Drink_Beer);
	};
	if (NPC_HasItems(other,ItFo_Addon_Rum)>=2)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Lubisz rum?", DIA_Pluskwa_Again_Drink_Rum);
	};
	if (NPC_HasItems(other,ItFo_Addon_Grog)>=1)
	{
		Info_AddChoice (DIA_Pluskwa_Again, "Mam coœ specjalnego!", DIA_Pluskwa_Again_Drink_Grog);
	};

	Info_AddChoice (DIA_Pluskwa_Again, "Wyprujê Ci flaki!", DIA_Pluskwa_Again_Kill);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Pluskwa_Again_Drink_Rice()
{
	plusk_drink = TRUE;
   
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Rice_15_01"); //Mam kilka ry¿ówek.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rice_11_02"); //Chcesz mnie skusiæ tymi szczynami?
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rice_11_03"); //Dobra, niech bêdzie. Dawaj ry¿ówki i zejdŸ mi z drogi!
	B_GiveInvItems (self, other, ItFoBooze, 4);
	
   Npc_ExchangeRoutine	(self, "GO");	
   	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Beer()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Beer_15_01"); //Co powiesz na kilka piwek?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Beer_11_02"); //Dobre piwko nie jest z³e.
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Beer_11_03"); //Dawaj te siki i spadaj.
	
   B_GiveInvItems (self, other, ItFoBeer, 6);
  Npc_ExchangeRoutine	(self, "GO");
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Rum()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Rum_15_01"); //Lubisz rum?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rum_11_02"); //Te¿ pytanie!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Rum_11_03"); //Z chêci¹ przep³ukam gardzio³o...
	
   B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);
  Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};

// -------------------------------------------------------------------
FUNC VOID DIA_Pluskwa_Again_Drink_Grog()
{
	plusk_drink = TRUE;
	
   AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Grog_15_01"); //Mam coœ specjalnego!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_02"); //Butelkowany mocz orków?
	AI_Output (other, self, "DIA_Pluskwa_Again_Drink_Grog_15_03"); //Chcia³byœ... Co powiesz na grog?
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_04"); //Cz³owieku toœ mi brat!
	AI_Output (self, other, "DIA_Pluskwa_Again_Drink_Grog_11_05"); //Idê wypiæ Twoje zdrowie, bywaj.
	
   B_GiveInvItems (self, other, ItFo_Addon_Grog, 1);
  Npc_ExchangeRoutine	(self, "GO");	
  	B_StopProcessInfos(self);	
};
