//Events in Monastery Dungeon

func void TimeEventsMonasteryDungeon()
{
	if (WORLD_CURRENT == WORLD_MONASTERYDUNGEONZEN)
	{
		if(MD_FinalBattle)//Chapter 3: battle between Roderic & Truan (Ghosts)
		{
			var c_npc tru; tru = hlp_getnpc(Truan);
			
			if(tru.attribute[ATR_HITPOINTS] <= (5999 - (MD_FinalBattle_Wave * 500)))
			{
				//pr/int(concatstrings("Wave == ",inttostring(MD_FinalBattle_Wave)));
				MD_FinalBattle_Wave = MD_FinalBattle_Wave + 1;
				Wld_InsertNpc(MD_WaveSpawn_R, "MD_PATH_SPAWNA_01");
				Wld_InsertNpc(MD_WaveSpawn_L, "MD_PATH_SPAWNB_01");
			};
		};

		if(MD_TurnOffLighters)
		{
			MD_TurnOffLighters = FALSE;
			var int hh; var int mm;
			hh = wld_getHour();
			mm = wld_getMin();
			Wld_SetObjectRoutine (hh + 1, mm + 1, "FIRECHAMBER_FIREPL_1", -1);
			Wld_SetObjectRoutine (hh + 1, mm + 1 , "FIRECHAMBER_FIREPL_2", -1);
			Wld_SetObjectRoutine (hh + 1, mm + 1, "FIRECHAMBER_FIREPL_3", -1);
			Wld_SetObjectRoutine (hh + 1, mm + 1, "FIRECHAMBER_FIREPL_4", -1);
			Wld_SetObjectRoutine (hh + 1, mm + 1, "FIRECHAMBER_FIREPL_5", -1);
			Wld_SetObjectRoutine (hh + 1, mm + 1, "FIRECHAMBER_FIREPL_6", -1);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_1", 0);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_2", 0);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_3", 0);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_4", 0);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_5", 0);
			Wld_SetObjectRoutine (0, 00, "FIRECHAMBER_FIREPL_6", 0);   
			Wld_SetTime(0, 00);
			Wld_SetTime(hh, mm);   
		};

		if(MD_InsertMR==1)
		{
			tru = Hlp_GetNpc(truan);
			if(!Npc_IsDead(tru))
			{ 
				return; 
			};//break dat bullshit, func MD_InsertMR is setted to 1 when MD_Wave Spawns was dead, athrough it ZS_DEAD check c_npc.id and AIV_MM_REAL_ID
			MD_InsertMR+=1;
			var c_npc a; a = Hlp_GetNpc(RodericMD);
			Npc_ClearAiQueue(a);
			AI_Teleport      (a, "KOMNATA_OGNIA_01");
			Npc_ChangeAttribute(a, ATR_HITPOINTS, -9999);   
			a.attribute[ATR_HITPOINTS] = a.attribute[ATR_HITPOINTS]-a.attribute[ATR_HITPOINTS_MAX];   
			Snd_Play                ("MFX_TELEPORT_CAST");
			Wld_InsertItem         (ALL_MW_03,"FP_RUNESWORD");

			introducechapter ("","","","RUNESWORD_APPEARS.wav", 0);
		}
		else if(MD_InsertMR>1)
		{
			if(MD_InsertMR==2)   
			{
				//    hh=wld_getHour();
				//    mm=wld_getMin();   
				Wld_PlayEffect("V_MR_INSERT_PRE", ALL_MW_03, ALL_MW_03, 0, 0, DAM_INVALID, FALSE);         
			};
			
			if(MD_InsertMR==3)   
			{//remove runesword_npc
				Wld_RemoveItem         (ALL_MW_03);
			};
			
			MD_InsertMR+=1;  
			
			if(MD_InsertMR==24)
			{
				Wld_SendTrigger("MR_MOVER");   
			};
			
			if(MD_InsertMR==25)
			{
				Wld_PlayEffect("V_MR_INSERT_BOOM", ItMw_2H_RuneSWD_01, ItMw_2H_RuneSWD_01, 0, 0, DAM_INVALID, FALSE);
				Wld_PlayEffect("V_MR_INSERT_LOOP", ItMw_2H_RuneSWD_01, ItMw_2H_RuneSWD_01, 0, 0, DAM_INVALID, FALSE);
				
				MD_InsertMR=0;		 
				//Stop bossfight theme:
				BOSSFIGHT_CURRENT = BOSSFIGHT_NONE;
			};
		};
	};
};