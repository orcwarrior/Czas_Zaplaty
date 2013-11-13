instance GRD_900_Scatty (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Scatty";
	npctype 	= 	npctype_ambient;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	1;
	id 			=	900;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,2,GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	EquipItem	(self,GRD_RW_02);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoRice);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoBooze);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,112);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_900;
	
};

FUNC VOID Rtn_start_900 ()
{
	TA_Boss			(07,00,20,00,"NC_RICELORD");
	TA_SitAround	(20,00,24,00,"NC_RICELORD_SIT");
	TA_Sleep		(24,00,07,00,"NC_RICEBUNKER_10");
};


FUNC VOID Rtn_NC1_900 ()
{
	TA_Boss			(07,00,20,00,"NC_WATERFALL_TOP0");
	TA_Boss			(20,00,07,00,"NC_WATERFALL_TOP0");

};







