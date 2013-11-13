// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	B_StopProcessInfos(self);
};

// ************************************************************

instance DIA_Fletcher_Hi (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 12;
	condition		= DIA_Fletcher_Hi_Condition;
	information		= DIA_Fletcher_Hi_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_Hi_Condition()
{	
	if (grd_NC_pass == FALSE)
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hi_Info()
{
	AI_Output (self, other,"DIA_Fletcher_Hi_06_01"); //A Tyœ co za jeden? ZejdŸ mi z oczu.
	B_StopProcessInfos(self);
};

// ************************************************************
//		
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "GroŸnie wygl¹dasz.";
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (grd_NC_pass)
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //GroŸnie wygl¹dasz.
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Bo jestem niebezpiecznym cz³owiekiem. Nie znam Ciê. Sk¹d siê tu wzi¹³eœ?
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //By³em na patrolu, mieliœmy pecha, napatoczyliœmy siê na bandê z Obozu Rebeliantów. I oto jestem...
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Hmm. Rzeczywiœcie czekaliœmy na wsparcie, ale nie jednoosobowe.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_04"); //Na razie muszê Ci wystarczyæ.
	AI_Output (self, other,"DIA_Fletcher_Hello_06_05"); //Coœ jeszcze?
	AI_Output (other, self,"DIA_Fletcher_Hello_15_06"); //Nic, pójdê siê czegoœ napiæ, mia³em ciê¿ki dzieñ.
};	

// ************************************************************

instance DIA_Fletcher_LaresPunish (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 3;
	condition		= DIA_Fletcher_LaresPunish_Condition;
	information		= DIA_Fletcher_LaresPunish_Info;
	permanent		= 0;
	description		= ".";
};

FUNC int  DIA_Fletcher_LaresPunish_Condition()
{	
	if (lares_done == 3)&&(Npc_GetDistToNpc(self,hero) < 1000)
	{
		return 1;
	};
};

func void  DIA_Fletcher_LaresPunish_Info()
{
	lares_done = 4;
	var C_NPC lar; lar = Hlp_GetNpc(SLV_907_Lares);
	B_FullStop (hero);
	AI_GotoNpc(self, lar);
	AI_TurnToNpc(self, lar);
   
	AI_Output (self, lar,"DIA_Fletcher_LaresPunish_06_01"); //Zdaje siê, ¿e o czymœ zapomnia³eœ szkodniku.
	AI_TurnToNpc(lar, self);
	AI_Output (lar, self,"DIA_Fletcher_LaresPunish_11_02"); //To nie tak jak myœlisz...
	AI_TurnToNpc(other, self);
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_03"); //Sprawa z uciekinierami jest ju¿ za³atwiona.
	AI_TurnToNpc(self, other);
   
	if (Npc_KnowsInfo (hero, DIA_Fletcher_Hello))
	{
		AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_04"); //To znowu Ty...
	}
	else
	{
		AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_05"); //A Tyœ kto?
	};
   
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_06"); //To ich ³by.

	B_GiveInvItems (other, self, HEAD1_org, 1);
	B_GiveInvItems (other, self, HEAD2_org, 1);
	B_GiveInvItems (other, self, HEAD3_org, 1);
	B_GiveInvItems (other, self, HEAD4_org, 1);

	Npc_RemoveInvItems(self,HEAD1_org,1);
	Npc_RemoveInvItems(self,HEAD2_org,1);
	Npc_RemoveInvItems(self,HEAD3_org,1);
	Npc_RemoveInvItems(self,HEAD4_org,1);

	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_07"); //Rzeczywiœcie to tym sukinsynom Lares da³ zbiec.
	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_08"); //No nic, lepiej póŸno ni¿ wcale.
	AI_TurnToNpc(self, lar);
	AI_Output (self, other,"DIA_Fletcher_LaresPunish_06_09"); //Tym razem upiek³o Ci siê szkodniku. Ale bêdê czeka³, a¿ powinie Ci siê noga. Wtedy nie bêdziesz ju¿ mia³ tyle szczêœcia.
	AI_TurnToNpc(other, lar);
	AI_Output (other, self,"DIA_Fletcher_LaresPunish_15_10"); //A to Twoja zguba.
	B_GiveInvItems (other, lar, Lares_Axt, 1);
	AI_EquipBestMeleeWeapon	(lar);
	AI_Output (lar, other,"DIA_Fletcher_LaresPunish_11_11"); //Dziêki przyjacielu... Za wszystko. Jestem Ci winien coœ wiêcej ni¿ przys³ugê.
	B_LogEntry(CH4_NC_RBLBosses, "Mimo spóŸnienia uratowa³em ty³ek Laresowi. Ciekawe, czy powie mi coœ ciekawego?");	
	B_StopProcessInfos(self);

	/***************************
	Fletcher wraca na swoj¹ pocz¹tkow¹ rutynê.
	**************************/

	Npc_ExchangeRoutine(self,"start");
};

// ************************************************************

instance DIA_Fletcher_TheRock (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 4;
	condition		= DIA_Fletcher_TheRock_Condition;
	information		= DIA_Fletcher_TheRock_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_TheRock_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Gorn_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void  DIA_Fletcher_TheRock_Info()
{
	/******************************

Ork niech Fletcher siedzi pod drzewem i kona xD

*****************************/

	B_FullStop (hero);
	AI_GotoNpc(other, self);
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_01"); //No proszê, kolejny idiota chcia³ zostaæ bohaterem... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_02"); //Co tu siê sta³o?!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_03"); //Mieliœmy goœcia... Wyr¿n¹³ wszystkich moich ludzi w nocy...
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_04"); //Mi rozpru³ brzuch... Nie masz pojêcia jakie to uczucie le¿eæ we w³asnych flakach i wdychaæ smród gówna... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_05"); //Kto to by³?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_06"); //Pupilek Kruka... Chêdo¿ony demon. To ten skurwiel wyr¿n¹³ ludzi Hrabiego w Orlim GnieŸdzie. Kiedy zobaczy³em Kruka na blankach wiedzia³em, ¿e ze mn¹ ju¿ koniec.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_07"); //Boisz siê jednego cz³owieka?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_08"); //Kruk to nie cz³owiek... Ktoœ kto brata siê z Beliarem nie jest cz³owiekiem!
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_09"); //Muszê dostaæ siê do Orlego Gniazda.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_10"); //No to masz pecha. Nikt nie wejdzie do sto³pu i nikt z niego nie wyjdzie.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_11"); //A jak Kruk siê tam dosta³?
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_12"); //A sk¹d ja mam to wiedzieæ? Pewnie ma swoje sposoby.
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_13"); //Mów, albo skoñczê to co zacz¹³ ten demon!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_14"); //Cz³owieku, ja ju¿ jestem martwy, rozmawiasz z trupem... (kaszel)
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_15"); //Do cholery, muszê dorwaæ Hrabiego!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_16"); //Nie wiem dlaczego Kruk wys³a³ swoje bestie przeciwko ludziom Hrabiego, ale w¹tpiê, ¿eby ten jeszcze ¿y³. SpóŸni³eœ siê...
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_17"); //Nie wiadomo, dopiero jak dostanê siê do Orlego Gniazda, bêdê mia³ pewnoœæ.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_18"); //Niech Ciê szlag. Nawet umrzeæ nie dasz w spokoju!
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_19"); //Dobra. Mam przy sobie klucz do skrzyni Hrabiego. Znajdziesz j¹ w siedzibie magów.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_20"); //Jest tam jakaœ runa, której ba³em siê u¿yæ. Mo¿e to Ci pomo¿e. 
	AI_Output (other, self,"DIA_Fletcher_TheRock_15_21"); //Mimo wszystko... Dziêki.
	AI_Output (self, other,"DIA_Fletcher_TheRock_06_22"); //Zaczekaj! Pomó¿ mi... Dobij mnie do cholery!
   
   CreateInvItem(self, Duck_key);
   
	B_StopProcessInfos(self);
};

instance DIA_Fletcher_TheRock1 (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 4;
	condition		= DIA_Fletcher_TheRock1_Condition;
	information		= DIA_Fletcher_TheRock1_Info;
	permanent		= 0;
	important		= 1;
	description		= ".";
};

FUNC int  DIA_Fletcher_TheRock1_Condition()
{	
	if (Npc_KnowsInfo (hero, DIA_Fletcher_TheRock))&&(Npc_GetDistToNpc(self,hero) < 1500)
	{
		return 1;
	};
};

func void  DIA_Fletcher_TheRock1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other, self);

   AI_PlayAni(self, "s_woundedb");
	AI_PlayAni(other,"T_YES");
	AI_DrawWeapon (other);
	AI_GotoNpc(other,self);

   AI_PlayAni(other, "T_1HSFINISH");
   
   B_StopProcessInfos(self);
   B_StopProcessInfos(hero);
	Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	AI_RemoveWeapon (other);
	B_LogEntry(CH5_NC_TheRock, "Znalaz³em Fletchera, wszyscy jego ludzie le¿¹ martwi. Podobno za³atwi³ ich demon nas³any przez Kruka. Fletcher twierdzi, ¿e Kruk nas³a³ demony na ludzi Hrabiego, to w³aœnie jego stra¿nicy widzieli na blankach Orlego Gniazda. Dobi³em konaj¹cego stra¿nika, chocia¿ na to nie zas³u¿y³. Przy ciele Fletchera znajdê klucz do kufra Hrabiego, którego mam poszukaæ w opuszczonej siedzibie Magów Wody w Nowym Obozie. Mo¿e w kufrze znajdê coœ, co pomo¿e mi dostaæ siê do kasztelu.");
};