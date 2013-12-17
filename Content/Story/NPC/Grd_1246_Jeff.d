instance Grd_1246_Jeff (Npc_Default)
{
	//-------- primary data --------
	
	name 		= 	"Jeff";
	npctype		= 	npctype_guard;
	guild 		=	GIL_GRD;
	level 		=	45;
	voice		=	7;
	id 			=	1246;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 80;
	attribute[ATR_DEXTERITY] 	= 80;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 560;
	attribute[ATR_HITPOINTS] 	= 560;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_bALD",3,1,GRD_ARMOR_L);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,1.6);
    	
    	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 
				
	
	Npc_SetTalentSkill (self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self,NPC_TALENT_CROSSBOW,2);		
			
	//-------- inventory --------
	
	EquipItem	(self,ItMw_1H_Sword_Long_04);
	CreateInvItems	(self,ItAmBolt,10);
	CreateInvItem	(self,ItFoMutton);
	CreateInvItems	(self,ItMiNugget,100);
	CreateInvItem	(self,ItFo_Potion_Health_03);
	CreateInvItem	(self,ItLsTorch);

	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_start_1246;
};

FUNC VOID Rtn_start_1246 ()
{
	TA_Sleep		(22,30,07,30,"OCR_HUT_49");
	TA_SitAround	(07,30,10,30,"OCR_OUTSIDE_HUT_49");
	TA_Stand	(10,30,12,30,"OCR_OUTSIDE_HUT_49");
	TA_SitAround	(12,30,23,30,"OCR_OUTSIDE_HUT_49");
	
};

FUNC VOID Rtn_CHASE_1246 ()
{
	TA_MIS_ChaseHero	(10,30,12,30,"OCR_WASH_8");
	TA_MIS_ChaseHero	(12,30,10,30,"OCR_WASH_8");
	
};
FUNC VOID Rtn_DEAD_1246 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};
