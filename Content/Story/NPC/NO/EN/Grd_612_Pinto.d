instance Grd_612_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Pinto";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	25;
	voice 		=	6;
	id 			=	612;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 380;
	attribute[ATR_HITPOINTS] 	= 380;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",10,1,GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_612;
};

FUNC VOID Rtn_start_612 ()
{
	TA_Boss		(06,00,23,00,"NC_EN_ONGATE_BACK");
	TA_Sleep	(23,00,06,00,"NC_EN_BARACK_SMALLTALK");
};


FUNC VOID Rtn_prestart_612 ()
{
	TA_Smalltalk		(07,00,23,00,"NC_EN_PATH1_01");
	TA_Smalltalk	(23,00,07,00,"NC_EN_PATH1_01");
};

FUNC VOID Rtn_fight_612 ()
{
	TA_Boss		(07,00,23,00,"NC_EN_MAINPATH_04");
	TA_Boss		(23,00,07,00,"NC_EN_MAINPATH_04");
};

FUNC VOID Rtn_wait_612 ()
{
	TA_Boss		(06,00,22,00,"NC_EN_ONGATE_BACK");
	TA_Stand		(22,00,04,00,"NC_EN_MAINHALL1_02");
	TA_Sleep	(04,00,06,00,"NC_EN_BARACK_SMALLTALK");
};