instance Grd_657_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Szynkarz";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	8;
	id 			=	657;
	
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",110,1,STT_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_657;
};

FUNC VOID Rtn_start_657 ()
{
	TA_Stand(03,00,05,00,"NC_EN_TAVERN_BAR");
	TA_Stand(05,00,03,00,"NC_EN_TAVERN_BAR");
};



