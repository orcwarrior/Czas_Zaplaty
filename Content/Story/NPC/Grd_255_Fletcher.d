instance GRD_255_Fletcher (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Fletcher";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	255;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 320;
	attribute[ATR_HITPOINTS] 	= 320;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Thief",1,2,GRD_ARMOR_M);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	Npc_SetAivar(self,AIV_IMPORTANT,  TRUE);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem	(self,GRD_MW_02);
	EquipItem	(self,ItRw_Crossbow_01);
	CreateInvItems	(self,ItAmBolt,30);
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_255;
};

FUNC VOID Rtn_Start_255 ()
{

	TA_Sleep	   (01,00,07,00,"NC_SMALL_CAVE_CENTER");
	TA_Smalltalk   (07,00,19,00,"NC_SMALL_CAVE_CENTER");
	TA_ReadBook	   (19,00,01,00,"NC_SMALL_CAVE_READBOOK");

};


FUNC VOID Rtn_GO_255 ()
{
	TA_BOSS			(07,00,20,00,"NC_PATH53");
	TA_BOSS			(20,00,07,00,"NC_PATH53");
};

FUNC VOID Rtn_DIE_255 ()
{
	TA_BOSS			(07,00,20,00,"FLETCHER_DIE");
	TA_BOSS			(20,00,07,00,"FLETCHER_DIE");
};

FUNC VOID Rtn_NC1_255 ()
{
	TA_BOSS			(07,00,20,00,"NC_EN_EARLHEADQUARTERS_01");
	TA_BOSS			(20,00,07,00,"NC_EN_EARLHEADQUARTERS_01");
};
