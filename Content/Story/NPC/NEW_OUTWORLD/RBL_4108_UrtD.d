instance RBL_4062_Urt (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Urt";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	40;
	voice 		=	11;
	id 			=	4062;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 340;
	attribute[ATR_HITPOINTS] 	= 340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",44,1,RBL_ARMOR_H);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,RBL_MW_04);
	CreateInvItems(self,ItFo_Potion_Health_03,5);
	CreateInvItems(self,ItFo_Potion_Health_02,8);

	//-------------Daily Routine-------------
	B_InitNPCAddins(self);		
	daily_routine = Rtn_Camp_4062;
};

instance RBL_4108_UrtD (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Urthos";
	npctype 	= 	npctype_main;
	guild 		=	GIL_NONE;
	level 		=	40;
	voice 		=	11;
	id 			=	4108;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120;
	attribute[ATR_DEXTERITY] 	= 100;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 440;
	attribute[ATR_HITPOINTS] 	= 440;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",44,1,EBR_ARMOR_H2);
        
   B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------  
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    

	EquipItem	(self,ItMw_1H_Sword_Bastard_05);
	CreateInvItems(self,ItFo_Potion_Health_03,5);
	CreateInvItems(self,ItFo_Potion_Health_02,8);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_4108;
};


FUNC VOID Rtn_Camp_4062 ()
{
	TA_SitCampfire	(00,00,06,00,"MIS_GRDPATROL1_3");
	TA_SitCampfire	(06,00,24,00,"MIS_GRDPATROL1_3");
};
FUNC VOID Rtn_OC1_4062 ()
{
	TA_Mis_UrtChangeArmor	(00,00,06,00,"OCR_MAINGATE_SQUARE");
	TA_Mis_UrtChangeArmor	(06,00,24,00,"OCR_MAINGATE_SQUARE");
};
FUNC VOID Rtn_OC2_4062 ()
{
	TA_Boss	(00,00,06,00,"OCR_MAINGATE_SQUARE");
	TA_Boss	(06,00,24,00,"OCR_MAINGATE_SQUARE");
};

FUNC VOID Rtn_HIDE_4062 ()
{
	TA_Boss	(00,00,06,00,"OCC_CELLAR_FIRST_ROOM");
	TA_Boss	(06,00,24,00,"OCC_CELLAR_FIRST_ROOM");
};

FUNC VOID Rtn_KELVIN_4062 ()
{
	TA_Boss	(00,00,06,00,"OCC_GUARD_ROOM_BACK2");
	TA_Boss	(06,00,24,00,"OCC_GUARD_ROOM_BACK2");
};


FUNC VOID Rtn_GONE_4062 ()
{
	TA_Boss	(00,00,06,00,"WP_INTRO_WI01");
	TA_Boss	(06,00,24,00,"WP_INTRO_WI01");
};


FUNC VOID Rtn_Start_4108 ()
{
/***********************************
Wcielenie Urta w podziemiach

*********************************/

	TA_Boss		    (07,00,20,00,"DUNG41");
	TA_Boss		    (20,00,07,00,"DUNG41");
};

