// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Homer_EXIT (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 999;
	condition	= DIA_Homer_EXIT_Condition;
	information	= DIA_Homer_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Homer_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_EXIT_Info()
{	
	B_StopProcessInfos	(self);
};

// ************************************************************
// 						Damm gebaut
// ************************************************************

INSTANCE DIA_Homer_BuiltDam (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 1;
	condition	= DIA_Homer_BuiltDam_Condition;
	information	= DIA_Homer_BuiltDam_Info;
	permanent	= 0;
	description = "Czy to TY zbudowa³eœ tamê, o której wszyscy mówi¹?";
};                       

FUNC INT DIA_Homer_BuiltDam_Condition()
{
	return 1;
};

FUNC VOID DIA_Homer_BuiltDam_Info()
{	
	AI_Output (other, self,"DIA_Homer_BuiltDam_15_00"); //Czy to TY zbudowa³eœ tamê, o której wszyscy mówi¹?
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_01"); //Tak, to by³o w czasach rozwkitu Nowego Obozu.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_02"); //To by³o spore wyzwanie. Konstrukcja jest prosta, ale musieliœmy dr¹¿yæ w dnie, aby wbiæ bale, na których osadziliœmy tamê.
	AI_Output (self, other,"DIA_Homer_BuiltDam_02_03"); //To moje najwspanialsze dzie³o!
};

// ************************************************************

INSTANCE DIA_Homer_Again (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 2;
	condition	= DIA_Homer_Again_Condition;
	information	= DIA_Homer_Again_Info;
	permanent	= 0;
	description 	= "Opowiedz mi coœ wiêcej o tamie.";
};                       

FUNC INT DIA_Homer_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_BuiltDam))&&(Npc_KnowsInfo (hero, DIA_Sher_Hlp))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again_15_00"); //Opowiedz mi coœ wiêcej o tamie.
	AI_Output (self, other,"DIA_Homer_Again_02_01"); //Naprawdê chcesz pos³uchaæ?
	AI_Output (other, self,"DIA_Homer_Again_15_02"); //Pewnie!
	AI_Output (self, other,"DIA_Homer_Again_02_03"); //To moje najwiêksze dzie³o! Zaprojektowa³em j¹, kiedy Nowy Obóz dopiero budzi³ siê do ¿ycia.
	AI_Output (self, other,"DIA_Homer_Again_02_04"); //Wzi¹³em pod uwagê nacisk ciê¿aru tamy na podmok³y grunt. Dlatego wczeœniej kaza³em wbiæ ogromne pale.
	AI_Output (self, other,"DIA_Homer_Again_02_05"); //Nie zanudzam ciê?
};

// ************************************************************

INSTANCE DIA_Homer_Again1 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 3;
	condition	= DIA_Homer_Again1_Condition;
	information	= DIA_Homer_Again1_Info;
	permanent	= 0;
	description 	= "Mów dalej.";
};                       

FUNC INT DIA_Homer_Again1_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again1_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again1_15_00"); //Mów dalej.
	AI_Output (self, other,"DIA_Homer_Again1_02_01"); //W koñcu trafi³em na kogoœ, z kim warto porozmawiaæ!
	AI_Output (self, other,"DIA_Homer_Again1_02_02"); //Jak ju¿ mówi³em, tama to solidna robota, ale te¿ i finezyjna.
	AI_Output (self, other,"DIA_Homer_Again1_02_03"); //Wiesz, ¿e u¿y³em drzewa cedrowego, a nie bukowego, ¿eby ca³a konstrukcja by³a bardziej elastyczna?
};

// ************************************************************

INSTANCE DIA_Homer_Again2 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 4;
	condition	= DIA_Homer_Again2_Condition;
	information	= DIA_Homer_Again2_Info;
	permanent	= 0;
	description 	= "To niesamowite, mów dalej.";
};                       

FUNC INT DIA_Homer_Again2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again1))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again2_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again2_15_00"); //To niesamowite, mów dalej.
	AI_Output (self, other,"DIA_Homer_Again2_02_01"); //U¿y³em specjalnych wêz³ów do spajania belek. Dodatkowo wszystkie s¹ zbite krzy¿owymi klinami.
	AI_Output (self, other,"DIA_Homer_Again2_02_02"); //Tamê mo¿na bez problemu rozbudowaæ, a nawet rozebraæ i przetransportowaæ gdzie indziej.
};

// ************************************************************

INSTANCE DIA_Homer_Again3 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 5;
	condition	= DIA_Homer_Again3_Condition;
	information	= DIA_Homer_Again3_Info;
	permanent	= 0;
	description 	= "Jesteœ prawdziwym geniuszem!";
};                       

FUNC INT DIA_Homer_Again3_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again2))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again3_Info()
{	
	AI_Output (other, self,"DIA_Homer_Again3_15_00"); //Jesteœ prawdziwym geniuszem!
	AI_Output (self, other,"DIA_Homer_Again3_02_01"); //Te¿ tak uwa¿am, he, he.
	AI_Output (self, other,"DIA_Homer_Again3_02_02"); //Najad³em siê sporo strachu, kiedy jakiœ cholerny topielec podgryza³ konstrukcjê, ale to by³y tylko przejœciowe k³opoty.
	AI_Output (self, other,"DIA_Homer_Again3_02_03"); //Najwa¿niejsze, ¿e tama wznosi siê dumnie i niestrudzenie walczy z ¿ywio³em wody.
};

// ************************************************************

INSTANCE DIA_Homer_Again4 (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 6;
	condition	= DIA_Homer_Again4_Condition;
	information	= DIA_Homer_Again4_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC INT DIA_Homer_Again4_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again3))
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Again4_Info()
{	
	AI_Output (self, other,"DIA_Homer_Again4_02_01"); //Nikt dot¹d nie doceni³ mojego dzie³a.
	AI_Output (other, self,"DIA_Homer_Again4_15_02"); //Bo do Kolonii trafiaj¹ sami g³upcy! To co robisz, to czego dokona³eœ - to prawdziwe cudo!
	AI_Output (self, other,"DIA_Homer_Again4_02_03"); //Zawstydzasz mnie...
	AI_Output (other, self,"DIA_Homer_Again4_15_04"); //Szkoda tylko, ¿e nie mo¿esz nadal tworzyæ tak wspania³ych dzie³.
	AI_Output (self, other,"DIA_Homer_Again4_02_05"); //Te¿ nad tym ubolewam.
	AI_Output (other, self,"DIA_Homer_Again4_15_06"); //Hmm. Istnieje pewne wyjœcie.
	AI_Output (self, other,"DIA_Homer_Again4_02_07"); //Jakie?
	AI_Output (other, self,"DIA_Homer_Again4_15_08"); //Na powierzchni nied³ugo wybuchnie rebelia. Kiedy zdo³amy obaliæ stra¿ników, znowu bêdziesz móg³ tworzyæ swoje dzie³a.
	AI_Output (other, self,"DIA_Homer_Again4_15_09"); //Ale trzeba cierpliwie czekaæ na odpowiedni¹ chwilê, która wkrótce nadejdzie.
	AI_Output (other, self,"DIA_Homer_Again4_15_10"); //Do tego czasu ka¿dy musi pracowaæ na powodzenie powstania. W kopalni brakuje kopaczy, ka¿dy z nas musi wzmo¿yæ wysi³ki, ¿eby zamydliæ oczy stra¿nikom.
	AI_Output (self, other,"DIA_Homer_Again4_02_11"); //Praca ku wolnoœci? W zasadzie gotów jestem na takie poœwiêcenie...
	AI_Output (other, self,"DIA_Homer_Again4_15_12"); //Kilka przepracowanych dni wartych jest wolnoœci. Bêdziesz móg³ wtedy zaprojektowaæ kolejne dzie³o.
	AI_Output (self, other,"DIA_Homer_Again4_02_13"); //Masz racjê! Tak w³aœnie zrobiê. Cholera, gdzie jest mój kilof?
	B_LogEntry		(CH4_GRD_NewMine, "Przekona³em Homera, ale ten idiota zgubi³ gdzieœ swój kilof! Muszê rozejrzeæ siê za jego narzêdziem pracy.");
};

// ************************************************************

INSTANCE DIA_Homer_Pickaxe (C_INFO)
{
	npc			= SLV_935_Homer;
	nr			= 7;
	condition	= DIA_Homer_Pickaxe_Condition;
	information	= DIA_Homer_Pickaxe_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Mam dla Ciebie kilof.";
};                       

FUNC INT DIA_Homer_Pickaxe_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Homer_Again4))&&(NPC_HasItems(other,ItMwPickaxe)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Homer_Pickaxe_Info()
{	
	miners_work = miners_work + 1;
	AI_Output (other, self,"DIA_Homer_Pickaxe_15_01"); //Mam dla Ciebie kilof.
	B_GiveInvItems (other, self, ItMwPickaxe, 1);
	AI_Output (self, other,"DIA_Homer_Pickaxe_02_02"); //To wspaniale, ruszam do pracy.
	AI_Output (self, other,"DIA_Homer_Pickaxe_02_03"); //Kiedy to wszystko siê skoñczy, zaprojektujê ogromny wiatrak... O i mur widoczny z Ksiê¿yca!
	B_GiveXP(250);	
	B_LogEntry		(CH4_GRD_NewMine, "Nie by³o ³atwo, ale Homer te¿ weŸmie siê do pracy.");
	B_StopProcessInfos	(self);

	/***************
	rutyna kopania rudy
	**************/
	Npc_ExchangeRoutine(self,"Pick");
	
	var C_NPC vlk2; vlk2 = Hlp_GetNpc(VLK_5003_Buddler);
	Npc_ExchangeRoutine(vlk2,"GO");
}; 
