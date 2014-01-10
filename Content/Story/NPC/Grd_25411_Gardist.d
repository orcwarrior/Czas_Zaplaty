instance GRD_25411_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Ort";
	npctype		= 	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	10;
	voice 		=	6;
	id 			=	25411;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 35;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 460;
	attribute[ATR_HITPOINTS] 	= 360;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Psionic",12,2,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);      
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_254;
	
	//------------- //MISSIONs------------------
	// //// //MISSION[0] = MIS_OC_AMBIENT_GetMyWeapon ;
};

FUNC VOID Rtn_start_25411 ()
{
	TA_GuardPalisade		(00,00,23,00,"OW_PATH_1_16_A");
	TA_GuardPalisade		(23,00,24,00,"OW_PATH_1_16_B");
};

FUNC VOID Rtn_OMFull_25411 ()
{
};

FUNC VOID Rtn_FMTaken_25411 ()
{
};

FUNC VOID Rtn_OrcAssault_25411 ()
{
};


