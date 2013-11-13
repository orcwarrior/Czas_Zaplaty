const int   ID_MIS_ADANWAVE  = 3501;

INSTANCE MIS_AdanWave1	(Mst_Default_Molerat)
{
	name							=	"M³ody kretoszczur";
	level							=	4;
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);
	

	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;

	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

	//------------------------------------------------------------
	protection	[PROT_BLUNT]		=	8;
	protection	[PROT_EDGE]			=	8;

	fight_tactic					= FAI_MONSTER_COWARD;

	Set_Molerat_Visuals();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);

	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 1);
	CreateInvItems (self, ItAt_WatMRat, 1);
	B_SetMonsterLevel();
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);			
	start_aistate				= ZS_AdanWave;
	
	
};
INSTANCE MIS_AdanWave2	(Mst_Default_Scavenger)
{
	Set_Scavenger_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);

	CreateInvItems (self, ItFoMuttonRaw, 2);
	if(Hlp_Random(2))
	{
		CreateInvItems (self, ItFoScavengerEgg, 1+Hlp_Random(2));	
	};
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
	B_SetMonsterLevel();	
	start_aistate				= ZS_AdanWave;
};
INSTANCE MIS_AdanWave3	(Mst_Default_GreenGobbo)
{
	Set_GreenGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Sword_Old_01); //+10
	attribute[ATR_STRENGTH] = attribute	[ATR_STRENGTH] + 10; // da technisch im Faustkampf
	CreateInvItems (self, ItAt_GobKosc, 1);
	B_CreateGobboInv();
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);		
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
	B_SetMonsterLevel();	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave4	(Mst_Default_Bloodfly)
{
	Set_Bloodfly_Visuals();
	Npc_SetToFistMode(self);
	
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave5	(Mst_Default_Waran)
{
	Set_Waran_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  15);
	B_SetMonsterLevel();
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave6	(Mst_Default_Wolf)
{
	Set_Wolf_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_MAXLEVEL,  16);
	B_SetMonsterLevel();	
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave7	(Mst_Default_OrcBiter)
{
	Set_OrcBiter_Visuals();
	Npc_SetToFistMode(self);

	CreateInvItems (self, ItFoMuttonRaw, 2);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave8	(Mst_Default_OrcDog)
{
	Set_OrcDog_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave9	(Mst_Default_BlackGobbo)
{
	level							=	15;

	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode (self, ItMw_1H_Mace_01);
	
	attribute	[ATR_STRENGTH]		=	 60+30; //da Gobbos technisch im Faustkampf
	
	attribute	[ATR_HITPOINTS_MAX]	=	105;
	attribute	[ATR_HITPOINTS]		=	105;
	
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	
	name							=	"Goblin wojownik";

	CreateInvItems (self, ItAt_GobKosc, 1);	
	B_CreateGobboInv();
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave10	(Mst_Default_Minecrawler)
{
	Set_Minecrawler_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};

INSTANCE MIS_AdanWave11	(Mst_Default_Aligator)
{
	Set_Alligator_Visuals();
	Npc_SetToFistMode(self);
 Npc_SetAivar(self,AIV_MM_SPECREACTTODAMAGE,  TRUE);	
 Npc_SetAivar(self,AIV_MM_DAYTORESPAWN,  999);		
 Npc_SetAivar(self,AIV_MM_REAL_ID,			 	ID_MIS_ADANWAVE);	
	start_aistate				= ZS_AdanWave;
};
//////////////////////////////////////////////////////////////////////////
//	ZS_AdanWave
//	===========
//	Goto Hero + VFX on start
//////////////////////////////////////////////////////////////////////////
func void ZS_AdanWave()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_AdanWave");
	
	//  Wahrnehmungen aktiv 
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);
	Wld_PlayEffect("spellFX_MassDeath_GROUND", self, self, 1,0 , DAM_MAGIC, TRUE); //Projetil = TRUE (trifft alle)	
	AI_StandUp 		(self);
	AI_TurnToNpc	(self, other);
	AI_PlayAni		(self, "T_WARN"); 			
};

func int ZS_AdanWave_Loop()
{
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_AdanWave_Loop");
	//PRINTGlobals		(PD_MST_DETAIL);

	//-------- SC-Meister folgen ! --------
	AI_GotoNpc		(self,	hero);
	AI_Wait				(self,	1);
	return				LOOP_CONTINUE;
};
func void ZS_AdanWave_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");


};
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Iskra_Exit (C_INFO)
{
	npc			= Wisp_Adan;
	nr			= 999;
	condition	= DIA_Iskra_Exit_Condition;
	information	= DIA_Iskra_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Iskra_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Iskra_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Iskra_Hello (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 1;
	condition		= DIA_Iskra_Hello_Condition;
	information		= DIA_Iskra_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_Next1))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Hello_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Hello_11_00"); //Wiem, po co przybywasz. Mój Pan odda³ mi to, czego szukasz.
	AI_Output (other, self, "DIA_Iskra_Hello_15_01"); //Jak znam ¿ycie nie dostanê nic za ³adne oczy.
	AI_Output (self, other, "DIA_Iskra_Hello_11_02"); //Nie potrzebujê Twoich oczu...
	AI_Output (other, self, "DIA_Iskra_Hello_15_03"); //To by³ ¿art - niewa¿ne. Przyby³em po pos¹¿ek. Czego ¿¹dasz w zamian?
	AI_Output (self, other, "DIA_Iskra_Hello_11_04"); //Mój Pan utrzymuje równowagê pomiêdzy pozosta³ymi braæmi. 
	AI_Output (self, other, "DIA_Iskra_Hello_11_05"); //Nie bêdziesz musia³ udowodniæ odwagi czy te¿ bezwzglêdnoœci.
	AI_Output (self, other, "DIA_Iskra_Hello_11_06"); //Wystarczy, ¿e wyka¿esz siê sprytem.
	AI_Output (self, other, "DIA_Iskra_Hello_11_07"); //Niedaleko na skale le¿y pierœcieñ. Nie mo¿na siê tam dostaæ w naturalny sposób.
	AI_Output (self, other, "DIA_Iskra_Hello_11_08"); //Daj mi ten pierœcieñ, a otrzymasz swoj¹ nagrodê.
	B_LogEntry		(CH2_RBL_Tritetra, "Aby otrzymaæ pos¹¿ek Adanosa, muszê zdobyæ pierœcieñ, który le¿y w pobli¿u ognika, na skale. Bez magii siê raczej nie obêdzie.");
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Iskra_Hello1 (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 2;
	condition		= DIA_Iskra_Hello1_Condition;
	information		= DIA_Iskra_Hello1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Hello1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Hello))&&(NPC_HasItems(other,Adan_Ring)>=1)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Hello1_Info()
{
	B_GiveXP (300);
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	B_GiveInvItems (other, self, Adan_Ring, 1);
	Npc_RemoveInvItems(self,Adan_Ring,1);
	AI_Output (self, other, "DIA_Iskra_Hello1_11_00"); //Uda³o Ci siê! Dowiod³eœ, ¿eœ godzien otrzymaæ mój dar.

	/*************************
	Przyda³o by siê zrobiæ pos¹¿ek beliara
	*************************/

	CreateInvItems (self, tri_adan_statue,1); 	
	B_GiveInvItems (self, other, tri_adan_statue, 1);
	/****************************
	Nie wiem, jakaœ zmiana rutyny, pfx, etc.
	****************************/

	AI_Output (other, self, "DIA_Iskra_Hello1_15_01"); //Mi³o by³o poznaæ.
	B_LogEntry		(CH2_RBL_Tritetra, "Otrzyma³em pierwszy pos¹¿ek Adanosa.");
};

// **************************************************

INSTANCE DIA_Iskra_Pair (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 3;
	condition		= DIA_Iskra_Pair_Condition;
	information		= DIA_Iskra_Pair_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Pair_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_NextTwo))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Pair_Info()
{
	wisp_trial = 1;	
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Pair_11_00"); //Przyby³eœ ponownie. To ja jestem stra¿nikiem aspektów mojego Pana. 
	AI_Output (other, self, "DIA_Iskra_Pair_15_01"); //Domyœli³em siê, ¿e nie jesteœ jednym ze skazañców.
	AI_Output (self, other, "DIA_Iskra_Pair_11_02"); //¯art, tak?
	AI_Output (other, self, "DIA_Iskra_Pair_15_03"); //Szybko siê uczysz ogniku. Czego tym razem muszê dowieœæ?
	AI_Output (self, other, "DIA_Iskra_Pair_11_04"); //Determinacji. Mój Pan czêsto wyznacza krête œcie¿ki, na których ³atwo mo¿na zb³¹dziæ.
	AI_Output (self, other, "DIA_Iskra_Pair_11_05"); //Sprawdzê Tw¹ wytrwa³oœæ. Je¿eli zdo³asz dowieœæ wystarczaj¹cej determinacji, oddam Ci pos¹¿ki.
	B_LogEntry		(CH2_RBL_Tritetra, "Tym razem ognik podda mnie próbie wytrwa³oœci cokolwiek by to nie oznacza³o.");
	B_StopProcessInfos	( self );

	B_Story_Mis_AdanWaves_SpawnNextWave();
};

// **************************************************

INSTANCE DIA_Iskra_Pair1 (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 4;
	condition		= DIA_Iskra_Pair1_Condition;
	information		= DIA_Iskra_Pair1_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Pair1_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Iskra_Pair))&&(wisp_trial == 12)&&(Npc_GetDistToNpc(self,hero) < 500)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Pair1_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Pair1_11_00"); //Dobrze siê sprawi³eœ œmiertelniku. Zas³u¿y³eœ na przychylnoœæ mojego Pana i na nagrodê.
	AI_Output (other, self, "DIA_Iskra_Pair1_15_01"); //To nie by³o takie trudne. Bywaj.

	CreateInvItems (self, tri_adan_statue,2); 	
	B_GiveInvItems (self, other, tri_adan_statue, 2);
	/****************************
	Nie wiem, jakaœ zmiana rutyny, pfx, etc.
	****************************/

	B_LogEntry		(CH2_RBL_Tritetra, "Pokona³em potwory i zdoby³em dwa pos¹¿ki Adanosa.");
};

// **************************************************

INSTANCE DIA_Iskra_Three (C_INFO)
{
	npc				= Wisp_Adan;
	nr				= 5;
	condition		= DIA_Iskra_Three_Condition;
	information		= DIA_Iskra_Three_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Iskra_Three_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Leren_LastThree))&&(Npc_GetDistToNpc(self,hero) < 800)
	{
		return 1;
	};
};

FUNC VOID DIA_Iskra_Three_Info()
{
	B_FullStop (hero);
	AI_GotoNpc(other,self);
	AI_Output (self, other, "DIA_Iskra_Three_11_00"); //Widzê, ¿e nie ustajesz w poszukiwaniach. Wyczuwam konsternacjê bogów. To ostatnie pos¹¿ki?
	AI_Output (other, self, "DIA_Iskra_Three_15_01"); //Tak, brakuje tylko tych trzech.
	AI_Output (self, other, "DIA_Iskra_Three_11_02"); //Powiedz mi co chcesz uczyniæ z Tritetr¹?


	Info_ClearChoices (DIA_Iskra_Three);
	Info_AddChoice (DIA_Iskra_Three, "Zaw³adnê ich moc¹!", DIA_Iskra_Three_Power);
	Info_AddChoice (DIA_Iskra_Three, "Pozostawiê to przeznaczeniu.", DIA_Iskra_Three_Destiny);
	Info_AddChoice (DIA_Iskra_Three, "Zniszczê je!", DIA_Iskra_Three_Destroy);
};

// ---------------------------power----------------------------------------

FUNC VOID DIA_Iskra_Three_Power()
{
	AI_Output (other, self, "DIA_Iskra_Three_Power_15_01"); //Zaw³adnê moc¹ wszystkich pos¹gów i unurzam œwiat w krwi tych, którzy stan¹³ mi na drodze ku chwale!
	AI_Output (self, other, "DIA_Iskra_Three_Power_11_02"); //To nie jest droga, na któr¹ mogê siê zgodziæ. Nie jesteœ godzien aby otrzymaæ pos¹¿ki.
	Log_SetTopicStatus	(CH2_RBL_Tritetra, LOG_FAILED);
	B_LogEntry		(CH2_RBL_Tritetra, "Nie zdoby³em ostatnich trzech pos¹¿ków. Lepiej nie pokazywaæ siê teraz Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
};

// ---------------------------destroy----------------------------------------

FUNC VOID DIA_Iskra_Three_Destroy()
{
	AI_Output (other, self, "DIA_Iskra_Three_Destroy_15_01"); //Zniszczê je! Uwolniê œwiat od boskich zabawek.
	AI_Output (self, other, "DIA_Iskra_Three_Destroy_11_02"); //Przeznaczenie Tritetry jeszcze siê nie wype³ni³o. Nie mogê pozwoliæ na to abyœ zniszczy³ dzie³o mojego Pana.
	Log_SetTopicStatus	(CH2_RBL_Tritetra, LOG_FAILED);
	B_LogEntry		(CH2_RBL_Tritetra, "Nie zdoby³em ostatnich trzech pos¹¿ków. Lepiej nie pokazywaæ siê teraz Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
};

// ---------------------------destiny----------------------------------------

FUNC VOID DIA_Iskra_Three_Destiny()
{
	B_GiveXP (500);
	AI_Output (other, self, "DIA_Iskra_Three_Destiny_15_01"); //Pozostawiê to przeznaczeniu i woli bogów.
	AI_Output (self, other, "DIA_Iskra_Three_Destiny_11_02"); //To jedyny s³uszny wybór. Pos¹¿ki s¹ Twoje œmiertelniku.
	CreateInvItems (self, tri_adan_statue,1); 	
	B_GiveInvItems (self, other, tri_adan_statue, 1);
	CreateInvItems (self, tri_beliar_statue,1); 	
	B_GiveInvItems (self, other, tri_beliar_statue, 1);
	CreateInvItems (self, tri_innos_statue,1); 	
	B_GiveInvItems (self, other, tri_innos_statue, 1);

	B_LogEntry		(CH2_RBL_Tritetra, "Zdoby³em ostatnie trzy pos¹¿ki. Teraz muszê 'tylko' prze¿yæ i oddaæ je Lerenowi.");
	Info_ClearChoices (DIA_Iskra_Three);
	B_StopProcessInfos	( self );
	Npc_ExchangeRoutine(Wisp_Adan,"out");
}; 
