instance Grd_20272_GRD (Npc_Default)
{

	//-------- primary data --------
	
	name 		=	"Stra¿nik";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	17;
	voice 		=	6;
	id 			=	20272;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70; 
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony",23,1,GRD_ARMOR_M);
        
    B_Scale (self);
    Mdl_SetModelFatness(self,0);
    	 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	//pousuwalem kusze bo zaczynal nas atakowac z kuszy
	EquipItem	(self,GRD_RW_01);
	
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItems	(self,ItMinugget,24);
	
	CreateInvItems	(self,ItMiJoint_1,1);
	
	CreateInvItems	(self,ItFo_Potion_Health_01,2);
	CreateInvItems	(self,ItFo_Potion_Health_02,1);

	//------------- ai -------------
	B_InitNPCAddins(self);	

	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	daily_routine	=	Rtn_start_20272;
};

FUNC VOID Rtn_start_20272 ()
{
	TA_Guard	(08,00,22,00,"FM_12");     
	TA_Guard	(22,00,08,00,"FM_12");     
};