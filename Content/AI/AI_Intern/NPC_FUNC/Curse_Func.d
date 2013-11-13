const int Curse_limit=31; //maksymalna liczba zakl¹tfionych ;p
var int Curse_lastUsed; //optimization thing

const int events_per_sec=3;//0,33

const int curse_duration = 45*events_per_sec;

const int P_CURSE_EDGE=40;
const int P_CURSE_BLUNT=40;
const int P_CURSE_POINT=25;
const int P_CURSE_MAGIC=20;
const int P_CURSE_FIRE=25;

func int Curse_GetLastUsed()
{
	var int idx; var int label;	var c_npc v;
	idx = Curse_lastUsed;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(Curse_memory,Npc_HasNews(Curse_memory,idx,NULL,NULL));

	if(Npc_GetAivar(v,AIV_CURSE_DURATION))
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
// add_Curse(atakuj¹cy/NULL,zatruty,damage)
//--------------------------------------------
func void add_Curse_rec(var c_npc offender, var c_npc victim,var int i)
{

	if(!Hlp_IsValidNpc(victim)||!Npc_GetAivar(victim,AIV_CURSE_DURATION))
	{

		Npc_MemoryEntry(Curse_memory,1,offender,i,victim);
		if(!Npc_GetAivar(victim,AIV_CURSE_DURATION))
		{
			victim.protection[PROT_EDGE]-=P_CURSE_EDGE;
			victim.protection[PROT_BLUNT]-=P_CURSE_BLUNT;
			victim.protection[PROT_POINT]-=P_CURSE_POINT;
			victim.protection[PROT_MAGIC]-=P_CURSE_MAGIC;
			victim.protection[PROT_FIRE]-=P_CURSE_FIRE;		
		};
		Npc_SetAivar(victim,AIV_CURSE_DURATION,curse_duration);		
		if(i>Curse_lastUsed){Curse_lastUsed=i;};
	}
	else if(i>1)
	{
		add_Curse_rec(offender,victim,i-1);
	};
};
func void add_Curse(var c_npc offender, var c_npc victim)
{

		add_Curse_rec(offender,victim,1);
};
func void Curse_damage_rec(var int i)
{
	var c_npc v;

	v=Npc_GetNewsVictim(Curse_memory,Npc_HasNews(Curse_memory,i,NULL,NULL));
	if(Hlp_IsValidNpc(v))
	{	             

		if(Npc_GetAivar(victim,AIV_CURSE_DURATION))
		{
			Npc_SetAivar(v,AIV_CURSE_DURATION,-1);
			if(!Npc_GetAivar(victim,AIV_CURSE_DURATION))
			{
    	
				v.protection[PROT_EDGE]+=P_CURSE_EDGE;
				v.protection[PROT_BLUNT]+=P_CURSE_BLUNT;
				v.protection[PROT_POINT]+=P_CURSE_POINT;
				v.protection[PROT_MAGIC]+=P_CURSE_MAGIC;
				v.protection[PROT_FIRE]+=P_CURSE_FIRE;
				Curse_lastUsed=Curse_GetLastUsed();
	
			};
		}
		else if(i==Curse_lastUsed)
		{
				Curse_lastUsed-=1;
		};
	}
	else if(i==Curse_lastUsed)
	{
			Curse_lastUsed-=1;
	};
		if(i>1)
		{
			Curse_damage_rec(i-1);
		};
};
func void Curse_damage()
{
	if(Curse_lastUsed)
	{
		Curse_damage_rec(Curse_lastUsed);
	};
};

