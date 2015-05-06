//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_XardasOT_EXIT (C_INFO)
{
	npc			= KDF_406_OTXardas;
	nr			= 999;
	condition	= Info_XardasOT_EXIT_Condition;
	information	= Info_XardasOT_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_XardasOT_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasOT_EXIT_Info()
{
	B_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

instance  Info_XardasOT_OT (C_INFO)
{
	npc				= KDF_406_OTXardas;
	condition		= Info_XardasOT_OT_Condition;
	information		= Info_XardasOT_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_XardasOT_OT_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_Necromanus_Again))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_XardasOT_OT_Info()
{
	var C_NPC non;	non = Hlp_GetNpc(Nameless_Temple);

	AI_TurnToNpc(other, self);
   
	AI_Output(self, other,"Info_XardasOT_OT_14_01"); //Nie s³uchaj go! Ten ³garz chce wpl¹taæ Ciê w sieæ w³asnego szaleñstwa!
	AI_Output(other, self,"Info_XardasOT_OT_15_02"); //Czy¿by?
	AI_Output(self, other,"Info_XardasOT_OT_14_03"); //Jak móg³bym wch³on¹æ moc Œni¹cego? Przecie¿ tego demona nie sposób zabiæ!

	AI_Output(self, other,"Info_XardasOT_OT_14_04"); //Bezimienny musi go odes³aæ, tylko tak mo¿emy zniszczyæ barierê!
	AI_Output(self, other,"Info_XardasOT_OT_14_05"); //To jedyna szansa dla nas wszystkich...
	AI_TurnToNpc(self, non);
	AI_Output(self, other,"Info_Xardas_OT_14_01"); //Nie mamy wiele czasu, wiêc s³uchaj uwa¿nie.
	AI_Output(self, other,"Info_Xardas_OT_14_03"); //Œni¹cy jest ju¿ blisko. Wykorzysta³em ca³¹ swoj¹ moc, ¿eby siê tu dostaæ.
	AI_Output(self, other,"Info_Xardas_OT_14_04"); //Przet³umaczy³em staro¿ytne przepowiednie orków i odkry³em o co chodzi z piêcioma sercami.
	AI_Output(self, other,"Info_Xardas_OT_14_05"); //Piêæ serc nale¿¹cych do kap³anów, których pokona³eœ, z³o¿ono w piêciu kapliczkach.
	AI_Output(self, other,"Info_Xardas_OT_14_06"); //Kapliczki mo¿na otworzyæ, ale tylko staro¿ytne sztylety kap³anów s¹ w stanie je zniszczyæ.
	AI_Output(self, other,"Info_Xardas_OT_14_07"); //Musisz przebiæ serca kap³anów piêcioma sztyletami. Tylko w ten sposób uda Ci siê wygnaæ Œni¹cego z tego œwiata.
	AI_PlayAni(non,"T_YES");
	AI_Output(self, other,"Info_Xardas_OT_14_08"); //Spiesz siê. Przebudzenie demona odbêdzie siê ju¿ wkrótce. Szalony Cor Kalom i jego poplecznicy s¹ ju¿ tutaj.
	AI_Output(self, other,"Info_Xardas_OT_14_09"); //Zebrali siê w krypcie Œni¹cego.
	AI_Output(self, other,"Info_XardasOT_OT_14_06"); //Ruszaj przyjacielu...
	AI_PlayAni(non,"T_YES");
	B_StopProcessInfos(self);
};

//#####################################################################

instance  Info_XardasOT_Final (C_INFO)
{
	npc				= KDF_406_OTXardas;
	condition		= Info_XardasOT_Final_Condition;
	information		= Info_XardasOT_Final_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int Info_XardasOT_Final_Condition()
{	
	if (Npc_GetDistToNpc(self,hero) < 1000)&&(Npc_KnowsInfo (hero,DIA_NonameT_Hi))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_XardasOT_Final_Info()
{
	AI_TurnToNpc(other, self);
	AI_Output(self, other,"Info_XardasOT_Final_14_01"); //Decyduj, piracie. Nie mamy wiele czasu, Œni¹cy jest coraz silniejszy, a Twój mistrz jest czymœ wiêcej ni¿ tylko czarnym magiem...
	AI_Output(other, self,"Info_XardasOT_Final_15_02"); //Z³o mo¿na zwalczyæ tylko innym z³em. Ju¿ podj¹³em decyzjê, nekromanto.
	AI_Output(other, self,"Info_XardasOT_Final_15_03"); //Spraw, abym nie ¿a³owa³ tego wyboru!
	AI_Output(self, other,"Info_XardasOT_Final_14_04"); //Zabij go szybko! On zaraz siê zmieni...
	AI_PlayAni(other,"T_YES");
	AI_Output(self, other,"Info_XardasOT_Final_14_05"); //Co siê ze mn¹ dziejê...
	AI_Output(self, other,"Info_XardasOT_Final_14_06"); //On... Musisz...	
	Npc_ExchangeRoutine	(self, "DRAINED"); 	
	//Party_AddNpc(self);
	B_StopProcessInfos(self);
	
	//Ork: Pora na final battle!!!
	BOSSFIGHT_CURRENT = BOSSFIGHT_FGT5;
};
