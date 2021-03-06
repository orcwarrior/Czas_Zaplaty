instance GRD_243_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	NAME_Gardist;
	npctype		= 	NpcType_Guard;
	guild 		=	GIL_GRD;
	level 		=	22;
	voice		=	6;
	id 			=	243;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 110;
	attribute[ATR_DEXTERITY] 	= 110;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,2,"Hum_Head_Bald",4,1,GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				

	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02U);
	EquipItem	(self,ItRw_Crossbow_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,20);
	CreateInvItem	(self,ItFo_Potion_Health_01);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_243;
	
	//-------------- //MISSIONs-----------------

};

FUNC VOID Rtn_start_243 ()//in OM
{
	TA_GuardPalisade	(06,00,21,00,"OCR_PALISADE_WALK_17"); 
	TA_GuardPalisade	(21,00,06,00,"OCR_PALISADE_WALK_17"); 
};


FUNC VOID Rtn_OMFull_243 ()//in Oberwelt
{
	TA_GuardPalisade	(08,00,22,00,"VIEW_PSI");
	TA_StandAround	(22,00,23,00,"OCC_MERCS_RIGHT_ROOM_FRONT");
	TA_SitAround	(23,00,24,00,"OCC_CENTER_2");
	TA_Sleep	(24,00,08,00,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");		
};
FUNC VOID Rtn_FMTaken_243 ()//in FM
{
	TA_GuardPatrol	(08,00,24,00,"FMC_FM_ENTRANCE");
	TA_Sleep	(24,00,08,00,"OCC_MERCS_UPPER_LEFT_ROOM_FRONT");		
};

FUNC VOID Rtn_OrcAssault_243 ()
{
};


