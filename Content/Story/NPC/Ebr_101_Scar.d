instance EBR_101_Scar (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Blizna";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	80;
	voice 		=	8;
	id 			=	101;


	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 224;
	attribute[ATR_DEXTERITY] 	= 55;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",79,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Scars_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItRw_Crossbow_04);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_101;
};

FUNC VOID Rtn_start_101 ()
{
	TA_Sleep			(02,10,07,40,"OCC_BARONS_UPPER_RIGHT_ROOM_BED3");
	TA_Smalltalk		(07,40,21,05,"OCC_BARONS_GREATHALL_CENTER_FRONT");
	TA_StandAround		(21,05,02,10,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT2");
};

FUNC VOID Rtn_OT_101 ()
{
	TA_Guard		    (07,00,20,00,"OCC_MERCS_HALLWAY_MIDDLE");
	TA_Guard		    (20,00,07,00,"OCC_MERCS_HALLWAY_MIDDLE");
};

instance EBR_101_ScarD (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Blizna";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	80;
	voice 		=	8;
	id 			=	5556;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 224;
	attribute[ATR_DEXTERITY] 	= 55;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 500;
	attribute[ATR_HITPOINTS] 	= 500;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",79,1,EBR_ARMOR_H2);
        
    	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	CreateInvItem(self,Scars_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItRw_Crossbow_04);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_GRD_5556;
};

FUNC VOID Rtn_GRD_5556 ()
{
	TA_HostileGuard(07,00,20,00,"DUNG39");
	TA_HostileGuard(20,00,07,00,"DUNG39");
};