
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_HUN_859_AIDAN_Exit (C_INFO)
{
	npc			= HUN_859_AIDAN;
	nr			= 999;
	condition	= DIA_HUN_859_AIDAN_Exit_Condition;
	information	= DIA_HUN_859_AIDAN_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_HUN_859_AIDAN_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_859_AIDAN_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_HUN_859_AIDAN_Hello (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 1;
	condition		= DIA_HUN_859_AIDAN_Hello_Condition;
	information		= DIA_HUN_859_AIDAN_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jesteœ?"; 
};

FUNC INT DIA_HUN_859_AIDAN_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_HUN_859_AIDAN_Hello_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_01"); //Kim jesteœ?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_02"); //Przyrodnim bratem Rhobara. 
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_03"); //Zes³a³ mnie do Kolonii, bo królowa wola³a mój... miecz, he, he.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_04"); //Jestem Aidan. Myœliwy z zami³owania, kowal z koniecznoœci.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_05"); //Ale Ciebie widzê tu pierwszy raz. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_06"); //Trafi³em do Kolonii kilka dni temu.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_07"); //To od razu widaæ. Jakiœ taki wypacykowany jesteœ.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_08"); //U niektórych ch³opaków mia³byœ niez³e branie.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Hello_15_09"); //Mo¿e i jestem nowy, ale nie zwyk³em znosiæ obelg z ust pierwszego lepszego ³achudry.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_10"); //A jednak Ÿle Ciê oceni³em. Niech bêdzie, mo¿e i pasujesz tu bardziej ni¿ ja.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Hello_11_11"); //Dobra, poœmialiœmy siê, czas wracaæ do pracy.
};

INSTANCE DIA_HUN_859_AIDAN_GoBring (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 2;
	condition		= DIA_HUN_859_AIDAN_GoBring_Condition;
	information		= DIA_HUN_859_AIDAN_GoBring_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jesteœ tu jedynym kowalem?"; 
};

FUNC INT DIA_HUN_859_AIDAN_GoBring_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_Hello))&&(Npc_KnowsInfo (hero, DIA_HUN_336_Cavalorn_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_GoBring_Info()
{
	var C_NPC garry; garry = Hlp_GetNpc(RBL_2605_GARRY);
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_01"); //Jesteœ tu jedynym kowalem?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_02"); //Na to wygl¹da.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_03"); //Jak znam ¿ycie, to nie przyszed³eœ uci¹æ sobie mi³ej pogawêdki bez powodu.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_04"); //Muszê przekonaæ Cavalorna, ¿e nadajê siê na jednego z was.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_05"); //Aha. Czyli biegasz po obozie i robisz za kap³ana Adanosa.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_06"); //Tak siê sk³ada, ¿e mam coœ, w czym mo¿esz mi pomóc.
   
   if (Wld_IsTime (00,00,09,00))
   {
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_07"); //Mam problem z pewnym typkiem. Na razie go nie widaæ, ale jak go zobaczysz od razu bêdziesz wiedzia³, ¿e to najwiêkszy partacz.
      AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_08"); //Co z nim nie tak?
   }
   else
   {
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_09"); //Widzisz tego idiotê Garrego?
      AI_TurnToNpc(other,garry);	
      AI_TurnToNpc(self,garry);	
      Ai_wait(hero,1);//Orc: 6 sekund to masa czasu!
      Ai_wait(self,1);//Orc: 6 sekund to masa czasu!
      AI_TurnToNpc(other,self);
      AI_TurnToNpc(self,other);	
      AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_10"); //Chyba lubi swoj¹ pracê?
      AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_11"); //Niestety. Ju¿ dawno nie widzia³em wiêkszego partacza.
   };
   
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_12"); //Garry nie zrobi³ jeszcze ani jednego porz¹dnego ostrza.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_13"); //Problem tkwi w tym, ¿e on uwa¿a inaczej. Wydaje mu siê, ¿e wykuwa pierdolone dzie³a sztuki.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_14"); //Mo¿e dam mu w ³eb i zakopiemy œcierwo pod palisad¹?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_15"); //Nieg³upi pomys³, ale Cavalorn urwa³by nam za to jaja.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_16"); //Wystarczy, ¿e namówisz go do zmiany profesji.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GoBring_15_17"); //Mogê spróbowaæ.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_18"); //Je¿eli uda Ci siê uwolniæ mnie od tego nieudacznika, to wstawiê siê za Tob¹ u Cavalorna.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GoBring_11_19"); //A teraz wracam do roboty.
	
   Log_CreateTopic(CH1_Rbl_AidanHelp, LOG_MISSION);
	Log_SetTopicStatus(CH1_Rbl_AidanHelp, LOG_RUNNING);
	B_LogEntry(CH1_Rbl_AidanHelp, "Aidan jest kowalem. Zdaje siê, ¿e woli polowaæ, ale miecze te¿ potrafi wykuwaæ. Poprosi³ mnie o to, ¿ebym przekona³ jego pomocnika Garrego do zmiany profesji. Garry jest podobno strasznym nieudacznikiem i partaczy wszystko, co zrobi.");
};

INSTANCE DIA_Aidan_CanYouTeachMe (C_INFO)
{
	npc				=  HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_Aidan_CanYouTeachMe_Condition;
	information		= DIA_Aidan_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Aidan_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_HUN_859_AIDAN_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_CanYouTeachMe_Info()
{
   AI_Output (other, self, "DIA_Aidan_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_02"); //Jak chcesz mogê ciê co nieco nauczyæ o kowalstwie.
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_03"); //Ale ostrzegam! To bardzo ciê¿ka robota.
   AI_Output (self, other, "DIA_Aidan_CanYouTeachMe_15_04"); //Wiem te¿ jak wyci¹æ róg, ¿eby go nie uszkodziæ.	
   
   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "Aidan jest kowalem i mo¿e mnie nauczaæ swojego rzemios³a. Potrafi te¿ wyci¹æ róg.");
};

INSTANCE DIA_HUN_859_AIDAN_GarryCome (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 3;
	condition		= DIA_HUN_859_AIDAN_GarryCome_Condition;
	information		= DIA_HUN_859_AIDAN_GarryCome_Info;
	permanent		= 0;
	important		= 0;
	description		= "Garry ju¿ nie bêdzie Ci bruŸdzi³."; 
};

FUNC INT DIA_HUN_859_AIDAN_GarryCome_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GoBring))&&(garry_out == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_GarryCome_Info()
{
	aidan_trust = TRUE;
	B_GiveXP(250);
	rebel_camp_trust = rebel_camp_trust + 1; 
   
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_01"); //Garry ju¿ nie bêdzie Ci bruŸdzi³.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_02"); //Gdzie go zakopa³eœ?
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_03"); //Nigdzie. Po prostu stwierdzi³, ¿e ma ju¿ doœæ ogl¹dania Twojej paskudnej mordy.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_04"); //Œwietna robota. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_GarryCome_15_05"); //Wiêc jak bêdzie? Co powiesz Cavalornowi?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_06"); //Powiem, ¿e drugiego takiego jak Ty, to z pochodni¹ szukaæ.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_GarryCome_11_07"); //Masz moje poparcie, przyjacielu.
   
	Log_SetTopicStatus(CH1_Rbl_AidanHelp, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_AidanHelp, "Aidan by³ bardzo rad kiedy us³ysza³, ¿e Garry ju¿ mu nie bêdzie przeszkadza³. Na pewno poprze mnie przed Cavalornem.");
	B_LogEntry(CH1_Rbl_RebelCampTrust, "Dziêki za³atwieniu problemu z Garrym, zdoby³em poparcie Aidana.");
};

var int aidan_sword;
var int aidan_smith;
var int aidan_jurnal;

INSTANCE DIA_HUN_859_AIDAN_Sword (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_HUN_859_AIDAN_Sword_Condition;
	information		= DIA_HUN_859_AIDAN_Sword_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam przesy³kê od Œwistaka."; 
};

FUNC INT DIA_HUN_859_AIDAN_Sword_Condition()
{
	if (whistler_last_approve==TRUE)&&(NPC_HasItems(other,whistler_pack)>=1)&&(aidan_smith == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Sword_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_01"); //Mam przesy³kê od Œwistaka.

	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GarryCome))
	{
		//TODO: USTAWIANIE W TEN SPOSOB PERMAMENT NIE DZIALA - DO ZROBIENIA BEDA OSOBNE DIALOGI!!! PO SAVIE I LOADZIE ODPALA SIE DIALOG JESZCZE RAZ NAWET JEZELI PERMAMENT JEST FALSE.
		DIA_HUN_859_AIDAN_Sword.permanent = 0;
		aidan_smith = TRUE;
		
      AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_02"); //Co to za z³om?
		AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_03"); //Sk³adniki niezbêdne do wykucia miecza jego marzeñ.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_04"); //Dobra daj to.  
		
      B_GiveInvItems (other, self, whistler_pack, 1);
		Npc_RemoveInvItems(self,whistler_pack,1);
		
      AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_05"); //Pomog³eœ mi pozbyæ siê Garrego, wiêc odwdziêczê siê podobn¹ monet¹.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_06"); //Nie wezmê od Ciebie nawet bry³ki rudy za wykucie tego œwiecide³ka.
		AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword_15_07"); //Œwiecide³ka?
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_08"); //No có¿, miecze wykuwane dla Œwistaka rzadko wygl¹daj¹ jak... miecze.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_09"); //Najczêœciej s¹ to wymuskane b³yskotki, na których prawdziwy wojownik nawet nie zawiesi wzroku.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_10"); //Ale Œwistak dobrze p³aci za swoje dziwactwa, wiêc wykuwam wszystko, co sobie ubzdura.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_11"); //Wróæ jutro, wtedy miecz bêdzie gotowy.
		
      aidan_sword = B_SetDayTolerance()+1;
		B_LogEntry(CH1_Rbl_Sword, "Aidan zgodzi³ siê wykuæ dla mnie pawie pióro, ale zrobi³ to tylko ze wzglêdu na przys³ugê, któr¹ mu wyœwiadczy³em, namawiaj¹c Garrego do zmiany profesji. Mam wróciæ po miecz na drugi dzieñ.");
	}
	else
	{
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_12"); //To œwietnie, ale nie wykujê ¿adnego miecza, dopóki Garry têpi mi ose³kê.
		AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword_11_13"); //Pozb¹dŸ siê Garrego, to wtedy pogadamy.	
		
      if (aidan_jurnal == FALSE)
		{
			aidan_jurnal = TRUE;	
			B_LogEntry(CH1_Rbl_Sword, "Aidan nie wykuje ¿adnego miecza, dopóki nie pomogê mu rozwi¹zaæ problemu z Garrym.");
		};
	};
};

INSTANCE DIA_HUN_859_AIDAN_Sword12 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 4;
	condition		= DIA_HUN_859_AIDAN_Sword12_Condition;
	information		= DIA_HUN_859_AIDAN_Sword12_Info;
	permanent		= 0;
	important		= 0;
	description		= "Skoñczy³em z Garrym."; 
};

FUNC INT DIA_HUN_859_AIDAN_Sword12_Condition()
{
	if (whistler_last_approve)&&(NPC_HasItems(other, whistler_pack)>=1)&&(!aidan_smith)&&(aidan_jurnal)&&(aidan_trust)
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Sword12_Info()
{
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_01"); //Skoñczy³em z Garrym. Pomo¿esz mi ze zleceniem od Œwistaka?

	aidan_smith = TRUE;
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_02"); //Dobra, co tam masz?
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_03"); //Sk³adniki niezbêdne do wykucia miecza jego marzeñ.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_04"); //Daj ten z³om.  
      
	B_GiveInvItems (other, self, whistler_pack, 1);
	Npc_RemoveInvItems(self,whistler_pack,1);
		
   AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_05"); //Pozby³eœ siê Garrego.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_06"); //Nie wezmê od Ciebie nawet bry³ki rudy za wykucie tego œwiecide³ka.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Sword12_15_07"); //Œwiecide³ka?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_08"); //No có¿, miecze wykuwane dla Œwistaka rzadko wygl¹daj¹ jak... miecze.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_09"); //Najczêœciej s¹ to wymuskane b³yskotki, na których prawdziwy wojownik nawet nie zawiesi wzroku.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_10"); //Ale Œwistak dobrze p³aci za swoje dziwactwa, wiêc wykuwam wszystko, co sobie ubzdura.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Sword12_11_11"); //Wróæ jutro, wtedy miecz bêdzie gotowy.
		
   aidan_sword = B_SetDayTolerance()+1;
	B_LogEntry(CH1_Rbl_Sword, "Aidan zgodzi³ siê wykuæ dla mnie pawie pióro, ale zrobi³ to tylko ze wzglêdu na przys³ugê, któr¹ mu wyœwiadczy³em, namawiaj¹c Garrego do zmiany profesji. Mam wróciæ po miecz na drugi dzieñ.");
};

INSTANCE DIA_HUN_859_AIDAN_SwordOk (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 5;
	condition		= DIA_HUN_859_AIDAN_SwordOk_Condition;
	information		= DIA_HUN_859_AIDAN_SwordOk_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_HUN_859_AIDAN_SwordOk_Condition()
{
	if (aidan_smith) && (aidan_sword <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_SwordOk_Info()
{
	B_GiveXP(100);

	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_01"); //Miecz ju¿ gotowy.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_02"); //Zanieœ to cacko Œwistakowi z pozdrowieniami ode mnie.
	
   CreateInvItems (self,whistler_toy,1);
	B_GiveInvItems (self, other, whistler_toy, 1);
	
   AI_Output (other, self, "DIA_HUN_859_AIDAN_SwordOk_15_03"); //Ten miecz faktycznie wygl¹da, jakby mia³ siê rozpaœæ przy pierwszym uderzeniu.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_04"); //Ale za to b³yszczy siê jak psu jajca.
	AI_Output (other, self, "DIA_HUN_859_AIDAN_SwordOk_15_05"); //To fakt, dziêki Aidan.
	AI_Output (self, other, "DIA_HUN_859_AIDAN_SwordOk_11_06"); //Bywaj przyjacielu.
	
   B_LogEntry(CH1_Rbl_Sword, "Aidan w koñcu wyku³ miecz dla Œwistaka. To cacko nie nadaje siê do walki, ale to ju¿ nie moje zmartwienie.");
};

INSTANCE DIA_Aidan_Attack (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 11;
	condition		= DIA_Aidan_Attack_Condition;
	information		= DIA_Aidan_Attack_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Aidan_Attack_Condition()
{
	return q_n_again;
};

FUNC VOID DIA_Aidan_Attack_Info()
{
	AI_Output (self, other, "DIA_Aidan_Attack_11_01"); //To nie by³ dobry wybór. Cavalorn Ci zaufa³.
	AI_Output (self, other, "DIA_Aidan_Attack_11_02"); //I o co posz³o? O kilka bry³ek cholernej rudy...
	AI_Output (self, other, "DIA_Aidan_Attack_11_03"); //Niech Ciê szlag, piracie!
	B_StopProcessInfos(self); 
};
// **************************************************

INSTANCE DIA_Aidan_Stew (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 12;
	condition		= DIA_Aidan_Stew_Condition;
	information		= DIA_Aidan_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam ciep³y gulasz."; 
};

FUNC INT DIA_Aidan_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Aidan_Stew_15_01"); //Mam ciep³y gulasz.
	AI_Output (self, other, "DIA_Aidan_Stew_11_02"); //To œwietnie, pora rozgrzaæ brzuch.
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry(CH2_Rbl_Food, "Aidan wyliza³ miskê do czysta."); 
};

// **************************************************
var int steel_count;

INSTANCE DIA_AIDAN_Steel (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 13;
	condition		= DIA_AIDAN_Steel_Condition;
	information		= DIA_AIDAN_Steel_Info;
	permanent		= 0;
	important		= 0;
	description		= "Fox powiedzia³, ¿e potrzebujesz pomocy."; 
};

FUNC INT DIA_AIDAN_Steel_Condition()
{
	//TODO: Unknown
	if (Npc_KnowsInfo (hero, DIA_Fox_Stew))
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Steel_Info()
{
	AI_Output (other, self, "DIA_AIDAN_Steel_15_01"); //Fox powiedzia³, ¿e potrzebujesz pomocy.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_02"); //Pomoc zawsze siê przyda. Zaczyna mi brakowaæ stali na ostrza, a Cavalorn potrzebuje coraz to wiêcej mieczy i toporów.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_03"); //Przynieœ mi trochê stali, powiedzmy 10 prêtów. To mi wystarczy na jakiœ czas.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_04"); //W sumie jak ju¿ tu jesteœ, to rozejrzyj siê te¿ za moim... m³otkiem.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_05"); //Zgubi³eœ m³ot kowalski?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_06"); //Co siê tak patrzysz? By³o póŸno, wraca³em z karczmy... Wiêcej nie pamiêtam...
	AI_Output (other, self, "DIA_AIDAN_Steel_15_07"); //Ale masz czym kuæ miecze?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_08"); //Pewnie, ¿e mam. Przecie¿ Cavalorn by mi jaja urwa³, gdybym przerwa³ pracê.
	AI_Output (self, other, "DIA_AIDAN_Steel_11_09"); //Tylko, ¿e przyzwyczai³em siê do tamtego m³ota, by³ lepiej wywa¿ony i robota szybciej mi sz³a.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_10"); //Stal i m³ot... A co ja bêdê z tego mia³?
	AI_Output (self, other, "DIA_AIDAN_Steel_11_11"); //Wykujê Ci porz¹dn¹ klingê i specjalnie podostrzê. Takiej broni tu nie znajdziesz.
	AI_Output (other, self, "DIA_AIDAN_Steel_15_12"); //Niech bêdzie. Nied³ugo wrócê.

	Log_CreateTopic(CH2_Rbl_Steel, LOG_MISSION);
	Log_SetTopicStatus(CH2_Rbl_Steel, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_Steel, "Mam przynieœæ Aidanowi 10 stalowych prêtów. Potrzebuje ich do wykucia ostrzy dla Cavalorna. Muszê rozejrzeæ siê po Kolonii.");

	Log_CreateTopic(CH2_Rbl_Hammer, LOG_MISSION);
	Log_SetTopicStatus(CH2_Rbl_Hammer, LOG_RUNNING);
	B_LogEntry(CH2_Rbl_Hammer, "Aidan zgubi³ gdzieœ swój m³ot kowalski. Powiedzia³, ¿e jak go znajdê i przyniosê stal, to wykuje mi porz¹dny orê¿.");

	B_LogEntry(CH2_Rbl_RebelCampLife, "Aidan poprosi³ mnie o przyniesienie 10 stalowych prêtów i o odnalezienie m³ota kowalskiego.");
	steel_count=10;
	aidan_sword=0;
	Wld_InsertItem(Aidan_Hammer,"FP_MIS_AIDAN_HAMMER"); 	
};

// **************************************************
var int Wait4Hammer;//jezeli zdecydowalismy ¿e znajdziemy jeszcze mlotek

FUNC VOID DIA_AIDAN_SteelOk1_Info()
{
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_12"); //Przynios³eœ stal. Miecz mo¿e byæ gotowy na jutro.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_13"); //Ale wola³bym ¿ebyœ znalaz³ dla mnie mój m³otek.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_14"); //To jak bêdzie?
	Info_ClearChoices (DIA_AIDAN_SteelOk);
	Info_AddChoice (DIA_AIDAN_SteelOk, "Wykonaj miecz.", DIA_AIDAN_SteelOk1_Yes);
	Info_AddChoice (DIA_AIDAN_SteelOk, "Przyniosê ten m³otek.", DIA_AIDAN_SteelOk1_No);			
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_AIDAN_SteelOk1_YES()
{
	aidan_sword = B_SetDayTolerance()+1;
	Wait4Hammer=FALSE;
   
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_15"); //Wykonaj miecz.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_16"); //W takim razie zabieram siê do roboty. 
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_17"); //Miecz bêdzie gotowy na jutro.
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_18"); //Wiêc wrócê nazajutrz.	
   
	B_LogEntry(CH2_Rbl_RebelCampLife, "Przynios³em Aidanowi stal. Kowal zabra³ siê do roboty. Mam wróciæ po miecz nastêpnego dnia.");
	Info_ClearChoices (DIA_AIDAN_SteelOk);
};

// ------------------No----------------

FUNC VOID DIA_AIDAN_SteelOk1_No()
{
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_19"); //Przyniosê ten m³otek.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_20"); //Dobry wybór. 
	Info_ClearChoices (DIA_AIDAN_SteelOk);
	Wait4Hammer=TRUE;
};		

var int aid_steel;
var int aid_hammer;

INSTANCE DIA_AIDAN_SteelOk (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 14;
	condition		= DIA_AIDAN_SteelOk_Condition;
	information		= DIA_AIDAN_SteelOk_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mam to czego potrzebujesz."; 
};

FUNC INT DIA_AIDAN_SteelOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_AIDAN_Steel))&&(!aidan_sword)&&(!Npc_KnowsInfo (hero, DIA_AIDAN_Debt))//nie zostalo zlecone
	//bugfix: dialog pojawial sie przy zadaniu z dlugiem, tak sie konczy recykling zmiennych ;p
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SteelOk_Info()
{
	var int steel_be4;
	steel_be4=steel_count;
	AI_Output (other, self, "DIA_AIDAN_SteelOk_15_01"); //Mam to, czego potrzebujesz.
	AI_Output (self, other, "DIA_AIDAN_SteelOk_11_02"); //Zobaczmy...

	if (NPC_HasItems(other,ItMiSwordraw)>=steel_count)&&(aid_steel == FALSE)
	{
		aid_steel = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_03"); //Rzeczywiœcie, to stalowe prêty! W koñcu mam z czego kuæ miecze.
		B_GiveInvItems (other, self, ItMiSwordraw, steel_count);
		Log_SetTopicStatus(CH2_Rbl_Steel, LOG_SUCCESS);
		B_LogEntry(CH2_Rbl_Steel, "Przynios³em Aidanowi 10 stalowych prêtów. Teraz nie bêdzie ju¿ narzeka³ na nudê.");
		steel_count=0;
	}
	else if ((NPC_HasItems(other,ItMiSwordraw)<steel_count)&&(NPC_HasItems(other,ItMiSwordraw)>1))&&(aid_steel == FALSE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_04"); //Wezmê to, co masz.
		steel_count = steel_count - NPC_HasItems(other,ItMiSwordraw);
		B_GiveInvItems(other,self,ItMiSwordraw,NPC_HasItems(other,ItMiSwordraw));

		if (steel_count >=10)
		{
			B_GiveXP(250);
			aid_steel = TRUE;
			AI_Output (self, other, "DIA_AIDAN_SteelOk_11_05"); //Tyle stali mi wystarczy. W koñcu mogê zabraæ siê za kucie.
			Log_SetTopicStatus(CH2_Rbl_Steel, LOG_SUCCESS);
			B_LogEntry(CH2_Rbl_Steel, "Przynios³em Aidanowi 10 stalowych prêtów. Teraz nie bêdzie ju¿ narzeka³ na nudê.");
		};
	}
	else if (aid_steel == TRUE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_06"); //Stal ju¿ przynios³eœ. Na razie wiêcej nie potrzebujê.
	};

	if (NPC_HasItems(other,Aidan_Hammer)>=1)&&(aid_hammer == FALSE)
	{
		aid_hammer = TRUE;
		B_GiveXP(250);
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_07"); //Znalaz³eœ mój m³otek! Wielkie dziêki.
		B_GiveInvItems(other,self,Aidan_Hammer,1);
		Log_SetTopicStatus(CH2_Rbl_Hammer, LOG_SUCCESS);
		B_LogEntry(CH2_Rbl_Hammer, "Znalaz³em m³otek Aidana. Kowal ucieszy³ siê jak dziecko.");
	}
	else if (aid_hammer == TRUE)
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_08"); //M³otek ju¿ mi zwróci³eœ.
	};

	if (aid_hammer == TRUE)&&(aid_steel == TRUE)
	{
		DIA_AIDAN_SteelOk.permanent = FALSE;
		//
		aidan_sword = B_SetDayTolerance()+1;
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_09"); //Przynios³eœ stal i m³otek. W takim razie zabieram siê do roboty. 
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_10"); //Miecz bêdzie gotowy na jutro.
		AI_Output (other, self, "DIA_AIDAN_SteelOk_15_11"); //Wiêc wrócê nazajutrz.
		B_LogEntry(CH2_Rbl_RebelCampLife, "Przynios³em Aidanowi stal i m³otek. Kowal zabra³ sie do roboty. Mam wróciæ po miecz nastêpnego dnia. ");
	}
	else if(aid_steel)&&(!Wait4Hammer)
	{
		DIA_AIDAN_SteelOk1_Info();//OnlySteel		
	}
	else if(steel_be4==steel_count)&&(aid_hammer==FALSE)//orc: added
	{
		AI_Output (self, other, "DIA_AIDAN_SteelOk_11_12"); //Nastêpnym razem przynieœ chocia¿ jeden prêt.
	};
};

INSTANCE DIA_AIDAN_SteelOk2 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 16;
	condition		= DIA_AIDAN_SteelOk2_Condition;
	information		= DIA_AIDAN_SteelOk2_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_AIDAN_SteelOk2_Condition()
{
	if (aid_steel) && ((!Wait4Hammer) || (aid_hammer)) && (aidan_sword <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SteelOk2_Info()
{
	B_GiveXP(100);
   
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_01"); //Miecz ju¿ gotowy. Mam nadziejê, ¿e zrobisz z niego dobry u¿ytek.
	
   if(aid_hammer)
	{
		CreateInvItem (self, RBL_AIDAN_SWORD);
		B_GiveInvItems (self, other, RBL_AIDAN_SWORD, 1);
	}
	else
	{
		CreateInvItem (self,RBL_AIDAN_SWORD2);            
		B_GiveInvItems (self, other, RBL_AIDAN_SWORD2, 1);				
	};
   
	AI_Output (other, self, "DIA_AIDAN_SteelOk2_15_02"); //O to siê nie musisz obawiaæ.
   AI_Output (self, other, "DIA_AIDAN_SteelOk2_15_03"); //No có¿, czas wracaæ do swych obowi¹zków...
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_03"); //Rozmawia³em z Cavalornem. Powiedzia³, ¿e jak ju¿ odbierzesz miecz, to masz go odwiedziæ.
	AI_Output (other, self, "DIA_AIDAN_SteelOk2_15_04"); //Nie wiesz, co chcia³?
	AI_Output (self, other, "DIA_AIDAN_SteelOk2_11_05"); //Pewnie sam Ci powie. Bywaj.

   Log_SetTopicStatus(CH2_Rbl_RebelCampLife, LOG_SUCCESS);
	B_LogEntry(CH2_Rbl_RebelCampLife, "Aidan dotrzyma³ s³owa. Miecz by³ gotowy nazajutrz i trzeba przyznaæ, ¿e warto by³o czekaæ.");
	B_LogEntry(CH2_Rbl_RebelCampLife, "Myœliwy powiedzia³ te¿, ¿e Cavalorn chce ze mn¹ porozmawiaæ. Powinienem zobaczyæ siê z przywódc¹ rebeliantów.");
};

INSTANCE DIA_AIDAN_Spy (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 13;
	condition		= DIA_AIDAN_Spy_Condition;
	information		= DIA_AIDAN_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Lubisz samotnoœæ?"; 
};

FUNC INT DIA_AIDAN_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_AIDAN_Spy_15_01"); //Lubisz samotnoœæ?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_02"); //Wszyscy myœliwi chadzaj¹ w³asnymi œcie¿kami przyjacielu. Jak cieniostwory.
	AI_Output (self, other, "DIA_AIDAN_Spy_07_03"); //A te œcie¿ki czasem prowadz¹ do miejsc, które lepiej omijaæ szerokim ³ukiem.
	AI_Output (other, self, "DIA_AIDAN_Spy_15_04"); //Twoja œcie¿ka te¿ zaprowadzi³a Ciê do takiego miejsca?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_05"); //¯eby tylko raz. Ci¹gle czujê na barkach brzemiê... przesz³oœci.
	AI_Output (other, self, "DIA_AIDAN_Spy_15_06"); //Móg³byœ mi to wyt³umaczyæ?
	AI_Output (self, other, "DIA_AIDAN_Spy_07_07"); //Móg³bym, ale nie wiem, czy chcê przyjacielu. Mo¿e kiedyœ...
	
   B_LogEntry(CH2_Rbl_Spy, "Aidan jest jak cieniostwór - cichy i nieprzewidywalny. Chadza w³asnymi œcie¿kami, które prowadz¹ do niebezpiecznych miejsc. Co ukrywa by³y myœliwy?");
	
	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od Ciebie chcia³.
		B_LogEntry(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos(self);
};

INSTANCE DIA_AIDAN_Spy1 (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 14;
	condition		= DIA_AIDAN_Spy1_Condition;
	information		= DIA_AIDAN_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "S³ysza³em, ¿e lubisz nocne wêdrówki."; 
};

FUNC INT DIA_AIDAN_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Spy1_Info()
{
	tony_spy = tony_spy + 1;
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_01"); //S³ysza³em, ¿e lubisz nocne wêdrówki.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_02"); //Ktoœ wœcibia nos w nie swoje sprawy.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_03"); //Wolê samotnoœæ, ludzie mnie mêcz¹.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_04"); //Pewnie sporo widzisz podczas tych wypadów.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_05"); //Czasami a¿ nazbyt wiele.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_06"); //Dziwne, ¿e akurat Ty o to pytasz.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_07"); //Dlaczego?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_08"); //Tak siê sk³ada, ¿e widzia³em was, zanim dotarliœcie do naszego obozu.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_09"); //Œledzi³eœ nas?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_10"); //Dziwisz siê? Kilku kolesi w dziwnych pancerzach, którzy wziêli siê nie wiadomo sk¹d.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_11"); //Jednak zanim was zauwa¿y³em, by³em œwiadkiem dziwnej sceny.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_12"); //Tak?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_13"); //Natkn¹³em siê na Toniego i stra¿ników.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_14"); //Wiem, zaatakowali go i chcieli zaci¹gn¹æ do Starego Obozu.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_15"); //Hmm, ja widzia³em coœ innego. Tony z nimi rozmawia³ i wygl¹da³o na to, ¿e dobrze siê znaj¹.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_16"); //To ciekawe, mów dalej.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_17"); //Poza tym stra¿nicy nigdy nie bior¹ jeñców, wol¹ nas zabijaæ. Tak jest proœciej.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_18"); //Rozumiem. Czyli uwa¿asz, ¿e Tony nadal brata siê ze stra¿nikami?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_19"); //Na to wygl¹da. Ale mo¿e to tylko starzy znajomi. Sam nie wiem.
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_20"); //PóŸniej, kiedy wy rzuciliœcie siê na stra¿ników, ju¿ nie zaprz¹ta³em tym sobie g³owy.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_21"); //Powiedzia³eœ Cavalornowi?
	AI_Output (self, other, "DIA_AIDAN_Spy1_07_22"); //Nie, wola³em siê upewniæ. Ale póŸniej tak mnie zawali³ robot¹, ¿e nie mia³em ju¿ czasu na nocne wypady.
	AI_Output (other, self, "DIA_AIDAN_Spy1_15_23"); //To sporo t³umaczy. Bywaj.
	
   B_LogEntry(CH2_Rbl_Spy, "Chyba ju¿ wiem, kto jest szpiegiem Gomeza. Aidan widzia³, jak Tony rozmawia ze stra¿nikami, zanim pos³aliœmy ich do Beliara.");
	
   if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};
   
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_AIDAN_Debt (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 15;
	condition		= DIA_AIDAN_Debt_Condition;
	information		= DIA_AIDAN_Debt_Info;
	permanent		= 0;
	important		= 0;
	description		= "Przynoszê pozdrowienia od Nikolasa."; 
};

FUNC INT DIA_AIDAN_Debt_Condition()
{
	return debt_read;
};

FUNC VOID DIA_AIDAN_Debt_Info()
{
	AI_Output (other, self, "DIA_AIDAN_Debt_15_01"); //Przynoszê pozdrowienia od Nikolasa.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_02"); //Tak szybko? Myœla³em, ¿e jeszcze trochê poczeka.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_03"); //Obawiam siê, ¿e chce z powrotem odzyskaæ ca³¹ rudê. Razem z odsetkami to bêdzie... 600 bry³ek.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_04"); //£adnie sobie policzy³, cholerny lichwiarz. A jaki Ty masz w tym interes?
	AI_Output (other, self, "DIA_AIDAN_Debt_15_05"); //To nie tylko mój interes, ale ca³ego obozu. Cavalorn poleci³ mi znaleŸæ sojuszników wœród ³owców trolli.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_06"); //Rozumiem. To trochê komplikuje sprawy...
	AI_Output (self, other, "DIA_AIDAN_Debt_11_07"); //Bêdê z tob¹ szczery - nie mam tej rudy.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_08"); //Po¿yczy³em na procent tylko po to, ¿eby zdobyæ pewn¹ receptê.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_09"); //By³em pewien, ¿e dziêki recepturze wykujê orê¿, który szybko sprzedam w du¿ych iloœciach.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_10"); //Czyli nie znalaz³eœ recepty?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_11"); //Niestety nie. Cz³owiek, który mia³ j¹ dla mnie zdobyæ, nigdy nie wróci³.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_12"); //Albo ulotni³ siê z rud¹, w co w¹tpiê. Pewnie jego koœci bielej¹ gdzieœ na szlaku.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_13"); //Dobra, mów, co mam zrobiæ.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_14"); //Musisz odnaleŸæ tego, kogo pos³a³em po receptê.
	AI_Output (self, other, "DIA_AIDAN_Debt_11_15"); //Nazywa siê Skrzek. Z tego co wiem, mówi³, ¿e recepta powinna znajdowaæ siê gdzieœ w starej cytadeli, na wzgórzu nieopodal Starego Obozu.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_16"); //W porz¹dku. Poszukam cia³a i recepty. Wtedy dasz mi rudê, tak?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_17"); //Ekhm... Oczywiœcie, przyjacielu. Im szybciej wyruszysz, tym szybciej odnajdziesz receptê.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_18"); //Aha, a co to za przepis?
	AI_Output (self, other, "DIA_AIDAN_Debt_11_19"); //To recepta na dobry miecz albo topór. Bez obaw, znajdziesz tê co trzeba.
	AI_Output (other, self, "DIA_AIDAN_Debt_15_20"); //Czas na kolejny spacerek.
   
	Log_CreateTopic(CH2_TRL_Recept, LOG_MISSION);
	Log_SetTopicStatus(CH2_TRL_Recept, LOG_RUNNING);
	B_LogEntry(CH2_TRL_Recept, "Aidan odda mi rudê, je¿eli odnajdê dla niego jak¹œ receptê. Wczeœniej Aidan wys³a³ na poszukiwania jakiegoœ Skrzeka - rudê od Nikolasa po¿yczy³ w³aœnie na zorganizowanie wyprawy. Recepta ma siê znajdowaæ w starej cytadeli orków. Czeka mnie sporo zabawy...");
	B_LogEntry(CH2_TRL_Debt, "¯eby odzyskaæ d³ug od Aidana, muszê odnaleŸæ dla niego jak¹œ receptê. Cholera ci¹gle coœ...");

	Wld_InsertNpc(RBL_4030_Skrzek,"BRIDGE_CASTLE_TO_PLATEAU");
	Wld_InsertNpc(OrcBiter,"CASTLE_20");
	Wld_InsertNpc(OrcBiter,"OW_PATH_108");	
	var C_NPC nik; nik = Hlp_GetNpc(RBL_4030_Skrzek);
	Npc_ChangeAttribute(nik, ATR_HITPOINTS, -nik.attribute[ATR_HITPOINTS_MAX]);	
};

var int aidan_paydebt;
INSTANCE DIA_AIDAN_DebtEnd (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 16;
	condition		= DIA_AIDAN_DebtEnd_Condition;
	information		= DIA_AIDAN_DebtEnd_Info;
	permanent		= 0;
	important		= 0;
	description		= "Znalaz³em tê receptê przy ciele Skrzeka."; 
};

FUNC INT DIA_AIDAN_DebtEnd_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_AIDAN_Debt)) && (NPC_HasItems(other,Recept_ItMw_1H_Sword_Long_02)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_DebtEnd_Info()
{
	B_GiveXP(400);
	
   AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_01"); //Znalaz³em tê receptê przy ciele Skrzeka.
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_02"); //Poka¿ pergamin.
	
   B_GiveInvItems (other, self, Recept_ItMw_1H_Sword_Long_02, 1);
	Npc_RemoveInvItems(self,Recept_ItMw_1H_Sword_Long_02,1);
	
   AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_03"); //No proszê, trzeba dodaæ inne proporcje rudy i d³u¿ej wykuwaæ g³owniê...
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_04"); //Bêdê te¿ potrzebowa³ kilku sk³adników...
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_05"); //Nawet o tym nie myœl! Ja wywi¹za³em siê z umowy, teraz Twoja kolej. Gdzie ruda?
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_06"); //Ekhm... Daj mi tylko kilka dni...
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_07"); //Co?! Powiedzia³eœ, ¿e gdy dostaniesz receptê, ja dostanê rudê!
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_08"); //Wiem, nie chcia³em Ciê denerwowaæ...
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_09"); //S³uchaj, dziêki tej recepcie zdo³am wykuæ porz¹dny orê¿. Jestem pewien, ¿e dobrze sprzedam ka¿dy miecz.
	AI_Output (self, other, "DIA_AIDAN_DebtEnd_11_10"); //Wróæ za... trzy dni. Wtedy dostaniesz d³ug z odsetkami i premiê ode mnie.
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_11"); //Chyba nie mam wyboru.
	AI_Output (other, self, "DIA_AIDAN_DebtEnd_15_12"); //Niech bêdzie, trzy dni i ani chwili d³u¿ej.
	
   aidan_paydebt = Wld_GetDay()+3;
	Log_SetTopicStatus(CH2_TRL_Recept, LOG_SUCCESS);
	B_LogEntry(CH2_TRL_Recept, "Odda³em receptê Aidanowi. Obieca³, ¿e jak tylko wykuje miecze, zap³aci mi za trud i dorzuci premiê.");
	B_LogEntry(CH2_TRL_Debt, "Aidan wzi¹³ receptê, ale na rudê muszê poczekaæ trzy dni. Powiedzia³, ¿e najpierw musi wykuæ orê¿ i sprzedaæ miecze, wtedy odda mi rudê i dorzuci jak¹œ premiê. Lepiej dla niego, ¿eby to by³a prawda.");
	B_StopProcessInfos(self);
	//Npc_ExchangeRoutine(self,"Start");//ma kuæ te miecze dzieñ i noc najlepiej, zrób mu na to rutynê Ork
};

INSTANCE DIA_AIDAN_SwordAfter (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 117;
	condition		= DIA_AIDAN_SwordAfter_Condition;
	information		= DIA_AIDAN_SwordAfter_Info;
	permanent		= 0;
	important		= 1;
	description		= "hejo"; 
};

FUNC INT DIA_AIDAN_SwordAfter_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_AIDAN_DebtEnd)) && (aidan_paydebt <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SwordAfter_Info()
{
	debt_counter = debt_counter + 1;
	B_GiveXP(250);
	
   AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_01"); //Sprzeda³em miecze! Zarobi³em wiêcej, ni¿ siê spodziewa³em.
	AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_02"); //Mi³o mi to s³yszeæ.	
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_03"); //Oto d³ug z odsetkami i twoje 400 bry³ek premii!
	
   CreateInvItems (self, ItMiNugget,1000); 
	B_GiveInvItems (self, other, ItMiNugget, 1000);
	
   AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_04"); //Rzeczywiœcie musia³eœ sporo zarobiæ na mieczach.
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_05"); //To by³ strza³ w sam œrodek dupy orka! Op³aca³o siê poczekaæ, hê?
	AI_Output (other, self, "DIA_AIDAN_SwordAfter_15_06"); //Raczej tak, no i nie musia³em wyrywaæ rudy z twojego gard³a.
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_07"); //To by³ ¿art, tak? 
	AI_Output (self, other, "DIA_AIDAN_SwordAfter_11_08"); //Nie ¿artowa³eœ?! Ekhm... Mam coœ do zrobienia, bywaj.
	
   B_LogEntry(CH2_TRL_Debt, "Odzyska³em d³ug od Aidana, zarobi³em przy okazji 400 bry³ek - czasami warto poczekaæ, zamiast dŸgaæ mieczem.");
	B_StopProcessInfos(self);
};

/***************************************

SIDE QUEST

***************************************/

// **************************************************

INSTANCE DIA_AIDAN_Eqquipment(C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 18;
	condition		= DIA_AIDAN_Eqquipment_Condition;
	information		= DIA_AIDAN_Eqquipment_Info;
	permanent		= 0;
	important		= 0;
	description		= "Cavalorn powiedzia³, ¿e coœ dla mnie masz."; 
};

FUNC INT DIA_AIDAN_Eqquipment_Condition()
{
	if (hero.guild == GIL_HUN)
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_Eqquipment_Info()
{
	B_GiveXP(100);
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_01"); //Cavalorn powiedzia³, ¿e coœ dla mnie masz.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_02"); //A mam, pewnie. Ale najpierw wyœwiadczysz mi przys³ugê...
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_03"); //Mam ju¿ doœæ biegania na posy³ki!
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_04"); //Mam propozycjê. Ty dasz mi coœ, co pomo¿e mi zabiæ kilku skurwieli ze Starego Obozu, a ja zapomnê o tej 'przys³udze'.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_05"); //Niech bêdzie, to uczciwa propozycja. Wybacz, ale zapomnia³em, z kim mam do czynienia.
	AI_Output (other, self, "DIA_AIDAN_Eqquipment_15_06"); //Pochlebców te¿ nie lubiê...
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_11_07"); //Tak, oczywiœcie. To co wybierasz?
	
   Info_ClearChoices (DIA_AIDAN_Eqquipment);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Wezmê broñ jednorêczn¹.", DIA_AIDAN_Eqquipment_sword);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Daj mi jakiegoœ dwurêczniaka.", DIA_AIDAN_Eqquipment_sword2h);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Przyda³by siê jakiœ ³uk.", DIA_AIDAN_Eqquipment_bow);
	Info_AddChoice (DIA_AIDAN_Eqquipment, "Potrzebujê kuszy.", DIA_AIDAN_Eqquipment_crossbow);
};

// ---------------------------sword----------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_sword()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_sword_15_01"); //Wezmê broñ jednorêczn¹.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_sword_11_02"); //Ta bêdzie w sam raz.

	CreateInvItems (self,HUN_MW_03AXE,1);
	B_GiveInvItems (self, other, HUN_MW_03AXE, 1);
   
	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta³em od Aidana dobry miecz.");
	B_StopProcessInfos(self);
};

// ---------------------------sword 2h----------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_sword2h()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_sword2h_15_01"); //Daj mi jakiegoœ dwurêczniaka.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_sword2h_11_02"); //Wypróbuj ten miecz, nadal jest ostry i dobrze wywa¿ony.

	CreateInvItems (self,HUN_MW_04,1);
	B_GiveInvItems (self, other, HUN_MW_04, 1);
   
	B_eqquip_check();
   
	B_LogEntry(CH3_RBL_Choose, "Dosta³em od Aidana dobry miecz dwurêczny.");
	B_StopProcessInfos(self);
};

// ------------------------------bow-------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_bow()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_bow_15_01"); //Przyda³by siê jakiœ ³uk.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_bow_08_02"); //Mam coœ, co powinno Ci siê spodobaæ.

	CreateInvItems (self,HUN_RW_01,1);
	B_GiveInvItems (self, other, HUN_RW_01, 1);
   
	B_eqquip_check();
   
	B_LogEntry		(CH3_RBL_Choose, "Dosta³em od Aidana dobry ³uk.");
	B_StopProcessInfos	(self);
};

// ------------------------------crossbow-------------------------------------

FUNC VOID DIA_AIDAN_Eqquipment_crossbow()
{
	AI_Output (other, self,"DIA_AIDAN_Eqquipment_crossbow_15_01"); //Potrzebujê kuszy.
	AI_Output (self, other,"DIA_AIDAN_Eqquipment_crossbow_08_02"); //To œwietna decyzja, akurat mam wyœmienit¹ kuszê.

	CreateInvItems (self,HUN_RW_03,1);
	B_GiveInvItems (self, other, HUN_RW_03, 1);
	
   B_eqquip_check();
	
   B_LogEntry(CH3_RBL_Choose, "Dosta³em od Aidana dobr¹ kuszê.");
	B_StopProcessInfos(self);
};

var int help_choice;

// **************************************************

INSTANCE DIA_AIDAN_SWD_Help (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 19;
	condition		= DIA_AIDAN_SWD_Help_Condition;
	information		= DIA_AIDAN_SWD_Help_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam Ci pomóc z mieczami."; 
};

FUNC INT DIA_AIDAN_SWD_Help_Condition()
{
	return ratford_help;
};

FUNC VOID DIA_AIDAN_SWD_Help_Info()
{
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_15_01"); //Mam Ci pomóc z mieczami.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_02"); //Prosi³em Ratforda o pomoc, ale nie s¹dzi³em, ¿e przyœle Ciebie.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_15_03"); //Ka¿dy ma chwilê s³aboœci. No dobra, mów, co mam robiæ.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_04"); //Dam ci wybór. Wykujesz 10 mieczy, albo przyniesiesz 10 sztabek ¿elaza i 5 sztabek stali.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_11_05"); //Co wybierasz?

	Info_ClearChoices (DIA_AIDAN_SWD_Help);
	Info_AddChoice (DIA_AIDAN_SWD_Help, "Wykujê miecze.", DIA_AIDAN_SWD_Help_SWDS);
	Info_AddChoice (DIA_AIDAN_SWD_Help, "Przyniosê sztabki.", DIA_AIDAN_SWD_Help_PRBS);
};

// -------------------------------------------------------------------

FUNC VOID DIA_AIDAN_SWD_Help_SWDS()
{
	help_choice = 1;
	
   AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_01"); //Wykujê miecze.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_SWDS_11_02"); //To œwietnie. Nie spodziewa³em siê tego po Tobie.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_03"); //Nie rozklejaj siê, bo siê rozmyœlê. Jakie to maj¹ byæ miecze?
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_SWDS_11_04"); //WeŸ tê recepturê. Wykuj 10 mieczy i daj mi znaæ.
	
   CreateInvItems (self,Recept_ItMw_1H_Sword_Long_04,1); //zmieñ na receptê jak¹œ
	B_GiveInvItems (self, other, Recept_ItMw_1H_Sword_Long_04, 1);
	
   AI_Output (other, self, "DIA_AIDAN_SWD_Help_SWDS_15_05"); //W porz¹dku, biorê siê do roboty...
	
   B_LogEntry(CH3_RBL_AidanHelp, "Wykujê dla Aidana 10 mieczy. Da³ mi receptê, wed³ug której mam przygotowaæ 10 mieczy zwyciêstwa. To do roboty...");
	B_StopProcessInfos(self);
};

// -------------------------------------------------------------------

FUNC VOID DIA_AIDAN_SWD_Help_PRBS()
{
	help_choice = 2;
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_01"); //Przyniosê sztabki.
	AI_Output (self, other, "DIA_AIDAN_SWD_Help_PRBS_11_02"); //Nie dziwi mnie to, jak zawsze po najmniejszej linii oporu.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_03"); //Przestañ biadoliæ, bo siê rozmyœlê.
	AI_Output (other, self, "DIA_AIDAN_SWD_Help_PRBS_15_04"); //Nied³ugo wrócê ze sztabkami.

	B_LogEntry(CH3_RBL_AidanHelp, "Przyniosê Aidanowi 10 sztabek ¿elaza oraz 5 sztabek stali, po co siê przemêczaæ?");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_AIDAN_SWD_HelpEnd (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 20;
	condition		= DIA_AIDAN_SWD_HelpEnd_Condition;
	information		= DIA_AIDAN_SWD_HelpEnd_Info;
	permanent		= 1;
	important		= 0;
	description		= "Jestem z powrotem."; 
};

FUNC INT DIA_AIDAN_SWD_HelpEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_AIDAN_SWD_Help) && (help_choice < 5))
	{
		return 1;
	};
};

FUNC VOID DIA_AIDAN_SWD_HelpEnd_Info()
{
	AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_01"); //Jestem z powrotem.
	AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_02"); //Co tak d³ugo?
   
	if (help_choice == 1)&&(NPC_HasItems(other,ItMw_1H_Sword_Long_04)>=10)//to te miecze maj¹ byæ
	{
		others_help = others_help + 1;
		B_GiveXP(500);
		help_choice = 5;
      
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_03"); //Twoje miecze. Mam nadziejê, ¿e ju¿ wkrótce posmakuj¹ krwi stra¿ników.
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_04"); //B¹dŸ tego pewien.
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_05"); //A to wyku³em dla Ciebie. Zatopi³em w amulecie star¹ runê, powinien daæ Ci jak¹œ ochronê.
		
      Give_and_remove(ItMw_1H_Sword_Long_04, 10);
      Create_and_give(Amulett_der_Macht, 1);
		
      AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_06"); //Dziêki, na pewno siê przyda.
		
		Log_SetTopicStatus(CH3_RBL_AidanHelp, LOG_SUCCESS);
		B_LogEntry(CH3_RBL_AidanHelp, "Wyku³em miecze dla Aidana, orê¿ przys³u¿y siê sprawie.");
	}
	else if (help_choice == 2)&&(NPC_HasItems(other, ItMa_Iron)>=10) && (NPC_HasItems(other, ItMa_Steel)>=5)
	{
		others_help = others_help + 1;
		B_GiveXP(200);
		help_choice = 5;
      
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_07"); //Bierz sztabki i zabieraj siê do roboty!
		AI_Output (self, other, "DIA_AIDAN_SWD_HelpEnd_11_08"); //Wiem, co mam robiæ. ZejdŸ mi z oczu!

      Give_and_remove(ItMa_Iron, 10);
      Give_and_remove(ItMa_Steel, 5);

		Log_SetTopicStatus	(CH3_RBL_AidanHelp, LOG_SUCCESS);

		B_LogEntry(CH3_RBL_AidanHelp, "Odda³em Aidanowi sztabki, kolejne nudne zadanie zaliczone!");
	}
	else
	{
		AI_Output (other, self, "DIA_AIDAN_SWD_HelpEnd_15_09"); //Cholera nie mam wszystkiego! Wkrótce wrócê...
	};
   
	B_StopProcessInfos(self);
};

INSTANCE DIA_Aidan_armor (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 12;
	condition		= DIA_Aidan_armor_Condition;
	information		= DIA_Aidan_armor_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mi wykuæ pewien pancerz ze skóry..."; 
};

FUNC INT DIA_Aidan_armor_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Kira_HuntFinalEnd))&&(NPC_HasItems(other,ItAt_BlackTroSkin)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Aidan_armor_Info()
{
   AI_Output (other, self, "DIA_Aidan_armor_15_01"); //Mo¿esz mi wykuæ pewien pancerz ze skóry....
   AI_Output (self, other, "DIA_Aidan_armor_11_02"); //Zaczekaj no, ja tylko wykuwam broñ, nie jestem ¿adnym p³atnerzem.
   AI_Output (self, other, "DIA_Aidan_armor_11_03"); //Tak, a te wszystkie pancerze rebeliantów pojawi³y siê ni st¹d, ni zow¹d?
   AI_Output (self, other, "DIA_Aidan_armor_11_04"); //Przestaæ mi zawracaæ dupê, mam pe³ne rêce roboty.
};

INSTANCE DIA_HUN_859_AIDAN_Repair_Axe (C_INFO)
{
	npc				= HUN_859_AIDAN;
	nr				= 3;
	condition		= DIA_HUN_859_AIDAN_Repair_Axe_Condition;
	information		= DIA_HUN_859_AIDAN_Repair_Axe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Czy móg³byœ podostrzyæ mi mój topór?"; 
};

FUNC INT DIA_HUN_859_AIDAN_Repair_Axe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_HUN_859_AIDAN_GarryCome)) && (!repaired_axe_Rick) && (NPC_HasItems(other, Rick_Axe_1)>=1) 
		&& (NPC_GetDistToWP(self, "OM_SMITH_03") < 1000)
	{
		B_unequip_current_mweapon_hero(Rick_Axe_1);
		return 1;
	};
};

FUNC VOID DIA_HUN_859_AIDAN_Repair_Axe_Info()
{
	repaired_axe_Rick = TRUE; 
   
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Repair_Axe_15_01"); //Czy móg³byœ podostrzyæ mi mój topór?
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Repair_Axe_11_02"); //Jasne! Daj mi go, a po chwili znów bêdziesz móg³ posiekaæ kogoœ na kawa³ki.
   
	AI_GotoWP(self, "OM_SMITH_03");
	B_StartUseMob(self, "BSSHARP");
	AI_Wait(self, 1);
	B_StopUseMob(self, "BSSHARP");
	Give_and_remove(Rick_Axe_1, 1);
   Create_and_give(Rick_Axe_2a, 1);
	AI_GotoNPC(self, other);
	AI_TurnToNPC(self, other);
	
	AI_Output (self, other, "DIA_HUN_859_AIDAN_Repair_Axe_15_03"); //Proszê, niech ci dobrze s³u¿y. 
	AI_Output (other, self, "DIA_HUN_859_AIDAN_Repair_Axe_15_04"); //Dziêki.
};