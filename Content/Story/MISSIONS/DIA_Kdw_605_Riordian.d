// ***************************** INFOS ****************************************//

instance KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jestem ranny. Mo¿esz coœ na to poradziæ?"; 
};

FUNC int KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	{
		return TRUE;
	};
};

FUNC void KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Jestem ranny. Mo¿esz coœ na to poradziæ?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Tymi s³owy przywo³ujê uzdrawiaj¹c¹ si³ê! Niech Twe cia³o i duch znów zaznaj¹ spokoju!
	
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play("MFX_Heal_Cast");
	B_StopProcessInfos(self);
	Wld_PlayEffect("spellFX_INCOVATION_BLUE", self, self, 1, 0, DAM_MAGIC, FALSE);	
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Witaj, magu!"; 
};

FUNC int KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};

FUNC void KDW_605_Riordian_GREET_Info()
{
	AI_Output(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Witaj, magu!
	AI_Output(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Jestem Riordian, alchemik. Zgadujê, ¿e szukasz magicznego napoju?
	
   Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Riordian, jeden z magów wody, sprzedaje magiczne wywary. Znajdê go w laboratorium alchemicznym, na górnym poziomie.");
};

/*------------------------------------------------------------------------
							Ornamenty								
------------------------------------------------------------------------*/

instance KDW_605_Riordian_All (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_All_Condition;
	information		= KDW_605_Riordian_All_Info;
	important		= 0;
	permanent		= 0;
	description		= "Odnalaz³em wszystkie ornamenty."; 
};

FUNC int KDW_605_Riordian_All_Condition()
{
	return ritual_time_ok;
};

FUNC void KDW_605_Riordian_All_Info()
{
	AI_Output(other, self,"KDW_605_Riordian_All_Info_15_01"); //Odnalaz³em wszystkie ornamenty.
	
   if (ornament_wait >= Wld_GetDay())
	{
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_02"); //Dokona³eœ wielkiego czynu!
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_03"); //WeŸ w podziêce za trud te mikstury.
		
      CreateInvItems (self, ItFo_Potion_Health_01,	5); 
		B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	5);
		CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
		CreateInvItems (hero, ItFo_Potion_Health_02,	3);
		CreateInvItems (hero, ItFo_Potion_Mana_02,		3);
		CreateInvItems (hero, ItFo_Potion_Health_03,	1);
		CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
		CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
      
		AI_Output(other, self,"KDW_605_Riordian_All_Info_15_04"); //Bardzo siê przydadz¹, dziêkujê. Saturas prosi³, abyœ poszed³ na dziedziniec.
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_05"); //Ruszê natychmiast!
		B_LogEntry(CH3_NON_Ornament, "Riordian prócz podziêki, podarowa³ mi te¿ u¿yteczne mikstury, zanim ruszy³ na wezwanie.");
		Npc_ExchangeRoutine(self,"RIT");
	}
	else
	{
		AI_Output(self, other,"KDW_605_Riordian_All_Info_14_06"); //SpóŸni³eœ siê. Twój wysi³ek poszed³ na marne...
	};
   
	B_StopProcessInfos(self);
};  
