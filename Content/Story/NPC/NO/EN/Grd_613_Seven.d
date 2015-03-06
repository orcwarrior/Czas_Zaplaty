instance Grd_613_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Siódemka";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	6;
	id 			=	613;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 120;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;
	
	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",12,1,GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);

    	fight_tactic	=	FAI_HUMAN_RANGED;
    	

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);				
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	EquipItem	(self,ItRw_Crossbow_04);
	CreateInvItems	(self,ItAmBolt,70);

	CreateInvItem	(self,ItFoLoaf);
	CreateInvItems	(self,ItFoMutton,3);
	CreateInvItem	(self,ItFo_Potion_Water_01);
	CreateInvItem	(self,Recept_ItMw_1H_Axe_03);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_613;
};

FUNC VOID Rtn_start_613 ()
{
	TA_StandAround		(07,00,20,00,"NC_EN_MAINHALL1_09");
	TA_Sleep	(20,00,07,00,"NC_EN_BARACK_SMALLTALK");
};

FUNC VOID Rtn_wait_613 ()
{
	TA_StandAround		(07,00,20,00,"NC_EN_MAINHALL1_09");
	TA_Sleep		(20,00,22,00,"NC_EN_BARACK_SMALLTALK");
	TA_Stand		(22,00,04,00,"NC_EN_MAINHALL1_08"); 	
	TA_Sleep		(04,00,07,00,"NC_EN_BARACK_SMALLTALK");	
};

