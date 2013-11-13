instance Grd_610_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kris";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	40;
	voice 		=	7;
	id 			=	610;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 450;
	attribute[ATR_HITPOINTS] 	= 450;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,1,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_Master;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_610;
};

FUNC VOID Rtn_start_610 ()
{
	TA_Boss		(07,00,20,00,"NC_EN_PATH1_01");
	TA_Boss		(20,00,07,00,"NC_EN_PATH1_01");
};

FUNC VOID Rtn_prestart_610 ()
{
	TA_Smalltalk		(07,00,20,00,"NC_EN_MAINPATH_02");
	TA_Smalltalk		(20,00,07,00,"NC_EN_MAINPATH_02");
};

