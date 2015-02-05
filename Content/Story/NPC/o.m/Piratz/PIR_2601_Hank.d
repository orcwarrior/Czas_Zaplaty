instance PIR_2601_Hank (Npc_Default) 
{ 
   //-------- primary data -------- 

   name = "Hank"; 
   npctype = npctype_main; 
   guild = GIL_PIR; 
   level = 25; 
   voice = 9; 
   id = 2601; 
   flags=NPC_FLAG_FRIEND;
   spawnDelay=NPC_FLAG_BRAVE;

   //-------- abilities -------- 
   attribute[ATR_STRENGTH] = 155; 
   attribute[ATR_DEXTERITY] = 80; 
   attribute[ATR_MANA_MAX] = 0; 
   attribute[ATR_MANA] = 0; 
   attribute[ATR_HITPOINTS_MAX]= 600; 
   attribute[ATR_HITPOINTS] = 600; 
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] =	50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] =	50;
	protection[PROT_FLY]	= 50;
	protection[PROT_MAGIC] = 50;

   //-------- visuals -------- 
   // animations 
   Mdl_SetVisual (self,"HUMANS.MDS"); 
   Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
   // body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald",12 ,1,PIR_ARMOR_M); 

   B_Scale (self); 
   Mdl_SetModelFatness(self,1); 

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

   fight_tactic = FAI_HUMAN_STRONG; 

   //-------- Talente -------- 

   Npc_SetTalentSkill (self,NPC_TALENT_1H,1);  
   Npc_SetTalentSkill (self,NPC_TALENT_2H,2); 
   Npc_SetTalentValue(self,NPC_TALENT_2H,60);
   Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1); 
   Npc_SetTalentValue(self,NPC_TALENT_CROSSBOW,59);

   //-------- inventory -------- 

   //EquipItem (self,ItRw_Bow_War_05);
   CreateInvItem (self,Hank_Sword);  
   CreateInvItem (self,ItFoMutton); 
   CreateInvItem (self,Hank_Crossbow);  
   CreateInvItems (self,ItMiNugget,20); 
   CreateInvItems (self,ItFoBeer,4); 
   CreateInvItems (self,ItAmBolt,98); 
   CreateInvItem (self,ItFo_Potion_Health_01); 
   CreateInvItem (self,ItLsTorch); 

   //-------------Daily Routine------------- 
   /*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_2601; 
};
FUNC VOID  Rtn_InHC_2601 () 
{ 
	Ta_SitAround (00,00,10,30,"SIT_AROUND_BUTH"); 
	Ta_SitCampfireEat (10,30,12,00,"SPAWN_TALL_PATH_BANDITOS_02_03");
	Ta_SitAround (12,00,15,00,"SIT_AROUND_BUTH"); 
	Ta_SitCampfireSmallTalk (15,00,16,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Hank
	Ta_SitCampfireSmallTalk (16,00,17,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Angus 
	TA_Stand	(17,00,20,00,"HC_SHOP_BUY");
	TA_Stand	(20,00,00,00,"TAVERN_BARX");
}; 
FUNC VOID Rtn_prestart_2601 () 
{ 
   TA_FollowPC (0,00,12,00,"OW_PIR_CAMPFIRE"); 
   TA_FollowPC (12,00,0,00,"OW_PIR_CAMPFIRE"); 
}; 
FUNC VOID Rtn_start_2601 () 
{ 
   Ta_SitCampfire (0,00,12,00,"OW_PIR_CAMPFIRE"); 
   Ta_SitCampfire (12,00,0,00,"OW_PIR_CAMPFIRE"); 
}; 
FUNC VOID Rtn_TESTWAIT_2601 () 
{ 
   TA_PracticeSword (0,00,12,00,self.wp); 
   TA_PracticeSword(12,00,0,00,self.wp); 
}; 
FUNC VOID Rtn_check_2601 () 
{ 
   TA_FollowAngus (0,00,12,00,"OW_PATH_167"); 
   TA_FollowAngus (12,00,0,00,"OW_PATH_167"); 
}; 
FUNC VOID Rtn_WaitTony_2601 () 
{ 
   TA_Stay(0,00,12,00,"OW_PATH_166"); 
   TA_Stay (12,00,0,00,"OW_PATH_166"); 
}; 
FUNC VOID Rtn_FOLPC2HUN_2601 () 
{ 
   TA_FollowPC (0,00,12,00,"PATH_OC_NC_3"); 
   TA_FollowPC (12,00,0,00,"PATH_OC_NC_3"); 
}; 
FUNC VOID Rtn_RICKHELP_2601 () 
{ 
   TA_FollowPC (0,00,12,00,"PATH_CASTLE_TO_WATERFALL"); 
   TA_FollowPC (12,00,0,00,"PATH_CASTLE_TO_WATERFALL"); 
}; 
FUNC VOID Rtn_Alarm_2601 ()
{
	TA_KillingGRDs(08,00,07,59,"HC_RANGED3"); 
};

FUNC VOID Rtn_Challenge_2601 ()
{	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_A");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_A");
};

Func Void Rtn_Fan_2601 ()
{
	TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};	
FUNC VOID Rtn_FOLLOWALLIGATOR_2601 () 
{ 
	TA_FollowPC (0,00,12,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
	TA_FollowPC (12,00,0,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
}; 

FUNC VOID Rtn_PatrolTrap_2601 () 
{ 
	TA_STAND(0,00,12,00,"LOCATION_15_IN_2"); 
	TA_STAND (12,00,0,00,"LOCATION_15_IN_2"); 
}; 

FUNC VOID Rtn_TRAP_2601 () 
{ 
   Ta_Guard (0,00,12,00,"HIDDEOUT11"); 
   Ta_Guard (12,00,0,00,"HIDDEOUT11"); 
};

FUNC VOID Rtn_DEFEND_2601 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_CONVOY_01"); 
   Ta_Guard (12,00,0,00,"OCC_CONVOY_01"); 
};

FUNC VOID Rtn_Follow_2601 () 
{ 
   Ta_FollowPC (0,00,12,00,hero.wp); 
   Ta_FollowPC (12,00,0,00,hero.wp); 
};
