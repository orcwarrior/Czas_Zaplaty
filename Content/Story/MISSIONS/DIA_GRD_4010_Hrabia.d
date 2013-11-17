// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Hrabia_Exit (C_INFO)
{
	npc			= GRD_4010_Hrabia;
	nr			= 999;
	condition	= DIA_Hrabia_Exit_Condition;
	information	= DIA_Hrabia_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hrabia_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Hrabia_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_Kasacz_Exit (C_INFO) //dla K¹sacza
{
	npc			= Grd_2513_Kasacz;
	nr			= 999;
	condition	= DIA_Kasacz_Exit_Condition;
	information	= DIA_Kasacz_Exit_Info;
	important	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kasacz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kasacz_Exit_Info()
{
	B_StopProcessInfos(self);
   
   self.guild = GIL_DMB;
      
   Npc_ExchangeRoutine(self, "ATTACK");
   Npc_SetPermAttitude(self, ATT_HOSTILE);
};

INSTANCE DIA_Hrabia_Ore (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 20;
	condition		= DIA_Hrabia_Ore_Condition;
	information		= DIA_Hrabia_Ore_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_Ore_Condition()
{
	if ((Npc_KnowsInfo (hero, DIA_Pacho_OreEnd))||(Npc_KnowsInfo (hero, DIA_Scorpio_AfterDig)))&&(NPC_HasItems(hero,gomez_mirror)>=1)&&(Npc_GetDistToWP (self,"OW_PATH_MIS_PACHO_TREASURE") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_Ore_Info()
{
	var C_NPC pacho; pacho = Hlp_GetNpc(GRD_224_PACHO);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_01"); //Chyba nie przeszkadzam.
	AI_TurnToNpc(other, self);
	AI_TurnToNpc(pacho, self);

	AI_Output (other, self, "DIA_Hrabia_Ore_15_02"); //Kim Ty do cholery jesteœ?
	AI_Output (self, other, "DIA_Hrabia_Ore_11_03"); //Powiedzmy, ¿e nikim wa¿nym.
	AI_Output (self, other, "DIA_Hrabia_Ore_11_04"); //Zdaje siê, ¿e macie coœ, co do was nie nale¿y.
	AI_TurnToNpc(self, other);
	AI_TurnToNpc(self, pacho);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_05"); //Trochê zajê³o mi odnalezienie w³aœciwego tropu, ale w Kolonii nawet drzewa maj¹ oczy i uszy.
	AI_GotoNpc(self,other);
	AI_Output (self, other, "DIA_Hrabia_Ore_11_06"); //A teraz grzecznie oddacie rudê. Tylko bez gwa³townych ruchów, nie chcê zapapraæ sobie krwi¹ pancerza.
	
   B_GiveInvItems (other, self, ItMiNugget, NPC_HasItems(other,ItMiNugget));
	Npc_RemoveInvItems(self, ItMiNugget, NPC_HasItems(self,ItMiNugget));
   
	AI_Output (self, other, "DIA_Hrabia_Ore_11_07"); //Lusterko te¿ wezmê.
	B_GiveInvItems (other, self,gomez_mirror,1);
	Npc_RemoveInvItems(self,gomez_mirror,1);

	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Hrabia_Ore_15_08"); //Nikt nie bêdzie mnie bezkarnie okrada³!
	AI_Output (self, other, "DIA_Hrabia_Ore_11_09"); //W ustach z³odzieja brzmi to zgo³a zabawnie.
	AI_Output (self, other, "DIA_Hrabia_Ore_11_10"); //Zdaje siê, ¿e nie tylko ja zwêszy³em ³atwy ³up.

	AI_Output (self, other, "DIA_Hrabia_Ore_11_11"); //Nie bêdê przeszkadza³ w zabawie.
	AI_TurnToNpc(other, self);
	
   AI_Output (self, other, "DIA_Hrabia_Ore_11_12"); //Kto wie, mo¿e jeszcze siê spotkamy. Wtedy dokoñczymy tê rozmowê.
	AI_Output (other, self, "DIA_Hrabia_Ore_15_13"); //Mo¿esz byæ tego pewien!
	
   AI_SetWalkmode(self,NPC_RUN);
	Npc_ExchangeRoutine	(self, "HIDE");	
	AI_SetWalkmode(pacho,NPC_RUN);
	B_ExchangeRoutine	(GRD_224_PACHO, "pachotressurewait4hero");	
	
   if (scorpio_traitor)
	{
		AI_SetWalkmode(skorpio,NPC_RUN);
		B_ExchangeRoutine	(GRD_205_SCORPIO, "pachotressurewait4hero");	
	};
	
   AI_Output (other, self, "DIA_Hrabia_Ore_15_14"); //Œwietnie, znowu muszê radziæ sobie sam...
	
   B_LogEntry(CH1_Rbl_Ore, "Tego ju¿ za wiele. Kiedy wykopa³em rudê pojawi³ siê jakiœ gnojek i najzwyczajniej w œwiecie mi j¹ ukrad³. Do tego znalaz³a siê bestia, która wczeœniej za³atwi³a Pacho. Chyba przestanê wierzyæ w szczêœcie...");
	B_StopProcessInfos(self);
};

INSTANCE DIA_Hrabia_Trap (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 3;
	condition		= DIA_Hrabia_Trap_Condition;
	information		= DIA_Hrabia_Trap_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_Trap_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Jarvis_Help21))//&&(Npc_GetDistToWP (self,"stone_trap") < 1000 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_Trap_Info()
{
	B_FullStop (hero);

	AI_Output (self, other, "DIA_Hrabia_Trap_11_01"); //Znowu siê spotykamy.
	//AI_TurnToNpc(other, self);//dick odwraca siê do hrabiego
	//AI_GotoNpc(self, other);//hrabia podchodzi do dicka
	AI_Output (other, self, "DIA_Hrabia_Trap_15_02"); //Mam coœ w ¿yciu pecha i ci¹gle wdeptujê w to samo gówno.
	AI_Output (self, other, "DIA_Hrabia_Trap_11_03"); //A podobno nie mo¿na wejœæ dwa razy do tej samej rzeki. Wszêdzie Ciê pe³no, mo¿na odnieœæ wra¿enie, ¿e lubisz byæ w centrum zainteresowania.
	AI_Output (other, self, "DIA_Hrabia_Trap_15_04"); //Zdaje siê, ¿e szukamy tego samego.
	AI_Output (self, other, "DIA_Hrabia_Trap_11_05"); //Ale ja ju¿ mam to, po co przyby³em. 
	AI_Output (self, other, "DIA_Hrabia_Trap_11_06"); //Wybacz, obowi¹zki wzywaj¹.
	AI_Output (other, self, "DIA_Hrabia_Trap_15_07"); //Nie odejdziesz st¹d ¿ywy!
	AI_Output (self, other, "DIA_Hrabia_Trap_11_08"); //Czy¿by? Spójrz tam...
	
   AI_TurnToNpc(other, grd_2514);
	Ai_Wait (self, 0.2);
	B_StopProcessInfos	(self);
/****************	
	
	AI_TurnToNpc(other, grd_2516);
	Ai_Wait (self,0.5);
	AI_TurnToNpc(other, grd_2518);
	B_StopProcessInfos	(self);
	
	AI_GotoWP (kasacz, "trap_fight");
	AI_GotoWP (grd_2514, "trap_fight1");
	AI_GotoWP (grd_2515, "trap_fight2");
	AI_GotoWP (grd_2516, "trap_fight3");
	AI_GotoWP (grd_2517, "trap_fight4");
	AI_GotoWP (grd_2518, "trap_fight5");

	Npc_ExchangeRoutine(kasacz,"Prepare");//stoi w miejscu przed walk¹ najlepiej gdzieœ przed dickiem

	/**********
	Maj¹ otoczyæ dicka, ma to wygl¹daæ, ¿e nie ma szans
	**********/

	Npc_ExchangeRoutine(grd_2514,"Wait");
	Npc_ExchangeRoutine(grd_2515,"Wait");
	Npc_ExchangeRoutine(grd_2516,"Wait");
	Npc_ExchangeRoutine(grd_2517,"Wait");
	Npc_ExchangeRoutine(grd_2518,"Wait");

	/***************
	Jarvis ma podejœæ blisko i podczas walki pomóc Dickowi jak odejdzie hrabia
	****************/
};

INSTANCE DIA_Hrabia_TrapEnd (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 3;
	condition		= DIA_Hrabia_TrapEnd_Condition;
	information		= DIA_Hrabia_TrapEnd_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_TrapEnd_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_Trap))
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_TrapEnd_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);

	var C_NPC jar; jar = Hlp_GetNpc(Sld_728_Jarvis);
	Party_AddNpc(jar);

   if (NPC_HasItems(other,orn2)>=1)
   {
      Give_and_remove(orn2, 1);
   };
   
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_01"); //Jak widzisz nie jestem sam i mam drobn¹ przewagê.
	AI_Output (other, self, "DIA_Hrabia_TrapEnd_15_02"); //Kilku z tych skurwieli zabiorê ze sob¹!
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_03"); //W to nie w¹tpiê. Dlatego dam Ci fory.
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_04"); //K¹sacz dostarczy Ci rozrywki.
	//TODO: Really needed?
	//AI_TurnToNpc(other, kasacz);
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_05"); //Na mnie ju¿ czas. 
	//AI_TurnToNpc(other, self);
	AI_Output (other, self, "DIA_Hrabia_TrapEnd_15_06"); //Jeszcze Ciê dopadnê!
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_07"); //Kto wie? Mo¿e kiedyœ skrzy¿ujemy ostrza.
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_08"); //Ale raczej nie tutaj i nie teraz...
	AI_TurnToNpc(self, grd_2514);
	AI_Output (self, other, "DIA_Hrabia_TrapEnd_11_09"); //Ruszamy!
	AI_TurnToNpc(other, kasacz);
	AI_DrawWeapon (kasacz);
	//AI_DrawWeapon (other);
	Npc_SetTarget (kasacz, hero);
	B_LogEntry(CH3_NON_Mercenary, "To by³a pu³apka! Wdepn¹³em w sam œrodek ³ajna. Hrabia uciek³ z kawa³kiem ornamentu, a mnie czeka walka o ¿ycie z jakimœ olbrzymem...");
	B_LogEntry(CH3_NON_Ornament, "Hrabia zabra³ drugi kawa³ek ornamentu i uciek³. Coraz bardziej mnie to intryguje...");	
	B_StopProcessInfos(self);
	
	/*********************
	Odchodz¹ - mo¿e kamerka? Zanim gdzieœ znikn¹ powrót i najazd na k¹sacza
	**********************/
	AI_SetWalkmode(self, NPC_RUN);
	Npc_ExchangeRoutine(self, "HIDE");

	B_ExchangeRoutine(grd_2514,"HIDE");
	B_ExchangeRoutine(grd_2515,"HIDE");
	B_ExchangeRoutine(grd_2516,"HIDE");
	B_ExchangeRoutine(grd_2517,"HIDE");
	B_ExchangeRoutine(grd_2518,"HIDE");
   
	/**********
	Hrabia i stra¿nicy odchodz¹, zsotaje K¹sacz, który ma walczyæ z Dickiem
	**********/
	
	B_ExchangeRoutine(jar,"GUARD1");
	AI_GotoWP(jar, "OW_PATH_225");
	
	AI_DrawWeapon(jar);
	//B_StartAfterDialogFight(jar,kasacz,true);
   
   Hrabia_teleport = true;
};

//CINEMATIC
//DISABLED
/*
INSTANCE DIA_Hrabia_FightCome (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 4;
	condition		= DIA_Hrabia_FightCome_Condition;
	information		= DIA_Hrabia_FightCome_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FightCome_Condition()
{


	if (Npc_KnowsInfo (hero, DIA_Grd2_Alarm))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,orn3)>=1)
	{
		return 1;
	};

};

FUNC VOID DIA_Hrabia_FightCome_Info()
{
	//TODO: Jako kamera z eventami (Sprawdz PrintDialog)
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	B_FullStop (hero);
	AI_TurnToNpc(self, grd2);

	AI_Output (self, grd2, "DIA_Hrabia_FightCome_11_01"); //Co tu siê wyprawia?!
	AI_TurnToNpc(other, weg);
	AI_Output (self, grd2, "DIA_Hrabia_FightCome_11_02"); //Nie mo¿na was nawet na chwilê zostawiæ samych. Wêgorz!
	AI_GotoNpc(weg, self);
	AI_Output (weg, self, "DIA_Hrabia_FightCome_11_03"); //Tak jest!
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_04"); //Zdaje siê, ¿e wyrazi³em siê jasno. Mieliœcie siedzieæ na dupie i pilnowaæ mojej w³asnoœci.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_05"); //Mniejsza z tym. Widzia³em siê z Krukiem, wiem dok³adnie gdzie znajduje siê kolejny fragment.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_06"); //Ktoœ tu siê pa³êta³?
	AI_Output (weg, self, "DIA_Hrabia_FightCome_11_07"); //Nie, panie. Nikogo nie by³o.
	AI_Output (self, weg, "DIA_Hrabia_FightCome_11_08"); //To œwietnie. Czas sprawdziæ czy ornament jest na swoim miejscu...
	B_LogEntry		(CH3_NON_Ornament, "Kruk? Najwidoczniej to magnat stoi za tym wszystkim, to on wysy³a Hrabiego tam gdzie s¹ ukryte ornamenty. Ale sk¹d wie o ich lokalizacji? I po co mu te kamole?");
	B_StopProcessInfos	(self);
	
	/***********************
	Hrabia podchodzi do skrzyni ukrytej gdzieœ za jakimœ g³azem w krzakach i sprawdza czy coœ w niej jest
	Stra¿nicy id¹ za nim i w oddaleniu ustawiaj¹ siê w krêgu patrz¹c na niego
	**********************/
/*
	AI_GotoWP (self, "ornament3_hide");
	AI_GotoWP (grd1, "g1");
	AI_GotoWP (grd2, "g2");
	AI_GotoWP (grd3, "g3");
	AI_GotoWP (grd4, "g4");
	AI_GotoWP (grd5, "g5");
	AI_GotoWP (weg, "g6");

	AI_AlignToWP		(self);
	AI_AlignToWP		(grd1);
	AI_AlignToWP		(grd2);
	AI_AlignToWP		(grd3);
	AI_AlignToWP		(grd4);
	AI_AlignToWP		(grd5);
	AI_AlignToWP		(weg);

	AI_PlayAni			(self,	"T_PLUNDER");
};*/

INSTANCE DIA_Hrabia_FindThief (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 5;
	condition		= DIA_Hrabia_FindThief_Condition;
	information		= DIA_Hrabia_FindThief_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FindThief_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wegorz_First))&&(Npc_GetDistToNpc(self,hero) < 4500)&&(NPC_HasItems(hero,orn3)>=1)&&(Npc_GetDistToWP (other,"NEWPATH_4") < 500 )
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_FindThief_Info()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);

	//TODO: Event z kamerka, jak w powyzszym dialogu
	B_FullStop (hero);
	AI_TurnToNpc(self, weg);

	AI_Output (self, null, "DIA_Hrabia_FindThief_11_01"); //To niemo¿liwe! Ornament znikn¹³...
	
	B_StopProcessInfos(self);
	AI_GotoWP(other, "NEWPATH_4");
};

INSTANCE DIA_Hrabia_FindThief1 (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 5;
	condition		= DIA_Hrabia_FindThief1_Condition;
	information		= DIA_Hrabia_FindThief1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_FindThief1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Hrabia_FindThief))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(hero,orn3)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_FindThief1_Info()
{
	var C_NPC weg; weg = Hlp_GetNpc(Grd_2519_Wegorz);
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	AI_PlayAni (self, "T_SEARCH");
	AI_Output (self, null, "DIA_Hrabia_FindThief1_11_02"); //Widzê œwie¿e œlady. Ktoœ siê tu zakrad³ idioci, kiedy wy ok³adaliœcie siê ¿elastwem...
	AI_TurnToNpc (self, hero);
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_03"); //Tam jest!

	/***********************

	Ork wklej tu animacjê strzelanie z kuszy tam chyba jest wskazywanie rêk¹, albo coœ podobnego, ¿e hrabia niby wskazuje kierunek
	*************************/
	AI_TurnToNpc(grd1, hero);
	AI_TurnToNpc(grd2, hero);
	AI_TurnToNpc(grd3, hero);
	AI_TurnToNpc(grd4, hero);
	AI_TurnToNpc(grd5, hero);
	AI_TurnToNpc(weg, hero);
	AI_DrawWeapon		(grd1);
	AI_DrawWeapon		(grd2);
	AI_DrawWeapon		(grd3);
	AI_DrawWeapon		(grd4);
	AI_DrawWeapon		(grd5);
	AI_DrawWeapon		(weg);
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_04"); //To znowu Ty! Za czêsto wtykasz nos w nieswoje sprawy.
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_05"); //A to bardzo niebezpieczna przywara.
	AI_Output (other, self, "DIA_Hrabia_FindThief1_15_06"); //Skóry tanio nie sprzedam!
	AI_Output (self, other, "DIA_Hrabia_FindThief1_11_07"); //Zdaje siê, ¿e ju¿ to s³ysza³em. Zabijcie go ch³opcy, bo Kruk urwie wam jaja!
	AI_DrawWeapon		(other);
	B_StopProcessInfos	(self);
   
   Saturas_saves_Rick = true;
};

INSTANCE DIA_Hrabia_LastOrn (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 6;
	condition		= DIA_Hrabia_LastOrn_Condition;
	information		= DIA_Hrabia_LastOrn_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_LastOrn_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Wegorz_First1))&&(Npc_GetDistToNpc(self,hero) < 500)&&(map4_readbydick == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_LastOrn_Info()
{
	ornament_wait = B_SetDayTolerance()+3;

	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_01"); //Znowu siê spotykamy...
	AI_GotoNpc(self, other);
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_02"); //Tym razem mi nie uciekniesz!
	AI_DrawWeapon(other);
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_03"); //Schowaj ¿elazo, zanim komuœ stanie siê krzywda.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_04"); //Poza tym z tego co pamiêtam, to Ty ostatnio rozp³yn¹³eœ siê w oœlepiaj¹cym œwietle magicznej aury...
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_05"); //Tym razem ornament te¿ bêdzie mój! Ale najpierw wyprujê Ci flaki.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_06"); //Spokojnie. Przyby³eœ za póŸno, ornamentu ju¿ tutaj nie ma. Ale nadal posiadasz kawa³ek, którego potrzebujê.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_07"); //Jesteœ idiot¹, je¿eli myœlisz, ¿e mam go przy sobie.	
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_08"); //Dlatego mam dla Ciebie propozycjê. Lub raczej dla tych, którzy posy³aj¹ Ciê na te samobójcze misje.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_09"); //Nie jestem psem na posy³ki. Powiedzmy, ¿e sp³acam d³ug za przyjaciela.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_10"); //Mnie nie oszukasz. Obaj jesteœmy tutaj, bo ktoœ tego chcia³. Czy nam siê to podoba czy nie, obaj jesteœmy tylko narzêdziami.
	AI_RemoveWeapon (other);
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_11"); //Co proponujesz?
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_12"); //Oddacie ornament i ju¿ wiêcej siê nie zobaczymy. To bezpieczny i bezkrwawy kompromis dla obu stron.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_13"); //A je¿eli nie osi¹gniemy... konsensusu?
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_14"); //Przeszukam Koloniê. Prêdzej b¹dŸ póŸniej, znajdê twoich mocodawców i wyrwê im ornament razem z co wa¿niejszymi narz¹dami.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_15"); //Wybór nale¿y do nich. Dajê wam trzy dni. Wêgorz bêdzie tu czeka³ na ornamenty.
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_16"); //Przeka¿ê im twoje s³owa. Ale potem skoñczê to, co zacz¹³em...
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_17"); //Zaszczytem bêdzie dla mnie skrzy¿owaæ z Tob¹ miecz, je¿eli zajdzie taka koniecznoœæ.
	AI_Output (self, other, "DIA_Hrabia_LastOrnf_11_18"); //Co to?
	AI_Output (other, self, "DIA_Hrabia_LastOrnf_15_19"); //Cholera, znowu te pieprzone czary...

	B_LogEntry(CH3_NON_Ornament, "Znowu siê spóŸni³em! Hrabia zdoby³ ostatni ornament, ale magowie nadal maj¹ jeden kawa³ek. Mam im przekazaæ, ¿e je¿eli w ci¹gu trzech dni dobrowolnie zwróc¹ ornament, to Hrabia i jego ludzie ju¿ wiêcej nam nie zagro¿¹. Ale je¿eli odmówi¹ to czeka ich œmieræ. Musz¹ przekazaæ to Saturasowi.");
	B_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"castle");//najwy¿szy czas, ¿eby hrabia wróci³ do zamku o ile bêdzie ten zamek

	/***********************

	Ork znowu tp do Saturasa, chodzi o to, ¿eby zmieœciæ siê w tych 3 dniach bo i magom i hrabiemu z krukiem na tym zale¿y
	
	AI_Teleport  (other, "SATURAS");
	************************/
};

//****************************************

/***********************************************

Ork Hrabia ma byæ gdzieœ zamkniêty w jakiejœ komnacie. Na dziedziñcu w orlim gnieŸdzie ma siê szlajaæ jakiœ wkurwiony wielki demon, pupilek Kruka. Przy ciele demona znajdzie siê jego serce-klucz umo¿liwiaj¹cy wejœcie tam gdzie Kruk zamkn¹³ Hrabiego.
Mo¿esz dodaæ po drodze kilka mniejszych demonów, które przywo³a³ kruk.
Idealnie by³oby gdyby da³o siê gadaæ przez zamkniête drzwi ale nie wiem czy tak siê da zrobiæ - jak bêdziesz poprawia³ te skrypty to daj znaæ wtedy siê to zmieni ewentualnie.
Ko³owrót od bramy jest zepsuty, nie da siê jej podnieœæ, mo¿ena tu wejœæ/wyjœæ tylko poprzez teleportacjê. Kruk celowo tak to urz¹dzi³, bo w³aœnie st¹d ma zamiar wyrwaæ siê z kolonii.

*********************************************/

INSTANCE DIA_Hrabia_TheRock (C_INFO)
{
	npc				= GRD_4010_Hrabia;
	nr				= 7;
	condition		= DIA_Hrabia_TheRock_Condition;
	information		= DIA_Hrabia_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Hrabia_TheRock_Condition()
{
	//Duck_tp what is this?
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1000)//&&(duck_tp == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Hrabia_TheRock_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_01"); //Nawet tutaj mnie znalaz³eœ, godna podziwu determinacja.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_02"); //Ja zawsze sp³acam d³ugi. Dam ci jednak wybór.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_03"); //Wybór? Wydaje Ci siê, ¿e ktokolwiek z nas ma jakiœ wybór?
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_04"); //Robiê tylko to, co zechcê, sam kujê w³asny los.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_05"); //Tak Ci siê tylko wydaje. Ktoœ przêdzie sieæ, w któr¹ wpadamy. Ka¿dy z nas pod¹¿a tak¹ drgaj¹c¹ nitk¹, a na koñcu czyha bestia, dla której jesteœmy tylko kolejn¹ przek¹sk¹.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_06"); //Akurat teraz zebra³o ci siê na rozwa¿ania egzystencjonalne.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_07"); //Proszê tylko, ¿ebyœ wys³ucha³ pewnej opowieœci. PóŸniej zrobisz, co uwa¿asz za stosowne.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_08"); //Niech bêdzie, mów.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_09"); //Nie trafi³em do Kolonii przez przypadek. Przyby³em tu w okreœlonym celu.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_10"); //Tak, wiem. Ty i Kruk to niszczycielski tandem.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_11"); //Masz racjê, od zawsze tak by³o. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_12"); //Jednak kiedyœ mieliœmy inne cele. Chcieliœmy lepszego ¿ycia, szacunku i w³adzy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_13"); //Uda³oby siê, gdyby nie zach³annoœæ Kruka. Na szczêœcie tylko on trafi³ do Kolonii.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_14"); //A ty?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_15"); //Dalej prowadzi³em interesy gildii Cienia.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_16"); //Co to za gildia?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_17"); //To nie twoja sprawa. Jedyne co musisz wiedzieæ to fakt, ¿e interesy gildii siêgaj¹ tak¿e do tej zawszonej Kolonii.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_18"); //Dlatego zgodzi³em siê na zes³anie. Moim celem jest Kruk, nikt inny.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_19"); //Rozumiem, ¿e wszyscy którzy zginêli po drodze, to tylko przypadkowe ofiary waszych matactw.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_20"); //Najwiêksze ofiary na wojnie ponosz¹ niewinni, to naturalna kolej rzeczy. 
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_21"); //OszczêdŸ mi tej nadêtej gadki. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_22"); //Kruk musi zgin¹æ, a ja mia³em wykonaæ wyrok.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_23"); //I dlatego siê z nim ponownie zbrata³eœ, rozwi¹zywa³eœ jego problemy i zabija³eœ jego wrogów?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_24"); //To czêœæ planu. Musia³em zdobyæ pe³ne zaufanie Kruka, ¿eby dowiedzieæ siê wszystkiego, co wie i co zamierza.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_25"); //Powiedzmy, ¿e ci wierzê. Co dalej?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_26"); //Kruk zajmowa³ w gildii wysokie stanowisko. Niestety za póŸno wysz³o na jaw, ¿e jego obsesj¹ sta³y siê ukryte œwi¹tynie Beliara.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_27"); //Kruk znikn¹³ na kilka miesiêcy. Kiedy wróci³ nie by³ ju¿ tym samym cz³owiekiem. To znaczy nadal by³ wrednym skurwielem, ale w jego oczach... 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_28"); //Myœleliœmy, ¿e to zal¹¿ek szaleñstwa. Jednak teraz jestem pewien, ¿e to wp³yw Beliara.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_29"); //Gildia zaczê³a odczuwaæ skutki tej obsesji, kiedy kolejni cz³onkowie ginêli w niewyjaœnionych okolicznoœciach.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_30"); //Kruk i jego nowy Pan, chcieli przej¹æ gildiê, aby wykorzystaæ jej wp³ywy do w³asnych celów.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_31"); //Jedna z g³ównych zasad gildii mówi - ¿adnych boskich koneksji!
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_32"); //Wyrok zapad³, ale musieliœmy to przeprowadziæ bardzo starannie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_33"); //Zes³anie do Kolonii by³o najmniejszym problemem. Chocia¿ teraz wiem, ¿e Kruk domyœli³ siê, kto za tym stoi.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_34"); //Nie nabra³ siê na nalot i przypadkowe uwiêzienie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_35"); //Drugim etapem mia³em byæ ja.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_36"); //Od zawsze byliœmy blisko. Po³¹czy³ nas wspólny wróg - Myrtana.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_37"); //Moje imiê to tak¿e tytu³. Kiedyœ w³ada³em sporym hrabstwem na pó³nocnych rubie¿ach.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_38"); //Ale pewnego dnia królewski gubernator zarekwirowa³ mój maj¹tek, jak to uj¹³ 'na potrzeby machiny wojennej', a ja zosta³em z workiem bezwartoœciowych weksli wojskowych.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_39"); //Z Krukiem spotkaliœmy siê po raz pierwszy na trakcie, kiedy próbowa³ mnie obrabowaæ. NieŸle mu wtedy z³oi³em skórê.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_40"); //Nie wiem, jak to siê sta³o, w ka¿dym razie skoñczyliœmy zalani w trupa w jakieœ ober¿y, której w³aœciciela obwiesiliœmy na szyldzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_41"); //Jakiœ czas póŸniej do³¹czyliœmy do gildii. Wtedy nasze drogi siê rozesz³y.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_42"); //Ja zajmowa³em siê wykonywaniem zleceñ, Kruk ich wyszukiwaniem.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_43"); //Po co mi to wszystko mówisz?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_44"); //Chcê, ¿ebyœ zrozumia³, ¿e nie jestem Twoim wrogiem. Wykonujê tylko zadanie, które mi zlecono.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_45"); //Co nie zmienia faktu, ¿e zbyt czêsto stawa³eœ mi na drodze.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_46"); //Wiem, ale z tego powodu akurat siê cieszê.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_47"); //Nie rozumiem.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_48"); //Okaza³eœ siê mi³ym urozmaiceniem, w koñcu trafi³em na godnego siebie przeciwnika.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_49"); //Teraz to mnie wzruszy³eœ. Co by³o dalej?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_50"); //Kruk mnie przejrza³.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_51"); //To dlaczego Ciê nie zabi³?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_52"); //By³em u¿ytecznym narzêdziem. Wiesz jak to mówi¹, wrogów lepiej trzymaæ bli¿ej ni¿ przyjació³. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_53"); //Kruk szuka³ œwi¹tyni ukrytej na tej wyspie i dopi¹³ swego.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_54"); //Nie wiem, jak uda³o mu siê to pod nosem orków, ale zdoby³ pomoc potê¿nego demona, uwiêzionego gdzieœ w orkowej œwi¹tyni.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_55"); //S³ugi Kruka to prezent od tej Bestii. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_56"); //Orle Gniazdo nie przypadkiem wzniesiono w miejscu, gdzie powsta³a wyrwa w barierze. To kolejny dar od demona.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_57"); //Czyli Kruk odnalaz³ sposób na sforsowanie bariery?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_58"); //Tak, a ja spróbowa³em mu w tym przeszkodziæ.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_59"); //Dowiedzia³em siê ju¿ wszystkiego, na czym zale¿a³o gildii. Niestety trochê mnie ponios³o.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_60"); //Chcia³em dokopaæ Krukowi w momencie jego chwa³y. Nie doceni³em go. 
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_61"); //Nie wiem, kiedy mnie przejrza³. Byæ mo¿e, od pocz¹tku wiedzia³, dlaczego siê tutaj znalaz³em.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_62"); //Dziwiê siê tylko, ¿e tyle mi powiedzia³.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_63"); //By³ pewien, ¿e nie po¿yjesz wystarczaj¹co d³ugo, ¿eby o tym opowiedzieæ.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_64"); //Te¿ tak myœlê. W tej chwili zale¿y mi tylko na jednym - na œmierci Kruka.
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_65"); //Dlaczego mia³bym uwierzyæ w t¹ opowieœæ?
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_66"); //Bo by³a za d³uga, ¿ebym wymyœli³ j¹ na poczekaniu?
	AI_Output (other, self, "DIA_Hrabia_TheRock_15_67"); //Powiedzmy, ¿e mnie przekona³eœ. Co dalej? Bo chyba nie opowiedzia³eœ mi tego tylko po to, ¿eby zrzuciæ kamieñ z serca.
	AI_Output (self, other, "DIA_Hrabia_TheRock_11_68"); //Chcê, ¿ebyœ pomóg³ mi w pozbyciu siê Kruka. Jestem pewien, ¿e Ty tak¿e na tym skorzystasz.

	Info_ClearChoices (DIA_Hrabia_TheRock);
	Info_AddChoice (DIA_Hrabia_TheRock, "Mam ju¿ doœæ twoich gierek - giñ!", DIA_Hrabia_TheRock_Kill);
	Info_AddChoice (DIA_Hrabia_TheRock, "Dlaczego mia³bym Ci zaufaæ?", DIA_Hrabia_TheRock_Why);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Kill()
{
	AI_Output (other, self, "DIA_Hrabia_TheRock_Kill_15_01"); //Mam ju¿ doœæ twoich gierek - giñ!
	AI_Output (self, other, "DIA_Hrabia_TheRock_Kill_11_02"); //To twój wybór, ale uszanujê go. Niech wygra lepszy.
	Log_SetTopicStatus(CH1_Rbl_Hrabia, LOG_SUCCESS);
	B_LogEntry(CH1_Rbl_Hrabia, "Mam ju¿ doœæ gierek Hrabiego. Czas siê go pozbyæ na zawsze!");

	B_LogEntry(CH5_NC_TheRock, "Hrabia opowiedzia³ mi historiê swojego ¿ycia. Lee pewnie z zainteresowaniem wys³ucha opowieœci o Kruku i jego martwym ju¿ przyjacielu - Hrabim.");

	B_StopProcessInfos(self); 
	B_StartAfterDialogFight(self,other,true);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Why()
{
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_15_01"); //Dlaczego mia³bym Ci zaufaæ?
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_02"); //Przecie¿ nic na tym nie tracisz. W ka¿dej chwili mo¿esz mnie zabiæ.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_15_03"); //Albo ty mnie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_04"); //Taka mo¿liwoœæ tak¿e istnieje.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_11_05"); //Wiêc jaka jest Twoja decyzja?

	Info_ClearChoices (DIA_Hrabia_TheRock);
	Info_AddChoice (DIA_Hrabia_TheRock, "Mam ju¿ doœæ twoich gierek - giñ!", DIA_Hrabia_TheRock_Kill);
	Info_AddChoice (DIA_Hrabia_TheRock, "Niech bêdzie.", DIA_Hrabia_TheRock_Why_Ok);
};

// ----------------------------------------------------------------

FUNC VOID DIA_Hrabia_TheRock_Why_Ok()
{
	Hrabia_RavenTrap = TRUE;
   
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_01"); //Niech bêdzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_02"); //Chcesz czy nie, ale jesteœmy ulepieni z tej samej gliny.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_03"); //Nie szukam przyjaciela. Mów, jak chcesz za³atwiæ Kruka.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_04"); //Po pierwsze Kruk jest pewien, ¿e nadal jestem zamkniêty w GnieŸdzie.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_05"); //Po drugie ma teraz inne sprawy na g³owie. ¯eby siê st¹d ulotniæ, musi zmusiæ jakiegoœ maga do przeprowadzenia rytua³u.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_06"); //Ten kamieñ teleportuj¹cy to tak¿e Ÿród³o mocy. Z tego co wiem, Kruk ma ju¿ formu³ê. Brakuje mu tylko narzêdzia, czyli maga.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_07"); //Hmm, chyba wiem do czego zmierzasz. To ja mam robiæ za magika, który mu pomo¿e.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_08"); //Dok³adnie! Przybêdzie tu tylko z Tob¹. Zaczniesz inkantacjê, odwrócisz jego uwagê, a wtedy ja skoñczê to, co zacz¹³em dawno temu. 
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_09"); //Kruk nie jest idiot¹. Na dziedziñcu le¿y posiekany demon, a zdaje siê, ¿e ten jego by³ ¿ywy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_10"); //Na to te¿ jest sposób. Przywo³a siê innego demona.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_11"); //Który rzuci siê na ka¿dego, kogo zobaczy.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_12"); //Kruk pomyœli, ¿e czar wi¹¿¹cy straci³ moc. Posiekacie demona i rozpoczniesz inkantacjê.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_13"); //Przywo³am demona tu¿ przed waszym przybyciem.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_14"); //To muszê jeszcze dostaæ siê do Starego Obozu i zwróciæ na siebie uwagê Kruka. Jakieœ pomys³y?
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_15"); //To ju¿ twoja dzia³ka. Ja robiê tylko za zdrajcê i zabójcê.
	AI_Output (other, self, "DIA_Hrabia_TheRock_Why_Ok_15_16"); //Dobra, zajmê siê Krukiem. Lepiej ¿ebyœ tu by³, kiedy wrócê.
	AI_Output (self, other, "DIA_Hrabia_TheRock_Why_Ok_11_17"); //O to siê nie martw, ja zawsze dotrzymujê s³owa.

	/*******************
Niech Hrabia gdzieœ siê jakby schowa na placu. Po tym jak Dick i Kruk zabij¹ demona rzuci siê na Kruka.
********************/

	Npc_ExchangeRoutine(self,"hide_castle");

	B_LogEntry(CH1_Rbl_Hrabia, "Ten Hrabia jest do mnie bardziej podobny ni¿ sam chcia³bym przyznaæ. Wspólnie zajmiemy siê Krukiem. Hrabia przygotuje teren w Orlim GnieŸdzie, ja muszê zwabiæ tu Kruka pod pretekstem, ¿e pomogê mu w inkantacji. Chyba znowu wybra³em gorsz¹ czêœæ zadania...");

	B_LogEntry (CH5_NC_TheRock, "Wszed³em do Orlego Gniazda. W œrodku, prócz Hrabiego, nie ma ¿ywej duszy. Krata jest zablokowana wiêc nikt z zewn¹trz siê tutaj nie dostanie. To powinno uspokoiæ Lee.");
	Info_ClearChoices (DIA_Hrabia_TheRock);
};
