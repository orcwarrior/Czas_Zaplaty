const int npc_bonus_time = 0;
const int npc_bonus_hp = 1;
const int npc_bonus_hpmax = 2;
const int npc_bonus_str = 3;
const int max_bonuses = 10;//in same time

var int TimedBoostNPC10[4];
var int TimedBoostNPC9[4];
var int TimedBoostNPC8[4];
var int TimedBoostNPC7[4];
var int TimedBoostNPC6[4];
var int TimedBoostNPC5[4];
var int TimedBoostNPC4[4];
var int TimedBoostNPC3[4];
var int TimedBoostNPC2[4];
var int TimedBoostNPC1[4];


// //ATRIBUTE
//  var int str_time;
//  var int dex_time;
//  var int hp_time; 
//  var int mp_time; 
// //PROTECTION
// var int edg_bonus; var int edg_time;
// var int pnt_bonus; var int pnt_time;
// var int fir_bonus; var int fir_time;
// var int mag_bonus; var int mag_time;

// const int	TP_TYPE_ATR = 0;//Attrbute temppotion
// const int	TP_TYPE_PROT = 1;//Protection temppotion
// const int POTION_TICKS_PER_MINUTE=1*60;
// func int Get_IntFragment(var int l,var int from, var int to)
// {
// 	l=(l%(Math_Power(10,to)));//(54321%10000)=4321
// 	l=l/Math_Power(10,from-1);//4321/10%1=432,1
// 	l=l-(l%1);//432,1-0,1=432
// 	return l;
// };
// func void temp_potion_unequip(var int att)
// {
// 	if(att==ATR_STRENGTH)
// 	{
// 		var c_item meleeweap;
// 		if(Npc_HasReadiedWeapon(hero))
// 		{
// 		 	meleeweap = Npc_GetReadiedWeapon(hero);	
// 		}
// 		else
// 		{
// 			meleeweap = Npc_GetEquippedMeleeWeapon(hero);	
// 		};
// 		if(hero.attribute[ATR_STRENGTH]<meleeweap.cond_value[2]+LSWD_STR)&&(DualEquiped)
// 		{
// 			B_UnequipLeftSword();
// 		};
// 		if(meleeweap.cond_value[2]>hero.attribute[ATR_STRENGTH])
// 		{
// 			if(Npc_HasReadiedWeapon(hero))
// 			{
// 			AI_RemoveWeapon(hero);	
// 			};
// 			//AI_EquipBestMeleeWeapon(hero);
// 		};
// 			
// 	}
// 	else if(att==ATR_DEXTERITY)
// 	{
// 		var c_item rangedweap;
// 		if(Npc_HasReadiedWeapon(hero))
// 		{
// 		 	rangedweap = Npc_GetReadiedWeapon(hero);	
// 		}
// 		else
// 		{
// 			rangedweap = Npc_GetEquippedRangedWeapon(hero);	
// 		};
// 		if(meleeweap.cond_value[2]>hero.attribute[ATR_DEXTERITY])
// 		{
// 			if(Npc_HasReadiedWeapon(hero))
// 			{
// 			AI_RemoveWeapon(hero);	
// 			};
// 			//AI_EquipBestRangedWeapon(hero);
// 		};			
// 	}
// 	else if(att==ATR_MANA)
// 	{
// 		
// 	};
// };
// func void temp_potion_trigger()
// {
// 	if(str_time)
// 	{
// 		str_time-=1;
// 		if(str_time==0)
// 		{	
// 			B_ChangeAttribute(hero,ATR_STRENGTH,-str_tp_bonus); 
// 			str_tp_bonus=0;	
// 			temp_potion_unequip(ATR_STRENGTH);
// 			B_SetSkillValuesBasedOnAttribute(hero,ATR_STRENGTH);	
// 			
// 		};
// 	};
// 	if(dex_time)
// 	{
// 		dex_time-=1;
// 		if(dex_time==0)
// 		{	B_ChangeAttribute(hero,ATR_DEXTERITY,-dex_tp_bonus); 
// 			dex_tp_bonus=0;		
// 			temp_potion_unequip(ATR_DEXTERITY);			
// 			B_SetSkillValuesBasedOnAttribute(hero,ATR_DEXTERITY);	
// 		};
// 	};
// 	if(hp_time)
// 	{
// 		hp_time-=1;
// 		if(hp_time==0)
// 		{	B_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-hp_tp_bonus); if(hero.attribute[ATR_HITPOINTS]-hp_tp_bonus>1){B_ChangeAttribute(hero,ATR_HITPOINTS,-hp_tp_bonus);}else{B_ChangeAttribute(hero,ATR_HITPOINTS,2);}; 
// 			hp_tp_bonus=0;			
// 		};
// 	};	
// 	if(mp_time)
// 	{
// 		mp_time-=1;
// 		if(mp_time==0)
// 		{	B_ChangeAttribute(hero,ATR_MANA_MAX,-mp_tp_bonus); B_ChangeAttribute(hero,ATR_MANA,-mp_tp_bonus); 
// 			mp_tp_bonus=0;			
// 			B_SetSkillValuesBasedOnAttribute(hero,ATR_MANA_MAX);	
// 			
// 		};
// 	};	
// 	if(edg_time)
// 	{
// 		edg_time-=1;
// 		if(edg_time==0)
// 		{ hero.protection [PROT_EDGE]-=edg_bonus; hero.protection [PROT_BLUNT]-=edg_bonus;	
// 			edg_bonus=0;			
// 		};
// 	};	
// 	if(pnt_time)
// 	{
// 		pnt_time-=1;
// 		if(pnt_time==0)
// 		{ 	hero.protection [PROT_POINT]-=pnt_bonus;	
// 			pnt_bonus=0;			
// 		};
// 	};	
// 	if(fir_time)
// 	{
// 		fir_time-=1;
// 		if(fir_time==0)
// 		{ 	hero.protection [PROT_FIRE]-=fir_bonus;	
// 			fir_bonus=0;			
// 		};
// 	};	
// 	if(mag_time)
// 	{
// 		mag_time-=1;
// 		if(mag_time==0)
// 		{ 	hero.protection [PROT_MAGIC]-=mag_bonus;	
// 			mag_bonus=0;			
// 		};
// 	};			
// };
func void B_SetTimedATT_Add(var c_npc slf,var int time,var int hp, var int hp_max, var int str, var int i)
{
		if(i==10)
		{
			TimedBoostNPC10[npc_bonus_time]=time;	
			TimedBoostNPC10[npc_bonus_hp]=hp;	
			TimedBoostNPC10[npc_bonus_hpmax]=hp_max;	
			TimedBoostNPC10[npc_bonus_str]=str;			
		}
		else if(i==9)
		{
			TimedBoostNPC9[npc_bonus_time]=time;	  
			TimedBoostNPC9[npc_bonus_hp]=hp;	      
			TimedBoostNPC9[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC9[npc_bonus_str]=str;		   	
		}
		else if(i==8)
		{
			TimedBoostNPC8[npc_bonus_time]=time;	  
			TimedBoostNPC8[npc_bonus_hp]=hp;	      
			TimedBoostNPC8[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC8[npc_bonus_str]=str;		   	
		}	
		else if(i==7)
		{
			TimedBoostNPC7[npc_bonus_time]=time;	  
			TimedBoostNPC7[npc_bonus_hp]=hp;	      
			TimedBoostNPC7[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC7[npc_bonus_str]=str;		   	
		}	
		else if(i==6)
		{
			TimedBoostNPC6[npc_bonus_time]=time;	  
			TimedBoostNPC6[npc_bonus_hp]=hp;	      
			TimedBoostNPC6[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC6[npc_bonus_str]=str;		   	
		}	
		else if(i==5)
		{
			TimedBoostNPC5[npc_bonus_time]=time;	  
			TimedBoostNPC5[npc_bonus_hp]=hp;	      
			TimedBoostNPC5[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC5[npc_bonus_str]=str;		   	
		}	
		else if(i==4)
		{
			TimedBoostNPC4[npc_bonus_time]=time;	  
			TimedBoostNPC4[npc_bonus_hp]=hp;	      
			TimedBoostNPC4[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC4[npc_bonus_str]=str;		   	
		}	
		else if(i==3)
		{
			TimedBoostNPC3[npc_bonus_time]=time;	  
			TimedBoostNPC3[npc_bonus_hp]=hp;	      
			TimedBoostNPC3[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC3[npc_bonus_str]=str;		   	
		}	
		else if(i==2)
		{
			TimedBoostNPC2[npc_bonus_time]=time;	  
			TimedBoostNPC2[npc_bonus_hp]=hp;	      
			TimedBoostNPC2[npc_bonus_hpmax]=hp_max;
			TimedBoostNPC2[npc_bonus_str]=str;		   	
		}			
		else//i==1
		{
			TimedBoostNPC1[npc_bonus_time]=time;	  		
			TimedBoostNPC1[npc_bonus_hp]=hp;	       		
			TimedBoostNPC1[npc_bonus_hpmax]=hp_max;		
			TimedBoostNPC1[npc_bonus_str]=str;		   				
		};	
		if(slf.attribute[ATR_HITPOINTS]+hp > 1)
		{
			slf.attribute[ATR_HITPOINTS]+=hp;
		}
		else
		{
			slf.attribute[ATR_HITPOINTS]=2;
		};			
		slf.attribute[ATR_HITPOINTS_MAX]+=hp_max;
		slf.attribute[ATR_STRENGTH]+=str;
};
func void B_SetTimedATT_Remove(var c_npc slf, var int i)
{
		if(i==10)
		{
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC10[npc_bonus_hp] > 1)
			{
    		slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC10[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC10[npc_bonus_hpmax];	
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC10[npc_bonus_str];			
		}
		else if(i==9)
		{

			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC9[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC9[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC9[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC9[npc_bonus_str];		   	
		}
		else if(i==8)
		{
  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC8[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC8[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC8[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC8[npc_bonus_str];		   	
		}	
		else if(i==7)
		{
  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC7[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC7[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC7[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC7[npc_bonus_str];		   	
		}	
		else if(i==6)
		{
  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC6[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC6[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC6[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC6[npc_bonus_str];		   	
		}	
		else if(i==5)
		{
  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC5[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC5[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC5[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC5[npc_bonus_str];		   	
		}	
		else if(i==4)
		{
	  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC4[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC4[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC4[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC4[npc_bonus_str];		   	
		}	
		else if(i==3)
		{
  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC3[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC3[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC3[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC3[npc_bonus_str];		   	
		}	
		else if(i==2)
		{
	  
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC2[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC2[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	      
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC2[npc_bonus_hpmax];
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC2[npc_bonus_str];		   	
		}			
		else//i==1
		{
  		
			if(slf.attribute[ATR_HITPOINTS]-TimedBoostNPC1[npc_bonus_hp] > 1)
			{
			slf.attribute[ATR_HITPOINTS]	-=   TimedBoostNPC1[npc_bonus_hp];
			}
			else
			{
			slf.attribute[ATR_HITPOINTS]	= 2;	
			};	       		
			slf.attribute[ATR_HITPOINTS_MAX]-=TimedBoostNPC1[npc_bonus_hpmax];		
			slf.attribute[ATR_STRENGTH]		-=   TimedBoostNPC1[npc_bonus_str];		   				
		};	



};


func void B_SetTimedATT_rec(var c_npc slf,var int time,var int hp, var int hp_max, var int str, var int i)
{
	var c_npc v;
	v=Npc_GetNewsVictim(timedatt_memory,Npc_HasNews(timedatt_memory,i,NULL,NULL));
	if(!Hlp_IsValidNpc(v)||!Npc_GetAivar(v,AIV_TIMEDATTBOOST))
	{
		Npc_SetAivar(slf,AIV_TIMEDATTBOOST,time);
       	B_SetTimedATT_Add(slf,time,hp,hp_max,str,i);
		Npc_MemoryEntry(timedatt_memory,1,hero,i,slf);
		
	}
	else if(i>1)
	{
		B_SetTimedATT_rec(slf,time,hp,hp_max,str,i-1);
	};
};	
func void B_SetTimedATT(var c_npc slf,var int time,var int hp, var int hp_max, var int str)//Dex & MP not needed
{
B_SetTimedATT_rec(slf,time,hp,hp_max,str,max_bonuses);
};

func void B_SetTimedATT_minus_rec(var int i)
{
	var c_npc v;
	var c_npc o;
	v=Npc_GetNewsVictim(timedatt_memory,Npc_HasNews(timedatt_memory,i,NULL,NULL));
    if(Hlp_IsValidNpc(v))
    {
		if(Npc_GetAivar(v,AIV_TIMEDATTBOOST))
		{
				B_PrintDebug("ti");		
			Npc_SetAivar(v,AIV_TIMEDATTBOOST,-1);
			if(Npc_GetAivar(v,AIV_TIMEDATTBOOST)==0)
			{
				B_PrintDebug("remove");
				B_SetTimedATT_Remove(v,i);	
			};		
		};
	};
	if(i>1)
	{
		B_SetTimedATT_minus_rec(i-1);
	};
};
// func void B_SetTimedATT_minus()
// {
// 	
// };
// 	if(item.weight==TP_TYPE_ATR)
// 	{
// 		if(item.count[0])//STR
// 		{
// 			B_ChangeAttribute(hero,ATR_STRENGTH,-str_tp_bonus);
// 			str_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			str_tp_bonus=item.count[0];
// 			B_ChangeAttribute(hero,ATR_STRENGTH,str_tp_bonus);

// 		};
// 		if(item.count[1])//DEX
// 		{
// 			B_ChangeAttribute(hero,ATR_DEXTERITY,-dex_tp_bonus);
// 			dex_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			dex_tp_bonus=item.count[1];
// 			B_ChangeAttribute(hero,ATR_DEXTERITY,dex_tp_bonus);


// 		};	
// 		if(item.count[2])//HP
// 		{
// 			hero.attribute[ATR_HITPOINTS_MAX]-=hp_tp_bonus;
// 			if(hero.attribute[ATR_HITPOINTS]-hp_tp_bonus>1)
// 			{
// 				hero.attribute[ATR_HITPOINTS]-=hp_tp_bonus;
// 			}
// 			else
// 			{
// 				hero.attribute[ATR_HITPOINTS]=2;
// 			};	
// 			hp_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			hp_tp_bonus=item.count[2];
// 			hero.attribute[ATR_HITPOINTS_MAX]+=hp_tp_bonus;
// 			hero.attribute[ATR_HITPOINTS]+=hp_tp_bonus;

// 		};	
// 		if(item.count[3])//MP
// 		{
// 			hero.attribute[ATR_MANA]-=mp_tp_bonus;
// 			hero.attribute[ATR_MANA_MAX]-=mp_tp_bonus;			
// 			mp_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			mp_tp_bonus=item.count[3];
// 			hero.attribute[ATR_MANA]+=mp_tp_bonus;
// 			hero.attribute[ATR_MANA_MAX]+=mp_tp_bonus;	
// 		};					
// 	};	
// 		if(item.weight==TP_TYPE_PROT)
// 	{
// 		if(item.count[0])//EDGE+BLUNT
// 		{
// 			hero.protection [PROT_EDGE]-=edg_bonus;
// 			hero.protection [PROT_BLUNT]-=edg_bonus;
// 			edg_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			edg_bonus=item.count[0];
// 			hero.protection [PROT_EDGE]+=edg_bonus;
// 			hero.protection [PROT_BLUNT]+=edg_bonus;

// 		};	
// 		if(item.count[1])//POINT
// 		{
// 			hero.protection [PROT_POINT]-=pnt_bonus;
// 			pnt_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			pnt_bonus=item.count[1];
// 			hero.protection [PROT_POINT]+=pnt_bonus;
// 		};	
// 		if(item.count[2])//FIRE
// 		{
// 			hero.protection [PROT_FIRE]-=fir_bonus;
// 			fir_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			fir_bonus=item.count[2];
// 			hero.protection [PROT_FIRE]+=fir_bonus;

// 		};	
// 		if(item.count[3])//MAGIC
// 		{
// 			hero.protection [PROT_MAGIC]-=mag_bonus;
// 			mag_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
// 			mag_bonus=item.count[3];
// 			hero.protection [PROT_MAGIC]+=mag_bonus;
// 		};			
// 	};

