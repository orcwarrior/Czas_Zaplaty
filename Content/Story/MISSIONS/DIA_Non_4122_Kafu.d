// **************************** 
//				EXIT 
// ****************************

instance  Info_Kafu_EXIT (C_INFO)
{
	npc			=	Non_4122_Kafu;
	nr			=	999;
	condition	=	Info_Kafu_EXIT_Condition;
	information	=	Info_Kafu_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Kafu_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Kafu_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Kafu_Hallo (C_INFO)
{
	npc			=	Non_4122_Kafu;
	nr			=	1;
	condition	=	Info_Kafu_Hallo_Condition;
	information	=	Info_Kafu_Hallo_Info;
	permanent	=	0;
	description =	"";
	important = 1;
};                       

FUNC int  Info_Kafu_Hallo_Condition()
{
	if (stone_note_read == TRUE)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID  Info_Kafu_Hallo_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(other, self);
	AI_GotoNpc(other, self);

	AI_Output (self, other,"Info_Kafu_Hallo_04_01"); //Wolny... Znowu wolny. Móc oddychaæ œwie¿ym powietrzem...
	AI_Output (other, self,"Info_Kafu_Hallo_15_02"); //Kim Ty jesteœ?
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"Info_Kafu_Hallo_04_03"); //Nazywam siê Kafu. Onegdaj by³em jednym z magów ziemi. By³em jedynym, który sprzeciwi³ siê Wielkiej Radzie. A Ty prze³ama³eœ czar wi¹¿¹cy mnie w Cytadeli Udrêki...
	AI_Output (other, self,"Info_Kafu_Hallo_15_04"); //(mag wpatrzy³ siê w przestrzeñ za Tob¹, nie przerywasz mu, a on kontynuuje)
	AI_Output (self, other,"Info_Kafu_Hallo_04_05"); //Chcieli wykorzystaæ potêgê kamienia. Nie pozwoli³em im na to! Zniszczy³em kamieñ filozoficzny i wszystkie traktuj¹ce o artefakcie zapiski.
	AI_Output (self, other,"Info_Kafu_Hallo_04_06"); //Wtedy Ci starcy uwiêzili mnie pod ziemi¹, której ca³e ¿ycie s³u¿y³em. Spêdzi³em tam wieki...
	AI_Output (other, self,"Info_Kafu_Hallo_15_07"); //Jak uda³o Ci siê prze¿yæ tak d³ugo?
	AI_Output (self, other,"Info_Kafu_Hallo_04_08"); //Z kamienia zosta³y tylko okruchy, ale nawet tak niewielkie fragmenty zapewniaj¹ d³ugowiecznoœæ.
	AI_Output (other, self,"Info_Kafu_Hallo_15_09"); //Masz taki odprysk przy sobie?
	AI_Output (self, other,"Info_Kafu_Hallo_04_10"); //Tak. Niestety kiedy siedzisz zamkniêty w nieprzebytych ciemnoœciach, przywalony ziemi¹ i kamieniami... Twój umys³ zaczyna rodziæ koszmary...
	AI_Output (self, other,"Info_Kafu_Hallo_04_11"); //Z czasem koszmary te staj¹ siê czêœci¹ Ciebie, rzeczywistoœci¹, bez której nie mo¿esz ¿yæ...
	AI_Output (other, self,"Info_Kafu_Hallo_15_12"); //O czym Ty mówisz?
	AI_Output (self, other,"Info_Kafu_Hallo_04_13"); //G³êboko pod ziemi¹ narodzi³ siê potwór, bestia ¿yj¹ca w moim ciele...
	AI_Output (other, self,"Info_Kafu_Hallo_15_14"); //Nie rozumiem...
	AI_Output (self, other,"Info_Kafu_Hallo_04_15"); //Uwolni³eœ mnie, ale bestia z³akniona jest krwi... Uciekaj, cz³owieku! 
	AI_Output (self, other,"Info_Kafu_Hallo_04_16"); //Uciekaj, póki jeszcze mo¿esz...

	CreateInvItems (self, Fil_Stone,1); 
	B_LogEntry		(CH1_RBL_Stone, "Nieopatrznie z³ama³em czar i uwolni³em jakiegoœ zwariowanego maga. Z tego co mówi³, posiada odprysk kamienia filozoficznego. Ale najpierw muszê go zabiæ...");

	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,true);
};


