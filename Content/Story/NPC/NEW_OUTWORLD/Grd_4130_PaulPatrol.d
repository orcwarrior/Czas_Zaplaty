instance Grd_4130_PaulPatrol (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		=	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	11;
	id 			=	4130;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",13,1,GRD_ARMOR_L);
        
	B_Scale (self);
   Mdl_SetModelFatness(self,2);
    	
   fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	CreateInvItems	(self,ItMiNugget,6);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItem	(self,ItFoWine);
	CreateInvItem	(self,ItLsTorch);
	        
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4130;
	senses_range = 700;
};

/***************
	Daj mu zmienn¹ rutynê
***************/

FUNC VOID Rtn_start_4130 ()
{
	TA_Stay(06,05,06,35,"PATH_OC_PSI_17");
	TA_Stay(06,36,07,04,"PATH_OC_PSI_09");
	
	TA_Stay(07,05,07,34,"PATH_OC_NC");
	TA_Stay(07,35,07,44,"OW_PATH_1_1");
	
	TA_Stay(07,45,08,35,"OW_PATH_155");
	TA_Stay(08,36,08,44,"PATH_OC_NC_24");
	
	TA_Stay(08,45,08,55,"OW_PATH_063");
	TA_Stay(08,56,09,04,"OW_PATH_158");
	
	TA_Stay(09,05,09,35,"OW_PATH_07_08");
	TA_Stay(09,36,09,45,"OW_PATH_155");
	
	TA_Stay(09,46,09,54,"OW_PATH_1_1");
	TA_Stay(09,55,10,04,"PATH_OC_PSI_09");
	
	TA_Stay(10,05,10,35,"PATH_FOGTOWER_CLIFF_01");
	TA_Stay(10,36,11,04,"PATH_OC_PSI_17");
	
	TA_Stay(11,05,11,35,"OW_PATH_155");
	TA_Stay(11,36,12,04,"OW_PATH_1");
	
	TA_Stay(12,05,12,35,"OW_PATH_1_16_1");
	TA_Stay(12,36,13,04,"OW_PATH_1");
	
	TA_Stay(13,05,13,35,"OW_PATH_158");
	TA_Stay(13,36,14,04,"PATH_OC_PSI_09");
	
	TA_Stay(14,05,14,35,"PATH_OC_PSI_17");
	TA_Stay(14,36,15,04,"PATH_OC_PSI_09");
	
	TA_Stay(15,05,15,35,"OW_PATH_158");
	TA_Stay(15,36,16,04,"PATH_OC_PSI_19");
	
	TA_Stay(16,05,16,35,"PATH_OC_PSI_17");
	TA_Stay(16,36,17,04,"PATH_OC_PSI_19");
	
	TA_Stay(17,05,17,35,"OW_PATH_055");
	TA_Stay(17,36,18,04,"PATH_OC_NC_24");
	
	TA_Stay(18,05,18,15,"OW_PATH_155");
	TA_Stay(18,16,18,25,"OW_PATH_1");
	
	TA_Stay(18,26,18,45,"OW_PATH_3_01");
	TA_Stay(18,46,19,04,"OC_ROUND_15");
	
	TA_Stay(19,05,19,35,"LOCATION_14_04");
	TA_Stay(19,36,20,04,"PATH_OC_PSI_19");

	TA_STAND	(20,05,06,04,"OCC_WELL_FRONT");	
};
