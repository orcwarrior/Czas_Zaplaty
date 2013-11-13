func void B_CreateMeleeWeapon(var C_NPC slf)
{
//if(slf.guild ==
		
};

func void B_CreateRangedWeapon(var C_NPC slf)
{
	if(!Npc_HasEquippedRangedWeapon(slf))
	{
	//EquipItem(slf,Itmw_1h_Sword_01);
	};		
};
//No longer USED!!!		
func void B_InitNPCAddins(var C_NPC slf)
{
	//////////////////////////////////////////////////////////////////////////////////////
	//Hitpoints Correct/////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////
	if (slf.attribute[ATR_HITPOINTS] == slf.level*12)
	{
		slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS]+90;//90 startHP
	}
	else if ((slf.attribute[ATR_HITPOINTS] != slf.level*12)&&(slf.attribute[ATR_HITPOINTS] != slf.level*12+90))
	{
		slf.attribute[ATR_HITPOINTS] != slf.level*12+90;//To normalize hitpoints
	};
/* 	///////////////////////////////////////////////////////////////////////////////////////
	//Level Normalizer//////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////
	if (slf.level != (slf.attribute[ATR_HITPOINTS]-90)/12)
	{
		slf.level = (slf.attribute[ATR_HITPOINTS]-90)/12;
	}; */
	////////////////////////////////////////////////////////////////////////////////////////
	//Aivars////////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////////////////
	Npc_SetAivar(slf,AIV_HELLOSAYED,  0);	
	Npc_SetAivar(slf,AIV_SPECIALCOMBATDAMAGEREACTION,  TRUE);
	Npc_SetAivar(slf,AIV_LASTHP,  slf.attribute[ATR_HITPOINTS]);	
	
	
// 	////////////////////////////////////////////////////////////////////////////////////////
// 	//THief/////////////////////////////////////////////////////////////////////////////////
// 	////////////////////////////////////////////////////////////////////////////////////////
// 	var int thiefchance;
// 	thiefchance = Hlp_Random(20);
// 	if (slf.guild==GIL_PIR)
// 	{
// 		Npc_SetAivar(slf,AIV_LAWFULLNES,  30-thiefchance);
// 	}
// 	else if (slf.guild==GIL_RBL)
// 	{
// 		Npc_SetAivar(slf,AIV_LAWFULLNES,  40-thiefchance);
// 	}
// 	else if (slf.guild==GIL_MTR)
// 	{
// 		Npc_SetAivar(slf,AIV_LAWFULLNES,  60-thiefchance);
// 	}
// 	else if ((slf.guild == GIL_HUN)||(slf.guild == GIL_GRD)||(slf.guild == GIL_MAG)||(slf.guild == GIL_KDW)||(slf.guild == GIL_GUR))
// 	{
// 		Npc_SetAivar(slf,AIV_LAWFULLNES,  100);
// 	}
// 	else
// 	{
// 		Npc_SetAivar(slf,AIV_LAWFULLNES,  95-thiefchance);
// 	};
	/////////////////////////////////////////////////////////////////////////////////////////////
	//Strenght optimise////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	self.attribute[ATR_STRENGTH] = (3*self.attribute[ATR_STRENGTH])/2;
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - self.attribute[ATR_STRENGTH]%1;	
	/////////////////////////////////////////////////////////////////////////////////////////////
	//HitPoints optimise////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	slf.attribute[ATR_HITPOINTS_MAX] = slf.attribute[ATR_HITPOINTS_MAX]*2;	
	slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];	
	/////////////////////////////////////////////////////////////////////////////////////////////
	//Weapons TalentValues////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////
	var int valueadd;
	valueadd = Hlp_Random(29);
	//1h
	
	if (Npc_GetTalentSkill(slf,NPC_TALENT_1H)%1 != 0)
	{
	}
	else
	{
		if (Npc_GetTalentSkill(slf,NPC_TALENT_1H) == 0)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_1H,valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_1H) == 1)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_1H,30+valueadd);
		}

		else if (Npc_GetTalentSkill(slf,NPC_TALENT_1H) == 2)
		{
			valueadd = Hlp_Random(39);
			Npc_SetTalentValue(slf, NPC_TALENT_1H,60+valueadd);
		};
	};
	valueadd = Hlp_Random(29);
	//2h
	if (Npc_GetTalentSkill(slf,NPC_TALENT_2H)%1 != 0)
	{
	}
	else
	{
		if (Npc_GetTalentSkill(slf,NPC_TALENT_2H) == 0)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_2H,valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_2H) == 1)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_2H,30+valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_2H) == 2)
		{
			valueadd = Hlp_Random(39);
			Npc_SetTalentValue(slf, NPC_TALENT_2H,60+valueadd);
		};
	};
	valueadd = Hlp_Random(29);
	//Bow
	if (Npc_GetTalentSkill(slf,NPC_TALENT_BOW)%1 != 0)
	{
	}
	else
	{
		if (Npc_GetTalentSkill(slf,NPC_TALENT_BOW) == 0)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_BOW,valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_BOW) == 1)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_BOW,30+valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_BOW) == 2)
		{
			valueadd = Hlp_Random(39);
			Npc_SetTalentValue(slf, NPC_TALENT_BOW,60+valueadd);
		};
	};
	//Cbow
	valueadd = Hlp_Random(29);
	if (Npc_GetTalentSkill(slf,NPC_TALENT_CROSSBOW)%1 != 0)
	{
	}
	else
	{
		if (Npc_GetTalentSkill(slf,NPC_TALENT_CROSSBOW) == 0)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_CROSSBOW,valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_CROSSBOW) == 1)
		{
			Npc_SetTalentValue(slf, NPC_TALENT_CROSSBOW,30+valueadd);
		}
		else if (Npc_GetTalentSkill(slf,NPC_TALENT_CROSSBOW) == 2)
		{
			valueadd = Hlp_Random(39);
			Npc_SetTalentValue(slf, NPC_TALENT_CROSSBOW,60+valueadd);
		};
	};
	B_CreateMeleeWeapon(slf);
	B_CreateRangedWeapon(slf);
	///////////////////////////////////////////////////////////////////
	//---------------------------------------------------------------//
	//--------------------------- E  N  D ---------------------------//
	//---------------------------------------------------------------//
	///////////////////////////////////////////////////////////////////
};
