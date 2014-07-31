
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_STT_315_Sly_Hello (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Hello_Condition;
	information		= DIA_STT_315_Sly_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_STT_315_Sly_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 450)
	{
		return 1;
	};
};

FUNC VOID DIA_STT_315_Sly_Hello_Info()
{	
	AI_Output (self, other, "DIA_STT_315_Sly_Hello_11_01"); //No proszê, kolejna menda z obozu rebeliantów.
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_STT_315_Sly_Hello_11_02"); //Ch³opaki zabijmy to œcierwo. Gomez p³aci za ka¿d¹ g³owê rud¹ i kobietami!
	AI_ReadyMeleeWeapon			(hero);
	AI_ReadyMeleeWeapon			(hank);
	AI_ReadyMeleeWeapon			(rodney);
	AI_ReadyMeleeWeapon			(angus);
	if (Npc_KnowsInfo(hero,DIA_HUN_2615_Abel_Hello))
	{
		AI_Output (other, self, "DIA_STT_315_Sly_Hello_15_03"); //Przesy³am pozdrowienia od Abla!
	}
	else
	{
		AI_Output (other, self, "DIA_STT_315_Sly_Hello_15_04"); //Pe³no w tej Kolonii samobójców...
	};

	B_StopProcessInfos(self); 
};