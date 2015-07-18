FUNC VOID Rtn_PatrolAttack_2600 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
}; 
FUNC VOID Rtn_PatrolAttack_2601 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
}; 
FUNC VOID Rtn_PatrolAttack_2602 () 
{ 
	TA_STAND(0,00,12,00,"MIS_GRDPATROL1_2"); 
	TA_STAND (12,00,0,00,"MIS_GRDPATROL1_2"); 
};            

FUNC VOID DIA_Duke_Negotaite_Info()
{
	AI_Output (self, other, "DIA_Duke_Negotaite_11_01"); //W sumie zawsze zd¹¿ê Ciê zabiæ. Mów, co to za informacja. 
	AI_Output (other, self, "DIA_Duke_Negotaite_15_02"); //Na waszym miejscu nie pcha³bym siê w gniazdo trolli.
	AI_Output (self, other, "DIA_Duke_Negotaite_11_03"); //O czym Ty gadasz? Przecie¿ w tej norze chowaj¹ siê tylko rebelianci.
	AI_Output (other, self, "DIA_Duke_Negotaite_15_04"); //Niezupe³nie. Pozna³em sekret ich przywódcy.
	AI_Output (self, other, "DIA_Duke_Negotaite_11_05"); //Co to za tajemnica?

	Info_ClearChoices (DIA_Duke_Hello);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn hoduje wœciek³e... œcierwojady!", DIA_Duke_Negotaite_Scavenger);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn oswoi³ kilka cieniostworów.", DIA_Duke_Negotaite_Shadow);
	Info_AddChoice (DIA_Duke_Hello, "Cavalorn ma tresowanego... trolla!", DIA_Duke_Negotaite_Trol);
};

// ---------------------------Scavenger----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Scavenger()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Scavenger_15_01"); //Cavalorn hoduje wœciek³e... œcierwojady!
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_02"); //Wœciek³e œcierwojady?!
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_03"); //To rzeczywiœcie ju¿ po nas...
	AI_Output (self, other, "DIA_Duke_Negotaite_Scavenger_11_04"); //Ch³opaki, zabijcie tego idiotê.
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Scavenger_15_05"); //Angus - teraz wasza kolej!

	B_MisPatrolGRDChoiceNegotiatie_Failure();

	B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy nie nabrali siê na moj¹ prowokacjê.");
	B_StopProcessInfos(self);
};

// ---------------------------Shadow----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Shadow()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Shadow_15_01"); //Cavalorn oswoi³ kilka cieniostworów. Wszystkie czaj¹ siê w g¹szczu dooko³a obozu.
	AI_Output (self, other, "DIA_Duke_Negotaite_Shadow_11_02"); //Cieniostwory? Ju¿ kilka zabi³em. Mog³eœ wymyœliæ lepsz¹ bajeczkê.
	AI_TurnToNpc (self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Shadow_11_03"); //Ch³opaki poka¿my temu durniowi co warta jest nasza stal!
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Shadow_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy nie nabrali siê na moj¹ prowokacjê.");
	B_StopProcessInfos(self);
};

// ---------------------------Trol----------------------------------------

FUNC VOID DIA_Duke_Negotaite_Trol()
{
	patrol_trial = 6;
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_01"); //Cavalorn ma tresowanego... trolla!
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_02"); //To niemo¿liwe, nie mo¿na oswoiæ trolla. Uwa¿asz nas za idiotów?
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_03"); //Nigdy tego nie powiedzia³em. Cavalorn z³apa³ trolla po tym, jak ³owcy zabili jego matkê.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_04"); //Chowa³ zwierzaka od ma³ego, dlatego bestia jest mu we wszystkim pos³uszna. 
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_05"); //Troll ca³y czas patroluje obszar dooko³a obozu - prêdzej lub póŸniej siê na niego natkniecie, a wtedy nie chcia³bym byæ w waszej skórze.	
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_06"); //Troll? Hmm, to niezbyt fortunna wiadomoœæ, o ile jest prawdziwa.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_15_07"); //A dlaczego mia³bym was wprowadziæ w b³¹d?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_08"); //Choæby dlatego, ¿eby siê nas st¹d pozbyæ.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_11_09"); //Sk¹d ta prawdomównoœæ i troska o nasze ¿ycie?


	Info_ClearChoices (DIA_Duke_Hello);
	if (Npc_KnowsInfo (hero, DIA_Hrabia_ore))
	{
		Info_AddChoice (DIA_Duke_Hello, "Pracujê dla Hrabiego.", DIA_Duke_Negotaite_Trol_Hrabia);
	};
	Info_AddChoice (DIA_Duke_Hello, "Jestem jednym z was.", DIA_Duke_Negotaite_Trol_Camper);
	Info_AddChoice (DIA_Duke_Hello, "Mam do wyrównania rachunki z Cavalornem.", DIA_Duke_Negotaite_Trol_Revange);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Hrabia()
{
	B_GiveXP (500);

	patrol_trial = 10;
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_01"); //Pracujê dla Hrabiego.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_02"); //Niech to szlag, mog³eœ od razu mówiæ, ¿e jesteœ jego szponem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_03"); //Chocia¿ z drugiej strony nigdy Ciê nie widzia³em w obozie...
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_04"); //To tylko dobrze œwiadczy o Hrabim, nie s¹dzisz?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_05"); //To fakt, jego ludzie s¹ jak cholerne widma.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_06"); //Ch³opaki schowajcie ¿elazo - to jeden z naszych.
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc(self, other);

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Hrabia_15_07"); //Zmiatajcie st¹d, póki jeszcze mo¿ecie.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Hrabia_11_08"); //Dziêki za ostrze¿enie, mam u Ciebie d³ug.
	B_LogEntry(CH2_RBL_GuardCamp, "Postraszy³em stra¿ników Hrabi¹ i zadzia³a³o. Ten Hrabia musi wzbudzaæ niez³y strach w Starym Obozie. Piraci te¿ wrócili do obozu - czas porozmawiaæ z Ratfordem.");

	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Revange()
{
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_15_01"); //Mam do wyrównania rachunki z Cavalornem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_11_02"); //Zemsta? Zawsze mówi³em, ¿e nie ma to jak zwyczajna ludzka zawiœæ.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_11_03"); //Co to za rachunki?

	Info_ClearChoices (DIA_Duke_Hello);

	Info_AddChoice (DIA_Duke_Hello, "Posz³o o kobietê.", DIA_Duke_Negotaite_Trol_Revange_1);
	Info_AddChoice (DIA_Duke_Hello, "Zes³a³ mnie do tej swojej kopalni.", DIA_Duke_Negotaite_Trol_Revange_2);
	Info_AddChoice (DIA_Duke_Hello, "To nie wasza sprawa!", DIA_Duke_Negotaite_Trol_Revange_3);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Revange_1()
{
	patrol_trial = 8;
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_1_15_01"); //Posz³o o kobietê.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_1_11_02"); //Z tego co wiem w obozie tych obszczymurków nie ma kobiet.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_1_11_03"); //Zabijcie tego cholernego k³amcê!
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_1_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry		(CH2_RBL_GuardCamp, "Stra¿nicy nie nabrali siê na moj¹ prowokacjê.");
	B_StopProcessInfos(self);
};


FUNC VOID DIA_Duke_Negotaite_Trol_Revange_2()
{
	B_GiveXP (500);
	patrol_trial = 10;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_2_15_01"); //Zes³a³ mnie do tej swojej kopalni.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_02"); //Rozumiem, te¿ bym siê wœciek³. Kto chcia³by z w³asnej woli umieraæ przy wydobyciu rudy?
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_03"); //Musia³eœ porz¹dnie mu zajœæ za skórê. Powinieneœ przy³¹czyæ siê do nas. Gomez z otwartymi rêkoma wita ka¿dego zaradnego cz³eka.
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_2_15_04"); //Przemyœlê to.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_05"); //Przekona³eœ mnie.
	AI_TurnToNpc(self, CH2_Patrol_g2);
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_2_11_06"); //Ch³opaki chowaæ broñ, zwijamy siê st¹d.
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc (self, other);
	B_LogEntry(CH2_RBL_GuardCamp, "Przekona³em stra¿ników, piraci te¿ wrócili do obozu. Czas porozmawiaæ z Ratfordem.");

	B_StopProcessInfos(self);
};


FUNC VOID DIA_Duke_Negotaite_Trol_Revange_3()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_3_15_01"); //To nie wasza sprawa!
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_3_11_02"); //Bezczelnoœæ Ci ¿ycia nie uratuje.

	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Revange_3_11_03"); //Zabijcie tego cwaniaka.
   
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Revange_3_15_04"); //Angus - teraz wasza kolej!
   
	B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy nie nabrali siê na moj¹ prowokacjê.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper()
{
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_15_01"); //Jestem jednym z was.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_11_02"); //Jesteœ ze Starego Obozu? To dlaczego Ciê tam nigdy nie widzia³em?

	Info_ClearChoices (DIA_Duke_Hello);

	Info_AddChoice (DIA_Duke_Hello, "By³em kurierem magów ognia.", DIA_Duke_Negotaite_Trol_Camper_1);
	Info_AddChoice (DIA_Duke_Hello, "To nie wasza sprawa!", DIA_Duke_Negotaite_Trol_Revange_3);
	Info_AddChoice (DIA_Duke_Hello, "Jestem... handlarzem.", DIA_Duke_Negotaite_Trol_Camper_2);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper_2()
{
	patrol_trial = 8;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_2_15_01"); //Jestem... handlarzem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_2_11_02"); //Handlarzem? Nie wydaje mi siê, znam wszystkich sprzedawców i ich pomocników w Starym Obozie.

	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_2_11_03"); //Zabijcie tego idiotê.
   
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_TurnToNpc(self, other);
   
	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_2_15_04"); //Angus - teraz wasza kolej!

	B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy nie nabrali siê na moj¹ prowokacjê.");
	B_StopProcessInfos(self);
};

FUNC VOID DIA_Duke_Negotaite_Trol_Camper_1()
{
	B_GiveXP (500);
	patrol_trial = 10;

	AI_Output (other, self, "DIA_Duke_Negotaite_Trol_Camper_1_15_01"); //By³em kurierem magów ognia.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_02"); //Rozumiem. Po tym jak Gomez pozby³ siê magów, nie mia³eœ po co wracaæ.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_03"); //Bêdê z Tob¹ szczery, te¿ nie uwa¿am, ¿eby zabicie magów by³o dobrym rozwi¹zaniem.
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_04"); //W porz¹dku, przekona³eœ mnie.
   
	AI_TurnToNpc(self, CH2_Patrol_g2);
   
	AI_Output (self, other, "DIA_Duke_Negotaite_Trol_Camper_1_11_05"); //Ch³opaki chowaæ ¿elastwo, wracamy ogrzaæ ty³ki w obozie.
   
	AI_RemoveWeapon (CH2_Patrol_g1);	
	AI_RemoveWeapon (CH2_Patrol_g2);	
	AI_RemoveWeapon (CH2_Patrol_g3);	
	AI_RemoveWeapon (CH2_Patrol_g4);	
	AI_RemoveWeapon (CH2_Patrol_g5);	
	AI_TurnToNpc (self, other);
	B_LogEntry(CH2_RBL_GuardCamp, "Przekona³em stra¿ników, piraci te¿ wrócili do obozu. Czas porozmawiaæ z Ratfordem.");

	B_StopProcessInfos(self);
};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Duke_Exit (C_INFO)
{
	npc			= GRD_4061_Guard;
	nr			= 999;
	condition	= DIA_Duke_Exit_Condition;
	information	= DIA_Duke_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Duke_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Duke_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// Za³o¿y³em, ¿e Dick nie da rady sam tych stra¿ników roz³o¿yæ, wiêc je¿eli nie pogada z piratami to stra¿nicy go zaatakuj¹.
// **************************************************

INSTANCE DIA_Duke_Hello (C_INFO)
{
	npc				= GRD_4061_Guard;
	nr				= 1;
	condition		= DIA_Duke_Hello_Condition;
	information		= DIA_Duke_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Duke_Hello_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_IwillBecameHunter))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Duke_Hello_Info()
{
	B_FullStop(other);
	var C_NPC CH2_Patrol_g1; CH2_Patrol_g1 = Hlp_GetNpc(GRD_4056_Guard);
	var C_NPC CH2_Patrol_g2; CH2_Patrol_g2 = Hlp_GetNpc(GRD_4057_Guard);
	var C_NPC CH2_Patrol_g3; CH2_Patrol_g3 = Hlp_GetNpc(GRD_4058_Guard);
	var C_NPC CH2_Patrol_g4; CH2_Patrol_g4 = Hlp_GetNpc(GRD_4059_Guard);
	var C_NPC CH2_Patrol_g5; CH2_Patrol_g5 = Hlp_GetNpc(GRD_4060_Guard);	

	AI_Output (self, other, "DIA_Duke_Hello_11_01"); //Do broni!
	B_FullStop(CH2_Patrol_g1);
	B_FullStop(CH2_Patrol_g2);
	B_FullStop(CH2_Patrol_g3);
	B_FullStop(CH2_Patrol_g4);
	B_FullStop(CH2_Patrol_g5);
	
	B_SmartTurnToNpc	(CH2_Patrol_g1,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g2,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g3,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g4,other);	
	B_SmartTurnToNpc	(CH2_Patrol_g5,other);							
	AI_DrawWeapon(CH2_Patrol_g1);
	AI_DrawWeapon(CH2_Patrol_g2);
	AI_DrawWeapon(CH2_Patrol_g3);
	AI_DrawWeapon(CH2_Patrol_g4);
	AI_DrawWeapon(CH2_Patrol_g5);
	AI_Wait(CH2_Patrol_g1,2);
	AI_Wait(CH2_Patrol_g2,2);
	AI_Wait(CH2_Patrol_g3,2);
	AI_Wait(CH2_Patrol_g4,2);
	AI_Wait(CH2_Patrol_g5,2);	
	AI_Output (self, other, "DIA_Duke_Hello_11_02"); //Zbli¿ siê w³óczêgo - tylko bez gwa³townych ruchów!
	Mdl_ApplyOverlayMds(other,"Humans_Militia.mds");//niech dick wolno podejdzie, tak bêdzie fajniej 
	//Nie w ten sposób
	//TOFIX: Remove sprint ani
	AI_SetWalkmode (other,NPC_WALK);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Duke_Hello_11_03"); //Czego tu szukasz? Tylko pamiêtaj, ¿e od tej odpowiedzi zale¿y Twoje ¿ycie.
	Mdl_RemoveOverlayMds(other,"Humans_Militia.mds");//zmiana ³a¿enia na normalny

	if (Npc_KnowsInfo (hero, DIA_Angus_Patrol1))
	{
		if (dick_patrol_choice == 1)//rozwi¹zanie si³owe
		{
			AI_Output (other, self, "DIA_Duke_Hello_15_04"); //Poczu³em straszny smród i przyszed³em zobaczyæ co tak cuchnie.
			AI_Output (self, other, "DIA_Duke_Hello_11_05"); //Ty skurwielu!
			AI_TurnToNpc(self, CH2_Patrol_g2);
			AI_Output (self, other, "DIA_Duke_Hello_11_06"); //S³yszeliœcie to! Ten pastuch owiec nas obra¿a!
			AI_TurnToNpc(self, other);
			patrol_trial = 2;
			/**************************
	Stra¿nicy maj¹ siê patrzeæ na dicka, ¿eby potem piraci mogli niepostrze¿enie zajœæ ich od ty³u
	**************************/
			AI_TurnToNpc(CH2_Patrol_g1, other);
			AI_TurnToNpc(CH2_Patrol_g2, other);
			AI_TurnToNpc(CH2_Patrol_g3, other);
			AI_TurnToNpc(CH2_Patrol_g4, other);
			AI_TurnToNpc(CH2_Patrol_g5, other);
			AI_Output (self, other, "DIA_Duke_Hello_11_07"); //Zap³acisz za to krwi¹, durniu.
			AI_Output (other, self, "DIA_Duke_Hello_15_08"); //Nie s¹dzê!

			B_LogEntry(CH2_RBL_GuardCamp, "Szkoda s³ów na tych sukinsynów, czas skopaæ im ty³ki!");
			B_StopProcessInfos(self);

			/*****************************
	Stra¿nicy s¹ odwróceni ty³em do piratów, Ci podchodz¹ i 
	zajmuj¹ dogodne stanowiska do ataku za nimi - mo¿e ma³¹ kamerkê by tu zrobiæ?
	******************************/
		} 
		else if (dick_patrol_choice == 2)
		{
			/*******************
	Mo¿e daæ warunek, ¿e jak dick nosi pancerz rebeliantów to stra¿nicy nie daj¹ siê zrobiæ w ciula i go atakuj¹?
	********************/
			AI_Output (other, self, "DIA_Duke_Hello_15_09"); //Widzia³em rebeliantów...
			AI_Output (self, other, "DIA_Duke_Hello_11_10"); //Co?! Ilu i gdzie?
			AI_Output (other, self, "DIA_Duke_Hello_15_11"); //Tylko dwóch, k³ócili siê o rzeczy zabitego stra¿nika.
			AI_Output (self, other, "DIA_Duke_Hello_11_12"); //Niech to szlag trafi. Gdzie oni s¹?
			AI_Output (other, self, "DIA_Duke_Hello_15_13"); //To niedaleko, zaprowadzê was.
			AI_Output (self, other, "DIA_Duke_Hello_11_14"); //Tylko nic nie kombinuj, bo ze¿resz mój miecz!
			AI_Output (other, self, "DIA_Duke_Hello_15_15"); //Nie jestem idiot¹, przecie¿ jest was szeœciu.
			AI_Output (self, other, "DIA_Duke_Hello_11_16"); //Ruszaj!
			patrol_trial = 4;
			/**************
	Ork dodaj te rutyny stra¿nikom i przygotuj jakieœ fajne miejsce na zasadzkê, gdzie w pobli¿u czekaj¹ piraci
	**************/
			B_LogEntry(CH2_RBL_GuardCamp, "Stra¿nicy po³knêli przynêtê i pójd¹ za mn¹ prosto w zasadzkê - mam nadziejê, ¿e Angus i ch³opaki tego nie skrewi¹.");
			B_StopProcessInfos(self);
			B_MisPatrolGRDChoiceTrap();
		}
		else if (dick_patrol_choice == 3)
		{
			AI_Output (other, self, "DIA_Duke_Hello_15_17"); //Na waszym miejscu bra³bym st¹d nogi za pas.
			AI_Output (self, other, "DIA_Duke_Hello_11_18"); //Nie b¹dŸ œmieszny. Po co ja w ogóle z Tob¹ rozmawiam? Ch³opaki zabijcie tego...
			AI_Output (other, self, "DIA_Duke_Hello_15_19"); //Zaczekaj, mam pewne informacje!
			patrol_trial = 5;
			B_LogEntry		(CH2_RBL_GuardCamp, "Spróbujê przekonaæ stra¿ników, ¿eby odeszli.");
			DIA_Duke_Negotaite_Info();
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Duke_Hello_15_20"); //Poczu³em straszny smród i przyszed³em zobaczyæ, co tak cuchnie.
		AI_Output (self, other, "DIA_Duke_Hello_11_21"); //Ty skurwielu!
		AI_TurnToNpc(self, CH2_Patrol_g2);
		AI_Output (self, other, "DIA_Duke_Hello_11_22"); //S³yszeliœcie to! Ten pastuch owiec nas obra¿a!
		AI_TurnToNpc(self, other);
		patrol_trial = 1;
		AI_TurnToNpc(CH2_Patrol_g1, other);
		AI_TurnToNpc(CH2_Patrol_g2, other);
		AI_TurnToNpc(CH2_Patrol_g3, other);
		AI_TurnToNpc(CH2_Patrol_g4, other);
		AI_TurnToNpc(CH2_Patrol_g5, other);
		AI_Output (self, other, "DIA_Duke_Hello_11_23"); //Zap³acisz za to krwi¹ durniu.
		AI_Output (other, self, "DIA_Duke_Hello_15_24"); //Nie s¹dzê!
		B_LogEntry(CH2_RBL_GuardCamp, "Obrzuci³em stra¿ników obelgami - teraz muszê 'tylko' ich zabiæ.");

		B_StopProcessInfos(self);

		B_MisSetPatrolGRDToHostile();	
	};
};

/**************************************************/


// INSTANCE DIA_Duke_Trap (C_INFO)
// {
// 	npc				= GRD_4061_Guard;
// 	nr				= 2;
// 	condition		= DIA_Duke_Trap_Condition;
// 	information		= DIA_Duke_Trap_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= ""; 
// };

// FUNC INT DIA_Duke_Trap_Condition()
// {

//	if (patrol_trial == 4)&&(Npc_GetDistToWP (self,"LOCATION_15_IN_2") < 600 )//jak zbli¿¹ siê do zasadzki
// 	{
// 		return 1;
// 	};


// // };

// FUNC VOID DIA_Duke_Trap_Info()
// {


// 	patrol_trial = 3;
// 	var C_NPC hank; hank = Hlp_GetNpc(PIR_2601_Hank);
// 	var C_NPC angus; angus = Hlp_GetNpc(PIR_2600_Angus);
// 	var C_NPC rodney; rodney = Hlp_GetNpc(PIR_2602_Rodney);		
// 	Npc_SetAivar(angus,AIV_PARTYMEMBER,		TRUE);
// 	Npc_SetAivar(hank,AIV_PARTYMEMBER,		TRUE);
// 	Npc_SetAivar(rodney,AIV_PARTYMEMBER,		TRUE);
// 	AI_DrawWeapon(angus);
// 	AI_DrawWeapon(rodney);
// 	AI_DrawWeapon(hank);
// 	AI_Output (self, NULL, "DIA_Duke_Trap_11_01"); //To pu³apka! Zabiæ tego skurwiela!

// 	B_LogEntry		(CH2_RBL_GuardCamp, "Stra¿nicy wpadli w zasadzkê - czas skoñczyæ tê farsê.");
// 	B_StopProcessInfos	(self);

// 	/***********
// 	Atak w miejscu zasadzki
// 	***********/

// 			
// 		B_ExchangeRoutine(hank,"InHC");
// 		B_ExchangeRoutine(rodney,"InHC");
// 		B_ExchangeRoutine(angus,"InHC");
// 	B_MisSetPatrolGRDToHostile();			
// };



/**************************************************/


// INSTANCE DIA_Duke_Negotaite (C_INFO)
// {
// 	npc				= GRD_4061_Guard;
// 	nr				= 3;
// 	condition		= DIA_Duke_Negotaite_Condition;
// 	information		= DIA_Duke_Negotaite_Info;
// 	permanent		= 0;
// 	important		= 1;
// 	description		= ""; 
// };

// FUNC INT DIA_Duke_Negotaite_Condition()
// {

// 	if (patrol_trial == 5)
// 	{
// 		return 1;
// 	};


// };
