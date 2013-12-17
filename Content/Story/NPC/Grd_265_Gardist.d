instance GRD_265_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	npctype		= 	NPCTYPE_GUARD;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	7;
	id 			=	265;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 48;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 160;
	attribute[ATR_HITPOINTS] 	= 160;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_FatBald",19,1,GRD_ARMOR_L);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_RANGED;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);		
			
	//-------- inventory --------
	
	CreateInvItem	(self,ItMw_1H_Sword_01);
	CreateInvItem	(self,ItRw_Crossbow_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);		        
	CreateInvItems (self,ItLsTorch,2);
	CreateInvItems (self,ItFo_Potion_Health_01,1);
	CreateInvItem (self,ItFoMutton);
	CreateInvItem (self,ItFoLoaf);
	CreateInvItem (self,ItAt_Teeth_01);
	CreateInvItem (self,ItAt_Claws_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_265;
};

FUNC VOID Rtn_start_265 ()
{

	TA_Sleep		(23,01,06,30,"OCR_HUT_2");
	TA_WashSelf		(06,30,07,00,"OCR_LAKE_1");
	TA_StandAround	(07,00,10,00,"OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Smalltalk	(10,00,12,00,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Diego
	TA_Cook			(12,00,12,30,"OCR_AT_HUT_2");
	TA_Smalltalk	(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Stt_322
	TA_Cook			(15,30,18,05,"OCR_AT_HUT_2");
	TA_SitCampfire	(18,05,23,01,"OCR_CAMPFIRE_A_MOVEMENT2");		
};






