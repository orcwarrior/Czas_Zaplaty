func void EVT_STYLIST()
{
	bloops=bloops+1;
   
	if(bloops==2)
	{
      B_PrintDebug("orly?");		
	}
	else if(bloops==3)
	{
      B_PrintDebug("yarly!");
      MOBSIDIALOG=STYLIST_1_DIALOG;			
      prestylize_armor = Npc_GetEquippedArmor(hero);
      hero_last_aplied_face=hero_last_face;
      HERO_FACEMESH_LASTAPLIED = HERO_FACEMESH;
      AI_TurnAway(hero,stylist);
      AI_UnequipArmor	(hero);	
      B_ProcessInfos	(hero);	
      //bloops=0;	
	};
	
   B_PrintDebug(inttostring(hero_last_aplied_face));
	Wld_SendTrigger("STYLIST");		
};

func void EVT_TRIGGER5DELAY()
{
	ITMMAKE = TRUE;
	R_SearchForMOBs();
};

func void CRYSTAL_MIS_TRIGGERSCRIPT_FUNC()
{
	Wld_SpawnNpcRange	(hero,MIS_CRYSTAL_SkeletonFireRanger,1,1000);
	Wld_PlayEffect("spellFX_FireGolemSpawn", arrow_cristal, arrow_cristal, 2, 0, DAM_FIRE, TRUE); //Projetil = TRUE (trifft alle)
};

