
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Georg_EXIT(C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 999;
	condition			= Info_Georg_EXIT_Condition;
	information			= Info_Georg_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Georg_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Georg_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Georg_Hello (C_INFO)
{
	npc		= Grd_611_Gardist;
	nr			= 1;
	condition		= Info_Georg_Hello_Condition;
	information		= Info_Georg_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Wielki z Ciebie ch≥op!";
};                       

FUNC INT Info_Georg_Hello_Condition()
{	

	return 1;

};
FUNC VOID Info_Georg_Hello_Info()
{	

	AI_Output (other, self,"Info_Georg_Hello_15_00"); //Wielki z Ciebie ch≥op!
	AI_Output (self, other,"Info_Georg_Hello_06_01"); //£ama≥em karki nie takim jak Ty. Zejdü mi z drogi.

};




// ************************************************************

INSTANCE Info_Georg_Again (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again_Condition;
	information			= Info_Georg_Again_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Again))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again_06_01"); //Trzymaj siÍ wymoczku z dala od kobiety Hrabiego bo...
	AI_Output (other, self,"Info_Georg_Again_15_02"); //Wiem, skrÍcisz mi kark.
	AI_Output (self, other,"Info_Georg_Again_06_03"); //Dok≥adnie. BÍdÍ mia≥ na Ciebie oko, mπdralo.
};



// ************************************************************

INSTANCE Info_Georg_Again1 (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again1_Condition;
	information			= Info_Georg_Again1_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Stigma_Hello2))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again1_Info()
{	
	var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);
	var C_NPC nia; nia = Hlp_GetNpc(Non_660_Nia);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again1_06_01"); //Dawno na to czeka≥em úwirze!
	AI_DrawWeapon (self);
	AI_Output (other, self,"Info_Georg_Again1_15_02"); //Co tu siÍ dzieje?!
	AI_Output (self, other,"Info_Georg_Again1_06_03"); //Zdychaj!

	B_StopProcessInfos	(self);
	
	sti.attribute[ATR_HITPOINTS] = (sti.attribute[ATR_HITPOINTS_MAX] - sti.attribute[ATR_HITPOINTS_MAX]);

	Npc_SetPermAttitude	(sti, ATT_HOSTILE);
	Npc_SetTarget (self,sti);
	Npc_SetTarget (sti,nia);
	AI_StartState (sti,ZS_ATTACK,1,"");
	B_StartAfterDialogFight(self,sti,true);
	B_StartAfterDialogFight(sti,nia,true);


	/****************************
Ork trzeba by zrobiÊ tak, øeby ZnamiÍ rzuci≥ siÍ na NiÍ a Georg na ZnamiÍ. Georg musi zabiÊ ZnamiÍ zanim ten zabije NiÍ, ale ZnamiÍ musi jπ co najmniej raniÊ.
Dick niech robi wtedy co chce, ale moøe zaatakowaÊ tylko ZnamiÍ.


****************************/


};


// ************************************************************

INSTANCE Info_Georg_Again2 (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Again2_Condition;
	information			= Info_Georg_Again2_Info;
	important			= 1;
	permanent			= 0;
	description 		= "";
};                       

FUNC INT Info_Georg_Again2_Condition()
{	
	var C_NPC sti; sti = Hlp_GetNpc(Grd_614_Gardist);

	if (Npc_KnowsInfo (hero, Info_Georg_Again1))&& (Npc_GetDistToNpc(self,hero) < 600)&&(Npc_IsDead(sti))
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Again2_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Again2_06_01"); //I po sprawie. Kolejny idiota gryzie ziemiÍ.
	AI_Output (other, self,"Info_Georg_Again2_15_02"); //Co to ma znaczyÊ?
	AI_Output (self, other,"Info_Georg_Again2_06_03"); //Kaødy kto üle spojrzy na kobietÍ mojego Pana, zginie. Jasne?!
	AI_Output (other, self,"Info_Georg_Again2_15_04"); //Oczywiúcie.
	AI_Output (self, other,"Info_Georg_Again2_06_05"); //Lepiej wbij to sobie do g≥owy, obdartusie. I uwaøaj co robisz, bo bÍdÍ CiÍ mia≥ na oku.
	Npc_ExchangeRoutine	(self,"start");	
};



/********************
Georg stoi na straøy, wpuúci Dicka dopiero jak minie ten dzieÒ z dialogu Nii.

*********************/

// ************************************************************

INSTANCE Info_Georg_Guard (C_INFO)
{
	npc			= Grd_611_Gardist;
	nr			= 2;
	condition			= Info_Georg_Guard_Condition;
	information			= Info_Georg_Guard_Info;
	important			= 1;
	permanent			= 1;
	description 		= "";
};                       

FUNC INT Info_Georg_Guard_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Def1))&&(GEORG_GUARD==0)
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Guard_Info()
{	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other,"Info_Georg_Guard_06_01"); //Czego tu szukasz?
	AI_Output (other, self,"Info_Georg_Guard_15_02"); //Chcia≥em porozmawiaÊ z Niπ.
	if (nia_rest <= (Wld_GetDay()))
	{
		GEORG_GUARD = 1;
		AI_Output (self, other,"Info_Georg_Guard_06_03"); //Nie wiem dlaczego, ale pozwoli≥a Ci wejúÊ.
		AI_Output (self, other,"Info_Georg_Guard_06_04"); //Ruszaj dupÍ!
	}
	else
	{
		AI_Output (self, other,"Info_Georg_Guard_06_05"); //Spierdalaj!
		B_StopProcessInfos	(self);
		AI_GotoWP		(other, "NC_EN_PATH3_06");
	};
};



// ************************************************************

INSTANCE Info_Georg_Meet (C_INFO)
{
	npc		= Grd_611_Gardist;
	nr			= 1;
	condition		= Info_Georg_Meet_Condition;
	information		= Info_Georg_Meet_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Witaj przydupasie.";
};                       

FUNC INT Info_Georg_Meet_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Georg_Meet_Info()
{	
	AI_Output (other, self,"Info_Georg_Meet_15_00"); //Witaj przydupasie.
	AI_Output (self, other,"Info_Georg_Meet_06_01"); //Øe co?!
	AI_Output (other, self,"Info_Georg_Meet_15_02"); //WidzÍ, øe robienie za ch≥opca na posy≥ki na us≥ugach dziwki wesz≥o Ci w krew.
	AI_Output (self, other,"Info_Georg_Meet_06_03"); //Ty skurwielu! UrwÍ Ci g≥owÍ i naszczam do pyska!
	B_LogEntry		(CH4_Non_Eagle, "Po co ja w ogÛle zaczπ≥em rozmowÍ z Georgiem?");
	B_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
}; 
