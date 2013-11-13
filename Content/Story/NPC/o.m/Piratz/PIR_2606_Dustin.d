instance PIR_2606_Dustin (Npc_Default) 
{ 
//-------- primary data -------- 

name = "Dustin"; 
npctype = npctype_main; 
guild = GIL_PIR; 
level = 5; 
voice = 2; 
id = 2606; 

//-------- abilities -------- 
attribute[ATR_STRENGTH] = 40; 
attribute[ATR_DEXTERITY] = 30; 
attribute[ATR_MANA_MAX] = 0; 
attribute[ATR_MANA] = 0; 
attribute[ATR_HITPOINTS_MAX]= 200; 
attribute[ATR_HITPOINTS] = 0; 

//-------- visuals -------- 
// animations 
Mdl_SetVisual (self,"HUMANS.MDS"); 
Mdl_ApplyOverlayMds (self,"Humans_Militia.mds"); 
// body mesh ,bdytex,skin,head mesh ,headtex,teethtex,ruestung 
Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Thief",87,3,PIR_ARMOR_M);  

B_Scale (self); 
Mdl_SetModelFatness(self,1); 

//Npc_SetAivar(self,AIV_IMPORTANT,  TRUE); 

fight_tactic = FAI_HUMAN_STRONG; 

//-------- Talente -------- 

Npc_SetTalentSkill (self,NPC_TALENT_1H,1);  


//-------- inventory -------- 

CreateInvItem (self,ItFoBeer); 
CreateInvItems (self,ItMi_Stuff_OldCoin_02,4); 
CreateInvItem (self,package2); 
CreateInvItem (self,ItLsTorch); 

/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2606; 
}; 

FUNC VOID Rtn_start_2606 () 
{ 
Ta_Stand (0,05,12,05,"LOCATION_26_01_2"); 
Ta_Stand (12,06,0,04,"LOCATION_26_01_2"); 
}; 


