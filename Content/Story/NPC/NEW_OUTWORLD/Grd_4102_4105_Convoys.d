
instance Grd_4102_Convoy (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Dowódca konwoju";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	25;
	voice 		=	11;
	id 			=	4102;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 420;
	attribute[ATR_HITPOINTS] 	= 420;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",15,2,GRD_ARMOR_H);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,0);
    	
   Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
   fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_04);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,120);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4102;
};

FUNC VOID Rtn_start_4102 ()
{
   TA_Boss		(06,00,21,00,"OW_PATH_168");
   TA_Boss		(21,00,06,00,"OW_PATH_168");	
};

instance Grd_4103_Convoy (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Konwojent";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	11;
	id 			=	4103;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",34,2,GRD_ARMOR_M);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4103;
};

FUNC VOID Rtn_start_4103 ()
{
   TA_SmallTalk		(06,00,21,00,"OW_PATH_169");
   TA_SmallTalk		(21,00,06,00,"OW_PATH_169");	
};

instance Grd_4104_Convoy (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Konwojent";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	11;
	id 			=	4104;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",19,2,GRD_ARMOR_M);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4104;
};

FUNC VOID Rtn_start_4104 ()
{
   TA_SmallTalk		(06,00,21,00,"OW_PATH_169");
   TA_SmallTalk		(21,00,06,00,"OW_PATH_169");	
};

instance Grd_4105_Convoy (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Konwojent";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	11;
	id 			=	4105;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 100;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Fighter",45,2,GRD_ARMOR_M);
        
        	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,30);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_4105;
};

FUNC VOID Rtn_start_4105 ()
{
   TA_Guard(06,00,21,00,"OW_PATH_170");
   TA_Guard(21,00,06,00,"OW_PATH_170");	
};
