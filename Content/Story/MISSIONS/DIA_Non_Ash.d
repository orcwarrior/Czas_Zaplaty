
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Ash_EXIT(C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 999;
	condition			= Info_Ash_EXIT_Condition;
	information			= Info_Ash_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Ash_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Ash_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Ash_Hello (C_INFO)
{
	npc		= Grd_617_Gardist;
	nr			= 1;
	condition		= Info_Ash_Hello_Condition;
	information		= Info_Ash_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co robisz?";
};                       

FUNC INT Info_Ash_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Ash_Hello_Info()
{	
	AI_Output (other, self,"Info_Ash_Hello_15_00"); //Co robisz?
	AI_Output (self, other,"Info_Ash_Hello_06_01"); //Gotujê, idioto.
};




// ************************************************************

INSTANCE Info_Ash_Again (C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 2;
	condition		= Info_Ash_Again_Condition;
	information		= Info_Ash_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Wiesz kto to Znamiê?";
};                       

FUNC INT Info_Ash_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ash_Hello))&&(Npc_KnowsInfo (hero, Info_Nia_Def1)) 
	{
		return 1;
	};

};
FUNC VOID Info_Ash_Again_Info()
{	
	investigation = investigation + 1;
	AI_Output (other, self,"Info_Ash_Again_15_01"); //Wiesz kto to Znamiê?
	AI_Output (self, other,"Info_Ash_Again_06_02"); //To ten idiota, którego zabi³ Georg. A co Ci do tego?
	AI_Output (other, self,"Info_Ash_Again_15_03"); //Nie wydaje Ci siê dziwne, ¿e niemowa rzuci³ siê na Niê nie zwa¿aj¹c na Georga?
	AI_Output (self, other,"Info_Ash_Again_06_04"); //Mia³ nie po kolei w g³owie, co w tym dziwnego? 
	AI_Output (self, other,"Info_Ash_Again_06_05"); //Jedni siê wieszaj¹, inni skacz¹ z murów na g³owê, a jeszcze inni rzucaj¹ siê na zabijaków jak Georg.
	AI_Output (self, other,"Info_Ash_Again_06_06"); //Chcia³ umrzeæ i tyle.
	AI_Output (other, self,"Info_Ash_Again_15_07"); //Wygl¹da³ jakby...
	AI_Output (self, other,"Info_Ash_Again_06_08"); //Pos³uchaj. Gówno mnie obchodzi jak wygl¹da³ Znamiê i dlaczego da³ siê pochlastaæ.
	AI_Output (self, other,"Info_Ash_Again_06_09"); //W GnieŸdzie s³uchasz Hrabiego i Krisa, albo Ciê nie ma.
	AI_Output (self, other,"Info_Ash_Again_06_10"); //Czy teraz wyrazi³em siê jasno?
	AI_Output (other, self,"Info_Ash_Again_15_11"); //Ale co to ma wspólnego ze œmierci¹ niemowy?
	AI_Output (self, other,"Info_Ash_Again_06_12"); //A jak myœlisz kto mu uchlasta³ ozor?
	AI_Output (other, self,"Info_Ash_Again_15_13"); //Kris...
	AI_Output (self, other,"Info_Ash_Again_06_14"); //Znamiê za bardzo nim mieli³. Zbyt g³oœno mówi³, ¿e Nia to dziwka, która daje dupy ka¿demu kto ma w³adzê.
	AI_Output (self, other,"Info_Ash_Again_06_15"); //Ale to nie moja sprawa i dobrze Ci radzê, ¿ebyœ za du¿o nie niucha³.
	AI_PlayAni(other,"T_YES");
	B_LogEntry		(CH4_Non_Eagle, "Œmieræ niemowy da³a mi trochê do myœlenia. Kucharz Ash powiedzia³ coœ ciekawego. Znamiê straci³ jêzyk, bo za g³oœno krytykowa³ Niê i to z kim sypia. Kris to bezwzglêdny cz³owiek, a przede wszystkim zaufany Hrabiego, muszê na niego uwa¿aæ.");
};



// ************************************************************

INSTANCE Info_Ash_Again1 (C_INFO)
{
	npc			= Grd_617_Gardist;
	nr			= 2;
	condition		= Info_Ash_Again1_Condition;
	information		= Info_Ash_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam do Ciebie proœbê.";
};                       

FUNC INT Info_Ash_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Ash_Again1_Info()
{	
	AI_Output (other, self,"Info_Ash_Again1_15_01"); //Mam do Ciebie proœbê.
	AI_Output (self, other,"Info_Ash_Again1_06_02"); //Jak¹, ch³optasiu?
	AI_Output (other, self,"Info_Ash_Again1_15_03"); //Spotkam siê z Ni¹, Pinto ukryje siê w cieniu. 
	AI_Output (other, self,"Info_Ash_Again1_15_04"); //Potrzebujê jeszcze kilku œwiadków, ¿eby Kris nie mia³ wyboru.
	AI_Output (other, self,"Info_Ash_Again1_15_05"); //Musimy pozbyæ siê tej krwio¿erczej dziwki!
	AI_Output (self, other,"Info_Ash_Again1_06_06"); //Na mnie nie licz. Nie mam zamiaru zadzieraæ z Krisem.
	AI_Output (self, other,"Info_Ash_Again1_06_07"); //Poza tym mêsko-kobiece igraszki budz¹ we mnie odrazê!
	AI_Output (self, other,"Info_Ash_Again1_06_08"); //Nie ma to jak dwa umiêœnione cia³a, ow³osione torsy splecione w...
	AI_Output (other, self,"Info_Ash_Again1_15_09"); //Ekhm. Chyba ju¿ sobie pójdê, bywaj.
	B_LogEntry		(CH4_Non_Eagle, "Na Asha nie mogê liczyæ. I w ogóle lepiej siê do niego nie odwracaæ ty³em.");

}; 
