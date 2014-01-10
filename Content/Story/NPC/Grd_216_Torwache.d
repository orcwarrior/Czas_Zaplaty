instance GRD_216_Torwache (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Torwache;
	npctype		=	npctype_ambient;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	13;
	id 			=	216;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_Bald",3,2,GRD_ARMOR_M);
        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
			
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);     
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_216;
	
	//------------- //MISSIONs------------------
};

FUNC VOID Rtn_start_216 ()
{
	TA_Guard		(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_Guard		(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
};

FUNC VOID Rtn_FMTaken_216 ()
{
	TA_StayNeutral	(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_StayNeutral	(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
};

FUNC VOID Rtn_FMTaken2_216 ()
{
	TA_Guard		(06,00,14,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
	TA_Guard		(14,00,06,00,"OCR_NORTHGATE_RIGHT_GUARD");// in sp?teren Kapiteln,wenn SC nicht mehr durchdarf TA_GuardPassage
};

FUNC VOID Rtn_NC1_216 ()
{
    TA_HostileGuard		(06,00,21,00,"OW_PATH_3000");
    TA_HostileGuard		(21,00,06,00,"OW_PATH_3000");			
};
