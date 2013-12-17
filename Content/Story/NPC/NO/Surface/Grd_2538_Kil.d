instance Grd_2538_Kil (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Kil";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	22;
	voice 		=	13;
	id 			=	2538;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 120; 
	attribute[ATR_DEXTERITY] 	= 60; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Fatbald",4,1,GRD_ARMOR_H);
        
   B_Scale (self);
   Mdl_SetModelFatness(self,1);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_03);
	EquipItem	(self,GRD_RW_02);
	
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMinugget,10);
	
	CreateInvItems	(self,ItMiJoint_1,2);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,2);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_MASTER;	
	
	daily_routine	=	Rtn_start_2538;
};

FUNC VOID Rtn_start_2538 ()
{
	TA_Guard (08,00,20,00,"NC_PATH_JARVIS");
	TA_Guard (20,00,08,00,"NC_PATH_JARVIS");
};

