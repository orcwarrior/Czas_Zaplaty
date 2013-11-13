const int fight_potions_time = 45;


func int Get_IntFragment(var int l,var int from, var int to)
{   //(54321,4,2)=432
	l=(l%(Math_Power(10,to)));//(54321%10000)=4321
	l=l/Math_Power(10,from-1);//4321/10%1=432,1
	l=l-(l%1);//432,1-0,1=432
	return l;
};
func void temp_potion_unequip(var int att)
{
	var c_item rangedweap;
	var c_item meleeweap;
	if(att==ATR_STRENGTH)
	{

		
		if(Npc_HasReadiedMeleeWeapon(hero))
		{
		 	meleeweap = Npc_GetReadiedWeapon(hero);	
		}
		else
		{
			meleeweap = Npc_GetEquippedMeleeWeapon(hero);	
		};
		if(D_DualEnoughSTR()==0)
		{
			D_DisableDual();
		};
		if(meleeweap.cond_value[2]>hero.attribute[ATR_STRENGTH])
		{
			B_UnequipMeleeWeapon(hero);
		};
			
	}
	else if(att==ATR_DEXTERITY)
	{
		
		if(Npc_HasReadiedRangedWeapon(hero))
		{
		 	rangedweap = Npc_GetReadiedWeapon(hero);	
		}
		else
		{
			rangedweap = Npc_GetEquippedRangedWeapon(hero);	
		};
		if(rangedweap.cond_value[2]>hero.attribute[ATR_DEXTERITY])
		{		
		B_UnequipRangedWeapon(hero);
		};			
	}
	else if(att==ATR_MANA)
	{
		
	};
};
func void temp_potion_trigger()
{
		var c_npc slf;
	
	//Npc-non-hero

	//Find some free slot 4 npc:
	if(NPC_aiv_check0)
	{
		slf = Hlp_GetNpc(NPC_aiv_check0);
		//minus  aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check0=0;	
		};	
	} 	
	else if(NPC_aiv_check1)
	{
		slf = Hlp_GetNpc(NPC_aiv_check1);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check1=0;	
		};	
	}  	
	else if(NPC_aiv_check2)
	{
		slf = Hlp_GetNpc(NPC_aiv_check2);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check2=0;	
		};		
	}  	
	else if(NPC_aiv_check3)
	{
		slf = Hlp_GetNpc(NPC_aiv_check3);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check3=0;	
		};		
	}  	
	else if(NPC_aiv_check4)
	{
		slf = Hlp_GetNpc(NPC_aiv_check4);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check4=0;	
		};		
	}  	
	else if(NPC_aiv_check5)
	{
		slf = Hlp_GetNpc(NPC_aiv_check5);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check5=0;	
		};		
	}  	
	else if(NPC_aiv_check6)
	{
		slf = Hlp_GetNpc(NPC_aiv_check6);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check6=0;	
		};		
	}  	
	else if(NPC_aiv_check7)
	{
		slf = Hlp_GetNpc(NPC_aiv_check7);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check7=0;	
		};		
	}  	
	else if(NPC_aiv_check8)
	{
		slf = Hlp_GetNpc(NPC_aiv_check8);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check8=0;	
		};		
	}  	
	else if(NPC_aiv_check9)
	{
		slf = Hlp_GetNpc(NPC_aiv_check9);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check9=0;	
		};		
	}  	
	else if(NPC_aiv_check10)
	{
		slf = Hlp_GetNpc(NPC_aiv_check10);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check10=0;	
		};		
	}  	
	else if(NPC_aiv_check11) 
	{
		slf = Hlp_GetNpc(NPC_aiv_check11);
		//minus aiv'ars if they're present
		if(Npc_GetAivar(slf,AIV_TPBASH))
		{
			Npc_SetAivar(slf,AIV_TPBASH,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPMULT))
		{
			Npc_SetAivar(slf,AIV_TPMULT,-1);
		}
		else if(Npc_GetAivar(slf,AIV_TPIMMU))
		{
			Npc_SetAivar(slf,AIV_TPIMMU,-1);
		}	
		else if(Npc_GetAivar(slf,AIV_TPCRIT))
		{
			Npc_SetAivar(slf,AIV_TPCRIT,-1);
		};	
		if(Npc_GetAivar(slf,AIV_TPBASH)+Npc_GetAivar(slf,AIV_TPMULT)+Npc_GetAivar(slf,AIV_TPIMMU)+Npc_GetAivar(slf,AIV_TPCRIT))==0
		{	
		//If all values equal to zero
		//free this slot
		NPC_aiv_check11=0;	
		};	
		
	//return;//break or hero will get bonus too	
	}; 	
	//---END of non hero func----
	
	
	
	
	if(str_time)
	{
		str_time-=1;
		if(str_time==0)
		{	
			B_ChangeAttribute(hero,ATR_STRENGTH,-str_tp_bonus); 
			str_tp_bonus=0;	
			temp_potion_unequip(ATR_STRENGTH);
			B_SetSkillValuesBasedOnAttribute(hero,ATR_STRENGTH);	
			BTP_Activated=BTP_Activated-1;	
		};
	};
	if(dex_time)
	{
		dex_time-=1;
		if(dex_time==0)
		{	B_ChangeAttribute(hero,ATR_DEXTERITY,-dex_tp_bonus); 
			dex_tp_bonus=0;		
			temp_potion_unequip(ATR_DEXTERITY);			
			B_SetSkillValuesBasedOnAttribute(hero,ATR_DEXTERITY);		
			BTP_Activated=BTP_Activated-1;	

		};
	};
	if(hp_time)
	{
		hp_time-=1;
		if(hp_time==0)
		{	B_ChangeAttribute(hero,ATR_HITPOINTS_MAX,-hp_tp_bonus); if(hero.attribute[ATR_HITPOINTS]-hp_tp_bonus>1){B_ChangeAttribute(hero,ATR_HITPOINTS,-hp_tp_bonus);}else{B_ChangeAttribute(hero,ATR_HITPOINTS,2);}; 
			hp_tp_bonus=0;			
			BTP_Activated=BTP_Activated-1;	
	
		};
	};	
	if(mp_time)
	{
		mp_time-=1;
		if(mp_time==0)
		{	B_ChangeAttribute(hero,ATR_MANA_MAX,-mp_tp_bonus); B_ChangeAttribute(hero,ATR_MANA,-mp_tp_bonus); 
			mp_tp_bonus=0;			
			B_SetSkillValuesBasedOnAttribute(hero,ATR_MANA_MAX);		
			BTP_Activated=BTP_Activated-1;				
		};
	};	
	if(edg_time)
	{
		edg_time-=1;
		if(edg_time==0)
		{ hero.protection [PROT_EDGE]-=edg_bonus; hero.protection [PROT_BLUNT]-=edg_bonus;	
			edg_bonus=0;		
			BTP_Activated=BTP_Activated-1;						
		};
	};	
	if(pnt_time)
	{
		pnt_time-=1;
		if(pnt_time==0)
		{ 	hero.protection [PROT_POINT]-=pnt_bonus;	
			pnt_bonus=0;		
			BTP_Activated=BTP_Activated-1;						
		};
	};	
	if(fir_time)
	{
		fir_time-=1;
		if(fir_time==0)
		{ 	hero.protection [PROT_FIRE]-=fir_bonus;	
			fir_bonus=0;			
			BTP_Activated=BTP_Activated-1;					
		};
	};	
	if(mag_time)
	{
		mag_time-=1;
		if(mag_time==0)
		{ 	hero.protection [PROT_MAGIC]-=mag_bonus;	
			mag_bonus=0;		
			BTP_Activated=BTP_Activated-1;						
		};
	};	
	//SPECIAL
	if(imu_time)
	{
		imu_time-=1;
		if(imu_time==0)
		{
		BTP_Activated=BTP_Activated-1;		
		
		Mdl_RemoveOverlayMds(hero,"HUMANS_INVICIBLE.MDS");
		hero.flags = 0; 			
		};
						
	};		
	if(bsh_time)
	{
		bsh_time-=1;
		if(bsh_time==0)
		{
		BTP_Activated=BTP_Activated-1;	
		};	
	};		
	if(cri_time)
	{
		cri_time-=1;
		if(cri_time==0)
		{
		BTP_Activated=BTP_Activated-1;	
		};	
	};		
	if(mul_time)
	{
		mul_time-=1;
		if(mul_time==0)
		{
		BTP_Activated=BTP_Activated-1;	
		};	
	};		

			
};

func void UseTempPot()
{
	printdebug(concatstrings("Temp potion drinked by: ",self.name));
	
	if(!NPC_IsPlayer(self))
	{
	//So, drinker isn't a hero
	//Check if self is already in aiv check
	//Easy just add all TP aiv'ars values, if them equal 0 npc hasn't have aiv checked b4
	if(Npc_GetAivar(self,AIV_TPBASH)+Npc_GetAivar(self,AIV_TPMULT)+Npc_GetAivar(self,AIV_TPIMMU)+Npc_GetAivar(self,AIV_TPCRIT))==0
	{
	//Find some free slot 4 npc:
	if(!NPC_aiv_check0)
	{
		NPC_aiv_check0=HLp_GetInstanceID(self);	
	} 	
	else if(!NPC_aiv_check1)
	{
		NPC_aiv_check1=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check2)
	{
		NPC_aiv_check2=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check3)
	{
		NPC_aiv_check3=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check4)
	{
		NPC_aiv_check4=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check5)
	{
		NPC_aiv_check5=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check6)
	{
		NPC_aiv_check6=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check7)
	{
		NPC_aiv_check7=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check8)
	{
		NPC_aiv_check8=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check9)
	{
		NPC_aiv_check9=HLp_GetInstanceID(self);	
	}  	
	else if(!NPC_aiv_check10)
	{
		NPC_aiv_check10=HLp_GetInstanceID(self);	
	}  	
	else 
	{
		NPC_aiv_check11=HLp_GetInstanceID(self);	
	};                          
	//12 slots, it should be enough
	};
	//Ok so remembering of npc 4 checking his aiv'ars is done, now assing time left of TP to specify aiv'ars
	//First check what kind of potion npc drinked
	// Only special TP are geting any atention, cuz any other don't make show like them
	// plus we hame B_SetTimmedATT func that can replace other TP's
		if(item.weight==TP_TYPE_SPEC)
		{
		
			if(item.range==0)
			{
				if(Npc_GetAivar(self,AIV_TPIMMU)==0)			
				{
		    	
					self.protection [PROT_EDGE]+=1000;    		
					self.protection [PROT_BLUNT]+=1000;    		
					self.protection [PROT_POINT]+=1000;    		
					self.protection [PROT_FLY]+=1000;    		
					self.protection [PROT_FIRE]+=1000;    		
					self.protection [PROT_MAGIC]+=1000;    		    					
		    	};	
		
				Npc_SetAivar(self,AIV_TPIMMU,fight_potions_time);
				
			};		
			if(item.range==1)
			{
				Npc_SetAivar(self,AIV_TPBASH,fight_potions_time);
			};		
			if(item.range==2)
			{
				Npc_SetAivar(self,AIV_TPCRIT,fight_potions_time);
			};		
			if(item.range==3)
			{
				Npc_SetAivar(self,AIV_TPMULT,fight_potions_time);
			};	
		};
	return;//break or hero will get bonus too
	};	
	
	
	
	
	if(item.weight==TP_TYPE_ATR)
	{
		if(item.count[0])//STR
		{
			if(str_tp_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};
			B_ChangeAttribute(hero,ATR_STRENGTH,-str_tp_bonus);
			str_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			str_tp_bonus=item.count[0];
			B_ChangeAttribute(hero,ATR_STRENGTH,str_tp_bonus);

		};
		if(item.count[1])//DEX
		{
			if(dex_tp_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};			
			B_ChangeAttribute(hero,ATR_DEXTERITY,-dex_tp_bonus);
			dex_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			dex_tp_bonus=item.count[1];
			B_ChangeAttribute(hero,ATR_DEXTERITY,dex_tp_bonus);


		};	
		if(item.count[2])//HP
		{
			if(hp_tp_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.attribute[ATR_HITPOINTS_MAX]-=hp_tp_bonus;
			if(hero.attribute[ATR_HITPOINTS]-hp_tp_bonus>1)
			{
				hero.attribute[ATR_HITPOINTS]-=hp_tp_bonus;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS]=2;
			};	
			hp_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			hp_tp_bonus=item.count[2];
			hero.attribute[ATR_HITPOINTS_MAX]+=hp_tp_bonus;
			hero.attribute[ATR_HITPOINTS]+=hp_tp_bonus;

		};	
		if(item.count[3])//MP
		{
			if(mp_tp_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.attribute[ATR_MANA]-=mp_tp_bonus;
			hero.attribute[ATR_MANA_MAX]-=mp_tp_bonus;			
			mp_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			mp_tp_bonus=item.count[3];
			hero.attribute[ATR_MANA]+=mp_tp_bonus;
			hero.attribute[ATR_MANA_MAX]+=mp_tp_bonus;	
		};					
	};	
		if(item.weight==TP_TYPE_PROT)
	{
		if(item.count[0])//EDGE+BLUNT
		{
			if(edg_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.protection [PROT_EDGE]-=edg_bonus;
			hero.protection [PROT_BLUNT]-=edg_bonus;
			edg_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			edg_bonus=item.count[0];
			hero.protection [PROT_EDGE]+=edg_bonus;
			hero.protection [PROT_BLUNT]+=edg_bonus;

		};	
		if(item.count[1])//POINT
		{
			if(pnt_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.protection [PROT_POINT]-=pnt_bonus;
			pnt_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			pnt_bonus=item.count[1];
			hero.protection [PROT_POINT]+=pnt_bonus;
		};	
		if(item.count[2])//FIRE
		{
			if(fir_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.protection [PROT_FIRE]-=fir_bonus;
			fir_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			fir_bonus=item.count[2];
			hero.protection [PROT_FIRE]+=fir_bonus;

		};	
		if(item.count[3])//MAGIC
		{
			if(mag_bonus==0)//Wczesniej nie by這 zadnej mikstury wiec zwiekszenie il. uzywanych mikstur
			{	BTP_Activated=BTP_Activated+1;	};	
			hero.protection [PROT_MAGIC]-=mag_bonus;
			mag_time=item.COUNT[4]*POTION_TICKS_PER_MINUTE;
			mag_bonus=item.count[3];
			hero.protection [PROT_MAGIC]+=mag_bonus;
		};			
	};
		if(item.weight==TP_TYPE_SPEC)
	{
	
		if(item.range==0)
		{
    		if(imu_time==0)			
    		{
	    		BTP_Activated=BTP_Activated+1;
	    		
				Mdl_ApplyOverlayMds(hero,"HUMANS_INVICIBLE.MDS");
				hero.flags = NPC_FLAG_IMMORTAL; 		    					
	    	};	
	
			imu_time=fight_potions_time;
    		
		};		
		if(item.range==1)
		{
    		if(bsh_time==0)			{	BTP_Activated=BTP_Activated+1;	};	    	
			bsh_time=fight_potions_time;
		};		
		if(item.range==2)
		{
    		if(cri_time==0)			{	BTP_Activated=BTP_Activated+1;	};	    	
			cri_time=fight_potions_time;
		};		
		if(item.range==3)
		{
    		if(mul_time==0)			{	BTP_Activated=BTP_Activated+1;	};	  	
			mul_time=fight_potions_time;
		};	
	};
};

/*

ItFo_Potion_HP_1_temp
ItFo_Potion_HP_2_temp
ItFo_Potion_HP_3_temp
ItFo_Potion_MP_1_temp
ItFo_Potion_MP_2_temp
ItFo_Potion_MP_3_temp
ItFo_Potion_DEX_1_temp
ItFo_Potion_DEX_2_temp
ItFo_Potion_DEX_3_temp
ItFo_Potion_Str_1_temp
ItFo_Potion_Str_2_temp
ItFo_Potion_Str_3_temp
ItFo_Potion_Str_Dex_1_temp
ItFo_Potion_Str_Dex_2_temp
ItFo_Potion_HP_MP_1_temp
ItFo_Potion_HP_MP_2_temp
ItFo_Potion_Edg_1_temp
ItFo_Potion_Edg_3_temp
ItFo_Potion_pnt_1_temp
ItFo_Potion_pnt_3_temp
ItFo_Potion_fir_1_temp
ItFo_Potion_fir_3_temp
ItFo_Potion_mag_1_temp
ItFo_Potion_mag_3_temp
ItFo_Potion_Prot_Total_1_temp
ItFo_Potion_Prot_Total_2_temp

ItFo_Potion_Spec_Immunity
ItFo_Potion_Spec_Bash
ItFo_Potion_Spec_DoubleDamage
ItFo_Potion_Spec_MultiCast
*/