// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Garbus_Exit (C_INFO)
{
	npc			= GreenGobboGarbus;
	nr			= 999;
	condition	= DIA_Garbus_Exit_Condition;
	information	= DIA_Garbus_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garbus_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Garbus_Exit_Info()
{
	B_StopProcessInfos(self);
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Garbus_Hello (C_INFO)
{
	npc				= GreenGobboGarbus;
	nr				= 1;
	condition		= DIA_Garbus_Hello_Condition;
	information		= DIA_Garbus_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Garbus_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_FirstInnos))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Garbus_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Garbus_Hello_11_00"); //Cuchniesz Beliarem! 
	AI_Output (other, self, "DIA_Garbus_Hello_15_01"); //Nie dziwiê siê, niedawno by³em w posiadaniu czegoœ, co konsekrowano na Jego o³tarzu.
	AI_Output (self, other, "DIA_Garbus_Hello_11_02"); //Mój Pan ukaza³ mi prawdê. Przyby³eœ po pos¹¿ek równowagi. 
	AI_Output (other, self, "DIA_Garbus_Hello_15_03"); //Tak, szukam jednej z figurek Tritetry. Mo¿esz mi w tym pomóc?
	AI_Output (self, other, "DIA_Garbus_Hello_11_04"); //Innos pomaga tylko tym, których serca s¹ czyste od k³amstwa i ob³udy. 
	AI_Output (self, other, "DIA_Garbus_Hello_11_05"); //Czyñ dobro, a ja odp³acê Ci podobn¹ monet¹.
	AI_Output (other, self, "DIA_Garbus_Hello_15_06"); //Czego ¿¹dasz w zamian za pos¹¿ek, goblinie?
	AI_Output (self, other, "DIA_Garbus_Hello_11_07"); //Niedawno tam, sk¹d przybywasz, pope³niono zbrodniê kradzie¿y. Niejaki Kufel ukrad³ Œwistakowi sakiewkê.
	AI_Output (self, other, "DIA_Garbus_Hello_11_08"); //Napraw tê niegodziwoœæ, a otrzymasz to, czego szukasz.
	AI_Output (other, self, "DIA_Garbus_Hello_15_09"); //Niech bêdzie.
	B_LogEntry(CH2_RBL_Tritetra, "Dostanê pos¹¿ek Innosa, je¿eli odzyskam dla Œwistaka sakiewkê, któr¹ ukrad³ mu Kufel. Dziwiê siê, ¿e drobna kradzie¿ w dolinie pe³nej skazañców zwróci³a uwagê boga, ale skoro tego ¿¹da, to zapracujê na ten pos¹¿ek.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Garbus_HelloAgain (C_INFO)
{
	npc				= GreenGobboGarbus;
	nr				= 1;
	condition		= DIA_Garbus_HelloAgain_Condition;
	information		= DIA_Garbus_HelloAgain_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Garbus_HelloAgain_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Whistler_Sack))&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Garbus_HelloAgain_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_00"); //Dokona³o siê. Naprawi³eœ wyrz¹dzone z³o.
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_01"); //Tak z ciekawoœci pytam. Dlaczego Twój Pan zainteresowa³ siê jak¹œ tam kradzie¿¹?
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_02"); //W kolonii codziennie dochodzi do du¿o gorszych zbrodni. 
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_03"); //Gdybyœ nie odzyska³ sakiewki, Kufel kupi³by za ni¹ zanieczyszczony bimber. Wielu ludzi straci³oby przez to ¿ycie.
	AI_Output (other, self, "DIA_Garbus_HelloAgain_15_04"); //W¹tpiê, ¿eby bandzie z obozu zaszkodzi³y nawet siki Beliara, a tym bardziej zanieczyszczony alkohol.
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_05"); //Byæ mo¿e, ale teraz ju¿ nie poznamy prawdy.
	AI_Output (self, other, "DIA_Garbus_HelloAgain_11_06"); //Oto Twoja nagroda.
	/*************************
	Przyda³o by siê zrobiæ pos¹¿ek innosa
	*************************/

	CreateInvItems (self, tri_innos_statue,1); 	
	B_GiveInvItems (self, other, tri_innos_statue, 1);
	/****************************
	Nie wiem, jakaœ zmiana rutyny, pfx, etc.
	****************************/
	B_LogEntry(CH2_RBL_Tritetra, "Zdoby³em pos¹¿ek Innosa, muszê go jak najszybciej oddaæ Lerenowi.");
};