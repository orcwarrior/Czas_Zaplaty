
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Spider_Exit (C_INFO)
{
	npc			= VLK_4082_Spider;
	nr			= 999;
	condition	= DIA_Spider_Exit_Condition;
	information	= DIA_Spider_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Spider_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Spider_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					
// **************************************************


INSTANCE DIA_Spider_First (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 1;
	condition		= DIA_Spider_First_Condition;
	information		= DIA_Spider_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Spider_First_Condition()
{

	if (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};


};

FUNC VOID DIA_Spider_First_Info()
{


	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Spider_First_11_01"); //Paj¹ki... S³yszê tupot ich nó¿ek... Wo³aj¹ mnie...
	AI_Output (other, self, "DIA_Spider_First_15_02"); //O czym ty gadasz?
	AI_Output (self, other, "DIA_Spider_First_11_03"); //Sieæ... Zimna i wilgotna... Wysysa ¿ycie i krew... Paj¹ki s¹ wszêdzie!
	AI_Output (other, self, "DIA_Spider_First_15_04"); //Cholerny œwir!
	B_StopProcessInfos	(self );
};



// **************************************************


INSTANCE DIA_Spider_Escape (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 2;
	condition		= DIA_Spider_Escape_Condition;
	information		= DIA_Spider_Escape_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno wiesz coœ o wyjœciu?"; 
};

FUNC INT DIA_Spider_Escape_Condition()
{

	if (Npc_KnowsInfo (hero, DIA_Krzywy_First))
	{
		return 1;
	};


};

FUNC VOID DIA_Spider_Escape_Info()
{
	AI_Output (other, self, "DIA_Spider_Escape_15_00"); //Podobno wiesz coœ o wyjœciu?
	AI_Output (self, other, "DIA_Spider_Escape_11_01"); //Tylko paj¹ki znaj¹ prawdê! Ich zapytaj...
	AI_Output (other, self, "DIA_Spider_Escape_15_02"); //Jakie paj¹ki?
	AI_Output (self, other, "DIA_Spider_Escape_11_03"); //Te, które chodz¹ po wodzie.

	Info_ClearChoices (DIA_Spider_Escape);
	Info_AddChoice (DIA_Spider_Escape, "Jak mam zapytaæ... paj¹ka?", DIA_Spider_Escape_Ask);
	Info_AddChoice (DIA_Spider_Escape, "Gdzie jest to wyjœcie?", DIA_Spider_Where);
	Info_AddChoice (DIA_Spider_Escape, "Zwariowa³eœ?", DIA_Spider_Mad);
	Info_AddChoice (DIA_Spider_Escape, "Mów, albo zginiesz!", DIA_Spider_Die);
};

// --------------------------ask----------------------------------------

FUNC VOID DIA_Spider_Escape_Ask()
{
	AI_Output (other, self, "DIA_Spider_Escape_Ask_15_01"); //Jak mam zapytaæ... paj¹ka?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_11_02"); //One wiedz¹ wszystko!
	AI_Output (other, self, "DIA_Spider_Escape_Ask_15_03"); //Ale jak pytaæ?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_11_04"); //Patrz i obserwuj! Paj¹ki powiedz¹ Ci prawdê. Poka¿¹ Ci j¹...
	Info_ClearChoices (DIA_Spider_Escape);
	Info_AddChoice (DIA_Spider_Escape, "Jak zadaæ to pieprzone pytanie?!", DIA_Spider_Escape_Ask_How);
	Info_AddChoice (DIA_Spider_Escape, "Zwariowa³eœ?", DIA_Spider_Mad);
	Info_AddChoice (DIA_Spider_Escape, "Mów, albo zginiesz!", DIA_Spider_Die);
};


// -------------------------mad----------------------------------------

FUNC VOID DIA_Spider_Mad()
{
	AI_Output (other, self, "DIA_Spider_Mad_15_01"); //Zwariowa³eœ?
	AI_Output (self, other, "DIA_Spider_Mad_11_02"); //Tylko paj¹ki znaj¹ prawdê... Tylko one...
	//Info_ClearChoices (DIA_Spider_Escape);
};


// -------------------------die----------------------------------------

FUNC VOID DIA_Spider_Die()
{
	AI_Output (other, self, "DIA_Spider_Die_15_01"); //Mów, albo zginiesz!
	AI_Output (self, other, "DIA_Spider_Die_11_02"); //Zapytaj paj¹ków... Mo¿e zdradz¹ Ci prawdê...
	//Info_ClearChoices (DIA_Spider_Escape);
};


// -------------------------where----------------------------------------

FUNC VOID DIA_Spider_Where()
{
	AI_Output (other, self, "DIA_Spider_Where_15_01"); //Gdzie jest to wyjœcie?
	AI_Output (self, other, "DIA_Spider_Where_11_02"); //Tam gdzie woda... Obserwuj paj¹ki... Podziwiaj ich taniec...
	B_LogEntry		(CH2_NON_Deep, "Woda? Paj¹ki? Ten Paj¹k to prawdziwy œwir!");
	//Info_ClearChoices (DIA_Spider_Escape);
};

// -----------------------------------------------------------------

FUNC VOID DIA_Spider_Escape_Ask_How()
{
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_01"); //Jak zadaæ to pieprzone pytanie?!
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_02"); //Cholera, aleœ Ty uparty!
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_03"); //To ty nie jesteœ œwirem?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_04"); //Nie jestem idioto! Ale dziêki temu nikt nie zmusza mnie do pracy, nie bije i nie próbuje mnie zjeœæ.
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_05"); //Czego Ty ode mnie chcesz?
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_06"); //Krzywy powiedzia³, ¿e mówi³eœ coœ o wyjœciu z G³êbi. Co wiesz?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_07"); //Niewiele. Ale mam pewne podejrzenia...
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_08"); //Mów do cholery!
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_09"); //Mia³em kiedyœ kumpla. Mówiliœmy na niego Wydra, bo œwietnie p³ywa³.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_10"); //I co z tego?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_11"); //Koleœ upar³ siê, ¿e podwodne tunele musz¹ prowadziæ na powierzchniê.
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_12"); //Pewnego dnia rozebra³ siê do golizny, wzi¹³ spory wdech i skoczy³ do wody.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_13"); //I?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_14"); //No i tyle go widzieliœmy.
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_15"); //Uda³o mu siê?
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_16"); //A sk¹d mam to wiedzieæ? Nigdy nie wróci³. Ale kto wie...
	AI_Output (other, self, "DIA_Spider_Escape_Ask_How_15_17"); //Hmm... Mo¿e ten tunel jednak prowadzi ku wolnoœci...
	AI_Output (self, other, "DIA_Spider_Escape_Ask_How_11_18"); //Byæ mo¿e. A teraz daj mi poudawaæ œwira w spokoju...
	B_LogEntry		(CH2_NON_Deep, "Paj¹k nie jest jednak œwirem, ale œwietnie go udaje. Powiedzia³ mi coœ ciekawego. Podobno kiedyœ jeden ze skazañców skoczy³ do wody, by³ pewien, ¿e podwodny tunel prowadzi na zewn¹trz. Jedynym sposobem, ¿eby to sprawdziæ jest pójœæ w jego œlady...");
	Info_ClearChoices (DIA_Spider_Escape);
	B_StopProcessInfos	(self );
}; 

// **************************************************

INSTANCE DIA_Spider_Escape2 (C_INFO)
{
	npc				= VLK_4082_Spider;
	nr				= 2;
	condition		= DIA_Spider_Escape2_Condition;
	information		= DIA_Spider_Escape2_Info;
	permanent		= 0;
	important		= 0;
	description		= "O co chodzi z tymi paj¹kami?"; 
};

FUNC INT DIA_Spider_Escape2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Spider_Escape))
	{
		return 1;
	};
};

FUNC VOID DIA_Spider_Escape2_Info()
{
	AI_Output (other, self, "DIA_Spider_Escape2_15_01"); //O co chodzi z tymi paj¹kami?
	AI_Output (self, other, "DIA_Spider_Escape2_11_02"); //A jak myœlisz?
	AI_Output (self, other, "DIA_Spider_Escape2_11_03"); //Nikt nie zapuszcza siê g³êbiej w tunele, bo tam a¿ siê roi od tych skurwieli.		
	AI_Output (other, self, "DIA_Spider_Escape2_15_04"); //Mo¿e tam jest wyjœcie?
	AI_Output (self, other, "DIA_Spider_Escape2_11_05"); //W¹tpiê, ¿eby ktoœ tam wszed³ i po¿y³ wystarczaj¹co d³ugo, aby o tym opowiedzieæ.
	AI_Output (self, other, "DIA_Spider_Escape2_11_06"); //Ale mo¿esz spróbowaæ, zostanie wiêcej szczurów dla nas.
	AI_Output (other, self, "DIA_Spider_Escape2_15_07"); //Dlaczego?
	AI_Output (self, other, "DIA_Spider_Escape2_11_08"); //Bo umarli nie musz¹ jeœæ.
	AI_Output (other, self, "DIA_Spider_Escape2_15_09"); //Aleœ ty zabawny.
	AI_Output (self, other, "DIA_Spider_Escape2_11_10"); //Jak nie chcesz mnie zabiæ, to zejdŸ mi z oczu. Mam sporo do przemyœlenia...
};