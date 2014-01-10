instance XTESTBABE (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Babka";
	Npctype =				Npctype_Main;
	guild =					GIL_RBL;      
	level =					18;
	
	voice =					16;
	id =					26404;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		40;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	self.level*12;
	attribute[ATR_HITPOINTS] =		self.level*12;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Babe.mds"); 	

	//				body mesh,head mesh,hairmesh,face-tex,hair-tex,skin	
	Mdl_SetVisualBody (self,"HUM_BODY_BABE0",1,1 ,"BAB_HEAD_HAIR1",454 ,2,BAB_ARMOR_VLK1);
		//Mdl_SetVisualBody (self,"hum_body_Naked0",1,1 ,"Hum_Head_Psionic",24 ,2,NOV_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self,0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	EquipItem 	(self,RBL_MW_02);
	EquipItem (self,RBL_RW_01);	                                 
	CreateInvItems (self,ItKeLockpick,2);		
	CreateInvItems(self,ItMiNugget,13);
	CreateInvItems (self,ItFoRice,7);
	CreateInvItems (self,ItFoBooze,3);
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItMi_Stuff_Barbknife_01);
	CreateInvItem (self,ItMi_Stuff_Cup_01);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,ItFoBooze);
	CreateInvItems (self,ItAmArrow,20);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_26404;
};

FUNC VOID Rtn_start_26404 ()
{
Ta_SitCampfireSmallTalk (0,00,12,00,"OW_HUN_SMALLCAMP"); 
Ta_SitCampfireSmallTalk (12,00,0,00,"OW_HUN_SMALLCAMP"); 
};
instance SLV_011_BarrelSlave (Npc_Default)
{
	//-------- primary data --------
	name 		=		"BarrelSlave";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_SLV;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		11;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Fighter",0,2,-1);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_11;
};

FUNC VOID Rtn_start_11 ()
{
	TA_TakeBarrel 		(12,01,12,05,"B4");    
    TA_BarrelTransport  (12,06,12,25,"F");    
	TA_SitCampfire 			(12,26,12,45,"B3");    
	TA_SitCampfire 			(12,46,12,00,"B3");    

};
instance SLV_012_Sleep (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Sleepy Man";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_SLV;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		11;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"HUM_BODY_NAKED0",3,1,"Hum_Head_Fighter",106,2,-1);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_12;
};

FUNC VOID Rtn_start_12 ()
{
//	TA_TakeBarrel 		(12,02,12,06,"B4");    
 //   TA_BarrelTransport  (12,07,12,26,"F");    
	TA_SlaveRest		(12,02,18,00,"xxx");    
	TA_SlaveRest 			(18,00,12,01,"xxx");    

};
instance SLV_22_AppearTest (Npc_Default)
{
	//-------- primary data --------
	name 		=		"AppearTest";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_SLV;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		22;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",2,2,-1);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	CreateInvItems	(self,ItMwPickAxe,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_22;
};

FUNC VOID Rtn_start_22 ()
{
    TA_Stand             	(00,01,12,03,"B");    
    TA_Stand             	(12,03,00,00,"F");    

};
instance SLV_23_PickStones_WALL_Tester (Npc_Default)
{
	//-------- primary data --------
	name 		=		"PickStones_WALL_Tester";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_SLV;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		23;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",2,2,-1);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_23;
};

FUNC VOID Rtn_start_23 ()
{
    TA_PickStonesWall      	(00,01,12,03,"xxx");    
    TA_PickStonesWall      	(12,03,00,00,"xxx");    

};

instance SLV_24_PickStones_GROUND_Tester (Npc_Default)
{
	//-------- primary data --------
	name 		=		"PickStones_GROUND_Tester";
	npctype 	=		NPCTYPE_MAIN;
	guild 		=		GIL_SLV;
	level 		=		15;
	
	
	voice 		=		11;
	id 			=		24;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=		90;
	attribute[ATR_DEXTERITY] 		=		20;
	attribute[ATR_MANA_MAX] 		=		0;
	attribute[ATR_MANA] 			=		0;
	attribute[ATR_HITPOINTS_MAX] 	=		self.level*12;
	attribute[ATR_HITPOINTS] 		=		self.level*12;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",2,2,-1);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	//Npc_SetTalentSkill (self,NPC_TALENT_BOW,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);	
	Npc_SetTalentValue(self,NPC_TALENT_2H,85); 		
		
	//-------- inventory --------
	CreateInvItems	(self,Itfobeer,2);
	CreateInvItems	(self,ItKeLockpick,1);
	CreateInvItems	(self,ItMiNugget,76);
	
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_24;
};

FUNC VOID Rtn_start_24 ()
{
    TA_PickStonesGround      	(00,01,12,03,"xxx");    
    TA_PickStonesGround      	(12,03,00,00,"xxx");    

};


instance CollideTest (Npc_Default)
{
	//-------- primary data --------
	name =							"CollideTest";
	npctype =						npctype_main;
	guild =							GIL_GRD;
	level =							22;
	
	
	voice =							8;
	id =							406;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		25;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	1124;
	attribute[ATR_HITPOINTS] =		1124;
    protection[PROT_EDGE]	=		10;
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",10,1,"Hum_Head_Bald",66,1,HUN_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	
	//-------- inventory --------
	EquipItem (self,HUN_MW_03);	
	CreateInvItem (self,ItFoSoup);
	CreateInvItem (self,ItMiJoint_1);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_banned_14221;
};
FUNC VOID Rtn_banned_14221 ()
{
    TA_PickStonesGround      	(00,01,12,03,"xxx");    
    TA_PickStonesGround      	(12,03,00,00,"xxx");    

};
