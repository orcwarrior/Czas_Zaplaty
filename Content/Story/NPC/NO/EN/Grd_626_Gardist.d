instance Grd_626_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	22;
	voice 		=	8;
	id 			=	626;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 90;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_FatBald",10,1,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_04);
	CreateInvItem	(self,ItFo_Milk);
	CreateInvItem	(self,ItFo_Stew);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_626;
};

FUNC VOID Rtn_start_626 ()
{
	TA_Stand		(03,00,05,00,"NC_EN_PATH1_INCORNER");
	TA_Stand		(05,00,09,10,"NC_EN_MAINPATH_TO_PALISADE1");
	TA_Stand		(09,10,12,15,"NC_EN_ONGATE_FRONT");
	TA_Stand		(12,10,18,05,"NC_EN_BARACK2_04");
	TA_Stand		(18,05,00,05,"NC_EN_MAINHALL1_10");
	TA_PracticeSword	(00,05,03,00,"NC_EN_MAINHALL3_02");
};

FUNC VOID Rtn_NC1_626 () 
{
	TA_Stand(23,00,06,00,"NC_EN_PATH2_03");
	TA_Stand(06,00,23,00,"NC_EN_PATH2_03");
};



