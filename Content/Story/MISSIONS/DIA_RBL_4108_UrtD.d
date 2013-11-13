// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_UrtD_Exit (C_INFO)
{
	npc			= RBL_4108_UrtD;
	nr			= 999;
	condition	= DIA_UrtD_Exit_Condition;
	information	= DIA_UrtD_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_UrtD_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_UrtD_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_UrtD_Hello (C_INFO)
{
	npc				= RBL_4108_UrtD;
	nr				= 1;
	condition		= DIA_UrtD_Hello_Condition;
	information		= DIA_UrtD_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_UrtD_Hello_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cav_DungeonInside))&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

FUNC VOID DIA_UrtD_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_TurnToNpc(self, other);
	AI_Output (self, other, "DIA_UrtD_Hello_11_00"); //Dalej nie przejdziesz.
	AI_Output (other, self, "DIA_UrtD_Hello_15_01"); //No proszê, zdrajca te¿ siê znalaz³. Myœla³em, ¿e zaszy³eœ siê w jakiejœ dziurze i czekasz, a¿ barierê szlag trafi.
	AI_Output (self, other, "DIA_UrtD_Hello_11_02"); //Chcia³byœ. Z przyjemnoœci¹ skrócê Ciê o ten wœcibski ³eb.
	AI_Output (self, other, "DIA_UrtD_Hello_11_03"); //Gdyby nie Ty, wszyscy rebelianci i najemnicy wpadliby w pu³apkê!
	AI_Output (other, self, "DIA_UrtD_Hello_15_04"); //Za du¿o gadasz!

	var C_NPC grd1;	grd1 = Hlp_GetNpc(Grd_4109_Trap); Npc_SetTempAttitude(grd1,ATT_HOSTILE); Npc_SetAttitude(grd1,ATT_HOSTILE);
	var C_NPC grd2;	grd2 = Hlp_GetNpc(Grd_4110_Trap); Npc_SetTempAttitude(grd2,ATT_HOSTILE); Npc_SetAttitude(grd2,ATT_HOSTILE);
	var C_NPC grd3;	grd3 = Hlp_GetNpc(Grd_4111_Trap); Npc_SetTempAttitude(grd3,ATT_HOSTILE); Npc_SetAttitude(grd3,ATT_HOSTILE);
	var C_NPC grd4;	grd4 = Hlp_GetNpc(Grd_4112_Trap); Npc_SetTempAttitude(grd4,ATT_HOSTILE); Npc_SetAttitude(grd4,ATT_HOSTILE);

	B_LogEntry		(CH6_RBL_PayDay, "Zdrajca Urt, czy raczej Urthos te¿ siê znalaz³. Z przyjemnoœci¹ poœlê go do Beliara.");

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);

	Wld_InsertNpc(Grd_4109_Trap,"DUNG37");
	Wld_InsertNpc(Grd_4110_Trap,"DUNG37");
	Wld_InsertNpc(Grd_4111_Trap,"DUNG38");
	Wld_InsertNpc(Grd_4112_Trap,"DUNG38");	
}; 
