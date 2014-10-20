// **************************** 
//				EXIT 
// ****************************

instance Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nefarius_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// **************************** 
//			Hallo 
// ****************************

instance Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kim jesteœ?";
};                       

FUNC int Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Nazywam siê Nefarius, jestem magiem Krêgu Wody.
};

// ****************************

instance Info_Nefarius_OrnamentMap (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_OrnamentMap_Condition;
	information	=	Info_Nefarius_OrnamentMap_Info;
	permanent	=	0;
	description =	"Przyszed³em po mapê.";
};                       

FUNC int Info_Nefarius_OrnamentMap_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Saturas_Ornament))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_OrnamentMap_Info()
{
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_00"); //Przyszed³em po mapê.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_01"); //Kolejny œmia³ek... W porz¹dku, w³aœnie skoñczy³em ostatnie poci¹gniêcia pêdzla.
   
	CreateInvItems (self,OrnMap3,1);
	B_GiveInvItems (self, other, OrnMap3, 1);
   
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_02"); //Tylko pilnuj pergaminu jak oka w g³owie!
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_03"); //Bez obaw.
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_04"); //A tak z ciekawoœci. Dlaczego sami nie szukacie tych ornamentów? Dlaczego wys³ugujecie siê najemnikami?
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_05"); //A czy ja, albo ktokolwiek z magów wygl¹damy, jak zbir, albo ³owca przygód? No, mo¿e prócz Cronosa.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_06"); //W naturze istnieje odwieczna równowaga pomiêdzy wszystkim, co ¿ywe i martwe.
	AI_Output (self, other,"Info_Nefarius_OrnamentMap_04_07"); //My szukamy wskazówek, najemnicy realizuj¹ nasze cele. To wszystko jest harmoni¹, darem od samego Adanosa.
	AI_Output (other, self,"Info_Nefarius_OrnamentMap_15_08"); //Skoro tak twierdzisz. Czas nadstawiæ za was karku, ¿eby zachowaæ równowagê.

	B_LogEntry(CH3_NON_Ornament, "Mam mapê wskazuj¹c¹ po³o¿enie kolejnego ornamentu. Obym zd¹¿y³ przed Hrabi¹.");

	/***********************
	Wsadzenie wêgorza do miejsca gdzie znajduje siê 3 kawa³ek, wa¿ne dla fabu³y
	**********************/

	Wld_InsertNpc (Grd_2519_Wegorz,"OR3");//wp
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);
	
	Npc_ExchangeRoutine(weg,"START"); //PATH_CASTLE_TO_WATERFALL
	Npc_ExchangeRoutine(grd1,"OR3"); //PATH_CASTLE_TO_WATERFALL
	Npc_ExchangeRoutine(grd2,"OR3"); //OW_PATH_108
	Npc_ExchangeRoutine(grd3,"OR3"); //CASTLE_7
	Npc_ExchangeRoutine(grd4,"OR3"); //CASTLE_8
	Npc_ExchangeRoutine(grd5,"OR3"); //CASTLE_9
	
	//NEWPATH_4 - PRZED JASKINI¥
	//NEWPATH_6 - WP DLA ORNAMENTU

	Wld_InsertItem(orn3, "NEWPATH_6");
	/**********************
	Hrabia ma siê zbli¿yæ do walcz¹cych, ¿eby potem móg³ doœæ szybko podejœæ i zainicjowaæ dialog
	***********************/
};

// ****************************

instance  Info_Nefarius_OrnamentMapAgain (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	3;
	condition	=	Info_Nefarius_OrnamentMapAgain_Condition;
	information	=	Info_Nefarius_OrnamentMapAgain_Info;
	permanent	=	0;
	description =	"Przyszed³em po kolejn¹ mapê.";
};                       

FUNC int  Info_Nefarius_OrnamentMapAgain_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cronos_Ornament))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_OrnamentMapAgain_Info()
{
	AI_Output (other, self,"Info_Nefarius_OrnamentMapAgain_15_00"); //Przyszed³em po kolejn¹ mapê.
	AI_Output (self, other,"Info_Nefarius_OrnamentMapAgain_04_01"); //Oto ona.
	
   CreateInvItems (self,OrnMap4,1);
	B_GiveInvItems (self, other, OrnMap4, 1);
	
   AI_Output (self, other,"Info_Nefarius_OrnamentMapAgain_04_02"); //Powodzenia w poszukiwaniach!
	B_LogEntry(CH3_NON_Ornament, "Mam ju¿ mapê wskazuj¹c¹ po³o¿enie ostatniej czêœci ornamentu. Nie ma co traciæ czasu.");
	
	var C_NPC hrab; hrab = Hlp_GetNpc(GRD_4010_Hrabia);	
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	Npc_ExchangeRoutine(hrab, "OR4"); //OW_PATH_TEMPELRUIN07
	Npc_ExchangeRoutine(grd1,"OR4"); //OW_PATH_175_GATE1
	Npc_ExchangeRoutine(grd2,"OR4"); //OW_PATH_175_GATE2
	Npc_ExchangeRoutine(grd3,"OR4"); //OW_PATH_175_MEATBUG_GATE2
	Npc_ExchangeRoutine(grd4,"OR4"); //OW_PATH_176
	Npc_ExchangeRoutine(grd5,"OR4"); //LOCATION_28_01
	Npc_ExchangeRoutine(weg,"OR4"); //OW_PATH_TEMPELRUIN06
	
	B_StopProcessInfos(self);
};

// ****************************

instance  Info_Nefarius_All (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	4;
	condition	=	Info_Nefarius_All_Condition;
	information	=	Info_Nefarius_All_Info;
	permanent	=	0;
	description =	"Czas po³¹czyæ ornamenty.";
};                       

FUNC int  Info_Nefarius_All_Condition()
{
	return ritual_time_ok;
};

FUNC VOID  Info_Nefarius_All_Info()
{
	AI_Output (other, self,"Info_Nefarius_All_15_00"); //Czas po³¹czyæ ornamenty.
   
	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other,"Info_Nefarius_All_04_01"); //Chwa³a niech bêdzie Adanosowi!
		AI_Output (other, self,"Info_Nefarius_All_15_02"); //Saturas czeka na dziedziñcu.
		AI_Output (self, other,"Info_Nefarius_All_04_03"); //Ju¿ tam idê...
		B_LogEntry(CH3_NON_Ornament, "Poinformowa³em Nefariusa.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_All_04_04"); //Czas min¹³... Co teraz Adanosie?
	};
   
	B_StopProcessInfos(self);
};

// ****************************

instance  Info_Nefarius_Stones (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	5;
	condition	=	Info_Nefarius_Stones_Condition;
	information	=	Info_Nefarius_Stones_Info;
	permanent	= 0;
	important 	= 0;
	description =	"Saturas przys³a³ mnie po kamienie ogniskuj¹ce.";
};                       

FUNC int  Info_Nefarius_Stones_Condition()
{
	return focus_get;
};

FUNC VOID  Info_Nefarius_Stones_Info()
{
	AI_Output (other, self,"Info_Nefarius_Stones_15_00"); //Saturas przys³a³ mnie po kamienie ogniskuj¹ce.
	AI_Output (self, other,"Info_Nefarius_Stones_04_01"); //Niezupe³nie. Chcia³eœ powiedzieæ, ¿e Saturas pozwoli³ Ci zapytaæ stra¿nika o ich wydanie.
	AI_Output (other, self,"Info_Nefarius_Stones_15_02"); //Ekhm... Tak. Trochê siê przejêzyczy³em.
	AI_Output (self, other,"Info_Nefarius_Stones_04_03"); //Kamienie ogniskuj¹ce... Có¿ one mog¹ znaczyæ dla przypadkowego skazañca?
	AI_Output (other, self,"Info_Nefarius_Stones_15_04"); //Wiêcej ni¿ móg³byœ przypuszczaæ.
	AI_Output (self, other,"Info_Nefarius_Stones_04_05"); //S³ucham wiêc, mam sporo wolnego czasu.
	AI_Output (other, self,"Info_Nefarius_Stones_15_06"); //A wiêc wszystko zaczê³o siê, gdy znalaz³em pewiem miecz... (Rick opowiada historiê miecza runicznego)
	AI_Output (self, other,"Info_Nefarius_Stones_04_07"); //Niesamowite. Nie s¹dzi³em, ¿e to ostrze w ogóle istnieje. Poka¿esz miecz?
	
   if (NPC_HasItems(hero,ItMw_2H_RuneSWD_01)>=1)
	{
		AI_Output (other, self,"Info_Nefarius_Stones_15_08"); //Oto on.
		var c_item hero_weapon; hero_weapon = Npc_GetEquippedMeleeWeapon(hero);
		
		if (!Hlp_IsItem(hero_weapon, ItMw_2H_RuneSWD_01))
		{
			Equip_Item(hero, ItMw_2H_RuneSWD_01);
		};
		
		AI_ReadyMeleeWeapon(hero);
		AI_PlayAni(hero, "T_1HSINSPECT");
		AI_RemoveWeapon(hero);
		AI_Output (self, other,"Info_Nefarius_Stones_04_09"); //Cudowny orê¿!
	}
	else
	{
		AI_Output (other, self,"Info_Nefarius_Stones_15_10"); //Nie mam teraz miecza przy sobie.
		AI_Output (self, other,"Info_Nefarius_Stones_04_11"); //Szkoda...
	};
	
   AI_Output (self, other,"Info_Nefarius_Stones_04_12"); //W porz¹dku, oddam Ci kamienie, ale pod jednym warunkiem.
	AI_Output (other, self,"Info_Nefarius_Stones_15_13"); //Czego ¿¹dasz w zamian?
	AI_Output (self, other,"Info_Nefarius_Stones_04_14"); //Jestem pewien, ¿e na terenie obecnej Kolonii Karnej ukryto coœ niezwykle wartoœciowego.
	AI_Output (self, other,"Info_Nefarius_Stones_04_15"); //Jest to skarb o niewyobra¿alnej wartoœci, spuœcizna wielu narodów, dzie³o, które samym swym istnieniem wprawia w zachwyt tego, kto choæ raz na nie spojrzy!
	AI_Output (other, self,"Info_Nefarius_Stones_15_16"); //Co to za... skarb?
	AI_Output (self, other,"Info_Nefarius_Stones_04_17"); //Tego zdradziæ nie mogê. Ale odkryjê przed Tob¹ jedn¹ z tajemnic jego ukrycia.
	AI_Output (self, other,"Info_Nefarius_Stones_04_18"); //Pomo¿esz mi?
	AI_Output (self, other,"Info_Nefarius_Stones_04_19"); //W zamian za kamienie ogniskuj¹ce?
	AI_Output (self, other,"Info_Nefarius_Stones_04_20"); //Tak. Wiêc jak bêdzie?
	
   B_LogEntry(CH4_RBL_FocusStones, "Nefarius odda mi kamienie ogniskuj¹ce w zamian za pomoc w odnalezieniu jakiegoœ legendarnego skarbu. Kto wie, mo¿e upiekê dwie pieczenie przy jednym ogniu?");
};

// ****************************

instance  Info_Nefarius_Treasure (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	6;
	condition	=	Info_Nefarius_Treasure_Condition;
	information	=	Info_Nefarius_Treasure_Info;
	permanent	= 	0;
	important 	=	0;
	description =	"Zgoda, pomogê Ci w odnalezieniu skarbu.";
};                       

FUNC int  Info_Nefarius_Treasure_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Stones))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Treasure_Info()
{
	AI_Output (other, self,"Info_Nefarius_Treasure_15_00"); //Zgoda, pomogê Ci w odnalezieniu skarbu.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_01"); //Pomo¿esz nie tylko mi przyjacielu, ale ca³ej ludzkoœci.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_02"); //Od czego mam zacz¹æ?
	AI_Output (self, other,"Info_Nefarius_Treasure_04_03"); //Musisz odnaleŸæ pozosta³e czêœci tej mapy. Wiem tylko, ¿e mog¹ byæ rozsiane po ca³ej Kolonii.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_04"); //Ktoœ zada³ sobie sporo trudu, aby zniszczyæ mapê i ukryæ jej kawa³ki. Dlaczego po prostu nie spali³ pergaminu?
	AI_Output (self, other,"Info_Nefarius_Treasure_04_05"); //Tego nie wiem, ale wieœæ niesie, ¿e mapy nie mo¿na zniszczyæ. Kiedyœ spróbowa³em j¹ podpaliæ, zala³em wod¹ i nic. Nie ma nawet œladu zniszczenia czy zabrudzenia.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_06"); //Magiczna mapa wskazuj¹ca miejsce ukrycia niewyobra¿alnego skarbu... Hmm, brzmi ciekawie. Wchodzê w to.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_07"); //Dokona³eœ m¹drego wyboru. PrzyjdŸ do mnie, kiedy zbierzesz pozosta³e siedem kawa³ków mapy.
	AI_Output (self, other,"Info_Nefarius_Treasure_04_08"); //Ten weŸ na wzór.
	
   CreateInvItems (self,treasure_piece1,1);
	B_GiveInvItems (self, other,treasure_piece1, 1);
	
   AI_Output (self, other,"Info_Nefarius_Treasure_04_09"); //Powodzenia w poszukiwaniach. Niech Adanos Ci sprzyja, przyjacielu.
	AI_Output (other, self,"Info_Nefarius_Treasure_15_10"); //Bez obrazy, ale wola³bym, ¿eby ¿aden bóg nie wtyka³ w to swojego nosa. Bywaj.

	Log_CreateTopic(CH4_Mag_Treasure, LOG_MISSION);
	Log_SetTopicStatus(CH4_Mag_Treasure, LOG_RUNNING);
	B_LogEntry(CH4_Mag_Treasure, "Odnajdê dla Nefariusa pozosta³e siedem kawa³ków mapy wskazuj¹cej miejsce ukrycia niewyobra¿alnego skarbu. Kawa³ki mapy mog¹ byæ rozsiane po ca³ej Kolonii.");
};

// ****************************

var int nefar_prepare;

instance  Info_Nefarius_AllPieces (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	7;
	condition	=	Info_Nefarius_AllPieces_Condition;
	information	=	Info_Nefarius_AllPieces_Info;
	permanent	= 	0;
	important 	=	0;
	description =	"Odnalaz³em wszystkie kawa³ki mapy!";
};                       

FUNC int  Info_Nefarius_AllPieces_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Treasure))&&(NPC_HasItems(hero,treasure_piece1)>=1)&&(NPC_HasItems(hero,treasure_piece2)>=1)&&(NPC_HasItems(hero,treasure_piece3)>=1)&&(NPC_HasItems(hero,treasure_piece4)>=1)&&(NPC_HasItems(hero,treasure_piece5)>=1)&&(NPC_HasItems(hero,treasure_piece6)>=1)&&(NPC_HasItems(hero,treasure_piece7)>=1)&&(NPC_HasItems(hero,treasure_piece8)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_AllPieces_Info()
{
	nefar_prepare = B_SetDayTolerance()+1;
	
   AI_Output (other, self,"Info_Nefarius_AllPieces_15_00"); //Odnalaz³em wszystkie kawa³ki mapy!
	AI_Output (self, other,"Info_Nefarius_AllPieces_04_01"); //To wspania³a nowina! Daj mi fragmenty.
	
   B_GiveInvItems (other, self, treasure_piece1, 1);
	B_GiveInvItems (other, self, treasure_piece2, 1);
	B_GiveInvItems (other, self, treasure_piece3, 1);
	B_GiveInvItems (other, self, treasure_piece4, 1);
	B_GiveInvItems (other, self, treasure_piece5, 1);
	B_GiveInvItems (other, self, treasure_piece6, 1);
	B_GiveInvItems (other, self, treasure_piece7, 1);
	B_GiveInvItems (other, self, treasure_piece8, 1);

	Npc_RemoveInvItems(self,treasure_piece1,1);
	Npc_RemoveInvItems(self,treasure_piece2,1);
	Npc_RemoveInvItems(self,treasure_piece3,1);
	Npc_RemoveInvItems(self,treasure_piece4,1);
	Npc_RemoveInvItems(self,treasure_piece5,1);
	Npc_RemoveInvItems(self,treasure_piece6,1);
	Npc_RemoveInvItems(self,treasure_piece7,1);
	Npc_RemoveInvItems(self,treasure_piece8,1);
	
   AI_Output (self, other,"Info_Nefarius_AllPieces_04_02"); //Nie traæmy czasu, natychmiast zabiorê siê do scalenia mapy.
	AI_Output (self, other,"Info_Nefarius_AllPieces_04_03"); //Wróæ jutro, wtedy wybierzemy siê na poszukiwania skarbu!

	B_LogEntry(CH4_Mag_Treasure, "Odda³em Nefariusowi wszystkie kawa³ki mapy. Mam czekaæ do jutra na z³o¿enia tego do kupy. A póŸniej wyprawa po bogactwa i s³awê!");
};

// ****************************

instance  Info_Nefarius_Go (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	8;
	condition	=	Info_Nefarius_Go_Condition;
	information	=	Info_Nefarius_Go_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Go_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_AllPieces))&&(nefar_prepare <= Wld_GetDay())&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Go_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	
   AI_Output (self, other,"Info_Nefarius_Go_04_01"); //Dobrze, ¿e jesteœ. Mapa ju¿ gotowa. Sam zobacz.
	
   CreateInvItems (self,treasure_map,1);
	B_GiveInvItems (self, other, treasure_map, 1);
	B_UseFakeScroll(other);
	
   AI_Output (other, self,"Info_Nefarius_Go_15_02"); //Tak, wiem, gdzie to jest.
	AI_Output (self, other,"Info_Nefarius_Go_04_03"); //ProwadŸ wiêc, ja marnie orientujê siê w terenie.
	
   B_LogEntry(CH4_Mag_Treasure, "Dosta³em mapê z lokalizacj¹ skarbu od Nefariusa. Mam tam zaprowadziæ maga i wykopaæ skarb. Mam nadziejê, ¿e to nie jest pu³apka.");

	Party_AddNpc(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	B_StopProcessInfos(self); 
};

// ****************************

instance Info_Nefarius_Get (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	9;
	condition	=	Info_Nefarius_Get_Condition;
	information	=	Info_Nefarius_Get_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Get_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Go))&&(Npc_GetDistToWP (self,"MOVEMENT_ORCGRAVEYARD4") < 500 )
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Get_Info()
{
   wld_insertItem(treasure_statu, "MOVEMENT_ORCGRAVEYARD4");
   Wld_InsertItem(ItMi_NuggetSack_03, "MOVEMENT_ORCGRAVEYARD4");
   Wld_InsertItem(ItMi_GoldRing, "MOVEMENT_ORCGRAVEYARD4");
   
	B_FullStop (hero);
	AI_GotoNpc(self, other);
	AI_TurnToNpc(other, self);
	
   AI_Output (other, self,"Info_Nefarius_Get_15_01"); //To tutaj!
	AI_Output (self, other,"Info_Nefarius_Get_04_02"); //Na co czekasz? Kop!
	
   B_LogEntry(CH4_Mag_Treasure, "ZnaleŸliœmy miejsce z zakopanym skarbem! Czas wykopaæ te bogactwa!");
	B_StopProcessInfos(self);
	AI_GotoWP(other,	"MOVEMENT_ORCGRAVEYARD4");
	AI_AlignToWP(other);
	AI_PlayAni(other,	"T_PLUNDER");
};

// ****************************

/************
Ork wymyœl co to za skarb ma byæ: tunika, pos¹¿ek czy jakaœ ksiêga i wrzuæ tu do skryptu. Co do reszty to dodaj coœ unikatowego dla gracza
**************/

instance  Info_Nefarius_Success (C_INFO)
{
	npc		=	KDW_603_Nefarius;
	nr		=	10;
	condition	=	Info_Nefarius_Success_Condition;
	information	=	Info_Nefarius_Success_Info;
	permanent	= 	0;
	important 	=	1;
	description =	"";
};                       

FUNC int  Info_Nefarius_Success_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Get))&&(Npc_GetDistToNpc(self,hero) < 1500)&&(NPC_HasItems(hero,treasure_statu)>=1)
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_Success_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(self, other);
   
	AI_Output (self, other,"Info_Nefarius_Success_04_01"); //Znalaz³eœ skarb?!
	AI_Output (other, self,"Info_Nefarius_Success_15_02"); //Ekhm. Jaki skarb? Tam nie by³o nic po co warto siê schyliæ!
	AI_Output (self, other,"Info_Nefarius_Success_04_03"); //Masz to! Czujê aurê artefaktu! Daj mi to natychmiast.
	
   B_GiveInvItems (other, self, treasure_statu, 1);
	Npc_RemoveInvItems(self,treasure_statu,1);
	
   AI_Output (self, other,"Info_Nefarius_Success_04_04"); //Odnalezione po tylu latach! To cudowne!
	AI_Output (self, other,"Info_Nefarius_Success_04_05"); //Niech imiê Adaonsa nigdy nie zostanie zapomniane.
	AI_Output (self, other,"Info_Nefarius_Success_04_06"); //Wiele uczyni³eœ dla Krêgu Wody. Oto twoja nagroda.
	
   CreateInvItems (self,Focus_2,1);
	B_GiveInvItems (self, other, Focus_2, 1);
	CreateInvItems (self,Focus_3,1);
	B_GiveInvItems (self, other, Focus_3, 1);
	CreateInvItems (self,Focus_4,1);
	B_GiveInvItems (self, other, Focus_4, 1);
	CreateInvItems (self,Focus_5,1);
	B_GiveInvItems (self, other, Focus_5, 1);
   
	AI_Output (other, self,"Info_Nefarius_Success_15_07"); //Ale to tylko cztery kamienie!
	AI_Output (self, other,"Info_Nefarius_Success_04_08"); //Przykro mi, wiêcej nie mam. 
	AI_Output (self, other,"Info_Nefarius_Success_04_09"); //Pamiêtaj jednak, ¿e te artefakty zosta³y dodatkowo nasycone moc¹ rytua³u, podczas tworzenia bariery.
	AI_Output (self, other,"Info_Nefarius_Success_04_10"); //Byæ mo¿e wystarcz¹ do przywrócenia mieczowi runicznemu dawnej œwietnoœci.
	AI_Output (other, self,"Info_Nefarius_Success_15_11"); //Obyœ mia³ racjê. Bywaj, magu.
	AI_Output (self, other,"Info_Nefarius_Success_04_12"); //Powodzenia, przyjacielu. Czas wracaæ do Saturasa z dobr¹ nowin¹!
	
   B_LogEntry(CH4_RBL_FocusStones, "Mam kamienie ogniskuj¹ce. Czas porozmawiaæ z Miltenem.");
	Log_SetTopicStatus(CH4_Mag_Treasure, LOG_SUCCESS);
	B_LogEntry(CH4_Mag_Treasure, "Odnalaz³em ten pseudo-skarb. Gdybym wiedzia³, co tam zakopano, pewnie da³bym sobie spokój z szukaniem. Ano ¿ycie...");
	B_StopProcessInfos(self); 
	Party_RemoveNpc(self);
	Npc_ExchangeRoutine(self,"START");
};
