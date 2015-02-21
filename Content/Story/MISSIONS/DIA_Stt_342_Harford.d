
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Harf_Exit (C_INFO)
{
	npc			= Stt_342_Harford;
	nr			= 999;
	condition	= DIA_Harf_Exit_Condition;
	information	= DIA_Harf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Harf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Harf_Exit_Info()
{
	if (!Npc_KnowsInfo (hero, DIA_Harf_Proposal))
	{
		AI_Output (self, other, "DIA_Harf_Exit_11_01"); //Ten cholerny obóz schodzi na psy!
	};
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Harf_Hello (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 1;
	condition		= DIA_Harf_Hello_Condition;
	information		= DIA_Harf_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jesteœ?"; 
};

FUNC INT DIA_Harf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Harf_Hello_Info()
{
	AI_Output (other, self, "DIA_Harf_Hello_15_01"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Harf_Hello_11_02"); //Gównem w przerembli. ZejdŸ mi z oczu.
	B_StopProcessInfos	(self);
};


// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Harf_Proposal (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 2;
	condition		= DIA_Harf_Proposal_Condition;
	information		= DIA_Harf_Proposal_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Harf_Proposal_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)&&(Npc_KnowsInfo (hero, DIA_Cooper_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_Proposal_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Harf_Proposal_11_01"); //Pst!
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Harf_Proposal_11_02"); //S³ysza³em, ¿e ju¿ pozna³eœ Coopera.
	AI_Output (other, self, "DIA_Harf_Proposal_15_03"); //Powiedzmy, ¿e mia³em tê przyjemnoœæ.
	AI_Output (self, other, "DIA_Harf_Proposal_11_04"); //Mam dla Ciebie propozycjê. Oboje na tym zyskamy.
	AI_Output (other, self, "DIA_Harf_Proposal_15_05"); //Zamieniam siê w s³uch.
	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, other, "DIA_Harf_Proposal_11_06"); //Cooper to straszny sukinsyn. Do tego jest bardziej pazerny od Gomeza.
	AI_Output (self, other, "DIA_Harf_Proposal_11_07"); //Cienie musz¹ mu p³aciæ za to, ¿e nie napuszcza na nich stra¿ników.
	AI_Output (self, other, "DIA_Harf_Proposal_11_08"); //Nowi p³ac¹ wejœciówkê.
	AI_Output (self, other, "DIA_Harf_Proposal_11_09"); //Czas to ukróciæ.
	AI_Output (other, self, "DIA_Harf_Proposal_15_10"); //Chyba wiem do czego zmierzasz.
	AI_Output (self, other, "DIA_Harf_Proposal_11_11"); //Jaka jest twoja decyzja?
};

INSTANCE DIA_Harf_ProposalOk (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 3;
	condition		= DIA_Harf_ProposalOk_Condition;
	information		= DIA_Harf_ProposalOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zajmê siê Cooperem."; 
};

FUNC INT DIA_Harf_ProposalOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_Proposal))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalOk_Info()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_01"); //Zajmê siê Cooperem.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_02"); //Masz jaja. Tylko to nie mo¿e wygl¹daæ jak robota Cieni. Rozumiesz?
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_03"); //Bez obaw. Coœ wymyœlê.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_04"); //Zaczekaj. Nie chcê, ¿ebyœ go zaszlachtowa³. To by³oby zbyt proste. Mam lepszy pomys³.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_05"); //Gomez po rebeliantach najbardziej nienawidzi z³odziei. W komnacie Gomeza znajdziesz dziewczynê, nazywa siê Velaya. To jego ulubienica, nie dzieli siê ni¹ nawet z magnatami.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_06"); //Dziewczyna ma klucz do skrzyni z osobistymi rzeczami Gomeza. Jestem pewien, ¿e znajdziesz tam królewski sygnet.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_07"); //Gomez obci¹³ go razem z palcem królewskiego namiestnika, który dowodzi³ w Kolonii.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_08"); //Sukinsyn wk³ada go tylko na specjalne okazje. 
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_09"); //Powoli. Przecie¿ ta jego na³o¿nica nie odda mi klucza po dobroci.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_10"); //Wymyœlisz coœ. To ju¿ Twój problem. 
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_11"); //Nie tylko mój. Cienie skorzystaj¹ na tym bardziej ni¿ ja. 
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_12"); //Jednak nie jesteœ idiot¹. W porz¹dku. Z tego co wiem Velaya to pró¿ne babsko. Daj jej coœ co jej siê spodoba.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_13"); //Ale co?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_14"); //Hmm. Ona ma œwira na punkcie swojej urody. Wiem!
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_15"); //Pogadaj z Lucjuszem. On œwietnie rysuje, niech narysuje portret Velayi. Tylko uwa¿aj na niego...
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_16"); //Dlaczego?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_17"); //Wiesz on woli ch³opców, wiêc nie odwracaj siê do niego ty³em, he, he.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_18"); //Dam sobie radê.
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_19"); //Jak ju¿ zdobêdziesz sygnet, wrzuæ go do skrzyni Coopera, znajdziesz j¹ w jego chacie - wczeœniej mieszka³ tam Diego.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_20"); //Ale co ja bêdê z tego mia³?
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_21"); //Nie bêdziesz musia³ p³aciæ wejœciówki. Kiedy Gomez znajdzie swój sygnet w skrzyni Coopera, w koñcu zrobi z nim porz¹dek.
	AI_Output (other, self, "DIA_Harf_ProposalOk_15_22"); //To za ma³o. Mam inny pomys³. 
	AI_Output (self, other, "DIA_Harf_ProposalOk_11_23"); //Cholera, zaczynam ¿a³owaæ, ¿e z³o¿y³em Ci propozycjê. Co to ma byæ?
	
   Log_CreateTopic	(CH3_Grd_Thief, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Thief, LOG_RUNNING);
	Info_ClearChoices (DIA_Harf_ProposalOk);
	
   Info_AddChoice (DIA_Harf_ProposalOk, "Przyda³by mi siê pancerz magnata.", DIA_Harf_ProposalOk_Armor);
	Info_AddChoice (DIA_Harf_ProposalOk, "Potrzebujê szaty magów ognia.", DIA_Harf_ProposalOk_Robe);
	Info_AddChoice (DIA_Harf_ProposalOk, "2000 bry³ek za³atwi sprawê.", DIA_Harf_ProposalOk_Ore);
	
   var c_npc velaya; velaya = hlp_getnpc(ebr_108_velaya);
	B_ExchangeRoutine	(velaya, "HARFORDQUEST");
};

// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Armor()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_01"); //Przyda³by mi siê pancerz magnata.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Armor_11_02"); //Co?! Mo¿e jeszcze tytu³ szlachecki?
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_03"); //Wystarczy pancerz.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Armor_11_04"); //Niech ciê szlag, to nie bêdzie proste.
	AI_Output (other, self, "DIA_Harf_ProposalOk_Armor_15_05"); //Akcje z sygnetem te¿ nie bêdzie ³atwa. Poradzisz sobie.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi³em siê za³atwiæ sprawê z Cooperem. A wiêc po kolei. W osobistym kufrze Gomeza znajdê królewski sygnet, który muszê umieœciæ w skrzyni Coopera. Klucz do kufra magnata ma Velaya, która ma bzika na punkcie w³asnej urody. Lucjusz mo¿e wykona jej portret - oby to wystarczy³o. Klucz do kufra Coopera znajdê pewnie przy nim samym. Czas braæ siê do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Nagrod¹ ma byæ pancerz magnatów.");
	Info_ClearChoices (DIA_Harf_ProposalOk);		
};


// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Robe()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Robe_15_01"); //Potrzebujê szaty magów ognia.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Robe_11_02"); //Tylko tyle? Mo¿e jeszcze Tarcza Innosa?!
	AI_Output (other, self, "DIA_Harf_ProposalOk_Robe_15_03"); //Nie dramatyzuj, dasz sobie radê.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi³em siê za³atwiæ sprawê z Cooperem. A wiêc po kolei. W osobistym kufrze Gomeza znajdê królewski sygnet, który muszê umieœciæ w skrzyni Coopera. Klucz do kufra magnata ma Velaya, która ma bzika na punkcie w³asnej urody. Lucjusz mo¿e wykona jej portret - oby to wystarczy³o. Klucz do kufra Coopera znajdê pewnie przy nim samym. Czas braæ siê do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Nagrod¹ ma byæ szata magów ognia.");
	Info_ClearChoices (DIA_Harf_ProposalOk);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Harf_ProposalOk_Ore()
{
	AI_Output (other, self, "DIA_Harf_ProposalOk_Ore_15_01"); //2000 bry³ek za³atwi sprawê.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Ore_11_02"); //Cholera, wiêksza z Ciebie pijawka ni¿ Cooper.
	AI_Output (other, self, "DIA_Harf_ProposalOk_Ore_15_03"); //Trzeba sobie radziæ w ¿yciu, a ¿ycie to kosztowna inwestycja.
	AI_Output (self, other, "DIA_Harf_ProposalOk_Ore_11_04"); //Porozmawiam z ch³opakami, zrobimy zrzutê.
	
   B_LogEntry		(CH3_Grd_Thief, "Zgodzi³em siê za³atwiæ sprawê z Cooperem. A wiêc po kolei. W osobistym kufrze Gomeza znajdê królewski sygnet, który muszê umieœciæ w skrzyni Coopera. Klucz do kufra magnata ma Velaya, która ma bzika na punkcie w³asnej urody. Lucjusz mo¿e wykona jej portret - oby to wystarczy³o. Klucz do kufra Coopera znajdê pewnie przy nim samym. Czas braæ siê do pracy.");
	B_LogEntry		(CH3_Grd_Thief, "Za¿¹da³em 2000 bry³ek rudy.");
	Info_ClearChoices (DIA_Harf_ProposalOk);
};

INSTANCE DIA_Harf_ProposalOk1 (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 13;
	condition		= DIA_Harf_ProposalOk1_Condition;
	information		= DIA_Harf_ProposalOk1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Harf_ProposalOk1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalOk1_Info()
{
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_01"); //Zaczekaj!
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_02"); //Co? Zmieni³eœ zdanie?
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_03"); //Nie, przypomnia³em sobie coœ co dotyczy klucza.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_04"); //Mo¿e nie tylko Velaya ma klucz do skrzyni. Zdaje siê, ¿e kiedyœ w zamku krêci³ siê R¹czka. PóŸniej nagle znikn¹³, ale o dziwo ca³a sprawa przycich³a z polecenia Gomeza.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_05"); //Jak znam R¹czkê, to móg³ wywin¹æ jakiœ niez³y numer.
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_06"); //Dziêki, zapytam go.
	AI_Output (self, other, "DIA_Harf_ProposalOk1_11_07"); //Nie liczy³bym na to, ¿e w ogóle coœ odpowie. Najlepiej jakbyœ zdo³a³ go... okraœæ.
	AI_Output (other, self, "DIA_Harf_ProposalOk1_15_08"); //Zobaczê, co da siê zrobiæ.
	
   B_LogEntry		(CH3_Grd_Thief, "Harford zasugerowa³, ¿e R¹czka tak¿e mo¿e mieæ klucz do skrzyni Gomeza. Z³odziej na pewno nic mi nie powie, muszê wiêc przejrzeæ jego skrzynie i to co ma przy sobie. Wtedy przynajmniej ominie mnie ca³a ta heca z Velay¹.");
};

INSTANCE DIA_Harf_ProposalEnd (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 4;
	condition		= DIA_Harf_ProposalEnd_Condition;
	information		= DIA_Harf_ProposalEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Za³atwi³em sprawê z Cooperem."; 
};

FUNC INT DIA_Harf_ProposalEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Cooper_Thief))&& Mob_HasItems ("OC_CHEST_COOPER", Royal_Ring)
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_ProposalEnd_Info()
{
	var C_NPC coop; coop = Hlp_GetNpc(Stt_339_Cooper);

	/*******************************
Cooper idzie do lochów i niech tam zostanie

********************************/

	Npc_ExchangeRoutine(coop,"GoToJail");
   
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_01"); //Za³atwi³em sprawê z Cooperem.
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_02"); //Œwietnie. Ja zajmê siê tym, aby Gomez dowiedzia³ siê, kto go okrada.
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_03"); //Co z moj¹ nagrod¹?
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_04"); //O czym Ty mówisz?
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_05"); //Jak to o czym? Udupi³em Coopera, ale nie jestem cholernym kap³anem Adanosa! Da³eœ s³owo!
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_06"); //Wybacz, stary. To Kolonia Karna nie pensjonat dla akolitek Innosa.
	AI_Output (other, self, "DIA_Harf_ProposalEnd_15_07"); //Niech Ciê szlag trafi, cholerny k³amca!
	AI_Output (self, other, "DIA_Harf_ProposalEnd_11_08"); //Prêdzej, czy póŸniej szlag trafi ka¿dego z nas. Powodzenia, przyjacielu.
	
   Log_SetTopicStatus	(CH3_Grd_Thief, LOG_SUCCESS);
	B_LogEntry		(CH3_Grd_Thief, "Harford mnie wykorzysta³! Sukinsyn nie dotrzyma³ s³owa. Mam ju¿ doœæ tej cholernej Kolonii.");
};

INSTANCE DIA_Harf_End (C_INFO)
{
	npc				= Stt_342_Harford;
	nr				= 5;
	condition		= DIA_Harf_End_Condition;
	information		= DIA_Harf_End_Info;
	permanent		= 0;
	important		= 0;
	description		= "Chcia³em..."; 
};

FUNC INT DIA_Harf_End_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Harf_End_Info()
{
	AI_Output (other, self, "DIA_Harf_End_15_01"); //Chcia³em...
	AI_Output (self, other, "DIA_Harf_End_11_02"); //Nie mamy o czym rozmawiaæ.
	B_StopProcessInfos	(self);
}; 
