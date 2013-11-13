const int poison_limit=31; //maksymalna liczba zatrutych
var int HeroIsPoisoned;
var int POISON_LastPos;//last used pos more npcs value decreases
//--------------------------------------------
// add_poison(atakuj¹cy/NULL,zatruty,damage)
//--------------------------------------------
func int  GetPoisonLastPos()
{
	var int idx; var int label;	var c_npc v;
	idx = POISON_LastPos;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(poison_memory,Npc_HasNews(poison_memory,idx,NULL,NULL));
	if(!Hlp_IsValidNpc(v))&&(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else if(Hlp_IsValidNpc(v))
	{
		return idx;	
	}
	else
	{
		return 0;	
	};
	
};
func void purge_poison(var c_npc victim, var int i)
{
	if(Npc_IsPlayer(victim))
	{
	HeroIsPoisoned=FALSE;	
	};
	if(i==POISON_LastPos)
	{
		POISON_LastPos=GetPoisonLastPos();		
	};

};


func void add_poison_rec(var c_npc offender, var c_npc victim, var int damage,var int i)
{
	if(Npc_IsPlayer(victim))
	{
	HeroIsPoisoned=TRUE;	
	};
	if(i>POISON_LastPos)
	{
		POISON_LastPos=i;		
	};
	Npc_MemoryEntry(poison_memory,1,offender,i,victim);
};
//check if any lower index is free so it can fill it
func int  add_poison_check_smaller_indexes()
{
	var int idx; var int label;	var c_npc v;
	idx = POISON_LastPos;
	MEM_InitLabels(); 
	
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(poison_memory,Npc_HasNews(poison_memory,idx,NULL,NULL));
	if(Hlp_IsValidNpc(v))&&(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else if(!Hlp_IsValidNpc(v))
	{
		return idx;	
	}
	else
	{
		return -1;	
	};
	
};
func void add_poison(var c_npc offender, var c_npc victim, var int damage)
{
	var int idx;
	if(victim.guild==GIL_DEMON)&&(victim.guild==GIL_ZOMBIE)&&(victim.guild==GIL_UNDEADORC)&&(victim.guild==GIL_SKELETON)
	{
		//Poison immune monsters!
		return;
	};
	
	if(POISON_LastPos>1)
	{
		idx = add_poison_check_smaller_indexes();
		if(idx== -1)
		{
			add_poison_rec(offender,victim,damage,POISON_LastPos+1);			
		}
		else
		{
			add_poison_rec(offender,victim,damage,idx);				
		};	
	}
	else//lastpos==1 or 0
	{
		add_poison_rec(offender,victim,damage,POISON_LastPos+1);	
	};
	
	if(Npc_GetAivar(victim,AIV_POISON))
	{
		Npc_SetAivar(victim,AIV_POISON,Npc_GetAivar(victim,AIV_POISON)/2+damage);
	}
	else
	{
		Npc_SetAivar(victim,AIV_POISON,damage);
	};
};
func void poison_damage_rec(var int i)
{
	var c_npc v;
	var c_npc o;
	v=Npc_GetNewsVictim(poison_memory,Npc_HasNews(poison_memory,i,NULL,NULL));
	o=Npc_GetNewsOffender(poison_memory,Npc_HasNews(poison_memory,i,NULL,NULL));
	if(Hlp_IsValidNpc(v))
	{	

		if(Npc_GetAivar(victim,AIV_POISON))
		{
			if(v.attribute[ATR_HITPOINTS]==1)
			{
				if(Npc_IsPlayer(o))
				{
					B_GiveXP(v.level*10);	// vergibt XP an SC
					if(HeroHasPupil)
					{
						//Pupil_GiveXP(v.level*5);	
					};	
				}			/*isHuman*/												/*Ismonster*/
				else if(C_Npcishuman(o) && Npc_GetAivar(o,AIV_PARTYMEMBER))||(C_Npcismonster(o)  && Npc_GetAivar(o,AIV_MM_PARTYMEMBER))
				{
					B_GiveXP(v.level*5);
					if(HeroHasPupil)&&(CmpNpc(MyWolf,o))
					{
						//Pupil_GiveXP(v.level*10);
					}
					else if(HeroHasPupil)
					{
						//Pupil_GiveXP(v.level*5);		
					};
				};	
			};		
			B_ChangeAttribute (v,ATR_HITPOINTS,-1);
			Npc_SetAivar(v,AIV_POISON,-1);
		}
		else   //remove poison
		{
			purge_poison(v,i);	
		};
	};
	if(i>1)
	{
		poison_damage_rec(i-1);
	};
	
};
func void poison_damage()
{
	if(POISON_LastPos)
	{
	poison_damage_rec(POISON_LastPos);
	};
};