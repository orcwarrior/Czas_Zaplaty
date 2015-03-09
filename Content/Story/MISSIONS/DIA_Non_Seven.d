
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Seven_EXIT(C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 999;
	condition			= Info_Seven_EXIT_Condition;
	information			= Info_Seven_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Seven_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Seven_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Seven_Hello (C_INFO)
{
	npc		= Grd_613_Gardist;
	nr			= 1;
	condition		= Info_Seven_Hello_Condition;
	information		= Info_Seven_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jesteú?";
};                       

FUNC INT Info_Seven_Hello_Condition()
{	


	return 1;


};
FUNC VOID Info_Seven_Hello_Info()
{	

	AI_Output (other, self,"Info_Seven_Hello_15_00"); //Kim jesteú?
	AI_Output (self, other,"Info_Seven_Hello_06_01"); //MÛw mi SiÛdemka. 
	AI_Output (other, self,"Info_Seven_Hello_15_02"); //Co to za imiÍ?
	AI_Output (self, other,"Info_Seven_Hello_06_03"); //Duøo lepsze niø nie przymierzajπc... kutas. Prawda, Dick?
	AI_Output (other, self,"Info_Seven_Hello_15_04"); //Mam na imiÍ Rick!
	AI_Output (self, other,"Info_Seven_Hello_06_05"); //Wybacz, mÛj b≥πd.
};




// ************************************************************

INSTANCE Info_Seven_Again (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Again_Condition;
	information		= Info_Seven_Again_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Szkoda tego niemowy.";
};                       

FUNC INT Info_Seven_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Seven_Hello))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Again_Info()
{	

	AI_Output (other, self,"Info_Seven_Again_15_00"); //Szkoda tego niemowy.
	AI_Output (self, other,"Info_Seven_Again_06_01"); //Szkoda jest wtedy, jak ork wpadnie do studni - ani wody do picia, ani úcierwa do zabicia.
	AI_Output (other, self,"Info_Seven_Again_15_02"); //Kiedy z nim rozmawia≥em wyglπda≥ jakby coú go úmiertelnie przerazi≥o.
	AI_Output (self, other,"Info_Seven_Again_06_03"); //Hmm, jak tak patrzÍ na twojπ buükÍ, to nawet wiem co.
	AI_Output (other, self,"Info_Seven_Again_15_04"); //Nie na mnie patrzy≥, tylko na NiÍ.
	AI_Output (self, other,"Info_Seven_Again_06_05"); //Aaa. No cÛø, tutaj powinniúmy zakoÒczyÊ rozmowÍ.
	AI_Output (other, self,"Info_Seven_Again_15_06"); //Ty teø siÍ czegoú boisz?
	AI_Output (self, other,"Info_Seven_Again_06_07"); //SiÛdemka nie boi siÍ niczego!
	AI_Output (other, self,"Info_Seven_Again_15_08"); //WiÍc?
	AI_Output (self, other,"Info_Seven_Again_06_09"); //Zrobimy to po mojemu. Zadam Ci kilka... zagadek. 
	AI_Output (self, other,"Info_Seven_Again_06_10"); //Jeøeli dobrze odpowiesz na wszystkie, zdradzÍ Ci coú o czym lepiej g≥oúno nie mÛwiÊ.
	AI_Output (self, other,"Info_Seven_Again_06_11"); //I pamiÍtaj, masz tylko jednπ prÛbÍ na kaødπ z zagadek, wiÍc dobrze siÍ zastanÛw.
	B_LogEntry		(CH4_Non_Eagle, "SiÛdemka zdradzi mi co wie jeøeli odgadnÍ jego zagadki. Teø wymyúli≥...");
};


// ************************************************************

INSTANCE Info_Seven_Again1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Again1_Condition;
	information		= Info_Seven_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co to za zagadki?";
};                       

FUNC INT Info_Seven_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Seven_Again))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Again1_Info()
{	

	AI_Output (other, self,"Info_Seven_Again1_15_00"); //Co to za zagadki?
	AI_Output (self, other,"Info_Seven_Again1_06_01"); //Zacznijmy od pierwszej.
	AI_Output (self, other,"Info_Seven_Again1_06_02"); //Ta bÍdzie na rozgrzewkÍ.
	AI_Output (self, other,"Info_Seven_Again1_06_03"); //Jakie kroki naleøy podjπÊ kiedy spotka siÍ wúciek≥ego warga?

	Info_ClearChoices (Info_Seven_Again1);
	Info_AddChoice (Info_Seven_Again1, "Najlepiej nic nie robiÊ.", Info_Seven_Again1_Nothing);
	Info_AddChoice (Info_Seven_Again1, "Jak najd≥uøsze.", Info_Seven_Again1_Ok);
	Info_AddChoice (Info_Seven_Again1, "ZachlastaÊ bydlÍ!", Info_Seven_Again1_Kill);
	Info_AddChoice (Info_Seven_Again1, "Nie mam pojÍcia.", Info_Seven_Again1_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_Again1_Nothing()
{
	AI_Output (other, self,"Info_Seven_Again1_Nothing_15_00"); //Najlepiej nic nie robiÊ.
	AI_Output (self, other,"Info_Seven_Again1_Nothing_06_01"); //I czekaÊ, aø zwierzaczek skoÒczy jeúÊ?
	AI_Output (self, other,"Info_Seven_Again1_Nothing_06_02"); //ZaprawdÍ, jesteú idiotπ!
		Info_ClearChoices (Info_Seven_Again1);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_Again1_Kill()
{
	AI_Output (other, self," Info_Seven_Again1_Kill_15_00"); //ZachlastaÊ bydlÍ!
	AI_Output (self, other," Info_Seven_Again1_Kill_06_01"); //Niby tak, ale nie to mia≥em na myúli.
		Info_ClearChoices (Info_Seven_Again1);
};


FUNC VOID  Info_Seven_Again1_No()
{
	AI_Output (other, self," Info_Seven_Again1_No_15_00"); //Nie mam pojÍcia.
	AI_Output (self, other," Info_Seven_Again1_No_06_01"); //Uøyj tego czegoú pomiÍdzy uszami!
	AI_Output (self, other," Info_Seven_Again1_No_06_02"); //Tracisz tylko mÛj czas...
		Info_ClearChoices (Info_Seven_Again1);
};


// -----------------------------------------------------------------
var int Seven_Myst;
FUNC VOID  Info_Seven_Again1_Ok()
{
	AI_Output (other, self," Info_Seven_Again1_Ok_15_00"); //Jak najd≥uøsze.
	AI_Output (self, other," Info_Seven_Again1_Ok_06_01"); //He, he. W rzeczy samej. 
	AI_Output (self, other," Info_Seven_Again1_Ok_06_02"); //Bardzo dobrze, wrÛÊ jak bÍdziesz gotÛw do nastÍpnej zagadki.
	B_LogEntry		(CH4_Non_Eagle, "Pierwszπ zagadkÍ mam z g≥owy, czas na nastÍpnπ.");
	Seven_Myst = 1;
		Info_ClearChoices (Info_Seven_Again1);
};




// ************************************************************

INSTANCE Info_Seven_Myst (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Myst_Condition;
	information		= Info_Seven_Myst_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Czekam na kolejnπ zagadkÍ.";
};                       

FUNC INT Info_Seven_Myst_Condition()
{	

	if (Seven_Myst==1)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Myst_Info()
{	

	AI_Output (other, self,"Info_Seven_Myst_15_00"); //Czekam na kolejnπ zagadkÍ.
	AI_Output (self, other,"Info_Seven_Myst_06_01"); //Teraz wymyúlÍ coú trudniejszego...
	AI_Output (self, other,"Info_Seven_Myst_06_02"); //Juø mam!
	AI_Output (self, other,"Info_Seven_Myst_06_03"); //Co mÛwi kat ustawiajπc skazaÒca pod szubienicπ?

	Info_ClearChoices (Info_Seven_Myst);
	Info_AddChoice (Info_Seven_Myst, "Pyta o ostatnie øyczenie?", Info_Seven_Myst_Nothing);
	Info_AddChoice (Info_Seven_Myst, "Nic nie mÛwi.", Info_Seven_Myst_Ok);
	Info_AddChoice (Info_Seven_Myst, "G≥owa do gÛry!", Info_Seven_Myst_Kill);
	Info_AddChoice (Info_Seven_Myst, "Nie mam pojÍcia.", Info_Seven_Myst_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_Myst_Nothing()
{
	AI_Output (other, self,"Info_Seven_Myst_Nothing_15_00"); //Pyta o ostatnie øyczenie?
	AI_Output (self, other,"Info_Seven_Myst_Nothing_06_01"); //To nie z≥ota rybka, ani koncert øyczeÒ.
	AI_Output (self, other,"Info_Seven_Myst_Nothing_06_02"); //Odpadasz z gry.
		Info_ClearChoices (Info_Seven_Myst);
};

// -----------------------------------------------------------------
FUNC VOID  Info_Seven_Myst_Kill()
{
	Seven_Myst=2;			
	AI_Output (other, self," Info_Seven_Myst_Kill_15_00"); //G≥owa do gÛry!
	AI_Output (self, other," Info_Seven_Myst_Kill_06_01"); //He, he. Masz poczucie humoru, to lubiÍ.
	AI_Output (self, other," Info_Seven_Myst_Kill_06_02"); //Daj znaÊ, jak bÍdziesz gotÛw na nastÍpnπ zagadkÍ.
	B_LogEntry		(CH4_Non_Eagle, "Drugπ zagadkÍ mam z g≥owy, czas na kolejnπ.");
		Info_ClearChoices (Info_Seven_Myst);
};


FUNC VOID  Info_Seven_Myst_No()
{
	AI_Output (other, self," Info_Seven_Myst_No_15_00"); //Nie mam pojÍcia.
	AI_Output (self, other," Info_Seven_Myst_No_06_01"); //Uøyj tego czegoú pomiÍdzy uszami!
	AI_Output (self, other," Info_Seven_Myst_No_06_02"); //Tracisz tylko mÛj czas...
		Info_ClearChoices (Info_Seven_Myst);
};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_Myst_Ok()
{
	AI_Output (other, self," Info_Seven_Myst_Ok_15_00"); //Nic nie mÛwi.
	AI_Output (self, other," Info_Seven_Myst_Ok_06_01"); //Moøe i nic, ale to za bardzo oklepane.
	AI_Output (self, other," Info_Seven_Myst_Ok_06_02"); //Mog≥eú siÍ bardziej wysiliÊ.
		Info_ClearChoices (Info_Seven_Myst);
};




// ************************************************************

INSTANCE Info_Seven_MystAgain (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystAgain_Condition;
	information		= Info_Seven_MystAgain_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Co wymyúli≥eú tym razem?";
};                       

FUNC INT Info_Seven_MystAgain_Condition()
{	

	if (Seven_Myst==2)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystAgain_Info()
{	

	AI_Output (other, self,"Info_Seven_MystAgain_15_00"); //Co wymyúli≥eú tym razem?
	AI_Output (self, other,"Info_Seven_MystAgain_06_01"); //Teraz moøe coú z bajek.
	AI_Output (self, other,"Info_Seven_MystAgain_06_02"); //Ta powinno Ci siÍ spodobaÊ.
	AI_Output (self, other,"Info_Seven_MystAgain_06_03"); //Co to jest dziewica?

	Info_ClearChoices (Info_Seven_MystAgain);
	Info_AddChoice (Info_Seven_MystAgain, "Kobieta, ktÛra jeszcze nigdy...", Info_Seven_MystAgain_Nothing);
	Info_AddChoice (Info_Seven_MystAgain, "Ekhm, to tylko mit i zabobon.", Info_Seven_MystAgain_Ok);
	Info_AddChoice (Info_Seven_MystAgain, "Jeøeli pijesz do mnie!", Info_Seven_MystAgain_Kill);
	Info_AddChoice (Info_Seven_MystAgain, "Satyra na leniwych ch≥opÛw.", Info_Seven_MystAgain_No);
};


// -----------------------------------------------------------------

FUNC VOID Info_Seven_MystAgain_Nothing()
{
	AI_Output (other, self,"Info_Seven_MystAgain_Nothing_15_00"); //Kobieta, ktÛra jeszcze nigdy...
	AI_Output (self, other,"Info_Seven_MystAgain_Nothing_06_01"); //Bystrzacha mi siÍ trafi≥.
	AI_Output (self, other,"Info_Seven_MystAgain_Nothing_06_02"); //Tyle to kaødy wie. Zejdü mi z oczu.
		Info_ClearChoices (Info_Seven_MystAgain);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystAgain_Kill()
{
	AI_Output (other, self," Info_Seven_MystAgain_Kill_15_00"); //Jeøeli pijesz do mnie!
	AI_Output (self, other," Info_Seven_MystAgain_Kill_06_01"); //Gdzieøbym úmia≥. Chociaø z drugiej strony...
	AI_Output (self, other," Info_Seven_MystAgain_Kill_06_02"); //Wiesz co, mi≥o by≥o, ale mam sporo na g≥owie. Bywaj.
		Info_ClearChoices (Info_Seven_MystAgain);
};


FUNC VOID  Info_Seven_MystAgain_No()
{
	Seven_Myst=3;
	AI_Output (other, self," Info_Seven_MystAgain_No_15_00"); //Satyra na leniwych ch≥opÛw.
	AI_Output (self, other," Info_Seven_MystAgain_No_06_01"); //Dobre, nie? SwÛj ch≥op. Øe teø CiÍ wczeúniej nie pozna≥em.
	AI_Output (self, other," Info_Seven_MystAgain_No_06_02"); //WrÛÊ jak bÍdziesz gotÛw na prawdziwe wyzwanie.
	B_LogEntry		(CH4_Non_Eagle, "Kolejnπ zagadkÍ mam z g≥owy, czas na ostatniπ.");
		Info_ClearChoices (Info_Seven_MystAgain);
};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystAgain_Ok()
{
	AI_Output (other, self," Info_Seven_MystAgain_Ok_15_00"); //Ekhm, to tylko mit i zabobon.
	AI_Output (self, other," Info_Seven_MystAgain_Ok_06_01"); //Niby tak, ale nie to chcia≥em us≥yszeÊ.
	AI_Output (self, other," Info_Seven_MystAgain_Ok_06_02"); //Szkoda, bo nieüle Ci sz≥o.
		Info_ClearChoices (Info_Seven_MystAgain);
};




// ************************************************************

INSTANCE Info_Seven_MystLast (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystLast_Condition;
	information		= Info_Seven_MystLast_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Jestem gotÛw na prawdziwe wyzwanie.";
};                       

FUNC INT Info_Seven_MystLast_Condition()
{	

	if (Seven_Myst==3)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystLast_Info()
{	

	AI_Output (other, self,"Info_Seven_MystLast_15_00"); //Jestem gotÛw na prawdziwe wyzwanie.
	AI_Output (self, other,"Info_Seven_MystLast_06_01"); //W rzeczy samej. Ale tym razem bÍdzie juø na powaønie.
	AI_Output (self, other,"Info_Seven_MystLast_06_02"); //S≥uchaj uwaønie, bo to nie bÍdzie proste.
	AI_Output (self, other,"Info_Seven_MystLast_06_03"); //Jak dziwnie by to nie zabrzmia≥o przedstawiÍ ci kilka hipotez na... hipotezy.
	AI_Output (self, other,"Info_Seven_MystLast_06_04"); //Jesteú gotÛw?
	AI_Output (other, self,"Info_Seven_MystLast_15_05"); //Dawaj.
	AI_Output (self, other,"Info_Seven_MystLast_06_06"); //Hipoteza pierwsza. Hipoteza druga jest fa≥szywa, a hipoteza trzecia jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_07"); //Hipoteza druga. Hipoteza czwarta jest prawdziwa, a hipoteza szÛsta jest fa≥szywa.
	AI_Output (self, other,"Info_Seven_MystLast_06_08"); //Hipoteza trzecia. Hipoteza czwarta jest fa≥szywa, hipoteza piπta jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_09"); //Hipoteza czwarta. Hipotezy druga i szÛsta sπ obydwie prawdziwe.
	AI_Output (self, other,"Info_Seven_MystLast_06_10"); //Hipoteza piπta. Hipoteza pierwsza jest prawdziwa, a hipoteza druga jest fa≥szywa.
	AI_Output (self, other,"Info_Seven_MystLast_06_11"); //Hipoteza szÛsta. Hipoteza czwarta jest fa≥szywa, a hipoteza piπta jest prawdziwa.
	AI_Output (self, other,"Info_Seven_MystLast_06_12"); //Co najmniej jedna z tych hipotez jest prawdziwa. A ktÛre sπ fa≥szywe?

	Info_ClearChoices (Info_Seven_MystLast);
	Info_AddChoice (Info_Seven_MystLast, "Pierwsza i trzecia.", Info_Seven_MystLast_Nothing);
	Info_AddChoice (Info_Seven_MystLast, "Druga i czwarta.", Info_Seven_MystLast_Ok);
	Info_AddChoice (Info_Seven_MystLast, "Piπta i szÛsta.", Info_Seven_MystLast_Kill);
	Info_AddChoice (Info_Seven_MystLast, "MÛg≥byú powtÛrzyÊ?", Info_Seven_MystLast_No);
};



// -----------------------------------------------------------------

FUNC VOID Info_Seven_MystLast_Nothing()
{
	AI_Output (other, self,"Info_Seven_MystLast_Nothing_15_00"); //Pierwsza i trzecia.
	AI_Output (self, other,"Info_Seven_MystLast_Nothing_06_01"); //èle, te sπ prawdziwe.
	AI_Output (self, other,"Info_Seven_MystLast_Nothing_06_02"); //Nie uda≥o Ci siÍ, przykro mi, ale nic Ci nie powiem.
		Info_ClearChoices (Info_Seven_MystLast);
};

// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystLast_Kill()
{
	AI_Output (other, self," Info_Seven_MystLast_Kill_15_00"); //Piπta i szÛsta.
	AI_Output (self, other," Info_Seven_MystLast_Kill_06_01"); //Ta para jest prawdziwa.
	AI_Output (self, other," Info_Seven_MystLast_Kill_06_02"); //Nic z tego, nic Ci nie powiem. Bywaj.
		Info_ClearChoices (Info_Seven_MystLast);
};


FUNC VOID  Info_Seven_MystLast_No()
{
	AI_Output (other, self," Info_Seven_MystLast_No_15_00"); //MÛg≥byú powtÛrzyÊ?
	AI_Output (self, other," Info_Seven_MystLast_No_06_01"); //Nic z tego. Mia≥eú tylko jednπ szansÍ.
	AI_Output (self, other," Info_Seven_MystLast_No_06_02"); //Szkoda, bo niewiele brakowa≥o. Powodzenia.
		Info_ClearChoices (Info_Seven_MystLast);

};


// -----------------------------------------------------------------

FUNC VOID  Info_Seven_MystLast_Ok()
{
	Seven_Myst=4;
	AI_Output (other, self," Info_Seven_MystLast_Ok_15_00"); //Druga i czwarta.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_01"); //Nieüle. Nie sπdzi≥em, øe odgadniesz prawid≥owo.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_02"); //Jestem pod wraøeniem.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_03"); //WrÛÊ, to pogadamy o pewnej zdzirze. Ale najpierw porozmawiaj z innymi.
	AI_Output (self, other," Info_Seven_MystLast_Ok_06_04"); //To co Ci powiem pogrπøy zabÛjcÍ.
	B_LogEntry		(CH4_Non_Eagle, "Odgad≥em ostatniπ zagadkÍ! Teraz to ja bÍdÍ zadawa≥ pytania, ale najpierw muszÍ wypytaÊ innych o podejrzenia w sprawie zabÛjstwa.");
		Info_ClearChoices (Info_Seven_MystLast);
};




// ************************************************************

INSTANCE Info_Seven_MystEnd (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystEnd_Condition;
	information		= Info_Seven_MystEnd_Info;
	important		= 0;
	permanent		= 0;
	description 		= "No to zamieniam siÍ w s≥uch.";
};                       

FUNC INT Info_Seven_MystEnd_Condition()
{	

	/*******************
Dick musia≥ wczeúniej pogadaÊ z innymi, jak juø obleci wszystkich to dopiero wtedy SiÛdemka z nim pogada

************************/


	if (Seven_Myst==4)&&(Npc_KnowsInfo (hero, Info_Ash_Again))&&(Npc_KnowsInfo (hero, Info_Bartender_Stigma1))&&(Npc_KnowsInfo (hero, Info_Ormus_Again1))&&(Npc_KnowsInfo (hero, Info_SmithX_Again))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystEnd_Info()
{	

	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	investigation = investigation + 1;
	AI_Output (other, self,"Info_Seven_MystEnd_15_00"); //No to zamieniam siÍ w s≥uch.
	AI_Output (self, other,"Info_Seven_MystEnd_06_01"); //Zas≥uøy≥eú na to, by us≥yszeÊ prawdÍ o mrocznej stronie pewnej niewyøytej dziwki.
	AI_Output (self, other,"Info_Seven_MystEnd_06_02"); //Jestem pewien, øe to Nia zabija. Widzia≥em jak ujeødøa≥a tego ostatniego pechowca.
	AI_Output (self, other,"Info_Seven_MystEnd_06_03"); //Na koniec zadüga≥a go noøem. Kiedy dogorywa≥, ona nadal na nim siedzia≥a.
	AI_Output (self, other,"Info_Seven_MystEnd_06_04"); //Jest gorsza niø harpie.
	AI_Output (other, self,"Info_Seven_MystEnd_15_05"); //Dlaczego nikomu tego nie powiedzia≥eú?
	AI_Output (self, other,"Info_Seven_MystEnd_06_06"); //Bo to i tak nic nie da.
	AI_Output (self, other,"Info_Seven_MystEnd_06_07"); //Kris jej nie tknie. MogÍ siÍ za≥oøyÊ, øe pewnie sam coú podejrzewa.
	AI_Output (self, other,"Info_Seven_MystEnd_06_08"); //Jak znam jego i Pinto to przed powrotem Hrabiego wrobiπ w zabÛjstwa jakiegoú pechowca.
	AI_Output (other, self,"Info_Seven_MystEnd_15_09"); //Dlaczego tak na mnie patrzysz?
	AI_Output (self, other,"Info_Seven_MystEnd_06_10"); //Jesteú nowy, nikt CiÍ tu nie zna, do tego wtykasz nos w nie swoje sprawy. Jesteú idealnym kandydatem.
	AI_Output (other, self,"Info_Seven_MystEnd_15_11"); //Ale nie by≥o mnie tutaj kiedy to siÍ zaczÍ≥o!
	AI_Output (self, other,"Info_Seven_MystEnd_06_12"); //Kto wie? Moøe zakrada≥eú siÍ w nocy?
	AI_Output (self, other,"Info_Seven_MystEnd_06_13"); //Jestem pewien, øe znajdzie siÍ jakiú úwiadek. 
	AI_Output (other, self,"Info_Seven_MystEnd_15_14"); //Cholera, masz racjÍ. Co teraz?
	AI_Output (self, other,"Info_Seven_MystEnd_06_15"); //S≥uchaj brachu. Polubi≥em CiÍ. Myúlimy podobnie.
	AI_Output (self, other,"Info_Seven_MystEnd_06_16"); //Moøe w innych czasach i w innym miejscu zostalibyúmy przyjaciÛ≥mi.
	AI_Output (self, other,"Info_Seven_MystEnd_06_17"); //PomogÍ Ci, ale trzeba dzia≥aÊ szybko.
	AI_Output (other, self,"Info_Seven_MystEnd_15_18"); //S≥ucham.
	AI_Output (self, other,"Info_Seven_MystEnd_06_19"); //Musisz sprowokowaÊ NiÍ i muszπ byÊ na to úwiadkowie. Najlepiej, øeby by≥ przy tym Kris lub Pinto.
	AI_Output (other, self,"Info_Seven_MystEnd_15_20"); //Ale jak to zrobiÊ?
	AI_Output (self, other,"Info_Seven_MystEnd_06_21"); //To juø Twoja dzia≥ka. To bezlitosna bestia, ale z kaødπ ofiarπ spÛ≥kowa≥a.
	AI_Output (self, other,"Info_Seven_MystEnd_06_22"); //Moøe sprÛbuj siÍ z niπ umÛwiÊ, najlepiej po zmroku.
	AI_Output (self, other,"Info_Seven_MystEnd_06_23"); //Pogadaj teø z Krisem, albo Pinto. Ktoú z nich musi byÊ úwiadkiem.
	AI_Output (other, self,"Info_Seven_MystEnd_15_24"); //A jeøeli oni poczekajπ, aø dziewczyna mnie zaszlachtuje? Albo rzucπ siÍ na mnie, kiedy to ja jπ zabijÍ?
	AI_Output (other, self,"Info_Seven_MystEnd_15_25"); //Tak czy inaczej, wπtpiÍ, øe stanπ po mojej stronie.
	AI_Output (self, other,"Info_Seven_MystEnd_06_26"); //Racja. Za≥atw sobie wiÍcej úwiadkÛw, co najmniej kilku, ktÛrzy teø to zobaczπ.
	AI_Output (self, other,"Info_Seven_MystEnd_06_27"); //Wtedy Kris i Pinto powinni umyÊ rÍce.
	AI_Output (other, self,"Info_Seven_MystEnd_15_28"); //Tak zrobiÍ. Wielkie dziÍki SiÛdemka, jestem Ci coú winien.
	AI_Output (self, other,"Info_Seven_MystEnd_06_29"); //Sp≥acisz d≥ug jak pozbÍdziesz siÍ tej psychopatki. Powodzenia, przyjacielu.

	B_LogEntry		(CH4_Non_Eagle, "SiÛdemka jest pewien, øe to Nia zabija. MuszÍ namÛwiÊ jπ na nocne spotkanie, o ktÛrym musi teø dowiedzieÊ siÍ Kris lub Pinto. Powinienem teø przekonaÊ co najmniej kilku innych úwiadkÛw, bo inaczej Kris i tak na mnie zrzuci winÍ.");

	B_StopProcessInfos	(self);


	/***********************************

Pinto ma podejúÊ do gadajπcych Dicka i SIÛdemki.

************************************/


};



// ************************************************************

INSTANCE Info_Seven_MystEnd1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_MystEnd1_Condition;
	information		= Info_Seven_MystEnd1_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Pomoøesz?";
};                       

FUNC INT Info_Seven_MystEnd1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Seven_MystEnd1_Info()
{	
	AI_Output (other, self,"Info_Seven_MystEnd1_15_00"); //Pomoøesz?
	AI_Output (self, other,"Info_Seven_MystEnd1_06_01"); //Pewnie, nie mÛg≥bym przegapiÊ okazji, øeby zobaczyÊ minÍ tej dziwki.
	AI_Output (self, other,"Info_Seven_MystEnd1_06_02"); //ZaczajÍ siÍ w cieniu i powiem Krisowi jak by≥o naprawdÍ.
	AI_Output (other, self,"Info_Seven_MystEnd1_15_03"); //DziÍki SiÛdemka. Jesteú prawdziwym przyjacielem.
	AI_Output (self, other,"Info_Seven_MystEnd1_06_04"); //Nie ma sprawy, bestyjka dostanie to, na co zas≥uøy≥a.
	B_LogEntry		(CH4_Non_Eagle, "SiÛdemka mi pomoøe.");
	
	Npc_ExchangeRoutine	(self,"WAIT");	
	
};


// ************************************************************

INSTANCE Info_Seven_Watch (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Watch_Condition;
	information		= Info_Seven_Watch_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Seven_Watch_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Pinto_Hmm))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Watch_Info()
{	
	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Seven_Watch_06_01"); //Dziwka mia≥a nÛø. Odrzuci≥a brzeszczot, gdy tylko zobaczy≥a mnie w cieniu.
	AI_Output (self, other,"Info_Seven_Watch_06_02"); //Nie mog≥em pozwoliÊ, øeby usz≥o jej to znowu p≥azem.
	AI_Output (self, other,"Info_Seven_Watch_06_03"); //Za duøo ta twierdza widzia≥a juø úmierci...
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other,"Info_Seven_Watch_06_04"); //O, tu leøy!
	B_StopProcessInfos	(self);
	AI_PlayAni			(self,	"T_PLUNDER");

	/************************
Seven ma siÍ niby schyliÊ po nÛø Nii

*********************/
};



// ************************************************************

INSTANCE Info_Seven_Watch1 (C_INFO)
{
	npc			= Grd_613_Gardist;
	nr			= 2;
	condition		= Info_Seven_Watch1_Condition;
	information		= Info_Seven_Watch1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Seven_Watch1_Condition()
{	
	if (Npc_KnowsInfo (hero,Info_Pinto_Hmm1))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};

};
FUNC VOID Info_Seven_Watch1_Info()
{	
	var C_NPC pinto; pinto = Hlp_GetNpc(Grd_612_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, pinto);
	AI_Output (self, other,"Info_Seven_Watch1_06_01"); //Za chwilÍ do was do≥πczÍ Pinto. ChcÍ jeszcze zamieniÊ s≥Ûwko z naszym bohaterem.
	AI_TurnToNpc (self, other);
	AI_GotoNpc(self, hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_02"); //Kurtyna opad≥a. TrochÍ szkoda, øe Pinto tak ≥atwo da≥ siÍ nabraÊ.
	AI_Output (other, self,"Info_Seven_Watch1_15_03"); //O czym Ty mÛwisz?
	AI_Output (self, other,"Info_Seven_Watch1_06_04"); //Widzisz, Rick. Zabi≥em NiÍ, bo widzia≥a twarz prawdziwego mordercy.
	AI_Output (other, self,"Info_Seven_Watch1_15_05"); //To niemoøliwe. Przecieø sam mÛwi≥eú, øe...
	AI_Output (other, self,"Info_Seven_Watch1_15_06"); //To TY!
	AI_Output (self, other,"Info_Seven_Watch1_06_07"); //W rzeczy samej drogi ch≥opcze. To ja.
	AI_Output (other, self,"Info_Seven_Watch1_15_08"); //Wykorzysta≥eú mnie!
	AI_DrawWeapon (hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_09"); //Spokojnie, bo zaczynamy zwracaÊ uwagÍ.
	AI_Output (self, other,"Info_Seven_Watch1_06_10"); //Schowaj miecz. Nie chcia≥bym zrobiÊ Ci krzywdy.
	AI_RemoveWeapon (hero);
	AI_Output (self, other,"Info_Seven_Watch1_06_11"); //Tak lepiej. A teraz pos≥uchaj.
	AI_Output (self, other,"Info_Seven_Watch1_06_12"); //Nia rzeczywiúcie by≥a potworem, choÊ nie takim, jakim jπ przedstawi≥em.
	AI_Output (self, other,"Info_Seven_Watch1_06_13"); //Wykorzystywa≥a mÍøczyzn, bawi≥a siÍ nimi i porzuca≥a, jak parÍ onucy.
	AI_Output (self, other,"Info_Seven_Watch1_06_14"); //Kiedyú pad≥o i na mnie.
	AI_Output (self, other,"Info_Seven_Watch1_06_15"); //Moøe wyjdÍ na idiotÍ, ale straci≥em dla lafiryndy g≥owÍ. Nic na to nie poradzÍ, kochliwy jestem i tyle.
	AI_Output (self, other,"Info_Seven_Watch1_06_16"); //To by≥o zaraz po tym, jak Hrabia jπ tu przywiÛz≥. Spotkaliúmy siÍ potajemnie kilka razy.
	AI_Output (self, other,"Info_Seven_Watch1_06_17"); //PÛüniej przesta≥a przychodziÊ. Nakry≥em ladacznicÍ, jak zabawia≥a siÍ ze straønikiem.
	AI_Output (self, other,"Info_Seven_Watch1_06_18"); //PÛüniej byli inni, wielu innych...
	AI_Output (self, other,"Info_Seven_Watch1_06_19"); //Nie mog≥em pozwoliÊ, øeby jakaú dziwka drwi≥a z moich uczuÊ!
	AI_Output (self, other,"Info_Seven_Watch1_06_20"); //Zaczπ≥em zabijaÊ. Wysy≥a≥em do Beliara kaødego g≥upca, ktÛry z niπ obcowa≥.
	AI_Output (self, other,"Info_Seven_Watch1_06_21"); //Czasem inni widzieli jak Nia z kimú sobie uøywa≥a, pÛüniej ten ktoú gryz≥ ziemiÍ.
	AI_Output (self, other,"Info_Seven_Watch1_06_22"); //Nawet taki idiota jak Ormus zorientowa≥ siÍ, kto stoi za morderstwami. PodejrzeÒ by≥o coraz wiÍcej. Dlatego w≥aúnie ZnamiÍ siÍ na niπ rzuci≥.
	AI_Output (self, other,"Info_Seven_Watch1_06_23"); //Dobrze to rozegra≥em, a niewyøyta dziwka dosta≥a to, na co zas≥uøy≥a.
	AI_Output (other, self,"Info_Seven_Watch1_15_24"); //Po co mi to mÛwisz?
	AI_Output (self, other,"Info_Seven_Watch1_06_25"); //Bo polubi≥em CiÍ, ch≥opcze. Jesteúmy bardziej podobni niø chcia≥byú przyznaÊ.
	AI_Output (other, self,"Info_Seven_Watch1_15_26"); //Nie jestem taki jak Ty!
	AI_Output (self, other,"Info_Seven_Watch1_06_27"); //Jeszcze nie. A moøe juø nie? Kto wie...
	AI_Output (other, self,"Info_Seven_Watch1_15_28"); //Powinienem zaciπgnπÊ CiÍ do Krisa!
	AI_Output (self, other,"Info_Seven_Watch1_06_29"); //I jak myúlisz, komu by da≥ wiarÍ? Tobie, czy Pinto i reszcie? Do tego ten nÛø...
	AI_Output (self, other,"Info_Seven_Watch1_06_30"); //Zwinπ≥em orÍø dzisiaj, w koÒcu epilog musi byÊ dramatyczny.
	AI_Output (other, self,"Info_Seven_Watch1_15_31"); //Jesteú chory!
	AI_Output (self, other,"Info_Seven_Watch1_06_32"); //Nie, Rick. Jestem tylko cz≥owiekiem, nawet takie bydle jak ja ma uczucia.
	AI_Output (other, self,"Info_Seven_Watch1_15_33"); //Niech ciÍ szlag, SiÛdemka!
	AI_Output (self, other,"Info_Seven_Watch1_06_34"); //Pewnie tak i bÍdzie. 
	AI_Output (self, other,"Info_Seven_Watch1_06_35"); //Bywaj, Rick. Mi≥o by≥o CiÍ poznaÊ.

	Npc_ExchangeRoutine	(self,"START");	

	Log_SetTopicStatus	(CH4_Non_NiaHelp, LOG_SUCCESS);
	B_LogEntry		(CH4_Non_Eagle, "Ten sukinsyn mnie wykorzysta≥! To SiÛdemka zabija≥, znowu wyszed≥em na idiotÍ. Czas opuúciÊ to pokrÍcone miejsce.");

}; 

INSTANCE DIA_Seven_CanYouTeachMe (C_INFO)
{
	npc				= Grd_613_Gardist;
	//nr				= 71;
	condition		= DIA_Seven_CanYouTeachMe_Condition;
	information		= DIA_Seven_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Moøesz mnie czegoú nauczyÊ?"; 
};

FUNC INT DIA_Seven_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Seven_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Seven_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Seven_CanYouTeachMe_15_01"); //Moøesz mnie czegoú nauczyÊ?
	AI_Output (self, other, "DIA_Seven_CanYouTeachMe_12_02"); //PokaøÍ Ci, co moøna zrobiÊ z kuszπ.
	
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "SiÛdemka poprawi moje umiejetnoúci strzelania z kuszy.");
	
};