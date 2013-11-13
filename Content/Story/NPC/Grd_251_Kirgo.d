instance GRD_251_Kirgo (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kirgo";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	17;
	voice		=	5;
	id 			=	251;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 45;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= self.level*12+90;
	attribute[ATR_HITPOINTS] 	= self.level*12+90;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald",2,1,GRD_ARMOR_M);
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_251;
};

FUNC VOID Rtn_start_251 ()
{
// 	TA_Sleep		(23,45,07,45,"OCR_HUT_21");
// 	TA_StandAround  (07,45,10,00,"OCR_ARENABATTLE_OUTSIDE");
// 	TA_PracticeSword(10,00,14,05,"OCR_ARENABATTLE");
// 	TA_Smith_Sharp	(14,05,17,15,"OCR_ARENABATTLE_OUTSIDE");
// 	TA_SitCampfire	(17,15,23,45,"OCR_ARENABATTLE_OUTSIDE");
	TA_Sleep		(23,55,07,45,"NC_HUT07_IN");
	TA_SitAround  	(07,45,10,00,"NC_TAVERN_LEFT");
	TA_SmallTalk	(10,00,14,05,"NC_PATH67"); //Arena Fighter
	TA_SitAround	(14,05,23,55,"NC_TAVERN_LEFT"); 
};

func VOID Rtn_Guide_251 ()
{
	TA_GuidePC (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};

FUNC VOID Rtn_NC1_251 ()
{
    TA_Guard		(06,00,21,00,"FMC_ENTRANCE");
    TA_Guard		(21,00,06,00,"FMC_ENTRANCE");			
};

FUNC VOID Rtn_FOLLOW_251 () 
{ 
   TA_FollowPC (0,00,12,00,"FP_ROAM_OW_SNAPPER_OW_ORC"); 
   TA_FollowPC (12,00,0,00,"FP_ROAM_OW_SNAPPER_OW_ORC"); 
}; 

FUNC VOID Rtn_OC_251 ()
{
	TA_SitAround	(00,00,07,00,"OCR_ARENABATTLE_BENCH");
	TA_Smalltalk	(07,00,10,00,"OCR_SMALLTALK_A_OC_ARENA");
	TA_Stand		(10,00,16,00,"OCR_STAND_WETT");
	TA_SitAround	(16,00,20,00,"OCR_ARENABATTLE_BENCH");
   TA_Stand		(20,00,00,00,"OCR_STAND_WETT");
};

FUNC VOID Rtn_WAIT_251 ()
{
    TA_Guard		(06,00,21,00,"OC_ROUND_12");
    TA_Guard		(21,00,06,00,"OC_ROUND_12");			
};