//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_DOrcShaman_EXIT (C_INFO)
{
	npc			= ORC_4031_Shaman;
	nr			= 999;
	condition	= Info_DOrcShaman_EXIT_Condition;
	information	= Info_DOrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_DOrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_DOrcShaman_EXIT_Info()
{
	B_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
instance  Info_DOrcShaman_Kill (C_INFO)
{
	npc			= ORC_4031_Shaman;
	condition	= Info_DOrcShaman_Kill_Condition;
	information	= Info_DOrcShaman_Kill_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_DOrcShaman_Kill_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Leren_Mag1))
	{
		return 1;
	};
};
FUNC void  Info_DOrcShaman_Kill_Info()
{
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_01"); //Œmiertelna Morra przysz³a zabraæ coœ, co nie nale¿eæ do ten œwiat!
	AI_Output 		(other,self,"Info_DOrcShaman_Kill_15_02"); //Nie doœæ, ¿e martwy to jeszcze gada.
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_03"); //Akhr'Ustah byæ stra¿nik œwiatów, nie pozwoliæ odejœæ ¿ywa Mora.
	AI_Output 	(other,self,"Info_DOrcShaman_Kill_15_04"); //Cholera czy nawet martwi magowie musz¹ tyle gadaæ?!
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill_17_05"); //Syn Ognia zabiæ teraz Morra, uwiêziæ nieœmiertelna dusza i...
	AI_Output 	(other,self,"Info_DOrcShaman_Kill_15_06"); //Zrób w koñcu, co obiecujesz i przestañ gadaæ cholerna kupo truch³a!
	B_LogEntry		(CH2_RBL_Artefact, "W œwi¹tyni dopad³ mnie nieumar³y szaman. Zdaje siê, ¿e to stra¿nik. Muszê siê go pozbyæ, ¿eby zabraæ artefakt.");

	B_StopProcessInfos	(self); 
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget(self,other); 
	AI_StartState(self,ZS_ATTACK,1,"");
}; 

//---------------------------------------------------------------------
instance  Info_DOrcShaman_Kill1 (C_INFO)
{
	npc			= ORC_4031_Shaman;
	condition	= Info_DOrcShaman_Kill1_Condition;
	information	= Info_DOrcShaman_Kill1_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_DOrcShaman_Kill1_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_DOrcShaman_Kill))&&(self.attribute[ATR_HITPOINTS] <= 20)//ma siê inicjowaæ jak hp mu spadnie do 20
	{
		return 1;
	};
};
FUNC void  Info_DOrcShaman_Kill1_Info()
{
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill1_17_01"); //Morra mnie uwolniæ. Morra zas³ugiwaæ na potêga zorzy. 
	AI_Output 	(other,self,"Info_DOrcShaman_Kill1_15_02"); //Mi³o by³o Ciê poznaæ o¿ywieñcu.
	AI_Output 	(self, hero,"Info_DOrcShaman_Kill1_17_03"); //Akhr'Ustah w koñcu odejœæ do bracia...
	B_LogEntry		(CH2_RBL_Artefact, "Zabi³em szamana, zorza potêgi jest teraz moja.");

	B_StopProcessInfos(self);

	/****************************
	Szaman ma znikn¹c w jakimœ fajnym pfxie, mo¿e tak byæ?
	wp pozmieniaj i zobacz jak z t¹ rutyn¹
	*****************************/

	Wld_PlayEffect("INCOVATION_RED",self,self,0,0,0,FALSE);
	AI_WAIT (self,0.1);
	Npc_ExchangeRoutine (self, "WP");
	AI_Teleport  (self, "WP");
	B_KillNpc (self);
};
