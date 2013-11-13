// **************************************************
// 						 EXIT 
// **************************************************
var int Corristo_dead;

instance  DIA_Coristo_Exit (C_INFO)
{
	npc			=  KDF_4115_Corristo;
	nr			=  999;
	condition	=  DIA_Coristo_Exit_Condition;
	information	=  DIA_Coristo_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Coristo_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_Coristo_Exit_Info()
{
	B_StopProcessInfos(self);
};

/*********************
Gomez ma klêczeæ w komnacie i b³agaæ Coristo o pomoc, ale raczej ma pecha. Czarny Mag go zabije i zacznie gadaæ z Dickiem.
**********************/

//--------------------------------------------------------------------------
// 					
//--------------------------------------------------------------------------
instance  DIA_Coristo_Hi (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_Hi_Condition;
	information		= DIA_Coristo_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_Coristo_Hi_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Cav_DungeonInside1111))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void  DIA_Coristo_Hi_Info()
{
	var C_NPC gom;	gom = Hlp_GetNpc(EBR_4114_GomezD);

	//B_FullStop (hero);
	AI_TurnToNpc(self, gom);

	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_01"); //Œmiesz prosiæ MNIE o pomoc?
	AI_PlayAni(gom,"T_YES");
	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_02"); //Gomez, jesteœ jak wœciek³y pies, który gryzie rêkê w³asnego Pana!
	AI_Output (self, other,"DIA_Coristo_Hi_Info_14_03"); //Zawiod³eœ mnie, nie jesteœ mi ju¿ potrzebny...
	
   B_LogEntry(CH6_RBL_PayDay, "Odnalaz³em Gomeza, ale nie by³em pierwszy w kolejce do zabijania. Chyba mam nieŸle przechlapane...");
	Wld_PlayEffect("spellFX_INCOVATION_RED", self, self, 1, 0, DAM_MAGIC, FALSE);	
	AI_PlayAni(gom, "T_PSI_VICTIM");
	Npc_ChangeAttribute(gom, ATR_HITPOINTS, -gom.attribute[ATR_HITPOINTS_MAX]);
   
   B_StopProcessInfos(self);
};  

//--------------------------------------------------------------------------
instance DIA_Coristo_Dick (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_Dick_Condition;
	information		= DIA_Coristo_Dick_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int DIA_Coristo_Dick_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Coristo_Hi))&&(Npc_GetDistToNpc(self,hero) < 2000)
	{
		return TRUE;
	};
};

FUNC void DIA_Coristo_Dick_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_01"); //Zbli¿ siê, rebeliancie.
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_02"); //Powiedz mi, dlaczego Gomez tak siê Ciebie obawia³, ¿e zawar³ ze mn¹ pakt?
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_03"); //Kim Ty jesteœ?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_04"); //Kiedyœ by³em magiem ognia, zwa³em siê Corristo. Wybra³em drogê Xardasa, posmakowa³em nekromancji i zmusi³em Gomeza do pos³uszeñstwa.
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_05"); //To dlatego jego decyzje wydawa³y siê tak... chaotyczne. Dlaczego zabi³ twych braci?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_06"); //Braci? Byli za s³abi i zbyt aroganccy. Pozostali wierni Innosowi i to by³ ich b³¹d.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_07"); //Posiad³em potêgê, która... Co siê dzieje?! NIE!
	AI_PlayAni		(self,	"T_PSI_VICTIM");
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_08"); //ZAMILKNIJ BEZCZELNY ROBAKU. JESTEŒ TYLKO NARZÊDZIEM. TO TY ŒMIERTELNA ISTOTO ZWRÓCI£AŒ MOJ¥ UWAGÊ.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_09"); //DOSTRZEGAM W TOBIE WIELKIE MO¯LIWOŒCI. JE¯ELI ZECHCESZ, KRÓLESTWA PADN¥ U TWYCH STÓP, A ZIEMIA SP£YNIE KRWI¥ TWYCH WROGÓW.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_10"); //STAÑ U MEGO BOKU, A BÊDZIESZ W£ADA£ ŒWIATEM ŒMIERTELNIKÓW!
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_11"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_12"); //JESTEM AWATAREM BELIARA, UPAD£YM W£ADC¥, KTÓRY UNU¯A£ PRZED WIEKAMI ŒWIAT LUDZI W KRWI I OGNIU.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_13"); //TEN CZ£OWIEK CHCIA£ POSI¥ŒÆ ZBYT WIELK¥ MOC, KTÓRA NIM W KOÑCU ZAW£ADNÊ£A. TO DZIÊKI NIEMU DOSZED£EŒ A¯ TUTAJ, A JEGO POCZYNANIAMI KIEROWA£A MA WOLA.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_14"); //GOMEZ I MAGNACI BYLI TYLKO NARZÊDZIAMI. JEDYNIE KRUK OKAZA£ SIÊ GODNYM UWAGI MEGO PANA. I TY MO¯ESZ PÓJŒÆ T¥ DROG¥.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_15"); //CO WYBIERZESZ ŒMIERTELNA ISTOTO?
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_16"); //POTÊGÊ, W£ADZÊ I WIECZNE ¯YCIE, CZY BOLESN¥ ŒMIERÆ Z MOICH R¥K?
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_17"); //Nie jestem idiot¹. Ka¿dy cz³owiek jest Ci potrzebny tylko do osi¹gniêcia okreœlonego celu.
	AI_Output (other, self,"DIA_Coristo_Dick_Info_15_18"); //PóŸniej pozbywasz siê takich jak ja, tak jak wyrzuca siê zu¿yte onuce.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_19"); //NIE KA¯DY TAK KOÑCZY. NAJSILNIEJSI TRWAJ¥ I WYPE£NIAJ¥ WOLÊ BELIARA PO WSZE CZASY.
	AI_Output (self, other,"DIA_Coristo_Dick_Info_14_20"); //DECYDUJ, CZ£OWIEKU I NIE TRWOÑ MEGO CZASU!

   /***************
   Wsadzamy Nekrosa, wejdzie we w³aœciwym momencie...

   ****************/

	Wld_InsertNpc(Non_4116_Nekroman,"DUNG_TRAP51");
   
	Info_ClearChoices (DIA_Coristo_Dick);
	Info_AddChoice (DIA_Coristo_Dick, "W³adza, bogactwa... Tak, pod¹¿ê œcie¿k¹ Beliara.", DIA_Coristo_Dick_Yes);
	Info_AddChoice (DIA_Coristo_Dick, "Nie dam siê omotaæ ¿adnemu bogu!", DIA_Coristo_Dick_No);
};

// ---------------------------Yes----------------------------------------

FUNC VOID DIA_Coristo_Dick_Yes()
{
	var C_NPC nek;	nek = Hlp_GetNpc(Non_4116_Nekroman);
	necro_appear = 1;
	AI_Output (other, self,"DIA_Coristo_Dick_Yes_Info_15_01"); //W³adza, bogactwa. Tak, pod¹¿ê œcie¿k¹ Beliara.
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_02"); //M¥DRZE WYBRA£EŒ. A TERAZ...
	AI_TurnToNpc(self, nek);
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_03"); //TY?! JAK ŒMIESZ TU PRZYCHODZIÆ...
	AI_Output (self, other,"DIA_Coristo_Dick_Yes_Info_14_04"); //NIE!

	/**********************
Ork mo¿esz to zrobiæ bardziej spektakularnie, wchodzi nekro, rzuca jakiœ fajny spell i coristo szlag trafia

***********************/

	Corristo_dead = true;

	B_LogEntry(CH6_RBL_PayDay, "Wybra³em drogê Beliara, w koñcu czego siê nie robi dla w³adzy i bogactw? Ale coœ mi mówi, ¿e Ÿle zrobi³em.");
	B_StopProcessInfos(self);
};	

// ---------------------------No----------------------------------------

FUNC VOID DIA_Coristo_Dick_No()
{
	necro_appear = 2;
	AI_Output (other, self,"DIA_Coristo_Dick_No_Info_15_01"); //Nie dam siê omotaæ ¿adnemu bogu!
	AI_Output (self, other,"DIA_Coristo_Dick_No_Info_14_02"); //TO BÊDZIE BOLESNA ŒMIERÆ!
   
	B_LogEntry(CH6_RBL_PayDay, "Sprzeciwi³em siê awatorowi samego Beliara. To chyba bêdzie bola³o...");
	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

//--------------------------------------------------------------------------
instance  DIA_Coristo_DickDead (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Coristo_DickDead_Condition;
	information		= DIA_Coristo_DickDead_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_Coristo_DickDead_Condition()
{	
	/*****************
   Zagada jak dick bêdzie mia³ 1/10 ca³ego hp - nie wiem czy dobrze to zrobi³em ;P

   ****************/

	if (necro_appear == 3)
	{
		return TRUE;
	};
};
FUNC void  DIA_Coristo_DickDead_Info()
{
	var C_NPC nek;	nek = Hlp_GetNpc(Non_4116_Nekroman);
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_GotoNpc(self, other);
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_01"); //JESTEŒ S£ABSZY NI¯ MYŒLA£EM...
	AI_TurnToNpc(self, nek);
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_02"); //TY?! JAK ŒMIESZ TU PRZYCHODZIÆ...
	AI_Output (self, other,"DIA_Coristo_DickDead_Info_14_03"); //NIE!

	/**********************
Ork mo¿esz to zrobiæ bardziej spektakularnie, wchodzi nekro, rzuca jakiœ fajny spell i coristo szlag trafia

***********************/

	Corristo_dead = true;
   
	B_StopProcessInfos(self);
};

instance DIA_Corirsto_Dead (C_INFO)
{
	npc				= KDF_4115_Corristo;
	condition		= DIA_Corirsto_Dead_Condition;
	information		= DIA_Corirsto_Dead_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int DIA_Corirsto_Dead_Condition()
{	
	return Corristo_dead;
};

FUNC void DIA_Corirsto_Dead_Info()
{
   AI_PlayAni(self, "T_PSI_VICTIM");
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	B_StopProcessInfos(self);
   B_StopProcessInfos(other);
};  
/*
TODO:
Moja wersja, cinematic koniecznie szybko sprawdzic dzialanie PrintDialog
1.Wchodzimy do komnaty
2.Widzimy Corristo i gomeza, gomeza zabija corristo
3.Corristo zaczyna z nami rozmowe
4.Wybieramy drogê - nekro wpada odrazu albo...
5.Corristo zaczyna nasz atakowaæ zdejmuje nam 2ma czarami staly damage do okrl liczby hp
6.Po drugim czarze corristo zagaduje nas ponownie, kiedy chce rzucic czar wpada nekro i go zabija
7.Rozmowa z nekro...
Ein moment, wtedy cinematic aragorna nie mial by sensu(2 wybory) - do obgadania
*/
