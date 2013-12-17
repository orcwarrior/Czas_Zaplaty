const int magicshield_limit=31; //maksymalna liczba zatrutych
var int magicshield_lastUsed;
const int magicshield_duration = 240;


func int Magicshield_GetLastUsed()
{
	var int idx; var int label;	var c_npc v;
	idx = magicshield_lastUsed;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(magicshield_memory,Npc_HasNews(magicshield_memory,idx,NULL,NULL));

	if(Npc_GetAivar(v,AIV_MAGICSHIELD_DURATION))
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
func void add_magicshield_rec(var c_npc victim,var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(magicshield_memory,Npc_HasNews(magicshield_memory,i,NULL,NULL));
	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_MAGICSHIELD_DURATION))
	{
		Npc_MemoryEntry(magicshield_memory,1,victim,i,victim);
		if(i>magicshield_lastUsed){magicshield_lastUsed=i;};

	}
	else if(i<magicshield_limit)
	{
		add_magicshield_rec(victim,i+1);
	};
};
func int Check_magicshield_AddedB4_rec(var c_npc victim,var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(magicshield_memory,Npc_HasNews(magicshield_memory,i,NULL,NULL));	
   	if(Hlp_IsValidNpc(v))
	{		
		if(CmpNpc(victim,v))&&(Npc_GetAivar(v,AIV_MAGICSHIELD_DURATION))
		{
			return TRUE;	
		}
		else if(i<magicshield_limit)
		{
			
			Check_magicshield_AddedB4_rec(victim,i+1);		
		}
		else
		{
			return FALSE;	
		};
	};
	
};
func int Check_magicshield_AddedB4(var c_npc victim)
{
	Check_magicshield_AddedB4_rec(victim,1);
	
};
func void add_magicshield(var c_npc victim)
{
		if(Check_magicshield_AddedB4(victim))
		{
			Npc_SetAivar(victim,AIV_MAGICSHIELD_DURATION,magicshield_duration);
			return;
		};
		Npc_SetAivar(victim,AIV_MAGICSHIELD_DURATION,magicshield_duration);
		
		
		add_magicshield_rec(victim,1);

};
func void magicshield_minus_rec(var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(magicshield_memory,Npc_HasNews(magicshield_memory,i,NULL,NULL));
   	if(Hlp_IsValidNpc(v))
	{	 
		if(Npc_GetAivar(v,AIV_MAGICSHIELD_DURATION))
		{
			Npc_AddToAivarValue(v,AIV_MAGICSHIELD_DURATION,-1);
			if(!Npc_GetAivar(v,AIV_MAGICSHIELD_DURATION))
			{
					Snd_Play3D 					(v,"MFX_MAGICSHIELD_END");
					magicshield_lastUsed=Magicshield_GetLastUsed();
			};	
		}
		else if(i==magicshield_lastUsed)
		{
				magicshield_lastUsed-=1;
		};
	};
	if(i>1)
	{
		magicshield_minus_rec(i-1);
	};
};
func void magicshield_minus()
{
	if(magicshield_lastUsed)
	{
		magicshield_minus_rec(magicshield_lastUsed);
	};
};

