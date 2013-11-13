
// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_VLK_9999_Ziutek_WaitHere (C_INFO)
{
	npc				= VLK_9999_Ziutek;
	nr				= 1;
	condition		= DIA_VLK_9999_Ziutek_WaitHere_Condition;
	information		= DIA_VLK_9999_Ziutek_WaitHere_Info;
	permanent		= 1;
	important		= 0;
	description		= "Poczekaj tutaj!"; 
};

FUNC INT DIA_VLK_9999_Ziutek_WaitHere_Condition()
{
	if (Npc_GetAivar(self,AIV_MM_PARTYMEMBER) == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_VLK_9999_Ziutek_WaitHere_Info()
{

  	AI_Output (self, other,"DIA_VLK_9999_Ziutek_WaitHere_09_10"); //Poczekaj tutaj!
 	self.wp = Npc_GetNearestWP(self);
  	Npc_ExchangeRoutine	(self,"WAIT");	
	B_StopProcessInfos	( self );
	Party_RemoveNpc(self);

};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_VLK_9999_Ziutek_FollowMe (C_INFO)
{
	npc				= VLK_9999_Ziutek;
	nr				= 1;
	condition		= DIA_VLK_9999_Ziutek_FollowMe_Condition;
	information		= DIA_VLK_9999_Ziutek_FollowMe_Info;
	permanent		= 1;
	important		= 0;
	description		= "Choæ ze mn¹."; 
};

FUNC INT DIA_VLK_9999_Ziutek_FollowMe_Condition()
{
	if (Npc_GetAivar(self,AIV_MM_PARTYMEMBER) == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_VLK_9999_Ziutek_FollowMe_Info()
{

  	AI_Output (self, other,"DIA_VLK_9999_Ziutek_FollowMe_09_10"); //Choæ ze mn¹.

  	Npc_ExchangeRoutine	(self,"FOLLOW");	
	B_StopProcessInfos	( self );


};


///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_VLK_9999_Ziutek_Potion		(C_INFO)
{
	npc		 = 	VLK_9999_Ziutek;
	nr		 = 	4;
	condition	 = 	DIA_VLK_9999_Ziutek_Potion_Condition;
	information	 = 	DIA_VLK_9999_Ziutek_Potion_Info;
	permanent	 = 	TRUE;

	description	 = 	"Potrzebujesz mikstury leczniczej?";
};

func int DIA_VLK_9999_Ziutek_Potion_Condition ()
{
	if(Npc_GetAivar(self,AIV_MM_PARTYMEMBER))
	{
				return TRUE;
	};
};

func void DIA_VLK_9999_Ziutek_Potion_Info ()
{
	AI_Output			(other, self, "DIA_VLK_9999_Ziutek_Potion_15_00"); //Potrzebujesz mikstury leczniczej?
	AI_Output			(self, other, "DIA_VLK_9999_Ziutek_Potion_07_01"); //Jasne. Nie zaszkodzi.

	Info_ClearChoices	(DIA_VLK_9999_Ziutek_Potion);
	Info_AddChoice	(DIA_VLK_9999_Ziutek_Potion, "Dam ci póŸniej.", DIA_VLK_9999_Ziutek_Potion_spaeter );
	Info_AddChoice	(DIA_VLK_9999_Ziutek_Potion, "(najmniejsza mikstura lecznicza)", DIA_VLK_9999_Ziutek_Potion_heiltrankLow );
	Info_AddChoice	(DIA_VLK_9999_Ziutek_Potion, "(najlepsza mikstura lecznicza)", DIA_VLK_9999_Ziutek_Potion_heiltrank );

};
func void DIA_VLK_9999_Ziutek_Potion_heiltrank ()
{
	if (Npc_HasItems(other,ItFo_Potion_Health_03))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_03,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Elixier < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Elixier/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_03);
	};
	}
	else if (Npc_HasItems(other,ItFo_Potion_Health_02))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_02,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Extrakt < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Extrakt/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_02);
	};
	}
	else if (Npc_HasItems(other,ItFo_Potion_Health_01))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_01,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Essenz < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Essenz/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_01);
	};
	}
	else
	{
	AI_Output			(self, other, "DIA_VLK_9999_Ziutek_Potion_heiltrank_07_00"); //No to chyba musimy zaczekaæ, a¿ bêdziesz mia³ coœ dla mnie.
	};

	B_StopProcessInfos (self);
};
func void DIA_VLK_9999_Ziutek_Potion_heiltrankLow ()
{
	if (Npc_HasItems(other,ItFo_Potion_Health_01))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_01,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Essenz < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Essenz/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_01);
	};
	}
	else if (Npc_HasItems(other,ItFo_Potion_Health_02))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_02,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Extrakt < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Extrakt/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_02);
	};
	}
	else if (Npc_HasItems(other,ItFo_Potion_Health_03))
	{
	B_GiveInvItems (other, self, ItFo_Potion_Health_03,1);	
	if(self.attribute[ATR_HITPOINTS]+hp_Elixier < self.attribute[ATR_HITPOINTS_MAX]+Math_Round(hp_Elixier/2))
	{
		AI_UseItem (self, ItFo_Potion_Health_03);
	};
	}
	else
	{
	AI_Output			(self, other, "DIA_VLK_9999_Ziutek_Potion_heiltrankLow_07_00"); //Niestety, nie mam nic w tej chwili.
	};

	B_StopProcessInfos (self);
};
func void DIA_VLK_9999_Ziutek_Potion_spaeter ()
{
	AI_Output			(other, self, "DIA_VLK_9999_Ziutek_Potion_spaeter_15_00"); //Chwilowo nie mam ¿adnej przy sobie.
	AI_Output			(self ,other, "DIA_VLK_9999_Ziutek_Potion_spaeter_07_01"); //Dobra, ale gdybyœ coœ mia³ to pamiêtaj o mnie.
	
	B_StopProcessInfos (self);
};
 
