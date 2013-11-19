

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

