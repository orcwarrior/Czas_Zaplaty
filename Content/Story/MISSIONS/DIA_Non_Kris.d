
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Kris_EXIT(C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 999;
	condition			= Info_Kris_EXIT_Condition;
	information			= Info_Kris_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Kris_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Kris_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Kris_Hello (C_INFO)
{
	npc		= Grd_610_Gardist;
	nr			= 1;
	condition		= Info_Kris_Hello_Condition;
	information		= Info_Kris_Hello_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Henger_Again))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Kris_Hello_Info()
{	

	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Kris_Hello_07_01"); //I wtedy Nia dziwnie na niego spojrza³a...
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Hello_07_02"); //Coœ Ty za jeden?
	AI_GotoNpc(other,self);
	AI_Output (other, self,"Info_Kris_Hello_15_03"); //Wisielec powiedzia³, ¿e mam pogadaæ z jakimœ Krisem. Znasz go?
	AI_Output (self, other,"Info_Kris_Hello_07_04"); //Doœæ dobrze. To wredny sukinsyn, do tego nie lubi jak obcy wêsz¹ gdzie nie powinni.
	AI_Output (other, self,"Info_Kris_Hello_15_05"); //Chcia³em siê tylko rozejrzeæ...
	AI_Output (self, other,"Info_Kris_Hello_07_06"); //To nie takie proste. Nikt kto wchodzi do Gniazda, nie wychodzi bez zgody Krisa.
	AI_PlayAni ( other, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (other, self,"Info_Kris_Hello_15_07"); //To jakiœ obóz pracy?
	AI_Output (self, other,"Info_Kris_Hello_07_08"); //Pos³uchaj, ch³opcze. Nikt tutaj nie lubi wêsz¹cych psów. A Ty jesteœ obcym kundlem w stadzie wilków.
	AI_Output (self, other,"Info_Kris_Hello_07_09"); //Czy wyrazi³em siê wystarczaj¹co klarownie?
	AI_Output (other, self,"Info_Kris_Hello_15_10"); //Spokojnie...
	AI_Output (self, other,"Info_Kris_Hello_07_11"); //Zamknij siê!
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Kris_Hello_07_12"); //Co siê dzieje Pinto?
	B_StopProcessInfos	(self);
	AI_GotoNpc(pinto, self);

	/******************************
Ma podejœæ do dicka i krisa
******************************/


};



// ************************************************************

INSTANCE Info_Kris_Hello1 (C_INFO)
{
	npc		= Grd_610_Gardist;
	nr			= 2;
	condition		= Info_Kris_Hello1_Condition;
	information		= Info_Kris_Hello1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Pinto_Hello))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Kris_Hello1_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_Output (self, other,"Info_Kris_Hello1_07_01"); //Dobry pomys³.
	AI_Output (self, other,"Info_Kris_Hello1_07_02"); //Poszukaj Nii, pomo¿esz jej z umarlakami. Idealnie nadajesz siê do na duszo³apa.
	AI_Output (other, self,"Info_Kris_Hello1_15_03"); //Nie mam zamiaru...
	AI_Output (self, other,"Info_Kris_Hello1_07_04"); //Je¿eli chcesz ¿yæ, to rób to co mówiê. Wystarczy, ¿e splunê, a ch³opcy pochlastaj¹ tê Twoj¹ piêkn¹ twarzyczkê.
	AI_Output (self, other,"Info_Kris_Hello1_07_05"); //Zrozumia³eœ?
	AI_Output (other, self,"Info_Kris_Hello1_15_06"); //Tak.
	AI_Output (self, other,"Info_Kris_Hello1_07_07"); //A teraz spieprzaj.
	B_LogEntry		(CH4_Non_Eagle, "Kris to kawa³ sukinsyna, to on rz¹dzi w Orlim GnieŸdzie. Pinto te¿ wygl¹da na kogoœ komu nie warto wchodziæ w drogê. Mam poszukaæ jakiejœ Nii i pomóc jej z umarlakami - cokolwiek to znaczy.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"start");

};

// ************************************************************

INSTANCE Info_Kris_Hello2 (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Hello2_Condition;
	information		= Info_Kris_Hello2_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Hello2_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello1))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};

FUNC VOID Info_Kris_Hello2_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Hello2_07_01"); //Aha. I jeszcze jedno.
	AI_Output (self, other,"Info_Kris_Hello2_07_02"); //Trzymaj r¹czki przy sobie.
	AI_Output (self, other,"Info_Kris_Hello2_07_03"); //Nia to kobieta szefa. Tkniesz j¹, to Georg skrêci Ci kark.
	AI_Output (self, other,"Info_Kris_Hello2_07_04"); //A teraz spadaj mi z oczu.
	B_LogEntry		(CH4_Non_Eagle, "Nia to kobieta szefa, pewnie Kris mia³ na myœli Hrabiego. A Georg to chyba jej ochroniarz. Cholera, po co ja tu przylaz³em?");
	B_StopProcessInfos	(self);


	/***************************
Niê powinna staæ przy ³ó¿ku na którym le¿y niewolnik nazwany: Ranny Cz³owiek. To jego instancja: SLV_640_Slave

Zrób tak bo ja to uwzglêdniam w skryptach
***************************/

};




// ************************************************************

INSTANCE Info_Kris_Helllo2 (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Helllo2_Condition;
	information		= Info_Kris_Helllo2_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia³em o coœ zapytaæ.";
};                       

FUNC INT Info_Kris_Helllo2_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello))
	{
		return 1;
	};

};

FUNC VOID Info_Kris_Helllo2_Info()
{	
	AI_Output (other, self,"Info_Kris_Helllo2_15_01"); //Chcia³em o coœ zapytaæ.
	AI_Output (self, other,"Info_Kris_Helllo2_07_02"); //Chyba mnie nie zrozumia³eœ.
	AI_Output (self, other,"Info_Kris_Helllo2_07_03"); //Wypierdalaj!
	B_StopProcessInfos	(self);

};

// ************************************************************

INSTANCE Info_Kris_Fin (C_INFO)
{
	npc			= Grd_610_Gardist;
	nr			= 3;
	condition		= Info_Kris_Fin_Condition;
	information		= Info_Kris_Fin_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kris_Fin_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_Watch1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID Info_Kris_Fin_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Kris_Fin_07_01"); //A oto i chêdo¿ony w dupê bohater!
	AI_Output (self, other,"Info_Kris_Fin_07_02"); //Masz szczêœcie gnido, ¿e Pinto za Ciebie poœwiadczy³.
	AI_Output (self, other,"Info_Kris_Fin_07_03"); //Z chêci¹ wypru³bym Ci flaki, ale wtedy Hrabia by mi ³eb urwa³.
	AI_Output (self, other,"Info_Kris_Fin_07_04"); //ZejdŸ mi z oczu i nigdy tu nie wracaj!
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,"START");	
}; 
