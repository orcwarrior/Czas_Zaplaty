// **************************** 
//				EXIT 
// ****************************

instance  Info_Nabil_EXIT (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	999;
	condition	=	Info_Nabil_EXIT_Condition;
	information	=	Info_Nabil_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nabil_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nabil_EXIT_Info()
{
	B_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nabil_Hallo (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	1;
	condition	=	Info_Nabil_Hallo_Condition;
	information	=	Info_Nabil_Hallo_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co Ty tu robisz?"; 
};                       

FUNC int  Info_Nabil_Hallo_Condition()
{

	return 1;

};

FUNC VOID  Info_Nabil_Hallo_Info()
{
	AI_Output (other, self,"Info_Nabil_Hallo_15_00"); //Co Ty tu robisz?
	AI_Output (self, other,"Info_Nabil_Hallo_04_01"); //Odpoczywam od natrêtnych przyb³êd. Wynoœ siê!
	B_StopProcessInfos	(self);
};


// ****************************

instance Info_Nabil_Kuva (C_INFO)
{
	npc			=	RBL_4124_Nabil;
	nr			=	2;
	condition	=	Info_Nabil_Kuva_Condition;
	information	=	Info_Nabil_Kuva_Info;
	permanent		= 0;
	important		= 0;
	description		= "To Twój wywar?"; 
};                       

FUNC int  Info_Nabil_Kuva_Condition()
{

	if (Npc_KnowsInfo (hero, DIA_Cavalorn_Kuva))&&(NPC_HasItems(other,ItFo_Nabil_Poison)>=1)

	{
		return 1;
	};

};

FUNC VOID  Info_Nabil_Kuva_Info()
{
	var C_NPC kuv; kuv = Hlp_GetNpc(RBL_4123_Kuva);
	Npc_ChangeAttribute	(kuv, ATR_HITPOINTS, -kuv.attribute[ATR_HITPOINTS_MAX]);

	AI_Output (other, self,"Info_Nabil_Kuva_15_00"); //To Twój wywar?
	AI_Output (self, other,"Info_Nabil_Kuva_04_01"); //Mo¿e i mój. 
	AI_Output (other, self,"Info_Nabil_Kuva_15_03"); //Dlaczego zamkn¹³eœ Kuvê?
	AI_Output (self, other,"Info_Nabil_Kuva_04_04"); //A dlaczego ogieñ parzy?
	AI_Output (other, self,"Info_Nabil_Kuva_15_05"); //Nie odpowiedzia³eœ na moje pytanie.
	AI_Output (self, other,"Info_Nabil_Kuva_04_06"); //Wprost przeciwnie. A musia³em mieæ jakiœ powód?
	AI_Output (other, self,"Info_Nabil_Kuva_15_07"); //Ludzie z regu³y robi¹ coœ z jakiegoœ powodu. Kradn¹, zabijaj¹, ukrywaj¹ siê. Wszystkim rz¹dz¹ jakieœ regu³y, zasady spo³eczne, których trzeba przestrzegaæ.
	AI_Output (self, other,"Info_Nabil_Kuva_04_08"); //Nie ka¿dy robi coœ z okreœlonego powodu. Niektórzy po prostu lubi¹ jak œwiat p³onie.
	AI_Output (other, self,"Info_Nabil_Kuva_15_09"); //A Ty jesteœ jednym z nich?
	AI_Output (self, other,"Info_Nabil_Kuva_04_10"); //Za d³ugo ju¿ tracê na Ciebie czas. Ale o Kuvê nie musisz siê k³opotaæ, niedawno go odwiedzi³em.
	AI_Output (other, self,"Info_Nabil_Kuva_15_11"); //I?
	AI_Output (self, other,"Info_Nabil_Kuva_04_12"); //I jemu jest ju¿ obojêtne czy wydostanie siê z tej klatki.
	AI_Output (other, self,"Info_Nabil_Kuva_15_13"); //Kawa³ z Ciebie skurwiela!
	AI_Output (self, other,"Info_Nabil_Kuva_04_14"); //Nie przymilaj siê i tak Ciê zabijê!

	Log_SetTopicStatus	(CH1_RBL_Cage, LOG_SUCCESS);
	B_LogEntry		(CH1_RBL_Cage, "No i po wszystkim. Kuva nie ¿yje a ja pozna³em szaleñca-anarchistê. Ta Kolonia to rzeczywiœcie popaprane miejsce.");

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};
