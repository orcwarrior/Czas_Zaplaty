var int CameraStart;
var int InMaze;

FUNC VOID EVT_TRAP_SCRIPT01 ()
{
	Wld_InsertNpc		(FIREGOLEM,"TRAP_WP_L");
	Wld_InsertNpc		(FIREGOLEM,"TRAP_WP_R");
	Snd_Play			("MFX_Spawn_Cast");
	Snd_Play			("MFX_Firespell_Humanburn");
};

func void EVT_CAVE_TIMER ()
{
	var C_NPC DarkMage;
	var int SendTrigggerCave_Timer;
	SendTrigggerCave_Timer=TRUE;
//	Wld_PlayEffect("DREAM_BLEND", hero, hero, 0, 0, DAM_MAGIC, 0);
	CAVETIME=CAVETIME+1;

	if(CAVETIME>=37)//Not start camera = HOT :D
	{	Wld_SendTrigger("LAVA_MOVER_KEY");	};

	if(CameraStart)&&(CAVETIME==6)
	{
		Wld_SendTrigger("DARKMAGE_TELEPORT");
		Snd_Play("MFX_Teleport_Invest");
	};

	if(CameraStart)&&(CAVETIME==9)
	{
      Snd_Play("MFX_Teleport_Cast");
      Npc_ExchangeRoutine(DarkMage,"TESTPASSED");
      DarkMage = Hlp_GetNpc(DMB_1700_Necro); Npc_ClearAIQueue(DarkMage);AI_Teleport(DarkMage,"ESCAPE_DARKMAGE");
	};

	if(CameraStart)&&(CAVETIME==11)
	{
		DarkMage = Hlp_GetNpc(DMB_1700_Necro);
		AI_TurnToNpc(hero,DarkMage); SendTrigggerCave_Timer=FALSE;
		Wld_PlayEffect("DarkMage_STOPLAVA_BLEND", DarkMage, DarkMage, 0, 0, DAM_MAGIC, 0);
	  	Wld_PlayEffect("DarkMage_STOPLAVA", DarkMage, DarkMage, 0, 0, DAM_MAGIC, 0);
	};

	if(Lava_CameraStart)&&(CAVETIME==3)
	{
      Wld_SendTrigger("DARKMAGE_TELEPORT0");
      Snd_Play("MFX_Teleport_Invest");
	};

	if(Lava_CameraStart)&&(CAVETIME==5)
	{
	   Snd_Play("MFX_Teleport_Cast");
	  	Wld_InsertNPC(DMB_1700_Necro,"NECRO_LAVA");
	  	DarkMage = Hlp_GetNpc(DMB_1700_Necro);
		//	Snd_Play("kwestia");
		AI_PlayAni(DarkMage,"t_Stand_2_Teleport");
		AI_PlayAni(DarkMage,"t_Teleport_2_Stand");
	};

	if(Lava_CameraStart)&&(CAVETIME==8)
	{
		Wld_PlayEffect("DarkMage_STOPLAVA_BLEND", DarkMage, DarkMage, 0, 0, DAM_MAGIC, 0);
	  	Wld_PlayEffect("DarkMage_STOPLAVA", DarkMage, DarkMage, 0, 0, DAM_MAGIC, 0);
	};

	if(Lava_CameraStart)&&(CAVETIME==9)
	{
      DarkMage = Hlp_GetNpc(DMB_1700_Necro);
      AI_StopProcessInfos	(DarkMage);
      Npc_ClearAIQueue(DarkMage);
      Snd_Play("MFX_Teleport_Cast");
      AI_Teleport(DarkMage,"NECRO_START");
      Npc_ExchangeRoutine(DarkMage,"HIDE");
	};

	if(Lava_CameraStart)&&(CAVETIME==14)
	{
      CAVETIME=0;
      Lava_CameraStart=FALSE;
      Wld_SendTrigger("LAVA_LIST01");
	};

	if(SendTrigggerCave_Timer)
	{
      Wld_SendTrigger("CAVE_TIMER");
	};
};

func void EVT_BRIDGEBREAK ()
{
	Snd_Play			("BRIDGEBREAK");
};

func void EVT_ESCAPE_START()
{
   CAVETIME=0;
   CameraStart=TRUE;
   Wld_SendTrigger("ESCAPE_CAM");
   AI_GotoWP(hero,"ESCAPE_DEADEND");
};

func void EVT_LAVA_BLEND()
{
	Wld_PlayEffect("LAVA_BLEND", hero, hero, 0, 0, DAM_MAGIC, 0);
};

func void EVT_PRELAVA_SCRIPT()
{
	Wld_SendTrigger("PRELAVA_CAM1");
	Wld_SendTrigger("PRELAVA_GATE_L1");
	Wld_SendTrigger("PRELAVA_GATE_L2");
	Wld_SendTrigger("PRELAVA_GATE_R1");
	Wld_SendTrigger("PRELAVA_GATE_R2");
	RAISESTATUES=TRUE;
	CaveStatueDestroyed=0;
};

func void EVT_PRELAVA_EXIT_SCRIPT()
{
	if(CaveStatueDestroyed>=4)
	{
      Wld_SendTrigger("PRELAVA_GATE_EXIT");
      Wld_SendTrigger("ANTI_CFANIAK");
      Wld_SendTrigger("LAVA_SHOW_CAM");
      AI_GotoWP(hero,"LAVA_HERO");
      Wld_SendTrigger("CAVE_TIMER");
      Lava_CameraStart=TRUE;
	};
};

func void EVT_MONSTERSPAWN_INMAZE()
{
	//PRI/NT("A");
	//DISABLED CAUSE OF BUGS
// 	if(hlp_random(5)==0)
// 	{
// 		var int monsterizer;
// 		monsterizer=Hlp_Random(3);
// 		//PRI/NT("B");
// 		if(monsterizer==0)
// 		{
// 			Wld_SpawnNpcRange	(hero,	Skeleton,			1,	999);
// 		}
// 		else if(monsterizer==1)
// 		{
// 			Wld_SpawnNpcRange	(hero,	SkeletonScout,			1,	999);
// 		}
// 		else if(monsterizer==2)
// 		{
// 			Wld_SpawnNpcRange	(hero,	SkeletonWarrior,			1,	999);
// 		}
// 		else if(monsterizer==3)
// 		{
// 			Wld_SpawnNpcRange	(hero,	SkeletonRanger,			1,	999);
// 		};
// 	};
// 	if(InMaze)
// 	{
// 	Wld_SendTrigger("MONSTERSPAWN_INMAZE");
// 	};
};
func void EVT_MAZEOUT()
{
	InMaze=FALSE;
};

func void EVT_MAZEIN()
{
	InMaze=TRUE;
	Wld_SendTrigger("MONSTERSPAWN_INMAZE");
};