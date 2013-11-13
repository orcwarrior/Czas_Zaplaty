// ****************************** 
//				EXIT 
// ******************************

INSTANCE   SLV_907_Lares_Exit (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 999;
	condition	= SLV_907_Lares_Exit_Condition;
	information	= SLV_907_Lares_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  SLV_907_Lares_Exit_Condition()
{
	return 1;
};

FUNC VOID  SLV_907_Lares_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ****************************** 
//			hi
// ******************************

INSTANCE DIA_Lares_Hi (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 1;
	condition	= DIA_Lares_Hi_Condition;
	information	= DIA_Lares_Hi_Info;
	permanent	= 0;
	description = "Uprawiacie ry¿?";
};                       

FUNC int DIA_Lares_Hi_Condition()
{
	return 1;
};

FUNC VOID DIA_Lares_Hi_Info()
{
	AI_Output (other, self,"DIA_Lares_Hi_15_00"); //Uprawiacie ry¿?
	AI_Output (self, other,"DIA_Lares_Hi_11_01"); //Nie, wyrabiamy dzbanki z gliny.
	AI_Output (self, other,"DIA_Lares_Hi_11_02"); //Jestem zajêty, przyjdŸ póŸniej.
};

// ******************************

INSTANCE DIA_Lares_Again (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 2;
	condition		= DIA_Lares_Again_Condition;
	information		= DIA_Lares_Again_Info;
	permanent		= 0;
	important		= 0;
	description = "Podobno nie ¿yczysz za dobrze stra¿nikom?";
};                       

FUNC int DIA_Lares_Again_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Gorn_RebelTalk))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_Again_Info()
{
	AI_Output (other, self,"DIA_Lares_Again_15_00"); //Podobno nie ¿yczysz za dobrze stra¿nikom?
	AI_Output (self, other,"DIA_Lares_Again_11_01"); //Ciszej cz³owieku! Nawet je¿eli to prawda to siê z tym nie manifestujê.
	AI_Output (self, other,"DIA_Lares_Again_11_02"); //Kim jesteœ i czego chcesz?
	AI_Output (other, self,"DIA_Lares_Again_15_03"); //Przysy³a mnie Cavalorn. Dosz³y nas s³uchy, ¿e w Nowym Obozie szykuj¹ siê... zmiany na lepsze.
	AI_Output (self, other,"DIA_Lares_Again_11_04"); //Czyli jesteœ wys³annikiem rebeliantów. Czy¿by Cavalorn i tutaj chcia³ wœciubiæ nos?
	AI_Output (other, self,"DIA_Lares_Again_15_05"); //Byæ mo¿e. Wrogowie naszych wrogów s¹ naszymi przyjació³mi.
	AI_Output (self, other,"DIA_Lares_Again_11_06"); //Ta, a ¿ona przyjaciela jest tak¿e nasz¹ przyjació³k¹, he, he. 
	AI_Output (self, other,"DIA_Lares_Again_11_07"); //No to nas znalaz³eœ, rozgl¹daj siê do woli.
	AI_Output (other, self,"DIA_Lares_Again_15_08"); //Powiesz mi coœ wiêcej o tym co szykujecie?
	AI_Output (self, other,"DIA_Lares_Again_11_09"); //Uwa¿asz mnie za idiotê? Mo¿e i przys³a³ ciê Cavalorn, ale to za ma³o.
	AI_Output (self, other,"DIA_Lares_Again_11_10"); //Powiem Ci coœ wiêcej je¿eli wyœwiadczysz mi drobn¹ przys³ugê.
	AI_Output (other, self,"DIA_Lares_Again_15_11"); //Chyba nie mam wyboru. Co to za 'drobna' przys³uga?
	AI_Output (self, other,"DIA_Lares_Again_11_12"); //Odk¹d stra¿nicy zrobili tu swoj¹ piaskownicê mam na g³owie zbiory ry¿u i dostawy paczek z ry¿em do gospody na wyspie.
	AI_Output (self, other,"DIA_Lares_Again_11_13"); //Ry¿ to podstawowe po¿ywienie niewolników, jak nas nazywaj¹ stra¿nicy. W karczmie pêdz¹ z niego ry¿ówkê, wiêc œmia³o mo¿na powiedzieæ, ¿e to Bia³e Z³oto Kolonii.
	AI_Output (self, other,"DIA_Lares_Again_11_14"); //Wykopa³em wszystkich do zbierania tego cholerstwa bo nie wyrabiamy limitów odk¹d kilku szkodników da³o nogê.
	AI_Output (other, self,"DIA_Lares_Again_15_15"); //Uciekli?
	AI_Output (self, other,"DIA_Lares_Again_11_16"); //Cholerne sukinsyny upi³y mnie ry¿ówk¹ i zwinêli siê przed œwitem. Od tamtego czasu mam na g³owie stra¿ników, zwiêkszone limity na zbiory i mniej ludzi do pracy.
	AI_Output (self, other,"DIA_Lares_Again_11_17"); //Fletcher da³ mi jeszcze dwa dni na to, ¿eby wszystko wróci³o do normy.
	AI_Output (self, other,"DIA_Lares_Again_11_18"); //Z limitami jakoœ sobie poradzê, ch³opaki dwoj¹ siê i troj¹.
	AI_Output (self, other,"DIA_Lares_Again_11_19"); //Ale ci uciekinierzy... To dla mnie sprawa honoru.
	AI_Output (other, self,"DIA_Lares_Again_15_20"); //To ta przys³uga? Mam ich odnaleŸæ i przyprowadziæ?
	AI_Output (self, other,"DIA_Lares_Again_11_21"); //Niezupe³nie. Masz ich odnaleŸæ i wyr¿n¹æ do nogi! Te sukinsyny wiedzia³y czym skoñczy siê ich ucieczka.
	AI_Output (self, other,"DIA_Lares_Again_11_22"); //Takich jak oni trzeba têpiæ jak szczury. 
	AI_Output (self, other,"DIA_Lares_Again_11_23"); //Do tego jeden z nich zwin¹³ mój topór! To ju¿ by³ szczyt bezczelnoœci!
	AI_Output (other, self,"DIA_Lares_Again_15_24"); //Rozumiem. ZnaleŸæ, zabiæ, przynieœæ topór.
	AI_Output (self, other,"DIA_Lares_Again_11_25"); //Doskonale. Ale potrzebujê jeszcze ich... g³ów.
	AI_Output (other, self,"DIA_Lares_Again_15_26"); //Nie jestem rzeŸnikiem!
	AI_Output (self, other,"DIA_Lares_Again_11_27"); //Muszê pokazaæ Fletcherowi jakieœ dowody.
	AI_Output (self, other,"DIA_Lares_Again_11_28"); //Wiêc jak bêdzie?
	
   B_LogEntry		(CH4_RBL_NCRebel, "Lares wtajemniczy mnie w plany buntowników je¿eli wyœwiadczê mu 'drobn¹' przys³ugê.");
	B_LogEntry		(CH4_NC_RBLBosses, "Lares poprosi³ mnie o przys³ugê. Nie mam wyboru je¿eli chcê zdobyæ jego zaufanie.");
};

var int lares_wait;

// ******************************

INSTANCE DIA_Lares_AgainOk (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 3;
	condition		= DIA_Lares_AgainOk_Condition;
	information		= DIA_Lares_AgainOk_Info;
	permanent		= 0;
	important		= 0;
	description = "W porz¹dku, zajmê siê uciekinierami.";
};                       

FUNC int DIA_Lares_AgainOk_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_Again))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_AgainOk_Info()
{
	AI_Output (other, self,"DIA_Lares_AgainOk_15_00"); //W porz¹dku, zajmê siê uciekinierami.
	AI_Output (self, other,"DIA_Lares_AgainOk_11_01"); //Równy z Ciebie ch³op!
	AI_Output (self, other,"DIA_Lares_AgainOk_11_02"); //Ale masz na to tylko dwa dni. PóŸniej wróci Fletcher i skopie mi dupê je¿eli nie poka¿ê mu, ¿e ukara³em tych sukinsynów.
	AI_Output (self, other,"DIA_Lares_AgainOk_11_03"); //Owocnych ³owów.
	
   lares_wait = B_SetDayTolerance()+2;
	Log_CreateTopic	(CH4_NC_HeadHunter, LOG_MISSION);
	Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_RUNNING);
	B_LogEntry		(CH4_NC_HeadHunter, "W³aœnie sta³em siê £owc¹ G³ów! Obieca³em Laresowi, ¿e znajdê szkodników, którzy zbiegli z pól ry¿owych i zabijê ich. Dowodami maj¹ byæ ich g³owy. Jeden z uciekinierów ma tak¿e topór Laresa.");
	
	Wld_InsertNpc				(Non_20250_Grd,"LOCATION_23_CAVE_1_IN");
	Wld_InsertNpc				(Non_20251_Run,"LOCATION_23_CAVE_1_IN");	
	Wld_InsertNpc				(Non_20252_Smoke,"LOCATION_23_CAVE_1_IN");	
	Wld_InsertNpc				(Non_20253_Stay,"LOCATION_23_CAVE_1_IN");	
};

/**********************************
Ork pamiêtaj, ¿eby usun¹æ Laresowi ten topór z inventory!
Tych szkodników wrzuæ do jaskini w której Roscoe pêdzi³ nielegaln¹ ry¿ówkê. Daj im att_hostille, chodzi tylko o zabicie, daj im do inv. g³owy - ma ich byæ 5.

*********************************/

// ******************************

INSTANCE DIA_Lares_AgainOk2 (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 4;
	condition		= DIA_Lares_AgainOk2_Condition;
	information		= DIA_Lares_AgainOk2_Info;
	permanent		= 0;
	important		= 0;
	description 	= "Mam dla ciebie prezent.";
};                       

FUNC int DIA_Lares_AgainOk2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_Again))&&(NPC_HasItems(other,Lares_Axt)>=1)&&(NPC_HasItems(other,HEAD1_org)>=1)&&(NPC_HasItems(other,HEAD2_org)>=1)&&(NPC_HasItems(other,HEAD3_org)>=1)&&(NPC_HasItems(other,HEAD4_org)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_AgainOk2_Info()
{
	AI_Output (other, self,"DIA_Lares_AgainOk2_15_00"); //Mam dla ciebie prezent.

	if (lares_wait >= (Wld_GetDay()))
	{
		lares_done = 1;
		B_GiveXP(500);
      
		AI_Output (self, other,"DIA_Lares_AgainOk2_11_01"); //Zd¹¿y³eœ przed Fletcherem. Œwietna robota.
		AI_Output (other, self,"DIA_Lares_AgainOk2_15_02"); //Najpierw g³owy...
		
      B_GiveInvItems (other, self, HEAD1_org, 1);
		B_GiveInvItems (other, self, HEAD2_org, 1);
		B_GiveInvItems (other, self, HEAD3_org, 1);
		B_GiveInvItems (other, self, HEAD4_org, 1);

		Npc_RemoveInvItems(self,HEAD1_org,1);
		Npc_RemoveInvItems(self,HEAD2_org,1);
		Npc_RemoveInvItems(self,HEAD3_org,1);
		Npc_RemoveInvItems(self,HEAD4_org,1);

		AI_Output (self, other,"DIA_Lares_AgainOk2_11_03"); //Po œmierci s¹ jeszcze paskudniejsi ni¿ za ¿ycia. Masz mój topór?
		AI_Output (other, self,"DIA_Lares_AgainOk2_15_04"); //Pewnie.
		
      B_GiveInvItems (other, self, Lares_Axt, 1);

		/********************
	Usuñ weapon, który dasz Laresowi na pocz¹tku
	Npc_RemoveInvItems(self,ten weapon,1);
	**********************/

		AI_EquipBestMeleeWeapon	(self);
		AI_ReadyMeleeWeapon		(self);
		AI_PlayAni				(self, "T_1HSINSPECT");
      AI_RemoveWeapon(self);
		AI_UnequipWeapons		(self);

		AI_Output (self, other,"DIA_Lares_AgainOk2_11_05"); //Jestem Twoim d³u¿nikiem przyjacielu. Pytaj o co chcesz.

		Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_SUCCESS);
		B_LogEntry		(CH4_NC_HeadHunter, "Lares dosta³ swoje g³owy i topór. Mam ju¿ doœæ zabawy w rzeŸnika.");
		B_LogEntry		(CH4_NC_RBLBosses, "Lares jest bardzo wdziêczny. Ciekawe czy powie mi coœ ciekawego?");
	}
	else
	{
		AI_Output (self, other,"DIA_Lares_AgainOk2_11_06"); //SpóŸn³eœ siê. Niech to szlag trafi, ju¿ po mnie...
		
      lares_done = 2;
		Log_SetTopicStatus	(CH4_NC_HeadHunter, LOG_FAILED);
		B_LogEntry		(CH4_NC_HeadHunter, "SpóŸni³em siê. Lares ma przechlapane.");
		var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);
		B_StopProcessInfos	(self);

		/***************************
	Ork Fletcher ma siê znaleŸæ doœæ blisko, ¿eby w kolejnym dialogu nie podchodzi³ za d³ugo.
	**************************/
		Npc_ExchangeRoutine(flet,"GO");
	};
};

// ******************************

INSTANCE DIA_Lares_FletCome (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 5;
	condition		= DIA_Lares_FletCome_Condition;
	information		= DIA_Lares_FletCome_Info;
	permanent		= 0;
	important		= 1;
	description 	= ".";
};                       

FUNC int DIA_Lares_FletCome_Condition()
{
	if (lares_done == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_FletCome_Info()
{
	lares_done = 3;
	var C_NPC flet; flet = Hlp_GetNpc(Grd_255_Fletcher);
	AI_Output (self, other,"DIA_Lares_FletCome_11_01"); //O wilku mowa...
	AI_TurnToNpc(self, flet);
	AI_Output (self, other,"DIA_Lares_FletCome_11_02"); //Do licha, nie zd¹¿ê uciec.
	B_StopProcessInfos	(self);

	/*****************
	WP ze 2m od Laresa
	****************/

	AI_GotoWP (flet, "NC_PATH83_MOVEMENT");
};

// ******************************

INSTANCE DIA_Lares_Questions (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 6;
	condition		= DIA_Lares_Questions_Condition;
	information		= DIA_Lares_Questions_Info;
	permanent		= 0;
	important		= 0;
	description = "Mam kilka pytañ.";
};                       

FUNC int DIA_Lares_Questions_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Lares_AgainOk2))||(Npc_KnowsInfo (hero, DIA_Fletcher_LaresPunish))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_Questions_Info()
{
	AI_Output (other, self,"DIA_Lares_Questions_15_00"); //Mam kilka pytañ.
	AI_Output (self, other,"DIA_Lares_Questions_11_01"); //Pewnie, powiem wszystko co wiem.

	Info_ClearChoices (DIA_Lares_Questions);
	Info_AddChoice (DIA_Lares_Questions, "Us³ysza³em ju¿ doœæ.", DIA_Lares_Questions_End);
	Info_AddChoice (DIA_Lares_Questions, "Czym siê zajmujesz?", DIA_Lares_Questions_What);
	Info_AddChoice (DIA_Lares_Questions, "Co zamierzasz?", DIA_Lares_Questions_Future);
	Info_AddChoice (DIA_Lares_Questions, "Jaka jest sytuacja w obozie?", DIA_Lares_Questions_Situation);
};

// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_What()
{
	AI_Output (other, self,"DIA_Lares_Questions_What_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_Lares_Questions_What_11_01"); //Odk¹d Ry¿owy Ksi¹¿ê zawis³ na sznurze to na mnie spad³ w¹tpliwy zaszczyt dogl¹dania zbiorów.
	AI_Output (self, other,"DIA_Lares_Questions_What_11_02"); //Stra¿nicy postanowili wykorzystaæ moje naturalne... zdolnoœci. Rzeczywiœcie jakoœ sobie radzê, ale to ¿ycie na krawêdzi.
	AI_Output (self, other,"DIA_Lares_Questions_What_11_03"); //Sam widzia³eœ jak niewiele brakowa³o, ¿eby Fletcher powiesi³ mnie obok Ksiêcia.
	//Info_ClearChoices (DIA_Lares_Questions);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_Future()
{
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_00"); //Co zamierzasz?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_01"); //Hmm, to doœæ skomplikowane.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_02"); //Przede wszystkim nikt nie chce daæ siê zabiæ tym sukinsynom w czerwonych pancerzach.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_03"); //Nie bêdziemy te¿ wiecznie tolerowaæ takiego ¿ycia. 
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_04"); //Stra¿nicy wziêli nas z zaskoczenia. Powoli przygotowujemy siê na ma³y pucz.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_05"); //Ale do tego jeszcze nam daleko. Najpierw musimy zrobiæ porz¹dki na w³asnym podwórku.
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_06"); //Co masz na myœli?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_07"); //Niestety niektórym najemnikom czy szkodnikom odpowiada taka sytuacja. Bez szemrania pracuj¹ dla stra¿ników.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_08"); //Brakuje nam jednego przywódcy, kogoœ silnego i bezwzglêdnego.
	AI_Output (other, self,"DIA_Lares_Questions_Future_15_09"); //Lee?
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_10"); //Dok³adnie. Jestem pewien, ¿e genera³ zdo³a³by skrzykn¹æ wszystkich razem.
	AI_Output (self, other,"DIA_Lares_Questions_Future_11_11"); //A wtedy dalibyœmy stra¿nikom têgiego kopa miêdzy nogi.
	lee_back = lee_back + 1;
	B_LogEntry		(CH4_NC_RBLBosses, "Lares ma ju¿ doœæ stra¿ników, twierdzi jednak, ¿e tylko jeden, silny przywódca zdo³a po³¹czyæ wszystkich buntowników w walce z ludŸmi Gomeza. Wybór jest doœæ oczywisty - Lee.");
	//Info_ClearChoices (DIA_Lares_Questions);
};


// -------------------------------------------------------------------

FUNC VOID DIA_Lares_Questions_Situation()
{
	lares_cooperate = TRUE;
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_00"); //Jaka jest sytuacja w obozie?
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_01"); //Napiêta i nerwowa.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_02"); //Nikt nikomu nie ufa. W obozie widaæ podzia³ na trzy grupy.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_03"); //Jedn¹ z nich Ty przewodzisz?
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_04"); //Mo¿na tak powiedzieæ. Pozostali to Wilk i Torlof. 
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_05"); //Powiem szczerze, ¿e nie jestem pewien co oni kombinuj¹. Nie zamierzam te¿ sam odkrywaæ przed nimi kart.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_06"); //Hmm. W jednoœci si³a. Oddzielnie nic nie zwojujecie.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_07"); //Wiem, ale ryzyko jest zbyt du¿e. Muszê mieæ pewnoœæ, ¿e Wilk i Torlof myœl¹ podobnie. 
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_08"); //Nie mam okazji, ¿eby porozmawiaæ z którymœ z nich na osobnoœci. Wilka ci¹gle ktoœ pilnuje, a Torlofa nie wypuszczaj¹ z kopalni.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_09"); //Rozumiem. Mo¿e bêdê móg³ coœ na to zaradziæ.
	AI_Output (self, other,"DIA_Lares_Questions_Situation_11_10"); //Tylko b¹dŸ ostro¿ny i nie wymawiaj za szybko mojego imienia.
	AI_Output (other, self,"DIA_Lares_Questions_Situation_15_11"); //Bez obaw, to tak¿e gra o moje ¿ycie.
	B_LogEntry		(CH4_NC_RBLBosses, "Przywódcy ognisk rebelii s¹ rozproszeni i nie majê ze sob¹ bezpoœredniego kontaktu. Mo¿e zdo³am porozmawiaæ z ka¿dym z nich i wp³ynê na to aby po³¹czyli swoje wysi³ki w walce o wolnoœæ.");
	//Info_ClearChoices (DIA_Lares_Questions);
};


FUNC VOID DIA_Lares_Questions_End()
{
	AI_Output (other, self,"DIA_Lares_Questions_End_15_01"); //To mi wystarczy.
	Info_ClearChoices (DIA_Lares_Questions);			
	B_StopProcessInfos	(self);
};

// ******************************

INSTANCE DIA_Lares_LeeBack (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 7;
	condition		= DIA_Lares_LeeBack_Condition;
	information		= DIA_Lares_LeeBack_Info;
	permanent		= 0;
	important		= 0;
	description = "Co siê dzieje?";
};                       

FUNC int DIA_Lares_LeeBack_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lee_RBLBegin))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBack_Info()
{
	AI_Output (other, self,"DIA_Lares_LeeBack_15_00"); //Co siê dzieje?
	AI_Output (self, other,"DIA_Lares_LeeBack_11_01"); //Jak to co? Lee wróci³!
	AI_Output (self, other,"DIA_Lares_LeeBack_11_02"); //Pod jego komend¹ wykopiemy stra¿ników a¿ pod samo Khorinis.
	AI_Output (other, self,"DIA_Lares_LeeBack_15_03"); //To ju¿ zauwa¿y³em, bardziej interesuje mnie aktualna sytuacja w obozie.
	AI_Output (self, other,"DIA_Lares_LeeBack_11_04"); //No to faktycznie sporo siê wydarzy³o. Co chcesz wiedzieæ?
	B_LogEntry		(CH5_NO_Rebel, "Lares wprowadzi mnie w sytuacjê panuj¹c¹ w Nowym Obozie.");
};

var int situation_know;


// ******************************

INSTANCE DIA_Lares_LeeBackGuards (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 8;
	condition		= DIA_Lares_LeeBackGuards_Condition;
	information		= DIA_Lares_LeeBackGuards_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Opowiedz mi o stra¿nikach.";
};                       

FUNC int DIA_Lares_LeeBackGuards_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackGuards_Info()
{
	situation_know = situation_know + 1;
   
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_00"); //Opowiedz mi o stra¿nikach.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_01"); //To chyba najbardziej niesamowita historia.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_02"); //Trudno w to uwierzyæ, ale wœród tych ment te¿ wybuch³a rebelia.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_03"); //Poplecznicy Hrabiego z nim na czele zajêli Orle Gniazdo i nie maj¹ zamiaru opuœciæ kasztelu.
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_04"); //Przecie¿ stamt¹d nie ma wyjœcia. Po co sami zamknêli siê w pu³apce?
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_05"); //Tego nie wiem, ale jak znam Hrabiego to nie zrobi³by niczego g³upiego.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_06"); //Ten skurczybyk jeszcze mo¿e nas zaskoczyæ.
	AI_Output (other, self,"DIA_Lares_LeeBackGuards_15_07"); //A druga strona?
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_08"); //Fletcher i wszyscy, którzy bardziej boj¹ siê Gomeza ni¿ Hrabiego bawi¹ siê w regularne oblê¿enie.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_09"); //Dziêki temu mog³em bez problemów usun¹æ stra¿ników na ry¿owych polach.
	AI_Output (self, other,"DIA_Lares_LeeBackGuards_11_10"); //Reszta walczy w Kotle i Nowej Kopalni.
	B_LogEntry		(CH5_NO_Rebel, "A¿ mi szczêka opad³a kiedy dowiedzia³em siê, ¿e wœród stra¿ników powsta³ roz³am! Garstka z Hrabim na czele zamknê³a siê w Orlim GnieŸdzie. Pozostali pod wodz¹ Fletchera oblegaj¹ kasztel. Ciekawe co tu jest grane?");

	Log_CreateTopic	(CH5_NO_Guards, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Guards, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Guards, "Stra¿nicy pod wodz¹ Hrabiego zajêli Orle Gniazdo i broni¹ siê tam przed reszt¹ ludzi Fletchera. Jestem pewien, ¿e Hrabia knuje coœ nieprzyjemnego. Mogê siê te¿ za³o¿yæ, ¿e robi to w porozumieniu z Krukiem. Muszê spróbowaæ dostaæ siê do kasztelu, ciekawe czego siê tam dowiem?");
};

// ******************************

INSTANCE DIA_Lares_LeeBackMine (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 9;
	condition		= DIA_Lares_LeeBackMine_Condition;
	information		= DIA_Lares_LeeBackMine_Info;
	permanent		= 0;
	important		= 0;
	description = "Co siê dzieje w kopalni?";
};                       

FUNC int DIA_Lares_LeeBackMine_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackMine_Info()
{
	situation_know = situation_know + 1;
	AI_Output (other, self,"DIA_Lares_LeeBackMine_15_00"); //Co siê dzieje w kopalni?
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_01"); //Tam jest najgorzej.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_02"); //Torlof opiera siê ju¿ resztkami si³. Fakt, ¿e stra¿nicy te¿ nabrali przed jego ludŸmi respektu, ale to ju¿ nie potrwa d³ugo.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_03"); //Dosz³y mnie s³uchy, ¿e stra¿nicy szykuj¹ siê do ostatecznego uderzenia.
	AI_Output (self, other,"DIA_Lares_LeeBackMine_11_04"); //Jestem pewien, ¿e stary Torlof bêdzie walczy³ do ostatniej kropli krwi.

	B_LogEntry		(CH5_NO_Rebel, "Torlof opiera siê ju¿ resztkami si³ê, to ju¿ nie potrwa d³ugo.");

	Log_CreateTopic	(CH5_NO_Mine, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Mine, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Mine, "Torlof ca³y czas walczy ze stra¿nikami w kopalni. Jednak Lares twierdzi, ¿e to ju¿ nie potrwa d³ugo. Muszê coœ zrobiæ!");
};

// ******************************

INSTANCE DIA_Lares_LeeBackWolf (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 10;
	condition		= DIA_Lares_LeeBackWolf_Condition;
	information		= DIA_Lares_LeeBackWolf_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Co s³ychaæ w Kotle?";
};                       

FUNC int DIA_Lares_LeeBackWolf_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackWolf_Info()
{
	situation_know = situation_know + 1;
	AI_Output (other, self,"DIA_Lares_LeeBackWolf_15_00"); //Co s³ychaæ w Kotle?
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_01"); //Wilk porz¹dnie nadgryz³ stra¿ników i zabarykadowa³ siê ze swoj¹ sfor¹ w siedzibie Magów Wody.
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_02"); //Z tego co wiem radz¹ sobie nieŸle, a stra¿nicy coœ nie pal¹ siê do kontrataku. Ka¿dego zbyt odwa¿nego lub g³upiego trafiaj¹ celnie wymierzone szypy.
	AI_Output (self, other,"DIA_Lares_LeeBackWolf_11_03"); //Ktoœ zaradny móg³by siê tam przedostaæ pod os³on¹ nocy i porozmawiaæ z Wilkiem. Ten wylinia³y pies powinien dowiedzieæ siê, ¿e Lee wróci³.
	
   B_LogEntry		(CH5_NO_Rebel, "Wilk zabarykadowa³ siê w siedzibie magów i radzi sobie ca³kiem nieŸle.");

	Log_CreateTopic	(CH5_NO_Wolf, LOG_MISSION);
	Log_SetTopicStatus	(CH5_NO_Wolf, LOG_RUNNING);
	B_LogEntry		(CH5_NO_Wolf, "Wilk zabarykadowa³ siê w siedzibie Magów Wody. Jak na razie trzyma stra¿ników w szachu. Lares uwa¿a, ¿e pod os³on¹ nocy mo¿na by siê przedrzeæ poza barykadê i powiedzieæ Wilkowi o powrocie Lee. Mam tylko nadziejê, ¿e Wilk i jego sfora potrafi¹ odró¿niæ rebelianta od stra¿nika.");
};

// ******************************

INSTANCE DIA_Lares_LeeBackSub (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 11;
	condition		= DIA_Lares_LeeBackSub_Condition;
	information		= DIA_Lares_LeeBackSub_Info;
	permanent		= 0;
	important		= 0;
	description 		= "Obozuje tu ma³a armia.";
};                       

FUNC int DIA_Lares_LeeBackSub_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Lares_LeeBack))
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_LeeBackSub_Info()
{
	situation_know = situation_know + 1;
	
   AI_Output (other, self,"DIA_Lares_LeeBackSub_15_00"); //Obozuje tu ma³a armia.
	AI_Output (self, other,"DIA_Lares_LeeBackSub_11_01"); //Kiedy zobaczy³em Lee pozby³em siê stra¿ników i kontrolujemy teraz ca³e podobozie.
	AI_Output (self, other,"DIA_Lares_LeeBackSub_11_02"); //Najwy¿sza pora skopaæ dupska tych pasterskich psów!
	
   B_LogEntry(CH5_NO_Rebel, "Lares kontroluje ca³e podobozie. To tutaj Lee urz¹dzi³ kwaterê g³ówn¹.");
};

// ******************************

INSTANCE DIA_Lares_WhatNext (C_INFO)
{
	npc			= SLV_907_Lares;
	nr			= 12;
	condition		= DIA_Lares_WhatNext_Condition;
	information		= DIA_Lares_WhatNext_Info;
	permanent		= 0;
	important		= 1;
	description 	= "";
};                       

FUNC int DIA_Lares_WhatNext_Condition()
{
	if (situation_know == 4)&&(Npc_GetDistToNpc(self,hero) < 600)
	{
		return 1;
	};
};

FUNC VOID DIA_Lares_WhatNext_Info()
{
	AI_Output (self, other,"DIA_Lares_WhatNext_11_01"); //Wiesz ju¿ wszystko o sytuacji w obozie. Co planuje Lee?
	AI_Output (other, self,"DIA_Lares_WhatNext_15_02"); //Tego muszê siê dowiedzieæ. Ale jestem pewien, ¿e jego plany nie przypadn¹ stra¿nikom do gustu.
	
   B_LogEntry		(CH5_NO_Rebel, "Wiem ju¿ wystarczaj¹co du¿o o sytuacji panuj¹cej w Nowym Obozie. Czas porozmawiaæ z Lee o szczegó³ach ataku.");
	B_StopProcessInfos	(self);
};
