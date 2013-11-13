// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_mag_1330_baalparvez_Exit (C_INFO)
{
	npc			= mag_1330_baalparvez;
	nr			= 999;
	condition	= DIA_mag_1330_baalparvez_Exit_Condition;
	information	= DIA_mag_1330_baalparvez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_mag_1330_baalparvez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_mag_1330_baalparvez_Exit_Info()
{
	B_StopProcessInfos(self);
};

INSTANCE DIA_mag_1330_baalparvez_hi (C_INFO)
{
	npc				= mag_1330_baalparvez;
	nr				= 1;
	condition		= DIA_mag_1330_baalparvez_hi_Condition;
	information		= DIA_mag_1330_baalparvez_hi_Info;
	permanent		= 0;
	important		= 0;
	description		= "Kim jesteœ?"; 
};

FUNC INT DIA_mag_1330_baalparvez_hi_Condition()
{
	return 1;
};

FUNC VOID DIA_mag_1330_baalparvez_hi_Info()
{
	AI_Output (other, self, "DIA_mag_1330_baalparvez_hi_15_01"); //Kim jesteœ?
	AI_Output (self, other, "DIA_mag_1330_baalparvez_hi_11_02"); //Prochem rzuconym przez los na szaniec zapomnienia...
};

INSTANCE DIA_mag_1330_baalparvez_Aloes (C_INFO)
{
	npc				= mag_1330_baalparvez;
	nr				= 12;
	condition		= DIA_mag_1330_baalparvez_Aloes_Condition;
	information		= DIA_mag_1330_baalparvez_Aloes_Info;
	permanent		= 0;
	important		= 0;
	description		= "Potrafisz przyrz¹dziæ miksturê z aloesu?"; 
};

FUNC INT DIA_mag_1330_baalparvez_Aloes_Condition()
{
	if (NPC_HasItems(other,aloes)>=1)&&(aloes_find)
	{
		return 1;
	};
};

FUNC VOID DIA_mag_1330_baalparvez_Aloes_Info()
{
	AI_Output (other, self, "DIA_mag_1330_baalparvez_Aloes_15_01"); //Potrafisz przyrz¹dziæ miksturê z aloesu?
	AI_Output (self, other, "DIA_mag_1330_baalparvez_Aloes_11_02"); //Wybacz, ale nie mam teraz czasu. Porozmawiaj z Taranem.
	Npc_ExchangeRoutine	(self,"start");
}; 

INSTANCE DIA_Parvez_CanYouTeachMe (C_INFO)
{
	npc				= mag_1330_baalparvez;
	//nr				= 71;
	condition		= DIA_Parvez_CanYouTeachMe_Condition;
	information		= DIA_Parvez_CanYouTeachMe_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
};

FUNC INT DIA_Parvez_CanYouTeachMe_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_mag_1330_baalparvez_hi))
	{
		return 1;
	};
};

FUNC VOID DIA_Parvez_CanYouTeachMe_Info()
{
	AI_Output (other, self, "DIA_Parvez_CanYouTeachMe_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other, "DIA_Parvez_CanYouTeachMe_12_02"); //Znam sekrety alchemii.
	
	Log_CreateTopic(GE_TeacherOR, LOG_NOTE);
	B_LogEntry(GE_TeacherOR, "Parvez mo¿e pokazaæ mi kilka alchemicznych sztuczek.");
};