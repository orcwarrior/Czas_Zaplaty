const int icearmor_limit=31; //maksymalna liczba zatrutych
var int icearmor_used; //optimization thing

const int icearmor_duration = 180*events_per_sec;

const int P_ICEARMOR_EDGE=50;
const int P_ICEARMOR_BLUNT=(-100);
const int P_ICEARMOR_POINT=50;
const int P_ICEARMOR_MAGIC=30;
const int P_ICEARMOR_FIRE=(-100);

func int IceArmor_GetLastUsed()
{
	var int idx; var int label;	var c_npc v;
	idx = icearmor_used;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(icearmor_memory,Npc_HasNews(icearmor_memory,idx,NULL,NULL));

	if(Npc_GetAivar(victim,AIV_ICEARMOR_DURATION))
	{
		return idx;	
	}	
	else if(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else
	{
		return 0;	
	};
	
};


func int Check_IceArmor_AddedB4_rec(var c_npc victim,var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(icearmor_memory,Npc_HasNews(icearmor_memory,i,NULL,NULL));	
	if(CmpNpc(victim,v))&&(Npc_GetAivar(v,AIV_ICEARMOR_DURATION))
	{
	return TRUE;	
	}
	else if(i<icearmor_limit)
	{
		Check_IceArmor_AddedB4_rec(victim,i+1);		
	}
	else
	{
		return FALSE;	
	};
	
};
func int Check_IceArmor_AddedB4(var c_npc victim)
{
	Check_IceArmor_AddedB4_rec(victim,1);
	
};

//--------------------------------------------
// add_poison(atakuj¹cy/NULL,zatruty,damage)
//--------------------------------------------
func void add_icearmor_rec(var c_npc offender, var c_npc victim,var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(icearmor_memory,Npc_HasNews(icearmor_memory,i,NULL,NULL));

	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_ICEARMOR_DURATION))
	{
		print("ICE ARMOR ADDED");
		Npc_MemoryEntry(icearmor_memory,1,offender,i,victim);
		if(i>icearmor_used){icearmor_used=i;};

	}
	else if(i<icearmor_limit)
	{
		add_icearmor_rec(offender,victim,i+1);
	};
};
func void add_icearmor(var c_npc offender, var c_npc victim)
{
		if(Check_IceArmor_AddedB4(victim))
		{
			Npc_SetAivar(victim,AIV_ICEARMOR_DURATION,icearmor_duration);
			return;
		};
		Npc_SetAivar(victim,AIV_ICEARMOR_DURATION,icearmor_duration);
		
		victim.protection[PROT_EDGE]+=P_ICEARMOR_EDGE;
		victim.protection[PROT_BLUNT]+=P_ICEARMOR_BLUNT;
		victim.protection[PROT_POINT]+=P_ICEARMOR_POINT;
		victim.protection[PROT_MAGIC]+=P_ICEARMOR_MAGIC;
		victim.protection[PROT_FIRE]+=P_ICEARMOR_FIRE;
		
		add_icearmor_rec(offender,victim,1);

};
func void icearmor_minus_rec(var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(icearmor_memory,Npc_HasNews(icearmor_memory,i,NULL,NULL));
   	if(Hlp_IsValidNpc(v))
	{	
		if(Npc_GetAivar(v,AIV_ICEARMOR_DURATION)==0)
		{
			print(inttostring(Npc_GetAivar(v,AIV_ICEARMOR_DURATION)));
			Npc_AddToAivarValue(v,AIV_ICEARMOR_DURATION,-1);
			if(!Npc_GetAivar(v,AIV_ICEARMOR_DURATION))
			{
			
				Snd_Play3D 					(v,"MFX_ICEARMOR_HIT");
				v.protection[PROT_EDGE]-=P_ICEARMOR_EDGE;
				v.protection[PROT_BLUNT]-=P_ICEARMOR_BLUNT;
				v.protection[PROT_POINT]-=P_ICEARMOR_POINT;
				v.protection[PROT_MAGIC]-=P_ICEARMOR_MAGIC;
				v.protection[PROT_FIRE]-=P_ICEARMOR_FIRE;
				icearmor_used=IceArmor_GetLastUsed();
	
			};
		};
	};
	if(i>1)
	{
		icearmor_minus_rec(i-1);
	};
};
func void icearmor_minus()
{
	if(icearmor_used)
	{
		icearmor_minus_rec(icearmor_limit);
	};
};

