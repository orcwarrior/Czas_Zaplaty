
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Pinto_EXIT(C_INFO)
{
	npc			= Grd_612_Gardist;
	nr			= 999;
	condition			= Info_Pinto_EXIT_Condition;
	information			= Info_Pinto_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Pinto_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Pinto_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Pinto_Hello (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 1;
	condition		= Info_Pinto_Hello_Condition;
	information		= Info_Pinto_Hello_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Pinto_Hello_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Kris_Hello))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Pinto_Hello_Info()
{	
	var C_NPC kris; kris = Hlp_GetNpc(Grd_610_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (other, self);
	AI_TurnToNpc (self, kris);
	AI_Output (self, other,"Info_Pinto_Hello_06_01"); //Dziewucha znalaz³a kolejne cia³o. Potrzebuje pomocy, ten pochlastany robol strasznie siê rzuca.
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Pinto_Hello_06_02"); //Œwie¿e miêcho?
	AI_Output (other, self,"Info_Pinto_Hello_15_03"); //Masz z tym jakiœ problem?
	AI_Output (self, other,"Info_Pinto_Hello_06_04"); //No proszê, jaka zadziora. Kris wyœlij go do Kap³anki Mi³osierdzia. 
	AI_Output (self, other,"Info_Pinto_Hello_06_05"); //Mo¿e tam na coœ siê przyda.
	B_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"start");
};



// ************************************************************

INSTANCE Info_Pinto_Hello1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 1;
	condition		= Info_Pinto_Hello1_Condition;
	information		= Info_Pinto_Hello1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Dobrze znasz Krisa?";
};                       

FUNC INT Info_Pinto_Hello1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Pinto_Hello))
	{
		return 1;
	};

};
FUNC VOID Info_Pinto_Hello1_Info()
{	
	AI_Output (other, self,"Info_Pinto_Hello1_15_01"); //Dobrze znasz Krisa?
	AI_Output (self, other,"Info_Pinto_Hello1_06_02"); //A co, wpad³ Ci w oko?
	AI_Output (other, self,"Info_Pinto_Hello1_15_03"); //Nie to mia³em na myœli...
	AI_Output (self, other,"Info_Pinto_Hello1_06_04"); //Wiem, idioto. Po prostu nie mia³em zamiaru odpowiadaæ.
	AI_Output (self, other,"Info_Pinto_Hello1_06_05"); //Spadaj.
};

// ************************************************************

INSTANCE Info_Pinto_Warn (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Warn_Condition;
	information		= Info_Pinto_Warn_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Pinto_Warn_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_MystEnd))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Warn_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Warn_06_01"); //Podobno ktoœ wsadza nos tam gdzie nie powinien.
	AI_Output (self, other,"Info_Pinto_Warn_06_02"); //Podobno to bardzo niezdrowe zajêcie.
	AI_Output (other, self,"Info_Pinto_Warn_15_03"); //Podobno lepsza najgorsza prawda, ni¿ najwspanialsze k³amstwo.
	AI_Output (self, other,"Info_Pinto_Warn_06_04"); //Wiesz, doroœli czasem musz¹ mówiæ to co powinni, a nie to co chc¹.
	AI_Output (other, self,"Info_Pinto_Warn_15_05"); //Mówisz za siebie, czy za Krisa?
	AI_Output (self, other,"Info_Pinto_Warn_06_06"); //A co to za ró¿nica?
	AI_Output (other, self,"Info_Pinto_Warn_15_07"); //Myœlê, ¿e Hrabia kiedyœ wróci i bardziej doceni przykr¹ prawdê ni¿ s³odki fa³sz.
	AI_Output (self, other,"Info_Pinto_Warn_06_08"); //Gówno mnie obchodzi to co myœlisz. Prawda jest taka, ¿e podpad³eœ Krisowi, a on Ci nie odpuœci.
	AI_Output (other, self,"Info_Pinto_Warn_15_09"); //I przys³a³ ciebie bo oblecia³ go strach?
	AI_Output (self, other,"Info_Pinto_Warn_06_10"); //Po prostu nie lubi siê brudziæ fekaliami. A mi tam zjedno komu nakopiê do ty³ka.
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Pinto_Warn_15_11"); //Uwa¿aj, nosi³ wilk razy kilka...

	/************************
Chodzi o to, ¿eby Pinto st³uk³ Dicka, jak masz inny pomys³ to to zmieñ

Aha i Pinto niech czeka na Dicka najlepiej a¿ wstanie z gleby

************************/

	hero.attribute[ATR_HITPOINTS] = (hero.attribute[ATR_HITPOINTS_MAX] - hero.attribute[ATR_HITPOINTS_MAX])+5;
	B_StopProcessInfos	(self);
	B_StartAfterDialogFight(self,other,false);
};


// ************************************************************

INSTANCE Info_Pinto_Warn1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Warn1_Condition;
	information		= Info_Pinto_Warn1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Warn1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Pinto_Warn))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Warn1_Info()
{	
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Warn1_06_01"); //To by³o ostrze¿enie, ch³opcze.
	AI_Output (self, other,"Info_Pinto_Warn1_06_02"); //Nastêpnym razem nie bêdê tak delikatny.
	AI_Output (other, self,"Info_Pinto_Warn1_15_03"); //Zaczekaj!
	AI_Output (self, other,"Info_Pinto_Warn1_06_04"); //Masz ochotê na powtórkê? Wiesz ja tak mogê d³ugo...
	AI_Output (other, self,"Info_Pinto_Warn1_15_05"); //Mam dla Ciebie propozycjê.
	AI_Output (self, other,"Info_Pinto_Warn1_06_06"); //No proszê, bezczelny z Ciebie gnojek. Ale takich w³aœnie lubiê. Mów.
	AI_Output (other, self,"Info_Pinto_Warn1_15_07"); //Udowodniê, ¿e to Nia morduje ludzi w GnieŸdzie.
	AI_Output (self, other,"Info_Pinto_Warn1_06_08"); //I co z tego? Kris ma to w dupie. Trzeba tylko znaleŸæ ofiarê...
	AI_Output (other, self,"Info_Pinto_Warn1_15_09"); //Wiem, ¿e pad³o na mnie. Ale mam pomys³.
	AI_Output (self, other,"Info_Pinto_Warn1_06_10"); //Uparty z Ciebie idiota. No dobra, mów.
	AI_Output (other, self,"Info_Pinto_Warn1_15_11"); //Umówiê siê z Ni¹ na nocn¹ schadzkê.
	AI_Output (other, self,"Info_Pinto_Warn1_15_12"); //Ale nie bêdê sam. Ty i kilku innych ukryjecie siê w cieniu.
	AI_Output (self, other,"Info_Pinto_Warn1_06_13"); //Szykuje siê niez³e przedstawienie. Zabiorê trochê ¿arcia i piwo.
	AI_Output (other, self,"Info_Pinto_Warn1_15_14"); //Zgadzasz siê?
	AI_Output (self, other,"Info_Pinto_Warn1_06_15"); //Czemu nie. Mam ju¿ doœæ tej wrednej suki. Je¿eli zaœwiadcz¹ te¿ inni to Kris nie bêdzie mia³ wyboru.
	AI_Output (other, self,"Info_Pinto_Warn1_15_16"); //Œwietnie. Porozmawiam z pozosta³ymi. 
	AI_Output (self, other,"Info_Pinto_Warn1_06_17"); //Najpierw porozmawiaj z Ni¹. Nic z tego nie wyjdzie jak dziwka nie poleci na twoje k³amstewka.
	AI_Output (other, self,"Info_Pinto_Warn1_15_18"); //W porz¹dku. 
	AI_Output (self, other,"Info_Pinto_Warn1_06_19"); //Zapowiada siê ciekawy wieczór. Powodzenia, ch³opcze.
	
   B_LogEntry		(CH4_Non_Eagle, "Uda³o siê! Namówi³em Pinto. Muszê jeszcze porozmawiaæ z pozosta³ymi. Potrzebujê co najmniej kilku œwiadków.");
	Npc_ExchangeRoutine	(self,"WAIT");	
};

// ************************************************************

INSTANCE Info_Pinto_Hmm (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Hmm_Condition;
	information		= Info_Pinto_Hmm_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Hmm_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet12))&& (Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Hmm_Info()
{	
	var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);
	var C_NPC nia; nia = Hlp_GetNpc(Non_660_Nia);
	nia.attribute[ATR_HITPOINTS] = nia.attribute[ATR_HITPOINTS_MAX] - nia.attribute[ATR_HITPOINTS_MAX];
		//B_StartAfterDialogFight(seven,self,true);
	B_FullStop (hero);
	AI_TurnToNpc (other, self);
   
	AI_Output (self, other,"Info_Pinto_Hmm_06_01"); //Co tu siê kurwa dzieje!
	
   AI_GotoNpc(self, hero);
	AI_TurnToNpc (self, seven);
	AI_DrawWeapon (self);
	
   AI_Output (self, other,"Info_Pinto_Hmm_06_02"); //Lepiej Siódemka, ¿ebyœ mia³ dobre wyt³umaczenie!
	B_StopProcessInfos	(self);
};

// ************************************************************

INSTANCE Info_Pinto_Hmm1 (C_INFO)
{
	npc		= Grd_612_Gardist;
	nr			= 3;
	condition		= Info_Pinto_Hmm1_Condition;
	information		= Info_Pinto_Hmm1_Info;
	important		= 1;
	permanent		= 0;
	description 		= "";
};                       

FUNC INT Info_Pinto_Hmm1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Seven_Watch))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID Info_Pinto_Hmm1_Info()
{	
	var C_NPC seven; seven = Hlp_GetNpc(Grd_613_Gardist);

	B_FullStop (hero);
	AI_TurnToNpc (self, seven);
	AI_RemoveWeapon (self);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_01"); //Poka¿ nó¿.
	CreateInvItems (self, Nia_Knif ,1); 
	//B_GiveInvItems (self, other, EN_Bandage, 1);

	AI_UnequipWeapons		(self);
	EquipItem	(self,Nia_Knif);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni			(self, "T_1HSINSPECT");
	AI_UnequipWeapons		(self);

	AI_Output (self, other,"Info_Pinto_Hmm1_06_02"); //Rzeczywiœcie, to jej ostrze.

	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);
	AI_EquipBestMeleeWeapon	(self);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_03"); //Czyli sprawa rozwi¹zana.
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Pinto_Hmm1_06_04"); //Pogadam z Krisem. Powiem mu jak by³o, a reszta poœwiadczy.
	AI_Output (self, other,"Info_Pinto_Hmm1_06_05"); //Wezmê nó¿, inaczej mi nie uwierzy...

	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "start"); 
}; 
