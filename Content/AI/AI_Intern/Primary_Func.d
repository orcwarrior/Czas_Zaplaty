//Before adding some function here:
// *it's shouldn't call any other function (except one added in this file)
// *it's called by many other function's and it could change on time

//////////////////////////////////////////////////////////////////////////
//C_Npcis...
//==========
//Stellt Fest, Ob Ein Nsc Mensch/Monster/Ork... Ist
//////////////////////////////////////////////////////////////////////////
Func Int C_Npcisdown(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcisdown");

	If(Npc_Isinstate(Slf,Zs_Unconscious)
	||	Npc_Isinstate(Slf,Zs_Magicsleep)
	||	Npc_Isdead(Slf))
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};

Func Int C_Npcishuman(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcishuman");
	//Printdebugstring(Pd_Zs_Detail,"...Name: ",Slf.Name);

	If(Slf.Guild < Gil_Seperator_Hum)&&(Npc_GetAivar(Slf,AIV_MM_REAL_ID) != ID_SKELETONRANGER)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};

Func Int C_Npcisorc(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcisorc");

	If(Slf.Guild > Gil_Seperator_Orc)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};Func Int C_Npcismonster(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcismonster");
	//Printdebugstring(Pd_Zs_Detail,"...Name: ",Slf.Name);

	If((Slf.Guild > Gil_Seperator_Hum)&&(Slf.Guild < Gil_Seperator_Orc))||(C_Npcisorc(Slf))||(Npc_GetAivar(Slf,AIV_MM_REAL_ID)	== ID_SKELETONRANGER)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};

Func Int C_Npcisdangerousmonster(Var C_Npc Slf,Var C_Npc Oth)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcisdangerousmonster");

	If(C_Npcismonster(Oth))
	&&(Wld_Getguildattitude(Oth.Guild,Slf.Guild)==Att_Hostile)
	&&(!Npc_GetAivar(Oth,Aiv_Mm_Partymember))
	&&	!C_Npcisdown(Oth)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	};

	//Printdebugint(Pd_Zs_Detail,"...False");
	Return False;
};

Func Int C_Npcisundead(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcisundead");

	If((Slf.Guild >=Gil_Zombie)&&(Slf.Guild <=Gil_Skeleton))||(Npc_GetAivar(Slf,Aiv_Mm_Real_Id)==Id_Skeletonmage)||(Npc_GetAivar(Slf,Aiv_Mm_Real_Id)==Id_Skeletonranger)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};
Func Int C_Npcismonstermage(Var C_Npc Slf)
{
	//Printdebugint(Pd_Zs_Detail,"C_Npcismonstermage");

	If((Slf.Fight_Tactic==Fai_Human_Mage)
	&&((Slf.Guild==Gil_Demon)||			//Skelett-Mage (Hat Aus Species.D-Technischen GrüNden DäMonen-Gilde!)
	(Slf.Guild==Gil_Orcshaman)||			//Ork-Shamane
	(Slf.Guild==Gil_Undeadorc)||			//Untoter Ork-Priester
	(Slf.Guild==Gil_Golem)))//Eisgolem Der Einen "Ice-Cube"-Angriff Hat
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};
};
Func Int C_Npcisevil(Var C_Npc Slf)
{
	If(C_Npcismonstermage(Slf))||(C_Npcisundead(Slf))||(C_Npcisorc(Slf))&&(Slf.Guild!=Gil_Golem)
	{
		//Printdebugint(Pd_Zs_Detail,"...True");
		Return True;
	}
	Else
	{
		//Printdebugint(Pd_Zs_Detail,"...False");
		Return False;
	};

};




//////////////////////////////////////////////////////////////////////////
//C_BodyStateContains
//===================
//Eine 'sichere' Abfrage auf Bodystates. Bitte NICHT die BuildIn
//'Npc_GetBodyState' direkt benutzen, denn Vergleiche wie
//
//if (Npc_GetBodyState(self) == BS_SIT)
//
//werden false ergeben, wenn zusätzlich zu BS_SIT auch noch
//BS_MOD_BURNING oder andere gesetzt sind (Charakter sitzt UND brennt)
//Abfragen auf Bodystates müssen also so aussehen:
//
//if (C_BodyStateContains(self,BS_SIT))
//
//////////////////////////////////////////////////////////////////////////
FUNC INT C_BODYSTATECONTAINS(VAR C_NPC SLF,VAR INT BODYSTATE)
{
	//PrintDebugInt(PD_ZS_DETAIL,"C_BodyStateContains()");

	//PrintDebugInt(PD_ZS_DETAIL,"bodystate: ",BODYSTATE);
	//PrintDebugInt(PD_ZS_DETAIL,"bodystate&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",BODYSTATE&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS));
	//PrintDebugInt(PD_ZS_DETAIL,"Npc_GetBodyState(slf): ",NPC_GETBODYSTATE(SLF));
	//PrintDebugInt(PD_ZS_DETAIL,"Npc_GetBodyState(slf)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",NPC_GETBODYSTATE(SLF)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS));

	//SN: Finger weg von dieser Formel!!! Ich weiß genau was ich tue!
	IF((NPC_GETBODYSTATE(SLF)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS))==(BODYSTATE&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS)))//sowohl bei der Abfrage als auch beim Vergleichswert die höhren Bits ausmaskieren!
	{																//...ja!
		//PrintDebugInt(PD_ZS_DETAIL,"...true");
		RETURN TRUE;
	}
	ELSE
	{
		//PrintDebugInt(PD_ZS_DETAIL,"...false");
		RETURN FALSE;
	};
};


//Written by Sektenspinner
func string Wld_GetPlayerPortalRoom() {
	MEM_InitGlobalInst();
	var oCPortalRoomManager portalman;
	portalman = MEM_PtrToInst (MEM_Game.portalman);
	var oCPortalRoom playerRoom;
	
	if (portalMan.curPlayerPortal) {
		playerRoom = MEM_PtrToInst (portalMan.curPlayerPortal);
		
		return playerRoom.portalName;
	} else {
		return "";
	};
};


func void B_ProcessInfos(var C_NPC npc)
{
	I_EnableCinemaScope();	
	AI_ProcessInfos(npc);	
};

func void B_StopProcessInfos(var C_NPC npc)
{
	//They're disabled by ZS_Talk_END if npc!=hero
	if(Npc_IsPlayer(npc))
	{
		I_DisableCinemaScope();
	};

	AI_StopProcessInfos(npc);	
};


// ***********************
// Items
// Get/UnEquip/Equip


//Calling Ikarus func for proper item equiping
func void B_EquipItem(var c_npc slf,var int instID)
{
	if(!Npc_GetInvItem(slf,instID))
	{
		return;
	};
	//
	CALL_PtrParam(MEM_InstToPtr(item));
	CALL__thiscall(MEM_InstToPtr(slf), oCNpc__Equip_offset);	
};

func void B_UnequipMeleeWeapon(var c_npc slf)
{
	var c_item meleeweap;
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
		meleeweap = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		meleeweap = Npc_GetEquippedMeleeWeapon(slf);	
	};
	
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
		AI_RemoveWeapon(slf);	
	};
	var int itmID;var int itmAMOUNT;
	var c_item rangedWEAP;
	if(Npc_HasReadiedRangedWeapon(slf))
	{
		rangedWEAP = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		rangedWEAP = Npc_GetEquippedRangedWeapon(slf);	
	};
	itmID = Hlp_GetInstanceID(rangedWEAP);
	if(itmID)
	{
		AI_UnequipWeapons(slf);	
		B_EquipItem(slf,itmID);	
	};	
};


func void B_UnequipRangedWeapon(var c_npc slf)
{
	var c_item rangedWEAP;
	if(Npc_HasReadiedRangedWeapon(slf))
	{
		rangedWEAP = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		rangedWEAP = Npc_GetEquippedRangedWeapon(slf);	
	};
	
	if(Npc_HasReadiedRangedWeapon(slf))
	{
		AI_RemoveWeapon(slf);	
	};
	var int itmID;var int itmAMOUNT;
	var c_item meleeweap;
	if(Npc_HasReadiedMeleeWeapon(slf))
	{
		meleeweap = Npc_GetReadiedWeapon(slf);	
	}
	else
	{
		meleeweap = Npc_GetEquippedMeleeWeapon(slf);	
	};	
	itmID = Hlp_GetInstanceID(meleeweap);
	if(itmID)
	{
		AI_UnequipWeapons(slf);	
		B_EquipItem(slf,itmID);	
	};	
};