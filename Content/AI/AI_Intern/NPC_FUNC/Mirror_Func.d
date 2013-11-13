const int mirror_limit=31; //maksymalna liczba mirrorujacych :P
var int mirror_lastUsed; //optimization thing
var int HeroHaveMirrorAbility;
const int mirror_duration = 180*events_per_sec;

func int Mirror_GetLastUsed()
{
	var int idx; var int label;	var c_npc v;
	idx = mirror_lastUsed;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(mirror_memory,Npc_HasNews(mirror_memory,idx,NULL,NULL));

	if(Npc_GetAivar(v,AIV_MIRROR_DURATION))
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
//--------------------------------------------
// add_poison(atakuj¹cy/NULL,zatruty,damage)
//--------------------------------------------
func void add_mirror_rec(var c_npc offender, var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(mirror_memory,Npc_HasNews(mirror_memory,i,NULL,NULL));
	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_MIRROR_DURATION))
	{
		Npc_MemoryEntry(mirror_memory,1,offender,i,offender);
		if(i>mirror_lastUsed){mirror_lastUsed=i;};
	}
	else if(i<mirror_limit)
	{
		add_mirror_rec(offender,i+1);
	};
};
func void add_mirror(var c_npc offender)
{
		Npc_SetAivar(offender,AIV_MIRROR_DURATION,mirror_duration);
		add_mirror_rec(offender,1);

};
func void mirror_walker_rec(var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(mirror_memory,Npc_HasNews(mirror_memory,i,NULL,NULL));
	if(Hlp_IsValidNpc(v))
	{	
		if(Npc_IsPlayer(v))
		{
			HeroHaveMirrorAbility=TRUE;	
		};
		if(Npc_GetAivar(v,AIV_MIRROR_DURATION))
		{
			Npc_SetAivar(v,AIV_MIRROR_DURATION,-1);
			if(!Npc_GetAivar(v,AIV_MIRROR_DURATION))
			{
					Snd_Play3D 					(v,"MFX_MIRROR_KONIEC");
					mirror_lastUsed=Mirror_GetLastUsed();
			};
		}
		else if(i==mirror_lastUsed)
		{
				mirror_lastUsed-=1;
		};
	};
	if(i>1)
	{
		mirror_walker_rec(i-1);
	};
	
};
func void mirror_damage()
{
	if(mirror_lastUsed)
	{	
		mirror_walker_rec(mirror_lastUsed);
	};
};

