instance Grd_4126_Kraken (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Kraken";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	25;
	voice		=	6;
	id 			=	4126;	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 90;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 290;
	attribute[ATR_HITPOINTS] 	= 290;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",27,1,GRD_ARMOR_M);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,0);
   
   fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02U);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_4126;
	Npc_SetPermAttitude(self,ATT_ANGRY);
};

FUNC VOID Rtn_start_4126 ()
{
   TA_STANDAROUND(06,00,12,00,"OW_PATH_1_16_8");	
	TA_PracticeSword(12,00,16,00,"OW_PATH_1_16_8");	
	TA_SMOKE(16,00,20,00,"OW_PATH_1_16_8");		
	TA_PracticeSword(20,00,00,00,"OW_PATH_1_16_8");	
	TA_SITAROUND(00,00,06,00,"OW_PATH_1_16_8");	
};

FUNC VOID Rtn_OC_4126 ()
{
	TA_SMOKE(16,00,20,00,"NC_WATERFALL_TOP01_MOVEMENT");		
	TA_PracticeSword(20,00,16,00,"NC_WATERFALL_TOP01_MOVEMENT");	
};
