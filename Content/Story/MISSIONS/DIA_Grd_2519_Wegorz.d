
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Wegorz_Exit (C_INFO)
{
	npc			= Grd_2519_Wegorz;
	nr			= 999;
	condition	= DIA_Wegorz_Exit_Condition;
	information	= DIA_Wegorz_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wegorz_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Wegorz_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					
// **************************************************

INSTANCE DIA_Wegorz_First (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 1;
	condition		= DIA_Wegorz_First_Condition;
	information		= DIA_Wegorz_First_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_First_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_OrnamentMap))&&(Npc_GetDistToNpc(self,hero) < 4500)&&(map3_readbydick == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_First_Info()
{
	/************************
	Ork ten grd1 ma byæ w miarê blisko wêgorza, jak siê walka rozpocznie to reszta stra¿ników ma podejœæ i wiwatowaæ walcz¹cy, tylko wtedy dick mo¿e przejœæ do miejsca gdzie ukryto klejnot, walka ma trwaæ dopóki gracz nie znajdzie kamienia i nie wróci, wtedy kolejny dialog siê odpali
	************************/
   var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);

	//TODO: CInematic
	B_FullStop (hero);
	AI_TurnToNpc(self, NULL);
	AI_Output (self, NULL, "DIA_Wegorz_First_11_01"); //Ern, nie œpij na warcie! Ten skurwiel mo¿e siê pojawiæ w ka¿dej chwili.
	AI_TurnToNpc(grd1, self);
	AI_Output (NULL, self, "DIA_Wegorz_First_11_02"); //Przestañ pieprzyæ Wêgorz. Wiem, co mam robiæ, a s³uchaæ bêdê tylko Hrabiego.
	AI_Output (self, NULL, "DIA_Wegorz_First_11_03"); //Do powrotu szefa to ja mówiê co mo¿na, a czego nie! 
	AI_Output (NULL, self, "DIA_Wegorz_First_11_04"); //Jak bêdê chcia³ siê odlaæ to te¿ mam pytaæ? A mo¿e chcesz mi potrzymaæ dziecioróbkê?
	AI_DrawWeapon (self);
	AI_Output (self, NULL, "DIA_Wegorz_First_11_05"); //Uwa¿aj, co mówisz suczy synu!
	AI_Output (NULL, self, "DIA_Wegorz_First_11_06"); //Sam siê o to prosisz!
	AI_DrawWeapon (grd1);

	//AI_Output (other, other, "DIA_Wegorz_First_15_07"); //Bijcie siê idioci, to dla mnie idealny moment, ¿eby zdobyæ kamieñ!

	B_LogEntry(CH3_NON_Ornament, "Stra¿nicy wdali siê miêdzy sob¹ w bójkê. To dla mnie idealny moment na zdobycie ornamentu, który musi byæ ukryty gdzieœ w jaskini!");
	B_StopProcessInfos(self);

	/*************************
	Czyli Wêgorz i gd1 zaczynaj¹ walkê  - oczywiscie nie moga siê pozabijaæ, hp co najwy¿ej do po³owy niech im zleci, a stra¿nicy podchodz¹ i wiwatuj¹. to jedyny moment, ¿eby gracz móg³ podejœæ i ukraœæ ornament

	*************************/

	Npc_SetTarget (self,grd1);
	B_StartAfterDialogFight(self,grd1,false);
	Npc_SetTarget (grd1,self);
	B_StartAfterDialogFight(grd1,self,false);

	Npc_ExchangeRoutine(grd1,"FIGHT");

	PrintScreen	("Teraz albo nigdy!", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
};

// **************************************************Dialog 2 stra¿nika, nie bior¹cego udzia³u w walce******************

//CINEMATIC
/*
INSTANCE DIA_Grd2_Alarm (C_INFO)
{
	npc				= GRD_2515_Guard;
	nr				= 2;
	condition		= DIA_Grd2_Alarm_Condition;
	information		= DIA_Grd2_Alarm_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Grd2_Alarm_Condition()
{

	if (Npc_KnowsInfo(hero,DIA_Wegorz_First))&&(Npc_GetDistToNpc(self,hero) < 2500)&&(NPC_HasItems(other,orn3)>=1)
	{
		return 1;
	};


};

FUNC VOID DIA_Grd2_Alarm_Info()
{

	var C_NPC hrab; hrab = Hlp_GetNpc(GRD_4010_Hrabia);

	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC weg; weg = Hlp_GetNpc(GRD_2519_Wegorz);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);


	B_FullStop (hero);
	AI_TurnToNpc(self, hrab);
	AI_Output (self, hrab, "DIA_Grd2_Alarm_11_01"); //Co do cholery...
	AI_TurnToNpc(self, weg);
	AI_Output (self, weg, "DIA_Grd2_Alarm_11_02"); //O kur... Ch³opaki chowaæ broñ, szef idzie!


	/************
	Hrabia podchodzi do stra¿nika
	**************/
/*
	AI_GotoNpc(hrab,self);
*/

/***************
	albo daj dojœcie do wp mo¿e bêdzie lepiej.
	AI_GotoWP (hrab, "jakis_wp");

	*****************/
/*
	B_StopProcessInfos	(self);
*/
/************************************
	
	Ork trzeba zrobiæ tak, ¿eby grd1 i wêgorz przestali walczyæ i razem z reszt¹ maj¹ siê ustawiæ w szerego i czekaæ na Hrabiego

	**********************************/
/*	Npc_ExchangeRoutine(weg,"Wait");
	Npc_ExchangeRoutine(grd1,"Wait");
	Npc_ExchangeRoutine(grd2,"Wait");
	Npc_ExchangeRoutine(grd3,"Wait");
	Npc_ExchangeRoutine(grd4,"Wait");
	Npc_ExchangeRoutine(grd5,"Wait");

};
*/

// **************************************************

INSTANCE DIA_Wegorz_First1 (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 1;
	condition		= DIA_Wegorz_First1_Condition;
	information		= DIA_Wegorz_First1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_First1_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_OrnamentMapAgain))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_First1_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, hero);
	AI_Output (self, hero, "DIA_Wegorz_First1_11_01"); //Rusz dupê, szef czeka za drzwiami.
	AI_Output (self, hero, "DIA_Wegorz_First1_11_02"); //Tylko pamiêtaj, ¿adnych gwa³townych ruchów, z³amasie!	
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Wegorz_Wait (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Wait_Condition;
	information		= DIA_Wegorz_Wait_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Wait_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Hrabia_LastOrn))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Wait_Info()
{
	AI_Output (self, other, "DIA_Wegorz_Wait_11_01"); //Nie wracaj tu bez ornamentów, z³amasie!
	B_StopProcessInfos(self);
};

INSTANCE DIA_Wegorz_Teleport (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Teleport_Condition;
	information		= DIA_Wegorz_Teleport_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Teleport_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Wegorz_Wait))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Teleport_Info()
{
	B_StopProcessInfos(self);
   B_StopProcessInfos(hero);

	AI_Teleport(hero, "LOCATION_19_03_ROOM6_BARRELCHAMBER2");
};

// **************************************************

INSTANCE DIA_Wegorz_Wait1 (C_INFO)
{
	npc				= Grd_2519_Wegorz;
	nr				= 3;
	condition		= DIA_Wegorz_Wait1_Condition;
	information		= DIA_Wegorz_Wait1_Info;
	permanent		= 0;
	important		= 1;
	description		= "..."; 
};

FUNC INT DIA_Wegorz_Wait1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Wegorz_Wait))
	{
		return 1;
	};
};

FUNC VOID DIA_Wegorz_Wait1_Info()
{
	var C_NPC grd1; grd1 = Hlp_GetNpc(GRD_2514_Guard);
	var C_NPC grd2; grd2 = Hlp_GetNpc(GRD_2515_Guard);
	var C_NPC grd3; grd3 = Hlp_GetNpc(GRD_2516_Guard);
	var C_NPC grd4; grd4 = Hlp_GetNpc(GRD_2517_Guard);
	var C_NPC grd5; grd5 = Hlp_GetNpc(GRD_2518_Guard);

	if (ornament_wait >= Wld_GetDay())
	{
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Nie wracaj tu bez ornamentów, z³amasie!
		B_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Gdzie s¹ moje ornamenty?!
		AI_Output (self, other, "DIA_Wegorz_Wait1_11_01"); //Zar¿n¹æ tego wieprza!
      
		Npc_SetTempAttitude(self, ATT_HOSTILE); Npc_SetAttitude(self, ATT_HOSTILE);
		Npc_SetTempAttitude(grd1, ATT_HOSTILE); Npc_SetAttitude(grd1, ATT_HOSTILE);
		Npc_SetTempAttitude(grd2, ATT_HOSTILE); Npc_SetAttitude(grd2, ATT_HOSTILE);
		Npc_SetTempAttitude(grd3, ATT_HOSTILE); Npc_SetAttitude(grd3, ATT_HOSTILE);
		Npc_SetTempAttitude(grd4, ATT_HOSTILE); Npc_SetAttitude(grd4, ATT_HOSTILE);
		Npc_SetTempAttitude(grd5, ATT_HOSTILE); Npc_SetAttitude(grd5, ATT_HOSTILE);
	};
};
