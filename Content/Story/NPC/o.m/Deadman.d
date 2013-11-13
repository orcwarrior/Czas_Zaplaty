prototype Dead_man (C_Npc) 
{ 
   name = "Trup"; 
   npctype = npctype_main; 
   guild = GIL_NONE; 
   level = 5; 
   voice = 8; 
   id = 20100; 

   //-------- abilities -------- 
   attribute[ATR_STRENGTH] = 25; 
   attribute[ATR_DEXTERITY] = 80; 
   attribute[ATR_MANA_MAX] = 0; 
   attribute[ATR_MANA] = 0; 
   attribute[ATR_HITPOINTS_MAX]= 200; 
   attribute[ATR_HITPOINTS] = 0; 

   //-------- visuals -------- 
   // animations 
   Mdl_SetVisual (self,"HUMANS.MDS"); 
   Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
   // 						body mesh 		,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald", 1, 1, GRD_ARMOR_M); 

   B_Scale (self); 
   Mdl_SetModelFatness(self,1); 
   
   CreateInvItem (self, ItMi_Stuff_OldCoin_02);

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

   fight_tactic = FAI_HUMAN_STRONG; 

   Npc_SetTalentSkill (self,NPC_TALENT_BOW,2); 
	daily_routine = Rtn_start_20100; 
}; 

instance Dead_man1(Dead_man)
{
   id = 20100;
   daily_routine = Rtn_start_20100;
};

instance Dead_man2(Dead_man)
{
   id = 20101;
   
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald", 1, 1, ORG_ARMOR_H); 
   
   daily_routine = Rtn_start_20101;
};

instance Dead_man3(Dead_man)
{
   id = 20102;
   
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald", 1, 1, SFB_ARMOR_L); 
   
   daily_routine = Rtn_start_20102;
};

instance Dead_man4(Dead_man)
{
   id = 20103;
   
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald", 1, 1, SLD_ARMOR_M); 
   
   daily_routine = Rtn_start_20103;
};

instance Dead_man5(Dead_man)
{
   id = 20104;
   
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald", 1, 1, NOV_ARMOR_L); 
   
   daily_routine = Rtn_start_20104;
};

FUNC VOID Rtn_start_20100 () 
{ 
   Ta_Stand(0,05,12,05,"OW_PATH_1_12"); 
   Ta_Stand(12,06,0,04,"OW_PATH_1_12"); 
}; 

FUNC VOID Rtn_start_20101 () 
{ 
   Ta_Stand(0,05,12,05,"OW_PATH_1_15"); 
   Ta_Stand(12,06,0,04,"OW_PATH_1_15"); 
}; 

FUNC VOID Rtn_start_20102 () 
{ 
   Ta_Stand(0,05,12,05,"OW_PATH_1_17"); 
   Ta_Stand(12,06,0,04,"OW_PATH_1_17"); 
}; 

FUNC VOID Rtn_start_20103 () 
{ 
   Ta_Stand(0,05,12,05,"SPAWN_MOLERAT_TOTU_LEFT_PLAT4"); 
   Ta_Stand(12,06,0,04,"SPAWN_MOLERAT_TOTU_LEFT_PLAT4"); 
}; 

FUNC VOID Rtn_start_20104 () 
{ 
   Ta_Stand(0,05,12,05,"SPAWN_SCAVENGER_TOTU_LEFT_PLAT"); 
   Ta_Stand(12,06,0,04,"SPAWN_SCAVENGER_TOTU_LEFT_PLAT"); 
}; 

