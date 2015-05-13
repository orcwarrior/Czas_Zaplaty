var int Hook_oCNPC_OnDamage_slfAdr;
const int MAX_RANGE_INT = 1073741823; //2^30 - 1
// NOTE: Hooki dzia³aj¹ poprawnie tylko w wypadku obra¿eñ
// zadanych w zwarciu oraz od obra¿eñ zadanych z broni dystansowych.
func void OCNPC_ONDAMAGE_Begin()
{
	Hook_oCNPC_OnDamage_slfAdr = getECX();
	//CheckAdress(getESP(),180,1,false);
};

func void OCNPC_ONDAMAGE_POSTEVENTCALL() 
{
	// EAX - contains damage
	//oCNpc_slf_Adr_in_oCDamageDescriptor == defender
	//oCNpc_oth_Adr_in_oCDamageDescriptor == attacker
    
	var int attacker; attacker = MEM_ReadInt (MEM_ReadInt (ESP + 548) + 4); // other
	var int defender; defender = ECX; // self
    
   if (defender == attacker)
	{
		return;
   };

   if (Hlp_Is_oCNpc (attacker)
   && Hlp_Is_oCNpc (defender))
	{
      var C_Npc att; att = _^ (attacker);
      var C_Npc def; def = _^ (defender);
      // self to deffender, a other to attacker
      B_SpecialCombatDamageReaction (def, att);
	};
};