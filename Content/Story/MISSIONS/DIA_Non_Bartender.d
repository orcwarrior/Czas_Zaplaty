
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Bartender_EXIT(C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 999;
	condition			= Info_Bartender_EXIT_Condition;
	information			= Info_Bartender_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Bartender_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bartender_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Bartender_Hello (C_INFO)
{
	npc		= Grd_657_Gardist;
	nr			= 1;
	condition		= Info_Bartender_Hello_Condition;
	information		= Info_Bartender_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Czym siê zajmujesz?";
};                       

FUNC INT Info_Bartender_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Bartender_Hello_Info()
{	

	AI_Output (other, self,"Info_Bartender_Hello_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"Info_Bartender_Hello_06_01"); //Sprzedajê najlepsz¹ ry¿ówkê w tej zapad³ej dziurze.

};




// ************************************************************

INSTANCE Info_Bartender_Again (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 2;
	condition		= Info_Bartender_Again_Condition;
	information		= Info_Bartender_Again_Info;
	important		= 0;
	permanent		= 1;
	description 		= "Przep³uka³bym gard³o.";
	trade 			= 1;
};                       

FUNC INT Info_Bartender_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Hello))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Again_Info()
{	
	AI_Output (other, self,"Info_Bartender_Again_15_01"); //Przep³uka³bym gard³o.
	AI_Output (self, other,"Info_Bartender_Again_06_02"); //Je¿eli tylko masz rudê...
};



// ************************************************************

INSTANCE Info_Bartender_Stigma (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 3;
	condition		= Info_Bartender_Stigma_Condition;
	information		= Info_Bartender_Stigma_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Dobrze zna³eœ Znamiê?";

};                       

FUNC INT Info_Bartender_Stigma_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Hello))&&(Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Stigma_Info()
{	
	AI_Output (other, self,"Info_Bartender_Stigma_15_01"); //Dobrze zna³eœ Znamiê?
	AI_Output (self, other,"Info_Bartender_Stigma_06_02"); //Przychodzi³ czasem utopiæ smutki.
	AI_Output (other, self,"Info_Bartender_Stigma_15_03"); //Przed, czy po tym jak straci³ jêzyk?
	AI_Output (self, other,"Info_Bartender_Stigma_06_04"); //Przed i po. Zdecydowanie czêœciej pi³ jak móg³ mieliæ ozorem.
	AI_Output (other, self,"Info_Bartender_Stigma_15_05"); //Mówi³ coœ ciekawego?
	AI_Output (self, other,"Info_Bartender_Stigma_06_06"); //Mo¿e i mówi³. A co Ci do tego?
	AI_Output (other, self,"Info_Bartender_Stigma_15_07"); //Ile?
	AI_Output (self, other,"Info_Bartender_Stigma_06_08"); //Pos³uchaj. Nikt w GnieŸdzie nie zadziera z Krisem. 
	AI_Output (other, self,"Info_Bartender_Stigma_15_09"); //Pytam, ile? Ka¿dy ma swoj¹ cenê, karczmarzu.
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Bartender_Stigma_06_10"); //200 bry³ek, wróæ jak siê zdecydujesz.


};


// ************************************************************

INSTANCE Info_Bartender_Stigma1 (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 4;
	condition		= Info_Bartender_Stigma1_Condition;
	information		= Info_Bartender_Stigma1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam 200 bry³ek.";

};                       

FUNC INT Info_Bartender_Stigma1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Bartender_Stigma))&&(NPC_HasItems(other,ItMiNugget)>=200)
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_Stigma1_Info()
{	
	investigation = investigation + 1;
	B_GiveInvItems (other, self, ItMiNugget, 200);
	AI_Output (other, self,"Info_Bartender_Stigma1_15_01"); //Mam 200 bry³ek.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_02"); //Ciszej, idioto!
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Bartender_Stigma1_06_03"); //Dawaj rudê, tylko powoli. Nie chcê zwracaæ na siebie uwagê.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_04"); //Mów, bo mo¿e siê okazaæ, ¿e Kris wcale nie jest najwredniejszym typem w tej cholernej dziurze.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_05"); //Dobra, ju¿ dobra. Powiem co wiem, a Ty dasz mi spokój.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_06"); //I jakby co to ode mnie tego nie s³ysza³eœ.
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other,"Info_Bartender_Stigma1_06_07"); //Kiedyœ Znamiê wypi³ wiêcej ni¿ powinien i zacz¹³ be³kotaæ.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_08"); //Na szczêœcie nikt tego nie s³ysza³, prócz mnie.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_09"); //Znamiê mówi³, ¿e Nia to wredna suka. ¯e pod t¹ niewinn¹ mink¹ kryje siê prawdziwy potwór.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_10"); //Powiedzia³, ¿e nawet Gomez siê jej przerazi³ i odda³ dziwkê Krukowi.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_11"); //Mówi siê, ¿e w nocy dorwa³a kumpla Arto w ³ó¿ku i od tamtej chwili osobisty przydupas Gomeza nosi przydomek Blizna.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_12"); //Kruk nie mia³ na ni¹ czasu. Ale wpad³a w oko Hrabiemu.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_13"); //Ale jego teraz nie ma, a dziewczyna siê nudzi.
	AI_Output (self, other,"Info_Bartender_Stigma1_06_14"); //Mo¿e to tylko dziwny zbieg okolicznoœci, ale ludzie zaczêli gin¹æ kiedy Hrabia opuœci³ Gniazdo.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_15"); //Sugerujesz, ¿e to Nia zabija? To niedorzeczne...
	AI_Output (self, other,"Info_Bartender_Stigma1_06_16"); //Nic nie sugerujê. Zrobisz co uwa¿asz z t¹ wiedz¹.
	AI_Output (other, self,"Info_Bartender_Stigma1_15_17"); //Drogo mnie kosztowa³a. Ciekawe ile z tego to prawda?
	AI_Output (self, other,"Info_Bartender_Stigma1_06_18"); //Zapytasz Znamiê jak ju¿ siê z nim spotkasz. 
	AI_Output (self, other,"Info_Bartender_Stigma1_06_19"); //A teraz daj mi spokój, nie chcê, ¿eby ktoœ widzia³ jak z Tob¹ rozmawiam.
	B_LogEntry		(CH4_Non_Eagle, "Ta historia z zabójstwami nabiera rumieñców. Karczmarz opowiedzia³ mi ciekaw¹ historiê. Znamiê, zanim straci³ jêzyk, by³ doœæ rozmowny. Twierdzi³, ¿e Nia to niebezpieczna kobieta, dla której liczy siê tylko w³adza i ostra zabawa. Ober¿ysta zwróci³ uwagê na to, ¿e zabójstwa rozpoczê³y siê po tym jak Hrabia opuœci³ Gniazdo. Ciekawe czego jeszcze siê dowiem?");
};



// ************************************************************

INSTANCE Info_Bartender_StigmaMeet (C_INFO)
{
	npc			= Grd_657_Gardist;
	nr			= 4;
	condition		= Info_Bartender_StigmaMeet_Condition;
	information		= Info_Bartender_StigmaMeet_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Mam dla Ciebie propozycjê nie do odrzucenia.";

};                       

FUNC INT Info_Bartender_StigmaMeet_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Bartender_StigmaMeet_Info()
{	

	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_01"); //Mam dla Ciebie propozycjê nie do odrzucenia.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_02"); //Pos³uchaj...
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_03"); //Nie, to Ty pos³uchaj!
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_04"); //Zrobisz co mówiê, albo wytnê Ci kilka dodatkowych otworów.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_05"); //Spokojnie, schowaj ¿elastwo. Dogadamy siê.
	AI_RemoveWeapon (self);
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_06"); //Mam zamiar dowieœæ Krisowi, ¿e to Nia morduje. Pinto jest ze mn¹.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_07"); //Potrzebujê kilku œwiadków, ¿eby Kris nic nie kombinowa³.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_08"); //Wiem, ¿e bêdê tego ¿a³owa³, ale niech bêdzie.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_09"); //Zobaczymy siê po zmroku. Ukryj siê w cieniu.
	AI_Output (other, self,"Info_Bartender_StigmaMeet_15_10"); //Tylko nie zapomnij. Bo w przeciwnym razie wrócê i sprawiê, ¿e bêdziesz b³aga³ o szybk¹ œmieræ.
	AI_Output (self, other,"Info_Bartender_StigmaMeet_06_11"); //Nie musisz mi groziæ. Da³em s³owo, a teraz zje¿d¿aj.
	B_LogEntry		(CH4_Non_Eagle, "Karczmarz mi pomo¿e.");

}; 
