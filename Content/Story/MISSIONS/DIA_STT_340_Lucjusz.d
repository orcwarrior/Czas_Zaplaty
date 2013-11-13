// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Luc_Hello (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 1;
	condition		= DIA_Luc_Hello_Condition;
	information		= DIA_Luc_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Luc_Hello_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Hello_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_Output (self, other, "DIA_Luc_Hello_12_01"); //Co to za przystojniak?!
	AI_GotoNpc(self, other);
	AI_Output (self, other, "DIA_Luc_Hello_12_02"); //Ale z ciebie ciacho!
	AI_Output (other, self, "DIA_Luc_Hello_15_03"); //O czym Ty mówisz?
	AI_Output (self, other, "DIA_Luc_Hello_12_04"); //Nie udawaj, ¿e nie wiesz. Z takim ty³eczkiem zajdziesz daleko...
	AI_Output (other, self, "DIA_Luc_Hello_15_05"); //Ekhm... Chyba muszê coœ za³atwiæ. 
	AI_Output (self, other, "DIA_Luc_Hello_12_06"); //Nie uciekaj... Wróæ jeszcze, to dokoñczymy konwersacjê w bardziej przytulnym miejscu.
	B_StopProcessInfos(self);
};

// **************************************************

var int luc_draw;

INSTANCE DIA_Luc_Seaman (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 2;
	condition		= DIA_Luc_Seaman_Condition;
	information		= DIA_Luc_Seaman_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam do Ciebie proœbê."; 
};

FUNC INT DIA_Luc_Seaman_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Hello))&&(Npc_KnowsInfo (hero, DIA_Harf_ProposalOk))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Seaman_Info()
{
	AI_Output (other, self, "DIA_Luc_Seaman_15_01"); //Mam do Ciebie proœbê.
	AI_Output (self, other, "DIA_Luc_Seaman_12_02"); //Dla Ciebie wszystko, mój Ty ogierze!
	AI_Output (other, self, "DIA_Luc_Seaman_15_03"); //(Chyba siê porzygam)
	AI_Output (self, other, "DIA_Luc_Seaman_12_04"); //Mówi³eœ coœ, pulpeciku?
	AI_Output (other, self, "DIA_Luc_Seaman_15_05"); //Nie, nie! Potrzebujê rysunku kobiety, na teraz!
	AI_Output (self, other, "DIA_Luc_Seaman_12_06"); //Kobiety? Przestañ sobie nimi zawracaæ g³owê. To pijawki, do tego co druga to dziwka.
	AI_Output (self, other, "DIA_Luc_Seaman_12_07"); //Ja mogê Ci daæ to, czego nie da Ci ¿adna kobieta!
	AI_Output (other, self, "DIA_Luc_Seaman_15_08"); //Nie w¹tpiê, ale bardzo zale¿y mi na tym rysunku. Najlepiej niech bêdzie akt.
	AI_Output (self, other, "DIA_Luc_Seaman_12_09"); //No dobra, cukiereczku. Zrobiê to dla Ciebie na jutro. Ale bêdziesz musia³ mi siê odwdziêczyæ.
	AI_Output (other, self, "DIA_Luc_Seaman_15_10"); //Oczywiœcie. To do jutra...
	
   luc_draw = B_SetDayTolerance()+1;
	B_LogEntry(CH3_Grd_Thief, "Lucjusz przygotuje akt na jutro. Cholera, a¿ siê bojê myœleæ, co on mo¿e chcieæ w zamian.");
};

// **************************************************

INSTANCE DIA_Luc_Draw (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 3;
	condition		= DIA_Luc_Draw_Condition;
	information		= DIA_Luc_Draw_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Luc_Draw_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Seaman))&&(luc_draw <= (Wld_GetDay()))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Draw_Info()
{
	AI_Output (self, other, "DIA_Luc_Draw_12_01"); //Gdzie siê podziewa³eœ, cukiereczku?
	AI_Output (other, self, "DIA_Luc_Draw_15_02"); //To tu, to tam. Skoñczy³eœ rysunek?
	AI_Output (self, other, "DIA_Luc_Draw_12_03"); //Przed chwileczk¹. Oto twój kobiecy akt.

	CreateInvItems (self,akt,1);
	B_GiveInvItems (self, other, akt, 1);

	B_UseFakeScroll(other);
	AI_Output (other, self, "DIA_Luc_Draw_15_04"); //Œwietna robota, wygl¹da jak ¿ywa!
	AI_Output (self, other, "DIA_Luc_Draw_12_05"); //Cieszê siê, ¿e Ci siê podoba. Teraz mo¿emy wreszcie porozmawiaæ o wyrazach wdziêcznoœci...
	AI_Output (other, self, "DIA_Luc_Draw_15_06"); //S³yszysz ten ha³as? Rebelianci atakuj¹ obóz!
	AI_Output (self, other, "DIA_Luc_Draw_12_07"); //Œwietnie, w koñcu poznam tych zaroœniêtych brutali!
	
   B_LogEntry(CH3_Grd_Thief, "Uff, uda³o mi siê uciec. Mam te¿ kobiecy akt. Czas porozmawiaæ z Velay¹.");
	B_StopProcessInfos(self);
};

// **************************************************

INSTANCE DIA_Luc_Miss (C_INFO)
{
	npc				= STT_340_Lucjusz;
	nr				= 4;
	condition		= DIA_Luc_Miss_Condition;
	information		= DIA_Luc_Miss_Info;
	permanent		= 0;
	important		= 0;
	description		= "Muszê ju¿ iœæ!"; 
};

FUNC INT DIA_Luc_Miss_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Luc_Draw))
	{
		return 1;
	};
};

FUNC VOID DIA_Luc_Miss_Info()
{
	AI_Output (other, self, "DIA_Luc_Miss_15_00"); //Muszê ju¿ iœæ!
	AI_Output (self, other, "DIA_Luc_Miss_12_01"); //Nie têsknisz za mn¹?
	AI_Output (other, self, "DIA_Luc_Miss_15_02"); //Ani trochê!
	AI_Output (self, other, "DIA_Luc_Miss_12_03"); //Niewdziêczny troglodyta! IdŸ ju¿ sobie!
	B_StopProcessInfos(self);
}; 
