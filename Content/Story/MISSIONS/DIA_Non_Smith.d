
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_SmithX_EXIT(C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 999;
	condition			= Info_SmithX_EXIT_Condition;
	information			= Info_SmithX_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_SmithX_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SmithX_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_SmithX_Hello (C_INFO)
{
	npc		= Grd_631_Smith;
	nr			= 1;
	condition		= Info_SmithX_Hello_Condition;
	information		= Info_SmithX_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Jesteœ kowalem?";
};                       

FUNC INT Info_SmithX_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_SmithX_Hello_Info()
{	

	AI_Output (other, self,"Info_SmithX_Hello_15_00"); //Jesteœ kowalem?
	AI_Output (self, other,"Info_SmithX_Hello_06_01"); //Nie, trudniê siê nierz¹dem, a fartuch to tylko przykrywka.
	AI_Output (other, self,"Info_SmithX_Hello_15_02"); //Ekhm...
	AI_Output (self, other,"Info_SmithX_Hello_06_03"); //Pewnie, ¿e jestem kowalem! 
	AI_Output (self, other,"Info_SmithX_Hello_06_04"); //Dlaczego zagl¹daj¹ tu tylko idioci?
};




// ************************************************************

INSTANCE Info_SmithX_Again (C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 2;
	condition		= Info_SmithX_Again_Condition;
	information		= Info_SmithX_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Zna³eœ niemowê?";
};                       

FUNC INT Info_SmithX_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_SmithX_Hello))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_SmithX_Again_Info()
{	
	AI_Output (other, self,"Info_SmithX_Again_15_01"); //Zna³eœ niemowê?
	AI_Output (self, other,"Info_SmithX_Again_06_02"); //Tak, czasem pomaga³ mi w kuŸni. A co Tobie do tego?
	AI_Output (other, self,"Info_SmithX_Again_15_03"); //Szkoda go. Georg nie musia³ go zabijaæ...
	AI_Output (self, other,"Info_SmithX_Again_06_04"); //Wtedy Znamiê zabi³by Niê. W¹tpiê, ¿e Hrabia by³by szczêœliwy z tego powodu.
	AI_Output (self, other,"Info_SmithX_Again_06_05"); //Wolê nie myœleæ, co wtedy by nas czeka³o...

	B_LogEntry		(CH4_Non_Eagle, "Kowal uwa¿a, ¿e œmieræ niemowy to mniejsze z³o. Gdyby coœ sta³o siê Nii, Hrabia rozpêta³by w GnieŸdzie prawdziwe piek³o.");
};



// ************************************************************

INSTANCE Info_SmithX_Again1 (C_INFO)
{
	npc			= Grd_631_Smith;
	nr			= 2;
	condition		= Info_SmithX_Again1_Condition;
	information		= Info_SmithX_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Chcia³em o coœ zapytaæ...";
};                       

FUNC INT Info_SmithX_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_SmithX_Again1_Info()
{	
	AI_Output (other, self,"Info_SmithX_Again1_15_01"); //Chcia³em o coœ zapytaæ...
	AI_Output (self, other,"Info_SmithX_Again1_06_02"); //Nie musisz koñczyæ. Wiem, do czego zmierzasz.
	AI_Output (self, other,"Info_SmithX_Again1_06_03"); //Dosz³y mnie s³uchy, ¿e namawiasz ch³opaków na nocne harce. Ale beze mnie.
	AI_Output (self, other,"Info_SmithX_Again1_06_04"); //Nie mam zamiaru wchodziæ w drogê Krisowi.
	B_LogEntry		(CH4_Non_Eagle, "Kowal nie bêdzie w tym uczestniczy³.");
	B_StopProcessInfos	(self);

}; 
