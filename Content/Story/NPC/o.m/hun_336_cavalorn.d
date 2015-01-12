instance HUN_336_Cavalorn (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Cavalorn";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_HUN;
	level 		=		30;
	Npctype			= NPCTYPE_FRIEND;
	flags       =   NPC_FLAG_IMMORTAL;
	voice 		=		12;
	id 			=		336;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	130;
	attribute[ATR_DEXTERITY] 		=	120;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX]	=	self.level*12+100;
	attribute[ATR_HITPOINTS] 		=	self.level*12+100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Psionic",10,2,HUN_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);	
	Npc_SetTalentSkill (self,HACK_NPC_TALENT_SNEAK,1);
	//Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  ( 6));
		
	//-------- inventory --------
	EquipItem	(self,HUN_MW_03);
	EquipItem	(self,HUN_RW_02);
	CreateInvItems	(self,ItAmArrow,31);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItKeLockpick);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_wait4hero_336;
};

Func Void Rtn_KATWAIT4HERO_336 ()
{
	TA_Position(08,00,07,59,"LOCATION_23_01"); 	 
};
Func Void Rtn_ORHAVETROUBLES_336 ()
{
   TA_Boss(08,00,07,59,"OW_PATH_OC_NC7"); 	 
};

Func Void Rtn_KatrakanatChase_336 ()
{
	TA_Katrakanat_Chase(08,00,07,59,"OW_PATH_02"); 	 
};
Func Void Rtn_rytual_336 ()
{
   TA_SitAround			(04,59,10,15,"CAV_SITER");
	TA_Boss					(10,15,11,30,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Stand         		(11,30,13,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Teaching				(13,00,17,00,"HC_CAVALORN_TEACHMAP");
	TA_Smalltalk			(17,00,18,00,"PATH_OR1");//with Aidan 
   TA_Stand                (18,00,19,30,"WATHC_MAP");	
   TA_Smalltalk			(19,30,20,30,"HC_BENCHX");//Diego    	
	TA_Stand	        	(20,30,21,20,"CAVALORN");
	TA_SitAround	        (21,20,23,00,"SIT_CHAIR_TAVERN");
	TA_Cavalorn_RytualKatrakanat(23,00,04,59,"OW_PATH_02"); 	 
};
FUNC VOID Rtn_start_336 ()
{
	TA_Sleep				(00,30,04,04,"CAVALORN_SLEEP");
   TA_SitAround			(04,04,10,15,"CAV_SITER");
	TA_Boss					(10,15,11,30,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Stand         		(11,30,13,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Teaching				(13,00,17,00,"HC_CAVALORN_TEACHMAP");
	TA_Smalltalk			(17,00,18,00,"PATH_OR1");//with Aidan 
   TA_Stand                (18,00,19,30,"WATHC_MAP");	
   TA_Smalltalk			(19,30,20,30,"HC_BENCHX");//Diego    	
	TA_Stand	        	(20,30,21,20,"CAVALORN");
	TA_SitAround	        (21,20,00,30,"SIT_CHAIR_TAVERN");
};
FUNC VOID Rtn_GestathIn_336 ()
{
	TA_Sleep				(00,30,04,04,"CAVALORN_SLEEP");
   TA_SitAround			(04,04,06,15,"CAV_SITER");
	TA_Smalltalk			(06,15,10,15,"PATH_OR1");//gestath with cavalorn     
	TA_Boss					(10,15,11,30,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Stand         		(11,30,13,00,"OW_SAWHUT_MOLERAT_MOVEMENT4");
	TA_Teaching				(13,00,17,00,"HC_CAVALORN_TEACHMAP");
	TA_Smalltalk			(17,00,18,00,"PATH_OR1");//with Aidan 
   TA_Stand                (18,00,19,30,"WATHC_MAP");	
   TA_Smalltalk			(19,30,20,30,"HC_BENCHX");//Diego    	
	TA_Stand	        	(20,30,21,20,"CAVALORN");
	TA_Smalltalk			(21,20,00,30,"PATH_OR1");//gestath with cavalorn     
};
FUNC VOID Rtn_wait4hero_336 ()
{
   TA_Stand                (19,31,23,30,"WATHC_MAP");	
   TA_Stand                (23,31,19,30,"WATHC_MAP");	
};
FUNC VOID Rtn_KILL_336 ()
{
	//TA_SitAround	(00,00,05,00,"OCR_HUT_13");	// FP "SIT"
	TA_SitAround	(02,00,07,00,"OCC_MAINGATE_TALK");
//	TA_SitAround	(07,00,10,00,"OCR_HUT_63");
	TA_Smoke	(11,00,17,00,"OCR_TOWERRUIN_TOP");	// FP "SIT"
	TA_Smoke	(17,00,21,00,"OCC_MAINGATE_TALK");
	TA_SLEEP	(21,00,03,05,"OCR_HUT_47");
};
Func Void Rtn_Alarm_336 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR2"); 
};
Func Void Rtn_Alarm2_336 ()
{
	TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
};

FUNC VOID Rtn_Challenge_336 ()
{	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_336 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};

FUNC VOID Rtn_GuideMine_336 ()
{	
	TA_GuideToMine (12,01,23,00,"OW_OM_ENTRANCE02");
	TA_GuideToMine (23,01,12,00,"OW_OM_ENTRANCE02");
};

func void Rtn_Meeting_336()
{
   TA_Stand(00,00,12,00,"HC_CAVALORN_TEACHMAP");
	TA_Stand(12,00,00,00,"HC_CAVALORN_TEACHMAP");
};

FUNC VOID Rtn_HIDDOUT_336 () 
{ 
   Ta_GuidePC (0,00,12,00,"HIDDEOUT1"); 
   Ta_GuidePC (12,00,0,00,"HIDDEOUT1"); 
};

FUNC VOID Rtn_TRAP_336 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_CELLAR_WELL_ENTRANCE"); 
   Ta_Guard (12,00,0,00,"OCC_CELLAR_WELL_ENTRANCE"); 
};

FUNC VOID Rtn_FightInCastle_336 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_MERCS_HALLWAY_FRONT"); 
   Ta_Guard (12,00,0,00,"OCC_MERCS_HALLWAY_FRONT"); 
};

FUNC VOID Rtn_CASTLE_336 () 
{ 
   Ta_GuidePC (0,00,12,00,"OCC_BARONS_ENTRANCE_DOWNSTAIRS"); 
   Ta_GuidePC (12,00,0,00,"OCC_BARONS_ENTRANCE_DOWNSTAIRS"); 
};

FUNC VOID Rtn_CELLAR_336 () 
{ 
   Ta_GuidePC (0,00,12,00,"OCC_LADDER_TOP"); 
   Ta_GuidePC (12,00,0,00,"OCC_LADDER_TOP"); 
};
 
FUNC VOID Rtn_DEFEND_336 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_LADDER_TOP"); 
   Ta_Guard (12,00,0,00,"OCC_LADDER_TOP"); 
};