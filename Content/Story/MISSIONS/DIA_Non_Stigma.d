
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Stigma_EXIT(C_INFO)
{
	npc			= Grd_614_Gardist;
	nr			= 999;
	condition			= Info_Stigma_EXIT_Condition;
	information			= Info_Stigma_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Stigma_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stigma_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Stigma_Hello (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 1;
	condition		= Info_Stigma_Hello_Condition;
	information		= Info_Stigma_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³eœ o coœ zapytaæ?";
};                       

FUNC INT Info_Stigma_Hello_Condition()
{	

	return 1;

};
FUNC VOID Info_Stigma_Hello_Info()
{	

	AI_Output (other, self,"Info_Stigma_Hello_15_00"); //Chcia³eœ o coœ zapytaæ?
	AI_Output (self, other,"Info_Stigma_Hello_06_01"); //...
	AI_Output (other, self,"Info_Stigma_Hello_15_02"); //Co ty, niemowa?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello_15_03"); //Wybacz. Do zobaczenia.
};

// ************************************************************

INSTANCE Info_Stigma_Hello1 (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 2;
	condition		= Info_Stigma_Hello1_Condition;
	information		= Info_Stigma_Hello1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Przysy³a mnie Nia.";
};                       

FUNC INT Info_Stigma_Hello1_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Again))
	{
		return 1;
	};
};

FUNC VOID Info_Stigma_Hello1_Info()
{	
	AI_Output (other, self,"Info_Stigma_Hello1_15_00"); //Przysy³a mnie Nia.
	AI_Output (self, other,"Info_Stigma_Hello1_06_01"); //(na twarzy mê¿czyzny pojawia siê przera¿enie)
	AI_Output (other, self,"Info_Stigma_Hello1_15_02"); //Co siê sta³o? Wygl¹dasz jakbyœ zobaczy³ ducha.
	AI_Output (other, self,"Info_Stigma_Hello1_15_03"); //Przyszed³em po szmaty na opatrunki. Masz jakieœ?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello1_15_04"); //Œwietnie, dziêki.
	
	/**************************
Ork zrób te banda¿e z czegokolwiek. S¹ wa¿ne bo bêda istotne dla fabu³y, to w sumie dowód rzeczowy.

*************************/

	CreateInvItems (self, EN_Bandage,1); 
	B_GiveInvItems (self, other, EN_Bandage, 1);
	B_LogEntry		(CH4_Non_NiaHelp, "Mam szmaty dla Nii, czas wracaæ.");
};

// ************************************************************

INSTANCE Info_Stigma_Hello2 (C_INFO)
{
	npc		= Grd_614_Gardist;
	nr			= 3;
	condition		= Info_Stigma_Hello2_Condition;
	information		= Info_Stigma_Hello2_Info;
	important		= 1;
	permanent		= 0;
	description 	= "";
};                       

FUNC INT Info_Stigma_Hello2_Condition()
{	
	if (Npc_KnowsInfo (hero, Info_Nia_Def))&& (Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};
FUNC VOID Info_Stigma_Hello2_Info()
{
	B_FullStop (hero);
	//AI_GotoNpc(other,self);
	AI_TurnToNpc (self, other);
	AI_Output (other, self,"Info_Stigma_Hello2_15_00"); //O co chodzi? Chcesz mi coœ powiedzieæ?
	AI_PlayAni(self,"T_YES");
	AI_Output (other, self,"Info_Stigma_Hello2_15_01"); //S³ucham.
	AI_PlayAni ( self, "T_SEARCH");
	AI_TurnToNpc (self, other);
	AI_Output (self, other,"Info_Stigma_Hello2_06_02"); //(mê¿czyzna gestykuluje rêkami, wskazuje na Niê)
	AI_Output (other, self,"Info_Stigma_Hello2_15_03"); //Nie rozumiem...
	AI_DrawWeapon (self);
	B_StopProcessInfos	(self);

	/*******************************
Ma podejœæ do Nii, tam samo Dick

*********************************/
}; 
