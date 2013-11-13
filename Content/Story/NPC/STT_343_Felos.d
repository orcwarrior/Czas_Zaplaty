instance STT_343_Felos (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Felos";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice		=	5;
	id 			=	343;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",8,1,GRD_ARMOR_M);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_343;
};

FUNC VOID Rtn_start_343 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_21");
	TA_StandAround  (07,45,10,00,"OCR_HUT_21");
	TA_PracticeSword(10,00,16,05,"OCR_ARENABATTLE");
	TA_Smith_Sharp	(16,05,17,15,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire	(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};
