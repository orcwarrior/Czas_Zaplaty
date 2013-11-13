instance RBL_581_Snaf (Npc_Default)
{
	//-------- primary data --------
	name =							"Snaf";
	npctype =						npctype_Main;
	guild =							GIL_RBL;
	level =							17;
	
	
	voice =							1;
	id =							581;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		65;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	200;
	attribute[ATR_HITPOINTS] =		200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//							Body-Mesh				Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,"Hum_Body_CookSmith",0,1,"Hum_Head_Fighter",81,1,-1);
        
	B_Scale (self);
	Mdl_SetModelFatness(self,2);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente -------- 
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,1);		
	Npc_SetTalentSkill	(self,HACK_NPC_TALENT_SNEAK,1);			
			
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	15;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	5;	
	//-------- inventory --------
	
	EquipItem	(self,HUN_MW_04);
	CreateInvItem	(self,ItMi_Stuff_Cup_01);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_581;
};

FUNC VOID Rtn_start_581 ()
{
    TA_Cook		(08,01,09,00,"OW_CAVE2_SNAPPER_MOVEMENT6");
	TA_Stand	(09,01,10,00,"OW_CAVE2_SNAPPER_MOVEMENT2");
    TA_Cook		(10,01,11,00,"OW_CAVE2_SNAPPER_MOVEMENT6");
	TA_Stand	(11,01,12,00,"OW_CAVE2_SNAPPER_MOVEMENT2");
	TA_Cook		(12,01,13,00,"OW_CAVE2_SNAPPER_MOVEMENT6");
	TA_Stand	(13,01,14,00,"OW_CAVE2_SNAPPER_MOVEMENT2");
    TA_Cook		(14,01,15,00,"OW_CAVE2_SNAPPER_MOVEMENT6");
	TA_Stand	(15,01,16,00,"OW_CAVE2_SNAPPER_MOVEMENT2");
    TA_Cook		(16,01,17,00,"OW_CAVE2_SNAPPER_MOVEMENT6");
	TA_Stand	(17,01,18,00,"OW_CAVE2_SNAPPER_MOVEMENT2");		
    TA_SitAround(18,01,20,00,"OW_CAVE2_SNAPPER_MOVEMENT6");		
    TA_Cook		(21,01,23,00,"OW_CAVE2_SNAPPER_MOVEMENT6");		
    TA_SitAround(23,01,08,00,"OW_CAVE2_SNAPPER_MOVEMENT6");		
    
};
FUNC VOID Rtn_Scared_581 ()
{
	TA_Stay			(06,00,08,00,"OW_CAVE2_SNAPPER_SPAWN");	
	TA_Stay			(08,00,06,00,"OW_CAVE2_SNAPPER_SPAWN");	
};

FUNC VOID Rtn_TEST_581 ()
{
	TA_Stay			(06,00,08,00,"LOCATION_01_01");	
	TA_Stay			(08,00,06,00,"LOCATION_01_01");	
};
