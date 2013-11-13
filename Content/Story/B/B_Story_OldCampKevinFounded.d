func void B_Story_OldCampKevinFounded()
{
	var c_npc slf;
	CinematicReset(Cinematic_OC_KevinDead,3);
	CinematicDialog(GRD_280_Gardist,pc_hero,"ALARM! INTRUZ!","SVM_6_IntruderAlert.WAV",3);
	slf = Hlp_GetNPC(GRD_280_Gardist);
	AI_Teleport(slf,"OCC_GUARD_ROOM_FRONT");	
	AI_Wait(hero,1.5);	
	
	B_ExchangeRoutine(slf,"OCALARM");	
	Wld_SendTrigger("EVT_OC_MAINGATE02_02");
	
//	AI_Teleport(slf,"OCC_GANGWAY");
	AI_SetWalkmode(slf,NPC_RUN);		
	Wld_insertNpc(Grd_202_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_205_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_207_Gardist,"OCC_GUARD_ROOM_FRONT");
	//Strong grd in gomez cellar
	Wld_insertNpc(Grd_247_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_248_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_249_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_256_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_257_Gardist,"OCC_GUARD_ROOM_FRONT");
	Wld_insertNpc(Grd_258_Gardist,"OCR_OUTSIDE_HUT_Z5");
	Wld_insertNpc(Grd_259_Gardist,"OCR_OUTSIDE_HUT_Z5");
	Wld_insertNpc(Grd_111_Gardist,"OCR_HIDE_1");
	Wld_insertNpc(Grd_112_Gardist,"OCR_HIDE_2");
	Wld_insertNpc(Grd_113_Gardist,"OCR_HIDE_3");
	Wld_insertNpc(Grd_114_Gardist,"OCR_HIDE_4");
	
	slf.flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	slf = Hlp_GetNPC(GRD_230_Gardist);
	B_ExchangeRoutine(slf,"HS");	
	slf.flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;

	slf = Hlp_GetNPC(GRD_12461_Gardist);
	B_ExchangeRoutine(slf,"HS");
	
	slf = Hlp_GetNPC(Grd_1246_Jeff);
	B_ExchangeRoutine(slf,"CHASE");				

	slf = Hlp_GetNPC(Grd_3101_Mathis);
	B_ExchangeRoutine(slf,"CHASE");	
	
	slf = Hlp_GetNPC(Grd_1245_Cad);
	B_ExchangeRoutine(slf,"CHASE");			
	//Drunken GRD's;
	
	slf = Hlp_GetNPC(Grd_228_Gardist);
	B_ExchangeRoutine(slf,"OCALARM");	

	Global_FinishHero=TRUE;					
};

func void OC_ENTRANCE_FUNC()
{
	if(Global_FinishHero)&&(Kapitel==3)
	{
      Global_FinishHero=FALSE;
      
      B_NpcIDRemoveFromWorld(Grd_202_Gardist);
      B_NpcIDRemoveFromWorld(Grd_205_Gardist);
      B_NpcIDRemoveFromWorld(Grd_207_Gardist);

      B_NpcIDRemoveFromWorld(Grd_247_Gardist);
      B_NpcIDRemoveFromWorld(Grd_248_Gardist);
      B_NpcIDRemoveFromWorld(Grd_249_Gardist);
      B_NpcIDRemoveFromWorld(Grd_256_Gardist);
      B_NpcIDRemoveFromWorld(Grd_257_Gardist);
      B_NpcIDRemoveFromWorld(Grd_258_Gardist);
      B_NpcIDRemoveFromWorld(Grd_259_Gardist);
      B_NpcIDRemoveFromWorld(Grd_111_Gardist);
      B_NpcIDRemoveFromWorld(Grd_112_Gardist);
      B_NpcIDRemoveFromWorld(Grd_113_Gardist);
      B_NpcIDRemoveFromWorld(Grd_114_Gardist);

      B_NpcIDRemoveFromWorld(GRD_12461_Gardist);
      B_NpcIDRemoveFromWorld(Grd_3101_Mathis);
      B_NpcIDRemoveFromWorld(Grd_228_Gardist);
      B_NpcIDRemoveFromWorld(Grd_1245_Cad);
      B_NpcIDRemoveFromWorld(Grd_1246_Jeff);		
	};				
};