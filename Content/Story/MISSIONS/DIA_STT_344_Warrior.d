
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dead_Exit (C_INFO)
{
	npc			= STT_344_Warrior;
	nr			= 999;
	condition	= DIA_Dead_Exit_Condition;
	information	= DIA_Dead_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dead_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dead_Exit_Info()
{

	if (Npc_KnowsInfo(hero,DIA_Dead_Provoke))
	{
		AI_Output (self, other, "DIA_Dead_Exit_05_01"); //Nigdy siê tu nie pokazuj!
	};


	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Dead_Hello (C_INFO)
{
	npc				= STT_344_Warrior;
	nr				= 1;
	condition		= DIA_Dead_Hello_Condition;
	information		= DIA_Dead_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Ciekawe imiê..."; 
};

FUNC INT DIA_Dead_Hello_Condition()
{
	return 1;

};

FUNC VOID DIA_Dead_Hello_Info()
{
	AI_Output (other, self, "DIA_Dead_Hello_15_01"); //Ciekawe imiê...
	AI_Output (self, other, "DIA_Dead_Hello_05_02"); //Masz z tym jakiœ problem, ³achmaniarzu?
	AI_Output (other, self, "DIA_Dead_Hello_15_03"); //Bynajmniej. Ciekaw jestem sk¹d siê wziê³o.
	AI_Output (self, other, "DIA_Dead_Hello_05_04"); //Bo ci¹gnie siê za mn¹ smród zabitych sukinsynów. A teraz zje¿d¿aj!
	B_StopProcessInfos	(self);

};

// **************************************************


INSTANCE DIA_Dead_Provoke (C_INFO)
{
	npc				= STT_344_Warrior;
	nr				= 2;
	condition		= DIA_Dead_Provoke_Condition;
	information		= DIA_Dead_Provoke_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu tak œmierdzi?"; 
};

FUNC INT DIA_Dead_Provoke_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Felos_ArenaOk))&&(Npc_KnowsInfo(hero,DIA_Dead_Hello))
	{

		return 1;

	};

};

FUNC VOID DIA_Dead_Provoke_Info()
{
	AI_Output (other, self, "DIA_Dead_Provoke_15_01"); //Co tu tak œmierdzi?
	AI_Output (self, other, "DIA_Dead_Provoke_05_02"); //¯e co?
	AI_Output (other, self, "DIA_Dead_Provoke_15_03"); //A ju¿ wiem! To strach zmieszany z gównem... Trupismród!
	AI_Output (self, other, "DIA_Dead_Provoke_05_04"); //Ty gnoju! Zap³acisz mi za to krwi¹!
	B_LogEntry		(CH3_Grd_Arena, "Sprowokowa³em Trupismroda.");
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);

}; 
