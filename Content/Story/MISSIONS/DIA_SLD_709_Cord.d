// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	B_StopProcessInfos(self);
};

var int cord_warn;

/*------------------------------------------------------------------------
Hi							
------------------------------------------------------------------------*/

instance  DIA_Cord_Hello (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Hello_Condition;
	information		= DIA_Cord_Hello_Info;
	important		= 1;
	permanent		= 1;
	description		= "."; 
};

FUNC int  DIA_Cord_Hello_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 600) && (cord_warn < 3)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Hello_Info()
{
	B_FullStop (hero);
	AI_DrawWeapon (self);
	AI_GotoNpc(other,self);
   
	if (Kapitel<3)
	{
		AI_Output (self, other,"DIA_Cord_Hello_14_11"); //OdejdŸ st¹d, bo ¿ycie to cenny dar, ch³opcze.
		AI_RemoveWeapon (self);
		B_StopProcessInfos(self);
		AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
	}
	else
	{
		if (cord_warn==0)
		{
			cord_warn = cord_warn + 1;//1
			AI_DrawWeapon (self);
			AI_Output (self, other,"DIA_Cord_Hello_14_12"); //A Ty chyba szukasz guza!
			AI_Output (other, self,"DIA_Cord_Hello_15_13"); //Chodzê tam, gdzie mi siê podoba.
			AI_Output (self, other,"DIA_Cord_Hello_14_14"); //To œwietnie. Myœlê, ¿e tam Ci siê bardziej spodoba...
			AI_RemoveWeapon(self);
			B_StopProcessInfos(self);
			AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
		}
		else if (cord_warn==1)
		{
			cord_warn = cord_warn + 1;//2
			AI_Output (other, self,"DIA_Cord_Hello_15_17"); //Nikt nie bêdzie mi mówi³, co mam robiæ!
			AI_Output (self, other,"DIA_Cord_Hello_06_18"); //Co Ty nie powiesz? Wynoœ siê pókim dobry!
			AI_RemoveWeapon(self);
			B_StopProcessInfos(self);
			AI_GotoWP(other, "LOCATION_19_03_PATH_RUIN7");
		}
		else if (cord_warn==2)
		{
			cord_warn = cord_warn + 1;//3
			AI_Output (other, self,"DIA_Cord_Hello_15_19"); //Prosisz siê o z³ojenie skóry.
			AI_Output (self, other,"DIA_Cord_Hello_06_20"); //Skoro nalegasz...
			B_StopProcessInfos (self); 
			B_StartAfterDialogFight(self,other,false);
		};
	};
}; 

INSTANCE DIA_Cord_After (C_INFO)
{
	npc				= SLD_709_Cord;
	nr				= 2;
	condition		= DIA_Cord_After_Condition;
	information		= DIA_Cord_After_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Cord_After_Condition()
{
	if (cord_warn==3)
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_After_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);

	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Cord_After_07_01"); //Potrafisz walczyæ. Szkoda, ¿e nie jesteœ najemnikiem.
		B_GiveXP(100);
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Cord_After_07_02"); //NieŸle, pokona³eœ mnie. Niezgorszy z Ciebie szermierz.
		B_GiveXP(200);	
	};
   
	AI_Output (self, other, "DIA_Cord_After_07_03"); //Jak chcesz mo¿esz siê tu rozejrzeæ. Wydaje mi siê, ¿e mo¿esz okazaæ siê... pomocny.
};

//************************************************************

instance  DIA_Cord_Question (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Question_Condition;
	information		= DIA_Cord_Question_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jesteœ Cord?"; 
};

FUNC int  DIA_Cord_Question_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Help))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Question_Info()
{
	B_GiveXP(250);
	AI_Output (other, self,"DIA_Cord_Question_15_01"); //Ty jesteœ Cord?
	AI_Output (self, other,"DIA_Cord_Question_14_02"); //Tak, a co Ci do tego?
	AI_Output (other, self,"DIA_Cord_Question_15_03"); //Mam dla Ciebie wiadomoœæ od Jarvisa. Kaza³ przekazaæ, ¿e 'znalaz³ zgubê i czeka na resztê'.
	AI_Output (self, other,"DIA_Cord_Question_14_04"); //Hmm, rozumiem. Mo¿esz wracaæ...
	AI_Output (other, self,"DIA_Cord_Question_15_05"); //Chwila. Jarvis powiedzia³, ¿e dostanê tyle rudy ile udŸwignê.
	AI_Output (self, other,"DIA_Cord_Question_14_06"); //To idŸ do niego. A teraz zejdŸ mi z drogi, ch³opcze.
	
   B_LogEntry(CH3_NON_Mercenary, "Przekaza³em wiadomoœæ Cordowi, ale o zap³acie mogê zapomnieæ. Muszê sobie porozmawiaæ z tym Jarvisem.");
	B_StopProcessInfos(self);
};

//************************************************************

instance  DIA_Cord_Convoys (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_Convoys_Condition;
	information		= DIA_Cord_Convoys_Info;
	important		= 0;
	permanent		= 0;
	description		= "O co chodzi z tymi konwojami?"; 
};

FUNC int  DIA_Cord_Convoys_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Lee_Convoys))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_Convoys_Info()
{
	AI_Output (other, self,"DIA_Cord_Convoys_15_01"); //O co chodzi z tymi konwojami?
	AI_Output (self, other,"DIA_Cord_Convoys_14_02"); //Cholerni magnaci co jakiœ czas wysy³aj¹ ze Starego Obozu do Fletchera konwoje z ¿ywnoœci¹, broni¹ i ludŸmi. W drodze powrotnej konwoje zabieraj¹ rudê i ry¿ówkê.
	AI_Output (self, other,"DIA_Cord_Convoys_14_03"); //Musimy je przej¹æ i zadbaæ o to, aby nikt nie zdo³a³ zbiec do Starego Obozu.
	AI_Output (other, self,"DIA_Cord_Convoys_15_04"); //W czym wiêc problem?
	AI_Output (self, other,"DIA_Cord_Convoys_14_05"); //W tym, ¿e nas te mendy za dobrze znaj¹. Potrzebujê kogoœ kto chocia¿ na pierwszy rzut oka bêdzie wygl¹da³ jak stra¿nik.
	AI_Output (other, self,"DIA_Cord_Convoys_15_06"); //I oczywiœcie pomyœla³eœ o mnie. Po prostu czujê siê zaszczycony.
	AI_Output (self, other,"DIA_Cord_Convoys_14_07"); //Daj spokój z t¹ ironi¹. Wiem od Gorna, ¿e ju¿ wczeœniej paradowa³eœ po obozie w pancerzu stra¿nika. 
	AI_Output (other, self,"DIA_Cord_Convoys_15_08"); //W Starym Obozie te¿ siê rozgl¹da³em.
	AI_Output (self, other,"DIA_Cord_Convoys_14_09"); //Sam widzisz, ¿e nie znajdê nikogo lepszego.
	AI_Output (self, other,"DIA_Cord_Convoys_14_10"); //Wiêc jak bêdzie?
	
   B_LogEntry		(CH5_NC_Convoys,	"Cord chce przej¹æ konwoje z ¿ywnoœci¹, broni¹ i ludŸmi zmierzaj¹ce ze Starego Obozu do Fletchera. Potrzebuje kogoœ kto z pozoru wygl¹da jak stra¿nik, czyli niestety nadajê siê do tego najlepiej.");
};

//************************************************************

instance  DIA_Cord_ConvoysHelp (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysHelp_Condition;
	information		= DIA_Cord_ConvoysHelp_Info;
	important		= 0;
	permanent		= 0;
	description		= "W porz¹dku, wchodzê w to."; 
};

FUNC int  DIA_Cord_ConvoysHelp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_Convoys))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysHelp_Info()
{
	AI_Output (other, self,"DIA_Cord_ConvoysHelp_15_01"); //W porz¹dku, wchodzê w to.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_02"); //W koñcu ktoœ z twardymi jajami. Czasu nie mamy zbyt du¿o, wiêc s³uchaj uwa¿nie.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_03"); //Uda³o mi siê dowiedzieæ tylko tyle, ¿e pierwszy konwój transportuje ¿ywnoœæ. Najczêœciej wybieraj¹ uczêszczany szlak ze Starego Obozu do Nowego.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_04"); //Ten jest te¿ najs³abiej chroniony. Zajmiesz siê tym sam. Wyr¿nij stra¿ników i przejmij ³adunek.
	AI_Output (other, self,"DIA_Cord_ConvoysHelp_15_05"); //Rozumiem. Zajmê siê tym od razu.
	AI_Output (self, other,"DIA_Cord_ConvoysHelp_14_06"); //Wróæ do mnie jak tylko za³atwisz sprawê.
	B_LogEntry		(CH5_NC_Convoys, "Konwój pod¹¿a szlakiem ze Starego Obozu do Nowego. Mam wyr¿n¹æ stra¿ników i przej¹æ ³adunek. Wygl¹da doœæ prosto.");

	/*********************

WsadŸ ich przed mostem do NO, tam gdzie kufer jest, niech sobie gadaj¹ i wpierdzielaj¹ ¿arcie, które niby nios¹ dla Fletchera i jego bandy
*************************/

	Wld_InsertNpc	(Grd_4096_Convoy1, "OW_PATH_056");
	Wld_InsertNpc	(Grd_4097_Convoy2, "OW_PATH_056");
};

//************************************************************

var int cord_wait;
var int cord_price;

instance  DIA_Cord_ConvoysPeople (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeople_Condition;
	information		= DIA_Cord_ConvoysPeople_Info;
	important		= 0;
	permanent		= 0;
	description		= "Za³atwi³em sprawê z pierwszym konwojem."; 
};

FUNC int  DIA_Cord_ConvoysPeople_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Convoy1_First))&&(Npc_KnowsInfo(hero,DIA_Cord_ConvoysHelp))&&(NPC_HasItems(hero,foodpackage)>=4)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeople_Info()
{
	cord_price = cord_price + 1;
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_01"); //Za³atwi³em sprawê z pierwszym konwojem.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_02"); //Masz ca³y transport?
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_03"); //Cztery paczki cuchn¹cego ¿arcia, proszê bardzo. Nie ka¿ mi tylko tego jeœæ.
	B_GiveInvItems (other, self, foodpackage, 4);
	Npc_RemoveInvItems(self,foodpackage,4);
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_04"); //Bez obaw. To mia³a byæ ¿ywnoœæ dla kopaczy i najemników z kopalni.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_05"); //Czas na kolejny transport. Tym razem bêdzie to '¿ywy inwentarz'.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_06"); //Ludzie?
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_07"); //Przecie¿ jesteœmy w Kolonii, tu nie ma ludzi. To skazañcy.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_08"); //Nie wiem ilu i nie znam trasy przemarszu, ale powinni byæ jeszcze w pobli¿u Starego Obozu.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_09"); //Poszukaj ich w pobli¿u bram.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_10"); //Masz na to dwa dni.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_11"); //Trochê ma³o, ale zrobiê co w mojej mocy.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_12"); //Twój rachunek roœnie, Cord.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_13"); //Za³atw sprawê z konwojami do koñca, a nie po¿a³ujesz.
	AI_Output (other, self,"DIA_Cord_ConvoysPeople_15_14"); //To siê dopiero oka¿e, przyjacielu.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_15"); //Stra¿nicy wybrani do tej roboty to wybitne skurywysny, wiêc siê z nimi nie cackaj.
	AI_Output (self, other,"DIA_Cord_ConvoysPeople_14_16"); //Porozmawiaj z Orikiem, pomo¿e Ci w wypruwaniu flaków.
	cord_wait = B_SetDayTolerance()+2;
	B_LogEntry		(CH5_NC_Convoys, "Tym razem to transport ludzi. Cord zasugerowa³ abym rozejrza³ siê w pobli¿u Starego Obozu, a dok³adnie w okolicy bram. Da³ mi 2 dni na odnalezienie transportu. Mo¿e Orik pomo¿e mi ze stra¿nikami.");

	/*****************************************

Miejsce: tam gdzie w g1 by³y te 3 zêbacza - po przejœciu rzeki mo¿naby³o iœæ do cytadeli zmiennokszta³tnych.
Wsadzi siê tam 3 martwych koopaczy i 1 ¿ywego - stra¿nicy siê zabawili z nimi. Stra¿nicy maj¹ siê rzuciæ na dicka i orika jak tylko go zobacz¹. 
Wszystkich npców zrobi³em, daj im tylko odp. wp.

********************************************/

	/**********************
¯ywy towar
**************************/

	Wld_InsertNpc	(VLK_4098_Buddler,"OW_PATH_168");
	Wld_InsertNpc	(VLK_4099_Buddler,"OW_PATH_169");
	Wld_InsertNpc	(VLK_4100_Buddler,"OW_PATH_169");
	var C_NPC vk1; vk1 = Hlp_GetNpc(VLK_4098_Buddler);
	Npc_ChangeAttribute	(vk1, ATR_HITPOINTS, -vk1.attribute[ATR_HITPOINTS_MAX]);
	var C_NPC vk2; vk2 = Hlp_GetNpc(VLK_4099_Buddler);
	Npc_ChangeAttribute	(vk2, ATR_HITPOINTS, -vk2.attribute[ATR_HITPOINTS_MAX]);
	var C_NPC vk3; vk3 = Hlp_GetNpc(VLK_4100_Buddler);
	Npc_ChangeAttribute	(vk3, ATR_HITPOINTS, -vk3.attribute[ATR_HITPOINTS_MAX]);

	Wld_InsertNpc	(VLK_4101_Buddler, "OW_PATH_170");

	/**************************
Stra¿nicy
***************************/

	Wld_InsertNpc	(Grd_4102_Convoy,"OW_PATH_168");
	Wld_InsertNpc	(Grd_4103_Convoy,"OW_PATH_168");
	Wld_InsertNpc	(Grd_4104_Convoy,"OW_PATH_169");
	Wld_InsertNpc	(Grd_4105_Convoy,"OW_PATH_170");
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone_Condition;
	information		= DIA_Cord_ConvoysPeopleDone_Info;
	important		= 0;
	permanent		= 0;
	description		= "'¯ywy towar' zabezpieczony."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone_Condition()
{	
	var C_NPC con1; con1 = Hlp_GetNpc(Grd_4102_Convoy);
	var C_NPC con2; con2 = Hlp_GetNpc(Grd_4103_Convoy);
	var C_NPC con3; con3 = Hlp_GetNpc(Grd_4104_Convoy);
	var C_NPC con4; con4 = Hlp_GetNpc(Grd_4105_Convoy);

	if (Npc_KnowsInfo(hero, DIA_ConvoyCommander_First))
	&& (Npc_IsDead(con1) && Npc_IsDead(con2) && Npc_IsDead(con3) && Npc_IsDead(con4))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone_Info()
{
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone_15_01"); //'¯ywy towar' zabezpieczony.
	
   if (cord_wait >= Wld_GetDay())
	{
		cord_price = cord_price + 1;
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone_14_02"); //Uwin¹³eœ siê z tym, œwietna robota.
	}
	else
	{
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone_14_03"); //SpóŸni³eœ siê! Ale lepiej póŸno ni¿ wcale.
	};

	B_LogEntry(CH5_NC_Convoys, "Transport ludzi zabezpieczony.");
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone2 (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone2_Condition;
	information		= DIA_Cord_ConvoysPeopleDone2_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ocala³ tylko jeden z kopaczy."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone2_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoysPeopleDone))&&(Npc_KnowsInfo(hero,DIA_Budd_First ))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone2_Info()
{
	var C_NPC bud; bud = Hlp_GetNpc(VLK_4101_Buddler);

	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_01"); //Ocala³ tylko jeden z kopaczy.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_02"); //Co siê z nim sta³o?
	
   if (Npc_KnowsInfo(hero,DIA_Budd_Safe))
	{
		cord_price = cord_price + 1;
		AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_03"); //Doprowadzi³em go bezpiecznie do obozu.
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_04"); //Jestem pod wra¿eniem. Uwzglêdniê to podczas zap³aty.
		B_LogEntry		(CH5_NC_Convoys, "Op³aci³o siê doprowadziæ tego biednego kopacza do obozu. Cord uwzglêdni to przy rozliczeniu.");
	}
	else if (Npc_IsDead(bud))
	{
		AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone2_15_05"); //Nie da³ rady... Stra¿nicy paskudnie go posiekali.
		AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_06"); //Cholerne sukinsyny!
	}
   else
   {
      AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone2_14_07"); //Nie wiem... Gdzieœ zagin¹³ w akcji...
   };
};

//************************************************************

instance  DIA_Cord_ConvoysPeopleDone3 (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone3_Condition;
	information		= DIA_Cord_ConvoysPeopleDone3_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znalaz³em to przy dowódcy konwoju."; 
};

FUNC int  DIA_Cord_ConvoysPeopleDone3_Condition()
{	
	if (NPC_HasItems(hero,convoy_list)>=1)&&(convoy_list_read == TRUE)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoysPeopleDone3_Info()
{
	cord_price = cord_price + 1;
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_01"); //Znalaz³em to przy dowódcy konwoju.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_02"); //Co to za papier?
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_03"); //Sam zobacz.
	B_GiveInvItems (other, self, convoy_list, 1);
	Npc_RemoveInvItems(self,convoy_list,1);
	B_UseFakeScroll(self);
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_04"); //To jest nasza przepustka do przejêcia ostatniego konwoju!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_05"); //Te¿ tak sobie pomyœla³em. Jest tylko jedno ale. Kto podszyje siê pod przysz³ego konwojenta?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_06"); //A jak myœlisz? Znam tylko jednego szaleñca, który za odpowiedni¹ iloœæ rudy nakopa³by do dupy samemu Beliarowi!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_07"); //Wiesz jak mnie podejœæ... Za³ó¿my, ¿e pójdê do Starego Obozu. Co dalej?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_08"); //Zastawimy pu³apkê na konwój. Broñ bêd¹ przewoziæ pod dobr¹ eskort¹.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_09"); //To w tej chwili najcenniejszy towar w Kolonii.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_10"); //Przede wszystkim musisz do³¹czyæ do eskorty.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_11"); //Musisz te¿ dowiedzieæ siê, jak¹ tras¹ wyruszy transport. I musisz mi tê wiadomoœæ przekazaæ odpowiednio wczeœnie, ¿ebym zdo³a³ przygotowaæ niespodziankê dla tych sukinsynów.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_12"); //Cholera... To Ciê bêdzie sporo kosztowaæ.
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_13"); //Wiem, ale nie wybra³bym do tej roboty nikogo innego. Dasz sobie radê, Rick.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_14"); //Jak mam dostarczyæ wiadomoœæ?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone3_14_15"); //Wyœlê jednego z naszych. Bêdzie czeka³ w jaskini za mostem, w pobli¿u po³udniowej bramy. 
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone3_15_16"); //Dobra, zobaczymy jak to siê skoñczy.

	B_LogEntry(CH5_NC_Convoys, "No to wdepn¹³em. Muszê do³¹czyæ do eskorty przewo¿¹cej broñ ze Starego Obozu, dowiedzieæ siê jak¹ tras¹ rusz¹ i przekazaæ tê wiadomoœæ najemnikowi, który bêdzie czeka³ w jaskini za mostem. ¯ebym tylko nie pomyli³ kolejnoœci, he, he.");
};

//************************************************************

instance DIA_Cord_ConvoysPeopleDone4 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoysPeopleDone4_Condition;
	information		= DIA_Cord_ConvoysPeopleDone4_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoysPeopleDone4_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoysPeopleDone3))
	{
		return 1;
	};
};

FUNC void DIA_Cord_ConvoysPeopleDone4_Info()
{
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_01"); //Jeszcze jedno, Rick.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_02"); //Co tym razem?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_03"); //Nie daj siê zabiæ, bo ju¿ siê zd¹¿y³em do Ciebie przyzwyczaiæ.
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_04"); //Czy to oœwiadczyny?
	AI_Output (self, other,"DIA_Cord_ConvoysPeopleDone4_14_05"); //ZejdŸ mi z oczu, piracie!
	AI_Output (other, self,"DIA_Cord_ConvoysPeopleDone4_15_06"); //Bywaj, Cord.
	
   B_StopProcessInfos(self);
};

//************************************************************

func void B_EndTrapChangeRoutine()
{
	var C_NPC sldCordTrap7506; sldCordTrap7506 = Hlp_GetNpc(SLD_7506_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7506, "HIDE");
	var C_NPC sldCordTrap7507; sldCordTrap7507 = Hlp_GetNpc(SLD_7507_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7507, "HIDE");
	var C_NPC sldCordTrap7508; sldCordTrap7508 = Hlp_GetNpc(SLD_7508_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7508, "HIDE");
	var C_NPC sldCordTrap7509; sldCordTrap7509 = Hlp_GetNpc(SLD_7509_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7509, "HIDE");
	var C_NPC sldCordTrap7510; sldCordTrap7510 = Hlp_GetNpc(SLD_7510_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7510, "HIDE");
	var C_NPC sldCordTrap7511; sldCordTrap7511 = Hlp_GetNpc(SLD_7511_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7511, "HIDE");
	var C_NPC sldCordTrap7512; sldCordTrap7512 = Hlp_GetNpc(SLD_7512_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7512, "HIDE");
	var C_NPC sldCordTrap7513; sldCordTrap7513 = Hlp_GetNpc(SLD_7513_SoeldnerCordTrap);
	Npc_ExchangeRoutine(sldCordTrap7513, "HIDE");
};
//CINEMATIC?
//DIA_Cord_ConvoyConvoyTrap
//DIA_Cord_ConvoyConvoyTrapEnd etc.
//DIA_Orkan_EscortTrapTalk
instance DIA_Cord_ConvoyConvoyTrap (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyConvoyTrap_Condition;
	information		= DIA_Cord_ConvoyConvoyTrap_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyConvoyTrap_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orkan_EscortTrap))&&(Npc_GetDistToNpc(self,hero) < 2500)
	{
		return 1;
	};
};

FUNC void DIA_Cord_ConvoyConvoyTrap_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, hero);
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);
	AI_TurnToNpc(self, ork);
	AI_Output (self, other,"DIA_Cord_ConvoyConvoyTrap_14_01"); //Rzuæcie broñ! Nie macie szans, celuje w was kilkanaœcie kuszy.
	AI_Output (self, other,"DIA_Cord_ConvoyConvoyTrap_14_02"); //Zale¿y nam tylko na broni.
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(other, self);
	AI_PlayAni(self,"T_YES");
	AI_TurnToNpc(ork, hero);
	B_StopProcessInfos	(self);
};

//************************************************************

instance DIA_Cord_ConvoyConvoyTrapEnd (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyConvoyTrapEnd_Condition;
	information		= DIA_Cord_ConvoyConvoyTrapEnd_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyConvoyTrapEnd_Condition()
{	
	if (merc_trap == 2)&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoyConvoyTrapEnd_Info()
{
	B_FullStop (hero);
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);

	/*********************
Dodaj tej najemników którzy przyszli z Cordem

***********************/

	AI_TurnToNpc(self, ork);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_01"); //Czemu nie? Znam Ciê Orkan, wiem na co ciê staæ. Przyda siê nam ktoœ taki.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_02"); //Witaj wœród ludzi Lee, stra¿niku.
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_03"); //A co do Ciebie, piracie...
	AI_Output (other, self, "DIA_Cord_ConvoyConvoyTrapEnd_15_04"); //Zdaje siê, ¿e solidnie zapracowa³em na nagrodê.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_05"); //Niech mnie szlag, je¿eli tak nie jest!
	cord_price = cord_price + 1;
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_06"); //To coœ specjalnego, tobie bardziej siê przyda.

	/*********************

Ork nagroda rudy zale¿y od cord_price sam ustal co na jakim poziomie byæ powinno, ale za przekonanie orkana i reszty do dobicia do NO daj dodatkowo coœ porz¹dnego - recepta, etc.

************************/

	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_07"); //Powiem Lee, co z Ciebie za zió³ko.
	AI_Output (other, self, "DIA_Cord_ConvoyConvoyTrapEnd_15_08"); //Tylko nie mów tego zbyt g³oœno, s³awa mnie zabija.
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_09"); //Nie ma sprawy. Do zobaczenia w obozie.
	AI_TurnToNpc(self, ork);
	AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_10"); //Ruszamy!

	if (NPC_HasItems(hero,weaponpackage)>=1)
	{
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_11"); //Aha i oddaj paczki z broni¹!
		AI_Output (self, other, "DIA_Cord_ConvoyConvoyTrapEnd_14_12"); //Skoro nalegasz...
		B_GiveInvItems (other,self,weaponpackage,NPC_HasItems(hero,weaponpackage));
		Npc_RemoveInvItems(self,weaponpackage,NPC_HasItems(self,weaponpackage));
	};
	
	Npc_RemoveInvItems(ork, weaponpackage, NPC_HasItems(ork, weaponpackage));
	Npc_RemoveInvItems(kirgo, weaponpackage, NPC_HasItems(kirgo, weaponpackage));
	Npc_RemoveInvItems(asghan, weaponpackage, NPC_HasItems(asghan, weaponpackage));
   
	AI_TurnToNpc(self, ork);
	AI_TurnToNpc(ork, hero);
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Convoys, "Sprawa z konwojami zakoñczona. Uda³o mi siê namówiæ kilku stra¿ników do zmiany strony barykady. Oby w Nowym Obozie wytrzymali d³u¿ej ni¿ w Starym.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"NC1");
	
	B_EndTrapChangeRoutine();
};

//************************************************************

instance DIA_Cord_ConvoyTrapEnd1 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_ConvoyTrapEnd1_Condition;
	information		= DIA_Cord_ConvoyTrapEnd1_Info;
	important		= 1;
	permanent		= 0;
	description		= "."; 
};

FUNC int DIA_Cord_ConvoyTrapEnd1_Condition()
{	
	var C_NPC ork; ork = Hlp_GetNpc(Grd_4106_Orkan);
	var C_NPC kir; kir = Hlp_GetNpc(Grd_251_Kirgo);
	var C_NPC ash; ash = Hlp_GetNpc(Grd_263_Asghan);

	if (merc_trap == 3)&&(Npc_GetDistToNpc(self,hero) < 1500)
	&&(Npc_IsDead(ork))&&(Npc_IsDead(kir))&&(Npc_IsDead(ash))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_ConvoyTrapEnd1_Info()
{
	B_FullStop (hero);

	/*********************
Dodaj tej najemników którzy przyszli z Cordem

***********************/

	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_01"); //Ju¿ po wszystkim.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_02"); //Szkoda, ¿e musia³o dojœæ do krwawego fina³u. Zawsze szanowa³em Orkana i Kirgo.
	AI_Output (other, self, "DIA_Cord_ConvoyTrapEnd1_15_04"); //Zdaje siê, ¿e solidnie zapracowa³em na nagrodê.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_05"); //Zaiste, opowieœci o tobie piracie nie by³y przesadzone.
	cord_price = cord_price + 1;
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_06"); //Twoja nagroda, zas³u¿y³eœ na ni¹.

	/*********************

Ork nagroda w rudzie zale¿y od cord_price sam ustal co na jakim poziomie byæ powinno, po zabiciu stra¿ników daj te¿ coœ dodatkowego - recepta, etc. ale gorszego ni¿ przy do³¹czaniu do NO.

************************/

	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_07"); //Wracam do Lee, zdam mu raport z postêpów.
	AI_Output (other, self, "DIA_Cord_ConvoyTrapEnd1_15_08"); //W porz¹dku, bywaj.
	AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_09"); //Do zobaczenia w obozie.
	

	if (NPC_HasItems(hero,weaponpackage)>=1)
	{
		AI_TurnToNpc(self, other);
		AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_11"); //Aha i oddaj paczki z broni¹!
		AI_Output (self, other, "DIA_Cord_ConvoyTrapEnd1_14_12"); //Skoro nalegasz...
		B_GiveInvItems (other,self,weaponpackage,NPC_HasItems(hero,weaponpackage));
		Npc_RemoveInvItems(self,weaponpackage,NPC_HasItems(self,weaponpackage));
	};
   
	Log_SetTopicStatus	(CH5_NC_Convoys,	LOG_SUCCESS);
	B_LogEntry		(CH5_NC_Convoys, "Sprawa z konwojami zakoñczona. Stra¿nicy nie ¿yj¹, Cord ma swoj¹ broñ, wszyscy s¹ zadowoleni - no mo¿e prócz stra¿ników.");
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"NC1");
	
	B_EndTrapChangeRoutine();
};

//************************************************************

instance DIA_Cord_AllEnd (C_INFO)
{

	npc				= SLD_709_Cord;
	condition		= DIA_Cord_AllEnd_Condition;
	information		= DIA_Cord_AllEnd_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co s³ychaæ?"; 
};

FUNC int DIA_Cord_AllEnd_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Cord_ConvoyConvoyTrapEnd))||(Npc_KnowsInfo(hero,DIA_Cord_ConvoyTrapEnd1))
	{
		return 1;
	};
};

FUNC void  DIA_Cord_AllEnd_Info()
{
	AI_Output (other, self, "DIA_Cord_AllEnd_15_01"); //Co s³ychaæ?
	AI_Output (self, other, "DIA_Cord_AllEnd_14_02"); //Jakoœ sobie radzimy.
	AI_Output (self, other, "DIA_Cord_AllEnd_14_03"); //Jeszcze raz dziêki za pomoc z konwojami.
	AI_Output (other, self, "DIA_Cord_AllEnd_15_04"); //By³o, minê³o. Nie daj siê zabiæ, Cord.
	AI_Output (self, other, "DIA_Cord_AllEnd_14_05"); //Ty te¿, piracie. Ty te¿...
};

/****************************


Wyjaœniæ sprawê zaginionych konwoji, dlaczego magnaci wysy³ali z³om, etc.

*******************************/

INSTANCE DIA_Cord_CanYouTeachMe (C_INFO)
{
	npc				= SLD_709_Cord;
	//nr				= 71;
	condition		= DIA_Cord_CanYouTeachMe_Condition;
	information		= DIA_Cord_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_ConvoysPeopleDone4))
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe_12_02"); //Fechtunek to moje ¿ycie, a broñ jednorêczna to moja kochanka.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe_12_03"); //Poka¿ê Ci jak zostaæ mistrzem miecza.	
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord nauczy mnie po mistrzowsku w³adaæ broni¹ jednorêczn¹.");
};

INSTANCE DIA_Cord_CanYouTeachMe1 (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= DIA_Cord_CanYouTeachMe1_Condition;
	information		= DIA_Cord_CanYouTeachMe1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Umiesz walczyæ dwoma ostrzami?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_ConvoysPeopleDone4))
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe1_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe1_15_01"); //Umiesz walczyæ dwoma ostrzami?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_02"); //Oczywiœcie, ale to nie lada sztuka.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_03"); //Przede wszystkim musisz mistrzowsko w³adaæ broni¹ jednorêczn¹.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_04"); //Musisz te¿ poznaæ tajniki walki broni¹ dwurêczn¹.
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe1_12_05"); //Wróæ do mnie, jak zg³êbisz tê wiedzê.	
	
	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord mo¿e mnie nauczyæ walki dwoma ostrzami. Muszê wczeœniej zostaæ mistrzem w³adania mieczem jednorêcznym i poznaæ podstawy walki broni¹ dwurêczn¹.");
};

INSTANCE DIA_Cord_CanYouTeachMe11 (C_INFO)
{
	npc				= SLD_709_Cord;
	//nr				= 71;
	condition		= DIA_Cord_CanYouTeachMe11_Condition;
	information		= DIA_Cord_CanYouTeachMe11_Info;
	permanent		= 0;
	important		= 0;
	description		= "Nauczysz mnie walczyæ dwoma ostrzami?"; 
};

FUNC INT DIA_Cord_CanYouTeachMe11_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Cord_CanYouTeachMe1)) && (Npc_GetTalentValue(other, NPC_TALENT_1H)>=60) && (Npc_GetTalentValue(other, NPC_TALENT_2H)>=60)
	{
		return 1;
	};
};

FUNC VOID DIA_Cord_CanYouTeachMe11_Info()
{
	AI_Output (other, self, "DIA_Cord_CanYouTeachMe11_15_01"); //Nauczysz mnie walczyæ dwoma ostrzami?
	AI_Output (self, other, "DIA_Cord_CanYouTeachMe11_12_02"); //Pewnie, oto tajniki w³adania t¹ broni¹.

	Log_CreateTopic(GE_TeacherNC, LOG_NOTE);
	B_LogEntry(GE_TeacherNC, "Cord nauczy mnie w³adaæ dwoma ostrzami.");
};