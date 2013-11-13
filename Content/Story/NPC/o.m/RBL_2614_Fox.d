instance RBL_2614_Fox (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fox";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_RBL;
	level 		=		22;
	
	
	voice 		=		10;
	id 			=		2614;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		110;
	attribute[ATR_DEXTERITY] 		=		80;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",5,2,RBL_ARMOR_H);
        
    B_Scale (self);
	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
Npc_SetTalentValue(self,NPC_TALENT_2H,55); 		
		
	//-------- inventory --------
	CreateInvItem	(self,ItKeCavalorn01);	
	EquipItem	(self,RBL_MW_04);
	EquipItem	(self,HUN_RW_03);
	CreateInvItems	(self,ItAmArrow,10);
	CreateInvItems	(self,ItMiNugget,41);
	CreateInvItem (self,ItFoSoup);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_2614;
};

FUNC VOID Rtn_start_2614 ()
{
    TA_Smoke          	(21,00,23,00,"SIT_IDDYLLUS");	
    TA_Smalltalk     	(23,00,03,00,"ZEX_STAND");//Vam  
    TA_Smoke          	(03,00,06,20,"SIT_IDDYLLUS");	      
    TA_Boss	            (06,20,12,30,"MAGAZINE_LOL_FOX");
    TA_SitAround        (12,30,21,00,"OW_SAWHUT_MOLERAT_SPAWN01");
    
};

FUNC VOID Rtn_PREPARATION_2614 ()
{
    TA_Smoke          	(21,30,23,00,"SIT_IDDYLLUS");	
    TA_Smalltalk     	(23,00,03,00,"ZEX_STAND");//Vam  
    TA_Smoke          	(03,00,06,20,"SIT_IDDYLLUS");	      
    TA_Boss	            (06,20,12,30,"MAGAZINE_LOL_FOX");
    TA_PRACTICESWORD    (12,30,18,30,"MAGAZINE_LOL_FOX");
    TA_SitAround        (18,30,20,00,"OW_SAWHUT_MOLERAT_SPAWN01");
    TA_PRACTICESWORD    (20,00,21,30,"MAGAZINE_LOL_FOX");
   
};
FUNC VOID Rtn_Challenge_2614 ()
{	
	
	TA_KillingGRDs (18,00,19,00,"OM_CHALLENGE_TEAM_B");
	TA_KillingGRDs (19,00,18,00,"OM_CHALLENGE_TEAM_B");
};
Func Void Rtn_Fan_2614 ()
{
	 TA_ChallengeFans(08,00,07,59,"OM_FAN_3"); 
};		
Func Void Rtn_Alarm_2614 ()
{
	 TA_KillingGRDs(08,00,07,59,"HC_WARRIOR20"); 
	 
};

FUNC VOID Rtn_mourder_2614 ()
{
Ta_Stand (0,00,12,00,"FOX_M"); 
Ta_Stand (12,00,0,00,"FOX_M"); 
};