// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Drunk_Exit (C_INFO)
{
	npc			= RBL_2608_BeerDrinker;
	nr			= 999;
	condition	= DIA_Drunk_Exit_Condition;
	information	= DIA_Drunk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Drunk_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Drunk_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Drunk_Hello (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 1;
	condition		= DIA_Drunk_Hello_Condition;
	information		= DIA_Drunk_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wczeœnie zacz¹³eœ."; 
};

FUNC INT DIA_Drunk_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Drunk_Hello_Info()
{
	AI_Output (other, self, "DIA_Drunk_Hello_15_01"); //Wczeœnie zacz¹³eœ.
	AI_Output (self, other, "DIA_Drunk_Hello_11_02"); //Mój drogi, dzieñ na trzeŸwo to dzieñ stracony... hik.
	
   B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Drunk_Lazur (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 2;
	condition		= DIA_Drunk_Lazur_Condition;
	information		= DIA_Drunk_Lazur_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebujê specjalnego trunku."; 
};

FUNC INT DIA_Drunk_Lazur_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Leaf_Trol))&&(Npc_KnowsInfo (hero, DIA_Drunk_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Lazur_Info()
{
	AI_Output (other, self, "DIA_Drunk_Lazur_15_01"); //Potrzebujê specjalnego trunku.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_02"); //Mój drogi, wszystkie trunki s¹ specjalne i niepowtarzalne.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_03"); //Nie znajdziesz napitków o tym samym aromacie, o tym samym bukiecie. Nawet wytrawione, znaczy wytrawne gard³o nie jest w stanie...
	AI_Output (other, self, "DIA_Drunk_Lazur_15_04"); //To fascynuj¹ce, ale szukam lazurowego trzmiela. I jest to jedyny powód, dla którego odwiedzi³em obozowego ochleja.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_05"); //Teraz to urazi³eœ mnie do ¿ywego... hik.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_06"); //Nawet gdybym mia³ w mojej skrzyni trzmiela, to i tak bym go nie odda³ nikomu! Rozumiesz? NIKOMU!
	AI_Output (other, self, "DIA_Drunk_Lazur_15_07"); //Skoñczmy z t¹ fars¹, dobrze zap³acê.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_08"); //Nie ka¿dego i nie wszystko mo¿na kupiæ, piracie.
	AI_Output (self, other, "DIA_Drunk_Lazur_11_09"); //I nie zbli¿aj siê do mojego kufra... hik!
	
   B_LogEntry		(CH2_Rbl_Lazur, "Rozmowa z Opojem nic mi nie da³a. Stary pijak zarzeka³ siê, ¿e w jego skrzyni na pewno nie ma lazurowego trzmiela, wiêc to powinno byæ pierwsze miejsce, które muszê sprawdziæ.");
};

// **************************************************

INSTANCE DIA_Drunk_Innos (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 3;
	condition		= DIA_Drunk_Innos_Condition;
	information		= DIA_Drunk_Innos_Info;
	permanent		= 0;
	important		= 0;
	description		= "Szukam wody œwiêconej."; 
};

FUNC INT DIA_Drunk_Innos_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RATFORD_SearchAgain))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Innos_Info()
{
	AI_Output (other, self, "DIA_Drunk_Innos_15_01"); //Szukam wody œwiêconej.
	AI_Output (self, other, "DIA_Drunk_Innos_11_02"); //Nie mam ¿adnej wody...
	AI_Output (self, other, "DIA_Drunk_Innos_11_03"); //Znaczy nie w czystej postaci... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_04"); //A w jakiej postaci?
	AI_Output (self, other, "DIA_Drunk_Innos_11_05"); //Zrobi³em z tego przedni samogon, he, he.
	AI_Output (other, self, "DIA_Drunk_Innos_15_06"); //Zrobi³eœ bimber z wody œwiêconej?!
	AI_Output (self, other, "DIA_Drunk_Innos_11_07"); //A co, nie wolno mi? Cz³owieku jakiego to ma kopa... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_08"); //Niewa¿ne, ile chcesz za ten œwiêcony... samogon?
	AI_Output (self, other, "DIA_Drunk_Innos_11_09"); //Hmm, niech no pomyœlê... Z 500 bry³ek co najmniej. Albo nawet 300... hik.
	AI_Output (other, self, "DIA_Drunk_Innos_15_10"); //Dobra, to dam Ci 100.
	AI_Output (self, other, "DIA_Drunk_Innos_11_11"); //Niech bêdzie.
	
   B_LogEntry		(CH2_RBL_MysteryBook, "Piwosz zrobi³ z wody œwiêconej bimber, sprzeda mi go za 100 bry³ek.");
};

// **************************************************

INSTANCE DIA_Drunk_InnosSell (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 4;
	condition		= DIA_Drunk_InnosSell_Condition;
	information		= DIA_Drunk_InnosSell_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kupiê ten œwiêcony bimber."; 
};

FUNC INT DIA_Drunk_InnosSell_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Innos))&&(NPC_HasItems(other,ItMiNugget)>=100)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_InnosSell_Info()
{
	B_GiveXP (250);
	
   AI_Output (other, self, "DIA_Drunk_InnosSell_15_01"); //Kupiê ten œwiêcony bimber.
	AI_Output (self, other, "DIA_Drunk_InnosSell_11_02"); //Proszê bardzo, niech Ci idzie na zdrowie... hik.
	
   CreateInvItems (self,ItFo_Innos_Booz,1);	
	B_GiveInvItems (self, other, ItFo_Innos_Booz, 1);
   B_GiveInvItems (other, self, ItMiNugget, 100);
	
   AI_Output (self, other, "DIA_Drunk_InnosSell_11_03"); //Tylko nie siadaj za blisko ogniska, strasznie siê po nim pierdzi... hik
	
   B_LogEntry		(CH2_RBL_MysteryBook, "Mam wodê œwiêcon¹, a raczej pêdzony na niej bimber - mam nadziejê, ¿e to wystarczy.");
};

// **************************************************

INSTANCE DIA_Drunk_Herb (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 5;
	condition		= DIA_Drunk_Herb_Condition;
	information		= DIA_Drunk_Herb_Info;
	permanent		= 0;
	important		= 0;
	description		= "S³ysza³em, ¿e pêdzisz bimber z dêbiny?"; 
};

FUNC INT DIA_Drunk_Herb_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Milten_Plantsda))
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Herb_Info()
{
	AI_Output (other, self, "DIA_Drunk_Herb_15_01"); //S³ysza³em, ¿e pêdzisz bimber z dêbiny?
	AI_Output (self, other, "DIA_Drunk_Herb_11_02"); //Hik... Pêdzê bimber z wszystkiego co na drzewo nie ucieka... Hik.
	AI_Output (other, self, "DIA_Drunk_Herb_15_03"); //Potrzebujê liœcia dêbu. Masz jakiœ na sprzeda¿?
	AI_Output (self, other, "DIA_Drunk_Herb_11_04"); //Tak siê sk³ada, ¿e mam, ale zdaje siê, ¿e wpad³em w ci¹g... Hik.
	AI_Output (other, self, "DIA_Drunk_Herb_15_05"); //Co to znaczy?
	AI_Output (self, other, "DIA_Drunk_Herb_11_06"); //Ano to, ¿e potrzebujê teraz du¿o... paliwa... Hik.
	AI_Output (self, other, "DIA_Drunk_Herb_11_07"); //Przynieœ mi 10 ry¿ówek to pogadamy.

	B_LogEntry		(CH2_RBL_Plants, "Piwosz sprzeda mi liœæ dêbu za 10 ry¿ówek. Nie ma to jak barter...");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Drunk_Herb1 (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 6;
	condition		= DIA_Drunk_Herb1_Condition;
	information		= DIA_Drunk_Herb1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ry¿ówkê."; 
};

FUNC INT DIA_Drunk_Herb1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Herb))&&(NPC_HasItems(other,ItFoBooze)>=10)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Herb1_Info()
{
	B_GiveXP (250);
   
	AI_Output (other, self, "DIA_Drunk_Herb1_15_01"); //Mam ry¿ówkê.
	AI_Output (self, other, "DIA_Drunk_Herb1_11_02"); //Hik... Jak¹ ry¿ówkê?
	AI_Output (other, self, "DIA_Drunk_Herb1_15_03"); //Ry¿ówka za liœæ dêbu - pamiêtasz?
	AI_Output (self, other, "DIA_Drunk_Herb1_11_04"); //Jaki liœæ dêbu? Chyba nie ten, którym podtar³em siê dzisiaj w krzakach... Hik.
	
   AI_DrawWeapon (other);
	
   AI_Output (other, self, "DIA_Drunk_Herb1_15_05"); //Niech Ciê szlag! Dawaj ten cholerny liœæ, albo utnê Ci ten zakuty ³eb!
	AI_Output (self, other, "DIA_Drunk_Herb1_11_06"); //Spokojnie... Hik. Mówisz, liœæ dêbu?
	AI_Output (self, other, "DIA_Drunk_Herb1_11_07"); //Chyba jeszcze jakiœ mi zosta³. Chowam je w spodniach, ¿eby mieæ je zawsze przy sobie. Tak w razie czego...
	AI_Output (self, other, "DIA_Drunk_Herb1_11_08"); //Wiesz, nigdy nie wiadomo, kiedy mnie pogoni... Hik.
	AI_Output (self, other, "DIA_Drunk_Herb1_11_09"); //O mam! Bierz liœæ, tylko uwa¿aj, zdaje siê, ¿e troszkê siê upaæka³...
	AI_Output (other, self, "DIA_Drunk_Herb1_15_10"); //Ale to œmierdzi! Bierz ry¿ówkê i zejdŸ mi z oczu moczymordo!
	
   AI_RemoveWeapon (other);
	CreateInvItems (self, ItFo_Plants_OrcHerb_02, 1);
	B_GiveInvItems (self, other, ItFo_Plants_OrcHerb_02, 1);
	B_GiveInvItems (other, self, ItFoBooze, 10);
	B_LogEntry		(CH2_RBL_Plants, "Mam liœæ dêbu od Piwosza - chyba powinienem go porz¹dnie wyp³ukaæ.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_RBL_2608_BeerDrinker_Stew (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 12;
	condition		= DIA_RBL_2608_BeerDrinker_Stew_Condition;
	information		= DIA_RBL_2608_BeerDrinker_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam gulasz."; 
};

FUNC INT DIA_RBL_2608_BeerDrinker_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2608_BeerDrinker_Stew_Info()
{
	fox_stew = fox_stew + 1;
   
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_01"); //Mam gulasz.
	AI_Output (self, other, "DIA_RBL_2608_BeerDrinker_Stew_11_02"); //Hik... I co z tego?
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_03"); //To porcja dla ciebie.
	AI_Output (self, other, "DIA_RBL_2608_BeerDrinker_Stew_11_04"); //Nie jestem a¿ tak pijany, ¿eby to zjeœæ... Hik.
	AI_Output (other, self, "DIA_RBL_2608_BeerDrinker_Stew_15_05"); //Bierz, albo wepchnê Ci to w gard³o!
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Piwosza do zabrania gulaszu przekona³y dopiero moje groŸby."); 
};

// **************************************************

INSTANCE DIA_Drunk_SpecialBooz (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 7;
	condition		= DIA_Drunk_SpecialBooz_Condition;
	information		= DIA_Drunk_SpecialBooz_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrzebujê czegoœ na specjaln¹ okazjê."; 
};

FUNC INT DIA_Drunk_SpecialBooz_Condition()
{
	return Leaf_OCSpy_notpermanent;
};

FUNC VOID DIA_Drunk_SpecialBooz_Info()
{
	B_GiveXP (150);
   
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_01"); //Potrzebujê czegoœ na specjaln¹ okazjê.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_02"); //A co to za okazja?
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_03"); //Powiedzmy, ¿e chcê spiæ trolla. 
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_04"); //Hik... To musia³oby byæ coœ naprawdê mocnego...
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_05"); //Mam coœ takiego. To nalewka spirytusowa na bazie starych onuc i sfermentowanego aloesu.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_06"); //Nigdy tego nie pi³em, ale prze¿ar³o ju¿ dwa korki, wiêc powinno nieŸle kopaæ.
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_07"); //Co za to chcesz?
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_08"); //A do czego potrzebujesz takiej trucizny?
	AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_09"); //Muszê wejœæ do Starego Obozu. Mam zamiar upiæ stra¿nika...
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_10"); //A niech mnie, to Ci dopiero przednia myœl, ¿e te¿ sam na to nie wpad³em!
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_11"); //Skoro tak to dam Ci ten specja³ za darmo. Tylko trzymaj trunek z dala od skóry, bo to cholerstwo jest strasznie ¿r¹ce.
	
   CreateInvItems (self, ItFo_Special_Booz, 1);
	B_GiveInvItems (self, other, ItFo_Special_Booz, 1);
	
   AI_Output (other, self, "DIA_Drunk_SpecialBooz_15_12"); //Dziêki. Zapamiêtam to.
	AI_Output (self, other, "DIA_Drunk_SpecialBooz_11_13"); //Wystarczy, ¿e pokrzy¿ujesz plany tego wieprza Gomeza, przyjacielu. Powodzenia. Hik...
	
   B_LogEntry(CH3_RBL_OldCampSpy, "Dosta³em od Piwosza nalewkê spirytusow¹, to musi zadzia³aæ na stra¿nika przy pó³nocnej bramie.");
   B_equipment_to_OC();
}; 

INSTANCE DIA_Drunk_Lazur2 (C_INFO)
{
	npc				= RBL_2608_BeerDrinker;
	nr				= 2;
	condition		= DIA_Drunk_Lazur2_Condition;
	information		= DIA_Drunk_Lazur2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Drunk_Lazur2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Drunk_Lazur))&&(NPC_HasItems(other,ItFo_Lazur)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Drunk_Lazur2_Info()
{
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_01"); //Kto ci pozwoli³ grzebaæ w mojej skrzyni?
        
   AI_DrawWeapon (self);
   
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_02"); //Oddawaj mi wszystko, co zabra³eœ z³odzieju, zw³aszcza lazurowego trzmiela.
	AI_Output (other, self, "DIA_Drunk_Lazur2_15_03"); //Przykro mi, nie mogê tego zrobiæ.
	AI_Output (self, other, "DIA_Drunk_Lazur2_11_04"); //Dosyæ tego!... hik, nikt nie bêdzie mnie bezczelnie okradaæ, teraz dostaniesz porz¹dnie baty... hik!
       
   B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
	
   B_LogEntry		(CH2_Rbl_Lazur, "Piwosz siê wkrzurzy³, gdy zabra³em jego drobiazgi ze skrzyni i mnie zaatakowa³.");
};
