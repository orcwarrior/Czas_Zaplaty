// ************************ EXIT **************************

instance  STT_Balam_Exit (C_INFO)
{
	npc			=  STT_324_Balam;
	nr			=  999;
	condition	=  STT_Balam_Exit_Condition;
	information	=  STT_Balam_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int STT_Balam_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_Balam_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ***************** Infos *****************************

instance  STT_Balam_Hello (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Hello_Condition;
	information		= STT_Balam_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witam."; 
};

FUNC int  STT_Balam_Hello_Condition()
{
	return 1;
};

FUNC void  STT_Balam_Hello_Info()
{
	AI_Output (other, self,"STT_Balam_Hello_Info_15_01"); //Witam.
	AI_Output (self, other,"STT_Balam_Hello_Info_07_02"); //ZejdŸ mi z oczu. Mam pe³ne rêce roboty!
	B_StopProcessInfos	(self);	
};  

// ***************** diego find *****************************

instance  STT_Balam_Again (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Again_Condition;
	information		= STT_Balam_Again_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_Again_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Hello))&&(Npc_KnowsInfo(hero,DIA_Urt_Buddler))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Again_Info()
{	
	AI_Output (self, other,"STT_Balam_Again_Info_07_01"); //Zaraz... Ty nie jesteœ stra¿nikiem, znam ich wszystkich, a Twoja morda nijak mi nie pasuje do tej zbroi.
	AI_Output (self, other,"STT_Balam_Again_Info_07_02"); //Kim Ty do cholery jesteœ?
	AI_Output (other, self,"STT_Balam_Again_Info_15_03"); //Zagram w otwarte karty. Przyby³em z obozu rebeliantów...
	AI_Output (self, other,"STT_Balam_Again_Info_07_04"); //Ciszej cz³owieku!
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"STT_Balam_Again_Info_07_05"); //Po jak¹ cholerê tutaj przylaz³eœ? ¯ycie Ci niemi³e? I dlaczego nie mia³bym zawo³aæ stra¿ników?
	AI_Output (other, self,"STT_Balam_Again_Info_15_06"); //Mam zamiar z Twoj¹ pomoc¹ przekonaæ cienie, ¿eby w decyduj¹cym momencie stanêli po naszej stronie.
	AI_Output (self, other,"STT_Balam_Again_Info_07_07"); //W decyduj¹cym momencie? Co Ty gadasz? Chyba nie chcesz mi powiedzieæ, ¿e rebelianci planuj¹ atak na Stary Obóz? To by³oby szaleñstwo i skrajny idiotyzm!
	AI_Output (other, self,"STT_Balam_Again_Info_15_08"); //Najlepsz¹ obron¹ jest atak, a my nie mamy wyboru. Przejêliœmy Star¹ Kopalniê...
	AI_Output (self, other,"STT_Balam_Again_Info_07_09"); //Na jaja Beliara, Gomeza pewnie ju¿ krew zalewa. Zaczynasz mi siê podobaæ ch³opcze. Mów dalej.
	AI_Output (other, self,"STT_Balam_Again_Info_15_10"); //Stra¿nicy nied³ugo uderz¹ na nasz obóz, zdajemy sobie sprawê, ¿e nie mielibyœmy szans. Atak na Star¹ Kopalniê przyspieszy decyzjê Gomeza i da nam wiêksz¹ szansê na atak z zaskoczenia.
	AI_Output (other, self,"STT_Balam_Again_Info_15_11"); //Sami nie pokonamy stra¿ników, jednak maj¹c przy boku cienie zniszczymy magnatów!
	AI_Output (self, other,"STT_Balam_Again_Info_07_12"); //Hmm, plan nieg³upi, ale powiem szczerze, ¿e cienie mnie nie pos³uchaj¹.
	AI_Output (self, other,"STT_Balam_Again_Info_07_13"); //Za to co mi powiedzia³eœ, Gomez by mnie oz³oci³. Ale bez obaw, bêdê trzyma³ jêzyk za zêbami. To nasza wspólna szansa...
	AI_Output (self, other,"STT_Balam_Again_Info_07_14"); //Jest jednak ktoœ komu cienie ufaj¹ bezgranicznie i za kim pójd¹ w ogieñ.
	AI_Output (other, self,"STT_Balam_Again_Info_15_15"); //Kto to?
	AI_Output (self, other,"STT_Balam_Again_Info_07_16"); //To Diego. Twardy z niego sukinsyn. Jednak po ataku na magów ognia ju¿ nie pojawi³ siê w obozie.
	AI_Output (other, self,"STT_Balam_Again_Info_15_17"); //W takim razie muszê z nim porozmawiaæ. Gdzie go znajdê?
	AI_Output (self, other,"STT_Balam_Again_Info_07_18"); //Nie mam bladego pojêcia. Ale rozejrzyj siê po Kolonii, pewnie gdzieœ siê zaszy³ i czeka na lepsze czasy.
	AI_Output (self, other,"STT_Balam_Again_Info_07_19"); //Powiedz mu, ¿e Balam przesy³a pozdrowienia. Powiedz te¿, ¿e jesteœmy gotowi, ¿eby nas poprowadzi³.
	AI_Output (self, other,"STT_Balam_Again_Info_07_20"); //Aha i Diego musi pokazaæ siê w obozie, inaczej cienie nie uwierz¹ w to, ¿e wróci³.
	AI_Output (other, self,"STT_Balam_Again_Info_15_21"); //Dobra, zobaczê co da siê zrobiæ.
	
   WLD_InsertNPC(PC_Thief,"OC1");
	B_LogEntry		(CH3_RBL_Shadows, "Rozmawia³em z Balamem. Kucharz powiedzia³ mi, ¿e tylko Diego jest w stanie przekonaæ cienie do walki przeciwko stra¿nikom. Muszê znaleŸæ Diego i namówiæ go na powrót do obozu.");
	B_StopProcessInfos	(self);	
};  

// ******************************************

instance  STT_Balam_Diego (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Diego_Condition;
	information		= STT_Balam_Diego_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz³em Diego."; 

};

FUNC int  STT_Balam_Diego_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Rebel))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Diego_Info()
{
	AI_Output (other, self,"STT_Balam_Diego_Info_15_01"); //Znalaz³em Diego.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_02"); //To œwietnie. Teraz go przyprowadŸ!
	AI_Output (other, self,"STT_Balam_Diego_Info_15_03"); //To nie takie proste. Najpierw muszê znaleŸæ na to jakiœ sposób. 
	AI_Output (self, other,"STT_Balam_Diego_Info_07_04"); //W takim razie poœpiesz siê do cholery! Mamy coraz mniej czasu...
	AI_Output (self, other,"STT_Balam_Diego_Info_07_05"); //Jak tylko coœ wymyœlisz, to daj mi znaæ.
	//TODO:/CORRECT: Crappy dialog added by orc
	AI_Output (self, other,"STT_Balam_Diego_Info_07_06"); //Poczekaj! Mam pomys³.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_07"); //Magowie ognia potrafili teleportowaæ siê poza mury zamku i wróciæ kiedy przysz³a im na to ochota.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_08"); //Niestety Gomez wszystkich zar¿n¹³.
	AI_Output (other, self,"STT_Balam_Diego_Info_15_09"); //Chyba jednak nie wszystkich, wiem gdzie znaleŸæ jednego z nich.
	AI_Output (self, other,"STT_Balam_Diego_Info_07_10"); //W takim razie powodzenia.
	B_LogEntry		(CH3_RBL_Shadows, "Znalaz³em sposób na przemycenie Diego do Starego Obozu. Muszê porozmawiaæ z Miltenem, mo¿e zosta³a mu jakaœ runa teleportacyjna.");
	B_StopProcessInfos	(self);	
};  

// *********************************************

instance  STT_Balam_DiegoCome (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_DiegoCome_Condition;
	information		= STT_Balam_DiegoCome_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_DiegoCome_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Diego_Entrence))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_DiegoCome_Info()
{
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_01"); //Przyprowadzi³eœ Diego?
	AI_Output (other, self,"STT_Balam_DiegoCome_Info_15_02"); //Tak, nied³ugo powinien do Ciebie zajrzeæ.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_03"); //No to nadszed³ czas na zmiany.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_04"); //Teraz cienie na pewno wezm¹ udzia³ w buncie.
	AI_Output (self, other,"STT_Balam_DiegoCome_Info_07_05"); //Œwietna robota.
	Log_SetTopicStatus	(CH3_RBL_Shadows, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_Shadows, "Diego jest ju¿ w obozie. Balam jest pewien, ¿e zdo³a przekonaæ cienie do walki z Gomezem.");
	B_LogEntry(CH3_RBL_OldCampSpy, "Cienie s¹ z nami!");
	
	B_StopProcessInfos	(self);	
};

// *********************************************
// CHAPTER 6
instance  STT_Balam_Spy (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_Spy_Condition;
	information		= STT_Balam_Spy_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak wygl¹da sytuacja?"; 
};

FUNC int  STT_Balam_Spy_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Urt_DiegoJail))&&(Npc_KnowsInfo(hero,STT_Balam_DiegoCome))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Spy_Info()
{
	AI_Output (other, self,"STT_Balam_Spy_Info_15_01"); //Jak wygl¹da sytuacja?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_02"); //le.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_03"); //Dorwali Diego. Cienie straci³y pewnoœæ siebie i poszli w rozsypkê. W¹tpiê, ¿e chocia¿ co drugi chwyci za miecz, kiedy uderzymy na stra¿ników. 
	AI_Output (self, other,"STT_Balam_Spy_Info_07_04"); //Nie wiem jak kopacze. Jakiœ skurwiel musia³ wypaplaæ stra¿nikom, ¿e Diego wróci³.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_05"); //Musimy znaleŸæ i uciszyæ tê gnidê jak najszybciej!
	AI_Output (other, self,"STT_Balam_Spy_Info_15_06"); //Tu siê z tob¹ zgadzam.
	AI_DrawWeapon (hero);
	AI_Output (self, other,"STT_Balam_Spy_Info_07_07"); //Schowaj ¿elazo, to nie ja idioto! Jaki mia³bym w tym interes?
	AI_Output (other, self,"STT_Balam_Spy_Info_15_08"); //Tylko Ty i Urt wiedzieliœcie o powrocie Diego. W sumie to by³ Twój pomys³. Masz sta³y kontakt z magnatami. Mam mówiæ dalej?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_09"); //Wiem, jak to wygl¹da, ale czasami pod latarni¹ jest najciemniej. Nie ufam Urtowi, ta jego 'szlachetna' walka to tylko pozory. Wiem, co mówiê.
	AI_RemoveWeapon (hero);
	AI_Output (other, self,"STT_Balam_Spy_Info_15_10"); //Sk¹d te podejrzenia?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_11"); //Znam kogoœ, kto zna³ Urta przed tym jak trafi³ do Kolonii. Kiedyœ pogadaliœmy sobie od serca, by³em wtedy jeszcze szkodnikiem w Nowym Obozie.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_12"); //Szkodnikiem? To jak trafi³eœ tutaj?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_13"); //Mia³em ju¿ doœæ s³uchania Laresa. A w zamku akurat zwolni³ siê etat kucharza. Zawsze lubi³em pichciæ, wiêc zaryzykowa³em i nie ¿a³ujê.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_14"); //Sprawdzê Twoj¹ wersjê. Kim jest ten znajomy?
	AI_Output (self, other,"STT_Balam_Spy_Info_07_15"); //To Cipher. Znajdziesz go w Nowym Obozie. Nie wiem co teraz robi, ale wiem co rozwi¹¿e mu jêzyk. Ziele.
	AI_Output (self, other,"STT_Balam_Spy_Info_07_16"); //WeŸ ze sob¹ coœ do palenia, to siê dogadacie.
	AI_Output (other, self,"STT_Balam_Spy_Info_15_17"); //Lepiej dla Ciebie, ¿ebyœ mówi³ prawdê.
	B_LogEntry		(CH6_RBL_Spy, "Sytuacja przybra³a ciekawy obrót. Balam twierdzi, ¿e zdrajc¹ mo¿e byæ Urt, w co nie chce mi siê wierzyæ po tym, ile wczeœniej razem zdzia³aliœmy w Starym Obozie. Nauczy³em siê jednak, ¿e w Kolonii nikomu nie mo¿na zaufaæ. Muszê porozmawiaæ z Cipherem o Urcie. Aha i przyda siê ziele dla Ciphera, ¿eby mu rozwi¹zaæ jêzyk.");
};

// *********************************************

instance STT_Balam_FeedDiego (C_INFO)
{
	npc				= STT_324_Balam;
	condition		= STT_Balam_FeedDiego_Condition;
	information		= STT_Balam_FeedDiego_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno to Ty zanosisz jedzenie do celi Diego?"; 
};

FUNC int STT_Balam_FeedDiego_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Bullit_Guard))
	{
		return 1;
	};
};

FUNC void STT_Balam_FeedDiego_Info()
{
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_01"); //Podobno to Ty zanosisz jedzenie do celi Diego?
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_02"); //Chyba za karê. Jak widzê twarz Diego to a¿ mnie skrêca. Ale nie mam szans ze stra¿nikiem, poza tym jak byœmy uciekli?
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_03"); //Nie ma wiele czasu, Diego wkrótce zostanie stracony. Musimy go stamt¹d wyrwaæ, a ja nie mogê siê krêciæ po lochach, ¿eby nie wzbudziæ podejrzeñ.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_04"); //Niby jak mamy to zrobiæ?
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_05"); //Bulit twierdzi, ¿e stra¿nik zawsze zabiera miêso, które zanosisz Diego.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_06"); //To prawda - cholerny ¿ar³ok.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_07"); //Bardzo dobrze, zach³annoœæ go zgubi. Musimy po cichu za³atwiæ stra¿nika. Zatrujesz miêso i zaniesiesz jedzenie do celi Diego.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_08"); //Jakby stra¿nik zapyta³ siê dlaczego o tej porze to powiesz, ¿e to ostatni posi³ek skazañca.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_09"); //¯e na tê okazjê przyrz¹dzi³eœ specjalne pieczyste z szynki - na pewno siê skusi.
	AI_Output (self, other,"STT_Balam_FeedDiego_Info_07_10"); //NieŸle to wymyœli³eœ. Ale nie mam szynki, o truciŸnie nawet nie wspominaj¹c.
	AI_Output (other, self,"STT_Balam_FeedDiego_Info_15_11"); //Tym ja siê zajmê. Nied³ugo wrócê z miêsem i trutk¹, wtedy zabierzesz siê za pichcenie.
	
   B_LogEntry(CH6_RBL_Diego, "Balam przyrz¹dzi zatrut¹ szynkê. Muszê mu jednak dostarczyæ miêso i truciznê. Z szynk¹ nie powinno byæ problemów, ale trucizna? Hmm, mo¿e mój 'mistrz' mi jak¹œ odst¹pi. Czas nas goni, wiêc muszê siê poœpieszyæ!");
};

// *********************************************

instance  STT_Balam_Ham (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 10;
	condition		= STT_Balam_Ham_Condition;
	information		= STT_Balam_Ham_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mam szynkê."; 
};

FUNC int  STT_Balam_Ham_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))&&(NPC_HasItems(other,ItFo_mutton_01)>=1)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Ham_Info()
{
	AI_Output (other, self,"STT_Balam_Ham_Info_15_01"); //Mam szynkê.
	AI_Output (self, other,"STT_Balam_Ham_Info_07_02"); //Zaraz j¹ przyrz¹dzê.
	B_GiveInvItems (other, self, ItFo_mutton_01, 1);
	Npc_RemoveInvItems(self,ItFo_mutton_01,1);
	AI_Output (other, self,"STT_Balam_Ham_Info_15_03"); //Tylko jej nie zjedz.
	AI_Output (self, other,"STT_Balam_Ham_Info_07_04"); //Bez obaw. Zaraz siê tym zajmê.
	B_LogEntry		(CH6_RBL_Diego, "Odda³em szynkê Balamowi.");
	B_FullStop (hero);
	AI_SetWalkmode (self,NPC_WALK);
	AI_GotoWP	(self, "ROAST");

	/**************************
Ma podejœæ do patelni, ¿e niby piecze.

*************************/

	AI_UseMob(self,"PAN",1);	
	B_InterruptMob ("PAN");
	AI_UseMob (self,"PAN",-1);
	B_StopProcessInfos	(self);
};

// *********************************************

instance  STT_Balam_Poison (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 11;
	condition		= STT_Balam_Poison_Condition;
	information		= STT_Balam_Poison_Info;
	important		= 0;
	permanent		= 0;
	description		= "WeŸ truciznê."; 
};

FUNC int  STT_Balam_Poison_Condition()
{
	if (Npc_KnowsInfo(hero, STT_Balam_FeedDiego))&&((NPC_HasItems(other,ItFo_Potion_Poison)>=1)||(NPC_HasItems(other,ItFo_Nabil_Poison)>=1))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Poison_Info()
{
	AI_Output (other, self,"STT_Balam_Poison_Info_15_01"); //WeŸ truciznê.
	AI_Output (self, other,"STT_Balam_Poison_Info_07_02"); //Jak Ty to zdoby³eœ?
	
   if (NPC_HasItems(other,ItFo_Potion_Poison)>=1)
	{
		B_GiveInvItems (other, self, ItFo_Potion_Poison, 1);
		Npc_RemoveInvItems(self,ItFo_Potion_Poison,1);
	}
	else if (NPC_HasItems(other,ItFo_Nabil_Poison)>=1)
	{
		B_GiveInvItems (other, self, ItFo_Nabil_Poison, 1);
		Npc_RemoveInvItems(self,ItFo_Nabil_Poison,1);
	};

	AI_Output (other, self,"STT_Balam_Poison_Info_15_03"); //Niewa¿ne. Tylko uwa¿aj, to zabija szybciej ni¿ cieniostwór.
	AI_Output (self, other,"STT_Balam_Poison_Info_07_04"); //Bêdê o tym pamiêta³.
	B_LogEntry		(CH6_RBL_Diego, "Balam dosta³ truciznê.");
	//B_FullStop (hero);
	//AI_SetWalkmode (self,NPC_WALK);
	//AI_GotoWP	(self, "ROAST");

	/**************************
Ma podejœæ do patelni, ¿e niby piecze.
-trucizne piecze? ;d /orc
-nie, ale musi ni¹ polaæ miês £osiu ;P /sher
*************************/
	/*
		AI_UseMob(self,"PAN",1);	
		B_InterruptMob ("PAN");
		AI_UseMob (self,"PAN",-1);
		B_StopProcessInfos	(self);
*/
};

// *********************************************

instance  STT_Balam_GoDiego (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 12;
	condition		= STT_Balam_GoDiego_Condition;
	information		= STT_Balam_GoDiego_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_GoDiego_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Poison))&&(Npc_KnowsInfo(hero,STT_Balam_Ham))&&(Npc_GetDistToNpc(self,hero) < 600)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_GoDiego_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"STT_Balam_GoDiego_Info_07_01"); //Mamy ju¿ wszystko. Idê.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_02"); //Obszukaj cia³o stra¿nika, musi mieæ przy sobie klucz do celi.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_03"); //Nie baw siê w bohatera. Przynieœ klucz, a ja zajmê siê reszt¹.
	AI_Output (other, self,"STT_Balam_GoDiego_Info_15_04"); //Tylko nie rzucaj siê w oczy.
	AI_Output (self, other,"STT_Balam_GoDiego_Info_07_05"); //Poradzê sobie. Czekaj tu na mnie, nied³ugo bêdê z powrotem.
	B_StopProcessInfos	(self);

	/*************************
Nie musi iœæ do samej celi, ale niech zniknie Dickowi z oczu i niech to chwilkê potrwa zanim wróci

*************************/
   AI_SetWalkmode (self, NPC_RUN);
	AI_GotoWP		(self, "OCC_MERCS_ENTRANCE");
	AI_GotoWP		(self, hero.wp);
};

// *********************************************

instance  STT_Balam_GoBackDiego (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 13;
	condition		= STT_Balam_GoBackDiego_Condition;
	information		= STT_Balam_GoBackDiego_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int  STT_Balam_GoBackDiego_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_GoDiego))&&(Npc_GetDistToNpc(self,hero) < 600)&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_GoBackDiego_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   if (diego_dead >= (Wld_GetDay()))
	{

		/********************
Killing stra¿nika ¿ar³oka

*********************/

		var C_NPC grd; grd = Hlp_GetNpc(Grd_4107_Guard);
		Npc_ChangeAttribute	(grd, ATR_HITPOINTS, -grd.attribute[ATR_HITPOINTS_MAX]);

		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_01"); //Cholera, uda³o siê! Pad³ jak k³oda.
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_02"); //Obszuka³eœ cia³o?
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_03"); //Tak, znalaz³em przy nim klucz.
		CreateInvItems (self,DUNGEONKEY,1);
		B_GiveInvItems (self, other, DUNGEONKEY, 1);
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_04"); //Œwietna robota, Balam.
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_05"); //Zrobi³em to dla Diego. Poœpiesz siê.
		B_LogEntry		(CH6_RBL_Diego, "Stra¿nik nie ¿yje, mam klucz do celi Diego. Muszê jak najszybciej go uwolniæ.");
	}
	else
	{
		var C_NPC thf; thf = Hlp_GetNpc(PC_Thief);
		AI_PlayAni		(thf,	"T_PSI_VICTIM");
		Npc_ChangeAttribute	(thf, ATR_HITPOINTS, -thf.attribute[ATR_HITPOINTS_MAX]);

		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_06"); //SpóŸniliœmy siê, Diego nie ¿yje...
		AI_Output (other, self,"STT_Balam_GoBackDiego_Info_15_07"); //Kurwa maæ! Co teraz?
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_08"); //Cienie na pewno nie pomog¹ w rebelii...
		AI_Output (self, other,"STT_Balam_GoBackDiego_Info_07_09"); //Ktoœ tu idzie... To stra¿nicy, pewnie przyszli za mn¹...
		Log_SetTopicStatus	(CH6_RBL_Diego, LOG_FAILED);
		B_LogEntry		(CH6_RBL_Diego, "Skrewi³em, Diego nie ¿yje...");
		/**********************
Nie wiem czy dodasz kilku nowych grds czy przyjd¹ jacyœ z obozu, ale niech ich bêdzie tylu, ¿eby dick nie mia³ szans.
Mo¿esz wykorzystaæ tych martwych stra¿ników z poprzednich zadañ, gracz siê nie po³apie - tu ich instancje:

B_Attack_OC_GuardsGate();

GRD_2514_Guard
GRD_2515_Guard
GRD_2516_Guard
GRD_2517_Guard
GRD_2518_Guard

GRD_4056_Guard
GRD_4057_Guard
GRD_4058_Guard
GRD_4059_Guard
GRD_4060_Guard
GRD_4061_Guard

GRD_4065_Guard
GRD_4066_Guard
GRD_4067_Guard
GRD_4068_Guard


Tylu powinno wystarczyæ ;P
**********************/

		/*********************
Trochê ciulowo bo Diego by³ w G2 i G3 wiêc musi prze¿yæ. Mo¿e niech jednak gracz MUSI go uratowaæ, ¿eby nie by³o niezgodnoœci.
Dlatego doda³em atak stra¿ników - aha musi ich byæ tylu, ¿eby zabiæ dicka xD

******************/

	};
};

// *********************************************

instance  STT_Balam_Urthos (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 14;
	condition		= STT_Balam_Urthos_Condition;
	information		= STT_Balam_Urthos_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mia³eœ racjê."; 
};

FUNC int  STT_Balam_Urthos_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cipher_Urt))&&(Npc_KnowsInfo(hero,DIA_Lee_Urt))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_Urthos_Info()
{
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_01"); //Mia³eœ racjê.
	AI_Output (self, other,"STT_Balam_Urthos_Info_07_02"); //O czym mówisz?
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_03"); //Urt to podejrzany typ. Ale muszê zdobyæ niezbite dowody jego zdrady. Na razie musimy tañczyæ tak jak nam zagra.
	AI_Output (self, other,"STT_Balam_Urthos_Info_07_04"); //Jestem pewien, ¿e Diego mo¿e Ci w tym pomóc. Ten niby atak i uwiêzienie Diego to musia³a byæ robota Urta.
	AI_Output (other, self,"STT_Balam_Urthos_Info_15_05"); //Mo¿e masz racjê. Diego powinien wiedzieæ coœ wiêcej.
	
   B_LogEntry		(CH6_RBL_Spy, "Balam trafnie zauwa¿y³, ¿e powinienem porozmawiaæ z Diego o Urcie. Mo¿e on bêdzie mia³ konkretny dowód zdrady Urthosa.");
};

// *********************************************

instance  STT_Balam_UrthosFinish (C_INFO)
{
	npc				= STT_324_Balam;
	nr				= 15;
	condition		= STT_Balam_UrthosFinish_Condition;
	information		= STT_Balam_UrthosFinish_Info;
	important		= 0;
	permanent		= 0;
	description		= "Uwolni³em Diego."; 
};

FUNC int  STT_Balam_UrthosFinish_Condition()
{
	if (Npc_KnowsInfo(hero,STT_Balam_Urthos))&&(Npc_KnowsInfo(hero,Info_Diego_Prison))&&(Wld_IsTime (20,00,24,00))
	{
		return 1;
	};
};

FUNC void  STT_Balam_UrthosFinish_Info()
{
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_01"); //Uwolni³em Diego. Musisz zorganizowaæ cieni i kopaczy, nied³ugo zaatakujemy.
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_02"); //Uff, kamieñ spad³ mi z pêcherza. Ba³em siê, ¿e cienie strac¹ zapa³ do walki. Zajmê siê wszystkim. Mam nadziejê, ¿e Diego wróci kiedy nadejdzie Czas Zap³aty.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_03"); //Mo¿esz byæ tego pewien. Diego potwierdzi³ Twoje s³owa, to Urt od samego pocz¹tku nas sabotowa³.
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_04"); //Musisz raz na zawsze pozbyæ siê tego skurwiela! Przez niego zgin¹³ Kelvin i wielu innych porz¹dnych ludzi.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_05"); //Na wszystko przyjdzie w³aœciwy czas. 
	AI_Output (self, other,"STT_Balam_UrthosFinish_Info_07_06"); //Jak zobaczê Urta, to osobiœcie wyprujê mu flaki.
	AI_Output (other, self,"STT_Balam_UrthosFinish_Info_15_07"); //Uwa¿aj na siebie, Balam.
   
	Log_SetTopicStatus	(CH6_RBL_Spy, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Spy, "Tak, Urt zas³u¿y³ na d³ug¹ i powoln¹ œmieræ, ale na wszystko przyjdzie w³aœciwy czas.");
	B_LogEntry		(CH6_RBL_Recognise, "Urt nas zdradzi³, to on doprowadzi³ do œmierci Kelvina i od pocz¹tku sterowa³ nasz¹ siatk¹ w Starym Obozie. Trzeba go raz na zawsze uciszyæ.");
   
   var c_npc urt; urt = Hlp_GetNPC(RBL_4062_Urt);
	B_ExchangeRoutine(urt, "GONE");
}; 
