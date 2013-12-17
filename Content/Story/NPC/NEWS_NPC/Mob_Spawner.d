instance Mob_Spawner (Npc_Default) 
{ 
   //-------- primary data -------- 

   name = "Mob_Spawner"; 
   npctype = npctype_main; 
   level = 25; 
   voice = 9; 
   id = 2601; 
   flags=NPC_FLAG_FRIEND;
   spawnDelay=NPC_FLAG_BRAVE;

   //-------- abilities -------- 
   attribute[ATR_STRENGTH] = 80; 
   attribute[ATR_DEXTERITY] = 80; 
   attribute[ATR_MANA_MAX] = 0; 
   attribute[ATR_MANA] = 0; 
   attribute[ATR_HITPOINTS_MAX]= 300; 
   attribute[ATR_HITPOINTS] = 300; 

   //-------- visuals -------- 
   // animations 
   Mdl_SetVisual (self,"HUMANS.MDS"); 
   // body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
   Mdl_SetVisualBody (self,"hum_body_Naked0",1,0 ,"Hum_Head_Bald",12 ,1,PIR_ARMOR_M); 

   B_Scale (self); 
   Mdl_SetModelFatness(self,1); 

   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

   start_aistate = ZS_STAY;
};
