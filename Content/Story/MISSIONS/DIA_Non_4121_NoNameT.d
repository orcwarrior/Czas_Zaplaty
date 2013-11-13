
instance  DIA_NonameT_Hi (C_INFO)
{
	npc				= Nameless_Temple;
	condition		= DIA_NonameT_Hi_Condition;
	information		= DIA_NonameT_Hi_Info;
	important		= 1;
	permanent		= 0;
	description		= ""; 
};

FUNC int  DIA_NonameT_Hi_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero, Info_XardasOT_OT))
	{			
		return TRUE;
	}; 
};
FUNC void  DIA_NonameT_Hi_Info()
{
	B_FullStop (hero);
	AI_TurnToNpc(self, other);
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_01"); //Zgadzam siê z Xardasem, demon musi zostaæ powstrzymany za wszelk¹ cenê!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_02"); //Nawet za cenê Twojego ¿ycia?
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_03"); //Nie ma innego wyjœcia, poza tym zawsze spadam na cztery ³apy. Jeszcze zobaczysz mnie na tronie Rhobara!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_04"); //A co je¿eli Xardas nie powiedzia³ Ci ca³ej prawdy?
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_05"); //Wiem jedno. Je¿eli zniszczê Œni¹cego, to szlag trafi barierê. Wiêcej do szczêœcia mi nie potrzeba jak wydostaæ siê z tej cholernej Kolonii.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_06"); //O ile prze¿yjesz. Ale masz racjê. Barierê trzeba zniszczyæ.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_07"); //Pos³uchaj. Wiem, ¿e nie znamy siê zbyt dobrze, ale wiêcej w nas podobieñstw ni¿ oboje chcielibyœmy przyznaæ.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_08"); //Raczej przeciwieñstw. Jesteœmy szalami tej samej wagi i dobrze o tym wiesz.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_09"); //I lepiej niech tak pozostanie. Ja zrobiê swoje, Rick. Ty sam zdecyduj, ale pamiêtaj, ¿e czasem trzeba wybraæ mniejsze z³o.
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_10"); //S³owo jednego nekromanty przeciwko drugiemu. Jesteœmy w czarnej dupie Beliara!
	AI_Output (other, self,"DIA_NonameT_Hi_Info_15_11"); //Powodzenia Bezimienny i nie daj siê zabiæ. Przynajmniej nie za szybko.
	AI_Output (self, other,"DIA_NonameT_Hi_Info_15_12"); //Tego mo¿esz byæ pewien. Bywaj, piracie.
	AI_DrawWeapon (self);
	Log_SetTopicStatus	(CH1_Rbl_NoName, LOG_SUCCESS);
	B_LogEntry		(CH1_Rbl_NoName, "Znajomoœæ z Bezimiennym zakoñczy³a siê tak samo jak siê rozpocze³a, czyli nagle. Mam nadziejê, ¿e uda mu siê odes³aæ tego Œni¹cego do cuchn¹cej nory Beliara. Czas zaj¹æ siê swoimi sprawami.");
	B_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "INVISIBLE"); 
   AI_SetWalkmode(self, NPC_RUN);
	AI_GotoWP		(self, "TPL_022");
};  
