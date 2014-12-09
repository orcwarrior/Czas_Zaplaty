
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kron_Exit (C_INFO)
{
	npc			= Non_4025_Kron;
	nr			= 999;
	condition	= DIA_Kron_Exit_Condition;
	information	= DIA_Kron_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kron_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kron_Exit_Info()
{
	B_StopProcessInfos	( self );
};

// **************************************************
// 					hello
// **************************************************

INSTANCE DIA_Kron_Hello (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 1;
	condition		= DIA_Kron_Hello_Condition;
	information		= DIA_Kron_Hello_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Kron_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Kron_Hello_Info()
{
	AI_Output (other, self, "DIA_Kron_Hello_15_01"); //Niech mnie szlag trafi. Chêdo¿ony ork!
	AI_Output (self, other, "DIA_Kron_Hello_11_02"); //Gdyby moja byæ z³y ork, Morra by ju¿ nie ¿yæ.
	AI_Output (self, other, "DIA_Kron_Hello_11_03"); //Morra uwa¿aæ co mówiæ, Moja wiêcej nie ostrzegaæ.
	AI_Output (other, self, "DIA_Kron_Hello_15_04"); //I do tego gada...
	AI_Output (self, other, "DIA_Kron_Hello_11_05"); //Morra odejœæ, Morra cieszyæ siê ¿ycie, póki móc.
	
   Log_CreateTopic	(CH2_TRL_Ork, LOG_MISSION);
	Log_SetTopicStatus	(CH2_TRL_Ork, LOG_RUNNING);
	B_LogEntry		(CH2_TRL_Ork, "Jednym z ³owców trolli jest... ork. Ten œwiat ju¿ ca³kiem stan¹³ na g³owie!");
	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_What (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 2;
	condition		= DIA_Kron_What_Condition;
	information		= DIA_Kron_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_Kron_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_What_Info()
{
	AI_Output (other, self, "DIA_Kron_What_15_01"); //Co tu robisz?
	AI_Output (self, other, "DIA_Kron_What_11_02"); //Moja byæ renegat. Ma³a Morra uratowaæ Moja z ³ap troll.
	AI_Output (self, other, "DIA_Kron_What_11_03"); //Moja byæ wdziêczna, moja przysiêgaæ, ¿e walczyæ dla Ma³a Morra.
	AI_Output (other, self, "DIA_Kron_What_15_04"); //Co to za Ma³a Morra?
	AI_Output (self, other, "DIA_Kron_What_11_05"); //Ma³a Morra byæ przewodnik stada, sikaæ na siedz¹co, ale rozkazywaæ.
	AI_Output (other, self, "DIA_Kron_What_15_06"); //Mówisz o Kirze?!
	AI_Output (self, other, "DIA_Kron_What_11_07"); //Tak, Ma³a Morra, zwaæ siê Kira. Moja przysiêgaæ, moja zostaæ z Ma³a Morra.
	
   B_LogEntry		(CH2_TRL_Ork, "Ork twierdzi, ¿e zawdziêcza ¿ycie Kirze. Nie ufam skurczybykowi, najchêtniej poszatkowa³bym go na tysi¹c kawa³ków.");	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_Fight (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 3;
	condition		= DIA_Kron_Fight_Condition;
	information		= DIA_Kron_Fight_Info;
	permanent		= 0;
	important		= 0;
	description		= "Dobry ork, to martwy ork!"; 
};

FUNC INT DIA_Kron_Fight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Hello))&&(TH_trust >= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_Fight_Info()
{
	AI_Output (other, self, "DIA_Kron_Fight_15_01"); //Dobry ork to martwy ork!
	AI_Output (self, other, "DIA_Kron_Fight_11_02"); //Morra chcieæ rozgniewaæ Moja? Moja nie walczyæ z Morra, Ma³a Morra zakazaæ zabijaæ inna Morra.
	AI_Output (other, self, "DIA_Kron_Fight_15_03"); //S³uchasz tego co mówi ci ktoœ kto sika na siedz¹co?
	AI_Output (self, other, "DIA_Kron_Fight_11_04"); //Moja sp³acaæ d³ug ¿ycia, Moja pos³uchaæ Ma³a Morra. Moja nie zabijaæ inna Morra, nawet jak mieæ ochota.
	AI_Output (self, other, "DIA_Kron_Fight_11_05"); //Morra odejœæ, zostawiæ Moja w spokój.
	
   B_LogEntry		(CH2_TRL_Ork, "Spróbowa³em sprowokowaæ orka, ale albo naprawdê boi siê Kiry, albo uwa¿a mnie za natrêta nie groŸniejszego od muchy. Czas skopaæ zielone dupsko!");	
	B_StopProcessInfos	(self);
};

// **************************************************

INSTANCE DIA_Kron_Fight1 (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 4;
	condition		= DIA_Kron_Fight1_Condition;
	information		= DIA_Kron_Fight1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdychaj cholerny orku!"; 
};

FUNC INT DIA_Kron_Fight1_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Fight))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_Fight1_Info()
{
	Npc_SetTempAttitude(self, ATT_FRIENDLY);
	
	AI_Output (other, self, "DIA_Kron_Fight1_15_01"); //Zdychaj cholerny orku!
	AI_Output (self, other, "DIA_Kron_Fight1_11_02"); //Moja nie walczyæ, Morra odejœæ.
	AI_DrawWeapon (other);
	AI_Output (other, self, "DIA_Kron_Fight1_15_03"); //Nigdzie nie idê, pora przelaæ zielon¹ krew.
	AI_Output (self, other, "DIA_Kron_Fight1_11_04"); //Moja obiecaæ nie walczyæ, ale Moja musieæ siê broniæ.
	AI_DrawWeapon (self);
	AI_Output (self, other, "DIA_Kron_Fight1_11_05"); //Morra po¿a³owaæ g³upia s³owa!
	
   B_LogEntry		(CH2_TRL_Ork, "Wyci¹gn¹³em miecz i postawi³em sprawê jasno - on albo ja!");
	
   B_StopProcessInfos	(self); 
	B_SetTimedATT(self,30*events_per_sec,(-70),(-70),(-100));	
	B_StartAfterDialogFight(self,other,false);
};

// **************************************************

INSTANCE DIA_Kron_AfterFight (C_INFO)
{
	npc				= Non_4025_Kron;
	nr				= 5;
	condition		= DIA_Kron_AfterFight_Condition;
	information		= DIA_Kron_AfterFight_Info;
	permanent		= 0;
	important		= 1;
	description		= ""; 
};

FUNC INT DIA_Kron_AfterFight_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Kron_Fight1))
	{
		return 1;
	};
};

FUNC VOID DIA_Kron_AfterFight_Info()
{
	if (Npc_GetAivar(self,AIV_HASDEFEATEDSC) == TRUE)
	{
		AI_Output (self, other, "DIA_Kron_AfterFight_11_01"); //Moja nie chcieæ walczyæ, ale Morra zaatakowaæ Moja. 
		AI_Output (self, other, "DIA_Kron_AfterFight_11_02"); //Morra przegraæ, Morra odejœæ i nie wracaæ.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_03"); //Moja powiedzieæ Ma³a Morra, dziwna Morra byæ z³a.
		
      Log_SetTopicStatus	(CH2_TRL_Ork, LOG_FAILED);
		B_LogEntry		(CH2_TRL_Ork, "Ten cholerny ork mnie spra³! Z tego co zrozumia³em to chyba ³adnie obsmaruje mnie przed Kir¹.");
		B_LogEntry		(CH2_TRL_Quest, "Narazi³em siê temu cholernemu orkowi!");	
	}
	else if (Npc_GetAivar(self,AIV_WASDEFEATEDBYSC) == TRUE)
	{
		TH_trust = TH_trust + 1;
		B_GiveXP(400);
      
		AI_Output (self, other, "DIA_Kron_AfterFight_11_04"); //Morra pokonaæ Moja... Morra byæ wielka wojownik.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_05"); //Moja nie chcieæ walczyæ, Morra wygraæ, Morra dostaæ szacunek Moja.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_06"); //Moja powiedzieæ Ma³a Morra, dziwna Morra byæ dobra wojownik.
		AI_Output (self, other, "DIA_Kron_AfterFight_11_07"); //Morra odejœæ, Moja musieæ odzyskaæ si³a po walka...
		
      Log_SetTopicStatus	(CH2_TRL_Ork, LOG_SUCCESS);
		B_LogEntry		(CH2_TRL_Ork, "Pokona³em t¹ zielon¹ kupê ³ajna. Chocia¿ z drugiej strony ork okaza³ szacunek zwyciêzcy, co ludziom rzadko siê zdarza. Chyba Ÿle go oceni³em. Mo¿e móg³bym... polubiæ tego dziwnego orka.");
		B_LogEntry		(CH2_TRL_Quest, "Wygra³em walkê z orkiem i chyba zdoby³em jego szacunek.");	
	};
   
	B_StopProcessInfos	(self); 
};
