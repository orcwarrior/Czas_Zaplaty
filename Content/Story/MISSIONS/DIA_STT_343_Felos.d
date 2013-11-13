
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Felos_Exit (C_INFO)
{
	npc			= STT_343_Felos;
	nr			= 999;
	condition	= DIA_Felos_Exit_Condition;
	information	= DIA_Felos_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Felos_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Felos_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Felos_Hello (C_INFO)
{
	npc				= STT_343_Felos;
	nr				= 1;
	condition		= DIA_Felos_Hello_Condition;
	information		= DIA_Felos_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Coœ Ci marnie idzie."; 
};

FUNC INT DIA_Felos_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Felos_Hello_Info()
{
	AI_Output (other, self, "DIA_Felos_Hello_15_01"); //Coœ Ci marnie idzie.
	AI_Output (self, other, "DIA_Felos_Hello_07_02"); //Mam ju¿ doœæ tej cholernej areny. Od ka¿dego dostajê ciêgi.
	AI_Output (other, self, "DIA_Felos_Hello_15_03"); //To po co walczysz?
	AI_Output (self, other, "DIA_Felos_Hello_07_04"); //Na arenie t³uk¹ mnie rzadziej ni¿ w obozie, do tego Gomez lubi ogl¹daæ walki wiêc mam ma³e przywileje.
	AI_Output (other, self, "DIA_Felos_Hello_15_05"); //Hmm, wybra³eœ mniejsze z³o.
	AI_Output (self, other, "DIA_Felos_Hello_07_06"); //Mniej, wiêcej. 
};

//***************************************

instance DIA_Felos_Arena (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_Arena_Condition;
	information		= DIA_Felos_Arena_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jakie jest ¿ycie gladiatora?";
};

FUNC int  DIA_Felos_Arena_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_Hello))
	{
		return 1;
	};
};
func void  DIA_Felos_Arena_Info()
{
	AI_Output (other, self,"DIA_Felos_Arena_Info_15_01"); //Jakie jest ¿ycie gladiatora?
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_02"); //Je¿eli jesteœ dobry, to ca³kiem przyjemne.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_03"); //Stra¿nicy schodz¹ Ci z drogi, ka¿dy chce siê z Tob¹ napiæ. Ba nawet czasami magnaci pozwalaj¹ zabawiæ siê z jak¹œ panienk¹.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_04"); //Ale przeciêtniacy dostaj¹ ostre baty. Krew, pot i ³zy.
	AI_Output (self, other,"DIA_Felos_Arena_Info_07_05"); //Choæ to i tak lepsze ni¿ praca w kopalni.
};

//***************************************

instance DIA_Felos_ArenaFight (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaFight_Condition;
	information		= DIA_Felos_ArenaFight_Info;
	important		= 1;
	permanent		= 0;
	description		= "";
};

FUNC int  DIA_Felos_ArenaFight_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_Arena))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaFight_Info()
{
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_01"); //Zaczekaj!
	AI_Output (other, self,"DIA_Felos_ArenaFight_Info_15_02"); //Tak?
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_03"); //Mam dla Ciebie propozycjê. Zarobisz kilka bry³ek i skopiesz czyjeœ dupsko. Co Ty na to?
	AI_Output (other, self,"DIA_Felos_ArenaFight_Info_15_04"); //Co to za szczêœciarz?
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_05"); //Ci dwaj idioci na arenie. Ci¹gle obrywam od nich ³omot.
	AI_Output (self, other,"DIA_Felos_ArenaFight_Info_07_06"); //Chcia³bym choæ raz zobaczyæ, jak któryœ z nich zbiera ciêgi.
};

//***************************************

instance DIA_Felos_ArenaOk (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaOk_Condition;
	information		= DIA_Felos_ArenaOk_Info;
	important		= 0;
	permanent		= 0;
	description		= "Da siê za³atwiæ.";
};

FUNC int  DIA_Felos_ArenaOk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_ArenaFight))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaOk_Info()
{
	AI_Output (other, self,"DIA_Felos_ArenaOk_Info_15_01"); //Da siê za³atwiæ.
	AI_Output (self, other,"DIA_Felos_ArenaOk_Info_07_02"); //Wystarczy, ¿e dokopiesz jednemu z nich. Dam Ci za to 200 bry³ek bo i tak nie mam co robiæ z rud¹.
	Log_CreateTopic	(CH3_Grd_Arena, LOG_MISSION);
	Log_SetTopicStatus	(CH3_Grd_Arena, LOG_RUNNING);
	B_LogEntry		(CH3_Grd_Arena, "Felos poprosi³ mnie, ¿ebym z³oi³ Trupismroda b¹dŸ Aresa - gladiatorów z areny w Starym Obozie. To powinno byæ ³atwe.");
};

//***************************************

instance DIA_Felos_ArenaOk1 (C_INFO)
{
	npc				= STT_343_Felos;
	condition		= DIA_Felos_ArenaOk1_Condition;
	information		= DIA_Felos_ArenaOk1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ju¿ po sprawie.";
};

FUNC int  DIA_Felos_ArenaOk1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Dead_Provoke))&&(Npc_KnowsInfo(hero,DIA_Felos_ArenaOk))
	{
		return 1;
	};
};
func void  DIA_Felos_ArenaOk1_Info()
{
	var C_NPC dead; dead = Hlp_GetNpc(STT_344_Warrior);

	AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_01"); //Ju¿ po sprawie.
	AI_Output (self, other,"DIA_Felos_ArenaOk1_Info_07_02"); //I jak Ci posz³o?

	if (Npc_GetAivar(dead,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_03"); //Niewiele zabrak³o, ju¿ prawie go mia³em...
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_04"); //Prawie robi ogromn¹ ró¿nicê. Jesteœ takim samym nieudacznikiem jak ja. ZejdŸ mi z oczu!
		Log_SetTopicStatus	(CH3_Grd_Arena, LOG_FAILED);
		B_LogEntry		(CH3_Grd_Arena, "Nie pokona³em Trupismroda. Felos nie by³ zadowolony, z nagrod¹ mogê siê po¿egnaæ");
		B_StopProcessInfos	( self );
	}
	else if (Npc_GetAivar(dead,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_04"); //To by³ krótki spacerek. Trupismród œmierdzi jeszcze bardziej.
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_06"); //W koñcu ktoœ mu pokaza³ gdzie jest miejsce takiego gówna!
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_07"); //To Twoja ruda - zas³u¿y³eœ.
		CreateInvItems (self, ItMiNugget,200);
		B_GiveInvItems (self, other, ItMiNugget, 200);
		AI_Output (self, other, "DIA_Felos_ArenaOk1_Info_07_08"); //Solidnie zapracowa³eœ na te bry³ki. Mo¿e teraz w koñcu wygram jak¹œ walkê...
		AI_Output (other, self,"DIA_Felos_ArenaOk1_Info_15_09"); //Powodzenia na arenie.
		Log_SetTopicStatus	(CH3_Grd_Arena, LOG_SUCCESS);
		B_LogEntry		(CH3_Grd_Arena, "Pokona³em Trupismroda. Felos dotrzyma³ s³owa. Szkoda, ¿e nie mogê czêœciej powalczyæ na arenie.");
	};
};
