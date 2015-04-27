instance Grd_3101_Mathis (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Mathis";
	npctype		=	npctype_main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	6;
	id 			=	3101;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 85;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Fighter",8,2,GRD_ARMOR_H);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
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
	CreateInvItem	(self,ItFoCheese);
	CreateInvItem	(self,ItFoApple);
	CreateInvItems	(self,ItMiNugget,10);
	CreateInvItem	(self,ItLsTorch);
	
	//-------------Daily Routine-------------
	/*B_InitNPCAddins(self);*/		daily_routine = Rtn_Start_3101;
};

FUNC VOID Rtn_Start_3101 ()
{
	TA_Guard	(06,00,07,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(07,00,08,00,"OCR_LADDER_TOP_01");
	TA_Guard	(08,00,09,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");
	TA_Guard	(09,00,10,00,"OCR_BEHIND_HUT_17");
	
	TA_Guard	(10,00,06,00,"OCR_OUTSIDE_ARENA_BARONS_HUT");

};
FUNC VOID Rtn_CHASE_3101 ()
{
	TA_MIS_ChaseHero		(05,00,10,00,"OCR_TO_HUT_22");
	TA_MIS_ChaseHero (10,00,05,00,"OCR_TO_HUT_22");

};
FUNC VOID Rtn_DEAD_3101 ()
{
	TA_Stay		(05,00,10,00,"INVISIBLE2");
	TA_Stay 	(10,00,05,00,"INVISIBLE2");

};
