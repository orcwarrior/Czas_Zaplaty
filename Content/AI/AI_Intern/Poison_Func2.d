const int poison_limit=31; //maksymalna liczba zatrutych
//--------------------------------------------
// add_poison(atakuj�cy/NULL,zatruty,damage)
//--------------------------------------------
func void add_poison_rec(var c_npc offender, var c_npc victim, var int damage,var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(hero,i);
	B_PrintDebug(concatstrings("V:",v.name));	
	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_POISON))
	{
		Npc_MemoryEntry(hero,0,offender,i,victim);
	}
	else if(i>1)
	{
		add_poison_rec(offender,victim,damage,i-1);
	};
};
func void add_poison(var c_npc offender, var c_npc victim, var int damage)
{
	if(victim.guild==GIL_DEMON)&&(victim.guild==GIL_ZOMBIE)&&(victim.guild==GIL_UNDEADORC)&&(victim.guild==GIL_SKELETON)
	{
		//Poison immune monsters!
		return;
	};
	if(Npc_GetAivar(victim,AIV_POISON))
	{
		Npc_SetAivar(victim,AIV_POISON,Npc_GetAivar(victim,AIV_POISON)/2+damage);
	}
	else
	{
		Npc_SetAivar(victim,AIV_POISON,damage);
		add_poison_rec(offender,victim,damage,poison_limit);
	};
};
func void poison_damage_rec(var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(hero,i);
	B_PrintDebug(concatstrings("VDMG:",v.name));		
	if(Hlp_IsValidNpc(v)&&Npc_GetAivar(v,AIV_POISON))
	{
		B_ChangeAttribute (v,ATR_HITPOINTS,-40);
		Npc_SetAivar(v,AIV_POISON,-1);
// można dodać sprawdzenie, czy zabiliśmy gościa, a wtedy dodać XP.
	};
	if(i>1)
	{
		poison_damage_rec(i-1);
	};
};
func void poison_damage()
{
	poison_damage_rec(poison_limit);
};

func void EVT_POISON()
{
	poison_damage();	
	Wld_SendTrigger("POISON_TRIGGER");
};