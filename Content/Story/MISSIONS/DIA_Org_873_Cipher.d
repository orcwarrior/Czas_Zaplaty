/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc		=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	B_StopProcessInfos(self);
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Co s³ychaæ?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	return 1;
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Cipher_Hello1_12_01"); //A co ma byæ s³ychaæ w tej pieprzonej kopalni?!
	AI_Output (self, other,"DIA_Cipher_Hello1_12_02"); //Tutaj nawet nie ma co wypaliæ!
	AI_Output (self, other,"DIA_Cipher_Hello1_12_03"); //Niech to wszystko szlag trafi!
};

// ******************************

instance  Org_873_Cipher_Hello2 (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  2;
	condition	=  Org_873_Cipher_Hello2_Condition;
	information	=  Org_873_Cipher_Hello2_Info;
	permanent	=  0;
	description = "Mam dla ciebie propozycjê.";
};                       

FUNC int  Org_873_Cipher_Hello2_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Sher_Hlp))&&((NPC_HasItems(hero,ItMiJoint_1)>=1)||(NPC_HasItems(hero,ItMiJoint_2)>=1)||(NPC_HasItems(hero,ItMiJoint_3)>=1))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Hello2_Info()
{
	miners_work = miners_work + 1;
   
	AI_Output (other, self,"DIA_Cipher_Hello2_15_00"); //Mam dla ciebie propozycjê.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_01"); //Ty? W¹tpiê, ale i tak nie mam nic lepszego do roboty. Mów.
	AI_Output (other, self,"DIA_Cipher_Hello2_15_02"); //Chcê, ¿ebyœ zacz¹³ kopaæ jak pozostali.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_03"); //To z braku ziela mam halucynacje. ZejdŸ mi z oczu...
	AI_Output (other, self,"DIA_Cipher_Hello2_15_04"); //A co powiesz na to, ¿e mam coœ porz¹dnego do palenia?
	AI_Output (self, other,"DIA_Cipher_Hello2_12_05"); //Ty?
	AI_Output (other, self,"DIA_Cipher_Hello2_15_06"); //Powtarzasz siê.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_07"); //A co mi tam. Za zielsko mogê nawet trochê popracowaæ. Niech bêdzie.
	AI_Output (self, other,"DIA_Cipher_Hello2_12_08"); //Stary, uratowa³eœ mi ¿ycie!
  
   if (NPC_HasItems(other,ItMiJoint_1)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_1, 1);
      AI_UseItem (self, ItMiJoint_1);
	}
	else if (NPC_HasItems(other,ItMiJoint_2)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_2, 1);
      AI_UseItem (self, ItMiJoint_2);
	}
	else if (NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_3, 1);
      AI_UseItem (self, ItMiJoint_3);
	};

	AI_Output (other, self,"DIA_Cipher_Hello2_15_09"); //Tylko nie zrób sobie krzywdy kilofem.
	
   B_GiveXP(250);	
	B_LogEntry(CH4_GRD_NewMine, "Cipher siê zabaka³, ale wzi¹³ siê do pracy.");
	B_StopProcessInfos(self);

	/***************
	rutyna kopania rudy
	**************/
	Npc_ExchangeRoutine(self,"Pick");
	var C_NPC vlk1; vlk1 = Hlp_GetNpc(VLK_5002_Buddler);
	Npc_ExchangeRoutine(vlk1,"GO");
};

// ******************************

instance DIA_Cipher_Urt (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  3;
	condition	=  DIA_Cipher_Urt_Condition;
	information	=  DIA_Cipher_Urt_Info;
	permanent	=  0;
	description 	= "Chcia³em pogadaæ.";
};                       

FUNC int  DIA_Cipher_Urt_Condition()
{
	if (Npc_KnowsInfo (hero, STT_Balam_Spy))&&((NPC_HasItems(hero,ItMiJoint_1)>=1)||(NPC_HasItems(hero,ItMiJoint_2)>=1)||(NPC_HasItems(hero,ItMiJoint_3)>=1))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cipher_Urt_Info()
{
	AI_Output (other, self,"DIA_Cipher_Urt_15_00"); //Chcia³em pogadaæ.
	AI_Output (self, other,"DIA_Cipher_Urt_12_01"); //A ja bym coœ zapali³...
	AI_Output (other, self,"DIA_Cipher_Urt_15_02"); //WeŸ to, nie musisz dziêkowaæ.
   
	if (NPC_HasItems(other,ItMiJoint_1)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_1, 1);
	}
	else if (NPC_HasItems(other,ItMiJoint_2)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_2, 1);
	}
	else if (NPC_HasItems(other,ItMiJoint_3)>=1)
	{
		B_GiveInvItems (other, self, ItMiJoint_3, 1);
	};
   
	AI_Output (self, other,"DIA_Cipher_Urt_12_03"); //Stary, uratowa³eœ mi ¿ycie. Ju¿ dwa dzwony nic nie baka³em!
	AI_UseMob(self, "SMOKE", 1);
	AI_Output (other, self,"DIA_Cipher_Urt_15_04"); //Zanim odp³yniesz do krainy tamburyna powiedz mi co wiesz o Urcie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_05"); //Sk¹d wiesz, ¿e znam tego... Jak mu tam?
	AI_Output (other, self,"DIA_Cipher_Urt_15_06"); //Urt. Niewa¿ne sk¹d. Podobno znaliœcie siê w czasach przed Koloni¹.
	AI_Output (self, other,"DIA_Cipher_Urt_12_07"); //Urt... A pewnie mówisz o Urthosie, myrtañskim przemytniku i by³ym królewskim gwardziœcie?
	AI_Output (other, self,"DIA_Cipher_Urt_15_08"); //Urthos? To ciekawe. Co o nim wiesz?
	AI_Output (self, other,"DIA_Cipher_Urt_12_09"); //Niestety ca³kiem sporo. Trafi³em tu za sprzeda¿ ziela w Myrtanie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_10"); //Dasz wiarê? Cz³owiek chce, aby inni ludzie zobaczyli œwiat w lepszych kolorach, a w zamian trafia do Kolonii...
	AI_Output (self, other,"DIA_Cipher_Urt_12_11"); //Urthos by³ przemytnikiem, który dostarcza³ mi ziele. Handlowa³ te¿ niewolnikami, ale tym nie by³em zainteresowany.
	AI_Output (self, other,"DIA_Cipher_Urt_12_12"); //Kiedyœ sprzeda³ mi trefny towar. Poszed³em na jego ³ajbê z kilkoma znajomkami.
	AI_Output (self, other,"DIA_Cipher_Urt_12_13"); //Mia³em szczêœcie, ¿e p³ywam jak ryba, bo skoñczy³bym w zatoce Kareñskiej jako kolejny œmieæ na dnie.
	AI_Output (self, other,"DIA_Cipher_Urt_12_14"); //Od tamtej pory nic o nim nie s³ysza³em. Z reszt¹ nied³ugo póŸniej trafi³em do Kolonii.
	AI_Output (other, self,"DIA_Cipher_Urt_15_15"); //Ciekawa historia.
	AI_Output (self, other,"DIA_Cipher_Urt_12_16"); //Stary nie masz pojêcia jak siê zdziwi³em, kiedy zobaczy³em tego sukinsyna wœród stra¿ników.
	AI_Output (other, self,"DIA_Cipher_Urt_15_17"); //Mam nadziejê, ¿e mówisz prawdê.
	AI_Output (self, other,"DIA_Cipher_Urt_12_18"); //Chyba tak, ale wiesz jak to jest z tym zielem... Czasami nie wiem, jak siê nazywam, he, he.
	AI_Output (other, self,"DIA_Cipher_Urt_15_19"); //Bywaj, Cipher.
	
   B_LogEntry		(CH6_RBL_Spy, "Cholera, sytuacja zaczê³a siê gmatwaæ. Cipher rzeczywiœcie zna³ Urta, czy jak go nazwa³ - Urthosa, przed Koloni¹. Ten æpun twierdzi, ¿e Urt by³ przemytnikiem, a wczeœniej by³ nawet królewskim gwardzist¹. Muszê dowiedzieæ siê od Ratforda, jak skaptowa³ Urta. Hmm, mo¿e warto te¿ zapytaæ Lee, czy nie s³ysza³ czegoœ o gwardziœcie Urthosie?");
};
