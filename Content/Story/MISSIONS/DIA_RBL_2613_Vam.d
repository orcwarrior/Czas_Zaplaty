// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_RBL_2613_VAM_Hello (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 1;
	condition		= DIA_RBL_2613_VAM_Hello_Condition;
	information		= DIA_RBL_2613_VAM_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "£adna dziœ pogoda."; 
};

FUNC INT DIA_RBL_2613_VAM_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_RBL_2613_VAM_Hello_Info()
{
	AI_Output (other, self, "DIA_RBL_2613_VAM_Hello_15_01"); //£adna dziœ pogoda.
	AI_Output (self, other, "DIA_RBL_2613_VAM_Hello_11_02"); //Rzeczywiœcie. Œliczna bariera ponad g³ow¹, a b³oto i koœci pod stopami.
	AI_Output (self, other, "DIA_RBL_2613_VAM_Hello_11_03"); //Istny raj.
};

INSTANCE DIA_RBL_2613_VAM_GoBring (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 2;
	condition		= DIA_RBL_2613_VAM_GoBring_Condition;
	information		= DIA_RBL_2613_VAM_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jesteœ tu jedynym drwalem?"; 
};

FUNC INT DIA_RBL_2613_VAM_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2613_VAM_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_RBL_2613_VAM_GoBring_Info()
{
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_01"); //Jesteœ tu jedynym drwalem?
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_02"); //Niestety tak. Cavalorn chyba zg³upia³, je¿eli myœli, ¿e dam radê wyci¹æ ten cholerny las w pojedynkê!
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_03"); //Oczywiœcie 'chêtnych' do pomocy jest tylu, ¿e nie sposób zdecydowaæ kogo wybraæ.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_04"); //W³aœnie widzê.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_05"); //Ale zaraz. Mo¿e Tobie siê nudzi, hê?
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_06"); //Niestety nie. 
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_07"); //Tak myœla³em. Ech, przyda³yby siê zwi¹zki zawodowe...
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_08"); //Wiesz co, mam dzieñ dobroci dla takich jak Ty. Mo¿e znajdê kogoœ, kto pomo¿e Ci przy wyrêbie i docinaniu.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_09"); //Mo¿esz spróbowaæ, ale czarno to widzê. Jak dot¹d nie uda³o mi siê nikogo zwerbowaæ.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_10"); //Mo¿e zbyt grzecznie prosi³eœ?
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_11"); //Staram siê ¿yæ w zgodzie z bliŸnimi. Ale jak tak na Ciebie patrzê, to w¹tpiê, ¿e robisz cokolwiek bezinteresownie.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_12"); //Wystarczy, ¿e szepniesz za mn¹ s³ówko Cavalornowi. Nic wiêcej.
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_13"); //Rozumiem. Kolejny chêtny do nadziania siê na miecz czerwonych. 
	AI_Output (self, other, "DIA_RBL_2613_VAM_GoBring_11_14"); //Ale nie ma sprawy. Je¿eli przyprowadzisz mi pomocnika, to wstawiê siê za Tob¹ u Cavalorna.
	AI_Output (other, self, "DIA_RBL_2613_VAM_GoBring_15_15"); //Do zobaczenia wkrótce.
	
   Log_CreateTopic	(CH1_Rbl_Wood, LOG_MISSION);
	B_LogSetTopicStatus	(CH1_Rbl_Wood, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Wood, "Drwal Vam szuka kogoœ chêtnego do pomocy przy wyrêbie i docinaniu. Popytam darmozjadów z obozu i mo¿e uda siê kogoœ 'przekonaæ'. Je¿eli znajdê jakiegoœ 'ochotnika', to mam g³os Vama w kieszeni.");
};

INSTANCE RBL_2613_Vam_Ok (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 3;
	condition		= RBL_2613_Vam_Ok_Condition;
	information		= RBL_2613_Vam_Ok_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przyprowadzi³em Ci pomocnika."; 
};

FUNC INT RBL_2613_Vam_Ok_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_RBL_2605_GARRY_After2))&&(garry_out == TRUE)
	{
		return 1;
	};
};

FUNC VOID RBL_2613_Vam_Ok_Info()
{
	vam_trust = TRUE;
	B_GiveXP(150);
	rebel_camp_trust = rebel_camp_trust + 1; 
	var C_NPC garry; garry = Hlp_GetNpc(RBL_2605_GARRY);
   
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_01"); //Przyprowadzi³em Ci pomocnika.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_02"); //Niech no na niego spojrzê.
	
   AI_TurnToNpc			(other,garry);	
	AI_TurnToNpc			(self,garry);	
	Ai_wait(self,1);
	AI_TurnToNpc			(other,self);
	AI_TurnToNpc			(self,other);	
	//Bugfix: U can't saw by hand o.O
	CreateInvItem			(garry,ItMi_Saw);
	garry.attribute[ATR_HITPOINTS] = 	garry.attribute[ATR_HITPOINTS_MAX];	
   
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_03"); //I co, mo¿e byæ?
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_04"); //Nie wygl¹da na si³acza, co prawda zêby ma prawie wszystkie. Niech siê nachyli, œci¹gnie portki i zakaszle!
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_05"); //Bez przesady. Wystarczy, ¿e wie, którym koñcem siekiery trzeba uderzaæ w pieñ drzewa.	
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_06"); //Jak widzisz dotrzyma³em s³owa. Teraz Twoja kolej.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_07"); //Nie obawiaj siê przyjacielu, s³owo nie dym. Szepnê Cavalornowi za Tob¹ to i tamto.
   AI_Output (self, other, "RBL_2613_Vam_Ok_11_08"); //W nagrodê mogê pomóc ci zwiêkszyæ krzepê i nauczyæ otwierania zamków.
	AI_Output (self, other, "RBL_2613_Vam_Ok_11_09"); //Aha, jak chcesz mogê te¿ zaopatrzyæ Ciê w ró¿nego rodzaju drewno. Przyda Ci siê na trzonki do toporów, do wyrobu ³uków, b¹dŸ strza³ i brzechw.
	AI_Output (other, self, "RBL_2613_Vam_Ok_15_10"); //Dobrze wiedzieæ. Bywaj.
	
   B_LogSetTopicStatus	(CH1_Rbl_Wood, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_Wood, "Vamowi spodoba³ siê nowy pomocnik. Powiedzia³ te¿, ¿e zaopatrzy mnie w drewno.");
	B_LogEntry		(CH1_Rbl_RebelCampTrust, "Vam bardzo ucieszy³ siê z nowego pomocnika. Dobrze, ¿e nie wie jaki z Garrego pata³ach. W ka¿dym razie poprze mnie przed Cavalornem.");
	B_LogEntry(GE_TeacherOR, "Vam mo¿e pomóc zwiêkszyæ mi si³ê oraz mo¿e nauczyæ mnie otwierania zamków.");
   B_LogEntry(GE_TraderOR, "U Vama mogê zaopatrzyæ siê w drewno.");
	B_StopProcessInfos	(self); 
	Party_RemoveNpc(garry);
	B_ExchangeRoutine (rbl_2605_garry,"LUMBERMILL");
};

/***********************
Ork a co z tym drewnem, jak to ma wygl¹daæ?

*************************/

INSTANCE DIA_Vam_Attack (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 11;
	condition		= DIA_Vam_Attack_Condition;
	information		= DIA_Vam_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Vam_Attack_Condition()
{
	if (q_n_again == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Vam_Attack_Info()
{
	AI_Output (self, other, "DIA_Vam_Attack_11_01"); //le siê sta³o... Ale ka¿dy mo¿e zb³¹dziæ.
	AI_Output (self, other, "DIA_Vam_Attack_11_02"); //Twoja decyzja mo¿e zabiæ nas wszystkich.
	B_StopProcessInfos	(self); 
};

// **************************************************

INSTANCE DIA_Vam_Stew (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 12;
	condition		= DIA_Vam_Stew_Condition;
	information		= DIA_Vam_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochotê na gulasz?"; 
};

FUNC INT DIA_Vam_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Vam_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_Vam_Stew_15_01"); //Masz ochotê na gulasz?
	AI_Output (self, other, "DIA_Vam_Stew_11_02"); //Wola³bym porz¹dn¹ pieczeñ, ale niech bêdzie.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Vam zjad³ miskê gulaszu i nawet podziêkowa³."); 
};

INSTANCE DIA_VAM_Spy (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 13;
	condition		= DIA_VAM_Spy_Condition;
	information		= DIA_VAM_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak tu trafi³eœ?"; 
};

FUNC INT DIA_VAM_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_VAM_Spy_Info()
{
	spy_count = spy_count + 1;
   
	AI_Output (other, self, "DIA_VAM_Spy_15_01"); //Jak tu trafi³eœ?
	AI_Output (self, other, "DIA_VAM_Spy_11_02"); //Najpierw jakiœ idiota pos¹dzi³ mnie o kradzie¿ drzewa z królewskiego lasu.
	AI_Output (self, other, "DIA_VAM_Spy_11_03"); //PóŸniej sêdzia skaza³ mnie, nie czekaj¹c na dowody, a w koñcu stra¿nicy miejscy wykopali mnie przez barierê.
	AI_Output (other, self, "DIA_VAM_Spy_15_04"); //Mia³em na myœli ten obóz.
	AI_Output (self, other, "DIA_VAM_Spy_11_05"); //Aha. Tylko tutaj mog³em sam o sobie decydowaæ. Dlatego tu zosta³em.
	AI_Output (self, other, "DIA_VAM_Spy_11_06"); //Nie lubiê, jak ktoœ mówi mi, co mam robiæ.
	AI_Output (other, self, "DIA_VAM_Spy_15_07"); //Doskonale to rozumiem.
	
   B_LogEntry		(CH2_Rbl_Spy, "Vam wygl¹da na jedyn¹ osobê, która nic nie ukrywa. Ale mo¿e tym bardziej powinienem zwróciæ na niego uwagê.");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od ciebie chcia³.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_VAM_Spy1 (C_INFO)
{
	npc				= RBL_2613_VAM;
	nr				= 14;
	condition		= DIA_VAM_Spy1_Condition;
	information		= DIA_VAM_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wolisz byæ kowalem w³asnego losu."; 
};

FUNC INT DIA_VAM_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_VAM_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_VAM_Spy1_15_01"); //Wolisz byæ kowalem w³asnego losu.
	AI_Output (self, other, "DIA_VAM_Spy1_11_02"); //Oglêdnie mówi¹c, tak.
	AI_Output (self, other, "DIA_VAM_Spy1_11_03"); //Teraz robiê to, co kiedyœ i robiê to dobrze, wiêcej mi nie trzeba.
	AI_Output (other, self, "DIA_VAM_Spy1_15_04"); //Nie zauwa¿y³eœ w obozie czegoœ podejrzanego?	
	AI_Output (self, other, "DIA_VAM_Spy1_11_05"); //Ktoœ kto wiêkszoœæ czasu spêdza na pracy nie ma czasu na wêszenie i podgl¹danie.
	AI_Output (self, other, "DIA_VAM_Spy1_11_06"); //Pogadaj z pozosta³ymi, mo¿e ktoœ Ci pomo¿e bardziej ni¿ ja.
	B_LogEntry		(CH2_Rbl_Spy, "Od Vama nie dowiedzia³em siê nic nowego.");
	
	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos	(self);
}; 
