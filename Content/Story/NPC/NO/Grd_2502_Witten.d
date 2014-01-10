instance GRD_2502_Witten (Npc_Default)
{
	//tak samo jak z Kerestelem musisz wszystko zobaczy? czy jest dobrze ;)

	//-------- primary data --------
	
	name 		=	"Witten";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	8;
	id 			=	2502;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60; 
	attribute[ATR_DEXTERITY] 	= 40; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    
	attribute[ATR_HITPOINTS_MAX]=	self.level*12+90;    

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald",113,1,GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	//pousuwalem kusze bo zaczynal nas atakowac z kuszy
	//EquipItem	(self,ItRw_Crossbow_01);
	
	//CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,WittenRing);
	CreateInvItems	(self,ItMinugget,50);
	
	CreateInvItems	(self,ItMiJoint_1,5);
	CreateInvItems	(self,ItMiJoint_2,5);
	CreateInvItems	(self,ItMiJoint_3,5);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,2);
	CreateInvItems	(self,ItFo_Potion_Health_02,2);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_2502;
};

FUNC VOID Rtn_start_2502 ()
{
	TA_SitAround	(00,00,20,00,"OC1");
};
