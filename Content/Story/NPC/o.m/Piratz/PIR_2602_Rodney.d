instance PIR_2602_Rodney (Npc_Default) 
{ 
//-------- primary data -------- 

name = "Rodney"; 
npctype = npctype_main; 
guild = GIL_PIR; 
level = 20; 
voice = 8; 
id = 2602; 
flags=NPC_FLAG_FRIEND;
spawnDelay=NPC_FLAG_BRAVE;

//-------- abilities -------- 
attribute[ATR_STRENGTH] = 70; 
attribute[ATR_DEXTERITY] = 80; 
attribute[ATR_MANA_MAX] = 100; 
attribute[ATR_MANA] = 100; 
attribute[ATR_HITPOINTS_MAX]= 400; 
attribute[ATR_HITPOINTS] = 400; 

//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0",1,3 ,"Hum_Head_Bald",5 ,2,PIR_ARMOR_L); 

B_Scale (self); 
Mdl_SetModelFatness(self,1); 

Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

    	fight_tactic	=	FAI_HUMAN_MASTER; 

//-------- Talente -------- 

Npc_SetTalentSkill (self,NPC_TALENT_1H,2);  
Npc_SetTalentSkill (self,NPC_TALENT_2H,1); 
Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
Npc_SetTalentValue(self,NPC_TALENT_1H,70);
Npc_SetTalentValue(self,NPC_TALENT_BOW,60);

	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_MAGE,6);			
	Npc_SetAivar(self,TALENT_MAGIC_CIRCLE,  (		6));
//-------- inventory -------- 

CreateInvItem (self,ItMw_Pir_01); 
CreateInvItem (self,ItFoMutton); 
CreateInvItems (self,ItFo_Potion_Health_01,5); 
CreateInvItem (self,ItLsTorch); 

//-------------Daily Routine------------- 
/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2602; 
}; 
FUNC VOID Rtn_InHC_2602 () 
{ 
	Ta_SitCampfire 			(00,00,05,30,"OW_LOCATION_21_IN"); 
	TA_Stand 				(09,30,12,00,"WATCH_BUTH");//
	Ta_SitCampfireEat 		(12,00,14,00,"SPAWN_TALL_PATH_BANDITOS_02_03");
	Ta_SitCampfireSmallTalk (14,00,15,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Angus 
	Ta_SitCampfireSmallTalk (15,00,16,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Hank
	Ta_WashSelf 			(16,00,16,30,"SPAWN_OW_BLOODFLY_12");
	Ta_SitAround			(16,30,20,30,"SIT_AROUND_BUTH");
	TA_Smalltalk			(20,30,00,00,"HC_BRIDGE");//Milten    
}; 
FUNC VOID Rtn_start_2602 () 
{ 
	Ta_SitCampfire (0,00,12,00,"OW_PIR_CAMPFIRE"); 
	Ta_SitCampfire (12,00,0,00,"OW_PIR_CAMPFIRE"); 
}; 
FUNC VOID Rtn_BeingMage_2602 () 
{ 
	Ta_Mis_RodneyAtLeren (0,00,12,00,"TALK_MAGES"); 
	Ta_Mis_RodneyAtLeren (12,00,0,00,"TALK_MAGES"); 
}; 
FUNC VOID Rtn_Mage_2602 () 
{ 
	TA_SmallTalk 				(22,00,00,00,"TALK_MAGES");//Leren 
	Ta_PracticeMagic		(00,00,05,30,"OW_LOCATION_21_IN"); 
	TA_Stand 				(09,30,12,00,"WATCH_BUTH");//
	Ta_SitCampfireEat 		(12,00,14,00,"SPAWN_TALL_PATH_BANDITOS_02_03");
	Ta_SitCampfireSmallTalk (14,00,15,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Angus 
	Ta_SitCampfireSmallTalk (15,00,16,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); //Hank
	Ta_WashSelf 			(16,00,16,30,"SPAWN_OW_BLOODFLY_12");
	Ta_SitAround			(16,30,20,30,"SIT_AROUND_BUTH");
	TA_Smalltalk			(20,30,22,00,"HC_BRIDGE");//Milten    
}; 
FUNC VOID Rtn_check_2602 () 
{ 
TA_FollowAngus (0,00,12,00,"OW_PATH_167"); 
TA_FollowAngus (12,00,0,00,"OW_PATH_167"); 
}; 

FUNC VOID Rtn_FOLLOWALLIGATOR_2602 () 
{ 
TA_FollowPC (0,00,12,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
TA_FollowPC (12,00,0,00,"SPAWN_TALL_PATH_BANDITOS_02_04"); 
};  
FUNC VOID Rtn_WaitTony_2602 () 
{ 
TA_Stay(0,00,12,00,"OW_PATH_166"); 
TA_Stay (12,00,0,00,"OW_PATH_166"); 
}; 
FUNC VOID Rtn_FOLPC2HUN_2602 () 
{ 
TA_FollowPC (0,00,12,00,"PATH_OC_NC_3"); 
TA_FollowPC (12,00,0,00,"PATH_OC_NC_3"); 
}; 
FUNC VOID Rtn_RICKHELP_2602 () 
{ 
TA_FollowPC (0,00,12,00,"PATH_CASTLE_TO_WATERFALL"); 
TA_FollowPC (12,00,0,00,"PATH_CASTLE_TO_WATERFALL"); 
}; 
FUNC VOID Rtn_Alarm_2602 ()
{
//	 TA_KillingGRDs(08,00,07,59,"OR_STAIRS1_03"); 
	 TA_KillingGRDs(08,00,07,59,"HC_RANGED4");
};

FUNC VOID Rtn_Challenge_2602 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_A");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_A");
};
Func Void Rtn_Fan_2602 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};	

FUNC VOID Rtn_PatrolTrap_2602 () 
{ 
TA_STAND(0,00,12,00,"LOCATION_15_IN_2"); 
TA_STAND (12,00,0,00,"LOCATION_15_IN_2"); 
}; 

FUNC VOID Rtn_TRAP_2602 () 
{ 
   Ta_Guard (0,00,12,00,"HIDDEOUT12"); 
   Ta_Guard (12,00,0,00,"HIDDEOUT12"); 
};

FUNC VOID Rtn_DEFEND_2602 () 
{ 
   Ta_Guard (0,00,12,00,"OCC_CENTER_4_PATH2"); 
   Ta_Guard (12,00,0,00,"OCC_CENTER_4_PATH2"); 
};

FUNC VOID Rtn_Follow_2602 () 
{ 
   Ta_FollowPC (0,00,12,00,hero.wp); 
   Ta_FollowPC (12,00,0,00,hero.wp); 
};