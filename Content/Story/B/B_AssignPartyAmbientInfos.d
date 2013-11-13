// *************************************************************************
// 			B_AssignPartyAmbientInfos
// *************************************************************************

INSTANCE Info_PartyNPC_GivePotion(C_INFO)
{
	nr			= 990;
	condition	= Info_PartyNPC_GivePotion_Condition;
	information	= Info_PartyNPC_GivePotion_Info;
	permanent	= 1;
	description = "(Daj miksturê...)";
};                       

FUNC INT Info_PartyNPC_GivePotion_Condition()
{
	return 1;
};

FUNC VOID Info_PartyNPC_GivePotion_Info()
{
	Info_ClearChoices(Info_FindNPC_NC);
	Info_AddChoice(Info_PartyNPC_GivePotion, DIALOG_BACK, Info_PartyNPC_GivePotion_BACK);

	if (Npc_HasItems(other,ItFo_Potion_Health_01))
	{
		Npc_GetInvItem(other,ItFo_Potion_Health_01);
		Info_AddChoice(Info_PartyNPC_GivePotion, item.name, Info_PartyNPC_GivePotion_hp01);
	};
	
	if (Npc_HasItems(other,ItFo_Potion_Health_02))
	{
		Npc_GetInvItem(other,ItFo_Potion_Health_02);
		Info_AddChoice(Info_PartyNPC_GivePotion, item.name, Info_PartyNPC_GivePotion_hp02);
	};

	if (Npc_HasItems(other,ItFo_Potion_Health_03))
	{
		Npc_GetInvItem(other,ItFo_Potion_Health_03);
		Info_AddChoice(Info_PartyNPC_GivePotion, item.name, Info_PartyNPC_GivePotion_hp03);
	};
	
	if (Npc_HasItems(other,ItFo_Potion_Health_04))
	{
		Npc_GetInvItem(other,ItFo_Potion_Health_04);
		Info_AddChoice(Info_PartyNPC_GivePotion, item.name, Info_PartyNPC_GivePotion_hp04);
	};
};

FUNC VOID Info_PartyNPC_GivePotion_BACK()
{
	Info_ClearChoices(Info_PartyNPC_GivePotion);
};

// **********************
// 			01
// **********************

FUNC VOID Info_PartyNPC_GivePotion_hp01()
{
	B_GiveInvItems(other,self,ItFo_Potion_Health_01,1);
	if(self.attribute[ATR_HITPOINTS]+hp_Essenz<=self.attribute[ATR_HITPOINTS_MAX])
	{
		AI_UseItem(self,ItFo_Potion_Health_01);	
	};
	
	//back to old choices
	Info_PartyNPC_GivePotion_Info();
};

// **********************
// 			02
// **********************

FUNC VOID Info_PartyNPC_GivePotion_hp02()
{
	B_GiveInvItems(other,self,ItFo_Potion_Health_02,1);
	if(self.attribute[ATR_HITPOINTS]+hp_Extrakt<=self.attribute[ATR_HITPOINTS_MAX])
	{
		AI_UseItem(self,ItFo_Potion_Health_02);	
	};
	
	//back to old choices
	Info_PartyNPC_GivePotion_Info();
};

// **********************
// 			03
// **********************

FUNC VOID Info_PartyNPC_GivePotion_hp03()
{
	B_GiveInvItems(other,self,ItFo_Potion_Health_03,1);
	if(self.attribute[ATR_HITPOINTS]+hp_Elixier<=self.attribute[ATR_HITPOINTS_MAX])
	{
		AI_UseItem(self,ItFo_Potion_Health_03);	
	};
	
	//back to old choices
	Info_PartyNPC_GivePotion_Info();
};

// **********************
// 			04
// **********************

FUNC VOID Info_PartyNPC_GivePotion_hp04()
{
	B_GiveInvItems(other,self,ItFo_Potion_Health_04,1);
   
	if(self.attribute[ATR_HITPOINTS]<=self.attribute[ATR_HITPOINTS_MAX]/2)
	{
		AI_UseItem(self,ItFo_Potion_Health_04);	
	};
	
	//back to old choices
	Info_PartyNPC_GivePotion_Info();
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignPartyAmbientInfos (VAR C_NPC slf)
{
	Info_PartyNPC_GivePotion.npc = Hlp_GetInstanceID(slf);
};
