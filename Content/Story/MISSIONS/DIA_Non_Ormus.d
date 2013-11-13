
// ************************************************************
// 			  				   EXIT 
// ************************************************************


INSTANCE Info_Ormus_EXIT(C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 999;
	condition			= Info_Ormus_EXIT_Condition;
	information			= Info_Ormus_EXIT_Info;
	permanent			= 1;
	description 		= DIALOG_ENDE;
};                       

FUNC INT Info_Ormus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Ormus_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 		Hello
// ************************************************************

INSTANCE Info_Ormus_Hello (C_INFO)
{
	npc		= Grd_616_Gardist;
	nr			= 1;
	condition		= Info_Ormus_Hello_Condition;
	information		= Info_Ormus_Hello_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Czym siê zajmujesz?";
};                       

FUNC INT Info_Ormus_Hello_Condition()
{	


	return 1;

};
FUNC VOID Info_Ormus_Hello_Info()
{	
	AI_Output (other, self,"Info_Ormus_Hello_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"Info_Ormus_Hello_06_01"); //Pilnujê, ¿eby te leniwe ³achudry zrobi³y co do nich nale¿y.
	AI_Output (other, self,"Info_Ormus_Hello_15_02"); //To pewnie siê nie nudzisz?
	AI_Output (self, other,"Info_Ormus_Hello_06_03"); //¯ebyœ wiedzia³, piæ siê cz³owiekowi chce, a nijak zejœæ z posterunku.
	AI_Output (self, other,"Info_Ormus_Hello_06_04"); //Ech, pieskie ¿ycie stra¿nika.

};




// ************************************************************

INSTANCE Info_Ormus_Again (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 2;
	condition		= Info_Ormus_Again_Condition;
	information		= Info_Ormus_Again_Info;
	important		=0;
	permanent		= 0;
	description 	= "S³ysza³eœ o œmierci niemowy?";
};                       

FUNC INT Info_Ormus_Again_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ormus_Hello ))&& (Npc_KnowsInfo (hero, Info_Nia_Def1))
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Again_Info()
{	
	AI_Output (other, self,"Info_Ormus_Again_15_01"); //S³ysza³eœ o œmierci niemowy?
	AI_Output (self, other,"Info_Ormus_Again_06_02"); //A co mia³em nie s³yszeæ? Na g³upotê nie ma lekarstwa.
	AI_Output (other, self,"Info_Ormus_Again_15_03"); //Ale dlaczego rzuci³ siê na Niê?
	AI_Output (self, other,"Info_Ormus_Again_06_04"); //Pewnie za d³ugo by³ trzeŸwy. 
	AI_Output (self, other,"Info_Ormus_Again_06_05"); //Cholera napi³bym siê piwa...
};




// ************************************************************

INSTANCE Info_Ormus_Again1 (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_Again1_Condition;
	information		= Info_Ormus_Again1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Mam coœ mocniejszego...";
};                       

FUNC INT Info_Ormus_Again1_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Ormus_Again))&& (Npc_HasItems (other,ItFobeer)>=1)
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Again1_Info()
{	

	investigation = investigation + 1;
	AI_Output (other, self,"Info_Ormus_Again1_15_01"); //Mam coœ mocniejszego...
	AI_Output (self, other,"Info_Ormus_Again1_06_02"); //Toœ mi brat!
	AI_Output (other, self,"Info_Ormus_Again1_15_03"); //Nie tak szybko. Mam kilka pytañ.
	AI_Output (self, other,"Info_Ormus_Again1_06_04"); //No dobra. Tylko siê pospiesz bo zasch³o mi w gardle.
	AI_Output (other, self,"Info_Ormus_Again1_15_05"); //Co wiesz o œmierci niemowy?
	AI_Output (self, other,"Info_Ormus_Again1_06_06"); //Tyle co ka¿dy. Georg zrobi³ z nim porz¹dek.
	AI_Output (other, self,"Info_Ormus_Again1_15_07"); //Ale dlaczego rzuci³ siê na Niê?
	AI_Output (self, other,"Info_Ormus_Again1_06_08"); //A sk¹d mam wiedzieæ? Nie jestem cholern¹ wró¿k¹!
	AI_Output (other, self,"Info_Ormus_Again1_15_09"); //Nie ma to jak ch³odne piwko...
	AI_UseItem (other,ItFobeer);
	CreateInvItems (other, ItFobeer,1);
	AI_Output (self, other,"Info_Ormus_Again1_06_10"); //Niech Ciê szlag! Dobra, coœ widzia³em.
	AI_Output (self, other,"Info_Ormus_Again1_06_11"); //Nia to cholerna, niewy¿yta suka. 
	AI_Output (self, other,"Info_Ormus_Again1_06_12"); //Kilka dni temu poszed³em w nocy siê odlaæ.
	AI_Output (self, other,"Info_Ormus_Again1_06_13"); //Sta³em w mroku, nikt mnie nie widzia³.
	AI_Output (self, other,"Info_Ormus_Again1_06_14"); //Nia zbli¿y³a siê do stra¿nika, który akurat mia³ wartê na murze.
	AI_Output (self, other,"Info_Ormus_Again1_06_15"); //Myœla³em, ¿e mu odgryzie wacka. Zniknêli za stert¹ drewna, a ja nie mia³em ochoty sprawdzaæ co robi¹.
	AI_Output (other, self,"Info_Ormus_Again1_15_16"); //To jeszcze o niczym nie œwiadczy.
	AI_Output (self, other,"Info_Ormus_Again1_06_17"); //Gdyby nie fakt, ¿e stra¿nika znaleŸli na drugi dzieñ uduszonego w³asnymi genitaliami.
	AI_Output (self, other,"Info_Ormus_Again1_06_18"); //Ktoœ mu obci¹³ kutasa i wsadzi³ w gard³o. To jest chore... Trudno mi znaleŸæ w³aœciwe s³owo.
	AI_Output (other, self,"Info_Ormus_Again1_15_19"); //Skoro to widzia³eœ to dlaczego nie powiedzia³eœ nic Krisowi?
	AI_Output (self, other,"Info_Ormus_Again1_06_20"); //A myœlisz, ¿e by mi uwierzy³? 
	AI_Output (self, other,"Info_Ormus_Again1_06_21"); //Wszyscy wiedz¹, ¿e chlejê ile tylko siê da. Kiedyœ próbowa³em coœ napomkn¹æ.
	AI_Output (self, other,"Info_Ormus_Again1_06_22"); //Kris da³ mi kopa i powiedzia³, ¿e mia³em zwidy.
	AI_Output (other, self,"Info_Ormus_Again1_15_23"); //Hmm, mo¿e mia³ racjê?
	AI_Output (self, other,"Info_Ormus_Again1_06_24"); //Powiedzia³em co chcia³eœ, dawaj piwo!
	B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"Info_Ormus_Again1_06_25"); //Od razu lepiej. Tylko nie gadaj o tym co Ci powiedzia³em.
	AI_Output (other, self,"Info_Ormus_Again1_15_26"); //Pewnie, w koñcu kto by uwierzy³ moczymordzie.
	AI_Output (self, other,"Info_Ormus_Again1_06_27"); //Dok³adnie, bywaj.

	B_LogEntry		(CH4_Non_Eagle, "Ile mo¿na dostaæ w zamian za butelkê piwa. Ormus twierdzi, ¿e widzia³ jak Nia spó³kowa³a ze stra¿nikiem, którego znaleziono martwego na drugi dzieñ. Ta historia zaczyna coraz bardziej œmierdzieæ.");
};




// ************************************************************

INSTANCE Info_Ormus_Meet (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_Meet_Condition;
	information		= Info_Ormus_Meet_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Znowu Ciê suszy?";
};                       

FUNC INT Info_Ormus_Meet_Condition()
{	

	if (Npc_KnowsInfo (hero, Info_Nia_Meet))
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_Meet_Info()
{	
	AI_Output (other, self,"Info_Ormus_Meet_15_01"); //Znowu Ciê suszy?
	AI_Output (self, other,"Info_Ormus_Meet_06_02"); //Jak zawsze. Zaczyna kiedy otwieram oczy. A co masz jak¹œ niepotrzebn¹ butelczynê?
	AI_Output (other, self,"Info_Ormus_Meet_15_03"); //Mo¿e i mam, ale nic za darmo.
	AI_Output (self, other,"Info_Ormus_Meet_06_04"); //Kogo mam zabiæ?
	AI_Output (other, self,"Info_Ormus_Meet_15_05"); //To Nia morduje. Chcê udowodniæ Krisowi, ¿e trzeba z tym skoñczyæ raz na zawsze.
	AI_Output (other, self,"Info_Ormus_Meet_15_06"); //Umówi³em siê z ni¹, Pinto bêdzie œwiadkiem. Ale potrzebujê te¿ innych, którzy potwierdz¹ winê dziwki.
	AI_Output (other, self,"Info_Ormus_Meet_15_07"); //Pomo¿esz?
	AI_Output (self, other,"Info_Ormus_Meet_06_08"); //Daj mi chwilê na zastanowienie, ale lepiej ¿ebyœ mia³ tê flaszkê piwa.
};



// ************************************************************

INSTANCE Info_Ormus_MeetAgain (C_INFO)
{
	npc			= Grd_616_Gardist;
	nr			= 3;
	condition		= Info_Ormus_MeetAgain_Condition;
	information		= Info_Ormus_MeetAgain_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Namyœli³eœ siê?";
};                       

FUNC INT Info_Ormus_MeetAgain_Condition()
{	

	if (Npc_KnowsInfo (hero,  Info_Ormus_Meet))&& (Npc_HasItems (other,ItFobeer)>=1)
	{
		return 1;
	};

};
FUNC VOID Info_Ormus_MeetAgain_Info()
{	
	AI_Output (other, self,"Info_Ormus_MeetAgain_15_01"); //Namyœli³eœ siê?
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_02"); //Dla piwa zrobiê wszystko. Daj flaszkê!
	B_GiveInvItems (other, self, ItFoBeer, 1);
	AI_UseItem (self,ItFobeer);
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_03"); //Tego mi brakowa³o.
	AI_Output (self, other,"Info_Ormus_MeetAgain_06_04"); //W porz¹dku, pobawiê siê w podgl¹dacza.
	AI_Output (other, self,"Info_Ormus_MeetAgain_15_05"); //Dziêki. Pamiêtaj, po zmroku i nie wychylaj siê z cienia.
	B_LogEntry		(CH4_Non_Eagle, "Ormus pobawi siê w podgl¹dacza.");
}; 
