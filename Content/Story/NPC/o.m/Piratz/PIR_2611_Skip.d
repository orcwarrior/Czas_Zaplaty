instance PIR_2611_Skip (Npc_Default) 
{ 
   //-------- primary data -------- 

   name = "Skip"; 
   npctype = npctype_main; 
   guild = GIL_NONE; 
   level = 5; 
   voice = 8; 
   id = 2611; 

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
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald",119 ,2,PIR_ARMOR_L); 

   B_Scale (self); 
   Mdl_SetModelFatness(self,1); 

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

   fight_tactic = FAI_HUMAN_STRONG; 

   //-------- Talente -------- 
     
   Npc_SetTalentSkill (self,NPC_TALENT_BOW,2); 

   //-------- inventory -------- 
   CreateInvItems (self,ItMi_Stuff_OldCoin_02,2); 
   CreateInvItem (self,ItFoMutton); 
    
   CreateInvItems (self,ItFo_Potion_Health_01,1); 

   //-------------Daily Routine------------- 
/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2611; 
}; 

FUNC VOID Rtn_start_2611 () 
{ 
Ta_Stand (0,05,12,05,"PL_DEAD"); 
Ta_Stand (12,06,0,04,"PL_DEAD"); 
}; 

