instance STT_344_Warrior (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Trupismród";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice		=	5;
	id 			=	344;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 15;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 260;
	attribute[ATR_HITPOINTS] 	= 260;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_FatBald",5,1,GRD_ARMOR_H);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,50);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_344;
};

FUNC VOID Rtn_start_344 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_31");
	TA_SmallTalk  (07,45,10,00,"OCR_ARENABATTLE_OUTSIDE");	
	TA_StandAround  (10,00,11,05,"OCR_ARENABATTLE_OUTSIDE");	
	TA_Smith_Sharp	(11,05,12,35,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire	(12,35,23,45,"OCR_ARENABATTLE_OUTSIDE");
};
