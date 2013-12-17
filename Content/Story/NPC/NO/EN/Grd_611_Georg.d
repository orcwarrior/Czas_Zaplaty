instance Grd_611_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Georg";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	35;
	voice 		=	6;
	id 			=	611;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 520;
	attribute[ATR_HITPOINTS] 	= 520;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",16,1,GRD_ARMOR_H);
	
	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	EquipItem	(self,GRD_RW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_prestart_611;
};
FUNC VOID Rtn_prestart_611 ()
{
	TA_Guard		(07,00,20,00,"NC_EN_TAVERN_ONFRONT");
	TA_Guard	(20,00,07,00,"NC_EN_TAVERN_ONFRONT");
};

FUNC VOID Rtn_start_611 ()
{
	TA_Guard		(07,00,20,00,"NC_EN_TAVERN_03");
	TA_Guard		(20,00,07,00,"NC_EN_TAVERN_03");
};


