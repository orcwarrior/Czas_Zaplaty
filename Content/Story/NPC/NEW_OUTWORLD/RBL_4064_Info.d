instance RBL_4064_Info (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Informator";
	npctype		=	npctype_ambient;
	guild 		=	GIL_RBL;
	level 		=	35;
	voice 		=	13;
	id 			=	4064;
	flags		= NPC_FLAG_BRAVE|NPC_FLAG_INSTANTDEATH|NPC_FLAG_KILLER;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 50;
	attribute[ATR_HITPOINTS] 	= 50;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Bald",3,2,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
			
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_02);
	CreateInvItems	(self,ItMiNugget,120);     
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4064;
	
	//------------- //MISSIONs------------------
};

FUNC VOID Rtn_start_4064 ()
{
	TA_INFO_WaitForPlayer		(06,00,14,00,"OW_PATH_1_16_8");
	TA_INFO_WaitForPlayer		(14,00,06,00,"OW_PATH_1_16_8");
};


FUNC VOID Rtn_fight_4064 ()
{
	TA_STAND	(06,00,14,00,"OW_PATH_1_16_8");
	TA_STAND		(14,00,06,00,"OW_PATH_1_16_8");
};

