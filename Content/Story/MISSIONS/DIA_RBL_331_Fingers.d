var int MOB_REPAIR_1;
var int MOB_REPAIR_2;
var int MOB_REPAIR_3;
var int MOB_REPAIR_4;
var int MOB_REPAIR_5;
const float time_repair_Fingers_Fence = 6;

//TODO: Sher, moglbys poprawic:	(wpis pojawiajacy sie po naprawieniu wszystkich czesci plota
const string Fingers_FenceOK = "'Palisada' R¹czki powinna teraz wytrzymaæ atak wœciek³ego dzika.";
const string Fingers_PartOK = "To przês³o wygl¹da ju¿ ca³kiem nieŸle.";
//Sprawdzenie czy wsztystkie czesci plota sa juz naprawione:
// uzywane w dialogi i przy interakcji z mobami desek
func int MIS_FINGER_REPAIRDONE()
{
	if(MOB_REPAIR_1)&&(MOB_REPAIR_2)&&(MOB_REPAIR_3)&&(MOB_REPAIR_5)
	{
      return true;
   };

   return false;
};

func void Repair_Fingers_Fence(var float time) //dodane przez Adanosa 2012-03-07
{
   AI_Wait(hero, time);

	PutMsg(Fingers_PartOK, "font_default.tga", RGBAToZColor(255,255,255,255), 8*2, "");
	AI_UseMob(self, "REPAIR", -1);

	if(MIS_FINGER_REPAIRDONE())
	{
		B_LogEntry(CH1_Rbl_Fingers, Fingers_FenceOK);
	};
};

func void MIS_FINGER_WOOD_1_S1()
{
	if(!MOB_REPAIR_1)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_1=TRUE;
	};
};
func void MIS_FINGER_WOOD_2_S1()
{
	if(!MOB_REPAIR_2)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_2=TRUE;
	};
};
func void MIS_FINGER_WOOD_3_S1()
{
	if(!MOB_REPAIR_3)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(time_repair_Fingers_Fence);
		MOB_REPAIR_3=TRUE;
	};
};

//THIS MOB DON'T EXIST NO LONGER
func void MIS_FINGER_WOOD_4_S1()
{
	if(!MOB_REPAIR_4)&&(Npc_IsPlayer(self))
	{
      Repair_Fingers_Fence(8);
		MOB_REPAIR_4=TRUE;
	};
};

func void MIS_FINGER_WOOD_5_S1()
{
	if(!MOB_REPAIR_5)&&(Npc_IsPlayer(self))
	{
		Repair_Fingers_Fence(7);
		MOB_REPAIR_5=TRUE;
	};
};
// **************************************************
// 						 EXIT
// **************************************************

INSTANCE DIA_Fingers_Exit (C_INFO)
{
	npc			= RBL_331_FINGERS;
	nr			= 999;
	condition	= DIA_Fingers_Exit_Condition;
	information	= DIA_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Fingers_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Fingers_Hello (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 1;
	condition		= DIA_Fingers_Hello_Condition;
	information		= DIA_Fingers_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wygl¹dasz na strapionego.";
};

FUNC INT DIA_Fingers_Hello_Condition()
{
	//if(Npc_GetDistToWP(self,"PATH_OR22") < 250)
	if(!FingersCine_Played)
	{
		return true;
	};
};

FUNC VOID DIA_Fingers_Hello_Info()
{
	AI_Output (other, self, "DIA_Fingers_Hello_15_01"); //Wygl¹dasz na strapionego.
	AI_Output (self, other, "DIA_Fingers_Hello_11_02"); //Wszystko przez ten chêdo¿ony p³ot!
	AI_Output (other, self, "DIA_Fingers_Hello_15_03"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Fingers_Hello_11_04"); //Nie mogê zmru¿yæ oka przez ten cholerny p³ot nad moim dachem.
	AI_Output (self, other, "DIA_Fingers_Hello_11_05"); //Jakiœ idiota spartoli³ robotê i dr¹gi w ka¿dej chwili mog¹ mi siê zwaliæ na g³owê.
	AI_Output (self, other, "DIA_Fingers_Hello_11_06"); //Zaraz... Co to by³o...
	AI_Output (self, other, "DIA_Fingers_Hello_11_07"); //S³ysza³eœ?!
	AI_Output (other, self, "DIA_Fingers_Hello_15_08"); //Co?
	AI_Output (self, other, "DIA_Fingers_Hello_11_09"); //Jak to co?! Trzaskaj¹ce ogrodzenie!
	//TODO: Prawdopodobnie rutyna do zrobienia, nawet cinematic
	/*************************
Ork trzeba by to zrobiæ bo to ciulowo wygl¹da. Musi wybiec z chatki R¹czka.
*************************/

	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	Snd_Play("OW_ShipWrekOrBridge_A3");//odg³osy drewna - problem dzwiek odtwarza sie przy rozpoczynaniu funkcji budzis

 	AI_TurnToNpc(fingers,hero);

	//ork chodzi o to, ¿e oni maj¹ odbiec od chatki, odwróciæ siê i spojrzeæ w jej stronê. a da siê zrobiæ, ¿ ejak oni odbiegaj¹ faktycznie jakaœ belka czy deska spadnie z sufitu, czy tam z ogrodzenia na chatê?
};

INSTANCE DIA_Fingers_AfterRun (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 2;
	condition		= DIA_Fingers_AfterRun_Condition;
	information		= DIA_Fingers_AfterRun_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_AfterRun_Condition()
{
	if (FingersCine_Played)
	//&&(Npc_GetDistToWP(self,"RACZKA_SLEEP") > 100)//z³y warunek po cut scenie walenia sie domu raczka nie bedzie blisko wp RACZKA_SLEEP | budzis
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_AfterRun_Info()
{
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_01"); //Niewiele brakowa³o! ¯eby ca³y ten burdel spad³ mi na g³owê!
	//AI_Output (other, self, "DIA_Fingers_AfterRun_15_02"); //Do czego?
	// widzielismy co sie sta³o wiec po co sie pytac ? budzis
	//AI_Output (self, other, "DIA_Fingers_AfterRun_11_03"); //¯eby ca³y ten burdel spad³ mi na g³owê!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_04"); //Mam ju¿ tego doœæ. Wracam do Starego Obozu.
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_05"); //Poczekaj, przecie¿ to tylko zwyk³y, trzeszcz¹cy p³ot.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_06"); //To nie jest zwyk³y p³ot. On czyha na moje ¿ycie... Ten p³ot to... pomiot Beliara!
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_07"); //Czy Ty siê dobrze czujesz?
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_08"); //Wczoraj jedna deska spad³a mi na g³owê... Zaraz o czym to ja mówi³em...
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_09"); //Pos³uchaj. Pomogê Ci.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_10"); //Niby jak? Potrafisz odegnaæ demony ¿yj¹ce w tym p³ocie?
	AI_Output (other, self, "DIA_Fingers_AfterRun_15_11"); //Odprawiê specjalny rytua³ za pomoc¹... m³otka.
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_12"); //Naprawdê? To mo¿e siê udaæ... To musi siê udaæ!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_13"); //S³yszê g³osy... One mówi¹, ¿e m³ot Innosa zwalczy grozê Beliara!
	AI_Output (self, other, "DIA_Fingers_AfterRun_11_14"); //IdŸ i zniszcz z³o czyhaj¹ce na moje ¿ycie!
	
   Log_CreateTopic	(CH1_Rbl_Fingers, LOG_MISSION);
	Log_SetTopicStatus	(CH1_Rbl_Fingers, LOG_RUNNING);
	B_LogEntry		(CH1_Rbl_Fingers, "Nie wszyscy z rebeliantów s¹ zdrowi na umyœle. R¹czka wierzy, ¿e p³ot nad jego chat¹ jest opêtany przez demona i czyha na jego ¿ycie. Obieca³em mu, ¿e wygnam to 'z³o'. Solidny m³otek i kilka dobitych gwoŸdzi powinno za³atwiæ sprawê.");
	B_StopProcessInfos	(self);
	//Npc_ExchangeRoutine	(self, "start");// nie tak szybko ? budzis
};

INSTANCE DIA_Fingers_Finish (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 3;
	condition		= DIA_Fingers_Finish_Condition;
	information		= DIA_Fingers_Finish_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_Finish_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_AfterRun))&& (MIS_FINGER_REPAIRDONE())
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Finish_Info()
{
	B_GiveXP(200);
   
	AI_Output (self, other, "DIA_Fingers_Finish_11_01"); //Wróci³eœ! S³yszê, ¿e duchy ju¿ nie zawodz¹ nad moj¹ g³ow¹!
	AI_Output (other, self, "DIA_Fingers_Finish_15_02"); //Tak, naprawi³em p³ot... Znaczy odprawi³em rytua³ odegnania demonów z ogrodzenia.
	AI_Output (self, other, "DIA_Fingers_Finish_11_03"); //Moja g³owa... Czujê spokój i ukojenie...
	AI_Output (self, other, "DIA_Fingers_Finish_11_04"); //Aaa...
	
   B_FullStop (self);
	AI_PlayAni		(self,	"T_HEADACHE");
	PrintScreen	("Coœ siê sta³o z g³ow¹ R¹czki.", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Fingers_FinishEnd (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 4;
	condition		= DIA_Fingers_FinishEnd_Condition;
	information		= DIA_Fingers_FinishEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_FinishEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Finish))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_FinishEnd_Info()
{
	fingers_trust = TRUE;
	rebel_camp_trust = rebel_camp_trust + 1;
	
   AI_Output (self, other, "DIA_Fingers_FinishEnd_11_01"); //Moja g³owa... Kim Ty jesteœ?
	AI_Output (other, self, "DIA_Fingers_FinishEnd_15_02"); //Jestem Rick. Naprawi³em p³ot nad Twoj¹ chat¹.
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_03"); //Jaki p³ot? O czym Ty bredzisz?
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_04"); //Kolejny idiota szukaj¹cy pretekstu, ¿eby dostaæ w mordê.
	AI_Output (self, other, "DIA_Fingers_FinishEnd_11_05"); //ZejdŸ mi z oczu, ³achmyto!
	
   Log_SetTopicStatus(CH1_Rbl_Fingers, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Fingers, "R¹czka chyba wróci³ do normy. Niestety nie pamiêta, ¿e naprawi³em mu p³ot. Z drugiej strony wszystkie te prze¿ycia sprawi³y, ¿e odzyska³ rozum i Cavalorn powinien wzi¹æ to pod uwagê.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "start");//zmiana na normalna rutyne budzis
};

// **************************************************

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 0;
	description		= "Czego mo¿esz mnie nauczyæ?";
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_FinishEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
   AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
   AI_Output (self, other,"DIA_Fingers_Lehrer_05_03"); //No dobrze, mogê ciê zapoznaæ z tajnikami tej sztuki...

   Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
   B_LogEntry(GE_TeacherOR, "R¹czka mo¿e mnie nauczyæ okradania innych.");
};

INSTANCE DIA_Fingers_Stew (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 12;
	condition		= DIA_Fingers_Stew_Condition;
	information		= DIA_Fingers_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla ciebie potrawkê.";
};

FUNC INT DIA_Fingers_Stew_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Stew_Info()
{
	fox_stew = fox_stew + 1;
	
   AI_Output (other, self, "DIA_Fingers_Stew_15_01"); //Mam dla ciebie potrawkê.
	AI_Output (self, other, "DIA_Fingers_Stew_11_02"); //Daj to paskudztwo. Mo¿e tym razem w³osy mi nie powypadaj¹ od tej breji...
	
   B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "R¹czka marudzi³ coœ o wypadaniu w³osów, ale te¿ zjad³.");
};

INSTANCE DIA_FINGERS_Spy (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 13;
	condition		= DIA_FINGERS_Spy_Condition;
	information		= DIA_FINGERS_Spy_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jesteœ tu jedynym z³odziejem?";
};

FUNC INT DIA_FINGERS_Spy_Condition()
{
	if (spy_ok == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_FINGERS_Spy_Info()
{
	spy_count = spy_count + 1;
	
   AI_Output (other, self, "DIA_FINGERS_Spy_15_01"); //Jesteœ tu jedynym z³odziejem?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_02"); //Jedynym z³odziejem w Kolonii Karnej?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_03"); //Nie s¹dzê. Ale na pewno jestem jednym z najlepszych w tym fachu.
	AI_Output (other, self, "DIA_FINGERS_Spy_15_04"); //Wczeœniej nale¿a³eœ do Starego Obozu?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_05"); //Tak jak i wiêkszoœæ z rebeliantów: Cavalorn, Fisk, Œwistak i pozostali.
	AI_Output (self, other, "DIA_FINGERS_Spy_07_06"); //Do czego zmierzasz?
	AI_Output (other, self, "DIA_FINGERS_Spy_15_07"); //Zastanawia³em siê co z³odziej mo¿e robiæ w Obozie Rebeliantów?
	AI_Output (self, other, "DIA_FINGERS_Spy_07_08"); //Powiedzmy, ¿e manifestujê zdrowy rozs¹dek. A teraz idŸ zrobiæ coœ po¿ytecznego.
	
   B_LogEntry		(CH2_Rbl_Spy, "R¹czka jest z³odziejem, podobno jednym z najlepszych. Nale¿a³ te¿ do Starego Obozu. Nie wiem czy mo¿na mu zaufaæ...");

	if (spy_count == 12)
	{
		spy_count = spy_count + 1;
		AI_Output (self, other, "DIA_Spy_11_20"); //IdŸ porozmawiaæ z Cavalornem, zdaje siê, ¿e coœ od ciebie chcia³.
		B_LogEntry		(CH2_Rbl_Spy, "Powinienem porozmawiaæ z Cavalornem, podobno mnie szuka³.");
	};

	B_StopProcessInfos	(self);
};

INSTANCE DIA_FINGERS_Spy1 (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 14;
	condition		= DIA_FINGERS_Spy1_Condition;
	information		= DIA_FINGERS_Spy1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ró¿ne rzeczy s³yszy siê na Twój temat.";
};

FUNC INT DIA_FINGERS_Spy1_Condition()
{
	if (spy_count == 14)
	{
		return 1;
	};
};

FUNC VOID DIA_FINGERS_Spy1_Info()
{
   AI_Output (other, self, "DIA_FINGERS_Spy1_15_01"); //Ró¿ne rzeczy s³yszy siê na Twój temat.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_02"); //Ju¿ siê do tego przyzwyczai³em. A co o mnie mówi¹?
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_03"); //Jedni dziwi¹ siê, ¿e odszed³eœ ze Starego Obozu. Inni nie wierz¹ w powody, dla których opuœci³eœ Gomeza.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_04"); //Mo¿e wszyscy maj¹ racjê.
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_05"); //Co przez to rozumiesz?
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_06"); //Niech bêdzie, powiem Ci prawdê. Przynajmniej skoñcz¹ siê te idiotyczne plotki na mój temat.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_07"); //Rzeczywiœcie nie odszed³em ze Starego Obozu ze strachu przed Gomezem, czy dlatego, ¿e popar³em tego skazañca.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_08"); //Powód by³ inny, ale uwa¿a³em, ¿e nikogo to nie powinno obchodziæ.
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_09"); //Jestem z³odziejem, ukrad³em coœ czego nie powinno wynosiæ siê poza Obóz i wola³em nie ryzykowaæ, ¿e stra¿nicy znajd¹ przy mnie to coœ.
	AI_Output (other, self, "DIA_FINGERS_Spy1_15_10"); //Móg³byœ jaœniej?
	AI_Output (self, other, "DIA_FINGERS_Spy1_07_11"); //Nie móg³bym, a teraz zje¿d¿aj.

   B_LogEntry		(CH2_Rbl_Spy, "R¹czka przyzna³ siê, ¿e ukrad³ z Obozu 'coœ' i ba³ siê, ¿e stra¿nicy mog¹ go z tym 'czymœ' nakryæ. Brzmi jeszcze bardziej absurdalnie ni¿ pozosta³e historie. Mo¿e powinienem z niego wydusiæ co to za 'coœ'?");
	B_StopProcessInfos	(self);
};

INSTANCE DIA_Fingers_Fight (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 15;
	condition		= DIA_Fingers_Fight_Condition;
	information		= DIA_Fingers_Fight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jeszcze z Tob¹ nie skoñczy³em!";
};

FUNC INT DIA_Fingers_Fight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FINGERS_Spy1))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Fight_Info()
{
	AI_Output (other, self, "DIA_Fingers_Fight_15_01"); //Jeszcze z Tob¹ nie skoñczy³em!
	AI_Output (self, other, "DIA_Fingers_Fight_11_02"); //Ale ja tak. Sam siê o to prosi³eœ!
	
   B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,false);
};

INSTANCE DIA_Fingers_AfterFight (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 17;
	condition		= DIA_Fingers_AfterFight_Condition;
	information		= DIA_Fingers_AfterFight_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_AfterFight_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Fight))&&(Npc_HasItems(hero, ItKe_Gomez_01) >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_AfterFight_Info()
{
	tony_spy = tony_spy + 1;
	
   AI_Output (self, other, "DIA_Fingers_AfterFight_11_01"); //Ty cholerny z³odzieju!
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_02"); //I kto to mówi...
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_03"); //Teraz jesteœ zadowolony?! To w³aœnie ten klucz ukrad³em z zamku.
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_04"); //Klucz Gomeza... Ty naprawdê jesteœ dobry R¹czka.
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_05"); //Jestem najlepszy!
	AI_Output (other, self, "DIA_Fingers_AfterFight_15_06"); //Je¿eli pozwolisz, zatrzymam ten klucz.
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_07"); //Ud³aw siê nim! Mam nadziejê, ¿e Gomez przy³apie Ciê na grzebaniu w skrzyniach i upierdoli Ci r¹czki przy samej dupie!
	AI_Output (self, other, "DIA_Fingers_AfterFight_11_08"); //ZejdŸ mi z oczu... z³odzieju!
	
   B_LogEntry		(CH2_Rbl_Spy, "No proszê R¹czka ukrad³ Gomezowi klucz do jego prywatnych skrzyñ, niez³a robota. Mogê R¹czkê spokojnie skreœliæ z listy podejrzanych.");

	if (tony_spy == 12)
	{
		tony_spy = tony_spy + 1;
		AI_Output (self, other, "DIA_Spy1_11_20"); //Aha. Cavalorn o Ciebie pyta³, nie daj mu czekaæ.
		B_LogEntry		(CH2_Rbl_Spy, "Cavalorn o mnie pyta³, powinienem siê z nim zobaczyæ.");
	};

	B_StopProcessInfos	(self);
};

//*******************************

INSTANCE DIA_Fingers_NewSword (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 18;
	condition		= DIA_Fingers_NewSword_Condition;
	information		= DIA_Fingers_NewSword_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_NewSword_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fox_WeaponDev))&&(NPC_HasItems(other,HUN_MW_03)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_NewSword_Info()
{
	B_GiveXP(100);
   
	AI_Output (self, other, "DIA_Fingers_NewSword_11_01"); //A niech to, w³aœnie z³ama³em miecz! Chcia³em go naostrzyæ, a to dziadostwo pêk³o.
	AI_Output (other, self, "DIA_Fingers_NewSword_15_02"); //Widzê, ¿e Fox dobrze wybra³. To twój nowy miecz.
	AI_Output (self, other, "DIA_Fingers_NewSword_11_03"); //Cholera nie po to z³ama³em miecz, ¿eby dostaæ nowy!
	AI_Output (other, self, "DIA_Fingers_NewSword_15_04"); //Nie rozumiem...
	AI_Output (self, other, "DIA_Fingers_NewSword_11_05"); //Z³ama³em to zardzewia³e ostrze, ¿eby mieæ dobr¹ wymówkê kiedy przyjd¹ stra¿nicy. Przez Ciebie nie wywinê siê od walki!
	AI_Output (other, self, "DIA_Fingers_NewSword_15_06"); //Zawsze mo¿esz na mnie liczyæ.
	AI_Output (self, other, "DIA_Fingers_NewSword_11_07"); //Bardzo œmieszne. ZejdŸ mi z oczu!
	
   B_GiveInvItems (other, self, HUN_MW_03, 1);
	B_LogEntry		(CH3_RBL_DelivWeapon, "R¹czka niezbyt siê ucieszy³ z nowego ostrza.");
	B_StopProcessInfos	(self);
};

/**********************

SIDE QUEST

***********************/

//*******************************

INSTANCE DIA_Fingers_Kuva (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 20;
	condition		= DIA_Fingers_Kuva_Condition;
	information		= DIA_Fingers_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno wykupi³eœ d³ug Kuvy.";
};

FUNC INT DIA_Fingers_Kuva_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Whistler_Kuva))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Kuva_Info()
{
	AI_Output (other, self, "DIA_Fingers_Kuva_15_01"); //Podobno wykupi³eœ d³ug Kuvy.
	AI_Output (self, other, "DIA_Fingers_Kuva_11_02"); //Podobno nic nie jest za darmo.
	AI_Output (other, self, "DIA_Fingers_Kuva_15_03"); //Ile?
	AI_Output (self, other, "DIA_Fingers_Kuva_11_04"); //50 bry³ek.
	
   B_LogEntry		(CH1_RBL_Cage, "R¹czka powie mi dlaczego wykupi³ d³ug Kuvy je¿eli zap³acê mu 50 bry³ek.");
};

//*******************************
INSTANCE DIA_Fingers_KuvaOk (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 21;
	condition		= DIA_Fingers_KuvaOk_Condition;
	information		= DIA_Fingers_KuvaOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam rudê, mów.";
};

FUNC INT DIA_Fingers_KuvaOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Kuva))&&(NPC_HasItems(other,ItMiNugget)>=50)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_KuvaOk_Info()
{
	AI_Output (other, self, "DIA_Fingers_KuvaOk_15_01"); //Mam rudê, mów.
	
   B_GiveInvItems (other, self, ItMiNugget, 50);
	
   AI_Output (self, other, "DIA_Fingers_KuvaOk_11_02"); //Z r¹czki do r¹czki, œlicznie.
	AI_Output (self, other, "DIA_Fingers_KuvaOk_11_03"); //Bry³ki na wykup d³ugu da³ mi Tony.
	AI_Output (other, self, "DIA_Fingers_KuvaOk_15_04"); //Nie wiesz dlaczego?
	AI_Output (self, other, "DIA_Fingers_KuvaOk_11_05"); //A co mnie to obchodzi? Ruda to ruda, reszta to nie moja sprawa.
	
   B_LogEntry		(CH1_RBL_Cage, "R¹czka twierdzi, ¿e rudê na wykup d³ugu dosta³ od Toniego. Ciekawe...");
};

//*******************************

INSTANCE DIA_Fingers_Martin (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 22;
	condition		= DIA_Fingers_Martin_Condition;
	information		= DIA_Fingers_Martin_Info;
	permanent		= 0;
	important		= 0;
	description		= "Podobno Martin 'zgubi³' pierœcionek.";
};

FUNC INT DIA_Fingers_Martin_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_FISK_MartinRing))&&(Help_Martin)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Martin_Info()
{
	AI_Output (other, self, "DIA_Fingers_Martin_15_01"); //Podobno Martin 'zgubi³' pierœcionek.
	AI_Output (self, other, "DIA_Fingers_Martin_11_02"); //Musia³ byæ nieuwa¿ny. To siê zdarza.
	AI_Output (other, self, "DIA_Fingers_Martin_15_03"); //A Ty go przypadkiem nie znalaz³eœ?
	AI_Output (self, other, "DIA_Fingers_Martin_11_04"); //Nie wiem o czym mówisz. Spadaj.
	
   B_LogEntry		(CH2_RBL_Feelings, "Oczywiœcie od R¹czki nic siê nie dowiedzia³em. Powinienem popytaæ w obozie.");
};

//*******************************

INSTANCE DIA_Fingers_WhereRingDigged (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 22;
	condition		= DIA_Fingers_WhereRingDigged_Condition;
	information		= DIA_Fingers_WhereRingDigged_Info;
	permanent		= 0;
	important		= 0;
	description		= "Gdzie zakopa³eœ pierœcieñ?!";
};

FUNC INT DIA_Fingers_WhereRingDigged_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Martin))&&(fingers_proofs == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereRingDigged_Info()
{
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_01"); //Gdzie zakopa³eœ pierœcieñ?!
	AI_Output (self, other, "DIA_Fingers_WhereRingDigged_11_02"); //Sk¹d... Nie wiem o czym mówisz!
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_03"); //To ciekawe, bo Quentin widzia³ Ciê jak z kilofem i pierœcieniem wychodzisz z obozu.
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_04"); //Abel powiedzia³ mi, ¿e œledzi³eœ Martina, a Snaf by³ œwiadkiem kradzie¿y pierœcienia.
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_05"); //Mów, gdzie go zakopa³eœ!
	AI_Output (self, other, "DIA_Fingers_WhereRingDigged_11_06"); //Nigdy go nie znajdziesz! To moje skarby! Moje!
	AI_Output (other, self, "DIA_Fingers_WhereRingDigged_15_07"); //To siê jeszcze oka¿e.
	
   B_LogEntry		(CH2_RBL_Feelings, "R¹czka przyzna³ siê do kradzie¿y, nie zdradzi³ jednak miejsca ukrycia pierœcienia. Muszê rozejrzeæ siê po Kolonii, mo¿e bêdê mia³ szczêœcie i znajdê jego ³upy.");
	B_StopProcessInfos	(self);
};

/*****************************
Ork skrytka niech bêdzie w jaskini tam gdzie nek le¿a³. Oczywiœcie skarby mo¿na odkopaæ tylko kilofem.
A tu lista itemów:
ItMi_Martin_Ring - pierœcieñ Martina [questowy]
trochê rudy,
kilka pierœcieni i amulatów, mo¿e jakiœ puchar, skrzynka z klejnotami
jakiœ nienajgorszy przepis

Mo¿na kopaæ od pocz¹tku gry, pierœcieñ bêdzie mo¿na oddaæ i tak po zrobieniu zadania, bo sk¹d gracz ma wiedzieæ do kogo ten ring nale¿y ;)

********************************/

/***************************
****************************/

INSTANCE DIA_Fingers_Task (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 333;
	condition		= DIA_Fingers_Task_Condition;
	information		= DIA_Fingers_Task_Info;
	permanent		= 0;
	important		= 1;
	description		= "";
};

FUNC INT DIA_Fingers_Task_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_AfterFight) && Npc_KnowsInfo (hero, DIA_Cavalorn_SpyEnd))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Task_Info()
{
	AI_Output (self, other, "DIA_Fingers_Task_11_01"); //Zaczekaj cwaniaczku!
	AI_Output (other, self, "DIA_Fingers_Task_15_02"); //Masz jakiœ problem?
	AI_Output (self, other, "DIA_Fingers_Task_11_03"); //Nie taki jak myœlisz. Nie chodzi o Ciebie.
	AI_Output (self, other, "DIA_Fingers_Task_11_04"); //Chcia³bym coœ odzyskaæ, ale to wymagaæ bêdzie zrêcznoœci i sprytu. Co Ty na to?
};

//*************************************

INSTANCE DIA_Fingers_TaskOk (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 334;
	condition		= DIA_Fingers_TaskOk_Condition;
	information		= DIA_Fingers_TaskOk_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mów o co chodzi.";
};

FUNC INT DIA_Fingers_TaskOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_Task))
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_TaskOk_Info()
{
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_01"); //Mów o co chodzi.
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_02"); //Jednak masz jaja. To œwietnie.
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_03"); //Musia³em doœæ szybko opuœciæ Stary Obóz. Zostawi³em w skrzyni coœ na czym bardzo mi zale¿y. Chcê to odzyskaæ.
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_04"); //Co to za przedmiot?
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_05"); //Zorientujesz siê, jak go znajdziesz.
	AI_Output (other, self, "DIA_Fingers_TaskOk_15_06"); //Gdzie znajdê twoj¹ chatê?
	AI_Output (self, other, "DIA_Fingers_TaskOk_11_07"); //W Starym Obozie, na lewo od wejœcia do zamku. Powodzenia z³odzieju.

	Mob_CreateItems ("OC_CHEST_FINGERS", Fingers_Lockpick, 1);

	Log_CreateTopic	(CH3_Rbl_Suveinr, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Rbl_Suveinr, LOG_RUNNING);
	B_LogEntry		(CH3_Rbl_Suveinr, "R¹czka da³ mi dziwne zlecenie. Mam odzyskaæ z jego chaty w Starym Obozie jakiœ przedmiot, który do niego nale¿a³. Tylko co to niby ma byæ?");
};

//*************************************

INSTANCE DIA_Fingers_TaskOk1 (C_INFO)
{
	npc				= RBL_331_FINGERS;
	nr				= 335;
	condition		= DIA_Fingers_TaskOk1_Condition;
	information		= DIA_Fingers_TaskOk1_Info;
	permanent		= 0;
	important		= 0;
	description		= "To ten wytrych zostawi³eœ w obozie?";
};

FUNC INT DIA_Fingers_TaskOk1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Fingers_TaskOk))&&(NPC_HasItems(other, Fingers_Lockpick)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_TaskOk1_Info()
{
	AI_Output (other, self, "DIA_Fingers_TaskOk1_15_01"); //To ten wytrych zostawi³eœ w obozie?
	AI_Output (self, other, "DIA_Fingers_TaskOk1_11_02"); //Tak! Daj mi go!
	
   B_GiveInvItems (other, self, Fingers_Lockpick, 1);
	
   AI_Output (other, self, "DIA_Fingers_TaskOk1_15_03"); //Brak podziêkowania jakoœ prze¿yjê, ale wyrazami uznania w formie rudy nie pogardzê.
	AI_Output (self, other, "DIA_Fingers_TaskOk1_11_04"); //WeŸ te bry³ki i zje¿d¿aj.
	
   CreateInvItems (self, ItMiNugget,100);
	B_GiveInvItems (self, other, ItMiNugget, 100);
	
   AI_Output (other, self, "DIA_Fingers_TaskOk1_15_05"); //Ach ta ludzka wdziêcznoœæ...
	
   Log_SetTopicStatus	(CH3_Rbl_Suveinr, LOG_SUCCESS);
	B_LogEntry		(CH3_Rbl_Suveinr, "R¹czka odzyska³ swój suwenir - okaza³ siê nim solidny wytrych.");
};
