instance STT_345_Warrior (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ares";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	19;
	voice		=	5;
	id 			=	345;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",71,1,GRD_ARMOR_H);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,100);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_345;
};

FUNC VOID Rtn_start_345 ()
{
	TA_Sleep		(23,45,07,45,"OCR_HUT_32");
	TA_SmallTalk  (07,45,10,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_PracticeSword(10,00,14,05,"OCR_ARENABATTLE");
	TA_Smith_Sharp	(14,05,16,05,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire	(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
};
