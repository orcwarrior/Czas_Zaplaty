//////////////////////////////////////////////////////////////////////////
//	ZS_Mis_UrtChangeArmor
//	===========
//	Tagesablauf-Zustand: menschlicher NSC folgt dem Spieler in einigem
//	Abstand überall hin.
//////////////////////////////////////////////////////////////////////////
func void ZS_Mis_UrtChangeArmor()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_Mis_UrtChangeArmor");
	GuardPerception ();
	//  Wahrnehmungen aktiv 
 						
	// * Wahrnehmungen passiv *
	Npc_PercEnable  	(self, 	PERC_ASSESSTALK			,	B_AssessTalk 		);
};

func int ZS_Mis_UrtChangeArmor_Loop()
{
	var int i;
	i +=1;
	////PrintDebugNpc		(PD_TA_LOOP,	"ZS_Mis_UrtChangeArmor_Loop");
	//PrintGlobals		(PD_MST_DETAIL);
	printdebug_s_i("armorchange: loop ",i);
	//-------- SC-Meister folgen ! --------
	if (Npc_GetDistToNpc(self,hero) < 3500)
	{
		var c_item armor;
		armor = Npc_GetEquippedArmor(self);
		if(!Hlp_IsItem(armor,GRD_ARMOR_M))
		{
			AI_UnequipArmor(self);
			if(!Npc_HasItems(self,GRD_ARMOR_M))
			{ CreateInvItem(self,GRD_ARMOR_M);};
			AI_EquipArmor(self,GRD_ARMOR_M);
			NPC_RemoveInvItem(self,RBL_MW_04);
			CreateInvItem(self,GRD_MW_02);
			AI_EquipBestMeleeWeapon(self);
			return				LOOP_CONTINUE;
		}
		else
		{
			return				LOOP_END;
		};
	};
	
	AI_WaitMS				(self,	500);
	
};
func void ZS_Mis_UrtChangeArmor_End()
{
	////PrintDebugNpc		(PD_TA_FRAME,	"ZS_FollowPijakB_End");

	//Npc_ExchangeRoutine(self,"OC2");

};

