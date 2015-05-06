//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##						CZ story
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	return TRUE;
};

FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output(self, hero,"Info_Xardas_DISTURB_14_01"); //KTO ŒMIE PRZESZKADZAÆ MI W MOICH STUDIACH?!
	AI_Output(hero, self,"Info_Xardas_DISTURB_15_02"); //Nazywam siê...
	AI_Output(self, hero,"Info_Xardas_DISTURB1_14_03"); //Nie interesuje mnie Twoje imiê. To nieistotne.
	AI_Output(self, hero,"Info_Xardas_DISTURB1_14_04"); //Liczy siê tylko to, ¿e jesteœ drug¹ osob¹ od wielu lat, która zak³óca mój spokój!
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Czyli ktoœ tu jeszcze zagl¹da³?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output(hero, self,"Info_Xardas_OTHERS1_15_01"); //Czyli ktoœ tu jeszcze zagl¹da³?
	AI_Output(self, hero,"Info_Xardas_OTHERS1_14_02"); //Byæ mo¿e, ale to nie Twoja sprawa, œmiertelniku.
	AI_Output(hero, self,"Info_Xardas_OTHERS1_15_03"); //Wolisz wieœæ ¿ywot samotnika, czy¿ nie?
	AI_Output(self, hero,"Info_Xardas_OTHERS1_14_04"); //Ale¿ sk¹d. Szczególnie istoty, które przyzywam bardzo ceni¹ sobie towarzystwo nieproszonych goœci!
}; 

//---------------------------------------------------------------------
//	Info Leren
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Przysy³a mnie Leren. Potrzebujemy Twojej pomocy!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_Xardas_DISTURB))&&(Npc_KnowsInfo(hero, DIA_Leren_RuneSwd1))
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_01"); //Przysy³a mnie Leren. Potrzebujemy Twojej pomocy!
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_02"); //Znalaz³em pewne ostrze, ale aby przywróciæ mu pierwotn¹ moc, nale¿y odbyæ rytua³, który musz¹ przeprowadziæ kap³ani trzech bóstw.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_03"); //I ³askawie pomyœla³eœ o mnie?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_04"); //No có¿... Nie znam innego czciciela Beliara, który nie chcia³by od razu urwaæ mi g³owy.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_05"); //Sk¹d przypuszczenie, ¿e s³u¿ê Beliarowi?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_06"); //Przecie¿ jesteœ nekromant¹.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_07"); //Powiedz mi przyb³êdo, co TY wiesz o Beliarze? Jak myœlisz co to za bóg?
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_08"); //Na pewno wredny.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_09"); //Có¿ za wnikliwa analiza.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_10"); //Beliar to potê¿ny sukinsyn, dla którego ¿ycie jego czcicieli nie znaczy wiêcej ni¿ grobowe próchno.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_11"); //Wykorzystuje wyznawców do osi¹gniêcia w³asnych celów. Wszyscy jesteœmy jego narzêdziami.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_12"); //A ja bardzo nie lubiê ulegaæ... manipulacji.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_13"); //Komu wiêc s³u¿ysz? 
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_14"); //Samemu sobie. Oczywiœcie moje zamiary, jak i zamiary Beliara czêsto s¹ zbie¿ne, dlatego jeszcze ¿yjê.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_15"); //Interesuje mnie tylko to, czy zechcesz mi pomóc.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_16"); //Byæ mo¿e. Ale nic za darmo.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_17"); //Co proponujesz?
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_18"); //Pomogê przeprowadziæ rytua³, a Ty w niedalekiej przysz³oœci odwdziêczysz mi siê w... podobny sposób.
	AI_Output(hero, self,"Info_Xardas_SATURAS1_15_19"); //Powiedz mi, co dok³adnie masz na myœli.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_20"); //Nie mogê. Zreszt¹, Ty i tak byœ tego nie zrozumia³.
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_21"); //Rytua³ w zamian za przysz³¹ przys³ugê. I pamiêtaj, ¿e decyzja, któr¹ podejmiesz bêdzie ostateczna!
	AI_Output(self, hero,"Info_Xardas_SATURAS1_14_22"); //Co postanowisz?

	B_LogEntry(CH4_GRD_RuneSwd, "Xardas pomo¿e mi pod warunkiem, ¿e w niedalekiej przysz³oœci spe³niê jak¹œ jego proœbê. Obawiam siê, ¿e tkwi w tym jakiœ mroczny haczyk, ale nie mam wyboru - tylko w ten sposób zdo³am przywróciæ miecz runiczny do '¿ycia'. Decyzja, któr¹ podejmê bêdzie ostateczna - nie bêdzie drugiej szansy, czy te¿ mo¿liwoœci zmiany postanowienia. Muszê to dobrze przemyœleæ.");
}; 

//---------------------------------------------------------------------

instance  Info_Xardas_Choice (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_Choice_Condition;
	information	= Info_Xardas_Choice_Info;
	important	= 0;
	permanent	= 0;
	description = "Podj¹³em decyzjê.";
};

FUNC int  Info_Xardas_Choice_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_Choice_Info()
{
	AI_Output(hero, self,"Info_Xardas_Choice_15_01"); //Podj¹³em decyzjê.
	AI_Output(self, hero,"Info_Xardas_Choice_14_02"); //Wiêc co postanowi³eœ?

	Info_ClearChoices (Info_Xardas_Choice);
	Info_AddChoice (Info_Xardas_Choice, "Zgadzam siê.", Info_Xardas_Choice_Yes);
	Info_AddChoice (Info_Xardas_Choice, "To za du¿e ryzyko.", Info_Xardas_Choice_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID Info_Xardas_Choice_Yes()
{
	xardas_agree = TRUE;
   
	AI_Output(hero, self,"Info_Xardas_Choice_Yes_15_01"); //Zgadzam siê.
	AI_Output(self, hero,"Info_Xardas_Choice_Yes_14_02"); //Nie masz pojêcia, jak wielk¹ sprawi³eœ mi przyjemnoœæ.
	AI_Output(hero, self,"Info_Xardas_Choice_Yes_15_03"); //Coœ mi siê wydaje, ¿e wkrótce gorzko tego po¿a³ujê.
	AI_Output(self, hero,"Info_Xardas_Choice_Yes_14_04"); //Wróæ, kiedy wszystko bêdzie gotowe do przeprowadzenia rytua³u.
	
   B_LogEntry(CH4_RBL_Rirual, "Zgodzi³em siê na ¿¹dania Xardasa. Wiem, ¿e ju¿ wkrótce gorzko tego po¿a³ujê, ale nie mia³em wyboru - tylko tak zdo³am przywróciæ ostrzu jego moc.");
   
   Info_ClearChoices (Info_Xardas_Choice);
};

// ---------------------------No----------------------------------------

FUNC VOID Info_Xardas_Choice_No()
{
	AI_Output(hero, self,"Info_Xardas_Choice_No_15_01"); //To za du¿e ryzyko.
	AI_Output(self, hero,"Info_Xardas_Choice_No_14_02"); //Zaskoczy³eœ mnie, jesteœ jednak inteligentn¹ istot¹.
	AI_Output(self, hero,"Info_Xardas_Choice_No_14_03"); //Dobrze wiêc, nasze drogi tutaj siê rozchodz¹. Nie wracaj tu wiêcej, œmiertelniku!
	
   B_LogEntry(CH4_RBL_Rirual, "Nie zgodzi³em siê na propozycjê Xardasa. Bardziej ni¿ miecz runiczny ceniê swoje ¿ycie.");
   
   Info_ClearChoices (Info_Xardas_Choice);
};

// *************************************************

instance  Info_Xardas_Ritual (C_INFO)
{
	npc			=	Kdf_404_Xardas;
	nr			=	12;
	condition	=	Info_Xardas_Ritual_Condition;
	information	=	Info_Xardas_Ritual_Info;
	permanent	=	0;
	important	=	0;	
	description		= "Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u."; 
};                       

FUNC int  Info_Xardas_Ritual_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Leren_Ritual))&&(xardas_agree == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Info_Xardas_Ritual_Info()
{
	AI_Output(other, self, "Info_Xardas_Ritual_15_00"); //Wszystko jest ju¿ przygotowane do przeprowadzenia rytua³u.
	AI_Output(self, other,"Info_Xardas_Ritual_14_01"); //Gdzie odbêdzie siê ceremonia?
	AI_Output(other, self, "Info_Xardas_Ritual_15_02"); //Leren czeka w pobli¿u kamiennego krêgu na bagnach.
	AI_Output(self, other,"Info_Xardas_Ritual_14_03"); //Dobrze, stawiê siê na miejsce. Pamiêtaj, ¿e kiedyœ sp³acisz ten d³ug.
	
   B_LogEntry(CH4_RBL_Rirual, "Xardas ruszy³ pomóc w odprawieniu rytua³u.");
	Npc_ExchangeRoutine(self, "RITUAL");
	B_StopProcessInfos(self);
};

// *************************************************

instance  Info_Xardas_RitualEnd (C_INFO)
{
	npc			=	Kdf_404_Xardas;
	nr			=	13;
	condition	=	Info_Xardas_RitualEnd_Condition;
	information	=	Info_Xardas_RitualEnd_Info;
	permanent	=	0;
	important	=	1;	
	description		= ""; 
};                       

FUNC int  Info_Xardas_RitualEnd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Xardas_Ritual))&&(Npc_KnowsInfo(hero,DIA_Leren_RitualBegin))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC VOID  Info_Xardas_RitualEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	
   AI_Output(self, other,"Info_Xardas_RitualEnd_14_01"); //Rytua³ siê zakoñczy³. Pamiêtaj jednak, ¿e kiedyœ upomnê siê o sp³atê d³ugu, który dzisiaj zaci¹gn¹³eœ.
	AI_Output(other, self, "Info_Xardas_RitualEnd_15_02"); //Nie obawiaj siê, mam dobr¹ pamiêæ. Poza tym zawsze dotrzymujê danego s³owa.
	AI_Output(self, other,"Info_Xardas_RitualEnd_14_03"); //To siê dopiero oka¿e...

	Npc_ExchangeRoutine(self, "START");
	B_StopProcessInfos(self);
   
   Xardas_teleport_after_ritual = true;
};

/*********************
Ork naukê i handel zostawiam, nie wiem co z ni¹ planujesze wiêc decyduj

********************/

/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/
/*
instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Poszukujê wiedzy magicznej."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Poszukujê wiedzy magicznej.
};


*/
//TODO: Wg nowego porzadku swiata (gothica) :P
//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
/*instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};

func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Mo¿esz mnie czegoœ nauczyæ?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadzê ciê w Szósty Kr¹g Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pamiêtaj, ¿e to przywilej zarezerwowany wy³¹cznie dla najbieglejszych magów. Mog¹ do niego przyst¹piæ ci, których ca³e ¿ycie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie elementów.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Szósty Kr¹g pozwala ci wykorzystywaæ magiê dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest s³u¿yæ potêdze magii, a nie j¹ wykorzystywaæ.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			B_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jesteœ zdolny, ale brak ci niezbêdnego doœwiadczenia. Niech Saturas popracuje nad Tob¹ przez jakiœ czas. Wtedy zobaczymy.
		
		B_StopProcessInfos	( self );
	};
};*/	


INSTANCE DIA_Xardas_CanYouTeachMe (C_INFO)
{
	npc				= Kdf_404_Xardas;
	//nr				= 71;
	condition		= DIA_Xardas_CanYouTeachMe_Condition;
	information		= DIA_Xardas_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Xardas_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Xardas_OTHERS))
	{
		return 1;
	};
};

FUNC VOID DIA_Xardas_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Xardas_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Xardas_CanYouTeachMe_12_02"); //Posiadam wiedzê o krêgach magii.
   AI_Output (self, other, "DIA_Xardas_CanYouTeachMe_12_03"); //Ale nie uczê nowicjuszy.
	
	Log_CreateTopic(GE_TeacherOW, LOG_NOTE);
	B_LogEntry(GE_TeacherOW, "Xardas nauczy mnie magicznych zaklêæ.");
};