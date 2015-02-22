// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 				Hello (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Hello (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Hello_Condition;
	information		= DIA_Grim_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co robisz?";
};

FUNC INT DIA_Grim_Hello_Condition()
{	

	return 1;


};

FUNC VOID DIA_Grim_Hello_Info()
{
	AI_Output (other, self,"DIA_Grim_Hello1_15_01"); //Co robisz?
	AI_Output (self, other,"DIA_Grim_Hello1_06_02"); //Kontemplujê uroki obozowego ¿ycia. 
	AI_Output (self, other,"DIA_Grim_Hello1_06_03"); //Nigdy Ciê tu nie widzia³em.
	AI_Output (other, self,"DIA_Grim_Hello1_15_04"); //Jestem tu od niedawna.
	AI_Output (self, other,"DIA_Grim_Hello1_06_05"); //To ciekawe... Muszê wracaæ do swojej roboty.
};

// **************************************************

INSTANCE DIA_Grim_Rebel (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Rebel_Condition;
	information		= DIA_Grim_Rebel_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam dla Ciebie propozycjê.";
};

FUNC INT DIA_Grim_Rebel_Condition()
{	

	if (Npc_KnowsInfo (hero,DIA_Grim_Hello))&&(Npc_KnowsInfo (hero,DIA_Urt_Packages)) 
	{
		return 1;
	};


};

FUNC VOID DIA_Grim_Rebel_Info()
{
	//1500 rudy? iksde
	AI_Output (other, self,"DIA_Grim_Rebel_15_01"); //Mam dla Ciebie propozycjê.
	AI_Output (self, other,"DIA_Grim_Rebel_06_02"); //Pamiêtaj, ¿e rozmawiasz z by³ym kopaczem, wiêc uwa¿aj na s³owa. Ciê¿ko pracowa³em na zbrojê stra¿nika i nie mam zamiaru znowu trafiæ do kopalni.
	AI_Output (other, self,"DIA_Grim_Rebel_15_03"); //Nie jestem stra¿nikiem. Jestem jednym z rebeliantów. Nied³ugo uderzymy na Stary Obóz i chcê przekonaæ kopaczy do wspólnej walki.
	AI_Output (self, other,"DIA_Grim_Rebel_06_04"); //Mówisz powa¿nie? Cz³owieku przecie¿ to szaleñstwo!
	AI_Output (other, self,"DIA_Grim_Rebel_15_05"); //By³eœ kiedyœ kopaczem, wiesz, jak stra¿nicy traktuj¹ Twych dawnych braci. Pewnie sam nie raz dosta³eœ po mordzie.
	AI_Output (other, self,"DIA_Grim_Rebel_15_06"); //Dajê Ci szansê, ¿eby odp³aciæ im tym samym. Co ty na to?
	AI_Output (self, other,"DIA_Grim_Rebel_06_07"); //To spore ryzyko... Sam nie wiem. Poza tym, ¿eby porozmawiaæ ze wszystkimi kopaczami muszê przekupiæ kilku stra¿ników.
	AI_Output (other, self,"DIA_Grim_Rebel_15_08"); //Ile potrzebujesz?
	AI_Output (self, other,"DIA_Grim_Rebel_06_09"); //Co najmniej 200... 300 bry³ek powinno wystarczyæ.
	AI_Output (other, self,"DIA_Grim_Rebel_15_10"); //Coœ mi siê wydaje, ¿e nie tylko stra¿nicy na tym zarobi¹.
	AI_Output (self, other,"DIA_Grim_Rebel_06_11"); //Wszystko kosztuje rebeliancie. Chcesz mieæ mój g³os i poparcie, to p³aæ.
};

// **************************************************

INSTANCE DIA_Grim_Ore (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_Ore_Condition;
	information		= DIA_Grim_Ore_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam rudê.";
};

FUNC INT DIA_Grim_Ore_Condition()
{	

	if (Npc_KnowsInfo (hero,DIA_Grim_Rebel))&& (NPC_HasItems(other,ItMiNugget)>=300)
	{
		return 1;
	};


};

FUNC VOID DIA_Grim_Ore_Info()
{
	B_GiveXP(250);
	buddler_join = buddler_join + 1;
	AI_Output (other, self,"DIA_Grim_Ore_15_01"); //Mam rudê.
	AI_Output (self, other,"DIA_Grim_Ore_06_02"); //To œwietnie. Natychmiast z niej skorzystam.
	B_GiveInvItems (other, self, ItMiNugget, 300);
	AI_Output (self, other,"DIA_Grim_Ore_06_03"); //Masz moje poparcie. Nied³ugo ulice Starego Obozu sp³yn¹ krwi¹ stra¿ników.
	B_LogEntry		(CH3_RBL_Buddler, "Grim bêdzie walczy³ przeciwko stra¿nikom.");
	B_StopProcessInfos	(self);
}; 
