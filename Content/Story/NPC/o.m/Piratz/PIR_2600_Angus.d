instance PIR_2600_Angus (Npc_Default) 
{ 
   //-------- primary data -------- 

   name = "Angus"; 
   npctype = npctype_main; 
   guild = GIL_PIR; 
   level = 30; 
   voice = 7; 
   id = 2600; 
   flags=NPC_FLAG_FRIEND;
   spawnDelay=NPC_FLAG_BRAVE;

   //-------- abilities -------- 
   attribute[ATR_STRENGTH] = 180; 
   attribute[ATR_DEXTERITY] = 70; 
   attribute[ATR_MANA_MAX] = 0; 
   attribute[ATR_MANA] = 0; 
   attribute[ATR_HITPOINTS_MAX]= 680; 
   attribute[ATR_HITPOINTS] = 680; 

   //-------- visuals -------- 
   // animations 
   Mdl_SetVisual (self,"HUMANS.MDS"); 
   Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
   // body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Fighter",35 ,2,PIR_ARMOR_M); 

   B_Scale (self); 
   Mdl_SetModelFatness(self,1); 

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

   fight_tactic = FAI_HUMAN_STRONG; 

   //-------- Talente -------- 

   Npc_SetTalentSkill (self,NPC_TALENT_1H,1); 
   Npc_SetTalentSkill (self,NPC_TALENT_2H,2); 
   Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
   Npc_SetTalentValue(self,NPC_TALENT_2H,70); 

   //-------- inventory -------- 
   EquipItem (self,Antus_Axe);  
   CreateInvItem (self,ItFoMutton); 
   CreateInvItems (self,ItMiNugget,20); 
   CreateInvItem (self,ItFo_Potion_Health_01); 
   CreateInvItem (self,ItLsTorch); 

   //-------------Daily Routine------------- 
   /*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2600; 
}; 

FUNC VOID Rtn_InHC_2600 () 
{ 
   Ta_SitCampfire		(00,00,04,30,"OW_LOCATION_21_IN"); 
   TA_PracticeSword	(04,30,07,00,"SPAWN_TALL_PATH_BANDITOS2_02");
   Ta_SitCampfireSmallTalk (14,00,15,00,"SPAWN_TALL_PATH_BANDITOS2_03"); //Rodney
   Ta_SitCampfireEat (15,00,16,00,"SPAWN_TALL_PATH_BANDITOS_02_03");
   Ta_SitCampfireSmallTalk (16,00,17,00,"SPAWN_TALL_PATH_BANDITOS2_03"); //Hank 
   TA_Stand	(17,00,20,30,"WATCH_BUTH");
   Ta_Boss (20,30,21,30,"SPAWN_TALL_PATH_BANDITOS2");
   TA_PracticeSword	(21,30,00,00,"SPAWN_TALL_PATH_BANDITOS2_02");
}; 

FUNC VOID Rtn_start_2600 () 
{ 
   Ta_SitCampfire (0,00,12,00,"OW_PIR_CAMPFIRE"); 
   Ta_SitCampfire (12,00,0,00,"OW_PIR_CAMPFIRE"); 
}; 

FUNC VOID Rtn_check_2600 () 
{ 
   Ta_GuidePC (0,00,12,00,"OW_PATH_167"); 
   Ta_GuidePC (12,00,0,00,"OW_PATH_167"); 
}; 

FUNC VOID Rtn_WaitTony_2600 () 
{ 
   TA_Stay(0,00,12,00,"OW_PATH_166"); 
   TA_Stay (12,00,0,00,"OW_PATH_166"); 
}; 

FUNC VOID Rtn_FOLPC2HUN_2600 () 
{ 
   TA_FollowPC (0,00,12,00,"PATH_OC_NC_3"); 
   TA_FollowPC (12,00,0,00,"PATH_OC_NC_3"); 
}; 

FUNC VOID Rtn_RICKHELP_2600 () 
{ 
   TA_FollowPC (0,00,12,00,"PATH_CASTLE_TO_WATERFALL"); 
   TA_FollowPC (12,00,0,00,"PATH_CASTLE_TO_WATERFALL"); 
}; 

FUNC VOID Rtn_Challenge_2600 ()
{	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_A");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_A");
};

Func Void Rtn_Fan_2600 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};	

Func Void Rtn_Alarm_2600 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_WARRIOR4"); 
};

Func Void Rtn_Alarm2_2600 ()
{
	TA_KillingGRDs(08,00,07,59,"OW_PATH_3_01"); 
};

FUNC VOID Rtn_FOLLOWALLIGATOR_2600 () 
{ 
   TA_FollowPC (0,00,12,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
   TA_FollowPC (12,00,0,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
}; 

FUNC VOID Rtn_PatrolTrap_2600 () 
{ 
   TA_STAND(0,00,12,00,"LOCATION_15_IN_2"); 
   TA_STAND(12,00,0,00,"LOCATION_15_IN_2"); 
}; 
	
FUNC VOID Rtn_PreGuideMine_2600()
{	
	TA_STAND(18,00,19,00,"HC_RICKHOUSE_STAIRS");
	TA_STAND(19,00,18,00,"HC_RICKHOUSE_STAIRS");
};

FUNC VOID Rtn_GuideMine_2600()
{	
	TA_FollowCavalorn(18,00,19,00,"OW_OM_ENTRANCE02");
	TA_FollowCavalorn(19,00,18,00,"OW_OM_ENTRANCE02");
	//TA_FollowCavalorn (18,00,19,00,"HC_RICKHOUSE_STAIRS");
	//TA_FollowCavalorn (19,00,18,00,"HC_RICKHOUSE_STAIRS");
};


FUNC VOID Rtn_TRAP_2600 () 
{ 
   Ta_Guard (0,00,12,00,"HIDDEOUT10"); 
   Ta_Guard (12,00,0,00,"HIDDEOUT10"); 
};


FUNC VOID Rtn_DEFEND_2600 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_OUTSIDE_KITCHEN"); 
   Ta_Guard (12,00,0,00,"OCC_OUTSIDE_KITCHEN"); 
};

FUNC VOID Rtn_Follow_2600 () 
{ 
   Ta_FollowPC (0,00,12,00,"HIDDEOUT1"); 
   Ta_FollowPC (12,00,0,00,"HIDDEOUT1"); 
};