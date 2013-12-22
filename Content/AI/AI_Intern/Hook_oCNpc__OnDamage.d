var int Hook_oCNPC_OnDamage_slfAdr;
// NOTE: Hooki działają poprawnie tylko w wypadku obrażeń
// zadanych w zwarciu oraz od obrażeń zadanych z broni dystansowych.
func void OCNPC_ONDAMAGE_Begin()
{
	Hook_oCNPC_OnDamage_slfAdr = getECX();
	//CheckAdress(getESP(),180,1,false);
};

func void OCNPC_ONDAMAGE_POSTEVENTCALL()
{
	//ECX + 0x24 oCAIHuman of dmg src
	var oCNpc slf; var oCNpc oth; 
	var int oCNpc_slf_Adr_in_oCDamageDescriptor;
	var int oCNpc_oth_Adr_in_oCDamageDescriptor;
	oCNpc_slf_Adr_in_oCDamageDescriptor = Hook_oCNPC_OnDamage_slfAdr;
	oCNpc_oth_Adr_in_oCDamageDescriptor = MEM_ReadInt(getECX() + 76);//0x48
	//if (!Hlp_Is_oCNpc(oCNpc_slf_Adr_in_oCDamageDescriptor)){ // fix: When attack type isn't melee ECX struct is different:
	//	//oCNpc_slf_Adr_in_oCDamageDescriptor = MEM_ReadInt(getECX() + 40);//0x24	
	//};
	//CheckAdress(getECX(),180,1,true);
	var C_NPC _slf; 	
	var C_NPC _oth; 
	MEM_AssignInst (_slf, oCNpc_slf_Adr_in_oCDamageDescriptor);
	MEM_AssignInst (_oth, oCNpc_oth_Adr_in_oCDamageDescriptor);
	//_slf = MEM_CpyInst(slf);
	//_oth = MEM_CpyInst(oth);
	printDebug_s_i_s_i(">#DamageReact: oth adr: ",MEM_InstToPtr(_oth),", valid:",Hlp_Is_oCNpc(oCNpc_oth_Adr_in_oCDamageDescriptor));
	printDebug_s_i_s_i(">#DamageReact: slf adr: ",MEM_InstToPtr(_slf),", valid:",Hlp_Is_oCNpc(oCNpc_slf_Adr_in_oCDamageDescriptor));
	//Ork: PERCe kompletnie wyłączam i opieram się wyłacznie na tym hook'u
	if (Hlp_Is_oCNpc(Hook_oCNPC_OnDamage_slfAdr)
	&& Hlp_Is_oCNpc(oCNpc_oth_Adr_in_oCDamageDescriptor))
	{
		printDebug(">#DamageReact: Calling Special Combad DmgREaction...");
		B_SpecialCombatDamageReaction(_slf,_oth);
	};
	//print("Hook worked");
	//CheckAdress(MEM_ReadInt(GetECX() + 24),180,1,true);
	//CheckAdress(getEBP(),800,1,true);
	//printDebug_ss(">#OnDamage: dst: ",slf.name);
	//if(Hlp_IsValidNpc(_oth))
	//{
	//	printDebug_ss(">#OnDamage: src: ",oth.name);
	//};
	//printDebug_s_i(">#OnDamage: Cmp npc1: ",CmpNpc(hero,_slf));
	//printDebug_s_i(">#OnDamage: Cmp npc2: ",CmpNpc(hero,hero));
	//if(CmpNpc(hero,_slf) && Hlp_IsValidNpc(_oth))
	//{
	//	Npc_ClearAIQueue(_oth);
	//	AI_GotoWP(_oth,"INVISIBLE");
	//	print_ss("Hero damaged!",oth.name);
	//	B_HeroReactToDamage(_oth);
	//	//B_KillNpc(_oth);
	//};
	//CheckAdress(ESPAdr(),128,1,1);
	//MEM_WriteInt(HookEngine_Hook_PreDropVob_JmpAdress,7023911);
};