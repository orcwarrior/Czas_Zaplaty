//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  DIA_Roderic_EXIT (C_INFO)
{
	npc			= Roderic;
	nr			= 999;
	condition	= DIA_Roderic_EXIT_Condition;
	information	= DIA_Roderic_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Roderic_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Roderic_EXIT_Info()
{
	B_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
instance  DIA_Roderic_OldNote(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_OldNote_Condition;
	information	= DIA_Roderic_OldNote_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_OldNote_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Leren_OldNote))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_OldNote_Info()
{
	B_GiveXP(500);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_01"); //Cienie i mrok... Przenika mnie zimno wieków... Czujê ciep³o œmiertelnej istoty.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_02"); //'Niestety' nadal oddycham. Kim jesteœ? Dlaczego pa³êtasz siê po tych zapomnianych przez bogów ruinach?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_03"); //To moje przekleñstwo. Wieczna tu³aczka.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_04"); //Taki los czeka ka¿dego zdrajcê...
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_05"); //Zdrajcê?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_06"); //Zawiod³em tych, którzy mi zaufali. To gorsze ni¿ zdrada.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_07"); //Mo¿e powiesz coœ wiêcej (cholera ja rozmawiam z duchem!)...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_08"); //To by³a mroŸna noc. Ksiê¿yc sta³ w nowiu.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_09"); //Ca³y przemarz³em. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_10"); //Mia³em przyjaciela, nazywa³ siê Truan.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_11"); //Przyniós³ mi grzane wino... A ja najzwyczajniej w œwiecie zasn¹³em.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_12"); //Orkowie przyszli przed œwitem. Wyr¿nêli wszystkich bez wyj¹tku. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_13"); //To ja mam ich krew na rêkach!
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_14"); //Jesteœ dla siebie zbyt surowy. Ka¿demu mo¿e siê zdarzyæ...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_15"); //...skazaæ ca³¹ osadê na œmieræ? Nie wiesz o czym mówisz, œmiertelniku.
	AI_Output 	(other,self,"DIA_Roderic_OldNote_15_16"); //Wybacz, chcia³em tylko...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_17"); //Nigdy ju¿ nie zejdê z posterunku, bêdê tu trwa³ do koñca œwiata.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_18"); //Choæ tak mogê odp³aciæ za swoj¹ zbrodniê...
	AI_Output 	(self, hero,"DIA_Roderic_OldNote_11_19"); //A teraz odejdŸ, chcê zostaæ sam.
	B_LogEntry		(CH3_RBL_RodneyHelp, "W ruinach Wie¿y Mgie³ znalaz³em... ducha. Do tego doœæ gadatliwego. Zjawa opowiedzia³a zdawkowo doœæ smutn¹ historiê. Duch by³ stra¿nikiem, ale usn¹³ na posterunku, przez co orkowie wyr¿nêli ca³¹ osadê. Nazwa³ siebie zdrajc¹. Mo¿e to o nim mówi³y orkowe zapiski? Muszê rozejrzeæ siê po Wie¿y Mgie³, mo¿e znajdê coœ ciekawego.");

	/***********************************
Ding, wstawiamy mixturê o nazawie dream_mixture gdzieœ na piêtrze wie¿y.
***********************************/
	Wld_InsertItem			(dream_mixture, "FP_RODMIXTURE");		
};

//---------------------------------------------------------------------
instance  DIA_Roderic_OldNote1(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_OldNote1_Condition;
	information	= DIA_Roderic_OldNote1_Info;
	important	= 0;
	permanent	= 0;
	description	= "To nie z Twojej winy wtargnêli orkowie."; 
};

FUNC int  DIA_Roderic_OldNote1_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_baaltaran_GhostMixt))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_OldNote1_Info()
{
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_01"); //To nie z Twojej winy wtargnêli orkowie.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_02"); //Fa³szywe wspó³czucie jest gorsze ni¿ najokrutniejsza zdrada. OdejdŸ zanim...
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_03"); //Zaczekaj. Znalaz³em w Wie¿y flakonik. Kiedyœ wype³nia³a go silna mikstura usypiaj¹ca.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_04"); //Twój przyjaciel poda³ ci grzane wino. W tym specyfiku by³y trucizna, któr¹ najczêœciej dodawano w³aœnie do napitków.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_05"); //Do tego stoi za tym orkowa magia.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_06"); //Truan... To nie mo¿liwe. Nie móg³by...
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_07"); //Nikt uczciwy nie zrozumie motywów zdrajcy. To nie Ty masz na rêkach krew osadników, tylko Truan.
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_08"); //Mylisz siê! Nigdy nie uwierzê w jego zdradê!
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_09"); //W porz¹dku, nie upieram siê.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_10"); //Wiesz gdzie spêdza³ czas za ¿ycia?
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_11"); //Wiem, ¿e zapuszcza³ siê na tereny orków. Opowiada³ mi kiedyœ o starej nekropolii.
	AI_Output 	(other,self,"DIA_Roderic_OldNote1_15_12"); //Wiêc mo¿e tam znajdê coœ co Ciê przekona. 
	AI_Output 	(self, hero,"DIA_Roderic_OldNote1_11_13"); //Rób co chcesz, a teraz zostaw mnie w spokoju...

	B_LogEntry	(CH3_RBL_RodneyHelp, "No to ³adnie, cholerny duch mi nie wierzy, a do tego muszê znaleŸæ orkow¹ nekropoliê i przeczesaæ kurhany w poszukiwaniu œladów zdrady Turana. Ciekawe co bêdzie póŸniej, Czarna Œwi¹tynia?");
	/********************
Wsadzamy ducha do nekropoli orków
***********************/
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Hi(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Hi_Condition;
	information	= DIA_Roderic_Hi_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_Hi_Condition()
{	
	if (Npc_KnowsInfo(other,Info_OrcGhost_Kill))&&(Npc_GetDistToNpc(self,hero) < 400)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Hi_Info()
{
	B_GiveXP(500);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_01"); //Znowu czujê ciep³o œmiertelnej istoty.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_02"); //Nie poznajesz mnie? To ja pomagam Ci oczyœciæ imiê i zaznaæ spokoju.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_03"); //Dlaczego mia³bym staæ siê przewodnikiem na tej œcie¿ce?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_04"); //Ty naprawdê nic nie pamiêtasz? 
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_05"); //Spotka³em ducha szamana na cmentarzysku Orków. Trochê rozmawialiœmy, wyzna³ mi prawdê o zdradzie Urksh'Esta, o tym, ¿e Truan Ciê uœpi³, a póŸniej zdradzi³ te¿ orków...
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_06"); //Argh, pamiêæ wraca. Ja... Nazywam siê Roderik. Przeklête to imiê! Zdrada i krew...
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_07"); //Opowiesz mi coœ wiêcej? Dlaczego orkowie zaatakowali wasz¹ osadê?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_08"); //Szukali potê¿nego artefaktu, nie wiedzieliœmy, ¿e zak³adamy osadê w miejscu plugawej kaŸni.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_09"); //Wieki wczeœniej paladyn Innosa znalaz³ potê¿ny artefakt, miecz, który zosta³ zamkniêty w podziemiach, aby ¿aden œmiertelnik nie posiad³ jego niszczycielskiej mocy.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_10"); //Ostrze zosta³o konsekrowane na o³tarzu ¿ywio³ów tysi¹ce lat temu. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_11"); //Wœród orków ten miecz by³ bardziej znienawidzony ni¿ Uriziel. Orkowie napadli na osadê, ¿eby zniszczyæ g³owniê.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_12"); //Niestety ostrze opar³o siê magii jak i ¿elazu.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_13"); //Wtedy Truan siêgn¹³ po miecz... Tak musia³o byæ.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_14"); //Co sta³o siê z tym cz³owiekiem i ostrzem?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_15"); //Nadal czekaj¹ na swoje przeznaczenie. Œmiertelnik dokona ¿ywota w cierpieniu, strach przeniknie jego serce niczym zimne ostrze i poch³onie go raz na zawsze.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_16"); //To z³o musi zostaæ zniszczone! Tylko wtedy zaznam spokoju.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_17"); //Chwila. I Ty przez ca³y czas o tym wiedzia³eœ? To po cholerê by³a ta szopka z udowodnieniem winy zdrajcy?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_18"); //Nie pamiêtam... Widzê Ciê po raz pierwszy. Ale wyczuwam, ¿e mówisz prawdê.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_19"); //Obawiam siê, ¿e czyny œmiertelników przywracaj¹ mi pamiêæ i zarazem niszcz¹ j¹.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_20"); //Nie rozumiem...
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_21"); //Musia³eœ uczyniæ coœ, co przybli¿a moj¹ duszê do bram odkupienia.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_22"); //Nie trwoñmy czasu, wiem ju¿ dlaczego nadal trwam w tym œwiecie. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_23"); //Nadszed³ czas abym poprowadzi³ ciê Drog¹ Zag³ady.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_24"); //Co to za droga?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_25"); //Przejœcie do katakumb jest naje¿one pu³apkami, nazwaliœmy je Drog¹ Zag³ady. Do tej pory tylko Truan zdo³a³ siê przez nie przedrzeæ.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_26"); //Zabi³ orkowych szamanów, ich krew utorowa³a mu drogê, ale zap³aci³ za to najwy¿sz¹ cenê. Kiedy siêgn¹³ po miecz by³ ju¿ œmiertelnie ranny.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_27"); //Staro¿ytny rytua³ nadal chroni miecz, ale tylko przed nieumar³ymi i ich aspektami. ¯ywy cz³owiek, jak Ty jest niewra¿liwy na dzia³anie magii.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_28"); //Dlatego bêdziesz móg³ wejœæ do podziemi. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_29"); //Jednak zanim Ciê poprowadzê musisz pomóc mi przed ostateczn¹ walk¹ z Truanem, ten zdrajca zap³aci za ca³e z³o, które wyrz¹dzi³.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_30"); //Mów czego potrzebujesz.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_31"); //W tej chwili jestem tylko pieczêci¹, któr¹ pozostawiono aby uwiêziæ z³o.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_32"); //Jednak ja tak¿e pragnê... zemsty.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_33"); //Truan zabra³ mi wszystko - honor, dumê i ¿ycie.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_34"); //Aby odzyskaæ to co straci³em musisz przynieœæ mi mój topór - Ostrze Zmierzchu. Znajdziesz go w podziemiach tej wie¿y.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_35"); //Kiedy znów dotknê ostrza, które s³u¿y³o mi za ¿ycia odzyskam si³ê aby stan¹æ do walki ze zdrajc¹.
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_36"); //Nie k³opocz siê, sam wyœlê tego sukinsyna do Beliara.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_37"); //Nie, œmiertelniku. Teraz pamiêtam ju¿ wszystko. Moja dusza sta³a siê czêœci¹ rytua³u, który nie pozwala Truanowi stan¹æ poœród œmiertelnych. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_38"); //Kiedy odzyskam topór sp³ynie do niego ca³a moc rytua³u. Nawet Truan nie oprze siê takiej potêdze.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_39"); //Jednak nic nie mo¿e przeszkodziæ mi w walce ze z³em. Twoim zadaniem bêdzie strzec mych pleców.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_40"); //Aby zwyciê¿yæ muszê u¿yæ ca³ej swej woli. 
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_41"); //Pomo¿esz mi œmiertelniku?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_42"); //A co ja bêdê z tego mia³?
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_43"); //Rozumiem, ¿e moja wolnoœæ i uwolnienie œwiata od z³a to zbyt ma³o?
	AI_Output 	(other,self,"DIA_Roderic_Hi_15_44"); //Wybacz, ale mam pragmatyczn¹ naturê.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_45"); //Otrzymasz Miecz ¯ywio³ów, œmiertelniku. Od ciebie zale¿y co z nim uczynisz.
	AI_Output 	(self, hero,"DIA_Roderic_Hi_11_46"); //Wiêc co postanowisz?	
	B_LogEntry		(CH3_RBL_RodneyHelp, "Odby³em d³ug¹ rozmowê z duchem Roderika. Powiedzia³ mi, ¿e aby zniszczyæ Truana muszê odzyskaæ dla ducha jego stary topór - ostrze zmierzchu. Nagrod¹ ma byæ jakiœ przeklêty miecz. Nie wiem czy to dobry pomys³ ¿eby mieszaæ siê w sprawy nieumar³ych, ale ten miecz... Pokusa jest zbyt du¿a.");
}; 

//---------------------------------------------------------------------
instance  DIA_Roderic_Help (C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Help_Condition;
	information	= DIA_Roderic_Help_Info;
	important	= 0;
	permanent	= 0;
	description		= "Pomogê Ci."; 
};

FUNC int  DIA_Roderic_Help_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Hi))&&(Wld_IsTime (22,00,04,00))
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Help_Info()
{
	/*************************
	Ork daj jakiœ fajny Wp, albo jedna z tych komnat gdzie by³y po³ówki czarów, albo katafalk tam gdzie na koñcu walczy siê z tym œwirniêtym balem
	**************************/

	// 	Wld_InsertItem			(Urgal_Arth,"WP");
   Wld_InsertItem (GhostAxe1_RICK, "OW_FOGDUNGEON_39");

	AI_Output 	(other,self,"DIA_Roderic_Help_15_01"); //Pomogê Ci.
	AI_Output 	(self, hero,"DIA_Roderic_Help_11_02"); //Moja kl¹twa dobiega wiêc koñca.
	AI_Output 	(self, hero,"DIA_Roderic_Help_11_03"); //Przynieœ topór, a wyruszymy Œcie¿k¹ Zag³ady, aby odnaleŸæ nasze wspólne przeznaczenie.
	B_LogEntry		(CH3_RBL_RodneyHelp, "Muszê przynieœæ Roderikowi jego topór - ostrze zmierzchu, który znajdê gdzieœ w podziemiach wie¿y mgie³. Wtedy wyruszymy do walki ze z³em.");
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Axe (C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Axe_Condition;
	information	= DIA_Roderic_Axe_Info;
	important	= 0;
	permanent	= 0;
	description		= "Mam topór."; 
};

FUNC int  DIA_Roderic_Axe_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Help))&&(Wld_IsTime (22,00,04,00))&&(NPC_HasItems(other,GhostAxe1_RICK)>=1)
	{
		return 1;
	};
};

FUNC void DIA_Roderic_Axe_Info()
{
	B_GiveXP(500);
	AI_Output 	(other,self,"DIA_Roderic_Axe_15_01"); //Mam topór.
	AI_Output 	(self, hero,"DIA_Roderic_Axe_11_02"); //Czujê brzemiê wspomnieñ...
	B_GiveInvItems (other, self, GhostAxe1_RICK, 1);
	Npc_RemoveInvItem (self, GhostAxe1_RICK);
	CreateInvItems (self, GhostAxe1, 1);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_Output 	(self, hero,"DIA_Roderic_Axe_11_03"); //Moc rytua³u sp³ynê³a na ostrze. Ruszajmy, niech dokona siê przeznaczenie!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Odda³em Roderikowi topór. Czeka nas przeprawa przez œcie¿kê us³an¹ pu³apkami i walka z jakimœ nieumar³ym szaleñcem. No có¿, sam tego chcia³em...");
	Party_AddNpc(self);
	B_StopProcessInfos	(self);
	AI_RemoveWeapon		(self);
	Npc_ExchangeRoutine	(self, "Guide");
};

instance DIA_Roderic_Wheel(C_INFO)
{
	npc			= Roderic;
	condition	= DIA_Roderic_Wheel_Condition;
	information	= DIA_Roderic_Wheel_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int DIA_Roderic_Wheel_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Roderic_Axe)) && (Npc_GetDistToWP(hero, "OW_PATH_175_GATE1") < 500)
	{
		return 1;
	};
};

func void DIA_Roderic_Wheel_Info()
{
   AI_Output(other, self, "DIA_Roderic_Wheel_15_01"); //Chyba o czymœ zapomnia³eœ... Nie jestem duchem tak jak ty i nie przejdê przez kraty...
   AI_Output(self, other, "DIA_Roderic_Wheel_15_02"); //Rzeczywiœcie... Patrz! Tam jest ko³owrót. Poczekaj tu na mnie, a ja otworzê bramê!
   
   B_StopProcessInfos(self);
};

//---------------------------------------------------------------------
instance  DIA_Roderic_Fight(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_Roderic_Fight_Condition;
	information	= DIA_Roderic_Fight_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  DIA_Roderic_Fight_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Roderic_Axe))&&(Npc_GetDistToWP (self,"URKSH") < 800 )
	{//AS CINEMATIC SO THIS DIALOG STAY UNUSED
		return 0;
	};
};

FUNC void  DIA_Roderic_Fight_Info()
{
	var C_NPC urk; urk = Hlp_GetNpc(NON_4072_Urksh);

	B_FullStop (hero);
	AI_TurnToNpc (other, urk);
	AI_GotoNpc(self, urk);
	AI_Output 	(urk, self, "DIA_Roderic_Fight_11_01"); //W koñcu jakiœ g³upiec doszed³ a¿ tutaj. Kiedy wypijê krew tego œmiertelnika, bêdê wolny! 
	AI_Output 	(self, urk,"DIA_Roderic_Fight_11_02"); //Najpierw bêdziesz musia³ przejœæ przeze mnie, zdrajco!
	AI_Output 	(urk, self, "DIA_Roderic_Fight_11_03"); //Pamiêtam Ciê... Roderik, to dziêki Twojej naiwnoœci zdoby³em Miecz ¯ywio³ów.
	AI_Output 	(self, urk,"DIA_Roderic_Fight_11_04"); //Wystarczy ju¿ s³ów - giñ bestio!
	B_LogEntry		(CH3_RBL_RodneyHelp, "Czas na ostateczn¹ walkê ze z³em.");
	Party_RemoveNpc(self);
	B_StopProcessInfos	(self); 

	/***************************
	Ork niech przed walk¹ dick odejdzie gdzieœ. Najlepiej, ¿eby nie móg³ pomóc w walce. Dopiero jak Irshakk wygra lub przegra móg³by znowu tam podejœæ
	***************************/

	AI_GotoWP		(other, "urksh_out");

	/**************************
	Podczas walki niech dicka zaatakuj¹ jacyœ nieumarli, ¿eby siê nie zanudzi³
	*************************/
	//monsters_attack ();

	AI_DrawWeapon		(self);
	B_StartAfterDialogFight(self,urk,false);
	B_StartAfterDialogFight(urk,self,false);

	Npc_SetPermAttitude	(urk, ATT_HOSTILE);
};

instance DIA_RodericMD_Hi(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_RodericMD_Hi_Condition;
	information	= DIA_RodericMD_Hi_Info;
	important	= 1;
	permanent	= 0;
	nr			= 1;
};

FUNC int DIA_RodericMD_Hi_Condition()
{	
	return 1;
};

FUNC void DIA_RodericMD_Hi_Info()
{
	B_GiveXP(250);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output(self, hero,"DIA_RodericMD_Hi_11_01"); //Aby pójœæ dalej, musimy otworzyæ te wrota.
	AI_Output(self, hero,"DIA_RodericMD_Hi_11_02"); //Po lewej stronie znajdziesz kamienny prze³¹cznik.
	AI_Output(other,self,"DIA_RodericMD_Hi_15_03"); //Do dzie³a!
	AI_SetWalkmode(self,NPC_RUN);
	Npc_ExchangeRoutine(self,"TURNSWITCH");
	B_LogEntry(CH3_RBL_RodneyHelp, "Jesteœmy coraz bli¿ej Truana.");
	B_StopProcessInfos(self); 
};

instance DIA_RodericMD_ENDE(C_INFO)
{
	npc			= RODERICMD;
	condition	= DIA_RodericMD_ENDE_Condition;
	information	= DIA_RodericMD_ENDE_Info;
	important	= 0;
	permanent	= 1;
	nr			= 999;
	description	= DIALOG_ENDE; 
};

FUNC int  DIA_RodericMD_ENDE_Condition()
{	
	return 1;
};

FUNC void  DIA_RodericMD_ENDE_Info()
{
	B_StopProcessInfos(self); 
};

//---------------------------------------------------------------------
instance  DIA_RodericMD_Thx(C_INFO)
{
	npc			= RodericMD;
	condition	= DIA_Roderic_Thx_Condition;
	information	= DIA_Roderic_Thx_Info;
	important	= 1;
	permanent	= 0;
	nr			= 2;
};

FUNC int  DIA_Roderic_Thx_Condition()
{	
	var C_NPC tru; tru = Hlp_GetNpc(Truan);
	//print_s_i("Npc_IsDead(tru)",Npc_IsDead(tru));
	if (Npc_IsDead(tru)) && (talking_with_Truan)
	{
		return 1;
	};
};

FUNC void  DIA_Roderic_Thx_Info()
{
	B_GiveXP(3000);
	B_FullStop (hero);
	AI_TurnToNpc (self, other);
	AI_GotoNpc(other, self);
   
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_01"); //Z³o zosta³o pokonane...
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_02"); //Odkupi³em swoje winy.
	AI_Output 	(other, self, "DIA_Roderic_Thx_15_03"); //OdejdŸ w pokoju, Roderik.
	AI_Output 	(self, other, "DIA_Roderic_Thx_11_04"); //Dziêkujê. Zas³u¿y³eœ na te ostrze.
	
	// Œwie¿e by ork: miecz siê pojawia, a nie daje go Roderic
	// CreateInvItems (self, ItMw_2H_RuneSWD_01, 1);
	// B_GiveInvItems (self, other, ItMw_2H_RuneSWD_01, 1);
   
	MD_InsertMR = true;
	
	/*********************************
	Ork mo¿naby tutaj daæ pojawienie siê tego miecza, niech dick siê spojrzy w tamt¹ stronê, etc. Irshakk po gadce niech efektowanie zniknie
	********************************/

	AI_Output(self, other, "DIA_Roderic_Thx_11_05"); //Niech bogowie strzeg¹ twych œcie¿ek za ¿ycia jak i za œmierci.
	B_LogEntry(CH3_RBL_RodneyHelp, "Truan zosta³ pokonany. Duch Roderika pozostawi³ mi miecz. S¹dzê, ¿e ta nagroda jest a¿ nazbyt hojna.");
	B_StopProcessInfos(self); 
};