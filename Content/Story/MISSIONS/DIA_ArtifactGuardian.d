// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ArtifactGuardian_EXIT (C_INFO)
{
	npc			= ArtifactGuardian;
	nr			= 999;
	condition	= DIA_ArtifactGuardian_EXIT_Condition;
	information	= DIA_ArtifactGuardian_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ArtifactGuardian_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ArtifactGuardian_EXIT_Info()
{	
	B_StopProcessInfos(self);
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_ArtifactGuardian_Hello (C_INFO)
{
	npc			= ArtifactGuardian;
	nr			= 1;
	condition	= DIA_ArtifactGuardian_Hello_Condition;
	information	= DIA_ArtifactGuardian_Hello_Info;
	important	= 1;
	description	= "Ciuœ ciuœ Sher nie uzywaj wiêcej gothic sourcera :D";//Spadaj Ork :D
};                       

FUNC INT DIA_ArtifactGuardian_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ArtifactGuardian_Hello_Info()
{	
	AI_Output(self, other,"DIA_ArtifactGuardian_Hello_19_00"); //WY NÊDZNE ŒMIERTELNE STWORZONKA, NIE WIECIE KIEDY PRZESTAÆ!
	Info_ClearChoices(DIA_ArtifactGuardian_Hello );
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"ZejdŸ mi z drogi umarlaku!"	,DIA_ArtifactGuardian_GoAway);
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"Gadaj¹cy truposz?"	,DIA_ArtifactGuardian_StopWhat);
};
FUNC VOID DIA_ArtifactGuardian_GoAway()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_00"); //ZejdŸ mi z drogi umarlaku!
	AI_Output(self, other,"DIA_ArtifactGuardian_GoAway_19_01"); //TEN ARTEFAKT CZEKA NA WYBRAÑCA, KTÓRY BÊDZIE W STANIE POJ¥Æ JEGO POTÊGÊ I ROZWA¯NIE JEJ...
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_02"); //Znowu jakieœ pierdolenie o wybrañcach. Rozumiem, ¿e nie oddasz œwiecide³ka po dobroci?
	AI_Output(self, other,"DIA_ArtifactGuardian_GoAway_19_03"); //ON NIE JEST TOBIE PRZEZNACZONY!
	AI_Output(other, self,"DIA_ArtifactGuardian_GoAway_15_04"); //Dobra, miejmy to ju¿ za sob¹.
	B_StopProcessInfos(self);	
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
FUNC VOID DIA_ArtifactGuardian_StopWhat()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_StopWhat_15_00"); //Gadaj¹cy truposz?
	AI_Output(self, other,"DIA_ArtifactGuardian_StopWhat_19_01"); //PRÓBUJESZ POSI¥ŒÆ MOC, KTÓREJ NIE POJMUJESZ, TA POTÊGA NIE DO CIEBIE NALE¯EÆ BÊDZIE.
	Info_ClearChoices(DIA_ArtifactGuardian_Hello );
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"A ja chcia³em po dobroci..."	,DIA_ArtifactGuardian_BelongToMe);
	Info_AddChoice(DIA_ArtifactGuardian_Hello,"Sporo gadasz jak na truposza."	,DIA_ArtifactGuardian_UAreStupid);

};
FUNC VOID DIA_ArtifactGuardian_BelongToMe()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_BelongToMe_15_00"); //A ja chcia³em po dobroci...
	B_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
FUNC VOID DIA_ArtifactGuardian_UAreStupid()
{	
	AI_Output(other, self,"DIA_ArtifactGuardian_UAreStupid_15_00"); //Sporo gadasz jak na truposza.
	AI_Output(self, other,"DIA_ArtifactGuardian_UAreStupid_19_01"); //MILCZ ŒMIERTELNIKU! NIE JESTEŒ W STANIE POJ¥Æ POTÊGI MAGII BELIARA!
	AI_Output(other, self,"DIA_ArtifactGuardian_UAreStupid_15_02"); //Do tego od rzeczy. Mo¿emy mieæ to ju¿ za sob¹?
	AI_Output(self, other,"DIA_ArtifactGuardian_UAreStupid_19_03"); //ARGH!!! ZAMILKNIJ NA WIEKI!
	B_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_Attack(self);	
	Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1, 0, DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)
	Wld_SpawnNpcRange(self,	Skeleton, 1, 200);
	Wld_SpawnNpcRange(self,	Skeleton, 1, 200);	
	Npc_SetAivar(self,AIV_MM_TALKEDAFTERATTACK,  TRUE);
};
