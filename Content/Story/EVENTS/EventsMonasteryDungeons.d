instance transformer (Npc_Default)
{
	//-------- primary data --------

	name 		=	"";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_MAG;
	level 		=	50;
	//voice 		=	14;
	id 			=	17;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 55;
	attribute[ATR_MANA_MAX] 	= 1100;
	attribute[ATR_MANA] 		= 1100;
	attribute[ATR_HITPOINTS_MAX]= 600;
	attribute[ATR_HITPOINTS] 	= 600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Ghost.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",9,0,"",100 , 5, -1);

	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE, 6);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	//-------------Daily Routine-------------
	daily_routine = Rtn_test_17;
};

FUNC VOID Rtn_test_17 ()
{
   TA_Min		(self,	0,01,0,00,ZS_TEST_TRANSFORM ,			"WP_TRANSFORMER");
};

instance door_helper (Npc_Default)
{
	//-------- primary data --------

	name 		=	"";
	npctype		=	NPCTYPE_MAIN;
	guild 		=	GIL_MEATBUG;
	level 		=	50;
	//voice 		=	14;
	id 			=	18;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 55;
	attribute[ATR_MANA_MAX] 	= 1100;
	attribute[ATR_MANA] 		= 1100;
	attribute[ATR_HITPOINTS_MAX]= 600;
	attribute[ATR_HITPOINTS] 	= 600;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Ghost.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",9,0,"",100 , 5, -1);

	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE, 6);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	start_aistate	=	ZS_DoorHelper;

	//-------------Daily Routine-------------
};

var int MD_HEROX;
var int MD_HEROY;
var int MD_HEROZ;
//-------------------------------
// 6 L E V E R S   C H A M B E R
//-------------------------------

FUNC VOID EVT_TURNHERO2MEATBUG()
{
   var zcvob hiro;

   if(GL_MD_TURNHERO2MEATBUG==1)
   {
	  	var c_npc trf;
	   trf = hlp_getnpc(transformer);
		Npc_ChangeAttribute	(trf, ATR_HITPOINTS, -trf.attribute[ATR_HITPOINTS_MAX]);
		var ocNPC trf_orgin;
		hiro = hlp_getnpc(pC_hero);
		trf_orgin = hlp_getnpc(transformer);
	   var ocnpc trans;
	   trans = hlp_getnpc(meatbug);

	   	//trf pos = hero old pos
	   trans._zCVob_trafoObjToWorld[3] = MD_HEROX;
		trans._zCVob_trafoObjToWorld[7] = MD_HEROY;
		trans._zCVob_trafoObjToWorld[11] =MD_HEROZ;

	   	//transformed bodystate removed
	   trans.npc_bitfield[4] = trans.npc_bitfield[4] & ~BS_MOD_TRANSFORMED;
	  	trf_orgin.npc_bitfield[4] = trf_orgin.npc_bitfield[4] & ~BS_MOD_TRANSFORMED;
	  	trans.playerGroup = 3;
	  	trf_orgin.playerGroup = 1;
   	var int f; f = mkf(500);
		hiro.trafoObjToWorld[3] = 0;
		hiro.trafoObjToWorld[7] = 0;
		hiro.trafoObjToWorld[11] = 0;
	  	GL_MD_TURNHERO2MEATBUG=2;
	  	WLD_SENDTRIGGER("MD_TRANSHERO_2_MEATBUG");

      return;
	}
	else if(GL_MD_TURNHERO2MEATBUG==2)
	{
      trf_orgin = hlp_getnpc(transformer);
      trf_orgin._zCVob_trafoObjToWorld[3] = 0;
      trf_orgin._zCVob_trafoObjToWorld[7] = 0;
      trf_orgin._zCVob_trafoObjToWorld[11] = 0;
      trf_orgin.idx=64345;
      f = mkf(99999999999999999);
      trf_orgin.vobcheck_time=f;
      f = mkf(1);
      trf_orgin.fadeAwayTime=f;
      GL_MD_TURNHERO2MEATBUG=0;

      return;
	};

	if(!MD_HEROX)//BF: Problem occurs when multi transformers added
	{
      B_FullStop(hero);
      Wld_InsertNpc(transformer,"WP_TRANSFORMER");
      var oCNpc pan_trans;
      hiro = Hlp_GetNpc(PC_HERO);
      MD_HEROX = hiro.trafoObjToWorld[3];
      MD_HEROY = hiro.trafoObjToWorld[7];
      MD_HEROZ = hiro.trafoObjToWorld[11];
      pan_trans = Hlp_GetNpc(transformer);
	};

// 	pri/nt(inttostring(hiro.hpHeal));
// 	pri/nt(inttostring(hiro.anictrl));
//	hiro.hpHeal=9999;
//	hiro.type = 10;

//	AI_PLAYANI(hero,"T_MAGRUN_2_TRFSHOOT");
//	AI_PLAYANI(hero,"S_TRFSHOOT");

//	hiro.human_ai = 0;
//	hiro.script_aiprio = 0;
//	hiro.playerGroup = 1;
//	hiro._zCVob_callback_ai = 0;
//	hiro._zCVob_visual = "Mbg_Body.asc";
// 	hiro.body_visualName = "Mbg_Body";
// 	hiro.head_visualName = "";
};
//-----------------------------
// Z O M B I E ' S   T R A P
//-----------------------------

func void EVT_MD_ZOBIE_RISES()
{
	ZOMBIE_RISE=TRUE;
};
//-----------------------------
// T R A N S F O R M   C H A M B E R
//-----------------------------

func void KPRZEMIANY_EVT()
{
	Npc_clearaiqueue(hero);
	introducechapter ("","","","MFX_Teleport_Cast.wav", 0);

	ai_teleport(hero,"KOMNATA_PRZEMIANY_TP");
};

var int KPRZEMIANY_DOOR_CANBEOPEN;

func void KPRZEMIANY_DOOREVT()
{
	KPRZEMIANY_DOOR_CANBEOPEN=TRUE;

	Wld_InsertNpc(SkeletonMDIntroduceDuals,"KOMNATA_PRZEMIANY_SKEL");
};

func int KPRZEMIANY_DOORCOND()
{
   if(KPRZEMIANY_DOOR_CANBEOPEN)
   {
	  //This is useless & unwanted, caused door opening bugs
      //KPRZEMIANY_DOOR_CANBEOPEN=true;
      return 1;
   }
   else
   {
      return 0;
   };
};

//-----------------------------
// F I R E   C H A M B E R
//-----------------------------

var int FireChamber_GateOpened;

func int KMOST_DOORCOND()
{
   if(FireChamber_GateOpened>=4)
   {
      FireChamber_GateOpened=5;
      return 1;
   }
   else
   {
      return 0;
   };
};

func int KSECRET_DOORCOND()
{
   if(FireChamber_GateOpened>=5)
   {
      FireChamber_GateOpened=6;
      return 1;
   }
   else
   {
      return 0;
   };
};

func void MD_SpawnGolem()
{
	FireChamber_GateOpened=0;

	MD_TurnOffLighters=TRUE;

	Wld_InsertNpc(MD_FIREGOLEM,"KOMNATA_OGNIA_01");
};
func void MD_OpenSecretDoor()
{
	FireChamber_GateOpened=5;
	Wld_InsertNpc(door_helper,"KSECRET_WP");
};

func void MD_opengate()
{
	Wld_InsertNpc(door_helper,"KMOST_WP");
	Wld_InsertNpc(rodericmd,"KOMNATA_MOST_03");
};

func void FC1_S1()
{
	if(FireChamber_GateOpened==0)
	{
      FireChamber_GateOpened=1;
	}
	else
	{
      MD_SpawnGolem();
	};
};

func void FC2_S1()
{
	if(FireChamber_GateOpened==1)
	{
      FireChamber_GateOpened=2;
	}
	else
	{
      MD_SpawnGolem();
	};
};

func void FC3_S1()
{
	if(FireChamber_GateOpened==4)
	{
      MD_OpenSecretDoor();
	  
	}
	else
	{
      MD_SpawnGolem();
	};
};

func void FC4_S1()
{
	if(FireChamber_GateOpened==3)
	{
      FireChamber_GateOpened=4;
      MD_opengate();
	}
	else
	{
      MD_SpawnGolem();
	};
};
func void FC5_S1()
{
	if(FireChamber_GateOpened==2)
	{
      FireChamber_GateOpened=3;
	}
	else
	{
      MD_SpawnGolem();
	};
};
func void FC6_S1()
{
	MD_SpawnGolem();
};
//-----------------------------
// O P E N   L A S T   G A T E
//-----------------------------
func int TS_HERO()
{
   if(Npc_IsPlayer(self))&&(Npc_KnowsInfo(hero,DIA_RodericMD_Hi))
   {
      return 1;
   }
   else
   {
      return 0;
   };
};

func int TS_RODERIC()
{
   if(!Npc_IsPlayer(self))
   {
      return 1;
   }
   else
   {
      return 0;
   };
};

var int ReadyToEnterLastHall;

func void TS_EVT()
{
   Wld_SendTrigger("TS_CAM");
   Wld_SendTrigger("EVT_LASTGATEDELAYER");//10s delay -add
   
   var c_npc rod; rod = Hlp_GetNpc(RodericMD);
   AI_ALIGNTOWP(rod);
   AI_WAIT(rod,2);
   AI_UseMob				(rod,"TURNSWITCH",1);
   AI_UseMob				(rod,"TURNSWITCH",-1);
   B_ExchangeRoutine(rod,"BACKTOGATE");
   AI_SetWalkmode(rod,NPC_RUN);

   ReadyToEnterLastHall=TRUE;
};

func void EVT_GOTOLASTHALL_FUNC()
{
	var c_npc rod; rod = Hlp_GetNpc(RodericMD);

	if(ReadyToEnterLastHall)&&(Npc_GetDistToWP(rod,"MD_PATHTOLASTHALL_RODERIC_01")<300)
	{
      Wld_SendTrigger("CAM_LASTHALL");
      B_ExchangeRoutine(rod,"ENTERHALL");
      B_fullstop(hero);
      AI_WAIT(hero,1);
   //	AI_TELEPORT(hero,"MD_PATHTOLASTHALL_HERO_01");
      AI_SetWalkmode(hero,NPC_WALK);
      AI_SetWalkmode(rod,NPC_WALK);
	  //TODO: Change to ZS's
      //Wld_InsertNpc(Truan,"MD_LASTHALL_TRUAN_05");
      Wld_InsertNpc(Truan,"MD_LASTHALL_TRUAN_01");//wTF?!
	  
	  AI_WaitMS(hero,300);
      AI_GOTOWP(hero,"MD_PATHTOLASTHALL_HERO_01");
	  AI_WaitMS(hero,100);
      AI_GOTOWP(hero,"MD_PATHTOLASTHALL_HERO_05");
      AI_GOTOWP(hero,"MD_PATHTOLASTHALL_HERO_05");
      AI_GOTOWP(rod,"MD_PATHTOLASTHALL_RODERIC_01");
	  AI_WaitMS(rod,400);
      AI_GOTOWP(rod,"MD_PATHTOLASTHALL_RODERIC_06");
	};
};

func void MDCINE_EVT()
{
	if(Npc_GetDistToPlayer(Truan)<1000)
	{
      Wld_SendTrigger("TRUAN_CAM");
      CinematicReset(Cinematic_MD_RodericVsTruan,0);
      CinematicDialog(Truan,RodericMD,"W koñcu jakiœ g³upiec doszed³ a¿ tutaj. Kiedy wypijê krew tego œmiertelnika bêdê wolny! ","NOSOUND.WAV",5);
      CinematicDialog(RodericMD,Truan,"Najpierw bêdziesz musia³ przejœæ przeze mnie zdrajco!","NOSOUND.WAV",3);
      CinematicDialog(Truan,RodericMD,"Pamiêtam ciê... Roderik, to dziêki twojej naiwnoœci zdoby³em miecz ¿ywio³ów.","NOSOUND.WAV",4);
      CinematicDialog(RodericMD,Truan,"Wystarczy ju¿ s³ów - giñ bestio!","NOSOUND.WAV",2);
      CinematicDialog(RodericMD,Truan,"","NOSOUND.WAV",0);
      B_LogEntry		(CH3_RBL_RodneyHelp, "Czas na ostateczn¹ walkê ze z³em.");
      var c_npc tru; tru = Hlp_GetNpc(truan);
      B_Exchangeroutine(tru,"start2");
      
      talking_with_Truan = true;
	};
};
