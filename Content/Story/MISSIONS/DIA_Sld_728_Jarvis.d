// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa¿aj na siebie!
	B_StopProcessInfos	(self);
};

// ************************************************************
// 						Hello
// ************************************************************

INSTANCE DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= 0;
	important 	= 1;
	description		= "."; 
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Hello_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc 	(self, other);
	
   AI_Output (self, other,"DIA_Jarvis_Hello_08_00"); //Hej, Ty!
	AI_Output (other, self,"DIA_Jarvis_Hello_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_02"); //Zbli¿ siê...
	AI_GotoNpc(other,self);
	AI_Output (self, other,"DIA_Jarvis_Hello_08_03"); //Cholera pomyli³em Ciê z kimœ innym.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_04"); //I co z tym zrobimy?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_05"); //Niech to szlag, myœla³em, ¿e jesteœ skazañcem, który tyle namiesza³ w Kolonii.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_06"); //To dziwne, ale w sumie nikt nie wie, jak on siê nazywa...
	AI_Output (other, self,"DIA_Jarvis_Hello_15_07"); //Rzeczywiœcie to fascynuj¹ce, ale nie mam czasu na takie pierdo³y.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_08"); //Wybacz jestem trochê nerwowy, odk¹d stra¿nicy wbili nam nó¿ w plecy.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_09"); //O czym Ty mówisz?
	AI_Output (self, other,"DIA_Jarvis_Hello_08_10"); //O tych skurwielach w czerwonych zbrojach, którzy zajêli Nowy Obóz.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_11"); //By³em najemnikiem na us³ugach magów wody. Walczyliœmy do koñca... Ale to stare dzieje.
	AI_Output (self, other,"DIA_Jarvis_Hello_08_12"); //Pos³uchaj, potrzebujê czyjejœ pomocy. Tylko Ty mnie tu znalaz³eœ, wiêc nie mam wyboru.
	AI_Output (other, self,"DIA_Jarvis_Hello_15_13"); //A dlaczego mia³bym Ci pomóc? Trochê siê spieszê...
	AI_Output (self, other,"DIA_Jarvis_Hello_08_14"); //Zaczekaj! Nie po¿a³ujesz. Dostaniesz tyle rudy, ile zdo³asz udŸwign¹æ, je¿eli zaniesiesz komuœ moj¹ wiadomoœæ.
};

// ************************************************************

INSTANCE DIA_Jarvis_Help (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Help_Condition;
	information	= DIA_Jarvis_Help_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Dobra, mów o co chodzi."; 
};                       

FUNC INT DIA_Jarvis_Help_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Help_15_01"); //Dobra, mów o co chodzi.
	AI_Output (self, other,"DIA_Jarvis_Help_08_02"); //Ruda znêci ka¿dego, he, he.
	AI_Output (self, other,"DIA_Jarvis_Help_08_03"); //Zadanie jest proste.
	AI_Output (self, other,"DIA_Jarvis_Help_08_04"); //Musisz odnaleŸæ Corda. Powiesz mu tylko, ¿e znalaz³em zgubê i czekam na resztê.
	AI_Output (self, other,"DIA_Jarvis_Help_08_05"); //Zapamiêtasz?
	AI_Output (other, self,"DIA_Jarvis_Help_08_06"); //Czy ja wygl¹dam na idiotê?
	AI_Output (self, other,"DIA_Jarvis_Help_08_07"); //Ekhm, no có¿...
	
   AI_DrawWeapon (hero);
	
   AI_Output (self, other,"DIA_Jarvis_Help_08_08"); //Pewnie, ¿e nie!
	
   AI_RemoveWeapon (hero);
	
   AI_Output (other, self,"DIA_Jarvis_Help_15_09"); //Gdzie znajdê tego Corda?
	AI_Output (self, other,"DIA_Jarvis_Help_08_10"); //To jest w³aœnie najtrudniejsza czêœæ zadania. Nie wiem dok³adnie, gdzie siê zaszy³.
	AI_Output (self, other,"DIA_Jarvis_Help_08_11"); //Ostatni raz spotka³em go w okolicach obozu sekciarzy na bagnach. Byæ mo¿e zaszyli siê w ruinach cytadeli.
	AI_Output (self, other,"DIA_Jarvis_Help_08_12"); //Tam poszukaj. Zapamiêtaj...
	AI_Output (other, self,"DIA_Jarvis_Help_15_13"); //Tak, wiem 'Znalaz³eœ zgubê i czekasz na resztê'.
	AI_Output (self, other,"DIA_Jarvis_Help_08_14"); //Powodzenia i postaraj siê nie zwlekaæ zbyt d³ugo.
	
   Log_CreateTopic	(CH3_NON_Mercenary, LOG_MISSION);
	Log_SetTopicStatus	(CH3_NON_Mercenary, LOG_RUNNING);
	B_LogEntry		(CH3_NON_Mercenary, "Spotka³em najemnika imieniem Jarvis. Prosi³ mnie abym odnalaz³ innego najemnika imieniem Cord i przekaza³ mu te s³owa, ¿e 'Znalaz³ zgubê i czeka na resztê'. Trochê dziwna ta sytuacja, ale co mi szkodzi, tym bardziej, ¿e zap³at¹ ma byæ ruda. Cord móg³ zaszyæ siê w jakiejœ cytadeli niedaleko obozu sekciarzy na bagnach.");
	B_StopProcessInfos	(self);	

	/************************
	Zmiana rutyny, ¿eby Dick troszkê siê pomêczy³ jak znowu bêdzie go szuka³. Najlepiej niech to bêdzie jakieœ skryte miejsce bo Jarvis bêdzie ranny, tam siê w³asnie ukrywa
	************************/
	Npc_ExchangeRoutine(self,"HIDE");
};

//ukrywa siê, hrabia go znalaz³ i zabra³ 'zgubê', szuka wzorców... [kawa³ki ornamentu]
// ************************************************************

INSTANCE DIA_Jarvis_Help2 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Help2_Condition;
	information	= DIA_Jarvis_Help2_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Tu siê schowa³eœ!"; 
};                       

FUNC INT DIA_Jarvis_Help2_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_Cord))&&(lee_offer_condition == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help2_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Help2_15_01"); //Tu siê schowa³eœ!
	AI_Output (self, other,"DIA_Jarvis_Help2_08_02"); //Cholera to Ty! Chyba znowu pojawi³eœ siê we w³aœciwym czasie.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_03"); //Najpierw pogadamy o rudzie, któr¹ mi jesteœ winien.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_04"); //A sk¹d mam wiedzieæ, ¿e dostarczy³eœ wiadomoœæ Cordowi?
	AI_Output (other, self,"DIA_Jarvis_Help2_15_05"); //St¹d, ¿e Lee kaza³ mi coœ przekazaæ. Dowiesz siê co to za wiadomoœæ kiedy dostanê... 1000 bry³ek.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_06"); //Nie mam tyle! 
	AI_Output (other, self,"DIA_Jarvis_Help2_15_07"); //No to masz problem, na razie...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_08"); //Zaczekaj! Nie mam rudy, ale mam coœ równie cennego.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_09"); //Mów.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_10"); //Wiem gdzie mo¿esz znaleŸæ kosztownoœci, które s¹ zaledwie wierzcho³kiem góry bogactw.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_11"); //Nie jestem idiot¹, nie nabierzesz mnie na te bajki ze skarbami.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_12"); //Mówiê prawdê! Zreszt¹ poczekam tu na Ciebie. 
	AI_Output (other, self,"DIA_Jarvis_Help2_15_13"); //A dlaczego mia³bym Ci zaufaæ? Teraz te¿ siê przed czymœ ukrywasz.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_14"); //Sk¹d taki pomys³... Ja tylko wola³em nie rzucaæ siê w oczy. Kolonia sta³a siê ostatnio bardzo niebezpiecznym miejscem.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_15"); //Powiedzmy, ¿e ci wierzê. To gdzie mam szukaæ tych 'skarbów'?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_16"); //WeŸ tê mapê. Jest zniszczona, ale to œwiadczy o jej autentycznoœci.
	
	/************************
	Ork mapa by siê przyda³a jakaœ zniszczona. W sumie trzeba bêdzie zrobiæ kilka takich map.
	**********************/

	CreateInvItems (self,JarvisMap,1);
	B_GiveInvItems (self, other, JarvisMap, 1);
	
	AI_Output (self, other,"DIA_Jarvis_Help2_08_17"); //Zaznaczono tam miejsce ukrycia skarbu.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_18"); //Niech bêdzie. Ale je¿eli mnie oszuka³eœ, to znajdê Ciê nawet w ty³ku Beliara.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_19"); //Bez obaw, nie jestem idiot¹. Teraz Twoja kolej. Co Lee chcia³ mi przekazaæ?
	AI_Output (other, self,"DIA_Jarvis_Help2_15_20"); //Lee powiedzia³, ¿e potrzebuj¹ jeszcze jednego 'wzorca'. Podobno wiesz o co chodzi.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_21"); //Hmm... Tak, wiem. Dobra pêdŸ po te skarby i powiedz mi co tam znalaz³eœ.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_22"); //Aha, gdybyœ odnalaz³ tam kawa³ek ornamentu, to znam kogoœ kto hojnie za to zap³aci.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_23"); //Coœ mi siê wydaje, ¿e od pocz¹tku chodzi³o o ten ornament. Sam sobie szukaj tego kamola.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_24"); //Zaczekaj! Lee mnie zabije jak powiem Ci coœ wiêcej...
	AI_Output (other, self,"DIA_Jarvis_Help2_15_25"); //Albo bêdziesz ze mn¹ szczery, albo wracam tam sk¹d przyszed³em.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_26"); //Dobra. Powiem Ci tyle ile sam wiem.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_27"); //Od kilku dni szukamy dla Magów Wody fragmentów ornamentu. Jeden kawa³ek zagin¹³ niedawno razem z najemnikiem, który mia³ go przy sobie.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_28"); //Wczoraj znalaz³em tego pechowca. By³ paskudnie poharatany i oczywiœcie martwy. Ornamentu przy nim nie by³o.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_29"); //To by³a ta zguba, o której mia³em powiedzieæ Cordowi?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_30"); //Ta sama.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_31"); //Mów dalej.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_32"); //Nied³ugo po tym kiedy odszed³eœ ruszy³em po kolejn¹ czêœæ. Mapa od magów wskazuje miejsca ukrycia niektórych czêœci ornamentu.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_33"); //Magowie przygotowali kilka map, ka¿da wskazuje miejsce ukrycia innego fragmentu.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_34"); //Po co ta ostro¿noœæ?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_35"); //Magowie obawiaj¹ siê, ¿e ktoœ móg³by ukraœæ mapê i odnaleŸæ ornamenty. Dlatego orygina³ ma przy sobie Saturas.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_36"); //Jeden z nas wyruszy³ z pierwsz¹ map¹. Znalaz³ ornament. Saturas w jakiœ sposób to wyczu³, a tak¿e to, ¿e grozi mu œmiertelne niebezpieczeñstwo.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_37"); //Lee wys³a³ mnie po kamieñ, ale znalaz³em tylko zimnego trupa. Potem napatoczy³eœ siê Ty. 
	AI_Output (self, other,"DIA_Jarvis_Help2_08_38"); //Ruszy³em po kolejny fragment ze swoj¹ map¹ i... prawie przep³aci³em to ¿yciem.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_39"); //Co siê sta³o?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_40"); //Nie tylko magowie szukaj¹ ornamentów. Zaatakowali mnie stra¿nicy, w ka¿dym razie nosili zbroje stra¿ników Gomeza.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_41"); //Ledwie uszed³em z ¿yciem. Pozna³em tylko jednego z nich - nazywaj¹ go Hrabi¹. Zdaje siê, ¿e to on przewodzi³ poszukiwaniom.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_42"); //Ciekawa historyjka. Dlaczego nie powiedzia³eœ o tym Lee i magom?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_43"); //Ukry³em siê i chcia³em przeczekaæ a¿ zrobi siê bezpieczniej, a wtedy pojawi³eœ siê Ty.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_44"); //Czyli chcia³eœ mnie wys³aæ do miejsca gdzie pewnie czeka³by na mnie ten Hrabia?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_45"); //Ekhm... No wiesz, gdybyœ wróci³ to by oznacza³o, ¿e ju¿ ich tam nie ma, albo ¿e jesteœ wiêkszym sukinsynem ni¿ oni.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_46"); //Wiem jak to wygl¹da, ale wola³em nie ryzykowaæ...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_47"); //Pos³uchaj! Nadal istnieje szansa na odnalezienie ukrytego fragmentu ornamentu. Mapa wskazuje na jaskiniê, ale za cholerê nie znalaz³em tam wzorca...
	AI_Output (self, other,"DIA_Jarvis_Help2_08_48"); //Mo¿e oni te¿ jej nie odnaleŸli...
	AI_Output (other, self,"DIA_Jarvis_Help2_15_49"); //Rozbrajasz mnie. Najpierw mnie wykorzystujesz, póŸniej nie chcesz mi zap³aciæ, k³amiesz, a w koñcu wysy³asz mnie na pewn¹ œmieræ. Masz tupet!
	AI_Output (other, self,"DIA_Jarvis_Help2_15_50"); //Sam nie wiem dlaczego jeszcze Ciê nie zabi³em.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_51"); //Postaw siê na moim miejscu. Pewnie post¹pi³byœ podobnie. Nie mia³em wyboru... Magom zale¿y na czasie, a Lee ma wzglêdem nich d³ug do sp³acenia.
	AI_Output (self, other,"DIA_Jarvis_Help2_08_52"); //To dlatego im pomagamy. Im szybciej znajdziemy ornamenty tym szybciej zajmiemy siê w³asnymi sprawami.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_53"); //Za³ó¿my, ¿e coœ znajdê, co wtedy?
	AI_Output (self, other,"DIA_Jarvis_Help2_08_54"); //Przynieœ to do mnie. W tym czasie dowiem siê czegoœ wiêcej o stra¿nikach, którzy te¿ szukaj¹ ornamentów.
	AI_Output (other, self,"DIA_Jarvis_Help2_15_55"); //Dobra, zobaczymy co z tego wyniknie.
	B_LogEntry		(CH3_NON_Mercenary, "Odnalaz³em Jarvisa. D³ugo gawêdziliœmy i sporo siê dowiedzia³em. Najemnicy pomagaj¹ Magom Wody w odnalezieniu jakiœ ornamentów. Miejsce ukrycia ka¿dego kawa³ka wskazuje jedna mapa. Ale nie tylko magowie szukaj¹ ornametnów. Hrabia tak¿e macza w tym palce i zdoby³ ju¿ jeden kawa³ek kamienia. Dosta³em od Jarvisa mapê z zaznaczonym miejscem ukrycia kolejnej czêœci ornamentu. Muszê uwa¿aæ bo mogê tam spotkaæ stra¿ników a nawet samego Hrabiego.");

	Log_CreateTopic	(CH3_NON_Ornament, LOG_MISSION);
	Log_SetTopicStatus	(CH3_NON_Ornament, LOG_RUNNING);
	B_LogEntry		(CH3_NON_Ornament, "Jarvis powiedzia³ mi, ¿e Magowie Wody szukaj¹ jakiœ ornametnów. Muszê dowiedzieæ siê czegoœ wiêcej.");
	Wld_InsertItem			(orn2, "GOBBO_MASTERCAVE8");

};

// ************************************************************

INSTANCE DIA_Jarvis_Help21 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Help21_Condition;
	information	= DIA_Jarvis_Help21_Info;
	permanent	= 0;
	important 	= 1;
	description		= ""; 
};                       

FUNC INT DIA_Jarvis_Help21_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_Help2))&&(NPC_HasItems(hero,orn2)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Help21_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_Help21_08_00"); //Czujê, ¿e masz fragment!
	AI_Output (other, self,"DIA_Jarvis_Help21_15_01"); //Nie by³o ³atwo, to ciê bêdzie kosztowaæ kolejny 1000 bry³ek...
	AI_Output (self, other,"DIA_Jarvis_Help21_08_02"); //S³ysza³eœ ten ha³as przed jaskini¹? Czujê, ¿e nadchodz¹ k³opoty!

	B_StopProcessInfos	(self);	

	//OW_PATH_225 Hrabia
	var C_NPC hrabia; hrabia = Hlp_GetNpc(GRD_4010_Hrabia);
	AI_Teleport(hrabia, "OW_PATH_225");
	Npc_ExchangeRoutine(hrabia,"TRAP1");
	
	Wld_InsertNpc (Grd_2513_Kasacz,"OW_PATH_224"); //OW_PATH_224
	Wld_InsertNpc (GRD_2514_Guard,"OW_PATH_223"); //OW_PATH_223
	Wld_InsertNpc (GRD_2515_Guard,"OW_PATH_222"); //OW_PATH_222
	Wld_InsertNpc (GRD_2516_Guard,"OW_PSIWOOD_MOVEMENT8"); //OW_PSIWOOD_MOVEMENT8
	Wld_InsertNpc (GRD_2517_Guard,"OW_PSIWOOD_MOVEMENT7"); //OW_PSIWOOD_MOVEMENT7
	Wld_InsertNpc (GRD_2518_Guard,"OW_PATH_222"); //OW_PATH_222
};

var int jar_guide;

// ************************************************************

INSTANCE DIA_Jarvis_AfterTrap (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_AfterTrap_Condition;
	information	= DIA_Jarvis_AfterTrap_Info;
	permanent	= 0;
	important 	= 1;
	description		= "..."; 
};                       

FUNC INT DIA_Jarvis_AfterTrap_Condition()
{
	var C_NPC kasacz; kasacz = Hlp_GetNpc(Grd_2513_Kasacz);

	if (Npc_KnowsInfo(hero,DIA_Hrabia_TrapEnd))&&(Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_IsDead(kasacz))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_AfterTrap_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc 	(self, other);
		
   AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_00"); //Jednak zd¹¿y³em!
   AI_GotoNpc(self, other);
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_15_01"); //Uciek³ skurwiel!
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_02"); //Jeszcze go dopadniemy. Musimy powiedzieæ Lee co siê tutaj sta³o.
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_15_03"); //Ten Hrabia to cwany typ. Wydaje siê, ¿e doskonale wie co robi i ca³y czas jest o krok przed nami.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_04"); //Tak, ten cz³owiek mnie przera¿a. Nawet Lee siê go obawia.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_08_05"); //Idziemy?
};

//************************************************************

INSTANCE DIA_Jarvis_AfterTrap1 (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_AfterTrap1_Condition;
	information	= DIA_Jarvis_AfterTrap1_Info;
	permanent	= 0;
	important 	= 0;
	description		= "Czas w drogê."; 
};                       

FUNC INT DIA_Jarvis_AfterTrap1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_AfterTrap))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_AfterTrap1_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_AfterTrap1_15_06"); //Mo¿emy ruszaæ.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap1_08_07"); //Jesteœ pewien?

	Info_ClearChoices (DIA_Jarvis_AfterTrap1);
	Info_AddChoice (DIA_Jarvis_AfterTrap1, "ProwadŸ.", DIA_Jarvis_AfterTrap1_Yes);
	Info_AddChoice (DIA_Jarvis_AfterTrap1, "Sam tam trafiê.", DIA_Jarvis_AfterTrap1_Alone);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Jarvis_AfterTrap1_Yes()
{
	Npc_ExchangeRoutine(self,"JOIN");

	Party_AddNpc(self);
	AI_Output (other, self,"DIA_Jarvis_AfterTrap1_Yes_15_01"); //ProwadŸ.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap1_Yes_08_02"); //Trzymaj siê blisko, to bêdzie d³uga droga.

	B_LogEntry		(CH3_NON_Mercenary, "Za³atwi³em K¹sacza, ale Hrabia uciek³. Czas porozmawiaæ z Lee.");
	B_LogEntry		(CH3_NON_Ornament, "Czas porozmawiaæ z Magami Wody i dowiedzieæ siê czegoœ wiêcej o tych ornamentach.");
	B_StopProcessInfos	(self);
};

// ---------------------------Alone----------------------------------------

FUNC VOID DIA_Jarvis_AfterTrap1_Alone()
{
   Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"GUARD");
	AI_Output (other, self,"DIA_Jarvis_AfterTrap_Alone1_15_01"); //Sam tam trafiê.
	AI_Output (self, other,"DIA_Jarvis_AfterTrap_Alone1_08_02"); //Jak chcesz. Zobaczymy siê na miejscu.

	B_LogEntry		(CH3_NON_Mercenary, "Za³atwi³em K¹sacza, ale Hrabia uciek³. Czas porozmawiaæ z Lee.");
	B_LogEntry		(CH3_NON_Ornament, "Czas porozmawiaæ z Magami Wody i dowiedzieæ siê czegoœ wiêcej o tych ornamentach.");
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE DIA_Jarvis_LeeCamp (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_LeeCamp_Condition;
	information	= DIA_Jarvis_LeeCamp_Info;
	permanent	= 0;
	important 	= 1;
	description		= "..."; 
};                       

FUNC INT DIA_Jarvis_LeeCamp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jarvis_AfterTrap1))&&(Npc_GetDistToWP (self, "LOCATION_19_03_PATH_RUIN6") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_LeeCamp_Info()
{	
	if (Npc_GetAivar(self,AIV_PARTYMEMBER) == TRUE)
	{
		Party_RemoveNpc(self);
		Npc_ExchangeRoutine(self,"GUARD");
	};
   
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc 	(self, other);
   
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_01"); //Cuchnie tu wilgoci¹, ale ma³o kto zagl¹da na takie odludzie.
	AI_Output (other, self,"DIA_Jarvis_LeeCamp_15_02"); //Prawie jak w domu...
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_03"); //Porozmawiaj z Lee. Mo¿e dowiesz siê czegoœ wiêcej.
	AI_Output (self, other,"DIA_Jarvis_LeeCamp_08_04"); //Bywaj i... dziêki za pomoc.
	
   B_StopProcessInfos	(self);
}; 
