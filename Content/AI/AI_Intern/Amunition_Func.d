

func void A_ResetMunition(var C_ITEM weapon)
{
	var int id; var int hlp; id = Hlp_GetinstanceID(weapon);

	item.TEXT[4]				= "";	
	CreateInvItem(poison_memory,id);
	Npc_GetInvItem(poison_memory,id);
	hlp = item.munition;
	weapon.munition = hlp;
	hlp = item.damageTotal;
	weapon.damageTotal = hlp;
	hlp = item.damageType;
	weapon.damageType = hlp;
	weapon.TEXT[4]				= "";	
	Npc_RemoveInvItem(poison_memory,id);
 	Npc_GetInvItem(self,id);
};

func void A_SetMunition(var C_ITEM weapon,var int munition,var int IsBow)
{
	var int weaponid;
	var string munitionname;
	A_ResetMunition(weapon);
	if(IsBow)
	{
		if(munition==0)
		{
			weapon.munition=ItAmArrow;	
			weapon.damagetype=DAM_POINT;				
		}
		else if(munition==1)
		{
			weapon.munition=ItAmArrow_15;	
			weapon.damagetype=DAM_POINT;			
		}
		else if(munition==2)
		{
			weapon.damageTotal=(weapon.damageTotal*100)/115;			
			weapon.munition=ItAmArrow_25;	
			weapon.damagetype=DAM_POINT;				
		}
		else if(munition==3)
		{
			weapon.damageTotal=(weapon.damageTotal*100)/125;							
			weapon.munition=ItAmFireArrow;	
			weapon.damagetype=DAM_FIRE;				
		}	
		else if(munition==4)
		{
			weapon.munition=ItAmIceArrow;	
			weapon.damagetype=DAM_MAGIC;				
		}	
		else if(munition==5)
		{
			weapon.munition=ItAmPoisonArrow;	
			weapon.damagetype=DAM_POINT;				
		}	
		else if(munition==6)
		{
			weapon.munition=ItAmBluntArrow;	
			weapon.damagetype=DAM_BLUNT;				
		};		
								
	}
	else
	{
		if(munition==0)
		{
			weapon.munition=ItAmBolt;	
			weapon.damagetype=DAM_POINT;				
		}
		else if(munition==1)
		{
			weapon.munition=ItAmBolt_10;	
			weapon.damagetype=DAM_POINT;			
		}
		else if(munition==2)
		{
			weapon.damageTotal=(weapon.damageTotal*100)/110;
			weapon.munition=ItAmBolt_25;	
			weapon.damagetype=DAM_POINT;				
		}
		else if(munition==3)
		{
			weapon.damageTotal=(weapon.damageTotal*100)/125;							
			weapon.munition=ItAmFireBolt;	
			weapon.damagetype=DAM_FIRE;				
		}	
		else if(munition==4)
		{
			weapon.munition=ItAmIceBolt;	
			weapon.damagetype=DAM_MAGIC;				
		}	
		else if(munition==5)
		{
			weapon.munition=ItAmPoisonBolt;	
			weapon.damagetype=DAM_POINT;				
		}	
		else if(munition==6)
		{
			weapon.munition=ItAmBluntBolt;	
			weapon.damagetype=DAM_BLUNT;				
		};									
	};	
	
	Npc_GetInvItem(hero,weapon.munition);	
	munitionname=item.description;	
	weapon.TEXT[4]				= ConcatStrings(ConcatStrings("U¿ywana amunicja: ",munitionname),".");		


	
};



func void A_CheckMunition(var C_ITEM weapon,var int IsBow)
{
	var int mun_id;
	var string munitionname;	

		Npc_GetInvItem(hero,weapon.munition);	
		munitionname=item.description;
		mun_id	=	Hlp_GetInstanceID(item);

	if(IsBow)
	{		
		if(Npc_HasItems(hero,mun_id)==0)&&(!Npc_HasReadiedRangedWeapon(hero))//0 amunition and hero haven't readied weapon (so NO ammo in hand)
		{
			if(Npc_HasItems(hero,ItAmArrow)>0)	
			{
				A_munition=A_POINT;
			}
			else if(Npc_HasItems(hero,ItAmArrow_15)>0)	
			{
				A_munition=A_POINT_15;
			}
			else if(Npc_HasItems(hero,ItAmArrow_25)>0)	
			{
				A_munition=A_POINT_25;
			}			
			else if(Npc_HasItems(hero,ItAmBluntArrow)>0)	
			{
				A_munition=A_BLUNT;
			}					
			else if(Npc_HasItems(hero,ItAmFireArrow)>0)	
			{
				A_munition=A_FIRE;
			}
			else if(Npc_HasItems(hero,ItAmPoisonArrow)>0)	
			{
				A_munition=A_POISON;
			}	
			else if(Npc_HasItems(hero,ItAmIceArrow)>0)	
			{
				A_munition=A_ICE;
			}	
			else
			{
				return;
			};	
			
			AI_RemoveWeapon(hero);	
			A_SetMunition(weapon,A_munition,TRUE);	
			AI_ReadyRangedWeapon(hero);										
			
		};
	}
	else
	{		
		if(Npc_HasItems(hero,mun_id)==0)&&(!Npc_HasReadiedRangedWeapon(hero))
		{
			if(Npc_HasItems(hero,ItAmBolt)>0)	
			{
				B_munition=B_POINT;
			}
			else if(Npc_HasItems(hero,ItAmBolt_10)>0)	
			{
				B_munition=B_POINT_10;
			}
			else if(Npc_HasItems(hero,ItAmBolt_25)>0)	
			{
				B_munition=B_POINT_25;
			}			
			else if(Npc_HasItems(hero,ItAmBluntBolt)>0)	
			{
				B_munition=B_BLUNT;
			}				
			else if(Npc_HasItems(hero,ItAmFireBolt)>0)	
			{
				B_munition=B_FIRE;
			}
			else if(Npc_HasItems(hero,ItAmPoisonBolt)>0)	
			{
				B_munition=B_POISON;
			}	
			else if(Npc_HasItems(hero,ItAmIceBolt)>0)	
			{
				B_munition=B_ICE;
			}
			else
			{
				return;
			};			
			AI_RemoveWeapon(hero);				
			A_SetMunition(weapon,B_munition,FALSE);		
			AI_ReadyRangedWeapon(hero);						
		};
	};	
	weapon.TEXT[4]				= ConcatStrings(ConcatStrings("U¿ywana amunicja: ",munitionname),".");				
};

//*******************************************************
// Am_Unequip
//--------------
// type = Arrow(0) or Bolt(1)
//*******************************************************
Func void Am_Unequip(var int type)
{
var int a;
	if(type==0)
	{
		Npc_GetInvItem(hero,ItAmArrow);
		item.flags=AM_UNEQ_FLAGS;
		
		Npc_GetInvItem(hero,ItAmArrow_15);
		item.flags=AM_UNEQ_FLAGS;

		
		Npc_GetInvItem(hero,ItAmArrow_25);
		item.flags=AM_UNEQ_FLAGS;

			
		Npc_GetInvItem(hero,ItAmFireArrow);
		item.flags=AM_UNEQ_FLAGS;

					
		Npc_GetInvItem(hero,ItAmIceArrow);
		item.flags=AM_UNEQ_FLAGS;

					
		Npc_GetInvItem(hero,ItAmPoisonArrow);
		item.flags=AM_UNEQ_FLAGS;

					
		Npc_GetInvItem(hero,ItAmBluntArrow);
		item.flags=AM_UNEQ_FLAGS;
	
	}
	else
	{
		Npc_GetInvItem(hero,ItAmBolt);
		item.flags=AM_UNEQ_FLAGS;
		
		Npc_GetInvItem(hero,ItAmBolt_10);
		item.flags=AM_UNEQ_FLAGS;
		
		Npc_GetInvItem(hero,ItAmBolt_25);
		item.flags=AM_UNEQ_FLAGS;
			
		Npc_GetInvItem(hero,ItAmFireBolt);
		item.flags=AM_UNEQ_FLAGS;
					
		Npc_GetInvItem(hero,ItAmIceBolt);
		item.flags=AM_UNEQ_FLAGS;
					
		Npc_GetInvItem(hero,ItAmPoisonBolt);
		item.flags=AM_UNEQ_FLAGS;
					
		Npc_GetInvItem(hero,ItAmBluntBolt);
		item.flags=AM_UNEQ_FLAGS;		
	};
	
};


func int I_GetA_Munition(var int previous,var int now,var int i)//i=iterations anti-loop
{
	i+=1;
	if(i>7)//antiloop
	{ return 0;};
	if(previous)
	{	
	now -= 1;
	}
	else
	{
	now +=1;
	};
	if(now<0)//blunt
	{ 
		now = 6; 
		if(Npc_HasItems(hero,ItAmBluntArrow))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}
	else if(now==0)//arrow
	{ 
		if(Npc_HasItems(hero,ItAmArrow))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}
	else if(now==1)//+15
	{ 
		if(Npc_HasItems(hero,ItAmArrow_15))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}	
	else if(now==2)//+25
	{ 
		if(Npc_HasItems(hero,ItAmArrow_25))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}	
	else if(now==3)//FIRE
	{ 
		if(Npc_HasItems(hero,ItAmFireArrow))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}	
	else if(now==4)//ICE
	{ 
		if(Npc_HasItems(hero,ItAmIceArrow))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	}	
	else if(now==5)//POISON
	{ 
		if(Npc_HasItems(hero,ItAmPoisonArrow))
		{
			return now;	
		}
		else
		{
			return I_GetA_Munition(previous,now,i);
		};
	};			
};
func int I_GetB_Munition(var int previous,var int now,var int i)//i=iterations anti-loop
{
	i+=1;
	if(i>7)//antiloop
	{ return 0;};
	if(previous)
	{	
	now -= 1;
	}
	else
	{
	now +=1;
	};
	if(now<0)//blunt
	{ 
		now = 6; 
		if(Npc_HasItems(hero,ItAmBluntBolt))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}
	else if(now==0)//Bolt
	{ 
		if(Npc_HasItems(hero,ItAmBolt))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}
	else if(now==1)//+10
	{ 
		if(Npc_HasItems(hero,ItAmBolt_10))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}	
	else if(now==2)//+25
	{ 
		if(Npc_HasItems(hero,ItAmBolt_25))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}	
	else if(now==3)//FIRE
	{ 
		if(Npc_HasItems(hero,ItAmFireBolt))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}	
	else if(now==4)//ICE
	{ 
		if(Npc_HasItems(hero,ItAmIceBolt))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	}	
	else if(now==5)//POISON
	{ 
		if(Npc_HasItems(hero,ItAmPoisonBolt))
		{
			return now;	
		}
		else
		{
			return I_GetB_Munition(previous,now,i);
		};
	};			
};