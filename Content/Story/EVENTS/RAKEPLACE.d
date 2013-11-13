//****************************
// 		RAKE PLACE 
//****************************
const int RAKE_MAX_DIST_TO_WP = 400;
var int rakeplace[999];//true=discovered

func int RAKE_GETLOC()
{
	if(Npc_GetDistToWP(hero,"RAKE_0") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored! 
      if(!Search_4_JackTreasure) 
      { 
         return 2;
      } 
      else if(rakeplace[0]==2)
      { 
         return 0; 
      } 
      else	
      { 
         rakeplace[0]=2; 
         return 1; 
      }; 
	}
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_1") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
      if(!Search_4_JackTreasure) 
      { 
         return 2;
      } 
      else if(rakeplace[1]==2)
      { 
         return 0; 
      } 
      else	
      { 
         rakeplace[1]=2; 
         return 1; 
      }; 
	}	
	else if(Npc_GetDistToWP(hero,"OW_PATH_MIS_PACHO_TREASURE") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
      if(!pacho_time_check)
      { 
         return 2;
      } 
      else if(rakeplace[2]==2)
      { 
         return 0;
      } 
      else	
      { 
         rakeplace[2]=2; 
         return 1; 
      }; 
	}	
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_3") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
	if(!Search_4_JackTreasure) { return 2;} else  if(rakeplace[3]==2){ return 0; } else	{ rakeplace[3]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_4") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
	if(!Search_4_JackTreasure) { return 2;} else if(rakeplace[4]==2){ return 0; } else	{ rakeplace[4]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_5") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
	if(!Search_4_JackTreasure) { return 2;} else if(rakeplace[5]==2){ return 0; } else	{ rakeplace[5]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_6") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
		if(rakeplace[6]==2){ return 0; } else	{ rakeplace[6]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_7") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
		if(rakeplace[7]==2){ return 0; } else	{ rakeplace[7]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_8") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
		if(rakeplace[8]==2){ return 0; } else	{ rakeplace[8]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_9") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
		if(rakeplace[9]==2){ return 0; } else	{ rakeplace[9]=2; return 1; }; 
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_10") < RAKE_MAX_DIST_TO_WP)
	{//This rakeplc is now explored!
		if(rakeplace[10]==2){ return 0; } else	{ rakeplace[10]=2; return 1; }; 
	}
   else if (Npc_GetDistToWP(hero,"LOCATION_15_IN_2") < RAKE_MAX_DIST_TO_WP)
   {
      if(rakeplace[11]==2)
      { 
         return 0; 
      } 
      else
      { 
         rakeplace[11]=2; 
         return 1; 
      }; 
   };
	return 0;
};
func int COND_RAKE()
{
	//pr/int("Npc_GetDistToWP(hero,FIX_RAKE_3)");
	//pr/int(inttostring(Npc_GetDistToWP(hero,"RAKE_3")));
	if(RAKE_GETLOC()==1)
	{
      Snd_Play		("FOUNDTREASURE");		
      Wld_SendTrigger("RAKESUCCESINSERTITEM");			
      return 1;			
	}
	else if(RAKE_GETLOC()==2)//Mission Treasure - cant be collected b4!
	{
      AI_PlayAni (hero,"T_DONTKNOW");
      return 0;			
	}
	else
	{
      AI_PlayAni (hero,"T_DONTKNOW");
      //pr/int("Ju¿ tu by³em!");			
      return 0;			
	};
};
func void EVT_RAKESUCCESINSERTITEM()
{
	if(Npc_GetDistToWP(hero,"RAKE_0") < RAKE_MAX_DIST_TO_WP)&&(Search_4_JackTreasure)
	{//Insert treasures at rakeplace 
		Wld_InsertItem(ItMi_SilverRing,"RAKE_0");
		Wld_InsertItem(Schutzring_Feuer1,"RAKE_0");	
		Wld_InsertItem(ItMi_NuggetSack_01,"RAKE_0");	
			
	}
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_1") < RAKE_MAX_DIST_TO_WP)&&(Search_4_JackTreasure)
	{//Insert treasures at rakeplace
		Wld_InsertItem(ItMi_NuggetSack_03,"RAKE_1");	
		Wld_InsertItem(innos_statue,"RAKE_1");	
	}	
	else if(Npc_GetDistToWP(hero,"OW_PATH_MIS_PACHO_TREASURE") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace
		Wld_InsertItem(chesttest,"RAKE_2");		
	}	
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_3") < RAKE_MAX_DIST_TO_WP)&&(Search_4_JackTreasure)
	{//Insert treasures at rakeplace
		Wld_InsertItem(ItMi_NuggetSack_01,"RAKE_3");	
		Wld_InsertItem(ItMi_GoldChest,"RAKE_3");		
	}			
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_4") < RAKE_MAX_DIST_TO_WP)&&(Search_4_JackTreasure)
	{//Insert treasures at rakeplace
		Wld_InsertItem(ItMi_NuggetSack_03,"RAKE_4");	
		Wld_InsertItem(ItMi_NuggetSack_03,"RAKE_4");	
		Wld_InsertItem(Schutzring_Geschosse1_Waffen1,"RAKE_4");		

	}			
	else if(Npc_GetDistToWP(hero,"FIX_RAKE_5") < RAKE_MAX_DIST_TO_WP)&&(Search_4_JackTreasure)
	{//Insert treasures at rakeplace
		Wld_InsertItem(ItMi_SilverNecklace,"RAKE_5");	
		Wld_InsertItem(ItMi_GoldRing,"RAKE_5");	
		Wld_InsertItem(Mis_Jack_BlackPearl,"RAKE_5");	
	}			
	else if(Npc_GetDistToWP(hero,"RAKE_6") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace

	}			
	else if(Npc_GetDistToWP(hero,"RAKE_7") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace

	}			
	else if(Npc_GetDistToWP(hero,"RAKE_8") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace

	}			
	else if(Npc_GetDistToWP(hero,"RAKE_9") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace

	}			
	else if(Npc_GetDistToWP(hero,"RAKE_10") < RAKE_MAX_DIST_TO_WP)
	{//Insert treasures at rakeplace
	
	}
   else if(Npc_GetDistToWP(hero, "LOCATION_15_IN_2") < RAKE_MAX_DIST_TO_WP)
	{
      Wld_InsertItem(ItMi_SilverNecklace, "LOCATION_15_IN_2");	
		Wld_InsertItem(ItMi_GoldRing, "LOCATION_15_IN_2");	
		Wld_InsertItem(ItMi_Martin_Ring, "LOCATION_15_IN_2");	
      Wld_InsertItem(ItMi_NuggetSack_03, "LOCATION_15_IN_2");	
	};
};