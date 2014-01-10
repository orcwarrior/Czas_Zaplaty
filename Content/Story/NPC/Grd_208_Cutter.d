instance GRD_208_Cutter (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Siekacz";
	npctype 	= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	20;
	voice 		=	8;
	id 			=	208;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 115;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 280;
	attribute[ATR_HITPOINTS] 	= 280;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0 ,0,"Hum_Head_Bald",3,1,GRD_ARMOR_H);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,1);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
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
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_208;
};

FUNC VOID Rtn_start_208 ()
{
	TA_Sleep		(23,35,08,35,"OCC_MERCS_UPPER_RIGHT_ROOM_BED6");
	TA_Smalltalk	(08,35,23,35,"OCC_MERCS_ENTRANCE");	
};

FUNC VOID Rtn_GateOC_208 ()
{
	TA_Smalltalk(08,35,19,00,"OCC_MERCS_ENTRANCE");	
	TA_Guard(19,00,08,35,"OC1");	
};

FUNC VOID Rtn_Follow_208 ()
{
	Ta_FollowPC(08,35,19,00,"TH_PATH_01");	
	Ta_FollowPC(19,00,08,35,"TH_PATH_01");	
};

FUNC VOID Rtn_StayKira_208 ()
{
	TA_SmallTalk(24,00,12,00,"TH_PATH_01");
	TA_SmallTalk(12,00,24,00,"TH_KIRA_01");	
};

FUNC VOID Rtn_OT_208 ()
{
	TA_Guard	(07,00,20,00,"OCC_MERCS_ENTRANCE");
	TA_Guard	(20,00,07,00,"OCC_MERCS_ENTRANCE");
};
