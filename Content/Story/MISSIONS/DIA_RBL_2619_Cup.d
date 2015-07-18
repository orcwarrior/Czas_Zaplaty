
// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cup_Exit (C_INFO)
{
	npc			= RBL_2619_Cup;
	nr			= 999;
	condition	= DIA_Cup_Exit_Condition;
	information	= DIA_Cup_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cup_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cup_Exit_Info()
{
	B_StopProcessInfos	( self );
};


// **************************************************
// 					hello
// **************************************************


INSTANCE DIA_Cup_Hello (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 1;
	condition		= DIA_Cup_Hello_Condition;
	information		= DIA_Cup_Hello_Info;
	permanent		= 0;
	important		= 0;
	description		= "Witaj."; 
};

FUNC INT DIA_Cup_Hello_Condition()
{

	return 1;


};

FUNC VOID DIA_Cup_Hello_Info()
{
	AI_Output (other, self, "DIA_Cup_Hello_15_01"); //Witaj.
	AI_Output (self, other, "DIA_Cup_Hello_11_02"); //Nikomu nic nie stawiam, idŸ naci¹gn¹æ kogoœ innego!
	B_StopProcessInfos	( self );

};







INSTANCE DIA_Cup_What (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 1;
	condition		= DIA_Cup_What_Condition;
	information		= DIA_Cup_What_Info;
	permanent		= 0;
	important		= 0;
	description		= "Mam dla Ciebie wiadomoœæ."; 
};

FUNC INT DIA_Cup_What_Condition()
{

	if (Npc_KnowsInfo(other,DIA_Cup_Hello))&&(hark_trial == 1)
	{ 
		return TRUE; 
	}; 


};

FUNC VOID DIA_Cup_What_Info()
{
	AI_Output (other, self, "DIA_Cup_What_15_01"); //Mam dla Ciebie wiadomoœæ od Harka.
	AI_Output (self, other, "DIA_Cup_What_11_02"); //Czego chce ten syn cuchn¹cego capa?

	Info_ClearChoices(DIA_Cup_What);
	Info_AddChoice	 (DIA_Cup_What, "Jesteœ œmierdz¹cym tchórzem!" ,DIA_Cup_What_Coward);
	Info_AddChoice	 (DIA_Cup_What, "Twoja matka to dziwka!" ,DIA_Cup_What_Mam);
	Info_AddChoice	 (DIA_Cup_What, "Jesteœ cholernym opojem!" ,DIA_Cup_What_Drunk);
};

func void DIA_Cup_What_Mam()
{
	B_GiveXP(150);
	hark_trial = hark_trial +1;//2
	AI_Output (other, self,"DIA_Hark_What_Mam_15_00"); //Twoja matka to dziwka.
	AI_Output (self, other,"DIA_Hark_What_Mam_11_01"); //A to cholerny gnojek! 
	AI_Output (self, other,"DIA_Hark_What_Mam_11_02"); //Powiedz mu, ¿e jego stary wola³ owce. 
	B_LogEntry(CH1_Rbl_Hark, "Kufel faktycznie jest wra¿liwy na punkcie swojej rodziny. Teraz dla odmiany on zasugerowa³, ¿e ojciec Harka wola³ owce.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 

};

func void DIA_Cup_What_Coward()
{
	hark_trial = 10;
	AI_Output (other, self,"DIA_Hark_What_Coward_15_00"); //Jesteœ œmierdz¹cym tchórzem!
	AI_Output (self, other,"DIA_Hark_What_Coward_11_01"); //Tak, to œwietnie. ZejdŸ mi z oczu!
	B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Hark, "Nie uda³o mi siê sprowokowaæ Kufla.");
	Info_ClearChoices(DIA_Hark_What);
	B_StopProcessInfos	(self); 	
};

func void DIA_Cup_What_Drunk()
{
	hark_trial = 10;
	AI_Output (other, self,"DIA_Hark_What_Drunk_15_00"); //Jesteœ cholernym opojem!
	AI_Output (self, other,"DIA_Hark_What_Drunk_11_01"); //Akurat o tym to ka¿dy wie. Spadaj.
	B_LogSetTopicStatus(CH1_Rbl_Hark, LOG_FAILED);
	B_LogEntry(CH1_Rbl_Hark, "Nie uda³o mi siê sprowokowaæ Kufla.");
	Info_ClearChoices(DIA_Hark_What);	
	B_StopProcessInfos	(self); 
};

INSTANCE DIA_Cup_Again (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 1;
	condition		= DIA_Cup_Again_Condition;
	information		= DIA_Cup_Again_Info;
	permanent		= 0;
	important		= 0;
	description		= "To Ci siê nie spodoba."; 
};

FUNC INT DIA_Cup_Again_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Hark_Again))&&(hark_trial == 3)
	{ 
		return TRUE; 
	}; 
};

FUNC VOID DIA_Cup_Again_Info()
{
	var c_npc hark; hark = hlp_getnpc(RBL_2618_HARK);
	var c_npc cup; cup = hlp_getnpc(RBL_2619_Cup);
	hark_trial = hark_trial +1;//4
	
	AI_Output (other, self, "DIA_Cup_Again_15_01"); //To Ci siê nie spodoba.
	AI_Output (self, other, "DIA_Cup_Again_11_02"); //Co ten sukinsyn powiedzia³?
	AI_Output (other, self, "DIA_Cup_Again_15_03"); //Hark powiedzia³, ¿e to pewnie po tatusiu œmierdzisz i wygl¹dasz jak ork.
	AI_Output (self, other, "DIA_Cup_Again_11_04"); //Tego ju¿ za wiele. Idê skopaæ mu to t³uste dupsko!
	
	B_StopProcessInfos	(self);
	B_StartAfterDialogFight(cup,hark,false);
	Npc_SetTarget(cup, hark);
};


INSTANCE DIA_Cup_Again1 (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 5;
	condition		= DIA_Cup_Again1_Condition;
	information		= DIA_Cup_Again1_Info;
	permanent		= 0;
	important		= 0;
	description		= "Warto by³o?"; 
};

FUNC INT DIA_Cup_Again1_Condition()
{

	if (Npc_KnowsInfo(other,DIA_Hark_Again1))&&(hark_trial == 6)
	{ 
		return TRUE; 
	}; 


};

FUNC VOID DIA_Cup_Again1_Info()
{
	hark_trial = hark_trial +1;//7
	AI_Output (other, self, "DIA_Cup_Again1_15_01"); //Warto by³o?
	AI_Output (self, other, "DIA_Cup_Again1_11_02"); //ZejdŸ mi z oczu cholerny pod¿egaczu!
	B_StopProcessInfos	(self);

};


INSTANCE DIA_Cup_Statu (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 6;
	condition		= DIA_Cup_Statu_Condition;
	information		= DIA_Cup_Statu_Info;
	permanent		= 0;
	important		= 0;
	description		= "Œmierdzisz z³odziejem."; 
};

FUNC INT DIA_Cup_Statu_Condition()
{

	if (Npc_KnowsInfo(other,DIA_Leren_FirstInnos))
	{ 
		return TRUE; 
	}; 


};

FUNC VOID DIA_Cup_Statu_Info()
{
	CreateInvItems (self, poor_sack,1); 
	AI_Output (other, self, "DIA_Cup_Statu_15_01"); //Œmierdzisz z³odziejem.
	AI_Output (self, other, "DIA_Cup_Statu_11_02"); //A Co Ci do tego ³azêgo?
	AI_Output (other, self, "DIA_Cup_Statu_15_03"); //Ano to, ¿e nie lubiê z³odziei!
	B_StopProcessInfos	(self); 
	B_StartAfterDialogFight(self,other,false);

};

INSTANCE DIA_Cup_Again12 (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 7;
	condition		= DIA_Cup_Again12_Condition;
	information		= DIA_Cup_Again12_Info;
	permanent		= 0;
	important		= 0;
	description		= "Warto by³o?"; 
};

FUNC INT DIA_Cup_Again12_Condition()
{

	if (Npc_KnowsInfo(other,DIA_Cup_Statu))
	{ 
		return TRUE; 
	}; 


};

FUNC VOID DIA_Cup_Again12_Info()
{
	AI_Output (other, self, "DIA_Cup_Again12_15_01"); //Warto by³o?
	AI_Output (self, other, "DIA_Cup_Again12_11_02"); //ZejdŸ mi z oczu cholerny... z³odzieju!
	B_StopProcessInfos	(self);

};


// **************************************************


INSTANCE DIA_RBL_2619_Cup_Stew (C_INFO)
{
	npc				= RBL_2619_Cup;
	nr				= 12;
	condition		= DIA_RBL_2619_Cup_Stew_Condition;
	information		= DIA_RBL_2619_Cup_Stew_Info;
	permanent		= 0;
	important		= 0;
	description		= "Masz ochotê coœ zjeœæ?"; 
};

FUNC INT DIA_RBL_2619_Cup_Stew_Condition()
{


	if (Npc_KnowsInfo (hero, DIA_Fox_Camp))&&(NPC_HasItems(other,ItFo_Stew)>=1)
	{
		return 1;
	};


};

FUNC VOID DIA_RBL_2619_Cup_Stew_Info()
{
	fox_stew = fox_stew + 1;
	AI_Output (other, self, "DIA_RBL_2619_Cup_Stew_15_01"); //Masz ochotê coœ zjeœæ?
	AI_Output (self, other, "DIA_RBL_2619_Cup_Stew_11_02"); //Co tak œmierdzi?
	AI_Output (other, self, "DIA_RBL_2619_Cup_Stew_15_03"); //Gulasz Snafa.
	AI_Output (self, other, "DIA_RBL_2619_Cup_Stew_11_04"); //Cholera, chyba sam zacznê gotowaæ. Daj to paskudztwo, jak siê zatka nos, to nawet da siê zjeœæ.
	
	
	B_GiveInvItems (other, self, ItFo_Stew, 1);
	B_LogEntry		(CH2_Rbl_Food, "Jakoœ sobie poradzi³em z wepchniêciem gulaszu Kuflowi."); 

}; 
