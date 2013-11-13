// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************
//				First
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Czym siê zajmujesz?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Dbam o broñ stra¿ników.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Sprzedajesz orê¿?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Te¿, ale tylko Gomezowi i jego ludziom.

	Log_CreateTopic(GE_TraderOC, LOG_NOTE);
	B_LogEntry(GE_TraderOC,	"Skip, stra¿nik z tylnego dziedziñca, sprzedaje orê¿, ale tylko ludziom Gomeza.");

	Info_ClearChoices(DIA_Skip_First);
	Info_Addchoice(DIA_Skip_First,"Rozumiem. Do zobaczenia.",DIA_Skip_First_BACK);
	Info_Addchoice(DIA_Skip_First,"Przysy³a mnie Gomez. Podobno masz dla mnie jakieœ wyposa¿enie.",DIA_Skip_First_Gomez);
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Przysy³a mnie Gomez. Podobno masz dla mnie jakieœ wyposa¿enie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //To co zwykle, tak? Nowy pancerz i najlepsza broñ, jak¹ mam na sk³adzie?
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_02"); //Dok³adnie.	
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_03"); //Wynoœ siê, albo zawo³am stra¿ników!
	Info_ClearChoices(DIA_Skip_First);
	B_StopProcessInfos(self);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Rozumiem. Do zobaczenia.
	Info_ClearChoices(DIA_Skip_First);
	B_StopProcessInfos(self);
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Przyda³oby mi siê kilka drobiazgów."; 
	trade 			= 1;
};

FUNC int GRD_211_Skip_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		return TRUE;
	};
};

FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Przyda³oby mi siê kilka drobiazgów.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mam co nieco na sprzeda¿, sam zobacz.
};  

// **************************************

instance  DIA_Skip_Warehouse (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  3;
	condition	=  DIA_Skip_Warehouse_Condition;
	information	=  DIA_Skip_Warehouse_Info;
	permanent	=  0;
	description = "Co trzymacie w magazynie?";
};                       

FUNC int  DIA_Skip_Warehouse_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Skip_First)) && (Npc_KnowsInfo(hero, Info_Diego_Prison1))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Skip_Warehouse_Info()
{
	AI_Output (other, self,"DIA_Skip_Warehouse_15_00"); //Co trzymacie w magazynie?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_01"); //A co Ciê to obchodzi?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_02"); //Tak tylko pytam, z ciekawoœci.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_03"); //A co mo¿na trzymaæ w magazynie zamkniêtym na klucz?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_04"); //Kobitki?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_05"); //He, he. Dobre.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_06"); //W sumie by³eœ blisko. Coœ ci zdradzê...
	AI_StandUp (self);
	AI_PlayAni (self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"DIA_Skip_Warehouse_12_07"); //Jest tam ukrytych kilka 'œlicznotek'. Ale to stalowe dziewice, he, he.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_08"); //Ktoœ lubi ostr¹ zabawê...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_09"); //To miecze, idioto! Wyku³ je Stone specjalnie dla osobistych stra¿ników Gomeza.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_10"); //Oczywiœcie Blizna i Arto wol¹ swój z³om, ale reszcie to odpowiada³o.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_11"); //Stone wytopi³ na te ostrza tyle rudy, ¿e œwiec¹ w nocy jak psu jajca.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_12"); //To dlaczego stra¿nicy nie nosz¹ ich przy sobie?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_13"); //Bo to cholerne ochleje.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_14"); //Jeden z tych idiotów zastawi³ miecz za wódê. Kiedy Gomez siê o tym dowiedzia³, rozkaza³ zabraæ pozosta³e miecze i zamkn¹æ je w magazynie.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_15"); //Dostan¹ je, kiedy rzeczywiœcie zrobi siê gor¹co.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_16"); //To ile ich jest?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_17"); //By³o piêæ. Jeden gdzieœ przepad³, zosta³y cztery. Taplaj¹ siê w oleju i czekaj¹ na lepsze czasy.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_18"); //A kto ma klucz do magazynu?
	AI_Output (self, other,"DIA_Skip_Warehouse_12_19"); //Zaczynasz zadawaæ niebezpieczne pytania, ch³opcze. Po co Ci to wiedza?
	AI_Output (other, self,"DIA_Skip_Warehouse_15_20"); //Te miecze... Chcia³bym je zobaczyæ.
	AI_Output (self, other,"DIA_Skip_Warehouse_12_21"); //Nie ma tak dobrze. Gomez urwa³by mi jaja, gdybym oprowadza³ po magazynie ka¿dego chêtnego.
	AI_Output (other, self,"DIA_Skip_Warehouse_15_22"); //Przecie¿ nie musisz iœæ ze mn¹. Wystarczy, ¿e dasz mi klucz...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_23"); //A Ty 'po¿yczysz' sobie kilka œwiecide³ek i dasz nogê. Nie jestem idiot¹!
	AI_Output (other, self,"DIA_Skip_Warehouse_15_24"); //Chcê tylko zobaczyæ miecze...
	AI_Output (self, other,"DIA_Skip_Warehouse_12_25"); //Nic z tego. Spadaj.
	B_LogEntry(CH6_RBL_Thievery, "Sz³o mi ca³kiem dobrze, dopóki nie zapyta³em o klucz. Skip nosi go ca³y czas przy sobie. Dowiedzia³em siê te¿, ¿e w magazynie s¹ tylko 4 ostrza, jedno gdzieœ zaginê³o. Muszê jakoœ zwêdziæ ten klucz Skipowi...");

	/************************
Ork zmieñ mu rutynê, ¿eby gdzieœ miêdzy 22 a 02 sta³ ko³o tych pak i chla³. Paki s¹ pomiêdzy siedzib¹ magów a zamkiem, pod murem.

*************************/

	Wld_InsertItem			(ITKEY_OB_SMITH_01, "OCC_CORNER_1");

	//Npc_ExchangeRoutine	(self, "Drink");
};

// **************************************

instance  DIA_Skip_Swords (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  4;
	condition	=  DIA_Skip_Swords_Condition;
	information	=  DIA_Skip_Swords_Info;
	permanent	=  0;
	description = "Chyba coœ ci wypad³o.";
};                       

FUNC int  DIA_Skip_Swords_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Skip_Warehouse))&&(NPC_HasItems(other,ITKEY_OB_SMITH_01)>=1)&&(NPC_HasItems(other,ItMw_1H_Sword_Bastard_05)>=3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Skip_Swords_Info()
{
	AI_Output (other, self,"DIA_Skip_Swords_15_00"); //Chyba coœ ci wypad³o.
	AI_Output (self, other,"DIA_Skip_Swords_12_01"); //O czym mówisz?
	AI_Output (other, self,"DIA_Skip_Swords_15_02"); //Poznajesz ten klucz?
	AI_TurnToNpc 	(self,other);
	Ai_Wait (self,0.3);	
	AI_Output (self, other,"DIA_Skip_Swords_12_03"); //Sk¹d go masz... To by³eœ Ty!
	AI_Output (other, self,"DIA_Skip_Swords_15_04"); //Powiedzmy, ¿e znalaz³em przy pakach z ry¿ówk¹, któr¹ tak zawziêcie popijasz.
	AI_Output (other, self,"DIA_Skip_Swords_15_05"); //Ciekawe co by powiedzia³ Gomez, gdyby siê dowiedzia³, ¿e zgubi³eœ klucz po pijaku?
	AI_Output (self, other,"DIA_Skip_Swords_12_06"); //Niech Ciê szlag! Czego chcesz?
	AI_Output (other, self,"DIA_Skip_Swords_15_07"); //Powiedz mi gdzie jest czwarte ostrze?
	AI_Output (self, other,"DIA_Skip_Swords_12_08"); //Po co Ci te miecze?
	AI_Output (other, self,"DIA_Skip_Swords_15_09"); //Powiedzmy, ¿e lubiê b³yskotki. Mów!
	AI_Output (self, other,"DIA_Skip_Swords_12_10"); //Cholera, Arto urwie mi za to ³eb...
	AI_Output (other, self,"DIA_Skip_Swords_15_11"); //Wolisz, ¿eby dowiedzia³ siê o tym Gomez?
	AI_Output (self, other,"DIA_Skip_Swords_12_12"); //Zaczekaj. Ale dostanê klucz?
	AI_Output (other, self,"DIA_Skip_Swords_15_13"); //Oczywiœcie, s³owo 'stra¿nika'.
	AI_Output (self, other,"DIA_Skip_Swords_12_14"); //Arto to zboczeniec. Œpi z mieczem pod poduszk¹...
	AI_Output (self, other,"DIA_Skip_Swords_12_15"); //Nie wiem dlaczego, ale strasznie spodoba³y mu siê te ostrza.
	AI_Output (self, other,"DIA_Skip_Swords_12_16"); //Nie chcia³ mówiæ o tym otwarcie. Zap³aci³ mi za jeden miecz. 
	AI_Output (self, other,"DIA_Skip_Swords_12_17"); //Je¿eli mu o tym powiesz, to ju¿ po mnie...
	AI_Output (other, self,"DIA_Skip_Swords_15_18"); //Spokojnie, to nie jego sprawa. Gdzie trzyma orê¿?
	AI_Output (self, other,"DIA_Skip_Swords_12_19"); //Tego nie wiem, ale pewnie w skrzyni gdzieœ w sto³pie.
	AI_Output (other, self,"DIA_Skip_Swords_15_20"); //Dobra, to mi wystarczy. Bywaj.
	AI_Output (self, other,"DIA_Skip_Swords_12_21"); //Zaczekaj! A klucz?
	AI_Output (other, self,"DIA_Skip_Swords_15_22"); //Jaki klucz?
	AI_Output (self, other,"DIA_Skip_Swords_12_23"); //Ty skurw...
	AI_Output (other, self,"DIA_Skip_Swords_15_24"); //Dobra, weŸ go. I uwa¿aj, bo nastêpnym razem mo¿esz siê upiæ... na œmieræ.
	
   B_GiveInvItems (other, self, ITKEY_OB_SMITH_01, 1);
	B_LogEntry(CH6_RBL_Thievery, "Skip sprzeda³ miecz Arto. Ten schowa³ go gdzieœ w zamku. Muszê poszukaæ miecza i zanieœæ wszystkie Diego. Mam ju¿ doœæ Starego Obozu...");
};
