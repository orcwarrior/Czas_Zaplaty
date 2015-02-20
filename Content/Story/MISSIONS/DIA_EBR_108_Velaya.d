// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Vela_EXIT(C_INFO)
{
	npc			= EBR_108_Velaya;
	nr			= 999;
	condition			= Info_Vela_EXIT_Condition;
	information			= Info_Vela_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Vela_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vela_EXIT_Info()
{	
	B_StopProcessInfos(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Vela_Hello (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 1;
	condition		= Info_Vela_Hello_Condition;
	information		= Info_Vela_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jesteœ s³onko i co tutaj tak ³adnie pachnie?";
};                       

FUNC INT Info_Vela_Hello_Condition()
{	
	return 1;
};

FUNC VOID Info_Vela_Hello_Info()
{	
	AI_Output (other, self,"Info_Vela_Hello_15_00"); //Kim jesteœ s³onko i co tutaj tak ³adnie pachnie?
	AI_Output (self, other,"Info_Vela_Hello_16_01"); //OdejdŸ g³upcze! Jestem kobiet¹ Gomeza!
	AI_Output (other, self,"Info_Vela_Hello_15_02"); //Nie szkodzi. To nawet lepiej, ¿e nie jesteœ dziewic¹...
	AI_Output (self, other,"Info_Vela_Hello_16_03"); //Ty bezczelny gnojku! Wynoœ siê st¹d, bo zawo³am stra¿e!
	AI_Output (other, self,"Info_Vela_Hello_15_04"); //Je¿eli wolisz gdy kilku niegrzecznych ch³opców...
	AI_Output (self, other,"Info_Vela_Hello_16_05"); //Precz mi z oczu zboczeñcu. Nie chcê Ciê wiêcej widzieæ!
	
   B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Vela_HelloAgain (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 2;
	condition		= Info_Vela_HelloAgain_Condition;
	information		= Info_Vela_HelloAgain_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Vela_HelloAgain_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))&&(Npc_KnowsInfo (hero, Info_Vela_Hello))&&(NPC_HasItems(other,akt)>=1)
	{
		return 1;
	};
};

FUNC VOID Info_Vela_HelloAgain_Info()
{	
	AI_Output (self, other,"Info_Vela_HelloAgain_16_01"); //To znowu Ty! Wynoœ siê, zanim zawo³am stra¿e!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_02"); //Zaczekaj, o piêkna. Wybacz mi poprzednie s³owa...
	AI_Output (self, other,"Info_Vela_HelloAgain_16_03"); //Piêkna? Mo¿e bym i wybaczy³a, ale œmierdzisz krecim ³ajnem!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_04"); //Gdy ujrza³em Ciê po raz pierwszy, twa uroda zm¹ci³a mi umys³, nie by³em wtedy sob¹.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_05"); //Hmm. Mów dalej.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_06"); //To nie miejsce dla Ciebie, b³êkitnooka bogini. Ta brudna Kolonia nie pasuje do takiego cudu. Powinnaœ zdobywaæ królewskie dwory!
	AI_Output (self, other,"Info_Vela_HelloAgain_16_07"); //Rzadko ktoœ docenia moj¹ urodê, do tego w taki sposób... 
	AI_Output (self, other,"Info_Vela_HelloAgain_16_08"); //le Ciê oceni³am poprzednim razem. Wybacz, przystojniaku.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_09"); //Ucieknijmy st¹d! Ty, ja i morska bryza! Bêdziemy p³yn¹æ ku wiecznoœci, na ¿aglach mi³oœci i po¿¹dania! Nic nas nie rozdzieli...
	AI_Output (self, other,"Info_Vela_HelloAgain_16_10"); //S³odki jesteœ, ale Gomez by mi za to cycki urwa³.
	AI_Output (other, self,"Info_Vela_HelloAgain_15_11"); //Gomez nie bêdzie ¿y³ wiecznie. Ogieñ, który wznieci³aœ w mym sercu i lêdŸwiach trawi mnie od œrodka!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_12"); //Daj mi choæ nik³y znak, ¿e czujesz podobnie!
	AI_Output (self, other,"Info_Vela_HelloAgain_16_13"); //Przecie¿ nie roz³o¿ê dla ciebie nóg w zamku Gomeza!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_14"); //Mam coœ dla ciebie...
	
   B_GiveInvItems (other, self, akt, 1);
	B_UseFakeScroll(self);
	
   AI_Output (self, other,"Info_Vela_HelloAgain_16_15"); //Zaskoczy³eœ mnie... Nie wiem, co powiedzieæ...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_16"); //Tak sobie Ciebie wyobra¿a³em. Oczywiœcie, rzeczywistoœæ przyæmiewa ka¿dy rysunek.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_17"); //Jesteœ s³odziutki. Muszê Ci to jakoœ wynagrodziæ...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_18"); //Nie chcê nic w zamian. Wystarczy twój uœmiech, który rozkwita w mym sercu.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_19"); //Mimo wszystko zas³u¿y³eœ na jakiœ podarunek...
	AI_Output (other, self,"Info_Vela_HelloAgain_15_20"); //Masz racjê. Mi³o by by³o mieæ przy sobie coœ, co przypomina³oby twe piêkne oczy.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_21"); //Ale co by ci tu daæ? Bielizny nie noszê, nie mam ¿adnej bi¿uterii... Zaraz. Przecie¿ ten idiota z ma³¹ kuœk¹ ma jakiœ z³oty sygnet!
	AI_Output (other, self,"Info_Vela_HelloAgain_15_22"); //Mówisz o Gomezie?
	AI_Output (self, other,"Info_Vela_HelloAgain_16_23"); //A o kim innym? Ten wa¿niak nadrabia braki w anatomii wielkim mieczem na plecach. 
	AI_Output (self, other,"Info_Vela_HelloAgain_16_24"); //WeŸ ten klucz, pierœcieñ znajdziesz w kufrze.

	CreateInvItems (self,ITKE_GOMEZ_01_2,1);
	B_GiveInvItems (self, other, ITKE_GOMEZ_01_2, 1);

	AI_Output (other, self,"Info_Vela_HelloAgain_15_25"); //Dziêkujê, Velaya. Nie masz pojêcia, jak bardzo jestem Ci wdziêczny.
	AI_Output (self, other,"Info_Vela_HelloAgain_16_26"); //Ca³a przyjemnoœæ po mojej stronie, kotku.
	
   B_LogEntry(CH3_Grd_Thief, "Mam klucz. Czas przeszukaæ skrzyniê Gomeza.");
};

// ************************************************************

INSTANCE Info_Vela_Key (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 3;
	condition		= Info_Vela_Key_Condition;
	information		= Info_Vela_Key_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Vela_Key_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Vela_HelloAgain))&&(NPC_HasItems(other,ITKE_GOMEZ_01_2)>=1)&&(NPC_HasItems(other,Royal_Ring)>=1)&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Key_Info()
{	
	AI_Output (self, other,"Info_Vela_Key_16_01"); //Jak ci siê podoba to œwiecide³ko?
	AI_Output (other, self,"Info_Vela_Key_15_02"); //Sygnet jest wspania³y! Bêdzie mi zawsze przypomina³ twoje piêkne oczy...
	AI_Output (self, other,"Info_Vela_Key_16_03"); //Chyba s³yszê czyjeœ kroki! Oddaj klucz i uciekaj!
	
   B_GiveInvItems (other, self, ITKE_GOMEZ_01_2, 1);
	B_LogEntry(CH3_Grd_Thief, "Mam sygnet. Muszê teraz wsadziæ pierœcieñ do skrzyni Coopera.");
	B_StopProcessInfos(self);
};

//*****************************************************************

INSTANCE Info_Vela_Thx (C_INFO)
{
	npc		= EBR_108_Velaya;
	condition		= Info_Vela_Thx_Condition;
	information		= Info_Vela_Thx_Info;
	important		= 1;
	permanent		= 0;
};

FUNC INT Info_Vela_Thx_Condition()
{	
	var C_NPC Gomez; 
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	if (Npc_KnowsInfo (hero, Info_Vela_Hello))&&(Npc_IsDead(Gomez))
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Thx_Info()
{
	AI_Output (self, other,"Info_Vela_Thx_16_00"); //Gomez nie ¿yje! Co ja teraz zrobiê?
	AI_Output (other, self,"Info_Vela_Thx_15_01"); //Z takim cia³em na pewno sobie poradzisz.
};

// ************************************************************

INSTANCE Info_Vela_Hello1 (C_INFO)
{
	npc		= EBR_108_Velaya;
	nr			= 3;
	condition		= Info_Vela_Hello1_Condition;
	information		= Info_Vela_Hello1_Info;
	important		= 0;
	permanent		= 1;
	description 	= "Co s³ychaæ kotku?";
};                       

FUNC INT Info_Vela_Hello1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Vela_Key))
	{
		return 1;
	};
};

FUNC VOID Info_Vela_Hello1_Info()
{	
	AI_Output (other, self,"Info_Vela_Hello1_15_00"); //Co s³ychaæ kotku?
	AI_Output (self, other,"Info_Vela_Hello1_16_01"); //Myœlê o tym, co mi powiedzia³eœ i za ka¿dym razem robi mi siê od tego mokro...
	B_StopProcessInfos(self);
};
