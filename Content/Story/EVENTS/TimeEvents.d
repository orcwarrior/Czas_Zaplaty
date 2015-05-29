/////////////////////
var C_Item readyweap;
var C_Item equipweap;
/////////////////////
var int TRIG_LOOPS;
/////////////////////
var int DualWasEquiped;
var int DualWasReadied; 

//var int teleport_to_temple;

func void Am_EquipAnyAmunition(var int type)
{
	//p/rint("Am_EquipAnyAmunition");
	if(type==0)
	{
		if(Npc_HasItems(hero,ItAmArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmArrow);
			A_munition=A_POINT;
		}
		else if(Npc_HasItems(hero,ItAmArrow_15)>0)
		{
			Npc_GetInvItem(hero,ItAmArrow_15);
			A_munition=A_POINT_15;
		}
		else if(Npc_HasItems(hero,ItAmArrow_25)>0)   
		{
			Npc_GetInvItem(hero,ItAmArrow_25);
			A_munition=A_POINT_25;
		}         
		else if(Npc_HasItems(hero,ItAmBluntArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmBluntArrow);
			A_munition=A_BLUNT;
		}               
		else if(Npc_HasItems(hero,ItAmFireArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmFireArrow);
			A_munition=A_FIRE;
		}
		else if(Npc_HasItems(hero,ItAmPoisonArrow)>0)   
		{
			Npc_GetInvItem(hero,ItAmPoisonArrow);
			A_munition=A_POISON;
		}   
		else if(Npc_HasItems(hero,ItAmIceArrow)>0)
		{
			Npc_GetInvItem(hero,ItAmIceArrow);
			A_munition=A_ICE;
		};      
	}
	else
	{
		if(Npc_HasItems(hero,ItAmBolt)>0)
		{
			Npc_GetInvItem(hero,ItAmBolt);
			B_munition=B_POINT;
		}
		else if(Npc_HasItems(hero,ItAmBolt_10)>0)   
		{
			Npc_GetInvItem(hero,ItAmBolt_10);
			B_munition=B_POINT_10;
		}
		else if(Npc_HasItems(hero,ItAmBolt_25)>0)      
		{
			Npc_GetInvItem(hero,ItAmBolt_25);
			B_munition=B_POINT_25;
		}         
		else if(Npc_HasItems(hero,ItAmBluntBolt)>0)   
		{
			Npc_GetInvItem(hero,ItAmBluntBolt);
			B_munition=B_BLUNT;
		}               
		else if(Npc_HasItems(hero,ItAmFireBolt)>0)   
		{
			Npc_GetInvItem(hero,ItAmFireBolt);
			B_munition=B_FIRE;
		}
		else if(Npc_HasItems(hero,ItAmPoisonBolt)>0)      
		{
			Npc_GetInvItem(hero,ItAmPoisonBolt);
			B_munition=B_POISON;
		}   
		else if(Npc_HasItems(hero,ItAmIceBolt)>0)
		{
			Npc_GetInvItem(hero,ItAmIceBolt);
			B_munition=B_ICE;
		};
	};

	item.flags=item.flags | 1 << 30;
};

func int Check_Amunition(var int item_instance)
{
	if(Npc_HasItems(hero, item_instance))
	{
		Npc_GetInvItem(hero, item_instance);
		
		if (!C_ItmHasFlag(item,ITEM_EQUIPED))
		{
			item.flags=item.flags | 1 << 30;
			
			return 1;
		};
	};

	return 0;
};

Func void Am_CheckequipedAmmunition(var int type)
{
	var int a; var int amunition_inhand; var c_item readyweap; var int itm_id;
	//BUGFIX
	//       P/rint(concatstrings("A_Munition == ",inttostring(A_Munition)));
	//       P/rint(concatstrings("item.Munition == ",inttostring(readyweap.munition)));
	//Item munition changes in second cycle, A_Munition in first
	//Seting of item.munition/damage etc by direct call from amunition use
	if(Npc_HasReadiedRangedWeapon(hero))
	{
		readyweap = Npc_GetReadiedWeapon(hero);
		
		if(readyweap.makingmob==type+1)
		{
			if(B_HasReadiedRangedWeaponWithAmmo(hero))
			//maybe problem is item.munition differ from A_Munition etc.
			{
				amunition_inhand = TRUE;
			};  
		};
	};

	if(type==0)
	{
		if (A_munition==A_POINT)
		{
			a = Check_Amunition(ItAmArrow);
		}
		else if (A_munition==A_POINT_15)
		{
			a = Check_Amunition(ItAmArrow_15);
		}
		else if (A_munition==A_POINT_25)
		{
			a = Check_Amunition(ItAmArrow_25);
		} 
		else if (A_munition==A_BLUNT)
		{
			a = Check_Amunition(ItAmBluntArrow);
		}  
		else if (A_munition==A_FIRE)
		{
			a = Check_Amunition(ItAmFireArrow);
		} 
		else if (A_munition==A_POISON)
		{
			a = Check_Amunition(ItAmPoisonArrow);
		} 
		else if (A_munition==A_ICE)
		{
			a = Check_Amunition(ItAmIceArrow);
		};                                                                                                                     
	}
	else
	{
		if (B_munition==B_POINT)
		{
			a = Check_Amunition(ItAmBolt);
		}
		else if (B_munition==B_POINT_10)
		{
			a = Check_Amunition(ItAmBolt_10);
		}
		else if (B_munition==B_POINT_25)
		{
			a = Check_Amunition(ItAmBolt_25);
		} 
		else if (B_munition==B_BLUNT)
		{
			a = Check_Amunition(ItAmBluntBolt);
		}  
		else if (B_munition==B_FIRE)
		{
			a = Check_Amunition(ItAmFireBolt);
		} 
		else if (B_munition==B_POISON)
		{
			a = Check_Amunition(ItAmPoisonBolt);
		} 
		else if (B_munition==A_ICE)
		{
			a = Check_Amunition(ItAmIceBolt);
		};
	};
};

func void Am_EventCheck()
{   
	//AMUNITION TRIGGER
	var C_ITEM EqRanWeap;
	var C_ITEM ReadyRanWeap;
	//AMU CHANGED BY KEY stop handling amunition till it be changed
	if(KeyAmunitionChange)
	{
		return;
	};

	Am_CheckequipedAmmunition(0);
	Am_CheckequipedAmmunition(1);

	if(Npc_HasEquippedRangedWeapon(hero))
	{   
		EqRanWeap = Npc_GetEquippedRangedWeapon(hero);
		A_CheckMunition(EqRanWeap,EqRanWeap.makingmob%2);
	};

	if(Npc_HasReadiedRangedWeapon(hero))
	{
		ReadyRanWeap = Npc_GetReadiedWeapon(hero);
		A_CheckMunition(ReadyRanWeap,EqRanWeap.makingmob%2);
	};

	//       else if(Last_A_munition==A_munition)//No amunition
	//       {   
	//          //      p/rint("no-amunition");
	//          if(Npc_HasReadiedRangedWeapon(hero))
	//          {
	//          };
	//       };

	//       if(Last_B_munition==B_munition)
	//       {
	//       };   
	Last_A_munition=A_munition;
	Last_B_munition=B_munition;   
};

func void Dual_BugFix()
{
	if((RSWD_ID!=0)&&(LSWD_ID!=0))&&(Npc_HasReadiedMeleeWeapon(hero))
	{
		DualBugfix=TRUE;
	};
	//---------------------
	// SWIM/DIVE BUGFIX
	//---------------------
	//   p/rint(IntToString(Npc_GetBodyState(hero)));
	if((Npc_GetBodyState(hero)==5)||(Npc_GetBodyState(hero)==6)||(Npc_GetBodyState(hero)==7))&&(DualWasEquiped)&&(DualWasReadied)&&(!Npc_HasReadiedMeleeWeapon(hero))
	{
		B_PrintDebug("FIX");
		AI_PlayAni(hero, "S_DUALBUGFIX_SWIM");
	};

	DualWasEquiped = DualEquiped; DualWasReadied = Npc_HasReadiedMeleeWeapon(hero);
	// P/RINT(ConcatStrings("LastEquipedWeaponIsDual=",IntToString(LastEquipedWeaponIsDual)));
};

func void ReceptReadBugfix()
{
	if(PRINTNEEDITEMS)
	{
		R_GetItem(recept_inuse);            
		EVT_RECIPEREAD();
	};
};

func void Tal_Regeneration()
{
	//mp
	if(hero.attribute[ATR_MANA]+Npc_GetTalentValue(hero,NPC_TALENT_REGEN_MP)>hero.attribute[ATR_MANA_MAX])
	{
		hero.attribute[ATR_MANA]=hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		hero.attribute[ATR_MANA]+=Npc_GetTalentValue(hero,NPC_TALENT_REGEN_MP);
	};   
	//hp
	if(hero.attribute[ATR_HITPOINTS]<2)||(!Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP))//dead or unconscious
	{ 
		return; 
	};

	if(hero.attribute[ATR_HITPOINTS]+Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP)>hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS]=hero.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		hero.attribute[ATR_HITPOINTS]+=Npc_GetTalentValue(hero,NPC_TALENT_REGEN_HP);
	};
};

func void B_CheckGuider()
{
	/*    if (!Npc_IsInState(guider,ZS_WoodWalking))
{
	if (Npc_GetAivar(hero,AIV_ASKINGABOUTHUNTING) == 3)
	{
		Npc_SetAivar(hero,AIV_ASKINGABOUTHUNTING,  0);
		Npc_SetAivar(hero,AIV_HUNTINGINPACK,  0);
	};
	Npc_SetAivar(guider,AIV_HUNTING,  0);
	Npc_SetAivar(hunter1,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter2,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter3,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter4,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter5,AIV_HUNTINGINPACK,  0);
	Npc_SetAivar(hunter6,AIV_HUNTINGINPACK,  0);
	GuiderIsVaild = FALSE;
	Npc_SetAivar(guider,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter1,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter2,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter3,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter4,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter5,AIV_PARTYMEMBER,  0);
	Npc_SetAivar(hunter6,AIV_PARTYMEMBER,  0);   
	PrintScreen           ("Guider nie poluje",76,65,"FONT_OLD_10_WHITE.TGA",1);
}
else
{
	Wld_SendTrigger ("EVT_TRIGGER2");
}; */
};
//////////////////////////////////////////////////////////////////////
FUNC VOID EVT_TIMEGRD_START ()
{
	B_TimeChallenge();//Challengefunc
};

FUNC VOID EVT_TRIGGER1 ()
{   
	B_StoryChangeDay();
};

// [TODO] O ile dobrze rozumiem to trigger od robienia itemków
// To wszystko dzia³a straszliwie chujsko-powolnie, coœ z tym zrobiæ,
// przyspieszyæ choæby samo czytanie recepty - ork.
FUNC VOID EVT_TRIGGER4 ()
{
	var int waittime;
	CONST INT LAB_USE_TIME = 25/2;
	if(CreationMethod == R_MOB_CAULDRON){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_BS){waittime=(R_CreateColdown*2)/7;}
	else if(CreationMethod == R_BS_ANVIL){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_BS_FIRE){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_HERB_PSI){waittime=R_CreateColdown*itemtocreate;}
	else if(CreationMethod == R_MOB_PAN){waittime=R_CreateColdown*itemtocreate;}   
	else if(CreationMethod == R_LAB_PSI){waittime=LAB_USE_TIME*itemtocreate;};         
	if(TRIG_FIRST_SEND){TRIG_LOOPS=1;TRIG_FIRST_SEND=FALSE;}
	else{TRIG_LOOPS=TRIG_LOOPS+1;};

	if(TRIG_LOOPS >= waittime)
	{
		Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
		R_GetItem(recept_inuse);R_CreateProduct(item);   
		if(CreationMethod == R_BS)
		{   
			if(R_ItemsProduced < itemtocreate)
			{
				R_VisualCreateItems();
			}
			else
			{
				MOBSIDIALOG = NONE;   
				Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
				Ai_StopProcessInfos (hero);   
			};         
		}
		else
		{
			//P/RINT("DD");
			AI_UseMob      (hero,   MOBNAME,   -1);         
			MOBSIDIALOG = NONE;   
			Npc_SetAivar(hero,AIV_INVINCIBLE,FALSE);
			Ai_StopProcessInfos (hero);   
		};   
	}
	else
	{
		Wld_SendTrigger("TIMETRIGGER4");
	};
};

FUNC VOID B_Trigger_CheckMissions()
{   
	TimeEventsWorldZen();
	TimeEventsMonasteryDungeon();
	TimeEventsOrcTempel();
	TimeEventsCave();
	TimeEventsFreemine();
	TimeEventsLabyrinth();
	TimeEventsOrcGraveyard();
	TimeEventsDream();
	TimeEventsNecroloc();
};

var int mob;
var int storeheropos_cycles;
var int hero_cache0_pos[3];
var int hero_cache1_pos[3];
var int hero_cache2_pos[3];
var int hero_cache3_pos[3];
var int pupil_last_pos[4]; //[3]-DISTTOHERO
var int PupilStucked;//incrementation evry time pupil doesn't make big steep to hero
//0-Nothing
//1,2,3-Coll Dynamic disabled

Func void TP_PupilOnHeroTrail()
{
	var oCNPC rbtr; var oCNPC hiro;
	hiro = hlp_Getnpc(pc_hero);
	rbtr = hlp_Getnpc(my_wolf);

	if   (3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache3_pos[0],hero_cache3_pos[2]) > 2000)
	&&(hero_cache3_pos[0]+hero_cache3_pos[1]+hero_cache3_pos[2]!=0)
	{//chache3 pos i okay!
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache3_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache3_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache3_pos[2];   
		//       PrintScreen (concatstrings("3.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
	}
	else if(3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache2_pos[0],hero_cache2_pos[2]) > 2000)
	&&(hero_cache2_pos[0]+hero_cache2_pos[1]+hero_cache2_pos[2]!=0)
	{//chache2 pos i okay!
		//       PrintScreen (concatstrings("2.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache2_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache2_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache2_pos[2];       
	}
	else if(3000 >  Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache1_pos[0],hero_cache1_pos[2]) > 2000)
	&&(hero_cache1_pos[0]+hero_cache1_pos[1]+hero_cache1_pos[2]!=0)
	{//chache1 pos i okay!
		//       PrintScreen (concatstrings("1.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache1_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache1_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache1_pos[2];       
	}
	else if(3000 > Hlp_GetDistBetweenTrafoPoints2D(hiro._zCVob_trafoObjToWorld[3],hiro._zCVob_trafoObjToWorld[11],hero_cache0_pos[0],hero_cache0_pos[2]) > 2000)
	&&(hero_cache0_pos[0]+hero_cache0_pos[1]+hero_cache0_pos[2]==0)
	{//chache0 pos i okay!
		//       PrintScreen (concatstrings("0.1: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache0_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache0_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache0_pos[2];       
	}
	else if(hero_cache0_pos[0]+hero_cache0_pos[1]+hero_cache0_pos[2]==0) 
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("0.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache0_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache0_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache0_pos[2];       
	}
	else if(hero_cache1_pos[0]+hero_cache1_pos[1]+hero_cache1_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("1.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache1_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache1_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache1_pos[2];       
	}
	else if(hero_cache2_pos[0]+hero_cache2_pos[1]+hero_cache2_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("2.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache2_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache2_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache2_pos[2];       
	}
	else if(hero_cache3_pos[0]+hero_cache3_pos[1]+hero_cache3_pos[2]!=0)
	{//none of them is ok, choose 3rd
		//       PrintScreen (concatstrings("3.2B: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 15, _STR_FONT_ONSCREEN,4);//slotow ponizej widzialnych normalnie         
		rbtr._zCVob_trafoObjToWorld[3]  = hero_cache3_pos[0];
		rbtr._zCVob_trafoObjToWorld[7]  = hero_cache3_pos[1];
		rbtr._zCVob_trafoObjToWorld[11] = hero_cache3_pos[2];       
	};

	//    PupilBugfix2=4;
	//    rbtr._zCVob_vob_bitfield[0] =  rbtr._zCVob_vob_bitfield[0] | zCVob_bitfield0_visualAlphaEnabled;
	//    rbtr._zCVob_visualAlpha = 0.1;  
};

func void PupilCheck()
{
	if(HeroHasPupil)
	{
		var oCNPC hiro; var oCNPC rbtr;
		var int possibility_multipiler;
		storeheropos_cycles+=1;
		hiro = hlp_Getnpc(pc_hero);
		rbtr = hlp_Getnpc(my_wolf);    
		
		if(PupilBugfix2>=1)&&(PupilBugfix2<=3)
		{
			PupilBugfix2=PupilBugfix2+1;
			if(PupilBugfix2==3)
			{   
				PupilBugfix2=0;
				rbtr._zCVob_vob_bitfield[0] =  rbtr._zCVob_vob_bitfield[0] | zCVob_bitfield0_collDetectionDynamic;
			};   
		};
		
		if(Npc_GetDistToPlayer(MyWolf) - pupil_last_pos[3] - 150 > 0)&&(Pupil_State==FOLLOW)&&(pupil_last_pos[3])
		{
			possibility_multipiler = Npc_GetDistToPlayer(MyWolf) - pupil_last_pos[3];
			possibility_multipiler = possibility_multipiler/150;
			possibility_multipiler = possibility_multipiler-(possibility_multipiler%1);
			PupilStucked=PupilStucked+1*possibility_multipiler;
		}
		else if(PupilStucked)
		{
			possibility_multipiler = pupil_last_pos[3] - Npc_GetDistToPlayer(MyWolf);
			possibility_multipiler = possibility_multipiler/100;
			possibility_multipiler = possibility_multipiler-(possibility_multipiler%1);      
			if(!possibility_multipiler){possibility_multipiler=1;};
			PupilStucked = PupilStucked-1*possibility_multipiler;
			if(pupilstucked<0){pupilstucked=0;};
		};
		//         p/rint(concatstrings("PupilBugfix2 [STATE]: ",inttostring(PupilBugfix2)));  
		//           PrintScreen (concatstrings("WOLF DIST: ",inttostring(Npc_GetDistToPlayer(MyWolf))),50, 25, _STR_FONT_ONSCREEN,2);//slotow ponizej widzialnych normalnie         
		
		if(Npc_GetDistToPlayer(MyWolf)<5001)&&(Pupil_State!=WAIT)&&(PupilBugfix2==0)
		{
			if(Pupil_State==FOLLOW)&&((Npc_GetDistToPlayer(MyWolf)>4000)//Fuck if wolf was stuck or not
			||((Npc_GetDistToPlayer(MyWolf)>3500)&&(PupilStucked>=5))//Getting Dangerous, better TP'em
			||((Npc_GetDistToPlayer(MyWolf)>3000)&&(PupilStucked>=10)))//If he stuck he gonna be TP'ed now or later
			{
				//              PrintScreen ("WOLF TELEPORTATION",-1, -1, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie         
				TP_PupilOnHeroTrail();
			};
			//             else if(Pupil_State==FOLLOW)&&((Npc_GetDistToPlayer(MyWolf)>2500)//if he haven't been still TP'ed maybe it helps...
			//             ||((Npc_GetDistToPlayer(MyWolf)>2000)&&(PupilStucked>=5))//Let try to move it
			//             ||((Npc_GetDistToPlayer(MyWolf)>1500)&&(PupilStucked>=10)))//Yea, he stuck'd
			//             {
			//               rbtr.vob_bitfield[0] =  rbtr.vob_bitfield[0] & ~zCVob_bitfield0_collDetectionDynamic;
			//               PrintScreen ("WOLF COLLDYN_DISABLE",65, 75, _STR_FONT_ONSCREEN,2);//slotow ponizej widzialnych normalnie         
			//              PupilStucked=1;
			//             }
		};
		
		pupil_last_pos[3] = Npc_GetDistToPlayer(MyWolf); 
		
		pupil_last_pos[0] = rbtr._zCVob_trafoObjToWorld[3];
		pupil_last_pos[1] = rbtr._zCVob_trafoObjToWorld[7];
		pupil_last_pos[2] = rbtr._zCVob_trafoObjToWorld[11];
		
		if(storeheropos_cycles==3)
		{
			//Time to store hero position vector
			storeheropos_cycles=0;
			//move values on next arrays
			hero_cache3_pos[0] = hero_cache2_pos[0];
			hero_cache3_pos[1] = hero_cache2_pos[1];
			hero_cache3_pos[2] = hero_cache2_pos[2];
			
			hero_cache2_pos[0] = hero_cache1_pos[0];
			hero_cache2_pos[1] = hero_cache1_pos[1];
			hero_cache2_pos[2] = hero_cache1_pos[2];
			
			hero_cache1_pos[0] = hero_cache0_pos[0];
			hero_cache1_pos[1] = hero_cache0_pos[1];
			hero_cache1_pos[2] = hero_cache0_pos[2];
			
			hero_cache0_pos[0] = hiro._zCVob_trafoObjToWorld[3];
			hero_cache0_pos[1] = hiro._zCVob_trafoObjToWorld[7];
			hero_cache0_pos[2] = hiro._zCVob_trafoObjToWorld[11];
			
			//       PrintScreen (concatstrings("X-",inttostring(hiro._zCVob_trafoObjToWorld[3])) ,15,15, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("Y-",inttostring(hiro._zCVob_trafoObjToWorld[7])) ,15,20, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("Z-",inttostring(hiro._zCVob_trafoObjToWorld[11])),15,25, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie

			//       PrintScreen (concatstrings("hero_cache1_posX-",inttostring(hero_cache1_pos[0])),65, 60, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache2_posX-",inttostring(hero_cache2_pos[0])),65, 65, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache3_posX-",inttostring(hero_cache3_pos[0])),65, 70, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       
			//       PrintScreen (concatstrings("hero_cache1_posZ-",inttostring(hero_cache1_pos[2])),65, 80, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache2_posZ-",inttostring(hero_cache2_pos[2])),65, 85, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//       PrintScreen (concatstrings("hero_cache3_posZ-",inttostring(hero_cache3_pos[2])),65, 90, _STR_FONT_ONSCREEN,6);//slotow ponizej widzialnych normalnie
			//          
			//Storepos   
		};
	};      
};

var int lastx;var int lasty;
var int Trigger7Phase;
var int rune_sword_phase;

// orc: Ok ten trigger jest wywo³ywany co sekunde
// bêdzie idealny dla sprawdzenia monologu stylisty i checkHello.
FUNC VOID EVT_TRIGGER7 ()
{ 
	//Appr_Wait4Monolouge
	if (Appr_Wait4Monolouge)
	{
		if(Npc_GetAivar(hero,AIV_INVINCIBLE)==FALSE)
		{
			Appr_StartMonologue();
			Appr_Wait4Monolouge = false;
		};
	};
	if (rune_sword_phase == 9)
	{
		EVT_RUNESWD_CHARGING();
		
		rune_sword_phase = 0;
	}
	else
	{
		rune_sword_phase+=1;
	};
	//TMP trigger off
	printdebug("TRIGGER7>>START");

	//   PrintScreen (concatstrings("Wld_GetPlayerPortalRoom=",Wld_GetPlayerPortalRoom()),1, 90, _STR_FONT_ONSCREEN,2);
	//       Npc_Getinvitem(hero,itmid);

	//Should be first for corrections   
	printdebug("TRIGGER7>>LoadGame_BugFixList");      
	LoadGame_BugFixList();      
	printdebug("TRIGGER7>>Show_BarTempPot");      
	Show_BarTempPot();
	//AI_SetNpcsToState         (hero,ZS_Stuned,500);
	if(Global_Cinematic_i>(-20))
	{
		printdebug("TRIGGER7>>CinematicEvent(IF PASSED)");      
		CinematicEvent();
	};

	printdebug("TRIGGER7>>ReceptReadBugfix");      
	ReceptReadBugfix();   

	printdebug("TRIGGER7>>temp_potion_trigger");      
	temp_potion_trigger();

	printdebug("TRIGGER7>>Am_EventCheck");      
	Am_EventCheck();
	
	printdebug("TRIGGER7>>PupilBugFix");      
	PupilBugFix();   
	
	printdebug("TRIGGER7>>turnOnRuneSwordEffects"); 
	turnOnRuneSwordEffects();

	Trigger7Phase = 1;//Rest part of this func will be done called by PerFrameTrigger

	//6 calls in this phase
};
// Ork: A wiec te fazy bêda siê wywo³ywaæ w kolejnych
// klatkach (Wywo³ane z perFrameTrigger) co ma wspomóc optymalizacje
FUNC VOID EVT_TRIGGER7_PHASE1 ()
{   
	Trigger7Phase+=1;

	printdebug("TRIGGER7>>GUI_RENDERICONS");      
	GUI_RENDERICONS();

	printdebug("TRIGGER7>>Dual_BugFix");      
	Dual_BugFix();
	printdebug("TRIGGER7>>Tal_Regeneration");      
	Tal_Regeneration();
	//Missions
	printdebug("TRIGGER7>>B_Trigger_CheckMissions");      
	B_Trigger_CheckMissions();

	//4 calls in this phase (but checkMissions is bigone
};   
FUNC VOID EVT_TRIGGER7_PHASE2 ()
{   
	Trigger7Phase+=1;

	printdebug("TRIGGER7>>WeatherForecast_TryApply");      
	WeatherForecast_TryApply();

	if(!GAME_STARTED)
	{
		printdebug("TRIGGER7>>Events_OnGameStart(IF PASSED)");      
		GAME_STARTED=TRUE;
		Events_OnGameStart();
	};
	//    

	printdebug("TRIGGER7>>PlayGhostsFx");      
	PlayGhostsFx();
	printdebug("TRIGGER7>>PupilCheck");      
	PupilCheck();

	printdebug("TRIGGER7>>FX_ScreenBlendTimer");      
	FX_ScreenBlendTimer();

	printdebug("TRIGGER7>>DayShift");   
	DayShift(Wld_GetDay());

	FX_Startup_Bugfix(); // Poprawka issue #40 (brak paskow kinowych) [+ inne]
	printdebug("TRIGGER7>>B_DailyHello_Update");   
	B_DailyHello_Update();
	//7 calls in this phase
};
FUNC VOID EVT_TRIGGER7_PHASE3 ()
{   
	Trigger7Phase=-1;//last phase   
	// OK, so after setting phase to -1 part of triggering trigger7 phases
	// in PerFrameCallback_Trigger.d (in _Intern) should be skipped and none phase will be fired
	// until TIMETRIGGER7 will be triggered again.

	//TODO: Put in some elegant func
	//TODO: Other inventory statement, this one don't even work
	var oCnpc hiro;
	hiro = Hlp_GetNpc(pc_hero);

	if((hiro.npc_bitfield[0] & oCNpc_bitfield0_openinventory) == oCNpc_bitfield0_openinventory)
	{
		printdebug("TRIGGER7>>SheatsPerc");   
		Npc_SendPassivePerc       (hero,PERC_NPCCOMMAND,hero,hero);
	};

	if(HeroDamage_TimeHeroAttackedNeutralFocus)
	{
		HeroDamage_TimeHeroAttackedNeutralFocus+=1;
		
		if(HeroDamage_TimeHeroAttackedNeutralFocus==6)
		{   //No other neutral npc was focused, reset counter and disable neutral attacking (if hostile not present)
			HeroDamage_TimeHeroAttackedNeutralFocus=0;
		};
	};

	printdebug("TRIGGER7<<END");
};

FUNC VOID EVT_CASTLE_TELEPORT ()
{
	if (CasTeleportActive == TRUE)
	{
		Day = Day-1;
		Wld_PlayEffect("spellFX_Teleport_RING",  self  , self   , 0, 0, 0, FALSE );
		Snd_Play ("MFX_TELEPORT_CAST");
		Npc_ClearAIQueue(self);
		var int teleportizer;

		if (teleportizer == 1)
		{
			Ai_Teleport(self,"HC_TOWER_OVER");
		}
		else if (teleportizer == 2)
		{
			Ai_Teleport(self,"OW_WARAN_G_SPAWN");
		}
		else if (teleportizer == 3)
		{
			Ai_Teleport(self,"OW_PATH_BANDITOS01");
		}
		else if (teleportizer == 4)
		{
			Ai_Teleport(self,"LOCATION_02_12");
		}
		else//5
		{
			Ai_Teleport(self,"HC_BRIDGE2_ON");
		};
	};

	//var int Rodney;
	//Rodney = Hlp_GetNPC(NON_2602_Rodney);
	//Ai_Teleport(Rodney,"CAS_TELEPORT_WP");
};

FUNC VOID EVT_CAS_TRAP ()
{
	if (Npc_GetDistToWP(hero,"CAS_TRAP_WP") < 300)
	{   
		B_KillNpc(PC_Hero);
	};
};

//func void EVT_TRIGGER2DELAY ()
//{//Hello Hero Say
//	PrintDebug         ("B_DelaySayTimer");

//};

func void CRYSTAL_ZONE_SCRIPT()
{
	var int a;
	a = hero.attribute[ATR_MANA_MAX]-(hero.attribute[ATR_MANA]*2);
	a = a/10;
	hero.attribute[ATR_MANA]+=a;
};