const int poison_limit=31; //maksymalna liczba zatrutych
var int HeroIsPoisoned;
var int POISON_LastPos;//last used pos more npcs value decreases

func int  GetPoisonLastPos()
{
	var int idx; var int label;	var c_npc v;
	idx = POISON_LastPos;
	MEM_InitLabels(); 
	label = MEM_StackPos.position; 
	idx = idx - 1;
	v=Npc_GetNewsVictim(poison_memory,Npc_HasNews(poison_memory,idx,NULL,NULL));
	// Ork: Wprowadzam zmiany, bo to nie wyglada najlepiej, o 
	// ile da sie nadpisywaæ newsy to bedzie ok, poprostu zwracam tez uwage na stan AIV_POISON (nie samo npcIsValid)
	// [UP] Po wstepnych testach wyglada na to ¿e to dzia³a ok, jeszcze przetestowac wiele przeciwnikow
	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_POISON) )&&(idx>1)
	{
		MEM_StackPos.position = label; 	
	}
	else if(Npc_GetAivar(v,AIV_POISON))
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
	printdebug_s_i("Poison: Remove poisson npc, i:",i);
	
	if(Hlp_IsValidNpc(victim))
	{
		if(Npc_IsPlayer(victim))
		{
			HeroIsPoisoned=FALSE;	
		};
	};
	if(i==POISON_LastPos)
	{
		POISON_LastPos=GetPoisonLastPos();		
	};

};

//--------------------------------------------
// add_poison(atakuj¹cy/NULL,zatruty,damage)
//--------------------------------------------
func void add_poison_rec(var c_npc offender, var c_npc victim, var int damage,var int i)
{
	printdebug_s_i("Poison: Poisoned NPC idx: ",i);
	if(Npc_IsPlayer(victim))
	{
		HeroIsPoisoned=TRUE;	
	};
	if(i>POISON_LastPos)
	{
		POISON_LastPos=i;		
	};
	printdebug_s_i_s_i("Poison: Pre-news-create, mem-valid: ",Hlp_IsValidNpc(poison_memory),", offender:",Hlp_IsValidNpc(offender));
	printdebug_s_i("Poison: ... victim-valid: ",Hlp_IsValidNpc(victim));
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
	//Ork: "AND" ... naprawde? :D zamieniam na OR
	if(victim.guild==GIL_DEMON)||(victim.guild==GIL_ZOMBIE)||(victim.guild==GIL_UNDEADORC)||(victim.guild==GIL_SKELETON)
	{  //Poison immune monsters!
		printdebug("Poison: Npc was immune");
		return;
	};
	
	printdebug_ss("Poison: Poisoning npc: ",victim.name);
	printdebug_s_i("Poison: .. his ID: ",victim.id);
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
		printdebug_s_i("Poison: NPC was poisoned, last dmg: ",Npc_GetAivar(victim,AIV_POISON));
		Npc_SetAivar(victim,AIV_POISON,Npc_GetAivar(victim,AIV_POISON)/2+damage);
	}
	else
	{	
		Npc_SetAivar(victim,AIV_POISON,damage);
		printdebug_s_i("Poison: Poison damage: ",Npc_GetAivar(victim,AIV_POISON));
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
		if(Npc_GetAivar(v,AIV_POISON))
		{
			if(v.attribute[ATR_HITPOINTS]==1 && !CmpNpc(o,v))
			{				
				if(Npc_IsPlayer(o))
				{
					B_GiveXP(v.level*10);
				}			/*isHuman*/												/*Ismonster*/
				else if(C_Npcishuman(o) && Npc_GetAivar(o,AIV_PARTYMEMBER))||(C_Npcismonster(o)  && Npc_GetAivar(o,AIV_MM_PARTYMEMBER))
				{
					B_GiveXP(v.level*5);
					//if(HeroHasPupil)&&(CmpNpc(MyWolf,o))
					//{
					//	//Pupil_GiveXP(v.level*10);
					//}
					//else if(HeroHasPupil)
					//{
					//	//Pupil_GiveXP(v.level*5);		
					//};
				};	
			};		
			B_ChangeAttribute (v,ATR_HITPOINTS,-1);
			//Ork: Okurwa XD 
			Npc_AddToAivarValue(v,AIV_POISON,-1);
		}
		else   //remove poison
		{			
			printdebug("Poison: End of poison effect");
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
	printdebug_s_i("Poison: Damage Trigger, lastpos:",POISON_LastPos);
	poison_damage_rec(POISON_LastPos);
	};
};