// ********************************
// 				EXIT
// ********************************

instance DIA_Torlof_EXIT (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_Hallo_Condition;
	information	= DIA_Torlof_Hallo_Info;
	permanent	= 0;
	description = "Kim jesteœ?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Nazywam siê Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Bra³em udzia³ w buncie za³ogi na pok³adzie królewskiego okrêtu.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //To chyba nie by³ najlepszy pomys³. Wiêksza czêœæ za³ogi by³a po stronie kapitana.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //W ten sposób wyl¹dowa³em tutaj.
};

// ********************************

instance DIA_Torlof_Here (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 2;
	condition	= DIA_Torlof_Here_Condition;
	information	= DIA_Torlof_Here_Info;
	permanent	= 0;
	description = "A jak trafi³eœ do kopalni?";
};                       

FUNC int DIA_Torlof_Here_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_Hallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Here_Info()
{
	AI_Output (other, self,"DIA_Torlof_Here_15_00"); //A jak trafi³eœ do kopalni?
	AI_Output (self, other,"DIA_Torlof_Here_04_01"); //Do koñca walczy³em ze stra¿nikami, wtedy zepchnêli nas do kopalni, to by³ nasz ostatni bastion.
	AI_Output (self, other,"DIA_Torlof_Here_04_02"); //Przeprowadzili kilka ataków, ale wszystkie odparliœmy. Kopalnia to dobre miejsce do obrony.
	AI_Output (self, other,"DIA_Torlof_Here_04_03"); //W koñcu zawarliœmy coœ na kszta³t rozejmu. Mogli nas wzi¹æ g³odem wiêc i tak nie mieliœmy wyjœcia.
	AI_Output (self, other,"DIA_Torlof_Here_04_04"); //Odpowiadam teraz za wszystkich skazañców z kopalni i za te cholerne limity.
	AI_Output (other, self,"DIA_Torlof_Here_15_05"); //Jakie limity?
	AI_Output (self, other,"DIA_Torlof_Here_04_06"); //Limity wydobycia rudy. Znowu je podnieœli, teraz to ju¿ sto dwadzieœcia funtów czystej rudy.
	AI_Output (self, other,"DIA_Torlof_Here_04_07"); //Kiedy wydobywamy mniej, zabijaj¹ jednego z kopaczy i nie dostajemy wtedy racji ¿ywnoœciowych.
	AI_Output (other, self,"DIA_Torlof_Here_15_08"); //Sukinsyny. Czêsto to siê zdarza?
	AI_Output (self, other,"DIA_Torlof_Here_04_09"); //Niestety za czêsto. A co najgorsze jest nas coraz mniej, trudniej o wiêkszy urobek.
	AI_Output (other, self,"DIA_Torlof_Here_15_10"); //Mo¿e nied³ugo siê to zmieni.
	B_LogEntry		(CH4_GRD_NewMine, "W koñcu znalaz³em Torlofa. To on przewodzi skazañcami w kopalni. Maj¹ spory problem z dotrzymaniem limitów wydobycia rudy.");
};

// ********************************

instance DIA_Torlof_RBL (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 3;
	condition	= DIA_Torlof_RBL_Condition;
	information	= DIA_Torlof_RBL_Info;
	permanent	= 0;
	description = "Na górze szykuje siê coœ wiêkszego.";
};                       

FUNC int DIA_Torlof_RBL_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))&&(Npc_KnowsInfo (hero, DIA_Torlof_Here))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_RBL_Info()
{
	AI_Output (other, self,"DIA_Torlof_RBL_15_00"); //Na górze szykuje siê coœ wiêkszego.
	AI_Output (self, other,"DIA_Torlof_RBL_04_01"); //O czym mówisz?
	AI_Output (other, self,"DIA_Torlof_RBL_15_02"); //Wiêkszoœæ najemników i szkodników ma ju¿ doœæ stra¿ników.
	AI_Output (self, other,"DIA_Torlof_RBL_04_03"); //To by³o do przewidzenia. Co planuj¹?
	AI_Output (other, self,"DIA_Torlof_RBL_15_04"); //Najpierw musimy mieæ pewnoœæ co do Ciebie i Twoich ludzi.
	AI_Output (self, other,"DIA_Torlof_RBL_04_05"); //Jestem z wami do kroæset! Dajcie tylko znak, a zrobimy tu krwaw¹ jatkê!
	AI_Output (other, self,"DIA_Torlof_RBL_15_06"); //Nie tak szybko.	
	AI_Output (self, other,"DIA_Torlof_RBL_04_07"); //Kiedy planujecie atak?
	AI_Output (other, self,"DIA_Torlof_RBL_15_08"); //No w³aœnie to jest najwiêkszy problem. Nikt nie chce wykonaæ pierwszego ruchu.
	AI_Output (self, other,"DIA_Torlof_RBL_04_09"); //Cholera, gdyby tu by³ Lee nie by³oby ¿adnego problemu.
	AI_Output (self, other,"DIA_Torlof_RBL_04_10"); //Musisz go odnaleŸæ i powiedzieæ co siê kroi.
	lee_back = lee_back + 1;
	AI_Output (other, self,"DIA_Torlof_RBL_15_11"); //W porz¹dku. Dam Ci znaæ kiedy wszystko bêdzie gotowe.
	B_LogEntry		(CH4_NC_RBLBosses, "Torlof ruszy do boju, kiedy Lee stanie na czele rebelii w Nowym Obozie.");
};

// ********************************

instance DIA_Torlof_Hlp (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 4;
	condition	= DIA_Torlof_Hlp_Condition;
	information	= DIA_Torlof_Hlp_Info;
	important		= 1;
	permanent		= 0;
	description = ".";
};                       

FUNC int DIA_Torlof_Hlp_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Torlof_RBL))
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Hlp_Info()
{
	AI_Output (self, other,"DIA_Torlof_Hlp_04_01"); //Zaczekaj. Mam do Ciebie proœbê. Chodzi o urobek.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_02"); //Tak?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_03"); //Mam tu kilku malkontentów. Trzeba ich przekonaæ, ¿eby ciê¿ej pracowali.
	AI_Output (self, other,"DIA_Torlof_Hlp_04_04"); //Ja nie mam ju¿ do nich cierpliwoœci, a nie chcê, ¿eby rozmowa skoñczy³a siê czyimœ zgonem.
	AI_Output (self, other,"DIA_Torlof_Hlp_04_05"); //Oni musz¹ ¿yæ, bo martwi na nic siê nie przydadz¹. Mo¿e Ty znajdziesz jakiœ sposób, ¿eby przekonaæ do pracy tych darmozjadów?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_06"); //Pomo¿esz mi z urobkiem, to ja pomogê Ci wydostaæ siê z kopalni.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_07"); //W porz¹dku. Co to za malkontenci?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_08"); //Homer, Cipher i Butch. Ale pamiêtaj, potrzebujê ich ¿ywych!
	AI_Output (other, self,"DIA_Torlof_Hlp_15_09"); //Bêdê mia³ to na uwadze. Coœ jeszcze?
	AI_Output (self, other,"DIA_Torlof_Hlp_04_10"); //Porozmawiaj z Sherem. On zna tu ka¿dego, a ludzie go szanuj¹. Mo¿e coœ Ci doradzi.
	AI_Output (other, self,"DIA_Torlof_Hlp_15_11"); //W porz¹dku.
	B_LogEntry		(CH4_GRD_NewMine, "Torlof pomo¿e mi wydostaæ siê z kopalni, je¿eli ja przekonam Homera, Ciphera i Butcha do ciê¿szej pracy. Mo¿e Sher jakoœ mi pomo¿e. Aha - ¿aden ze skazañców nie mo¿e zgin¹æ!");
};

// ********************************

instance DIA_Torlof_HlpEnd (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 5;
	condition	= DIA_Torlof_HlpEnd_Condition;
	information	= DIA_Torlof_HlpEnd_Info;
	important		= 0;
	permanent		= 0;
	description = "Co do twoich kopaczy...";
};                       

FUNC int DIA_Torlof_HlpEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&(miners_work >= 1)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_HlpEnd_Info()
{
	var C_NPC jurg; jurg = Hlp_GetNpc(Grd_4090_Jurgen);
   
	AI_Output (other, self,"DIA_Torlof_HlpEnd_15_01"); //Co do twoich kopaczy...
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_02"); //Jak ci posz³o?
	
   if (miners_work == 3)
	{
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_03"); //Przekona³em wszystkich trzech do bardziej wytê¿onej pracy.
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_04"); //Ale nie da³bym rady bez pomocy Shera.
	}
	else if (miners_work >= 1)&&(miners_work < 3)
	{
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_05"); //Pracujê nad tym, s¹ ju¿ spore postêpy, ale nie przekona³em jeszcze wszystkich.
		AI_Output (other, self,"DIA_Torlof_HlpEnd_15_06"); //Na szczêœcie Sher bardzo mi pomóg³.
	};
   
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_07"); //Dobra robota, mo¿e jeszcze zd¹¿ymy...
	AI_TurnToNpc(self, jurg);
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_08"); //Cholera tylko nie to!
	AI_Output (other, self,"DIA_Torlof_HlpEnd_15_09"); //Co siê dzieje?
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Torlof_HlpEnd_04_10"); //Ju¿ za póŸno. Jurgen idzie odebraæ urobek.
	B_StopProcessInfos	(self);
   
	AI_GotoWP(jurg, "FM_151");
   Npc_ExchangeRoutine(jurg, "TalkingWithTorlof");
};

// ********************************

instance DIA_Torlof_TalkingWithJurgen (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_TalkingWithJurgen_Condition;
	information	= DIA_Torlof_TalkingWithJurgen_Info;
	permanent		= 0;
	important		= 1;
	description		= "...";
};                       

FUNC int DIA_Torlof_TalkingWithJurgen_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, DIA_Jurgen_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Torlof_TalkingWithJurgen_Info()
{
   var C_NPC jurgen; jurgen = Hlp_GetNpc(Grd_4090_Jurgen);
	B_FullStop (hero);
	AI_TurnToNpc(self, jurgen);
   
   AI_Output (self, other, "DIA_Jurgen_First_11_00"); //Daj mi jeszcze kilka chwil...
   
   B_StopProcessInfos(self);
};

instance DIA_Torlof_Fight (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 6;
	condition	= DIA_Torlof_Fight_Condition;
	information	= DIA_Torlof_Fight_Info;
	important		= 1;
	permanent		= 0;
	description = "...";
};                       

FUNC int DIA_Torlof_Fight_Condition()
{
	var C_NPC sher; sher = Hlp_GetNpc(Non_4088_Sher);

	if (Npc_KnowsInfo (hero, DIA_Jurgen_Third))&&(Npc_IsDead(sher))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Fight_Info()
{
	/**************************
Wsadzamy Bezia do kopalnii. W³¹czy mu siê gadka po tej torlofa
*************************/
	//Third/or four nameless?
	//	Wld_InsertNpc (Non_4125_NoName,"Mine_Entr");
	var C_NPC jur; jur = Hlp_GetNpc(Grd_4090_Jurgen);

	B_FullStop (hero);
	AI_TurnToNpc(self, jur);
	AI_GotoNpc(self, jur);
	AI_TurnToNpc(jur, self);

	AI_Output (self, other,"DIA_Torlof_Fight_04_01"); //Wystarczy ju¿ krwi i morderstw! Jestem odpowiedzialny za tych ludzi.
	AI_Output (self, other,"DIA_Torlof_Fight_04_02"); //Najwy¿sza pora zrobiæ porz¹dek ze stra¿nikami.
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Torlof_Fight_04_05"); //Uciekaj Rick, opowiedz o tym co siê wydarzy³o Lee i wróæcie tak szybko jak tylko zdo³acie.
	AI_Output (self, other,"DIA_Torlof_Fight_04_06"); //Niech œmieræ Shera nie pójdzie na marne.
	AI_Output (other, self,"DIA_Torlof_Fight_15_07"); //Mo¿esz byæ tego pewien!
	AI_TurnToNpc(self, jur);
	AI_DrawWeapon (self);
	AI_Output (self, other,"DIA_Torlof_Fight_04_08"); //Czas na ma³y rozpierdol!
	Log_SetTopicStatus	(CH4_GRD_NewMine, LOG_SUCCESS);
	B_LogEntry		(CH4_GRD_NewMine, "Dopiero œmieræ Shera sk³oni³a Torlofa do otwartej walki. Muszê jak najszybciej przekonaæ Lee, ¿eby wróci³ do obozu i poprowadzi³ swoich ludzi do walki o wolnoœæ. Torlof powinien utrzymaæ siê przez jakiœ czas - kopalniê ³atwo broniæ do tego zgromadzili spore zapasy ¿ywnoœci.");
	B_StopProcessInfos	(self);

	/************************
	Ork niech ci dwaj siê na siebie rzuc¹. Reszta kopaczy nie zaatakuje tych 2 stra¿ników a Dick ma uciekaæ z kopalni - przyda³aby siê kamerka prosta tutaj
	***********************/

	B_StartAfterDialogFight(self,jur,false);
	B_StartAfterDialogFight(jur,self,false);

	/*************
	Dick ma uciec z kopalni
	**************/

	AI_GotoWP		(other, "FM_02");
	
	/*****************
	
	niech stra¿nicy walcz¹
		Grd_20271_GRD
	Grd_20272_GRD
	Grd_20273_GRD
******************/

	Npc_SetTempAttitude(jur,ATT_HOSTILE); Npc_SetAttitude(jur,ATT_HOSTILE);
	var C_NPC g2;	g2 = Hlp_GetNpc(Grd_20272_GRD); Npc_SetTempAttitude(g2,ATT_HOSTILE); Npc_SetAttitude(g2,ATT_HOSTILE);
	var C_NPC g3;	g3 = Hlp_GetNpc(Grd_20273_GRD); Npc_SetTempAttitude(g3,ATT_HOSTILE); Npc_SetAttitude(g3,ATT_HOSTILE);
	var C_NPC g1;	g1 = Hlp_GetNpc(Grd_20271_GRD); Npc_SetTempAttitude(g1,ATT_HOSTILE); Npc_SetAttitude(g1,ATT_HOSTILE);
};

// ********************************

instance DIA_Torlof_Save (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 7;
	condition	= DIA_Torlof_Save_Condition;
	information	= DIA_Torlof_Save_Info;
	important		= 1;
	permanent		= 0;
	description = ".";
};                       

FUNC int DIA_Torlof_Save_Condition()
{
	/*************************************
Ork trzeba zrobiæ tak, ¿e gracz musi przebiæ siê do kopalni i najlepiej by³oby jakby portal do kopalni by³ aktywny dopiero po zabiciu wszystkich stra¿ników. Ma nie byæ ³atwo, niech gracz trochê pomyœli zanim rzuci siê na stra¿ników

***********************************/

	if (task_choice == 2)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Save_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);

	AI_Output (self, other,"DIA_Torlof_Save_04_01"); //Wróci³eœ! Na ow³osione jaja Beliara, nie s¹dzi³em, ¿e jeszcze zobaczê tê paskud¹ mordê.
	AI_Output (other, self,"DIA_Torlof_Save_15_02"); //Ja te¿ siê cieszê, ¿e nie da³eœ siê poszatkowaæ. Kto by mi wtedy postawi³ kolejkê?
	AI_Output (self, other,"DIA_Torlof_Save_04_03"); //He, he. Œwiête s³owa, jak tylko wykopiemy z obozu stra¿ników masz u mnie anta³ek ry¿ówki.
	AI_Output (other, self,"DIA_Torlof_Save_15_04"); //Trzymam Ciê za s³owo. A poza tym - Lee wróci³.
	AI_Output (self, other,"DIA_Torlof_Save_04_05"); //I to w³aœnie chcia³em us³yszeæ! No to na co jeszcze czekamy?
	AI_Output (other, self,"DIA_Torlof_Save_15_06"); //Na razie zabezpiecz kopalniê. Lee podeœle tu najemników, obejmiesz nad nimi dowództwo.
	AI_Output (other, self,"DIA_Torlof_Save_15_07"); //Czekaj na sygna³ do ataku. Wtedy bêdziesz móg³ dokopaæ ka¿demu napotkanemu stra¿nikowi o ile ja Ciê nie uprzedzê.
	AI_Output (self, other,"DIA_Torlof_Save_04_08"); //O to siê nie obawiaj. W porz¹dku, ogarnê ten burdel.
	AI_Output (self, other,"DIA_Torlof_Save_04_09"); //Pozdrów ode mne Lee. Powiedz mu, ¿e stary Trolof nie w¹tpi³ nawet przez chwilê w jego powrót.
	AI_Output (other, self,"DIA_Torlof_Save_15_10"); //Bywaj, brachu.

	B_LogEntry		(CH5_NO_Mine, "Przebi³em siê do Torlofa! Ten stary wyga nadal ¿yje. Ogarnie burdel w kopalni i bêdzie czeka³ na znak od Lee. Czas przekazaæ genera³owi pozdrowienia od Torlofa.");
}; 

INSTANCE DIA_Torlof_CanYouTeachMe (C_INFO)
{
	npc				= Sld_737_Torlof;
	nr				= 71;
	condition		= DIA_Torlof_CanYouTeachMe_Condition;
	information		= DIA_Torlof_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Torlof_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Torlof_Hallo))
	{
		return 1;
	};
};

FUNC VOID DIA_Torlof_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Torlof_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Torlof_CanYouTeachMe_12_02"); //Je¿eli w czymœ ci to pomo¿e, to wiem co nieco o pe³zaczach.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Torlof nauczy mnie jak pokroiæ pe³zacze.");
};