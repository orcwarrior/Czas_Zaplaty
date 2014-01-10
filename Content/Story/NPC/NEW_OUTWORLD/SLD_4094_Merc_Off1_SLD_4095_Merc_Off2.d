/********************

Ork to s? najemnicy,kt?rzy oebjm? dow?dztwo w 2 zdobytych przyczu?kach.
**********************/

instance SLD_4094_Merc_Off1 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dowódca najemnik?w";
	npctype 	= 	npctype_main;
	guild 		=	GIL_MTR;
	level 		=	50;
	voice 		=	11;
	id 			=	4094;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",27,1,GRD_ARMOR_M);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_02U);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4094;
};

FUNC VOID Rtn_Start_4094 ()
{
	TA_Stay		    (07,00,20,00,"WP");
	TA_Stay		    (20,00,07,00,"WP");
};

FUNC VOID Rtn_Fallow_4094 ()
{
	TA_Stay		    (07,00,20,00,"WP");
	TA_Stay		    (20,00,07,00,"WP");
};

FUNC VOID Rtn_NC1_4094 ()
{
	TA_Boss		    (07,00,20,00,"NC_LO_09");
	TA_Boss		    (20,00,07,00,"NC_LO_09");
};

FUNC VOID Rtn_NC2_4094 ()
{
	TA_Boss		    (07,00,20,00,"NC_LO_09");
	TA_Boss		    (20,00,07,00,"NC_LO_09");
};

FUNC VOID Rtn_NC3_4094 ()
{
	TA_Boss		    (07,00,20,00,"OC_ROUND_25");
	TA_Boss		    (20,00,07,00,"OC_ROUND_25");
};


instance SLD_4095_Merc_Off2 (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dowódca najemnik?w";
	npctype 	= 	npctype_main;
	guild 		=	GIL_MTR;
	level 		=	50;
	voice 		=	11;
	id 			=	4095;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",27,1,GRD_ARMOR_M);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	Mdl_SetModelScale(self,1.0,1.0,1.0);

	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,GRD_MW_02U);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4095;
};

FUNC VOID Rtn_Start_4095 ()
{
	TA_Stay		    (07,00,20,00,"WP");
	TA_Stay		    (20,00,07,00,"WP");
};

FUNC VOID Rtn_Fallow_4095 ()
{
	TA_Stay		    (07,00,20,00,"WP");
	TA_Stay		    (20,00,07,00,"WP");
};

FUNC VOID Rtn_NC1_4095 ()
{
	TA_Boss		    (07,00,20,00,"NC_TAVERN_TOP03");
	TA_Boss		    (20,00,07,00,"NC_TAVERN_TOP03");
};

FUNC VOID Rtn_NC2_4095 ()
{
	TA_Boss		    (07,00,20,00,"NC_TAVERN_TOP03");
	TA_Boss		    (20,00,07,00,"NC_TAVERN_TOP03");
};

FUNC VOID Rtn_NC3_4095 ()
{
	TA_Boss		    (07,00,20,00,"SPAWN_OW_STARTSCAVENGER_02_01");
	TA_Boss		    (20,00,07,00,"SPAWN_OW_STARTSCAVENGER_02_01");
};
