//Function checks whether NPC has a left dual to avoid creating too many copies of it during quick searching (2x CTRL).
//A weapon can't see in equipment during basic searching, the left dual doesn't drop also on ground.
//Funkcja sprawdza, czy NPC ma lewego duala, aby unikn¹æ tworzenia kopii przy szybkim przeszukiwaniu (2x CTRL).
//Niestety broni nie widaæ w ekwipunku przy normalnym przeszukiwaniu, lewy dual nie wypada równie¿ na ziemiê.

func void B_checkHasLeftdual()
{
	if (Npc_HasItems(self, ItMw_Dual_01_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_01_Left);
		CreateInvItem(self, ItMw_Dual_01_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_02_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_02_Left);
		CreateInvItem(self, ItMw_Dual_02_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_03_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_03_Left);
		CreateInvItem(self, ItMw_Dual_03_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_04_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_04_Left);
		CreateInvItem(self, ItMw_Dual_04_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_05_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_05_Left);
		CreateInvItem(self, ItMw_Dual_05_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_06_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_06_Left);
		CreateInvItem(self, ItMw_Dual_06_Left);
	}
	else if (Npc_HasItems(self, ItMw_Dual_07_Left))
	{
		AI_UnequipArmor(self);
		Npc_RemoveInvItem(self, ItMw_Dual_07_Left);
		CreateInvItem(self, ItMw_Dual_07_Left);
	};
};