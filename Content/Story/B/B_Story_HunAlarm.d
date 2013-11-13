/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Story Grds Attacking Hun Camp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Schemat
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change Day(ustalenie ile wysy³a dziennie i kiedy strazników -->trigger(dobiera waypoint)-->ALARM-->npcs ida do posa-->dodaje GRDs z nowym ZS'em
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Schemate(ang)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change Day(when send GRDs trigger and amout of triggers(and more sh*t)--->trigger(where grd are spawn waypoint)-->ALARM(B_Story_ALARM)-->npcs goto pos(B_Story_StartRoutine)-->insert GRDs
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var int OR_ATTACKED;

func string B_GetWPAtAttack(var C_NPC slf)
{
	if(slf.fight_tactic==FAI_HUMAN_RANGED)
	{
      return ConcatStrings("HC_RANGED",IntToString(HC_WP_RANGED));	
      HC_WP_RANGED+=1;	
	}
	else if(slf.fight_tactic==FAI_HUMAN_MAGE)
	{
      return ConcatStrings("HC_MAGE",IntToString(HC_WP_MAGE));	
      HC_WP_MAGE+=1;	
	}
	else
	{
      return ConcatStrings("HC_WARRIOR",IntToString(HC_WP_WARRIOR));	
      HC_WP_WARRIOR+=1;			
	};
	Npc_SetAivar(slf,AIV_ITEMFREQ,  TA_IT_HAVEIMPORTANTSTATE);
};

func void B_Story_StartRoutine(var int NpcInstance,var string routine)
{
   var C_NPC NPCtransform;
   NPCtransform = Hlp_GetNpc(NpcInstance);
   TA_RemoveOverlay(NPCtransform);
   //npctransform.fight_tactic = FAI_HUMAN_BATTLE;
   //	Mdl_ApplyOverlayMDSTimed	(NPCtransform, "HUMANS_DISABLESTRAFE.MDS",180000);
   //TA_Min						(NPCtransform,8,00,7,59,ZS_GRDAttacking,"HELPPOINT4");
	Npc_SetAivar(NPCtransform,AIV_ITEMFREQ,  TA_IT_HAVEIMPORTANTSTATE);

 	if (Npc_GetDistToPlayer(NPCtransform) > 4000)
	{
		Npc_ExchangeRoutine(NPCtransform,routine);
		Mdl_RemoveOverlayMds	(NPCtransform,	"HUMANS_SPRINT.MDS");	
	}
	else
	{
		AI_SetWalkmode 		(NPCtransform,	NPC_RUN);		
		Mdl_ApplyOverlayMds	(NPCtransform,	"HUMANS_SPRINT.MDS");		
		B_ExchangeRoutine(NPCtransform,routine);
	}; 
};

func void B_Story_ALARM(var string waypoint)
{
//Pr/int("ALARM activate");
   var int SVM;
   var string Snd;	
	if (OR_ATTACKED==1)
	{
      if (Npc_GetDistToWP(hero,"HELPPOINT6") < 5000)
		{
//		Pr/int("shortALARM");
// 		SVM = Hlp_Random(14);
// 		Snd = concatstrings("SVM_",IntToString(SVM+1));
// 		Snd = concatstrings(Snd,"_INTRUDERALERT");		
// 		Snd_Play 					(Snd);
         PutMsg("Stra¿nicy atakuj¹ obóz myœliwych!","font_default.tga",RGBAToZColor(255,255,100,255),8*5,"");			
		}
		else if (Npc_GetDistToWP(hero,"HC_WATCH_L") < 12000)
		{
//		Pr/nt("longrangeALARM(whisper)");		
// 		SVM = Hlp_Random(14);
// 		Snd = concatstrings("SVM_",IntToString(SVM+1));
// 		Snd = concatstrings(Snd,"_INTRUDERALERTWHISPER");		
// 		Snd_Play					(Snd);
		}
		else
		{/* P/rint("error(probably"); */};
         introducechapter ("","","","ALARM_OR.wav", 0);	
      };
		///////////////////////////////
		HC_WP_WARRIOR = 0;
		HC_WP_RANGED  = 0;
		HC_WP_MAGE    = 0;
		var C_NPC slf;
		B_Story_StartRoutine(MAG_1330_BaalParvez,"ALARM");
//		B_Story_StartRoutine(MAG_4021_Cortez,"ALARM");
		B_Story_StartRoutine(mag_1604_Leren,"ALARM");
		B_Story_StartRoutine(RBL_1331_BaalTaran,"ALARM");
//		B_Story_StartRoutine(Org_851_Butch,"ALARM");
		B_Story_StartRoutine(PIR_2600_Angus,"ALARM");
		B_Story_StartRoutine(RBL_311_Fisk,"ALARM");
		B_Story_StartRoutine(RBL_2605_Garry,"ALARM");
		B_Story_StartRoutine(RBL_1331_BaalTaran,"ALARM");
		B_Story_StartRoutine(HUN_336_Cavalorn,"ALARM");
		B_Story_StartRoutine(HUN_818_Ratford,"ALARM");
		B_Story_StartRoutine(HUN_858_Quentin,"ALARM");
		B_Story_StartRoutine(HUN_819_Drax,"ALARM");
		B_Story_StartRoutine(HUN_859_Aidan,"ALARM");
//		B_Story_StartRoutine(HUN_828_Bruce,"ALARM");
		B_Story_StartRoutine(RBL_331_Fingers,"ALARM");

		B_Story_StartRoutine(PIR_2601_Hank,"ALARM");
		B_Story_StartRoutine(PIR_2602_Rodney,"ALARM");
//		B_Story_StartRoutine(rbl_8730_dylan,"ALARM");	
		
		B_Story_StartRoutine(PC_MAGE,"ALARM");
		B_Story_StartRoutine(HUN_309_Whistler,"ALARM");
		B_Story_StartRoutine(HUN_2615_Abel,"ALARM");
		B_Story_StartRoutine(RBL_2605_Garry,"ALARM");
		B_Story_StartRoutine(RBL_1332_BaalKagan,"ALARM");//Taran->Kagan
		B_Story_StartRoutine(RBL_2604_Tony,"ALARM");
		
		B_Story_StartRoutine(RBL_2613_Vam,"ALARM");
    	
		B_Story_StartRoutine(RBL_2614_Fox,"ALARM");
		B_Story_StartRoutine(RBL_2618_Hark,"ALARM");	
		B_Story_StartRoutine(RBL_2619_Cup,"ALARM");
		B_Story_StartRoutine(RBL_4011_Leaf,"ALARM");		
		
		var ocnpc npc;
	
		npc=Hlp_GetNpc(MAG_1330_BaalParvez);
		npc._zCVob_type = 0;//2 (Light) caused crash!! //zCVobSound! xD 	
		npc=Hlp_GetNpc(mag_1604_Leren);
		npc._zCVob_type = 0;//2 (Light) caused crash!!
		npc=Hlp_GetNpc(RBL_1331_BaalTaran);
		npc._zCVob_type = 0;//2 (Light) caused crash!!

		npc=Hlp_GetNpc(PIR_2600_Angus);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_311_Fisk);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2605_Garry);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_4011_Leaf);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_336_Cavalorn);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_818_Ratford);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_858_Quentin);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_819_Drax);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_859_Aidan);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
//		npc=Hlp_GetNpc(HUN_828_Bruce);
//		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_331_Fingers);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_729_Kharim);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
      if(hanis_trust)
		{
         npc=Hlp_GetNpc(HUN_1422_GorHanis);
         npc._zCVob_type = 0;//2 (Light) caused crash!!	
      }
      else
      {
         npc=Hlp_GetNpc(PIR_2601_Hank);
         npc._zCVob_type = 0;//2 (Light) caused crash!!	
      };
		npc=Hlp_GetNpc(PIR_2602_Rodney);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
// 		npc=Hlp_GetNpc(rbl_8730_dylan);
// 		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(PC_MAGE);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_309_Whistler);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(HUN_2615_Abel);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2605_Garry);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_1332_BaalKagan);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2604_Tony);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2613_Vam);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2618_Hark);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2614_Fox);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
		npc=Hlp_GetNpc(RBL_2619_Cup);
		npc._zCVob_type = 0;//2 (Light) caused crash!!	
			
	//Fire/Ice Ranged Weapons
// 	slf = hlp_GetNpc(HUN_818_Ratford);
// 	CreateInvItems(slf,ItAmIceBolt,25);
// 	CreateInvItem(slf,ALL_ICECBOW_01);
// 	
// 	slf = hlp_GetNpc(HUN_819_Drax);
// 	CreateInvItems(slf,ItAmIceArrow,25);
// 	CreateInvItem(slf,ALL_ICEBOW_01);
// 			
// 	slf = hlp_GetNpc(RBL_2604_Tony);
// 	CreateInvItems(slf,ItAmFireArrow,25);
// 	CreateInvItem(slf,ALL_FireBOW_01);	
// 	slf.attribute[ATR_DEXTERITY]+=20;		
// 	slf = hlp_GetNpc(RBL_331_Fingers);
// 	CreateInvItems(slf,ItAmFireArrow,25);
// 	CreateInvItem(slf,ALL_FireBOW_01);	
// 				
// 	slf = hlp_GetNpc(PIR_2601_Hank);
// 	CreateInvItems(slf,ItAmFireBolt,25);
// 	CreateInvItem(slf,ALL_FireCBOW_01);	
	
	//Mages Scrolls
	slf = Hlp_GetNpc(mag_1604_Leren);
	CreateInvItems(slf,ItArScrollThunder,3);
	CreateInvItems(slf,ItArScrollCurse,1);
	CreateInvItems(slf,ItArScrollStuningBall,1);
	
	slf = Hlp_GetNpc(MAG_1330_BaalParvez);
	CreateInvItems(slf,ItArScrollFireWall,4);
	CreateInvItems(slf,ItArScrollThunder,2);
	
	slf = Hlp_GetNpc(PIR_2602_Rodney);
	CreateInvItems(slf,ItArScrollFireWall,2);
	CreateInvItems(slf,ItArScrollCurse,1);
	CreateInvItems(slf,ItArScrollStuningBall,1);
		
	slf = Hlp_GetNpc(PC_MAGE);
	CreateInvItems(slf,ItArScrollFireWall,2);	
	CreateInvItems(slf,ItArScrollThunder,1);
	CreateInvItems(slf,ItArScrollCurse,1);

	if(Know_JackAlligator == TRUE)
	{
		B_Story_StartRoutine(PIR_2612_JackAlligator,"ALARM");
		npc=Hlp_GetNpc(PIR_2612_JackAlligator);
		npc._zCVob_type = 0;//2 (Light) caused crash!!			
	};		
	if(Know_PachoAndScorpio == TRUE)
	{
		B_Story_StartRoutine(Grd_224_Pacho,"ALARM"); 
		npc=Hlp_GetNpc(Grd_224_Pacho);
		npc._zCVob_type = 0;//2 (Light) caused crash!!			
		B_Story_StartRoutine(Grd_205_Scorpio,"ALARM"); 
		npc=Hlp_GetNpc(Grd_205_Scorpio);
		npc._zCVob_type = 0;//2 (Light) caused crash!!			
	};				
	if(Know_Gestath == TRUE)
	{
		B_Story_StartRoutine(hun_2609_Gestath,"ALARM");
		npc=Hlp_GetNpc(hun_2609_Gestath);
		npc._zCVob_type = 0;//2 (Light) caused crash!! 
	};					
	if(Know_Carlson == TRUE)
	{
		B_Story_StartRoutine(RBL_2617_Carlson,"ALARM"); 
		npc=Hlp_GetNpc(RBL_2617_Carlson);
		npc._zCVob_type = 0;//2 (Light) caused crash!!

	};	
	
	if(!hanis_trust)//kharim isn't banned
	{
      B_Story_StartRoutine(HUN_729_Kharim,"ALARM");
	}
	else
	{
      B_Story_StartRoutine(HUN_1422_GorHanis,"ALARM");
	};			
	//TODO: Kharim Banished? (Hanis)	
					
};

func int B_InsertGrds()
{	
	var string spawnwaypoint;
	spawnwaypoint = "OC_ROUND_20";
	GrdRnd = 46;//+Math_Round(hero.level/4)+Math_Round(Hlp_Random(hero.level/4));
   
   if(GrdNumSpawned < 18)||(Hlp_Random(75)<=hero.level)
   {
      Wld_InsertNpc		(GRD_2770_Guard,		spawnwaypoint);
      GrdNumSpawned = GrdNumSpawned+1;		
   };
};

func int B_INITInsertGrds()
{
   GrdNumSpawned = 0;

	B_InsertGrds();
	B_InsertGrds();
	B_InsertGrds();
	B_InsertGrds();
	B_InsertGrds();
	B_InsertGrds();	
	B_InsertGrds();
	B_InsertGrds();
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	B_InsertGrds();	
	
	GrdsInAttack = GrdNumSpawned;		
};
func void EVT_OR_GATE_FUNC()
{
	if(!Npc_IsPlayer(self))
	{
		return;
	};
	
	if(OR_ATTACKED==1)
	{
		OR_ATTACKED=2;
	};
};