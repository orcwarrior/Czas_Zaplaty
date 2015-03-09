// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Kira_EXIT(C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 999;
	condition			= Info_Kira_EXIT_Condition;
	information			= Info_Kira_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Kira_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Kira_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Kira_Hello (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 1;
	condition		= Info_Kira_Hello_Condition;
	information		= Info_Kira_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Co tutaj robi kobieta?!";
};                       

FUNC INT Info_Kira_Hello_Condition()
{	
	if (Korth_ok)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Hello_Info()
{	
	AI_Output (other, self,"Info_Kira_Hello_15_00"); //Co tutaj robi kobieta?!
	AI_Output (self, other,"Info_Kira_Hello_16_01"); //Myje gary, sprz¹ta i przynosi piwko do ogniska znu¿onym wojownikom.
	AI_Output (other, self,"Info_Kira_Hello_15_03"); //Nie chcia³em Ciê uraziæ, po prostu trudno mi uwierzyæ w to co widzê.
	AI_Output (self, other,"Info_Kira_Hello_16_04"); //Lepiej siê do tego przyzwyczaj, ogierze.
};

// ************************************************************

INSTANCE Info_Kira_Camp (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 3;
	condition		= Info_Kira_Camp_Condition;
	information		= Info_Kira_Camp_Info;
	important		= 0;
	permanent		= 0;
	description 	= "To ty jesteœ tu... szefem?";
};                       

FUNC INT Info_Kira_Camp_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Snow_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Camp_Info()
{	
	AI_Output (other, self,"Info_Kira_Camp_15_00"); //To ty jesteœ tu... szefem?
	AI_Output (self, other,"Info_Kira_Camp_16_01"); //Masz z tym jakiœ problem?
	AI_Output (other, self,"Info_Kira_Camp_15_03"); //Bynajmniej, tylko coœ mi nie pasuje. Kobieta mówi tym wszystkim zakapiorom, co maj¹ robiæ. Niesamowite...
	AI_Output (self, other,"Info_Kira_Camp_16_04"); //Niesamowita to jest Twoja bezczelnoœæ. Uwa¿aj, ¿ebym Ciê nie dosiad³a ogierze, bo wtedy bêdziesz skomla³ i b³aga³ o litoœæ!
};

// ************************************************************

INSTANCE Info_Kira_Ork (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 4;
	condition		= Info_Kira_Ork_Condition;
	information		= Info_Kira_Ork_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Rozmawia³em z jakimœ orkiem.";
};                       

FUNC INT Info_Kira_Ork_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Kron_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Ork_Info()
{	
	AI_Output (other, self,"Info_Kira_Ork_15_00"); //Rozmawia³em z jakimœ orkiem.
	AI_Output (self, other,"Info_Kira_Ork_16_01"); //Kron do³¹czy³ do nas z w³asnej woli. Wbrew pozorom pod t¹ g³upi¹ min¹ kryje siê spora inteligencja.
	AI_Output (other, self,"Info_Kira_Ork_15_02"); //Myœla³em, ¿e orkowie to bezmózgie potwory, które atakuj¹ wszystko w zasiêgu wzroku.
	AI_Output (self, other,"Info_Kira_Ork_16_03"); //Nie wszyscy tacy s¹. Tam sk¹d pochodzê orkowie w³adaj¹ sporym mocarstwem.
	AI_Output (self, other,"Info_Kira_Ork_16_04"); //S¹ te¿ wspania³ymi wojownikami. Nie radzê prowokowaæ Krona, bo mo¿esz gorzko tego po¿a³owaæ.
};

// ************************************************************

INSTANCE Info_Kira_Thangor (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 5;
	condition		= Info_Kira_Thangor_Condition;
	information		= Info_Kira_Thangor_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Ten Tablor to niemowa?";
};                       

FUNC INT Info_Kira_Thangor_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Npc_KnowsInfo (hero, DIA_Tablor_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Thangor_Info()
{	
	AI_Output (other, self,"Info_Kira_Thangor_15_00"); //Ten Tablor to niemowa?
	AI_Output (self, other,"Info_Kira_Thangor_16_01"); //Tablor rozmawia tylko z tymi, których szanuje, lub którzy pokonaj¹ go w walce.
	AI_Output (other, self,"Info_Kira_Thangor_15_03"); //Dziwne. Czyli, ¿eby z nim pogadaæ muszê go st³uc?
	AI_Output (self, other,"Info_Kira_Thangor_16_04"); //Albo udowodniæ, ¿e zas³u¿y³eœ na miano wojownika, co nie jest takie proste.
	AI_Output (other, self,"Info_Kira_Thangor_15_05"); //Rozumiem. Czyli zwróci na mnie uwagê jak kogoœ st³ukê?
	AI_Output (self, other,"Info_Kira_Thangor_16_06"); //Byæ mo¿e, ale musia³byœ pokonaæ niez³ego wojownika, ¿eby Tablor siê tym zainteresowa³.
};

var int kira_quest;

// ************************************************************

INSTANCE Info_Kira_What (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 2;
	condition		= Info_Kira_What_Condition;
	information		= Info_Kira_What_Info;
	important		= 1;
	permanent		= 1;
	description 	= "Co do sojuszu...";
};                       

FUNC INT Info_Kira_What_Condition()
{	
	//TODO: statement
	if (Npc_KnowsInfo (hero, Info_Kira_Hello))&&(Korth_ok==TRUE)&&(TH_trust<1)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_What_Info()
{	
	if (kira_quest == FALSE)
	{
		kira_quest = TRUE;
		Info_Kira_What.important = 0;
      
		AI_Output (self, other,"Info_Kira_What_16_00"); //Skoro Korth ju¿ Ciê tu wpuœci³, to mów, czego chcesz.
		AI_Output (other, self,"Info_Kira_What_15_01"); //Przysy³a mnie Cavalorn. Rebelianci szukaj¹ sojuszników w nadchodz¹cej walce ze Starym Obozem.
		AI_Output (self, other,"Info_Kira_What_16_02"); //I przys³a³ tu Ciebie? Czy Cavalorn chcia³ nas obraziæ?
		AI_Output (other, self,"Info_Kira_What_15_03"); //Dlaczego tak uwa¿asz?
		AI_Output (self, other,"Info_Kira_What_16_04"); //Ktoœ kto pragnie sojuszu i wysy³a z propozycj¹ nieopierzonego kurczaka, nie zas³uguje na nasz szacunek.
		AI_Output (other, self,"Info_Kira_What_15_05"); //Nie jestem taki nieopierzony, jak Ci siê wydaje.
		AI_Output (self, other,"Info_Kira_What_16_06"); //To siê dopiero oka¿e. A dlaczego Cavalorn sam tu nie przyby³?
		AI_Output (other, self,"Info_Kira_What_15_07"); //Cavalorn jest przywódc¹ obozu, który przygotowuje siê do walki. Ma sporo na g³owie...
		AI_Output (self, other,"Info_Kira_What_16_08"); //W to nie w¹tpiê...
		AI_Output (self, other,"Info_Kira_What_16_09"); //Hmm, chcecie sojuszu?
		AI_PlayAni(other,"T_YES");
		AI_Output (self, other,"Info_Kira_What_16_10"); //Nie interesuj¹ nas problemy innych obozów. Dbamy tylko o w³asn¹ skórê i o trofea, które zdobywamy.
		AI_Output (self, other,"Info_Kira_What_16_11"); //Kiedy upadnie bariera odejdziemy st¹d, jako bardzo bogaci ludzie. Dlaczego mielibyœmy zaprz¹taæ sobie g³owê waszymi problemami?
		AI_Output (other, self,"Info_Kira_What_15_12"); //A jak¹ masz pewnoœæ, ¿e Gomez i was nie zaatakuje?
		AI_Output (self, other,"Info_Kira_What_16_13"); //To proste, nie mamy rudy. Jedyne co posiadamy to trofea zabitych zwierz¹t.
		AI_Output (other, self,"Info_Kira_What_15_14"); //To sk¹d pewnoœæ, ¿e Gomez nie bêdzie chcia³ zgarn¹æ trofeów? Maj¹ spor¹ wartoœæ...
		AI_Output (self, other,"Info_Kira_What_16_15"); //Niech tylko spróbuje po nie siêgn¹æ, to odr¹biê mu ³apska przy samej dupie!
		AI_Output (other, self,"Info_Kira_What_15_16"); //Wszystkich nie zabijecie. Wielu ze sob¹ zabierzecie, ale Gomez ma ca³¹ armiê stra¿ników i cieni.
		AI_Output (self, other,"Info_Kira_What_16_17"); //Nie podoba mi siê to, co mówisz. 
		AI_Output (other, self,"Info_Kira_What_15_18"); //Doskonale wiesz, ¿e mam racjê. Wybór nale¿y do was.
		AI_Output (other, self,"Info_Kira_What_15_19"); //Je¿eli staniecie u naszego boku w walce z Gomezem, wszyscy bêdziemy mieæ wiêksz¹ szansê na wygran¹.
		AI_Output (self, other,"Info_Kira_What_16_20"); //Nie znam bojowej wartoœci waszych ludzi. Sk¹d mam wiedzieæ, czy to nie banda tchórzy, którzy uciekn¹ na widok stra¿ników?
		AI_Output (other, self,"Info_Kira_What_15_21"); //SprawdŸ nas.
		AI_Output (self, other,"Info_Kira_What_16_22"); //Hmm, tak te¿ i zrobiê. To od Ciebie zale¿eæ bêdzie moja decyzja.
		AI_Output (self, other,"Info_Kira_What_16_23"); //Je¿eli udowodnisz nam, ¿e jesteœ godnym wojownikiem, zastanowiê siê nad sojuszem.
		AI_Output (self, other,"Info_Kira_What_16_24"); //Je¿eli oka¿e siê, ¿e nie podo³asz wyzwaniom, rzucê Ciê trollom na po¿arcie.
		AI_Output (self, other,"Info_Kira_What_16_25"); //Co Ty na to ogierze?
	}
	else
	{
		AI_Output (other, self,"Info_Kira_What_15_26"); //Co do sojuszu...
		AI_Output (self, other,"Info_Kira_What_16_27"); //Podj¹³eœ decyzjê?
	};
	
	Info_ClearChoices (Info_Kira_What);

	Info_AddChoice (Info_Kira_What, "Muszê siê zastanowiæ.", Info_Kira_What_No);
	Info_AddChoice (Info_Kira_What, "Zgoda.", Info_Kira_What_Yes);	
};

FUNC VOID Info_Kira_What_Yes()
{
	TH_trust  = 1;	
   
	AI_Output (other,self,"Info_Kira_What_Yes_Info_15_01"); //Zgoda.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_02"); //Zaczynasz mi siê podobaæ coraz bardziej, ogierze.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_03"); //Zanim podejmê decyzjê, przekonaj do siebie ch³opaków.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_04"); //Jak Ci siê powiedzie, to czeka Ciê prawdziwy sprawdzian mêstwa.
	AI_Output (other,self,"Info_Kira_What_Yes_Info_15_05"); //Zrobiê, co w mojej mocy.
	AI_Output (self, other,"Info_Kira_What_Yes_Info_16_06"); //Tylko nie daj siê posiekaæ. By³oby szkoda takiego przystojniaka...
	
	B_LogEntry		(CH2_Rbl_BlackTroll, "Muszê zdobyæ szacunek ³owców, ¿eby dowieœæ swej wartoœci jak i wartoœci ca³ego obozu rebeliantów. Wszystko w moich rêkach.");
	Log_CreateTopic	(CH2_TRL_Quest, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Quest, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Quest, "Przywódczyni ³owców trolli powiedzia³a mi, ¿e przemyœli sojusz, je¿eli udowodniê, i¿ rebelianci bêd¹ godnymi sojusznikami. Muszê dowieœæ swego mêstwa i przydatnoœci. Czeka mnie sporo prób w obozie ³owców trolli.");
	
	B_StopProcessInfos	(self);
};

// ------------------2----------------

FUNC VOID Info_Kira_What_No()
{
	AI_Output (other,self,"Info_Kira_What_No_Info_15_01"); //Muszê siê zastanowiæ.
	AI_Output (self, other,"Info_Kira_What_No_Info_16_02"); //Poœpiesz siê, Gomez nie bêdzie czeka³ wiecznie.
	
   Info_ClearChoices (DIA_Korth_Hello);
	B_StopProcessInfos	(self);
};


/********************************

Seksior z Kir¹

********************************/

FUNC VOID B_KiraSex()
{
	PlayVideo("LOVESCENE.BIK");
	PrintScreen	("Kira prawie Ciê wykoñczy³a!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_HITPOINTS] = 25;
	B_StopProcessInfos	(self);
};

func void B_Kira_sojusz(var int exp)
{
   TH_trust=10;
	B_GiveXP (exp);
      
   AI_Output (self, other,"Info_Kira_After_16_02"); //Musisz byæ bardzo zdeterminowany...
	AI_Output (other, self,"Info_Kira_After_15_03"); //Zale¿y nam na sojuszu, Kira. Gomez jest zagro¿eniem dla ca³ej Kolonii.
	AI_Output (other, self,"Info_Kira_After_15_04"); //Prêdzej b¹dŸ póŸniej was te¿ czeka walka. Je¿eli po³¹czymy si³y, mamy szansê uwolniæ œwiat od kolejnego szaleñca.
	AI_Output (self, other,"Info_Kira_After_16_05"); //Ju¿ dawno nie s³ysza³am tak kwiecistej mowy... Zrobi³eœ mi apetyt ogierze.
	AI_Output (other, self,"Info_Kira_After_15_06"); //Hmm, apetyt na co?
	AI_Output (self, other,"Info_Kira_After_16_07"); //Na Ciebie mój drogi...
	AI_Output (other, self,"Info_Kira_After_15_08"); //Ju¿ dawno nie by³em z kobiet¹...
	AI_Output (self, other,"Info_Kira_After_16_09"); //Ja te¿, ale wolê mê¿czyzn. Œci¹gaj ³achy ogierze!
		
   Log_SetTopicStatus	(CH2_TRL_Quest, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_Quest, "Zdoby³em zaufanie wszystkich ³owców - Kira by³a pod wra¿eniem. Nawet nie wiem, kiedy zdar³a ze mnie ubranie i ma³o mnie nie zajecha³a na œmieræ... Rozumiem ju¿ dlaczego ³owcy tak siê jej boj¹.");
};
// ************************************************************

INSTANCE Info_Kira_After (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 3;
	condition		= Info_Kira_After_Condition;
	information		= Info_Kira_After_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Co mówi¹ o mnie Twoi... mê¿czyŸni?";
};                       

FUNC INT Info_Kira_After_Condition()
{	
	if (TH_trust >= 1)&&(TH_trust<9)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_After_Info()
{	
	AI_Output (other, self,"Info_Kira_After_15_00"); //Co mówi¹ o mnie Twoi... mê¿czyŸni?
   
	if (TH_trust == 8)
	{
		AI_Output (self, other,"Info_Kira_After_16_01"); //Niesamowite, zdo³a³eœ przekonaæ wszystkich!
		
      B_Kira_sojusz(1500);
	}
	else if (TH_trust >= 5)
	{
		AI_Output (self, other,"Info_Kira_After_16_12"); //Zdo³a³eœ przekonaæ prawie wszystkich!
      
      B_Kira_sojusz(1000);
	}	
	else if (TH_trust > 1)&&(TH_trust < 6)
	{
		AI_Output (self, other,"Info_Kira_After_16_10"); //Niektórzy ju¿ siê na Tobie poznali, ale musisz zdobyæ szacunek wszystkich.
		B_StopProcessInfos	(self);
	}
	else if (TH_trust == 1)
	{
		AI_Output (self, other,"Info_Kira_After_16_11"); //Nie dra¿nij mnie ogierze. Porozmawiaj z ch³opakami i zdob¹dŸ ich szacunek.
		B_StopProcessInfos	(self);
	};
};

// ************************************************************

INSTANCE Info_Kira_AfterSex (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 4;
	condition		= Info_Kira_AfterSex_Condition;
	information		= Info_Kira_AfterSex_Info;
	important		= 1;
	permanent		= 0;
	description 	= "...";
};                       

FUNC INT Info_Kira_AfterSex_Condition()
{	
	if (TH_trust >= 10)//kira_trail can be various - orc
	{
		return 1;
	};
};

FUNC VOID Info_Kira_AfterSex_Info()
{	
   B_KiraSex ();
   
	AI_Output (self, other,"Info_Kira_AfterSex_16_01"); //Nie zawiod³am siê na Tobie, ogierze.
	AI_Output (other, self,"Info_Kira_AfterSex_15_02"); //To by³o... dog³êbne doznanie.
	AI_Output (self, other,"Info_Kira_AfterSex_16_03"); //Rzeczywiœcie silny z Ciebie skurczybyk. Ju¿ dawno siê tak nie zmacha³am.
	AI_Output (self, other,"Info_Kira_AfterSex_16_04"); //Pozosta³a jednak ostatnia próba.
	AI_Output (other, self,"Info_Kira_AfterSex_15_05"); //Sprostam jej, jak wszystkim poprzednim.
	AI_Output (self, other,"Info_Kira_AfterSex_16_06"); //To siê dopiero oka¿e.
	AI_Output (self, other,"Info_Kira_AfterSex_16_07"); //¯eby narodzi³ siê sojusz, musisz staæ siê jednym z nas.
	AI_Output (other, self,"Info_Kira_AfterSex_15_08"); //Co powinienem zrobiæ?
	AI_Output (self, other,"Info_Kira_AfterSex_16_09"); //Inicjacja jest prosta. Wyruszysz z nami na polowanie.
	AI_Output (self, other,"Info_Kira_AfterSex_16_10"); //Nie bêdzie to jednak zwyczajny troll.
	AI_Output (self, other,"Info_Kira_AfterSex_16_11"); //W Kolonii pojawi³ siê czarny troll.
	AI_Output (other, self,"Info_Kira_AfterSex_15_12"); //Myœla³em, ¿e to tylko legendy...
	AI_Output (self, other,"Info_Kira_AfterSex_16_13"); //Na szczêœcie dla nas te legendy okaza³y siê prawd¹.
	AI_Output (self, other,"Info_Kira_AfterSex_16_14"); //Wyruszymy, jak tylko bêdziesz gotów.
	
   Log_CreateTopic	(CH2_TRL_BlackMotherFucker, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_BlackMotherFucker, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Czeka mnie ostateczna próba - muszê towarzyszyæ ³owcom w polowaniu na czarnego trolla. Muszê powiedzieæ Kirze, kiedy bêdê gotów.");
};

// ************************************************************

INSTANCE Info_Kira_Hunt (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 5;
	condition		= Info_Kira_Hunt_Condition;
	information		= Info_Kira_Hunt_Info;
	important		= 0;
	permanent		= 0;
	description 		= "Jestem gotów.";
};                       

FUNC INT Info_Kira_Hunt_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_AfterSex))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Hunt_Info()
{	
	AI_Output (other, self,"Info_Kira_Hunt_15_02"); //Jestem gotów.
	AI_Output (self, other,"Info_Kira_Hunt_16_01"); //To œwietnie.

	/************************************
	Mo¿e lepiej by³oby z tego zrobiæ funkcjê? Zrób jak uwa¿asz ork
	************************************/

	var C_NPC tab; tab = Hlp_GetNpc(Non_4020_Tablor);
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	var C_NPC pos; pos = Hlp_GetNpc(Non_4022_Postronek);
	var C_NPC kor; kor = Hlp_GetNpc(Non_4023_Korth);
	var C_NPC sno; sno = Hlp_GetNpc(Non_4024_Snow);
	var C_NPC kro; kro = Hlp_GetNpc(Non_4025_Kron);
	var C_NPC nik; nik = Hlp_GetNpc(Non_4026_Nikolas);

	AI_TurnToNpc 			(self,tab);	
	AI_Output (self, other,"Info_Kira_Hunt_16_02"); //Czas ruszyæ na ³owy.
	
   B_FullStop(tab);
	B_FullStop(buk);
	B_FullStop(pos);
	B_FullStop(kor);
	B_FullStop(sno);
	B_FullStop(kro);
	B_FullStop(nik);
	AI_TurnToNpc(tab, self);
	AI_TurnToNpc(buk, self);
	AI_TurnToNpc(pos, self);
	AI_TurnToNpc(kor, self);
	AI_TurnToNpc(sno, self);
	AI_TurnToNpc(kro, self);
	AI_TurnToNpc(nik, self);
   
	AI_Output (self, other,"Info_Kira_Hunt_16_03"); //Wyci¹gnijcie broñ, ch³opcy!
   
	tab.attribute[ATR_HITPOINTS] = tab.attribute[ATR_HITPOINTS_MAX];
	buk.attribute[ATR_HITPOINTS] = buk.attribute[ATR_HITPOINTS_MAX];
	pos.attribute[ATR_HITPOINTS] = pos.attribute[ATR_HITPOINTS_MAX];
	kor.attribute[ATR_HITPOINTS] = kor.attribute[ATR_HITPOINTS_MAX];
	sno.attribute[ATR_HITPOINTS] = sno.attribute[ATR_HITPOINTS_MAX];
	kro.attribute[ATR_HITPOINTS] = kro.attribute[ATR_HITPOINTS_MAX];
	nik.attribute[ATR_HITPOINTS] = nik.attribute[ATR_HITPOINTS_MAX];
   
	AI_Output (self, other,"Info_Kira_Hunt_16_04"); //Idziemy zabijaæ!

	/*******************************
	Chodzi o to, ¿eby potrz¹sneli broni¹, zasalutowali, etc - ta animacja z kusz¹ by³aby chyba lepsza, ale nie chce mi siê jej szukaæ, zmieñ jak uwa¿asz Ork
	*******************************/
	//A dla mnie to niepotrzebne jest ;p

	// 	AI_PlayAni 		(tab, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(tab, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(buk, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(buk, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(pos, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(pos, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(kor, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(kor, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(sno, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(sno, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(kro, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(kro, "T_CLAPHANDS_2_STAND");
	// 	AI_PlayAni 		(nik, "T_STAND_2_CLAPHANDS");
	// 	AI_PlayAni 		(nik, "T_CLAPHANDS_2_STAND");

	Party_AddNpc(self);
	Party_AddNpc(tab);
	Party_AddNpc(buk);
	Party_AddNpc(pos);
	Party_AddNpc(kor);
	Party_AddNpc(sno);
	Party_AddNpc(kro);
	Party_AddNpc(nik);
	Npc_ClearAIQueue 			(self);
	Npc_ClearAIQueue 			(tab);
	Npc_ClearAIQueue 			(buk);
	Npc_ClearAIQueue 			(pos);
	Npc_ClearAIQueue 			(kor);
	Npc_ClearAIQueue 			(sno);
	Npc_ClearAIQueue 			(kro);
	Npc_ClearAIQueue 			(nik);

	/*************************
	Maj¹ zaprowadziæ Dicka do orka, mo¿e daæ sprawdzanie te¿ czy dick nie jest za daleko jak z diego w NK w kolonii? Zrób to jak uwa¿asz.
	**************************/

	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Ruszyliœmy zapolowaæ na czarnego trolla.");
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine(self,"HUNT");
	Npc_ExchangeRoutine(tab,"HUNT");
	Npc_ExchangeRoutine(buk,"HUNT");
	Npc_ExchangeRoutine(pos,"HUNT");
	Npc_ExchangeRoutine(kor,"HUNT");
	Npc_ExchangeRoutine(sno,"HUNT");
	Npc_ExchangeRoutine(kro,"HUNT");
	Npc_ExchangeRoutine(nik,"HUNT");
	Wld_InsertNpc				(Kira_BTroll,"LOCATION_12_14"); //  
	Wld_InsertNpc				(YoungTroll,"SPAWN_BLACKGOBBO_SHRINKSCROLL"); //  

	Npc_SetAttitude(self,ATT_FRIENDLY);
	Npc_SetAttitude(tab,ATT_FRIENDLY);
	Npc_SetAttitude(buk,ATT_FRIENDLY);
	Npc_SetAttitude(pos,ATT_FRIENDLY);
	Npc_SetAttitude(kor,ATT_FRIENDLY);
	Npc_SetAttitude(sno,ATT_FRIENDLY);
	Npc_SetAttitude(kro,ATT_FRIENDLY);
	Npc_SetAttitude(nik,ATT_FRIENDLY);	
	
	Npc_SetTempAttitude(self,ATT_FRIENDLY);
	Npc_SetTempAttitude(tab,ATT_FRIENDLY);
	Npc_SetTempAttitude(buk,ATT_FRIENDLY);
	Npc_SetTempAttitude(pos,ATT_FRIENDLY);
	Npc_SetTempAttitude(kor,ATT_FRIENDLY);
	Npc_SetTempAttitude(sno,ATT_FRIENDLY);
	Npc_SetTempAttitude(kro,ATT_FRIENDLY);
	Npc_SetTempAttitude(nik,ATT_FRIENDLY);		
};

// ************************************************************

INSTANCE Info_Kira_HuntNear (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 6;
	condition		= Info_Kira_HuntNear_Condition;
	information		= Info_Kira_HuntNear_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_HuntNear_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Kira_Hunt))&&(Npc_GetDistToWP (self,"OW_PATH_190") < 500 )//wp w pobli¿u trola
	{
		return 1;
	};
};

FUNC VOID Info_Kira_HuntNear_Info()
{	
	//punkt zborny przed walk¹
	AI_Output (self, other,"Info_Kira_HuntNear_16_01"); //Jesteœmy ju¿ blisko, czujê odór œmierci.
	AI_Output (other,self,"Info_Kira_HuntNear_15_02"); //Jestem gotów do walki...

	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Czuæ ju¿ smród bestii - my albo ona!");

	B_StopProcessInfos	(self);

	/******************
	Nie dawa³em nieœmiertelnoœci ³owcom, bo nie wiem czy tak ma byæ - jak chcesz to daj to teraz, po to te¿ jest punkt zborny

	*******************/

	Npc_ExchangeRoutine(self,"HUNT2");
};

// ************************************************************

INSTANCE Info_Kira_HuntFinish (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 7;
	condition		= Info_Kira_HuntFinish_Condition;
	information		= Info_Kira_HuntFinish_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Kira_HuntFinish_Condition()
{	
	var c_npc btroll;
	btroll=Hlp_GetNpc(Kira_BTroll);
   
	if (Npc_KnowsInfo (hero, Info_Kira_HuntNear))&&(Npc_IsDead(btroll))&& (Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_HuntFinish_Info()
{	
	var C_NPC tab; tab = Hlp_GetNpc(Non_4020_Tablor);
	var C_NPC buk; buk = Hlp_GetNpc(Non_4021_Bukhart);
	var C_NPC pos; pos = Hlp_GetNpc(Non_4022_Postronek);
	var C_NPC kor; kor = Hlp_GetNpc(Non_4023_Korth);
	var C_NPC sno; sno = Hlp_GetNpc(Non_4024_Snow);
	var C_NPC kro; kro = Hlp_GetNpc(Non_4025_Kron);
	var C_NPC nik; nik = Hlp_GetNpc(Non_4026_Nikolas);
	var c_npc btroll;
	btroll=Hlp_GetNpc(Kira_BTroll);

	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_HuntFinish_16_00"); //Ju¿ po wszystkim, nie by³o ³atwo, ale bestia nie ¿yje.
	AI_Output (self, other,"Info_Kira_HuntFinish_16_01"); //Nale¿y Ci siê nagroda, zaczekaj na mnie.
	B_StopProcessInfos	(self);

	AI_GotoNpc(self,btroll);
	AI_PlayAni(self, "T_PLUNDER");
	AI_GotoNpc(self,other);
	B_ExchangeRoutine(tab,"START");
	B_ExchangeRoutine(buk,"START");
	B_ExchangeRoutine(pos,"START");
	B_ExchangeRoutine(kor,"PreStart");
	B_ExchangeRoutine(sno,"START");
	B_ExchangeRoutine(kro,"START");
	B_ExchangeRoutine(nik,"START");
	
	//fix:
	Party_RemoveNpc(self);
	Party_RemoveNpc(tab);
	Party_RemoveNpc(buk);
	Party_RemoveNpc(pos);
	Party_RemoveNpc(kor);
	Party_RemoveNpc(sno);
	Party_RemoveNpc(kro);
	Party_RemoveNpc(nik);	
};

// ************************************************************

INSTANCE Info_Kira_HuntFinalEnd (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 8;
	condition		= Info_Kira_FinalEnd_Condition;
	information		= Info_Kira_FinalEnd_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Kira_FinalEnd_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 2500)&&(Npc_KnowsInfo (hero, Info_Kira_HuntFinish))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_FinalEnd_Info()
{	
	B_GiveXP (1000);
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other,"Info_Kira_FinalEnd_16_01"); //Skóra czarnego trolla nale¿y do Ciebie.
	AI_Output (other, self,"Info_Kira_FinalEnd_15_02"); //To dla mnie... zaszczyt.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_03"); //Nie udawaj fa³szywej skromnoœci, nale¿y Ci siê.
	
   CreateInvItems (self, ItAt_BlackTroSkin,1); 
	B_GiveInvItems (self, other, ItAt_BlackTroSkin, 1);
	
   AI_Output (self, other,"Info_Kira_FinalEnd_16_04"); //Odt¹d mo¿esz siê uwa¿aæ za jednego z nas.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_05"); //Z tej skóry mo¿na zrobiæ niez³y pancerz. 
	AI_Output (other, self,"Info_Kira_FinalEnd_15_06"); //Bêdê o tym pamiêta³. A co z sojuszem?
	AI_Output (self, other,"Info_Kira_FinalEnd_16_07"); //Mo¿esz uwa¿aæ go za obowi¹zuj¹cy od tej chwili.
	AI_Output (self, other,"Info_Kira_FinalEnd_16_08"); //Niestety na nas czas. Ju¿ têskniê ogierze...
	AI_Output (other, self,"Info_Kira_FinalEnd_15_09"); //Ekhm... Ja te¿, uwa¿aj na siebie.

	/*****************
	Kira mo¿e powiedzieæ kto robi pancerze ze skóry - mo¿e ktoœ z ³owców by zrobi³?
	******************/
   
   B_LogEntry		(CH2_Rbl_BlackTroll, "Uda³o mi siê przekonaæ ³owców. Czas wracaæ do Cavalorna.");
   B_LogSetTopicStatus	(CH2_Rbl_BlackTroll, LOG_SUCCESS);
	Log_SetTopicStatus	(CH2_TRL_BlackMotherFucker, LOG_SUCCESS);
	B_LogEntry		(CH2_TRL_BlackMotherFucker, "Polowanie zakoñczone - bestia nie ¿yje. Kira podarowa³a mi skórê z czarnego trolla. Sojusz zosta³ zawarty - Cavalorn musi siê o tym dowiedzieæ. Aha, ze skóry trolla mo¿na zrobiæ dobry pancerz, muszê poszukaæ jakiegoœ kowala.");

	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"start");
};

// ************************************************************

INSTANCE Info_Kira_Help (C_INFO)
{
	npc		= Non_4027_Kira;
	nr			= 1;
	condition		= Info_Kira_Help_Condition;
	information		= Info_Kira_Help_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Potrzebujemy waszej pomocy!";
};                       

FUNC INT Info_Kira_Help_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Rodney_BeginMag))
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Help_Info()
{	
	AI_Output (other, self,"Info_Kira_Help_15_00"); //Potrzebujemy waszej pomocy!
	AI_Output (self, other,"Info_Kira_Help_16_01"); //Co siê sta³o? Zaatakowa³o Was stado œcierwojadów, he, he.
	AI_Output (other, self,"Info_Kira_Help_15_02"); //Blisko, stra¿nicy chc¹ nas wykopaæ z Kolonii. Cavalorn prosi o pomoc.
	AI_Output (self, other,"Info_Kira_Help_16_03"); //Szybciej ni¿ myœla³am... No dobra, jak mamy pomóc?
	AI_Output (other, self,"Info_Kira_Help_15_04"); //Uderzycie na ty³y stra¿ników, kiedy ci zaatakuj¹ obóz. 
	AI_Output (self, other,"Info_Kira_Help_16_05"); //Dlaczego akurat na ty³y?

	Info_ClearChoices (Info_Kira_Help);
	Info_AddChoice (Info_Kira_Help, "Utoczycie krwi stra¿nikom.", Info_Kira_Help_Blood);
	Info_AddChoice (Info_Kira_Help, "Dziêki temu zrobicie spore zamieszanie.", Info_Kira_Help_Mass);
	Info_AddChoice (Info_Kira_Help, "Zasiejecie strach w sercach stra¿ników.", Info_Kira_Help_Fear);
	Info_AddChoice (Info_Kira_Help, "Ekhm... Dla chwa³y?", Info_Kira_Help_Glory);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Blood()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Blood_15_00"); //Utoczycie krwi stra¿nikom.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_01"); //Nie jesteœmy rzeŸnikami. Chcê byæ pewna, ¿e moi ch³opcy nie id¹ na rzeŸ.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_02"); //A krwi na kaszankê nie potrzebujemy. Niezbyt dobrze z tego wybrn¹³eœ.
	AI_Output (self, other,"Info_Kira_Help_Blood_16_03"); //Chyba jednak darujemy sobie walkê. ¯yczê mi³ego 'upuszczania krwi' i pozdrówcie od nas stra¿ników.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda³o mi siê przekonaæ Kiry. Lepiej o tym nie wspominaæ Cavalornowi.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Mass()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Mass_15_00"); //Dziêki temu zrobicie spore zamieszanie.
	AI_Output (self, other,"Info_Kira_Help_Mass_16_01"); //Zamieszanie? To jak wtykaæ kij w gniazdo os albo w ty³ek trolla. Dziêki, ale nie skorzystam.
	AI_Output (self, other,"Info_Kira_Help_Mass_16_02"); //Sami sobie wtykajcie, co tam chcecie w stra¿ników. Bywaj.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda³o mi siê przekonaæ Kiry. Lepiej o tym nie wspominaæ Cavalornowi.");
	B_StopProcessInfos	(self);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Fear()
{
	B_GiveXP(500);
	kira_help = 1;
   
	AI_Output (other, self,"Info_Kira_Help_Fear_15_00"); //Zasiejecie strach w sercach stra¿ników.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_01"); //Strach? W sumie mi³o by³oby popatrzeæ, jak te mendy sraj¹ po nogach.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_02"); //Do tego nie staniemy na drodze g³ównego uderzenia, wiêc brzmi rozs¹dnie.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_03"); //Dobra, pogadam z ch³opakami. Masz nasze miecze i topory.
	AI_Output (other, self,"Info_Kira_Help_Fear_15_04"); //Dobrze to s³yszeæ.
	AI_Output (self, other,"Info_Kira_Help_Fear_16_05"); //Uca³uj ode mnie Cavalorna, he, he.
	AI_Output (other, self,"Info_Kira_Help_Fear_15_06"); //Wymagasz zbyt wiele. Ale pozdrowiê go w Twoim imieniu.
	
	Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_SUCCESS);
	B_LogEntry		(CH3_RBL_TrolHelp, "Uda³o mi siê przekonaæ Kirê. Atak na ty³y s³ugusów Gomeza zasieje w szeregach stra¿ników panikê, a to bardzo nam pomo¿e. Muszê powiedzieæ o tym Cavalornowi.");
	B_StopProcessInfos	(self);

	/******************
		Funkcje z atakiem da siê pdoczas ataku nie teraz
		*******************/
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_Help_Glory()
{
	kira_help = 2;
   
	AI_Output (other, self,"Info_Kira_Help_Glory_15_00"); //Ekhm... Dla chwa³y?
	AI_Output (self, other,"Info_Kira_Help_Glory_16_01"); //Dla chwa³y to ja mogê zer¿n¹æ trolla.
	AI_Output (self, other,"Info_Kira_Help_Glory_16_02"); //Dla nas liczy siê tylko walka i widoki na dobry zarobek. Chwa³ê mo¿esz sobie wsadziæ w rzyæ.
	AI_Output (self, other,"Info_Kira_Help_Glory_16_03"); //Powiedz to Cavalornowi i wynoœ siê z tego obozu.
	
   Log_SetTopicStatus	(CH3_RBL_TrolHelp, LOG_FAILED);
	B_LogEntry		(CH3_RBL_TrolHelp, "Nie uda³o mi siê przekonaæ Kiry. Lepiej o tym nie wspominaæ Cavalornowi.");
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Kira_OCH (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 12;
	condition		= Info_Kira_OCH_Condition;
	information		= Info_Kira_OCH_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_OCH_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_RATFORD_OtherHelp))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_OCH_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	
   AI_Output (self, other,"Info_Kira_OCH_16_01"); //D³ugo Ciê nie by³o, a mi potrzeba prawdziwego mê¿czyzny. Œci¹gaj ³achy!
	AI_Output (other, self,"Info_Kira_OCH_15_02"); //Mo¿e najpierw porozmawiamy...
	AI_DrawWeapon (self);
	AI_Output (self, other,"Info_Kira_OCH_16_03"); //Œci¹gaj ³achy albo je z Ciebie zedrê!

	Info_ClearChoices (Info_Kira_OCH);
	Info_AddChoice (Info_Kira_OCH, "Czego siê nie robi dla... sprawy.", Info_Kira_OCH_Ok);
	Info_AddChoice (Info_Kira_OCH, "Nie jestem gotów na takie poœwiêcenie!", Info_Kira_OCH_No);
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_OCH_Ok()
{
	AI_Output (other, self,"Info_Kira_OCH_Ok_15_00"); //Czego siê nie robi dla... sprawy.
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Kira_OCH_Ok_16_01"); //Za du¿o gadasz!
	kira_help = 3;
	B_KiraSex();
};

// -------------------------------------------------------------------

FUNC VOID Info_Kira_OCH_No()
{
	AI_Output (other, self,"Info_Kira_OCH_No_15_00"); //Nie jestem gotów na takie poœwiêcenie!
	AI_Output (self, other,"Info_Kira_OCH_No_16_01"); //Rozczarowa³eœ mnie. Ale skoro ju¿ jesteœ pod rêk¹, to przynajmniej sobie odreagujê...
	kira_help = 4;
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);
};

// ************************************************************

INSTANCE Info_Kira_OCHAfter (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 13;
	condition		= Info_Kira_OCHAfter_Condition;
	information		= Info_Kira_OCHAfter_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_OCHAfter_Condition()
{	
	if ((kira_help == 3)||(kira_help == 4))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_OCHAfter_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_OCHAfter_16_01"); //Nadal tu jesteœ?
	AI_Output (other, self,"Info_Kira_OCHAfter_15_02"); //Tak, musimy porozmawiaæ.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_03"); //Dlaczego faceci chc¹ tylko gadaæ? No dobra, wyrzuæ to z siebie.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_04"); //Nied³ugo zaatakujemy Stary Obóz. Ciekaw jestem, czy chcia³abyœ siê te¿ trochê zabawiæ ze stra¿nikami.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_05"); //Brzmi interesuj¹co. 
	AI_Output (other, self,"Info_Kira_OCHAfter_15_06"); //Najemnicy uderz¹ na zewnêtrzne bramy, ma³y oddzia³ rebeliantów niepostrze¿enie dostanie siê do œrodka.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_07"); //Podniesiemy kraty i dorwiemy Gomeza.
	AI_Output (self, other,"Info_Kira_OCHAfter_16_08"); //Nawet macie plan - imponuj¹ce.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_09"); //Jak jest Twoja decyzja?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_10"); //Pomo¿emy Wam. Ale pod jednym warunkiem.
	AI_Output (other, self,"Info_Kira_OCHAfter_15_11"); //Tak?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_12"); //Siekacz musi dostaæ siê w moja ³apska i to ¿ywy!
	AI_Output (other, self,"Info_Kira_OCHAfter_15_13"); //Dlaczego akurat on?
	AI_Output (self, other,"Info_Kira_OCHAfter_16_14"); //Z wiarygodnego Ÿród³a wiem, ¿e to prawdziwy mê¿czyzna. Za to co ma miêdzy nogami niejedna kobieta odda³aby cnotê w³asnej córki!
	AI_Output (other, self,"Info_Kira_OCHAfter_15_15"); //...cholerna nimfomanka...
	AI_Output (self, other,"Info_Kira_OCHAfter_16_16"); //Co mówi³eœ?
	AI_Output (other, self,"Info_Kira_OCHAfter_15_17"); //Nic, nic. Przyprowadzê Ci Siekacza na po¿arcie. 
	AI_Output (self, other,"Info_Kira_OCHAfter_16_18"); //Ju¿ nie mogê siê doczekaæ, kiedy sobie na nim poje¿d¿ê...

	B_LogEntry		(CH6_RBL_OtherHelp, "Kira pomo¿e w ataku, je¿eli przyprowadzê do niej Siekacza.");

	Log_CreateTopic	(CH6_RBL_Horse, LOG_MISSION);
	Log_SetTopicStatus	(CH6_RBL_Horse, LOG_RUNNING);
	B_LogEntry		(CH6_RBL_Horse, "Cholerna nimfomanka! Muszê przyprowadziæ do Kiry Siekacza. Tylko wtedy ³owcy pomog¹ nam w ataku na Stary Obóz. Muszê porozmawiaæ z tym stra¿nikiem.");
};

// ************************************************************

INSTANCE Info_Kira_Bring_Cutter (C_INFO)
{
	npc			= Non_4027_Kira;
	nr			= 14;
	condition		= Info_Kira_Bring_Cutter_Condition;
	information		= Info_Kira_Bring_Cutter_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Kira_Bring_Cutter_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Cutter_WomanOk))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Kira_Bring_Cutter_Info()
{	
	var C_NPC cut; cut = Hlp_GetNpc(GRD_208_Cutter);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
   
	AI_Output (self, other,"Info_Kira_Bring_Cutter_16_01"); //To on?
	
   AI_TurnToNpc (self, cut);
	
   AI_Output (other, self,"Info_Kira_Bring_Cutter_15_02"); //To Siekacz. Je¿eli o to Ci chodzi, to nie sprawdza³em czy rzeczywiœcie taki z niego ogier...
	
   AI_TurnToNpc (self, other);
	
   AI_Output (self, other,"Info_Kira_Bring_Cutter_16_03"); //Sama siê tym zajmê. Powiedz Ratfordowi, ¿e ³owcy wespr¹ atak na zewnêtrzne mury.
	AI_Output (self, other,"Info_Kira_Bring_Cutter_16_04"); //A teraz zmiataj, mam tu coœ do zrobienia...
	
   AI_TurnToNpc (self, cut);
	B_LogEntry		(CH6_RBL_OtherHelp, "Uda³o siê! £owcy te¿ wezm¹ udzia³ w polowaniu na Gomeza. Muszê powiedzieæ o tym Ratfordowi.");

	Log_SetTopicStatus	(CH6_RBL_Horse, LOG_SUCCESS);
	B_LogEntry		(CH6_RBL_Horse, "Kira wesprze atak na palisadê. Szkoda Siekacza, ale sam jest sobie winien...");
};
